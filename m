Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9950EE8C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 04:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBD210EEF3;
	Tue, 26 Apr 2022 02:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909B910EEF3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 02:11:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t25so29430622lfg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 19:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vHlQ7RqobGfZwqHz/ZuuQ12DQAj/ynfAnLGOAimM654=;
 b=zYsGa6s/rkwZAC83fq22UwUKGsb2wC7VSkWuEZdKV41+jKHRoiaMSuEX6hkGB9G1JP
 AQb7i/mhKWT54mpK6ULX1hFtgVY8397d4H4bA6/OaWQJ40HULAGbRq2+Lp/d7OLry1+r
 VmVOO20U3eE6LVrAatZm/tJwezbPPNx3fO7mQGG3az+1rdHKauBQLUnYJ8nJtSCOBrkR
 NLqu/uEkxi3POEqQ5YFWXlXQ0ByIl80lw3IDUhOBv3iru97l1jJmIkBItg18G+3yamjP
 BEhNbCUD7H/UcvY768zoaRf+zq2nLPfTxWkBKtiekojI7Sf83sIKFd0a5TndavFaChmc
 vg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vHlQ7RqobGfZwqHz/ZuuQ12DQAj/ynfAnLGOAimM654=;
 b=sGpS4DWzYhQuVjJGzsQKyh06TJwa+oXhsd8WbNl0G/jEmZqQqiFG9jba4f0bZQVIFx
 dKPAlyj+6v7Hwh04IUzYkCHSzzIt+hWlIR+KIVxEou0TfilOELpeIp9RhJc8M8VtNlZQ
 +ncOIoRAMwtmLUliSJgZwpb3qtb837qGS0ainLFVAboQsjlGJUa7fcitP9fnhv6yEl9H
 3FpjnRhaJYIHEJwzsv9I3hIjngncrJXg1wAVHCIwM7Cb6saEYDTaI7jTZvOQhfHVLYC9
 hpiKf/j1JlYOMa7ciuBTB4IfyU7OtZySS/jCzzlrmgK9OBC/XTZ7E3G3yhd3xm1jHRei
 KBsg==
X-Gm-Message-State: AOAM530BfPLQ7ZPpJAR6ronskxFrKSgNVKf5kLoJYgxm986xzU5VJgVN
 ebr5HuaXSbjrEWrOsIreNj8uVQ==
X-Google-Smtp-Source: ABdhPJzMd+WmmC4nzxG6PNXNcLhl43Qppi6M4Zecb3pbL/a4oCz5KdFrnVTAso7WdbPqBKh4gZbfWw==
X-Received: by 2002:a19:7616:0:b0:472:1f7b:e4cd with SMTP id
 c22-20020a197616000000b004721f7be4cdmr13853lff.202.1650939102695; 
 Mon, 25 Apr 2022 19:11:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bp3-20020a056512158300b0044318361eedsm1585959lfb.204.2022.04.25.19.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 19:11:42 -0700 (PDT)
Message-ID: <f93b173c-6e91-a5c7-002e-2def2a6eff53@linaro.org>
Date: Tue, 26 Apr 2022 05:11:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 15/19] drm/msm/dpu: initialize dpu encoder and
 connector for writeback
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <1650846730-19226-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650846730-19226-16-git-send-email-quic_abhinavk@quicinc.com>
 <Ymc9sdtF0y0gvVeL@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Ymc9sdtF0y0gvVeL@pendragon.ideasonboard.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2022 03:32, Laurent Pinchart wrote:
> Hi Abhinav,
> 
> On Sun, Apr 24, 2022 at 05:32:06PM -0700, Abhinav Kumar wrote:
>> Initialize dpu encoder and connector for writeback if the
>> target supports it in the catalog.
>>
>> changes in v2:
>> 	- start initialing the encoder for writeback since we
>> 	have migrated to using drm_writeback_connector_init_with_encoder()
>> 	- instead of checking for WB_2 inside _dpu_kms_initialize_writeback
>> 	call it only when its WB_2
>> 	- rebase on tip of msm-next and remove usage of priv->encoders
>>
>> changes in v3:
>> 	- none
>>
>> changes in v4:
>> 	- fix copyright years order
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 61 ++++++++++++++++++++++++++++-
>>   2 files changed, 80 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 24870eb..2d79002 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2102,7 +2102,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>>   }
>>   
>>   static int dpu_encoder_virt_add_phys_encs(
>> -		u32 display_caps,
>> +		struct msm_display_info *disp_info,
>>   		struct dpu_encoder_virt *dpu_enc,
>>   		struct dpu_enc_phys_init_params *params)
>>   {
>> @@ -2121,7 +2121,7 @@ static int dpu_encoder_virt_add_phys_encs(
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
>> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>>   		enc = dpu_encoder_phys_vid_init(params);
>>   
>>   		if (IS_ERR_OR_NULL(enc)) {
>> @@ -2134,7 +2134,7 @@ static int dpu_encoder_virt_add_phys_encs(
>>   		++dpu_enc->num_phys_encs;
>>   	}
>>   
>> -	if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
>> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>>   		enc = dpu_encoder_phys_cmd_init(params);
>>   
>>   		if (IS_ERR_OR_NULL(enc)) {
>> @@ -2147,6 +2147,19 @@ static int dpu_encoder_virt_add_phys_encs(
>>   		++dpu_enc->num_phys_encs;
>>   	}
>>   
>> +	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
>> +		enc = dpu_encoder_phys_wb_init(params);
>> +
>> +		if (IS_ERR_OR_NULL(enc)) {
>> +			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
>> +					PTR_ERR(enc));
>> +			return enc == NULL ? -EINVAL : PTR_ERR(enc);
>> +		}
>> +
>> +		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
>> +		++dpu_enc->num_phys_encs;
>> +	}
>> +
>>   	if (params->split_role == ENC_ROLE_SLAVE)
>>   		dpu_enc->cur_slave = enc;
>>   	else
>> @@ -2248,9 +2261,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>>   		}
>>   
>>   		if (!ret) {
>> -			ret = dpu_encoder_virt_add_phys_encs(disp_info->capabilities,
>> -												 dpu_enc,
>> -												 &phys_params);
>> +			ret = dpu_encoder_virt_add_phys_encs(disp_info,
>> +					dpu_enc, &phys_params);
>>   			if (ret)
>>   				DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>>   		}
>> @@ -2367,8 +2379,9 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>>   	if (!dpu_enc)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +
>>   	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>> -			drm_enc_mode, NULL);
>> +							  drm_enc_mode, NULL);
>>   	if (rc) {
>>   		devm_kfree(dev->dev, dpu_enc);
>>   		return ERR_PTR(rc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c683cab..9a406e1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1,7 +1,9 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> - * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
>>    * Copyright (C) 2013 Red Hat
>> + * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + *
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>>   
>> @@ -15,6 +17,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_vblank.h>
>> +#include <drm/drm_writeback.h>
>>   
>>   #include "msm_drv.h"
>>   #include "msm_mmu.h"
>> @@ -29,6 +32,7 @@
>>   #include "dpu_kms.h"
>>   #include "dpu_plane.h"
>>   #include "dpu_vbif.h"
>> +#include "dpu_writeback.h"
>>   
>>   #define CREATE_TRACE_POINTS
>>   #include "dpu_trace.h"
>> @@ -648,6 +652,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   	return 0;
>>   }
>>   
>> +static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>> +		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
>> +		const u32 *wb_formats, int n_formats)
>> +{
>> +	struct drm_encoder *encoder = NULL;
>> +	struct msm_display_info info;
>> +	int rc;
>> +
>> +	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
> 
> I'm puzzled. I thought the whole purpose of the
> drm_writeback_connector_init_with_encoder() function was to share an
> encoder between writeback and a real display output, but the encoder you
> create here seems to be specific to writeback. What am I missing ?

The encoder instance is specific to the writeback, however the encoder's 
code is shared between the virtual and 'real' encoders. All the code for 
encoder callbacks, resource management, irq handling is shared between 
them. It wouldn't be practical to duplicate or rewrite the whole 
dpu_encoder.c. During the design stage we have discussed several other 
possibile solutions. All of them look pretty ugly.

> 
>> +	if (IS_ERR(encoder)) {
>> +		DPU_ERROR("encoder init failed for dsi display\n");
>> +		return PTR_ERR(encoder);
>> +	}
>> +
>> +	memset(&info, 0, sizeof(info));
>> +
>> +	rc = dpu_writeback_init(dev, encoder, wb_formats,
>> +			n_formats);
>> +	if (rc) {
>> +		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
>> +		drm_encoder_cleanup(encoder);
>> +		return rc;
>> +	}
>> +
>> +	info.num_of_h_tiles = 1;
>> +	/* use only WB idx 2 instance for DPU */
>> +	info.h_tile_instance[0] = WB_2;
>> +	info.intf_type = encoder->encoder_type;
>> +
>> +	rc = dpu_encoder_setup(dev, encoder, &info);
>> +	if (rc) {
>> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>> +				  encoder->base.id, rc);
>> +		return rc;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * _dpu_kms_setup_displays - create encoders, bridges and connectors
>>    *                           for underlying displays
>> @@ -661,6 +704,7 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>>   				    struct dpu_kms *dpu_kms)
>>   {
>>   	int rc = 0;
>> +	int i;
>>   
>>   	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
>>   	if (rc) {
>> @@ -674,6 +718,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>>   		return rc;
>>   	}
>>   
>> +	/* Since WB isn't a driver check the catalog before initializing */
>> +	if (dpu_kms->catalog->wb_count) {
>> +		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
>> +			if (dpu_kms->catalog->wb[i].id == WB_2) {
>> +				rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms,
>> +						dpu_kms->catalog->wb[i].format_list,
>> +						dpu_kms->catalog->wb[i].num_formats);
>> +				if (rc) {
>> +					DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
>> +					return rc;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>>   	return rc;
>>   }
>>   
> 


-- 
With best wishes
Dmitry
