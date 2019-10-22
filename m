Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C71E0AB9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 19:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1176E8B0;
	Tue, 22 Oct 2019 17:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119026E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:33:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61B55B2C1;
 Tue, 22 Oct 2019 17:33:27 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/todo: Add levels
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
 <20191022152530.22038-2-daniel.vetter@ffwll.ch>
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
Message-ID: <31a3812e-17fa-221c-4237-99d58a7ddbb3@suse.de>
Date: Tue, 22 Oct 2019 19:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022152530.22038-2-daniel.vetter@ffwll.ch>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: multipart/mixed; boundary="===============1265411306=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1265411306==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aCPXvWHBFYctYVHnNWYTKImofZf5OnWjk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aCPXvWHBFYctYVHnNWYTKImofZf5OnWjk
Content-Type: multipart/mixed; boundary="b5mpHOQBhtviDHCdX6xYKzgjvEsnOfNgz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Manasi Navare <manasi.d.navare@intel.com>, Sean Paul <sean@poorly.run>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <31a3812e-17fa-221c-4237-99d58a7ddbb3@suse.de>
Subject: Re: [PATCH 2/2] drm/todo: Add levels
References: <20191022152530.22038-1-daniel.vetter@ffwll.ch>
 <20191022152530.22038-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20191022152530.22038-2-daniel.vetter@ffwll.ch>

--b5mpHOQBhtviDHCdX6xYKzgjvEsnOfNgz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.10.19 um 17:25 schrieb Daniel Vetter:
> Should help new people pick suitable tasks.
>=20
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 73 ++++++++++++++++++++++++++++++++++++++=

>  1 file changed, 73 insertions(+)
>=20
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 9ac102922712..73c51b5a0997 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -7,6 +7,22 @@ TODO list
>  This section contains a list of smaller janitorial tasks in the kernel=
 DRM
>  graphics subsystem useful as newbie projects. Or for slow rainy days.
> =20
> +Difficulty
> +----------
> +
> +To make it easier task are categorized into different levels:
> +
> +Starter: Good tasks to get started with the DRM subsystem.
> +
> +Intermediate: Tasks which need some experience with working in the DRM=

> +subsystem, or some specific GPU/display graphics knowledge. For debugg=
ing issue
> +it's good to have the relevant hardware (or a virtual driver set up) a=
vailable
> +for testing.
> +
> +Advanced: Tricky tasks that need fairly good understanding of the DRM =
subsystem
> +and graphics topics. Generally need the relevant hardware for developm=
ent and
> +testing.

I like this idea.

  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

But please see my comment further below.

> +
>  Subsystem-wide refactorings
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =20
> @@ -20,6 +36,8 @@ implementations), and then remove it.
> =20
>  Contact: Daniel Vetter, respective driver maintainers
> =20
> +Level: Intermediate
> +
>  Convert existing KMS drivers to atomic modesetting
>  --------------------------------------------------
> =20
> @@ -38,6 +56,8 @@ do by directly using the new atomic helper driver cal=
lbacks.
> =20
>  Contact: Daniel Vetter, respective driver maintainers
> =20
> +Level: Advanced
> +
>  Clean up the clipped coordination confusion around planes
>  ---------------------------------------------------------
> =20
> @@ -50,6 +70,8 @@ helpers.
> =20
>  Contact: Ville Syrj=C3=A4l=C3=A4, Daniel Vetter, driver maintainers
> =20
> +Level: Advanced
> +
>  Convert early atomic drivers to async commit helpers
>  ----------------------------------------------------
> =20
> @@ -63,6 +85,8 @@ events for atomic commits correctly. But fixing these=
 bugs is good anyway.
> =20
>  Contact: Daniel Vetter, respective driver maintainers
> =20
> +Level: Advanced
> +
>  Fallout from atomic KMS
>  -----------------------
> =20
> @@ -91,6 +115,8 @@ interfaces to fix these issues:
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Intermediate
> +
>  Get rid of dev->struct_mutex from GEM drivers
>  ---------------------------------------------
> =20
> @@ -114,6 +140,8 @@ fine-grained per-buffer object and per-context lock=
ings scheme. Currently only t
> =20
>  Contact: Daniel Vetter, respective driver maintainers
> =20
> +Level: Advanced
> +
>  Convert instances of dev_info/dev_err/dev_warn to their DRM_DEV_* equi=
valent
>  ----------------------------------------------------------------------=
------
> =20
> @@ -129,6 +157,8 @@ are better.
> =20
>  Contact: Sean Paul, Maintainer of the driver you plan to convert
> =20
> +Level: Starter
> +
>  Convert drivers to use simple modeset suspend/resume
>  ----------------------------------------------------
> =20
> @@ -139,6 +169,8 @@ of the atomic suspend/resume code in older atomic m=
odeset drivers.
> =20
>  Contact: Maintainer of the driver you plan to convert
> =20
> +Level: Intermediate
> +
>  Convert drivers to use drm_fb_helper_fbdev_setup/teardown()
>  -----------------------------------------------------------
> =20
> @@ -157,6 +189,8 @@ probably use drm_fb_helper_fbdev_teardown().
> =20
>  Contact: Maintainer of the driver you plan to convert
> =20
> +Level: Intermediate
> +
>  Clean up mmap forwarding
>  ------------------------
> =20
> @@ -166,6 +200,8 @@ There's drm_gem_prime_mmap() for this now, but stil=
l needs to be rolled out.
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Intermediate
> +
>  Generic fbdev defio support
>  ---------------------------
> =20
> @@ -196,6 +232,8 @@ Might be good to also have some igt testcases for t=
his.
> =20
>  Contact: Daniel Vetter, Noralf Tronnes
> =20
> +Level: Advanced
> +
>  idr_init_base()
>  ---------------
> =20
> @@ -206,6 +244,8 @@ efficient.
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Starter
> +
>  struct drm_gem_object_funcs
>  ---------------------------
> =20
> @@ -216,6 +256,8 @@ We also need a 2nd version of the CMA define that d=
oesn't require the
>  vmapping to be present (different hook for prime importing). Plus this=
 needs to
>  be rolled out to all drivers using their own implementations, too.
> =20
> +Level: Intermediate
> +
>  Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
>  ---------------------------------------------------------
> =20
> @@ -231,6 +273,8 @@ As a reference, take a look at the conversions alre=
ady completed in drm core.
> =20
>  Contact: Sean Paul, respective driver maintainers
> =20
> +Level: Starter
> +
>  Rename CMA helpers to DMA helpers
>  ---------------------------------
> =20
> @@ -241,6 +285,9 @@ no one knows what that means) since underneath they=
 just use dma_alloc_coherent.
> =20
>  Contact: Laurent Pinchart, Daniel Vetter
> =20
> +Level: Intermediate (mostly because it is a huge tasks without good pa=
rtial
> +milestones, not technically itself that challenging)
> +
>  Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
>  ----------------------------------------------------------------
> =20
> @@ -259,6 +306,8 @@ drm_display_mode to avoid future use.
> =20
>  Contact: Sean Paul
> =20
> +Level: Starter
> +
>  Remove drm_display_mode.hsync
>  -----------------------------
> =20
> @@ -269,6 +318,8 @@ it to use drm_mode_hsync() instead.
> =20
>  Contact: Sean Paul
> =20
> +Level: Starter
> +
>  drm_fb_helper tasks
>  -------------------
> =20
> @@ -284,6 +335,8 @@ drm_fb_helper tasks
>    removed: drm_fb_helper_single_add_all_connectors(),
>    drm_fb_helper_add_one_connector() and drm_fb_helper_remove_one_conne=
ctor().
> =20
> +Level: Intermediate
> +
>  connector register/unregister fixes
>  -----------------------------------
> =20
> @@ -296,6 +349,8 @@ connector register/unregister fixes
>    drm_dp_aux_init, and moving the actual registering into a late_regis=
ter
>    callback as recommended in the kerneldoc.
> =20
> +Level: Intermediate
> +
>  Core refactorings
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -338,6 +393,8 @@ This is a really varied tasks with lots of little b=
its and pieces:
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Advanced
> +
>  Clean up the debugfs support
>  ----------------------------
> =20
> @@ -367,6 +424,8 @@ There's a bunch of issues with it:
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Intermediate
> +
>  KMS cleanups
>  ------------
> =20
> @@ -382,6 +441,8 @@ Some of these date from the very introduction of KM=
S in 2008 ...
>    end, for which we could add drm_*_cleanup_kfree(). And then there's =
the (for
>    historical reasons) misnamed drm_primary_helper_destroy() function.
> =20
> +Level: Intermediate
> +
>  Better Testing
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -390,6 +451,8 @@ Enable trinity for DRM
> =20
>  And fix up the fallout. Should be really interesting ...
> =20
> +Level: Advanced
> +
>  Make KMS tests in i-g-t generic
>  -------------------------------
> =20
> @@ -403,6 +466,8 @@ converting things over. For modeset tests we also f=
irst need a bit of
>  infrastructure to use dumb buffers for untiled buffers, to be able to =
run all
>  the non-i915 specific modeset tests.
> =20
> +Level: Advanced
> +
>  Extend virtual test driver (VKMS)
>  ---------------------------------
> =20
> @@ -412,6 +477,8 @@ fit the available time.
> =20
>  Contact: Daniel Vetter
> =20
> +Level: See details
> +
>  Backlight Refactoring
>  ---------------------
> =20
> @@ -425,6 +492,8 @@ Plan to fix this:
> =20
>  Contact: Daniel Vetter
> =20
> +Level: Intermediate
> +
>  Driver Specific
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -453,6 +522,8 @@ for fbdev.
> =20
>  Contact: Sam Ravnborg
> =20
> +Level: Advanced
> +
>  Outside DRM
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -482,3 +553,5 @@ and Weston.
>   - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/dr=
ivers/gpu/drm/drm_fbconv_helper.c
> =20
>  Contact: Thomas Zimmermann <tzimmermann@suse.de>
> +
> +Level: Advanced
>=20

Hmm, it fits the definition of 'Advanced' but is it an advanced task?
With all the helpers in DRM, fbconv, and lots of drivers to copy from,
it mostly comes down to refactoring. I'd have classified this as starter
to intermediate.

In my case, I did my first steps in the DRM code by hacking up a driver
for an ancient SiS chipset. [1] I found that much easier than working on
the DRM core.

Best regards
Thomas

[1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/sisvga


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--b5mpHOQBhtviDHCdX6xYKzgjvEsnOfNgz--

--aCPXvWHBFYctYVHnNWYTKImofZf5OnWjk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2vPWIACgkQaA3BHVML
eiPGuQgAkLCof5sLnB8hatXh2XpaFOzS3Hv8dSCjEhQbv7SPVUT6wj8R3xJgfEwi
UwNQeqgwFhckPuEwlE8G67by+GqiKiccvVtIVSMLghMe6gA31yMBwRzswxjGUIEz
rfujOXg1XdP97ewpzvWaj25rynNUpdVtvaoew3ZpTk7RPx3pJiAIhOGSmcXFCSBP
6cpBSs66Bqj2WrOvWD5ja4zHssDoUxb8NVwh3BJZ/cqdXe0s+J5Sl6FaucxyjzXr
8Vs3llM58Er0ImzUbudKXhWhX23+zZ9yLOHLSTK8pQXYgBv1yQZ9LLkivbkfhg1m
dJcLDrV9+uPnsip9dvQyq8eeunRXVQ==
=TsKI
-----END PGP SIGNATURE-----

--aCPXvWHBFYctYVHnNWYTKImofZf5OnWjk--

--===============1265411306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1265411306==--
