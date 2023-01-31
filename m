Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD3682835
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863E810E323;
	Tue, 31 Jan 2023 09:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A026810E144;
 Tue, 31 Jan 2023 09:07:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z11so13727725ede.1;
 Tue, 31 Jan 2023 01:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=AbNC1zShz+zVqlkSyg4hcKKs2HkwgcUbHvf3IgFAX78=;
 b=bifJpkIS6vl2jJokRQ8SH9eFP/cx8mI4KNMIpk/p+Ih+4/zgDAdO3kespCo9nx6TB7
 ErZl5kqXSHrjysjdxmws8XgI/BZd9E4ecQJyKgRRvPFuDNcY5p+cEqJxaLVeEL+fyOLu
 nKXleYskx0QZJnQBejm9TGsDC8HfVQBdbYmJegtTiR4DqavRFm2cDkfe20mcl0mCiUr5
 GXM7JCmxKr3u+qI3xe0suW4sfEpTs09GUc0fkMn4yrfYqlLRVWlqA9zxPIK/QlgiZRPQ
 NI5eSQ01cBVzL/WJuwN3q6zz3FNwPP/F80m5n00ugL3wk2s+bMw1ZJbONeGSd7B/UptV
 cqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AbNC1zShz+zVqlkSyg4hcKKs2HkwgcUbHvf3IgFAX78=;
 b=P94KmkmpHa4o+/HJw9/z1yXk9VKs8/N5yN3XP8p0txQFHtzo8mKWKkJ31Kkke5XdGa
 hTdQ4BKFJCk8iJ5lDMZSR07tS6eW6+fEAh6EZni5QAX/k8X/G4OD3hVUkJ9TOgdNTQwG
 fNbvPSMy2GvF47PeTsrqdzfMR2S3wXtdnuyI7oVZphcOR9Q27JUCw/V1Y+Ut++osrRXv
 TUqhVDd5/E9pl9Dbq+lRD4mAIYkNsGgcM5X6Mzwv6tJnsSKGMgqyxlHu8dqIeX61rtW6
 Q1L6kFtJeKRw49Up4J33ybDy0eLRUTqA/NsG+CJ1HKYxpgrGYSn9UOLpt6SUNOXr5sGn
 /RDA==
X-Gm-Message-State: AO0yUKXqaUE5EuMEinFLKzaDjPpUD7Wvt+odoAqlVI+A8TbU1keX/8W9
 GjjM4n46Vy7QXD+rMRWx5ps=
X-Google-Smtp-Source: AK7set/Ng8o+JHwQa2aA7nr3oS8URhKX8XxgmhGSu2AOd8bBvhUgm6ko8WSNqiELrj07BQfkYsqlBw==
X-Received: by 2002:a05:6402:25cb:b0:4a0:d950:9dc4 with SMTP id
 x11-20020a05640225cb00b004a0d9509dc4mr23617831edb.40.1675156067820; 
 Tue, 31 Jan 2023 01:07:47 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q11-20020aa7d44b000000b0046ac460da13sm8036669edr.53.2023.01.31.01.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 01:07:47 -0800 (PST)
Date: Tue, 31 Jan 2023 11:07:35 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230131110735.60f8ff04@eldfell>
In-Reply-To: <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xfn8d15o_LLVW.8cJohraSF";
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
 sunpeng.li@amd.com, seanpaul@chromium.org, bhawanpreet.lakha@amd.com,
 sungjoon.kim@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Xfn8d15o_LLVW.8cJohraSF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jan 2023 14:38:09 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 01/09, Melissa Wen wrote:
> > Hi,
> >=20
> > After collecting comments in different places, here is a second version
> > of the work on adding DRM CRTC 3D LUT support to the current DRM color
> > mgmt interface. In comparison to previous proposals [1][2][3], here we
> > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LUT,
> > that means the following DRM CRTC color correction pipeline:
> >=20
> > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D L=
UT

Hi Melissa,

that makes sense to me, for CRTCs. It would be really good to have that
as a diagram in the KMS UAPI documentation.

If someone wants to add a 3D LUT to KMS planes as well, then I'm not
sure if it should be this order or swapped. I will probably have an
opinion about that once Weston is fully HDR capable and has been tried
in the wild for a while with the HDR color operations fine-tuned based
on community feedback. IOW, not for a long time. The YUV to RGB
conversion factors in there as well.


> >=20
> > and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> > LUT3D_SIZE, that allows userspace to use different supported settings of
> > 3D LUT, fitting VA-API and new color API better. In this sense, I
> > adjusted the pre-blending proposal for post-blending usage.
> >=20
> > Patches 1-6 targets the addition of shaper LUT and 3D LUT properties to
> > the current DRM CRTC color mgmt pipeline. Patch 6 can be considered an
> > extra/optional patch to define a default value for LUT3D_MODE, inspired
> > by what we do for the plane blend mode property (pre-multiplied).
> >=20
> > Patches 7-18 targets AMD display code to enable shaper and 3D LUT usage
> > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on current
> > AMD DM colors code, patch 10 updates AMD stream in case of user 3D LUT
> > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by context
> > for DCN 301 (easily extendible to other DCN families). Finally, from
> > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> > driver, exposing modes supported by HW and programming user shaper and
> > 3D LUT accordingly.
> >=20
> > Our target userspace is Gamescope/SteamOS.
> >=20
> > Basic IGT tests were based on [5][6] and are available here (in-progres=
s):
> > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lut3d-=
api
> >=20
> > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart=
+renesas@ideasonboard.com/
> > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc17=
cbb4656fe23e69
> > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia=
.com/
> > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hun=
g@amd.com/
> > [5] https://patchwork.freedesktop.org/series/90165/
> > [6] https://patchwork.freedesktop.org/series/109402/
> > [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBuffer=
3DLUT.html
> > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues=
/11
> >=20
> > Let me know your thoughts. =20
>=20
> +Simon Ser, +Pekka Paalanen who might also be interested in this series.

Unfortunately I don't have the patch emails to reply to, so here's a
messy bunch of comments. I'll concentrate on the UAPI design as always.

+/*
+ * struct drm_mode_lut3d_mode - 3D LUT mode information.
+ * @lut_size: number of valid points on every dimension of 3D LUT.
+ * @lut_stride: number of points on every dimension of 3D LUT.
+ * @bit_depth: number of bits of RGB. If color_mode defines entries with h=
igher
+ *             bit_depth the least significant bits will be truncated.
+ * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORMAT=
_XBGR16161616.
+ * @flags: flags for hardware-sepcific features
+ */
+struct drm_mode_lut3d_mode {
+	__u16 lut_size;
+	__u16 lut_stride[3];
+	__u16 bit_depth;
+	__u32 color_format;
+	__u32 flags;
+};

Why is lut_stride an array of 3, but lut_size is not?

What is the color_mode the comment is referring to?

What is "number of bits of RGB"? Input precision? Output precision?
Integer or floating point?

Flags cannot be hardware specific, because it makes the whole KMS UAPI
hardware specific. That won't work. You have to have driver-agnostic
definitions for all possible flags.

Why is this the whole first patch? There is no documentation for the
UAPI on how this struct works, so I cannot review this. Explaining just
the individual fields is not enough to understand it. Is this something
the kernel fills in and is read-only to userspace? Is userspace filling
this in?


+ * =E2=80=9CLUT3D=E2=80=9D:
+ *	Blob property to set the 3D LUT mapping pixel data after the color
+ *	transformation matrix and before gamma 1D lut correction. The
+ *	data is interpreted as an array of &struct drm_color_lut elements.
+ *	Hardware might choose not to use the full precision of the LUT
+ *	elements.
+ *
+ *	Setting this to NULL (blob property value set to 0) means a the output
+ *	color is identical to the input color. This is generally the driver
+ *	boot-up state too. Drivers can access this blob through
+ *	&drm_crtc_state.gamma_lut.
+ *

You need to define how the 1-D array of drm_color_lut elements blob
will be interpreted as a 3-D array for the 3D LUT, and how the
dimensions match to the R, G and B channels. It's a bit like the
question about row-major or column-major storage for matrices, except
more complicated and not in those words.

+ * =E2=80=9CLUT3D_MODE=E2=80=9D:
+ *	Enum property to give the mode of the 3D lookup table to be set on the
+ *	LUT3D property. A mode specifies size, stride, bit depth and color
+ *	format and depends on the underlying hardware). If drivers support
+ *	multiple 3D LUT modes, they should be declared in a array of
+ *	drm_color_lut3d_mode and they will be advertised as an enum.

How does that work exactly? I didn't get it. I could guess, but having
to guess on API is bad.


+	/**
+	 * @lut3d:
+	 *
+	 * 3D Lookup table for converting pixel data. Position where it takes
+	 * place depends on hw design, after @ctm or @gamma_lut. See
+	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
+	 * &struct drm_color_lut.
+	 */
+	struct drm_property_blob *lut3d;

I do not like the wording of "depends on hw design", and it is used in
very many places here. The KMS UAPI semantics cannot vary based on
hardware. Your cover letter defines the order in the color pipeline, so
I don't understand how this here can depend on hw.

What can depend on hardware is which KMS UAPI properties are exposed,
and how you map a property to a hardware unit (which can even change
based on the exact pipeline configuration as long as the results are as
the UAPI doc defines). But this comment here is talking about the UAPI
properties, not hw elements.


I'm happy that the 3D LUT interface is being developed, but as you can
see from my questions, the UAPI documentation is practically missing. I
would have no idea how to use this as is.


Thanks!
pq

>=20
> Also please let me know if I forgot to address any comments.
>=20
> Melissa
>=20
> >=20
> > Thanks,
> >=20
> > Melissa
> >=20
> > Alex Hung (2):
> >   drm: Add 3D LUT mode and its attributes
> >   drm/amd/display: Define 3D LUT struct for HDR planes
> >=20
> > Melissa Wen (16):
> >   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
> >   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
> >   drm/drm_color_mgmt: add function to create 3D LUT modes supported
> >   drm/drm_color_mgmt: add function to attach 3D LUT props
> >   drm/drm_color_mgmt: set first lut3d mode as default
> >   drm/amd/display: remove unused regamma condition
> >   drm/amd/display: add comments to describe DM crtc color mgmt behavior
> >   drm/amd/display: encapsulate atomic regamma operation
> >   drm/amd/display: update lut3d and shaper lut to stream
> >   drm/amd/display: handle MPC 3D LUT resources for a given context
> >   drm/amd/display: acquire/release 3D LUT resources for ctx on DCN301
> >   drm/amd/display: expand array of supported 3D LUT modes
> >   drm/amd/display: enable 3D-LUT DRM properties if supported
> >   drm/amd/display: add user 3D LUT support to the amdgpu_dm color
> >     pipeline
> >   drm/amd/display: decouple steps to reuse in shaper LUT support
> >   drm/amd/display: add user shaper LUT support to amdgpu_dm color
> >     pipeline
> >=20
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 370 ++++++++++++++++--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   2 +
> >  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 ++-
> >  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> >  .../amd/display/dc/dcn301/dcn301_resource.c   |  47 ++-
> >  .../amd/display/modules/color/color_gamma.h   |  43 ++
> >  drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
> >  drivers/gpu/drm/drm_atomic_uapi.c             |  24 ++
> >  drivers/gpu/drm/drm_color_mgmt.c              | 127 ++++++
> >  drivers/gpu/drm/drm_fb_helper.c               |   5 +
> >  drivers/gpu/drm/drm_mode_config.c             |  21 +
> >  include/drm/drm_color_mgmt.h                  |   8 +
> >  include/drm/drm_crtc.h                        |  32 +-
> >  include/drm/drm_mode_config.h                 |  25 ++
> >  include/drm/drm_mode_object.h                 |   2 +-
> >  include/uapi/drm/drm_mode.h                   |  17 +
> >  18 files changed, 757 insertions(+), 39 deletions(-)
> >=20
> > --=20
> > 2.35.1
> >  =20


--Sig_/Xfn8d15o_LLVW.8cJohraSF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPY2lcACgkQI1/ltBGq
qqd0lA/+N7pcr3JCK2S69GUTwSMErDEzmR5Wk+b6X+TkRWyUQ4G3pgYRZM7KX1qF
izapLvW+29YPTqrwTqAXJwN9fPnyDdMqW0767mV5qUlvENEUKrUqzTnxhP/e5WyP
wB7nxduAk0uSw4Yiv9Efz92Bes4Qk+oG7H2h7eUBOHt6rB0aWOR6lLdgV/cIxL5U
UOBLJmTqdx2HwChjhqx6hjBfhEzsuP2rJnyc8tIBIwA7uS1oIETtKzRDJftRh2ig
9E2qc9z2eQqWBOZNW+FU2IJJ2QekTqsSq3Dp26NFgp8GF+ELecRIG1+uLwEv0IZx
PfWaPbbC445bngtPKdn+IaaYueS/1axBDujUStsBONWvyqUFUW8KLbsa9z+75fql
tnJ/SnbpTXk8OcMp0HqQcOfk1bUM6D2Sn/paUdzrbDgGvl5Liu+s4DZDPH3o4OsU
ZbEshEhMSctr/qlVDiAxKqHgp6z4OjpX5hYo457E3XNtEduhec2v+rkgFTbpLTSz
xSk45UW2Y1EFoQgIpfwJWINgEPvlf5jcJDyUDf1JwmDWgxNQvN4xtUyhdNoZFdBj
aKX6Oa3/A1MgVn4c1H8QzGe9r83i2ieCou7k7TQj3CCWXbcHa98l/hfaJSABvgp5
7gocISbjUvK8zPNnxfd2YK4oHUxC7e6OdfKByGcJyiiZmgpy/YE=
=NHlS
-----END PGP SIGNATURE-----

--Sig_/Xfn8d15o_LLVW.8cJohraSF--
