Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E82690BAC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FFE10EB01;
	Thu,  9 Feb 2023 14:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B8410E214;
 Thu,  9 Feb 2023 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rB0FmcdXInGyk89mlvjzu/G1snFia4hI5ihN9vgbLQs=; b=T3VkZ8ABvJNuk6YiahE4iP75aU
 NlzVtJaJ8wGJmszxc5BP2TiJDI+GL0iJPcK7IXSTR5ldmf/b5IVqrIUZWO4bxilYFl32RX23Hesi0
 5+YS2f4c/80gPg12G6ha3LIPcS+OgppEBvVtbNJbxf71/mmx7PvqZjZa0DtMuEAV8Z/fhj0fYT0FL
 szhv7s81YGSdYbnz19eA6BKTHbADxlnPQQ+p4x5QaQr+QhBfKyLk098dWg3mNHNq0xxsIsLnNW4HX
 jGsC+9ZQe3bbC6ewZxB8J6N4qWJdyaKjz0Nilu+P2X1TWS2WTRvXO1CkD5IutuEQoKkLKhhywTCS8
 lHJkvYuw==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ7tH-00Dzml-Tf; Thu, 09 Feb 2023 15:27:12 +0100
Date: Thu, 9 Feb 2023 13:27:02 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wzk4pwlnc5siz2k5"
Content-Disposition: inline
In-Reply-To: <20230131110735.60f8ff04@eldfell>
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


--wzk4pwlnc5siz2k5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/31, Pekka Paalanen wrote:
> On Mon, 9 Jan 2023 14:38:09 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > On 01/09, Melissa Wen wrote:
> > > Hi,
> > >=20
> > > After collecting comments in different places, here is a second versi=
on
> > > of the work on adding DRM CRTC 3D LUT support to the current DRM color
> > > mgmt interface. In comparison to previous proposals [1][2][3], here we
> > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D LU=
T,
> > > that means the following DRM CRTC color correction pipeline:
> > >=20
> > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma 1D=
 LUT
>=20
> Hi Melissa,
>=20
> that makes sense to me, for CRTCs. It would be really good to have that
> as a diagram in the KMS UAPI documentation.
>=20

Hi Pekka,

Thanks for your feedbacks and your time reviewing this proposal.

> If someone wants to add a 3D LUT to KMS planes as well, then I'm not
> sure if it should be this order or swapped. I will probably have an
> opinion about that once Weston is fully HDR capable and has been tried
> in the wild for a while with the HDR color operations fine-tuned based
> on community feedback. IOW, not for a long time. The YUV to RGB
> conversion factors in there as well.
>=20
I see, this is also the reason I reuse here Alex Hung's proposal for
pre-blending API. I'll work on better documentation.

>=20
> > >=20
> > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> > > LUT3D_SIZE, that allows userspace to use different supported settings=
 of
> > > 3D LUT, fitting VA-API and new color API better. In this sense, I
> > > adjusted the pre-blending proposal for post-blending usage.
> > >=20
> > > Patches 1-6 targets the addition of shaper LUT and 3D LUT properties =
to
> > > the current DRM CRTC color mgmt pipeline. Patch 6 can be considered an
> > > extra/optional patch to define a default value for LUT3D_MODE, inspir=
ed
> > > by what we do for the plane blend mode property (pre-multiplied).
> > >=20
> > > Patches 7-18 targets AMD display code to enable shaper and 3D LUT usa=
ge
> > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on curre=
nt
> > > AMD DM colors code, patch 10 updates AMD stream in case of user 3D LUT
> > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by conte=
xt
> > > for DCN 301 (easily extendible to other DCN families). Finally, from
> > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> > > driver, exposing modes supported by HW and programming user shaper and
> > > 3D LUT accordingly.
> > >=20
> > > Our target userspace is Gamescope/SteamOS.
> > >=20
> > > Basic IGT tests were based on [5][6] and are available here (in-progr=
ess):
> > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lut3=
d-api
> > >=20
> > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pincha=
rt+renesas@ideasonboard.com/
> > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5bdc=
17cbb4656fe23e69
> > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igal=
ia.com/
> > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.h=
ung@amd.com/
> > > [5] https://patchwork.freedesktop.org/series/90165/
> > > [6] https://patchwork.freedesktop.org/series/109402/
> > > [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBuff=
er3DLUT.html
> > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issu=
es/11
> > >=20
> > > Let me know your thoughts. =20
> >=20
> > +Simon Ser, +Pekka Paalanen who might also be interested in this series.
>=20
> Unfortunately I don't have the patch emails to reply to, so here's a
> messy bunch of comments. I'll concentrate on the UAPI design as always.

Sorry, the patchset is here: https://lore.kernel.org/dri-devel/202301091438=
46.1966301-1-mwen@igalia.com/
In the next version, I won't forget cc'ing you at first.
>=20
> +/*
> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> + * @lut_size: number of valid points on every dimension of 3D LUT.
> + * @lut_stride: number of points on every dimension of 3D LUT.
> + * @bit_depth: number of bits of RGB. If color_mode defines entries with=
 higher
> + *             bit_depth the least significant bits will be truncated.
> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORM=
AT_XBGR16161616.
> + * @flags: flags for hardware-sepcific features
> + */
> +struct drm_mode_lut3d_mode {
> +	__u16 lut_size;
> +	__u16 lut_stride[3];
> +	__u16 bit_depth;
> +	__u32 color_format;
> +	__u32 flags;
> +};
>=20
> Why is lut_stride an array of 3, but lut_size is not?

It cames from VA-API:
https://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html#a=
682756be15d09327ba725b74a863cbcc

In short, the reason is that lut_size is the valid points and is
the same for every dimensions, but lut_stride may vary.
>=20
> What is the color_mode the comment is referring to?

It refers to FB color_mode/bpp. I'm not using it in post-blending 3D LUT
implementation (should I?), it cames from pre-blending use case.  Maybe
the main issue here is if reusing the pre-blending 3D LUT mode struct is
a good approach or better create a specific for post-blending.

>=20
> What is "number of bits of RGB"? Input precision? Output precision?
> Integer or floating point?

It's the bit depth of the 3D LUT values, the same for every channels. In
the AMD case, it's supports 10-bit and 12-bit, for example.
>=20
> Flags cannot be hardware specific, because it makes the whole KMS UAPI
> hardware specific. That won't work. You have to have driver-agnostic
> definitions for all possible flags.
>=20
> Why is this the whole first patch? There is no documentation for the
> UAPI on how this struct works, so I cannot review this. Explaining just
> the individual fields is not enough to understand it. Is this something
> the kernel fills in and is read-only to userspace? Is userspace filling
> this in?

I see. I'll work on explaining/documenting it better.
>=20
>=20
> + * =E2=80=9CLUT3D=E2=80=9D:
> + *	Blob property to set the 3D LUT mapping pixel data after the color
> + *	transformation matrix and before gamma 1D lut correction. The
> + *	data is interpreted as an array of &struct drm_color_lut elements.
> + *	Hardware might choose not to use the full precision of the LUT
> + *	elements.
> + *
> + *	Setting this to NULL (blob property value set to 0) means a the output
> + *	color is identical to the input color. This is generally the driver
> + *	boot-up state too. Drivers can access this blob through
> + *	&drm_crtc_state.gamma_lut.
> + *
>=20
> You need to define how the 1-D array of drm_color_lut elements blob
> will be interpreted as a 3-D array for the 3D LUT, and how the
> dimensions match to the R, G and B channels. It's a bit like the
> question about row-major or column-major storage for matrices, except
> more complicated and not in those words.

ack
>=20
> + * =E2=80=9CLUT3D_MODE=E2=80=9D:
> + *	Enum property to give the mode of the 3D lookup table to be set on the
> + *	LUT3D property. A mode specifies size, stride, bit depth and color
> + *	format and depends on the underlying hardware). If drivers support
> + *	multiple 3D LUT modes, they should be declared in a array of
> + *	drm_color_lut3d_mode and they will be advertised as an enum.
>=20
> How does that work exactly? I didn't get it. I could guess, but having
> to guess on API is bad.

The driver advertises all supported modes (each combination of values)
in a array as a enum, userspace can check all accepted modes and set the
one that fits the user 3D LUT settings. I think it's possible to get the
idea from this IGT test:
https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444c3dcd126=
d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_205_205
>=20
>=20
> +	/**
> +	 * @lut3d:
> +	 *
> +	 * 3D Lookup table for converting pixel data. Position where it takes
> +	 * place depends on hw design, after @ctm or @gamma_lut. See
> +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
> +	 * &struct drm_color_lut.
> +	 */
> +	struct drm_property_blob *lut3d;
>=20
> I do not like the wording of "depends on hw design", and it is used in
> very many places here. The KMS UAPI semantics cannot vary based on
> hardware. Your cover letter defines the order in the color pipeline, so
> I don't understand how this here can depend on hw.
>=20
> What can depend on hardware is which KMS UAPI properties are exposed,
> and how you map a property to a hardware unit (which can even change
> based on the exact pipeline configuration as long as the results are as
> the UAPI doc defines). But this comment here is talking about the UAPI
> properties, not hw elements.
>=20

You are right! My initial idea was to explain that it's possible for
other vendors color pipeline to fit this pipeline internally, if they
need a 1D LUT before the 3D LUT, but not the 1D LUT in the end.

>=20
> I'm happy that the 3D LUT interface is being developed, but as you can
> see from my questions, the UAPI documentation is practically missing. I
> would have no idea how to use this as is.

Thank you again for your valuable comments. I'll address your comments
in a next version by better explaining all these points.

Melissa

>=20
>=20
> Thanks!
> pq
>=20
> >=20
> > Also please let me know if I forgot to address any comments.
> >=20
> > Melissa
> >=20
> > >=20
> > > Thanks,
> > >=20
> > > Melissa
> > >=20
> > > Alex Hung (2):
> > >   drm: Add 3D LUT mode and its attributes
> > >   drm/amd/display: Define 3D LUT struct for HDR planes
> > >=20
> > > Melissa Wen (16):
> > >   drm/drm_color_mgmt: add shaper LUT to color mgmt properties
> > >   drm/drm_color_mgmt: add 3D LUT props to DRM color mgmt
> > >   drm/drm_color_mgmt: add function to create 3D LUT modes supported
> > >   drm/drm_color_mgmt: add function to attach 3D LUT props
> > >   drm/drm_color_mgmt: set first lut3d mode as default
> > >   drm/amd/display: remove unused regamma condition
> > >   drm/amd/display: add comments to describe DM crtc color mgmt behavi=
or
> > >   drm/amd/display: encapsulate atomic regamma operation
> > >   drm/amd/display: update lut3d and shaper lut to stream
> > >   drm/amd/display: handle MPC 3D LUT resources for a given context
> > >   drm/amd/display: acquire/release 3D LUT resources for ctx on DCN301
> > >   drm/amd/display: expand array of supported 3D LUT modes
> > >   drm/amd/display: enable 3D-LUT DRM properties if supported
> > >   drm/amd/display: add user 3D LUT support to the amdgpu_dm color
> > >     pipeline
> > >   drm/amd/display: decouple steps to reuse in shaper LUT support
> > >   drm/amd/display: add user shaper LUT support to amdgpu_dm color
> > >     pipeline
> > >=20
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   6 +
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 370 ++++++++++++++++=
--
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   2 +
> > >  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 ++-
> > >  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
> > >  .../amd/display/dc/dcn301/dcn301_resource.c   |  47 ++-
> > >  .../amd/display/modules/color/color_gamma.h   |  43 ++
> > >  drivers/gpu/drm/drm_atomic_state_helper.c     |   7 +
> > >  drivers/gpu/drm/drm_atomic_uapi.c             |  24 ++
> > >  drivers/gpu/drm/drm_color_mgmt.c              | 127 ++++++
> > >  drivers/gpu/drm/drm_fb_helper.c               |   5 +
> > >  drivers/gpu/drm/drm_mode_config.c             |  21 +
> > >  include/drm/drm_color_mgmt.h                  |   8 +
> > >  include/drm/drm_crtc.h                        |  32 +-
> > >  include/drm/drm_mode_config.h                 |  25 ++
> > >  include/drm/drm_mode_object.h                 |   2 +-
> > >  include/uapi/drm/drm_mode.h                   |  17 +
> > >  18 files changed, 757 insertions(+), 39 deletions(-)
> > >=20
> > > --=20
> > > 2.35.1
> > >  =20
>=20



--wzk4pwlnc5siz2k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPlArEACgkQwqF3j0dL
ehxEhQ//Vc0KfvG0EuEBPABuxdKWMWeYxt5eyN+hF7ELPyUDVGyTPYBCL+qONzUn
xpk2+a9es7nzHjJXFeCHHVngmXx3Z7eh1HLiY0uokIQoe1Ph6Evm+9rDCte5Y54X
8BfJnZgDfwo5IuypCaAHJYw7Avn4lDixTl2nAuVlq9QUleX0o/5aDxGN+YCHDUAd
URNxYQQgoxXihIThdEPQLlnqljtCGhfhgFqczo1/xBIkOB2U14+clz+7vHreWsT3
k4TlCxsByd7KtRgTAc5uFHzNYn4e0YgVCbjF4BFAaJCQ3JLMDG7xLOzXgWoxU/Q+
eUJlLCLTmLjtLiJrE6XCun7qn0SkzYdXeLgeOikABed3/Bl/TjnphMRUeybU2vjm
zBDJM7wrPolrPrYz+qitWfSIUebqwECX9UnoJznBm1dRyjXLjSEhUb7mldXceSiG
Y03Md1BDeykLhAVHLGhuoJ5HuftEkSgwtbuGi/xNDdLLfqWRQSlZRGH8mnkpFLEC
7d9oncIpVxqmnGeSEw7J/CW6cc41wJbBmIwz7KnjBDVhl8JquyU9v6gcV1auYa22
48hojo1yM7HYpEHMyYIeejcchnwj6T+gxch9QTYpLqF/mg3NYQkLxDHMjDZbT+1Q
dtKpkRjxsUJAdTabow816kDh3+1rA0NqpeGE73d/GnCm3wvEFRk=
=205Z
-----END PGP SIGNATURE-----

--wzk4pwlnc5siz2k5--
