Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8C6EA054
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D208D10ED5A;
	Thu, 20 Apr 2023 23:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341EC10ED5C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 23:54:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec816c9d03so1034971e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682034896; x=1684626896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TNLznv1SWR+0m28rKCIM5ne1ihIYHKGj73ZNdLeFx28=;
 b=zOuOKvWg7F9arqrFMwa/eI5GvhVmcVK2EeXNI4lT1TudYYVofnkM7nwNT2hTGK0leU
 Bb0IILSyJNBTcZIwpqPApO9DALlzzZFm7MdkbalJMBE+fAmivwM0+zf2T+IAbepQMt2A
 3M2AngYSi8zsD9tamX3ExYVoB+zXH+jhoi82efQ7ji/M9seO/5lvlx6sYvBNaOHKj2CG
 Ns/a0nA3epec/OEivm7+2mTQ89Hl+9K6Fi3jL/wfg91ben9UowJ1BwpgwIVDmBO9sJOr
 WmLPspoibbQropmg72h/fYgpg8uTfifdWuB307Ys/mlUX8LaXyYZbz1eFqJruY5aaLWI
 N5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682034896; x=1684626896;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TNLznv1SWR+0m28rKCIM5ne1ihIYHKGj73ZNdLeFx28=;
 b=aHly6OtzqeF7Hsp02HRbECm+GZ9hNML04ZyKKFax7Q0YUYKQk3MZt/BLbwWDcWLaNJ
 xz6dt/bg0rx9GDEda0sIwqIgD5x7QTnlDzEbK0E6XYJzDEX8FtmJsBK9jaHSO/pN6pzp
 M//Xo+uzhpaB4FU04Xs2Ah5mgtAddpXE0XWCkZlkr9p7Gept4I4RFl4+P2tPvFKdmuSg
 A8/kF3kiVd1au2OtOiV0VIlUxUjFV/QSHsvefaszkCjLzJniaU5KHMs1uHRO9XHCWugL
 Vmvt1zhhY/snGK0XvSTh4SKeaCKWMDGOm52B7NKiZvcVPODTq05H9114cGShaoISfTyR
 ry+Q==
X-Gm-Message-State: AAQBX9cAtxZNGnCBQsl/t5XjiWoNk4fBN/BXLdh/SIrk+A09B3S0kvaX
 YVzERvsoAhUwpSr5JtiQudd5qw==
X-Google-Smtp-Source: AKy350YFUqFvFjkgjIBYnjA4L18VBQSw+LCshqVid+IuKob6UMf2Yncpr99uZ1rj3GIBZ+O0vxz2Tw==
X-Received: by 2002:a05:6512:63:b0:4e9:d53b:337e with SMTP id
 i3-20020a056512006300b004e9d53b337emr743796lfo.45.1682034896081; 
 Thu, 20 Apr 2023 16:54:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o14-20020ac2494e000000b004efae490c51sm22947lfi.240.2023.04.20.16.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 16:54:55 -0700 (PDT)
Message-ID: <5a9ae243-47ce-9238-8e2d-4942054e8a13@linaro.org>
Date: Fri, 21 Apr 2023 02:54:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/5] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> Add support for DSC 1.2 by providing the necessary hooks to program
> the DPU DSC 1.2 encoder.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile                   |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  38 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  17 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 388 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>   5 files changed, 444 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b814fc8..b9af5e4 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>   	disp/dpu1/dpu_hw_catalog.o \
>   	disp/dpu1/dpu_hw_ctl.o \
>   	disp/dpu1/dpu_hw_dsc.o \
> +	disp/dpu1/dpu_hw_dsc_1_2.o \
>   	disp/dpu1/dpu_hw_interrupts.o \
>   	disp/dpu1/dpu_hw_intf.o \
>   	disp/dpu1/dpu_hw_lm.o \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd..22421b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>    * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>    */
>   
> @@ -241,12 +241,20 @@ enum {
>   };
>   
>   /**
> - * DSC features
> - * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
> - *                            the pixel output from this DSC.
> + * DSC sub-blocks/features
> + * @DPU_DSC_OUTPUT_CTRL         Configure which PINGPONG block gets
> + *                              the pixel output from this DSC.

Any reason to change the alignment

> + * @DPU_DSC_HW_REV_1_1          DSC block supports dsc 1.1 only
> + * @DPU_DSC_HW_REV_1_2          DSC block supports dsc 1.1 and 1.2
> + * @DPU_DSC_NATIVE_422_EN       Supports native422 and native420 encoding
> + * @DPU_DSC_MAX
>    */
>   enum {
>   	DPU_DSC_OUTPUT_CTRL = 0x1,
> +	DPU_DSC_HW_REV_1_1,
> +	DPU_DSC_HW_REV_1_2,
> +	DPU_DSC_NATIVE_422_EN,
> +	DPU_DSC_MAX
>   };
>   
>   /**
> @@ -311,6 +319,14 @@ struct dpu_pp_blk {
>   };
>   
>   /**
> + * struct dpu_dsc_blk - DSC Encoder sub-blk information
> + * @info:   HW register and features supported by this sub-blk
> + */
> +struct dpu_dsc_blk {
> +	DPU_HW_SUBBLK_INFO;
> +};
> +
> +/**
>    * enum dpu_qos_lut_usage - define QoS LUT use cases
>    */
>   enum dpu_qos_lut_usage {
> @@ -459,6 +475,17 @@ struct dpu_pingpong_sub_blks {
>   };
>   
>   /**
> + * struct dpu_dsc_sub_blks - DSC sub-blks
> + * @enc: DSC encoder sub block
> + * @ctl: DSC controller sub block
> + *
> + */
> +struct dpu_dsc_sub_blks {
> +	struct dpu_dsc_blk enc;
> +	struct dpu_dsc_blk ctl;
> +};
> +
> +/**
>    * dpu_clk_ctrl_type - Defines top level clock control signals
>    */
>   enum dpu_clk_ctrl_type {
> @@ -612,10 +639,13 @@ struct dpu_merge_3d_cfg  {
>    * struct dpu_dsc_cfg - information of DSC blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> + * @len:               length of hardware block
>    * @features           bit mask identifying sub-blocks/features
> + * @sblk               sub-blocks information
>    */
>   struct dpu_dsc_cfg {
>   	DPU_HW_BLK_INFO;
> +	const struct dpu_dsc_sub_blks *sblk;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index ae9b5db..d0f8b8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -1,5 +1,8 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2020-2022, Linaro Limited */
> +/*
> + * Copyright (c) 2020-2022, Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
>   
>   #ifndef _DPU_HW_DSC_H
>   #define _DPU_HW_DSC_H
> @@ -61,7 +64,7 @@ struct dpu_hw_dsc {
>   };
>   
>   /**
> - * dpu_hw_dsc_init - initializes the dsc block for the passed dsc idx.
> + * dpu_hw_dsc_init - initializes the v1.1 dsc block for the passed dsc idx.
>    * @idx:  DSC index for which driver object is required
>    * @addr: Mapped register io address of MDP
>    * @m:    Pointer to mdss catalog data
> @@ -71,6 +74,16 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>   				   const struct dpu_mdss_cfg *m);
>   
>   /**
> + * dpu_hw_dsc_init_1_2 - initializes the v1.2 dsc block for the passed dsc idx.
> + * @idx:  DSC index for which driver object is required
> + * @addr: Mapped register io address of MDP
> + * @m:    Pointer to mdss catalog data
> + * Returns: Error code or allocated dpu_hw_dsc context
> + */
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(enum dpu_dsc idx, void __iomem *addr,
> +				   const struct dpu_mdss_cfg *m);
> +
> +/**
>    * dpu_hw_dsc_destroy - destroys dsc driver context
>    * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>    */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> new file mode 100644
> index 00000000..455d7f2
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + */
> +
> +#include <drm/display/drm_dsc_helper.h>
> +
> +#include "dpu_kms.h"
> +#include "dpu_hw_catalog.h"
> +#include "dpu_hwio.h"
> +#include "dpu_hw_mdss.h"
> +#include "dpu_hw_dsc.h"
> +
> +
> +#define DSC_CMN_MAIN_CNF           0x00
> +
> +/* DPU_DSC_ENC register offsets */
> +#define ENC_DF_CTRL                0x00
> +#define ENC_GENERAL_STATUS         0x04
> +#define ENC_HSLICE_STATUS          0x08
> +#define ENC_OUT_STATUS             0x0C
> +#define ENC_INT_STAT               0x10
> +#define ENC_INT_CLR                0x14
> +#define ENC_INT_MASK               0x18
> +#define DSC_MAIN_CONF              0x30
> +#define DSC_PICTURE_SIZE           0x34
> +#define DSC_SLICE_SIZE             0x38
> +#define DSC_MISC_SIZE              0x3C
> +#define DSC_HRD_DELAYS             0x40
> +#define DSC_RC_SCALE               0x44
> +#define DSC_RC_SCALE_INC_DEC       0x48
> +#define DSC_RC_OFFSETS_1           0x4C
> +#define DSC_RC_OFFSETS_2           0x50
> +#define DSC_RC_OFFSETS_3           0x54
> +#define DSC_RC_OFFSETS_4           0x58
> +#define DSC_FLATNESS_QP            0x5C
> +#define DSC_RC_MODEL_SIZE          0x60
> +#define DSC_RC_CONFIG              0x64
> +#define DSC_RC_BUF_THRESH_0        0x68
> +#define DSC_RC_BUF_THRESH_1        0x6C
> +#define DSC_RC_BUF_THRESH_2        0x70
> +#define DSC_RC_BUF_THRESH_3        0x74
> +#define DSC_RC_MIN_QP_0            0x78
> +#define DSC_RC_MIN_QP_1            0x7C
> +#define DSC_RC_MIN_QP_2            0x80
> +#define DSC_RC_MAX_QP_0            0x84
> +#define DSC_RC_MAX_QP_1            0x88
> +#define DSC_RC_MAX_QP_2             0x8C

As you are adding new definitions, could please make them aligned from 
the beginning?

> +#define DSC_RC_RANGE_BPG_OFFSETS_0  0x90
> +#define DSC_RC_RANGE_BPG_OFFSETS_1  0x94
> +#define DSC_RC_RANGE_BPG_OFFSETS_2  0x98
> +
> +/* DPU_DSC_CTL register offsets */
> +#define DSC_CTL                    0x00
> +#define DSC_CFG                    0x04
> +#define DSC_DATA_IN_SWAP           0x08
> +#define DSC_CLK_CTRL               0x0C
> +
> +/*
> + * @DPU_DSC_ENC                 DSC encoder sub block
> + * @DPU_DSC_CTL                 DSC controller sub block
> + */
> +enum {
> +	DPU_DSC_ENC,
> +	DPU_DSC_CTL,
> +};
> +
> +static int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)

If this is used from a single place, please inline this function.

> +{
> +	int max_addr = 2400 / num_ss;
> +
> +	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))
> +		max_addr /= 2;

Is this really guarded by the hw block feature or by native_422 being 
enabled?

> +
> +	return max_addr - 1;
> +};
> +
>

[skipped]

> +static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
> +					struct drm_dsc_config *dsc)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	u32 offset, off;
> +	int i, j = 0;
> +	struct drm_dsc_rc_range_parameters *rc;
> +	u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
> +
> +	if (!hw_dsc || !dsc)
> +		return;
> +
> +	_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
> +
> +	hw = &hw_dsc->hw;
> +
> +	rc = dsc->rc_range_params;
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> +		data |= dsc->rc_buf_thresh[i] << (8 * j);
> +		j++;
> +		if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
> +			DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0 + off,
> +					data);
> +			off += 4;
> +			j = 0;
> +			data = 0;
> +		}
> +	}
> +
> +	off = 0;
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		min_qp |= rc[i].range_min_qp << (5 * j);
> +		max_qp |= rc[i].range_max_qp << (5 * j);
> +		bpg_off |= rc[i].range_bpg_offset << (6 * j);
> +		j++;
> +		if (j == 5) {
> +			DPU_REG_WRITE(hw, offset + DSC_RC_MIN_QP_0 + off,
> +					min_qp);
> +			DPU_REG_WRITE(hw, offset + DSC_RC_MAX_QP_0 + off,
> +					max_qp);
> +			DPU_REG_WRITE(hw,
> +					offset + DSC_RC_RANGE_BPG_OFFSETS_0 + off,
> +					bpg_off);
> +			off += 4;
> +			j = 0;
> +			min_qp = 0;
> +			max_qp = 0;
> +			bpg_off = 0;
> +		}
> +	}

Unrolling these loops would make it easier to understand them.

> +}
> +
> +static void dpu_hw_dsc_bind_pingpong_blk_1_2(
> +		struct dpu_hw_dsc *hw_dsc,
> +		bool enable,
> +		const enum dpu_pingpong pp)
> +{
> +	struct dpu_hw_blk_reg_map *hw;
> +	int offset;
> +	int mux_cfg = 0xf; /* Disabled */
> +
> +	_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
> +
> +	hw = &hw_dsc->hw;
> +	if (enable)
> +		mux_cfg = (pp - PINGPONG_0) & 0x7;
> +
> +	DPU_REG_WRITE(hw, offset + DSC_CTL, mux_cfg);
> +}
> +
> +static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
> +				       const struct dpu_mdss_cfg *m,
> +				       void __iomem *addr,
> +				       struct dpu_hw_blk_reg_map *b)
> +{
> +	int i;
> +
> +	for (i = 0; i < m->dsc_count; i++) {
> +		if (dsc == m->dsc[i].id) {
> +			b->blk_addr = addr + m->dsc[i].base;
> +			b->log_mask = DPU_DBG_MASK_DSC;
> +			return &m->dsc[i];
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
> +		const unsigned long features)
> +{
> +	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
> +	ops->dsc_config = dpu_hw_dsc_config_1_2;
> +	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
> +	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
> +}
> +
> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(enum dpu_dsc idx, void __iomem *addr,
> +				   const struct dpu_mdss_cfg *m)
> +{

Please rebase on top of https://patchwork.freedesktop.org/series/116615/

> +	struct dpu_hw_dsc *c;
> +	const struct dpu_dsc_cfg *cfg;
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
> +
> +	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
> +
> +	return c;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f4dda88..f7014f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> @@ -250,7 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		struct dpu_hw_dsc *hw;
>   		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>   
> -		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> +		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
> +			hw = dpu_hw_dsc_init_1_2(dsc->id, mmio, cat);
> +		else
> +			hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> +
>   		if (IS_ERR_OR_NULL(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed dsc object creation: err %d\n", rc);

-- 
With best wishes
Dmitry

