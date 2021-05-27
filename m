Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4A39396B
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA56F518;
	Thu, 27 May 2021 23:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07DC6F517
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:49:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e17so2667557lfb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ux2RydXbcXokIY5aWyC6IrETHMo7qCP4nuwBOrvGpXA=;
 b=PHEnyetL0n6T/X5d1d6M5Jmj/EvYvNRd2+3dBjiZGQsznZJJK42cNxHaAdSiHDbTvc
 zo6MLDiKBeTK5m55XLoRm3pjJ2p0itTs53rhbu86n5A6olnoYgGop0eQXaxKyw8Rcf2k
 q8Vgvh/VFr+nFUrjT14j7o6ASHuUlocG7t1PTATVbiLeZBEE0kTS3h9MyOcgG+1L30/j
 WMpBqKdmm0+WT1ePeL/pdhBC1b59SCIK/tYckCNTlmPrsDwDK52dOgvPaaKtSsJpMeO/
 Cm/ZCt5vvP/lFrtrTnE9yBf27pDnkOIP7vJS4JScDTd9aig3QGBHJm8yPcxemv6DxOQ4
 NXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ux2RydXbcXokIY5aWyC6IrETHMo7qCP4nuwBOrvGpXA=;
 b=N4B6P3Jk/s0AaEMW/u+Gd7GXK2t0HTo78C65e6R7LaCKtQZQkUXisAoY7jg1CD22iF
 pGh9qaSNbr/GfId90NnJJtvozIhz7VC6kQWkYGbKfE+MsMz3new55ZsAKeDNExC7hP0D
 zWokMgMAqfkRf30HhR69hQFaTEWKvCN+cVv1VIVkCYyGO1O4Qe98oTguQWh6vws7FdaT
 isB0mbplHJXsPIh5XpVhcNYB6hWXiAwT/E+bUiwfM/vS4sprNkhxYZBpAnUv8rm7abZ4
 m44NiSq+QXcoqhHJNGA73UnHNZSIsL+CQO5Zvw/XQLQqzSxyv41YoRl+N7V+kT74kK2o
 uVRw==
X-Gm-Message-State: AOAM530eOGZoyf/KiCUTQy16TnjljcsliBRDUR1s2ENV2j0K0zeKwrGZ
 tg9UiX75DyXFVbtRZeznD+0aQQ==
X-Google-Smtp-Source: ABdhPJziK0c7YZ3yJPfBYYS+R1dZ0LzVhNRV5tB+09qiLvm9dz8UVdVSFIImj/2rYwR+FayZnFLUlw==
X-Received: by 2002:ac2:4e81:: with SMTP id o1mr3841919lfr.398.1622159396997; 
 Thu, 27 May 2021 16:49:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x12sm143918lfd.266.2021.05.27.16.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 16:49:56 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] drm/msm/disp/dpu1: Add support for DSC
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-4-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e92bbf19-21b0-9c6b-97fc-885ebc5cc913@linaro.org>
Date: Fri, 28 May 2021 02:49:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-4-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
> support by adding hw blocks for DSC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/Makefile                  |   1 +
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  26 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  79 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 ++
>   5 files changed, 340 insertions(+)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 610d630326bb..fd8fc57f1f58 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -61,6 +61,7 @@ msm-y := \
>   	disp/dpu1/dpu_hw_blk.o \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
> +	disp/dpu1/dpu_hw_dsc.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4dfd8a20ad5c..a699633f7013 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -165,6 +165,7 @@ enum {
>    * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> + * @DPU_PINGPONG_DSC        Display stream compression blocks

PP block supports DSC compression?

Also you don't seem to set it anywhere. Do we have hardware w/o DSC support?

>    * @DPU_PINGPONG_DITHER,    Dither blocks
>    * @DPU_PINGPONG_MAX
>    */
> @@ -173,10 +174,21 @@ enum {
>   	DPU_PINGPONG_TE2,
>   	DPU_PINGPONG_SPLIT,
>   	DPU_PINGPONG_SLAVE,
> +	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_DITHER,
>   	DPU_PINGPONG_MAX
>   };
>   
> +/**
> + * DSC sub-blocks
> + * @DPU_DSC		DSC sub block
> + * @DPU_DSC_MAX
> + */
> +enum {
> +	DPU_DSC = 0x1,
> +	DPU_DSC_MAX
> +};
> +

Unused

>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
> @@ -413,6 +425,7 @@ struct dpu_dspp_sub_blks {
>   struct dpu_pingpong_sub_blks {
>   	struct dpu_pp_blk te;
>   	struct dpu_pp_blk te2;
> +	struct dpu_pp_blk dsc;
>   	struct dpu_pp_blk dither;
>   };

Unused


>   
> @@ -547,6 +560,16 @@ struct dpu_merge_3d_cfg  {
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
> @@ -748,6 +771,9 @@ struct dpu_mdss_cfg {
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
> index 000000000000..8b8d0553709d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, Linaro Limited
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
> +			      struct msm_display_dsc_config *dsc,
> +			      u32 mode, bool ich_reset_override)
> +{
> +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> +	u32 data;
> +	u32 initial_lines = dsc->initial_lines;
> +	bool is_cmd_mode = !(mode & BIT(2));
> +
> +	DPU_REG_WRITE(c, DSC_COMMON_MODE, mode);
> +
> +	data = 0;
> +	if (ich_reset_override)
> +		data = 3 << 28;
> +
> +	if (is_cmd_mode)
> +		initial_lines += 1;
> +
> +	data |= (initial_lines << 20);
> +	data |= ((dsc->slice_last_group_size) << 18);
> +	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> +	data |= dsc->drm.bits_per_pixel << 12;
> +	data |= (dsc->drm.block_pred_enable << 7);
> +	data |= (dsc->drm.line_buf_depth << 3);
> +	data |= (dsc->drm.simple_422 << 2);
> +	data |= (dsc->drm.convert_rgb << 1);
> +	if (dsc->drm.bits_per_component  == 10)
> +		data |= BIT(0);
> +
> +	DPU_REG_WRITE(c, DSC_ENC, data);
> +
> +	data = dsc->drm.pic_width << 16;
> +	data |= dsc->drm.pic_height;
> +	DPU_REG_WRITE(c, DSC_PICTURE, data);
> +
> +	data = dsc->drm.slice_width << 16;
> +	data |= dsc->drm.slice_height;
> +	DPU_REG_WRITE(c, DSC_SLICE, data);
> +
> +	data = DIV_ROUND_UP(dsc->drm.slice_width * dsc->drm.bits_per_pixel, 8) << 16;
> +
> +	DPU_REG_WRITE(c, DSC_CHUNK_SIZE, data);
> +
> +	data = dsc->drm.initial_dec_delay << 16;
> +	data |= dsc->drm.initial_xmit_delay;
> +	DPU_REG_WRITE(c, DSC_DELAY, data);
> +
> +	data = dsc->drm.initial_scale_value;
> +	DPU_REG_WRITE(c, DSC_SCALE_INITIAL, data);
> +
> +	data = dsc->drm.scale_decrement_interval;
> +	DPU_REG_WRITE(c, DSC_SCALE_DEC_INTERVAL, data);
> +
> +	data = 0x00000184; /* only this value works */
> +	DPU_REG_WRITE(c, DSC_SCALE_INC_INTERVAL, data);
> +
> +	data = dsc->drm.first_line_bpg_offset;
> +	DPU_REG_WRITE(c, DSC_FIRST_LINE_BPG_OFFSET, data);
> +
> +	data = dsc->drm.nfl_bpg_offset << 16;
> +	data |= dsc->drm.slice_bpg_offset;
> +	DPU_REG_WRITE(c, DSC_BPG_OFFSET, data);
> +
> +	data = dsc->drm.initial_offset << 16;
> +	data |= dsc->drm.final_offset;
> +	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
> +
> +	data = dsc->det_thresh_flatness << 10;
> +	data |= dsc->drm.flatness_max_qp << 5;
> +	data |= dsc->drm.flatness_min_qp;
> +	DPU_REG_WRITE(c, DSC_FLATNESS, data);
> +
> +	data = dsc->drm.rc_model_size;
> +	DPU_REG_WRITE(c, DSC_RC_MODEL_SIZE, data);
> +
> +	data = dsc->drm.rc_tgt_offset_low << 18;
> +	data |= dsc->drm.rc_tgt_offset_high << 14;
> +	data |= dsc->drm.rc_quant_incr_limit1 << 9;
> +	data |= dsc->drm.rc_quant_incr_limit0 << 4;
> +	data |= dsc->drm.rc_edge_factor;
> +	DPU_REG_WRITE(c, DSC_RC, data);
> +}
> +
> +static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
> +				     struct msm_display_dsc_config *dsc)
> +{
> +	struct drm_dsc_rc_range_parameters *rc = dsc->drm.rc_range_params;
> +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> +	u32 off = 0x0;
> +	u16 *lp;
> +	int i;
> +
> +	lp = dsc->drm.rc_buf_thresh;
> +	off = DSC_RC_BUF_THRESH;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++) {
> +		DPU_REG_WRITE(c, off, *lp++);
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
> +static struct dpu_hw_blk_ops dpu_hw_ops = {
> +	.start = NULL,
> +	.stop = NULL,
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
> +	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSC, idx, &dpu_hw_ops);
> +
> +	return c;
> +}
> +
> +void dpu_hw_dsc_destroy(struct dpu_hw_dsc *dsc)
> +{
> +	if (dsc)
> +		dpu_hw_blk_destroy(&dsc->base);
> +	kfree(dsc);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> new file mode 100644
> index 000000000000..c680fd948865
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020, Linaro Limited */
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
> +	 * @ich_reset_override: option to reset ich
> +	 */
> +	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
> +			   struct msm_display_dsc_config *dsc,
> +			   u32 mode, bool ich_reset_override);
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
> index 09a3fb3e89f5..1b72c11090ee 100644
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
