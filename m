Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF0177096
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 08:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED69D6E9CC;
	Tue,  3 Mar 2020 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE806E9CA;
 Tue,  3 Mar 2020 07:57:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9931AD85;
 Tue,  3 Mar 2020 07:57:41 +0000 (UTC)
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-51-daniel.vetter@ffwll.ch>
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
Message-ID: <05605194-d03a-ef65-0c98-8353e098cd88@suse.de>
Date: Tue, 3 Mar 2020 08:57:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-51-daniel.vetter@ffwll.ch>
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
 Emil Velikov <emil.l.velikov@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0633614174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0633614174==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qsr3G1qsfmxQn2uiniHQbcFEf5MktlBsh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qsr3G1qsfmxQn2uiniHQbcFEf5MktlBsh
Content-Type: multipart/mixed; boundary="VXFgO8mbkM5qzsiuDeZuv0r3nnNK8mN3q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.l.velikov@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>
Message-ID: <05605194-d03a-ef65-0c98-8353e098cd88@suse.de>
Subject: Re: [PATCH 50/51] drm/udl: drop drm_driver.release hook
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-51-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-51-daniel.vetter@ffwll.ch>

--VXFgO8mbkM5qzsiuDeZuv0r3nnNK8mN3q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> There's only two functions called from that:
> drm_kms_helper_poll_fini() and udl_free_urb_list(). Both of these are
> also called from the ubs_driver->disconnect hook, so entirely
> pointless to do the same again in the ->release hook.
>=20
> Furthermore by the time we clean up the drm_driver we really shouldn't
> be touching hardware anymore, so stopping the poll worker and freeing
> the urb allocations in ->disconnect is the right thing to do.
>=20
> Now disconnect still cleans things up before unregistering the driver,
> but that's a different issue.
>=20
> v2: Use _fini, not _disable in unplug, motivated by discussions with
> Thomas. _disable/_enable are for suspend/resume.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/udl/udl_drv.c  |  8 +-------
>  drivers/gpu/drm/udl/udl_drv.h  |  1 -
>  drivers/gpu/drm/udl/udl_main.c | 10 ----------
>  3 files changed, 1 insertion(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_dr=
v.c
> index b447fb053e78..1ce2d865c36d 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -34,14 +34,8 @@ static int udl_usb_resume(struct usb_interface *inte=
rface)
> =20
>  DEFINE_DRM_GEM_FOPS(udl_driver_fops);
> =20
> -static void udl_driver_release(struct drm_device *dev)
> -{
> -	udl_fini(dev);
> -}
> -
>  static struct drm_driver driver =3D {
>  	.driver_features =3D DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> -	.release =3D udl_driver_release,
> =20
>  	/* gem hooks */
>  	.gem_create_object =3D udl_driver_gem_create_object,
> @@ -120,7 +114,7 @@ static void udl_usb_disconnect(struct usb_interface=
 *interface)
>  {
>  	struct drm_device *dev =3D usb_get_intfdata(interface);
> =20
> -	drm_kms_helper_poll_disable(dev);
> +	drm_kms_helper_poll_fini(dev);
>  	udl_drop_usb(dev);
>  	drm_dev_unplug(dev);
>  	drm_dev_put(dev);
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_dr=
v.h
> index 1de7eb1b6aac..2642f94a63fc 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -76,7 +76,6 @@ int udl_submit_urb(struct drm_device *dev, struct urb=
 *urb, size_t len);
>  void udl_urb_completion(struct urb *urb);
> =20
>  int udl_init(struct udl_device *udl);
> -void udl_fini(struct drm_device *dev);
> =20
>  int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb *=
*urb_ptr,
>  		     const char *front, char **urb_buf_ptr,
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_m=
ain.c
> index 538718919916..f5d27f2a5654 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -351,13 +351,3 @@ int udl_drop_usb(struct drm_device *dev)
>  	udl_free_urb_list(dev);
>  	return 0;
>  }
> -
> -void udl_fini(struct drm_device *dev)
> -{
> -	struct udl_device *udl =3D to_udl(dev);
> -
> -	drm_kms_helper_poll_fini(dev);
> -
> -	if (udl->urbs.count)
> -		udl_free_urb_list(dev);
> -}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VXFgO8mbkM5qzsiuDeZuv0r3nnNK8mN3q--

--qsr3G1qsfmxQn2uiniHQbcFEf5MktlBsh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5eDfQACgkQaA3BHVML
eiOPOQf8CwaNMeScfyt7hdNN40MoqEfjzJR00+ga6l26blzzblGjlQk09+5Mbwrx
Ew2DA164hHYaknJ0kuwuCT80TTMs5M66yUZt0NU7tW0xwH8R3eyGv9NA5iwvGXhL
Pow4HlKNM/nZa8dAwCRYJlIeqPd/H2e3YDaDzpxCLFAaF9vhiB29PEgaDQA82uIs
0qqejDUN/z6xLDDD5C7SJ8nxE+5UufQuGfVw/TfHUIJmhCvXZcpw2Wn3jjhEar6+
ESteeZYUcZJJiXPgtzSzoNC9DwK/4k78CQf9p76xgVE+eC3Mu6Et1f414DEzd1zY
OsNLIQL/N/umJ+yb4z+T3rAoeh5Mag==
=+4ZX
-----END PGP SIGNATURE-----

--qsr3G1qsfmxQn2uiniHQbcFEf5MktlBsh--

--===============0633614174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0633614174==--
