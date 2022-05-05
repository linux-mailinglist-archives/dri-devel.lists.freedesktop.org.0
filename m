Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDDD51CBE5
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576FC8941E;
	Thu,  5 May 2022 22:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4A310E563;
 Thu,  5 May 2022 22:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5O6Rg64oxC0I0U5hEfSEBOBosw3ROHjBXvmRhRtxY5o=; b=QdeCdRUhKzVTKfxZ1ks5YzLp++
 /QK70GYtlzAgYRTxneVhqA/1mJ9zIAAdLNSQ4He+KewSDXBH7EGEKuC2PehiQVZx/u3BS8g8A6iVV
 mcomDUSpqzP2bQHi66m8A3jvJ2Eo9VOsbB/2pd1gcW72NQj/3tdkM4fDhYBW+7hJUMmU/QnxHaQpO
 evdEsX/0jnPxaDBL48WL3F1lNMVsGxmetsM9pO3umHjGX3Ps6QuaSiVVmMG7hfkazKpfZZho230Es
 O2eUFS0tO0H8/sxwmNCikFDsAIfLqg67tJKTfZgW7XrychdT73Lt9WDe1yLsaQNwWpM4hgLh5O8kz
 wUY/bYWw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nmjdv-0009Vi-Jp; Fri, 06 May 2022 00:08:15 +0200
Date: Thu, 5 May 2022 21:07:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: AMD display drivers handling DRM CRTC color mgmt props
Message-ID: <20220505220744.3sex7ka2ha2vcguv@mail.igalia.com>
References: <20220421143747.247mohbio436ivqo@mail.igalia.com>
 <06891dd7-b2f4-ece6-b1a5-b9ad15f5f899@amd.com>
 <20220421191945.yn4plwv757jlri2n@mail.igalia.com>
 <b94504d9-4d19-5663-f67d-7b1376827335@amd.com>
 <20220422142811.dm6vtk6v64jcwydk@mail.igalia.com>
 <349e170a-9121-900d-88b3-87eb9a7d2cd5@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rlhfzygtrm4amjgv"
Content-Disposition: inline
In-Reply-To: <349e170a-9121-900d-88b3-87eb9a7d2cd5@amd.com>
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
 kernel-dev@igalia.com, alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rlhfzygtrm4amjgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/22, Harry Wentland wrote:
>=20
>=20
> On 2022-04-22 10:28, Melissa Wen wrote:
> > On 04/21, Harry Wentland wrote:
> > >=20
> > >=20
> > > On 2022-04-21 15:20, Melissa Wen wrote:
> > > > On 04/21, Harry Wentland wrote:
> > > > >=20
> > > > >=20
> > > > > On 2022-04-21 10:37, Melissa Wen wrote:
> > > > > > Hi all,
> > > > > >=20
> > > > > > I'm examining how DRM color management properties (degamma, ctm=
, gamma)
> > > > > > are applied to AMD display drivers. As far I could understand t=
hanks
> > > > > > Nicholas documentation on amdgpu_dm/amdgpu_dm_color, DC drivers=
 have
> > > > > > per-plane color correction features:
> > > > > >=20
> > > > Hi Harry,
> > > >=20
> > > > Wow, thanks so much for all details!
> > > > >=20
> > > > > DC programs some of the color correction features pre-blending but
> > > > > DRM/KMS has not per-plane color correction properties.
> > > > >=20
> > > > > See this series from Uma Shankar for an RFC on how to introduce t=
hose
> > > > > properties for 1D LUTs and CSC matrix:
> > > > > https://patchwork.freedesktop.org/series/90826/
> > > > >=20
> > > > > Bhanuprakash has a series of IGT tests for these properties:
> > > > > https://patchwork.freedesktop.org/series/96895/
> > > > >=20
> > > > > I've rebased these on amd-staging-drm-next and maintain a kernel =
and IGT
> > > > > branch with these patches:
> > > > > https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-h=
dr
> > > > > https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/col=
or-and-hdr
> > > > >=20
> > > > > We've had many discussions with Weston guys on this. In order to =
merge the
> > > > > kernel properties we need a canonical userspace implementation th=
at are
> > > > > using it. Weston guys are working towards that but if you want to=
 suggest a
> > > > > different userspace to serve as that vehicle I'd be all ears. :)
> > > > >=20
> > > > > Note that in order to show this all working we also need a Waylan=
d Protocol
> > > > > update.
> > > > >=20
> > > > > See
> > > > > https://gitlab.freedesktop.org/pq/color-and-hdr
> > > > > https://gitlab.freedesktop.org/swick/wayland-protocols
> > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> > > >=20
> > > > So, I've followed these discussions (until the issue on naming) bec=
ause
> > > > initially I considered it addresses our current goals for color
> > > > correction. But after some discussions, what we are targeting is a =
3D
> > > > LUT after blending (per-CRTC). I found past proposals on dri-devel
> > > > [1][2] to extend the DRM CRTC color management properties, but they
> > > > didn't move forward and were never applied.
> > > >=20
> > >=20
> > > They're stuck in limbo until we have an upstream userspace
> > > implementation that's making use of them.
> >=20
> > Yes... afaiu, the basic requirements for all of these changes are IGT
> > tests + open userspace usage, right?
> >=20
>=20
> Correct. See [1] and [2].
>=20
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#requirements
> [2] https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-=
userspace-requirements
>=20
> > >=20
> > > > >=20
> > > > > > * - Input gamma LUT (de-normalized)
> > > > > > * - Input CSC (normalized)
> > > > > > * - Surface degamma LUT (normalized)
> > > > > > * - Surface CSC (normalized)
> > > > > > * - Surface regamma LUT (normalized)
> > > > > > * - Output CSC (normalized)
> > > > > > so DM is "adapting" those DRM per-CRTC properties to fit into t=
hree of
> > > > > > these color correction stages, which I guess are the surface st=
ages:
> > > > > >=20
> > > > > > * - Surface degamma LUT (normalized)
> > > > > > * - Surface CSC (normalized)
> > > > > > * - Surface regamma LUT (normalized)
> > > > > >=20
> > > > > > I'm trying to understand what this mapping is doing. A comment =
mentions
> > > > > > that is not possible to do these color corrections after blendi=
ng, so,
> > > > > > the same color correction pipe is performed on every plane befo=
re
> > > > > > blending?  (is the surface the plane?) Does this adaptation aff=
ect the
> > > > > > expected output?  Moreover, is there something that I misunders=
tood? :)
> > > > > >=20
> > > > >=20
> > > > > What's possible to do before and after blending has changed quite=
 a bit
> > > > > between DCN generations. We program the CRTC Gamma and CTM after =
blending.
> > > > > See attached picture for a view relating the color bits between t=
he DRM
> > > > > interface, DC interface and DCN 3.0 HW blocks.
> > > >=20
> > > > This picture is really enlightening, thanks!
> > > > You said it changes between generations, therefore, I can't conside=
r the
> > > > DCN 2.x family follow the same mapping, right? If so, can you share=
 the
> > > > main differences for a DCN 2.x regarding per-CRTC properties?
> > > >=20
> > >=20
> > > See attached diagram for DCN 2.0.
> >=20
> > Thanks again!
> >=20
> > >=20
> > > > >=20
> > > > > > That said, if the DRM color mgmt supports per-CRTC 3D LUT as th=
e last
> > > > >=20
> > > > > Where do you see 3D LUT support in DRM? Is there a new proposal t=
hat I've
> > > > > missed?
> > > >=20
> > > > So, it's exactly what I aim to work: a proposal to add 3D LUT to the
> > > > current range of DRM per-CRTC color properties. But I also need to
> > > > understand how this property will be mapped to AMD display once it
> > > > exists in the DRM framework.
> > > >=20
> > >=20
> > > Ah, nice to see. :)
> > >=20
> > > > One of the things that caught my attention after seeing the attached
> > > > picture is the position of 3D LUT. I was expecting to see the 3D LUT
> > > > correction after gamma correction. Is this position a particularity=
 of
> > > > DCN 3.0 (that varies between hw) or was I expecting a wrong color
> > > > correction pipeline at all?
> > > >=20
> > >=20
> > > Before DCN 3.0 there was no 3D LUT after blending.
> > >=20
> > By comparing these diagrams, I'm curious: in case we have a per-CRTC 3D
> > LUT support on DRM, DCN 2.0 generations would initially map this
> > property as a pre-blending property on DPP (currently the same approach
> > for CTM, for example), right? But after we also have a per-plane color
> > management property, those per-CRTC property would be ignored? And how
> > about degamma for both generations? No problem if there isn't an answer
> > yet (many if's), but it may help me to think of a more generic solution.
> >=20
>=20
> We'll need to define what the expectations are for the API implementations
> in DRM drivers, as well as for the implementing userspace.
>=20
> The way I think about this it might make sense to introduce a 3D LUT on a
> drm_plane, as well as on drm_crtc and a driver exposes whatever HW suppor=
ts.
> Userspace can then figure out what it can use based on driver support.
>=20
> It should be possible to use pre-blending 3D LUTs to accomplish the same =
as
> a post-blending 3D LUT, but we might need the ability to linearize before
> blending, but after applying the 3D LUT, and de-linearize after blending
> again. Something like this:
>=20
> 3dlut > linearize (1dlut) > blend > de-linearize (1dlut) > output
>=20
> Instead of this for the post-blending 3dlut:
>=20
> linearize (1dlut) > blend > de-linearize (1dlut) > 3dlut > output
>=20
> Though it depends a bit on the color model in the compositor or rendering
> app.

Sorry for the delay in reply, and thanks for explaining this behavior.

So, this topic of some DRM CRTC properties being programmed as
pre-blending came to my mind again when looking at the diagrams you
kindly shared before. Although DCN 2.0 doesn't have a post-blending CTM,
I see DCN 3.0 supports CTM pre and post blending (Gamut Remap), right?
But I also see stream->gamut_remap_matrix linked to DPP gamut remap in
the diagram.

AFAIU, CTM property on DCN 3.0 takes the same path from 2.0 and is only
managed by dpp_set_gamut_remap. I think CTM mapping to
stream->gamut_remap_matrix can be reprogrammed to mpc->set_gamut_remap
for DCN 3.0. I wonder if I can work on this reconnection to avoid
unexpected behavior (wiring DRM CRTC CTM to MPC instead of the current
DPP programming).=20
So, is there any reason to not wired CTM to MPC on the DCN 3.0 driver?
Or, again, am I missing some part of the code about it?

Thanks,

Melissa

>=20
> > > Note in the diagram that our HW (and DC interface) have a Shaper
> > > LUT available before the 3D LUT. You could expose if you want to
> > > shape your content post-blending before applying the 3D LUT.
> > >=20
> > > The 3D LUT is most effective when it's in non-linear space. Currently
> > > DRM has no way to specify a way for drm_plane to be linearized (see n=
otes
> > > (1) and (2)) so it is assumed that you're blending in non-linear spac=
e and
> > > therefore your pixels would already be non-linear going into your 3D =
LUT.
> > >=20
> > > (1) unless you use the drm_plane PWL API that was proposed
> > > (2) amdgpu_dm is currently setting the drm_crtc degamma LUT on the
> > >      DC plane. This might lead to unexpected behavior when using
> > >      multiple planes (though I believe gamescope is making use of
> > >      this behavior).
> >=20
> > Thanks for raising these points. In fact, I was considering unexpected
> > behavior when I saw this DRM <-> DC mapping. >>
> > > Have you looked at [1] yet? It might provide a good example on how to
> > > define a 3D LUT. For AMD HW you'll want a 17x17x17 LUT.
> > >=20
> > > [1] http://intel.github.io/libva/structVAProcFilterParameterBuffer3DL=
UT.html
> >=20
> > Not yet, but it seems helpful. I'll take as a reference... until now,
> > I've only examined details on DC drivers.
> >=20
>=20
> Sounds great.
>=20
> Harry
>=20
> > Thanks,
> >=20
> > Melissa
> >=20
> > >=20
> > > Harry
> > >=20
> > > > Melissa
> > > >=20
> > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinc=
hart+renesas@ideasonboard.com/
> > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5b=
dc17cbb4656fe23e69
> > > > >=20
> > > > > I'm thinking of putting a 3D LUT proposal together but haven't go=
tten around
> > > > > to it yet. We'll want a pre-blending 3D LUT, and possible a progr=
ammable
> > > > > post-blending one as well.
> > > > >=20
> > > > > Thanks,
> > > > > Harry
> > > > >=20
> > > > > > step of color correction, I don't see how to accommodate it in =
the
> > > > > > mapping above, but I see DC already supports programming 3D LUT=
 on DPP.
> > > > > > Once DRM has the 3D LUT interface and DM mapped it as a DPP pro=
perty,
> > > > > > the 3D LUT will be at the end of the color correction pipeline?=
 Is there
> > > > > > anything I need to worry about mapping DRM 3D LUT support? Or a=
ny
> > > > > > advice?
> > > > > >=20
> > > > > > Thanks in advance,
> > > > > >=20
> > > > > > Melissa
> > > >=20
> > > >=20
> >=20
> >=20

--rlhfzygtrm4amjgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ0SqoACgkQwqF3j0dL
ehxLtQ//UfJsO169zJ7W7ngWdtqfRCemWrPjpk8CYypv3ThdMRBvmuulTqNloIAq
KIFvaqtcV9BwhlZzEU38/bR2OGBdBsYiRgeXmzERgpBn+OHCPCSRIpmKQHZP8XRK
0+/0emThjxfuC7p3TZHtjkT8xxR4wGTwkOeUIVNPjs5/Nt7Tj5QXWa77W9YdnjdZ
Y9cj7/jzhsNPFq1kkBufkIMnvMeiFCconUqNLSQ4cD70IkgKPZ9R7GQZQpyJERN0
CLat9wMu2FXFy4HNpjhipzW8o9wI5OBoD5OliNCE8LAssw0IbeUIa+H8DtAuCwm3
fvBxcQyaInL3w3g6FGKnklZU8dlpvtqTGxJfFlEL5S9BjZKskhjzJ08a54TX8A1J
xh9H9LFlpuDTBdrL096KWczVTMfD8ADkflSLBHhFcnx/z+S6YakLdoWflcnUq9NA
QcrZ1bQlH4hpVL3OjEqwswiN1A+HLFI/ktaA/t4oTtNohknoZDEKltdQTRQATLSg
hWfl7J4eW+Q/oiZbAQl7dNkNZEaafFeITTDag6fTE5ZE0HPVz1K9oKFNchg4+XPL
LK1gijIwOe8FEeNVRAf48hfSRGPwotKbyaqheab9Fx4bXTGdMX3/2DNZXbhK9EpA
W4QhNHsF9GYPnnlIk7O7MIWv5mPi3tOoVx3BxtXJeG2Y8nwjnU8=
=BDfK
-----END PGP SIGNATURE-----

--rlhfzygtrm4amjgv--
