Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89D2EBB6B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205889DFC;
	Wed,  6 Jan 2021 08:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEF36E0D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:09:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id l11so71726412lfg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pqRu0Hqgj2lk7JFT/arkBwsWjkIbYBXTAuSqve1Wbng=;
 b=Tp8p5pKqJnTiroXBlrujWLTOtZwB+k8u+IxNCirosm1lKlp9mS5cfz5x0Inylfg/Db
 2//tUNQkJbvWXdhLth2wDgDu1qdtkyXisIQHCppwu9eh31kSzlO0AL5FQsKaGhhM6s6T
 tWTSxHFa81q6UvGKIFECom+96pZ88GF8hplKZOWI/DmW1H8UIY8di4tHVYWWUOkwCkPa
 47LVbw6ZfAIxx4lf/cc1BSdyvWpxhqpoB9si5oYmH1TiWjCAZiEg9fNxNKk4a8Vikt4T
 W7OaNhUWQtwYV8Awoqc6a3bgeDllZ0CogT0Mi1HkHT4l8Zde0OAC33nKizhUsOkwJEar
 6oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pqRu0Hqgj2lk7JFT/arkBwsWjkIbYBXTAuSqve1Wbng=;
 b=JTaGQbtmOxqn2ouA99l+DszVLvo0mdHO4yyFxg4Jr9nXthelxJE5IFttg778FfqD0v
 pVYPu4tmukrPiUTv2QpFynCRR4DW640WI8yheyfnApszauQ8qlPWTgnBFP0+TLVEI+b7
 ld1WgHMMF56/GqFuAvSGcPZC8OHgzkcxwvNpbfX9PtkR1KTbe690x9Wc0BUW5Hz8wjZy
 q6TQnaaY+qZDSbTbDX1Zl1F6eQubVf3uHfvlGB2wOFfMEwMIoWHO9eNhVXdKO2wbF0Za
 sj3n2fNhTquqgEYrdrdJ8RaA0jcTVPDqYA4Ea0HlaG6qtjp/XWi+FDqlFx24JSfqDVZy
 htMg==
X-Gm-Message-State: AOAM530sRxlwCVhbSoRL6PDLkSq0lbk5TpXREcs2XlE1Ttff+3cJdjgX
 7qWcG8HxvvViHa76F9TJkwTs0HjXd1iOWWxzSBTBmljVVRQ=
X-Google-Smtp-Source: ABdhPJzMYJhZ5eyaPJ9UiKEI37LLxsE+2XdwPa0qDihG3pjOgBoyfZeSZjRIwPCju/zKlfl81G0jM8EYXZEM0NFqEGE=
X-Received: by 2002:a05:6512:10ce:: with SMTP id
 k14mr31594125lfg.177.1609844973967; 
 Tue, 05 Jan 2021 03:09:33 -0800 (PST)
MIME-Version: 1.0
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-5-git-send-email-kevin3.tang@gmail.com>
 <CAKMK7uE=86hRWdowXWVrE5184-gS2TYPArC1XcqTXwRQxHRMHg@mail.gmail.com>
In-Reply-To: <CAKMK7uE=86hRWdowXWVrE5184-gS2TYPArC1XcqTXwRQxHRMHg@mail.gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Tue, 5 Jan 2021 19:09:21 +0800
Message-ID: <CAFPSGXZefHGqjidPdGJJd_V6m0e-noMkVDmbdqUFjqVLuZi-NQ@mail.gmail.com>
Subject: Re: [PATCH RFC v6 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Kevin Tang <kevin3.tang@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Content-Type: multipart/mixed; boundary="===============0640845066=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0640845066==
Content-Type: multipart/alternative; boundary="000000000000d11bf505b8253ddc"

--000000000000d11bf505b8253ddc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> =E4=BA=8E2020=E5=B9=B47=E6=9C=8829=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:51=E5=86=99=E9=81=93=EF=BC=9A

> On Tue, Jul 28, 2020 at 12:08 PM Kevin Tang <kevin3.tang@gmail.com> wrote=
:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds DPU(Display Processor Unit) support for the Unisoc's display
> subsystem.
> > It's support multi planes, scaler, rotation, PQ(Picture Quality) and
> more.
> >
> > RFC v6:
> >   - Access registers via readl/writel
> >   - Checking for unsupported KMS properties (format, rotation,
> blend_mode, etc) on plane_check ops
> >   - Remove always true checks for dpu core ops
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
>
> Quickly scrolled through this, and the entire thing very much leaves a
> midlayer heavy aftertaste. Do we really need stuff like struct dpu_layer
> and struct dpu_core_ops? They only seem to complicate the code base, and
> seem to have no real reason. The indirection with first computing registe=
r
> values into a sprd_plane/crtc structure, and then writing it into hardwar=
e
> is also a bit much - I recommend to only do that if you have to compute
> values in _check to validate them, so that the computation doesn't have t=
o
> be repeated in the commit phase functions.
>
> Also, the layer and pending_flips stuff in sprd_dpu don't work with
> atomic, that races. You have to put all that stuff into state objects, or
> if it's some data shared with interrupt handlers (doesn't seem to be the
> case here), it needs its own locking, and any data you need in the
> interrupt handler must be copied over.
>
> Also no devm_kzalloc for anything containined a drm_* structure, that's
> the wrong lifetime.
>
> So yeah high level review is that I think this driver would benefit a lot
> from a pile of demidlayer.
>
> Cheers, Daniel
>
Hi Daniel,
After a long time of thinking, I think you are right, the stuff layer of
dpu_layer and dpu_core_ops
maybe no need for us now. So i will delete "dpu_layer" on patch v3, and
commit layer information directly
in atomic_update.

Because only one dpu h/w verison been submitt now, so i have delete
"dpu_core_ops" on patch v2.
After the basic version is submitted, I will start preparing for the
support of multiple h/w versions,
but it will take some time, because our different h/w versions all have
some differences.

Only drm format convert to dpu format need to check on atomic_check, i'm
not sure if drm framework
will help filter out illegal formats, so i add layer format check on
atomic_check,
as for rotation, blend mode, i think it just give a default value,  it
maybe work well.

Best Wishes

>
> > ---
> >  drivers/gpu/drm/sprd/Makefile       |   5 +-
> >  drivers/gpu/drm/sprd/dpu/Makefile   |   3 +
> >  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 503 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.c     | 646
> ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h     | 187 +++++++++++
> >  drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
> >  7 files changed, 1346 insertions(+), 1 deletion(-)
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
> > index 0000000..40278b6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-y +=3D dpu_r2p0.o
> > diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > new file mode 100644
> > index 0000000..4b9521d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > @@ -0,0 +1,503 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include "sprd_dpu.h"
> > +
> > +/* DPU registers size, 4 Bytes(32 Bits) */
> > +#define DPU_REG_SIZE   0x04
> > +
> > +/* Layer registers offset */
> > +#define DPU_LAY_REG_OFFSET     0x0C
> > +
> > +#define DPU_LAY_REG(reg, index) \
> > +       (reg + index * DPU_LAY_REG_OFFSET * DPU_REG_SIZE)
> > +
> > +#define DPU_REG_RD(reg) readl_relaxed(reg)
> > +
> > +#define DPU_REG_WR(reg, mask) writel_relaxed(mask, reg)
> > +
> > +#define DPU_REG_SET(reg, mask) \
> > +       writel_relaxed(readl_relaxed(reg) | mask, reg)
> > +
> > +#define DPU_REG_CLR(reg, mask) \
> > +       writel_relaxed(readl_relaxed(reg) & ~mask, reg)
> > +
> > +/* Global control registers */
> > +#define REG_DPU_CTRL   0x04
> > +#define REG_DPU_CFG0   0x08
> > +#define REG_DPU_CFG1   0x0C
> > +#define REG_DPU_CFG2   0x10
> > +#define REG_PANEL_SIZE 0x20
> > +#define REG_BLEND_SIZE 0x24
> > +#define REG_BG_COLOR   0x2C
> > +
> > +/* Layer0 control registers */
> > +#define REG_LAY_BASE_ADDR0     0x30
> > +#define REG_LAY_BASE_ADDR1     0x34
> > +#define REG_LAY_BASE_ADDR2     0x38
> > +#define REG_LAY_CTRL           0x40
> > +#define REG_LAY_SIZE           0x44
> > +#define REG_LAY_PITCH          0x48
> > +#define REG_LAY_POS            0x4C
> > +#define REG_LAY_ALPHA          0x50
> > +#define REG_LAY_PALLETE                0x58
> > +#define REG_LAY_CROP_START     0x5C
> > +
> > +/* Interrupt control registers */
> > +#define REG_DPU_INT_EN         0x1E0
> > +#define REG_DPU_INT_CLR                0x1E4
> > +#define REG_DPU_INT_STS                0x1E8
> > +
> > +/* DPI control registers */
> > +#define REG_DPI_CTRL           0x1F0
> > +#define REG_DPI_H_TIMING       0x1F4
> > +#define REG_DPI_V_TIMING       0x1F8
> > +
> > +/* MMU control registers */
> > +#define REG_MMU_EN                     0x800
> > +#define REG_MMU_VPN_RANGE              0x80C
> > +#define REG_MMU_VAOR_ADDR_RD           0x818
> > +#define REG_MMU_VAOR_ADDR_WR           0x81C
> > +#define REG_MMU_INV_ADDR_RD            0x820
> > +#define REG_MMU_INV_ADDR_WR            0x824
> > +#define REG_MMU_PPN1                   0x83C
> > +#define REG_MMU_RANGE1                 0x840
> > +#define REG_MMU_PPN2                   0x844
> > +#define REG_MMU_RANGE2                 0x848
> > +
> > +/* Global control bits */
> > +#define BIT_DPU_RUN                    BIT(0)
> > +#define BIT_DPU_STOP                   BIT(1)
> > +#define BIT_DPU_REG_UPDATE             BIT(2)
> > +#define BIT_DPU_IF_EDPI                        BIT(0)
> > +#define BIT_DPU_COEF_NARROW_RANGE              BIT(4)
> > +#define BIT_DPU_Y2R_COEF_ITU709_STANDARD       BIT(5)
> > +
> > +/* Layer control bits */
> > +#define BIT_DPU_LAY_EN                         BIT(0)
> > +
> > +/* Interrupt control & status bits */
> > +#define BIT_DPU_INT_DONE               BIT(0)
> > +#define BIT_DPU_INT_TE                 BIT(1)
> > +#define BIT_DPU_INT_ERR                        BIT(2)
> > +#define BIT_DPU_INT_UPDATE_DONE                BIT(4)
> > +#define BIT_DPU_INT_VSYNC              BIT(5)
> > +#define BIT_DPU_INT_FBC_PLD_ERR                BIT(8)
> > +#define BIT_DPU_INT_FBC_HDR_ERR                BIT(9)
> > +#define BIT_DPU_INT_MMU_VAOR_RD                BIT(16)
> > +#define BIT_DPU_INT_MMU_VAOR_WR                BIT(17)
> > +#define BIT_DPU_INT_MMU_INV_RD         BIT(18)
> > +#define BIT_DPU_INT_MMU_INV_WR         BIT(19)
> > +
> > +/* DPI control bits */
> > +#define BIT_DPU_EDPI_TE_EN             BIT(8)
> > +#define BIT_DPU_EDPI_FROM_EXTERNAL_PAD BIT(10)
> > +#define BIT_DPU_DPI_HALT_EN            BIT(16)
> > +
> > +
> > +static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)
> > +{
> > +       u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |
> > +                       BIT_DPU_INT_MMU_VAOR_WR |
> > +                       BIT_DPU_INT_MMU_INV_RD |
> > +                       BIT_DPU_INT_MMU_INV_WR;
> > +       u32 val =3D reg_val & mmu_mask;
> > +       int i;
> > +
> > +       if (val) {
> > +               DRM_ERROR("--- iommu interrupt err: 0x%04x ---\n", val)=
;
> > +
> > +               if (val & BIT_DPU_INT_MMU_INV_RD)
> > +                       DRM_ERROR("iommu invalid read error, addr:
> 0x%08x\n",
> > +                               DPU_REG_RD(ctx->base +
> REG_MMU_INV_ADDR_RD));
> > +               if (val & BIT_DPU_INT_MMU_INV_WR)
> > +                       DRM_ERROR("iommu invalid write error, addr:
> 0x%08x\n",
> > +                               DPU_REG_RD(ctx->base +
> REG_MMU_INV_ADDR_WR));
> > +               if (val & BIT_DPU_INT_MMU_VAOR_RD)
> > +                       DRM_ERROR("iommu va out of range read error,
> addr: 0x%08x\n",
> > +                               DPU_REG_RD(ctx->base +
> REG_MMU_VAOR_ADDR_RD));
> > +               if (val & BIT_DPU_INT_MMU_VAOR_WR)
> > +                       DRM_ERROR("iommu va out of range write error,
> addr: 0x%08x\n",
> > +                               DPU_REG_RD(ctx->base +
> REG_MMU_VAOR_ADDR_WR));
> > +
> > +               for (i =3D 0; i < 8; i++) {
> > +                       reg_val =3D DPU_REG_RD(ctx->base +
> DPU_LAY_REG(REG_LAY_CTRL, i));
> > +                       if (reg_val & 0x1)
> > +                               DRM_INFO("layer%d: 0x%08x 0x%08x 0x%08x
> ctrl: 0x%08x\n", i,
> > +                                       DPU_REG_RD(ctx->base +
> DPU_LAY_REG(REG_LAY_BASE_ADDR0, i)),
> > +                                       DPU_REG_RD(ctx->base +
> DPU_LAY_REG(REG_LAY_BASE_ADDR1, i)),
> > +                                       DPU_REG_RD(ctx->base +
> DPU_LAY_REG(REG_LAY_BASE_ADDR2, i)),
> > +                                       DPU_REG_RD(ctx->base +
> DPU_LAY_REG(REG_LAY_CTRL, i)));
> > +               }
> > +       }
> > +
> > +       return val;
> > +}
> > +
> > +static void dpu_clean_all(struct dpu_context *ctx)
> > +{
> > +       int i;
> > +
> > +       for (i =3D 0; i < 8; i++)
> > +               DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL, i),
> 0x00);
> > +}
> > +
> > +static u32 dpu_isr(struct dpu_context *ctx)
> > +{
> > +       u32 reg_val, int_mask =3D 0;
> > +
> > +       reg_val =3D DPU_REG_RD(ctx->base + REG_DPU_INT_STS);
> > +
> > +       /* disable err interrupt */
> > +       if (reg_val & BIT_DPU_INT_ERR)
> > +               int_mask |=3D BIT_DPU_INT_ERR;
> > +
> > +       /* dpu update done isr */
> > +       if (reg_val & BIT_DPU_INT_UPDATE_DONE) {
> > +               ctx->evt_update =3D true;
> > +               wake_up_interruptible_all(&ctx->wait_queue);
> > +       }
> > +
> > +       /* dpu stop done isr */
> > +       if (reg_val & BIT_DPU_INT_DONE) {
> > +               ctx->evt_stop =3D true;
> > +               wake_up_interruptible_all(&ctx->wait_queue);
> > +       }
> > +
> > +       /* dpu ifbc payload error isr */
> > +       if (reg_val & BIT_DPU_INT_FBC_PLD_ERR) {
> > +               int_mask |=3D BIT_DPU_INT_FBC_PLD_ERR;
> > +               DRM_ERROR("dpu ifbc payload error\n");
> > +       }
> > +
> > +       /* dpu ifbc header error isr */
> > +       if (reg_val & BIT_DPU_INT_FBC_HDR_ERR) {
> > +               int_mask |=3D BIT_DPU_INT_FBC_HDR_ERR;
> > +               DRM_ERROR("dpu ifbc header error\n");
> > +       }
> > +
> > +       int_mask |=3D check_mmu_isr(ctx, reg_val);
> > +
> > +       DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, reg_val);
> > +       DPU_REG_CLR(ctx->base + REG_DPU_INT_EN, int_mask);
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
> > +               DRM_ERROR("dpu wait for stop done time out!\n");
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
> > +               DRM_ERROR("dpu wait for reg update done time out!\n");
> > +               return -ETIMEDOUT;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void dpu_stop(struct dpu_context *ctx)
> > +{
> > +       if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI)
> > +               DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_STOP);
> > +
> > +       dpu_wait_stop_done(ctx);
> > +}
> > +
> > +static void dpu_run(struct dpu_context *ctx)
> > +{
> > +       DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_RUN);
> > +
> > +       ctx->stopped =3D false;
> > +}
> > +
> > +static void dpu_init(struct dpu_context *ctx)
> > +{
> > +       u32 reg_val, size;
> > +
> > +       DPU_REG_WR(ctx->base + REG_BG_COLOR, 0x00);
> > +
> > +       size =3D (ctx->vm.vactive << 16) | ctx->vm.hactive;
> > +
> > +       DPU_REG_WR(ctx->base + REG_PANEL_SIZE, size);
> > +       DPU_REG_WR(ctx->base + REG_BLEND_SIZE, size);
> > +
> > +       reg_val =3D BIT_DPU_COEF_NARROW_RANGE |
> BIT_DPU_Y2R_COEF_ITU709_STANDARD;
> > +       DPU_REG_WR(ctx->base + REG_DPU_CFG0, reg_val);
> > +       DPU_REG_WR(ctx->base + REG_DPU_CFG1, 0x004466da);
> > +       DPU_REG_WR(ctx->base + REG_DPU_CFG2, 0x00);
> > +
> > +       if (ctx->stopped)
> > +               dpu_clean_all(ctx);
> > +
> > +       DPU_REG_WR(ctx->base + REG_MMU_EN, 0x00);
> > +       DPU_REG_WR(ctx->base + REG_MMU_PPN1, 0x00);
> > +       DPU_REG_WR(ctx->base + REG_MMU_RANGE1, 0xffff);
> > +       DPU_REG_WR(ctx->base + REG_MMU_PPN2, 0x00);
> > +       DPU_REG_WR(ctx->base + REG_MMU_RANGE2, 0xffff);
> > +       DPU_REG_WR(ctx->base + REG_MMU_VPN_RANGE, 0x1ffff);
> > +
> > +       DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, 0xffff);
> > +}
> > +
> > +static void dpu_fini(struct dpu_context *ctx)
> > +{
> > +       DPU_REG_WR(ctx->base + REG_DPU_INT_EN, 0x00);
> > +       DPU_REG_WR(ctx->base + REG_DPU_INT_CLR, 0xff);
> > +}
> > +
> > +static void dpu_layer(struct dpu_context *ctx,
> > +                   struct dpu_layer *hwlayer)
> > +{
> > +       const struct drm_format_info *info;
> > +       u32 size, offset, ctrl, pitch;
> > +       int i;
> > +
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
> > +       for (i =3D 0; i < hwlayer->planes; i++)
> > +               DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_BASE_ADDR0,
> > +                               hwlayer->index), hwlayer->addr[i]);
> > +
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_POS,
> > +                       hwlayer->index), offset);
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_SIZE,
> > +                       hwlayer->index), size);
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CROP_START,
> > +                       hwlayer->index), hwlayer->src_y << 16 |
> hwlayer->src_x);
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_ALPHA,
> > +                       hwlayer->index), hwlayer->alpha);
> > +
> > +       info =3D drm_format_info(hwlayer->format);
> > +       if (hwlayer->planes =3D=3D 3) {
> > +               /* UV pitch is 1/2 of Y pitch*/
> > +               pitch =3D (hwlayer->pitch[0] / info->cpp[0]) |
> > +                               (hwlayer->pitch[0] / info->cpp[0] << 15=
);
> > +               DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_PITCH,
> > +                               hwlayer->index), pitch);
> > +       } else {
> > +               pitch =3D hwlayer->pitch[0] / info->cpp[0];
> > +               DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_PITCH,
> > +                               hwlayer->index), pitch);
> > +       }
> > +
> > +       ctrl =3D hwlayer->format |
> > +               hwlayer->blending |
> > +               (hwlayer->rotation & 0x7) << 20;
> > +
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL,
> > +                       hwlayer->index), ctrl);
> > +       DPU_REG_WR(ctx->base + DPU_LAY_REG(REG_LAY_CTRL,
> > +                       hwlayer->index), BIT_DPU_LAY_EN);
> > +
> > +       DRM_DEBUG("dst_x =3D %d, dst_y =3D %d, dst_w =3D %d, dst_h =3D =
%d\n",
> > +                               hwlayer->dst_x, hwlayer->dst_y,
> > +                               hwlayer->dst_w, hwlayer->dst_h);
> > +       DRM_DEBUG("start_x =3D %d, start_y =3D %d, start_w =3D %d, star=
t_h =3D
> %d\n",
> > +                               hwlayer->src_x, hwlayer->src_y,
> > +                               hwlayer->src_w, hwlayer->src_h);
> > +}
> > +
> > +static void dpu_flip(struct dpu_context *ctx,
> > +                    struct dpu_layer layers[], u8 count)
> > +{
> > +       int i;
> > +       u32 reg_val;
> > +
> > +       /*
> > +        * Make sure the dpu is in stop status. DPU_R2P0 has no shadow
> > +        * registers in EDPI mode. So the config registers can only be
> > +        * updated in the rising edge of DPU_RUN bit.
> > +        */
> > +       if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI)
> > +               dpu_wait_stop_done(ctx);
> > +
> > +       /* reset the bgcolor to black */
> > +       DPU_REG_WR(ctx->base + REG_BG_COLOR, 0x00);
> > +
> > +       /* disable all the layers */
> > +       dpu_clean_all(ctx);
> > +
> > +       /* start configure dpu layers */
> > +       for (i =3D 0; i < count; i++)
> > +               dpu_layer(ctx, &layers[i]);
> > +
> > +       /* update trigger and wait */
> > +       if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > +               if (!ctx->stopped) {
> > +                       DPU_REG_SET(ctx->base + REG_DPU_CTRL,
> BIT_DPU_REG_UPDATE);
> > +                       dpu_wait_update_done(ctx);
> > +               }
> > +
> > +               DPU_REG_SET(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_ERR=
);
> > +       } else if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI) {
> > +               DPU_REG_SET(ctx->base + REG_DPU_CTRL, BIT_DPU_RUN);
> > +
> > +               ctx->stopped =3D false;
> > +       }
> > +
> > +       /*
> > +        * If the following interrupt was disabled in isr,
> > +        * re-enable it.
> > +        */
> > +       reg_val =3D BIT_DPU_INT_FBC_PLD_ERR |
> > +                 BIT_DPU_INT_FBC_HDR_ERR |
> > +                 BIT_DPU_INT_MMU_VAOR_RD |
> > +                 BIT_DPU_INT_MMU_VAOR_WR |
> > +                 BIT_DPU_INT_MMU_INV_RD |
> > +                 BIT_DPU_INT_MMU_INV_WR;
> > +       DPU_REG_SET(ctx->base + REG_DPU_INT_EN, reg_val);
> > +
> > +}
> > +
> > +static void dpu_dpi_init(struct dpu_context *ctx)
> > +{
> > +       u32 int_mask =3D 0;
> > +       u32 reg_val;
> > +
> > +       if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > +               /* use dpi as interface */
> > +               DPU_REG_CLR(ctx->base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > +
> > +               /* disable Halt function for SPRD DSI */
> > +               DPU_REG_CLR(ctx->base + REG_DPI_CTRL,
> BIT_DPU_DPI_HALT_EN);
> > +
> > +               /* select te from external pad */
> > +               DPU_REG_SET(ctx->base + REG_DPI_CTRL,
> BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > +
> > +               /* set dpi timing */
> > +               reg_val =3D ctx->vm.hsync_len << 0 |
> > +                         ctx->vm.hback_porch << 8 |
> > +                         ctx->vm.hfront_porch << 20;
> > +               DPU_REG_WR(ctx->base + REG_DPI_H_TIMING, reg_val);
> > +
> > +               reg_val =3D ctx->vm.vsync_len << 0 |
> > +                         ctx->vm.vback_porch << 8 |
> > +                         ctx->vm.vfront_porch << 20;
> > +               DPU_REG_WR(ctx->base + REG_DPI_V_TIMING, reg_val);
> > +
> > +               if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> > +                       DRM_WARN("Warning: (vsync + vbp) < 32, "
> > +                               "underflow risk!\n");
> > +
> > +               /* enable dpu update done INT */
> > +               int_mask |=3D BIT_DPU_INT_UPDATE_DONE;
> > +               /* enable dpu DONE  INT */
> > +               int_mask |=3D BIT_DPU_INT_DONE;
> > +               /* enable dpu dpi vsync */
> > +               int_mask |=3D BIT_DPU_INT_VSYNC;
> > +               /* enable dpu TE INT */
> > +               int_mask |=3D BIT_DPU_INT_TE;
> > +               /* enable underflow err INT */
> > +               int_mask |=3D BIT_DPU_INT_ERR;
> > +       } else if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI) {
> > +               /* use edpi as interface */
> > +               DPU_REG_SET(ctx->base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > +
> > +               /* use external te */
> > +               DPU_REG_SET(ctx->base + REG_DPI_CTRL,
> BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > +
> > +               /* enable te */
> > +               DPU_REG_SET(ctx->base + REG_DPI_CTRL,
> BIT_DPU_EDPI_TE_EN);
> > +
> > +               /* enable stop DONE INT */
> > +               int_mask |=3D BIT_DPU_INT_DONE;
> > +               /* enable TE INT */
> > +               int_mask |=3D BIT_DPU_INT_TE;
> > +       }
> > +
> > +       /* enable ifbc payload error INT */
> > +       int_mask |=3D BIT_DPU_INT_FBC_PLD_ERR;
> > +       /* enable ifbc header error INT */
> > +       int_mask |=3D BIT_DPU_INT_FBC_HDR_ERR;
> > +       /* enable iommu va out of range read error INT */
> > +       int_mask |=3D BIT_DPU_INT_MMU_VAOR_RD;
> > +       /* enable iommu va out of range write error INT */
> > +       int_mask |=3D BIT_DPU_INT_MMU_VAOR_WR;
> > +       /* enable iommu invalid read error INT */
> > +       int_mask |=3D BIT_DPU_INT_MMU_INV_RD;
> > +       /* enable iommu invalid write error INT */
> > +       int_mask |=3D BIT_DPU_INT_MMU_INV_WR;
> > +
> > +       DPU_REG_WR(ctx->base + REG_DPU_INT_EN, int_mask);
> > +}
> > +
> > +static void enable_vsync(struct dpu_context *ctx)
> > +{
> > +       DPU_REG_SET(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
> > +}
> > +
> > +static void disable_vsync(struct dpu_context *ctx)
> > +{
> > +       DPU_REG_CLR(ctx->base + REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
> > +}
> > +
> > +static const u32 primary_fmts[] =3D {
> > +       DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > +       DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > +       DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
> > +       DRM_FORMAT_RGBX8888, DRM_FORMAT_RGB565,
> > +       DRM_FORMAT_BGR565, DRM_FORMAT_NV12,
> > +       DRM_FORMAT_NV21, DRM_FORMAT_NV16,
> > +       DRM_FORMAT_NV61, DRM_FORMAT_YUV420,
> > +       DRM_FORMAT_YVU420,
> > +};
> > +
> > +static void dpu_capability(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap)
> > +{
> > +       cap->max_layers =3D 6;
> > +       cap->fmts_ptr =3D primary_fmts;
> > +       cap->fmts_cnt =3D ARRAY_SIZE(primary_fmts);
> > +}
> > +
> > +const struct dpu_core_ops dpu_r2p0_core_ops =3D {
> > +       .init =3D dpu_init,
> > +       .fini =3D dpu_fini,
> > +       .run =3D dpu_run,
> > +       .stop =3D dpu_stop,
> > +       .isr =3D dpu_isr,
> > +       .ifconfig =3D dpu_dpi_init,
> > +       .capability =3D dpu_capability,
> > +       .flip =3D dpu_flip,
> > +       .enable_vsync =3D enable_vsync,
> > +       .disable_vsync =3D disable_vsync,
> > +};
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c
> b/drivers/gpu/drm/sprd/sprd_dpu.c
> > new file mode 100644
> > index 0000000..5ec8e7c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -0,0 +1,646 @@
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
> > +       u32 addr[4];
> > +       u32 pitch[4];
> > +       u32 format;
> > +       u32 rotation;
> > +       u32 blend_mode;
> > +};
> > +
> > +static void sprd_dpu_init(struct sprd_dpu *dpu);
> > +static void sprd_dpu_fini(struct sprd_dpu *dpu);
> > +
> > +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane=
)
> > +{
> > +       return container_of(plane, struct sprd_plane, plane);
> > +}
> > +
> > +static int sprd_plane_format_convert(u32 fourcc, u32 *format)
> > +{
> > +       switch (fourcc) {
> > +       case DRM_FORMAT_BGRA8888:
> > +               /* BGRA8888 -> ARGB8888 */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +               *format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +               break;
> > +       case DRM_FORMAT_RGBX8888:
> > +       case DRM_FORMAT_RGBA8888:
> > +               /* RGBA8888 -> ABGR8888 */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ABGR8888:
> > +               /* RB switch */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_ARGB8888:
> > +               *format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +               break;
> > +       case DRM_FORMAT_XBGR8888:
> > +               /* RB switch */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_XRGB8888:
> > +               *format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +               break;
> > +       case DRM_FORMAT_BGR565:
> > +               /* RB switch */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               /* FALLTHRU */
> > +       case DRM_FORMAT_RGB565:
> > +               *format |=3D BIT_DPU_LAY_FORMAT_RGB565;
> > +               break;
> > +       case DRM_FORMAT_NV12:
> > +               /* 2-Lane: Yuv420 */
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +               break;
> > +       case DRM_FORMAT_NV21:
> > +               /* 2-Lane: Yuv420 */
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               break;
> > +       case DRM_FORMAT_NV16:
> > +               /* 2-Lane: Yuv422 */
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               break;
> > +       case DRM_FORMAT_NV61:
> > +               /* 2-Lane: Yuv422 */
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +               break;
> > +       case DRM_FORMAT_YUV420:
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +               break;
> > +       case DRM_FORMAT_YVU420:
> > +               *format |=3D BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
> > +               /* Y endian */
> > +               *format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +               /* UV endian */
> > +               *format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int sprd_plane_rotation_convert(u32 angle, u32 *rotation)
> > +{
> > +       switch (angle) {
> > +       case DRM_MODE_ROTATE_0:
> > +               *rotation =3D DPU_LAYER_ROTATION_0;
> > +               break;
> > +       case DRM_MODE_ROTATE_90:
> > +               *rotation =3D DPU_LAYER_ROTATION_90;
> > +               break;
> > +       case DRM_MODE_ROTATE_180:
> > +               *rotation =3D DPU_LAYER_ROTATION_180;
> > +               break;
> > +       case DRM_MODE_ROTATE_270:
> > +               *rotation =3D DPU_LAYER_ROTATION_270;
> > +               break;
> > +       case DRM_MODE_REFLECT_Y:
> > +               *rotation =3D DPU_LAYER_ROTATION_180_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> > +               *rotation =3D DPU_LAYER_ROTATION_90_M;
> > +               break;
> > +       case DRM_MODE_REFLECT_X:
> > +               *rotation =3D DPU_LAYER_ROTATION_0_M;
> > +               break;
> > +       case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> > +               *rotation =3D DPU_LAYER_ROTATION_270_M;
> > +               break;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                                 struct drm_plane_state *state)
> > +{
> > +       struct sprd_plane *p =3D to_sprd_plane(plane);
> > +       struct drm_framebuffer *fb =3D state->fb;
> > +       struct drm_gem_cma_object *cma_obj;
> > +       int i, ret;
> > +       u32 addr;
> > +
> > +       if (!state->fb || !state->crtc)
> > +               return 0;
> > +
> > +       ret =3D sprd_plane_format_convert(fb->format->format,
> > +                                       &p->format);
> > +       if (ret < 0) {
> > +               DRM_ERROR("Invalid plane format\n");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D sprd_plane_rotation_convert(state->rotation,
> > +                                       &p->rotation);
> > +       if (ret < 0) {
> > +               DRM_ERROR("Invalid plane rotation\n");
> > +               return ret;
> > +       }
> > +
> > +       switch (state->pixel_blend_mode) {
> > +       case DRM_MODE_BLEND_COVERAGE:
> > +               /* alpha mode select - combo alpha */
> > +               p->blend_mode |=3D BIT_DPU_LAY_COMBO_ALPHA;
> > +               /* Normal mode */
> > +               p->blend_mode |=3D BIT_DPU_LAY_MODE_BLEND_NORMAL;
> > +               break;
> > +       case DRM_MODE_BLEND_PREMULTI:
> > +               /* alpha mode select - combo alpha */
> > +               p->blend_mode |=3D BIT_DPU_LAY_COMBO_ALPHA;
> > +               /* Pre-mult mode */
> > +               p->blend_mode |=3D BIT_DPU_LAY_MODE_BLEND_PREMULT;
> > +               break;
> > +       case DRM_MODE_BLEND_PIXEL_NONE:
> > +       default:
> > +               /* don't do blending, maybe RGBX */
> > +               /* alpha mode select - layer alpha */
> > +               p->blend_mode |=3D BIT_DPU_LAY_LAYER_ALPHA;
> > +               break;
> > +       }
> > +
> > +       for (i =3D 0; i < fb->format->num_planes; i++) {
> > +               cma_obj =3D drm_fb_cma_get_gem_obj(fb, i);
> > +               addr =3D cma_obj->paddr + fb->offsets[i];
> > +               if (addr % 16) {
> > +                       DRM_ERROR("layer addr[%d] is not 16 bytes align=
,
> it's 0x%08x\n",
> > +                               i, addr);
> > +                       return -EFAULT;
> > +               }
> > +
> > +               p->addr[i] =3D addr;
> > +               p->pitch[i] =3D fb->pitches[i];
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_plane_atomic_update(struct drm_plane *plane,
> > +                                   struct drm_plane_state *old_state)
> > +{
> > +       struct drm_plane_state *state =3D plane->state;
> > +       struct drm_framebuffer *fb =3D plane->state->fb;
> > +       struct sprd_plane *p =3D to_sprd_plane(plane);
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(plane->state->crtc);
> > +       struct dpu_layer *layer =3D &dpu->layers[p->index];
> > +       int i;
> > +
> > +       if (!state->crtc || !state->fb)
> > +               return;
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
> > +       layer->format =3D p->format;
> > +       layer->blending =3D p->blend_mode;
> > +       layer->rotation =3D p->rotation;
> > +       layer->planes =3D fb->format->num_planes;
> > +
> > +       for (i =3D 0; i < layer->planes; i++) {
> > +               layer->addr[i] =3D p->addr[i];
> > +               layer->pitch[i] =3D p->pitch[i];
> > +       }
> > +
> > +       dpu->pending_planes++;
> > +}
> > +
> > +static void sprd_plane_create_properties(struct sprd_plane *p, int
> index)
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
> > +}
> > +
> > +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> > +       .atomic_check =3D sprd_plane_atomic_check,
> > +       .atomic_update =3D sprd_plane_atomic_update,
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
> > +       int ret, i;
> > +
> > +       dpu->core->capability(&dpu->ctx, &cap);
> > +
> > +       dpu->layers =3D devm_kcalloc(drm->dev, cap.max_layers,
> > +                                 sizeof(struct dpu_layer), GFP_KERNEL)=
;
> > +       if (!dpu->layers)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       for (i =3D 0; i < cap.max_layers; i++) {
> > +
> > +               p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
> > +               if (!p)
> > +                       return ERR_PTR(-ENOMEM);
> > +
> > +               ret =3D drm_universal_plane_init(drm, &p->plane, 1,
> > +                                              &sprd_plane_funcs,
> cap.fmts_ptr,
> > +                                              cap.fmts_cnt, NULL,
> > +                                              DRM_PLANE_TYPE_PRIMARY,
> NULL);
> > +               if (ret) {
> > +                       DRM_ERROR("fail to init primary plane\n");
> > +                       return ERR_PTR(ret);
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
> > +       return primary;
> > +}
> > +
> > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> > +                                       const struct drm_display_mode
> *mode)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       DRM_DEBUG("%s() mode: "DRM_MODE_FMT"\n", __func__,
> DRM_MODE_ARG(mode));
> > +
> > +       if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > +               drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> > +
> > +               if ((mode->hdisplay =3D=3D mode->htotal) ||
> > +                   (mode->vdisplay =3D=3D mode->vtotal))
> > +                       dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
> > +               else
> > +                       dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
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
> > +       sprd_dpu_init(dpu);
> > +
> > +       enable_irq(dpu->ctx.irq);
> > +}
> > +
> > +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                   struct drm_crtc_state *old_state)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +       struct drm_device *drm =3D dpu->crtc.dev;
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
> > +       if (dpu->pending_planes)
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
> > +       dpu->core->enable_vsync(&dpu->ctx);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +
> > +       dpu->core->disable_vsync(&dpu->ctx);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {
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
> > +       int ret;
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
> > +       ret =3D drm_crtc_init_with_planes(drm, crtc, primary, NULL,
> > +                                       &sprd_crtc_funcs, NULL);
> > +       if (ret) {
> > +               DRM_ERROR("failed to init crtc.\n");
> > +               return ret;
> > +       }
> > +
> > +       drm_mode_crtc_set_gamma_size(crtc, 256);
> > +
> > +       drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_dpu_init(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       dpu->core->init(ctx);
> > +       dpu->core->ifconfig(ctx);
> > +}
> > +
> > +static void sprd_dpu_fini(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       dpu->core->fini(ctx);
> > +}
> > +
> > +static irqreturn_t sprd_dpu_isr(int irq, void *data)
> > +{
> > +       struct sprd_dpu *dpu =3D data;
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +       u32 int_mask =3D 0;
> > +
> > +       int_mask =3D dpu->core->isr(ctx);
> > +
> > +       if (int_mask & BIT_DPU_INT_ERR)
> > +               DRM_WARN("Warning: dpu underflow!\n");
> > +
> > +       if (int_mask & BIT_DPU_INT_VSYNC)
> > +               drm_crtc_handle_vblank(&dpu->crtc);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int sprd_dpu_bind(struct device *dev, struct device *master,
> void *data)
> > +{
> > +       struct drm_device *drm =3D data;
> > +       struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> > +       struct drm_plane *plane;
> > +       int ret;
> > +
> > +       plane =3D sprd_plane_init(drm, dpu);
> > +       if (IS_ERR_OR_NULL(plane)) {
> > +               ret =3D PTR_ERR(plane);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D sprd_crtc_init(drm, &dpu->crtc, plane);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> > +static void sprd_dpu_unbind(struct device *dev, struct device *master,
> > +       void *data)
> > +{
> > +       struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
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
> > +                               struct device *dev)
> > +{
> > +       struct platform_device *pdev =3D to_platform_device(dev);
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +       struct resource *res;
> > +       int ret;
> > +
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       ctx->base =3D devm_ioremap(dev, res->start, resource_size(res))=
;
> > +       if (!ctx->base) {
> > +               DRM_ERROR("failed to map dpu registers\n");
> > +               return -EFAULT;
> > +       }
> > +
> > +       ctx->irq =3D platform_get_irq(pdev, 0);
> > +       if (ctx->irq < 0) {
> > +               DRM_ERROR("failed to get dpu irq\n");
> > +               return ctx->irq;
> > +       }
> > +
> > +       irq_set_status_flags(ctx->irq, IRQ_NOAUTOEN);
> > +       ret =3D devm_request_irq(dev, ctx->irq, sprd_dpu_isr,
> > +                                       0, "DPU", dpu);
> > +       if (ret) {
> > +               DRM_ERROR("failed to register dpu irq handler\n");
> > +               return ret;
> > +       }
> > +
> > +       init_waitqueue_head(&ctx->wait_queue);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct sprd_dpu_ops sharkl3_dpu =3D {
> > +       .core =3D &dpu_r2p0_core_ops,
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
> > +       } else {
> > +               DRM_ERROR("No matching driver data found\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       ret =3D sprd_dpu_context_init(dpu, &pdev->dev);
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
> > index 0000000..7d3c5e4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
> > @@ -0,0 +1,187 @@
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
> > +
> > +#define BIT_DPU_INT_DONE_              BIT(0)
> > +#define BIT_DPU_INT_TE                 BIT(1)
> > +#define BIT_DPU_INT_ERR                        BIT(2)
> > +#define BIT_DPU_INT_EDPI_TE            BIT(3)
> > +#define BIT_DPU_INT_UPDATE_DONE                BIT(4)
> > +#define BIT_DPU_INT_VSYNC              BIT(5)
> > +#define BIT_DPU_INT_WB_DONE            BIT(6)
> > +#define BIT_DPU_INT_WB_ERR             BIT(7)
> > +
> > +#define BIT_DPU_LAY_LAYER_ALPHA                        (0x01 << 2)
> > +#define BIT_DPU_LAY_COMBO_ALPHA                        (0x02 << 2)
> > +#define BIT_DPU_LAY_FORMAT_YUV422_2PLANE               (0x00 << 4)
> > +#define BIT_DPU_LAY_FORMAT_YUV420_2PLANE               (0x01 << 4)
> > +#define BIT_DPU_LAY_FORMAT_YUV420_3PLANE               (0x02 << 4)
> > +#define BIT_DPU_LAY_FORMAT_ARGB8888                    (0x03 << 4)
> > +#define BIT_DPU_LAY_FORMAT_RGB565                      (0x04 << 4)
> > +#define BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3               (0x00 << 8)
> > +#define BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0               (0x01 << 8)
> > +#define BIT_DPU_LAY_NO_SWITCH                  (0x00 << 10)
> > +#define BIT_DPU_LAY_RB_OR_UV_SWITCH            (0x01 << 10)
> > +#define BIT_DPU_LAY_MODE_BLEND_NORMAL          (0x00 << 16)
> > +#define BIT_DPU_LAY_MODE_BLEND_PREMULT         (0x01 << 16)
> > +
> > +enum {
> > +       SPRD_DPU_IF_DBI =3D 0,
> > +       SPRD_DPU_IF_DPI,
> > +       SPRD_DPU_IF_EDPI,
> > +       SPRD_DPU_IF_LIMIT
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
> > +struct dpu_layer {
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
> > +/**
> > + * Sprd DPU capability structure
> > + *
> > + * @max_layers: maximum number of layers available
> > + * @fmts_ptr: A pointer to array of supported pixel formats
> > + * @fmts_cnt: the number of format on @fmts_ptr
> > + */
> > +struct dpu_capability {
> > +       u32 max_layers;
> > +       const u32 *fmts_ptr;
> > +       u32 fmts_cnt;
> > +};
> > +
> > +/**
> > + * Sprd DPU core callback ops
> > + *
> > + * This structure decribes the display controller common
> > + * callback ops
> > + *
> > + * @init: initial DPU core
> > + * @fini: cleanup DPU core
> > + * @run: enable DPU output
> > + * @stop: disable DPU output
> > + * @enable_vsync: enable vblank interrupt
> > + * @disable_vsync: disable vblank interrupt
> > + * @isr: function pointer to the isr
> > + * @ifconfig: initial DPI interface
> > + * @flip: commit CRTC planes to DPU
> > + * @capability: callback for DPU capabilities
> > + */
> > +struct dpu_context;
> > +struct dpu_core_ops {
> > +       void (*init)(struct dpu_context *ctx);
> > +       void (*fini)(struct dpu_context *ctx);
> > +       void (*run)(struct dpu_context *ctx);
> > +       void (*stop)(struct dpu_context *ctx);
> > +       void (*enable_vsync)(struct dpu_context *ctx);
> > +       void (*disable_vsync)(struct dpu_context *ctx);
> > +       u32 (*isr)(struct dpu_context *ctx);
> > +       void (*ifconfig)(struct dpu_context *ctx);
> > +       void (*flip)(struct dpu_context *ctx,
> > +                    struct dpu_layer layers[], u8 count);
> > +       void (*capability)(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap);
> > +};
> > +
> > +/**
> > + * Sprd DPU context structure
> > + *
> > + * @base: DPU controller base address
> > + * @irq: IRQ number to install the handler for
> > + * @if_type: The type of DPI interface, default is DPI mode.
> > + * @vm: videomode structure to use for DPU and DPI initialization
> > + * @stopped: indicates whether DPU are stopped
> > + * @wait_queue: wait queue, used to wait for DPU shadow register updat=
e
> done and
> > + * DPU stop register done interrupt signal.
> > + * @evt_update: wait queue condition for DPU shadow register
> > + * @evt_stop: wait queue condition for DPU stop register
> > + */
> > +struct dpu_context {
> > +       void __iomem *base;
> > +       int irq;
> > +       u8 if_type;
> > +       struct videomode vm;
> > +       bool stopped;
> > +       wait_queue_head_t wait_queue;
> > +       bool evt_update;
> > +       bool evt_stop;
> > +};
> > +
> > +/**
> > + * Sprd DPU device structure
> > + *
> > + * @crtc: DRM crtc
> > + * @ctx: A pointer to the DPU's implementation specific context
> > + * @core: pointer to callbacks for DPU core functionality
> > + * @layers: active DPU layers ready to commit
> > + * @pending_planes: the number of layers on @layers
> > + */
> > +struct sprd_dpu {
> > +       struct drm_crtc crtc;
> > +       struct dpu_context ctx;
> > +       const struct dpu_core_ops *core;
> > +       struct dpu_layer *layers;
> > +       u8 pending_planes;
> > +};
> > +
> > +/**
> > + * Sprd DPU H/W callback ops match table structure
> > + * The structure used for matching a specific device callback ops
> > + *
> > + * @core: pointer to callbacks for DPU core functionality
> > + */
> > +struct sprd_dpu_ops {
> > +       const struct dpu_core_ops *core;
> > +};
> > +
> > +static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)
> > +{
> > +       return crtc ? container_of(crtc, struct sprd_dpu, crtc) : NULL;
> > +}
> > +
> > +extern const struct dpu_core_ops dpu_r2p0_core_ops;
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
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000d11bf505b8253ddc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; =E4=BA=8E2020=E5=B9=B47=E6=9C=8829=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=885:51=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jul =
28, 2020 at 12:08 PM Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gmail.com=
" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt;<br>
&gt; Adds DPU(Display Processor Unit) support for the Unisoc&#39;s display =
subsystem.<br>
&gt; It&#39;s support multi planes, scaler, rotation, PQ(Picture Quality) a=
nd more.<br>
&gt;<br>
&gt; RFC v6:<br>
&gt;=C2=A0 =C2=A0- Access registers via readl/writel<br>
&gt;=C2=A0 =C2=A0- Checking for unsupported KMS properties (format, rotatio=
n, blend_mode, etc) on plane_check ops<br>
&gt;=C2=A0 =C2=A0- Remove always true checks for dpu core ops<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
<br>
Quickly scrolled through this, and the entire thing very much leaves a<br>
midlayer heavy aftertaste. Do we really need stuff like struct dpu_layer<br=
>
and struct dpu_core_ops? They only seem to complicate the code base, and<br=
>
seem to have no real reason. The indirection with first computing register<=
br>
values into a sprd_plane/crtc structure, and then writing it into hardware<=
br>
is also a bit much - I recommend to only do that if you have to compute<br>
values in _check to validate them, so that the computation doesn&#39;t have=
 to<br>
be repeated in the commit phase functions.<br>
<br>
Also, the layer and pending_flips stuff in sprd_dpu don&#39;t work with<br>
atomic, that races. You have to put all that stuff into state objects, or<b=
r>
if it&#39;s some data shared with interrupt handlers (doesn&#39;t seem to b=
e the<br>
case here), it needs its own locking, and any data you need in the<br>
interrupt handler must be copied over.<br>
<br>
Also no devm_kzalloc for anything containined a drm_* structure, that&#39;s=
<br>
the wrong lifetime.<br>
<br>
So yeah high level review is that I think this driver would benefit a lot<b=
r>
from a pile of demidlayer.<br>
<br>
Cheers, Daniel<br></blockquote><div>Hi Daniel,</div><div><span class=3D"gma=
il-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span=
 class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b=
"><span>After a long time of thinking, </span></span></span>I think you are=
 right, the stuff layer of dpu_layer and dpu_core_ops</span></span></span><=
/div><div><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ=
4b gmail-ChMk0b"><span>maybe no need for us now. So i will delete &quot;dpu=
_layer&quot; on patch v3, and commit<span class=3D"gmail-VIiyi" lang=3D"en"=
><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span> layer information directl=
y</span></span></span></span></span></span></div><div><span class=3D"gmail-=
VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span cl=
ass=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><=
span>in atomic_update.</span></span></span></span></span></span></div><div>=
<span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-C=
hMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-J=
LqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span cla=
ss=3D"gmail-JLqJ4b gmail-ChMk0b"><span><br></span></span></span></span></sp=
an></span></span></span></span></div><div><span class=3D"gmail-VIiyi" lang=
=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmai=
l-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span =
class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"=
><span>Because only one dpu h/w verison been submitt now, so i have delete =
&quot;dpu_core_ops&quot; on patch v2.</span></span></span></span></span></s=
pan></span></span></span></div><div><span class=3D"gmail-VIiyi" lang=3D"en"=
><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi=
" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=
=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><spa=
n><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail=
-ChMk0b"><span>After the basic version is submitted,<span class=3D"gmail-VI=
iyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span> <span cla=
ss=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><s=
pan>I will start preparing for the support of multiple h/w versions,</span>=
</span></span></span></span></span></span></span></span></span></span></spa=
n></span></span></span></span></span></span></div><div><span class=3D"gmail=
-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span c=
lass=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b">=
<span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b g=
mail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"g=
mail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><sp=
an class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" la=
ng=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>but it will take =
some time, <span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLq=
J4b gmail-ChMk0b"><span>because our different h/w versions all have some di=
fferences.</span></span></span></span></span></span></span></span></span></=
span></span></span></span></span></span></span></span></span></span></span>=
</span></div><div><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gm=
ail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><spa=
n class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lan=
g=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><br></span></span>=
</span></span></span></span></span></span></span></div><div><span class=3D"=
gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><s=
pan class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChM=
k0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLq=
J4b gmail-ChMk0b"><span></span></span></span></span></span></span></span></=
span></span></div><div><span class=3D"gmail-VIiyi" lang=3D"en"><span class=
=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en=
"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiy=
i" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>Only drm for=
mat convert to dpu format need to check on atomic_check,<span class=3D"gmai=
l-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span> i&#39=
;m not sure if drm framework</span></span></span></span></span></span></spa=
n></span></span></span></span></span></div><div><span class=3D"gmail-VIiyi"=
 lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D=
"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><=
span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-Ch=
Mk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JL=
qJ4b gmail-ChMk0b"><span>will help filter out illegal formats, so i add lay=
er format check on atomic_check,<br></span></span></span></span></span></sp=
an></span></span></span></span></span></span></div><div><span class=3D"gmai=
l-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span =
class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"=
><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b =
gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"=
gmail-JLqJ4b gmail-ChMk0b"><span>as for rotation, blend mode, i think it ju=
st give a default value,=C2=A0 it maybe work well.<br></span></span></span>=
</span></span></span></span></span></span></span></span></span></div><div><=
span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-Ch=
Mk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JL=
qJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span clas=
s=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"e=
n"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><br></span></span></span=
></span></span></span></span></span></span></span></span></span></div><div>=
<span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-C=
hMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-J=
LqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span cla=
ss=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-VIiyi" lang=3D"=
en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-Ri=
chText gmail-ztext gmail-CopyrightRichText-richText"><span class=3D"gmail-R=
ichText gmail-ztext gmail-CopyrightRichText-richText">Best Wishes</span></s=
pan></span></span></span></span></span></span></span></span></span></span><=
/span></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 503 ++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0| 646 +++++++=
+++++++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0| 187 +++++++=
++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 7 files changed, 1346 insertions(+), 1 deletion(-)<br>
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
&gt; index 0000000..40278b6<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +obj-y +=3D dpu_r2p0.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/spr=
d/dpu/dpu_r2p0.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4b9521d<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt; @@ -0,0 +1,503 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/wait.h&gt;<br>
&gt; +#include &lt;linux/workqueue.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_dpu.h&quot;<br>
&gt; +<br>
&gt; +/* DPU registers size, 4 Bytes(32 Bits) */<br>
&gt; +#define DPU_REG_SIZE=C2=A0 =C2=A00x04<br>
&gt; +<br>
&gt; +/* Layer registers offset */<br>
&gt; +#define DPU_LAY_REG_OFFSET=C2=A0 =C2=A0 =C2=A00x0C<br>
&gt; +<br>
&gt; +#define DPU_LAY_REG(reg, index) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(reg + index * DPU_LAY_REG_OFFSET * DPU_RE=
G_SIZE)<br>
&gt; +<br>
&gt; +#define DPU_REG_RD(reg) readl_relaxed(reg)<br>
&gt; +<br>
&gt; +#define DPU_REG_WR(reg, mask) writel_relaxed(mask, reg)<br>
&gt; +<br>
&gt; +#define DPU_REG_SET(reg, mask) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(readl_relaxed(reg) | mask, =
reg)<br>
&gt; +<br>
&gt; +#define DPU_REG_CLR(reg, mask) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(readl_relaxed(reg) &amp; ~m=
ask, reg)<br>
&gt; +<br>
&gt; +/* Global control registers */<br>
&gt; +#define REG_DPU_CTRL=C2=A0 =C2=A00x04<br>
&gt; +#define REG_DPU_CFG0=C2=A0 =C2=A00x08<br>
&gt; +#define REG_DPU_CFG1=C2=A0 =C2=A00x0C<br>
&gt; +#define REG_DPU_CFG2=C2=A0 =C2=A00x10<br>
&gt; +#define REG_PANEL_SIZE 0x20<br>
&gt; +#define REG_BLEND_SIZE 0x24<br>
&gt; +#define REG_BG_COLOR=C2=A0 =C2=A00x2C<br>
&gt; +<br>
&gt; +/* Layer0 control registers */<br>
&gt; +#define REG_LAY_BASE_ADDR0=C2=A0 =C2=A0 =C2=A00x30<br>
&gt; +#define REG_LAY_BASE_ADDR1=C2=A0 =C2=A0 =C2=A00x34<br>
&gt; +#define REG_LAY_BASE_ADDR2=C2=A0 =C2=A0 =C2=A00x38<br>
&gt; +#define REG_LAY_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40<br>
&gt; +#define REG_LAY_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x44<br>
&gt; +#define REG_LAY_PITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x48<br>
&gt; +#define REG_LAY_POS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4C<br>
&gt; +#define REG_LAY_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x50<br>
&gt; +#define REG_LAY_PALLETE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x58<br>
&gt; +#define REG_LAY_CROP_START=C2=A0 =C2=A0 =C2=A00x5C<br>
&gt; +<br>
&gt; +/* Interrupt control registers */<br>
&gt; +#define REG_DPU_INT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1E0<br>
&gt; +#define REG_DPU_INT_CLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1E4<br>
&gt; +#define REG_DPU_INT_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1E8<br>
&gt; +<br>
&gt; +/* DPI control registers */<br>
&gt; +#define REG_DPI_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F0<br=
>
&gt; +#define REG_DPI_H_TIMING=C2=A0 =C2=A0 =C2=A0 =C2=A00x1F4<br>
&gt; +#define REG_DPI_V_TIMING=C2=A0 =C2=A0 =C2=A0 =C2=A00x1F8<br>
&gt; +<br>
&gt; +/* MMU control registers */<br>
&gt; +#define REG_MMU_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x800<br>
&gt; +#define REG_MMU_VPN_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x80C<br>
&gt; +#define REG_MMU_VAOR_ADDR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x818<br>
&gt; +#define REG_MMU_VAOR_ADDR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x81C<br>
&gt; +#define REG_MMU_INV_ADDR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x820<br>
&gt; +#define REG_MMU_INV_ADDR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x824<br>
&gt; +#define REG_MMU_PPN1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x83C<br>
&gt; +#define REG_MMU_RANGE1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x840<br>
&gt; +#define REG_MMU_PPN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x844<br>
&gt; +#define REG_MMU_RANGE2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x848<br>
&gt; +<br>
&gt; +/* Global control bits */<br>
&gt; +#define BIT_DPU_RUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
&gt; +#define BIT_DPU_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +#define BIT_DPU_REG_UPDATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(2)<br>
&gt; +#define BIT_DPU_IF_EDPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
&gt; +#define BIT_DPU_COEF_NARROW_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(4)<br>
&gt; +#define BIT_DPU_Y2R_COEF_ITU709_STANDARD=C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(5)<br>
&gt; +<br>
&gt; +/* Layer control bits */<br>
&gt; +#define BIT_DPU_LAY_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +<br>
&gt; +/* Interrupt control &amp; status bits */<br>
&gt; +#define BIT_DPU_INT_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(0)<br>
&gt; +#define BIT_DPU_INT_TE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +#define BIT_DPU_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
&gt; +#define BIT_DPU_INT_UPDATE_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; +#define BIT_DPU_INT_VSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(5)<br>
&gt; +#define BIT_DPU_INT_FBC_PLD_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(8)<br>
&gt; +#define BIT_DPU_INT_FBC_HDR_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(9)<br>
&gt; +#define BIT_DPU_INT_MMU_VAOR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(16)<br>
&gt; +#define BIT_DPU_INT_MMU_VAOR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(17)<br>
&gt; +#define BIT_DPU_INT_MMU_INV_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1=
8)<br>
&gt; +#define BIT_DPU_INT_MMU_INV_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1=
9)<br>
&gt; +<br>
&gt; +/* DPI control bits */<br>
&gt; +#define BIT_DPU_EDPI_TE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(8)<br>
&gt; +#define BIT_DPU_EDPI_FROM_EXTERNAL_PAD BIT(10)<br>
&gt; +#define BIT_DPU_DPI_HALT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(16)<br>
&gt; +<br>
&gt; +<br>
&gt; +static u32 check_mmu_isr(struct dpu_context *ctx, u32 reg_val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT_DPU_INT_MMU_VAOR_WR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT_DPU_INT_MMU_INV_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT_DPU_INT_MMU_INV_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D reg_val &amp; mmu_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;--- iommu interrupt err: 0x%04x ---\n&quot;, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; =
BIT_DPU_INT_MMU_INV_RD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;iommu invalid read error, addr: 0x%08x\n&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_RD(ctx-&gt;base + REG_MMU=
_INV_ADDR_RD));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; =
BIT_DPU_INT_MMU_INV_WR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;iommu invalid write error, addr: 0x%08x\n&quo=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_RD(ctx-&gt;base + REG_MMU=
_INV_ADDR_WR));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; =
BIT_DPU_INT_MMU_VAOR_RD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;iommu va out of range read error, addr: 0x%08=
x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_RD(ctx-&gt;base + REG_MMU=
_VAOR_ADDR_RD));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; =
BIT_DPU_INT_MMU_VAOR_WR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;iommu va out of range write error, addr: 0x%0=
8x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_RD(ctx-&gt;base + REG_MMU=
_VAOR_ADDR_WR));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; =
i &lt; 8; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0reg_val =3D DPU_REG_RD(ctx-&gt;base + DPU_LAY_REG(REG_LAY_CTR=
L, i));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (reg_val &amp; 0x1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;layer%d: 0x%08x 0x=
%08x 0x%08x ctrl: 0x%08x\n&quot;, i,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_R=
EG_RD(ctx-&gt;base + DPU_LAY_REG(REG_LAY_BASE_ADDR0, i)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_R=
EG_RD(ctx-&gt;base + DPU_LAY_REG(REG_LAY_BASE_ADDR1, i)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_R=
EG_RD(ctx-&gt;base + DPU_LAY_REG(REG_LAY_BASE_ADDR2, i)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_R=
EG_RD(ctx-&gt;base + DPU_LAY_REG(REG_LAY_CTRL, i)));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_clean_all(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 8; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + DPU_LAY_REG(REG_LAY_CTRL, i), 0x00);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 dpu_isr(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_val, int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D DPU_REG_RD(ctx-&gt;base + REG_=
DPU_INT_STS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable err interrupt */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_ERR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_ERR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu update done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_UPDATE_DONE)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_up=
date =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interr=
uptible_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu stop done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_DONE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_st=
op =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interr=
uptible_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu ifbc payload error isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_FBC_PLD_ERR)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_FBC_PLD_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;dpu ifbc payload error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* dpu ifbc header error isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_FBC_HDR_ERR)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_FBC_HDR_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;dpu ifbc header error\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D check_mmu_isr(ctx, reg_val);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_INT_CLR,=
 reg_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_CLR(ctx-&gt;base + REG_DPU_INT_EN,=
 int_mask);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;dpu wait for stop done time out!\n&quot;);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;dpu wait for reg update done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMED=
OUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_stop(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPU_CTRL, BIT_DPU_STOP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_done(ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_run(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ctx-&gt;base + REG_DPU_CTRL, B=
IT_DPU_RUN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_init(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_val, size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_BG_COLOR, 0x=
00);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D (ctx-&gt;vm.vactive &lt;&lt; 16) =
| ctx-&gt;vm.hactive;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_PANEL_SIZE, =
size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_BLEND_SIZE, =
size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D BIT_DPU_COEF_NARROW_RANGE | BI=
T_DPU_Y2R_COEF_ITU709_STANDARD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_CFG0, re=
g_val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_CFG1, 0x=
004466da);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_CFG2, 0x=
00);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_clean_all(=
ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_EN, 0x00=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_PPN1, 0x=
00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_RANGE1, =
0xffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_PPN2, 0x=
00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_RANGE2, =
0xffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_MMU_VPN_RANG=
E, 0x1ffff);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_INT_CLR,=
 0xffff);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_fini(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_INT_EN, =
0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_INT_CLR,=
 0xff);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_layer(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
struct dpu_layer *hwlayer)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 size, offset, ctrl, pitch;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
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
++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + DPU_LAY_REG(REG_LAY_BASE_ADDR0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;index), hwlayer-&gt;a=
ddr[i]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_POS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_CROP_START,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), hwlayer-&gt;src_y &lt;&lt; 16 | hwlayer-&=
gt;src_x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_ALPHA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), hwlayer-&gt;alpha);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D drm_format_info(hwlayer-&gt;forma=
t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwlayer-&gt;planes =3D=3D 3) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV pitch is=
 1/2 of Y pitch*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pitch =3D (hwl=
ayer-&gt;pitch[0] / info-&gt;cpp[0]) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(hwlayer-&gt;pitch[0] / info-&gt;=
cpp[0] &lt;&lt; 15);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + DPU_LAY_REG(REG_LAY_PITCH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;index), pitch);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pitch =3D hwla=
yer-&gt;pitch[0] / info-&gt;cpp[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + DPU_LAY_REG(REG_LAY_PITCH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;index), pitch);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl =3D hwlayer-&gt;format |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;bl=
ending |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(hwlayer-&gt;r=
otation &amp; 0x7) &lt;&lt; 20;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), ctrl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + DPU_LAY_REG(REG_=
LAY_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0hwlayer-&gt;index), BIT_DPU_LAY_EN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;dst_x =3D %d, dst_y =3D %d=
, dst_w =3D %d, dst_h =3D %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;dst_x, hwlayer-&gt;ds=
t_y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwlayer-&gt;dst_w, hwlayer-&gt;ds=
t_h);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;start_x =3D %d, start_y =
=3D %d, start_w =3D %d, start_h =3D %d\n&quot;,<br>
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
 struct dpu_layer layers[], u8 count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Make sure the dpu is in stop status. DP=
U_R2P0 has no shadow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * registers in EDPI mode. So the config r=
egisters can only be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * updated in the rising edge of DPU_RUN b=
it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_EDP=
I)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_=
done(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset the bgcolor to black */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_BG_COLOR, 0x=
00);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;s=
topped) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DPU_REG_SET(ctx-&gt;base + REG_DPU_CTRL, BIT_DPU_REG_UPDATE);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu_wait_update_done(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPU_INT_EN, BIT_DPU_INT_ERR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DPU=
_IF_EDPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPU_CTRL, BIT_DPU_RUN);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D BIT_DPU_INT_FBC_PLD_ERR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU=
_INT_FBC_HDR_ERR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU=
_INT_MMU_VAOR_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU=
_INT_MMU_VAOR_WR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU=
_INT_MMU_INV_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU=
_INT_MMU_INV_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ctx-&gt;base + REG_DPU_INT_EN,=
 reg_val);<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void dpu_dpi_init(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use dpi as =
interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_CLR(ct=
x-&gt;base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable Hal=
t function for SPRD DSI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_CLR(ct=
x-&gt;base + REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* select te f=
rom external pad */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set dpi tim=
ing */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D ct=
x-&gt;vm.hsync_len &lt;&lt; 0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.hback_porch &lt;&lt; 8 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.hfront_porch &lt;&lt; 20;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + REG_DPI_H_TIMING, reg_val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D ct=
x-&gt;vm.vsync_len &lt;&lt; 0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.vback_porch &lt;&lt; 8 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.vfront_porch &lt;&lt; 20;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx=
-&gt;base + REG_DPI_V_TIMING, reg_val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;vm=
.vsync_len + ctx-&gt;vm.vback_porch &lt; 32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_WARN(&quot;Warning: (vsync + vbp) &lt; 32, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;underflow risk!\n&quot;);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
update done INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_UPDATE_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
DONE=C2=A0 INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
dpi vsync */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_VSYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu =
TE INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_TE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable unde=
rflow err INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DPU=
_IF_EDPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use edpi as=
 interface */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPU_CFG0, BIT_DPU_IF_EDPI);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use externa=
l te */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable te *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ct=
x-&gt;base + REG_DPI_CTRL, BIT_DPU_EDPI_TE_EN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable stop=
 DONE INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable TE I=
NT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D =
BIT_DPU_INT_TE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable ifbc payload error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_FBC_PLD_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable ifbc header error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_FBC_HDR_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range read error=
 INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_VAOR_RD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range write erro=
r INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_VAOR_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu invalid read error INT */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_INV_RD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable iommu invalid write error INT */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_INV_WR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_WR(ctx-&gt;base + REG_DPU_INT_EN, =
int_mask);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void enable_vsync(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_SET(ctx-&gt;base + REG_DPU_INT_EN,=
 BIT_DPU_INT_VSYNC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void disable_vsync(struct dpu_context *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DPU_REG_CLR(ctx-&gt;base + REG_DPU_INT_EN,=
 BIT_DPU_INT_VSYNC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const u32 primary_fmts[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBX8888, DRM_FORMAT_RGB565,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_BGR565, DRM_FORMAT_NV12,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV21, DRM_FORMAT_NV16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV61, DRM_FORMAT_YUV420,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_YVU420,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void dpu_capability(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;max_layers =3D 6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_ptr =3D primary_fmts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cap-&gt;fmts_cnt =3D ARRAY_SIZE(primary_fm=
ts);<br>
&gt; +}<br>
&gt; +<br>
&gt; +const struct dpu_core_ops dpu_r2p0_core_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.init =3D dpu_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.fini =3D dpu_fini,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.run =3D dpu_run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.stop =3D dpu_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.isr =3D dpu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifconfig =3D dpu_dpi_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.capability =3D dpu_capability,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.flip =3D dpu_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_vsync =3D enable_vsync,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_vsync =3D disable_vsync,<br>
&gt; +};<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sp=
rd_dpu.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..5ec8e7c<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt; @@ -0,0 +1,646 @@<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pitch[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rotation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 blend_mode;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void sprd_dpu_init(struct sprd_dpu *dpu);<br>
&gt; +static void sprd_dpu_fini(struct sprd_dpu *dpu);<br>
&gt; +<br>
&gt; +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plan=
e)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(plane, struct sprd_pla=
ne, plane);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_format_convert(u32 fourcc, u32 *format)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (fourcc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGRA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BGRA8888 -&=
gt; ARGB8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBX8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGBA8888 -&=
gt; ABGR8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ABGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ARGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XBGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XRGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGR565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FALLTHRU */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGB565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_RGB565;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV420_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV21:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
420 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV420_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV422_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV61:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv=
422 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV422_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YUV420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV420_3PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YVU420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_FORMAT_YUV420_3PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*format |=3D B=
IT_DPU_LAY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_rotation_convert(u32 angle, u32 *rotation)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (angle) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_90:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_90;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_180:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_180;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_270:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_270;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_Y:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_180_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_90_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_X:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_0_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE=
_90):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*rotation =3D =
DPU_LAYER_ROTATION_270_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *st=
ate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(pla=
ne);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D state-&gt;f=
b;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_cma_object *cma_obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!state-&gt;fb || !state-&gt;crtc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sprd_plane_format_convert(fb-&gt;f=
ormat-&gt;format,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
p-&gt;format);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;Invalid plane format\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sprd_plane_rotation_convert(state-=
&gt;rotation,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
p-&gt;rotation);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;Invalid plane rotation\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (state-&gt;pixel_blend_mode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_COVERAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;blend_mo=
de |=3D BIT_DPU_LAY_COMBO_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Normal mode=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;blend_mo=
de |=3D BIT_DPU_LAY_MODE_BLEND_NORMAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PREMULTI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;blend_mo=
de |=3D BIT_DPU_LAY_COMBO_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pre-mult mo=
de */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;blend_mo=
de |=3D BIT_DPU_LAY_MODE_BLEND_PREMULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PIXEL_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* don&#39;t d=
o blending, maybe RGBX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode =
select - layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;blend_mo=
de |=3D BIT_DPU_LAY_LAYER_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; fb-&gt;format-&gt;num=
_planes; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cma_obj =3D dr=
m_fb_cma_get_gem_obj(fb, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D cma_o=
bj-&gt;paddr + fb-&gt;offsets[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr % 16)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;layer addr[%d] is not 16 bytes align, it&#39;=
s 0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;addr[i] =
=3D addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;pitch[i]=
 =3D fb-&gt;pitches[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(pla=
ne);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(plane=
-&gt;state-&gt;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_layer *layer =3D &amp;dpu-&gt;l=
ayers[p-&gt;index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!state-&gt;crtc || !state-&gt;fb)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;format =3D p-&gt;format;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;blending =3D p-&gt;blend_mode;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;rotation =3D p-&gt;rotation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;planes =3D fb-&gt;format-&gt;num=
_planes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; layer-&gt;planes; i++=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;addr=
[i] =3D p-&gt;addr[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer-&gt;pitc=
h[i] =3D p-&gt;pitch[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;pending_planes++;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_create_properties(struct sprd_plane *p, int in=
dex)<br>
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
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_check =3D sprd_plane_atomic_check,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.atomic_update =3D sprd_plane_atomic_updat=
e,<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;capability(&amp;dpu-&gt;c=
tx, &amp;cap);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;layers =3D devm_kcalloc(drm-&gt;de=
v, cap.max_layers,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(struct dpu_layer), =
GFP_KERNEL);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_un=
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_ERROR(&quot;fail to init primary plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ERR_PTR(ret);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return primary;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s() mode: &quot;DRM_MODE_=
FMT&quot;\n&quot;, __func__, DRM_MODE_ARG(mode));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_PREF=
ERRED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display_mo=
de_to_videomode(mode, &amp;dpu-&gt;ctx.vm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((mode-&gt;=
hdisplay =3D=3D mode-&gt;htotal) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(mode-&gt;vdisplay =3D=3D mode-&gt;vtotal))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_EDPI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_DPI;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu_init(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_irq(dpu-&gt;ctx.irq);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;pending_planes)<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;enable_vsync(&amp;dpu-&gt=
;ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;disable_vsync(&amp;dpu-&g=
t;ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D =
{<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_crtc_init_with_planes(drm, crt=
c, primary, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
sprd_crtc_funcs, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to init crtc.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_crtc_set_gamma_size(crtc, 256);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_helper_add(crtc, &amp;sprd_crtc_h=
elper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;init(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;ifconfig(ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_fini(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&gt;fini(ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t sprd_dpu_isr(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask =3D dpu-&gt;core-&gt;isr(ctx);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (int_mask &amp; BIT_DPU_INT_ERR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_WARN(&quot=
;Warning: dpu underflow!\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (int_mask &amp; BIT_DPU_INT_VSYNC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_handl=
e_vblank(&amp;dpu-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_bind(struct device *dev, struct device *master, v=
oid *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D dev_get_drvdata(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0plane =3D sprd_plane_init(drm, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(plane)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(plane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sprd_crtc_init(drm, &amp;dpu-&gt;c=
rtc, plane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
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
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platfo=
rm_device(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESO=
URCE_MEM, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;base =3D devm_ioremap(dev, res-&gt=
;start, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;base) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to map dpu registers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;irq =3D platform_get_irq(pdev, 0);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;irq &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to get dpu irq\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx-&gt=
;irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_status_flags(ctx-&gt;irq, IRQ_NOAU=
TOEN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, ctx-&gt;irq,=
 sprd_dpu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, &q=
uot;DPU&quot;, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;failed to register dpu irq handler\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;ctx-&gt;wait_queu=
e);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct sprd_dpu_ops sharkl3_dpu =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.core =3D &amp;dpu_r2p0_core_ops,<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quo=
t;No matching driver data found\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sprd_dpu_context_init(dpu, &amp;pd=
ev-&gt;dev);<br>
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
&gt; index 0000000..7d3c5e4<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt; @@ -0,0 +1,187 @@<br>
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
&gt; +<br>
&gt; +#define BIT_DPU_INT_DONE_=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(0)<br>
&gt; +#define BIT_DPU_INT_TE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +#define BIT_DPU_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
&gt; +#define BIT_DPU_INT_EDPI_TE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(3)<br>
&gt; +#define BIT_DPU_INT_UPDATE_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(4)<br>
&gt; +#define BIT_DPU_INT_VSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(5)<br>
&gt; +#define BIT_DPU_INT_WB_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
BIT(6)<br>
&gt; +#define BIT_DPU_INT_WB_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(7)<br>
&gt; +<br>
&gt; +#define BIT_DPU_LAY_LAYER_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 &lt;&lt; 2)<br>
&gt; +#define BIT_DPU_LAY_COMBO_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x02 &lt;&lt; 2)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV422_2PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x00 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV420_2PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x01 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV420_3PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x02 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_ARGB8888=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x03 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_RGB565=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x00 &lt;&lt; 8)<br>
&gt; +#define BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x01 &lt;&lt; 8)<br>
&gt; +#define BIT_DPU_LAY_NO_SWITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x00 &lt;&lt; 10)<br>
&gt; +#define BIT_DPU_LAY_RB_OR_UV_SWITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (0x01 &lt;&lt; 10)<br>
&gt; +#define BIT_DPU_LAY_MODE_BLEND_NORMAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (0x00 &lt;&lt; 16)<br>
&gt; +#define BIT_DPU_LAY_MODE_BLEND_PREMULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(0x01 &lt;&lt; 16)<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_DBI =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_DPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_EDPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_LIMIT<br>
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
&gt; +struct dpu_layer {<br>
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
&gt; +/**<br>
&gt; + * Sprd DPU capability structure<br>
&gt; + *<br>
&gt; + * @max_layers: maximum number of layers available<br>
&gt; + * @fmts_ptr: A pointer to array of supported pixel formats<br>
&gt; + * @fmts_cnt: the number of format on @fmts_ptr<br>
&gt; + */<br>
&gt; +struct dpu_capability {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const u32 *fmts_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fmts_cnt;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU core callback ops<br>
&gt; + *<br>
&gt; + * This structure decribes the display controller common<br>
&gt; + * callback ops<br>
&gt; + *<br>
&gt; + * @init: initial DPU core<br>
&gt; + * @fini: cleanup DPU core<br>
&gt; + * @run: enable DPU output<br>
&gt; + * @stop: disable DPU output<br>
&gt; + * @enable_vsync: enable vblank interrupt<br>
&gt; + * @disable_vsync: disable vblank interrupt<br>
&gt; + * @isr: function pointer to the isr<br>
&gt; + * @ifconfig: initial DPI interface<br>
&gt; + * @flip: commit CRTC planes to DPU<br>
&gt; + * @capability: callback for DPU capabilities<br>
&gt; + */<br>
&gt; +struct dpu_context;<br>
&gt; +struct dpu_core_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*init)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*fini)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*run)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*stop)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enable_vsync)(struct dpu_context *c=
tx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*disable_vsync)(struct dpu_context *=
ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 (*isr)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*ifconfig)(struct dpu_context *ctx);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*flip)(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct dpu_layer layers[], u8 count);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*capability)(struct dpu_context *ctx=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap);<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU context structure<br>
&gt; + *<br>
&gt; + * @base: DPU controller base address<br>
&gt; + * @irq: IRQ number to install the handler for<br>
&gt; + * @if_type: The type of DPI interface, default is DPI mode.<br>
&gt; + * @vm: videomode structure to use for DPU and DPI initialization<br>
&gt; + * @stopped: indicates whether DPU are stopped<br>
&gt; + * @wait_queue: wait queue, used to wait for DPU shadow register upda=
te done and<br>
&gt; + * DPU stop register done interrupt signal.<br>
&gt; + * @evt_update: wait queue condition for DPU shadow register<br>
&gt; + * @evt_stop: wait queue condition for DPU stop register<br>
&gt; + */<br>
&gt; +struct dpu_context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 if_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool stopped;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t wait_queue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool evt_update;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool evt_stop;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU device structure<br>
&gt; + *<br>
&gt; + * @crtc: DRM crtc<br>
&gt; + * @ctx: A pointer to the DPU&#39;s implementation specific context<b=
r>
&gt; + * @core: pointer to callbacks for DPU core functionality<br>
&gt; + * @layers: active DPU layers ready to commit<br>
&gt; + * @pending_planes: the number of layers on @layers<br>
&gt; + */<br>
&gt; +struct sprd_dpu {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dpu_core_ops *core;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_layer *layers;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pending_planes;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU H/W callback ops match table structure<br>
&gt; + * The structure used for matching a specific device callback ops<br>
&gt; + *<br>
&gt; + * @core: pointer to callbacks for DPU core functionality<br>
&gt; + */<br>
&gt; +struct sprd_dpu_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dpu_core_ops *core;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct sprd_dpu *crtc_to_dpu(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return crtc ? container_of(crtc, struct sp=
rd_dpu, crtc) : NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +extern const struct dpu_core_ops dpu_r2p0_core_ops;<br>
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
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000d11bf505b8253ddc--

--===============0640845066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0640845066==--
