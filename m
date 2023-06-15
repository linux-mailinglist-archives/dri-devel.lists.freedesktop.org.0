Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA3731557
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 12:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64EE10E4C0;
	Thu, 15 Jun 2023 10:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5810E4C0;
 Thu, 15 Jun 2023 10:29:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f74cda5f1dso5802899e87.3; 
 Thu, 15 Jun 2023 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686824992; x=1689416992;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=THThpCdpe4lw2uO/Ab75gZ3YriVXnkDGfU5suGI1T1M=;
 b=hC4UbTKezBSHIQkUn0+22AXJv9viB2PAao9owNBzT8wzWeEJuop1zONhCBtZcrIVrJ
 ffZ49L2IiRAaQZxSIUdSNEfWJse8YphALJ5wR0t93mE+W8dfMdfY7B943RkZUApYGVf7
 xdzsqSc8fXyUhwcG8+SJWfvjq2ymakQ83d5smP2OG+f6Blg+wA5lME3LXAs9i5maDmxY
 Zz0AHWO3hLKAoqJUecLNpSCJN/4Oluv/lujqEViXE+Db/6RLRSXyc3UoLbwWP4QV3Cw0
 OFxbFj2m9F+dM83DP425R6EA7s65x47smOVj9CyavG+hSpVdXsVaTCTnrE/xQQWpnGvb
 QCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686824992; x=1689416992;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THThpCdpe4lw2uO/Ab75gZ3YriVXnkDGfU5suGI1T1M=;
 b=dkNwGoQ8ITQeIlm2ThpWpq8t/7tbAoMRwhDGZlM4cKiG0sxvBQHKn5ftZmM9pl1cQU
 UhNRBhNg/7T8hJUBRcONTREama2T3UHK5L2CQ8jm4liirPn7cAhrNVJrGWOLUvgDjPqo
 FlfNbCl3XdDQS7V2VekkZb6YuV0EsK1NeKVl3rinRujBrmKt9/FfK3aqBVXB4PN7jTXo
 pVyV7uMOioh5XWX21NmRIzJRrJr+PR1SiF89r18bJGqDjlpqJJM74eglrlAt61DQgO+q
 3u4dg+XxBo6VRxUCLXlNZslJt2KlOYEfxnj0g79dvncK5aWDJRo53bNj7gqot4cYdzB3
 jcUQ==
X-Gm-Message-State: AC+VfDwEQTuN0YOz6w5+jRjw0uBjo5tAYf9NBrVQpf6ug5OrGioEgaYr
 Mu6JSMMWtRkA/G/23f4lOEs=
X-Google-Smtp-Source: ACHHUZ5OuaE2E47WTDsXETVFBMyFeMU5UIwvIAxbke0PC0k30vy1NUFFMXgnLUhytEq1Uz/OhVj68w==
X-Received: by 2002:ac2:4d9b:0:b0:4f3:a61d:19d2 with SMTP id
 g27-20020ac24d9b000000b004f3a61d19d2mr9353367lfe.36.1686824991138; 
 Thu, 15 Jun 2023 03:29:51 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u3-20020ac24c23000000b004f8422b7991sm252031lfq.154.2023.06.15.03.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 03:29:50 -0700 (PDT)
Date: Thu, 15 Jun 2023 13:29:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230615132939.26a40559@eldfell>
In-Reply-To: <sc3jn73i3x6g7jexe7h35ip4rhnxilcwmsknubguxxvfgkwujp@lcm2otuhxgn7>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <yevhvooznvpqbuybp7tmbo6qgrbxzqrs4y2k4onrjnfbcz42et@hmiwqw74dhgc>
 <20230615101405.09745e65@eldfell>
 <sc3jn73i3x6g7jexe7h35ip4rhnxilcwmsknubguxxvfgkwujp@lcm2otuhxgn7>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.GzMUDGpxXiyR+fAvEDXguv";
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, tzimmermann@suse.de,
 sunpeng.li@amd.com, mripard@kernel.org, Melissa Wen <mwen@igalia.com>,
 seanpaul@chromium.org, bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.GzMUDGpxXiyR+fAvEDXguv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Jun 2023 10:07:35 +0200
Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi Pekka
>     thanks for the reply
>=20
> On Thu, Jun 15, 2023 at 10:14:05AM +0300, Pekka Paalanen wrote:
> > On Tue, 13 Jun 2023 17:43:55 +0200
> > Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> > =20
> > > Hello
> > >
> > >    I'm completing the support for 3D LUT on R-Car DU peripheral
> > > and I have used this series as a base.
> > >
> > > I'm wondering, since quite some time has passed without any update if
> > > this series is still a thing and it makes any sense for me to try to
> > > bring it forward.
> > >
> > > I'm asking as I've noticed:
> > > "[PATCH 00/36] drm/amd/display: add AMD driver-specific properties fo=
r color mgmt"
> > >
> > > which seems to supersede this proposal with driver-specific
> > > properties.
> > >
> > > I asked Melissa privately but I wasn't able to get an hold of her, so
> > > if anyone has any clue feel free to reply :) =20
> >
> > Hi,
> >
> > since no-one else replied, I'll point you to the thread starting at
> > https://lists.freedesktop.org/archives/dri-devel/2023-May/403173.html =
=20
>=20
> Yes, Melissa pointed me to that series privately yesterday.
>=20
> However, and here I might be missing something, per-plane properties do
> not apply well to the HW pipeline I'm looking at.
>=20
> The R-Car DU has a 1D LUT and a 3D LUT at the CRTC level (I guess
> 'post blending' is the right term here) ?  A per-plane property
> doesn't seem to match how the HW work, but please feel free to correct
> me as this is all rather new to me and I might be overlooking
> something.

Post-blending, correct. The long term plan is to replicate the same
idea to post-blending as it is planned for pre-blending.

>=20
> My plan at the moment would have been to base my work on Melissa's RFC
> and re-send to prop discussions, unless it is certainly a dead-end and
> I have missed how to properly use per-plane properties on our HW.

I'm not a kernel dev nor a maintainer, so I can't comment on what would
be acceptable in the mean time before the new pipeline design is
implemented. The long term plan is to supersede all existing color
transformation related properties with pipelines.


Thanks,
pq

>=20
> Thank you!
>=20
> > and continuing to June. That is the plan of getting a common UAPI for
> > these things.
> >
> >
> > Thanks,
> > pq
> >
> > =20
> > >
> > > Thanks
> > >   j
> > >
> > > On Mon, Jan 09, 2023 at 01:38:28PM -0100, Melissa Wen wrote: =20
> > > > Hi,
> > > >
> > > > After collecting comments in different places, here is a second ver=
sion
> > > > of the work on adding DRM CRTC 3D LUT support to the current DRM co=
lor
> > > > mgmt interface. In comparison to previous proposals [1][2][3], here=
 we
> > > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D =
LUT,
> > > > that means the following DRM CRTC color correction pipeline:
> > > >
> > > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma =
1D LUT
> > > >
> > > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> > > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> > > > LUT3D_SIZE, that allows userspace to use different supported settin=
gs of
> > > > 3D LUT, fitting VA-API and new color API better. In this sense, I
> > > > adjusted the pre-blending proposal for post-blending usage.
> > > >
> > > > Patches 1-6 targets the addition of shaper LUT and 3D LUT propertie=
s to
> > > > the current DRM CRTC color mgmt pipeline. Patch 6 can be considered=
 an
> > > > extra/optional patch to define a default value for LUT3D_MODE, insp=
ired
> > > > by what we do for the plane blend mode property (pre-multiplied).
> > > >
> > > > Patches 7-18 targets AMD display code to enable shaper and 3D LUT u=
sage
> > > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on cur=
rent
> > > > AMD DM colors code, patch 10 updates AMD stream in case of user 3D =
LUT
> > > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by con=
text
> > > > for DCN 301 (easily extendible to other DCN families). Finally, from
> > > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> > > > driver, exposing modes supported by HW and programming user shaper =
and
> > > > 3D LUT accordingly.
> > > >
> > > > Our target userspace is Gamescope/SteamOS.
> > > >
> > > > Basic IGT tests were based on [5][6] and are available here (in-pro=
gress):
> > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lu=
t3d-api
> > > >
> > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinc=
hart+renesas@ideasonboard.com/
> > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5b=
dc17cbb4656fe23e69
> > > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@ig=
alia.com/
> > > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex=
.hung@amd.com/
> > > > [5] https://patchwork.freedesktop.org/series/90165/
> > > > [6] https://patchwork.freedesktop.org/series/109402/
> > > > [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBu=
ffer3DLUT.html
> > > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/is=
sues/11
> > > >
> > > > Let me know your thoughts.
> > > >
> > > > Thanks,
> > > >
> > > > Melissa
> > > >
> > > > Alex Hung (2):
> > > >   drm: Add 3D LUT mode and its attributes
> > > >   drm/amd/display: Define 3D LUT struct for HDR planes
> > > >
> > > > Melissa Wen (16):
> > > >   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
> > > >   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
> > > >   drm/drm_color_mgmt: add function to create 3D LUT modes supported
> > > >   drm/drm_color_mgmt: add function to attach 3D LUT props
> > > >   drm/drm_color_mgmt: set first lut3d mode as default
> > > >   drm/amd/display: remove unused regamma condition
> > > >   drm/amd/display: add comments to describe DM crtc color mgmt beha=
vior
> > > >   drm/amd/display: encapsulate atomic regamma operation
> > > >   drm/amd/display: update lut3d and shaper lut to stream
> > > >   drm/amd/display: handle MPC 3D LUT resources for a given context
> > > >   drm/amd/display: acquire/release 3D LUT resources for ctx on DCN3=
01
> > > >   drm/amd/display: expand array of supported 3D LUT modes
> > > >   drm/amd/display: enable 3D-LUT DRM properties if supported
> > > >   drm/amd/display: add user 3D LUT support to the amdgpu_dm color
> > > >     pipeline
> > > >   drm/amd/display: decouple steps to reuse in shaper LUT support
> > > >   drm/amd/display: add user shaper LUT support to amdgpu_dm color
> > > >     pipeline
> > > >
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
> > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 370 ++++++++++++++=
++--
> > > >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   2 +
> > > >  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 ++-
> > > >  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> > > >  .../amd/display/dc/dcn301/dcn301_resource.c   |  47 ++-
> > > >  .../amd/display/modules/color/color_gamma.h   |  43 ++
> > > >  drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
> > > >  drivers/gpu/drm/drm_atomic_uapi.c             |  24 ++
> > > >  drivers/gpu/drm/drm_color_mgmt.c              | 127 ++++++
> > > >  drivers/gpu/drm/drm_fb_helper.c               |   5 +
> > > >  drivers/gpu/drm/drm_mode_config.c             |  21 +
> > > >  include/drm/drm_color_mgmt.h                  |   8 +
> > > >  include/drm/drm_crtc.h                        |  32 +-
> > > >  include/drm/drm_mode_config.h                 |  25 ++
> > > >  include/drm/drm_mode_object.h                 |   2 +-
> > > >  include/uapi/drm/drm_mode.h                   |  17 +
> > > >  18 files changed, 757 insertions(+), 39 deletions(-)
> > > >
> > > > --
> > > > 2.35.1
> > > > =20
> > =20
>=20
>=20


--Sig_/.GzMUDGpxXiyR+fAvEDXguv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSK6BMACgkQI1/ltBGq
qqfNTxAAgcxSltdnm0V4ZPP69ypXdFFlgTAW+tZEVK+yCYUsNZFAZtYWAhsdhIKH
uyZycPfCcjy5DV9YIMGwjZ8lDOEpsi01W0c05bYTz15QVlgFkENqYSgMw4MkLLBY
/Vuaw84jbjjBbRfzSSzHTK9LtfxXk18mmBb64Gow1gM2Vbc4teTODxtnZCwu5PfW
w6Vn4Uu+Ate29idJOKlnOXy5f0ds4w37JGzvmhV5EgULGTAgjTvcfAZea2B1Zm72
s8Ue0DZyhF1vF1lzoQXy4tln8WPCpa5PvxAkzuR4+v63aOiMXDjtiq3LBWifbGay
W2qdbhAQLuh6bYQazEMMfEzbTD8rIkcP8m+fbip1levMCq5Qbwd5u3ARpMZKyL69
YCnjomHAclbkRwhHsqS3mNkenlz1NENwtWJAGpUP1LwA2aCMA6i8ldqO7auKk41p
8ohciZdaiEQaMGxHP1I761+VIn/gLz8OCwvc+BkaN+BB/c15Le+Iw6Y3Q2QncSr5
ljfEZNFz24NZEqAD3SUqxkhzrhcxNMGTJvEieHXVruOjxsNc5/WaffOuaeZt+cH0
EwqTBP0d79rrigUoYjYFsbGfYcft+pdvjSOot+YeVm9n1IVi3c9VaBheBKEN4Pw9
36EJmfkAtLBupIWNqykC0MoMejjGrA4w1SnncipV0D5tlkgRyEk=
=YHYm
-----END PGP SIGNATURE-----

--Sig_/.GzMUDGpxXiyR+fAvEDXguv--
