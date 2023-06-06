Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC912724A34
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111110E243;
	Tue,  6 Jun 2023 17:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBCC10E243;
 Tue,  6 Jun 2023 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pxWzUDNhz7WLm6/+mvF3WeeJdWsnVxk4OskB3hHJXOE=; b=gUFmbIFjAj/DspnDrB/HPjwjzs
 fDRfe8mnUPvAJa1b1oFCBgrDH0TCOtFX3QRNP5b5pblsN5bwkL62N8VJoi5bQxYY3o1udw6M1VZPr
 g7nSdbErK+o2vLRY3R84PwoI1bl0M5XRaRtLC4dzTzjUU6OnQ4ziFLRs0HFY0gFYaarrYMsIYxWnC
 Usq8N5b27HB9agYS9ItmXbmUZbz22szCYZx3+aBD7ID78yx9Q0xM74dJdn75nT5a9AYHC4YpAEHxV
 TxaMhVAspNLUdPiEa3ri06i7jgyFVyVovaVuuDoiIIo8bqFzBfiUIQzkm06+AhXLNGt2WY4LVqxyk
 OLQLoaAQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q6aV3-009ca7-PC; Tue, 06 Jun 2023 19:29:41 +0200
Date: Tue, 6 Jun 2023 16:29:30 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 00/36] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Message-ID: <20230606172930.yjmigolm4hk5s6dn@mail.igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <17ff8d91-5f6f-816c-f5da-08b04155dce8@amd.com>
 <20230606172258.zoss7pdkukssjw2n@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="igtsttn4dxbehab6"
Content-Disposition: inline
In-Reply-To: <20230606172258.zoss7pdkukssjw2n@mail.igalia.com>
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
Cc: christian.koenig@amd.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 sunpeng.li@amd.com, kernel-dev@igalia.com, tzimmermann@suse.de,
 Alex Hung <alex.hung@amd.com>, mripard@kernel.org, sungjoon.kim@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--igtsttn4dxbehab6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/06, Melissa Wen wrote:
> On 06/02, Harry Wentland wrote:
> >=20
> >=20
> > On 5/23/23 18:14, Melissa Wen wrote:
> > > This series is a refined version of our RFC [1] for AMD driver-specif=
ic
> > > color management properties. It is a collection of contributions from
> > > Joshua, Harry and I to enhance AMD KMS color pipeline for Steam
> > > Deck/SteamOS by exposing the large set of color caps available in AMD
> > > display HW.
> > >=20
> > > Considering RFC feedback, this patchset differs from the previous one=
 by
> > > removing the KConfig option and just guarding driver-specific propert=
ies
> > > with `AMD_PRIVATE_COLOR` - but we also removed the guards from intern=
al
> > > elements and operations. We stopped to advertise CRTC shaper and 3D L=
UTs
> > > properties since they aren't in use in the Steam Deck color pipeline[=
2].
> > > On the other hand, we keep mapping CRTC shaper and 3D LUTs (DM) to DC
> > > MPC setup. We also improved curve calculations to take into account HW
> > > color caps.
> > >=20
> > > In short, for pre-blending, we added the following properties:
> > > - plane degamma LUT and predefined transfer function;
> > > - plane HDR multiplier
> > > - plane shaper LUT/transfer function;
> > > - plane 3D LUT; and finally,
> > > - plane blend LUT/transfer function, just before blending.
> > >=20
> > > After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> > > therefore, we extend post-blending color pipeline with CRTC gamma
> > > transfer function.
> > >=20
> > > The first three patches are on DRM KMS side. We expose DRM property
> > > helper for blob lookup and replacement so that we can use it for
> > > managing driver-specific properties. We add a tracked for plane color
> > > mgmt changes and increase the maximum number of properties to
> > > accommodate this expansion.
> > >=20
> > > The userspace case here is Gamescope which is the compositor for
> > > SteamOS. It's already using all of this functionality to implement its
> > > color management pipeline right now [3].
> > >=20
> > > Current IGT tests kms_color and amdgpu/amd_color on DCN301 and DCN21 =
HW
> > > preserve the same results with and without the guard.=20
> > >=20
> > > Finally, I may have missed something, please let me know if that's the
> > > case.
> > >=20
> >=20
> > Looks like we're on the right track with this.
> >=20
> > Patches 1-3, 15, 17, 24-31, 33-35 are
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>=20
> Thanks!
>=20
> >=20
> > I left comments on a bunch of the other patches. Let's replace drm_
> > prefices with amdgpu_ or amdgpu_dm and move the property registration/
> > definition from amdgpu_display.c to amdgpu_dm_color.c.
>=20
> Okay.
>=20
> >=20
> > I'll chase internal feedback for some of the DC patches. They look fine
> > to me but I don't want them to cause problems on other OSes. I might
> > pull them through our internal repo. Will update you on that.
> >=20
> > Patches 16-22 will be untested without properties to actually set them.
> > That makes me a bit uncomfortable but on the other hand they provide
> > functionality that we'll want eventually. Let me think about them a bit
> > more and also make sure the DC portions won't cause issues.
>=20
> Okay. I'll rework these patches to isolate them from the properties we
> are exposing. I can move it to the end of the patch or I can detach from
s/the patch/this series

> this series and send them in a separate version. Probably the latter
> makes more sense.
>=20
> Thanks for reviewing this long series. I'll prepare a next version
> addressing all sugestions.
>=20
> Melissa
>=20
> >=20
> > Harry
> >=20
> > > Best Regards,
> > >=20
> > > Melissa Wen
> > >=20
> > > [1] https://lore.kernel.org/dri-devel/20230423141051.702990-1-mwen@ig=
alia.com
> > > [2] https://github.com/ValveSoftware/gamescope/blob/master/src/docs/S=
team%20Deck%20Display%20Pipeline.png
> > > [3] https://github.com/ValveSoftware/gamescope
> > >=20
> > >=20
> > > Harry Wentland (2):
> > >   drm/amd/display: fix segment distribution for linear LUTs
> > >   drm/amd/display: fix the delta clamping for shaper LUT
> > >=20
> > > Joshua Ashton (13):
> > >   drm/amd/display: add plane degamma TF driver-specific property
> > >   drm/amd/display: add plane HDR multiplier driver-specific property
> > >   drm/amd/display: add plane blend LUT and TF driver-specific propert=
ies
> > >   drm/amd/display: copy 3D LUT settings from crtc state to stream_upd=
ate
> > >   drm/amd/display: dynamically acquire 3DLUT resources for color chan=
ges
> > >   drm/amd/display: add CRTC regamma TF support
> > >   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
> > >   drm/amd/display: add support for plane degamma TF and LUT properties
> > >   drm/amd/display: add dc_fixpt_from_s3132 helper
> > >   drm/adm/display: add HDR multiplier support
> > >   drm/amd/display: handle empty LUTs in __set_input_tf
> > >   drm/amd/display: add DRM plane blend LUT and TF support
> > >   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/=
HLG
> > >=20
> > > Melissa Wen (21):
> > >   drm/drm_mode_object: increase max objects to accommodate new color
> > >     props
> > >   drm/drm_property: make replace_property_blob_from_id a DRM helper
> > >   drm/drm_plane: track color mgmt changes per plane
> > >   drm/amd/display: add CRTC driver-specific property for gamma TF
> > >   drm/amd/display: add plane driver-specific properties for degamma L=
UT
> > >   drm/amd/display: add plane 3D LUT driver-specific properties
> > >   drm/amd/display: add plane shaper LUT driver-specific properties
> > >   drm/amd/display: add plane shaper TF driver-private property
> > >   drm/amd/display: add comments to describe DM crtc color mgmt behavi=
or
> > >   drm/amd/display: encapsulate atomic regamma operation
> > >   drm/amd/display: update lut3d and shaper lut to stream
> > >   drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
> > >   drm/amd/display: handle MPC 3D LUT resources for a given context
> > >   drm/amd/display: add CRTC 3D LUT support
> > >   drm/amd/display: add CRTC shaper LUT support
> > >   drm/amd/display: add CRTC shaper TF support
> > >   drm/amd/display: mark plane as needing reset if plane color mgmt
> > >     changes
> > >   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
> > >   drm/amd/display: reject atomic commit if setting both plane and CRTC
> > >     degamma
> > >   drm/amd/display: program DPP shaper and 3D LUT if updated
> > >   drm/amd/display: add plane shaper/3D LUT and shaper TF support
> > >=20
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 125 ++++
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  69 ++
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  28 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 110 +++-
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 612 ++++++++++++++++=
--
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++-
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 213 +++++-
> > >  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
> > >  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> > >  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 107 ++-
> > >  .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
> > >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
> > >  .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
> > >  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
> > >  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
> > >  drivers/gpu/drm/drm_atomic.c                  |   1 +
> > >  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
> > >  drivers/gpu/drm/drm_property.c                |  49 ++
> > >  include/drm/drm_mode_object.h                 |   2 +-
> > >  include/drm/drm_plane.h                       |   7 +
> > >  include/drm/drm_property.h                    |   6 +
> > >  22 files changed, 1416 insertions(+), 140 deletions(-)
> > >=20
> >=20



--igtsttn4dxbehab6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmR/bPoACgkQwqF3j0dL
ehyCWg/9FGye11Ac7T8m3uGG9Vf68ry9xYbpR6NJp3PbS+dvAKFqSIl5Fmf2z02C
xf9S9gMZJ/y3F3V/qpfvjb3OIXCYA+u/uKlpGhe933DJq6USBroUK+GPr1He8BFQ
N9NzCIGrX0AxWiKfeswK7KCPF7tbjmFXahJjcZqae73jN8Czh4xoRSxtp7lQJxI4
jcmu01N64pEH1lpOViGyV5OtwpH24osknDjJ2nokIh4oQ2TKuDE0HINgcHHtVA3Q
1SGXOwMcyMGy0vk/IVJoqjqbJ04GWCrF45Xy0KEIlltN5D0UyS3PJ+wvk+e8vqkv
mzPjMTlLAOF8NVdhS7ZuLyvyl+mkopdi9vnkD1NTG1x4KbRLc2wZoD7UjmoRun8i
LHsZcGAgZZBhv9Ya4+hVlFFJz3m00jYELSgll+ZsA5Gc6uJDON96PVn7V7pO2qHs
8z06aRffz8vl+5mW3EHqu3wkKAvx1kjbtWGAr0OQ7cz6XhrYGRrgbVEYGeAHrDQg
ErOCnzUAZDDujqtcdbfgrdX3c774AnnnExVF1VFO8SnVx24WOvpDGIKJbh3Ejfd2
tdXd+zMABw2mlbc+pA0IZkMPLBzcYxnbg0PYBeQJhGmA2FuvRiLUU7t9Lkw8i7So
Y9AnbEhuoo72UMYNLXipKxEMnTuKNZZxzZIBHaEqm25Gzk5gpSY=
=ZsYH
-----END PGP SIGNATURE-----

--igtsttn4dxbehab6--
