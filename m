Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF411694439
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD3B10E545;
	Mon, 13 Feb 2023 11:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BC910E201
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:16:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so4625231edd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q7A26sO0xGpNLzeAveinKNkY3Vpi/fdx5xHjcTV8hfQ=;
 b=YpjFV0Al7oU+glXvLgbqgr6SasfzsBF4c5PcWuyF8EmbVyV+0yenwiSTxR+cnrb5MJ
 C4R8moHriZqmNEdQKdt9YrI/8S/BPTVD9PWhC74CWmx7CECVUO1C/3SCUFpgZFFhzaxY
 0u+JnaetAxl6wFazZfdbfHHftrUyAewfPx7Z/l9QeDTEM+8YTs3TQS/HlMC+aMoaOFim
 RgL5pLhMzZpyrcFvthzVbB8/F9kalrrkT7AA1oBSLZtB8TvNNAwjzd2Oo6hrJnnbg95U
 J3s5gUNpChrtJb5/zb7/mb+TUeWFoBlj5cwpeR5CBqaJygO/pe0MZAMHwqRYjoiYdx1w
 7lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7A26sO0xGpNLzeAveinKNkY3Vpi/fdx5xHjcTV8hfQ=;
 b=jq//hQLrShjVBk32xW21cGNC1swUaOGW4NXg42dONHKpGLBTWM7et/cWFeBYiHrLc9
 Z9vDS10gPx8WqdzplY2hbXI+LaOy6IFI/ycuVYfDa4K+GCqrX4NOCqOW/5X+Dd50nyME
 sMnZeRGvZvqBR+CIJxXTOXZIfSG2yNeXRqQyCdRIH8RPivyeDQiYATyzHl5qxVyx7yit
 /dYpT5dJotZ7MVVtKruI5tqsunkdw+ioIurGmD9QNcEO3BV3+EdttPdU3wFgH0tpO++5
 uGiOVswwqRtJjv+yY2YO+uBTTDuxwG/BCIKKJP7ORB2kp8dMR/ilQzRZeyIolGB7RFwr
 YnzQ==
X-Gm-Message-State: AO0yUKXBfTICi1Q7N16SPwaSTqnUmkr7BulnmkCHV9V9mfAl4KDq379b
 6SeuF2AvbXuLx3FQeS/WvoRcxw==
X-Google-Smtp-Source: AK7set/ht0pRUb0jRWFBbCOesBUEKi4AxPOnYyfE5KguXWwvTFMA/LTuclg+iCGA2mdfpa2bf5lSjQ==
X-Received: by 2002:a50:bae1:0:b0:499:d1ca:6d83 with SMTP id
 x88-20020a50bae1000000b00499d1ca6d83mr24852735ede.2.1676286995792; 
 Mon, 13 Feb 2023 03:16:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b00499703df898sm6300353edr.69.2023.02.13.03.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:16:35 -0800 (PST)
Message-ID: <a589d45e-f084-9371-05dc-0676f12458a3@linaro.org>
Date: Mon, 13 Feb 2023 13:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
Content-Language: en-GB
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
 <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5bc2221f-61ba-3801-6dbb-83587d986b50@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 12:41, Neil Armstrong wrote:
> On 12/02/2023 00:12, Dmitry Baryshkov wrote:
>> QSEED4 is a newer variant of QSEED3LITE, which should be used on
>> sm8550. Fix the DPU caps structure and used feature masks.
> 
> I found nowhere SM8550 uses Qseed4, on downstream DT, it's written:
>          qcom,sde-qseed-sw-lib-rev = "qseedv3lite";
>          qcom,sde-qseed-scalar-version = <0x3002>;

And then the techpack tells us starting from 0x3000 the v3lite is v4:

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L59

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.10.r8-rel/msm/sde/sde_hw_util.c#L102

> 
> Neil
>>
>> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 192fff9238f9..c4e45c472685 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>   static const struct dpu_caps sm8550_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0xb,
>> -    .qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>       .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>>       .ubwc_version = DPU_HW_UBWC_VER_40,
>>       .has_src_split = true,
>> @@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg sm8450_sspp[] 
>> = {
>>   };
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>> -                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
>> +                _VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
>> -                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
>> +                _VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>> -                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
>> +                _VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>> -                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
>> +                _VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = 
>> _DMA_SBLK("12", 5);
>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = 
>> _DMA_SBLK("13", 6);
> 

-- 
With best wishes
Dmitry

