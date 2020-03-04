Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73717A0EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1B76EB8F;
	Thu,  5 Mar 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085966EB25
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 11:45:25 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id r8so610139qvs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 03:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQoWSGPFAfx9IuSb61p69jTDMoa5TAf2A2riJLemLUg=;
 b=oBnU82Ben+/s9ckQdOOZgOaNIkgc4Fxlbrq+B71nsb3Hog2qclfAeZ5wTZjryQbZb4
 /hgbwRv9hBfriVvyafZFpAj/n/cPDRoEO89RByIDBqtdF1NwtGP6wi4KeDA6mSiJ/Wnv
 toPL1rGJOt8RrazoYlC5iBkZAXTaOyfNl8F7FOo3zg65EuEViC1hMeBwKcUwiatZEy/M
 PwA7VpDXcjfN7RFIW8yvf5EmfQyazHLr8fv0bJvAvnRlN70f4y8LNXqURqOmsOPrdY6T
 xjD8VFZqwKr3hXE16FHchu1LM8jG+1G/u2yPZmQ2qgo4ozVLNrCFocmBVISH38DHhJrH
 nWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQoWSGPFAfx9IuSb61p69jTDMoa5TAf2A2riJLemLUg=;
 b=lc3aLc6am1iAVsGSw6MEP2H4XmX8fqV50JQrC+kLeYva6jDpWUtpgwaSPmndYKjmKy
 Kurw5TNfb4ZE7OOC9EI/2pgGeb69XAPqd5+q8z3jrQ3kBrM4T/g6Ji6QDYI+OeJRyelw
 kay62aKzWEJbixWWlj3x47jNKr/t6E5bhpKQkFkKk/f2xnjrxHWgBkK7zYZ9pKCDfgnz
 V2Xo/I7cgy9e2ci4ZNZigLBlcFOOB66EzxIkO53Mz92nr8VW/68aSD7nbRuQT7oVde9i
 Vj7UPMGVOjFkeF+Fb3OGcZG4OnIng/uEMDmJdVYgLi8jVGD/9dIcWzmYQrWqT1syKyH8
 GzQg==
X-Gm-Message-State: ANhLgQ3BIMUZ2hh7jVLC4B69eT6Pe7L8E2PO1MXsnlGv0d2q6uBfCvns
 LMZdTk+1Bc3OLa0BxU3mBzV3mURf/0POT5DTYlA=
X-Google-Smtp-Source: ADFU+vsX5/AunPCFM3X9POP1JbXVNQ7ExyZsOgRAYtDKfW6NBn9oafT13ziAVv5AZJwp1miMiMIhKUP+gXwmCBmxCE4=
X-Received: by 2002:ad4:4861:: with SMTP id u1mr1689775qvy.233.1583322324677; 
 Wed, 04 Mar 2020 03:45:24 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
 <CAL_Jsq+MN-f+o8Ai5iX3siqveWfJrDefoLL7vuwGesSok5Si2A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+MN-f+o8Ai5iX3siqveWfJrDefoLL7vuwGesSok5Si2A@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Wed, 4 Mar 2020 19:45:12 +0800
Message-ID: <CAFPSGXYX8iXZPtmGqS7a6Niw3CnsV-S-OoY5WiPMBfRHRdAW2w@mail.gmail.com>
Subject: Re: [PATCH RFC v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2104388746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2104388746==
Content-Type: multipart/alternative; boundary="000000000000ba3b4505a005f448"

--000000000000ba3b4505a005f448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 4:37 AM Rob Herring <robh+dt@kernel.org> wrote:

> On Wed, Feb 26, 2020 at 3:46 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > Adds DPU(Display Processor Unit) support for the Unisoc's display
> subsystem.
> > It's support multi planes, scaler, rotation, PQ(Picture Quality) and
> more.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  drivers/gpu/drm/sprd/Makefile       |   5 +-
> >  drivers/gpu/drm/sprd/dpu/Makefile   |   7 +
> >  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 770
> ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.c     | 586 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h     | 127 ++++++
> >  drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
> >  7 files changed, 1497 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > index 86d95d9..88ab32a 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -2,4 +2,7 @@
> >
> >  subdir-ccflags-y +=3D -I$(srctree)/$(src)
> >
> > -obj-y :=3D sprd_drm.o
> > +obj-y :=3D sprd_drm.o \
> > +       sprd_dpu.o
> > +
> > +obj-y +=3D dpu/
> > diff --git a/drivers/gpu/drm/sprd/dpu/Makefile
> b/drivers/gpu/drm/sprd/dpu/Makefile
> > new file mode 100644
> > index 0000000..73bd497
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ifdef CONFIG_ARM64
> > +KBUILD_CFLAGS +=3D -mstrict-align
> > +endif
> > +
> > +obj-y +=3D dpu_r2p0.o
> > diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > new file mode 100644
> > index 0000000..984fa9b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > @@ -0,0 +1,770 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
> > +#include "sprd_dpu.h"
> > +
> > +#define DISPC_INT_FBC_PLD_ERR_MASK     BIT(8)
> > +#define DISPC_INT_FBC_HDR_ERR_MASK     BIT(9)
> > +
> > +#define DISPC_INT_MMU_INV_WR_MASK      BIT(19)
> > +#define DISPC_INT_MMU_INV_RD_MASK      BIT(18)
> > +#define DISPC_INT_MMU_VAOR_WR_MASK     BIT(17)
> > +#define DISPC_INT_MMU_VAOR_RD_MASK     BIT(16)
> > +
> > +struct layer_reg {
> > +       u32 addr[4];
> > +       u32 ctrl;
> > +       u32 size;
> > +       u32 pitch;
> > +       u32 pos;
> > +       u32 alpha;
> > +       u32 ck;
> > +       u32 pallete;
> > +       u32 crop_start;
> > +};
> > +
> > +struct wb_region_reg {
> > +       u32 pos;
> > +       u32 size;
> > +};
> > +
> > +/* dpu controller register */
> > +struct dpu_reg {
>
> structs for registers is not normal coding style. #defines of offsets
> is. More below.
>
> > +       u32 dpu_version;
> > +       u32 dpu_ctrl;
> > +       u32 dpu_cfg0;
> > +       u32 dpu_cfg1;
> > +       u32 dpu_cfg2;
> > +       u32 dpu_secure;
> > +       u32 reserved_0x0018_0x001C[2];
> > +       u32 panel_size;
> > +       u32 blend_size;
> > +       u32 reserved_0x0028;
> > +       u32 bg_color;
> > +       struct layer_reg layers[8];
> > +       u32 wb_base_addr;
> > +       u32 wb_ctrl;
> > +       u32 wb_cfg;
> > +       u32 wb_pitch;
> > +       struct wb_region_reg region[3];
> > +       u32 reserved_0x01D8_0x01DC[2];
> > +       u32 dpu_int_en;
> > +       u32 dpu_int_clr;
> > +       u32 dpu_int_sts;
> > +       u32 dpu_int_raw;
> > +       u32 dpi_ctrl;
> > +       u32 dpi_h_timing;
> > +       u32 dpi_v_timing;
> > +       u32 reserved_0x01FC;
> > +       u32 dpu_enhance_cfg;
> > +       u32 reserved_0x0204_0x020C[3];
> > +       u32 epf_epsilon;
> > +       u32 epf_gain0_3;
> > +       u32 epf_gain4_7;
> > +       u32 epf_diff;
> > +       u32 reserved_0x0220_0x023C[8];
> > +       u32 hsv_lut_addr;
> > +       u32 hsv_lut_wdata;
> > +       u32 hsv_lut_rdata;
> > +       u32 reserved_0x024C_0x027C[13];
> > +       u32 cm_coef01_00;
> > +       u32 cm_coef03_02;
> > +       u32 cm_coef11_10;
> > +       u32 cm_coef13_12;
> > +       u32 cm_coef21_20;
> > +       u32 cm_coef23_22;
> > +       u32 reserved_0x0298_0x02BC[10];
> > +       u32 slp_cfg0;
> > +       u32 slp_cfg1;
> > +       u32 reserved_0x02C8_0x02FC[14];
> > +       u32 gamma_lut_addr;
> > +       u32 gamma_lut_wdata;
> > +       u32 gamma_lut_rdata;
> > +       u32 reserved_0x030C_0x033C[13];
> > +       u32 checksum_en;
> > +       u32 checksum0_start_pos;
> > +       u32 checksum0_end_pos;
> > +       u32 checksum1_start_pos;
> > +       u32 checksum1_end_pos;
> > +       u32 checksum0_result;
> > +       u32 checksum1_result;
> > +       u32 reserved_0x035C;
> > +       u32 dpu_sts[18];
> > +       u32 reserved_0x03A8_0x03AC[2];
> > +       u32 dpu_fbc_cfg0;
> > +       u32 dpu_fbc_cfg1;
> > +       u32 reserved_0x03B8_0x03EC[14];
> > +       u32 rf_ram_addr;
> > +       u32 rf_ram_rdata_low;
> > +       u32 rf_ram_rdata_high;
> > +       u32 reserved_0x03FC_0x07FC[257];
> > +       u32 mmu_en;
> > +       u32 mmu_update;
> > +       u32 mmu_min_vpn;
> > +       u32 mmu_vpn_range;
> > +       u32 mmu_pt_addr;
> > +       u32 mmu_default_page;
> > +       u32 mmu_vaor_addr_rd;
> > +       u32 mmu_vaor_addr_wr;
> > +       u32 mmu_inv_addr_rd;
> > +       u32 mmu_inv_addr_wr;
> > +       u32 mmu_uns_addr_rd;
> > +       u32 mmu_uns_addr_wr;
> > +       u32 mmu_miss_cnt;
> > +       u32 mmu_pt_update_qos;
> > +       u32 mmu_version;
> > +       u32 mmu_min_ppn1;
> > +       u32 mmu_ppn_range1;
> > +       u32 mmu_min_ppn2;
> > +       u32 mmu_ppn_range2;
> > +       u32 mmu_vpn_paor_rd;
> > +       u32 mmu_vpn_paor_wr;
> > +       u32 mmu_ppn_paor_rd;
> > +       u32 mmu_ppn_paor_wr;
> > +       u32 mmu_reg_au_manage;
> > +       u32 mmu_page_rd_ch;
> > +       u32 mmu_page_wr_ch;
> > +       u32 mmu_read_page_cmd_cnt;
> > +       u32 mmu_read_page_latency_cnt;
> > +       u32 mmu_page_max_latency;
> > +};
> > +
> > +static void dpu_dump(struct dpu_context *ctx)
> > +{
> > +       u32 *reg =3D (u32 *)ctx->base;
> > +       int i;
> > +
> > +       pr_info("      0          4          8          C\n");
> > +       for (i =3D 0; i < 256; i +=3D 4) {
> > +               pr_info("%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n",
> > +                       i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i +
> 3]);
> > +       }
> > +}
> > +
> > +static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       u32 mmu_mask =3D DISPC_INT_MMU_VAOR_RD_MASK |
> > +                       DISPC_INT_MMU_VAOR_WR_MASK |
> > +                       DISPC_INT_MMU_INV_RD_MASK |
> > +                       DISPC_INT_MMU_INV_WR_MASK;
> > +       u32 val =3D reg_val & mmu_mask;
> > +
> > +       if (val) {
> > +               pr_err("--- iommu interrupt err: 0x%04x ---\n", val);
> > +
> > +               pr_err("iommu invalid read error, addr: 0x%08x\n",
> > +                       reg->mmu_inv_addr_rd);
> > +               pr_err("iommu invalid write error, addr: 0x%08x\n",
> > +                       reg->mmu_inv_addr_wr);
> > +               pr_err("iommu va out of range read error, addr:
> 0x%08x\n",
> > +                       reg->mmu_vaor_addr_rd);
> > +               pr_err("iommu va out of range write error, addr:
> 0x%08x\n",
> > +                       reg->mmu_vaor_addr_wr);
> > +               pr_err("BUG: iommu failure at %s:%d/%s()!\n",
> > +                       __FILE__, __LINE__, __func__);
> > +
> > +               dpu_dump(ctx);
> > +       }
> > +
> > +       return val;
> > +}
> > +
> > +static void dpu_clean_all(struct dpu_context *ctx)
> > +{
> > +       int i;
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       for (i =3D 0; i < 8; i++)
> > +               reg->layers[i].ctrl =3D 0;
> > +}
> > +
> > +static u32 dpu_isr(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       u32 reg_val, int_mask =3D 0;
> > +
> > +       reg_val =3D reg->dpu_int_sts;
> > +
> > +       /* disable err interrupt */
> > +       if (reg_val & DISPC_INT_ERR_MASK)
> > +               int_mask |=3D DISPC_INT_ERR_MASK;
> > +
> > +       /* dpu update done isr */
> > +       if (reg_val & DISPC_INT_UPDATE_DONE_MASK) {
> > +               ctx->evt_update =3D true;
> > +               wake_up_interruptible_all(&ctx->wait_queue);
> > +       }
> > +
> > +       /* dpu stop done isr */
> > +       if (reg_val & DISPC_INT_DONE_MASK) {
> > +               ctx->evt_stop =3D true;
> > +               wake_up_interruptible_all(&ctx->wait_queue);
> > +       }
> > +
> > +       /* dpu ifbc payload error isr */
> > +       if (reg_val & DISPC_INT_FBC_PLD_ERR_MASK) {
> > +               int_mask |=3D DISPC_INT_FBC_PLD_ERR_MASK;
> > +               pr_err("dpu ifbc payload error\n");
> > +       }
> > +
> > +       /* dpu ifbc header error isr */
> > +       if (reg_val & DISPC_INT_FBC_HDR_ERR_MASK) {
> > +               int_mask |=3D DISPC_INT_FBC_HDR_ERR_MASK;
> > +               pr_err("dpu ifbc header error\n");
> > +       }
> > +
> > +       int_mask |=3D check_mmu_isr(ctx, reg_val);
> > +
> > +       reg->dpu_int_clr =3D reg_val;
> > +       reg->dpu_int_en &=3D ~int_mask;
>
> Also, not coding style. Use readl/writel{_relaxed}. This is fragile
> because the compiler has a lot of freedom in what it can do here
> including reordering the accesses, changing the access size or
> skipping the register access altogether. I don't think the latter
> would happen in this case, but if a read has side effects such as
> causing bits to clear you'll see problems.
>
This is maybe a bad design for a long time on our platform, but it =E2=80=
=99s
really convenient,
direct access I/O resources by structs...
So i will be try use readl/writel to replace it.

>
> > +
> > +       return reg_val;
> > +}
> > +
> > +static int dpu_wait_stop_done(struct dpu_context *ctx)
> > +{
> > +       int rc;
> > +
> > +       if (ctx->stopped)
> > +               return 0;
> > +
> > +       rc =3D wait_event_interruptible_timeout(ctx->wait_queue,
> ctx->evt_stop,
> > +                                              msecs_to_jiffies(500));
> > +       ctx->evt_stop =3D false;
> > +
> > +       ctx->stopped =3D true;
> > +
> > +       if (!rc) {
> > +               pr_err("dpu wait for stop done time out!\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int dpu_wait_update_done(struct dpu_context *ctx)
> > +{
> > +       int rc;
> > +
> > +       ctx->evt_update =3D false;
> > +
> > +       rc =3D wait_event_interruptible_timeout(ctx->wait_queue,
> ctx->evt_update,
> > +                                              msecs_to_jiffies(500));
> > +
> > +       if (!rc) {
> > +               pr_err("dpu wait for reg update done time out!\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void dpu_stop(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       if (ctx->stopped)
> > +               return;
> > +
> > +       if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI)
> > +               reg->dpu_ctrl |=3D BIT(1);
> > +
> > +       dpu_wait_stop_done(ctx);
> > +
> > +       pr_info("dpu stop\n");
> > +}
> > +
> > +static void dpu_run(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       if (!ctx->stopped)
> > +               return;
> > +
> > +       reg->dpu_ctrl |=3D BIT(0);
> > +
> > +       ctx->stopped =3D false;
> > +
> > +       pr_info("dpu run\n");
> > +}
> > +
> > +static int dpu_init(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       u32 size;
> > +
> > +       reg->bg_color =3D 0;
> > +
> > +       size =3D (ctx->vm.vactive << 16) | ctx->vm.hactive;
> > +       reg->panel_size =3D size;
> > +       reg->blend_size =3D size;
> > +
> > +       reg->dpu_cfg0 =3D BIT(4) | BIT(5);
> > +
> > +       reg->dpu_cfg1 =3D 0x004466da;
> > +       reg->dpu_cfg2 =3D 0;
> > +
> > +       if (ctx->stopped)
> > +               dpu_clean_all(ctx);
> > +
> > +       reg->mmu_en =3D 0;
> > +       reg->mmu_min_ppn1 =3D 0;
> > +       reg->mmu_ppn_range1 =3D 0xffff;
> > +       reg->mmu_min_ppn2 =3D 0;
> > +       reg->mmu_ppn_range2 =3D 0xffff;
> > +       reg->mmu_vpn_range =3D 0x1ffff;
> > +
> > +       reg->dpu_int_clr =3D 0xffff;
> > +
> > +       init_waitqueue_head(&ctx->wait_queue);
> > +
> > +       return 0;
> > +}
> > +
> > +static void dpu_fini(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       reg->dpu_int_en =3D 0;
> > +       reg->dpu_int_clr =3D 0xff;
> > +}
> > +
> > +enum {
> > +       DPU_LAYER_FORMAT_YUV422_2PLANE,
> > +       DPU_LAYER_FORMAT_YUV420_2PLANE,
> > +       DPU_LAYER_FORMAT_YUV420_3PLANE,
> > +       DPU_LAYER_FORMAT_ARGB8888,
> > +       DPU_LAYER_FORMAT_RGB565,
> > +       DPU_LAYER_FORMAT_XFBC_ARGB8888 =3D 8,
> > +       DPU_LAYER_FORMAT_XFBC_RGB565,
> > +       DPU_LAYER_FORMAT_MAX_TYPES,
> > +};
> > +
> > +enum {
> > +       DPU_LAYER_ROTATION_0,
> > +       DPU_LAYER_ROTATION_90,
> > +       DPU_LAYER_ROTATION_180,
> > +       DPU_LAYER_ROTATION_270,
> > +       DPU_LAYER_ROTATION_0_M,
> > +       DPU_LAYER_ROTATION_90_M,
> > +       DPU_LAYER_ROTATION_180_M,
> > +       DPU_LAYER_ROTATION_270_M,
> > +};
> > +
> > +static u32 to_dpu_rotation(u32 angle)
> > +{
> > +       u32 rot =3D DPU_LAYER_ROTATION_0;
> > +
> > +       switch (angle) {
> > +       case 0:
> > +       case DRM_MODE_ROTATE_0:
> > +               rot =3D DPU_LAYER_ROTATION_0;
> > +               break;
> > +       case DRM_MODE_ROTATE_90:
> > +               rot =3D DPU_LAYER_ROTATION_90;
> > +               break;
> > +       case DRM_MODE_ROTATE_180:
> > +               rot =3D DPU_LAYER_ROTATION_180;
> > +               break;
> > +       case DRM_MODE_ROTATE_270:
> > +               rot =3D DPU_LAYER_ROTATION_270;
> > +               break;
> > +       case DRM_MODE_REFLECT_Y:
> > +               rot =3D DPU_LAYER_ROTATION_180_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> > +               rot =3D DPU_LAYER_ROTATION_90_M;
> > +               break;
> > +       case DRM_MODE_REFLECT_X:
> > +               rot =3D DPU_LAYER_ROTATION_0_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> > +               rot =3D DPU_LAYER_ROTATION_270_M;
> > +               break;
> > +       default:
> > +               pr_err("rotation convert unsupport angle (drm)=3D 0x%x\=
n",
> angle);
> > +               break;
> > +       }
> > +
> > +       return rot;
> > +}
> > +
> > +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)
> > +{
> > +       int reg_val =3D 0;
> > +
> > +       /* layer enable */
> > +       reg_val |=3D BIT(0);
> > +
> > +       switch (format) {
> > +       case DRM_FORMAT_BGRA8888:
> > +               /* BGRA8888 -> ARGB8888 */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_RGBX8888:
> > +       case DRM_FORMAT_RGBA8888:
> > +               /* RGBA8888 -> ABGR8888 */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ABGR8888:
> > +               /* rb switch */
> > +               reg_val |=3D BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ARGB8888:
> > +               reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_XBGR8888:
> > +               /* rb switch */
> > +               reg_val |=3D BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_XRGB8888:
> > +               reg_val |=3D (DPU_LAYER_FORMAT_ARGB8888 << 4);
> > +               break;
> > +       case DRM_FORMAT_BGR565:
> > +               /* rb switch */
> > +               reg_val |=3D BIT(10);
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_RGB565:
> > +               reg_val |=3D (DPU_LAYER_FORMAT_RGB565 << 4);
> > +               break;
> > +       case DRM_FORMAT_NV12:
> > +               /* 2-Lane: Yuv420 */
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV21:
> > +               /* 2-Lane: Yuv420 */
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV420_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV16:
> > +               /* 2-Lane: Yuv422 */
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       case DRM_FORMAT_NV61:
> > +               /* 2-Lane: Yuv422 */
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV422_2PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_YUV420:
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 10;
> > +               break;
> > +       case DRM_FORMAT_YVU420:
> > +               reg_val |=3D DPU_LAYER_FORMAT_YUV420_3PLANE << 4;
> > +               /* Y endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B0B1B2B3 << 8;
> > +               /* UV endian */
> > +               reg_val |=3D SPRD_IMG_DATA_ENDIAN_B3B2B1B0 << 10;
> > +               break;
> > +       default:
> > +               pr_err("error: invalid format %c%c%c%c\n", format,
> > +                                               format >> 8,
> > +                                               format >> 16,
> > +                                               format >> 24);
> > +               break;
> > +       }
> > +
> > +       switch (blending) {
> > +       case DRM_MODE_BLEND_PIXEL_NONE:
> > +               /* don't do blending, maybe RGBX */
> > +               /* alpha mode select - layer alpha */
> > +               reg_val |=3D BIT(2);
> > +               break;
> > +       case DRM_MODE_BLEND_COVERAGE:
> > +               /* alpha mode select - combo alpha */
> > +               reg_val |=3D BIT(3);
> > +               /*Normal mode*/
> > +               reg_val &=3D (~BIT(16));
> > +               break;
> > +       case DRM_MODE_BLEND_PREMULTI:
> > +               /* alpha mode select - combo alpha */
> > +               reg_val |=3D BIT(3);
> > +               /*Pre-mult mode*/
> > +               reg_val |=3D BIT(16);
> > +               break;
> > +       default:
> > +               /* alpha mode select - layer alpha */
> > +               reg_val |=3D BIT(2);
> > +               break;
> > +       }
> > +
> > +       rotation =3D to_dpu_rotation(rotation);
> > +       reg_val |=3D (rotation & 0x7) << 20;
> > +
> > +       return reg_val;
> > +}
> > +
> > +static void dpu_bgcolor(struct dpu_context *ctx, u32 color)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI)
> > +               dpu_wait_stop_done(ctx);
> > +
> > +       reg->bg_color =3D color;
> > +
> > +       dpu_clean_all(ctx);
> > +
> > +       if ((ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) && !ctx->stopped) {
> > +               reg->dpu_ctrl |=3D BIT(2);
> > +               dpu_wait_update_done(ctx);
> > +       } else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> > +               reg->dpu_ctrl |=3D BIT(0);
> > +               ctx->stopped =3D false;
> > +       }
> > +}
> > +
> > +static void dpu_layer(struct dpu_context *ctx,
> > +                   struct sprd_dpu_layer *hwlayer)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       const struct drm_format_info *info;
> > +       struct layer_reg *layer;
> > +       u32 addr, size, offset;
> > +       int i;
> > +
> > +       layer =3D &reg->layers[hwlayer->index];
> > +       offset =3D (hwlayer->dst_x & 0xffff) | ((hwlayer->dst_y) << 16)=
;
> > +
> > +       if (hwlayer->src_w && hwlayer->src_h)
> > +               size =3D (hwlayer->src_w & 0xffff) | ((hwlayer->src_h) =
<<
> 16);
> > +       else
> > +               size =3D (hwlayer->dst_w & 0xffff) | ((hwlayer->dst_h) =
<<
> 16);
> > +
> > +       for (i =3D 0; i < hwlayer->planes; i++) {
> > +               addr =3D hwlayer->addr[i];
> > +
> > +               if (addr % 16)
> > +                       pr_err("layer addr[%d] is not 16 bytes align,
> it's 0x%08x\n",
> > +                               i, addr);
> > +               layer->addr[i] =3D addr;
> > +       }
> > +
> > +       layer->pos =3D offset;
> > +       layer->size =3D size;
> > +       layer->crop_start =3D (hwlayer->src_y << 16) | hwlayer->src_x;
> > +       layer->alpha =3D hwlayer->alpha;
> > +
> > +       info =3D drm_format_info(hwlayer->format);
> > +       if (info->cpp[0] =3D=3D 0) {
> > +               pr_err("layer[%d] bytes per pixel is invalid\n",
> hwlayer->index);
> > +               return;
> > +       }
> > +
> > +       if (hwlayer->planes =3D=3D 3)
> > +               /* UV pitch is 1/2 of Y pitch*/
> > +               layer->pitch =3D (hwlayer->pitch[0] / info->cpp[0]) |
> > +                               (hwlayer->pitch[0] / info->cpp[0] << 15=
);
> > +       else
> > +               layer->pitch =3D hwlayer->pitch[0] / info->cpp[0];
> > +
> > +       layer->ctrl =3D dpu_img_ctrl(hwlayer->format, hwlayer->blending=
,
> > +               hwlayer->rotation);
> > +
> > +       pr_debug("dst_x =3D %d, dst_y =3D %d, dst_w =3D %d, dst_h =3D %=
d\n",
> > +                               hwlayer->dst_x, hwlayer->dst_y,
> > +                               hwlayer->dst_w, hwlayer->dst_h);
> > +       pr_debug("start_x =3D %d, start_y =3D %d, start_w =3D %d, start=
_h =3D
> %d\n",
> > +                               hwlayer->src_x, hwlayer->src_y,
> > +                               hwlayer->src_w, hwlayer->src_h);
> > +}
> > +
> > +static void dpu_flip(struct dpu_context *ctx,
> > +                    struct sprd_dpu_layer layers[], u8 count)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       int i;
> > +
> > +       /*
> > +        * Make sure the dpu is in stop status. DPU_R2P0 has no shadow
> > +        * registers in EDPI mode. So the config registers can only be
> > +        * updated in the rising edge of DPU_RUN bit.
> > +        */
> > +       if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI)
> > +               dpu_wait_stop_done(ctx);
> > +
> > +       /* reset the bgcolor to black */
> > +       reg->bg_color =3D 0;
> > +
> > +       /* disable all the layers */
> > +       dpu_clean_all(ctx);
> > +
> > +       /* start configure dpu layers */
> > +       for (i =3D 0; i < count; i++)
> > +               dpu_layer(ctx, &layers[i]);
> > +
> > +       /* update trigger and wait */
> > +       if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) {
> > +               if (!ctx->stopped) {
> > +                       reg->dpu_ctrl |=3D BIT(2);
> > +                       dpu_wait_update_done(ctx);
> > +               }
> > +
> > +               reg->dpu_int_en |=3D DISPC_INT_ERR_MASK;
> > +
> > +       } else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> > +               reg->dpu_ctrl |=3D BIT(0);
> > +
> > +               ctx->stopped =3D false;
> > +       }
> > +
> > +       /*
> > +        * If the following interrupt was disabled in isr,
> > +        * re-enable it.
> > +        */
> > +       reg->dpu_int_en |=3D DISPC_INT_FBC_PLD_ERR_MASK |
> > +                          DISPC_INT_FBC_HDR_ERR_MASK |
> > +                          DISPC_INT_MMU_VAOR_RD_MASK |
> > +                          DISPC_INT_MMU_VAOR_WR_MASK |
> > +                          DISPC_INT_MMU_INV_RD_MASK |
> > +                          DISPC_INT_MMU_INV_WR_MASK;
> > +}
> > +
> > +static void dpu_dpi_init(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +       u32 int_mask =3D 0;
> > +
> > +       if (ctx->if_type =3D=3D SPRD_DISPC_IF_DPI) {
> > +               /* use dpi as interface */
> > +               reg->dpu_cfg0 &=3D ~BIT(0);
> > +
> > +               /* disable Halt function for SPRD DSI */
> > +               reg->dpi_ctrl &=3D ~BIT(16);
> > +
> > +               /* select te from external pad */
> > +               reg->dpi_ctrl |=3D BIT(10);
> > +
> > +               /* set dpi timing */
> > +               reg->dpi_h_timing =3D (ctx->vm.hsync_len << 0) |
> > +                                   (ctx->vm.hback_porch << 8) |
> > +                                   (ctx->vm.hfront_porch << 20);
> > +               reg->dpi_v_timing =3D (ctx->vm.vsync_len << 0) |
> > +                                   (ctx->vm.vback_porch << 8) |
> > +                                   (ctx->vm.vfront_porch << 20);
> > +               if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> > +                       pr_warn("Warning: (vsync + vbp) < 32, "
> > +                               "underflow risk!\n");
> > +
> > +               /* enable dpu update done INT */
> > +               int_mask |=3D DISPC_INT_UPDATE_DONE_MASK;
> > +               /* enable dpu DONE  INT */
> > +               int_mask |=3D DISPC_INT_DONE_MASK;
> > +               /* enable dpu dpi vsync */
> > +               int_mask |=3D DISPC_INT_DPI_VSYNC_MASK;
> > +               /* enable dpu TE INT */
> > +               int_mask |=3D DISPC_INT_TE_MASK;
> > +               /* enable underflow err INT */
> > +               int_mask |=3D DISPC_INT_ERR_MASK;
> > +               /* enable write back done INT */
> > +               int_mask |=3D DISPC_INT_WB_DONE_MASK;
> > +               /* enable write back fail INT */
> > +               int_mask |=3D DISPC_INT_WB_FAIL_MASK;
> > +
> > +       } else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> > +               /* use edpi as interface */
> > +               reg->dpu_cfg0 |=3D BIT(0);
> > +
> > +               /* use external te */
> > +               reg->dpi_ctrl |=3D BIT(10);
> > +
> > +               /* enable te */
> > +               reg->dpi_ctrl |=3D BIT(8);
> > +
> > +               /* enable stop DONE INT */
> > +               int_mask |=3D DISPC_INT_DONE_MASK;
> > +               /* enable TE INT */
> > +               int_mask |=3D DISPC_INT_TE_MASK;
> > +       }
> > +
> > +       /* enable ifbc payload error INT */
> > +       int_mask |=3D DISPC_INT_FBC_PLD_ERR_MASK;
> > +       /* enable ifbc header error INT */
> > +       int_mask |=3D DISPC_INT_FBC_HDR_ERR_MASK;
> > +       /* enable iommu va out of range read error INT */
> > +       int_mask |=3D DISPC_INT_MMU_VAOR_RD_MASK;
> > +       /* enable iommu va out of range write error INT */
> > +       int_mask |=3D DISPC_INT_MMU_VAOR_WR_MASK;
> > +       /* enable iommu invalid read error INT */
> > +       int_mask |=3D DISPC_INT_MMU_INV_RD_MASK;
> > +       /* enable iommu invalid write error INT */
> > +       int_mask |=3D DISPC_INT_MMU_INV_WR_MASK;
> > +
> > +       reg->dpu_int_en =3D int_mask;
> > +}
> > +
> > +static void enable_vsync(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       reg->dpu_int_en |=3D DISPC_INT_DPI_VSYNC_MASK;
> > +}
> > +
> > +static void disable_vsync(struct dpu_context *ctx)
> > +{
> > +       struct dpu_reg *reg =3D (struct dpu_reg *)ctx->base;
> > +
> > +       reg->dpu_int_en &=3D ~DISPC_INT_DPI_VSYNC_MASK;
> > +}
> > +
> > +static const u32 primary_fmts[] =3D {
> > +       DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > +       DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > +       DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
> > +       DRM_FORMAT_RGBX8888, DRM_FORMAT_BGRX8888,
> > +       DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > +       DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> > +       DRM_FORMAT_NV16, DRM_FORMAT_NV61,
> > +       DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> > +};
> > +
> > +static int dpu_capability(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap)
> > +{
> > +       if (!cap)
> > +               return -EINVAL;
> > +
> > +       cap->max_layers =3D 6;
> > +       cap->fmts_ptr =3D primary_fmts;
> > +       cap->fmts_cnt =3D ARRAY_SIZE(primary_fmts);
> > +
> > +       return 0;
> > +}
> > +
> > +const struct dpu_core_ops sharkl3_dpu_core_ops =3D {
> > +       .init =3D dpu_init,
> > +       .fini =3D dpu_fini,
> > +       .run =3D dpu_run,
> > +       .stop =3D dpu_stop,
> > +       .isr =3D dpu_isr,
> > +       .ifconfig =3D dpu_dpi_init,
> > +       .capability =3D dpu_capability,
> > +       .flip =3D dpu_flip,
> > +       .bg_color =3D dpu_bgcolor,
> > +       .enable_vsync =3D enable_vsync,
> > +       .disable_vsync =3D disable_vsync,
> > +};
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c
> b/drivers/gpu/drm/sprd/sprd_dpu.c
> > new file mode 100644
> > index 0000000..f122b0e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -0,0 +1,586 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_plane_helper.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_dpu.h"
> > +
> > +struct sprd_plane {
> > +       struct drm_plane plane;
> > +       u32 index;
> > +};
> > +
> > +static int sprd_dpu_init(struct sprd_dpu *dpu);
> > +static int sprd_dpu_fini(struct sprd_dpu *dpu);
> > +
> > +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane=
)
> > +{
> > +       return container_of(plane, struct sprd_plane, plane);
> > +}
> > +
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                                 struct drm_plane_state *state)
> > +{
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_plane_atomic_update(struct drm_plane *plane,
> > +                                   struct drm_plane_state *old_state)
> > +{
> > +       struct drm_plane_state *state =3D plane->state;
> > +       struct drm_framebuffer *fb =3D plane->state->fb;
> > +       struct drm_gem_cma_object *cma_obj;
> > +       struct sprd_plane *p =3D to_sprd_plane(plane);
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(plane->state->crtc);
> > +       struct sprd_dpu_layer *layer =3D &dpu->layers[p->index];
> > +       int i;
> > +
> > +       if (plane->state->crtc->state->active_changed) {
> > +               DRM_DEBUG("resume or suspend, no need to update
> plane\n");
> > +               return;
> > +       }
> > +
> > +       layer->index =3D p->index;
> > +       layer->src_x =3D state->src_x >> 16;
> > +       layer->src_y =3D state->src_y >> 16;
> > +       layer->src_w =3D state->src_w >> 16;
> > +       layer->src_h =3D state->src_h >> 16;
> > +       layer->dst_x =3D state->crtc_x;
> > +       layer->dst_y =3D state->crtc_y;
> > +       layer->dst_w =3D state->crtc_w;
> > +       layer->dst_h =3D state->crtc_h;
> > +       layer->alpha =3D state->alpha;
> > +       layer->blending =3D state->pixel_blend_mode;
> > +       layer->rotation =3D state->rotation;
> > +       layer->planes =3D fb->format->num_planes;
> > +       layer->format =3D fb->format->format;
> > +
> > +       DRM_DEBUG("%s() alpha =3D %u, blending =3D %u, rotation =3D %u\=
n",
> > +                 __func__, layer->alpha, layer->blending,
> layer->rotation);
> > +
> > +       for (i =3D 0; i < layer->planes; i++) {
> > +               cma_obj =3D drm_fb_cma_get_gem_obj(fb, i);
> > +               layer->addr[i] =3D cma_obj->paddr + fb->offsets[i];
> > +               layer->pitch[i] =3D fb->pitches[i];
> > +       }
> > +
> > +       dpu->pending_planes++;
> > +}
> > +
> > +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> > +                                    struct drm_plane_state *old_state)
> > +{
> > +       struct sprd_plane *p =3D to_sprd_plane(plane);
> > +
> > +       /*
> > +        * NOTE:
> > +        * The dpu->core->flip() will disable all the planes each time.
> > +        * So there is no need to impliment the atomic_disable()
> function.
> > +        * But this function can not be removed, because it will change
> > +        * to call atomic_update() callback instead. Which will cause
> > +        * kernel panic in sprd_plane_atomic_update().
> > +        *
> > +        * We do nothing here but just print a debug log.
> > +        */
> > +       DRM_DEBUG("%s() layer_id =3D %u\n", __func__, p->index);
> > +}
> > +
> > +static int sprd_plane_create_properties(struct sprd_plane *p, int inde=
x)
> > +{
> > +       unsigned int supported_modes =3D BIT(DRM_MODE_BLEND_PIXEL_NONE)=
 |
> > +                                      BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                                      BIT(DRM_MODE_BLEND_COVERAGE);
> > +
> > +       /* create rotation property */
> > +       drm_plane_create_rotation_property(&p->plane,
> > +                                          DRM_MODE_ROTATE_0,
> > +                                          DRM_MODE_ROTATE_MASK |
> > +                                          DRM_MODE_REFLECT_MASK);
> > +
> > +       /* create alpha property */
> > +       drm_plane_create_alpha_property(&p->plane);
> > +
> > +       /* create blend mode property */
> > +       drm_plane_create_blend_mode_property(&p->plane, supported_modes=
);
> > +
> > +       /* create zpos property */
> > +       drm_plane_create_zpos_immutable_property(&p->plane, index);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> > +       .atomic_check =3D sprd_plane_atomic_check,
> > +       .atomic_update =3D sprd_plane_atomic_update,
> > +       .atomic_disable =3D sprd_plane_atomic_disable,
> > +};
> > +
> > +static const struct drm_plane_funcs sprd_plane_funcs =3D {
> > +       .update_plane =3D drm_atomic_helper_update_plane,
> > +       .disable_plane  =3D drm_atomic_helper_disable_plane,
> > +       .destroy =3D drm_plane_cleanup,
> > +       .reset =3D drm_atomic_helper_plane_reset,
> > +       .atomic_duplicate_state =3D
> drm_atomic_helper_plane_duplicate_state,
> > +       .atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state=
,
> > +};
> > +
> > +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
> > +                                       struct sprd_dpu *dpu)
> > +{
> > +       struct drm_plane *primary =3D NULL;
> > +       struct sprd_plane *p =3D NULL;
> > +       struct dpu_capability cap =3D {};
> > +       int err, i;
> > +
> > +       if (dpu->core && dpu->core->capability)
> > +               dpu->core->capability(&dpu->ctx, &cap);
> > +
> > +       dpu->layers =3D devm_kcalloc(drm->dev, cap.max_layers,
> > +                                 sizeof(struct sprd_dpu_layer),
> GFP_KERNEL);
> > +       if (!dpu->layers)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       for (i =3D 0; i < cap.max_layers; i++) {
> > +
> > +               p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> > +               if (!p)
> > +                       return ERR_PTR(-ENOMEM);
> > +
> > +               err =3D drm_universal_plane_init(drm, &p->plane, 1,
> > +                                              &sprd_plane_funcs,
> cap.fmts_ptr,
> > +                                              cap.fmts_cnt, NULL,
> > +                                              DRM_PLANE_TYPE_PRIMARY,
> NULL);
> > +               if (err) {
> > +                       DRM_ERROR("fail to init primary plane\n");
> > +                       return ERR_PTR(err);
> > +               }
> > +
> > +               drm_plane_helper_add(&p->plane,
> &sprd_plane_helper_funcs);
> > +
> > +               sprd_plane_create_properties(p, i);
> > +
> > +               p->index =3D i;
> > +               if (i =3D=3D 0)
> > +                       primary =3D &p->plane;
> > +       }
> > +
> > +       if (p)
> > +               DRM_INFO("dpu plane init ok\n");
> > +
> > +       return primary;
> > +}
> > +
> > +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       if ((dpu->mode->hdisplay =3D=3D dpu->mode->htotal) ||
> > +           (dpu->mode->vdisplay =3D=3D dpu->mode->vtotal))
> > +               dpu->ctx.if_type =3D SPRD_DISPC_IF_EDPI;
> > +       else
> > +               dpu->ctx.if_type =3D SPRD_DISPC_IF_DPI;
> > +}
> > +
> > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> > +                                       const struct drm_display_mode
> *mode)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_INFO("%s() mode: "DRM_MODE_FMT"\n", __func__,
> DRM_MODE_ARG(mode));
> > +
> > +       if (mode->type & DRM_MODE_TYPE_DEFAULT)
> > +               dpu->mode =3D (struct drm_display_mode *)mode;
> > +
> > +       if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > +               dpu->mode =3D (struct drm_display_mode *)mode;
> > +               drm_display_mode_to_videomode(dpu->mode, &dpu->ctx.vm);
> > +       }
> > +
> > +       return MODE_OK;
> > +}
> > +
> > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                  struct drm_crtc_state *old_state)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_INFO("%s()\n", __func__);
> > +
> > +       sprd_dpu_init(dpu);
> > +
> > +       enable_irq(dpu->ctx.irq);
> > +
> > +       drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                   struct drm_crtc_state *old_state)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +       struct drm_device *drm =3D dpu->crtc.dev;
> > +
> > +       DRM_INFO("%s()\n", __func__);
> > +
> > +       drm_crtc_vblank_off(crtc);
> > +
> > +       disable_irq(dpu->ctx.irq);
> > +
> > +       sprd_dpu_fini(dpu);
> > +
> > +       spin_lock_irq(&drm->event_lock);
> > +       if (crtc->state->event) {
> > +               drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +               crtc->state->event =3D NULL;
> > +       }
> > +       spin_unlock_irq(&drm->event_lock);
> > +}
> > +
> > +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
> > +                                struct drm_crtc_state *state)
> > +{
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
> > +                                 struct drm_crtc_state *old_state)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       memset(dpu->layers, 0, sizeof(*dpu->layers) *
> dpu->pending_planes);
> > +
> > +       dpu->pending_planes =3D 0;
> > +}
> > +
> > +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
> > +                                 struct drm_crtc_state *old_state)
> > +
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +       struct drm_device *drm =3D dpu->crtc.dev;
> > +
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       if (dpu->core && dpu->core->flip && dpu->pending_planes)
> > +               dpu->core->flip(&dpu->ctx, dpu->layers,
> dpu->pending_planes);
> > +
> > +       spin_lock_irq(&drm->event_lock);
> > +       if (crtc->state->event) {
> > +               drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +               crtc->state->event =3D NULL;
> > +       }
> > +       spin_unlock_irq(&drm->event_lock);
> > +}
> > +
> > +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       if (dpu->core && dpu->core->enable_vsync)
> > +               dpu->core->enable_vsync(&dpu->ctx);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> > +       if (dpu->core && dpu->core->disable_vsync)
> > +               dpu->core->disable_vsync(&dpu->ctx);
> > +}
> > +
> > +static int sprd_crtc_create_properties(struct drm_crtc *crtc)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +       struct drm_device *drm =3D dpu->crtc.dev;
> > +       struct drm_property *prop;
> > +       struct drm_property_blob *blob;
> > +       size_t blob_size;
> > +
> > +       blob_size =3D strlen(dpu->ctx.version) + 1;
> > +
> > +       blob =3D drm_property_create_blob(dpu->crtc.dev, blob_size,
> > +                       dpu->ctx.version);
> > +       if (IS_ERR(blob)) {
> > +               DRM_ERROR("drm_property_create_blob dpu version
> failed\n");
> > +               return PTR_ERR(blob);
> > +       }
> > +
> > +       /* create dpu version property */
> > +       prop =3D drm_property_create(drm,
> > +               DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
> > +               "dpu version", 0);
> > +       if (!prop) {
> > +               DRM_ERROR("drm_property_create dpu version failed\n");
> > +               return -ENOMEM;
> > +       }
> > +       drm_object_attach_property(&crtc->base, prop, blob->base.id);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {
> > +       .mode_set_nofb  =3D sprd_crtc_mode_set_nofb,
> > +       .mode_valid     =3D sprd_crtc_mode_valid,
> > +       .atomic_check   =3D sprd_crtc_atomic_check,
> > +       .atomic_begin   =3D sprd_crtc_atomic_begin,
> > +       .atomic_flush   =3D sprd_crtc_atomic_flush,
> > +       .atomic_enable  =3D sprd_crtc_atomic_enable,
> > +       .atomic_disable =3D sprd_crtc_atomic_disable,
> > +};
> > +
> > +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {
> > +       .destroy        =3D drm_crtc_cleanup,
> > +       .set_config     =3D drm_atomic_helper_set_config,
> > +       .page_flip      =3D drm_atomic_helper_page_flip,
> > +       .reset          =3D drm_atomic_helper_crtc_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_st=
ate,
> > +       .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_stat=
e,
> > +       .enable_vblank  =3D sprd_crtc_enable_vblank,
> > +       .disable_vblank =3D sprd_crtc_disable_vblank,
> > +};
> > +
> > +static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *crt=
c,
> > +                        struct drm_plane *primary)
> > +{
> > +       struct device_node *port;
> > +       int err;
> > +
> > +       /*
> > +        * set crtc port so that drm_of_find_possible_crtcs call works
> > +        */
> > +       port =3D of_parse_phandle(drm->dev->of_node, "ports", 0);
> > +       if (!port) {
> > +               DRM_ERROR("find 'ports' phandle of %s failed\n",
> > +                         drm->dev->of_node->full_name);
> > +               return -EINVAL;
> > +       }
> > +       of_node_put(port);
> > +       crtc->port =3D port;
> > +
> > +       err =3D drm_crtc_init_with_planes(drm, crtc, primary, NULL,
> > +                                       &sprd_crtc_funcs, NULL);
> > +       if (err) {
> > +               DRM_ERROR("failed to init crtc.\n");
> > +               return err;
> > +       }
> > +
> > +       drm_mode_crtc_set_gamma_size(crtc, 256);
> > +
> > +       drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
> > +
> > +       sprd_crtc_create_properties(crtc);
> > +
> > +       DRM_INFO("%s() ok\n", __func__);
> > +       return 0;
> > +}
> > +
> > +static int sprd_dpu_init(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       if (dpu->core && dpu->core->init)
> > +               dpu->core->init(ctx);
> > +       if (dpu->core && dpu->core->ifconfig)
> > +               dpu->core->ifconfig(ctx);
> > +
> > +       return 0;
> > +}
> > +
> > +static int sprd_dpu_fini(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       if (dpu->core && dpu->core->fini)
> > +               dpu->core->fini(ctx);
> > +
> > +       return 0;
> > +}
> > +
> > +static irqreturn_t sprd_dpu_isr(int irq, void *data)
> > +{
> > +       struct sprd_dpu *dpu =3D data;
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +       u32 int_mask =3D 0;
> > +
> > +       if (dpu->core && dpu->core->isr)
> > +               int_mask =3D dpu->core->isr(ctx);
> > +
> > +       if (int_mask & DISPC_INT_ERR_MASK)
> > +               DRM_WARN("Warning: dpu underflow!\n");
> > +
> > +       if ((int_mask & DISPC_INT_DPI_VSYNC_MASK))
> > +               drm_crtc_handle_vblank(&dpu->crtc);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int sprd_dpu_irq_request(struct sprd_dpu *dpu)
> > +{
> > +       int err;
> > +       int irq_num;
> > +
> > +       irq_num =3D irq_of_parse_and_map(dpu->dev.of_node, 0);
>
> Use platform_get_irq instead.
>
> > +       if (!irq_num) {
> > +               DRM_ERROR("error: dpu parse irq num failed\n");
> > +               return -EINVAL;
> > +       }
> > +       DRM_INFO("dpu irq_num =3D %d\n", irq_num);
> > +
> > +       irq_set_status_flags(irq_num, IRQ_NOAUTOEN);
>
> I think you shouldn't need this. Make sure you've disabled interrupts
> in the h/w first or that the handler can handle it if you haven't.
>
Sorry, our h/w can't disabled interrupt after power on, so we need to
disabled irq handler when irq request.

>
> > +       err =3D devm_request_irq(&dpu->dev, irq_num, sprd_dpu_isr,
> > +                                       0, "DISPC", dpu);
> > +       if (err) {
> > +               DRM_ERROR("error: dpu request irq failed\n");
> > +               return -EINVAL;
> > +       }
> > +       dpu->ctx.irq =3D irq_num;
> > +
> > +       return 0;
> > +}
> > +
> > +static int sprd_dpu_bind(struct device *dev, struct device *master,
> void *data)
> > +{
> > +       struct drm_device *drm =3D data;
> > +       struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> > +       struct drm_plane *plane;
> > +       int err;
> > +
> > +       DRM_INFO("%s()\n", __func__);
> > +
> > +       plane =3D sprd_plane_init(drm, dpu);
> > +       if (IS_ERR_OR_NULL(plane)) {
> > +               err =3D PTR_ERR(plane);
> > +               return err;
> > +       }
> > +
> > +       err =3D sprd_crtc_init(drm, &dpu->crtc, plane);
> > +       if (err)
> > +               return err;
> > +
> > +       sprd_dpu_irq_request(dpu);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_dpu_unbind(struct device *dev, struct device *master,
> > +       void *data)
> > +{
> > +       struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> > +
> > +       DRM_INFO("%s()\n", __func__);
> > +
> > +       drm_crtc_cleanup(&dpu->crtc);
> > +}
> > +
> > +static const struct component_ops dpu_component_ops =3D {
> > +       .bind =3D sprd_dpu_bind,
> > +       .unbind =3D sprd_dpu_unbind,
> > +};
> > +
> > +static int sprd_dpu_context_init(struct sprd_dpu *dpu,
> > +                               struct device_node *np)
> > +{
> > +       struct resource r;
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       if (of_address_to_resource(np, 0, &r)) {
> > +               DRM_ERROR("parse dt base address failed\n");
> > +               return -ENODEV;
> > +       }
> > +       ctx->base =3D (unsigned long)ioremap(r.start,
> > +                                       resource_size(&r));
> > +       if (ctx->base =3D=3D 0) {
> > +               DRM_ERROR("ioremap base address failed\n");
> > +               return -EFAULT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct sprd_dpu_ops sharkl3_dpu =3D {
> > +       .core =3D &sharkl3_dpu_core_ops,
> > +};
> > +
> > +static const struct of_device_id dpu_match_table[] =3D {
> > +       { .compatible =3D "sprd,sharkl3-dpu",
> > +         .data =3D &sharkl3_dpu },
> > +       { /* sentinel */ },
> > +};
> > +
> > +static int sprd_dpu_probe(struct platform_device *pdev)
> > +{
> > +       struct device_node *np =3D pdev->dev.of_node;
> > +       const struct of_device_id *of_id =3D
> > +               of_match_node(dpu_match_table, np);
>
> Don't need this.
>
> > +       const struct sprd_dpu_ops *pdata;
> > +       struct sprd_dpu *dpu;
> > +       int ret;
> > +
> > +       dpu =3D devm_kzalloc(&pdev->dev, sizeof(*dpu), GFP_KERNEL);
> > +       if (!dpu)
> > +               return -ENOMEM;
> > +
> > +       pdata =3D of_device_get_match_data(&pdev->dev);
> > +       if (pdata) {
> > +               dpu->core =3D pdata->core;
> > +               dpu->ctx.version =3D "dpu-r2p0";
> > +       } else {
> > +               DRM_ERROR("Can't get %s ops data\n", of_id->name);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret =3D sprd_dpu_context_init(dpu, np);
> > +       if (ret)
> > +               return ret;
> > +
> > +       platform_set_drvdata(pdev, dpu);
> > +
> > +       return component_add(&pdev->dev, &dpu_component_ops);
> > +}
> > +
> > +static int sprd_dpu_remove(struct platform_device *pdev)
> > +{
> > +       component_del(&pdev->dev, &dpu_component_ops);
> > +       return 0;
> > +}
> > +
> > +struct platform_driver sprd_dpu_driver =3D {
> > +       .probe =3D sprd_dpu_probe,
> > +       .remove =3D sprd_dpu_remove,
> > +       .driver =3D {
> > +               .name =3D "sprd-dpu-drv",
> > +               .of_match_table =3D dpu_match_table,
> > +       },
> > +};
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc Display Controller Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h
> b/drivers/gpu/drm/sprd/sprd_dpu.h
> > new file mode 100644
> > index 0000000..3e7f91f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
> > @@ -0,0 +1,127 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_DPU_H__
> > +#define __SPRD_DPU_H__
> > +
> > +#include <linux/bug.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/string.h>
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> > +#include <uapi/drm/drm_mode.h>
> > +#include "disp_lib.h"
> > +
> > +#define DISPC_INT_DONE_MASK            BIT(0)
> > +#define DISPC_INT_TE_MASK              BIT(1)
> > +#define DISPC_INT_ERR_MASK             BIT(2)
> > +#define DISPC_INT_EDPI_TE_MASK         BIT(3)
> > +#define DISPC_INT_UPDATE_DONE_MASK     BIT(4)
> > +#define DISPC_INT_DPI_VSYNC_MASK       BIT(5)
> > +#define DISPC_INT_WB_DONE_MASK         BIT(6)
> > +#define DISPC_INT_WB_FAIL_MASK         BIT(7)
> > +
> > +/* NOTE: this mask is not a realy dpu interrupt mask */
> > +#define DISPC_INT_FENCE_SIGNAL_REQUEST BIT(31)
> > +
> > +enum {
> > +       SPRD_DISPC_IF_DBI =3D 0,
> > +       SPRD_DISPC_IF_DPI,
> > +       SPRD_DISPC_IF_EDPI,
> > +       SPRD_DISPC_IF_LIMIT
> > +};
> > +
> > +enum {
> > +       SPRD_IMG_DATA_ENDIAN_B0B1B2B3 =3D 0,
> > +       SPRD_IMG_DATA_ENDIAN_B3B2B1B0,
> > +       SPRD_IMG_DATA_ENDIAN_B2B3B0B1,
> > +       SPRD_IMG_DATA_ENDIAN_B1B0B3B2,
> > +       SPRD_IMG_DATA_ENDIAN_LIMIT
> > +};
> > +
> > +struct sprd_dpu_layer {
> > +       u8 index;
> > +       u8 planes;
> > +       u32 addr[4];
> > +       u32 pitch[4];
> > +       s16 src_x;
> > +       s16 src_y;
> > +       s16 src_w;
> > +       s16 src_h;
> > +       s16 dst_x;
> > +       s16 dst_y;
> > +       u16 dst_w;
> > +       u16 dst_h;
> > +       u32 format;
> > +       u32 alpha;
> > +       u32 blending;
> > +       u32 rotation;
> > +};
> > +
> > +struct dpu_capability {
> > +       u32 max_layers;
> > +       const u32 *fmts_ptr;
> > +       u32 fmts_cnt;
> > +};
> > +
> > +struct dpu_context;
> > +
> > +struct dpu_core_ops {
> > +       int (*init)(struct dpu_context *ctx);
> > +       void (*fini)(struct dpu_context *ctx);
> > +       void (*run)(struct dpu_context *ctx);
> > +       void (*stop)(struct dpu_context *ctx);
> > +       void (*disable_vsync)(struct dpu_context *ctx);
> > +       void (*enable_vsync)(struct dpu_context *ctx);
> > +       u32 (*isr)(struct dpu_context *ctx);
> > +       void (*ifconfig)(struct dpu_context *ctx);
> > +       void (*flip)(struct dpu_context *ctx,
> > +                    struct sprd_dpu_layer layers[], u8 count);
> > +       int (*capability)(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap);
> > +       void (*bg_color)(struct dpu_context *ctx, u32 color);
> > +};
> > +
> > +struct sprd_dpu_ops {
> > +       const struct dpu_core_ops *core;
> > +};
> > +
> > +struct dpu_context {
> > +       unsigned long base;
> > +       const char *version;
> > +       int irq;
> > +       u8 if_type;
> > +       struct videomode vm;
> > +       bool stopped;
> > +       wait_queue_head_t wait_queue;
> > +       bool evt_update;
> > +       bool evt_stop;
> > +};
> > +
> > +struct sprd_dpu {
> > +       struct device dev;
> > +       struct drm_crtc crtc;
> > +       struct dpu_context ctx;
> > +       const struct dpu_core_ops *core;
> > +       struct drm_display_mode *mode;
> > +       struct sprd_dpu_layer *layers;
> > +       u8 pending_planes;
> > +};
> > +
> > +static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
> > +{
> > +       return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
> > +}
> > +
> > +extern const struct dpu_core_ops sharkl3_dpu_core_ops;
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > index 4706185..200020f 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.c
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -200,6 +200,7 @@ static struct platform_driver sprd_drm_driver =3D {
> >
> >  static struct platform_driver *sprd_drm_drivers[]  =3D {
> >         &sprd_drm_driver,
> > +       &sprd_dpu_driver,
> >  };
> >
> >  static int __init sprd_drm_init(void)
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > index edf0881..3c32f3a 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.h
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -13,4 +13,6 @@ struct sprd_drm {
> >         struct drm_device *drm;
> >  };
> >
> > +extern struct platform_driver sprd_dpu_driver;
> > +
> >  #endif /* _SPRD_DRM_H_ */
> > --
> > 2.7.4
> >
>

--000000000000ba3b4505a005f448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 28, 2020 at 4:37 AM Rob H=
erring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org" target=3D"_blank">robh+d=
t@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, Feb 26, 2020 at 3:46 AM Kevin Tang &lt;<a href=3D"mailt=
o:kevin3.tang@gmail.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Adds DPU(Display Processor Unit) support for the Unisoc&#39;s display =
subsystem.<br>
&gt; It&#39;s support multi planes, scaler, rotation, PQ(Picture Quality) a=
nd more.<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A07 +<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 770 ++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0| 586 +++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0| 127 ++++++<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 7 files changed, 1497 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; index 86d95d9..88ab32a 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/Makefile<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -2,4 +2,7 @@<br>
&gt;<br>
&gt;=C2=A0 subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
&gt;<br>
&gt; -obj-y :=3D sprd_drm.o<br>
&gt; +obj-y :=3D sprd_drm.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu.o<br>
&gt; +<br>
&gt; +obj-y +=3D dpu/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dpu/Makefile b/drivers/gpu/drm/sprd/=
dpu/Makefile<br>
&gt; new file mode 100644<br>
&gt; index 0000000..73bd497<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ifdef CONFIG_ARM64<br>
&gt; +KBUILD_CFLAGS +=3D -mstrict-align<br>
&gt; +endif<br>
&gt; +<br>
&gt; +obj-y +=3D dpu_r2p0.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/spr=
d/dpu/dpu_r2p0.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..984fa9b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt; @@ -0,0 +1,770 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/wait.h&gt;<br>
&gt; +#include &lt;linux/workqueue.h&gt;<br>
&gt; +#include &quot;sprd_dpu.h&quot;<br>
&gt; +<br>
&gt; +#define DISPC_INT_FBC_PLD_ERR_MASK=C2=A0 =C2=A0 =C2=A0BIT(8)<br>
&gt; +#define DISPC_INT_FBC_HDR_ERR_MASK=C2=A0 =C2=A0 =C2=A0BIT(9)<br>
&gt; +<br>
&gt; +#define DISPC_INT_MMU_INV_WR_MASK=C2=A0 =C2=A0 =C2=A0 BIT(19)<br>
&gt; +#define DISPC_INT_MMU_INV_RD_MASK=C2=A0 =C2=A0 =C2=A0 BIT(18)<br>
&gt; +#define DISPC_INT_MMU_VAOR_WR_MASK=C2=A0 =C2=A0 =C2=A0BIT(17)<br>
&gt; +#define DISPC_INT_MMU_VAOR_RD_MASK=C2=A0 =C2=A0 =C2=A0BIT(16)<br>
&gt; +<br>
&gt; +struct layer_reg {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pitch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ck;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pallete;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 crop_start;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct wb_region_reg {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* dpu controller register */<br>
&gt; +struct dpu_reg {<br>
<br>
structs for registers is not normal coding style. #defines of offsets<br>
is. More below.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_cfg0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_cfg1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_cfg2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_secure;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x0018_0x001C[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 panel_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 blend_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x0028;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bg_color;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct layer_reg layers[8];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 wb_base_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 wb_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 wb_cfg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 wb_pitch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wb_region_reg region[3];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x01D8_0x01DC[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_int_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_int_clr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_int_sts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_int_raw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpi_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpi_h_timing;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpi_v_timing;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x01FC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_enhance_cfg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x0204_0x020C[3];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 epf_epsilon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 epf_gain0_3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 epf_gain4_7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 epf_diff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x0220_0x023C[8];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hsv_lut_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hsv_lut_wdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 hsv_lut_rdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x024C_0x027C[13];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef01_00;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef03_02;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef11_10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef13_12;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef21_20;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm_coef23_22;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x0298_0x02BC[10];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 slp_cfg0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 slp_cfg1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x02C8_0x02FC[14];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gamma_lut_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gamma_lut_wdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 gamma_lut_rdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x030C_0x033C[13];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum0_start_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum0_end_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum1_start_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum1_end_pos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum0_result;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 checksum1_result;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x035C;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_sts[18];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x03A8_0x03AC[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_fbc_cfg0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 dpu_fbc_cfg1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x03B8_0x03EC[14];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_ram_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_ram_rdata_low;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rf_ram_rdata_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reserved_0x03FC_0x07FC[257];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_update;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_min_vpn;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_vpn_range;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_pt_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_default_page;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_vaor_addr_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_vaor_addr_wr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_inv_addr_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_inv_addr_wr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_uns_addr_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_uns_addr_wr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_miss_cnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_pt_update_qos;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_min_ppn1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_ppn_range1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_min_ppn2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_ppn_range2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_vpn_paor_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_vpn_paor_wr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_ppn_paor_rd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_ppn_paor_wr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_reg_au_manage;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_page_rd_ch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_page_wr_ch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_read_page_cmd_cnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_read_page_latency_cnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_page_max_latency;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void dpu_dump(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *reg =3D (u32 *)ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;=C2=A0 =C2=A0 =C2=A0 0=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 C\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 256; i +=3D 4) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;=
%04x: 0x%08x 0x%08x 0x%08x 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0i * 4, reg[i], reg[i + 1], reg[i + 2], reg[i + 3]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_mask =3D DISPC_INT_MMU_VAOR_RD_MAS=
K |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DISPC_INT_MMU_VAOR_WR_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DISPC_INT_MMU_INV_RD_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DISPC_INT_MMU_INV_WR_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D reg_val &amp; mmu_mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;-=
-- iommu interrupt err: 0x%04x ---\n&quot;, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;i=
ommu invalid read error, addr: 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg-&gt;mmu_inv_addr_rd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;i=
ommu invalid write error, addr: 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg-&gt;mmu_inv_addr_wr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;i=
ommu va out of range read error, addr: 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg-&gt;mmu_vaor_addr_rd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;i=
ommu va out of range write error, addr: 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg-&gt;mmu_vaor_addr_wr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;B=
UG: iommu failure at %s:%d/%s()!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0__FILE__, __LINE__, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_dump(ctx);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_clean_all(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 8; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;layers=
[i].ctrl =3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 dpu_isr(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_val, int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D reg-&gt;dpu_int_sts;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable err interrupt */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; DISPC_INT_ERR_MASK)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_ERR_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu update done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; DISPC_INT_UPDATE_DONE_MA=
SK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_up=
date =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interr=
uptible_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu stop done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; DISPC_INT_DONE_MASK) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_st=
op =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interr=
uptible_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu ifbc payload error isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; DISPC_INT_FBC_PLD_ERR_MA=
SK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_FBC_PLD_ERR_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;d=
pu ifbc payload error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu ifbc header error isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; DISPC_INT_FBC_HDR_ERR_MA=
SK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_FBC_HDR_ERR_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;d=
pu ifbc header error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D check_mmu_isr(ctx, reg_val);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_clr =3D reg_val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en &amp;=3D ~int_mask;<br>
<br>
Also, not coding style. Use readl/writel{_relaxed}. This is fragile<br>
because the compiler has a lot of freedom in what it can do here<br>
including reordering the accesses, changing the access size or<br>
skipping the register access altogether. I don&#39;t think the latter<br>
would happen in this case, but if a read has side effects such as<br>
causing bits to clear you&#39;ll see problems.<br></blockquote><div>This is=
 maybe a bad design for a long time on our platform, <span lang=3D"en"><spa=
n title=3D"">but it =E2=80=99s really convenient,</span></span></div><div><=
span lang=3D"en"><span title=3D"">direct access I/O resources by structs...=
</span></span></div><div><span lang=3D"en"><span title=3D""></span></span><=
/div><div><span lang=3D"en"><span title=3D"">So i will be try use readl/wri=
tel to replace it.<br></span></span></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return reg_val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_wait_stop_done(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D wait_event_interruptible_timeout(ct=
x-&gt;wait_queue, ctx-&gt;evt_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(500));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_stop =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;d=
pu wait for stop done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMED=
OUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_wait_update_done(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_update =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D wait_event_interruptible_timeout(ct=
x-&gt;wait_queue, ctx-&gt;evt_update,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(500));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;d=
pu wait for reg update done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMED=
OUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_stop(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_D=
PI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ct=
rl |=3D BIT(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_done(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;dpu stop\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_run(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ctrl |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;dpu run\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_init(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;bg_color =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (ctx-&gt;vm.vactive &lt;&lt; 16) =
| ctx-&gt;vm.hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;panel_size =3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;blend_size =3D size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg0 =3D BIT(4) | BIT(5);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg1 =3D 0x004466da;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cfg2 =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_clean_all(=
ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_en =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_min_ppn1 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_ppn_range1 =3D 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_min_ppn2 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_ppn_range2 =3D 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;mmu_vpn_range =3D 0x1ffff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_clr =3D 0xffff;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;ctx-&gt;wait_queu=
e);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_fini(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_clr =3D 0xff;<br>
&gt; +}<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_YUV422_2PLANE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_YUV420_2PLANE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_YUV420_3PLANE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_ARGB8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_RGB565,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_XFBC_ARGB8888 =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_XFBC_RGB565,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_FORMAT_MAX_TYPES,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_90,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_180,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_270,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_0_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_90_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_180_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_270_M,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static u32 to_dpu_rotation(u32 angle)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rot =3D DPU_LAYER_ROTATION_0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (angle) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_90:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_90;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_180:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_180;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_270:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_270;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_Y:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_180_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_90_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_X:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_0_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rot =3D DPU_LA=
YER_ROTATION_270_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;r=
otation convert unsupport angle (drm)=3D 0x%x\n&quot;, angle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return rot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 dpu_img_ctrl(u32 format, u32 blending, u32 rotation)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int reg_val =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* layer enable */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (format) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGRA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BGRA8888 -&=
gt; ARGB8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBX8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGBA8888 -&=
gt; ABGR8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ABGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ARGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XBGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XRGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_ARGB8888 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGR565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rb switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGB565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (=
DPU_LAYER_FORMAT_RGB565 &lt;&lt; 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV21:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV422_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV61:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV422_2PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YUV420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_3PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YVU420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D D=
PU_LAYER_FORMAT_YUV420_3PLANE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B0B1B2B3 &lt;&lt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D S=
PRD_IMG_DATA_ENDIAN_B3B2B1B0 &lt;&lt; 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;e=
rror: invalid format %c%c%c%c\n&quot;, format,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0format &gt;&gt; 24);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (blending) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PIXEL_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* don&#39;t d=
o blending, maybe RGBX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_COVERAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Normal mode*=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val &amp;=
=3D (~BIT(16));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PREMULTI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Pre-mult mod=
e*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D B=
IT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D to_dpu_rotation(rotation);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val |=3D (rotation &amp; 0x7) &lt;&lt;=
 20;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return reg_val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_bgcolor(struct dpu_context *ctx, u32 color)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_E=
DPI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_=
done(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;bg_color =3D color;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_clean_all(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_=
DPI) &amp;&amp; !ctx-&gt;stopped) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ct=
rl |=3D BIT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_updat=
e_done(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DIS=
PC_IF_EDPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ct=
rl |=3D BIT(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stoppe=
d =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_layer(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
struct sprd_dpu_layer *hwlayer)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct layer_reg *layer;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr, size, offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer =3D &amp;reg-&gt;layers[hwlayer-&gt;=
index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D (hwlayer-&gt;dst_x &amp; 0xffff=
) | ((hwlayer-&gt;dst_y) &lt;&lt; 16);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwlayer-&gt;src_w &amp;&amp; hwlayer-&=
gt;src_h)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (hwla=
yer-&gt;src_w &amp; 0xffff) | ((hwlayer-&gt;src_h) &lt;&lt; 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (hwla=
yer-&gt;dst_w &amp; 0xffff) | ((hwlayer-&gt;dst_h) &lt;&lt; 16);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; hwlayer-&gt;planes; i=
++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D hwlay=
er-&gt;addr[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr % 16)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_err(&quot;layer addr[%d] is not 16 bytes align, it&#39;s 0=
x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;addr=
[i] =3D addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pos =3D offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;size =3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;crop_start =3D (hwlayer-&gt;src_=
y &lt;&lt; 16) | hwlayer-&gt;src_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;alpha =3D hwlayer-&gt;alpha;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D drm_format_info(hwlayer-&gt;forma=
t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&gt;cpp[0] =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;l=
ayer[%d] bytes per pixel is invalid\n&quot;, hwlayer-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwlayer-&gt;planes =3D=3D 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV pitch is=
 1/2 of Y pitch*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pitc=
h =3D (hwlayer-&gt;pitch[0] / info-&gt;cpp[0]) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(hwlayer-&gt;pitch[0] / info-&gt;=
cpp[0] &lt;&lt; 15);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pitc=
h =3D hwlayer-&gt;pitch[0] / info-&gt;cpp[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;ctrl =3D dpu_img_ctrl(hwlayer-&g=
t;format, hwlayer-&gt;blending,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;ro=
tation);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;dst_x =3D %d, dst_y =3D %d,=
 dst_w =3D %d, dst_h =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;dst_x, hwlayer-&gt;ds=
t_y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;dst_w, hwlayer-&gt;ds=
t_h);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;start_x =3D %d, start_y =3D=
 %d, start_w =3D %d, start_h =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;src_x, hwlayer-&gt;sr=
c_y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;src_w, hwlayer-&gt;sr=
c_h);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_flip(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct sprd_dpu_layer layers[], u8 count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Make sure the dpu is in stop status. DP=
U_R2P0 has no shadow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * registers in EDPI mode. So the config r=
egisters can only be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * updated in the rising edge of DPU_RUN b=
it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_E=
DPI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_=
done(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset the bgcolor to black */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;bg_color =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable all the layers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_clean_all(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* start configure dpu layers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; count; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_layer(ctx,=
 &amp;layers[i]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* update trigger and wait */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_D=
PI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;s=
topped) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg-&gt;dpu_ctrl |=3D BIT(2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu_wait_update_done(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_in=
t_en |=3D DISPC_INT_ERR_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DIS=
PC_IF_EDPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_ct=
rl |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stoppe=
d =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the following interrupt was disabled=
 in isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * re-enable it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en |=3D DISPC_INT_FBC_PLD_=
ERR_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DISPC_INT_FBC_HDR_ERR_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DISPC_INT_MMU_VAOR_RD_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DISPC_INT_MMU_VAOR_WR_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DISPC_INT_MMU_INV_RD_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DISPC_INT_MMU_INV_WR_MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_dpi_init(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DISPC_IF_D=
PI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use dpi as =
interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cf=
g0 &amp;=3D ~BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable Hal=
t function for SPRD DSI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_ct=
rl &amp;=3D ~BIT(16);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* select te f=
rom external pad */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_ct=
rl |=3D BIT(10);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set dpi tim=
ing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_h_=
timing =3D (ctx-&gt;vm.hsync_len &lt;&lt; 0) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ctx-&gt;vm.hback_p=
orch &lt;&lt; 8) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ctx-&gt;vm.hfront_=
porch &lt;&lt; 20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_v_=
timing =3D (ctx-&gt;vm.vsync_len &lt;&lt; 0) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ctx-&gt;vm.vback_p=
orch &lt;&lt; 8) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ctx-&gt;vm.vfront_=
porch &lt;&lt; 20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;vm=
.vsync_len + ctx-&gt;vm.vback_porch &lt; 32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0pr_warn(&quot;Warning: (vsync + vbp) &lt; 32, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;underflow risk!\n&quot;);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
update done INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_UPDATE_DONE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
DONE=C2=A0 INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_DONE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
dpi vsync */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_DPI_VSYNC_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
TE INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_TE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable unde=
rflow err INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_ERR_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable writ=
e back done INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_WB_DONE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable writ=
e back fail INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_WB_FAIL_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DIS=
PC_IF_EDPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use edpi as=
 interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_cf=
g0 |=3D BIT(0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use externa=
l te */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_ct=
rl |=3D BIT(10);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable te *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpi_ct=
rl |=3D BIT(8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable stop=
 DONE INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_DONE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable TE I=
NT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
DISPC_INT_TE_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable ifbc payload error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_FBC_PLD_ERR_MASK;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable ifbc header error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_FBC_HDR_ERR_MASK;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range read error=
 INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_MMU_VAOR_RD_MASK;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range write erro=
r INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_MMU_VAOR_WR_MASK;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu invalid read error INT */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_MMU_INV_RD_MASK;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu invalid write error INT */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D DISPC_INT_MMU_INV_WR_MASK;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en =3D int_mask;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void enable_vsync(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en |=3D DISPC_INT_DPI_VSYN=
C_MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void disable_vsync(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_reg *reg =3D (struct dpu_reg *)=
ctx-&gt;base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg-&gt;dpu_int_en &amp;=3D ~DISPC_INT_DPI=
_VSYNC_MASK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const u32 primary_fmts[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBX8888, DRM_FORMAT_BGRX8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV12, DRM_FORMAT_NV21,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV16, DRM_FORMAT_NV61,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int dpu_capability(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cap)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;max_layers =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_ptr =3D primary_fmts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_cnt =3D ARRAY_SIZE(primary_fm=
ts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +const struct dpu_core_ops sharkl3_dpu_core_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.init =3D dpu_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.fini =3D dpu_fini,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.run =3D dpu_run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.stop =3D dpu_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.isr =3D dpu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifconfig =3D dpu_dpi_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.capability =3D dpu_capability,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.flip =3D dpu_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bg_color =3D dpu_bgcolor,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_vsync =3D enable_vsync,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_vsync =3D disable_vsync,<br>
&gt; +};<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sp=
rd_dpu.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f122b0e<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt; @@ -0,0 +1,586 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_fb_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_plane_helper.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_dpu.h&quot;<br>
&gt; +<br>
&gt; +struct sprd_plane {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 index;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dpu_init(struct sprd_dpu *dpu);<br>
&gt; +static int sprd_dpu_fini(struct sprd_dpu *dpu);<br>
&gt; +<br>
&gt; +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plan=
e)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(plane, struct sprd_pla=
ne, plane);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *st=
ate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_update(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_st=
ate *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state =3D plane-&g=
t;state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D plane-&gt;s=
tate-&gt;fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_cma_object *cma_obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(pla=
ne);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(plane=
-&gt;state-&gt;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu_layer *layer =3D &amp;dpu-=
&gt;layers[p-&gt;index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (plane-&gt;state-&gt;crtc-&gt;state-&gt=
;active_changed) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quo=
t;resume or suspend, no need to update plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;index =3D p-&gt;index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;src_x =3D state-&gt;src_x &gt;&g=
t; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;src_y =3D state-&gt;src_y &gt;&g=
t; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;src_w =3D state-&gt;src_w &gt;&g=
t; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;src_h =3D state-&gt;src_h &gt;&g=
t; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_x =3D state-&gt;crtc_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_y =3D state-&gt;crtc_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_w =3D state-&gt;crtc_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;dst_h =3D state-&gt;crtc_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;alpha =3D state-&gt;alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;blending =3D state-&gt;pixel_ble=
nd_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;rotation =3D state-&gt;rotation;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;planes =3D fb-&gt;format-&gt;num=
_planes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;format =3D fb-&gt;format-&gt;for=
mat;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() alpha =3D %u, blendin=
g =3D %u, rotation =3D %u\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func_=
_, layer-&gt;alpha, layer-&gt;blending, layer-&gt;rotation);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; layer-&gt;planes; i++=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cma_obj =3D dr=
m_fb_cma_get_gem_obj(fb, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;addr=
[i] =3D cma_obj-&gt;paddr + fb-&gt;offsets[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pitc=
h[i] =3D fb-&gt;pitches[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;pending_planes++;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_disable(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane_s=
tate *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(pla=
ne);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * NOTE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The dpu-&gt;core-&gt;flip() will disabl=
e all the planes each time.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * So there is no need to impliment the at=
omic_disable() function.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * But this function can not be removed, b=
ecause it will change<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to call atomic_update() callback instea=
d. Which will cause<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * kernel panic in sprd_plane_atomic_updat=
e().<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We do nothing here but just print a deb=
ug log.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() layer_id =3D %u\n&quo=
t;, __func__, p-&gt;index);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_create_properties(struct sprd_plane *p, int ind=
ex)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int supported_modes =3D BIT(DRM_M=
ODE_BLEND_PIXEL_NONE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MOD=
E_BLEND_PREMULTI) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MOD=
E_BLEND_COVERAGE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create rotation property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_rotation_property(&amp;p-=
&gt;plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_ROTATE_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_ROTATE_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_MODE_REFLECT_MASK);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create alpha property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_alpha_property(&amp;p-&gt=
;plane);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create blend mode property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_blend_mode_property(&amp;=
p-&gt;plane, supported_modes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create zpos property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_create_zpos_immutable_property(&=
amp;p-&gt;plane, index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check =3D sprd_plane_atomic_check,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_update =3D sprd_plane_atomic_updat=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_plane_atomic_disa=
ble,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_plane_funcs sprd_plane_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.update_plane =3D drm_atomic_helper_update=
_plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_plane=C2=A0 =3D drm_atomic_helper=
_disable_plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy =3D drm_plane_cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.reset =3D drm_atomic_helper_plane_reset,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_hel=
per_plane_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state =3D drm_atomic_helpe=
r_plane_destroy_state,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct drm_plane *sprd_plane_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *primary =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_capability cap =3D {};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;capability)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;capability(&amp;dpu-&gt;ctx, &amp;cap);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;layers =3D devm_kcalloc(drm-&gt;de=
v, cap.max_layers,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct sprd_dpu_lay=
er), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpu-&gt;layers)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR=
(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; cap.max_layers; i++) =
{<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D devm_kza=
lloc(drm-&gt;dev, sizeof(*p), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ERR_PTR(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_un=
iversal_plane_init(drm, &amp;p-&gt;plane, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;sprd_plane_funcs, cap.fmts_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 cap.fmts_cnt, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_PLANE_TYPE_PRIMARY, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;fail to init primary plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ERR_PTR(err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_help=
er_add(&amp;p-&gt;plane, &amp;sprd_plane_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_plane_cre=
ate_properties(p, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;index =
=3D i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0primary =3D &amp;p-&gt;plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot=
;dpu plane init ok\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return primary;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((dpu-&gt;mode-&gt;hdisplay =3D=3D dpu-=
&gt;mode-&gt;htotal) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(dpu-&gt;mode-&gt;vdisplay =
=3D=3D dpu-&gt;mode-&gt;vtotal))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if=
_type =3D SPRD_DISPC_IF_EDPI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if=
_type =3D SPRD_DISPC_IF_DPI;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crt=
c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 struct drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s() mode: &quot;DRM_MODE_F=
MT&quot;\n&quot;, __func__, DRM_MODE_ARG(mode));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_DEFA=
ULT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;mode =
=3D (struct drm_display_mode *)mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_PREF=
ERRED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;mode =
=3D (struct drm_display_mode *)mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display_mo=
de_to_videomode(dpu-&gt;mode, &amp;dpu-&gt;ctx.vm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *ol=
d_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu_init(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_irq(dpu-&gt;ctx.irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_on(crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_sta=
te *old_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=
=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_off(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0disable_irq(dpu-&gt;ctx.irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu_fini(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;drm-&gt;event_lock);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_=
vblank_event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state=
-&gt;event =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;drm-&gt;event_lock);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *state)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *old=
_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(dpu-&gt;layers, 0, sizeof(*dpu-&gt;=
layers) * dpu-&gt;pending_planes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;pending_planes =3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *old=
_state)<br>
&gt; +<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=
=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;flip &amp;&amp; dpu-&gt;pending_planes)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;flip(&amp;dpu-&gt;ctx, dpu-&gt;layers, dpu-&gt;pending_planes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;drm-&gt;event_lock);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_=
vblank_event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state=
-&gt;event =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;drm-&gt;event_lock);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;enable_vsync)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;enable_vsync(&amp;dpu-&gt;ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;disable_vsync)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;disable_vsync(&amp;dpu-&gt;ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_create_properties(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=
=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property_blob *blob;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t blob_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0blob_size =3D strlen(dpu-&gt;ctx.version) =
+ 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0blob =3D drm_property_create_blob(dpu-&gt;=
<a href=3D"http://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</=
a>, blob_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu-&gt;ctx.version);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(blob)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;drm_property_create_blob dpu version failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(blob);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* create dpu version property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create(drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_MODE_PROP_=
IMMUTABLE | DRM_MODE_PROP_BLOB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dpu vers=
ion&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;drm_property_create dpu version failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_object_attach_property(&amp;crtc-&gt;b=
ase, prop, blob-&gt;<a href=3D"http://base.id" rel=3D"noreferrer" target=3D=
"_blank">base.id</a>);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_set_nofb=C2=A0 =3D sprd_crtc_mode_se=
t_nofb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid=C2=A0 =C2=A0 =C2=A0=3D sprd_cr=
tc_mode_valid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0=3D sprd_crtc_at=
omic_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_begin=C2=A0 =C2=A0=3D sprd_crtc_at=
omic_begin,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_flush=C2=A0 =C2=A0=3D sprd_crtc_at=
omic_flush,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_enable=C2=A0 =3D sprd_crtc_atomic_=
enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_crtc_atomic_disab=
le,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.destroy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dr=
m_crtc_cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_config=C2=A0 =C2=A0 =C2=A0=3D drm_ato=
mic_helper_set_config,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.page_flip=C2=A0 =C2=A0 =C2=A0 =3D drm_ato=
mic_helper_page_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D drm_atomic_helper_crtc_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_hel=
per_crtc_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D drm_=
atomic_helper_crtc_destroy_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_vblank=C2=A0 =3D sprd_crtc_enable_=
vblank,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_vblank =3D sprd_crtc_disable_vbla=
nk,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *cr=
tc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 struct drm_plane *primary)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * set crtc port so that drm_of_find_possi=
ble_crtcs call works<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D of_parse_phandle(drm-&gt;dev-&gt;=
of_node, &quot;ports&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;find &#39;ports&#39; phandle of %s failed\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0drm-&gt;dev-&gt;of_node-&gt;full_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;port =3D port;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_crtc_init_with_planes(drm, crt=
c, primary, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
sprd_crtc_funcs, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to init crtc.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_crtc_set_gamma_size(crtc, 256);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_helper_add(crtc, &amp;sprd_crtc_h=
elper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_crtc_create_properties(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s() ok\n&quot;, __func__);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;init)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;init(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;ifconfig)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;ifconfig(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_fini(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;fini)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;fini(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t sprd_dpu_isr(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;isr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask =3D d=
pu-&gt;core-&gt;isr(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (int_mask &amp; DISPC_INT_ERR_MASK)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot=
;Warning: dpu underflow!\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((int_mask &amp; DISPC_INT_DPI_VSYNC_MA=
SK))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_handl=
e_vblank(&amp;dpu-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_irq_request(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq_num;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_num =3D irq_of_parse_and_map(dpu-&gt;d=
ev.of_node, 0);<br>
<br>
Use platform_get_irq instead.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irq_num) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;error: dpu parse irq num failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;dpu irq_num =3D %d\n&quot;,=
 irq_num);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_status_flags(irq_num, IRQ_NOAUTOEN=
);<br>
<br>
I think you shouldn&#39;t need this. Make sure you&#39;ve disabled interrup=
ts<br>
in the h/w first or that the handler can handle it if you haven&#39;t.<br><=
/blockquote><div>Sorry, our h/w can&#39;t disabled interrupt after power on=
, so we need to disabled irq handler when irq request.<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D devm_request_irq(&amp;dpu-&gt;dev,=
 irq_num, sprd_dpu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, &q=
uot;DISPC&quot;, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;error: dpu request irq failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.irq =3D irq_num;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_bind(struct device *dev, struct device *master, v=
oid *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D dev_get_drvdata(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0plane =3D sprd_plane_init(drm, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(plane)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D PTR_ER=
R(plane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D sprd_crtc_init(drm, &amp;dpu-&gt;c=
rtc, plane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu_irq_request(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_unbind(struct device *dev, struct device *master=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D dev_get_drvdata(d=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;%s()\n&quot;, __func__);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_cleanup(&amp;dpu-&gt;crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_ops dpu_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bind =3D sprd_dpu_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_dpu_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dpu_context_init(struct sprd_dpu *dpu,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_address_to_resource(np, 0, &amp;r))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;parse dt base address failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;base =3D (unsigned long)ioremap(r.=
start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resou=
rce_size(&amp;r));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;base =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;ioremap base address failed\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct sprd_dpu_ops sharkl3_dpu =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.core =3D &amp;sharkl3_dpu_core_ops,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id dpu_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,sharkl3-dpu&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;sharkl3_dpu },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dpu_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of=
_node;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_device_id *of_id =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_match_node(=
dpu_match_table, np);<br>
<br>
Don&#39;t need this.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct sprd_dpu_ops *pdata;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu =3D devm_kzalloc(&amp;pdev-&gt;dev, si=
zeof(*dpu), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpu)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pdata =3D of_device_get_match_data(&amp;pd=
ev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core =
=3D pdata-&gt;core;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;ctx.ve=
rsion =3D &quot;dpu-r2p0&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;Can&#39;t get %s ops data\n&quot;, of_id-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sprd_dpu_context_init(dpu, np);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return component_add(&amp;pdev-&gt;dev, &a=
mp;dpu_component_ops);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0component_del(&amp;pdev-&gt;dev, &amp;dpu_=
component_ops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct platform_driver sprd_dpu_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D sprd_dpu_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D sprd_dpu_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quo=
t;sprd-dpu-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D dpu_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com"=
 target=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uniso=
c.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Unisoc Display Controller Driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sp=
rd_dpu.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..3e7f91f<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt; @@ -0,0 +1,127 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __SPRD_DPU_H__<br>
&gt; +#define __SPRD_DPU_H__<br>
&gt; +<br>
&gt; +#include &lt;linux/bug.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/string.h&gt;<br>
&gt; +#include &lt;video/videomode.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_crtc.h&gt;<br>
&gt; +#include &lt;drm/drm_fourcc.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +#include &lt;uapi/drm/drm_mode.h&gt;<br>
&gt; +#include &quot;disp_lib.h&quot;<br>
&gt; +<br>
&gt; +#define DISPC_INT_DONE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(0)<br>
&gt; +#define DISPC_INT_TE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(1)<br>
&gt; +#define DISPC_INT_ERR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(2)<br>
&gt; +#define DISPC_INT_EDPI_TE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(3=
)<br>
&gt; +#define DISPC_INT_UPDATE_DONE_MASK=C2=A0 =C2=A0 =C2=A0BIT(4)<br>
&gt; +#define DISPC_INT_DPI_VSYNC_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(5)<br>
&gt; +#define DISPC_INT_WB_DONE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(6=
)<br>
&gt; +#define DISPC_INT_WB_FAIL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(7=
)<br>
&gt; +<br>
&gt; +/* NOTE: this mask is not a realy dpu interrupt mask */<br>
&gt; +#define DISPC_INT_FENCE_SIGNAL_REQUEST BIT(31)<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DISPC_IF_DBI =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DISPC_IF_DPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DISPC_IF_EDPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DISPC_IF_LIMIT<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_IMG_DATA_ENDIAN_B0B1B2B3 =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_IMG_DATA_ENDIAN_B3B2B1B0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_IMG_DATA_ENDIAN_B2B3B0B1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_IMG_DATA_ENDIAN_B1B0B3B2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_IMG_DATA_ENDIAN_LIMIT<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_dpu_layer {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 index;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 planes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pitch[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 src_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 src_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 src_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 src_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 dst_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0s16 dst_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dst_w;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dst_h;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 blending;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rotation;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_capability {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const u32 *fmts_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fmts_cnt;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_context;<br>
&gt; +<br>
&gt; +struct dpu_core_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*init)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*fini)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*run)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*stop)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*disable_vsync)(struct dpu_context *=
ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enable_vsync)(struct dpu_context *c=
tx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 (*isr)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*ifconfig)(struct dpu_context *ctx);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*flip)(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct sprd_dpu_layer layers[], u8 count);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*capability)(struct dpu_context *ctx,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*bg_color)(struct dpu_context *ctx, =
u32 color);<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_dpu_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dpu_core_ops *core;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 if_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool stopped;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t wait_queue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool evt_update;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool evt_stop;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_dpu {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dpu_core_ops *core;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu_layer *layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pending_planes;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return crtc ? container_of(crtc, struct sp=
rd_dpu, crtc) : NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +extern const struct dpu_core_ops sharkl3_dpu_core_ops;<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; index 4706185..200020f 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -200,6 +200,7 @@ static struct platform_driver sprd_drm_driver =3D =
{<br>
&gt;<br>
&gt;=C2=A0 static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_dpu_driver,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static int __init sprd_drm_init(void)<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sp=
rd_drm.h<br>
&gt; index edf0881..3c32f3a 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -13,4 +13,6 @@ struct sprd_drm {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +extern struct platform_driver sprd_dpu_driver;<br>
&gt; +<br>
&gt;=C2=A0 #endif /* _SPRD_DRM_H_ */<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</blockquote></div></div>

--000000000000ba3b4505a005f448--

--===============2104388746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2104388746==--
