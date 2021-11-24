Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491A45C8D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2966E85B;
	Wed, 24 Nov 2021 15:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851206E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:35:14 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id r26so8265800lfn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 07:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zbKDQn0BRVB9cySqIX+pArLVJE9Jkf3fujVTM0Bb+Sc=;
 b=UlMmoYkkeFEZcIf9Tc8YPklNui3Iq080bM/z5UYETAdeO4i6z4Uy27WhS168IMuM59
 aS0ven+Nj9Z9m+FlMW/E+/YmBJBAfUO3oVBumSJpEkk7PLBEOA9wRj35gpnRUHQHlk4A
 tdFzaYUVgvkkEwxUUSzOAvfjxjPfQm8ueBrbQ3cF+KVyGy1N4iRFEo2jYo6Jxa/+EHkd
 iQaPQgVoqHwWemob9FNNGcEmJ5iyGw/iC3TaNnRSmKHI6g4dGdcR1qM632TB6j8kTJLd
 CUoycHaQrDmhbct7p/WhQqmSHpvQiKF3cfmPnX3IJEqS+jtxg46fPh22SwdP58YhuGkb
 hf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zbKDQn0BRVB9cySqIX+pArLVJE9Jkf3fujVTM0Bb+Sc=;
 b=llJ0ohS3O9lFOUi8klVsoY8qs/hoKRkAquLDUwDrHQ2OuROx7+sW/LtuReQt57eqxR
 ASeYEX1TYBmvm8mN9YURgJ0gYB3/m5Ynxqry0eBQq+yYB1pLtQuG55q7ShOkHbvOlJvv
 BKwjY8R84tG5r89A6ffAynpEDkBIu/kUvolUJV8WvGwZrv8FJP0j5o5ga40Oo8fZCwUK
 x4R+UrCkUDEDYnWZbQgeVTZCVMEtpkf9kqiG6CMFY2ZGyZAPhv8mEOQ0dR3GAvy+nv6p
 4Mx1JgW3KF8/fZax70JJSWdbFdOqN6tVNX3R9UPjtDoPs/To8be5Ud1X+fRJFLvqeEqz
 WqOw==
X-Gm-Message-State: AOAM533YxVPib+BfSr+9m2evltK6I37i6qyZ1Di2zg2cHB6cacKfSo8q
 fzVmRAGD+1P/bZjJ7X6hfzr7Xw==
X-Google-Smtp-Source: ABdhPJy4vypM/CHo+5QhJfFsGt3MFgFEuRII6ii4HTyz1HQEuq6kpBMeOUtbncPfeeFR33fPNlUQVQ==
X-Received: by 2002:a05:6512:2101:: with SMTP id
 q1mr15451619lfr.663.1637768112578; 
 Wed, 24 Nov 2021 07:35:12 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i24sm19672ljm.135.2021.11.24.07.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 07:35:11 -0800 (PST)
Subject: Re: [PATCH v3 02/13] drm/msm/disp/dpu1: Add support for DSC
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-3-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f61df956-15a2-aacd-4ddd-18f27d86e89a@linaro.org>
Date: Wed, 24 Nov 2021 18:35:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-3-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/11/2021 09:22, Vinod Koul wrote:
> Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
> support by adding hw blocks for DSC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Makefile                  |   1 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 210 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  77 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 ++
>   5 files changed, 314 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 40577f8856d8..7d7058f1f5c1 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -59,6 +59,7 @@ msm-y := \
>   	disp/dpu1/dpu_formats.o \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
> +	disp/dpu1/dpu_hw_dsc.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4ade44bbd37e..65f43fadcda0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -553,6 +553,16 @@ struct dpu_merge_3d_cfg  {
>   	const struct dpu_merge_3d_sub_blks *sblk;
>   };
>   
> +/**
> + * struct dpu_dsc_cfg - information of DSC blocks
> + * @id                 enum identifying this block
> + * @base               register offset of this block
> + * @features           bit mask identifying sub-blocks/features
> + */
> +struct dpu_dsc_cfg {
> +	DPU_HW_BLK_INFO;
> +};
> +
>   /**
>    * struct dpu_intf_cfg - information of timing engine blocks
>    * @id                 enum identifying this block
> @@ -749,6 +759,9 @@ struct dpu_mdss_cfg {
>   	u32 merge_3d_count;
>   	const struct dpu_merge_3d_cfg *merge_3d;
>   
> +	u32 dsc_count;
> +	struct dpu_dsc_cfg *dsc;
> +
>   	u32 intf_count;
>   	const struct dpu_intf_cfg *intf;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> new file mode 100644
> index 000000000000..449d6f1dad28
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, Linaro Limited
> + */
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
> +#define DSC_COMMON_MODE	                0x000
> +#define DSC_ENC                         0X004
> +#define DSC_PICTURE                     0x008
> +#define DSC_SLICE                       0x00C
> +#define DSC_CHUNK_SIZE                  0x010
> +#define DSC_DELAY                       0x014
> +#define DSC_SCALE_INITIAL               0x018
> +#define DSC_SCALE_DEC_INTERVAL          0x01C
> +#define DSC_SCALE_INC_INTERVAL          0x020
> +#define DSC_FIRST_LINE_BPG_OFFSET       0x024
> +#define DSC_BPG_OFFSET                  0x028
> +#define DSC_DSC_OFFSET                  0x02C
> +#define DSC_FLATNESS                    0x030
> +#define DSC_RC_MODEL_SIZE               0x034
> +#define DSC_RC                          0x038
> +#define DSC_RC_BUF_THRESH               0x03C
> +#define DSC_RANGE_MIN_QP                0x074
> +#define DSC_RANGE_MAX_QP                0x0B0
> +#define DSC_RANGE_BPG_OFFSET            0x0EC
> +
> +static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *c = &dsc->hw;
> +
> +	DPU_REG_WRITE(c, DSC_COMMON_MODE, 0);
> +}
> +
> +static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
> +			      struct msm_display_dsc_config *dsc, u32 mode)
> +{
> +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> +	u32 data, lsb, bpp;
> +	u32 initial_lines = dsc->initial_lines;
> +	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
> +
> +	DPU_REG_WRITE(c, DSC_COMMON_MODE, mode);
> +
> +	if (is_cmd_mode)
> +		initial_lines += 1;
> +
> +	data = (initial_lines << 20);
> +	data |= ((dsc->slice_last_group_size - 1) << 18);
> +	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> +	data |= dsc->drm->bits_per_pixel << 12;
> +	lsb = dsc->drm->bits_per_pixel % 4;
> +	bpp = dsc->drm->bits_per_pixel / 4;
> +	bpp *= 4;
> +	bpp <<= 4;
> +	bpp |= lsb;
> +
> +	data |= bpp << 8;
> +	data |= (dsc->drm->block_pred_enable << 7);
> +	data |= (dsc->drm->line_buf_depth << 3);
> +	data |= (dsc->drm->simple_422 << 2);
> +	data |= (dsc->drm->convert_rgb << 1);
> +	data |= dsc->drm->bits_per_component;
> +
> +	DPU_REG_WRITE(c, DSC_ENC, data);
> +
> +	data = dsc->drm->pic_width << 16;
> +	data |= dsc->drm->pic_height;
> +	DPU_REG_WRITE(c, DSC_PICTURE, data);
> +
> +	data = dsc->drm->slice_width << 16;
> +	data |= dsc->drm->slice_height;
> +	DPU_REG_WRITE(c, DSC_SLICE, data);
> +
> +	data = dsc->drm->slice_chunk_size << 16;
> +	DPU_REG_WRITE(c, DSC_CHUNK_SIZE, data);
> +
> +	data = dsc->drm->initial_dec_delay << 16;
> +	data |= dsc->drm->initial_xmit_delay;
> +	DPU_REG_WRITE(c, DSC_DELAY, data);
> +
> +	data = dsc->drm->initial_scale_value;
> +	DPU_REG_WRITE(c, DSC_SCALE_INITIAL, data);
> +
> +	data = dsc->drm->scale_decrement_interval;
> +	DPU_REG_WRITE(c, DSC_SCALE_DEC_INTERVAL, data);
> +
> +	data = dsc->drm->scale_increment_interval;
> +	DPU_REG_WRITE(c, DSC_SCALE_INC_INTERVAL, data);
> +
> +	data = dsc->drm->first_line_bpg_offset;
> +	DPU_REG_WRITE(c, DSC_FIRST_LINE_BPG_OFFSET, data);
> +
> +	data = dsc->drm->nfl_bpg_offset << 16;
> +	data |= dsc->drm->slice_bpg_offset;
> +	DPU_REG_WRITE(c, DSC_BPG_OFFSET, data);
> +
> +	data = dsc->drm->initial_offset << 16;
> +	data |= dsc->drm->final_offset;
> +	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
> +
> +	data = dsc->det_thresh_flatness << 10;
> +	data |= dsc->drm->flatness_max_qp << 5;
> +	data |= dsc->drm->flatness_min_qp;
> +	DPU_REG_WRITE(c, DSC_FLATNESS, data);
> +
> +	data = dsc->drm->rc_model_size;
> +	DPU_REG_WRITE(c, DSC_RC_MODEL_SIZE, data);
> +
> +	data = dsc->drm->rc_tgt_offset_low << 18;
> +	data |= dsc->drm->rc_tgt_offset_high << 14;
> +	data |= dsc->drm->rc_quant_incr_limit1 << 9;
> +	data |= dsc->drm->rc_quant_incr_limit0 << 4;
> +	data |= dsc->drm->rc_edge_factor;
> +	DPU_REG_WRITE(c, DSC_RC, data);
> +}
> +
> +static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
> +				     struct msm_display_dsc_config *dsc)
> +{
> +	struct drm_dsc_rc_range_parameters *rc = dsc->drm->rc_range_params;
> +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> +	u32 off;
> +	int i;
> +
> +	off = DSC_RC_BUF_THRESH;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++) {
> +		DPU_REG_WRITE(c, off, dsc->drm->rc_buf_thresh[i]);
> +		off += 4;
> +	}
> +
> +	off = DSC_RANGE_MIN_QP;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		DPU_REG_WRITE(c, off, rc[i].range_min_qp);
> +		off += 4;
> +	}
> +
> +	off = DSC_RANGE_MAX_QP;
> +	for (i = 0; i < 15; i++) {
> +		DPU_REG_WRITE(c, off, rc[i].range_max_qp);
> +		off += 4;
> +	}
> +
> +	off = DSC_RANGE_BPG_OFFSET;
> +	for (i = 0; i < 15; i++) {
> +		DPU_REG_WRITE(c, off, rc[i].range_bpg_offset);
> +		off += 4;
> +	}
> +}
> +
> +static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
> +				       struct dpu_mdss_cfg *m,
> +				       void __iomem *addr,
> +				       struct dpu_hw_blk_reg_map *b)
> +{
> +	int i;
> +
> +	for (i = 0; i < m->dsc_count; i++) {
> +		if (dsc == m->dsc[i].id) {
> +			b->base_off = addr;
> +			b->blk_off = m->dsc[i].base;
> +			b->length = m->dsc[i].len;
> +			b->hwversion = m->hwversion;
> +			b->log_mask = DPU_DBG_MASK_DSC;
> +			return &m->dsc[i];
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
> +			   unsigned long cap)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable;
> +	ops->dsc_config = dpu_hw_dsc_config;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
> +};
> +
> +struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
> +				   struct dpu_mdss_cfg *m)
> +{
> +	struct dpu_hw_dsc *c;
> +	struct dpu_dsc_cfg *cfg;
> +
> +	c = kzalloc(sizeof(*c), GFP_KERNEL);
> +	if (!c)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cfg = _dsc_offset(idx, m, addr, &c->hw);
> +	if (IS_ERR_OR_NULL(cfg)) {
> +		kfree(c);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	c->idx = idx;
> +	c->caps = cfg;
> +	_setup_dsc_ops(&c->ops, c->caps->features);
> +
> +	return c;
> +}
> +
> +void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc)
> +{
> +	kfree(dsc);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> new file mode 100644
> index 000000000000..648c9e4d8749
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020-2021, Linaro Limited */
> +
> +#ifndef _DPU_HW_DSC_H
> +#define _DPU_HW_DSC_H
> +
> +#include <drm/drm_dsc.h>
> +
> +#define DSC_MODE_SPLIT_PANEL            BIT(0)
> +#define DSC_MODE_MULTIPLEX              BIT(1)
> +#define DSC_MODE_VIDEO                  BIT(2)
> +
> +struct dpu_hw_dsc;
> +
> +/**
> + * struct dpu_hw_dsc_ops - interface to the dsc hardware driver functions
> + * Assumption is these functions will be called after clocks are enabled
> + */
> +struct dpu_hw_dsc_ops {
> +	/**
> +	 * dsc_disable - disable dsc
> +	 * @hw_dsc: Pointer to dsc context
> +	 */
> +	void (*dsc_disable)(struct dpu_hw_dsc *hw_dsc);
> +
> +	/**
> +	 * dsc_config - configures dsc encoder
> +	 * @hw_dsc: Pointer to dsc context
> +	 * @dsc: panel dsc parameters
> +	 * @mode: dsc topology mode to be set
> +	 */
> +	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
> +			   struct msm_display_dsc_config *dsc, u32 mode);
> +
> +	/**
> +	 * dsc_config_thresh - programs panel thresholds
> +	 * @hw_dsc: Pointer to dsc context
> +	 * @dsc: panel dsc parameters
> +	 */
> +	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
> +				  struct msm_display_dsc_config *dsc);
> +};
> +
> +struct dpu_hw_dsc {
> +	struct dpu_hw_blk base;
> +	struct dpu_hw_blk_reg_map hw;
> +
> +	/* dsc */
> +	enum dpu_dsc idx;
> +	const struct dpu_dsc_cfg *caps;
> +
> +	/* ops */
> +	struct dpu_hw_dsc_ops ops;
> +};
> +
> +/**
> + * dpu_hw_dsc_init - initializes the dsc block for the passed dsc idx.
> + * @idx:  DSC index for which driver object is required
> + * @addr: Mapped register io address of MDP
> + * @m:    Pointer to mdss catalog data
> + * Returns: Error code or allocated dpu_hw_dsc context
> + */
> +struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
> +				   struct dpu_mdss_cfg *m);
> +
> +/**
> + * dpu_hw_dsc_destroy - destroys dsc driver context
> + * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
> + */
> +void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc);
> +
> +static inline struct dpu_hw_dsc *to_dpu_hw_dsc(struct dpu_hw_blk *hw)
> +{
> +	return container_of(hw, struct dpu_hw_dsc, base);
> +}
> +
> +#endif /* _DPU_HW_DSC_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index bb9ceadeb0bb..b0ce8cb97d22 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -97,6 +97,7 @@ enum dpu_hw_blk_type {
>   	DPU_HW_BLK_WB,
>   	DPU_HW_BLK_DSPP,
>   	DPU_HW_BLK_MERGE_3D,
> +	DPU_HW_BLK_DSC,
>   	DPU_HW_BLK_MAX,
>   };
>   
> @@ -176,6 +177,17 @@ enum dpu_ctl {
>   	CTL_MAX
>   };
>   
> +enum dpu_dsc {
> +	DSC_NONE = 0,
> +	DSC_0,
> +	DSC_1,
> +	DSC_2,
> +	DSC_3,
> +	DSC_4,
> +	DSC_5,
> +	DSC_MAX
> +};
> +
>   enum dpu_pingpong {
>   	PINGPONG_0 = 1,
>   	PINGPONG_1,
> @@ -437,5 +449,6 @@ struct dpu_mdss_color {
>   #define DPU_DBG_MASK_VBIF     (1 << 8)
>   #define DPU_DBG_MASK_ROT      (1 << 9)
>   #define DPU_DBG_MASK_DSPP     (1 << 10)
> +#define DPU_DBG_MASK_DSC      (1 << 11)
>   
>   #endif  /* _DPU_HW_MDSS_H */
> 


-- 
With best wishes
Dmitry
