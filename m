Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D46F3954
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 22:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4610E129;
	Mon,  1 May 2023 20:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9EE10E275
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 20:45:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so24532601e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 13:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682973907; x=1685565907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RS3KpCTStzCWlsTlw18MVyxgrwma2gcQ0Zuiv6pikps=;
 b=hnH5TRcsWp8Pu5g3PrAWAMF5N6wJQbyDYykiY+yCYInkdtM++BPS5nc48xEr9wlzh1
 975b9BzgtaaPvUoVLWocC6IotO+6SpgaTqJnk0FacI4D6LRU3Xxz0MvcwP1TgINql2Mj
 FdRvTa77adyxpx5eP/6rInFhD81VEAsBEmAU3jC/ETI01pRxlhL/k37dXOSModtH7uQW
 vbH2wQO11rpQf8R+qBoFqI8F8q8SM45AsCeSsOdDGtFqzYFnDGtzZQGt2n5uYRd5VWpM
 JUMXcS0dP/cIP9qQBBwYmevmDJBg4lZ53enVbpJ35Nf8nVSYPHzsE1fQ3vN4U2NR2MKB
 oXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682973907; x=1685565907;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RS3KpCTStzCWlsTlw18MVyxgrwma2gcQ0Zuiv6pikps=;
 b=eWF8DnoB/UgnQzzPCqqW+hv/eX2Yq5MxeSagK7DhwkF6LST7+YmjTyG+8ETR93mRe4
 R/sOgt0Rhf77LnTbFkUi4jSQyO6CXY3LdUbQqzT1YOxvC9qnbWpChYj3vz9CnBltIgou
 OoFRkZv/+z5U4chnGN5z9U3oj113X+A1Lvp3xRZyM+o/RwnDoSVePQsdIz57zvZIGd9g
 jWAXi2uLsbog3xl0X6U7+0jvawVaFBBH/XlnRU4+p2RcSXZS7rhp17ytbI+X/kTPvj2V
 gloY0G+bp2BIVIWEDXbXICfwyCtPYeqaZBSHUjTkt2xucoLO0qTIwYKFBkQBXX9SzvC5
 rcZw==
X-Gm-Message-State: AC+VfDxcdA3N+mzaXMxO86sdgo06WIcorF3p8Qk8csB2B+4JN0NIaHy0
 umF9aUg8SHF/r81YQCFRBCVmjg==
X-Google-Smtp-Source: ACHHUZ5Zgw/kp+8+5P+Lg6ZRR70WQNKG1GA+2o3+7YrL7e5iaCVusFRmwEfcqYEaSXSLk/SMUSoL/w==
X-Received: by 2002:ac2:4543:0:b0:4b6:fddc:1fcd with SMTP id
 j3-20020ac24543000000b004b6fddc1fcdmr4415291lfm.23.1682973907056; 
 Mon, 01 May 2023 13:45:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25586000000b004eff1163c37sm3654762lfg.308.2023.05.01.13.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 13:45:06 -0700 (PDT)
Message-ID: <048b40fb-b4d0-2b33-9e97-dddec1405269@linaro.org>
Date: Mon, 1 May 2023 23:45:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/7] drm/msm/dpu: merge dpu_encoder_init() and
 dpu_encoder_setup()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-2-dmitry.baryshkov@linaro.org>
 <0d09f4ea-8778-d61d-feea-c0b3a2a6ebe4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0d09f4ea-8778-d61d-feea-c0b3a2a6ebe4@quicinc.com>
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

On 01/05/2023 22:58, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> There is no reason to split the dpu_encoder interface into separate
>> _init() and _setup() phases. Merge them into a single function.
>>
> 
> I think the reason for having this split was to pass a valid encoder to 
> the interface_modeset_init() and then do the rest of encoder 
> initialization after modeset_init().
> 
> Looking at the current code, one issue i am seeing is that you will now 
> initialize the dpu_encoder's msm_display_info along with 
> dpu_encoder_init().
> 
> Most of it is fine but in the case of bonded_dsi(), I see an issue.
> 
> The info.num_of_h_tiles++ happens after the modeset_init() of the second 
> dsi but now it has been moved earlier.
> 
> If for some reason, msm_dsi_modeset_init() fails for the second DSI, 
> num_of_h_tiles will still be 2 now.

If msm_dsi_modeset_init() fails, the function will err out and fail 
dpu_kms initialization. So it's not important, what is the value of 
num_h_tiles in this case.

> 
> Even for multi-DP case, the idea originally was the encoder gets setup 
> for that display after the modeset_init() of that display.
> 
> This might become more relevant for DSC perhaps. So lets say first 
> encoder needs DSC and second doesnt, we would know that only post 
> msm_dp_modeset_init().
> 
> So I think if you move the memcpy(&dpu_enc->disp_info, disp_info, 
> sizeof(*disp_info)); line out to be done after modeset_init(), this 
> change would look okay.
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 55 +++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 14 +---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 87 ++++++++-------------
>>   3 files changed, 56 insertions(+), 100 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index b34416cbd0f5..32785cb1b079 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2377,7 +2377,8 @@ static const struct drm_encoder_funcs 
>> dpu_encoder_funcs = {
>>           .early_unregister = dpu_encoder_early_unregister,
>>   };
>> -int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>> +struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>> +        int drm_enc_mode,
>>           struct msm_display_info *disp_info)
>>   {
>>       struct msm_drm_private *priv = dev->dev_private;
>> @@ -2386,7 +2387,23 @@ int dpu_encoder_setup(struct drm_device *dev, 
>> struct drm_encoder *enc,
>>       struct dpu_encoder_virt *dpu_enc = NULL;
>>       int ret = 0;
>> -    dpu_enc = to_dpu_encoder_virt(enc);
>> +    dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
>> +    if (!dpu_enc)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    ret = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>> +                   drm_enc_mode, NULL);
>> +    if (ret) {
>> +        devm_kfree(dev->dev, dpu_enc);
>> +        return ERR_PTR(ret);
>> +    }
>> +
>> +    drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
>> +
>> +    spin_lock_init(&dpu_enc->enc_spinlock);
>> +    dpu_enc->enabled = false;
>> +    mutex_init(&dpu_enc->enc_lock);
>> +    mutex_init(&dpu_enc->rc_lock);
>>       ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
>>       if (ret)
>> @@ -2415,44 +2432,14 @@ int dpu_encoder_setup(struct drm_device *dev, 
>> struct drm_encoder *enc,
>>       DPU_DEBUG_ENC(dpu_enc, "created\n");
>> -    return ret;
>> +    return &dpu_enc->base;
>>   fail:
>>       DPU_ERROR("failed to create encoder\n");
>>       if (drm_enc)
>>           dpu_encoder_destroy(drm_enc);
>> -    return ret;
>> -
>> -
>> -}
>> -
>> -struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>> -        int drm_enc_mode)
>> -{
>> -    struct dpu_encoder_virt *dpu_enc = NULL;
>> -    int rc = 0;
>> -
>> -    dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
>> -    if (!dpu_enc)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -
>> -    rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>> -                              drm_enc_mode, NULL);
>> -    if (rc) {
>> -        devm_kfree(dev->dev, dpu_enc);
>> -        return ERR_PTR(rc);
>> -    }
>> -
>> -    drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
>> -
>> -    spin_lock_init(&dpu_enc->enc_spinlock);
>> -    dpu_enc->enabled = false;
>> -    mutex_init(&dpu_enc->enc_lock);
>> -    mutex_init(&dpu_enc->rc_lock);
>> -
>> -    return &dpu_enc->base;
>> +    return ERR_PTR(ret);
>>   }
>>   int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 6d14f84dd43f..90e1925d7770 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -130,20 +130,12 @@ void dpu_encoder_virt_runtime_resume(struct 
>> drm_encoder *encoder);
>>   /**
>>    * dpu_encoder_init - initialize virtual encoder object
>>    * @dev:        Pointer to drm device structure
>> + * @drm_enc_mode: corresponding DRM_MODE_ENCODER_* constant
>>    * @disp_info:  Pointer to display information structure
>>    * Returns:     Pointer to newly created drm encoder
>>    */
>> -struct drm_encoder *dpu_encoder_init(
>> -        struct drm_device *dev,
>> -        int drm_enc_mode);
>> -
>> -/**
>> - * dpu_encoder_setup - setup dpu_encoder for the display probed
>> - * @dev:        Pointer to drm device structure
>> - * @enc:        Pointer to the drm_encoder
>> - * @disp_info:    Pointer to the display info
>> - */
>> -int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>> +struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>> +        int drm_enc_mode,
>>           struct msm_display_info *disp_info);
>>   /**
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index e1fd7b0f39cd..10bd0fd4ff48 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -535,15 +535,23 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>               !msm_dsi_is_master_dsi(priv->dsi[i]))
>>               continue;
>> -        encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>> +        memset(&info, 0, sizeof(info));
>> +        info.intf_type = INTF_DSI;
>> +
>> +        info.h_tile_instance[info.num_of_h_tiles++] = i;
>> +        if (msm_dsi_is_bonded_dsi(priv->dsi[i]))
>> +            info.h_tile_instance[info.num_of_h_tiles++] = other;
>> +
>> +        info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>> +
>> +        info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
>> +
>> +        encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
>>           if (IS_ERR(encoder)) {
>>               DPU_ERROR("encoder init failed for dsi display\n");
>>               return PTR_ERR(encoder);
>>           }
>> -        memset(&info, 0, sizeof(info));
>> -        info.intf_type = INTF_DSI;
>> -
>>           rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>>           if (rc) {
>>               DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>> @@ -551,11 +559,6 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>               break;
>>           }
>> -        info.h_tile_instance[info.num_of_h_tiles++] = i;
>> -        info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>> -
>> -        info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
>> -
>>           if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>>               rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
>>               if (rc) {
>> @@ -563,14 +566,7 @@ static int _dpu_kms_initialize_dsi(struct 
>> drm_device *dev,
>>                       other, rc);
>>                   break;
>>               }
>> -
>> -            info.h_tile_instance[info.num_of_h_tiles++] = other;
>>           }
>> -
>> -        rc = dpu_encoder_setup(dev, encoder, &info);
>> -        if (rc)
>> -            DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -                  encoder->base.id, rc);
>>       }
>>       return rc;
>> @@ -589,29 +585,23 @@ static int 
>> _dpu_kms_initialize_displayport(struct drm_device *dev,
>>           if (!priv->dp[i])
>>               continue;
>> -        encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
>> +        memset(&info, 0, sizeof(info));
>> +        info.num_of_h_tiles = 1;
>> +        info.h_tile_instance[0] = i;
>> +        info.intf_type = INTF_DP;
>> +
>> +        encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
>>           if (IS_ERR(encoder)) {
>>               DPU_ERROR("encoder init failed for dsi display\n");
>>               return PTR_ERR(encoder);
>>           }
>> -        memset(&info, 0, sizeof(info));
>>           rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
>>           if (rc) {
>>               DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>               drm_encoder_cleanup(encoder);
>>               return rc;
>>           }
>> -
>> -        info.num_of_h_tiles = 1;
>> -        info.h_tile_instance[0] = i;
>> -        info.intf_type = INTF_DP;
>> -        rc = dpu_encoder_setup(dev, encoder, &info);
>> -        if (rc) {
>> -            DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -                  encoder->base.id, rc);
>> -            return rc;
>> -        }
>>       }
>>       return 0;
>> @@ -629,13 +619,17 @@ static int _dpu_kms_initialize_hdmi(struct 
>> drm_device *dev,
>>       if (!priv->hdmi)
>>           return 0;
>> -    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
>> +    memset(&info, 0, sizeof(info));
>> +    info.num_of_h_tiles = 1;
>> +    info.h_tile_instance[0] = i;
>> +    info.intf_type = INTF_HDMI;
>> +
>> +    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
>>       if (IS_ERR(encoder)) {
>>           DPU_ERROR("encoder init failed for HDMI display\n");
>>           return PTR_ERR(encoder);
>>       }
>> -    memset(&info, 0, sizeof(info));
>>       rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
>>       if (rc) {
>>           DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>> @@ -643,16 +637,6 @@ static int _dpu_kms_initialize_hdmi(struct 
>> drm_device *dev,
>>           return rc;
>>       }
>> -    info.num_of_h_tiles = 1;
>> -    info.h_tile_instance[0] = i;
>> -    info.intf_type = INTF_HDMI;
>> -    rc = dpu_encoder_setup(dev, encoder, &info);
>> -    if (rc) {
>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -              encoder->base.id, rc);
>> -        return rc;
>> -    }
>> -
>>       return 0;
>>   }
>> @@ -664,14 +648,19 @@ static int _dpu_kms_initialize_writeback(struct 
>> drm_device *dev,
>>       struct msm_display_info info;
>>       int rc;
>> -    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
>> +    memset(&info, 0, sizeof(info));
>> +
>> +    info.num_of_h_tiles = 1;
>> +    /* use only WB idx 2 instance for DPU */
>> +    info.h_tile_instance[0] = WB_2;
>> +    info.intf_type = INTF_WB;
>> +
>> +    encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL, &info);
>>       if (IS_ERR(encoder)) {
>>           DPU_ERROR("encoder init failed for dsi display\n");
>>           return PTR_ERR(encoder);
>>       }
>> -    memset(&info, 0, sizeof(info));
>> -
>>       rc = dpu_writeback_init(dev, encoder, wb_formats,
>>               n_formats);
>>       if (rc) {
>> @@ -680,18 +669,6 @@ static int _dpu_kms_initialize_writeback(struct 
>> drm_device *dev,
>>           return rc;
>>       }
>> -    info.num_of_h_tiles = 1;
>> -    /* use only WB idx 2 instance for DPU */
>> -    info.h_tile_instance[0] = WB_2;
>> -    info.intf_type = INTF_WB;
>> -
>> -    rc = dpu_encoder_setup(dev, encoder, &info);
>> -    if (rc) {
>> -        DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> -                  encoder->base.id, rc);
>> -        return rc;
>> -    }
>> -
>>       return 0;
>>   }

-- 
With best wishes
Dmitry

