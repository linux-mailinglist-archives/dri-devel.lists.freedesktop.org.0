Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ADA359FE6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158456E49F;
	Fri,  9 Apr 2021 13:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD66E49F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:35:20 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j18so9776180lfg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBJB1StgrKfZsz6H3gUJI/9e5vxxL8r+F8Z9P1LixMY=;
 b=DmC3fZ7U7K5nod3be39EnwPN3Kpu0vXQZnIHb+SecjtBxtBazZWJg3oufV28aBOqCj
 VHwvezdEQCRQfCQ40IdUCF0yN9xGmnQNIux1USCDmV0p3NkxgqRGMeig/CJVv8Tp9otK
 a9p/74K1Qk6H6lcjNR7BkD3OySHQcEvEUIZxoXbTYYYku8RmPska0NIrCtLtDn+GMgjj
 +sbwfOz56HSfKCi9nTaL2To6AxV2SEJPD2Xsv7x55ewgiuDU2NZ4sTuhZKL/WkLkhmXr
 ijb1MBC+/TlrGSydGG7hp2BvYHnpMMXjG91WP9zGu8qtIqAGLZhbjbzWJFG6DzsVs697
 ikAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBJB1StgrKfZsz6H3gUJI/9e5vxxL8r+F8Z9P1LixMY=;
 b=hwhScEyt3RekzzPdERbWio9kpIleV7cwuKlYobNLWgLosPXHOqEXGcMd6MdYbfKr5H
 Vm4b8x4fAP4+QTu+7ndd7u2JR6Fm79SRn2tuSd0c8WUtWWZucF8Gkc9yOoIHr1BDrhFX
 UnDYsxyCCTMv4M5258aMjjlJIHr//YL60zPv9SIQoR9sbgUK9lEIXky4l/tZ4FN31i2u
 PMB6Yqts+b2o2VqkwVuxXGnrdiyHvcv9VAaoSEZmRZJuTaw0d1KwNlknCWvflhtIJ2pq
 W1XD08fxJOkCRVYx06UCqEonYEE5TnaSLiDTVKuk9Z0nIQy25jr5t2LUs+2jHe7t2lME
 secw==
X-Gm-Message-State: AOAM531oA6GqzpSrlkgWiSl1bq+vffInpj9As/2ieW5uS49H4QSbUPOS
 Rvv0+8U5OOzicKC1UrY752pdrxPFUpLrIolGuB8=
X-Google-Smtp-Source: ABdhPJwyManG9zjZHLYV0KjyhBkc/UI1o4HNd8m5XSJ09E/VEI2u5nOtBgvN5AmuaKFZq/n90i39jFx6qyQnGT+KJKs=
X-Received: by 2002:a05:6512:21cb:: with SMTP id
 d11mr9842789lft.177.1617975318985; 
 Fri, 09 Apr 2021 06:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-5-kevin3.tang@gmail.com>
 <20210324111019.og6d3w47swjim2mq@gilmour>
 <CAFPSGXZ3DjKt87Kc=wc9YKVzTjkQ38Ok6HnHm+VEdqXyHv54Eg@mail.gmail.com>
 <20210407104538.cvssdck26rejrfye@gilmour>
In-Reply-To: <20210407104538.cvssdck26rejrfye@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Fri, 9 Apr 2021 21:35:07 +0800
Message-ID: <CAFPSGXa3xsxmfVquN_pTyBJ4+kL4jQAj6sK+86G3SA2OhB7Jtg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1227204273=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1227204273==
Content-Type: multipart/alternative; boundary="00000000000024bd5105bf8a3cc6"

--00000000000024bd5105bf8a3cc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:45=E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> Adding J=C3=B6rg, Will and Robin,
>
> On Wed, Mar 31, 2021 at 09:21:19AM +0800, Kevin Tang wrote:
> > > > +static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)
> > > > +{
> > > > +     struct dpu_context *ctx =3D &dpu->ctx;
> > > > +     u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |
> > > > +                     BIT_DPU_INT_MMU_VAOR_WR |
> > > > +                     BIT_DPU_INT_MMU_INV_RD |
> > > > +                     BIT_DPU_INT_MMU_INV_WR;
> > > > +     u32 val =3D reg_val & mmu_mask;
> > > > +     int i;
> > > > +
> > > > +     if (val) {
> > > > +             drm_err(dpu->drm, "--- iommu interrupt err: 0x%04x
> ---\n",
> > > val);
> > > > +
> > > > +             if (val & BIT_DPU_INT_MMU_INV_RD)
> > > > +                     drm_err(dpu->drm, "iommu invalid read error,
> addr:
> > > 0x%08x\n",
> > > > +                             readl(ctx->base +
> REG_MMU_INV_ADDR_RD));
> > > > +             if (val & BIT_DPU_INT_MMU_INV_WR)
> > > > +                     drm_err(dpu->drm, "iommu invalid write error,
> > > addr: 0x%08x\n",
> > > > +                             readl(ctx->base +
> REG_MMU_INV_ADDR_WR));
> > > > +             if (val & BIT_DPU_INT_MMU_VAOR_RD)
> > > > +                     drm_err(dpu->drm, "iommu va out of range read
> > > error, addr: 0x%08x\n",
> > > > +                             readl(ctx->base +
> REG_MMU_VAOR_ADDR_RD));
> > > > +             if (val & BIT_DPU_INT_MMU_VAOR_WR)
> > > > +                     drm_err(dpu->drm, "iommu va out of range writ=
e
> > > error, addr: 0x%08x\n",
> > > > +                             readl(ctx->base +
> REG_MMU_VAOR_ADDR_WR));
> > >
> > > Is that the IOMMU page fault interrupt? I would expect it to be in th=
e
> > > iommu driver.
> >
> > Our iommu driver is indeed an separate driver, and also in upstreaming,
> > but iommu fault interrupts reporting by display controller, not iommu
> >  itself,
> > if use iommu_set_fault_handler() to hook in our reporting function, the=
re
> > must be cross-module access to h/w registers.
>
> Can you explain a bit more the design of the hardware then? Each device
> connected to the IOMMU has a status register (and an interrupt) that
> reports when there's a fault?
>
> I'd like to get an ack at least from the IOMMU maintainers and
> reviewers.
>
Chunyan has helped explain it.

>
> > > > +static void sprd_dpi_init(struct sprd_dpu *dpu)
> > > > +{
> > > > +     struct dpu_context *ctx =3D &dpu->ctx;
> > > > +     u32 int_mask =3D 0;
> > > > +     u32 reg_val;
> > > > +
> > > > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > > > +             /* use dpi as interface */
> > > > +             dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > > > +             /* disable Halt function for SPRD DSI */
> > > > +             dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
> > > > +             /* select te from external pad */
> > > > +             dpu_reg_set(ctx, REG_DPI_CTRL,
> > > BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > > > +
> > > > +             /* set dpi timing */
> > > > +             reg_val =3D ctx->vm.hsync_len << 0 |
> > > > +                       ctx->vm.hback_porch << 8 |
> > > > +                       ctx->vm.hfront_porch << 20;
> > > > +             writel(reg_val, ctx->base + REG_DPI_H_TIMING);
> > > > +
> > > > +             reg_val =3D ctx->vm.vsync_len << 0 |
> > > > +                       ctx->vm.vback_porch << 8 |
> > > > +                       ctx->vm.vfront_porch << 20;
> > > > +             writel(reg_val, ctx->base + REG_DPI_V_TIMING);
> > > > +
> > > > +             if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> > > > +                     drm_warn(dpu->drm, "Warning: (vsync + vbp) <
> 32, "
> > > > +                             "underflow risk!\n");
> > >
> > > I don't think a warning is appropriate here. Maybe we should just
> > > outright reject any mode that uses it?
> > >
> >  This issue has been fixed on the new soc, maybe I should remove it.
>
> If it still requires a workaround on older SoC, you can definitely add
> it but we should prevent any situation where the underflow might occur
> instead of reporting it once we're there.
>
Thks,  porch parameter is obtained from the panel driver, so I think it
would be
better to check on the panel side. I will remove it here.

>
> > > > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc
> *crtc,
> > > > +                                     const struct drm_display_mode
> > > *mode)
> > > > +{
> > > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > > +
> > > > +     drm_dbg(dpu->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__,
> > > DRM_MODE_ARG(mode));
> > > > +
> > > > +     if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > > > +             drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> > >
> > > You don't seem to use that anywhere else? And that's a bit fragile,
> > > nothing really guarantees that it's the mode you're going to use, and
> > > even then it can be adjusted.
> > >
> >  drm_mode convert to video_mode is been use in "sprd_dpu_init" and
> > "sprd_dpi_init "
> >  Preferred mode should be fixed mode, we generally don=E2=80=99t adjust=
 it.
>
> That's not really the assumption DRM is built upon though. The userspace
> is even allowed to setup its own mode and try to configure it, and your
> driver should take that into account.
>
> I'd just drop that mode_valid hook, and retrieve the videomode if you
> need it in atomic_enable or mode_set_no_fb
>
Yeah, i need videomode info to setup display controller, so i will retrieve
the videomode
in mode_set_no_fb.

>
> > >
> > > > +
> > > > +             if ((mode->hdisplay =3D=3D mode->htotal) ||
> > > > +                 (mode->vdisplay =3D=3D mode->vtotal))
> > > > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
> > > > +             else
> > > > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
> > >
> > > From an API PoV, you would want that to be in atomic_check. However,
> I'm
> > > not even sure what it's doing in the first place?
> > >
> > dpi interface mode: DPI(dsi video mode panel) and EDPI(dsi cmd mode
> panel)
> > dpi interface mode has been used on crtc atomic_enable foo, so we need
> > check dpi interface
> > mode before atomic_enable.
> >
> > Must be put it in atomic_check? Here is the dpi interface mode selectio=
n,
> > maybe here is better?
>
> This doesn't have any relationship to the htotal and vtotal though? it's
> something that is carried over by the MIPI-DSI functions and struct
> mipi_dsi_device.
>
You mean DPI/EDPI should be check in the encoder driver?

>
> > >
> > > > +     }
> > > > +
> > > > +     return MODE_OK;
> > > > +}
> > > > +
> > > > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > +                                struct drm_atomic_state *state)
> > > > +{
> > > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > > +
> > > > +     sprd_dpu_init(dpu);
> > > > +
> > > > +     sprd_dpi_init(dpu);
> > > > +
> > > > +     enable_irq(dpu->ctx.irq);
> > >
> > > Shouldn't this be in enable_vblank? And I would assume that you would
> > > have the interrupts enabled all the time, but disabled in your device=
?
> > >
> > It seems better to put in enable_vblank, i will try and test it... Thks
> >
> >   And I would assume that you would
> > have the interrupts enabled all the time, but disabled in your device?
> > [kevin]I don=E2=80=99t quite understand this, can you help me explain i=
t in
> > detail?
>
> You seem to have a register that enables and disables the interrupt in
> that device. The way we usually deal with them in this case is just to
> call request_irq in your bind/probe with the interrupts enabled at the
> controller level, and mask them when needed at the device level by
> clearing / setting that bit.
>
 Yeah, we have display controller interrupts setting and clear register.
But the interrupts all been enabled in bootloader(eg, lk or uboot),
if the interrupt handler is active in the probe/bind phase by request_irq,
but the whole display pipeline is not ready, there maybe have some problems=
.

So we want to manually control interrupt handler enable/disable, make sure
all is ready,
then enable/disable interrupt handler.

>
> Maxime
>

--00000000000024bd5105bf8a3cc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Maxime Ripard &lt;maxime@cerno.tech&g=
t; =E4=BA=8E2021=E5=B9=B44=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=
=E5=8D=886:45=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi,<br>
<br>
Adding J=C3=B6rg, Will and Robin,<br>
<br>
On Wed, Mar 31, 2021 at 09:21:19AM +0800, Kevin Tang wrote:<br>
&gt; &gt; &gt; +static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)=
<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&g=
t;ctx;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_R=
D |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT_DPU_INT_MMU_VAOR_WR |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT_DPU_INT_MMU_INV_RD |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT_DPU_INT_MMU_INV_WR;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 val =3D reg_val &amp; mmu_mask;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (val) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dpu=
-&gt;drm, &quot;--- iommu interrupt err: 0x%04x ---\n&quot;,<br>
&gt; &gt; val);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &am=
p; BIT_DPU_INT_MMU_INV_RD)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu invalid read error, addr:=
<br>
&gt; &gt; 0x%08x\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_I=
NV_ADDR_RD));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &am=
p; BIT_DPU_INT_MMU_INV_WR)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu invalid write error,<br>
&gt; &gt; addr: 0x%08x\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_I=
NV_ADDR_WR));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &am=
p; BIT_DPU_INT_MMU_VAOR_RD)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu va out of range read<br>
&gt; &gt; error, addr: 0x%08x\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_V=
AOR_ADDR_RD));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &am=
p; BIT_DPU_INT_MMU_VAOR_WR)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu va out of range write<br>
&gt; &gt; error, addr: 0x%08x\n&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_V=
AOR_ADDR_WR));<br>
&gt; &gt;<br>
&gt; &gt; Is that the IOMMU page fault interrupt? I would expect it to be i=
n the<br>
&gt; &gt; iommu driver.<br>
&gt; <br>
&gt; Our iommu driver is indeed an separate driver, and also in upstreaming=
,<br>
&gt; but iommu fault interrupts reporting by display controller, not iommu<=
br>
&gt;=C2=A0 itself,<br>
&gt; if use iommu_set_fault_handler() to hook in our reporting function, th=
ere<br>
&gt; must be cross-module access to h/w registers.<br>
<br>
Can you explain a bit more the design of the hardware then? Each device<br>
connected to the IOMMU has a status register (and an interrupt) that<br>
reports when there&#39;s a fault?<br>
<br>
I&#39;d like to get an ack at least from the IOMMU maintainers and<br>
reviewers.<br></blockquote><div>Chunyan has helped explain it.=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; &gt; +static void sprd_dpi_init(struct sprd_dpu *dpu)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&g=
t;ctx;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_val;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_=
DPI) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use dpi =
as interface */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_clr=
(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable =
Halt function for SPRD DSI */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_clr=
(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* select t=
e from external pad */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set=
(ctx, REG_DPI_CTRL,<br>
&gt; &gt; BIT_DPU_EDPI_FROM_EXTERNAL_PAD);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set dpi =
timing */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D=
 ctx-&gt;vm.hsync_len &lt;&lt; 0 |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.hback_porch &lt;&lt; 8 |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.hfront_porch &lt;&lt; 20;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg_=
val, ctx-&gt;base + REG_DPI_H_TIMING);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D=
 ctx-&gt;vm.vsync_len &lt;&lt; 0 |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.vback_porch &lt;&lt; 8 |<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;vm.vfront_porch &lt;&lt; 20;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg_=
val, ctx-&gt;base + REG_DPI_V_TIMING);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt=
;vm.vsync_len + ctx-&gt;vm.vback_porch &lt; 32)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0drm_warn(dpu-&gt;drm, &quot;Warning: (vsync + vbp) &lt; 32=
, &quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;underflow risk!\n&quot;)=
;<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think a warning is appropriate here. Maybe we should =
just<br>
&gt; &gt; outright reject any mode that uses it?<br>
&gt; &gt;<br>
&gt;=C2=A0 This issue has been fixed on the new soc, maybe I should remove =
it.<br>
<br>
If it still requires a workaround on older SoC, you can definitely add<br>
it but we should prevent any situation where the underflow might occur<br>
instead of reporting it once we&#39;re there.<br></blockquote><div>Thks,=C2=
=A0 <span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gma=
il-ChMk0b"><span>porch parameter is obtained from the panel driver</span></=
span></span>, s<span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail=
-JLqJ4b gmail-ChMk0b"><span>o I think it would be</span></span></span></div=
><div><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b g=
mail-ChMk0b"><span>better to check on the panel side. I will remove it here=
.</span></span></span> </div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; &gt; &gt; +static enum drm_mode_status sprd_crtc_mode_valid(struct drm=
_crtc *crtc,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst struct drm_display_mode<br>
&gt; &gt; *mode)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(c=
rtc);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dpu-&gt;drm, &quot;%s() mode: &=
quot;DRM_MODE_FMT&quot;\n&quot;, __func__,<br>
&gt; &gt; DRM_MODE_ARG(mode));<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_P=
REFERRED) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display=
_mode_to_videomode(mode, &amp;dpu-&gt;ctx.vm);<br>
&gt; &gt;<br>
&gt; &gt; You don&#39;t seem to use that anywhere else? And that&#39;s a bi=
t fragile,<br>
&gt; &gt; nothing really guarantees that it&#39;s the mode you&#39;re going=
 to use, and<br>
&gt; &gt; even then it can be adjusted.<br>
&gt; &gt;<br>
&gt;=C2=A0 drm_mode convert to video_mode is been use in &quot;sprd_dpu_ini=
t&quot; and<br>
&gt; &quot;sprd_dpi_init &quot;<br>
&gt;=C2=A0 Preferred mode should be fixed mode, we generally don=E2=80=99t =
adjust it.<br>
<br>
That&#39;s not really the assumption DRM is built upon though. The userspac=
e<br>
is even allowed to setup its own mode and try to configure it, and your<br>
driver should take that into account.<br>
<br>
I&#39;d just drop that mode_valid hook, and retrieve the videomode if you<b=
r>
need it in atomic_enable or mode_set_no_fb<br></blockquote><div>Yeah, i nee=
d videomode info to setup display controller, so i will retrieve the videom=
ode</div><div>in mode_set_no_fb.<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((mode-&=
gt;hdisplay =3D=3D mode-&gt;htotal) ||<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(mode-&gt;vdisplay =3D=3D mode-&gt;vtotal))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_EDPI;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_DPI;<br>
&gt; &gt;<br>
&gt; &gt; From an API PoV, you would want that to be in atomic_check. Howev=
er, I&#39;m<br>
&gt; &gt; not even sure what it&#39;s doing in the first place?<br>
&gt; &gt;<br>
&gt; dpi interface mode: DPI(dsi video mode panel) and EDPI(dsi cmd mode pa=
nel)<br>
&gt; dpi interface mode has been used on crtc atomic_enable foo, so we need=
<br>
&gt; check dpi interface<br>
&gt; mode before atomic_enable.<br>
&gt; <br>
&gt; Must be put it in atomic_check? Here is the dpi interface mode selecti=
on,<br>
&gt; maybe here is better?<br>
<br>
This doesn&#39;t have any relationship to the htotal and vtotal though? it&=
#39;s<br>
something that is carried over by the MIPI-DSI functions and struct<br>
mipi_dsi_device.<br></blockquote><div><span class=3D"gmail-VIiyi" lang=3D"e=
n"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>You mean DPI/EDPI should=
 be check in the encoder driver?</span></span></span> <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_atomic_stat=
e *state)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(c=
rtc);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_init(dpu);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpi_init(dpu);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0enable_irq(dpu-&gt;ctx.irq);<br>
&gt; &gt;<br>
&gt; &gt; Shouldn&#39;t this be in enable_vblank? And I would assume that y=
ou would<br>
&gt; &gt; have the interrupts enabled all the time, but disabled in your de=
vice?<br>
&gt; &gt;<br>
&gt; It seems better to put in enable_vblank, i will try and test it... Thk=
s<br>
&gt; <br>
&gt;=C2=A0 =C2=A0And I would assume that you would<br>
&gt; have the interrupts enabled all the time, but disabled in your device?=
<br>
&gt; [kevin]I don=E2=80=99t quite understand this, can you help me explain =
it in<br>
&gt; detail?<br>
<br>
You seem to have a register that enables and disables the interrupt in<br>
that device. The way we usually deal with them in this case is just to<br>
call request_irq in your bind/probe with the interrupts enabled at the<br>
controller level, and mask them when needed at the device level by<br>
clearing / setting that bit.<br></blockquote><div>=C2=A0Yeah, we have displ=
ay controller interrupts setting and clear register.</div><div>But the inte=
rrupts all been enabled in bootloader(eg, lk or uboot),</div><div><span cla=
ss=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><s=
pan>if the interrupt handler is active in the probe/bind phase by request_i=
rq,</span></span></span></div><div><span class=3D"gmail-VIiyi" lang=3D"en">=
<span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>but the whole display pipel=
ine is not ready, <span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gm=
ail-JLqJ4b gmail-ChMk0b"><span>there maybe have some problems.</span></span=
></span></span></span></span></div><div><span class=3D"gmail-VIiyi" lang=3D=
"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D"gmail-V=
Iiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><br></spa=
n></span></span></span></span></span></div><div><span class=3D"gmail-VIiyi"=
 lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><span class=3D=
"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><=
span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-Ch=
Mk0b"><span>So we want to manually control interrupt handler enable/disable=
, <span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail=
-ChMk0b"><span>make sure</span></span></span>  all is ready,</span></span><=
/span></span></span></span></span></span></span></div><div><span class=3D"g=
mail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span><sp=
an class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk=
0b"><span><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ=
4b gmail-ChMk0b"><span>then enable/disable interrupt handler.</span></span>=
</span> </span></span></span> </span></span></span> </div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Maxime<br>
</blockquote></div></div>

--00000000000024bd5105bf8a3cc6--

--===============1227204273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1227204273==--
