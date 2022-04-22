Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B250BA15
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD68B10E132;
	Fri, 22 Apr 2022 14:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52C010E132;
 Fri, 22 Apr 2022 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9nJGD0ALpi4ZEslTLhyAFX8KcdFr5YqB5pf4RusRpVE=; b=nki5xphEufnUq9lwcMt6UGIttX
 4LFqniQ3EPwNVMb/pI7Cvut+W0czlW+j9DXVTazgzpdWc1GxGqD9UYFQYvNcCsOTFdYfisAQsf+CL
 MXnvvBIHmsBhKHSjXbi5+c3o8KWu87Wqr0jOzwHIH1vFTXvw6DXCTnZ5/bHG6Fp+ZMh45RhqrKVP9
 3tsZtyocmRAXjSVQw8HCl/yhjD71JMn+BvYTLB5BtfLAEciruPzrJ0SXeAbeIYnJRXB1E57QEYw3X
 uE9xfajZvr9qOrm3r0VwkwKaY+vdiLwYUFkDNQQWiqxihdd4E280zXhdvXHQ+lEL6RHvPR043m8Xu
 2QTQ/9dA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nhuGn-0004Yx-CO; Fri, 22 Apr 2022 16:28:25 +0200
Date: Fri, 22 Apr 2022 13:28:11 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: AMD display drivers handling DRM CRTC color mgmt props
Message-ID: <20220422142811.dm6vtk6v64jcwydk@mail.igalia.com>
References: <20220421143747.247mohbio436ivqo@mail.igalia.com>
 <06891dd7-b2f4-ece6-b1a5-b9ad15f5f899@amd.com>
 <20220421191945.yn4plwv757jlri2n@mail.igalia.com>
 <b94504d9-4d19-5663-f67d-7b1376827335@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6cvtn3wedhuoalan"
Content-Disposition: inline
In-Reply-To: <b94504d9-4d19-5663-f67d-7b1376827335@amd.com>
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
Cc: Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6cvtn3wedhuoalan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/21, Harry Wentland wrote:
>=20
>=20
> On 2022-04-21 15:20, Melissa Wen wrote:
> > On 04/21, Harry Wentland wrote:
> > >=20
> > >=20
> > > On 2022-04-21 10:37, Melissa Wen wrote:
> > > > Hi all,
> > > >=20
> > > > I'm examining how DRM color management properties (degamma, ctm, ga=
mma)
> > > > are applied to AMD display drivers. As far I could understand thanks
> > > > Nicholas documentation on amdgpu_dm/amdgpu_dm_color, DC drivers have
> > > > per-plane color correction features:
> > > >=20
> > Hi Harry,
> >=20
> > Wow, thanks so much for all details!
> > >=20
> > > DC programs some of the color correction features pre-blending but
> > > DRM/KMS has not per-plane color correction properties.
> > >=20
> > > See this series from Uma Shankar for an RFC on how to introduce those
> > > properties for 1D LUTs and CSC matrix:
> > > https://patchwork.freedesktop.org/series/90826/
> > >=20
> > > Bhanuprakash has a series of IGT tests for these properties:
> > > https://patchwork.freedesktop.org/series/96895/
> > >=20
> > > I've rebased these on amd-staging-drm-next and maintain a kernel and =
IGT
> > > branch with these patches:
> > > https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-hdr
> > > https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/color-a=
nd-hdr
> > >=20
> > > We've had many discussions with Weston guys on this. In order to merg=
e the
> > > kernel properties we need a canonical userspace implementation that a=
re
> > > using it. Weston guys are working towards that but if you want to sug=
gest a
> > > different userspace to serve as that vehicle I'd be all ears. :)
> > >=20
> > > Note that in order to show this all working we also need a Wayland Pr=
otocol
> > > update.
> > >=20
> > > See
> > > https://gitlab.freedesktop.org/pq/color-and-hdr
> > > https://gitlab.freedesktop.org/swick/wayland-protocols
> > > https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> >=20
> > So, I've followed these discussions (until the issue on naming) because
> > initially I considered it addresses our current goals for color
> > correction. But after some discussions, what we are targeting is a 3D
> > LUT after blending (per-CRTC). I found past proposals on dri-devel
> > [1][2] to extend the DRM CRTC color management properties, but they
> > didn't move forward and were never applied.
> >=20
>=20
> They're stuck in limbo until we have an upstream userspace
> implementation that's making use of them.

Yes... afaiu, the basic requirements for all of these changes are IGT
tests + open userspace usage, right?

>=20
> > >=20
> > > > * - Input gamma LUT (de-normalized)
> > > > * - Input CSC (normalized)
> > > > * - Surface degamma LUT (normalized)
> > > > * - Surface CSC (normalized)
> > > > * - Surface regamma LUT (normalized)
> > > > * - Output CSC (normalized)
> > > > so DM is "adapting" those DRM per-CRTC properties to fit into three=
 of
> > > > these color correction stages, which I guess are the surface stages:
> > > >=20
> > > > * - Surface degamma LUT (normalized)
> > > > * - Surface CSC (normalized)
> > > > * - Surface regamma LUT (normalized)
> > > >=20
> > > > I'm trying to understand what this mapping is doing. A comment ment=
ions
> > > > that is not possible to do these color corrections after blending, =
so,
> > > > the same color correction pipe is performed on every plane before
> > > > blending?  (is the surface the plane?) Does this adaptation affect =
the
> > > > expected output?  Moreover, is there something that I misunderstood=
? :)
> > > >=20
> > >=20
> > > What's possible to do before and after blending has changed quite a b=
it
> > > between DCN generations. We program the CRTC Gamma and CTM after blen=
ding.
> > > See attached picture for a view relating the color bits between the D=
RM
> > > interface, DC interface and DCN 3.0 HW blocks.
> >=20
> > This picture is really enlightening, thanks!
> > You said it changes between generations, therefore, I can't consider the
> > DCN 2.x family follow the same mapping, right? If so, can you share the
> > main differences for a DCN 2.x regarding per-CRTC properties?
> >=20
>=20
> See attached diagram for DCN 2.0.

Thanks again!

>=20
> > >=20
> > > > That said, if the DRM color mgmt supports per-CRTC 3D LUT as the la=
st
> > >=20
> > > Where do you see 3D LUT support in DRM? Is there a new proposal that =
I've
> > > missed?
> >=20
> > So, it's exactly what I aim to work: a proposal to add 3D LUT to the
> > current range of DRM per-CRTC color properties. But I also need to
> > understand how this property will be mapped to AMD display once it
> > exists in the DRM framework.
> >=20
>=20
> Ah, nice to see. :)
>=20
> > One of the things that caught my attention after seeing the attached
> > picture is the position of 3D LUT. I was expecting to see the 3D LUT
> > correction after gamma correction. Is this position a particularity of
> > DCN 3.0 (that varies between hw) or was I expecting a wrong color
> > correction pipeline at all?
> >=20
>=20
> Before DCN 3.0 there was no 3D LUT after blending.
>
By comparing these diagrams, I'm curious: in case we have a per-CRTC 3D
LUT support on DRM, DCN 2.0 generations would initially map this
property as a pre-blending property on DPP (currently the same approach
for CTM, for example), right? But after we also have a per-plane color
management property, those per-CRTC property would be ignored? And how
about degamma for both generations? No problem if there isn't an answer
yet (many if's), but it may help me to think of a more generic solution.

> Note in the diagram that our HW (and DC interface) have a Shaper LUT
> available before the 3D LUT. You could expose if you want to shape your
> content post-blending before applying the 3D LUT.
>=20
> The 3D LUT is most effective when it's in non-linear space. Currently
> DRM has no way to specify a way for drm_plane to be linearized (see notes
> (1) and (2)) so it is assumed that you're blending in non-linear space and
> therefore your pixels would already be non-linear going into your 3D LUT.
>=20
> (1) unless you use the drm_plane PWL API that was proposed
> (2) amdgpu_dm is currently setting the drm_crtc degamma LUT on the
>     DC plane. This might lead to unexpected behavior when using
>     multiple planes (though I believe gamescope is making use of
>     this behavior).

Thanks for raising these points. In fact, I was considering unexpected
behavior when I saw this DRM <-> DC mapping.
>=20
> Have you looked at [1] yet? It might provide a good example on how to
> define a 3D LUT. For AMD HW you'll want a 17x17x17 LUT.
>=20
> [1] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.h=
tml

Not yet, but it seems helpful. I'll take as a reference... until now,
I've only examined details on DC drivers.

Thanks,

Melissa

>=20
> Harry
>=20
> > Melissa
> >=20
> > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart=
+renesas@ideasonboard.com/
> > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17=
cbb4656fe23e69
> > >=20
> > > I'm thinking of putting a 3D LUT proposal together but haven't gotten=
 around
> > > to it yet. We'll want a pre-blending 3D LUT, and possible a programma=
ble
> > > post-blending one as well.
> > >=20
> > > Thanks,
> > > Harry
> > >=20
> > > > step of color correction, I don't see how to accommodate it in the
> > > > mapping above, but I see DC already supports programming 3D LUT on =
DPP.
> > > > Once DRM has the 3D LUT interface and DM mapped it as a DPP propert=
y,
> > > > the 3D LUT will be at the end of the color correction pipeline? Is =
there
> > > > anything I need to worry about mapping DRM 3D LUT support? Or any
> > > > advice?
> > > >=20
> > > > Thanks in advance,
> > > >=20
> > > > Melissa
> >=20
> >=20



--6cvtn3wedhuoalan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJiu3YACgkQwqF3j0dL
ehwQ6xAAiyYjV2cxCzEk6iF3KxmOM9dAvoXGNTv6cPlga3W9RADB86W773hCy0fw
aBqWIBsSb6uPJ2aMNd9/5NRhGc6LBqJGW2eU65IPOlvbgpeMI6kqSVDdeLDxGu8t
X/CfBkSShgg9ddph7g16rIgkH7sUMYIxj9CISzDeMwO/fg0iGMfERBItruOohBgW
bAOJ+78aO7Ey87oF+FFicsVNY4IccEb/aQq6KTbQgXdxJMvYPfscW7dxD8gA8P/o
W47bya9WSBd2O1H88OMN1y1utZmKcvQeIB1+RhvInbfuSoc3MJTTxbCsezoJqY2O
nSno18A8sN9mldeSx2K8ze8yvYwYx5PRUNa9t76vFB9U0d7EmqIRrPf0Eru2YMrO
U4JDHmNidLfFGR26Z8/BP7p2k4wUj4JkrVl9gzFPujVS7cJcoNbHeadAm0166/aB
udErf7mF/Rj4Sarj3/Bmo/ZqZXeEhLukNReEQmVj/RspAeCHJZqlHzKnbTNi0TH0
usRHVbldlYr9DKzfGAStSPjhPlxnqQAXBOuml6VnVutTzkh1VuEkJl8DG8Z5fhVn
Fd+UzzGn2GksXrGnTPdsL9Gbl9aTz2k8r4DwnLAQd04vd6HT7gt7QcifokF0uU5m
e4AOF9bIHQoGzV/SbtlAbfdPwTIve0MDypk+jWj74Eu5cllbFfM=
=ly/5
-----END PGP SIGNATURE-----

--6cvtn3wedhuoalan--
