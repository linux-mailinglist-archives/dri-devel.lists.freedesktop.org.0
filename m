Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7519FD10
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 20:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120D06E484;
	Mon,  6 Apr 2020 18:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6EE6E480;
 Mon,  6 Apr 2020 18:24:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4DB7BC39;
 Mon,  6 Apr 2020 18:24:09 +0000 (UTC)
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
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
Message-ID: <a7bb7d54-2c71-b087-8347-888a5019aacc@suse.de>
Date: Mon, 6 Apr 2020 13:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0640062089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0640062089==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dD9lAIfGQLeukxuvp6esfQcqRLXqsbd6O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dD9lAIfGQLeukxuvp6esfQcqRLXqsbd6O
Content-Type: multipart/mixed; boundary="p7Xmz135DVUfuKl4aSOJzeqQjGKxCkWvv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann
 <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <a7bb7d54-2c71-b087-8347-888a5019aacc@suse.de>
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>

--p7Xmz135DVUfuKl4aSOJzeqQjGKxCkWvv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.04.20 um 15:58 schrieb Daniel Vetter:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/c=
irrus.c
> index 4b65637147ba..744a8e337e41 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -59,6 +59,8 @@ struct cirrus_device {
>  	void __iomem		       *mmio;
>  };
> =20
> +#define to_cirrus(_dev) container_of(_dev, struct cirrus_device, dev)
> +

Maybe to_cirrus_device() ? I had the same comment for vbox and I think
it applies to all patches.

Best regards
Thomas

>  /* ------------------------------------------------------------------ =
*/
>  /*
>   * The meat of this driver. The core passes us a mode and we have to p=
rogram
> @@ -311,7 +313,7 @@ static int cirrus_mode_set(struct cirrus_device *ci=
rrus,
>  static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  			       struct drm_rect *rect)
>  {
> -	struct cirrus_device *cirrus =3D fb->dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(fb->dev);
>  	void *vmap;
>  	int idx, ret;
> =20
> @@ -436,7 +438,7 @@ static void cirrus_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
>  			       struct drm_crtc_state *crtc_state,
>  			       struct drm_plane_state *plane_state)
>  {
> -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
> =20
>  	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
>  	cirrus_fb_blit_fullscreen(plane_state->fb);
> @@ -445,7 +447,7 @@ static void cirrus_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
>  static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
>  			       struct drm_plane_state *old_state)
>  {
> -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
>  	struct drm_plane_state *state =3D pipe->plane.state;
>  	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_rect rect;
> @@ -573,7 +575,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  		return PTR_ERR(cirrus);
> =20
>  	dev =3D &cirrus->dev;
> -	dev->dev_private =3D cirrus;
> =20
>  	cirrus->vram =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0)=
,
>  				    pci_resource_len(pdev, 0));
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--p7Xmz135DVUfuKl4aSOJzeqQjGKxCkWvv--

--dD9lAIfGQLeukxuvp6esfQcqRLXqsbd6O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6LGX4ACgkQaA3BHVML
eiO7Xwf/RXZYBWOH9u7qutpw+M6TiyzhA0dsQU23i/2TA0BaluPl8zMzZFE7VC5c
p9V9PyLkNptBgMVrQrm4FMTz/e+ndZYipHRX2OoFjoCXzuWC21ovliQ+0YKg7DXP
W27P4t/q0dgCHAl/7DxWB/R/fcCMEwnYDYg34epY7Evz52MMRsysVAgGhbQU/wK8
HRdX1NfZw3dIIH9B7Qn+dPZSGeXhuBGq8+fkJ3BqNccctOy7JCJVVfNUwHmD4+WF
uNwDAWarsUjxdtOWzihAqcJDQnNbmrTI2m8UtFyoVetcC9S8saYUcwmHeRptOCCA
2opfja1lF05o3eVbMAbzxmoT7FRI0A==
=Exn2
-----END PGP SIGNATURE-----

--dD9lAIfGQLeukxuvp6esfQcqRLXqsbd6O--

--===============0640062089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0640062089==--
