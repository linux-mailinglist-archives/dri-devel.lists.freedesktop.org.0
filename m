Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678BE4AA49C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 00:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697A510E84A;
	Fri,  4 Feb 2022 23:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B90D10E816
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 23:46:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z4so756212lfg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LPIk3bKZY4DHi29fkXVPRqQbab8AFyrXg2lmlib29eg=;
 b=mhvHcOPwrLwzLpQ7L6ZK0yN9SuxWm83qCm2WqNVcjkBLv1E9QoR5YwbOjfAyMpc0KK
 b4lr0Fw6n/dm3/RLqapz9QcNoP0jgsOcvvR/nXPWnsZFIx3D3e04Ab7ooL8oz3Kh3KSb
 fDas4X8l339egRd6Mvqa1YIcHs9FSYLPFLdivHNFSAWgvZXlGXgJhaNDwyYmANUjBz7x
 WcJ8BXf7tDejyDmcfumi0a9QsjX0zWpwGdGl4ilAUtEQaxbjpzsPHz6Dz5TF9sj3keqr
 kddv5IvZJ1R9ctjXf5tH+3HmF+PuT88KiDbCskdFFWEcy7lp6yDZOwraMtjzdJYKA5S1
 60CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LPIk3bKZY4DHi29fkXVPRqQbab8AFyrXg2lmlib29eg=;
 b=EA3LgwZO/W05q1KR0+nTlSyW2aMz+pOp7enTI+88ODYleHfuQiqky1scllZicsOjNP
 8KgGVeSBNWYirJSjKb5Uy5fK6APj/xO1xpE3TAPEVN6vK7+3VAlpct5V4k9VONJZfGV7
 Z541hy2jdl/aLnarunVc1WlH3nVTGmJG7aLc2kusBhjPKUg4agiMMaHEgIf2H+5j1j2P
 FX35BZE2YO8VLIZGwFQdLCHC6rsv/2XCiy2j7fWoRs2tOtE1p5cIFAnC/84uDlM8eyEq
 QORYmB8UdGmpBUxP7hZ8KTEYpv+kz6oNQx6eJEah69A+1bvSRHchVpoSHDMpKQro4Pxq
 fD4g==
X-Gm-Message-State: AOAM530SIm6AfswVbygQUMfAx8IU4XtQvOGTEmMaHTc+WLdxAa8sdzLJ
 wPH6nH3g5hh7n3637JPhHf/YXg==
X-Google-Smtp-Source: ABdhPJy5Bp8XmhC6wZ2zz7XKyo6dA8YHE5FV0y0Wt06qB6rV9oCIqhViLpOIDNfzZROt954c4wsf2g==
X-Received: by 2002:a19:7716:: with SMTP id s22mr931482lfc.556.1644018393462; 
 Fri, 04 Feb 2022 15:46:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j17sm494365lfg.173.2022.02.04.15.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 15:46:33 -0800 (PST)
Message-ID: <419b352f-6a90-f4fc-6f86-cb8629e915a2@linaro.org>
Date: Sat, 5 Feb 2022 02:46:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/12] drm/msm/dpu: add an API to reset the encoder
 related hw blocks
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-6-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644009445-17320-6-git-send-email-quic_abhinavk@quicinc.com>
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
> Add an API to reset the encoder related hw blocks to ensure
> a proper teardown of the pipeline. At the moment this is being
> used only for the writeback encoder but eventually we can start
> using this for all interfaces.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 92 ++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 10 +++
>   2 files changed, 102 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..e977c05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
> @@ -21,6 +22,7 @@
>   #include "dpu_hw_intf.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_dspp.h"
> +#include "dpu_hw_merge3d.h"
>   #include "dpu_formats.h"
>   #include "dpu_encoder_phys.h"
>   #include "dpu_crtc.h"
> @@ -1813,6 +1815,96 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>   	DPU_ATRACE_END("encoder_kickoff");
>   }
>   
> +static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_hw_mixer_cfg mixer;
> +	int i, num_lm;
> +	u32 flush_mask = 0;
> +	struct dpu_global_state *global_state;
> +	struct dpu_hw_blk *hw_lm[2];
> +	struct dpu_hw_mixer *hw_mixer[2];
> +	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
> +
> +	memset(&mixer, 0, sizeof(mixer));
> +
> +	/* reset all mixers for this encoder */
> +	if (phys_enc->hw_ctl->ops.clear_all_blendstages)
> +		phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
> +
> +	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
> +
> +	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
> +		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +
> +	for (i = 0; i < num_lm; i++) {
> +		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
> +		flush_mask = phys_enc->hw_ctl->ops.get_bitmask_mixer(ctl, hw_mixer[i]->idx);
> +		if (phys_enc->hw_ctl->ops.update_pending_flush)
> +			phys_enc->hw_ctl->ops.update_pending_flush(ctl, flush_mask);
> +
> +		/* clear all blendstages */
> +		if (phys_enc->hw_ctl->ops.setup_blendstage)
> +			phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
> +	}
> +}
> +
> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
> +	struct dpu_hw_intf_cfg intf_cfg = { 0 };
> +	int i;
> +	struct dpu_encoder_virt *dpu_enc;
> +
> +	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
> +
> +	phys_enc->hw_ctl->ops.reset(ctl);
> +
> +	dpu_encoder_helper_reset_mixers(phys_enc);
> +
> +	if (phys_enc->hw_wb) {
> +		/* disable the PP block */
> +		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
> +			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
> +					phys_enc->hw_pp->idx);
> +
> +		/* mark WB flush as pending */
> +		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
> +			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
> +	} else {
> +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> +				phys_enc->hw_intf->ops.bind_pingpong_blk(
> +						dpu_enc->phys_encs[i]->hw_intf, false,
> +						dpu_enc->phys_encs[i]->hw_pp->idx);
> +			/* mark INTF flush as pending */
> +			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> +				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> +						dpu_enc->phys_encs[i]->hw_intf->idx);
> +		}
> +	}
> +
> +	/* reset the merge 3D HW block */
> +	if (phys_enc->hw_pp->merge_3d) {
> +		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
> +				BLEND_3D_NONE);
> +		if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
> +			phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
> +					phys_enc->hw_pp->merge_3d->idx);
> +	}
> +
> +	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
> +	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	if (phys_enc->hw_pp->merge_3d)
> +		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
> +
> +	if (ctl->ops.reset_intf_cfg)
> +		ctl->ops.reset_intf_cfg(ctl, &intf_cfg, true);
> +
> +	ctl->ops.trigger_flush(ctl);
> +	ctl->ops.trigger_start(ctl);
> +	ctl->ops.clear_pending_flush(ctl);
> +}
> +
>   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb..07c3525 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>    */
>   
> @@ -10,6 +11,7 @@
>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_intf.h"
> +#include "dpu_hw_wb.h"
>   #include "dpu_hw_pingpong.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_top.h"
> @@ -189,6 +191,7 @@ struct dpu_encoder_irq {
>    * @hw_ctl:		Hardware interface to the ctl registers
>    * @hw_pp:		Hardware interface to the ping pong registers
>    * @hw_intf:		Hardware interface to the intf registers
> + * @hw_wb:             Hardware interface to the wb registers
>    * @dpu_kms:		Pointer to the dpu_kms top level
>    * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
>    * @enabled:		Whether the encoder has enabled and running a mode
> @@ -218,6 +221,7 @@ struct dpu_encoder_phys {
>   	struct dpu_hw_ctl *hw_ctl;
>   	struct dpu_hw_pingpong *hw_pp;
>   	struct dpu_hw_intf *hw_intf;
> +	struct dpu_hw_wb *hw_wb;

I'd sugges to add the reset function without the HW_WB and add HW_WB 
support here in the next patch (drm/msm/dpu: make changes to dpu_encoder 
to support virtual encoder).

>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode cached_mode;
>   	enum dpu_enc_split_role split_role;
> @@ -382,4 +386,10 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
>   int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>   		enum dpu_intr_idx intr_idx);
>   
> +/**
> + * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
> +
>   #endif /* __dpu_encoder_phys_H__ */


-- 
With best wishes
Dmitry
