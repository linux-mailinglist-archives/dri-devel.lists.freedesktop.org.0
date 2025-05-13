Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D8AB5939
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8176510E0E1;
	Tue, 13 May 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dQHbYQrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B1D10E0BD;
 Tue, 13 May 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gJIVCwcInRwehnXb2MseJ+x/KJMF2AkpWIP64+9mIeo=; b=dQHbYQrB6A3PFjNgYhUKcjNiKM
 TGB/lVJSCsBbC2dYYBhLSg/hQKHjrCqve1vS9Whsd3/oJY+AsJ31/kw75Y5F2QkKRHdSopHXU9VYZ
 Vg7+gUTwCHI6keCOC1axcggrUkhFOEb+8CENS/PRHJI7SNc3olc7r0dgHjoeTUmWRYDR8IA6EiLUe
 +h8S0q1dNjq+IIxmuR3DhB/JX+WQjJ9QaPyTHxMBEyok4+Q2Uwgdg/ODT5nIYNFhlYY75GN4ayCQw
 aE2Ck+KCkcx8aPIumFUaWsGBI/PmsD66v9ORo0TJeaGuxJ9d2Kw6PmyPfQHJeGSLCBhsSWCmj6P0D
 exoBPipg==;
Received: from [189.6.16.79] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uErxZ-007giy-Cp; Tue, 13 May 2025 18:00:00 +0200
Date: Tue, 13 May 2025 12:59:39 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
Message-ID: <y4jxopbjnrq63ovk3rd2gole3nlkvgpm2mordkj5abpp6xyk5j@7s2wvycg4yeu>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
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

On 04/29, Alex Hung wrote:
> This is an RFC set for a color pipeline API, along with implementations
> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
> allowable delta variation as the goal for these transformations is
> perceptual correctness, not complete pixel accuracy.

Hi,

Thanks for this work. I found it very solid and well documented.
The drm colorop implementation looks good to me, but I still have some
questions about AMD specific bits.

Patches 1, 3-13, 16, 21-23, 25, 35-41 and 43 are:
Reviewed-by: Melissa Wen <mwen@igalia.com>

And I dropped some comments and questions to some AMD-specific patches.

> 
> v5 of this patchset fleshed out documentation for colorops and the
> various defines that are being introduced.
> 
> v6 addresses a few comments from various reviewers.
> 
> v7 simplifies 3D LUT and addresses more comments from various reviewers.
> 
> v8 fixes typo and errors and address comments from reviewers.
> 
> v9 refactors cleanup functions, fixes typo and errors, and addresses
>    comments from reviewers.
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
> 
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
> IGT tests can be found at [1] or on the igt-dev mailing list. There
> have been no updates since v5 and rebase on latest main is straight-
> forward.
> 
> A kernel branch can be found at [2].
> 
> [1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v8
> [2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v9
> 
> v9:
>  - Update RFC documents for 3DLUT and fallback behaviours (Simon Ser)
>  - Specify colorop function names by _plane_ (Chaitanya Kumar Borah)
>  - Remove redundant comments (Simon Ser)
>  - Fix typo in commit description (Shengyu Qu)
>  - Move destroy and cleanup functions earlier (Simon Ser)
>  - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)
>  - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)
>  - Return a value in __set_dm_plane_colorop_3dlut
> 
> v8:
>  - Change VKMS config names (Louis Chauvet)
>  - Remove deprecated function "drm_atomic_get_existing_colorop_state" (Louis Chauvet)
>  - Remove null check in drm_colorop_set_next_property (Simon Ser)
>  - Remove MAX_COLOR_PIPELINES in drm (Simon Ser)
>  - Update kernel docs and documents for DRM_COLOROP_3D_LUT (Simon Ser)
>  - Add comments for dmr_color_lut (Louis Chauvet)
>  - Fix typos and replace DRM_ERROR and DRM_WARN_ONCE by drm_err drm_WARN_ONCE (Louis Chauvet)
>  - Fix incorrect conditions in __set_colorop_in_tf_1d_curve (Leo Li)
>  - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>  - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>  - Return error when __set_output_tf fails (Leo Li)
>  - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
>  - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
>  - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)
> 
> v7:
>  - Simplify 3D LUT by removing lut_3d_modes and update doc accordingly (Simon Ser)
>  - Add destroy / cleanup functions when color pipeline initialization
>    fails (Louis Chauvet)
>  - Fix checkpatch errors and warning (spaces, long lines, {}, and etc)
>  - Change lut's size from drm_colorop_state->size to drm_colorop->lut_size
>    and from size_property to lut_size_property
>  - Update some kernel updates and commit messagesa (Louis Chauvet)
>  - Squash "drm/colorop: Add atomic state print for drm_colorop" and
>    "drm/colorop: Add NEXT to colorop state print" (Simon Ser)
>  - Add missing MODULE_DESCRIPTION (Jeff Johnson)
> 
> v6:
>  - Eliminate need to include test as .c file (Louis Chauvet)
>  - some doc updates
>  - cleanup if colorop alloc or init fails in VKMS and amdgpu (Louis Chauvet)
>  - couple other small improvements in VKMS, such as rounding (Louis Chauvet)
>  - take ref for DATA blob in duplicate_state func & fix refcount issues (Xaver Hugl)
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
> Alex Hung (14):
>   drm/colorop: Add destroy functions for color pipeline
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
>   drm/colorop: Add 3D LUT support to color pipeline
>   drm/amd/display: add 3D LUT colorop
> 
> Harry Wentland (29):
>   drm: Add helper for conversion from signed-magnitude
>   drm/vkms: Add kunit tests for VKMS LUT handling
>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>   drm/colorop: Introduce new drm_colorop mode object
>   drm/colorop: Add TYPE property
>   drm/colorop: Add 1D Curve subtype
>   drm/colorop: Add BYPASS property
>   drm/colorop: Add NEXT property
>   drm/colorop: Add atomic state print for drm_colorop
>   drm/plane: Add COLOR PIPELINE property
>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   Documentation/gpu: document drm_colorop
>   drm/vkms: Add enumerated 1D curve colorop
>   drm/vkms: Add kunit tests for linear and sRGB LUTs
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
>  Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
>  Documentation/gpu/rfc/index.rst               |   3 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 573 ++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 207 +++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
>  drivers/gpu/drm/drm_atomic.c                  | 170 +++-
>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
>  drivers/gpu/drm/drm_colorop.c                 | 598 +++++++++++++
>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>  drivers/gpu/drm/drm_plane.c                   |  59 ++
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>  drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
>  drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
>  drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
>  drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
>  drivers/gpu/drm/vkms/vkms_luts.c              | 808 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>  include/drm/drm_atomic.h                      | 111 +++
>  include/drm/drm_atomic_uapi.h                 |   3 +
>  include/drm/drm_colorop.h                     | 442 ++++++++++
>  include/drm/drm_file.h                        |   7 +
>  include/drm/drm_fixed.h                       |  18 +
>  include/drm/drm_mode_config.h                 |  18 +
>  include/drm/drm_plane.h                       |  19 +
>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>  include/uapi/drm/drm.h                        |  15 +
>  include/uapi/drm/drm_mode.h                   | 121 +++
>  40 files changed, 4642 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>  create mode 100644 include/drm/drm_colorop.h
> 
> -- 
> 2.43.0
> 
