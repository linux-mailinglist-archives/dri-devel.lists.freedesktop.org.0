Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0586F4DF5
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EECF10E159;
	Tue,  2 May 2023 23:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1A10E139
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 23:59:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4efe8b3f3f7so5134083e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 16:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683071939; x=1685663939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n6Nm1mbo6FhgRiBVP5uaXGfyIE0BDikVhGfcFGWbfYM=;
 b=p9j2YuyakukgtWlHuMJKsC2ZUZTY3LSZf0s3I0V3bObJa2QEnH940PPmkKc0jsKfUv
 RN9mvqQs4xNdVDmTrYV3pO9gPeEnSneRBCm/Kx8JSpdB1hsihbumObyLIf6egHA1lds6
 aHweFY03ISub2UMy61DaKCSbiVNaCN4aOG7fr9Q7V9KGuJf72mXD9xd+2AMfEfOsjJvY
 tKxbvVImHdvyaeJstGfQgJPAWW+i4MIYm2EpQkhEdAoHCcAaJRyCwOmiRJJwlr1QV82R
 J3fK3dROWoIVXeIKVgb/Pp1/KbKA8dx0nw2h685oM7lszquYnUUneHNNZrbM/6qpDUVM
 WcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683071939; x=1685663939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6Nm1mbo6FhgRiBVP5uaXGfyIE0BDikVhGfcFGWbfYM=;
 b=bg+WYa+gjMqaB0Zt4wVC+wcZNg87+Or3+9jF039xjLvwfGyrowtJO9a9SxuGG1BuzX
 jvXqr/qSZ/KYBfR34t8K5/y3J+RbOAzhB5IdhhvCCPRThst0KIqqSUKjFXuvZYqpBiJ+
 0l7wL2Tk23M+mabfz9gToc5AQLRX7nWS6WyShy3xymkIEuIX5zHhsnpptgtRpjmtQRN4
 MOtPBvDj0c5xh2gBTwc5i4gRBlLAYDZey/6GGLOz3hnIwNSuVGeAysCdtCRs0KNVXz+f
 0NhfIFhIs2fqs1p8ipaIFmvTEwCZpIHFqP4oqw/Lh+7yJxkSEikr/ttNh/eu6LUVbKpX
 m5UA==
X-Gm-Message-State: AC+VfDy6GzcXq6a1mQzWshQKgg5Oy/6r5FLX8ypSqpZ54UMCVHDRIvbC
 zMoqH6pfeCtOlvgMcS9FGMTApA==
X-Google-Smtp-Source: ACHHUZ7rY7GDBKZZOm/v8tHEjWiPTvSl+wLJRLDgakYH05FXlsDAcaovAy4ZGt3GBuG8Kpc22Jsy0A==
X-Received: by 2002:ac2:4a75:0:b0:4ef:eeaa:e9b9 with SMTP id
 q21-20020ac24a75000000b004efeeaae9b9mr391585lfp.35.1683071939198; 
 Tue, 02 May 2023 16:58:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a19ee0a000000b004efee5841b9sm4618968lfb.290.2023.05.02.16.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 16:58:58 -0700 (PDT)
Message-ID: <72e531fe-1ee5-a850-4887-11e1835983f9@linaro.org>
Date: Wed, 3 May 2023 02:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/7] drm/msm/dpu: call dpu_rm_get_intf() from
 dpu_encoder_get_intf()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-7-dmitry.baryshkov@linaro.org>
 <d4558099-541e-cc55-860a-fe21af3a8ca6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d4558099-541e-cc55-860a-fe21af3a8ca6@quicinc.com>
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

On 03/05/2023 02:57, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> There is little sense to get intf index just to call dpu_rm_get_intf()
>> on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 507ff3f88c67..b35e92c658ad 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1259,22 +1259,23 @@ static void 
>> dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>>       mutex_unlock(&dpu_enc->enc_lock);
>>   }
>> -static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg 
>> *catalog,
>> +static struct dpu_hw_intf *dpu_encoder_get_intf(const struct 
>> dpu_mdss_cfg *catalog,
>> +        struct dpu_rm *dpu_rm,
>>           enum dpu_intf_type type, u32 controller_id)
>>   {
>>       int i = 0;
>>       if (type == INTF_WB)
>> -        return INTF_MAX;
>> +        return NULL;
>>       for (i = 0; i < catalog->intf_count; i++) {
>>           if (catalog->intf[i].type == type
>>               && catalog->intf[i].controller_id == controller_id) {
>> -            return catalog->intf[i].id;
>> +            return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>>           }
> 
> Why has the for loop been retained in this function but not for 
> writeback? is there any difference? Doesnt looks like there needs to be.

For writeback we always return controller_id (WB_2). For interfaces we 
have to map type+controller_id to the INTF instance.

> 
>>       }
>> -    return INTF_MAX;
>> +    return NULL;
>>   }
>>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>> @@ -2244,7 +2245,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>            * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
>>            */
>>           u32 controller_id = disp_info->h_tile_instance[i];
>> -        enum dpu_intf intf_idx;
>>           if (disp_info->num_of_h_tiles > 1) {
>>               if (i == 0)
>> @@ -2258,12 +2258,9 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>           DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>                   i, controller_id, phys_params.split_role);
>> -        intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>> -                                disp_info->intf_type,
>> -                                controller_id);
>> -
>> -        if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>> -            phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> intf_idx);
>> +        phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, 
>> &dpu_kms->rm,
>> +                               disp_info->intf_type,
>> +                               controller_id);
>>           if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>>               phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, 
>> controller_id);
>> @@ -2287,7 +2284,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>               DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>>               break;
>>           }
>> -
> unnecessary change?


ack, it sneaked in. I'll drop it for v2.

>>       }
>>       mutex_unlock(&dpu_enc->enc_lock);

-- 
With best wishes
Dmitry

