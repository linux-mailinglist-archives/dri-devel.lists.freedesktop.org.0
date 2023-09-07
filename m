Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCD2797094
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 09:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5510E780;
	Thu,  7 Sep 2023 07:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6766E10E780;
 Thu,  7 Sep 2023 07:57:07 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E6EB466072B7;
 Thu,  7 Sep 2023 08:57:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694073426;
 bh=g+zS9zscqa9JocFtFfRFrRl394UC/ee5ATCSkFjjF+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O4ZOyNTxA/ImhVlDiFeW/iReSYn2smPZdiUHfhkYDjiElNKYftZT2r3DiMHNSuIKI
 1qnRlndG6JsKWAd/q/v2WX7oln96sXrO7DdJjJ5XsTu/tOyUjW1FI/xkDiC0ytpvI2
 R1Q/VCo1i2PiR/gzabNXz9EHt/Ec3UXDLDItWjY8lGii/u4fl9BI9wRDEiG+wxfSCJ
 OLzMeUiDV31LL66ADe3bn08np0O4QM0KLy8ZwF3PU+TZnlWkcFvu/rjJ0X1FItaT8X
 kdLYNCD82pciP3Azy5HRW86lh2/3akXDGs+TWXom58btCYtvqoNFd0uFrGeDGdhBEU
 SYmTOTk37kVYw==
Date: Thu, 7 Sep 2023 10:57:01 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 10/34] drm/amd/display: add plane 3D LUT
 driver-specific properties
Message-ID: <20230907105701.5b1c115f.pekka.paalanen@collabora.com>
In-Reply-To: <758deee7-7530-4931-830e-d5a4acff337f@amd.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-11-mwen@igalia.com>
 <758deee7-7530-4931-830e-d5a4acff337f@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qq/QqCqDCx028D8be33an6X";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qq/QqCqDCx028D8be33an6X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sep 2023 15:30:04 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-08-10 12:02, Melissa Wen wrote:
> > Add 3D LUT property for plane gamma correction using a 3D lookup table.
> > Since a 3D LUT has a limited number of entries in each dimension we want
> > to use them in an optimal fashion. This means using the 3D LUT in a
> > colorspace that is optimized for human vision, such as sRGB, PQ, or
> > another non-linear space. Therefore, userpace may need one 1D LUT
> > (shaper) before it to delinearize content and another 1D LUT after 3D
> > LUT (blend) to linearize content again for blending. The next patches
> > add these 1D LUTs to the plane color mgmt pipeline.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      | 10 ++++++++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 ++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 14 +++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 23 +++++++++++++++++++
> >  4 files changed, 56 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index 66bae0eed80c..730a88236501 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -363,6 +363,16 @@ struct amdgpu_mode_info {
> >  	 * @plane_hdr_mult_property:
> >  	 */
> >  	struct drm_property *plane_hdr_mult_property;
> > +	/**
> > +	 * @plane_lut3d_property: Plane property for gamma correction using a
> > +	 * 3D LUT (pre-blending).
> > +	 */ =20
>=20
> I think we'll want to describe how the 3DLUT entries are laid out.
> Something that describes how userspace should fill it, like
> gamescope does for example:
> https://github.com/ValveSoftware/gamescope/blob/7108880ed80b68c21750369e2=
ac9b7315fecf264/src/color_helpers.cpp#L302
>=20
> Something like: a three-dimensional array, with each dimension
> having a size of the cubed root of lut3d_size, blue being the
> outermost dimension, red the innermost.
>

Here is an example of how we defined a 3D LUT layout in Weston:

https://gitlab.freedesktop.org/wayland/weston/-/blob/68e2a606c056c8453c7702=
63f41f34cd68bdc9d0/libweston/color.h#L114-152

I think that is the most clear definition it can be, without needing to
understand specific terminology.


Thanks,
pq

>=20
> > +	struct drm_property *plane_lut3d_property;
> > +	/**
> > +	 * @plane_degamma_lut_size_property: Plane property to define the max
> > +	 * size of 3D LUT as supported by the driver (read-only).
> > +	 */ =20
>=20
> We should probably document that the size of the 3DLUT should
> be the size of one dimension cubed, or that the cubed root of
> the LUT size gives the size per dimension.
>=20
> Harry

--Sig_/qq/QqCqDCx028D8be33an6X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT5gk0ACgkQI1/ltBGq
qqcZIBAAmODUClwcQF98Uyvdh1zkV1ESp4m8wA7eTjeL6D6nqsh7bAkggZ+FzRoY
N9pv1n2Zf6s+RR12MBgLyyl5KhUH/Jl7FUldIC4DRlvFHMGn1VtC64ta8QZH5H8a
/QtgB9TVWjiti7HCuHFJTscqoLYNgMivei1WJwKFiUssvX5YZKNDHxRvIGCcVgzf
4VxhbwGwI+g1rA2r4I9HlL3IwNg2Arj/0llhI+i34wMYWG68q2UhwOAWi80bY+Dg
2qJvcXi2ZxYeli1NmRavp0X1D5IEMlw/py39NrlJtXBVErqrKUq/kcDNKQPYyuDB
CX08ix6l5NEQOpwZ93Il00d3vj2z441Wd/m3S4B9Ool7beDhS0746c4idM+jvX6n
ghgiSGgl68v8kT7VAJZY/IleABlbSflkofzbZEk2Fku7eo7YbtpoZu5gY8VPyqUx
ce1+YH70A6qNhZj8EhuwU95G8e+l5TSUKytZXAef9lAT01Yf+KkQI5vZW15A0xnk
DvVbVTQRYxOOeiKmx91l8U5X5uj6DxsfspFE//kzE+4t82WE0m12IB8Hu9J2YmlB
M0egvTn1ImXH7eR+hNiDCJEp+GxvXEVEu6gk/rTJAM5vKql74BNLClYzpUj9JKcx
i7MYh4+7P4lHSZJqCtPdbEbWX76dQkyXcfzGetSsL7XaqLWa8yA=
=/DSd
-----END PGP SIGNATURE-----

--Sig_/qq/QqCqDCx028D8be33an6X--
