Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BC6D715C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B302A10E7FC;
	Wed,  5 Apr 2023 00:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B981810E7FC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 00:35:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y7so3287921ljp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 17:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680654936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
 b=tDcur6hQq8gbQ2tTKuacPs8wWNMtuXhdNZjaQTX1lVlbhqvqOz1O0YmX5CSm12D5J2
 uGNcLX6WiO7HphJ2GeytYeGNQsiuYN38F/TgprkDBrBFO0nJDwyOnLo4Ow6l959Cgxuc
 w/Ds8DXxnPVkSzXyZGkgFX0rjRcE85hUbp5rI95CS7/59BqIS+3dhH67slzWVHW3QInh
 mNUwfcMXEl6uPBXQaZ+qtYoT3ZJgMKcmjfEti/32xOTes9U1fyVnAHm8qvT6seUset9n
 CnfTv9rGwJZCe11wgro+QQIPNRLEhHDoWGLytN+1bK6P6s7jNwx5ybxrVtte6V+FpEox
 +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680654936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+FyiraeumRvn9lWhsqVqlc5idZJ3mN1HddRn347ZxeU=;
 b=xT8kVijSjQq39bDfqLJARwEKLXVqiBbuxF6FFVOJYiHd6oKXORrouMf6IiyDDS075T
 tno+3nov6etggCwVJFdrQrOX/8N6/yRtVl7ULjfX887nmServqoeIVTlAd4hHFwU7dMj
 yI4sCLwKegJG0gfdwpG539fg+4f0Rzy/5so99BxSev32tH8gB1Kb4FUan8LGoEiP7xTr
 LW4Ygl1N8H4wF8y2kdW844T7i/GL38O01xrV44+zKtJExOkJEKDDY4cCitujFmJQw628
 rPQK2p40pqCSEjaJmbbIq1H56VzQQs4zFz3Cgp7RDjvddtWeIs0FA7UoW88ccz8iIINX
 TaEg==
X-Gm-Message-State: AAQBX9eTK8rOeGGdSaR3jRHoM+zAR0Ad20kvsOkQQolzXyfJrO+5KrTo
 XDh6kOaRIVFoCtshHq/l9fO/Bw==
X-Google-Smtp-Source: AKy350YLeRc6KY2le+IjjR/XGprQsv1A2gpFyYvLi1D+1ckPJ2xme/FjlbB7ZbchrqG8F5b2V8vJOQ==
X-Received: by 2002:a2e:8ec2:0:b0:2a4:4ce4:1f52 with SMTP id
 e2-20020a2e8ec2000000b002a44ce41f52mr1405441ljl.34.1680654936570; 
 Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a2e86d4000000b00295a8c68585sm2608774ljj.56.2023.04.04.17.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 17:35:36 -0700 (PDT)
Message-ID: <4fa6cbad-4daa-e030-9d41-4f9caa2d8a28@linaro.org>
Date: Wed, 5 Apr 2023 03:35:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/42] drm/msm/dpu: Allow variable SSPP_BLK size
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-3-dmitry.baryshkov@linaro.org>
 <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <72915d9e-dbba-7391-28d8-cbbca479da76@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 01:19, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths, split the INTF changes away]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Everything is fine except sm8450. As I already wrote in the previous 
> version's review, it should be 0x32c for sm8450.
> 

Ack, please excuse me for missing you comment. I'll fix this in v5.

-- 
With best wishes
Dmitry

