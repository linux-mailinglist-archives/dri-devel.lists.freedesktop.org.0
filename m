Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9595552CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE7210E8FC;
	Wed, 22 Jun 2022 17:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CCA10E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:48:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t24so16795383lfr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=49lB8Iz/Xq1t3p9s6U+UHzRnuYMf20ODhAkALD7oVmM=;
 b=muVD1v0dub7nXK6xbIV+NNwkMfSxx5NGvKBQ/PJMJsox4U+a1hzDBAjE0tq6IIjg5b
 hA2zCXSq1Rzpn59EjL2CPp9rfKfc1zJuWkvwHoh4BPqNoW+ndEpIxzHLSXNjWplchr5s
 FjTqWO0ue4xkMOF49qtiDLIAz+j0QgVl0J/PueTUQR6Su+LvNDrnRA/ZdPezaw1GQc31
 h4mNAis677sILAXzzmx1ryyvu8KflbFZtTNI8yljMBFJf++rs4KvqLGS1+4G1zOTITU4
 inSjhAR9TTo2QGg+/Q/kHkDelAPBgLlRUt9UToqO/VcuUGaLNy6u7WRcBb08QpesjpWT
 /XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=49lB8Iz/Xq1t3p9s6U+UHzRnuYMf20ODhAkALD7oVmM=;
 b=hTPhBjL0s8wM58LACwT9DfL+ywZWv2TA/PgcluC0EpxJmc1vcq/yxopc+vYvA1Ems/
 uZtXqAeubgp5FdxMgDhbt81f3P8m06wyw9oPs6EgBGN7ewGIXMlwPtjNR9IJMPXnnk/V
 Q4AfLBCVW3oSFHelP5d5TnA9OeJP6ilNAFYm/jFlb3gV+yKxdVDfywp6KpkhIgLXMqoh
 Ulrp8TqLAtLUbdijlPlrjwVIck7MGZ4pfX3gIn55apHL/BeU0v7xISQmfaUnckiZzdUq
 GDOnzcRZHm3jOZ56Dy5GGu4l1Us5BFywZ+cNR9qNsfnMP7C7fwxUmAE8grLrAwakYp6a
 X5mg==
X-Gm-Message-State: AJIora+lwPm709ihBWqk+1LKKOF/MVXJvilNeVvMd1MFjgglzilOYyFR
 3hyRSOyTE4zdJSmRhEE9GphfVA==
X-Google-Smtp-Source: AGRyM1tKfcuIsG8snjkOHa+FbwTwvyvGwNokq7dX4QAnOAGeQP5AOgQzbuT9q/M/QEwItsHsq8kAJg==
X-Received: by 2002:ac2:4e0f:0:b0:479:54a6:f9bb with SMTP id
 e15-20020ac24e0f000000b0047954a6f9bbmr2881149lfr.257.1655920111405; 
 Wed, 22 Jun 2022 10:48:31 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a056512209800b0047f6e590f08sm1378610lfr.128.2022.06.22.10.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 10:48:30 -0700 (PDT)
Message-ID: <d67f8838-9038-2525-be84-8c814ddbbe9d@linaro.org>
Date: Wed, 22 Jun 2022 20:48:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: Add interface support for CRC debugfs
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
 <20220622171835.7558-5-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220622171835.7558-5-quic_jesszhan@quicinc.com>
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

On 22/06/2022 20:18, Jessica Zhang wrote:
> Add support for writing CRC values for the interface block to
> the debugfs by calling the necessary MISR setup/collect methods.
> 
> Changes since V1:
> - Set values_cnt to only include phys with backing hw_intf
> - Loop over all drm_encs connected to crtc
> 
> Changes since V2:
> - Remove vblank.h inclusion
> - Change `pos + i` to `pos + entries`
> - Initialize values_cnt to 0 for encoder
> - Change DPU_CRTC_CRC_SOURCE_INTF to DPU_CRTC_CRC_SOURCE_ENCODER (and
>    "intf" to "enc")
> - Change dpu_encoder_get_num_phys to dpu_encoder_get_num_hw_intfs
> - Add checks for setup_misr and collect_misr in
>    dpu_encoder_get_num_hw_intfs
> 
> Changes since V3:
> - Remove extra whitespace
> - Change "enc" to "encoder"
> - Move crcs array to dpu_crtc_get_encoder_crc
> - Rename dpu_encoder_get_num_hw_intfs to dpu_encoder_get_crc_values_cnt
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 46 ++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 64 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 +++++++
>   4 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b57140c3671a..4dd0ce09ca74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -79,6 +79,8 @@ static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
>   	if (!strcmp(src_name, "auto") ||
>   	    !strcmp(src_name, "lm"))
>   		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
> +	if (!strcmp(src_name, "encoder"))
> +		return DPU_CRTC_CRC_SOURCE_ENCODER;
>   
>   	return DPU_CRTC_CRC_SOURCE_INVALID;
>   }
> @@ -94,8 +96,16 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
>   		return -EINVAL;
>   	}
>   
> -	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
> +	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER) {
>   		*values_cnt = crtc_state->num_mixers;
> +	} else if (source == DPU_CRTC_CRC_SOURCE_ENCODER) {
> +		struct drm_encoder *drm_enc;
> +
> +		*values_cnt = 0;
> +
> +		drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> +			*values_cnt += dpu_encoder_get_crc_values_cnt(drm_enc);
> +	}
>   
>   	return 0;
>   }
> @@ -116,6 +126,14 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
>   	}
>   }
>   
> +static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc;
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
> +		dpu_encoder_setup_misr(drm_enc);
> +}
> +
>   static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   {
>   	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
> @@ -164,6 +182,8 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>   
>   	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>   		dpu_crtc_setup_lm_misr(crtc_state);
> +	else if (source == DPU_CRTC_CRC_SOURCE_ENCODER)
> +		dpu_crtc_setup_encoder_misr(crtc);
>   	else
>   		ret = -EINVAL;
>   
> @@ -215,6 +235,28 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
>   }
>   
> +static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *drm_enc;
> +	int rc, pos = 0;
> +	u32 crcs[INTF_MAX];
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
> +		rc = dpu_encoder_get_crc(drm_enc, crcs, pos);
> +		if (rc < 0) {
> +			if (rc != -ENODATA)
> +				DRM_DEBUG_DRIVER("MISR read failed\n");
> +
> +			return rc;
> +		}
> +
> +		pos += rc;
> +	}
> +
> +	return drm_crtc_add_crc_entry(crtc, true,
> +			drm_crtc_accurate_vblank_count(crtc), crcs);
> +}
> +
>   static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
> @@ -227,6 +269,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   
>   	if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>   		return dpu_crtc_get_lm_crc(crtc, crtc_state);
> +	else if (crtc_state->crc_source == DPU_CRTC_CRC_SOURCE_ENCODER)
> +		return dpu_crtc_get_encoder_crc(crtc);
>   
>   	return -EINVAL;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 20df23fe74ed..af03277a3e5a 100644
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
> + * @DPU_CRTC_CRC_SOURCE_ENCODER: CRC in encoder
>    * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
>    */
>   enum dpu_crtc_crc_source {
>   	DPU_CRTC_CRC_SOURCE_NONE = 0,
>   	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
> +	DPU_CRTC_CRC_SOURCE_ENCODER,
>   	DPU_CRTC_CRC_SOURCE_MAX,
>   	DPU_CRTC_CRC_SOURCE_INVALID = -1
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..e00c788db14c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -225,6 +225,70 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>   	return dpu_enc->wide_bus_en;
>   }
>   
> +int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +	int i, num_intf = 0;
> +
> +	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> +
> +		if (phys->hw_intf && phys->hw_intf->ops.setup_misr
> +				&& phys->hw_intf->ops.collect_misr)
> +			num_intf++;
> +	}
> +
> +	return num_intf;
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
> +
> +		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
> +	}
> +}
> +
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
> +{
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	int i, rc = 0, entries_added = 0;
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
> +		rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + entries_added]);
> +		if (rc)
> +			return rc;
> +		entries_added++;
> +	}
> +
> +	return entries_added;
> +}
> +
>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>   {
>   	struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c91994..a78971670024 100644
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
> + * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
> + *	in virtual encoder that can collect CRC values
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * Returns:     Number of physical encoders for given drm encoder
> + */
> +int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc);
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
> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
> +
>   /**
>    * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
>    * @drm_enc:    Pointer to previously created drm encoder structure


-- 
With best wishes
Dmitry
