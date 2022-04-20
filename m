Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4145082E4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC2A10F1B4;
	Wed, 20 Apr 2022 07:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AD810F1BA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:54:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u7so1357787lfs.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JHFHIfMWok7YUhJBGEeNPDXqsMvM9nZ0ifc2Vic3yQY=;
 b=GCcVTcpeEw96UsK37wO+CSYLw2C2Yth7DJIEfxD/WhJ+iVEsPU1gMxalxZBILNy5yN
 2mYJ8ryJtQHM1iHWYDz69ZKe6ivHLUxrDOslOrnGMoJYTDuA8+hw655AABPAEhMjDGGD
 2W23vDKHUnpPSO+sSenAMK5Fg4AYpOlcQu9efVm2WAtUIitaAxe4L91Y3Rm8W7U1eCCi
 IxLFERIlXwm3CWF7QUn4sxCYi33hhiBo9e01hC4wC9A3uIshwaEqE1EEnDvQnoIvDT/+
 wHTTI+bXyy1jnqLwc3VrJjqH+gmgUqCnpC/DTD8DheAxqz3gzU54vTbhLf3h9phzL86Q
 c4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JHFHIfMWok7YUhJBGEeNPDXqsMvM9nZ0ifc2Vic3yQY=;
 b=Euqr7R84ycwe3wSwv5wfRe7c41PlOdbre4FtdJVURgXKT6DNJLXuHeXopZIHlTuwUu
 UNfoSzo8OqlWmUMlBgAavff7+4O9aBddVb8MvbGd2ZPU8wGj7m2SF4oooi6qXDsb7qJ6
 tp6E1l3hyTg2kDrfit5b5jp84q2DAy7C+dP+k6XWV/pMFU6oC8huIfw/eSTMGRk4H4tF
 DqRqVfySvik+IX9LgZTgG6ByH+3IBKMZCVgyyDGcEKo+LMQ+H6vVBYSNzQvsfhZsOFmC
 DABsP+W2N897DAxp77TY3s2cR62FixkJf2p1t7yImJw7A8SZQ9FZzwOiZcXSOLiQh1lN
 0KEw==
X-Gm-Message-State: AOAM5313TA80jaDYyUTUhEUnJLQPMrx3EY/7sa9vaeS0Reb9AiYFcsM/
 59kbv1S6QKgqrLZJBuCpBb1JSg==
X-Google-Smtp-Source: ABdhPJwuHC8e7nhL/oxwenWBCoSUwG0ccNQIycxx9Xp9vM3DOOA+Axx0goxd6gqGFuDTi6eKCPwjww==
X-Received: by 2002:a05:6512:3441:b0:46d:f73:777a with SMTP id
 j1-20020a056512344100b0046d0f73777amr13326649lfr.426.1650441252666; 
 Wed, 20 Apr 2022 00:54:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a198c1a000000b0046bc20821f6sm1744115lfd.115.2022.04.20.00.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:54:12 -0700 (PDT)
Message-ID: <f2ee13ea-8c75-5000-3354-75ddd57a0b9b@linaro.org>
Date: Wed, 20 Apr 2022 10:54:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 15/17] drm/msm/dpu: initialize dpu encoder and
 connector for writeback
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-16-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-16-git-send-email-quic_abhinavk@quicinc.com>
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
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 04:46, Abhinav Kumar wrote:
> Initialize dpu encoder and connector for writeback if the
> target supports it in the catalog.
> 
> changes in v2:
> 	- start initialing the encoder for writeback since we
> 	have migrated to using drm_writeback_connector_init_with_encoder()
> 	- instead of checking for WB_2 inside _dpu_kms_initialize_writeback
> 	call it only when its WB_2
> 	- rebase on tip of msm-next and remove usage of priv->encoders
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 ++++++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 58 +++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b117cad..b1475dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2085,7 +2085,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>   }
>   
>   static int dpu_encoder_virt_add_phys_encs(
> -		u32 display_caps,
> +		struct msm_display_info *disp_info,
>   		struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_enc_phys_init_params *params)
>   {
> @@ -2104,7 +2104,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		return -EINVAL;
>   	}
>   
> -	if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>   		enc = dpu_encoder_phys_vid_init(params);
>   
>   		if (IS_ERR_OR_NULL(enc)) {
> @@ -2117,7 +2117,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		++dpu_enc->num_phys_encs;
>   	}
>   
> -	if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>   		enc = dpu_encoder_phys_cmd_init(params);
>   
>   		if (IS_ERR_OR_NULL(enc)) {
> @@ -2130,6 +2130,19 @@ static int dpu_encoder_virt_add_phys_encs(
>   		++dpu_enc->num_phys_encs;
>   	}
>   
> +	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
> +		enc = dpu_encoder_phys_wb_init(params);
> +
> +		if (IS_ERR_OR_NULL(enc)) {
> +			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
> +					PTR_ERR(enc));
> +			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +		}
> +
> +		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
> +		++dpu_enc->num_phys_encs;
> +	}
> +
>   	if (params->split_role == ENC_ROLE_SLAVE)
>   		dpu_enc->cur_slave = enc;
>   	else
> @@ -2220,9 +2233,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		}
>   
>   		if (!ret) {
> -			ret = dpu_encoder_virt_add_phys_encs(disp_info->capabilities,
> -												 dpu_enc,
> -												 &phys_params);
> +			ret = dpu_encoder_virt_add_phys_encs(disp_info,
> +					dpu_enc, &phys_params);
>   			if (ret)
>   				DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
>   		}
> @@ -2339,8 +2351,9 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	if (!dpu_enc)
>   		return ERR_PTR(-ENOMEM);
>   
> +
>   	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> -			drm_enc_mode, NULL);
> +							  drm_enc_mode, NULL);
>   	if (rc) {
>   		devm_kfree(dev->dev, dpu_enc);
>   		return ERR_PTR(rc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c683cab..0a50509 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -15,6 +16,7 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_writeback.h>
>   
>   #include "msm_drv.h"
>   #include "msm_mmu.h"
> @@ -29,6 +31,7 @@
>   #include "dpu_kms.h"
>   #include "dpu_plane.h"
>   #include "dpu_vbif.h"
> +#include "dpu_writeback.h"
>   
>   #define CREATE_TRACE_POINTS
>   #include "dpu_trace.h"
> @@ -648,6 +651,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   	return 0;
>   }
>   
> +static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> +		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
> +		const u32 *wb_formats, int n_formats)
> +{
> +	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
> +	int rc;
> +
> +	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
> +	if (IS_ERR(encoder)) {
> +		DPU_ERROR("encoder init failed for dsi display\n");
> +		return PTR_ERR(encoder);
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	rc = dpu_writeback_init(dev, encoder, wb_formats,
> +			n_formats);
> +	if (rc) {
> +		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
> +		drm_encoder_cleanup(encoder);
> +		return rc;
> +	}
> +
> +	info.num_of_h_tiles = 1;
> +	/* use only WB idx 2 instance for DPU */
> +	info.h_tile_instance[0] = WB_2;
> +	info.intf_type = encoder->encoder_type;
> +
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc) {
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +				  encoder->base.id, rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * _dpu_kms_setup_displays - create encoders, bridges and connectors
>    *                           for underlying displays
> @@ -661,6 +703,7 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>   				    struct dpu_kms *dpu_kms)
>   {
>   	int rc = 0;
> +	int i;
>   
>   	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
>   	if (rc) {
> @@ -674,6 +717,21 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>   		return rc;
>   	}
>   
> +	/* Since WB isn't a driver check the catalog before initializing */
> +	if (dpu_kms->catalog->wb_count) {
> +		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
> +			if (dpu_kms->catalog->wb[i].id == WB_2) {
> +				rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms,
> +						dpu_kms->catalog->wb[i].format_list,
> +						dpu_kms->catalog->wb[i].num_formats);
> +				if (rc) {
> +					DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
> +					return rc;
> +				}
> +			}
> +		}
> +	}
> +
>   	return rc;
>   }
>   


-- 
With best wishes
Dmitry
