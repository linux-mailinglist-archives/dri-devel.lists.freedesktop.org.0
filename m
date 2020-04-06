Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53D19FB72
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D7B6E453;
	Mon,  6 Apr 2020 17:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92F6E451;
 Mon,  6 Apr 2020 17:27:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A64FBC00;
 Mon,  6 Apr 2020 17:27:18 +0000 (UTC)
Subject: Re: [PATCH 08/44] drm/vboxvideo: Stop using drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
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
Message-ID: <0e60d88e-0429-049a-b4b2-5e3b6b660bbc@suse.de>
Date: Mon, 6 Apr 2020 13:56:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0829322106=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0829322106==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F0eECPKtYE8C8Br72jv3NVpzYyggwV8Aq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F0eECPKtYE8C8Br72jv3NVpzYyggwV8Aq
Content-Type: multipart/mixed; boundary="RpfeFLQTMsrJHnnvI8kqnjORrqmVDxiEw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <0e60d88e-0429-049a-b4b2-5e3b6b660bbc@suse.de>
Subject: Re: [PATCH 08/44] drm/vboxvideo: Stop using drm_device->dev_private
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-9-daniel.vetter@ffwll.ch>

--RpfeFLQTMsrJHnnvI8kqnjORrqmVDxiEw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.04.20 um 15:57 schrieb Daniel Vetter:
> We use the baseclass pattern here, so lets to the proper (and more
> typesafe) upcasting.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c  |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 +
>  drivers/gpu/drm/vboxvideo/vbox_irq.c  |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++++-----
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vbo=
xvideo/vbox_drv.c
> index be0600b22cf5..d34cddd809fd 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -52,7 +52,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>  		return PTR_ERR(vbox);
> =20
>  	vbox->ddev.pdev =3D pdev;
> -	vbox->ddev.dev_private =3D vbox;
>  	pci_set_drvdata(pdev, vbox);
>  	mutex_init(&vbox->hw_mutex);
> =20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vbo=
xvideo/vbox_drv.h
> index 87421903816c..ac7c2effc46f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
> @@ -127,6 +127,7 @@ struct vbox_encoder {
>  #define to_vbox_crtc(x) container_of(x, struct vbox_crtc, base)
>  #define to_vbox_connector(x) container_of(x, struct vbox_connector, ba=
se)
>  #define to_vbox_encoder(x) container_of(x, struct vbox_encoder, base)
> +#define to_vbox_dev(x) container_of(x, struct vbox_private, ddev)

I suggest ot call this macro to to_vbox_device(). At some point, we
should rename struct vbox_private to struct vbox_device for consistency
among drivers. The new macro's name would then fit.

For the overall patch:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> =20
>  bool vbox_check_supported(u16 id);
>  int vbox_hw_init(struct vbox_private *vbox);
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vbo=
xvideo/vbox_irq.c
> index 16a1e29f5292..631657fa554f 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
> @@ -34,7 +34,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)
>  irqreturn_t vbox_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *dev =3D (struct drm_device *)arg;
> -	struct vbox_private *vbox =3D (struct vbox_private *)dev->dev_private=
;
> +	struct vbox_private *vbox =3D to_vbox_dev(dev);
>  	u32 host_flags =3D vbox_get_flags(vbox);
> =20
>  	if (!(host_flags & HGSMIHOSTFLAGS_IRQ))
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vb=
oxvideo/vbox_mode.c
> index 0883a435e62b..d9a5af62af89 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -36,7 +36,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>  	u16 flags;
>  	s32 x_offset, y_offset;
> =20
> -	vbox =3D crtc->dev->dev_private;
> +	vbox =3D to_vbox_dev(crtc->dev);
>  	width =3D vbox_crtc->width ? vbox_crtc->width : 640;
>  	height =3D vbox_crtc->height ? vbox_crtc->height : 480;
>  	bpp =3D fb ? fb->format->cpp[0] * 8 : 32;
> @@ -77,7 +77,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>  static int vbox_set_view(struct drm_crtc *crtc)
>  {
>  	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(crtc);
> -	struct vbox_private *vbox =3D crtc->dev->dev_private;
> +	struct vbox_private *vbox =3D to_vbox_dev(crtc->dev);
>  	struct vbva_infoview *p;
> =20
>  	/*
> @@ -174,7 +174,7 @@ static void vbox_crtc_set_base_and_mode(struct drm_=
crtc *crtc,
>  					int x, int y)
>  {
>  	struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> -	struct vbox_private *vbox =3D crtc->dev->dev_private;
> +	struct vbox_private *vbox =3D to_vbox_dev(crtc->dev);
>  	struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(crtc);
>  	bool needs_modeset =3D drm_atomic_crtc_needs_modeset(crtc->state);
> =20
> @@ -272,7 +272,7 @@ static void vbox_primary_atomic_update(struct drm_p=
lane *plane,
>  {
>  	struct drm_crtc *crtc =3D plane->state->crtc;
>  	struct drm_framebuffer *fb =3D plane->state->fb;
> -	struct vbox_private *vbox =3D fb->dev->dev_private;
> +	struct vbox_private *vbox =3D to_vbox_dev(fb->dev);
>  	struct drm_mode_rect *clips;
>  	uint32_t num_clips, i;
> =20
> @@ -704,7 +704,7 @@ static int vbox_get_modes(struct drm_connector *con=
nector)
>  	int preferred_width, preferred_height;
> =20
>  	vbox_connector =3D to_vbox_connector(connector);
> -	vbox =3D connector->dev->dev_private;
> +	vbox =3D to_vbox_dev(connector->dev);
> =20
>  	hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET(vbox)=
 +
>  				    HOST_FLAGS_OFFSET);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RpfeFLQTMsrJHnnvI8kqnjORrqmVDxiEw--

--F0eECPKtYE8C8Br72jv3NVpzYyggwV8Aq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6LGOEACgkQaA3BHVML
eiPV7Qf+JnBflSPVC5w0k/kvYUoJYH39Zn3kOoSfojRd/fcC0BKWLXLTxCMnFqgj
gdduaO0RLq9UuUHC+KruY7nLaB5Z238U+c3MvGfvKyEnpAaliEZJJC9XJB1SEyJx
WwlYyqbwqfNGPpI0L/VxKiCVldM5f3Dpr/J5ItkivtNQTMWc9xctZ90XCzuku8bm
Zbr3AKNGB6axMGbYgfksm3r0Rfk8r0xQKPAOiysDxnHPyp+5ZCUgHXq2dz5p3mgV
YfhBnRs4c+vK0lr4yFduIsya6ojaLieCIFrHs7yTppxz4o/udyDyv7X/FO0wtsJ1
GBhhin6ftKFiDkF67TtTPUfELM4rbA==
=ht6C
-----END PGP SIGNATURE-----

--F0eECPKtYE8C8Br72jv3NVpzYyggwV8Aq--

--===============0829322106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0829322106==--
