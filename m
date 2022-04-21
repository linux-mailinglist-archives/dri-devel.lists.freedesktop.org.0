Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007450A8EE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 21:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E710E9F3;
	Thu, 21 Apr 2022 19:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3326C10E9F3;
 Thu, 21 Apr 2022 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uKJBe9eCqyyG6EEptgE9QaaoEsdZpl1Kh0VqWIabWyo=; b=o1i7fTqbgTvZtmoYYgu6i+UxNF
 b0PnlBLUDIyQz0rrV3fQQwGtEGD8CEB39ndf6cyaQtHRhrAMSW/63ome6TUg7l4WnInOn+BNo649I
 nyu7B610hgxfOL7YN9Dz+0mWAEIlxu687fNBu2/3tSSd/gtMmLxe3D1tIBI0/yxK+Z/UzE9kWdEZi
 2bPKmRj8UeaJcSEIJ4H6JHJE6NA4GuwRj/tOIgdLZC/7BNvpA9hvclhtk1j0SaGWyYjfOFgmR0aFX
 D3X5zsnreMJ0Te/Au21GwhReSpHG9bvmwWmrhbMWbcKmVXl5Z0SQE6G48JRtKgQ/GEvJWXNwJquRK
 6hD/plgg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nhcLj-0008M1-MT; Thu, 21 Apr 2022 21:20:19 +0200
Date: Thu, 21 Apr 2022 18:20:06 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: AMD display drivers handling DRM CRTC color mgmt props
Message-ID: <20220421191945.yn4plwv757jlri2n@mail.igalia.com>
References: <20220421143747.247mohbio436ivqo@mail.igalia.com>
 <06891dd7-b2f4-ece6-b1a5-b9ad15f5f899@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h6wjzxgbx56uj4c2"
Content-Disposition: inline
In-Reply-To: <06891dd7-b2f4-ece6-b1a5-b9ad15f5f899@amd.com>
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
Cc: Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h6wjzxgbx56uj4c2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/21, Harry Wentland wrote:
>=20
>=20
> On 2022-04-21 10:37, Melissa Wen wrote:
> > Hi all,
> >=20
> > I'm examining how DRM color management properties (degamma, ctm, gamma)
> > are applied to AMD display drivers. As far I could understand thanks
> > Nicholas documentation on amdgpu_dm/amdgpu_dm_color, DC drivers have
> > per-plane color correction features:
> >=20
Hi Harry,

Wow, thanks so much for all details!
>=20
> DC programs some of the color correction features pre-blending but
> DRM/KMS has not per-plane color correction properties.
>=20
> See this series from Uma Shankar for an RFC on how to introduce those
> properties for 1D LUTs and CSC matrix:
> https://patchwork.freedesktop.org/series/90826/
>=20
> Bhanuprakash has a series of IGT tests for these properties:
> https://patchwork.freedesktop.org/series/96895/
>=20
> I've rebased these on amd-staging-drm-next and maintain a kernel and IGT
> branch with these patches:
> https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-hdr
> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/color-and-h=
dr
>=20
> We've had many discussions with Weston guys on this. In order to merge the
> kernel properties we need a canonical userspace implementation that are
> using it. Weston guys are working towards that but if you want to suggest=
 a
> different userspace to serve as that vehicle I'd be all ears. :)
>=20
> Note that in order to show this all working we also need a Wayland Protoc=
ol
> update.
>=20
> See
> https://gitlab.freedesktop.org/pq/color-and-hdr
> https://gitlab.freedesktop.org/swick/wayland-protocols
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467

So, I've followed these discussions (until the issue on naming) because
initially I considered it addresses our current goals for color
correction. But after some discussions, what we are targeting is a 3D
LUT after blending (per-CRTC). I found past proposals on dri-devel
[1][2] to extend the DRM CRTC color management properties, but they
didn't move forward and were never applied.

>=20
> > * - Input gamma LUT (de-normalized)
> > * - Input CSC (normalized)
> > * - Surface degamma LUT (normalized)
> > * - Surface CSC (normalized)
> > * - Surface regamma LUT (normalized)
> > * - Output CSC (normalized)
> > so DM is "adapting" those DRM per-CRTC properties to fit into three of
> > these color correction stages, which I guess are the surface stages:
> >=20
> > * - Surface degamma LUT (normalized)
> > * - Surface CSC (normalized)
> > * - Surface regamma LUT (normalized)
> >=20
> > I'm trying to understand what this mapping is doing. A comment mentions
> > that is not possible to do these color corrections after blending, so,
> > the same color correction pipe is performed on every plane before
> > blending?  (is the surface the plane?) Does this adaptation affect the
> > expected output?  Moreover, is there something that I misunderstood? :)
> >=20
>=20
> What's possible to do before and after blending has changed quite a bit
> between DCN generations. We program the CRTC Gamma and CTM after blending.
> See attached picture for a view relating the color bits between the DRM
> interface, DC interface and DCN 3.0 HW blocks.

This picture is really enlightening, thanks!
You said it changes between generations, therefore, I can't consider the
DCN 2.x family follow the same mapping, right? If so, can you share the
main differences for a DCN 2.x regarding per-CRTC properties?

>=20
> > That said, if the DRM color mgmt supports per-CRTC 3D LUT as the last
>=20
> Where do you see 3D LUT support in DRM? Is there a new proposal that I've
> missed?

So, it's exactly what I aim to work: a proposal to add 3D LUT to the
current range of DRM per-CRTC color properties. But I also need to
understand how this property will be mapped to AMD display once it
exists in the DRM framework.

One of the things that caught my attention after seeing the attached
picture is the position of 3D LUT. I was expecting to see the 3D LUT
correction after gamma correction. Is this position a particularity of
DCN 3.0 (that varies between hw) or was I expecting a wrong color
correction pipeline at all?

Melissa

[1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+ren=
esas@ideasonboard.com/
[2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17cbb4=
656fe23e69
>=20
> I'm thinking of putting a 3D LUT proposal together but haven't gotten aro=
und
> to it yet. We'll want a pre-blending 3D LUT, and possible a programmable
> post-blending one as well.
>=20
> Thanks,
> Harry
>=20
> > step of color correction, I don't see how to accommodate it in the
> > mapping above, but I see DC already supports programming 3D LUT on DPP.
> > Once DRM has the 3D LUT interface and DM mapped it as a DPP property,
> > the 3D LUT will be at the end of the color correction pipeline? Is there
> > anything I need to worry about mapping DRM 3D LUT support? Or any
> > advice?
> >=20
> > Thanks in advance,
> >=20
> > Melissa



--h6wjzxgbx56uj4c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJhrmYACgkQwqF3j0dL
ehwNLhAAkuCOZIaCGV+5ZE8MvvuIMj872HViTTSOqJGELsqLNP5suGFoJHd209jD
CDDzKd5lfRdKWOSMY/U3XV3uvlYU21U01RgBZD2hmvBbLaPWwLSjX061bIu1gkLk
jHefXRfve6LeeTd+XeXnsz/5aYqUg7aQgGGlZZMez5lv78uhFOE4Ekxg7j/zHiYA
v4hOq1etxrZDVAoaQ6t1FmpT2CZh/yhQNxuf81w7ZdlReLeHm+ilj3z8rENK/xhg
KvuNKGTSALrCGt9TwFqqtQ6Ehy7b9K9dcQCovAzxu37KG8Z9yFAMPA7Sh99O9y7o
bDr+mOn9iUnQRUm+Hgary6LaL5LaSMynWNkDpyjJ8sdlbnufIJX4KoKhrrYkirro
SQjeTklgkaZoq7vgGGoefETc8qLzUsnvNexfHgR4rcmNTO9eCLlg80jwETuS/d9b
ad4IXzrcayIp455NODaSr8My2GZKjgx5Ti7qSNPxgQxnAX0zc7mPZGQQmSoHKrXQ
1VcEED6e+JBiNoHXzLBZZQ8xcXQ0t/eopzUik3LXAmOAMcqNi8DiCWE7Z2DQvAlh
42jh6tVICmUtV6O9EuGt9vp3NV8anJ5mBZpXQf9Pu0JOXpmORvsjfMpFdWKCi2vB
SjlUoCQk1wS6L3hb5wm/uBu/Nmn2cNv9m0KUcV2w56Dz755CcLc=
=k+M4
-----END PGP SIGNATURE-----

--h6wjzxgbx56uj4c2--
