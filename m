Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC93DE2D4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 01:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECBC6E0DC;
	Mon,  2 Aug 2021 23:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6C6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:04:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627945448; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=opVKkIAJJS/J48wxYW0/aHgRIL6lGhIXUhB0Lek55n4=;
 b=drg1nXYJ4IAjnTMrLq6f/FHHpZaB9Qi6viBkBgdCI7cWcG3R4gEhDRYaTQRQHyyCVmeaf2cX
 ORNi5b/C4JC04UMhnj8+pMg2uYs8mNZjKkZC9U0u9z8X1h9uEUiTEfZel4ptqpx2rR0CIDuW
 jyBsB3Rc5SLhS/cgvVrZanYPu8Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 610879e1e81205dd0a40e4e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Aug 2021 23:04:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DD2A9C4338A; Mon,  2 Aug 2021 23:04:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 41B3AC433F1;
 Mon,  2 Aug 2021 23:03:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 16:03:59 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 02/11] drm/msm/disp/dpu1: Add support for DSC
In-Reply-To: <20210715065203.709914-3-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-3-vkoul@kernel.org>
Message-ID: <e476e7b2e50ee3cb5f5c4e6c5d7e5ff0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-14 23:51, Vinod Koul wrote:
> Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
> support by adding hw blocks for DSC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since RFC:
>  - Drop unused enums
> 
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 ++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  77 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 ++
>  5 files changed, 325 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile 
> b/drivers/gpu/drm/msm/Makefile
> index 610d630326bb..fd8fc57f1f58 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -61,6 +61,7 @@ msm-y := \
>  	disp/dpu1/dpu_hw_blk.o \
>  	disp/dpu1/dpu_hw_catalog.o \
>  	disp/dpu1/dpu_hw_ctl.o \
> +	disp/dpu1/dpu_hw_dsc.o \
>  	disp/dpu1/dpu_hw_interrupts.o \
>  	disp/dpu1/dpu_hw_intf.o \
>  	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4dfd8a20ad5c..b8b4dc36880c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -547,6 +547,16 @@ struct dpu_merge_3d_cfg  {
>  	const struct dpu_merge_3d_sub_blks *sblk;
>  };
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
>  /**
>   * struct dpu_intf_cfg - information of timing engine blocks
>   * @id                 enum identifying this block
> @@ -748,6 +758,9 @@ struct dpu_mdss_cfg {
>  	u32 merge_3d_count;
>  	const struct dpu_merge_3d_cfg *merge_3d;
> 
> +	u32 dsc_count;
> +	struct dpu_dsc_cfg *dsc;
> +
>  	u32 intf_count;
>  	const struct dpu_intf_cfg *intf;
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> new file mode 100644
> index 000000000000..e27e67bd42e8
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, Linaro Limited
Copyright year needs an update : 2020-2021?
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
> +	bool is_cmd_mode = !(mode & BIT(2));
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
> +	u16 *lp;
> +	int i;
> +
> +	lp = dsc->drm->rc_buf_thresh;
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
> +static struct dpu_hw_blk_ops dpu_hw_ops = {
> +	.start = NULL,
> +	.stop = NULL,
> +};
> +
> +struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem 
> *addr,
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
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> new file mode 100644
> index 000000000000..0fb9ffe9f23f
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2020, Linaro Limited */

Copyright year needs an update : 2020-2021?
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
> + * struct dpu_hw_dsc_ops - interface to the dsc hardware driver 
> functions
> + * Assumption is these functions will be called after clocks are 
> enabled
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
> +struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem 
> *addr,
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
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 09a3fb3e89f5..1b72c11090ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -97,6 +97,7 @@ enum dpu_hw_blk_type {
>  	DPU_HW_BLK_WB,
>  	DPU_HW_BLK_DSPP,
>  	DPU_HW_BLK_MERGE_3D,
> +	DPU_HW_BLK_DSC,
>  	DPU_HW_BLK_MAX,
>  };
> 
> @@ -176,6 +177,17 @@ enum dpu_ctl {
>  	CTL_MAX
>  };
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
>  enum dpu_pingpong {
>  	PINGPONG_0 = 1,
>  	PINGPONG_1,
> @@ -437,5 +449,6 @@ struct dpu_mdss_color {
>  #define DPU_DBG_MASK_VBIF     (1 << 8)
>  #define DPU_DBG_MASK_ROT      (1 << 9)
>  #define DPU_DBG_MASK_DSPP     (1 << 10)
> +#define DPU_DBG_MASK_DSC      (1 << 11)
> 
>  #endif  /* _DPU_HW_MDSS_H */
