Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65080ABE8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 19:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F78610EAE1;
	Fri,  8 Dec 2023 18:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808310EAE1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 18:17:27 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-db53f8cf4afso2410366276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702059446; x=1702664246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MABnnH/toxdHIN+dqlIfnSDab54KahtDiJhfQBIZI2Y=;
 b=vrZxmmiTf1hiB23F1a4JXqHmvIUrUz9ukZRYWYlSeG1Gxc1EzTHG4TZmEHZqaU6Br5
 qs64/Gq43paa0RLksDAYB9i3GerB9Yqtfq05oDisGK3qPCfBskejNIKwfYP0TKK2iyBJ
 H4Ev51345vBrxwPu6k/pUftmRADlH/Sh2yFc2+qqvTUb1jkCBORryG5o0hdwb5BM7kZ5
 VXX0wRE88SUcE5ofuSGK8q+VVyUkR4BvzBxl6xtmf0EJy1uPG9F3MK9wKZYWJ9+a+SSP
 E8f0zJOqmZRjgY4pZYH+TlRXrM15KzZKyd7usSRJHrJUp8NE9wkhI2rkK3g1OpXORf/L
 dIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702059446; x=1702664246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MABnnH/toxdHIN+dqlIfnSDab54KahtDiJhfQBIZI2Y=;
 b=V3K6/1vNq1HEfDNpwnovBPG1ZFIBmLbgVmsV7ZfbZlxHIJFxj7F8RGYjTP0GRA5LPN
 l2HAbkvG8IvE0s6y1BuaDf2w6MQJmgiZfv6hf2Zr5lyqQEU65eISe36WHi26e5e3Keq0
 DEQW3WRCNa9wLYfoGJLtEombWuOnfylOi7rR/iuHIiW7mx/x4mMdS3JPE+na/SjBbVx0
 IM3rV8Ac72/+dqDTTvoZZoY5hDOK4lByX4sqhEQwnK2RtXKkV0l8kWl1b1lPxZT0q+lo
 XEOzkl8pxYTBThgaiH3bYit9geQLr9wXww0kvil++wE6Q62U+N3vpNGx8va1naZTyH6+
 RbcQ==
X-Gm-Message-State: AOJu0YzpwNj3ZFz74ksH+pyAAwRDp8Mv+CDTe7oSvgq2hsXnw60xDvVy
 uTUfw68XcI6bYfejxwrQ1Zqw6RLqPnb7rc3QaqA0aw==
X-Google-Smtp-Source: AGHT+IFdeNIu5TuPawIeaLoDT4BwKX+j0AoV/H0wD25vxhGV8Eu0D0Q/6f2VQmp8rbi2/h89BGWPKXHYVZNu8GNul1g=
X-Received: by 2002:a25:8a12:0:b0:da0:48df:cafa with SMTP id
 g18-20020a258a12000000b00da048dfcafamr377865ybl.16.1702059446010; Fri, 08 Dec
 2023 10:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-8-quic_abhinavk@quicinc.com>
 <CAA8EJpp_9ForVxyQLOaeL3qbPcpEq8fkVR0FmZD+RDhn-quLEA@mail.gmail.com>
 <36c86e28-b1ee-045b-487c-4d3c9b4849cb@quicinc.com>
In-Reply-To: <36c86e28-b1ee-045b-487c-4d3c9b4849cb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 20:17:14 +0200
Message-ID: <CAA8EJpqapkLJ09=MWhZLnaQnkExC86+uhDj=X0hXbwaOC-U+oA@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM
 block
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 19:09, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/8/2023 4:06 AM, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> CDM block comes with its own set of registers and operations
> >> which can be done. In-line with other hardware sub-blocks, this
> >
> > I always thought that sub-blocks refer to the dpu_foo_sub_blks data,
> > which CDM doesn't have.
> >
>
> All of these are DPU-sub blks in some sense. If this is confusing to
> you, I will just say "in-line with other DPU hardware blocks".

Yes, please.

>
> >
> >> change adds the dpu_hw_cdm abstraction for the CDM block.
> >>
> >> changes in v2:
> >>          - replace bit magic with relevant defines
> >>          - use drmm_kzalloc instead of kzalloc/free
> >>          - some formatting fixes
> >>          - inline _setup_cdm_ops()
> >>          - protect bind_pingpong_blk with core_rev check
> >>          - drop setup_csc_data() and setup_cdwn() ops as they
> >>            are merged into enable()
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/Makefile                |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 276 ++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 114 ++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
> >>   4 files changed, 392 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
> >>
> >> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> >> index 49671364fdcf..b1173128b5b9 100644
> >> --- a/drivers/gpu/drm/msm/Makefile
> >> +++ b/drivers/gpu/drm/msm/Makefile
> >> @@ -63,6 +63,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
> >>          disp/dpu1/dpu_encoder_phys_wb.o \
> >>          disp/dpu1/dpu_formats.o \
> >>          disp/dpu1/dpu_hw_catalog.o \
> >> +       disp/dpu1/dpu_hw_cdm.o \
> >>          disp/dpu1/dpu_hw_ctl.o \
> >>          disp/dpu1/dpu_hw_dsc.o \
> >>          disp/dpu1/dpu_hw_dsc_1_2.o \
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> >> new file mode 100644
> >> index 000000000000..0dbe2df56cc8
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> >> @@ -0,0 +1,276 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> >> +#include <drm/drm_managed.h>
> >> +
> >> +#include "dpu_hw_mdss.h"
> >> +#include "dpu_hw_util.h"
> >> +#include "dpu_hw_catalog.h"
> >> +#include "dpu_hw_cdm.h"
> >> +#include "dpu_kms.h"
> >> +
> >> +#define CDM_CSC_10_OPMODE                  0x000
> >> +#define CDM_CSC_10_BASE                    0x004
> >> +
> >> +#define CDM_CDWN2_OP_MODE                  0x100
> >> +#define CDM_CDWN2_CLAMP_OUT                0x104
> >> +#define CDM_CDWN2_PARAMS_3D_0              0x108
> >> +#define CDM_CDWN2_PARAMS_3D_1              0x10C
> >> +#define CDM_CDWN2_COEFF_COSITE_H_0         0x110
> >> +#define CDM_CDWN2_COEFF_COSITE_H_1         0x114
> >> +#define CDM_CDWN2_COEFF_COSITE_H_2         0x118
> >> +#define CDM_CDWN2_COEFF_OFFSITE_H_0        0x11C
> >> +#define CDM_CDWN2_COEFF_OFFSITE_H_1        0x120
> >> +#define CDM_CDWN2_COEFF_OFFSITE_H_2        0x124
> >> +#define CDM_CDWN2_COEFF_COSITE_V           0x128
> >> +#define CDM_CDWN2_COEFF_OFFSITE_V          0x12C
> >> +#define CDM_CDWN2_OUT_SIZE                 0x130
> >> +
> >> +#define CDM_HDMI_PACK_OP_MODE              0x200
> >> +#define CDM_CSC_10_MATRIX_COEFF_0          0x004
> >> +
> >> +#define CDM_MUX                            0x224
> >> +
> >> +/* CDM CDWN2 sub-block bit definitions */
> >> +#define CDM_CDWN2_OP_MODE_EN                  BIT(0)
> >> +#define CDM_CDWN2_OP_MODE_ENABLE_H            BIT(1)
> >> +#define CDM_CDWN2_OP_MODE_ENABLE_V            BIT(2)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_H_AVG        BIT(3)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_H_COSITE     BIT(4)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_V_AVG        BIT(5)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_V_COSITE     BIT(6)
> >> +#define CDM_CDWN2_OP_MODE_BITS_OUT_8BIT       BIT(7)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_H_OFFSITE    GENMASK(4, 3)
> >> +#define CDM_CDWN2_OP_MODE_METHOD_V_OFFSITE    GENMASK(6, 5)
> >> +#define CDM_CDWN2_V_PIXEL_DROP_MASK           GENMASK(6, 5)
> >> +#define CDM_CDWN2_H_PIXEL_DROP_MASK           GENMASK(4, 3)
> >> +
> >> +/* CDM CSC10 sub-block bit definitions */
> >> +#define CDM_CSC10_OP_MODE_EN               BIT(0)
> >> +#define CDM_CSC10_OP_MODE_SRC_FMT_YUV      BIT(1)
> >> +#define CDM_CSC10_OP_MODE_DST_FMT_YUV      BIT(2)
> >> +
> >> +/* CDM HDMI pack sub-block bit definitions */
> >> +#define CDM_HDMI_PACK_OP_MODE_EN           BIT(0)
> >> +
> >> +/**
> >> + * Horizontal coefficients for cosite chroma downscale
> >> + * s13 representation of coefficients
> >> + */
> >> +static u32 cosite_h_coeff[] = {0x00000016, 0x000001cc, 0x0100009e};
> >> +
> >> +/**
> >> + * Horizontal coefficients for offsite chroma downscale
> >> + */
> >> +static u32 offsite_h_coeff[] = {0x000b0005, 0x01db01eb, 0x00e40046};
> >> +
> >> +/**
> >> + * Vertical coefficients for cosite chroma downscale
> >> + */
> >> +static u32 cosite_v_coeff[] = {0x00080004};
> >> +/**
> >> + * Vertical coefficients for offsite chroma downscale
> >> + */
> >> +static u32 offsite_v_coeff[] = {0x00060002};
> >> +
> >> +static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cfg)
> >> +{
> >> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
> >> +       u32 opmode = 0;
> >> +       u32 out_size = 0;
> >> +
> >> +       if (cfg->output_bit_depth == CDM_CDWN_OUTPUT_10BIT)
> >> +               opmode &= ~CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
> >
> > We start from opmode = 0. Does it really make sense to mask bits from
> > the zero opmode?
> >
>
> Ack, We can drop the ~ and just keep the | below.

Yep. I think it will make things more clear. We don't have 'update'
operation, we always setup CDM from the ground up.

>
> >> +       else
> >> +               opmode |= CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
> >> +
> >> +       /* ENABLE DWNS_H bit */
> >> +       opmode |= CDM_CDWN2_OP_MODE_ENABLE_H;
> >> +
> >> +       switch (cfg->h_cdwn_type) {
> >> +       case CDM_CDWN_DISABLE:
> >> +               /* CLEAR METHOD_H field */
> >> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
> >> +               /* CLEAR DWNS_H bit */
> >> +               opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_H;
> >> +               break;
> >> +       case CDM_CDWN_PIXEL_DROP:
> >> +               /* Clear METHOD_H field (pixel drop is 0) */
> >> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
> >> +               break;
> >> +       case CDM_CDWN_AVG:
> >> +               /* Clear METHOD_H field (Average is 0x1) */
> >> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_AVG;
> >> +               break;
> >> +       case CDM_CDWN_COSITE:
> >> +               /* Clear METHOD_H field (Average is 0x2) */
> >> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_COSITE;
> >> +               /* Co-site horizontal coefficients */
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_0,
> >> +                               cosite_h_coeff[0]);
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_1,
> >> +                               cosite_h_coeff[1]);
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_2,
> >> +                               cosite_h_coeff[2]);
> >> +               break;
> >> +       case CDM_CDWN_OFFSITE:
> >> +               /* Clear METHOD_H field (Average is 0x3) */
> >> +               opmode &= ~CDM_CDWN2_H_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_H_OFFSITE;
> >> +
> >> +               /* Off-site horizontal coefficients */
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_0,
> >> +                               offsite_h_coeff[0]);
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_1,
> >> +                               offsite_h_coeff[1]);
> >> +               DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_2,
> >> +                               offsite_h_coeff[2]);
> >> +               break;
> >> +       default:
> >> +               pr_err("%s invalid horz down sampling type\n", __func__);
> >
> > DPU_ERROR or drm_err
> >
>
> Ack.
>
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       /* ENABLE DWNS_V bit */
> >> +       opmode |= CDM_CDWN2_OP_MODE_ENABLE_V;
> >> +
> >> +       switch (cfg->v_cdwn_type) {
> >> +       case CDM_CDWN_DISABLE:
> >> +               /* CLEAR METHOD_V field */
> >> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
> >> +               /* CLEAR DWNS_V bit */
> >> +               opmode &= ~CDM_CDWN2_OP_MODE_ENABLE_V;
> >> +               break;
> >> +       case CDM_CDWN_PIXEL_DROP:
> >> +               /* Clear METHOD_V field (pixel drop is 0) */
> >> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
> >> +               break;
> >> +       case CDM_CDWN_AVG:
> >> +               /* Clear METHOD_V field (Average is 0x1) */
> >> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_AVG;
> >> +               break;
> >> +       case CDM_CDWN_COSITE:
> >> +               /* Clear METHOD_V field (Average is 0x2) */
> >> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_COSITE;
> >> +               /* Co-site vertical coefficients */
> >> +               DPU_REG_WRITE(c,
> >> +                             CDM_CDWN2_COEFF_COSITE_V,
> >> +                             cosite_v_coeff[0]);
> >> +               break;
> >> +       case CDM_CDWN_OFFSITE:
> >> +               /* Clear METHOD_V field (Average is 0x3) */
> >> +               opmode &= ~CDM_CDWN2_V_PIXEL_DROP_MASK;
> >> +               opmode |= CDM_CDWN2_OP_MODE_METHOD_V_OFFSITE;
> >> +
> >> +               /* Off-site vertical coefficients */
> >> +               DPU_REG_WRITE(c,
> >> +                             CDM_CDWN2_COEFF_OFFSITE_V,
> >> +                             offsite_v_coeff[0]);
> >> +               break;
> >> +       default:
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (cfg->v_cdwn_type || cfg->h_cdwn_type)
> >> +               opmode |= CDM_CDWN2_OP_MODE_EN; /* EN CDWN module */
> >> +       else
> >> +               opmode &= ~CDM_CDWN2_OP_MODE_EN;
> >> +
> >> +       out_size = (cfg->output_width & 0xFFFF) | ((cfg->output_height & 0xFFFF) << 16);
> >> +       DPU_REG_WRITE(c, CDM_CDWN2_OUT_SIZE, out_size);
> >> +       DPU_REG_WRITE(c, CDM_CDWN2_OP_MODE, opmode);
> >> +       DPU_REG_WRITE(c, CDM_CDWN2_CLAMP_OUT, ((0x3FF << 16) | 0x0));
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
> >> +{
> >> +       struct dpu_hw_blk_reg_map *c = &ctx->hw;
> >> +       const struct dpu_format *fmt;
> >> +       u32 opmode = 0;
> >> +       u32 csc = 0;
> >> +
> >> +       if (!ctx || !cdm)
> >> +               return -EINVAL;
> >> +
> >> +       fmt = cdm->output_fmt;
> >> +
> >> +       if (!DPU_FORMAT_IS_YUV(fmt))
> >> +               return -EINVAL;
> >> +
> >> +       dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, cdm->csc_cfg, true);
> >> +       dpu_hw_cdm_setup_cdwn(ctx, cdm);
> >> +
> >> +       if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
> >> +               if (fmt->chroma_sample != DPU_CHROMA_H1V2)
> >> +                       return -EINVAL; /*unsupported format */
> >> +               opmode = CDM_HDMI_PACK_OP_MODE_EN;
> >> +               opmode |= (fmt->chroma_sample << 1);
> >> +       }
> >> +
> >> +       csc |= CDM_CSC10_OP_MODE_DST_FMT_YUV;
> >> +       csc &= ~CDM_CSC10_OP_MODE_SRC_FMT_YUV;
> >> +       csc |= CDM_CSC10_OP_MODE_EN;
> >> +
> >> +       if (ctx && ctx->ops.bind_pingpong_blk)
> >> +               ctx->ops.bind_pingpong_blk(ctx, true, cdm->pp_id);
> >> +
> >> +       DPU_REG_WRITE(c, CDM_CSC_10_OPMODE, csc);
> >> +       DPU_REG_WRITE(c, CDM_HDMI_PACK_OP_MODE, opmode);
> >> +       return 0;
> >> +}
> >> +
> >> +void dpu_hw_cdm_disable(struct dpu_hw_cdm *ctx)
> >> +{
> >> +       if (!ctx)
> >> +               return;
> >> +
> >> +       if (ctx && ctx->ops.bind_pingpong_blk)
> >> +               ctx->ops.bind_pingpong_blk(ctx, false, PINGPONG_NONE);
> >
> > So the bind/un_pingpong_block gets hidden here. Why do we need to
> > unbind it manually in the dpu_encoder then?
> >
>
> hmm .... I think we can drop the disable op and just call
> bind_pingpong_blk directly.
>
> >> +}
> >> +
> >> +static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, bool enable,
> >> +                                        const enum dpu_pingpong pp)
> >
> > I think we settled on the PINGPONG_NONE for removing the binding
> >
>
> Ah okay. i probably missed this. so just drop "enable" and use pp val.
>
> >> +{
> >> +       struct dpu_hw_blk_reg_map *c;
> >> +       int mux_cfg = 0xF;
> >> +
> >> +       c = &ctx->hw;
> >> +
> >> +       if (enable)
> >> +               mux_cfg = (pp - PINGPONG_0) & 0x7;
> >> +
> >> +       DPU_REG_WRITE(c, CDM_MUX, mux_cfg);
> >> +}
> >> +
> >> +struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
> >> +                                  const struct dpu_cdm_cfg *cfg, void __iomem *addr,
> >> +                                  const struct dpu_mdss_version *mdss_rev)
> >> +{
> >> +       struct dpu_hw_cdm *c;
> >> +
> >> +       c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
> >> +       if (!c)
> >> +               return ERR_PTR(-ENOMEM);
> >> +
> >> +       c->hw.blk_addr = addr + cfg->base;
> >> +       c->hw.log_mask = DPU_DBG_MASK_CDM;
> >> +
> >> +       /* Assign ops */
> >> +       c->idx = cfg->id;
> >> +       c->caps = cfg;
> >> +
> >> +       c->ops.enable = dpu_hw_cdm_enable;
> >> +       c->ops.disable = dpu_hw_cdm_disable;
> >> +       if (mdss_rev->core_major_ver >= 5)
> >> +               c->ops.bind_pingpong_blk = dpu_hw_cdm_bind_pingpong_blk;
> >> +
> >> +       return c;
> >> +}
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
> >> new file mode 100644
> >> index 000000000000..1ca806f9d18d
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
> >> @@ -0,0 +1,114 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) 2023, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> >> +#ifndef _DPU_HW_CDM_H
> >> +#define _DPU_HW_CDM_H
> >> +
> >> +#include "dpu_hw_mdss.h"
> >> +#include "dpu_hw_top.h"
> >> +
> >> +struct dpu_hw_cdm;
> >> +
> >> +struct dpu_hw_cdm_cfg {
> >> +       u32 output_width;
> >> +       u32 output_height;
> >> +       u32 output_bit_depth;
> >> +       u32 h_cdwn_type;
> >> +       u32 v_cdwn_type;
> >> +       const struct dpu_format *output_fmt;
> >> +       const struct dpu_csc_cfg *csc_cfg;
> >> +       u32 output_type;
> >> +       int pp_id;
> >> +};
> >> +
> >> +enum dpu_hw_cdwn_type {
> >> +       CDM_CDWN_DISABLE,
> >> +       CDM_CDWN_PIXEL_DROP,
> >> +       CDM_CDWN_AVG,
> >> +       CDM_CDWN_COSITE,
> >> +       CDM_CDWN_OFFSITE,
> >> +};
> >> +
> >> +enum dpu_hw_cdwn_output_type {
> >> +       CDM_CDWN_OUTPUT_HDMI,
> >> +       CDM_CDWN_OUTPUT_WB,
> >> +};
> >> +
> >> +enum dpu_hw_cdwn_output_bit_depth {
> >> +       CDM_CDWN_OUTPUT_8BIT,
> >> +       CDM_CDWN_OUTPUT_10BIT,
> >> +};
> >
> > Can we please get some documentation for these enums?
> >
>
> Ack.
>
> >> +
> >> +/**
> >> + * struct dpu_hw_cdm_ops : Interface to the chroma down Hw driver functions
> >> + *                         Assumption is these functions will be called after
> >> + *                         clocks are enabled
> >> + *  @enable:               Enables the output to interface and programs the
> >> + *                         output packer
> >> + *  @disable:              Puts the cdm in bypass mode
> >> + *  @bind_pingpong_blk:    enable/disable the connection with pingpong which
> >> + *                         will feed pixels to this cdm
> >> + */
> >> +struct dpu_hw_cdm_ops {
> >> +       /**
> >> +        * Enable the CDM module
> >> +        * @cdm         Pointer to chroma down context
> >> +        */
> >> +       int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
> >> +
> >> +       /**
> >> +        * Disable the CDM module
> >> +        * @cdm         Pointer to chroma down context
> >> +        */
> >> +       void (*disable)(struct dpu_hw_cdm *cdm);
> >> +
> >> +       /**
> >> +        * Enable/disable the connection with pingpong
> >> +        * @cdm         Pointer to chroma down context
> >> +        * @enable      Enable/disable control
> >> +        * @pp          pingpong block id.
> >> +        */
> >> +       void (*bind_pingpong_blk)(struct dpu_hw_cdm *cdm, bool enable,
> >> +                                 const enum dpu_pingpong pp);
> >> +};
> >> +
> >> +/**
> >> + * struct dpu_hw_cdm - cdm description
> >> + * @base: Hardware block base structure
> >> + * @hw: Block hardware details
> >> + * @idx: CDM index
> >> + * @caps: Pointer to cdm_cfg
> >> + * @ops: handle to operations possible for this CDM
> >> + */
> >> +struct dpu_hw_cdm {
> >> +       struct dpu_hw_blk base;
> >> +       struct dpu_hw_blk_reg_map hw;
> >> +
> >> +       /* chroma down */
> >> +       const struct dpu_cdm_cfg *caps;
> >> +       enum  dpu_cdm  idx;
> >> +
> >> +       /* ops */
> >> +       struct dpu_hw_cdm_ops ops;
> >> +};
> >> +
> >> +/**
> >> + * dpu_hw_cdm_init - initializes the cdm hw driver object.
> >> + * should be called once before accessing every cdm.
> >> + * @dev: DRM device handle
> >> + * @cdm: CDM catalog entry for which driver object is required
> >> + * @addr :   mapped register io address of MDSS
> >> + * @mdss_rev: mdss hw core revision
> >> + */
> >> +struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
> >> +                                  const struct dpu_cdm_cfg *cdm, void __iomem *addr,
> >> +                                  const struct dpu_mdss_version *mdss_rev);
> >> +
> >> +static inline struct dpu_hw_cdm *to_dpu_hw_cdm(struct dpu_hw_blk *hw)
> >> +{
> >> +       return container_of(hw, struct dpu_hw_cdm, base);
> >> +}
> >> +
> >> +#endif /*_DPU_HW_CDM_H */
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index f319c8232ea5..9db4cf61bd29 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -466,6 +466,7 @@ struct dpu_mdss_color {
> >>   #define DPU_DBG_MASK_ROT      (1 << 9)
> >>   #define DPU_DBG_MASK_DSPP     (1 << 10)
> >>   #define DPU_DBG_MASK_DSC      (1 << 11)
> >> +#define DPU_DBG_MASK_CDM      (1 << 12)
> >>
> >>   /**
> >>    * struct dpu_hw_tear_check - Struct contains parameters to configure
> >> --
> >> 2.40.1
> >>
> >
> >
> > --
> > With best wishes
> >
> > Dmitry



-- 
With best wishes
Dmitry
