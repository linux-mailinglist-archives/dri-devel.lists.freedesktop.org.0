Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574912A5F84
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32BB6F3BE;
	Wed,  4 Nov 2020 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA196E0B9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 09:47:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C5DEDAEF;
 Tue,  3 Nov 2020 04:47:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 04:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Ok9NtPmzFvVOvpjGGZCkAmB0G7M
 I5VLqTsE8yImsqH8=; b=KjlxmeKFYSP7T7W3MB1RRHBP30PUgf8subN0KUSxvk3
 vRNfgldg47y92TI0trIccsuj+wPu7B5kjsIYOyyn3+bsefn8Sk+qYXvnxS/D0tgr
 Y4llhpBcCx+bvL5d1se+7noatSaekkCEcqdI494/XUom5Fc20rOGbdzKAiegFvbG
 PNig/wEARpGqCEBJZESzeXfsTTG/7kLZV8VgjzUEFOpAbsrxzBnl5mGcTDlFzzRO
 Kf+ZcZpWut+35hUfcYmvAPK5Z8FLiwnaDS6e2OLJ+6/q3VLObL+3aCqp4l/qJFS8
 Abkt3ytS6knAAZQWwzKvLlsjKifiT1wRGorRTiThHGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ok9NtP
 mzFvVOvpjGGZCkAmB0G7MI5VLqTsE8yImsqH8=; b=UNiHWmy1LeTmd3AdkLlfgh
 S7Zdz2XxbQFlV9UPoIEuTgwAKNmBww6equjcYcvUepROy8YyIXPEx+LmSohrg9nq
 /5YHXw8NiOmgIiNdAtexspyfR1h510yKI396LjrzRbQba7Nz606jAhQtChORTR/b
 Tlw8MWT1ELIy7sCOuScbJLhESPTruzxU0CFzU6IMYOYMWRNaZs6KB2PPsUtYNMCW
 NCF59qH8s6c+MMKsjjSAO2Ped7YMAERG5LwQm6HUu6KPRy4zqzP2cF+3TXZq8ClM
 r5E5LseMMz5hoK96DMUfD0BHoK32slgdeFXtRoo+ocGBsJSmI9carsFPpnCuLj3A
 ==
X-ME-Sender: <xms:FCehX_ffqxSH0-oydvtMf4-TVgAmzH3My1rcVoScs9tl0TnfoUkOwQ>
 <xme:FCehX1NiECpa-Apo_oBPkazAZ7atk-euKUiB0ywNXLyPo9fA1g0zw6gW0NYV-SkcB
 i3jNVro5admbJNGC74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteeuffeiheegiefggeeiueejkeevheefvdegkeejhfdtfeevvedugeekveeh
 geefnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdgrqdguihhsphhlrg
 ihrdgurghtrgenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:FCehX4jHNDe1wGKvQFNC9wTkufegC8SsViUkQNPl-XKgf4r8r7kN7Q>
 <xmx:FCehXw-RABO86EnS0mpKT7ktVHFFIyfhoIVCB-XWzf1d-YX9cOarRw>
 <xmx:FCehX7sBqZFI1RB_dHs83a9ih-KioykXQU5IHT35D29whxc15pNPHw>
 <xmx:FiehX08n827q-vV4Zb4B91hQHNjJ77p23Rz6d9lp9JizfdykrVRo7g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 626793280064;
 Tue,  3 Nov 2020 04:47:00 -0500 (EST)
Date: Tue, 3 Nov 2020 10:46:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v7 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <20201103094659.56sdcerwwzqu2gdy@gilmour.lan>
References: <20201102155308.142691-1-paul.kocialkowski@bootlin.com>
 <20201102155308.142691-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20201102155308.142691-3-paul.kocialkowski@bootlin.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1095114161=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1095114161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gy5d5e7vk7wikmeh"
Content-Disposition: inline


--gy5d5e7vk7wikmeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 04:53:07PM +0100, Paul Kocialkowski wrote:
> Introduces a driver for the LogiCVC display controller, a programmable
> logic controller optimized for use in Xilinx Zynq-7000 SoCs and other
> Xilinx FPGAs. The controller is mostly configured at logic synthesis
> time so only a subset of configuration is left for the driver to
> handle.
>=20
> The following features are implemented and tested:
> - LVDS 4-bit interface;
> - RGB565 pixel formats;
> - Multiple layers and hardware composition;
> - Layer-wide alpha mode;
>=20
> The following features are implemented but untested:
> - Other RGB pixel formats;
> - Layer framebuffer configuration for version 4;
> - Lowest-layer used as background color;
> - Per-pixel alpha mode.
>=20
> The following features are not implemented:
> - YUV pixel formats;
> - DVI, LVDS 3-bit, ITU656 and camera link interfaces;
> - External parallel input for layer;
> - Color-keying;
> - LUT-based alpha modes.
>=20
> Additional implementation-specific notes:
> - Panels are only enabled after the first page flip to avoid flashing a
>   white screen.
> - Depth used in context of the LogiCVC driver only counts color components
>   to match the definition of the synthesis parameters.
>=20
> Support is implemented for both version 3 and 4 of the controller.
>=20
> With version 3, framebuffers are stored in a dedicated contiguous
> memory area, with a base address hardcoded for each layer. This requires
> using a dedicated CMA pool registered at the base address and tweaking a
> few offset-related registers to try to use any buffer allocated from
> the pool. This is done on a best-effort basis to have the hardware cope
> with the DRM framebuffer allocation model and there is no guarantee
> that each buffer allocated by GEM CMA can be used for any layer.
> In particular, buffers allocated below the base address for a layer are
> guaranteed not to be configurable for that layer. See the implementation =
of
> logicvc_layer_buffer_find_setup for specifics.
>=20
> Version 4 allows configuring each buffer address directly, which
> guarantees that any buffer can be configured.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

There's a bunch of checkpatch issues here

> ---
>  MAINTAINERS                                 |   6 +
>  drivers/gpu/drm/Kconfig                     |   2 +
>  drivers/gpu/drm/Makefile                    |   1 +
>  drivers/gpu/drm/logicvc/Kconfig             |   9 +
>  drivers/gpu/drm/logicvc/Makefile            |   4 +
>  drivers/gpu/drm/logicvc/logicvc_crtc.c      | 277 +++++++++
>  drivers/gpu/drm/logicvc/logicvc_crtc.h      |  21 +
>  drivers/gpu/drm/logicvc/logicvc_drm.c       | 472 +++++++++++++++
>  drivers/gpu/drm/logicvc/logicvc_drm.h       |  64 ++
>  drivers/gpu/drm/logicvc/logicvc_interface.c | 224 +++++++
>  drivers/gpu/drm/logicvc/logicvc_interface.h |  30 +
>  drivers/gpu/drm/logicvc/logicvc_layer.c     | 615 ++++++++++++++++++++
>  drivers/gpu/drm/logicvc/logicvc_layer.h     |  64 ++
>  drivers/gpu/drm/logicvc/logicvc_mode.c      | 101 ++++
>  drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
>  drivers/gpu/drm/logicvc/logicvc_of.c        | 197 +++++++
>  drivers/gpu/drm/logicvc/logicvc_of.h        |  46 ++
>  drivers/gpu/drm/logicvc/logicvc_regs.h      |  88 +++
>  18 files changed, 2236 insertions(+)
>  create mode 100644 drivers/gpu/drm/logicvc/Kconfig
>  create mode 100644 drivers/gpu/drm/logicvc/Makefile
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71e29dc0ab9d..9c4c5edef0ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5522,6 +5522,12 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/i810/
>  F:	include/uapi/drm/i810_drm.h
> =20
> +DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
> +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +S:	Supported
> +F:	drivers/gpu/drm/logicvc/
> +

Do you have the rights to commit in drm-misc or will you need it?

> +static int logicvc_crtc_atomic_check(struct drm_crtc *drm_crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, drm_crtc);
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> +
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return -EINVAL;
> +
> +	return 0;
> +}

You probably want to have a mode_valid here to check for this as well,
it would be weird to expose a mode that we outright reject.

> +static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_old_crtc_state(state, drm_crtc);
> +	struct drm_device *drm_dev =3D drm_crtc->dev;
> +	unsigned long flags;
> +
> +	/* Register pending event, only if vblank is already on. */
> +	if (drm_crtc->state->event && crtc_state->active) {
> +		spin_lock_irqsave(&drm_dev->event_lock, flags);
> +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> +
> +		crtc->event =3D drm_crtc->state->event;
> +		drm_crtc->state->event =3D NULL;
> +
> +		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
> +	}
> +}

That's unusual to do it in atomic_begin, why do you need it?

> +static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
> +				       struct drm_atomic_state *state)
> +{
> +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_crtc->dev);
> +	struct drm_display_mode *mode =3D &drm_crtc->state->adjusted_mode;

You should use drm_atomic_get_new_crtc_state here, we're removing the
direct references of crtc->state to make it more obvious if we're using
the old or new state.

> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_old_crtc_state(state, drm_crtc);
> +	struct drm_device *drm_dev =3D drm_crtc->dev;
> +	unsigned int hact, hfp, hsl, hbp;
> +	unsigned int vact, vfp, vsl, vbp;
> +	unsigned long flags;
> +	u32 ctrl;
> +
> +	/* Timings */
> +
> +	hact =3D mode->hdisplay;
> +	hfp =3D mode->hsync_start - mode->hdisplay;
> +	hsl =3D mode->hsync_end - mode->hsync_start;
> +	hbp =3D mode->htotal - mode->hsync_end;
> +
> +	vact =3D mode->vdisplay;
> +	vfp =3D mode->vsync_start - mode->vdisplay;
> +	vsl =3D mode->vsync_end - mode->vsync_start;
> +	vbp =3D mode->vtotal - mode->vsync_end;
> +
> +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_FRONT_PORCH_REG, hfp - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_REG, hsl - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_BACK_PORCH_REG, hbp - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_HRES_REG, hact - 1);
> +
> +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_FRONT_PORCH_REG, vfp - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_REG, vsl - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_BACK_PORCH_REG, vbp - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_VRES_REG, vact - 1);
> +
> +	/* Signals */
> +
> +	ctrl =3D LOGICVC_CTRL_HSYNC_ENABLE | LOGICVC_CTRL_VSYNC_ENABLE |
> +	       LOGICVC_CTRL_DE_ENABLE;
> +
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		ctrl |=3D LOGICVC_CTRL_HSYNC_INVERT;
> +
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		ctrl |=3D LOGICVC_CTRL_VSYNC_INVERT;
> +
> +	if (logicvc->interface) {
> +		struct drm_connector *connector =3D
> +			&logicvc->interface->drm_connector;
> +		struct drm_display_info *display_info =3D
> +			&connector->display_info;
> +
> +		if (display_info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> +			ctrl |=3D LOGICVC_CTRL_DE_INVERT;
> +
> +		if (display_info->bus_flags &
> +		    DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +			ctrl |=3D LOGICVC_CTRL_CLOCK_INVERT;
> +	}
> +
> +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> +			   LOGICVC_CTRL_HSYNC_ENABLE |
> +			   LOGICVC_CTRL_HSYNC_INVERT |
> +			   LOGICVC_CTRL_VSYNC_ENABLE |
> +			   LOGICVC_CTRL_VSYNC_INVERT |
> +			   LOGICVC_CTRL_DE_ENABLE |
> +			   LOGICVC_CTRL_DE_INVERT |
> +			   LOGICVC_CTRL_PIXEL_INVERT |
> +			   LOGICVC_CTRL_CLOCK_INVERT, ctrl);
> +
> +	/* Generate internal state reset. */
> +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> +
> +	drm_crtc_vblank_on(drm_crtc);
> +
> +	/* Register our event after vblank is enabled. */
> +	if (drm_crtc->state->event && !crtc_state->active) {
> +		spin_lock_irqsave(&drm_dev->event_lock, flags);
> +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> +
> +		crtc->event =3D drm_crtc->state->event;
> +		drm_crtc->state->event =3D NULL;
> +		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
> +	}

Haven't you done that in atomic_begin already?

> +}
> +
> +static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
> +					struct drm_atomic_state *state)
> +{
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_crtc->dev);
> +	struct drm_device *drm_dev =3D drm_crtc->dev;
> +
> +	drm_crtc_vblank_off(drm_crtc);
> +
> +	/* Disable and clear CRTC bits. */
> +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> +			   LOGICVC_CTRL_HSYNC_ENABLE |
> +			   LOGICVC_CTRL_HSYNC_INVERT |
> +			   LOGICVC_CTRL_VSYNC_ENABLE |
> +			   LOGICVC_CTRL_VSYNC_INVERT |
> +			   LOGICVC_CTRL_DE_ENABLE |
> +			   LOGICVC_CTRL_DE_INVERT |
> +			   LOGICVC_CTRL_PIXEL_INVERT |
> +			   LOGICVC_CTRL_CLOCK_INVERT, 0);
> +
> +	/* Generate internal state reset. */
> +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> +
> +	/* Consume leftover event since vblank is now disabled. */
> +	if (drm_crtc->state->event && !drm_crtc->state->active) {
> +		spin_lock_irq(&drm_dev->event_lock);
> +
> +		drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
> +		drm_crtc->state->event =3D NULL;
> +		spin_unlock_irq(&drm_dev->event_lock);
> +	}

And here too. It's definitely worth explaining in the commit log and /
or comments what you're trying to address.

> +}
> +
> +static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs =3D {
> +	.atomic_check		=3D logicvc_crtc_atomic_check,
> +	.atomic_begin		=3D logicvc_crtc_atomic_begin,
> +	.atomic_enable		=3D logicvc_crtc_atomic_enable,
> +	.atomic_disable		=3D logicvc_crtc_atomic_disable,
> +};
> +
> +static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
> +{
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_crtc->dev);
> +
> +	/* Clear any pending V_SYNC interrupt. */
> +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
> +			  LOGICVC_INT_STAT_V_SYNC, LOGICVC_INT_STAT_V_SYNC);
> +
> +	/* Unmask V_SYNC interrupt. */
> +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> +			  LOGICVC_INT_MASK_V_SYNC, 0);
> +
> +	return 0;
> +}
> +
> +static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
> +{
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_crtc->dev);
> +
> +	/* Mask V_SYNC interrupt. */
> +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> +			  LOGICVC_INT_MASK_V_SYNC, LOGICVC_INT_MASK_V_SYNC);
> +}
> +
> +static const struct drm_crtc_funcs logicvc_crtc_funcs =3D {
> +	.reset			=3D drm_atomic_helper_crtc_reset,
> +	.destroy		=3D drm_crtc_cleanup,
> +	.set_config		=3D drm_atomic_helper_set_config,
> +	.page_flip		=3D drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank		=3D logicvc_crtc_enable_vblank,
> +	.disable_vblank		=3D logicvc_crtc_disable_vblank,
> +};
> +
> +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct logicvc_crtc *crtc =3D logicvc->crtc;
> +	unsigned long flags;
> +
> +	if (!crtc)
> +		return;
> +
> +	drm_crtc_handle_vblank(&crtc->drm_crtc);
> +
> +	if (crtc->event) {
> +		spin_lock_irqsave(&drm_dev->event_lock, flags);
> +		drm_crtc_send_vblank_event(&crtc->drm_crtc, crtc->event);
> +		drm_crtc_vblank_put(&crtc->drm_crtc);
> +		crtc->event =3D NULL;
> +		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
> +	}
> +}
> +
> +int logicvc_crtc_init(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +	struct device_node *of_node =3D dev->of_node;
> +	struct logicvc_crtc *crtc;
> +	struct logicvc_layer *layer_primary;
> +	int ret;
> +
> +	crtc =3D devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc)
> +		return -ENOMEM;
> +
> +	layer_primary =3D logicvc_layer_get_primary(logicvc);
> +	if (!layer_primary) {
> +		DRM_ERROR("Failed to get primary layer\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D drm_crtc_init_with_planes(drm_dev, &crtc->drm_crtc,
> +					&layer_primary->drm_plane, NULL,
> +					&logicvc_crtc_funcs, NULL);
> +	if (ret) {
> +		DRM_ERROR("Failed to initalize CRTC\n");
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&crtc->drm_crtc, &logicvc_crtc_helper_funcs);
> +
> +	crtc->drm_crtc.port =3D of_graph_get_port_by_id(of_node, 1);
> +
> +	logicvc->crtc =3D crtc;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/log=
icvc/logicvc_crtc.h
> new file mode 100644
> index 000000000000..6a1291c37704
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_CRTC_H_
> +#define _LOGICVC_CRTC_H_
> +
> +struct drm_pending_vblank_event;
> +struct logicvc_drm;
> +
> +struct logicvc_crtc {
> +	struct drm_crtc drm_crtc;
> +	struct drm_pending_vblank_event *event;
> +};
> +
> +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc);
> +int logicvc_crtc_init(struct logicvc_drm *logicvc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logi=
cvc/logicvc_drm.c
> new file mode 100644
> index 000000000000..b73e92fb2026
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -0,0 +1,472 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_mode.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_of.h"
> +#include "logicvc_regs.h"
> +
> +DEFINE_DRM_GEM_CMA_FOPS(logicvc_drm_fops);
> +
> +static int logicvc_drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +					   struct drm_device *drm_dev,
> +					   struct drm_mode_create_dumb *args)
> +{
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_dev);
> +
> +	/* Stride is always fixed to its configuration value. */
> +	args->pitch =3D logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, 8);
> +
> +	return drm_gem_cma_dumb_create_internal(file_priv, drm_dev, args);
> +}
> +
> +static struct drm_driver logicvc_drm_driver =3D {
> +	.driver_features		=3D DRIVER_GEM | DRIVER_MODESET |
> +					  DRIVER_ATOMIC,
> +
> +	.fops				=3D &logicvc_drm_fops,
> +	.name				=3D "logicvc-drm",
> +	.desc				=3D "Xylon LogiCVC DRM driver",
> +	.date				=3D "20200403",
> +	.major				=3D 1,
> +	.minor				=3D 0,
> +
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(logicvc_drm_gem_cma_dumb_c=
reate),
> +};
> +
> +static struct regmap_config logicvc_drm_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.name		=3D "logicvc-drm",
> +};
> +
> +static irqreturn_t logicvc_drm_irq_handler(int irq, void *data)
> +{
> +	struct logicvc_drm *logicvc =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 stat =3D 0;
> +
> +	/* Get pending interrupt sources. */
> +	regmap_read(logicvc->regmap, LOGICVC_INT_STAT_REG, &stat);
> +
> +	/* Clear all pending interrupt sources. */
> +	regmap_write(logicvc->regmap, LOGICVC_INT_STAT_REG, stat);
> +
> +	if (stat & LOGICVC_INT_STAT_V_SYNC) {
> +		logicvc_crtc_vblank_handler(logicvc);
> +		ret =3D IRQ_HANDLED;
> +	}
> +
> +	return ret;
> +}
> +
> +static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +	struct device_node *of_node =3D dev->of_node;
> +	struct logicvc_drm_config *config =3D &logicvc->config;
> +	struct device_node *layers_node;
> +	int ret;
> +
> +	logicvc_of_property_parse_bool(of_node, LOGICVC_OF_PROPERTY_DITHERING,
> +				       &config->dithering);
> +	logicvc_of_property_parse_bool(of_node,
> +				       LOGICVC_OF_PROPERTY_BACKGROUND_LAYER,
> +				       &config->background_layer);
> +	logicvc_of_property_parse_bool(of_node,
> +				       LOGICVC_OF_PROPERTY_LAYERS_CONFIGURABLE,
> +				       &config->layers_configurable);
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_DISPLAY_INTERFACE,
> +					    &config->display_interface);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_DISPLAY_COLORSPACE,
> +					    &config->display_colorspace);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_DISPLAY_DEPTH,
> +					    &config->display_depth);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_ROW_STRIDE,
> +					    &config->row_stride);
> +	if (ret)
> +		return ret;
> +
> +	layers_node =3D of_get_child_by_name(of_node, "layers");
> +	if (!layers_node) {
> +		DRM_ERROR("Missing non-optional layers node\n");
> +		return -EINVAL;
> +	}
> +
> +	config->layers_count =3D of_get_child_count(layers_node);
> +	if (!config->layers_count) {
> +		DRM_ERROR("Missing a non-optional layers children node\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void logicvc_version_print(struct logicvc_drm *logicvc)
> +{
> +	u32 version;
> +
> +	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
> +
> +	DRM_INFO("LogiCVC version %d.%02d.%c\n",
> +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
> +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
> +		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
> +		 'a');

DRM_DEV_INFO?

> +}
> +
> +static int logicvc_clocks_prepare(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +
> +	struct {
> +		struct clk **clk;
> +		char *name;
> +		bool optional;
> +	} clocks_map[] =3D {
> +		{
> +			.clk =3D &logicvc->vclk,
> +			.name =3D "vclk",
> +			.optional =3D false,
> +		},
> +		{
> +			.clk =3D &logicvc->vclk2,
> +			.name =3D "vclk2",
> +			.optional =3D true,
> +		},
> +		{
> +			.clk =3D &logicvc->lvdsclk,
> +			.name =3D "lvdsclk",
> +			.optional =3D true,
> +		},
> +		{
> +			.clk =3D &logicvc->lvdsclkn,
> +			.name =3D "lvdsclkn",
> +			.optional =3D true,
> +		},
> +	};
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(clocks_map); i++) {
> +		struct clk *clk;
> +
> +		clk =3D devm_clk_get(dev, clocks_map[i].name);
> +		if (IS_ERR(clk)) {
> +			if (PTR_ERR(clk) =3D=3D -ENOENT && clocks_map[i].optional)
> +				continue;
> +
> +			DRM_ERROR("Missing non-optional clock %s\n",
> +				  clocks_map[i].name);
> +
> +			ret =3D PTR_ERR(clk);
> +			goto error;
> +		}
> +
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to prepare and enable clock %s\n",
> +				  clocks_map[i].name);
> +			goto error;
> +		}
> +
> +		*clocks_map[i].clk =3D clk;
> +	}
> +
> +	return 0;
> +
> +error:
> +	for (i =3D 0; i < ARRAY_SIZE(clocks_map); i++) {
> +		if (!*clocks_map[i].clk)
> +			continue;
> +
> +		clk_disable_unprepare(*clocks_map[i].clk);
> +		*clocks_map[i].clk =3D NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int logicvc_clocks_unprepare(struct logicvc_drm *logicvc)
> +{
> +	struct clk **clocks[] =3D {
> +		&logicvc->vclk,
> +		&logicvc->vclk2,
> +		&logicvc->lvdsclk,
> +		&logicvc->lvdsclkn,
> +	};
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(clocks); i++) {
> +		if (!*clocks[i])
> +			continue;
> +
> +		clk_disable_unprepare(*clocks[i]);
> +		*clocks[i] =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int logicvc_drm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *of_node =3D pdev->dev.of_node;
> +	struct device_node *reserved_mem_node;
> +	struct reserved_mem *reserved_mem =3D NULL;
> +	const struct logicvc_drm_caps *caps;
> +	struct logicvc_drm *logicvc;
> +	struct device *dev =3D &pdev->dev;
> +	struct drm_device *drm_dev;
> +	struct regmap *regmap;
> +	struct resource res;
> +	void __iomem *base;
> +	int irq;
> +	int ret;
> +
> +	caps =3D of_device_get_match_data(dev);
> +	if (!caps)
> +		return -EINVAL;
> +
> +	ret =3D of_reserved_mem_device_init(dev);
> +	if (ret && ret !=3D -ENODEV) {
> +		dev_err(dev, "Failed to init memory region\n");
> +		goto error_early;
> +	}
> +
> +	reserved_mem_node =3D of_parse_phandle(of_node, "memory-region", 0);
> +	if (reserved_mem_node) {
> +		reserved_mem =3D of_reserved_mem_lookup(reserved_mem_node);
> +		of_node_put(reserved_mem_node);
> +	}
> +
> +	/* Get regmap from syscon first if available. */
> +	regmap =3D syscon_regmap_lookup_by_phandle(of_node, "xylon,syscon");
> +
> +	/* Then get regmap from parent if available. */
> +	if (IS_ERR(regmap) && of_node->parent)
> +		regmap =3D syscon_node_to_regmap(of_node->parent);
> +
> +	/* Register our own regmap otherwise. */
> +	if (IS_ERR(regmap)) {
> +		ret =3D of_address_to_resource(of_node, 0, &res);
> +		if (ret) {
> +			dev_err(dev, "Failed to get resource from address\n");
> +			goto error_reserved_mem;
> +		}
> +
> +		base =3D devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(base)) {
> +			dev_err(dev, "Failed to map I/O base\n");
> +			ret =3D PTR_ERR(base);
> +			goto error_reserved_mem;
> +		}
> +
> +		logicvc_drm_regmap_config.max_register =3D resource_size(&res) -
> +							 4;
> +
> +		regmap =3D devm_regmap_init_mmio(dev, base,
> +					       &logicvc_drm_regmap_config);
> +		if (IS_ERR(regmap)) {
> +			dev_err(dev, "Failed to create regmap for I/O\n");
> +			ret =3D PTR_ERR(regmap);
> +			goto error_reserved_mem;
> +		}
> +	}
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "Failed to get IRQ\n");
> +		ret =3D -ENODEV;
> +		goto error_reserved_mem;
> +	}
> +
> +	logicvc =3D devm_drm_dev_alloc(dev, &logicvc_drm_driver,
> +				     struct logicvc_drm, drm_dev);
> +	if (IS_ERR(logicvc)) {
> +		ret =3D PTR_ERR(logicvc);
> +		goto error_reserved_mem;
> +	}
> +
> +	platform_set_drvdata(pdev, logicvc);
> +	drm_dev =3D &logicvc->drm_dev;
> +
> +	logicvc->caps =3D caps;
> +	logicvc->regmap =3D regmap;
> +	INIT_LIST_HEAD(&logicvc->layers_list);
> +
> +	if (reserved_mem)
> +		logicvc->reserved_mem_base =3D reserved_mem->base;
> +
> +	ret =3D logicvc_clocks_prepare(logicvc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to prepare clocks\n");
> +		goto error_logicvc;
> +	}
> +
> +	ret =3D devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
> +			       dev_name(dev), logicvc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to request IRQ\n");
> +		goto error_clocks;
> +	}

have you considered drm_irq_install?

> +
> +	logicvc_version_print(logicvc);
> +
> +	ret =3D logicvc_drm_config_parse(logicvc);
> +	if (ret && ret !=3D -ENODEV) {
> +		drm_err(drm_dev, "Failed to parse config\n");
> +		goto error_clocks;
> +	}
> +
> +	drm_mode_config_init(drm_dev);

You're supposed to call drm_mode_config_cleanup when using
drm_mode_config_init. You'd be better off switching to
drmm_mode_config_init though.

> +	ret =3D logicvc_layers_init(logicvc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize layers\n");
> +		goto error_clocks;
> +	}
> +
> +	ret =3D logicvc_crtc_init(logicvc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
> +		goto error_clocks;
> +	}
> +
> +	logicvc_layers_attach_crtc(logicvc);
> +
> +	ret =3D logicvc_interface_init(logicvc);
> +	if (ret) {
> +		if (ret !=3D -EPROBE_DEFER)
> +			drm_err(drm_dev, "Failed to initialize interface\n");
> +
> +		goto error_clocks;
> +	}
> +
> +	logicvc_interface_attach_crtc(logicvc);
> +
> +	ret =3D logicvc_mode_init(logicvc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize KMS\n");
> +		goto error_clocks;
> +	}
> +
> +	ret =3D drm_dev_register(drm_dev, 0);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to register DRM device\n");
> +		goto error_mode;
> +	}
> +
> +	drm_fbdev_generic_setup(drm_dev, drm_dev->mode_config.preferred_depth);
> +
> +	return 0;
> +
> +error_mode:
> +	logicvc_mode_fini(logicvc);
> +
> +error_clocks:
> +	logicvc_clocks_unprepare(logicvc);
> +
> +error_logicvc:
> +	drm_dev_put(drm_dev);

You don't need drm_dev_put with devm_drm_dev_alloc

> +error_reserved_mem:
> +	of_reserved_mem_device_release(dev);
> +
> +error_early:
> +	return ret;
> +}
> +
> +static int logicvc_drm_remove(struct platform_device *pdev)
> +{
> +	struct logicvc_drm *logicvc =3D platform_get_drvdata(pdev);
> +	struct device *dev =3D &pdev->dev;
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +
> +	drm_dev_unregister(drm_dev);
> +	drm_atomic_helper_shutdown(drm_dev);
> +
> +	logicvc_mode_fini(logicvc);
> +
> +	logicvc_clocks_unprepare(logicvc);
> +
> +	drm_dev_put(drm_dev);

Ditto

> +	of_reserved_mem_device_release(dev);
> +
> +	return 0;
> +}
> +
> +static const struct logicvc_drm_caps logicvc_drm_caps_3 =3D {
> +	.layer_address =3D false,
> +};
> +
> +static const struct logicvc_drm_caps logicvc_drm_caps_4 =3D {
> +	.layer_address =3D true,
> +};
> +
> +static struct of_device_id logicvc_drm_of_table[] =3D {
> +	{
> +		.compatible =3D "xylon,logicvc-3.02.a-display",
> +		.data =3D &logicvc_drm_caps_3,
> +	},
> +	{
> +		.compatible =3D "xylon,logicvc-4.01.a-display",
> +		.data =3D &logicvc_drm_caps_4,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
> +
> +static struct platform_driver logicvc_drm_platform_driver =3D {
> +	.probe		=3D logicvc_drm_probe,
> +	.remove		=3D logicvc_drm_remove,
> +	.driver		=3D {
> +		.name		=3D "logicvc-drm",
> +		.of_match_table	=3D logicvc_drm_of_table,
> +	},
> +};
> +
> +module_platform_driver(logicvc_drm_platform_driver);
> +
> +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> +MODULE_DESCRIPTION("Xylon LogiCVC DRM driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logi=
cvc/logicvc_drm.h
> new file mode 100644
> index 000000000000..68bbac6c4ab9
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_DRM_H_
> +#define _LOGICVC_DRM_H_
> +
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <drm/drm_device.h>
> +
> +#define LOGICVC_DISPLAY_INTERFACE_RGB			0
> +#define LOGICVC_DISPLAY_INTERFACE_ITU656		1
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS		2
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA	3
> +#define LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS		4
> +#define LOGICVC_DISPLAY_INTERFACE_DVI			5
> +
> +#define LOGICVC_DISPLAY_COLORSPACE_RGB		0
> +#define LOGICVC_DISPLAY_COLORSPACE_YUV422	1
> +#define LOGICVC_DISPLAY_COLORSPACE_YUV444	2
> +
> +#define logicvc_drm(d) \
> +	container_of(d, struct logicvc_drm, drm_dev)
> +
> +struct logicvc_crtc;
> +struct logicvc_interface;
> +
> +struct logicvc_drm_config {
> +	u32 display_interface;
> +	u32 display_colorspace;
> +	u32 display_depth;
> +	u32 row_stride;
> +	bool dithering;
> +	bool background_layer;
> +	bool layers_configurable;
> +	u32 layers_count;
> +};
> +
> +struct logicvc_drm_caps {
> +	bool layer_address;
> +};
> +
> +struct logicvc_drm {
> +	const struct logicvc_drm_caps *caps;
> +	struct logicvc_drm_config config;
> +
> +	struct drm_device drm_dev;
> +	phys_addr_t reserved_mem_base;
> +	struct regmap *regmap;
> +
> +	struct clk *vclk;
> +	struct clk *vclk2;
> +	struct clk *lvdsclk;
> +	struct clk *lvdsclkn;
> +
> +	struct list_head layers_list;
> +	struct logicvc_crtc *crtc;
> +	struct logicvc_interface *interface;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/dr=
m/logicvc/logicvc_interface.c
> new file mode 100644
> index 000000000000..0cfded3792d8
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_regs.h"
> +
> +#define logicvc_interface_from_drm_encoder(c) \
> +	container_of(c, struct logicvc_interface, drm_encoder)
> +#define logicvc_interface_from_drm_connector(c) \
> +	container_of(c, struct logicvc_interface, drm_connector)
> +
> +static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
> +{
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_encoder->dev);
> +	struct logicvc_interface *interface =3D
> +		logicvc_interface_from_drm_encoder(drm_encoder);
> +
> +	regmap_update_bits(logicvc->regmap, LOGICVC_POWER_CTRL_REG,
> +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
> +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
> +
> +	if (interface->drm_panel) {
> +		drm_panel_prepare(interface->drm_panel);
> +
> +		/* Encoder enable is too early to enable the panel and a white
> +		 * screen will be seen if the panel gets enabled before the
> +		 * first page flip is done (and no other framebuffer
> +		 * configuration remains from the boot software). */
> +		interface->drm_panel_enabled =3D false;
> +	}
> +}

That's fishy (and the similar stuff in commit_tail). Is it because you
need to have the CRTC powered before the encoder?

If so, you should try the commit_tail_rpm variant, it makes sure the
CRTC is powered on before making a commit.

> +static void logicvc_encoder_disable(struct drm_encoder *drm_encoder)
> +{
> +	struct logicvc_interface *interface =3D
> +		logicvc_interface_from_drm_encoder(drm_encoder);
> +
> +	if (interface->drm_panel) {
> +		drm_panel_disable(interface->drm_panel);
> +		drm_panel_unprepare(interface->drm_panel);
> +	}
> +}
> +
> +static const struct drm_encoder_helper_funcs logicvc_encoder_helper_func=
s =3D {
> +	.enable			=3D logicvc_encoder_enable,
> +	.disable		=3D logicvc_encoder_disable,
> +};
> +
> +static const struct drm_encoder_funcs logicvc_encoder_funcs =3D {
> +	.destroy		=3D drm_encoder_cleanup,
> +};
> +
> +static int logicvc_connector_get_modes(struct drm_connector *drm_connect=
or)
> +{
> +	struct logicvc_interface *interface =3D
> +		logicvc_interface_from_drm_connector(drm_connector);
> +
> +	if (interface->drm_panel)
> +		return drm_panel_get_modes(interface->drm_panel, drm_connector);
> +	else
> +		WARN_ONCE(1, "Retrieving modes from a native connector is not implemen=
ted.");
> +
> +	return 0;
> +}
> +
> +static const struct drm_connector_helper_funcs logicvc_connector_helper_=
funcs =3D {
> +	.get_modes		=3D logicvc_connector_get_modes,
> +};
> +
> +static void logicvc_connector_destroy(struct drm_connector *drm_connecto=
r)
> +{
> +	drm_connector_cleanup(drm_connector);
> +}

I guess you don't need that intermediate function?

> +static const struct drm_connector_funcs logicvc_connector_funcs =3D {
> +	.reset			=3D drm_atomic_helper_connector_reset,
> +	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> +	.destroy		=3D logicvc_connector_destroy,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int logicvc_interface_encoder_type(struct logicvc_drm *logicvc)
> +{
> +	switch (logicvc->config.display_interface) {
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> +		return DRM_MODE_ENCODER_LVDS;
> +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> +		return DRM_MODE_ENCODER_TMDS;
> +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> +		return DRM_MODE_ENCODER_DPI;
> +	default:
> +		return DRM_MODE_ENCODER_NONE;
> +	}
> +}
> +
> +static int logicvc_interface_connector_type(struct logicvc_drm *logicvc)
> +{
> +	switch (logicvc->config.display_interface) {
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> +		return DRM_MODE_CONNECTOR_LVDS;
> +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> +		return DRM_MODE_CONNECTOR_DVID;
> +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> +		return DRM_MODE_CONNECTOR_DPI;
> +	default:
> +		return DRM_MODE_CONNECTOR_Unknown;
> +	}
> +}
> +
> +static bool logicvc_interface_native_connector(struct logicvc_drm *logic=
vc)
> +{
> +	switch (logicvc->config.display_interface) {
> +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc)
> +{
> +	uint32_t possible_crtcs =3D drm_crtc_mask(&logicvc->crtc->drm_crtc);
> +
> +	logicvc->interface->drm_encoder.possible_crtcs =3D possible_crtcs;
> +}
> +
> +int logicvc_interface_init(struct logicvc_drm *logicvc)
> +{
> +	struct logicvc_interface *interface;
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +	struct device_node *of_node =3D dev->of_node;
> +	int encoder_type =3D logicvc_interface_encoder_type(logicvc);
> +	int connector_type =3D logicvc_interface_connector_type(logicvc);
> +	bool native_connector =3D logicvc_interface_native_connector(logicvc);
> +	int ret;
> +
> +	interface =3D devm_kzalloc(dev, sizeof(*interface), GFP_KERNEL);
> +	if (!interface) {
> +		ret =3D -ENOMEM;
> +		goto error_early;
> +	}
> +
> +	ret =3D drm_of_find_panel_or_bridge(of_node, 1, 0, &interface->drm_pane=
l,
> +					  &interface->drm_bridge);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		goto error_early;
> +
> +	ret =3D drm_encoder_init(drm_dev, &interface->drm_encoder,
> +			       &logicvc_encoder_funcs, encoder_type, NULL);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initalize encoder\n");
> +		goto error_early;
> +	}
> +
> +	drm_encoder_helper_add(&interface->drm_encoder,
> +			       &logicvc_encoder_helper_funcs);
> +
> +	if (native_connector || interface->drm_panel) {
> +		ret =3D drm_connector_init(drm_dev, &interface->drm_connector,
> +					 &logicvc_connector_funcs,
> +					 connector_type);
> +		if (ret) {
> +			drm_err(drm_dev, "Failed to initalize connector\n");
> +			goto error_encoder;
> +		}
> +
> +		drm_connector_helper_add(&interface->drm_connector,
> +					 &logicvc_connector_helper_funcs);
> +
> +		ret =3D drm_connector_attach_encoder(&interface->drm_connector,
> +						   &interface->drm_encoder);
> +		if (ret) {
> +			drm_err(drm_dev,
> +				"Failed to attach connector to encoder\n");
> +			goto error_encoder;
> +		}
> +	}
> +
> +	if (interface->drm_bridge) {
> +		ret =3D drm_bridge_attach(&interface->drm_encoder,
> +					interface->drm_bridge, NULL, 0);
> +		if (ret) {
> +			drm_err(drm_dev,
> +				"Failed to attach bridge to encoder\n");
> +			goto error_encoder;
> +		}
> +	}

You should consider using the bridge_or_panel API.

> +	logicvc->interface =3D interface;
> +
> +	return 0;
> +
> +error_encoder:
> +	drm_encoder_cleanup(&interface->drm_encoder);
> +
> +error_early:
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.h b/drivers/gpu/dr=
m/logicvc/logicvc_interface.h
> new file mode 100644
> index 000000000000..fb2e9e6e04aa
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_interface.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_INTERFACE_H_
> +#define _LOGICVC_INTERFACE_H_
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_panel.h>
> +
> +struct logicvc_drm;
> +
> +struct logicvc_interface {
> +	struct drm_encoder drm_encoder;
> +	struct drm_connector drm_connector;
> +
> +	struct drm_panel *drm_panel;
> +	struct drm_bridge *drm_bridge;
> +
> +	bool drm_panel_enabled;
> +};
> +
> +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc);
> +int logicvc_interface_init(struct logicvc_drm *logicvc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.c
> new file mode 100644
> index 000000000000..9188d45cef77
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -0,0 +1,615 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include "logicvc_crtc.h"
> +#include "logicvc_drm.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_of.h"
> +#include "logicvc_regs.h"
> +
> +#define logicvc_layer(p) \
> +	container_of(p, struct logicvc_layer, drm_plane)
> +
> +static uint32_t logicvc_layer_formats_rgb16[] =3D {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
> +	DRM_FORMAT_INVALID,
> +};
> +
> +static uint32_t logicvc_layer_formats_rgb24[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_INVALID,
> +};
> +
> +/* What we call depth in this driver only counts color components, not a=
lpha.
> + * This allows us to stay compatible with the LogiCVC bistream definitio=
ns. */
> +static uint32_t logicvc_layer_formats_rgb24_alpha[] =3D {
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_INVALID,
> +};
> +
> +static struct logicvc_layer_formats logicvc_layer_formats[] =3D {
> +	{
> +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> +		.depth		=3D 16,
> +		.formats	=3D logicvc_layer_formats_rgb16,
> +	},
> +	{
> +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> +		.depth		=3D 24,
> +		.formats	=3D logicvc_layer_formats_rgb24,
> +	},
> +	{
> +		.colorspace	=3D LOGICVC_LAYER_COLORSPACE_RGB,
> +		.depth		=3D 24,
> +		.alpha		=3D true,
> +		.formats	=3D logicvc_layer_formats_rgb24_alpha,
> +	},
> +	{ }
> +};
> +
> +static bool logicvc_layer_format_inverted(uint32_t format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_BGR565:
> +	case DRM_FORMAT_BGR888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_ABGR8888:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
> +				      struct drm_plane_state *state)
> +{
> +	struct drm_device *drm_dev =3D drm_plane->dev;
> +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_dev);
> +	struct drm_crtc_state *crtc_state;
> +	int min_scale, max_scale;
> +	bool can_position;
> +	int ret;
> +
> +	if (!state->crtc)
> +		return 0;
> +
> +	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state,
> +							state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	if (state->crtc_x < 0 || state->crtc_y < 0) {
> +		drm_err(drm_dev,
> +			"Negative on-CRTC positions are not supported.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!logicvc->caps->layer_address) {
> +		ret =3D logicvc_layer_buffer_find_setup(logicvc, layer, state,
> +						      NULL);
> +		if (ret) {
> +			drm_err(drm_dev, "No viable setup for buffer found.\n");
> +			return ret;
> +		}
> +	}
> +
> +	min_scale =3D DRM_PLANE_HELPER_NO_SCALING;
> +	max_scale =3D DRM_PLANE_HELPER_NO_SCALING;
> +
> +	can_position =3D (drm_plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY &&
> +			layer->index !=3D (logicvc->config.layers_count - 1) &&
> +			logicvc->config.layers_configurable);
> +
> +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> +						  min_scale, max_scale,
> +						  can_position, true);
> +	if (ret) {
> +		drm_err(drm_dev, "Invalid plane state\n\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
> +					struct drm_plane_state *old_state)
> +{
> +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_plane->dev);
> +	struct drm_plane_state *state =3D drm_plane->state;
> +	struct drm_crtc *drm_crtc =3D &logicvc->crtc->drm_crtc;
> +	struct drm_display_mode *mode =3D &drm_crtc->state->adjusted_mode;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	struct logicvc_layer_buffer_setup setup =3D {};
> +	u32 index =3D layer->index;
> +	u32 reg;
> +
> +	/* Layer dimensions */
> +
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_WIDTH_REG(index),
> +		     state->crtc_w - 1);
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HEIGHT_REG(index),
> +		     state->crtc_h - 1);
> +
> +	if (logicvc->caps->layer_address) {
> +		phys_addr_t fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> +
> +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
> +			     fb_addr);
> +	} else {
> +		/* Rely on offsets to configure the address. */
> +
> +		logicvc_layer_buffer_find_setup(logicvc, layer, state, &setup);
> +
> +		/* Layer memory offsets */
> +
> +		regmap_write(logicvc->regmap, LOGICVC_BUFFER_SEL_REG,
> +			     LOGICVC_BUFFER_SEL_VALUE(index, setup.buffer_sel));
> +		regmap_write(logicvc->regmap, LOGICVC_LAYER_HOFFSET_REG(index),
> +			     setup.hoffset);
> +		regmap_write(logicvc->regmap, LOGICVC_LAYER_VOFFSET_REG(index),
> +			     setup.voffset);
> +	}
> +
> +	/* Layer position */
> +
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HPOSITION_REG(index),
> +		     mode->hdisplay - 1 - state->crtc_x);
> +
> +	/* Vertical position must be set last to sync layer register changes. */
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_VPOSITION_REG(index),
> +		     mode->vdisplay - 1 - state->crtc_y);
> +
> +	/* Layer alpha */
> +
> +	if (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_LAYER) {
> +		u32 alpha_bits;
> +		u32 alpha_max;
> +		u32 alpha;
> +
> +		switch (layer->config.depth) {
> +		case 8:
> +			alpha_bits =3D 3;
> +			break;
> +		case 16:
> +			if (layer->config.colorspace =3D=3D LOGICVC_LAYER_COLORSPACE_YUV)
> +				alpha_bits =3D 8;
> +			else
> +				alpha_bits =3D 6;
> +			break;
> +		default:
> +			alpha_bits =3D 8;
> +			break;
> +		}
> +
> +		alpha_max =3D BIT(alpha_bits) - 1;
> +		alpha =3D state->alpha * alpha_max / DRM_BLEND_ALPHA_OPAQUE;
> +
> +		DRM_DEBUG_DRIVER("Setting layer %d alpha to %d/%d\n", index,
> +				 alpha, alpha_max);
> +
> +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ALPHA_REG(index),
> +			     alpha);
> +	}
> +
> +	/* Layer control */
> +
> +	reg =3D LOGICVC_LAYER_CTRL_ENABLE;
> +
> +	if (logicvc_layer_format_inverted(fb->format->format))
> +		reg |=3D LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
> +
> +	reg |=3D LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
> +
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
> +}
> +
> +static void logicvc_plane_atomic_disable(struct drm_plane *drm_plane,
> +					 struct drm_plane_state *old_state)
> +{
> +	struct logicvc_layer *layer =3D logicvc_layer(drm_plane);
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_plane->dev);
> +	u32 index =3D layer->index;
> +
> +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), 0);
> +}
> +
> +static struct drm_plane_helper_funcs logicvc_plane_helper_funcs =3D {
> +	.atomic_check		=3D logicvc_plane_atomic_check,
> +	.atomic_update		=3D logicvc_plane_atomic_update,
> +	.atomic_disable		=3D logicvc_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs logicvc_plane_funcs =3D {
> +	.update_plane		=3D drm_atomic_helper_update_plane,
> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
> +	.destroy		=3D drm_plane_cleanup,
> +	.reset			=3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> +};
> +
> +int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
> +				    struct logicvc_layer *layer,
> +				    struct drm_plane_state *state,
> +				    struct logicvc_layer_buffer_setup *setup)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	/* All the supported formats have a single data plane. */
> +	u32 layer_bytespp =3D fb->format->cpp[0];
> +	u32 layer_stride =3D layer_bytespp * logicvc->config.row_stride;
> +	u32 base_offset =3D layer->config.base_offset * layer_stride;
> +	u32 buffer_offset =3D layer->config.buffer_offset * layer_stride;
> +	u8 buffer_sel =3D 0;
> +	u16 voffset =3D 0;
> +	u16 hoffset =3D 0;
> +	phys_addr_t fb_addr;
> +	u32 fb_offset;
> +	u32 gap;
> +
> +	if (!logicvc->reserved_mem_base) {
> +		drm_err(drm_dev, "No reserved memory base was registered!\n");
> +		return -ENOMEM;
> +	}
> +
> +	fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> +	if (fb_addr < logicvc->reserved_mem_base) {
> +		drm_err(drm_dev,
> +			"Framebuffer memory below reserved memory base!\n");
> +		return -EINVAL;
> +	}
> +
> +	fb_offset =3D (u32) (fb_addr - logicvc->reserved_mem_base);
> +
> +	if (fb_offset < base_offset) {
> +		drm_err(drm_dev,
> +			"Framebuffer offset below layer base offset!\n");
> +		return -EINVAL;
> +	}
> +
> +	gap =3D fb_offset - base_offset;
> +
> +	/* Use the possible video buffers selection. */
> +	if (gap && buffer_offset) {
> +		buffer_sel =3D gap / buffer_offset;
> +		if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
> +			buffer_sel =3D LOGICVC_BUFFER_SEL_MAX;
> +
> +		gap -=3D buffer_sel * buffer_offset;
> +	}
> +
> +	/* Use the vertical offset. */
> +	if (gap && layer_stride && logicvc->config.layers_configurable) {
> +		voffset =3D gap / layer_stride;
> +		if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
> +			voffset =3D LOGICVC_LAYER_VOFFSET_MAX;
> +
> +		gap -=3D voffset * layer_stride;
> +	}
> +
> +	/* Use the horizontal offset. */
> +	if (gap && layer_bytespp && logicvc->config.layers_configurable) {
> +		hoffset =3D gap / layer_bytespp;
> +		if (hoffset > LOGICVC_DIMENSIONS_MAX)
> +			hoffset =3D LOGICVC_DIMENSIONS_MAX;
> +
> +		gap -=3D hoffset * layer_bytespp;
> +	}
> +
> +	if (gap) {
> +		drm_err(drm_dev,
> +			"Unable to find layer %d buffer setup for 0x%x byte gap\n",
> +			layer->index, fb_offset - base_offset);
> +		return -EINVAL;
> +	}
> +
> +	DRM_DEBUG_DRIVER("Found layer %d buffer setup for 0x%x byte gap:\n",
> +			 layer->index, fb_offset - base_offset);
> +
> +	DRM_DEBUG_DRIVER("- buffer_sel =3D 0x%x chunks of 0x%x bytes\n",
> +			 buffer_sel, buffer_offset);
> +	DRM_DEBUG_DRIVER("- voffset =3D 0x%x chunks of 0x%x bytes\n", voffset,
> +			 layer_stride);
> +	DRM_DEBUG_DRIVER("- hoffset =3D 0x%x chunks of 0x%x bytes\n", hoffset,
> +			 layer_bytespp);
> +
> +	if (setup) {
> +		setup->buffer_sel =3D buffer_sel;
> +		setup->voffset =3D voffset;
> +		setup->hoffset =3D hoffset;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct logicvc_layer_formats *logicvc_layer_formats_lookup(struct=
 logicvc_layer *layer)
> +{
> +	bool alpha;
> +	unsigned int i =3D 0;
> +
> +	alpha =3D (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_PIXEL);
> +
> +	while (logicvc_layer_formats[i].formats) {
> +		if (logicvc_layer_formats[i].colorspace =3D=3D layer->config.colorspac=
e &&
> +		    logicvc_layer_formats[i].depth =3D=3D layer->config.depth &&
> +		    logicvc_layer_formats[i].alpha =3D=3D alpha)
> +			return &logicvc_layer_formats[i];
> +
> +		i++;
> +	}
> +
> +	return NULL;
> +}
> +
> +static unsigned int logicvc_layer_formats_count(struct logicvc_layer_for=
mats *formats)
> +{
> +	unsigned int count =3D 0;
> +
> +	while (formats->formats[count] !=3D DRM_FORMAT_INVALID)
> +		count++;
> +
> +	return count;
> +}
> +
> +static int logicvc_layer_config_parse(struct logicvc_drm *logicvc,
> +				      struct logicvc_layer *layer)
> +{
> +	struct device_node *of_node =3D layer->of_node;
> +	struct logicvc_layer_config *config =3D &layer->config;
> +	int ret;
> +
> +	logicvc_of_property_parse_bool(of_node,
> +				       LOGICVC_OF_PROPERTY_LAYER_PRIMARY,
> +				       &config->primary);
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_LAYER_COLORSPACE,
> +					    &config->colorspace);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_LAYER_DEPTH,
> +					    &config->depth);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_LAYER_ALPHA_MODE,
> +					    &config->alpha_mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Memory offset is only relevant without layer address configuration. =
*/
> +	if (logicvc->caps->layer_address)
> +		return 0;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_LAYER_BASE_OFFSET,
> +					    &config->base_offset);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D logicvc_of_property_parse_u32(of_node,
> +					    LOGICVC_OF_PROPERTY_LAYER_BUFFER_OFFSET,
> +					    &config->buffer_offset);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *l=
ogicvc,
> +						   u32 index)
> +{
> +	struct logicvc_layer *layer;
> +
> +	list_for_each_entry(layer, &logicvc->layers_list, list)
> +		if (layer->index =3D=3D index)
> +			return layer;
> +
> +	return NULL;
> +}
> +
> +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *lo=
gicvc,
> +						  enum drm_plane_type type)
> +{
> +	struct logicvc_layer *layer;
> +
> +	list_for_each_entry(layer, &logicvc->layers_list, list)
> +		if (layer->drm_plane.type =3D=3D type)
> +			return layer;
> +
> +	return NULL;
> +}
> +
> +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logi=
cvc)
> +{
> +	return logicvc_layer_get_from_type(logicvc, DRM_PLANE_TYPE_PRIMARY);
> +}
> +
> +static int logicvc_layer_init(struct logicvc_drm *logicvc,
> +			      struct device_node *of_node, u32 index)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +	struct logicvc_layer *layer =3D NULL;
> +	struct logicvc_layer_formats *formats;
> +	unsigned int formats_count;
> +	enum drm_plane_type type;
> +	unsigned int zpos;
> +	int ret;
> +
> +	layer =3D devm_kzalloc(dev, sizeof(*layer), GFP_KERNEL);
> +	if (!layer) {
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	layer->of_node =3D of_node;
> +	layer->index =3D index;
> +
> +	ret =3D logicvc_layer_config_parse(logicvc, layer);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to parse config for layer #%d\n",
> +			index);
> +		goto error;
> +	}
> +
> +	formats =3D logicvc_layer_formats_lookup(layer);
> +	if (!formats) {
> +		drm_err(drm_dev, "Failed to lookup formats for layer #%d\n",
> +			index);
> +		goto error;
> +	}
> +
> +	formats_count =3D logicvc_layer_formats_count(formats);
> +
> +	/* The final layer can be configured as a background layer. */
> +	if (logicvc->config.background_layer &&
> +	    index =3D=3D (logicvc->config.layers_count - 1)) {
> +		/* A zero value for black is only valid for RGB, not for YUV,
> +		 * so this will need to take the format in account for YUV. */
> +		u32 background =3D 0;
> +
> +		DRM_DEBUG_DRIVER("Using layer #%d as background layer\n",
> +				 index);
> +
> +		regmap_write(logicvc->regmap, LOGICVC_BACKGROUND_COLOR_REG,
> +			     background);
> +
> +		devm_kfree(dev, layer);
> +
> +		return 0;
> +	}
> +
> +	if (layer->config.primary)
> +		type =3D DRM_PLANE_TYPE_PRIMARY;
> +	else
> +		type =3D DRM_PLANE_TYPE_OVERLAY;
> +
> +	ret =3D drm_universal_plane_init(drm_dev, &layer->drm_plane, 0,
> +				       &logicvc_plane_funcs, formats->formats,
> +				       formats_count, NULL, type, NULL);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize layer plane\n");
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(&layer->drm_plane, &logicvc_plane_helper_funcs);
> +
> +	zpos =3D logicvc->config.layers_count - index - 1;
> +	DRM_DEBUG_DRIVER("Giving layer #%d zpos %d\n", index, zpos);
> +
> +	if (layer->config.alpha_mode =3D=3D LOGICVC_LAYER_ALPHA_LAYER)
> +		drm_plane_create_alpha_property(&layer->drm_plane);
> +
> +	drm_plane_create_zpos_immutable_property(&layer->drm_plane, zpos);
> +
> +	DRM_DEBUG_DRIVER("Registering layer #%d\n", index);
> +
> +	layer->formats =3D formats;
> +
> +	list_add_tail(&layer->list, &logicvc->layers_list);
> +
> +	return 0;
> +
> +error:
> +	if (layer)
> +		devm_kfree(dev, layer);
> +
> +	return ret;
> +}
> +
> +static void logicvc_layer_fini(struct logicvc_drm *logicvc,
> +			       struct logicvc_layer *layer)
> +{
> +	struct device *dev =3D logicvc->drm_dev.dev;
> +
> +	list_del(&layer->list);
> +	devm_kfree(dev, layer);
> +}
> +
> +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc)
> +{
> +	uint32_t possible_crtcs =3D drm_crtc_mask(&logicvc->crtc->drm_crtc);
> +	struct logicvc_layer *layer;
> +
> +	list_for_each_entry(layer, &logicvc->layers_list, list) {
> +		if (layer->drm_plane.type !=3D DRM_PLANE_TYPE_OVERLAY)
> +			continue;
> +
> +		layer->drm_plane.possible_crtcs =3D possible_crtcs;
> +	}
> +}
> +
> +int logicvc_layers_init(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct device *dev =3D drm_dev->dev;
> +	struct device_node *of_node =3D dev->of_node;
> +	struct device_node *layer_node =3D NULL;
> +	struct device_node *layers_node;
> +	struct logicvc_layer *layer;
> +	struct logicvc_layer *next;
> +	int ret =3D 0;
> +
> +	layers_node =3D of_get_child_by_name(of_node, "layers");
> +	if (!layers_node) {
> +		DRM_ERROR("No layers node found in the description\n");
> +		ret =3D -ENODEV;
> +		goto error;
> +	}
> +
> +	for_each_child_of_node(layers_node, layer_node) {
> +		u32 index =3D 0;
> +
> +		if (!logicvc_of_node_is_layer(layer_node))
> +			continue;
> +
> +		ret =3D of_property_read_u32(layer_node, "reg", &index);
> +		if (ret)
> +			continue;
> +
> +		layer =3D logicvc_layer_get_from_index(logicvc, index);
> +		if (layer) {
> +			DRM_ERROR("Duplicated entry for layer #%d\n", index);
> +			continue;
> +		}
> +
> +		ret =3D logicvc_layer_init(logicvc, layer_node, index);
> +		if (ret)
> +			goto error;
> +
> +		of_node_put(layer_node);
> +	}
> +
> +	of_node_put(layers_node);
> +
> +	return 0;
> +
> +error:
> +	list_for_each_entry_safe(layer, next, &logicvc->layers_list, list)
> +		logicvc_layer_fini(logicvc, layer);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/lo=
gicvc/logicvc_layer.h
> new file mode 100644
> index 000000000000..c5767c81f446
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#ifndef _LOGICVC_LAYER_H_
> +#define _LOGICVC_LAYER_H_
> +
> +#include <linux/of.h>
> +#include <linux/types.h>
> +#include <drm/drm_plane.h>
> +
> +#define LOGICVC_LAYER_COLORSPACE_RGB		0
> +#define LOGICVC_LAYER_COLORSPACE_YUV		1
> +
> +#define LOGICVC_LAYER_ALPHA_LAYER		0
> +#define LOGICVC_LAYER_ALPHA_PIXEL		1
> +
> +struct logicvc_layer_buffer_setup {
> +	u8 buffer_sel;
> +	u16 voffset;
> +	u16 hoffset;
> +};
> +
> +struct logicvc_layer_config {
> +	u32 colorspace;
> +	u32 depth;
> +	u32 alpha_mode;
> +	u32 base_offset;
> +	u32 buffer_offset;
> +	bool primary;
> +};
> +
> +struct logicvc_layer_formats {
> +	u32 colorspace;
> +	u32 depth;
> +	bool alpha;
> +	uint32_t *formats;
> +};
> +
> +struct logicvc_layer {
> +	struct logicvc_layer_config config;
> +	struct logicvc_layer_formats *formats;
> +	struct device_node *of_node;
> +
> +	struct drm_plane drm_plane;
> +	struct list_head list;
> +	u32 index;
> +};
> +
> +int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
> +				    struct logicvc_layer *layer,
> +				    struct drm_plane_state *state,
> +				    struct logicvc_layer_buffer_setup *setup);
> +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *l=
ogicvc,
> +						   u32 index);
> +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *lo=
gicvc,
> +						  enum drm_plane_type type);
> +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logi=
cvc);
> +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc);
> +int logicvc_layers_init(struct logicvc_drm *logicvc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/log=
icvc/logicvc_mode.c
> new file mode 100644
> index 000000000000..aa8f35b64c75
> --- /dev/null
> +++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "logicvc_drm.h"
> +#include "logicvc_interface.h"
> +#include "logicvc_layer.h"
> +#include "logicvc_mode.h"
> +
> +static void logicvc_mode_atomic_commit_tail(struct drm_atomic_state *old=
_state)
> +{
> +	struct drm_device *drm_dev =3D old_state->dev;
> +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_dev);
> +	struct logicvc_interface *interface =3D logicvc->interface;
> +
> +	drm_atomic_helper_commit_tail(old_state);
> +
> +	/* Enable the panel after the first commit, which concerns our panel
> +	 * since we only support a single interface. */
> +	if (interface->drm_panel && !interface->drm_panel_enabled) {
> +		drm_panel_enable(interface->drm_panel);
> +		interface->drm_panel_enabled =3D true;
> +	}
> +}
> +
> +static const struct drm_mode_config_helper_funcs logicvc_mode_config_hel=
per_funcs =3D {
> +	.atomic_commit_tail	=3D logicvc_mode_atomic_commit_tail,
> +};
> +
> +static const struct drm_mode_config_funcs logicvc_mode_config_funcs =3D {
> +	.fb_create		=3D drm_gem_fb_create,
> +	.output_poll_changed	=3D drm_fb_helper_output_poll_changed,
> +	.atomic_check		=3D drm_atomic_helper_check,
> +	.atomic_commit		=3D drm_atomic_helper_commit,
> +};
> +
> +int logicvc_mode_init(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +	struct drm_mode_config *mode_config =3D &drm_dev->mode_config;
> +	struct logicvc_layer *layer_primary;
> +	uint32_t preferred_depth;
> +	int ret;
> +
> +	ret =3D drm_vblank_init(drm_dev, mode_config->num_crtc);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize vblank\n");
> +		return ret;
> +	}
> +
> +	layer_primary =3D logicvc_layer_get_primary(logicvc);
> +	if (!layer_primary) {
> +		drm_err(drm_dev, "Failed to get primary layer\n");
> +		return -EINVAL;
> +	}
> +
> +	preferred_depth =3D layer_primary->formats->depth;
> +
> +	/* DRM counts alpha in depth, our driver doesn't. */
> +	if (layer_primary->formats->alpha)
> +		preferred_depth +=3D 8;
> +
> +	mode_config->min_width =3D 64;
> +	mode_config->max_width =3D 2048;
> +	mode_config->min_height =3D 1;
> +	mode_config->max_height =3D 2048;
> +	mode_config->preferred_depth =3D preferred_depth;
> +	mode_config->funcs =3D &logicvc_mode_config_funcs;
> +	mode_config->helper_private =3D &logicvc_mode_config_helper_funcs;
> +
> +	drm_mode_config_reset(drm_dev);
> +
> +	drm_kms_helper_poll_init(drm_dev);
> +
> +	return 0;
> +}
> +
> +void logicvc_mode_fini(struct logicvc_drm *logicvc)
> +{
> +	struct drm_device *drm_dev =3D &logicvc->drm_dev;
> +
> +	drm_kms_helper_poll_fini(drm_dev);
> +}

You should consider using a drmm_add_action_or_reset here to simplify
your error / remove path.

Maxime

--gy5d5e7vk7wikmeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EnEwAKCRDj7w1vZxhR
xQHcAP9SsjUnueck81dnvsOhimqtTz7mm5Xh925g97f2bWaT6QD+JAv2mqUoY1wz
ZlmtKszz16nKb/4e9MxLBNfuwvnzEAk=
=kx4A
-----END PGP SIGNATURE-----

--gy5d5e7vk7wikmeh--

--===============1095114161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1095114161==--
