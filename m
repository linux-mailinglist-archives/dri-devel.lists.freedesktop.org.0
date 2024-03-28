Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F489002F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 14:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF3410F6C4;
	Thu, 28 Mar 2024 13:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PmrGQ9Kc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1675D10F6C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711632416;
 bh=sujgBuYQtY13TTpTdfQEXBxrBtYs4wxALaYTuvqw3qI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PmrGQ9KcwnuSOZMqs+OV0YUrc2FsOWYU9wgCIQ9uwk2jEEb/F1rGLNNV+tSVclfJ3
 PblpW3KDfoFd25ERV17nV+f46WRUrWGwsXJVnmdNqTjYcYXulk6J9aP4jINa/Z2rUK
 JBJnmAEq+nP7Yxvyw2J5xQcQPnpF9RLgftPmZy6jbvYbKfIO+MNGd35DgpSJ1xeOb6
 TWyvvUpj5v6+GdqVbFqb61gl+8kJjiIBpdXSJl5CfdU05Bd/u3Pz6SE8pRvrouTSRH
 +/lP5yqwQ6QHGAMlOyw6Zxs59Z89sGyjobYxFQ02Cn+DIyLa9xRdQ8zD7Brsg2NcgS
 E34VTBGLxLQcA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C7FA83780629;
 Thu, 28 Mar 2024 13:26:54 +0000 (UTC)
Date: Thu, 28 Mar 2024 15:26:31 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, arthurgrillo@riseup.net, Jonathan Corbet
 <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 14/16] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20240328152631.63af0e8c.pekka.paalanen@collabora.com>
In-Reply-To: <89748cd9-286b-4b07-b96b-5167e4b22cd2@igalia.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-14-e610cbd03f52@bootlin.com>
 <89748cd9-286b-4b07-b96b-5167e4b22cd2@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GE4vZKTXISViEEd2qeObyM7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GE4vZKTXISViEEd2qeObyM7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Mar 2024 11:34:17 -0300
Ma=C3=ADra Canal <mcanal@igalia.com> wrote:

> On 3/13/24 14:45, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> >=20
> > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > conversion and range combination with some common colors.
> >=20
> > The code used to compute the expected result can be found in comment.
> >=20
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > [Louis Chauvet:
> > - fix minor formating issues (whitespace, double line)
> > - change expected alpha from 0x0000 to 0xffff
> > - adapt to the new get_conversion_matrix usage
> > - apply the changes from Arthur
> > - move struct pixel_yuv_u8 to the test itself] =20
>=20
> Again, a Co-developed-by tag might be more proper.
>=20
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/Kconfig                  |  15 ++
> >   drivers/gpu/drm/vkms/Makefile                 |   1 +
> >   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >   drivers/gpu/drm/vkms/tests/Makefile           |   3 +
> >   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 +++++++++++++++++=
+++++++++
> >   drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
> >   drivers/gpu/drm/vkms/vkms_formats.h           |   4 +
> >   7 files changed, 262 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> > index b9ecdebecb0b..9b0e1940c14f 100644
> > --- a/drivers/gpu/drm/vkms/Kconfig
> > +++ b/drivers/gpu/drm/vkms/Kconfig
> > @@ -13,3 +13,18 @@ config DRM_VKMS
> >   	  a VKMS.
> >  =20
> >   	  If M is selected the module will be called vkms.
> > +
> > +config DRM_VKMS_KUNIT_TESTS
> > +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS =20
>=20
> "KUnit tests for VKMS"
>=20
> > +	depends on DRM_VKMS && KUNIT
> > +	default KUNIT_ALL_TESTS
> > +	help
> > +	  This builds unit tests for VKMS. This option is not useful for
> > +	  distributions or general kernels, but only for kernel
> > +	  developers working on VKMS.
> > +
> > +	  For more information on KUnit and unit tests in general,
> > +	  please refer to the KUnit documentation in
> > +	  Documentation/dev-tools/kunit/.
> > +
> > +	  If in doubt, say "N".
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makef=
ile
> > index 1b28a6a32948..8d3e46dde635 100644
> > --- a/drivers/gpu/drm/vkms/Makefile
> > +++ b/drivers/gpu/drm/vkms/Makefile
> > @@ -9,3 +9,4 @@ vkms-y :=3D \
> >   	vkms_writeback.o
> >  =20
> >   obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
> > +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) +=3D tests/
> > diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/=
vkms/tests/.kunitconfig
> > new file mode 100644
> > index 000000000000..70e378228cbd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> > @@ -0,0 +1,4 @@
> > +CONFIG_KUNIT=3Dy
> > +CONFIG_DRM=3Dy
> > +CONFIG_DRM_VKMS=3Dy
> > +CONFIG_DRM_VKMS_KUNIT_TESTS=3Dy
> > diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms=
/tests/Makefile
> > new file mode 100644
> > index 000000000000..2d1df668569e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) +=3D vkms_format_test.o
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gp=
u/drm/vkms/tests/vkms_format_test.c
> > new file mode 100644
> > index 000000000000..0954d606e44a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> > @@ -0,0 +1,230 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include <kunit/test.h>
> > +
> > +#include <drm/drm_fixed.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include "../../drm_crtc_internal.h"
> > +
> > +#include "../vkms_drv.h"
> > +#include "../vkms_formats.h"
> > +
> > +#define TEST_BUFF_SIZE 50
> > +
> > +struct pixel_yuv_u8 {
> > +	u8 y, u, v;
> > +};
> > +
> > +struct yuv_u8_to_argb_u16_case {
> > +	enum drm_color_encoding encoding;
> > +	enum drm_color_range range;
> > +	size_t n_colors;
> > +	struct format_pair {
> > +		char *name;
> > +		struct pixel_yuv_u8 yuv;
> > +		struct pixel_argb_u16 argb;
> > +	} colors[TEST_BUFF_SIZE];
> > +};
> > +
> > +/*
> > + * The YUV color representation were acquired via the colour python fr=
amework.
> > + * Below are the function calls used for generating each case.
> > + *
> > + * for more information got to the docs: =20
>=20
> s/for/For
>=20
> > + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCb=
Cr.html
> > + */
> > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] =3D {
> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > +	 *                     in_bits =3D 16,
> > +	 *                     in_legal =3D False,
> > +	 *                     in_int =3D True,
> > +	 *                     out_bits =3D 8,
> > +	 *                     out_legal =3D False,
> > +	 *                     out_int =3D True)
> > +	 */ =20
>=20
> I feel that this Python code is kind of poluting the test cases.

I asked for the python code.

How would you verify that the expected values are actually correct
without these comments?

You cannot trust that the test values are good if the tests pass. Both
the test values and the tested code could be wrong simultaneously and
agree on wrong results.


I love these comments that explicitly give the python snippets used to
generate the test values. Well done!

Louis' suggestion of collecting the common python bits together is
fine, too. As long as the comments clearly explain what python commands
produced the test values, I'm happy.

Anyway,

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> > +	{
> > +		.encoding =3D DRM_COLOR_YCBCR_BT601,
> > +		.range =3D DRM_COLOR_YCBCR_FULL_RANGE,
> > +		.n_colors =3D 6,
> > +		.colors =3D {
> > +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }=
},
> > +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }=
},
> > +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }=
},
> > +			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }=
},
> > +			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }=
},
> > +			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }=
},
> > +		},
> > +	},
> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > +	 *                     in_bits =3D 16,
> > +	 *                     in_legal =3D False,
> > +	 *                     in_int =3D True,
> > +	 *                     out_bits =3D 8,
> > +	 *                     out_legal =3D True,
> > +	 *                     out_int =3D True)
> > +	 */
> > +	{
> > +		.encoding =3D DRM_COLOR_YCBCR_BT601,
> > +		.range =3D DRM_COLOR_YCBCR_LIMITED_RANGE,
> > +		.n_colors =3D 6,
> > +		.colors =3D {
> > +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }=
},
> > +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }=
},
> > +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }=
},
> > +			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }=
},
> > +			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }=
},
> > +			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }=
},
> > +		},
> > +	},
> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=3Dcolour.WEIGHTS_YCBCR["ITU-R BT.709"],
> > +	 *                     in_bits =3D 16,
> > +	 *                     in_legal =3D False,
> > +	 *                     in_int =3D True,
> > +	 *                     out_bits =3D 8,
> > +	 *                     out_legal =3D False,
> > +	 *                     out_int =3D True)
> > +	 */
> > +	{


--Sig_/GE4vZKTXISViEEd2qeObyM7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYFcAcACgkQI1/ltBGq
qqdtfg//aR9IWCoptr+hasnOCmoAiOppJsvqaITUFyRIKkV4D6AcUfe8s4i81K1U
CKZaDtEfJJh0adX5nA53Hld4w1hOY9+dpeeaH107Hco6Bbnx68DaEvCY/si+aG7l
596JOeGiHlMYxHtlN8KR18pqRkldW1Jn8LLVSqRJ3etqI5vrdpuoCEVvGnEYy99m
3bgpF2Pf+F2MTdz3yiUV8oWK0QlcVyLZBuYytlJssrOTN40i/YtgXarQRcThc+WR
MVfrnpi4OEMoX07qglhiSLaCsKYWXCz6tV6Lsia+8Aq867sIOJu2PF6GQEr+zlb9
YiCw4nSK9kTj8JvTktaWzi+S7Cm0EOV/HNkC3Jnm6zha+FB6cfDW7VGGFIXRpkvC
KLwGO8W3WmMjIcOOudhi0cWrPzCdyRpCBukNU78kMGbcf311J1pJtDJisCKTMLXR
K0j5VYuOnzgww437TNEzX7isOBTwsO41C8O7ag/mI0COJL5gjwhd9FLOmDLf1UGi
4N5W7W4bYcXDwjekCHX3DfUZXaThN2Z4EzNKVLYj5/3C7oOk2F3a/TZce4r5eRKi
2cw73No7g7TBtw5FdEJ+7TUV4WliYm7k54uo59TtF6eYOcp0syKB6pXRaMMeW36y
aBXEqsryYB/YZ5uJlo3Q6DeVpGPAW5k64X+w1E3wNuf4rmKiV54=
=jcDv
-----END PGP SIGNATURE-----

--Sig_/GE4vZKTXISViEEd2qeObyM7--
