Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE3616F8F8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2C36E141;
	Wed, 26 Feb 2020 08:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6943B6EA65
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:08:51 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b5so4168975qkh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hLx0umf2kaDdhijrZX30UzEHDuCJNgKDemeQl1e7ut8=;
 b=cLvmKYd2fWsj7BmbEcxrjyLrc7wWK1ii2jfhWYgOS+f+fz4V+XguRhIv7QuOdxKAnU
 TSHjvGFWIAx3MrsKQhq6Jw+EEfhz6UVsRbPmwf12m6+QxN2kDa3zT9fflVpN1nlAp38W
 r2e4bFD59X0RATLPbUwFEzXCpJTtzAwuoNvmCCN/V6QTRGcSP3+QDHGTnpMW/nfuLOOF
 JyL5qGboZtr1YymMu8nBqAxzhFWZfZgSjwWCOpHoF9dkyDGHirX5YeJVbaBKuYsG64rI
 /Vr24HPKlMuoa/lspdTHhcremLvN568dtK/rLFXrw/BOiNHxLtgTJGHGdLHBgd+7cqaO
 cTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLx0umf2kaDdhijrZX30UzEHDuCJNgKDemeQl1e7ut8=;
 b=MaJRi7k5jR85FGQZAv+m0+SKiFKar26G3ePI3CWuSSSrLvS+xdE9keq9fwlLI1JX5y
 0O6uf1WUtJc/wuIW6yONaY2Gg3iO5UGzBUIAZoeyWpMQfh54E8hjjOdw5+a4Y5ZUuBAc
 RP+AzqnnZxT3qj5E+ESNZgrcMGGgyf3jygg3pNcWN/lgCpH23CkyKIA1IK9AYqbSH9l+
 RgsXaU2leY+pGTifgm4eXPDFHsq0+brgDjza0XtnXQ3I//TB4ROPvUTB4VlCvq2x59Qd
 tFCOuJepovtSYYolMWvLIieCtbBQZ7wHkyyIEweApNKnyGR3yCQFeIFmYJkvJiKdIZK1
 I9jg==
X-Gm-Message-State: APjAAAUPNC1yaugO3blZ4oK3Oj+9p+3rXMXmteevgF1urZXX/+C0YP6z
 RWq4TuPzvhd34YWNKOEzJrwZfEQ+sv6GlxvUQbY=
X-Google-Smtp-Source: APXvYqwWXTEeA4judwgeg07H43N8r5kS2ehv1xhN/DcrpdFCaW8CARbKihNb2o6V8Wqp5sHjdFhkOu2wSDg4Hs1Imos=
X-Received: by 2002:a05:620a:100d:: with SMTP id
 z13mr56161692qkj.266.1582621730409; 
 Tue, 25 Feb 2020 01:08:50 -0800 (PST)
MIME-Version: 1.0
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo535TKq1goSsYiDQVU+6eQBMG+P9iUeaKS_caV=nrUYPMA@mail.gmail.com>
In-Reply-To: <CACvgo535TKq1goSsYiDQVU+6eQBMG+P9iUeaKS_caV=nrUYPMA@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Tue, 25 Feb 2020 17:08:38 +0800
Message-ID: <CAFPSGXZrtRPSk9oD-=7JdPH_CdWTgF2_OocuWWRNG-XCaQujMA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============2097854438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2097854438==
Content-Type: multipart/alternative; boundary="0000000000000e0f57059f62d656"

--0000000000000e0f57059f62d656
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emil,
Thanks for your feedback

On Tue, Feb 25, 2020 at 1:35 AM Emil Velikov <emil.l.velikov@gmail.com>
wrote:

> On Fri, 21 Feb 2020 at 11:15, Kevin Tang <kevin3.tang@gmail.com> wrote:
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
> >  drivers/gpu/drm/sprd/Makefile       |   6 +-
> >  drivers/gpu/drm/sprd/disp_lib.c     |  59 +++
> >  drivers/gpu/drm/sprd/disp_lib.h     |  21 +
> >  drivers/gpu/drm/sprd/dpu/Makefile   |   7 +
> >  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 787
> ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.c     | 678
> +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h     | 130 ++++++
> >  drivers/gpu/drm/sprd/sprd_drm.c     |   1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h     |   2 +
> >  9 files changed, 1690 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
> >  create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
> >  create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
> >  create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > index 63b8751..c94c8ac 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -4,4 +4,8 @@ ccflags-y +=3D -Iinclude/drm
> >
> >  subdir-ccflags-y +=3D -I$(src)
> >
> > -obj-y :=3D sprd_drm.o
> > +obj-y :=3D sprd_drm.o \
> > +       sprd_dpu.o
> > +
> > +obj-y +=3D disp_lib.o
> > +obj-y +=3D dpu/
> > diff --git a/drivers/gpu/drm/sprd/disp_lib.c
> b/drivers/gpu/drm/sprd/disp_lib.c
> > new file mode 100644
> > index 0000000..c887822
> > +++ b/drivers/gpu/drm/sprd/disp_lib.c
> > +++ b/drivers/gpu/drm/sprd/disp_lib.h
>
> These are completely unused. Drop them for now as well as their Makefile
> hunk.
>
These function will be used in the encoder driver, i commit it with encoder
driver.

>
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/Makefile
> > @@ -0,0 +1,7 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +ifdef CONFIG_ARM64
> > +KBUILD_CFLAGS +=3D -mstrict-align
> > +endif
> > +
> There is only a single case of this in the whole kernel. This is a strong
> indication that there is something wrong, perhaps. Why do we need this?
>
Our HW controller registers(32bit) map to struct "dpu_reg",
so we can directly access the registers through the struct "dpu_reg",
rather than through I/O(readl&writel).

But we found on ARM64, if two adjacent member variables have the same value=
=EF=BC=8C
the gcc compiler maybe optimize them into a 64-bit value when compiling, ac=
cess
io registers with 64bit?

So we add "mstrict-align", do not permit unaligned accesses
We need to strictly follow the 32bit width to access the struct "dpu_reg",
not 64bit.

>
>
> > +obj-y +=3D dpu_r2p0.o
> > diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > new file mode 100644
> > index 0000000..b96e2e2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > @@ -0,0 +1,787 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 Unisoc Inc.
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
> > +struct dpu_reg {
> ...
>
> There are actual HW registers and we get the base via ioremap_nocache().
> Please add a small comment.
>

>
> > +static DECLARE_WAIT_QUEUE_HEAD(wait_queue);
> > +static bool panel_ready =3D true;
> > +static bool evt_update;
> > +static bool evt_stop;
> > +
> Using static variables tend to be an example of badly designed code.
>
>
> ...
>
> > +static void dpu_uninit(struct dpu_context *ctx)
>
> Normally people use init - for initialization and fini for
> "uninitialization"
>
>
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
>
>
> Starting with one format and rotation is good. Others can be added as
> follow-up.
> Especially since FBC is something that is just becoming fashionable.
>
FBC will be remove later.
All other options are required for layer format and rotation, these are the
basic functions.
Why need to split it?

>
> > +static void dpu_dpi_init(struct dpu_context *ctx)
> > +{
>
> ...
>
> > +       } else if (ctx->if_type =3D=3D SPRD_DISPC_IF_EDPI) {
> > +               /* use edpi as interface */
> > +               reg->dpu_cfg0 |=3D BIT(0);
> > +
> > +               /* use external te */
> > +               reg->dpi_ctrl |=3D BIT(10);
> > +
> > +               /* enable te */
> > +               reg->dpi_ctrl |=3D BIT(8);
>
> Try to avoid using BIT() randomly. A well chosen name, removes the need
> for a
> comment. Perhaps it's just me but the "enable foo" comments do not help
> much.
>
> ...
>
>
> > +struct dpu_core_ops sharkl3_dpu_core_ops =3D {
> In general ops should be const.
>
> > +       .version =3D dpu_get_version,
> > +       .init =3D dpu_init,
> > +       .uninit =3D dpu_uninit,
> > +       .run =3D dpu_run,
> > +       .stop =3D dpu_stop,
> > +       .isr =3D dpu_isr,
> > +       .ifconfig =3D dpu_dpi_init,
> > +       .capability =3D dpu_capability,
> > +       .flip =3D dpu_flip,
> > +       .bg_color =3D dpu_bgcolor,
> > +       .enable_vsync =3D enable_vsync,
> > +       .disable_vsync =3D disable_vsync,
>
> ... then again, we have only a single set of dpu_core_ops. So the whole
> abstraction layer seems unnessesary.
>
Currently we only submitted one crtc(dsi)=EF=BC=8C the crtc of DP(DisplayPo=
rt) will
be added as follow-up.
So I hope to keep the current design

>
>
>
>
> > +};
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c
> b/drivers/gpu/drm/sprd/sprd_dpu.c
> > new file mode 100644
> > index 0000000..331f236
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
>
>
>
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                                 struct drm_plane_state *state)
> > +{
> > +       DRM_DEBUG("%s()\n", __func__);
> > +
> This does not feel right. Here the driver must ensure that the state give=
n
> will
> always work.
>
> Is the hardware so versatile that any permutation (given by userspace)
> will work?
>
> Same goes for the other atomic_check functions that are no-op.
>
In fact=EF=BC=8C plane state check, we put in our HW abstraction layer, inc=
lude
layer format, layer addr, rotation... so maybe there is no need to
impliment atomic_check
funtion. I will remove later...

>
>
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
> Why do we disable all the planes on flip? This is the first time I see su=
ch
> driver decision.
>
Our layers commit to HW on atomic_flush, not in atomic_update.
We will wait for all layers to be ready, then flip.
So we need to disable all the planes before flip.

>
>
> > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                  struct drm_crtc_state *old_state)
> > +{
> > +       struct sprd_dpu *dpu =3D crtc_to_dpu(crtc);
> > +       static bool is_enabled =3D true;
> > +
> More static variables - please remove.
>
>
>
> > +static int sprd_dpu_init(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       down(&ctx->refresh_lock);
> > +
> Why do we need the semaphore? From a quick look all the other drivers are
> semaphore/lock free in their atomic codepath.
>
> One notable exception is the event_lock.
>
Because sysfs debug driver, not uploaded yet.
We will run or stop our display controller on sysfs debug driver, so we
need to add semaphore lock to
protect atomic codepath. I will be remove it later...

Maybe the statemachine "is_inited" is also not needed now.

>
>
>
> > +       if (dpu->ctx.is_inited) {
> > +               up(&ctx->refresh_lock);
> > +               return 0;
> > +       }
> > +
> How can did this trigger? IMHO we either have a serious bug or the check
> is dead
> code.
>
Sorry, this will be trigger on our sysfs debug driver, i will remove it.

>
> > +       if (dpu->core && dpu->core->init)
>
> Using if dpu->core && dpu->core->FOO is a recurring pattern, yet they are
> always
> set. Unless needed we can kill the abstraction layer all together can cal=
l
> FOO
> directly.
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
>
> > +struct dpu_context {
> > +       unsigned long base;
> > +       const char *version;
> > +       int irq;
> > +       u8 if_type;
> > +       bool is_inited;
> > +       bool is_stopped;
> Nit: more natural names for these are "initialized" and "stopped"
>
>
> > +       struct videomode vm;
> > +       struct semaphore refresh_lock;
> I've mentioned it earlier - not 100% sure that the semaphore is needed. I=
f
> it is
> please add a comment just above it.
>
>
>
> > +int sprd_dpu_run(struct sprd_dpu *dpu);
> > +int sprd_dpu_stop(struct sprd_dpu *dpu);
> > +
> These two functions seem to be unused in this patch. Let's drop them for
> now.
>
The encoder driver will call it, so commit those with encoder driver?

>
>
> Thanks
> Emil
>

--0000000000000e0f57059f62d656
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Emil,<br></div><div>Thanks for yo=
ur feedback</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Feb 25, 2020 at 1:35 AM Emil Velikov &lt;<a href=
=3D"mailto:emil.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 21 Feb=
 2020 at 11:15, Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@gmail.com" tar=
get=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
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
=C2=A06 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 59 ++=
+<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A07 +<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 787 ++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0| 678 +++++++=
++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0| 130 ++++++<=
br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 9 files changed, 1690 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/disp_lib.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/disp_lib.h<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; index 63b8751..c94c8ac 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/Makefile<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -4,4 +4,8 @@ ccflags-y +=3D -Iinclude/drm<br>
&gt;<br>
&gt;=C2=A0 subdir-ccflags-y +=3D -I$(src)<br>
&gt;<br>
&gt; -obj-y :=3D sprd_drm.o<br>
&gt; +obj-y :=3D sprd_drm.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_dpu.o<br>
&gt; +<br>
&gt; +obj-y +=3D disp_lib.o<br>
&gt; +obj-y +=3D dpu/<br>
&gt; diff --git a/drivers/gpu/drm/sprd/disp_lib.c b/drivers/gpu/drm/sprd/di=
sp_lib.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c887822<br>
&gt; +++ b/drivers/gpu/drm/sprd/disp_lib.c<br>
&gt; +++ b/drivers/gpu/drm/sprd/disp_lib.h<br>
<br>
These are completely unused. Drop them for now as well as their Makefile hu=
nk.<br></blockquote><div><span class=3D"gmail-tlid-translation gmail-transl=
ation" lang=3D"en"><span title=3D"" class=3D"gmail-">These function will be=
 used in the encoder driver, i commit it with encoder driver.</span></span>=
 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/Makefile<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +<br>
&gt; +ifdef CONFIG_ARM64<br>
&gt; +KBUILD_CFLAGS +=3D -mstrict-align<br>
&gt; +endif<br>
&gt; +<br>
There is only a single case of this in the whole kernel. This is a strong<b=
r>
indication that there is something wrong, perhaps. Why do we need this?<br>=
</blockquote><div>Our HW controller registers(32bit) map to struct &quot;dp=
u_reg&quot;,</div><div><span class=3D"gmail-tlid-translation gmail-translat=
ion" lang=3D"en"><span title=3D"" class=3D"gmail-">so we can directly acces=
s the registers through the struct &quot;dpu_reg&quot;,<span class=3D"gmail=
-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"=
gmail-"> rather than through</span></span> I/O(readl&amp;writel).<br></span=
></span></div><div><span class=3D"gmail-tlid-translation gmail-translation"=
 lang=3D"en"><span title=3D"" class=3D"gmail-"><br></span></span></div><div=
><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span=
 title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-tr=
anslation" lang=3D"en"><span title=3D"" class=3D"gmail-">But we found </spa=
n></span>on ARM64, <span class=3D"gmail-tlid-translation gmail-translation"=
 lang=3D"en"><span title=3D"">if two adjacent member variables have the sam=
e value=EF=BC=8C</span></span></span></span></div><div><span class=3D"gmail=
-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"=
gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en=
"><span title=3D""><span class=3D"gmail-tlid-translation gmail-translation"=
 lang=3D"en"><span title=3D"" class=3D"gmail-">the gcc compiler maybe optim=
ize them into a 64-bit value when compiling, <span class=3D"gmail-tlid-tran=
slation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">ac=
cess io registers with 64bit?<br></span></span></span></span></span></span>=
</span></span></div><div><br></div><div>So we add &quot;mstrict-align&quot;=
, do not permit unaligned accesses</div><div><span class=3D"gmail-tlid-tran=
slation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">We=
 need to strictly follow the 32bit width to access the struct &quot;dpu_reg=
&quot;, not 64bit.</span></span><br><span class=3D"gmail-tlid-translation g=
mail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=
=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"">=
<span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span =
title=3D"" class=3D"gmail-"></span></span><span class=3D"gmail-tlid-transla=
tion gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"></spa=
n></span></span></span></span></span></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
<br>
&gt; +obj-y +=3D dpu_r2p0.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c b/drivers/gpu/drm/spr=
d/dpu/dpu_r2p0.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b96e2e2<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt; @@ -0,0 +1,787 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2019 Unisoc Inc.<br>
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
&gt; +struct dpu_reg {<br>
...<br>
<br>
There are actual HW registers and we get the base via ioremap_nocache().<br=
>
Please add a small comment. <br></blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
<br>
&gt; +static DECLARE_WAIT_QUEUE_HEAD(wait_queue);<br>
&gt; +static bool panel_ready =3D true;<br>
&gt; +static bool evt_update;<br>
&gt; +static bool evt_stop;<br>
&gt; +<br>
Using static variables tend to be an example of badly designed code.<br>
<br>
<br>
...<br>
<br>
&gt; +static void dpu_uninit(struct dpu_context *ctx)<br>
<br>
Normally people use init - for initialization and fini for &quot;uninitiali=
zation&quot;<br>
<br>
<br>
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
<br>
<br>
Starting with one format and rotation is good. Others can be added as follo=
w-up.<br>
Especially since FBC is something that is just becoming fashionable.<br></b=
lockquote><div><span class=3D"gmail-tlid-translation gmail-translation" lan=
g=3D"en"><span title=3D"" class=3D"gmail-">FBC will be remove later.</span>=
</span></div><div><span class=3D"gmail-tlid-translation gmail-translation" =
lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-tra=
nslation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">A=
ll other options are required for layer format and rotation, <span class=3D=
"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" cla=
ss=3D"gmail-">these are the basic functions.</span></span></span></span></s=
pan></span></div><div>Why need to split it?<br></div><div><span class=3D"gm=
ail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=
=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-transla=
tion gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"></spa=
n></span></span></span><span class=3D"gmail-tlid-translation gmail-translat=
ion" lang=3D"en"><span title=3D"" class=3D"gmail-"></span></span></span></s=
pan></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +static void dpu_dpi_init(struct dpu_context *ctx)<br>
&gt; +{<br>
<br>
...<br>
<br>
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
<br>
Try to avoid using BIT() randomly. A well chosen name, removes the need for=
 a<br>
comment. Perhaps it&#39;s just me but the &quot;enable foo&quot; comments d=
o not help much.<br>
<br>
...<br>
<br>
<br>
&gt; +struct dpu_core_ops sharkl3_dpu_core_ops =3D {<br>
In general ops should be const.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.version =3D dpu_get_version,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.init =3D dpu_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.uninit =3D dpu_uninit,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.run =3D dpu_run,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.stop =3D dpu_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.isr =3D dpu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifconfig =3D dpu_dpi_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.capability =3D dpu_capability,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.flip =3D dpu_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.bg_color =3D dpu_bgcolor,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.enable_vsync =3D enable_vsync,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable_vsync =3D disable_vsync,<br>
<br>
... then again, we have only a single set of dpu_core_ops. So the whole<br>
abstraction layer seems unnessesary.<br></blockquote><div><span class=3D"gm=
ail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-">Currently we only submitted one crtc(dsi)=EF=BC=8C the crtc of =
DP(DisplayPort) will be added as follow-up.</span></span></div><div><span c=
lass=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=
=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translat=
ion" lang=3D"en"><span title=3D"" class=3D"gmail-">So I hope to keep the cu=
rrent design</span></span></span></span></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
<br>
<br>
<br>
&gt; +};<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sp=
rd_dpu.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..331f236<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.c<br>
<br>
<br>
<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *st=
ate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;%s()\n&quot;, __func__);<b=
r>
&gt; +<br>
This does not feel right. Here the driver must ensure that the state given =
will<br>
always work.<br>
<br>
Is the hardware so versatile that any permutation (given by userspace)<br>
will work?<br>
<br>
Same goes for the other atomic_check functions that are no-op.<br></blockqu=
ote><div>In fact=EF=BC=8C plane state check, we put in our HW abstraction l=
ayer, include</div><div>layer format, layer addr, rotation... so maybe ther=
e is no need to impliment atomic_check</div><div>funtion. I will remove lat=
er...<br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
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
Why do we disable all the planes on flip? This is the first time I see such=
<br>
driver decision.<br></blockquote>Our layers commit to HW on atomic_flush, n=
ot in atomic_update.</div><div class=3D"gmail_quote"><span class=3D"gmail-t=
lid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gm=
ail-">We will wait for all layers to be ready</span></span>, then flip.</di=
v><div class=3D"gmail_quote">So we need to disable all the planes before fl=
ip.<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
<br>
&gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *ol=
d_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D crtc_to_dpu(crtc)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0static bool is_enabled =3D true;<br>
&gt; +<br>
More static variables - please remove.<br>
<br>
<br>
<br>
&gt; +static int sprd_dpu_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0down(&amp;ctx-&gt;refresh_lock);<br>
&gt; +<br>
Why do we need the semaphore? From a quick look all the other drivers are<b=
r>
semaphore/lock free in their atomic codepath.<br>
<br>
One notable exception is the event_lock.<br></blockquote><div>Because sysfs=
 debug driver, <span class=3D"gmail-tlid-translation gmail-translation" lan=
g=3D"en"><span title=3D"" class=3D"gmail-">not uploaded</span></span> yet.<=
br></div><div>We will run or stop our display controller on sysfs debug dri=
ver, so we need to add semaphore lock to</div><div>protect atomic codepath.=
 I will be remove it later...</div><div><br></div><div><span class=3D"gmail=
-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"=
gmail-">Maybe the statemachine &quot;is_inited&quot; is also not needed now=
.<br></span></span></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;ctx.is_inited) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up(&amp;ctx-&g=
t;refresh_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
How can did this trigger? IMHO we either have a serious bug or the check is=
 dead<br>
code.<br></blockquote><div>Sorry, this will be trigger on our sysfs debug d=
river, i will remove it. <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;init)<br>
<br>
Using if dpu-&gt;core &amp;&amp; dpu-&gt;core-&gt;FOO is a recurring patter=
n, yet they are always<br>
set. Unless needed we can kill the abstraction layer all together can call =
FOO<br>
directly.<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.h<br>
<br>
&gt; +struct dpu_context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *version;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 if_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_inited;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_stopped;<br>
Nit: more natural names for these are &quot;initialized&quot; and &quot;sto=
pped&quot;<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct semaphore refresh_lock;<br>
I&#39;ve mentioned it earlier - not 100% sure that the semaphore is needed.=
 If it is<br>
please add a comment just above it.<br>
<br>
<br>
<br>
&gt; +int sprd_dpu_run(struct sprd_dpu *dpu);<br>
&gt; +int sprd_dpu_stop(struct sprd_dpu *dpu);<br>
&gt; +<br>
These two functions seem to be unused in this patch. Let&#39;s drop them fo=
r now.<br></blockquote><div>The encoder driver will call it, so commit thos=
e with encoder driver? <br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
<br>
Thanks<br>
Emil<br>
</blockquote></div></div>

--0000000000000e0f57059f62d656--

--===============2097854438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2097854438==--
