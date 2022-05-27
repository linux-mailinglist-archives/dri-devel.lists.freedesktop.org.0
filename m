Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD45367A9
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 21:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDB710E35A;
	Fri, 27 May 2022 19:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C449110E39C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 19:46:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j10so8255200lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lMKCZc2VHRvCl/PHaxJTu67WTdT491kvvA5RNKlHqI0=;
 b=zbkjBf84qc1OVOCw7RrF/sAxWvdZYMxe1hXLZm0DYIlHtFbdVrUdHs3/igtPM8J0AY
 uSBvL+98axh6xd62BqHQauPed2yU5M9ieaFKEFA1XyTSgNz17faUOyk9LjEcgl42kc2/
 2vB33N6kSC4ncG8+EQsh+OL9E7NvMaTP1qKwI2Q51N3+YTPw8yMuvDtJTE2XDj7MnDQL
 w8I3rRoO/crYiypjhVwtRFMw4nzCcR57Ga4YMcww+vpzrNWwYnAzlhtt33zh54qz3dUi
 xJGgs0xA5brMmIvRMJUEhyaUgQhWPPTUIqnc6UCTgWJ1rarnMTDY4ahYTAcXV1c6drUg
 PlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lMKCZc2VHRvCl/PHaxJTu67WTdT491kvvA5RNKlHqI0=;
 b=wiCB6JrZcnOSXbrVUEasZ39rQRAHCbf3lFlipp5j3uR8xdrXsIRVJBSUQKtLEOgLOj
 rGdfpAasrrAHJ1GSfpyuT9ufoOIVd2LEYGNN6mLgwOdVnfzbF7DveliL3G8IU5VzJtV2
 xn54kLMWxaqvr67RoAhpuT14lL4zuVDBBQxlXoGpcmSj8C1JMkJ9sXVK73BZqoS19ql/
 v9XMFoxjVrYmlDGcRKsnCG936ijiP4HkiPXNtt0zwpW6vF6DTqTggB9TP4Gzckbm5fdC
 lfiYyFuGTl+ap/ia862TRvEG3lJwbu8siOOmNiIcvaKTxZr0m6kQrYdYfmU4jaQcSi+W
 lHcQ==
X-Gm-Message-State: AOAM530T8RqoEnsQ/JEx7bYC4HSdEpVDvMRNZyQ6ksqhl3dZnPF/KcK1
 Iga4ENTGqiUHw3Tm4JBo80RA7w==
X-Google-Smtp-Source: ABdhPJwM9p+y9KtNDjidbxJplyaQsBq0c4gz/WubXLLvIMID+9c6KN4po5OX76UowvhvboIasryOrQ==
X-Received: by 2002:ac2:42d1:0:b0:474:68f:2e48 with SMTP id
 n17-20020ac242d1000000b00474068f2e48mr30532453lfl.215.1653680805974; 
 Fri, 27 May 2022 12:46:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 9-20020a2e1649000000b0025544d94611sm100435ljw.73.2022.05.27.12.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 12:46:45 -0700 (PDT)
Message-ID: <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
Date: Fri, 27 May 2022 22:46:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] drm/msm/dpu: Add interface support for CRC debugfs
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220527185407.162-4-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2022 21:54, Jessica Zhang wrote:
> Add support for writing CRC values for the interface block to
> the debugfs by calling the necessary MISR setup/collect methods.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 43 ++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 61 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++++++++
>   4 files changed, 128 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ae09466663cf..e830fb1e910d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>   	if (!strcmp(src_name, "auto") ||
>   	    !strcmp(src_name, "lm"))
>   		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
> +	if (!strcmp(src_name, "intf"))
> +		return DPU_CRTC_CRC_SOURCE_INTF;
>   
>   	return DPU_CRTC_CRC_SOURCE_INVALID;
>   }
> @@ -94,8 +96,18 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>   		return -EINVAL;
>   	}
>   
> -	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>   		*values_cnt = crtc_state->num_mixers;
> +	} else if (source == DPU_CRTC_CRC_SOURCE_INTF) {
> +		struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);

Let's do this correctly from the beginning. The CRTC can drive several 
encoders. Do we want to get CRC from all of them or just from the first one?

> +
> +		if (!drm_enc) {
> +			DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> +			return -ENODATA;
> +		}
> +
> +		*values_cnt = dpu_encoder_get_num_phys(drm_enc);
> +	}
>   
>   	return 0;
>   }
> @@ -116,6 +128,18 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
>   	}
>   }
>   
> +static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc = get_encoder_from_crtc(crtc);
> +
> +	if (!drm_enc) {
> +		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> +		return;
> +	}
> +
> +	dpu_encoder_setup_misr(drm_enc);
> +}
> +
>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   {
>   	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
> @@ -164,6 +188,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   
>   	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>   		dpu_crtc_setup_lm_misr(crtc_state);
> +	else if (source == DPU_CRTC_CRC_SOURCE_INTF)
> +		dpu_crtc_setup_encoder_misr(crtc);
>   
>   cleanup:
>   	drm_modeset_unlock(&crtc->mutex);
> @@ -212,6 +238,18 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc, struct dpu_crtc_state *crt
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
>   }
>   
> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc =  get_encoder_from_crtc(crtc);
> +
> +	if (!drm_enc) {
> +		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
> +		return -EINVAL;
> +	}
> +
> +	return dpu_encoder_get_crc(drm_enc);
> +}
> +
>   static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc_state *crtc_state;
> @@ -227,6 +265,9 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>   		return dpu_crtc_get_lm_crc(crtc, crtc_state);
>   
> +	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_INTF)
> +		return dpu_crtc_get_encoder_crc(crtc);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index b8785c394fcc..a60af034905d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -73,11 +74,13 @@ struct dpu_crtc_smmu_state_data {
>    * enum dpu_crtc_crc_source: CRC source
>    * @DPU_CRTC_CRC_SOURCE_NONE: no source set
>    * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
> + * @DPU_CRTC_CRC_SOURCE_INTF: CRC in phys interface
>    * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>    */
>   enum dpu_crtc_crc_source {
>   	DPU_CRTC_CRC_SOURCE_NONE = 0,
>   	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
> +	DPU_CRTC_CRC_SOURCE_INTF,
>   	DPU_CRTC_CRC_SOURCE_MAX,
>   	DPU_CRTC_CRC_SOURCE_INVALID = -1
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..7740515f462d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -14,6 +14,7 @@
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_vblank.h>
>   #include <drm/drm_probe_helper.h>
>   
>   #include "msm_drv.h"
> @@ -225,6 +226,66 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   	return dpu_enc->wide_bus_en;
>   }
>   
> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	return dpu_enc->num_phys_encs;
> +}
> +
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	int i;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
> +			continue;

Does WB support CRC?

> +
> +		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> +	}
> +}
> +
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
> +
> +	int i, rc;
> +
> +	if (!drm_enc->crtc) {
> +		DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
> +		return -EINVAL;
> +	}
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
> +			continue;
> +
> +		rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);

This doesn't look fully correct. Do we need to skip the indices for the 
phys without a backing hw_intf?

> +

Extra empty line.

> +		if (rc) {
> +			if (rc != -ENODATA)

Do we need to handle ENODATA in any specific way (like zeroing the 
crcs[i])? If not, I'd suggest to drop this return code. Let's make an 
error always an error.

> +				DRM_DEBUG_DRIVER("MISR read failed\n");
> +			return rc;
> +		}
> +	}
> +
> +	return drm_crtc_add_crc_entry(drm_enc->crtc, true,
> +			drm_crtc_accurate_vblank_count(drm_enc->crtc), crcs);
> +}
> +
>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>   {
>   	struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c91994..8345599dd01a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -174,6 +175,27 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>   
>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>   
> +/**
> + * dpu_encoder_get_num_phys - get number of physical encoders contained in virtual
> + *                            encoder
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:	Number of physical encoders for given drm encoder
> + */
> +int dpu_encoder_get_num_phys(const struct drm_encoder *drm_enc);
> +
> +/**
> + * dpu_encoder_setup_misr - enable misr calculations
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
> +
> +/**
> + * dpu_encoder_get_crc - get the crc value from interface blocks
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:     0 on success, error otherwise
> + */
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc);
> +
>   /**
>    * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
>    * @drm_enc:    Pointer to previously created drm encoder structure


-- 
With best wishes
Dmitry
