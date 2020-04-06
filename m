Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C061519F531
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947289D02;
	Mon,  6 Apr 2020 11:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF189CDF;
 Mon,  6 Apr 2020 11:52:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9CB42AED7;
 Mon,  6 Apr 2020 11:52:56 +0000 (UTC)
Subject: Re: [PATCH 16/44] drm/udl: don't set drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <57dbbdb5-eb41-2060-1706-29cadd949df9@suse.de>
Date: Mon, 6 Apr 2020 13:52:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1520581515=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1520581515==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PIUrEAvUeT8U9x42BSjiHbucVCQnFhRQn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PIUrEAvUeT8U9x42BSjiHbucVCQnFhRQn
Content-Type: multipart/mixed; boundary="eUSyNw7hjW9m4JEeB5KgczuJvsZ6PHde5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <57dbbdb5-eb41-2060-1706-29cadd949df9@suse.de>
Subject: Re: [PATCH 16/44] drm/udl: don't set drm_device->dev_private
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-17-daniel.vetter@ffwll.ch>

--eUSyNw7hjW9m4JEeB5KgczuJvsZ6PHde5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.04.20 um 15:58 schrieb Daniel Vetter:
> We're mostly there already, just a handful of places that didn't use
> the to_udl container_of cast. To make sure no new appear, don't set
> ->dev_private.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Alexios Zavras <alexios.zavras@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Jos=C3=A9 Roberto de Souza" <jose.souza@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Allison Randal <allison@lohutok.net>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 4 ++--
>  drivers/gpu/drm/udl/udl_drv.c       | 1 -
>  drivers/gpu/drm/udl/udl_modeset.c   | 6 +++---
>  3 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/=
udl_connector.c
> index 0afdfb0d1fe1..cdc1c42e1669 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -59,7 +59,7 @@ static int udl_get_modes(struct drm_connector *connec=
tor)
>  static enum drm_mode_status udl_mode_valid(struct drm_connector *conne=
ctor,
>  			  struct drm_display_mode *mode)
>  {
> -	struct udl_device *udl =3D connector->dev->dev_private;
> +	struct udl_device *udl =3D to_udl(connector->dev);
>  	if (!udl->sku_pixel_limit)
>  		return 0;
> =20
> @@ -72,7 +72,7 @@ static enum drm_mode_status udl_mode_valid(struct drm=
_connector *connector,
>  static enum drm_connector_status
>  udl_detect(struct drm_connector *connector, bool force)
>  {
> -	struct udl_device *udl =3D connector->dev->dev_private;
> +	struct udl_device *udl =3D to_udl(connector->dev);
>  	struct udl_drm_connector *udl_connector =3D
>  					container_of(connector,
>  					struct udl_drm_connector,
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_dr=
v.c
> index 4ba5149fdd57..126545428895 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -63,7 +63,6 @@ static struct udl_device *udl_driver_create(struct us=
b_interface *interface)
>  		return udl;
> =20
>  	udl->udev =3D udev;
> -	udl->drm.dev_private =3D udl;
> =20
>  	r =3D udl_init(udl);
>  	if (r)
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/ud=
l_modeset.c
> index 8cad01f3d163..99518a826435 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -215,7 +215,7 @@ static char *udl_dummy_render(char *wrptr)
>  static int udl_crtc_write_mode_to_hw(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev =3D crtc->dev;
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct urb *urb;
>  	char *buf;
>  	int retval;
> @@ -369,7 +369,7 @@ udl_simple_display_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
>  	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_device *dev =3D crtc->dev;
>  	struct drm_framebuffer *fb =3D plane_state->fb;
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct drm_display_mode *mode =3D &crtc_state->mode;
>  	char *buf;
>  	char *wrptr;
> @@ -464,7 +464,7 @@ static const struct drm_mode_config_funcs udl_mode_=
funcs =3D {
>  int udl_modeset_init(struct drm_device *dev)
>  {
>  	size_t format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct drm_connector *connector;
>  	int ret;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eUSyNw7hjW9m4JEeB5KgczuJvsZ6PHde5--

--PIUrEAvUeT8U9x42BSjiHbucVCQnFhRQn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6LGBQACgkQaA3BHVML
eiOgJQf/SzYf5DPj0YWPdiTaJtEdtjYhRDh/Ln66zRn0rAusZ4hDhAQOfjIE7ctG
47zHWf1Smq1U14PnI+mgHilu1w23nFieJGCSh24gvFWR0dsawZIixcECf7uDORmA
mKU6cyFYJ3sdu8d/ep+8BivoAb/ESgJOunQqvyAJQfhq2LJIb5EbxD+Y8mOUnLa2
jIB54wYRBt+dIBxzCR68ZwfKeDr5km3Xzq06E+QPCKNHot1x22jI7sIpLfEf+UKD
CWpFUcgfu5KrtydCo/W/PKHbhI34OkKZAiby39vDuIWzaonXsP45e1LGG+eQK+jh
gvm+ZVxexLZk4ZJXjhHivMFEmfJDdw==
=ruN4
-----END PGP SIGNATURE-----

--PIUrEAvUeT8U9x42BSjiHbucVCQnFhRQn--

--===============1520581515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1520581515==--
