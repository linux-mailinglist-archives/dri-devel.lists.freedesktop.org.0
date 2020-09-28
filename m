Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA227A9D9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 10:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BBD89B7B;
	Mon, 28 Sep 2020 08:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E2F89B7B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:45:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1424B2B2;
 Mon, 28 Sep 2020 08:45:05 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Using the to_hibmc_drm_private to convert
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1601281963-42133-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9bd2d033-38a8-94e2-6cd7-10c390e13d14@suse.de>
Date: Mon, 28 Sep 2020 10:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601281963-42133-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1119135374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1119135374==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wTn6GGTVBKU6IzTTFNi0ZXIHZwK1bBgzl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wTn6GGTVBKU6IzTTFNi0ZXIHZwK1bBgzl
Content-Type: multipart/mixed; boundary="KMLskTlUdxUtDbcFS7YaOnAaaDtMnh38H";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <9bd2d033-38a8-94e2-6cd7-10c390e13d14@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Using the to_hibmc_drm_private to convert
References: <1601281963-42133-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1601281963-42133-1-git-send-email-tiantao6@hisilicon.com>

--KMLskTlUdxUtDbcFS7YaOnAaaDtMnh38H
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.09.20 um 10:32 schrieb Tian Tao:
> Using the to_hibmc_drm_private to convert over all uses of dev_private
> over to the function, and fix a little formatting issue.

Sounds strange to me. Maybe remove "over to the function" and it should
be better.

>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 22 +++++++++++-----=
------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  |  5 ++---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  4 ++--
>  3 files changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 4d57ec6..a98f993 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -105,7 +105,7 @@ static void hibmc_plane_atomic_update(struct drm_pl=
ane *plane,
>  	u32 reg;
>  	s64 gpu_addr =3D 0;
>  	unsigned int line_l;
> -	struct hibmc_drm_private *priv =3D plane->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(plane->dev);
>  	struct drm_gem_vram_object *gbo;
> =20
>  	if (!state->fb)
> @@ -159,7 +159,7 @@ static const struct drm_plane_helper_funcs hibmc_pl=
ane_helper_funcs =3D {
> =20
>  static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
>  {
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
>  	unsigned int reg;
> =20
>  	reg =3D readl(priv->mmio + HIBMC_CRT_DISP_CTL);
> @@ -175,7 +175,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crt=
c *crtc,
>  				     struct drm_crtc_state *old_state)
>  {
>  	unsigned int reg;
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
> =20
>  	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
> =20
> @@ -194,7 +194,7 @@ static void hibmc_crtc_atomic_disable(struct drm_cr=
tc *crtc,
>  				      struct drm_crtc_state *old_state)
>  {
>  	unsigned int reg;
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
> =20
>  	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
>  	drm_crtc_vblank_off(crtc);
> @@ -254,7 +254,7 @@ static unsigned int format_pll_reg(void)
>  static void set_vclock_hisilicon(struct drm_device *dev, unsigned long=
 pll)
>  {
>  	u32 val;
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> =20
>  	val =3D readl(priv->mmio + CRT_PLL1_HS);
>  	val &=3D ~(CRT_PLL1_HS_OUTER_BYPASS(1));
> @@ -315,7 +315,7 @@ static unsigned int display_ctrl_adjust(struct drm_=
device *dev,
>  	unsigned long x, y;
>  	u32 pll1; /* bit[31:0] of PLL */
>  	u32 pll2; /* bit[63:32] of PLL */
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> =20
>  	x =3D mode->hdisplay;
>  	y =3D mode->vdisplay;
> @@ -363,7 +363,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
>  	unsigned int val;
>  	struct drm_display_mode *mode =3D &crtc->state->mode;
>  	struct drm_device *dev =3D crtc->dev;
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>  	int width =3D mode->hsync_end - mode->hsync_start;
>  	int height =3D mode->vsync_end - mode->vsync_start;
> =20
> @@ -397,7 +397,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc=
 *crtc,
>  {
>  	unsigned int reg;
>  	struct drm_device *dev =3D crtc->dev;
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> =20
>  	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_MODE0);
> =20
> @@ -427,7 +427,7 @@ static void hibmc_crtc_atomic_flush(struct drm_crtc=
 *crtc,
> =20
>  static int hibmc_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
> =20
>  	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(1),
>  	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
> @@ -437,7 +437,7 @@ static int hibmc_crtc_enable_vblank(struct drm_crtc=
 *crtc)
> =20
>  static void hibmc_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
> =20
>  	writel(HIBMC_RAW_INTERRUPT_EN_VBLANK(0),
>  	       priv->mmio + HIBMC_RAW_INTERRUPT_EN);
> @@ -445,7 +445,7 @@ static void hibmc_crtc_disable_vblank(struct drm_cr=
tc *crtc)
> =20
>  static void hibmc_crtc_load_lut(struct drm_crtc *crtc)
>  {
> -	struct hibmc_drm_private *priv =3D crtc->dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(crtc->dev);
>  	void __iomem   *mmio =3D priv->mmio;
>  	u16 *r, *g, *b;
>  	unsigned int reg;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 085d1b2..5632bce 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -29,8 +29,7 @@ DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  static irqreturn_t hibmc_drm_interrupt(int irq, void *arg)
>  {
>  	struct drm_device *dev =3D (struct drm_device *)arg;
> -	struct hibmc_drm_private *priv =3D
> -		(struct hibmc_drm_private *)dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>  	u32 status;
> =20
>  	status =3D readl(priv->mmio + HIBMC_RAW_INTERRUPT);
> @@ -244,7 +243,7 @@ static int hibmc_hw_init(struct hibmc_drm_private *=
priv)
> =20
>  static int hibmc_unload(struct drm_device *dev)
>  {
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> =20
>  	drm_atomic_helper_shutdown(dev);
> =20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index c6999ed..74e26c2 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -43,7 +43,7 @@ static int hibmc_connector_get_modes(struct drm_conne=
ctor *connector)
>  }
> =20
>  static enum drm_mode_status hibmc_connector_mode_valid(struct drm_conn=
ector *connector,
> -				      struct drm_display_mode *mode)
> +						       struct drm_display_mode *mode)
>  {
>  	return MODE_OK;
>  }
> @@ -76,7 +76,7 @@ static void hibmc_encoder_mode_set(struct drm_encoder=
 *encoder,
>  {
>  	u32 reg;
>  	struct drm_device *dev =3D encoder->dev;
> -	struct hibmc_drm_private *priv =3D dev->dev_private;
> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
> =20
>  	reg =3D readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
>  	reg |=3D HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KMLskTlUdxUtDbcFS7YaOnAaaDtMnh38H--

--wTn6GGTVBKU6IzTTFNi0ZXIHZwK1bBgzl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xopAUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMD8wgAnDprcrIDTUNQCBybfkiwEUcAbtpv
PnbY39fS0Tx5wj60nnaobi6SCvp8Yjbo6HO3zRnpA8xn5ecvRt/BGnwhcL3TYmBj
950utMNAuUPlBUeDiHDEARdBXXVHqwxaMbBZkXBmdMV+ngZOD6symGRkEhiHF+tD
2iPQQcae8bDDFy1OkJblPUtiEkFoYjAWrr/7phQp34g3dMnx2xxPzvPQ/ge7oec2
mUpdxGg7nDUer3+hNVXpUYlgZYNU2reqDKo+DSISJWlsFqsrCGX1aO8EXNWo64Oh
ocHtsK1oF73gE9kDEDbEsA6yE5+et/uRLUdH5kNy/3GeDiZZuUy6UHxzvA==
=i5WF
-----END PGP SIGNATURE-----

--wTn6GGTVBKU6IzTTFNi0ZXIHZwK1bBgzl--

--===============1119135374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1119135374==--
