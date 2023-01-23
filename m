Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE0678A45
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313D110E59C;
	Mon, 23 Jan 2023 22:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C20610E59C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:06:20 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z11so16373182ede.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAm4yipTGl4f6AEzqAz2g/Q2IcMdf1Vc7wWT2ZxotWM=;
 b=ZTcEYtk5XEoE+Uw3WhPs0PZ9IRoIAMYXMkkPTK4GH8Mji8y9tVoxtPJJ0HpMO1Lbkd
 N3eZ19thqJEzwnXTyhxvYzTPvvQFQvaz7XC/SdZb97zo7pOb3BRbPyNxSoCicsgfxdTZ
 a6jPqWTS70NhKK4Jv4qqA4eo/vbVn67u7EnP8CZj15yTozIg3TioFRJNPvoRATOIhJDN
 etD/SGn1lYG11lquw7c2lePnNTQjY/mK8+cZRDAdFf3A9cvyCoipUrzf7wjRKq1DSKoU
 MNDkhiQzGOZvqo3UxY7Gd99wwY/Upg0YomlnfizTRclshy17YVavQoZ5or4SUGL+/IZW
 zqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAm4yipTGl4f6AEzqAz2g/Q2IcMdf1Vc7wWT2ZxotWM=;
 b=Jw5kYq7PNhxhRxxCAimW7Ps2S5IqvKEL0jHJgnPFpakVGTXOOey6k2D17yre4T92wN
 2cXIjlPJOGI+8OhdA4kSVNHn68JWCALdGZm/gi8LlLKhcR4QVb+Wqb8HDZfClpYLjK+h
 uNsscW//hDn7gdNoGty6rHIvmH3p4g+xe54/1lH/hrYBpkjRgmODqcPf7PTEM3KHNajk
 3vMmTNzzg1eHb19O8bMpbIId+mRGnob0+0KcVBXivvfiDbiYBbNW0YWXcx3NW3dtvSC5
 ZE55AIYrnqZW6UgwK1vZtA6fYDyBDawnAheiUZCId1KP8MtqJz1F1KknFFIUHwmpECDE
 2Vbw==
X-Gm-Message-State: AO0yUKVrDLqtPg8tU45JnPuiCV5iWYnDfq07OVIN/ZR3bHQTEOfgv/C5
 Tq0dCRn6QwPuhAvLdg1KRc6tJA==
X-Google-Smtp-Source: AK7set+CajOHSoEUIH7TfOFV4HrcYGxnMBhQNSdu1rYwZuC8KyA9saNLX+IIrulaVdcA+y6fbhR19g==
X-Received: by 2002:aa7:c597:0:b0:49f:20ca:59a2 with SMTP id
 g23-20020aa7c597000000b0049f20ca59a2mr1533646edq.15.1674511578481; 
 Mon, 23 Jan 2023 14:06:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fg14-20020a056402548e00b0049f29a7c0d6sm257785edb.34.2023.01.23.14.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:06:16 -0800 (PST)
Message-ID: <a55367b7-f756-2960-3dee-319d3fa2a190@linaro.org>
Date: Tue, 24 Jan 2023 00:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 09/14] drm/msm/dsi: export struct msm_compression_info
 to dpu encoder
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-10-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-10-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> struct msm_compression_info is used to support several different
> compression mechanisms. It also contains customized info required
> to configure DSC encoder engine. This patch also make changes DSI
> module to have DSI exports struct msm_compreion_info to dpu encoder
> instead of struct drm_dsc_config.

Let's see how patch 07 evolves first. But generally I don't like the 
idea of passing around another wrapper structure.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 +++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 10 ++++++++--
>   drivers/gpu/drm/msm/dsi/dsi.c               |  3 ++-
>   drivers/gpu/drm/msm/dsi/dsi.h               |  3 ++-
>   drivers/gpu/drm/msm/dsi/dsi_host.c          | 14 ++++++++++++--
>   drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
>   7 files changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 758261e..7f4a439 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2,7 +2,7 @@
>   /*
>    * Copyright (C) 2013 Red Hat
>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    *
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -210,6 +210,7 @@ struct dpu_encoder_virt {
>   
>   	/* DSC configuration */
>   	struct drm_dsc_config *dsc;
> +	struct msm_compression_info *comp_info;
>   };
>   
>   #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -2275,7 +2276,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		dpu_enc->idle_pc_supported =
>   				dpu_kms->catalog->caps->has_idle_pc;
>   
> -	dpu_enc->dsc = disp_info->dsc;
> +	dpu_enc->comp_info = disp_info->comp_info;
> +	if (dpu_enc->comp_info)
> +		dpu_enc->dsc = &dpu_enc->comp_info->msm_dsc_info.drm_dsc;
>   
>   	mutex_lock(&dpu_enc->enc_lock);
>   	for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236e..bd2da5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -36,7 +36,7 @@ struct msm_display_info {
>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>   	bool is_cmd_mode;
>   	bool is_te_using_watchdog_timer;
> -	struct drm_dsc_config *dsc;
> +	struct msm_compression_info *comp_info;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d612419..70a74ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -2,7 +2,7 @@
>   /*
>    * Copyright (C) 2013 Red Hat
>    * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    *
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -570,7 +570,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>   		info.h_tile_instance[info.num_of_h_tiles++] = i;
>   		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>   
> -		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
> +		info.comp_info = msm_dsi_get_dsc_config(priv->dsi[i]);
>   
>   		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
>   			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
> @@ -622,6 +622,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>   		info.num_of_h_tiles = 1;
>   		info.h_tile_instance[0] = i;
>   		info.intf_type = encoder->encoder_type;
> +		info.is_cmd_mode = 0; /* dp always video mode */
> +		info.comp_info = NULL;
>   		rc = dpu_encoder_setup(dev, encoder, &info);
>   		if (rc) {
>   			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> @@ -892,6 +894,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>   
> +	for (i = 0; i < cat->dsc_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> +				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +

unrelated, isn't it?

>   	/* dump CTL sub-blocks HW regs info */
>   	for (i = 0; i < cat->ctl_count; i++)
>   		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 31fdee2..52b7e33 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #include "dsi.h"
> @@ -13,7 +14,7 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
>   	return !(host_flags & MIPI_DSI_MODE_VIDEO);
>   }
>   
> -struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
> +struct msm_compression_info *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>   {
>   	return msm_dsi_host_get_dsc_config(msm_dsi->host);
>   }
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bd3763a..79ada54 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #ifndef __DSI_CONNECTOR_H__
> @@ -133,7 +134,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>   int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>   void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>   void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
> -struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
> +struct msm_compression_info *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
>   
>   /* dsi phy */
>   struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 18fa30e..6188f4b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #include <linux/clk.h>
> @@ -163,6 +164,7 @@ struct msm_dsi_host {
>   
>   	struct drm_display_mode *mode;
>   	struct drm_dsc_config *dsc;
> +	struct msm_compression_info comp_info;
>   
>   	/* connected device info */
>   	unsigned int channel;
> @@ -2600,9 +2602,17 @@ void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
>   				DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
>   }
>   
> -struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host)
> +struct msm_compression_info *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host)
>   {
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	struct msm_compression_info *comp_info = NULL;
>   
> -	return msm_host->dsc;
> +	if (msm_host->dsc) {
> +		comp_info = &msm_host->comp_info;
> +		comp_info->msm_dsc_info.drm_dsc = *msm_host->dsc;
> +		comp_info->comp_type = MSM_DISPLAY_COMPRESSION_DSC;
> +		comp_info->enabled = true;
> +	}
> +
> +	return comp_info;
>   }
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6a46ed7..eab0901 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -430,7 +430,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
>   bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
>   bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
> -struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
> +struct msm_compression_info *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
>   #else
>   static inline void __init msm_dsi_register(void)
>   {
> @@ -460,7 +460,7 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
>   	return false;
>   }
>   
> -static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
> +static inline struct msm_compression_info *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>   {
>   	return NULL;
>   }

-- 
With best wishes
Dmitry

