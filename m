Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B80356A1E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13BE6E092;
	Wed,  7 Apr 2021 10:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D76E092
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:45:48 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 31B07580986;
 Wed,  7 Apr 2021 06:45:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Apr 2021 06:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=KBte6mMjoAGegGrtIFkx5zgN2cU
 muA0JM1y/5uroxNI=; b=b0hgm9p0rny8zQXlF5+GRqfY2LD3RwxjCz3Fa2trI5a
 JY6bU01PpTn8bRzGeBXMb8k724q/DhtUZp/r/ITXM2r81h4RldiwZcfSG452i+VI
 EY/qMvnWAR+70IkE97JBINlFtNPH3zf7d1+9+35l3lr9Eo34AeIjCidsvCDZyFiK
 AOKR7qh3wzvQ+vl4wApxVJgCIyEo2pi6jnA311G1DWUl/91mE0pSEcFl7utoUlFd
 Eql4g+e7dJQXmAceZA7aCI9Gnkx1FToPTHIg8/Ez8Eia7QOIPyl3t62dUbQg0PJG
 o7lwatU/f9MxmxCc3Fj0JGyiBeU+Z4LIJdH/bDEzAaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KBte6m
 MjoAGegGrtIFkx5zgN2cUmuA0JM1y/5uroxNI=; b=ZZ64in0hNmp8sj4lW0MCJZ
 QWvWXK2g4yqu8+7lB4+WiEZUlhAzqmg6ga/slSXNy/MjO2irnm9reObqn3SNygvi
 Ncyq1AkopKCy2xOdFf9dP58amAYO2kcKdcTu8WsvyLPN8v2ovOdCm0045iT5Wa+n
 gPEH9PRkz+0lUZRZQT8MizIwQIpsvtf7nkmAOak3m/sTLsuMimcZNE1PyPvkiQCZ
 f9hetfelf5082aLrtcqkS7AGuM3vaAiItjZtRjO/PhKHoD6Y3GON0jAPZPffTd66
 8/SLnz6D1UOGd5CBh03TYbRUoWxyCOJC/ZD0tqTsIl/bXH5A64peJkEDRiQRmCoA
 ==
X-ME-Sender: <xms:VY1tYJVijTLlWr-PasfZBCTi1Rhio9XU1CdR4wJkbrED4uf4UDFTyQ>
 <xme:VY1tYJnzFuxLfy_SVrV4V6Zk9kmVqXaKNTzk9lVIGc3iYIOqkWyV430oG4jibi2Hy
 vEMa_jNzjBM8kjaAsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VY1tYFaGDVuuCmZA_qrqit_QPClH1cXANgsG7DaVe4EP1iT6s3N-dA>
 <xmx:VY1tYMXinpvV0nBkYXn01-45FtuHqquD8FP2-TV3-iQ-SNTtbNQ-Cg>
 <xmx:VY1tYDlQQyKjgHkPC5ATRYpTlgMH8csviENBDlZk5T99t1ZMRdqaGA>
 <xmx:V41tYMg-dn9TSjUGF5aKTu61CEEfgtyut_JyJWfcxb1qU0Ab517V4g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9954A24005A;
 Wed,  7 Apr 2021 06:45:41 -0400 (EDT)
Date: Wed, 7 Apr 2021 12:45:38 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20210407104538.cvssdck26rejrfye@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-5-kevin3.tang@gmail.com>
 <20210324111019.og6d3w47swjim2mq@gilmour>
 <CAFPSGXZ3DjKt87Kc=wc9YKVzTjkQ38Ok6HnHm+VEdqXyHv54Eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXZ3DjKt87Kc=wc9YKVzTjkQ38Ok6HnHm+VEdqXyHv54Eg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1367489658=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1367489658==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4udzy4wtmt67hg7k"
Content-Disposition: inline


--4udzy4wtmt67hg7k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Adding J=C3=B6rg, Will and Robin,

On Wed, Mar 31, 2021 at 09:21:19AM +0800, Kevin Tang wrote:
> > > +static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)
> > > +{
> > > +     struct dpu_context *ctx =3D &dpu->ctx;
> > > +     u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |
> > > +                     BIT_DPU_INT_MMU_VAOR_WR |
> > > +                     BIT_DPU_INT_MMU_INV_RD |
> > > +                     BIT_DPU_INT_MMU_INV_WR;
> > > +     u32 val =3D reg_val & mmu_mask;
> > > +     int i;
> > > +
> > > +     if (val) {
> > > +             drm_err(dpu->drm, "--- iommu interrupt err: 0x%04x ---\=
n",
> > val);
> > > +
> > > +             if (val & BIT_DPU_INT_MMU_INV_RD)
> > > +                     drm_err(dpu->drm, "iommu invalid read error, ad=
dr:
> > 0x%08x\n",
> > > +                             readl(ctx->base + REG_MMU_INV_ADDR_RD));
> > > +             if (val & BIT_DPU_INT_MMU_INV_WR)
> > > +                     drm_err(dpu->drm, "iommu invalid write error,
> > addr: 0x%08x\n",
> > > +                             readl(ctx->base + REG_MMU_INV_ADDR_WR));
> > > +             if (val & BIT_DPU_INT_MMU_VAOR_RD)
> > > +                     drm_err(dpu->drm, "iommu va out of range read
> > error, addr: 0x%08x\n",
> > > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_RD)=
);
> > > +             if (val & BIT_DPU_INT_MMU_VAOR_WR)
> > > +                     drm_err(dpu->drm, "iommu va out of range write
> > error, addr: 0x%08x\n",
> > > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_WR)=
);
> >
> > Is that the IOMMU page fault interrupt? I would expect it to be in the
> > iommu driver.
>=20
> Our iommu driver is indeed an separate driver, and also in upstreaming,
> but iommu fault interrupts reporting by display controller, not iommu
>  itself,
> if use iommu_set_fault_handler() to hook in our reporting function, there
> must be cross-module access to h/w registers.

Can you explain a bit more the design of the hardware then? Each device
connected to the IOMMU has a status register (and an interrupt) that
reports when there's a fault?

I'd like to get an ack at least from the IOMMU maintainers and
reviewers.

> > > +static void sprd_dpi_init(struct sprd_dpu *dpu)
> > > +{
> > > +     struct dpu_context *ctx =3D &dpu->ctx;
> > > +     u32 int_mask =3D 0;
> > > +     u32 reg_val;
> > > +
> > > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > > +             /* use dpi as interface */
> > > +             dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > > +             /* disable Halt function for SPRD DSI */
> > > +             dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
> > > +             /* select te from external pad */
> > > +             dpu_reg_set(ctx, REG_DPI_CTRL,
> > BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > > +
> > > +             /* set dpi timing */
> > > +             reg_val =3D ctx->vm.hsync_len << 0 |
> > > +                       ctx->vm.hback_porch << 8 |
> > > +                       ctx->vm.hfront_porch << 20;
> > > +             writel(reg_val, ctx->base + REG_DPI_H_TIMING);
> > > +
> > > +             reg_val =3D ctx->vm.vsync_len << 0 |
> > > +                       ctx->vm.vback_porch << 8 |
> > > +                       ctx->vm.vfront_porch << 20;
> > > +             writel(reg_val, ctx->base + REG_DPI_V_TIMING);
> > > +
> > > +             if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> > > +                     drm_warn(dpu->drm, "Warning: (vsync + vbp) < 32=
, "
> > > +                             "underflow risk!\n");
> >
> > I don't think a warning is appropriate here. Maybe we should just
> > outright reject any mode that uses it?
> >
>  This issue has been fixed on the new soc, maybe I should remove it.

If it still requires a workaround on older SoC, you can definitely add
it but we should prevent any situation where the underflow might occur
instead of reporting it once we're there.

> > > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *cr=
tc,
> > > +                                     const struct drm_display_mode
> > *mode)
> > > +{
> > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > +
> > > +     drm_dbg(dpu->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__,
> > DRM_MODE_ARG(mode));
> > > +
> > > +     if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > > +             drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> >
> > You don't seem to use that anywhere else? And that's a bit fragile,
> > nothing really guarantees that it's the mode you're going to use, and
> > even then it can be adjusted.
> >
>  drm_mode convert to video_mode is been use in "sprd_dpu_init" and
> "sprd_dpi_init "
>  Preferred mode should be fixed mode, we generally don=E2=80=99t adjust i=
t.

That's not really the assumption DRM is built upon though. The userspace
is even allowed to setup its own mode and try to configure it, and your
driver should take that into account.

I'd just drop that mode_valid hook, and retrieve the videomode if you
need it in atomic_enable or mode_set_no_fb

> >
> > > +
> > > +             if ((mode->hdisplay =3D=3D mode->htotal) ||
> > > +                 (mode->vdisplay =3D=3D mode->vtotal))
> > > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
> > > +             else
> > > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
> >
> > From an API PoV, you would want that to be in atomic_check. However, I'm
> > not even sure what it's doing in the first place?
> >
> dpi interface mode: DPI(dsi video mode panel) and EDPI(dsi cmd mode panel)
> dpi interface mode has been used on crtc atomic_enable foo, so we need
> check dpi interface
> mode before atomic_enable.
>=20
> Must be put it in atomic_check? Here is the dpi interface mode selection,
> maybe here is better?

This doesn't have any relationship to the htotal and vtotal though? it's
something that is carried over by the MIPI-DSI functions and struct
mipi_dsi_device.

> >
> > > +     }
> > > +
> > > +     return MODE_OK;
> > > +}
> > > +
> > > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +                                struct drm_atomic_state *state)
> > > +{
> > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > +
> > > +     sprd_dpu_init(dpu);
> > > +
> > > +     sprd_dpi_init(dpu);
> > > +
> > > +     enable_irq(dpu->ctx.irq);
> >
> > Shouldn't this be in enable_vblank? And I would assume that you would
> > have the interrupts enabled all the time, but disabled in your device?
> >
> It seems better to put in enable_vblank, i will try and test it... Thks
>=20
>   And I would assume that you would
> have the interrupts enabled all the time, but disabled in your device?
> [kevin]I don=E2=80=99t quite understand this, can you help me explain it =
in
> detail?

You seem to have a register that enables and disables the interrupt in
that device. The way we usually deal with them in this case is just to
call request_irq in your bind/probe with the interrupts enabled at the
controller level, and mask them when needed at the device level by
clearing / setting that bit.

Maxime

--4udzy4wtmt67hg7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2NUgAKCRDj7w1vZxhR
xciCAP46gAj+KXXsPheac+fk30LVvpGA59Dov03+CK9oOHW5xQEAtO9jP0S4MKvG
17audHTVg2v8ZC/IUx/t2aKDrRJRDw0=
=Ieuo
-----END PGP SIGNATURE-----

--4udzy4wtmt67hg7k--

--===============1367489658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1367489658==--
