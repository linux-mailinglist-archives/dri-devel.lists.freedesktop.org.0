Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817C26FCBB4
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C910E391;
	Tue,  9 May 2023 16:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A61510E391;
 Tue,  9 May 2023 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gUOMGVDgHNxRcxJ4t5X5LqeINkvLVC/0CtAIT4usfII=; b=YcDDRvwGTqsDflj0jyHwS1+Nif
 wRBf5D+mDXD1wDAgQGX6H33qXiv1JUc6egEz1Ql69lDLcmdVYv9+Ye/yP6CyChTbOEjzozhL8a51f
 Op+MWp1rrPRRsENYDfNg3EW94gGnhJT0dNivjBgKyfuRQRRb1S/1Kozdq09K7PvrFTRjPEsJSHCN4
 DqW0gj7Rw85Q7l7vp5RGx+GcmKnVAiRk3Cw6lom2QdB56oPWjXXSUnx/9ovszdScAjF9Vz/3o3XUv
 DltFCADbpQaZ1f8qx4KbfqYVLKNbsRXMa0GcwHruDYlYq42cZMjN36pfAx9V+oBa7i9MLsynfcKWB
 WcWEj1sw==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQZQ-0053EI-OD; Tue, 09 May 2023 18:52:12 +0200
Date: Tue, 9 May 2023 15:52:08 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 00/40] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Message-ID: <20230509165208.kaydnbcc22ejj72u@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <ba9b8a67-37a7-d924-d673-f716b3192bb8@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3t5ua6bs6pchjvmn"
Content-Disposition: inline
In-Reply-To: <ba9b8a67-37a7-d924-d673-f716b3192bb8@amd.com>
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
 tzimmermann@suse.de, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3t5ua6bs6pchjvmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
>=20
>=20
> On 4/23/23 10:10, Melissa Wen wrote:
> > Hi all,
> >=20
> > Joshua Ashton and I (with the great collaboration of Harry Wentland -
> > thanks) have been working on KMS color pipeline enhancement for Steam
> > Deck/SteamOS by exposing the large set of color caps available in AMD
> > display HW.
> >=20
>=20
> Thank you for your work on this.
>=20
> > This patchset results from this full-stack work, including pre-blending
> > and post-blending new color properties. The first two patches fix
> > quantization issues on shaper LUT programming. Just after, we have one
> > patch that adds a config option to restrict AMD colo feature usage. The
> > following 13 patches implement AMD driver-private color properties
> > (pending detachment of property counter and plane color_mgmt_changed
> > from DRM). Finally, the last 24 patches rework the AMD display manager
> > and color management to support the properties exposed.
> >=20
> > In short, for pre-blending, we added the following:
> > - plane degamma LUT and predefined transfer function;
> > - plane HDR multiplier
> > - plane shaper LUT/transfer function;
> > - plane 3D LUT; and finally,
> > - plane blend LUT/transfer function, just before blending.
> >=20
> > After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
> > therefore, we extend CRTC color pipeline with the following:
> > - CRTC shaper LUT/transfer function;
> > - CRTC 3D LUT; and
> > - CRTC gamma transfer function.
> >=20
> > You can already find the AMD color capabilities and color management
> > pipeline documented here:
> > https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager=
=2Ehtml#color-management-properties
> >=20
> > In previous iterations, we tried to provide a generic solution for
> > post-blending shaper and 3D LUT [1][2][3], and also Alex Hung worked on
> > a pre-blending 3D LUT solution[4] extending plane color mgmt proposal
> > from Uma Shankar [5]. However, we identified during our work [6] that
> > AMD provides many other valuable capabilities that we don't find in
> > other vendors, so we started to work on AMD driver-private color
> > properties that better describe its color pipeline, enabling us to
> > expose full AMD color capabilities on Deck HW.
> >=20
> > Our primary purpose is to avoid usage limitations of color calibration
> > features provided by HW just because we don't have an interface for
> > that. At the same time, a generic solution doesn't fit well since some
> > of these capabilities seem AMD HW specific, such as hardcoded
> > curve/predefined transfer function and shaper 1D LUTs sandwiching 3D
> > LUT.
> >=20
> > So far, we keep these properties' usage under an AMD display config
> > option (STEAM_DECK). However, we are fine with having them fully
> > available to other DCN HW generations. In the current proposal, we are
> > already checking ASICs before exposing a color feature. We can work on
> > 3D LUT resource acquisition details to fit them to DCN 3+ families that
> > support them. Indeed, before moving to these config boundaries, we
> > started working on an open solution for any AMD HW [7].
> >=20
>=20
> The problem with a CONFIG_XYZ option is that it becomes uAPI and can't be
> removed. I feel we have a good proposal going for the generic solution.
> Would it work for you if we don't make this a CONFIG_ option? What I mean
> is using
>=20
> #define AMD_PRIVATE_COLOR
>=20
> around the interface bits, which are only compiled when building with
> -DAMD_PRIVATE_COLOR

I think we can go with this approach for the properties already in use
by Gamescope/SteamOS.
>=20
> That way we have the option to rip the driver-private stuff out later
> while still allowing for experimentation now.
>=20
> Or, alternatively, we can merge everything but the stuff currently
> guarded by CONFIG_STEAM_DECK, so that custom kernels can enable this
> functionality by simply merging one patch that includes all the
> CONFIG_STEAM_DECK stuff.

An then we can drop the interface of things that Gamescope is not
managing, but keep those things already programmed on DM color for any
future usage. What do you think?

Melissa

>=20
> This will allow us to merge the vast majority of the code without
> having to maintain it in downstream repo.
>=20
> > The userspace case here is Gamescope which is the compositor for
> > SteamOS. It's already using all of this functionality (although with a
> > VALVE1_ prefix instead of AMD) to implement its color management
> > pipeline right now:
> > https://github.com/ValveSoftware/gamescope
> >=20
> > We are planning on shipping our color management support with gamut
> > mapping, HDR, SDR on HDR, HDR on SDR, and much more in Steam OS 3.5. A
> > brief overview of our color pipeline can be found here:
> > https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%2=
0Deck%20Display%20Pipeline.png
> >=20
> > We have also had some other userspace interests from Xaver Hugl (KDE) in
> > experimenting with these properties for their HDR/color bring-up before
> > a generic interface is settled on also.
> >=20
> > It still needs AMD-specific IGT tests; we are working on documentation
> > and adding plane CTM support too.=20
> >=20
> > We decided first to share our work to collect thoughts and open for
> > discussion, even with missing refinements, since driver-private
> > properties are not the usual DMR/KMS color management approach.
> >=20
> > Please, let us know your thoughts.
> >=20
>=20
> As discussed at the hackfest I think it's a good idea to have something
> that's easy to enable for the purposes of experimentation (and to
> help downstream users that help us figure out how this all fits
> together, i.e. SteamOS).
>=20
> Harry
>=20
> > Best Regards,
> >=20
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Melissa Wen<mwen@igalia.com>
> >=20
> > [1] https://lore.kernel.org/dri-devel/20220619223104.667413-1-mwen@igal=
ia.com/
> > [2] https://lore.kernel.org/amd-gfx/20220906164628.2361811-1-mwen@igali=
a.com/
> > [3] https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@iga=
lia.com/
> > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hun=
g@amd.com/
> > [5] https://lore.kernel.org/dri-devel/20210906213904.27918-1-uma.shanka=
r@intel.com/
> > [6] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-color-m=
gmt
> > [7] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-private=
-color-mgmt
> >=20
> > Harry Wentland (2):
> >   drm/amd/display: fix segment distribution for linear LUTs
> >   drm/amd/display: fix the delta clamping for shaper LUT
> >=20
> > Joshua Ashton (15):
> >   drm/amd/display: add CRTC gamma TF to driver-private props
> >   drm/amd/display: add plane degamma LUT driver-private props
> >   drm/amd/display: add plane degamma TF driver-private property
> >   drm/amd/display: add plane HDR multiplier driver-private property
> >   drm/amd/display: add plane blend LUT and TF driver-private properties
> >   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
> >   drm/amd/display: dynamically acquire 3DLUT resources for color changes
> >   drm/amd/display: add CRTC regamma TF support
> >   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
> >   drm/amd/display: add support for plane degamma TF and LUT properties
> >   drm/amd/display: add dc_fixpt_from_s3132 helper
> >   drm/adm/display: add HDR multiplier support
> >   drm/amd/display: handle empty LUTs in __set_input_tf
> >   drm/amd/display: add DRM plane blend LUT and TF support
> >   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
> >=20
> > Melissa Wen (23):
> >   drm/amd/display: introduce Steam Deck color features to AMD display
> >     driver
> >   drm/drm_mode_object: increase max objects to accommodate new color
> >     props
> >   drm/amd/display: add shaper LUT driver-private props
> >   drm/amd/display: add 3D LUT driver-private props
> >   drm/drm_plane: track color mgmt changes per plane
> >   drm/amd/display: move replace blob func to dm plane
> >   drm/amd/display: add plane 3D LUT driver-private properties
> >   drm/amd/display: add plane shaper LUT driver-private properties
> >   drm/amd/display: add plane shaper TF driver-private property
> >   drm/amd/display: add comments to describe DM crtc color mgmt behavior
> >   drm/amd/display: encapsulate atomic regamma operation
> >   drm/amd/display: update lut3d and shaper lut to stream
> >   drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
> >   drm/amd/display: handle MPC 3D LUT resources for a given context
> >   drm/amd/display: add CRTC 3D LUT support to amd color pipeline
> >   drm/amd/display: decouple steps to reuse in CRTC shaper LUT support
> >   drm/amd/display: add CRTC shaper LUT support to amd color pipeline
> >   drm/amd/display: add CRTC shaper TF support
> >   drm/amd/display: mark plane as needing reset if plane color mgmt
> >     changes
> >   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
> >   drm/amd/display: reject atomic commit if setting both plane and CRTC
> >     degamma
> >   drm/amd/display: add plane shaper/3D LUT and shaper TF support
> >   drm/amd/display: copy dc_plane color settings to surface_updates
> >=20
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 153 +++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  92 +++
> >  drivers/gpu/drm/amd/display/Kconfig           |   6 +
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 120 +++-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 613 ++++++++++++++++--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 124 +++-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 238 +++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   7 +
> >  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
> >  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> >  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 109 +++-
> >  .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
> >  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
> >  .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
> >  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
> >  drivers/gpu/drm/drm_atomic.c                  |   1 +
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
> >  include/drm/drm_mode_object.h                 |   2 +-
> >  include/drm/drm_plane.h                       |   7 +
> >  20 files changed, 1509 insertions(+), 104 deletions(-)
> >=20
>=20
>=20

--3t5ua6bs6pchjvmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRaeisACgkQwqF3j0dL
ehw6sQ//cj5ryDnvOdOMdNbexLqaTNda18JtiVOpkptdQCXmjxeXZUGcHUYF1nfh
yk8qgtcaU+m5r64+5dLgWtdxzIyN5YKlmtrGiR+rYgzBzUtsh55jJxJzAxrWsAgm
haxXLzJgd/08R+REBzbvq08CPYdTfVpXnOHYYOqQOF22Lk17yhfYaRCxjZDhf7Gy
w4JbEa38pUHT7Hxa3lM1lMHTgvIA5lkQefCwOsDOArnO8bX8MeSlCCoir3UPZP+j
kLVGpgxJAsF2HQ5rtiuTb9+8zydQdOtbhk6LDA+Qqmakz9trzrQKBz+9mw1yAPsh
dI1G6SEllYFa5cBbsI0KVeZ5Xs1ru9QC5MRZRau5RLzUWLXWUEPbDHVZlM9zfanV
mvvE102wSxKYqUzk6HYyQ/9Q8zqyg+zXG34EuIicf3K9d3LpKxeKKA6vOYL7NNHj
JEc8qv+g51ZiMYUoRfHaQX6sQHhBkGhDk1W0nOKyHsxrn/eMyVcAuafRWH7lpsdr
Y/fcwW2tmHQuuHMKApmAFgiJ3q/jAIfE0++LeQUFagVE969NLqoKsKzm6O8uNBEg
JwFl1g+zjKT6DI1tTZi90J3AfO+RSUgVT+I8XwVf4f9xE7LHjRLp/BxxKhzHbfgK
o/o0gEf/H/qIjqKaBTyxlMMWO8V4yShCbLE+kX0Yooi0u0OTfEM=
=0/8M
-----END PGP SIGNATURE-----

--3t5ua6bs6pchjvmn--
