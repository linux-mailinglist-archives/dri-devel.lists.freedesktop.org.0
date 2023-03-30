Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B646D064A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 15:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2708710E552;
	Thu, 30 Mar 2023 13:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2154710E552
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 13:16:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c29so24493139lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182207;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQjF+LYuSjeYBz3AF8OrVvOgcRvBINVkGyiCv4LTzaM=;
 b=bOJs/cK0brzz0/p65kSUl/gw416aNoLyIg0GZew3xRZt5S3HtAd/Rq9ioZGB3VKKOS
 FGjkrzEcEGnBqWKFayC11khe1tC2BUJlk1ENU+wf6XM2YTAQxdnuIxyMIbMLhSWinTmS
 +wy1I1vYpQeoHWHpArzsjWEpSE7Gb9XzocoB9JDORS4tf2YD488+0/wGGQ5OcSXMHtPr
 EJ9iKw9xpeOzl5Ifrz54CbRk8EX5zchGwty+W3octULTBGZzkq0Hf/HsVdkrsRn5uC73
 2gZha1SVrLX+Pk+BOGQG4w/HrPJz94v2IL13BRzA86hhDus1yhxpfXiOq0drIXp4KQFI
 pxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182207;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQjF+LYuSjeYBz3AF8OrVvOgcRvBINVkGyiCv4LTzaM=;
 b=PiSfvN1G0xQgsYkTHrpmtCG9YJWmvuzrGgKwSDHLau6FYAmgLfFGxPkL9H058dOP3K
 BNboe5IGtNQ15uOummuWY66P4z2uW+IuYBMIl2VhnxPIabP0YaalSuZYrOpThIQbPnlB
 Ko0tVtJ95wDfw9aClKMHyWqMeWpNH8ippzl3BX9URuihSG/qkQrbtdt0TsFcUuCk+x/8
 gi/Dd2sKgBuSdy3wjQtt20iRlpSpLvEA2xeTuBknYax8MkQYjsMIiy+BRYu7lpq38MKq
 JhkLtfjUBbBqBRmzvxS3MDmUx5e73lx2QFzDEohIa4BvafoPAOZ50IYmT8oEi+vWBYXy
 qCmA==
X-Gm-Message-State: AAQBX9djYrX6f7eZuVshFimAH+MUE7G3/i/ufw9hN7mGxH59KydngLz7
 bh+CsRs/haVDB1YSG8LEp/BBPg==
X-Google-Smtp-Source: AKy350ZCyQ+u19pjeIzGLsjR6WMN9zBl68X7p0xhP+adv3xYkFqU8JRNh272EONKA1Nlw6SYlcJcfg==
X-Received: by 2002:ac2:5458:0:b0:4ea:fabb:4db1 with SMTP id
 d24-20020ac25458000000b004eafabb4db1mr6721961lfn.1.1680182207108; 
 Thu, 30 Mar 2023 06:16:47 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 h5-20020ac25d65000000b004e8c6e9a6ccsm5871220lft.148.2023.03.30.06.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 06:16:46 -0700 (PDT)
Message-ID: <a699774e-d403-46e8-921e-6a4a048cab79@linaro.org>
Date: Thu, 30 Mar 2023 15:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2, 47/50] drm/msm/dpu: rename CTL_foo_MASK to contain major DPU
 version
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-48-dmitry.baryshkov@linaro.org>
 <045895cf-7866-1c0c-51c3-34ea3a7f0cab@linaro.org>
In-Reply-To: <045895cf-7866-1c0c-51c3-34ea3a7f0cab@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.03.2023 15:15, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> To ease review and reuse rename CTL feature masks to contain base DPU
>> version since which this mask is used.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 10 +++++-----
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 10 +++++-----
>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h    | 12 ++++++------
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  6 +++---
>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h    |  2 +-
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
>>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h    | 12 ++++++------
>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 12 ++++++++----
>>  11 files changed, 56 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 5e8200d929e4..d42c380275bd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -49,31 +49,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0x94,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
> Again, I'd vote for DPU_3
Though thinking about it again, the 8996-and-earlier setup was
probably the same and that's what you had in mind. Please confirm

Konrad
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x1200, .len = 0x94,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x1400, .len = 0x94,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x1600, .len = 0x94,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x1800, .len = 0x94,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index daef5e48e7ee..281556416322 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -47,31 +47,31 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0xe4,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x1200, .len = 0xe4,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x1400, .len = 0xe4,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x1600, .len = 0xe4,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x1800, .len = 0xe4,
>> -	.features = 0,
>> +	.features = CTL_DPU_0_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>> index 294702531ce2..7c051c142e06 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>> @@ -42,37 +42,37 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x1200, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x1400, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x1600, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x1800, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  	{
>>  	.name = "ctl_5", .id = CTL_5,
>>  	.base = 0x1a00, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index fd5df2bdec0e..cffbb6bcc535 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x1200, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x1400, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x1600, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x1800, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  	{
>>  	.name = "ctl_5", .id = CTL_5,
>>  	.base = 0x1a00, .len = 0x1e0,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> index 66762a0706de..78f8b2506675 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>> @@ -40,19 +40,19 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0x1dc,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x1200, .len = 0x1dc,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x1400, .len = 0x1dc,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>> index 2849c017ddf2..4f42105d3755 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>> @@ -21,7 +21,7 @@ static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x1000, .len = 0x1dc,
>> -	.features = BIT(DPU_CTL_ACTIVE_CFG),
>> +	.features = CTL_DPU_5_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 60ad844cfa25..6826758fa202 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x15000, .len = 0x1e8,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x16000, .len = 0x1e8,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x17000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x18000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x19000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  	{
>>  	.name = "ctl_5", .id = CTL_5,
>>  	.base = 0x1a000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 387f2b6c5b56..c5981ea3ec7c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -39,25 +39,25 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x15000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x16000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x17000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x18000, .len = 0x1e8,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>> index 80a7b0670467..5c87e919ea22 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>> @@ -41,37 +41,37 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x15000, .len = 0x204,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x16000, .len = 0x204,
>> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x17000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x18000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x19000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  	{
>>  	.name = "ctl_5", .id = CTL_5,
>>  	.base = 0x1a000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = CTL_DPU_7_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 53db0049eecc..334946c8d4e8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>>  	{
>>  	.name = "ctl_0", .id = CTL_0,
>>  	.base = 0x15000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>  	},
>>  	{
>>  	.name = "ctl_1", .id = CTL_1,
>>  	.base = 0x16000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>> +	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>  	},
>>  	{
>>  	.name = "ctl_2", .id = CTL_2,
>>  	.base = 0x17000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK,
>> +	.features = CTL_DPU_9_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>  	},
>>  	{
>>  	.name = "ctl_3", .id = CTL_3,
>>  	.base = 0x18000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK,
>> +	.features = CTL_DPU_9_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>  	},
>>  	{
>>  	.name = "ctl_4", .id = CTL_4,
>>  	.base = 0x19000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK,
>> +	.features = CTL_DPU_9_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>  	},
>>  	{
>>  	.name = "ctl_5", .id = CTL_5,
>>  	.base = 0x1a000, .len = 0x290,
>> -	.features = CTL_SM8550_MASK,
>> +	.features = CTL_DPU_9_MASK,
>>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>  	},
>>  };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6b78554df30c..3c604f7b88aa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -65,11 +65,15 @@
>>  #define PINGPONG_SDM845_SPLIT_MASK \
>>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>  
>> -#define CTL_SC7280_MASK \
>> -	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>> +#define CTL_DPU_0_MASK  (0)
>>  
>> -#define CTL_SM8550_MASK \
>> -	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | BIT(DPU_CTL_ACTIVE_CFG))
>> +
>> +#define CTL_DPU_7_MASK \
>> +	(CTL_DPU_5_MASK | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
>> +
>> +#define CTL_DPU_9_MASK \
>> +	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>>  
>>  #define MERGE_3D_SM8150_MASK (0)
>>  
