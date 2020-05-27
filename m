Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE21E4124
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 14:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37726E02F;
	Wed, 27 May 2020 12:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187C89C99;
 Wed, 27 May 2020 12:02:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE0ECAB7D;
 Wed, 27 May 2020 12:02:19 +0000 (UTC)
Subject: Re: [PATCH] drm: use drm_dev_has_vblank more
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
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
Message-ID: <62d8b46c-0d77-5f37-2894-aea0d3b76ae1@suse.de>
Date: Wed, 27 May 2020 14:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1134563253=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1134563253==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6mhTBGeYyXSy67AO6IKuDSmN249JAlRLP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6mhTBGeYyXSy67AO6IKuDSmN249JAlRLP
Content-Type: multipart/mixed; boundary="jSO4cNaxgaHEL6iWlwjEGPNXyuN9nwyHG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <62d8b46c-0d77-5f37-2894-aea0d3b76ae1@suse.de>
Subject: Re: [PATCH] drm: use drm_dev_has_vblank more
References: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>

--jSO4cNaxgaHEL6iWlwjEGPNXyuN9nwyHG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 27.05.20 um 13:11 schrieb Daniel Vetter:
> For historical reasons it's called dev->num_crtcs, which is rather
> confusing ever since kms was added. But now we have a nice helper, so
> let's use it for better readability!
>=20
> Only code change is in atomic helpers: vblank support means that
> dev->irq_enabled must be set too. Another one of these quirky things
> ... But since it's implied we can simplify that check.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  2 +-
>  drivers/gpu/drm/drm_irq.c           |  2 +-
>  drivers/gpu/drm/drm_vblank.c        | 14 +++++++-------
>  3 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index 0a541368246e..bfcc7857a9a1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1097,7 +1097,7 @@ disable_outputs(struct drm_device *dev, struct dr=
m_atomic_state *old_state)
>  		else if (funcs->dpms)
>  			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
> =20
> -		if (!(dev->irq_enabled && dev->num_crtcs))
> +		if (!drm_dev_has_vblank(dev))
>  			continue;
> =20
>  		ret =3D drm_crtc_vblank_get(crtc);
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 588be45abd7a..09d6e9e2e075 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -181,7 +181,7 @@ int drm_irq_uninstall(struct drm_device *dev)
>  	 * vblank/irq handling. KMS drivers must ensure that vblanks are all
>  	 * disabled when uninstalling the irq handler.
>  	 */
> -	if (dev->num_crtcs) {
> +	if (drm_dev_has_vblank(dev)) {
>  		spin_lock_irqsave(&dev->vbl_lock, irqflags);
>  		for (i =3D 0; i < dev->num_crtcs; i++) {
>  			struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index e278d6407f8e..162d9f7e692a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -605,7 +605,7 @@ void drm_calc_timestamping_constants(struct drm_crt=
c *crtc,
>  	int linedur_ns =3D 0, framedur_ns =3D 0;
>  	int dotclock =3D mode->crtc_clock;
> =20
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> @@ -1065,7 +1065,7 @@ void drm_crtc_send_vblank_event(struct drm_crtc *=
crtc,
>  	unsigned int pipe =3D drm_crtc_index(crtc);
>  	ktime_t now;
> =20
> -	if (dev->num_crtcs > 0) {
> +	if (drm_dev_has_vblank(dev)) {
>  		seq =3D drm_vblank_count_and_time(dev, pipe, &now);
>  	} else {
>  		seq =3D 0;
> @@ -1137,7 +1137,7 @@ static int drm_vblank_get(struct drm_device *dev,=
 unsigned int pipe)
>  	unsigned long irqflags;
>  	int ret =3D 0;
> =20
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EINVAL;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> @@ -1506,7 +1506,7 @@ static void drm_legacy_vblank_pre_modeset(struct =
drm_device *dev,
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> =20
>  	/* vblank is not initialized (IRQ not installed ?), or has been freed=
 */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> @@ -1533,7 +1533,7 @@ static void drm_legacy_vblank_post_modeset(struct=
 drm_device *dev,
>  	unsigned long irqflags;
> =20
>  	/* vblank is not initialized (IRQ not installed ?), or has been freed=
 */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
> @@ -1558,7 +1558,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_devic=
e *dev, void *data,
>  	unsigned int pipe;
> =20
>  	/* If drm_vblank_init() hasn't been called yet, just no-op */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return 0;
> =20
>  	/* KMS drivers handle this internally */
> @@ -1896,7 +1896,7 @@ bool drm_handle_vblank(struct drm_device *dev, un=
signed int pipe)
>  	unsigned long irqflags;
>  	bool disable_irq, fence_cookie;
> =20
> -	if (WARN_ON_ONCE(!dev->num_crtcs))
> +	if (WARN_ON_ONCE(!drm_dev_has_vblank(dev)))
>  		return false;
> =20
>  	if (WARN_ON(pipe >=3D dev->num_crtcs))
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jSO4cNaxgaHEL6iWlwjEGPNXyuN9nwyHG--

--6mhTBGeYyXSy67AO6IKuDSmN249JAlRLP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7OVsQACgkQaA3BHVML
eiOBiQf/QqJyXcbxjfSu6gk7fseLmWHi/rNkGCZeaMBTVr2+lkmBzHo2V1iSq2ht
UlQj1Qj63rpaM8m/Y4ai7tGGOGjvGZpjH+/PgIHY0TL7nDiQZgEbPJKAC0q9Dt5J
WOOBh8qvyRsAvQXP5uCt+lIdWXMhyQg17hULWYbBIIqcU5ih9cYbJPw3BMlmr+bP
pCvYQ8jZytInsCpQ/4CvodEYao1e1YZINFuhnQ+6rc6LarrUdVeAfeKAaXBYTck9
1VZIrfeREAnF8XfuXYLFqhg8YjPbQe007KIpPv21RLFicTuztg3mRYE8woc6Hk9d
PtIgee/I+t5SsiaXaMvAJu8eDstafQ==
=s6XA
-----END PGP SIGNATURE-----

--6mhTBGeYyXSy67AO6IKuDSmN249JAlRLP--

--===============1134563253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1134563253==--
