Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867C694E2D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 18:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ADA10E206;
	Mon, 13 Feb 2023 17:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A1610E205
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 17:37:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3390085wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AQzc8E9lLmj3P/pdICdQqVX9yqS3k3uHBt3dzWV644k=;
 b=h1pxJzhDDUXh6WJcwSjac433z8vHC4o/KLoSGn+3P0WjVOd6bVPa1Ngu7fbOlwDEyP
 fqD9ia6sd2W+RuyaJa0WfmkM5OC/xzEj/SjVIPJVz9OdFvcUbEbqvE91Z+jgq94cGtAl
 hRs/qDH85KcXY2y58KFvAp/u4N6fzR10AJCarUvzA5mCd9ugJYpeDabqhtu635cAjnd+
 r1HcGbl8Ub0+MCQ39DWiYSyruPSErGU+t/GXwSFQTidFlzRHW/miI0bsvPQU2XzDVzcR
 BFL296FQAwHO0QjzsmrY5Vwo0C2ZDHPJK0i7FJsO++8gJEl7nXNa51+pv0X8Uqm9idIj
 R9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQzc8E9lLmj3P/pdICdQqVX9yqS3k3uHBt3dzWV644k=;
 b=RmEsaHKoC750gtotCd2cF/OsmS3O6OhsuCm06s24CxrYXLP5MYPykXmBtWSJU5ntsY
 Rpdy22DM5NlcZkeY3MAXEx4OwY6Ck8Zzt5tHnZd45RjT0sYARSzz1Ccdb7dI15EuSBCm
 XSyLDRV4WBlJPQJcZ+Hc6Iv0YXwVdaak0zqP0X1j8TEdvtW18AaWsLR42whraoir1mPv
 DM6NdYWB0udMKVnWNFHC/gyFYs+00ILPy8zX72M8t8UlwCHA4yOHFy8xmEXMvuS8UXRP
 ShLKzsER6eCwy1vdTgPgDLBg8tcKJo0JU7B8LO3tKLmj2cETX2RolQtJuWo1c3i8B7AO
 a41g==
X-Gm-Message-State: AO0yUKWE+cS1dfpv72l3dyTxbKYRq6UPewjzIO+8WiieVq9LDc4jKse/
 hbkXKSQ7/eM/5k1d66gp70MmgA==
X-Google-Smtp-Source: AK7set/h1uo3+qTfmZkWCS6VCR9SH7bsW2G9syQzoAlKFMN6EfPEqHeUrZX3I6UUIQsF6CuB57yqYw==
X-Received: by 2002:a05:600c:4d92:b0:3df:dea7:8e3 with SMTP id
 v18-20020a05600c4d9200b003dfdea708e3mr21732089wmp.21.1676309819599; 
 Mon, 13 Feb 2023 09:36:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:915c:811a:b081:f099?
 ([2a01:e0a:982:cbb0:915c:811a:b081:f099])
 by smtp.gmail.com with ESMTPSA id
 v15-20020adfebcf000000b002c3f81c51b6sm11016204wrn.90.2023.02.13.09.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:36:59 -0800 (PST)
Message-ID: <e20d2b76-a446-019d-73db-6f16ba7cbfb5@linaro.org>
Date: Mon, 13 Feb 2023 18:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
 <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 12:16, Dmitry Baryshkov wrote:
> On 13/02/2023 12:41, Neil Armstrong wrote:
>> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>>> sm8550. Fix the DPU caps structure and used feature masks.
>>
>> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>>          qcom,sde-qseed-scalar-version = <0x3002>;
> 
> And then the techpack tells us starting from 0x3000 the v3lite is v4:
> 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59
> 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102

OK then:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>>
>> Neil
>>>
>>> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 192fff9238f9..c4e45c472685 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>   static const struct dpu_caps sm8550_dpu_caps = {
>>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>       .max_mixer_blendstages = 0xb,
>>> -    .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
>>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>>       .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>>       .ubwc_version = DPU_HW_UBWC_VER_40,
>>>       .has_src_split = true,
>>> @@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>   };
>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>>> -                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
>>> +                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
>>> -                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
>>> +                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>>> -                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
>>> +                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>>> -                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
>>> +                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>>
> 

