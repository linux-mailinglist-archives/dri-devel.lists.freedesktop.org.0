Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B707A91D8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF25510E564;
	Thu, 21 Sep 2023 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E822510E568
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:01:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-532addba879so1211272a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 00:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695279710; x=1695884510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXv2swyixrrXvv0zGvrj0+c4WbYkAz74mw7u1eEONl8=;
 b=m7MO/vNzO7+eTU+iOCsbIFp7QY0xRktgjJ/seYmeT9emZpPRU6hZo7EwyBl43pIqUk
 r7WE+cWcf1DSWOsg4JKskwS/ZrxSy1VRMOLOH6qc9bW6XbMvDKuiuwqY0nvngo4gBmcd
 RSkl5UPpAwqlb4zYZp2w4yEXufKAhFSOcU7ng51swv8BRV1uL9tU/90dKKm7QjQ58hkw
 k2Uh5TbTnIRCvLzoguzhx90lfqxEQL6QLgCLa6GNaQQ/FtlmrfQ/mS9XEbq7MTY68uX2
 gJSG6sVmMkHWQ5JIF872/0SLGwcD8urwUFMqkkc8hJffCyeV0zdIbmLfROb9O3u+sJLW
 YSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695279710; x=1695884510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXv2swyixrrXvv0zGvrj0+c4WbYkAz74mw7u1eEONl8=;
 b=QN9UrXaNgsRDmneRP+igNXMLA4FhnUYMhWXpeZRDIOKj+yokaBPr4NbX69UDGIDXq8
 53jBUA1oTb8JsJ1IN3lgYOvi4/2mPSot3RFWeqhvPTcit2bctDgg12XtWt1fC1Ce9zav
 NuaiI1Cs5+BetYh1fLx4vn0CWD4NSp5AgmzYMe8s7rX1SzFDUytm8NpKuueG9Om2QvYO
 P/jkRmHcFooU+8hrNOogVF2fn52m2HqtcAf5zNsy77SLhTZY/e4Rf0CPUX5arrhs8txB
 AE4h712C1lmRuIw0sWrNxV+VlXL+B/eLZwk+2h4b1rFEnlSV+WOAHuvfFdn+GSAFmaJ0
 CssA==
X-Gm-Message-State: AOJu0YzV3+CJl6fIhreodlvWgujJ2CFG4zDyJbQZE1jS2NYBthSKMoNH
 pQer221TlYLabqR4TVpBkxhnDQ==
X-Google-Smtp-Source: AGHT+IF33ZszVwsMibxsoJczJ31Md6SkIWFl+NgIPjyaeu55oxkozMwjQ2+h4m7DsUHVeCJrMeMh0Q==
X-Received: by 2002:a50:ec83:0:b0:531:1f3b:cb47 with SMTP id
 e3-20020a50ec83000000b005311f3bcb47mr7302479edr.0.1695279710178; 
 Thu, 21 Sep 2023 00:01:50 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 m26-20020a056402051a00b00532d2b5126bsm389571edv.94.2023.09.21.00.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 00:01:49 -0700 (PDT)
Message-ID: <8f24963f-a016-3095-29da-a2fcae5ec9eb@linaro.org>
Date: Thu, 21 Sep 2023 09:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] drm/msm/dpu: Fix SC7280 PP length
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
 <3b23270c-ec89-2177-8252-6ccaf58d37ac@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3b23270c-ec89-2177-8252-6ccaf58d37ac@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/21/23 01:41, Abhinav Kumar wrote:
> 
> 
> On 9/20/2023 3:46 PM, Konrad Dybcio wrote:
>> Commit 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
>> macros") unrolled a macro incorrectly. Fix that.
>>
> 
> No, its correct from what i can tell.
> 
> Before inlining it was using PP_BLK_DITHER macro and not PP_BLK.
> 
> PP_BLK_DITHER has a len of 0 and not 0xd4.
> 
> Hence I cannot see whats wrong here.
Right, I misread the thing..

Konrad
