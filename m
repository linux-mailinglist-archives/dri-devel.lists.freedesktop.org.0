Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D196EEB41
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 02:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6F10E848;
	Wed, 26 Apr 2023 00:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A97B10E844
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 00:08:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94ef0a8546fso1023306866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 17:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682467721; x=1685059721;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LPR+q6g38dGmbNfZ32qJapmOFd8L1KllEupz8iuyCz8=;
 b=n9MAfjPm+NlXxRImkD0FPU3nCmq80LZsQ7RdHuSeDMB3LJeNBN8zDGCehwoPBaB+I0
 a/HYkc0/QnrTW5n7gX3dGIJ5DC18fzLO6xC+/NytL5b8GTfxjXoUROk36DnrlrsHGQKm
 +vCjwnZLbgpVB1PNm97fEaoz9EieK0H9VaaS9Ph5mtk/iOMvzQl0EaitocQQxCSgrfdK
 D4MelliibCKPIqFnaD2omwEtV3YmV0ZUMXZqKaJ9B06qCHx8ehfffFB8n/1HyX9A6Vjc
 PLoy+avLZYq3rNvfzkpYAU4G+MwjX/GB8MFgl18BuEyN/DIrxVCVaoWBh+tudBNL8erZ
 CYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682467721; x=1685059721;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LPR+q6g38dGmbNfZ32qJapmOFd8L1KllEupz8iuyCz8=;
 b=diirUuiq99kT91WbGJKHCac6CX3IkMNf0KnG+qRkjcFGnxHShx9b+lAcgFF5WCDNal
 fYNr0Be38DLcC6qVnBPJjfY4yy8by2I1UZXANtHNCyKgHJPCdYz/nC0OToBKY3Njbue9
 +iNFMiF4ol0mFZgb6JPK0RPMXvH+vaO5dnATsr9QezPk5mqFV7BLKQSh95m0QTEtY+Y0
 1gb7ARB8OaDEWCvJhQb1Cnwl+r2n/TzX2UcQ+cQ3p6UPYaoGa0BFFr63G4vBVY/o3GS9
 BeMgUfhHpvkTTLo1GwtQ7eXai9QBjbghokUl7NO5hi7maqOMA05/iMago06jFrQRrsiW
 vs3A==
X-Gm-Message-State: AAQBX9fZe92LNhrzC+qUbBzFgqqnSXJRCut6Tp5/InCYDJhrhdQt6NVK
 K6jIcCPyidaKeKCFVktKpCPtNg==
X-Google-Smtp-Source: AKy350bRngEkYfvK8VgQSGBOWaHv2gLyNv9uL4gNGFXXuhnGyalN8X9bOppytCgEuVZsuFOe+jKRgQ==
X-Received: by 2002:a17:906:9248:b0:94e:43ce:95f6 with SMTP id
 c8-20020a170906924800b0094e43ce95f6mr16045591ejx.47.1682467720969; 
 Tue, 25 Apr 2023 17:08:40 -0700 (PDT)
Received: from [172.23.2.4] ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906230d00b0094f2f1c5ea1sm7532252eja.174.2023.04.25.17.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 17:08:40 -0700 (PDT)
Message-ID: <6cfe4f5c-ae3c-0a1d-72b8-857908e8d8cc@linaro.org>
Date: Wed, 26 Apr 2023 03:08:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 18/21] drm/msm/dpu: Add TEAR-READ-pointer interrupt to
 INTF block
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-18-693b17fe6500@somainline.org>
 <70063be2-eb29-5d8e-2246-a80e744da7b8@linaro.org>
In-Reply-To: <70063be2-eb29-5d8e-2246-a80e744da7b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2023 03:06, Dmitry Baryshkov wrote:
> On 26/04/2023 02:06, Marijn Suijten wrote:
>> All SoCs since DPU 5.0.0 have the tear interrupt registers moved out of
>> the PINGPONG block and into the INTF block.  The new interrupts are
>> described in dpu_hw_interrupts.c, now wire them up in individual SoC
>> catalog files by setting the intr_tear_rd_ptr to the IRQ index spcified
>> in the offset table and enabling this set of DPU interrupts via the
>> mdss_irqs bitmask.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 +++++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  8 +++++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  8 +++++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 ++++--
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 
>> ++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 15 
>> +++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  6 ++++--
>>   13 files changed, 94 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> index e0f62f84b3cf5..e8d25a45d6b30 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> @@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, 
>> INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, 
>> INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -236,7 +238,9 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>>                BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>                BIT(MDP_INTF2_INTR) | \
>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>                BIT(MDP_INTF3_INTR) | \
>>                BIT(MDP_AD4_0_INTR) | \
>>                BIT(MDP_AD4_1_INTR),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index fbcfbbd74875e..62857288ad919 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2bc, INTF_DSI, 1, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>>       /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index 
>> until this is supported */
>>       INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 999, 24, 
>> INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>> @@ -218,7 +220,9 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>>                BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>                BIT(MDP_INTF2_INTR) | \
>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>                BIT(MDP_INTF3_INTR) | \
>>                BIT(MDP_INTF4_INTR) | \
>>                BIT(MDP_INTF5_INTR) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index b63d244224f0b..f77329ab397d0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -166,12 +166,14 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 0, 24, 
>> INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x6b000, 0x2c0, INTF_DSI, 1, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x6b800, 0x280, INTF_DP, 1, 24, 
>> INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -244,7 +246,9 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>>                BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>                BIT(MDP_INTF2_INTR) | \
>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>                BIT(MDP_INTF3_INTR) | \
>>                BIT(MDP_INTF4_INTR),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> index 9994b3aa1bb0f..279e14d9fabcd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> @@ -88,9 +88,10 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>>   };
>>   static const struct dpu_wb_cfg sc7180_wb[] = {
>> @@ -154,7 +155,8 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>> -             BIT(MDP_INTF1_INTR),
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR),
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> index 88a0d6119ad50..5509ceb5d55bd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>> @@ -67,9 +67,10 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
>>   static const struct dpu_intf_cfg sm6115_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 
>> 0, 0),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>>   };
>>   static const struct dpu_perf_cfg sm6115_perf_data = {
>> @@ -124,7 +125,8 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
>>       .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> -             BIT(MDP_INTF1_INTR),
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR),
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> index cd6f4048f286b..22b8a173d2142 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>> @@ -64,9 +64,10 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>>   static const struct dpu_intf_cfg qcm2290_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 
>> 0, 0),
>> -    INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 
>> 24, INTF_SC7180_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2)),
>>   };
>>   static const struct dpu_perf_cfg qcm2290_perf_data = {
>> @@ -114,7 +115,8 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
>>       .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> -             BIT(MDP_INTF1_INTR),
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR),
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 95f4caf230e7c..8a44d51111980 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -157,12 +157,14 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -227,7 +229,9 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_7xxx_INTR) | \
>>                BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF3_7xxx_INTR),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 56bd2ec8ca54c..91f056fb12476 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -97,9 +97,10 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>>       INTF_BLK("intf_5", INTF_5, 0x39000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23)),
>> @@ -158,6 +159,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_7xxx_INTR) | \
>>                BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF5_7xxx_INTR),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index 456f3abb486e2..937ef70d16c65 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -146,12 +146,14 @@ static const struct dpu_intf_cfg sc8280xp_intf[] 
>> = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_NONE, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -228,7 +230,9 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_7xxx_INTR) | \
>>                BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF3_7xxx_INTR) | \
>>                BIT(MDP_INTF4_7xxx_INTR) | \
>>                BIT(MDP_INTF5_7xxx_INTR) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 6c94fb8f2d4c4..70fcc4cd61582 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -165,12 +165,14 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -235,7 +237,9 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_7xxx_INTR) | \
>>                BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF3_7xxx_INTR),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 55c72419964d1..dcec15dd630fc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -170,12 +170,14 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25)),
>>       /* TODO TE sub-blocks for intf1 & intf2 */
> 
> The TODO can be dropped
> 
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK,
>> +    INTF_BLK_DSI_TE("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27)),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK,
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
>> +            DPU_IRQ_IDX(MDP_INTF1_7xxx_TEAR_INTR, 2)),
>> +    INTF_BLK_DSI_TE("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 
>> 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29)),
>> +            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
>> +            DPU_IRQ_IDX(MDP_INTF2_7xxx_TEAR_INTR, 2)),
>>       INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31)),
>> @@ -240,7 +242,9 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_7xxx_INTR) | \
>>                BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
>>                BIT(MDP_INTF3_7xxx_INTR),
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index d3eda7192908e..db558a9ae36ec 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -553,6 +553,21 @@ static const struct dpu_pingpong_sub_blks 
>> sc7280_pp_sblk = {
>>       .prog_fetch_lines_worst_case = _progfetch, \
>>       .intr_underrun = _underrun, \
>>       .intr_vsync = _vsync, \
>> +    .intr_tear_rd_ptr = -1, \
>> +    }
>> +
>> +/* DSI Interface sub-block with TEAR registers (since DPU 5.0.0) */
>> +#define INTF_BLK_DSI_TE(_name, _id, _base, _len, _type, _ctrl_id, 
>> _progfetch, _features, _underrun, _vsync, _tear_rd_ptr) \
>> +    {\
>> +    .name = _name, .id = _id, \
>> +    .base = _base, .len = _len, \
>> +    .features = _features, \
>> +    .type = _type, \
>> +    .controller_id = _ctrl_id, \
>> +    .prog_fetch_lines_worst_case = _progfetch, \
>> +    .intr_underrun = _underrun, \
>> +    .intr_vsync = _vsync, \
>> +    .intr_tear_rd_ptr = _tear_rd_ptr, \
>>       }
>>   /*************************************************************
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 599e177b89dd2..756bff1d2185d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -629,8 +629,9 @@ struct dpu_dsc_cfg {
>>    * @type:              Interface type(DSI, DP, HDMI)
>>    * @controller_id:     Controller Instance ID in case of multiple of 
>> intf type
>>    * @prog_fetch_lines_worst_case    Worst case latency num lines 
>> needed to prefetch
>> - * @intr_underrun:    index for INTF underrun interrupt
>> - * @intr_vsync:            index for INTF VSYNC interrupt

Again, reindent with the functional changes.


Other than the two mentioned nits:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>> + * @intr_underrun:     index for INTF underrun interrupt
>> + * @intr_vsync:        index for INTF VSYNC interrupt
>> + * @intr_tear_rd_ptr:  index for INTF TEAR_RD_PTR interrupt
>>    */
>>   struct dpu_intf_cfg  {
>>       DPU_HW_BLK_INFO;
>> @@ -639,6 +640,7 @@ struct dpu_intf_cfg  {
>>       u32 prog_fetch_lines_worst_case;
>>       s32 intr_underrun;
>>       s32 intr_vsync;
>> +    s32 intr_tear_rd_ptr;
>>   };
>>   /**
>>
> 

-- 
With best wishes
Dmitry

