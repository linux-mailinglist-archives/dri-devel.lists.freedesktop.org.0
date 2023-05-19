Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F393C70A313
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 01:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021F510E0F6;
	Fri, 19 May 2023 23:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFA510E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 23:02:15 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af28303127so10605571fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684537334; x=1687129334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
 b=gGyADSTH1f9hFvmwNsTvunzQiiX4kqpbHF77acbTHQXnoIpZzRg28Vnr4RV27t5tuX
 SA7s/YwbegcqvaLPJPv5UuRwDb19KhnDM4AGEQRyGGWudA7kaRJ2F8xWZv7+xOOPqZCt
 uXCzNgN6llVRpmLeqFk9+3eR515UjQcRloA9pI0AjhcSrVW7Nnit90sB+IW2gqQrOOUj
 98El4DQTSUrhJmdLfL1IY5ugLKTLe39qEIW9/mfCQYpbzI+zhcVmXoo6p/vly+YdB/4r
 WmgBIWj9pt3h3EFLB3iZi1I4+8a8q7z/tONYpwH6akiwCqkkB5SXKlY+R+I5f7cz8GQW
 yDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684537334; x=1687129334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ICfQVhv0p58QRGm6Ofs09fgKjfcNCD6otbrYwwYRjw=;
 b=MEyxpYeYIoan86WXTaskoAaN2rH3iZnmmoJlSIm0qqrJi6dvFk/CpSByalprJeo9uJ
 dNdRn3A68md/kpaiGqCXxxD+7ZDCq43YqvjHR17hkt/xkSQzwHHZBAidsgPZTZWmEMvT
 X44qdYhNMKDT+85SyehZdVh57GGfZbkXGcchoBFL0clH2TMyYgEiJkhzCG+X/dedbge1
 sWlxucpGNhzznRsoqJOeWLjAN3GWGyOsPT2Zwh0exUh4WjOsliQkTJQYvnUgM9mM30Rs
 n3zaxskHM/OiAnFpzeQBvMBfWgbPIxriPHB6riykYK5blFKVQQgomqsJ+yvFP5bVslgp
 K0IQ==
X-Gm-Message-State: AC+VfDydOlE58R8+obh1JIDXuwk28FIU6VTQrQyCR9FZR8UWJAmraWkZ
 1wtD2AjcJ8t0Ieb8hSB/MTXvrQ==
X-Google-Smtp-Source: ACHHUZ7UMqHk5rENqq9JMQbX9ZqRDgPSQuGZy96/uT1vIZP+8fQjGpkcjjF1D/yArdvq6XYMW8UwDw==
X-Received: by 2002:a2e:9117:0:b0:2ad:af50:6ecb with SMTP id
 m23-20020a2e9117000000b002adaf506ecbmr1397207ljg.14.1684537333678; 
 Fri, 19 May 2023 16:02:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a2e2401000000b002a8c2a4fe99sm34178ljk.28.2023.05.19.16.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 16:02:00 -0700 (PDT)
Message-ID: <d97a5b51-f71e-28d6-47ee-a49d11a6aa2d@linaro.org>
Date: Sat, 20 May 2023 01:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: Set DPU_DATA_HCTL_EN for in
 INTF_SC7180_MASK
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230508-topic-hctl_en-v2-1-e7bea9f1f5dd@linaro.org>
 <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <56ac76e8-e5ac-3712-1e07-ad6c5b96c77c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20.05.2023 00:00, Abhinav Kumar wrote:
> 
> 
> On 5/19/2023 11:49 AM, Konrad Dybcio wrote:
>> DPU5 and newer targets enable this unconditionally. Move it from the
>> SC7280 mask to the SC7180 one.
>>
> 
> You mean DPU 5.0.0 right?
Yep!

> 
>> Fixes: 7e6ee55320f0 ("drm/msm/disp/dpu1: enable DATA_HCTL_EN for sc7280 target")
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
> 
> I have cross-checked all the chipsets affected by this and confirmed DATA_HCTL is present and those 3 registers programmed with that feature bit are valid, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Thanks!

Konrad
> 
