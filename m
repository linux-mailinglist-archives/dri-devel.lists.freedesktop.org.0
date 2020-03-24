Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562F190860
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1389189338;
	Tue, 24 Mar 2020 08:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DAB89338;
 Tue, 24 Mar 2020 08:56:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73BB0ACD0;
 Tue, 24 Mar 2020 08:56:23 +0000 (UTC)
Subject: Re: [PATCH 49/51] drm/udl: Drop explicit drm_mode_config_cleanup call
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-50-daniel.vetter@ffwll.ch>
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
Message-ID: <399e5441-0580-096c-8196-c12596c11670@suse.de>
Date: Tue, 24 Mar 2020 09:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323144950.3018436-50-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0527083777=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0527083777==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wqWPhPfrpdhiSCsyVyl3XFQRTFeST4PLl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wqWPhPfrpdhiSCsyVyl3XFQRTFeST4PLl
Content-Type: multipart/mixed; boundary="wEurBYROCiE6luDxo9eeAV126KBx1ELpX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <399e5441-0580-096c-8196-c12596c11670@suse.de>
Subject: Re: [PATCH 49/51] drm/udl: Drop explicit drm_mode_config_cleanup call
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-50-daniel.vetter@ffwll.ch>
In-Reply-To: <20200323144950.3018436-50-daniel.vetter@ffwll.ch>

--wEurBYROCiE6luDxo9eeAV126KBx1ELpX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 23.03.20 um 15:49 schrieb Daniel Vetter:
> It's right above the drm_dev_put().
>=20
> This allows us to delete a bit of onion unwinding in
> udl_modeset_init().
>=20
> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
>=20
> v2: Explain why this cleanup is possible (Laurent).
>=20
> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
>=20
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/udl/udl_drv.c     |  1 -
>  drivers/gpu/drm/udl/udl_drv.h     |  1 -
>  drivers/gpu/drm/udl/udl_modeset.c | 21 ++++++---------------
>  3 files changed, 6 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_dr=
v.c
> index 8b78c356beb5..b447fb053e78 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -37,7 +37,6 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>  static void udl_driver_release(struct drm_device *dev)
>  {
>  	udl_fini(dev);
> -	udl_modeset_cleanup(dev);
>  }
> =20
>  static struct drm_driver driver =3D {
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_dr=
v.h
> index e67227c44cc4..1de7eb1b6aac 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -68,7 +68,6 @@ struct udl_device {
> =20
>  /* modeset */
>  int udl_modeset_init(struct drm_device *dev);
> -void udl_modeset_cleanup(struct drm_device *dev);
>  struct drm_connector *udl_connector_init(struct drm_device *dev);
> =20
>  struct urb *udl_get_urb(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/ud=
l_modeset.c
> index d59ebac70b15..8cad01f3d163 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -468,7 +468,9 @@ int udl_modeset_init(struct drm_device *dev)
>  	struct drm_connector *connector;
>  	int ret;
> =20
> -	drm_mode_config_init(dev);
> +	ret =3D drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> =20
>  	dev->mode_config.min_width =3D 640;
>  	dev->mode_config.min_height =3D 480;
> @@ -482,10 +484,8 @@ int udl_modeset_init(struct drm_device *dev)
>  	dev->mode_config.funcs =3D &udl_mode_funcs;
> =20
>  	connector =3D udl_connector_init(dev);
> -	if (IS_ERR(connector)) {
> -		ret =3D PTR_ERR(connector);
> -		goto err_drm_mode_config_cleanup;
> -	}
> +	if (IS_ERR(connector))
> +		return PTR_ERR(connector);
> =20
>  	format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
> =20
> @@ -494,18 +494,9 @@ int udl_modeset_init(struct drm_device *dev)
>  					   udl_simple_display_pipe_formats,
>  					   format_count, NULL, connector);
>  	if (ret)
> -		goto err_drm_mode_config_cleanup;
> +		return ret;
> =20
>  	drm_mode_config_reset(dev);
> =20
>  	return 0;
> -
> -err_drm_mode_config_cleanup:
> -	drm_mode_config_cleanup(dev);
> -	return ret;
> -}
> -
> -void udl_modeset_cleanup(struct drm_device *dev)
> -{
> -	drm_mode_config_cleanup(dev);
>  }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--wEurBYROCiE6luDxo9eeAV126KBx1ELpX--

--wqWPhPfrpdhiSCsyVyl3XFQRTFeST4PLl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl55yzYACgkQaA3BHVML
eiMyHAgAi09OMAPbti5Iz7GLzPzp3DcO7+7dqkFjfSKpk245dI86TfBG52XkrjJf
sh1sS1+vIiDkB6WiqY51op/xG+5nwNR7qXu+2qxKy7eEA1sKAiTE8zDSmwapQy0s
8XzOlZtrSQ1i6PMAwaVt2CIxwPGKhOyBptBOEE9LAYFF/+lyXGz3wWt1ALMUUamE
77o9tev5ZmRTeQHCpMkeydw4xxIFKxAtfQtBY3RtSFLDyezYqiHjsDOFRWHWvdQP
lMlR2pl5RndrnZ1M5G4eBE//9LILLDg4mc+MewcCLokwWWfbqeN35YTRPN5xB2yr
lOZKpBezJimg31pSHaG04jjoxgRw3w==
=KdYC
-----END PGP SIGNATURE-----

--wqWPhPfrpdhiSCsyVyl3XFQRTFeST4PLl--

--===============0527083777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0527083777==--
