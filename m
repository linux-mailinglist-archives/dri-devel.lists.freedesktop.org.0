Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0D5995FB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 09:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C01B10EA7F;
	Fri, 19 Aug 2022 07:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8910E1FC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 07:29:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DB9A85C0125;
 Fri, 19 Aug 2022 03:29:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 Aug 2022 03:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660894173; x=1660980573; bh=My8sr3xWTA
 Czup96ELiV9JRekYdFH7cwGM6u31VjkYE=; b=itP8Rp+QxGIXqHXbdd/1bezVLM
 y/wf41htSKaS9BwzoEhWgl8+yy99yWE8nb38qaR4rEqdbK7kgnrbQEnfNeTA8SQr
 rK7LzGF36DHW7ExajUTNGulEi+/R/u/JT5kQZOS2F+JJ3bxeAbdshougk5Oe71zc
 ux+/KGPT1OOMKYo37qrwYAUAUfomN7D7EMQaNz7Xtjl2jwfIRnkVF9dqdNXVJwqe
 ux7gN9oPy58VQhEkEqKIQr5sCjK/gcCmq/iB0TypHq2Fi81KnsHYxxQQA2X17jNp
 cgfxhDF8rN/sD7P1zx6co5w5hNhHq0KLsX6CvBkofypamR7XH0X4czlRHjrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660894173; x=1660980573; bh=My8sr3xWTACzup96ELiV9JRekYdF
 H7cwGM6u31VjkYE=; b=O7Z2N+HxRDIdBr5bFSzqVCi5p6PRFpoJkcXh7K0elAXP
 vaouQGos/CWBLQRTyuYmWyDDEqlzKhBTvTp8wSFl5/eklY/XqwZrU9T5+CTBmyzC
 VxspXpQ8qmyrDNSW73KwnVmuowREpc5dxogtue2BBZhclVfVSda0ceGvPDrUxbZc
 0JfH8GjTJJBL4YQXnwNrF0kGRCP79ehx7ADWt0rkJ6hn65o06a1bn5VegpoQpItk
 7nZC4jWa9qUjSqvjkxWPKGsNPqTd7Uk4vhQX6ooD18JpzGNxYIxTa+R/YoTsT2KB
 pcmHgDpDcxky/fFpnVTz1RtrRMr8e9bOpc3B7/cE/Q==
X-ME-Sender: <xms:3Tv_YpOwBmj49VAJiAc8N-a93v3HHFV56byFAhlk9fag3EjFbB4vog>
 <xme:3Tv_Yr9c99aGOP_4RM-d_OGme8p75NJtbXc5DXtzon-0LflAfgoo5-mJorzGfkRGy
 MGIzYtOr5qCRyWUfI8>
X-ME-Received: <xmr:3Tv_YoRvGt5rX4VSo5wjD6VP7hj2vE2ws1hCYt8frQgNwEtJEcZLZ6hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeitddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3Tv_Ylt_Bdw9ALsTh-Jdn6f6IFD9ac7ScwHQGfZ-wL8fYyry9hO71A>
 <xmx:3Tv_YhfA6iyb7RgicVl_3JQgYiCXcJNDjnDYtX1t8c78lueYKjOjKg>
 <xmx:3Tv_Yh0Qo5DS7PWjkTsn6Smw-J3cA5IfUE9xaw51hjF9zBLif9VOgA>
 <xmx:3Tv_Yo4HjRqSjdRxMgK5pBwnbURnNCuQKP3sBbWT8LdmwPdC_xURZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 03:29:33 -0400 (EDT)
Date: Fri, 19 Aug 2022 09:29:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next 3/3] drm/vc4: crtc: protect device
 resources after removal
Message-ID: <20220819072930.fg56dkzbdu6f7s25@houat>
References: <20220819002905.82095-1-dakr@redhat.com>
 <20220819002905.82095-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v6qavohxtl7q5awx"
Content-Disposition: inline
In-Reply-To: <20220819002905.82095-4-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v6qavohxtl7q5awx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 19, 2022 at 02:29:05AM +0200, Danilo Krummrich wrote:
> (Hardware) resources which are bound to the driver and device lifecycle
> must not be accessed after the device and driver are unbound.
>=20
> However, the DRM device isn't freed as long as the last user closed it,
> hence userspace can still call into the driver.
>=20
> Therefore protect the critical sections which are accessing those
> resources with drm_dev_enter() and drm_dev_exit().
>=20
> Fixes: 7cc4214c27cf ("drm/vc4: crtc: Switch to drmm_kzalloc")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 41 +++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crt=
c.c
> index 2def6e2ad6f0..51daf190196e 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -295,10 +296,17 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm=
_crtc *crtc,
>  static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
>  {
>  	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
> +	struct drm_device *dev =3D crtc->dev;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> =20
>  	/* The PV needs to be disabled before it can be flushed */
>  	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
>  	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
> +
> +	drm_dev_exit(idx);
>  }
> =20
>  static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder=
 *encoder,
> @@ -321,6 +329,10 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc=
, struct drm_encoder *encode
>  	u32 format =3D is_dsi1 ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_=
24;
>  	u8 ppc =3D pv_data->pixels_per_clock;
>  	bool debug_dump_regs =3D false;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> =20
>  	if (debug_dump_regs) {
>  		struct drm_printer p =3D drm_info_printer(&vc4_crtc->pdev->dev);
> @@ -410,6 +422,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc,=
 struct drm_encoder *encode
>  			 drm_crtc_index(crtc));
>  		drm_print_regset32(&p, &vc4_crtc->regset);
>  	}
> +
> +	drm_dev_exit(idx);
>  }
> =20
>  static void require_hvs_enabled(struct drm_device *dev)
> @@ -430,13 +444,18 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
>  	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>  	struct drm_device *dev =3D crtc->dev;
>  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> -	int ret;
> +	int idx, ret;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return -ENODEV;
> =20
>  	CRTC_WRITE(PV_V_CONTROL,
>  		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
>  	ret =3D wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
>  	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
> =20
> +	drm_dev_exit(idx);
> +

I think this would be easier to follow if we were protecting the entire
function with our lock.

Having locks taken in the middle of the function is harder to identify
whether or not one particular function is safe or not.

The same applies to the plane patch

Maxime

--v6qavohxtl7q5awx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv872gAKCRDj7w1vZxhR
xS9MAQCa/qo5n5/nskuFs/e0cpI3NV0AjoLytdAPrVVvecr6PwEAuCU6l3kgsan/
a/tIIqMlOAakafUEU6K3H8wEyR1/yAU=
=/eO7
-----END PGP SIGNATURE-----

--v6qavohxtl7q5awx--
