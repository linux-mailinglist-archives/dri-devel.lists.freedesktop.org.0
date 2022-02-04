Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D84AA32D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 23:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216BA10EB2C;
	Fri,  4 Feb 2022 22:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D9B10EB2C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 22:34:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b9so15304251lfq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 14:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SWpW1dxI4za05B4DNh3cpl0cH/l2JNHP2x1u8I9i430=;
 b=Idal4AAHMZKDbV/D13eQtcBP4XvrE0VxfEkgts8Ab/PH7PvY6clEAnNRKqMp8/X3Dy
 pAWtWt6WHXSu3VmuYm+do/bPjGdL+8SUzZVtv9BBiJ95EUKabkBJTP6it3SDKA3kmCDY
 rqvs9frnFl8UaGKoQlTje52Z/fegitKqrpZTLfPe/XbOOsowy+qC/B0J24JA3LI+DafY
 wxx8yBKD1OhnQ5IzQukOPOxN2n9WYERZsgxMW984G0Db2tJlA201Xdba6WtIq1XvQL/u
 PJmghthSKyXiGOhkeNcg0QT+x5ejfmZuI9eYxvUmb1GVYq03dP+z+P6NDpI47MVyvhNC
 r6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SWpW1dxI4za05B4DNh3cpl0cH/l2JNHP2x1u8I9i430=;
 b=mszJxVy4ApbKznPpQXsozgLF6douAE0gRG5tzMyNhkJ+Jq7f5tBBkitX6j1eX8VjEt
 +obFEF2zQGyFJEz38tggs6pTBXgrzMsj+zXVC96Nw+RMn4/EmrUmKDVjyrLZo6A7UMQZ
 vRP8ExX3IOD5lW/ThpMp7nlt7P+RG5Ji/yhp/qV5pRZOib4uq1N4KVHeZpViwFoWxwcZ
 PFUeKXxAU6VsZjw3EfMqprpw2rGEMWUHKntcounqlk0MZ8jYIrlGuXkBaOy4vUIxO4Eo
 OEzpt8L0wCsBAmV5F6zfAXfGzxoovAHVAKqFTWzVaye5JZrPn3NvH+5EBjaoBFhGMita
 BcMg==
X-Gm-Message-State: AOAM531F2JhV365LRabYiSWnE+xW2rCKh44GZTs70Mx2HLCqhZ8lTgah
 jTx8sTKoebL99bAGtn+FWgUNGRyU3E3XZA==
X-Google-Smtp-Source: ABdhPJyf/cLItOlN0t67gC1L2/P0F4eg2L4xQR+5SLoD4SG2pmuQrykrp2xCbukFmfndae8a2hmkXw==
X-Received: by 2002:a05:6512:3b8c:: with SMTP id
 g12mr797208lfv.151.1644014062013; 
 Fri, 04 Feb 2022 14:34:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z5sm419301ljz.38.2022.02.04.14.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:34:21 -0800 (PST)
Message-ID: <22b47967-a393-221c-17ce-8f5cfa14cc56@linaro.org>
Date: Sat, 5 Feb 2022 01:34:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/12] drm/msm/dpu: initialize dpu encoder and connector
 for writeback
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-11-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-11-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2022 00:17, Abhinav Kumar wrote:
> Initialize dpu encoder and connector for writeback if the
> target supports it in the catalog.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 37 ++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 62 +++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b51a677..3746432 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2066,7 +2066,7 @@ static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
>   }
>   
>   static int dpu_encoder_virt_add_phys_encs(
> -		u32 display_caps,
> +		struct msm_display_info *disp_info,
>   		struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_enc_phys_init_params *params)
>   {
> @@ -2085,7 +2085,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		return -EINVAL;
>   	}
>   
> -	if (display_caps & MSM_DISPLAY_CAP_VID_MODE) {
> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>   		enc = dpu_encoder_phys_vid_init(params);
>   
>   		if (IS_ERR_OR_NULL(enc)) {
> @@ -2098,7 +2098,7 @@ static int dpu_encoder_virt_add_phys_encs(
>   		++dpu_enc->num_phys_encs;
>   	}
>   
> -	if (display_caps & MSM_DISPLAY_CAP_CMD_MODE) {
> +	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>   		enc = dpu_encoder_phys_cmd_init(params);
>   
>   		if (IS_ERR_OR_NULL(enc)) {
> @@ -2111,6 +2111,19 @@ static int dpu_encoder_virt_add_phys_encs(
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
> @@ -2199,9 +2212,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
> @@ -2317,11 +2329,14 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	if (!dpu_enc)
>   		return ERR_PTR(-ENOMEM);
>   
> -	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> -			drm_enc_mode, NULL);
> -	if (rc) {
> -		devm_kfree(dev->dev, dpu_enc);
> -		return ERR_PTR(rc);
> +	/* this is handled by drm_writeback_connector_init for virtual encoder */
> +	if (drm_enc_mode != DRM_MODE_ENCODER_VIRTUAL) {
> +		rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> +							  drm_enc_mode, NULL);
> +		if (rc) {
> +			devm_kfree(dev->dev, dpu_enc);
> +			return ERR_PTR(rc);
> +		}
>   	}
>   
>   	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a..6327ba9 100644
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
> @@ -642,6 +645,56 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   	return 0;
>   }
>   
> +static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> +		struct msm_drm_private *priv, struct dpu_kms *dpu_kms)
> +{
> +	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
> +	int rc, i;
> +	const u32 *wb_formats;
> +	int n_formats;
> +
> +	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_VIRTUAL);
> +	if (IS_ERR(encoder)) {
> +		DPU_ERROR("encoder init failed for dsi display\n");
> +		return PTR_ERR(encoder);
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
> +		if (dpu_kms->catalog->wb[i].id == WB_2) {
> +			wb_formats = dpu_kms->catalog->wb[i].format_list;
> +			n_formats = dpu_kms->catalog->wb[i].num_formats;
> +		}
> +	}

If there is no WB_2 in the catalog, then both wb_formats and n_formats 
would be unused. Also even if there is no WB_2 you'd still try creating 
the writeback below.

I'd suggest to move dpu_encoder_init() + dpu_writeback_init() + 
dpu_encoder_setup() to the separate function. Then you can loop over the 
catslog->wb[] and once WB_2 is found, call this new function.

> +
> +	rc = dpu_writeback_init(dev, encoder, encoder->helper_private, wb_formats,
> +			n_formats);
> +	if (rc) {
> +		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
> +		drm_encoder_cleanup(encoder);
> +		return rc;
> +	}
> +
> +	priv->encoders[priv->num_encoders++] = encoder;
> +
> +	info.num_of_h_tiles = 1;
> +	/* use only WB idx 2 instance for DPU */
> +	info.h_tile_instance[0] = WB_2;
> +	info.capabilities = MSM_DISPLAY_CAP_HOT_PLUG | MSM_DISPLAY_CAP_EDID;

these two capabilities are unused in the code. I'd suggest to drop them 
from msm_drv.h at all.

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
> @@ -668,6 +721,15 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>   		return rc;
>   	}
>   
> +	/* Since WB isn't a driver check the catalog before initializing */
> +	if (dpu_kms->catalog->wb_count) {
> +		rc = _dpu_kms_initialize_writeback(dev, priv, dpu_kms);
> +		if (rc) {
> +			DPU_ERROR("initialize_WB failed, rc = %d\n", rc);
> +			return rc;
> +		}
> +	}
> +
>   	return rc;
>   }
>   


-- 
With best wishes
Dmitry
