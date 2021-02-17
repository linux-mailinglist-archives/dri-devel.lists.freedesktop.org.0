Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA731D93F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A286C6E500;
	Wed, 17 Feb 2021 12:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CCE89DA4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:14:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04A97B958;
 Wed, 17 Feb 2021 12:14:50 +0000 (UTC)
Subject: Re: [PATCH v9 0/4] Add %p4cc printk modifier for V4L2 and DRM fourcc
 codes
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
Date: Wed, 17 Feb 2021 13:14:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 laurent.pinchart@ideasonboard.com, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0819817492=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0819817492==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HyUqrLrN2TqE8TEiCzyyAR5yf6EjGYvi5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HyUqrLrN2TqE8TEiCzyyAR5yf6EjGYvi5
Content-Type: multipart/mixed; boundary="2duiza1Wx6GqImBjDmg8HnMhbYyED8yYa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
Subject: Re: [PATCH v9 0/4] Add %p4cc printk modifier for V4L2 and DRM fourcc
 codes
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20210216155723.17109-1-sakari.ailus@linux.intel.com>

--2duiza1Wx6GqImBjDmg8HnMhbYyED8yYa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.02.21 um 16:57 schrieb Sakari Ailus:
> Hi all,
>=20
> 	On merging --- it would seem everyone is happy with merging this
> 	through the drm-misc tree. The last patch should wait until all
> 	users are gone for sure, probably to the next kernel release.
> 	There are no users of drm_get_format_name() in linux-next
> 	currently after the 3rd patch.

I've merged patches 1 to 3 into drm-misc-next. Patch 4 (and maybe some=20
final fix-up patch) will land when all DRM trees have catched up the=20
changes.

Best regards
Thomas

>=20
> This set adds support for %p4cc printk modifier for printing V4L2 and D=
RM
> fourcc codes. The codes are cumbersome to print manually and by adding =
the
> modifier, this task is saved from the V4L2 and DRM frameworks as well a=
s
> related drivers. DRM actually had it handled in a way (see 3rd patch) b=
ut
> the printk modifier makes printing the format easier even there. On V4L=
2
> side it saves quite a few lines of repeating different implementations =
of
> printing the 4cc codes.
>=20
> Further work will include converting the V4L2 drivers doing the same. I=

> left these out from this version since individual drivers are easier
> changed without dealing with multiple trees.
>=20
> Since v8:
>=20
> - Reduce ternary conditionals in intel_plane_uapi_info().
>=20
> - Wrap a long line in intel_plane_hw_info().
>=20
> Since v7:
>=20
> - Add more examples, one with big endian and another with a space.
>=20
> - Add Y10 test format.
>=20
> - Use "0123" in the size string for temporary buffer.
>=20
> - Added acks.
>=20
> - Split the 3rd patch into two: driver changes and removal of
>    drm_get_format_name().
>=20
> Since v6:
>=20
> - Don't drop spaces in fourcc codes.
>=20
> - Print unprintable characters as dot ('.') instead of hexadecimal numb=
er
>    in parentheses.
>=20
> - Convert DRM from drm_get_format_name() to %p4cc. I wonder if this sho=
uld
>    be merged through the DRM tree, albeit it's probably unlikely to
>    conflict with other changes. Further use of the function could be a
>    problem.
>=20
> - Make tests more realistic.
>=20
> Since v5:
>=20
> - Added V4L2 core conversion to %p4cc, as well as change the DRM
>    fourcc printing function to use %p4cc.
>=20
> - Add missing checkpatch.pl checks for %p4cc modifier.
>=20
> Sakari Ailus (4):
>    lib/vsprintf: Add support for printing V4L2 and DRM fourccs
>    v4l: ioctl: Use %p4cc printk modifier to print FourCC codes
>    drm: Switch to %p4cc format modifier
>    drm: Remove drm_get_format_name()
>=20
>   Documentation/core-api/printk-formats.rst     | 18 ++++
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  5 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  5 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  5 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  5 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
>   .../arm/display/komeda/komeda_format_caps.h   | 11 ---
>   .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
>   .../gpu/drm/arm/display/komeda/komeda_plane.c |  6 +-
>   drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
>   drivers/gpu/drm/drm_atomic.c                  |  8 +-
>   drivers/gpu/drm/drm_crtc.c                    |  7 +-
>   drivers/gpu/drm/drm_fourcc.c                  | 25 ------
>   drivers/gpu/drm/drm_framebuffer.c             | 11 +--
>   drivers/gpu/drm/drm_mipi_dbi.c                |  5 +-
>   drivers/gpu/drm/drm_plane.c                   |  8 +-
>   .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  5 +-
>   drivers/gpu/drm/i915/display/intel_display.c  | 14 +--
>   .../drm/i915/display/intel_display_debugfs.c  | 19 ++---
>   drivers/gpu/drm/i915/display/intel_sprite.c   |  6 +-
>   drivers/gpu/drm/mcde/mcde_display.c           |  6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +-
>   drivers/gpu/drm/radeon/atombios_crtc.c        | 10 +--
>   drivers/gpu/drm/sun4i/sun4i_backend.c         |  6 +-
>   drivers/gpu/drm/vkms/vkms_writeback.c         |  7 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++--
>   drivers/media/v4l2-core/v4l2-ioctl.c          | 85 +++++-------------=
-
>   include/drm/drm_fourcc.h                      |  1 -
>   lib/test_printf.c                             | 18 ++++
>   lib/vsprintf.c                                | 39 +++++++++
>   scripts/checkpatch.pl                         |  6 +-
>   32 files changed, 164 insertions(+), 223 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--2duiza1Wx6GqImBjDmg8HnMhbYyED8yYa--

--HyUqrLrN2TqE8TEiCzyyAR5yf6EjGYvi5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAtCLMFAwAAAAAACgkQlh/E3EQov+AY
kw/3RFAkt2XQW6AGXYNJcGJ4bdXzGbp1aJ/k0FyEiHaoP5GuXFnJnGizaOfdRn+BG7J2moOYhU9u
L3HCZpaWW7zGWd96gC8tw81685lf5eNFNHzFll7To8/bipzSuObsBU02WkGLgj7PGBJaoR206u9e
SlWCWxlOFK9iQO+CT5Jfx3YzlW0FzHiuJwCMgZJhn7jqhPyHNtP2TdJPcLhmtERrFk4ZD4TgiLSK
ReHmugCGUywD397rcFIg1FD5hYM9/QLchNX2mPP9B75l4Cbk/DuhnPOvnGzD8ccL5J94CaRthdeH
EkjCeO+03A8hOCOP8p4382LMeVI723FzsrmI+GHJNhez6Vav7eEsFsVroWUlmSr8u4ZP1TTwtHaf
APnm00Qt8sqb0ParG5spKT7eMjYIfa34VvgLnHzGjyM6C/Nhxkzj2Ll/a17staqR6NmIdnERlgvB
7G+SpGpReLQRMLb6jGn4dF2cHaX6Dp5BmYWb9etnMf5otJzGU1KQ71JaNqqt4ySi4fhmELdJNyGU
bdYIjcTYD9D2IuBxamAvWN6AQ5emllmgW+uPHuMMI+zWx3KP43RMYOa6mXdqK2KjjMPdGM299xdC
1Wx983c0iMswmAAI/8DFJA5KNgJ/svA/t+SAEEfwPL/+KDE0K6M5KCpYvQMkr5gzmxUoeNjPNBix
0w==
=fadD
-----END PGP SIGNATURE-----

--HyUqrLrN2TqE8TEiCzyyAR5yf6EjGYvi5--

--===============0819817492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0819817492==--
