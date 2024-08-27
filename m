Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F49615D2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4110E3E0;
	Tue, 27 Aug 2024 17:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Tk5FBU11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D1610E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D7B4E0003;
 Tue, 27 Aug 2024 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTx09VjCZMfHH/Vj9rCkvhs7CNBgJxPC2TZwhVWnjko=;
 b=Tk5FBU11+7yR/4QeFdf+6qZ3dsz+woSBDSqRrScpVXPe9CJP66l/aYC/PhnM1DL/3QIU9C
 VhqwFJFwXbpJ2PW21E5DKKBOyOFv6mgTMt0C5lG1O4TWlwB843hhT1ZzvnEDOm0uEQSVIE
 8i1kRA+bfiz31f8Nt4nOs6051u/JBtN2Em+AO59ntqBczWyqFZdj4kAoYa1TEfgZ8QdR9E
 1ag4rxNyeVVVEVj4ROgCRcMInsL4pEut2VV7MJFVUzhePF2bPY6L0f9laLqBzlhdE+vRTO
 42DEpc+OS3vCUbeYEri7TTPNETCufeDRhEpvo3c/SraWb1KrwywYZIjjmzeQvg==
Date: Tue, 27 Aug 2024 19:49:45 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH v5 00/44] Color Pipeline API w/ VKMS
Message-ID: <Zs4RudR3e5flkwcW@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 19/08/24 - 16:56, Harry Wentland a écrit :
> This is an RFC set for a color pipeline API, along with implementations
> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
> allowable delta variation as the goal for these transformations is
> perceptual correctness, not complete pixel accuracy.
> 
> v5 of this patchset fleshed out documentation for colorops and the
> various defines that are being introduced.
> 
> VKMS supports two named transfer function colorops and two matrix
> colorops.
> 
> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
> 
> 1. 1D Curve EOTF
> 2. 3x4 CTM
> 3. Multiplier
> 4. 1D Curve Inverse EOTF
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D Curve EOTF
> 8. 1D LUT
> 
> The supported curves for the 1D Curve type are:
> - sRGB EOTF and its inverse
> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
> - BT.2020/BT.709 OETF and its inverse
> 
> Note that the 1st and 5th colorops take the EOTF or Inverse
> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
> 
> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
> exists for other drivers to describe their own 3D LUT capability.
> 
> This mirrors the color pipeline used by gamescope and presented by
> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
> used. See [1]
> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
> 
> At this point we're hoping to see gamescope and kwin implementations
> take shape. The existing pipeline should be enough to satisfy the
> gamescope use-cases on the drm_plane.
> 
> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
> support to the color pipeline. I have sketched these out already but
> don't have it all hooked up yet. This should not hinder adoption of this
> API for gaming use-cases.
> 
> We'll also want to advertise IN_FORMATS on a color pipeline as some
> color pipelines won't be able to work for all IN_FORMATS on a plane.
> Again, I have a sketch but no full implementation yet. This is not
> currently required by the AMD color pipeline and could be added after
> the merge of this set.
> 
> VKMS patches could still be improved in a few ways, though the
> payoff might be limited and I would rather focus on other work
> at the moment. The most obvious thing to improve would be to
> eliminate the hard-coded LUTs for identity, and sRGB, and replace
> them with fixed-point math instead.

Hi!

I reviewed your VKMS patches and added a few comments in your series. This 
series looks very good.

Thanks for this work,
Louis Chauvet
 
> There are plenty of things that I would like to see, but they could
> be added after the merge of this patchset:
>  - COLOR_ENCODING and COLOR_RANGE
>  - IN_FORMATS for a color pipeline
>  - Is it possible to support HW which can't bypass entire pipeline?
>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>  - read-only scaling colorop which defines scaling taps and position
>  - named matrices, for things like converting YUV to RGB
>  - Add custom LUT colorops to VKMS
> 
> IGT tests can be found at [1] or on the igt-dev mailing list.
> 
> A kernel branch can be found at [2].
> 
> I've also rebased Uma and Chaitanya's patches for the Intel color
> pipeline on top of this to show how I envision them to mesh with
> my changes. The relevant branches can be found at [3] for the kernel
> and [4] for IGT. There were some rebase conflicts in i915 and I'm
> not entirely sure I've resolved all of them correctly, but the branch
> compiles and shows my thoughts for the new DRM concepts to support
> Intel's pipeline.
> 
> [1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
> [2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5
> [3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
> [4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5
> 
> 
> v5:
>  - amdgpu 3D LUT
>  - Don't require BYPASS
>  - update RFC docs and add to TOC tree
>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>  - add amdgpu color pipeline doc
>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
>  - various minor fixes and cleanups
> 
> v4:
>  - Add amdgpu color pipeline (WIP)
>  - Don't block setting of deprecated properties, instead pass client cap
>    to atomic check so drivers can ignore these props
>  - Drop IOCTL definitions (Pekka)
>  - Use enum property for colorop TYPE (Pekka)
>  - A few cleanups to the docs (Pekka)
>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>  - Add missing function declarations (Chaitanya Kumar Borah)
>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>  - Add helper for creation of pipeline drm_plane property (Pekka)
>  - Always create Bypass pipeline (Pekka)
>  - A bunch of changes to VKMS kunit tests (Pekka)
>  - Fix index in CTM doc (Pekka)
> 
> v3:
>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>  - Remove need for libdrm
>  - Add color_pipeline client cap and make mutually exclusive with
>    COLOR_RANGE and COLOR_ENCODING properties
>  - add CTM colorop to VKMS
>  - Use include way for kunit testing static functions (Arthur)
>  - Make TYPE a range property
>  - Move enum drm_colorop_type to uapi header
>  - and a bunch of smaller bits that are highlighted in the relevant commit
>    description
> 
> v2:
>  - Rebased on drm-misc-next
>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>  - Incorporate feedback in color_pipeline.rst doc
>  - Add support for sRGB inverse EOTF
>  - Add 2nd enumerated TF colorop to VKMS
>  - Fix LUTs and some issues with applying LUTs in VKMS
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Alex Hung (13):
>   drm/colorop: define a new macro for_each_new_colorop_in_state
>   drm/amd/display: Skip color pipeline initialization for cursor plane
>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>   drm/amd/display: Add support for sRGB EOTF in BLND block
>   drm/colorop: Add 1D Curve Custom LUT type
>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>   drm/amd/display: add 3x4 matrix colorop
>   drm/colorop: Add mutliplier type
>   drm/amd/display: add multiplier colorop
>   drm/amd/display: Swap matrix and multiplier
>   drm/colorop: Add 3D LUT supports to color pipeline
>   drm/amd/display: add 3D LUT colorop
> 
> Harry Wentland (31):
>   drm: Add helper for conversion from signed-magnitude
>   drm/vkms: Round fixp2int conversion in lerp_u16
>   drm/vkms: Add kunit tests for VKMS LUT handling
>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>   drm/colorop: Introduce new drm_colorop mode object
>   drm/colorop: Add TYPE property
>   drm/colorop: Add 1D Curve subtype
>   Documentation/gpu: document drm_colorop
>   drm/colorop: Add BYPASS property
>   drm/colorop: Add NEXT property
>   drm/colorop: Add atomic state print for drm_colorop
>   drm/plane: Add COLOR PIPELINE property
>   drm/colorop: Add NEXT to colorop state print
>   drm/vkms: Add enumerated 1D curve colorop
>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   drm/colorop: Add 3x4 CTM type
>   drm/vkms: Use s32 for internal color pipeline precision
>   drm/vkms: add 3x4 matrix in color pipeline
>   drm/tests: Add a few tests around drm_fixed.h
>   drm/vkms: Add tests for CTM handling
>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>   drm/amd/display: Add bypass COLOR PIPELINE
>   drm/colorop: Add PQ 125 EOTF and its inverse
>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>   drm/colorop: Define LUT_1D interpolation
>   drm/colorop: allow non-bypass colorops
>   drm/amd/display: Add AMD color pipeline doc
> 
>  Documentation/gpu/drm-kms.rst                 |  15 +
>  Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
>  Documentation/gpu/rfc/index.rst               |   3 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 196 +++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>  drivers/gpu/drm/drm_atomic.c                  | 184 +++-
>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
>  drivers/gpu/drm/drm_colorop.c                 | 562 ++++++++++++
>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>  drivers/gpu/drm/drm_plane.c                   |  52 ++
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 102 +++
>  drivers/gpu/drm/vkms/vkms_composer.c          | 115 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>  include/drm/drm_atomic.h                      | 130 +++
>  include/drm/drm_atomic_uapi.h                 |   3 +
>  include/drm/drm_colorop.h                     | 427 ++++++++++
>  include/drm/drm_file.h                        |   7 +
>  include/drm/drm_fixed.h                       |  18 +
>  include/drm/drm_mode_config.h                 |  18 +
>  include/drm/drm_plane.h                       |  19 +
>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>  include/uapi/drm/drm.h                        |  16 +
>  include/uapi/drm/drm_mode.h                   | 156 ++++
>  40 files changed, 4595 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>  create mode 100644 include/drm/drm_colorop.h
> 
> --
> 2.46.0
> 
