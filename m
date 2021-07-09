Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD033C200F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4B6E9C4;
	Fri,  9 Jul 2021 07:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28BD6E9C4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:36:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id c28so20975523lfp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VaG3Y7YczFtAXNuFBMM0Ku3shZIALJVSIv8n6IlowFI=;
 b=fAL6q6qniIU8H4H9DZhMzTcZDmbFXGInT7nT4vDDgE2+uPu79twQBY3pMVuoUX/vGD
 K1A6drmmCko1gcimQqFYsAUhHEvqD8MHRzu5I8lWnE/nkiadzl1J5liTypQyR4J98WCU
 EVhMPUBbGB+vjyhSREsr18E9DwZluKSLjc4N3J5yfH6GrT1gitjYnqJpAyxs0cZ7i7XB
 u99eWTyUzZG25JhSP8TS9VhiBSdyVhuvWvVl7sGsynAgIGwxHm2nnwu2dYDPkcjQTyRi
 htoJUG3K5J7BcxeCnIF0CBcb4h4iAGul3ITWJyOnQ76JlKNUYOFo2bzYH/U6TvSKBB8D
 sl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VaG3Y7YczFtAXNuFBMM0Ku3shZIALJVSIv8n6IlowFI=;
 b=W2xmmYmi3KOJ66WagtCReOyzOkSC/hxBfUnDTVmg2wwFRQMNIAr42JeYIMaQpWHlsJ
 IulYbgwGtaFDcw/rPzoD0aF0p4Fw/MW9zUP+1OYi1+9frq4P8rxxPgqv2T4N0GtIGscW
 y5BMxbckXCIv//ZEx4F5IpeIfYgV0rTDA8zBuKsNMJe//ZEiWW2ffgwpesH3Y+cHFOkv
 5VUa7lgZmyZ2tt4z8tjIbB6uBiwpbtkpFVWRi8bXWxThFKGNejQyi0j+G99gwkMuqJ2b
 QoQwiBdtvu7/dZgTyIzt0gTGTn5IQb94GgQhroOvR26GdWD6yGSf6/GRJC6ok7rpy6LT
 kl4A==
X-Gm-Message-State: AOAM531vxgvXk3BvD+pIdlUfgymcnARFBKYRYXugW8F7UyHJS6/A6sep
 OeQT6DOHN2ixDKPKoxUYKNg=
X-Google-Smtp-Source: ABdhPJw0d6LFsRwC8KFOFQuWrWupIEs47wiHYj9s8/OCEe5YyKRs1dfUxaKUktX3r1qdgyozQ1ag+Q==
X-Received: by 2002:a05:6512:33d0:: with SMTP id
 d16mr19179190lfg.311.1625816178129; 
 Fri, 09 Jul 2021 00:36:18 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l15sm394730lfh.228.2021.07.09.00.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:36:17 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:36:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH 2/2] drm/stm: ltdc: add crtc background color property
 support
Message-ID: <20210709103614.6d5932ca@eldfell>
In-Reply-To: <20210707084557.22443-3-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-3-raphael.gallais-pou@foss.st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W0kPe8=pA33zQt1ChIiblgo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/W0kPe8=pA33zQt1ChIiblgo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Jul 2021 08:48:55 +0000
Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:

> This patch comes from the need to display small resolution pictures with
> very few DDR usage. In practice, using a background color, produced by the
> drm CRTC, around this picture allows to fetch less data in memory than
> setting a full frame picture. And therefore the picture in DDR is smaller
> than the size of the screen.
>=20
> It uses the DRM framework background color property and modifies the
> color to any value between 0x000000 and 0xFFFFFF from userland with a
> RGB24 value (0x00RRGGBB).
>=20
> Using this feature is observable only if layers are not full screen
> or if layers use color formats with alpha and are "transparent" at
> least on some pixels.
>=20
> Depending on the hardware version, the background color can not be
> properly displayed with non-alpha color formats derived from native
> alpha color formats (such as XR24 or XR15) since the use of this
> pixel format generates a non transparent layer. As a workaround,
> the stage background color of the layer and the general background
> color need to be synced.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 48 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 1f9392fb58e1..0aca245288cc 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -196,6 +196,11 @@
> =20
>  #define NB_PF		8		/* Max nb of HW pixel format */
> =20
> +#define DRM_ARGB_TO_LTDC_RGB24(bgcolor) \
> +	((u32)(DRM_ARGB_RED(bgcolor, 8) << 16	\
> +	| DRM_ARGB_GREEN(bgcolor, 8) << 8	\
> +	| DRM_ARGB_BLUE(bgcolor, 8)))
> +
>  enum ltdc_pix_fmt {
>  	PF_NONE,
>  	/* RGB formats */
> @@ -364,6 +369,15 @@ static inline u32 get_pixelformat_without_alpha(u32 =
drm)
>  	}
>  }
> =20
> +/*
> + * All non-alpha color formats derived from native alpha color formats a=
re
> + * either characterized by a FourCC format code (such as XR24, RX24, BX2=
4...)
> + */
> +static inline u32 is_xrgb(u32 drm)
> +{
> +	return ((drm & 'X') =3D=3D 'X' || (drm & ('X' << 8)) =3D=3D ('X' << 8));

Hi,

if you're trying to test whether the last or second last byte in the
format code is exactly 'X', this doesn't do that. What this does is
ignores all the bits that are zero in 'X' and ensures that all the bits
that are one in 'X' are also one in the tested value.


Thanks,
pq

> +}
> +
>  static irqreturn_t ltdc_irq_thread(int irq, void *arg)
>  {
>  	struct drm_device *ddev =3D arg;
> @@ -431,7 +445,8 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *=
crtc,
>  	pm_runtime_get_sync(ddev->dev);
> =20
>  	/* Sets the background color value */
> -	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
> +	reg_write(ldev->regs, LTDC_BCCR,
> +		  DRM_ARGB_TO_LTDC_RGB24(crtc->state->bgcolor));
> =20
>  	/* Enable IRQ */
>  	reg_set(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
> @@ -452,6 +467,9 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc =
*crtc,
> =20
>  	drm_crtc_vblank_off(crtc);
> =20
> +	/* Reset background color */
> +	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
> +
>  	/* disable IRQ */
>  	reg_clear(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
> =20
> @@ -790,6 +808,7 @@ static void ltdc_plane_atomic_update(struct drm_plane=
 *plane,
>  	u32 y1 =3D newstate->crtc_y + newstate->crtc_h - 1;
>  	u32 src_x, src_y, src_w, src_h;
>  	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
> +	u32 bgcolor =3D DRM_ARGB_TO_LTDC_RGB24(newstate->crtc->state->bgcolor);
>  	enum ltdc_pix_fmt pf;
> =20
>  	if (!newstate->crtc || !fb) {
> @@ -853,10 +872,28 @@ static void ltdc_plane_atomic_update(struct drm_pla=
ne *plane,
>  	if (!fb->format->has_alpha)
>  		val =3D BF1_CA | BF2_1CA;
> =20
> -	/* Manage hw-specific capabilities */
> -	if (ldev->caps.non_alpha_only_l1 &&
> -	    plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> -		val =3D BF1_PAXCA | BF2_1PAXCA;
> +	/*
> +	 * Manage hw-specific capabilities
> +	 *
> +	 * Depending on the hardware version, the background color can not be
> +	 * properly displayed with non-alpha color formats derived from native
> +	 * alpha color formats (such as XR24 or XR15) since the use of this
> +	 * pixel format generates a non transparent layer. As a workaround,
> +	 * the stage background color of the layer and the general background
> +	 * color need to be synced.
> +	 *
> +	 * This is done by activating for all XRGB color format the default
> +	 * color as the background color and then setting blending factor
> +	 * accordingly.
> +	 */
> +	if (ldev->caps.non_alpha_only_l1) {
> +		if (is_xrgb(fb->format->format)) {
> +			val =3D BF1_CA | BF2_1CA;
> +			reg_write(ldev->regs, LTDC_L1DCCR + lofs, bgcolor);
> +		} else {
> +			val =3D BF1_PAXCA | BF2_1PAXCA;
> +		}
> +	}
> =20
>  	reg_update_bits(ldev->regs, LTDC_L1BFCR + lofs,
>  			LXBFCR_BF2 | LXBFCR_BF1, val);
> @@ -1033,6 +1070,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, =
struct drm_crtc *crtc)
> =20
>  	drm_crtc_helper_add(crtc, &ltdc_crtc_helper_funcs);
> =20
> +	drm_crtc_add_bgcolor_property(crtc);
>  	drm_mode_crtc_set_gamma_size(crtc, CLUT_SIZE);
>  	drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE);
> =20


--Sig_/W0kPe8=pA33zQt1ChIiblgo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDn/G4ACgkQI1/ltBGq
qqdSAQ/+O54N12B96VfgTSJt/h50b8vyqH6nlYk53aAjDGv71t3XQRp8Z0Yd/TKn
mDoGkBad4FHRWfaorqc1DqJztkS8bqmbpz8Jg4mUt/1f/JDfRcIKDlfh/RL2dyrw
rNhik+zr6dTPTL7Xs5joQspZ5HvO5yeo1rbSFE0SlpsEJHN+qWnBpobGfiAL4Uue
RkXJrEJyAZEuPGcEq8D27ciGqZIQJmMLP/9GuX0+mELmGPOqKFLZaryBqsahGrVo
kJu/iGDECeG/bTrczBm02rj4TAkJLcef/s4XESL3N0zFvu3w62ev0CJxFJDcHoh5
WXXnuNgZ2uR1HjnCJojHnjyBYrOAY8PlPL/A3duuKZRS4t+O9nNCxd6/6SICV4eS
XmXPmZ68uhUfDNVjyGhHDVGHjfmO3nqzXX2dDxAuKn+lZDwXguza03bX9bJVHdx+
Tj91Addw0b1hPh6T25QIco3SDaQcf6jfTmpMW5pEgJQp/Z50u0Ku2w6rsSRYE8OD
XyTDtLOPamHBgLNbEBJW7d7NJcbmsH/K/ucKXBeXUJo5qo4HijTkALl6dcpqF44Y
uzJeSCwRzBh/DpDYpDyg5o6tmjZo42cLOSKHAvWZTsWRxT4JIOjVf4UHxEESHg4h
Spd7Gp/ks8BeSQ78CkAfsusgn742wkiUE0ExDwyXQCW99mq3UEs=
=ft4v
-----END PGP SIGNATURE-----

--Sig_/W0kPe8=pA33zQt1ChIiblgo--
