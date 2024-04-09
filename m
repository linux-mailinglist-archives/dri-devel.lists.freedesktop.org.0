Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D3489D34A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5A2112B39;
	Tue,  9 Apr 2024 07:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="vEvH34iG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073CA112B36
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712648147;
 bh=YcUJn2HKpN04q9KKGaJkJFDwFrKfIsLsYaiaYNAEWPY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vEvH34iGXnle2VIQj3yCVdU90mFtwHMWapwu5pfFFaRS0gccyHqmATcj/YXK/QtM9
 6GlzR1DWpOM0zO9QeNedMYC8TDDSo9f/Fb4yrFzWbeOdtlL+Fl/JeezAZgw6VKjbRh
 PEjGb2CFrank/87d6xefG3e2YkD1IthNCRwMrT3o5ylXujmO4KcuWHQOLwqOOE2W2A
 Y7z3NJIkBGb7a6w1k7/VV+X6Mvzd7BB6CfKbwJVdqA8mDS1kGO+mNjYkBxRPyF0d1T
 yGOilcK03b15I4YQHxAQwSVFNGlPD1mPWKfo31CZHhGbft11rH1JQXXSxIE5lnAPoW
 QPtauP7LVR7AQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C759537820CD;
 Tue,  9 Apr 2024 07:35:45 +0000 (UTC)
Date: Tue, 9 Apr 2024 10:35:37 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
Message-ID: <20240409103537.44e99854.pekka.paalanen@collabora.com>
In-Reply-To: <ZhOhupo3bf6Cxasy@louis-chauvet-laptop>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
 <20240325151103.0a5f7112.pekka.paalanen@collabora.com>
 <ZgLwTJVb_Z_MHuCp@localhost.localdomain>
 <20240327141629.48ec16f2.pekka.paalanen@collabora.com>
 <ZhOhupo3bf6Cxasy@louis-chauvet-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7ZpC0ifXnJlJSiBwE7xK8iV";
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

--Sig_/7ZpC0ifXnJlJSiBwE7xK8iV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Apr 2024 09:50:18 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 27/03/24 - 14:16, Pekka Paalanen a =C3=A9crit :
> > On Tue, 26 Mar 2024 16:57:00 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > Le 25/03/24 - 15:11, Pekka Paalanen a =C3=A9crit : =20
> > > > On Wed, 13 Mar 2024 18:45:03 +0100
> > > > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > >    =20
> > > > > The pixel_read_direction enum is useful to describe the reading d=
irection
> > > > > in a plane. It avoids using the rotation property of DRM, which n=
ot
> > > > > practical to know the direction of reading.
> > > > > This patch also introduce two helpers, one to compute the
> > > > > pixel_read_direction from the DRM rotation property, and one to c=
ompute
> > > > > the step, in byte, between two successive pixel in a specific dir=
ection.
> > > > >=20
> > > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++=
++++++++++++++
> > > > >  drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
> > > > >  drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++=
++++++++
> > > > >  3 files changed, 77 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/d=
rm/vkms/vkms_composer.c
> > > > > index 9254086f23ff..989bcf59f375 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c

> > > > I hope IGT uses FB patterns instead of solid color in its tests of
> > > > rotation to be able to detect the difference.   =20
> > >=20
> > > They use solid colors, and even my new rotation test [3] use solid co=
lors. =20
> >=20
> > That will completely fail to detect rotation and reflection bugs then.
> > E.g. userspace asks for 180-degree rotation, and the driver does not
> > rotate at all. Or rotate-180 getting confused with one reflection. =20
>=20
> I think I missunderstood what you means with "solid colors".
>=20
> The tests uses a plane with multiple solid colors:
>=20
> +-------+-------+
> | White | Red   |
> +-------+-------+
> | Blue  | Green |
> +-------+-------+
>=20
> But it don't use gradients because of YUV.
>

Oh, that works. No worries then.

> > > It is mainly for yuv formats with subsampling: if you have formats wi=
th=20
> > > subsampling, a "software rotated buffer" and a "hardware rotated buff=
er"=20
> > > will not apply the same subsampling, so the colors will be slightly=20
> > > different. =20
> >=20
> > Why would they not use the same subsampling? =20
>=20
> YUV422, for each pair of pixels along a horizontal line, the U and V=20
> components are shared between those two pixels. However, along a vertical=
=20
> line, each pixel has its own U and V components.
>=20
> When you rotate an image by 90 degrees:
>  - Hardware Rotation: If you use hardware rotation, the YUV subsampling=20
>    axis will align with what was previously the "White-Red" axis. The=20
>    hardware will handle the rotation.
>  - Software Rotation: If you use software rotation, the YUV subsampling=20
>    axis will align with what was previously the "Red-Green" axis.

That would be a bug in the software rotation.

> Because the subsampling compression axis changes depending on whether=20
> you're using hardware or software rotation, the compression effect on=20
> colors will differ. Specifically:
>  - Hardware rotation, a gradient along the "White-Red" axis may be=20
>    compressed (i.e same UV component for multiple pixels along the=20
>    gradient).
>  - Software rotation, the same gradient will not be compressed (i.e, each=
=20
>    different color in the gradient have dedicated UV component)
>=20
> The same reasoning also apply for "color borders", and my series [3] avoi=
d=20
> this issue by choosing the right number of pixels.

What is [3]?

I've used similar tactics in the Weston test suite, when I have no
implementation for chroma siting: the input and reference images
consist of 2x2 equal color pixel groups, so that chroma siting makes no
difference. When chroma siting will be implemented, the tests will be
extended.

Is there a TODO item to fix the software rotation bug and make the
tests more sensitive?

I think documenting this would be an ok intermediate solution.

> > The framebuffer contents are defined in its natural orientation, and
> > the subsampling applies in the natural orientation. If such a FB
> > is on a rotated plane, one must account for subsampling first, and
> > rotate second. 90-degree rotation does not change the encoded color.
> >=20
> > Getting the subsampling exactly right is going to be necessary sooner
> > or later. There is no UAPI for setting chroma siting yet, but ideally
> > there should be.
> >  =20
> > > > The return values do seem correct to me, assuming I have guessed
> > > > correctly what "X" and "Y" refer to when combined with rotation. I =
did
> > > > not find good documentation about that.   =20
> > >=20
> > > Yes, it is difficult to understand how rotation and reflexion should=
=20
> > > works in drm. I spend half a day testing all the combination in drm_r=
ect_*=20
> > > helpers to understand how this works. According to the code:
> > > - If only rotation or only reflexion, easy as expected
> > > - If reflexion and rotation are mixed, the source buffer is first=20
> > >   reflected and then rotated. =20
> >=20
> > Now that you know, you could send a documentation patch. :-) =20
>=20
> And now I'm not sure about it :)

You'll have people review the patch and confirm your understanding or
point out a mistake. A doc patch it easier to notice and jump in than
this series.

> I was running the tests on my v6, and for the first time ran my new=20
> rotation [3] on the previous VKMS code. None of the tests for=20
> ROT_90+reflexion and ROT_270+reflexion are passing...
>=20
> So, either the previous vkms implementation was wrong, or mine is wrong :)
>=20
> So, if a DRM expert can explain this, it could be nice.
>=20
> To have a common example, if I take the same buffer as above=20
> (white+red+blue+green), if I create a plane with rotation =3D=20
> ROTATION_90 | REFLECTION_X, what is the expected result?
>=20
> 1 - rotation then reflection=20
>=20
> +-------+-------+
> | Green | Red   |
> +-------+-------+
> | Blue  | White |
> +-------+-------+
>=20
> 2 - reflection then rotation (my vkms implementation)
>=20
> +-------+-------+
> | White | Blue  |
> +-------+-------+
> | Red   | Green |
> +-------+-------+
>=20

I wish I knew. :-)

Thanks,
pq


> > For me as a userspace developer, the important place is
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-plane-pr=
operties
> >  =20

--Sig_/7ZpC0ifXnJlJSiBwE7xK8iV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYU78kACgkQI1/ltBGq
qqeYfg/+PS3QEJX8CnU8a1qo4nXuCr7ss8sSfGX6zY/YAmpLQ7xHMUtu2Z85Ygyz
h/cUvvORb3CD/zpoxh4w3JqYnW20AgEN4P1Rphl13VETOwVsreRtnlhMUm3E0sJX
rk3IFQIZgqNzwJxbc6u+ObRNYekaP5SG8y4J1vs9+XUns+AyjGBmHq9uf1NiRtTz
ylK96N1y6QiLPkK6t1c55nbLWKptaLe7ONw6A07VbTMQED/0LWOb2o0Y/snxJR0i
8t49+izUSGINNHhgoRsGFhA4yDLuHeZnSDsUREyL2blrxeMVgshMtlzjOwu9GHm5
jNEjGKY7yB0IvWFdfp5YktBkQNLFqK/IfiCJRTLNcxMBNMfUawajsWjtm1hTvwC/
IekuIYmnEXumrhga5Adkby4nYku+Ro0tdDXCOULRxx7lQToj/8V6AuZOTAK+75a0
58zeVuXF+VvicjJPHix1FVSwSmucIveuhA86IB17GBK1INRC+VUW0jARf4/qRksD
JYYhl/hiluWw/IJJ7cNCm4H+Da8jlMmQray0QfDGAlDXBh2tS2XIJEiaBm+B9yZd
vAtMIknf3JC9MASUNdykVCuJ1Wti3lu8pmpopLSiktPIyPNYhD4a3n+mWpRvKHpb
1mo2PraPdNgF3mDrGCevEVt2u8xpv5V0fL3Zj2GWVGCe16f8oTM=
=Z/uP
-----END PGP SIGNATURE-----

--Sig_/7ZpC0ifXnJlJSiBwE7xK8iV--
