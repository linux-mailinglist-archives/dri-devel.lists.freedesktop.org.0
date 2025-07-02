Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F0AF0EF2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753810E600;
	Wed,  2 Jul 2025 09:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9jxSJp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32A610E606;
 Wed,  2 Jul 2025 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447259; x=1782983259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0GF8Zv1YyLsJ2KQh7lSxzz8tjW9k6EWQHPs5EDpxRGM=;
 b=D9jxSJp54RQx8JYvVlpsF1B+jNln+et9fbgzMbR90VYL3hCCXzuabYDj
 W6Kp1zski98HoZAohFPr8DtsACIw7++zmFsy/612qISYRx3S4n+GNBWuF
 dElv+lzaFOAN/ACNHClcfMFFPDk638aUOeIyLE/PLG0sZuARHaIYcbJp+
 Uy1piqrPsOPNat9XTBUGOu2Z9tMSn8oYCv8t/Si5i/JfcEI2CfhX/50n7
 DRn4juLTpbIMk6OW4I/8ZLJLcWwunUJoshzLsL/nrdS7ki+fb1nJwxV+J
 896q4zd6Lp33D3htA8L4aMGEKfvLrhJrIKudO4BMo/5eN7oGqTPijDbEt A==;
X-CSE-ConnectionGUID: PQn6kuYeQD6pzAcXLmWkhg==
X-CSE-MsgGUID: ao4EZOwuRTyG/Pr0AcrYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426951"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426951"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:38 -0700
X-CSE-ConnectionGUID: A/l+Y6n5TrGwREnArHm1gA==
X-CSE-MsgGUID: 1HwDDn0BRKOBxnznEMLfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536331"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:34 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com
Subject: [v5 01/24] [NOT FOR REVIEW] drm: AMD series squashed
Date: Wed,  2 Jul 2025 14:49:13 +0530
Message-ID: <20250702091936.3004854-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

From: Harry Wentland <harry.wentland@amd.com>

This is a squashed patch based on a series sent out by Alex Hung and
Harry wentland. It contains all the changes in the series(v10) currently
under review below.

https://patchwork.freedesktop.org/series/123446/

This patch lays the ground work for incremental changes and Intel
specific pipeline changes.

NOTE: This patch is not meant for review. Any review related to this
patch should be done on the original series. In order not to diverge
the discussion from the main series.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 762 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 205 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 181 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 598 +++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   6 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 808 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   1 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  13 +
 include/drm/drm_colorop.h                     | 442 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 133 +++
 43 files changed, 4918 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..2292e65f044c 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -413,6 +413,21 @@ Plane Panic Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panic.c
    :export:
 
+Colorop Abstraction
+===================
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :doc: overview
+
+Colorop Functions Reference
+---------------------------
+
+.. kernel-doc:: include/drm/drm_colorop.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :export:
+
 Display Modes Function Reference
 ================================
 
diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
new file mode 100644
index 000000000000..cd1cc2d0f988
--- /dev/null
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -0,0 +1,378 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Linux Color Pipeline API
+========================
+
+What problem are we solving?
+============================
+
+We would like to support pre-, and post-blending complex color
+transformations in display controller hardware in order to allow for
+HW-supported HDR use-cases, as well as to provide support to
+color-managed applications, such as video or image editors.
+
+It is possible to support an HDR output on HW supporting the Colorspace
+and HDR Metadata drm_connector properties, but that requires the
+compositor or application to render and compose the content into one
+final buffer intended for display. Doing so is costly.
+
+Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and other
+operations to support color transformations. These operations are often
+implemented in fixed-function HW and therefore much more power efficient than
+performing similar operations via shaders or CPU.
+
+We would like to make use of this HW functionality to support complex color
+transformations with no, or minimal CPU or shader load. The switch between HW
+fixed-function blocks and shaders/CPU must be seamless with no visible
+difference when fallback to shaders/CPU is neceesary at any time.
+
+
+How are other OSes solving this problem?
+========================================
+
+The most widely supported use-cases regard HDR content, whether video or
+gaming.
+
+Most OSes will specify the source content format (color gamut, encoding transfer
+function, and other metadata, such as max and average light levels) to a driver.
+Drivers will then program their fixed-function HW accordingly to map from a
+source content buffer's space to a display's space.
+
+When fixed-function HW is not available the compositor will assemble a shader to
+ask the GPU to perform the transformation from the source content format to the
+display's format.
+
+A compositor's mapping function and a driver's mapping function are usually
+entirely separate concepts. On OSes where a HW vendor has no insight into
+closed-source compositor code such a vendor will tune their color management
+code to visually match the compositor's. On other OSes, where both mapping
+functions are open to an implementer they will ensure both mappings match.
+
+This results in mapping algorithm lock-in, meaning that no-one alone can
+experiment with or introduce new mapping algorithms and achieve
+consistent results regardless of which implementation path is taken.
+
+Why is Linux different?
+=======================
+
+Unlike other OSes, where there is one compositor for one or more drivers, on
+Linux we have a many-to-many relationship. Many compositors; many drivers.
+In addition each compositor vendor or community has their own view of how
+color management should be done. This is what makes Linux so beautiful.
+
+This means that a HW vendor can now no longer tune their driver to one
+compositor, as tuning it to one could make it look fairly different from
+another compositor's color mapping.
+
+We need a better solution.
+
+
+Descriptive API
+===============
+
+An API that describes the source and destination colorspaces is a descriptive
+API. It describes the input and output color spaces but does not describe
+how precisely they should be mapped. Such a mapping includes many minute
+design decision that can greatly affect the look of the final result.
+
+It is not feasible to describe such mapping with enough detail to ensure the
+same result from each implementation. In fact, these mappings are a very active
+research area.
+
+
+Prescriptive API
+================
+
+A prescriptive API describes not the source and destination colorspaces. It
+instead prescribes a recipe for how to manipulate pixel values to arrive at the
+desired outcome.
+
+This recipe is generally an ordered list of straight-forward operations,
+with clear mathematical definitions, such as 1D LUTs, 3D LUTs, matrices,
+or other operations that can be described in a precise manner.
+
+
+The Color Pipeline API
+======================
+
+HW color management pipelines can significantly differ between HW
+vendors in terms of availability, ordering, and capabilities of HW
+blocks. This makes a common definition of color management blocks and
+their ordering nigh impossible. Instead we are defining an API that
+allows user space to discover the HW capabilities in a generic manner,
+agnostic of specific drivers and hardware.
+
+
+drm_colorop Object
+==================
+
+To support the definition of color pipelines we define the DRM core
+object type drm_colorop. Individual drm_colorop objects will be chained
+via the NEXT property of a drm_colorop to constitute a color pipeline.
+Each drm_colorop object is unique, i.e., even if multiple color
+pipelines have the same operation they won't share the same drm_colorop
+object to describe that operation.
+
+Note that drivers are not expected to map drm_colorop objects statically
+to specific HW blocks. The mapping of drm_colorop objects is entirely a
+driver-internal detail and can be as dynamic or static as a driver needs
+it to be. See more in the Driver Implementation Guide section below.
+
+Each drm_colorop has three core properties:
+
+TYPE: An enumeration property, defining the type of transformation, such as
+* enumerated curve
+* custom (uniform) 1D LUT
+* 3x3 matrix
+* 3x4 matrix
+* 3D LUT
+* etc.
+
+Depending on the type of transformation other properties will describe
+more details.
+
+BYPASS: A boolean property that can be used to easily put a block into
+bypass mode. The BYPASS property is not mandatory for a colorop, as long
+as the entire pipeline can get bypassed by setting the COLOR_PIPELINE on
+a plane to '0'.
+
+NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
+drm_colorop is the last in the chain.
+
+An example of a drm_colorop object might look like one of these::
+
+    /* 1D enumerated curve */
+    Color operation 42
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
+    ├─ "BYPASS": bool {true, false}
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
+    └─ "NEXT": immutable color operation ID = 43
+
+    /* custom 4k entry 1D LUT */
+    Color operation 52
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "SIZE": immutable range = 4096
+    ├─ "DATA": blob
+    └─ "NEXT": immutable color operation ID = 0
+
+    /* 17^3 3D LUT */
+    Color operation 72
+    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 3D LUT
+    ├─ "BYPASS": bool {true, false}
+    ├─ "SIZE": immutable range = 17
+    ├─ "DATA": blob
+    └─ "NEXT": immutable color operation ID = 73
+
+drm_colorop extensibility
+-------------------------
+
+Unlike existing DRM core objects, like &drm_plane, drm_colorop is not
+extensible. This simplifies implementations and keeps all functionality
+for managing &drm_colorop objects in the DRM core.
+
+If there is a need one may introduce a simple &drm_colorop_funcs
+function table in the future, for example to support an IN_FORMATS
+property on a &drm_colorop.
+
+If a driver requires the ability to create a driver-specific colorop
+object they will need to add &drm_colorop func table support with
+support for the usual functions, like destroy, atomic_duplicate_state,
+and atomic_destroy_state.
+
+
+COLOR_PIPELINE Plane Property
+=============================
+
+Color Pipelines are created by a driver and advertised via a new
+COLOR_PIPELINE enum property on each plane. Values of the property
+always include object id 0, which is the default and means all color
+processing is disabled. Additional values will be the object IDs of the
+first drm_colorop in a pipeline. A driver can create and advertise none,
+one, or more possible color pipelines. A DRM client will select a color
+pipeline by setting the COLOR PIPELINE to the respective value.
+
+NOTE: Many DRM clients will set enumeration properties via the string
+value, often hard-coding it. Since this enumeration is generated based
+on the colorop object IDs it is important to perform the Color Pipeline
+Discovery, described below, instead of hard-coding color pipeline
+assignment. Drivers might generate the enum strings dynamically.
+Hard-coded strings might only work for specific drivers on a specific
+pieces of HW. Color Pipeline Discovery can work universally, as long as
+drivers implement the required color operations.
+
+The COLOR_PIPELINE property is only exposed when the
+DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set. Drivers shall ignore any
+existing pre-blend color operations when this cap is set, such as
+COLOR_RANGE and COLOR_ENCODING. If drivers want to support COLOR_RANGE
+or COLOR_ENCODING functionality when the color pipeline client cap is
+set, they are expected to expose colorops in the pipeline to allow for
+the appropriate color transformation.
+
+Setting of the COLOR_PIPELINE plane property or drm_colorop properties
+is only allowed for userspace that sets this client cap.
+
+An example of a COLOR_PIPELINE property on a plane might look like this::
+
+    Plane 10
+    ├─ "TYPE": immutable enum {Overlay, Primary, Cursor} = Primary
+    ├─ …
+    └─ "COLOR_PIPELINE": enum {0, 42, 52} = 0
+
+
+Color Pipeline Discovery
+========================
+
+A DRM client wanting color management on a drm_plane will:
+
+1. Get the COLOR_PIPELINE property of the plane
+2. iterate all COLOR_PIPELINE enum values
+3. for each enum value walk the color pipeline (via the NEXT pointers)
+   and see if the available color operations are suitable for the
+   desired color management operations
+
+If userspace encounters an unknown or unsuitable color operation during
+discovery it does not need to reject the entire color pipeline outright,
+as long as the unknown or unsuitable colorop has a "BYPASS" property.
+Drivers will ensure that a bypassed block does not have any effect.
+
+An example of chained properties to define an AMD pre-blending color
+pipeline might look like this::
+
+    Plane 10
+    ├─ "TYPE" (immutable) = Primary
+    └─ "COLOR_PIPELINE": enum {0, 44} = 0
+
+    Color operation 44
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 45
+
+    Color operation 45
+    ├─ "TYPE" (immutable) = 3x4 Matrix
+    ├─ "BYPASS": bool
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 46
+
+    Color operation 46
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 47
+
+    Color operation 47
+    ├─ "TYPE" (immutable) = 1D LUT
+    ├─ "SIZE": immutable range = 4096
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 48
+
+    Color operation 48
+    ├─ "TYPE" (immutable) = 3D LUT
+    ├─ "DATA": blob
+    └─ "NEXT" (immutable) = 49
+
+    Color operation 49
+    ├─ "TYPE" (immutable) = 1D enumerated curve
+    ├─ "BYPASS": bool
+    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
+    └─ "NEXT" (immutable) = 0
+
+
+Color Pipeline Programming
+==========================
+
+Once a DRM client has found a suitable pipeline it will:
+
+1. Set the COLOR_PIPELINE enum value to the one pointing at the first
+   drm_colorop object of the desired pipeline
+2. Set the properties for all drm_colorop objects in the pipeline to the
+   desired values, setting BYPASS to true for unused drm_colorop blocks,
+   and false for enabled drm_colorop blocks
+3. Perform (TEST_ONLY or not) atomic commit with all the other KMS
+   states it wishes to change
+
+To configure the pipeline for an HDR10 PQ plane and blending in linear
+space, a compositor might perform an atomic commit with the following
+property values::
+
+    Plane 10
+    └─ "COLOR_PIPELINE" = 42
+
+    Color operation 42
+    └─ "BYPASS" = true
+
+    Color operation 44
+    └─ "BYPASS" = true
+
+    Color operation 45
+    └─ "BYPASS" = true
+
+    Color operation 46
+    └─ "BYPASS" = true
+
+    Color operation 47
+    ├─ "DATA" = Gamut mapping + tone mapping + night mode
+    └─ "BYPASS" = false
+
+    Color operation 48
+    ├─ "CURVE_1D_TYPE" = PQ EOTF
+    └─ "BYPASS" = false
+
+
+Driver Implementer's Guide
+==========================
+
+What does this all mean for driver implementations? As noted above the
+colorops can map to HW directly but don't need to do so. Here are some
+suggestions on how to think about creating your color pipelines:
+
+- Try to expose pipelines that use already defined colorops, even if
+  your hardware pipeline is split differently. This allows existing
+  userspace to immediately take advantage of the hardware.
+
+- Additionally, try to expose your actual hardware blocks as colorops.
+  Define new colorop types where you believe it can offer significant
+  benefits if userspace learns to program them.
+
+- Avoid defining new colorops for compound operations with very narrow
+  scope. If you have a hardware block for a special operation that
+  cannot be split further, you can expose that as a new colorop type.
+  However, try to not define colorops for "use cases", especially if
+  they require you to combine multiple hardware blocks.
+
+- Design new colorops as prescriptive, not descriptive; by the
+  mathematical formula, not by the assumed input and output.
+
+A defined colorop type must be deterministic. The exact behavior of the
+colorop must be documented entirely, whether via a mathematical formula
+or some other description. Its operation can depend only on its
+properties and input and nothing else, allowed error tolerance
+notwithstanding.
+
+
+Driver Forward/Backward Compatibility
+=====================================
+
+As this is uAPI drivers can't regress color pipelines that have been
+introduced for a given HW generation. New HW generations are free to
+abandon color pipelines advertised for previous generations.
+Nevertheless, it can be beneficial to carry support for existing color
+pipelines forward as those will likely already have support in DRM
+clients.
+
+Introducing new colorops to a pipeline is fine, as long as they can be
+bypassed or are purely informational. DRM clients implementing support
+for the pipeline can always skip unknown properties as long as they can
+be confident that doing so will not cause unexpected results.
+
+If a new colorop doesn't fall into one of the above categories
+(bypassable or informational) the modified pipeline would be unusable
+for user space. In this case a new pipeline should be defined.
+
+
+References
+==========
+
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 396e535377fb..ef19b0ba2a3e 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -35,3 +35,6 @@ host such documentation:
 .. toctree::
 
     i915_vm_bind.rst
+
+.. toctree::
+    color_pipeline.rst
\ No newline at end of file
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4dafbdc8f86a..072d22989786 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -41,6 +41,7 @@ drm-y := \
 	drm_bridge.o \
 	drm_cache.o \
 	drm_color_mgmt.o \
+	drm_colorop.o \
 	drm_connector.o \
 	drm_crtc.o \
 	drm_displayid.o \
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 7329b8cc2576..8e949fe77312 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -39,7 +39,8 @@ AMDGPUDM = \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
 	amdgpu_dm_quirks.o \
-	amdgpu_dm_wb.o
+	amdgpu_dm_wb.o \
+	amdgpu_dm_colorop.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b8ac9edc070..2f2e8eca7400 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5671,6 +5671,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ebabfe3a512f..c6d4a9365c00 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -25,6 +25,7 @@
 #include "amdgpu.h"
 #include "amdgpu_mode.h"
 #include "amdgpu_dm.h"
+#include "amdgpu_dm_colorop.h"
 #include "dc.h"
 #include "modules/color/color_gamma.h"
 #include "basics/conversion.h"
@@ -32,6 +33,32 @@
 /**
  * DOC: overview
  *
+ * We have three types of color management in the AMD display driver.
+ * 1. the legacy &drm_crtc DEGAMMA, CTM, and GAMMA properties
+ * 2. AMD driver private color management on &drm_plane and &drm_crtc
+ * 3. AMD plane color pipeline
+ *
+ * The CRTC properties are the original color management. When they were
+ * implemented per-plane color management was not a thing yet. Because
+ * of that we could get away with plumbing the DEGAMMA and CTM
+ * properties to pre-blending HW functions. This is incompatible with
+ * per-plane color management, such as via the AMD private properties or
+ * the new drm_plane color pipeline. The only compatible CRTC property
+ * with per-plane color management is the GAMMA property as it is
+ * applied post-blending.
+ *
+ * The AMD driver private color management properties are only exposed
+ * when the kernel is built explicitly with -DAMD_PRIVATE_COLOR. They
+ * are temporary building blocks on the path to full-fledged &drm_plane
+ * and &drm_crtc color pipelines and lay the driver's groundwork for the
+ * color pipelines.
+ *
+ * The AMD plane color pipeline describes AMD's &drm_colorops via the
+ * &drm_plane's COLOR_PIPELINE property.
+ *
+ * drm_crtc Properties
+ * -------------------
+ *
  * The DC interface to HW gives us the following color management blocks
  * per pipe (surface):
  *
@@ -42,36 +69,93 @@
  * - Surface regamma LUT (normalized)
  * - Output CSC (normalized)
  *
- * But these aren't a direct mapping to DRM color properties. The current DRM
- * interface exposes CRTC degamma, CRTC CTM and CRTC regamma while our hardware
- * is essentially giving:
+ * But these aren't a direct mapping to DRM color properties. The
+ * current DRM interface exposes CRTC degamma, CRTC CTM and CRTC regamma
+ * while our hardware is essentially giving:
  *
  * Plane CTM -> Plane degamma -> Plane CTM -> Plane regamma -> Plane CTM
  *
- * The input gamma LUT block isn't really applicable here since it operates
- * on the actual input data itself rather than the HW fp representation. The
- * input and output CSC blocks are technically available to use as part of
- * the DC interface but are typically used internally by DC for conversions
- * between color spaces. These could be blended together with user
- * adjustments in the future but for now these should remain untouched.
+ * The input gamma LUT block isn't really applicable here since it
+ * operates on the actual input data itself rather than the HW fp
+ * representation. The input and output CSC blocks are technically
+ * available to use as part of the DC interface but are typically used
+ * internally by DC for conversions between color spaces. These could be
+ * blended together with user adjustments in the future but for now
+ * these should remain untouched.
+ *
+ * The pipe blending also happens after these blocks so we don't
+ * actually support any CRTC props with correct blending with multiple
+ * planes - but we can still support CRTC color management properties in
+ * DM in most single plane cases correctly with clever management of the
+ * DC interface in DM.
+ *
+ * As per DRM documentation, blocks should be in hardware bypass when
+ * their respective property is set to NULL. A linear DGM/RGM LUT should
+ * also considered as putting the respective block into bypass mode.
+ *
+ * This means that the following configuration is assumed to be the
+ * default:
+ *
+ * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ... CRTC
+ * DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
+ *
+ * AMD Private Color Management on drm_plane
+ * -----------------------------------------
+ *
+ * The AMD private color management properties on a &drm_plane are:
  *
- * The pipe blending also happens after these blocks so we don't actually
- * support any CRTC props with correct blending with multiple planes - but we
- * can still support CRTC color management properties in DM in most single
- * plane cases correctly with clever management of the DC interface in DM.
+ * - AMD_PLANE_DEGAMMA_LUT
+ * - AMD_PLANE_DEGAMMA_LUT_SIZE
+ * - AMD_PLANE_DEGAMMA_TF
+ * - AMD_PLANE_HDR_MULT
+ * - AMD_PLANE_CTM
+ * - AMD_PLANE_SHAPER_LUT
+ * - AMD_PLANE_SHAPER_LUT_SIZE
+ * - AMD_PLANE_SHAPER_TF
+ * - AMD_PLANE_LUT3D
+ * - AMD_PLANE_LUT3D_SIZE
+ * - AMD_PLANE_BLEND_LUT
+ * - AMD_PLANE_BLEND_LUT_SIZE
+ * - AMD_PLANE_BLEND_TF
  *
- * As per DRM documentation, blocks should be in hardware bypass when their
- * respective property is set to NULL. A linear DGM/RGM LUT should also
- * considered as putting the respective block into bypass mode.
+ * The AMD private color management property on a &drm_crtc is:
  *
- * This means that the following
- * configuration is assumed to be the default:
+ * - AMD_CRTC_REGAMMA_TF
+ *
+ * Use of these properties is discouraged.
+ *
+ * AMD plane color pipeline
+ * ------------------------
+ *
+ * The AMD &drm_plane color pipeline is advertised for DCN generations
+ * 3.0 and newer. It exposes these elements in this order:
+ *
+ * 1. 1D curve colorop
+ * 2. Multiplier
+ * 3. 3x4 CTM
+ * 4. 1D curve colorop
+ * 5. 1D LUT
+ * 6. 3D LUT
+ * 7. 1D curve colorop
+ * 8. 1D LUT
+ *
+ * The multiplier (#2) is a simple multiplier that is applied to all
+ * channels.
+ *
+ * The 3x4 CTM (#3) is a simple 3x4 matrix.
+ *
+ * #1, and #7 are non-linear to linear curves. #4 is a linear to
+ * non-linear curve. They support sRGB, PQ, and BT.709/BT.2020 EOTFs or
+ * their inverse.
+ *
+ * The 1D LUTs (#5 and #8) are plain 4096 entry LUTs.
+ *
+ * The 3DLUT (#6) is a tetrahedrally interpolated 17 cube LUT.
  *
- * Plane DGM Bypass -> Plane CTM Bypass -> Plane RGM Bypass -> ...
- * CRTC DGM Bypass -> CRTC CTM Bypass -> CRTC RGM Bypass
  */
 
 #define MAX_DRM_LUT_VALUE 0xFFFF
+#define MAX_DRM_LUT_32_VALUE 0xFFFFFFFF
 #define SDR_WHITE_LEVEL_INIT_VALUE 80
 
 /**
@@ -341,6 +425,21 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
 	return blob ? (struct drm_color_lut *)blob->data : NULL;
 }
 
+/**
+ * __extract_blob_lut_32 - Extracts the DRM lut and lut size from a blob.
+ * @blob: DRM color mgmt property blob
+ * @size: lut size
+ *
+ * Returns:
+ * DRM LUT or NULL
+ */
+static const struct drm_color_lut_32 *
+__extract_blob_lut_32(const struct drm_property_blob *blob, uint32_t *size)
+{
+	*size = blob ? drm_color_lut_32_size(blob) : 0;
+	return blob ? (struct drm_color_lut_32 *)blob->data : NULL;
+}
+
 /**
  * __is_lut_linear - check if the given lut is a linear mapping of values
  * @lut: given lut to check values
@@ -414,6 +513,30 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
 	}
 }
 
+/**
+ * __drm_lut_32_to_dc_gamma - convert the drm_color_lut to dc_gamma.
+ * @lut: DRM lookup table for color conversion
+ * @gamma: DC gamma to set entries
+ * @is_legacy: legacy or atomic gamma
+ *
+ * The conversion depends on the size of the lut - whether or not it's legacy.
+ */
+static void __drm_lut_32_to_dc_gamma(const struct drm_color_lut_32 *lut, struct dc_gamma *gamma)
+{
+	uint32_t r, g, b;
+	int i;
+
+	for (i = 0; i < MAX_COLOR_LUT_ENTRIES; i++) {
+		r = drm_color_lut_extract(lut[i].red, 32);
+		g = drm_color_lut_extract(lut[i].green, 32);
+		b = drm_color_lut_extract(lut[i].blue, 32);
+
+		gamma->entries.red[i] = dc_fixpt_from_fraction(r, MAX_DRM_LUT_32_VALUE);
+		gamma->entries.green[i] = dc_fixpt_from_fraction(g, MAX_DRM_LUT_32_VALUE);
+		gamma->entries.blue[i] = dc_fixpt_from_fraction(b, MAX_DRM_LUT_32_VALUE);
+	}
+}
+
 /**
  * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
  * @ctm: DRM color transformation matrix
@@ -566,6 +689,63 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * __set_output_tf_32 - calculates the output transfer function based on expected input space.
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut
+ * @has_rom: if ROM can be used for hardcoded curve
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
+static int __set_output_tf_32(struct dc_transfer_func *func,
+			      const struct drm_color_lut_32 *lut, uint32_t lut_size,
+			      bool has_rom)
+{
+	struct dc_gamma *gamma = NULL;
+	struct calculate_buffer cal_buffer = {0};
+	bool res;
+
+	cal_buffer.buffer_index = -1;
+
+	if (lut_size) {
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
+
+		gamma->num_entries = lut_size;
+		__drm_lut_32_to_dc_gamma(lut, gamma);
+	}
+
+	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
+		/*
+		 * Color module doesn't like calculating regamma params
+		 * on top of a linear input. But degamma params can be used
+		 * instead to simulate this.
+		 */
+		if (gamma)
+			gamma->type = GAMMA_CUSTOM;
+		res = mod_color_calculate_degamma_params(NULL, func,
+							 gamma, gamma != NULL);
+	} else {
+		/*
+		 * Assume sRGB. The actual mapping will depend on whether the
+		 * input was legacy or not.
+		 */
+		if (gamma)
+			gamma->type = GAMMA_CS_TFM_1D;
+		res = mod_color_calculate_regamma_params(func, gamma, gamma != NULL,
+							 has_rom, NULL, &cal_buffer);
+	}
+
+	if (gamma)
+		dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
+
 static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
 					const struct drm_color_lut *regamma_lut,
 					uint32_t regamma_size, bool has_rom,
@@ -639,6 +819,42 @@ static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *f
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * __set_input_tf_32 - calculates the input transfer function based on expected
+ * input space.
+ * @caps: dc color capabilities
+ * @func: transfer function
+ * @lut: lookup table that defines the color space
+ * @lut_size: size of respective lut.
+ *
+ * Returns:
+ * 0 in case of success. -ENOMEM if fails.
+ */
+static int __set_input_tf_32(struct dc_color_caps *caps, struct dc_transfer_func *func,
+			     const struct drm_color_lut_32 *lut, uint32_t lut_size)
+{
+	struct dc_gamma *gamma = NULL;
+	bool res;
+
+	if (lut_size) {
+		gamma = dc_create_gamma();
+		if (!gamma)
+			return -ENOMEM;
+
+		gamma->type = GAMMA_CUSTOM;
+		gamma->num_entries = lut_size;
+
+		__drm_lut_32_to_dc_gamma(lut, gamma);
+	}
+
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
+
+	if (gamma)
+		dc_gamma_release(&gamma);
+
+	return res ? 0 : -ENOMEM;
+}
+
 static enum dc_transfer_func_predefined
 amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 {
@@ -668,6 +884,24 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf) {
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+		return TRANSFER_FUNCTION_PQ;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -721,6 +955,59 @@ static void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
 	__to_dc_lut3d_color(&lut0[lut_i], lut[i], bit_depth);
 }
 
+static void __to_dc_lut3d_32_color(struct dc_rgb *rgb,
+				   const struct drm_color_lut_32 lut,
+				   int bit_precision)
+{
+	rgb->red = drm_color_lut_extract(lut.red, bit_precision);
+	rgb->green = drm_color_lut_extract(lut.green, bit_precision);
+	rgb->blue  = drm_color_lut_extract(lut.blue, bit_precision);
+}
+
+static void __drm_3dlut_32_to_dc_3dlut(const struct drm_color_lut_32 *lut,
+				       uint32_t lut3d_size,
+				       struct tetrahedral_params *params,
+				       bool use_tetrahedral_9,
+				       int bit_depth)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int lut_i, i;
+
+
+	if (use_tetrahedral_9) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+	}
+
+	for (lut_i = 0, i = 0; i < lut3d_size - 4; lut_i++, i += 4) {
+		/*
+		 * We should consider the 3D LUT RGB values are distributed
+		 * along four arrays lut0-3 where the first sizes 1229 and the
+		 * other 1228. The bit depth supported for 3dlut channel is
+		 * 12-bit, but DC also supports 10-bit.
+		 *
+		 * TODO: improve color pipeline API to enable the userspace set
+		 * bit depth and 3D LUT size/stride, as specified by VA-API.
+		 */
+		__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+		__to_dc_lut3d_32_color(&lut1[lut_i], lut[i + 1], bit_depth);
+		__to_dc_lut3d_32_color(&lut2[lut_i], lut[i + 2], bit_depth);
+		__to_dc_lut3d_32_color(&lut3[lut_i], lut[i + 3], bit_depth);
+	}
+	/* lut0 has 1229 points (lut_size/4 + 1) */
+	__to_dc_lut3d_32_color(&lut0[lut_i], lut[i], bit_depth);
+}
+
 /* amdgpu_dm_atomic_lut3d - set DRM 3D LUT to DC stream
  * @drm_lut3d: user 3D LUT
  * @drm_lut3d_size: size of 3D LUT
@@ -1137,6 +1424,351 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs))
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
+
+	tf->type = TF_TYPE_PREDEFINED;
+	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
+			       struct dc_plane_state *dc_plane_state,
+			       struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 1st op: 1d curve - degamma */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_degam_tfs)) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
+}
+
+static int
+__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_property_blob *blob;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	int i = 0;
+
+	/* 3x4 matrix */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+		blob = colorop_state->data;
+		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;
+			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+			dc_plane_state->gamut_remap_matrix.enable_remap = true;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		} else {
+			drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
+			      struct dc_plane_state *dc_plane_state,
+			      struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	const struct drm_color_lut_32 *shaper_lut;
+	struct drm_device *dev = colorop->dev;
+	bool enabled = false;
+	uint32_t shaper_size;
+	int i = 0, ret = 0;
+
+	/* 1D Curve - SHAPER TF */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_shaper_tfs)) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE) {
+		drm_dbg(dev, "Shaper TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		ret = __set_output_tf(tf, 0, 0, false);
+		if (ret)
+			return ret;
+		enabled = true;
+	}
+
+	/* 1D LUT - SHAPER LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Shaper LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT) {
+		drm_dbg(dev, "Shaper LUT colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf;
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		shaper_lut = __extract_blob_lut_32(colorop_state->data, &shaper_size);
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (shaper_size == colorop->lut_size) {
+			ret = __set_output_tf_32(tf, shaper_lut, shaper_size, false);
+			if (ret)
+				return ret;
+			enabled = true;
+		}
+	}
+
+	if (!enabled)
+		tf->type = TF_TYPE_BYPASS;
+
+	return 0;
+}
+
+/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
+ * @drm_lut3d: user 3D LUT
+ * @drm_lut3d_size: size of 3D LUT
+ * @lut3d: DC 3D LUT
+ *
+ * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
+ * on DCN accordingly.
+ */
+static void __set_colorop_3dlut(const struct drm_color_lut_32 *drm_lut3d,
+				uint32_t drm_lut3d_size,
+				struct dc_3dlut *lut)
+{
+	if (!drm_lut3d_size) {
+		lut->state.bits.initialized = 0;
+		return;
+	}
+
+	/* Only supports 17x17x17 3D LUT (12-bit) now */
+	lut->lut_3d.use_12bits = true;
+	lut->lut_3d.use_tetrahedral_9 = false;
+
+	lut->state.bits.initialized = 1;
+	__drm_3dlut_32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				   lut->lut_3d.use_tetrahedral_9, 12);
+
+}
+
+static int
+__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_color_lut_32 *lut3d;
+	uint32_t lut3d_size;
+	int i = 0, ret = 0;
+
+	/* 3D LUT */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
+		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+			drm_dbg(dev, "3D LUT is not supported by hardware\n");
+			return -EINVAL;
+		}
+
+		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
+		lut3d = __extract_blob_lut_32(colorop_state->data, &lut3d_size);
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;
+		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
+
+		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
+		 * with TRANSFER_FUNCTION_LINEAR
+		 */
+		if (tf->type == TF_TYPE_BYPASS) {
+			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+			tf->tf = TRANSFER_FUNCTION_LINEAR;
+			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+			ret = __set_output_tf_32(tf, NULL, 0, false);
+		}
+	}
+
+	return ret;
+}
+
+static int
+__set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
+			     struct dc_plane_state *dc_plane_state,
+			     struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	enum dc_transfer_func_predefined default_tf = TRANSFER_FUNCTION_LINEAR;
+	struct dc_transfer_func *tf = &dc_plane_state->blend_tf;
+	const struct drm_color_lut_32 *blend_lut;
+	struct drm_device *dev = colorop->dev;
+	uint32_t blend_size;
+	int i = 0;
+
+	/* 1D Curve - BLND TF */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_CURVE &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend TF colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
+
+	/* 1D Curve - BLND LUT */
+	colorop = old_colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend LUT colorop found\n");
+		return -EINVAL;
+	}
+
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_1D_LUT) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_1D_LUT &&
+	    (BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
+		drm_dbg(dev, "Blend LUT colorop with ID: %d\n", colorop->base.id);
+		tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+		tf->tf = default_tf;
+		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+		blend_lut = __extract_blob_lut_32(colorop_state->data, &blend_size);
+		blend_size = blend_lut != NULL ? blend_size : 0;
+
+		/* Custom LUT size must be the same as supported size */
+		if (blend_size == colorop->lut_size)
+			__set_input_tf_32(NULL, tf, blend_lut, blend_size);
+	}
+
+	return 0;
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1187,6 +1819,93 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct drm_colorop *colorop = plane_state->color_pipeline;
+	struct drm_device *dev = plane_state->plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	int ret;
+
+	/* 1D Curve - DEGAM TF */
+	if (!colorop)
+		return -EINVAL;
+
+	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D Curve & LUT - SHAPER TF & LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no Shaper TF colorop found\n");
+			return -EINVAL;
+		}
+
+		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
+
+		/* Shaper LUT colorop is already handled, just skip here */
+		colorop = colorop->next;
+		if (!colorop)
+			return -EINVAL;
+
+		/* 3D LUT */
+		colorop = colorop->next;
+		if (!colorop) {
+			drm_dbg(dev, "no 3D LUT colorop found\n");
+			return -EINVAL;
+		}
+
+		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
+		if (ret)
+			return ret;
+	}
+
+	/* 1D Curve & LUT - BLND TF & LUT */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no Blend TF colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_blend(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	/* BLND LUT colorop is already handled, just skip here */
+	colorop = colorop->next;
+	if (!colorop)
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -1283,5 +2002,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..fdb653548c9a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_print.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+#include <drm/drm_colorop.h>
+
+#include "amdgpu.h"
+#include "amdgpu_dm_colorop.h"
+#include "dc.h"
+
+const u64 amdgpu_dm_supported_degam_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
+
+const u64 amdgpu_dm_supported_shaper_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
+
+const u64 amdgpu_dm_supported_blnd_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
+
+#define MAX_COLOR_PIPELINE_OPS 10
+
+#define LUT3D_SIZE		17
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1D curve - DEGAM TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_degam_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	i++;
+
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
+	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
+		/* 1D curve - SHAPER TF */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,
+						DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 1D LUT - SHAPER LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+
+		/* 3D LUT */
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+		if (!ops[i]) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+					DRM_COLOROP_FLAG_ALLOW_BYPASS);
+		if (ret)
+			goto cleanup;
+
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+		i++;
+	}
+	/* 1D curve - BLND TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+					      amdgpu_dm_supported_blnd_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
+	/* 1D LUT - BLND LUT */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+	return 0;
+
+cleanup:
+	if (ret == -ENOMEM)
+		drm_err(plane->dev, "KMS: Failed to allocate colorop\n");
+
+	drm_colorop_pipeline_destroy(plane);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..2e1617ffc8ee
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __AMDGPU_DM_COLOROP_H__
+#define __AMDGPU_DM_COLOROP_H__
+
+extern const u64 amdgpu_dm_supported_degam_tfs;
+extern const u64 amdgpu_dm_supported_shaper_tfs;
+extern const u64 amdgpu_dm_supported_blnd_tfs;
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
+
+#endif /* __AMDGPU_DM_COLOROP_H__*/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 87058271b00c..62bb4855306d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -685,7 +685,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 {
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
-	bool is_dcn;
+	bool has_degamma;
 	int res = -ENOMEM;
 
 	cursor_plane = kzalloc(sizeof(*cursor_plane), GFP_KERNEL);
@@ -724,11 +724,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
 
-	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
-	 * support programmable degamma anywhere.
+	/* Don't enable DRM CRTC degamma property for
+	 * 1. Degamma is replaced by color pipeline.
+	 * 2. DCE since it doesn't support programmable degamma anywhere.
 	 */
-	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
-	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
+	if (plane->color_pipeline_property)
+		has_degamma = false;
+	else
+		has_degamma = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
+
+	drm_crtc_enable_color_mgmt(&acrtc->base, has_degamma ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
 
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b7c6e8d13435..9a56ade18314 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -37,6 +37,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1782,6 +1783,39 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 
 	return 0;
 }
+#else
+
+#define MAX_COLOR_PIPELINES 5
+
+static int
+dm_plane_init_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
+	int len = 0;
+	int ret;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
+	/* initialize pipeline */
+	if (dc->ctx->dce_version >= DCN_VERSION_3_0) {
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
+		if (ret) {
+			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
+				plane->base.id, ret);
+			return ret;
+		}
+		len++;
+	}
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	return 0;
+}
 #endif
 
 static const struct drm_plane_funcs dm_plane_funcs = {
@@ -1890,7 +1924,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#else
+	res = dm_plane_init_colorops(plane);
+	if (res)
+		return res;
 #endif
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9..3ab32fe7fe1c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -42,6 +42,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_writeback.h>
+#include <drm/drm_colorop.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -107,6 +108,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
 	kfree(state->connectors);
 	kfree(state->crtcs);
 	kfree(state->planes);
+	kfree(state->colorops);
 	kfree(state->private_objs);
 }
 EXPORT_SYMBOL(drm_atomic_state_default_release);
@@ -138,6 +140,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
 				sizeof(*state->planes), GFP_KERNEL);
 	if (!state->planes)
 		goto fail;
+	state->colorops = kcalloc(dev->mode_config.num_colorop,
+				  sizeof(*state->colorops), GFP_KERNEL);
+	if (!state->colorops)
+		goto fail;
 
 	/*
 	 * Because drm_atomic_state can be committed asynchronously we need our
@@ -249,6 +255,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 		state->planes[i].new_state = NULL;
 	}
 
+	for (i = 0; i < config->num_colorop; i++) {
+		struct drm_colorop *colorop = state->colorops[i].ptr;
+
+		if (!colorop)
+			continue;
+
+		drm_colorop_atomic_destroy_state(colorop,
+						 state->colorops[i].state);
+		state->colorops[i].ptr = NULL;
+		state->colorops[i].state = NULL;
+		state->colorops[i].old_state = NULL;
+		state->colorops[i].new_state = NULL;
+	}
+
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
@@ -568,6 +588,56 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+
+/**
+ * drm_atomic_get_colorop_state - get colorop state
+ * @state: global atomic state object
+ * @colorop: colorop to get state object for
+ *
+ * This function returns the colorop state for the given colorop, allocating it
+ * if needed. It will also grab the relevant plane lock to make sure that the
+ * state is consistent.
+ *
+ * Returns:
+ *
+ * Either the allocated state or the error code encoded into the pointer. When
+ * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
+ * entire atomic sequence must be restarted. All other errors are fatal.
+ */
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop)
+{
+	int ret, index = drm_colorop_index(colorop);
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!state->acquire_ctx);
+
+	colorop_state = drm_atomic_get_new_colorop_state(state, colorop);
+	if (colorop_state)
+		return colorop_state;
+
+	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
+	if (!colorop_state)
+		return ERR_PTR(-ENOMEM);
+
+	state->colorops[index].state = colorop_state;
+	state->colorops[index].ptr = colorop;
+	state->colorops[index].old_state = colorop->state;
+	state->colorops[index].new_state = colorop_state;
+	colorop_state->state = state;
+
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
+
+	return colorop_state;
+}
+EXPORT_SYMBOL(drm_atomic_get_colorop_state);
+
 static bool
 plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 		     const struct drm_plane_state *new_plane_state)
@@ -707,6 +777,48 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+
+
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)
+{
+	struct drm_colorop *colorop = state->colorop;
+
+	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
+	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
+	if (colorop->bypass_property)
+		drm_printf(p, "\tbypass=%u\n", state->bypass);
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
+		break;
+	case DRM_COLOROP_3D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	default:
+		break;
+	}
+
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -728,7 +840,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1437,6 +1550,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
+/**
+ * drm_atomic_add_affected_colorops - add colorops for plane
+ * @state: atomic state
+ * @plane: DRM plane
+ *
+ * This function walks the current configuration and adds all colorops
+ * currently used by @plane to the atomic configuration @state. This is useful
+ * when an atomic commit also needs to check all currently enabled colorop on
+ * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
+ * to avoid special code to force-enable all colorops.
+ *
+ * Since acquiring a colorop state will always also acquire the w/w mutex of the
+ * current plane for that colorop (if there is any) adding all the colorop states for
+ * a plane will not reduce parallelism of atomic updates.
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+int
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
+		       plane->base.id, plane->name, state);
+
+	drm_for_each_colorop(colorop, plane->dev) {
+		if (colorop->plane != plane)
+			continue;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
+
 /**
  * drm_atomic_check_only - check whether a given config would work
  * @state: atomic configuration to check
@@ -1833,6 +1992,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1842,6 +2002,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
 
+	list_for_each_entry(colorop, &config->colorop_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&colorop->plane->mutex, NULL);
+		drm_atomic_colorop_print_state(p, colorop->state);
+		if (take_locks)
+			drm_modeset_unlock(&colorop->plane->mutex);
+	}
+
 	list_for_each_entry(plane, &config->plane_list, head) {
 		if (take_locks)
 			drm_modeset_lock(&plane->mutex, NULL);
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ef56b474acf5..3098b9928996 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3175,6 +3175,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
 	struct drm_crtc_commit *commit;
 	struct drm_private_obj *obj;
 	struct drm_private_state *old_obj_state, *new_obj_state;
@@ -3252,6 +3254,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		}
 	}
 
+	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
+		WARN_ON(colorop->state != old_colorop_state);
+
+		old_colorop_state->state = state;
+		new_colorop_state->state = NULL;
+
+		state->colorops[i].state = old_colorop_state;
+		colorop->state = new_colorop_state;
+	}
+
 	drm_panic_lock(state->dev, flags);
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		WARN_ON(plane->state != old_plane_state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618..cee6d8fc44ad 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -268,6 +268,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 			plane_state->color_range = val;
 	}
 
+	if (plane->color_pipeline_property) {
+		/* default is always NULL, i.e., bypass */
+		plane_state->color_pipeline = NULL;
+	}
+
 	if (plane->zpos_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->zpos_property,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ecc73d52bfae..3a9dc98d7653 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -35,6 +35,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_writeback.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_colorop.h>
 
 #include <linux/export.h>
 #include <linux/dma-fence.h>
@@ -257,6 +258,36 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
 
+
+/**
+ * drm_atomic_set_colorop_for_plane - set colorop for plane
+ * @plane_state: atomic state object for the plane
+ * @colorop: colorop to use for the plane
+ *
+ * Helper function to select the color pipeline on a plane by setting
+ * it to the first drm_colorop element of the pipeline.
+ */
+void
+drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				 struct drm_colorop *colorop)
+{
+	struct drm_plane *plane = plane_state->plane;
+
+	if (colorop)
+		drm_dbg_atomic(plane->dev,
+			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
+			       colorop->base.id, plane->base.id, plane->name,
+			       plane_state);
+	else
+		drm_dbg_atomic(plane->dev,
+			       "Set [NOCOLOROP] for [PLANE:%d:%s] state %p\n",
+			       plane->base.id, plane->name, plane_state);
+
+	plane_state->color_pipeline = colorop;
+}
+EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
+
+
 /**
  * drm_atomic_set_crtc_for_connector - set CRTC for connector
  * @conn_state: atomic state object for the connector
@@ -537,9 +568,35 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->zpos_property) {
 		state->zpos = val;
 	} else if (property == plane->color_encoding_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_ENCODING plane property not permitted with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_RANGE plane property not permitted with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		state->color_range = val;
+	} else if (property == plane->color_pipeline_property) {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted unless DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
+
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -622,6 +679,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
@@ -644,6 +703,95 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+					      struct drm_colorop_state *state,
+					      struct drm_property *property,
+					      uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced = false;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->lut_size * sizeof(struct drm_color_lut_32);
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	case DRM_COLOROP_3D_LUT:
+		size = colorop->lut_size * colorop->lut_size * colorop->lut_size *
+		       sizeof(struct drm_color_lut_32);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_property_replace_blob_from_id(colorop->dev,
+						 &state->data,
+						 val,
+						 size,
+						 elem_size,
+						 &replaced);
+}
+
+static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
+{
+	if (property == colorop->bypass_property) {
+		state->bypass = val;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		colorop->lut1d_interpolation = val;
+	} else if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		colorop->lut3d_interpolation = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop, state,
+							  property, val);
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+drm_atomic_colorop_get_property(struct drm_colorop *colorop,
+		const struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t *val)
+{
+	if (property == colorop->type_property) {
+		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
+	} else if (property == colorop->lut1d_interpolation_property) {
+		*val = colorop->lut1d_interpolation;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
+	} else if (property == colorop->lut_size_property) {
+		*val = colorop->lut_size;
+	} else if (property == colorop->lut3d_interpolation_property) {
+		*val = colorop->lut3d_interpolation;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int drm_atomic_set_writeback_fb_for_connector(
 		struct drm_connector_state *conn_state,
 		struct drm_framebuffer *fb)
@@ -910,6 +1058,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 				plane->state, property, val);
 		break;
 	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+
+		if (colorop->plane)
+			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
+
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);
+		break;
+	}
 	default:
 		drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
 		ret = -EINVAL;
@@ -1106,6 +1264,28 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_plane_set_property(plane,
 				plane_state, file_priv,
 				prop, prop_value);
+
+		break;
+	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(prop->dev,
+				       "[OBJECT:%d] is a colorop but DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set\n",
+				       obj->id);
+			ret = -EINVAL;
+		}
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+		struct drm_colorop_state *colorop_state;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state)) {
+			ret = PTR_ERR(colorop_state);
+			break;
+		}
+
+		ret = drm_atomic_colorop_set_property(colorop,
+				colorop_state, file_priv,
+				prop, prop_value);
 		break;
 	}
 	default:
@@ -1445,6 +1625,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 37a3270bc3c2..3908828c6a9c 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -840,3 +840,46 @@ void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_pa
 		fill_palette_8(crtc, i, set_palette);
 }
 EXPORT_SYMBOL(drm_crtc_fill_palette_8);
+
+/**
+ * drm_color_lut_32_check - check validity of extended lookup table
+ * @lut: property blob containing extended LUT to check
+ * @tests: bitmask of tests to run
+ *
+ * Helper to check whether a userspace-provided extended lookup table is valid and
+ * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
+ * the tests in &drm_color_lut_tests should be performed.
+ *
+ * Returns 0 on success, -EINVAL on failure.
+ */
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests)
+{
+	const struct drm_color_lut_32 *entry;
+	int i;
+
+	if (!lut || !tests)
+		return 0;
+
+	entry = lut->data;
+	for (i = 0; i < drm_color_lut_32_size(lut); i++) {
+		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
+			if (entry[i].red != entry[i].blue ||
+			    entry[i].red != entry[i].green) {
+				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
+				return -EINVAL;
+			}
+		}
+
+		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
+			if (entry[i].red < entry[i - 1].red ||
+			    entry[i].green < entry[i - 1].green ||
+			    entry[i].blue < entry[i - 1].blue) {
+				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_color_lut_32_check);
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
new file mode 100644
index 000000000000..52c08d717944
--- /dev/null
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -0,0 +1,598 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_plane.h>
+
+#include "drm_crtc_internal.h"
+
+/**
+ * DOC: overview
+ *
+ * When userspace signals the &DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE it
+ * should use the COLOR_PIPELINE plane property and associated colorops
+ * for any color operation on the &drm_plane. Setting of all old color
+ * properties, such as COLOR_ENCODING and COLOR_RANGE, will be rejected
+ * and the values of the properties will be ignored.
+ *
+ * Colorops are only advertised and valid for atomic drivers and atomic
+ * userspace that signals the &DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ * client cap.
+ *
+ * A colorop represents a single color operation. Colorops are chained
+ * via the NEXT property and make up color pipelines. Color pipelines
+ * are advertised and selected via the COLOR_PIPELINE &drm_plane
+ * property.
+ *
+ * A colorop will be of a certain type, advertised by the read-only TYPE
+ * property. Each type of colorop will advertise a different set of
+ * properties and is programmed in a different manner. Types can be
+ * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
+ * &drm_colorop_type documentation for information on each type.
+ *
+ * If a colorop advertises the BYPASS property it can be bypassed.
+ *
+ * Information about colorop and color pipeline design decisions can be
+ * found at rfc/color_pipeline.rst, but note that this document will
+ * grow stale over time.
+ */
+
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D LUT" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
+	{ DRM_COLOROP_3D_LUT, "3D LUT"},
+};
+
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
+};
+
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
+
+
+static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
+};
+
+/* Init Helpers */
+
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+	colorop->next = NULL;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	if (flags & DRM_COLOROP_FLAG_ALLOW_BYPASS) {
+		/* bypass */
+		prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+						"BYPASS");
+		if (!prop)
+			return -ENOMEM;
+
+		colorop->bypass_property = prop;
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,
+					1);
+	}
+
+	/* next */
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					  "NEXT", DRM_MODE_OBJECT_COLOROP);
+	if (!prop)
+		return -ENOMEM;
+	colorop->next_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->next_property,
+				   0);
+
+	return ret;
+}
+
+/**
+ * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
+ *
+ * @colorop: The drm_colorop object to be cleaned
+ */
+static void drm_colorop_cleanup(struct drm_colorop *colorop)
+{
+	struct drm_device *dev = colorop->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	list_del(&colorop->head);
+	config->num_colorop--;
+
+	if (colorop->state && colorop->state->data) {
+		drm_property_blob_put(colorop->state->data);
+		colorop->state->data = NULL;
+	}
+
+	kfree(colorop->state);
+}
+
+/**
+ * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
+ *
+ * @plane: - The drm_plane structure containing the color_pipeline
+ *
+ * Provides a default color pipeline destroy handler for a planes.
+ */
+void drm_colorop_pipeline_destroy(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop, *next;
+
+	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
+		drm_colorop_cleanup(colorop);
+		kfree(colorop);
+	}
+}
+EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
+
+/**
+ * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
+
+static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
+{
+	struct drm_property *prop;
+
+	/* data */
+	prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+				   "DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->data_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->data_property,
+				   0);
+
+	return 0;
+}
+
+/**
+ * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size,
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT1D_INTERPOLATION",
+					drm_colorop_lut1d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut1d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut1d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, lut1d_interpolation);
+	colorop->lut1d_interpolation = lut1d_interpolation;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
+
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
+
+/**
+ * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAGS_* defines.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane, uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER, flags);
+	if (ret)
+		return ret;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->multiplier_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_mult_init);
+
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, flags);
+	if (ret)
+		return ret;
+
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE  | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
+	colorop->lut_size = lut_size;
+
+	/* interpolation */
+	prop = drm_property_create_enum(dev, 0, "LUT3D_INTERPOLATION",
+					drm_colorop_lut3d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut3d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut3d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, interpolation);
+	colorop->lut3d_interpolation = interpolation;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
+
+static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
+							struct drm_colorop_state *state)
+{
+	memcpy(state, colorop->state, sizeof(*state));
+
+	if (state->data)
+		drm_property_blob_get(state->data);
+
+	state->bypass = true;
+}
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *state;
+
+	if (WARN_ON(!colorop->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
+
+	return state;
+}
+
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state)
+{
+	kfree(state);
+}
+
+/**
+ * __drm_colorop_state_reset - resets colorop state to default values
+ * @colorop_state: atomic colorop state, must not be NULL
+ * @colorop: colorop object, must not be NULL
+ *
+ * Initializes the newly allocated @colorop_state with default
+ * values. This is useful for drivers that subclass the CRTC state.
+ */
+static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
+				      struct drm_colorop *colorop)
+{
+	u64 val;
+
+	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
+
+	if (colorop->curve_1d_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,
+						&val);
+		colorop_state->curve_1d_type = val;
+	}
+}
+
+/**
+ * __drm_colorop_reset - reset state on colorop
+ * @colorop: drm colorop
+ * @colorop_state: colorop state to assign
+ *
+ * Initializes the newly allocated @colorop_state and assigns it to
+ * the &drm_crtc->state pointer of @colorop, usually required when
+ * initializing the drivers or when called from the &drm_colorop_funcs.reset
+ * hook.
+ *
+ * This is useful for drivers that subclass the colorop state.
+ */
+static void __drm_colorop_reset(struct drm_colorop *colorop,
+				struct drm_colorop_state *colorop_state)
+{
+	if (colorop_state)
+		__drm_colorop_state_reset(colorop_state, colorop);
+
+	colorop->state = colorop_state;
+}
+
+void drm_colorop_reset(struct drm_colorop *colorop)
+{
+	kfree(colorop->state);
+	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
+
+	if (colorop->state)
+		__drm_colorop_reset(colorop, colorop->state);
+}
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D LUT",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
+};
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
+};
+
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
+
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
+
+/**
+ * drm_get_colorop_lut1d_interpolation_name: return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lut1d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lut1d_interpolation_name[type];
+}
+
+/**
+ * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lu3d_interpolation_name[type];
+}
+
+/**
+ * drm_colorop_set_next_property - sets the next pointer
+ * @colorop: drm colorop
+ * @next: next colorop
+ *
+ * Should be used when constructing the color pipeline
+ */
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next)
+{
+	drm_object_property_set_value(&colorop->base,
+				      colorop->next_property,
+				      next ? next->base.id : 0);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..5c89c586da7c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -373,6 +373,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->supports_virtualized_cursor_plane = req->value;
 		break;
+	case DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->plane_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a..d12db9b0bab8 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -30,6 +30,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
+#include <drm/drm_colorop.h>
 #include <linux/dma-resv.h>
 
 #include "drm_crtc_internal.h"
@@ -192,11 +193,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
+	drm_for_each_colorop(colorop, dev)
+		drm_colorop_reset(colorop);
+
 	drm_for_each_plane(plane, dev)
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
@@ -437,6 +442,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
+	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
 	idr_init_base(&dev->mode_config.object_idr, 1);
 	idr_init_base(&dev->mode_config.tile_idr, 1);
@@ -458,6 +464,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	dev->mode_config.num_crtc = 0;
 	dev->mode_config.num_encoder = 0;
 	dev->mode_config.num_total_plane = 0;
+	dev->mode_config.num_colorop = 0;
 
 	if (IS_ENABLED(CONFIG_LOCKDEP)) {
 		struct drm_modeset_acquire_ctx modeset_ctx;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 38f82391bfda..f6cfa8ac090c 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1820,3 +1820,62 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_add_size_hints_property);
+
+/**
+ * drm_plane_create_color_pipeline_property - create a new color pipeline
+ * property
+ *
+ * @plane: drm plane
+ * @pipelines: list of pipelines
+ * @num_pipelines: number of pipelines
+ *
+ * Create the COLOR_PIPELINE plane property to specific color pipelines on
+ * the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines)
+{
+	struct drm_prop_enum_list *all_pipelines;
+	struct drm_property *prop;
+	int len = 0;
+	int i;
+
+	all_pipelines = kcalloc(num_pipelines + 1,
+				sizeof(*all_pipelines),
+				GFP_KERNEL);
+
+	if (!all_pipelines) {
+		drm_err(plane->dev, "failed to allocate color pipeline\n");
+		return -ENOMEM;
+	}
+
+	/* Create default Bypass color pipeline */
+	all_pipelines[len].type = 0;
+	all_pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add all other color pipelines */
+	for (i = 0; i < num_pipelines; i++, len++) {
+		all_pipelines[len].type = pipelines[i].type;
+		all_pipelines[len].name = pipelines[i].name;
+	}
+
+	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					all_pipelines, len);
+	if (IS_ERR(prop)) {
+		kfree(all_pipelines);
+		return PTR_ERR(prop);
+	}
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_pipeline_property = prop;
+
+	kfree(all_pipelines);
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index c0e952293ad0..87d5d5f9332a 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o \
-	drm_sysfb_modeset_test.o
+	drm_sysfb_modeset_test.o \
+	drm_fixp_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
new file mode 100644
index 000000000000..de91177af213
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_fixp_test.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_fixed.h>
+
+static void drm_test_sm2fixp(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1ull << 63) - 1));
+
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1),
+			drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
+
+	/* 0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2),
+			drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2),
+			drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
+}
+
+static void drm_test_int2fixp(struct kunit *test)
+{
+	/* 1 */
+	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
+
+	/* -1 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
+
+	/* 1 + (-1) = 0 */
+	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
+
+	/* 1 / 2 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
+
+	/* -0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
+
+	/* (1 / 2) + (-1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
+
+	/* (1 / 2) - 1) = 0.5 */
+	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
+}
+
+static struct kunit_case drm_fixp_tests[] = {
+	KUNIT_CASE(drm_test_int2fixp),
+	KUNIT_CASE(drm_test_sm2fixp),
+	{ }
+};
+
+static struct kunit_suite drm_rect_test_suite = {
+	.name = "drm_fixp",
+	.test_cases = drm_fixp_tests,
+};
+
+kunit_test_suite(drm_rect_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
+MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index d657865e573f..0b8936674f69 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -8,7 +8,9 @@ vkms-y := \
 	vkms_composer.o \
 	vkms_writeback.o \
 	vkms_connector.o \
-	vkms_config.o
+	vkms_config.o \
+	vkms_colorop.o \
+	vkms_luts.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 5750f0bd9d40..f5bc7ca23ca2 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -4,4 +4,4 @@ vkms-kunit-tests-y := \
 	vkms_config_test.o \
 	vkms_format_test.o
 
-obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o vkms_color_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
new file mode 100644
index 000000000000..a9c3af5025b3
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_mode.h>
+#include "../vkms_drv.h"
+#include "../vkms_composer.h"
+#include "../vkms_luts.h"
+
+#define TEST_LUT_SIZE 16
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+static const struct vkms_color_lut test_linear_lut = {
+	.base = test_linear_array,
+	.lut_length = TEST_LUT_SIZE,
+	.channel_value2index_ratio = 0xf000fll
+};
+
+static void vkms_color_test_get_lut_index(struct kunit *test)
+{
+	s64 lut_index;
+	int i;
+
+	lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
+
+	for (i = 0; i < TEST_LUT_SIZE; i++) {
+		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
+		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
+	}
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
+
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
+	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
+}
+
+static void vkms_color_test_lerp(struct kunit *test)
+{
+	/*** half-way round down ***/
+	s64 t = 0x80000000 - 1;
+
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** half-way round up ***/
+	t = 0x80000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 ***/
+	t = 0x0;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 ***/
+	t = 0x100000000;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t = 0.0 + 1 ***/
+	t = 0x0 + 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
+
+	/*** t = 1.0 - 1 ***/
+	t = 0x100000000 - 1;
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
+
+	/* odd a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
+
+	/* odd b */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
+
+	/* b = a */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
+
+	/* b = a + 1 */
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
+
+	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
+	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
+}
+
+static void vkms_color_test_linear(struct kunit *test)
+{
+	for (int i = 0; i < LUT_SIZE; i++) {
+		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
+
+		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
+	}
+}
+
+static void vkms_color_srgb_inv_srgb(struct kunit *test)
+{
+	u16 srgb, final;
+
+	for (int i = 0; i < LUT_SIZE; i++) {
+		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
+		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
+
+		KUNIT_EXPECT_GE(test, final / 0x101, i - 1);
+		KUNIT_EXPECT_LE(test, final / 0x101, i + 1);
+	}
+}
+
+#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
+#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
+
+static const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
+	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
+	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
+} };
+
+static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
+{
+	struct pixel_argb_s32 ref, out;
+
+	/* full white */
+	ref.a = 0xffff;
+	ref.r = 0xffff;
+	ref.g = 0xffff;
+	ref.b = 0xffff;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full black */
+	ref.a = 0xffff;
+	ref.r = 0x0;
+	ref.g = 0x0;
+	ref.b = 0x0;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* 50% grey */
+	ref.a = 0xffff;
+	ref.r = 0x8000;
+	ref.g = 0x8000;
+	ref.b = 0x8000;
+
+	memcpy(&out, &ref, sizeof(out));
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+
+	/* full red to 50% desat */
+	ref.a = 0xffff;
+	ref.r = 0x8000;
+	ref.g = 0x4000;
+	ref.b = 0x4000;
+
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
+
+	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
+}
+
+/*
+ * BT.709 encoding matrix
+ *
+ * Values printed from within IGT when converting
+ * igt_matrix_3x4_bt709_enc to the fixed-point format expected
+ * by DRM/KMS.
+ */
+static const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
+	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
+	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
+	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
+} };
+
+static void vkms_color_ctm_3x4_bt709(struct kunit *test)
+{
+	struct pixel_argb_s32 out;
+
+	/* full white to bt709 */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0xffff;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 255 */
+	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
+	KUNIT_EXPECT_LT(test, out.r, 0x10000);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* full black to bt709 */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 0 */
+	KUNIT_EXPECT_LT(test, out.r, 0x100);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* gray to bt709 */
+	out.a = 0xffff;
+	out.r = 0x7fff;
+	out.g = 0x7fff;
+	out.b = 0x7fff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 127 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8000);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 54 */
+	KUNIT_EXPECT_GT(test, out.r, 0x3500);
+	KUNIT_EXPECT_LT(test, out.r, 0x3700);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 157 */
+	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
+	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
+
+
+	/* == green 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0xffff;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 182 */
+	KUNIT_EXPECT_GT(test, out.r, 0xB500);
+	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x0100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == blue 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 18 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1100);
+	KUNIT_EXPECT_LT(test, out.r, 0x1300);
+
+	/* U 111 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
+	KUNIT_EXPECT_LT(test, out.g, 0x7000);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x0100);
+
+	/* == red 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x8c8c;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
+	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* V 87 */
+	KUNIT_EXPECT_GT(test, out.b, 0x5600);
+	KUNIT_EXPECT_LT(test, out.b, 0x5800);
+
+	/* == green 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x8c8c;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x6400);
+	KUNIT_EXPECT_LT(test, out.r, 0x6600);
+
+	/* U 0 */
+	KUNIT_EXPECT_LT(test, out.g, 0x100);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+
+	/* == blue 140 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x8c8c;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
+
+	/* Y 30 */
+	KUNIT_EXPECT_GT(test, out.r, 0x900);
+	KUNIT_EXPECT_LT(test, out.r, 0xB00);
+
+	/* U 61 */
+	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
+	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
+
+	/* V 0 */
+	KUNIT_EXPECT_LT(test, out.b, 0x100);
+
+}
+
+static struct kunit_case vkms_color_test_cases[] = {
+	KUNIT_CASE(vkms_color_test_get_lut_index),
+	KUNIT_CASE(vkms_color_test_lerp),
+	KUNIT_CASE(vkms_color_test_linear),
+	KUNIT_CASE(vkms_color_srgb_inv_srgb),
+	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
+	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
+	{}
+};
+
+static struct kunit_suite vkms_color_test_suite = {
+	.name = "vkms-color",
+	.test_cases = vkms_color_test_cases,
+};
+
+kunit_test_suite(vkms_color_test_suite);
+
+MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
new file mode 100644
index 000000000000..f61834d2ea30
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/slab.h>
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_property.h>
+#include <drm/drm_plane.h>
+
+#include "vkms_drv.h"
+
+static const u64 supported_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
+
+#define MAX_COLOR_PIPELINE_OPS 4
+
+static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1st op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	i++;
+
+	/* 2nd op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 3rd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 4th op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs,
+					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	return 0;
+
+cleanup:
+	drm_colorop_pipeline_destroy(plane);
+
+	return ret;
+}
+
+int vkms_initialize_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipeline;
+	int ret;
+
+	/* Add color pipeline */
+	ret = vkms_initialize_color_pipeline(plane, &pipeline);
+	if (ret)
+		return ret;
+
+	/* Create COLOR_PIPELINE property and attach */
+	ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..54fd00b49360 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -12,6 +12,9 @@
 #include <linux/minmax.h>
 
 #include "vkms_drv.h"
+#include <kunit/visibility.h>
+#include "vkms_composer.h"
+#include "vkms_luts.h"
 
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
@@ -60,7 +63,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 // lerp(a, b, t) = a + (b - a) * t
-static u16 lerp_u16(u16 a, u16 b, s64 t)
+VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
 {
 	s64 a_fp = drm_int2fixp(a);
 	s64 b_fp = drm_int2fixp(b);
@@ -69,27 +72,18 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	return drm_fixp2int_round(a_fp + delta);
 }
+EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
 
-static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
 {
 	s64 color_channel_fp = drm_int2fixp(channel_value);
 
 	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
 }
+EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
 
-/*
- * This enum is related to the positions of the variables inside
- * `struct drm_color_lut`, so the order of both needs to be the same.
- */
-enum lut_channel {
-	LUT_RED = 0,
-	LUT_GREEN,
-	LUT_BLUE,
-	LUT_RESERVED
-};
-
-static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
-				      enum lut_channel channel)
+VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+						enum lut_channel channel)
 {
 	s64 lut_index = get_lut_index(lut, channel_value);
 	u16 *floor_lut_value, *ceil_lut_value;
@@ -114,6 +108,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
 	return lerp_u16(floor_channel_value, ceil_channel_value,
 			lut_index & DRM_FIXED_DECIMAL_MASK);
 }
+EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
+
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
@@ -132,6 +128,112 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
+				       const struct drm_color_ctm_3x4 *matrix)
+{
+	s64 rf, gf, bf;
+	s64 r, g, b;
+
+	r = drm_int2fixp(pixel->r);
+	g = drm_int2fixp(pixel->g);
+	b = drm_int2fixp(pixel->b);
+
+	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
+	     drm_sm2fixp(matrix->matrix[3]);
+
+	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
+	     drm_sm2fixp(matrix->matrix[7]);
+
+	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
+	     drm_sm2fixp(matrix->matrix[11]);
+
+	pixel->r = drm_fixp2int_round(rf);
+	pixel->g = drm_fixp2int_round(gf);
+	pixel->b = drm_fixp2int_round(bf);
+}
+EXPORT_SYMBOL_IF_KUNIT(apply_3x4_matrix);
+
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *colorop_state = colorop->state;
+	struct drm_device *dev = colorop->dev;
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		switch (colorop_state->curve_1d_type) {
+		case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+			pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
+			pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
+			pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
+			break;
+		case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+			pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
+			pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
+			pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
+			break;
+		default:
+			drm_WARN_ONCE(dev, true,
+				      "unknown colorop 1D curve type %d\n",
+				      colorop_state->curve_1d_type);
+			break;
+		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel,
+					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);
+	}
+}
+
+static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
+				      struct line_buffer *output_buffer)
+{
+	struct pixel_argb_s32 pixel;
+
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+
+		/*
+		 * Some operations, such as applying a BT709 encoding matrix,
+		 * followed by a decoding matrix, require that we preserve
+		 * values above 1.0 and below 0.0 until the end of the pipeline.
+		 *
+		 * Pack the 16-bit UNORM values into s32 to give us head-room to
+		 * avoid clipping until we're at the end of the pipeline. Clip
+		 * intentionally at the end of the pipeline before packing
+		 * UNORM values back into u16.
+		 */
+		pixel.a = output_buffer->pixels[x].a;
+		pixel.r = output_buffer->pixels[x].r;
+		pixel.g = output_buffer->pixels[x].g;
+		pixel.b = output_buffer->pixels[x].b;
+
+		while (colorop) {
+			struct drm_colorop_state *colorop_state;
+
+			colorop_state = colorop->state;
+
+			if (!colorop_state)
+				return;
+
+			if (!colorop_state->bypass)
+				apply_colorop(&pixel, colorop);
+
+			colorop = colorop->next;
+		}
+
+		/* clamp values */
+		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
+		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
+		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
+		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
+	}
+}
+
 /**
  * direction_for_rotation() - Get the correct reading direction for a given rotation
  *
@@ -347,7 +449,7 @@ static void blend_line(struct vkms_plane_state *current_plane, int y,
 	 */
 	current_plane->pixel_read_line(current_plane, src_x_start, src_y_start, direction,
 				       pixel_count, &stage_buffer->pixels[dst_x_start]);
-
+	pre_blend_color_transform(current_plane, stage_buffer);
 	pre_mul_alpha_blend(stage_buffer, output_buffer,
 			    dst_x_start, pixel_count);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
new file mode 100644
index 000000000000..afef65a5c3ba
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_COMPOSER_H_
+#define _VKMS_COMPOSER_H_
+
+#include <kunit/visibility.h>
+
+/*
+ * This enum is related to the positions of the variables inside
+ * `struct drm_color_lut`, so the order of both needs to be the same.
+ */
+enum lut_channel {
+	LUT_RED = 0,
+	LUT_GREEN,
+	LUT_BLUE,
+	LUT_RESERVED
+};
+
+#if IS_ENABLED(CONFIG_KUNIT)
+u16 lerp_u16(u16 a, u16 b, s64 t);
+s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
+u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+			       enum lut_channel channel);
+void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
+#endif
+
+#endif /* _VKMS_COMPOSER_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 68b5e3fce455..c2cdae6bdefd 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -45,6 +45,9 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
 /**
  * struct pixel_argb_u16 - Internal representation of a pixel color.
  * @a: Alpha component value, stored in 16 bits, without padding, using
@@ -300,4 +303,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
 
+/* Colorops */
+int vkms_initialize_colorops(struct drm_plane *plane);
+
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
new file mode 100644
index 000000000000..7e8d3070deea
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_luts.c
@@ -0,0 +1,808 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_mode.h>
+
+#include "vkms_drv.h"
+#include "vkms_luts.h"
+
+/*
+ * These luts were generated with a LUT generated based on
+ * skia's transfer function code. The LUT generator can be
+ * found at
+ * https://gitlab.freedesktop.org/hwentland/lutgen
+ */
+
+static struct drm_color_lut linear_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x101, 0x101, 0x101, 0 },
+	{ 0x202, 0x202, 0x202, 0 },
+	{ 0x303, 0x303, 0x303, 0 },
+	{ 0x404, 0x404, 0x404, 0 },
+	{ 0x505, 0x505, 0x505, 0 },
+	{ 0x606, 0x606, 0x606, 0 },
+	{ 0x707, 0x707, 0x707, 0 },
+	{ 0x808, 0x808, 0x808, 0 },
+	{ 0x909, 0x909, 0x909, 0 },
+	{ 0xa0a, 0xa0a, 0xa0a, 0 },
+	{ 0xb0b, 0xb0b, 0xb0b, 0 },
+	{ 0xc0c, 0xc0c, 0xc0c, 0 },
+	{ 0xd0d, 0xd0d, 0xd0d, 0 },
+	{ 0xe0e, 0xe0e, 0xe0e, 0 },
+	{ 0xf0f, 0xf0f, 0xf0f, 0 },
+	{ 0x1010, 0x1010, 0x1010, 0 },
+	{ 0x1111, 0x1111, 0x1111, 0 },
+	{ 0x1212, 0x1212, 0x1212, 0 },
+	{ 0x1313, 0x1313, 0x1313, 0 },
+	{ 0x1414, 0x1414, 0x1414, 0 },
+	{ 0x1515, 0x1515, 0x1515, 0 },
+	{ 0x1616, 0x1616, 0x1616, 0 },
+	{ 0x1717, 0x1717, 0x1717, 0 },
+	{ 0x1818, 0x1818, 0x1818, 0 },
+	{ 0x1919, 0x1919, 0x1919, 0 },
+	{ 0x1a1a, 0x1a1a, 0x1a1a, 0 },
+	{ 0x1b1b, 0x1b1b, 0x1b1b, 0 },
+	{ 0x1c1c, 0x1c1c, 0x1c1c, 0 },
+	{ 0x1d1d, 0x1d1d, 0x1d1d, 0 },
+	{ 0x1e1e, 0x1e1e, 0x1e1e, 0 },
+	{ 0x1f1f, 0x1f1f, 0x1f1f, 0 },
+	{ 0x2020, 0x2020, 0x2020, 0 },
+	{ 0x2121, 0x2121, 0x2121, 0 },
+	{ 0x2222, 0x2222, 0x2222, 0 },
+	{ 0x2323, 0x2323, 0x2323, 0 },
+	{ 0x2424, 0x2424, 0x2424, 0 },
+	{ 0x2525, 0x2525, 0x2525, 0 },
+	{ 0x2626, 0x2626, 0x2626, 0 },
+	{ 0x2727, 0x2727, 0x2727, 0 },
+	{ 0x2828, 0x2828, 0x2828, 0 },
+	{ 0x2929, 0x2929, 0x2929, 0 },
+	{ 0x2a2a, 0x2a2a, 0x2a2a, 0 },
+	{ 0x2b2b, 0x2b2b, 0x2b2b, 0 },
+	{ 0x2c2c, 0x2c2c, 0x2c2c, 0 },
+	{ 0x2d2d, 0x2d2d, 0x2d2d, 0 },
+	{ 0x2e2e, 0x2e2e, 0x2e2e, 0 },
+	{ 0x2f2f, 0x2f2f, 0x2f2f, 0 },
+	{ 0x3030, 0x3030, 0x3030, 0 },
+	{ 0x3131, 0x3131, 0x3131, 0 },
+	{ 0x3232, 0x3232, 0x3232, 0 },
+	{ 0x3333, 0x3333, 0x3333, 0 },
+	{ 0x3434, 0x3434, 0x3434, 0 },
+	{ 0x3535, 0x3535, 0x3535, 0 },
+	{ 0x3636, 0x3636, 0x3636, 0 },
+	{ 0x3737, 0x3737, 0x3737, 0 },
+	{ 0x3838, 0x3838, 0x3838, 0 },
+	{ 0x3939, 0x3939, 0x3939, 0 },
+	{ 0x3a3a, 0x3a3a, 0x3a3a, 0 },
+	{ 0x3b3b, 0x3b3b, 0x3b3b, 0 },
+	{ 0x3c3c, 0x3c3c, 0x3c3c, 0 },
+	{ 0x3d3d, 0x3d3d, 0x3d3d, 0 },
+	{ 0x3e3e, 0x3e3e, 0x3e3e, 0 },
+	{ 0x3f3f, 0x3f3f, 0x3f3f, 0 },
+	{ 0x4040, 0x4040, 0x4040, 0 },
+	{ 0x4141, 0x4141, 0x4141, 0 },
+	{ 0x4242, 0x4242, 0x4242, 0 },
+	{ 0x4343, 0x4343, 0x4343, 0 },
+	{ 0x4444, 0x4444, 0x4444, 0 },
+	{ 0x4545, 0x4545, 0x4545, 0 },
+	{ 0x4646, 0x4646, 0x4646, 0 },
+	{ 0x4747, 0x4747, 0x4747, 0 },
+	{ 0x4848, 0x4848, 0x4848, 0 },
+	{ 0x4949, 0x4949, 0x4949, 0 },
+	{ 0x4a4a, 0x4a4a, 0x4a4a, 0 },
+	{ 0x4b4b, 0x4b4b, 0x4b4b, 0 },
+	{ 0x4c4c, 0x4c4c, 0x4c4c, 0 },
+	{ 0x4d4d, 0x4d4d, 0x4d4d, 0 },
+	{ 0x4e4e, 0x4e4e, 0x4e4e, 0 },
+	{ 0x4f4f, 0x4f4f, 0x4f4f, 0 },
+	{ 0x5050, 0x5050, 0x5050, 0 },
+	{ 0x5151, 0x5151, 0x5151, 0 },
+	{ 0x5252, 0x5252, 0x5252, 0 },
+	{ 0x5353, 0x5353, 0x5353, 0 },
+	{ 0x5454, 0x5454, 0x5454, 0 },
+	{ 0x5555, 0x5555, 0x5555, 0 },
+	{ 0x5656, 0x5656, 0x5656, 0 },
+	{ 0x5757, 0x5757, 0x5757, 0 },
+	{ 0x5858, 0x5858, 0x5858, 0 },
+	{ 0x5959, 0x5959, 0x5959, 0 },
+	{ 0x5a5a, 0x5a5a, 0x5a5a, 0 },
+	{ 0x5b5b, 0x5b5b, 0x5b5b, 0 },
+	{ 0x5c5c, 0x5c5c, 0x5c5c, 0 },
+	{ 0x5d5d, 0x5d5d, 0x5d5d, 0 },
+	{ 0x5e5e, 0x5e5e, 0x5e5e, 0 },
+	{ 0x5f5f, 0x5f5f, 0x5f5f, 0 },
+	{ 0x6060, 0x6060, 0x6060, 0 },
+	{ 0x6161, 0x6161, 0x6161, 0 },
+	{ 0x6262, 0x6262, 0x6262, 0 },
+	{ 0x6363, 0x6363, 0x6363, 0 },
+	{ 0x6464, 0x6464, 0x6464, 0 },
+	{ 0x6565, 0x6565, 0x6565, 0 },
+	{ 0x6666, 0x6666, 0x6666, 0 },
+	{ 0x6767, 0x6767, 0x6767, 0 },
+	{ 0x6868, 0x6868, 0x6868, 0 },
+	{ 0x6969, 0x6969, 0x6969, 0 },
+	{ 0x6a6a, 0x6a6a, 0x6a6a, 0 },
+	{ 0x6b6b, 0x6b6b, 0x6b6b, 0 },
+	{ 0x6c6c, 0x6c6c, 0x6c6c, 0 },
+	{ 0x6d6d, 0x6d6d, 0x6d6d, 0 },
+	{ 0x6e6e, 0x6e6e, 0x6e6e, 0 },
+	{ 0x6f6f, 0x6f6f, 0x6f6f, 0 },
+	{ 0x7070, 0x7070, 0x7070, 0 },
+	{ 0x7171, 0x7171, 0x7171, 0 },
+	{ 0x7272, 0x7272, 0x7272, 0 },
+	{ 0x7373, 0x7373, 0x7373, 0 },
+	{ 0x7474, 0x7474, 0x7474, 0 },
+	{ 0x7575, 0x7575, 0x7575, 0 },
+	{ 0x7676, 0x7676, 0x7676, 0 },
+	{ 0x7777, 0x7777, 0x7777, 0 },
+	{ 0x7878, 0x7878, 0x7878, 0 },
+	{ 0x7979, 0x7979, 0x7979, 0 },
+	{ 0x7a7a, 0x7a7a, 0x7a7a, 0 },
+	{ 0x7b7b, 0x7b7b, 0x7b7b, 0 },
+	{ 0x7c7c, 0x7c7c, 0x7c7c, 0 },
+	{ 0x7d7d, 0x7d7d, 0x7d7d, 0 },
+	{ 0x7e7e, 0x7e7e, 0x7e7e, 0 },
+	{ 0x7f7f, 0x7f7f, 0x7f7f, 0 },
+	{ 0x8080, 0x8080, 0x8080, 0 },
+	{ 0x8181, 0x8181, 0x8181, 0 },
+	{ 0x8282, 0x8282, 0x8282, 0 },
+	{ 0x8383, 0x8383, 0x8383, 0 },
+	{ 0x8484, 0x8484, 0x8484, 0 },
+	{ 0x8585, 0x8585, 0x8585, 0 },
+	{ 0x8686, 0x8686, 0x8686, 0 },
+	{ 0x8787, 0x8787, 0x8787, 0 },
+	{ 0x8888, 0x8888, 0x8888, 0 },
+	{ 0x8989, 0x8989, 0x8989, 0 },
+	{ 0x8a8a, 0x8a8a, 0x8a8a, 0 },
+	{ 0x8b8b, 0x8b8b, 0x8b8b, 0 },
+	{ 0x8c8c, 0x8c8c, 0x8c8c, 0 },
+	{ 0x8d8d, 0x8d8d, 0x8d8d, 0 },
+	{ 0x8e8e, 0x8e8e, 0x8e8e, 0 },
+	{ 0x8f8f, 0x8f8f, 0x8f8f, 0 },
+	{ 0x9090, 0x9090, 0x9090, 0 },
+	{ 0x9191, 0x9191, 0x9191, 0 },
+	{ 0x9292, 0x9292, 0x9292, 0 },
+	{ 0x9393, 0x9393, 0x9393, 0 },
+	{ 0x9494, 0x9494, 0x9494, 0 },
+	{ 0x9595, 0x9595, 0x9595, 0 },
+	{ 0x9696, 0x9696, 0x9696, 0 },
+	{ 0x9797, 0x9797, 0x9797, 0 },
+	{ 0x9898, 0x9898, 0x9898, 0 },
+	{ 0x9999, 0x9999, 0x9999, 0 },
+	{ 0x9a9a, 0x9a9a, 0x9a9a, 0 },
+	{ 0x9b9b, 0x9b9b, 0x9b9b, 0 },
+	{ 0x9c9c, 0x9c9c, 0x9c9c, 0 },
+	{ 0x9d9d, 0x9d9d, 0x9d9d, 0 },
+	{ 0x9e9e, 0x9e9e, 0x9e9e, 0 },
+	{ 0x9f9f, 0x9f9f, 0x9f9f, 0 },
+	{ 0xa0a0, 0xa0a0, 0xa0a0, 0 },
+	{ 0xa1a1, 0xa1a1, 0xa1a1, 0 },
+	{ 0xa2a2, 0xa2a2, 0xa2a2, 0 },
+	{ 0xa3a3, 0xa3a3, 0xa3a3, 0 },
+	{ 0xa4a4, 0xa4a4, 0xa4a4, 0 },
+	{ 0xa5a5, 0xa5a5, 0xa5a5, 0 },
+	{ 0xa6a6, 0xa6a6, 0xa6a6, 0 },
+	{ 0xa7a7, 0xa7a7, 0xa7a7, 0 },
+	{ 0xa8a8, 0xa8a8, 0xa8a8, 0 },
+	{ 0xa9a9, 0xa9a9, 0xa9a9, 0 },
+	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
+	{ 0xabab, 0xabab, 0xabab, 0 },
+	{ 0xacac, 0xacac, 0xacac, 0 },
+	{ 0xadad, 0xadad, 0xadad, 0 },
+	{ 0xaeae, 0xaeae, 0xaeae, 0 },
+	{ 0xafaf, 0xafaf, 0xafaf, 0 },
+	{ 0xb0b0, 0xb0b0, 0xb0b0, 0 },
+	{ 0xb1b1, 0xb1b1, 0xb1b1, 0 },
+	{ 0xb2b2, 0xb2b2, 0xb2b2, 0 },
+	{ 0xb3b3, 0xb3b3, 0xb3b3, 0 },
+	{ 0xb4b4, 0xb4b4, 0xb4b4, 0 },
+	{ 0xb5b5, 0xb5b5, 0xb5b5, 0 },
+	{ 0xb6b6, 0xb6b6, 0xb6b6, 0 },
+	{ 0xb7b7, 0xb7b7, 0xb7b7, 0 },
+	{ 0xb8b8, 0xb8b8, 0xb8b8, 0 },
+	{ 0xb9b9, 0xb9b9, 0xb9b9, 0 },
+	{ 0xbaba, 0xbaba, 0xbaba, 0 },
+	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
+	{ 0xbcbc, 0xbcbc, 0xbcbc, 0 },
+	{ 0xbdbd, 0xbdbd, 0xbdbd, 0 },
+	{ 0xbebe, 0xbebe, 0xbebe, 0 },
+	{ 0xbfbf, 0xbfbf, 0xbfbf, 0 },
+	{ 0xc0c0, 0xc0c0, 0xc0c0, 0 },
+	{ 0xc1c1, 0xc1c1, 0xc1c1, 0 },
+	{ 0xc2c2, 0xc2c2, 0xc2c2, 0 },
+	{ 0xc3c3, 0xc3c3, 0xc3c3, 0 },
+	{ 0xc4c4, 0xc4c4, 0xc4c4, 0 },
+	{ 0xc5c5, 0xc5c5, 0xc5c5, 0 },
+	{ 0xc6c6, 0xc6c6, 0xc6c6, 0 },
+	{ 0xc7c7, 0xc7c7, 0xc7c7, 0 },
+	{ 0xc8c8, 0xc8c8, 0xc8c8, 0 },
+	{ 0xc9c9, 0xc9c9, 0xc9c9, 0 },
+	{ 0xcaca, 0xcaca, 0xcaca, 0 },
+	{ 0xcbcb, 0xcbcb, 0xcbcb, 0 },
+	{ 0xcccc, 0xcccc, 0xcccc, 0 },
+	{ 0xcdcd, 0xcdcd, 0xcdcd, 0 },
+	{ 0xcece, 0xcece, 0xcece, 0 },
+	{ 0xcfcf, 0xcfcf, 0xcfcf, 0 },
+	{ 0xd0d0, 0xd0d0, 0xd0d0, 0 },
+	{ 0xd1d1, 0xd1d1, 0xd1d1, 0 },
+	{ 0xd2d2, 0xd2d2, 0xd2d2, 0 },
+	{ 0xd3d3, 0xd3d3, 0xd3d3, 0 },
+	{ 0xd4d4, 0xd4d4, 0xd4d4, 0 },
+	{ 0xd5d5, 0xd5d5, 0xd5d5, 0 },
+	{ 0xd6d6, 0xd6d6, 0xd6d6, 0 },
+	{ 0xd7d7, 0xd7d7, 0xd7d7, 0 },
+	{ 0xd8d8, 0xd8d8, 0xd8d8, 0 },
+	{ 0xd9d9, 0xd9d9, 0xd9d9, 0 },
+	{ 0xdada, 0xdada, 0xdada, 0 },
+	{ 0xdbdb, 0xdbdb, 0xdbdb, 0 },
+	{ 0xdcdc, 0xdcdc, 0xdcdc, 0 },
+	{ 0xdddd, 0xdddd, 0xdddd, 0 },
+	{ 0xdede, 0xdede, 0xdede, 0 },
+	{ 0xdfdf, 0xdfdf, 0xdfdf, 0 },
+	{ 0xe0e0, 0xe0e0, 0xe0e0, 0 },
+	{ 0xe1e1, 0xe1e1, 0xe1e1, 0 },
+	{ 0xe2e2, 0xe2e2, 0xe2e2, 0 },
+	{ 0xe3e3, 0xe3e3, 0xe3e3, 0 },
+	{ 0xe4e4, 0xe4e4, 0xe4e4, 0 },
+	{ 0xe5e5, 0xe5e5, 0xe5e5, 0 },
+	{ 0xe6e6, 0xe6e6, 0xe6e6, 0 },
+	{ 0xe7e7, 0xe7e7, 0xe7e7, 0 },
+	{ 0xe8e8, 0xe8e8, 0xe8e8, 0 },
+	{ 0xe9e9, 0xe9e9, 0xe9e9, 0 },
+	{ 0xeaea, 0xeaea, 0xeaea, 0 },
+	{ 0xebeb, 0xebeb, 0xebeb, 0 },
+	{ 0xecec, 0xecec, 0xecec, 0 },
+	{ 0xeded, 0xeded, 0xeded, 0 },
+	{ 0xeeee, 0xeeee, 0xeeee, 0 },
+	{ 0xefef, 0xefef, 0xefef, 0 },
+	{ 0xf0f0, 0xf0f0, 0xf0f0, 0 },
+	{ 0xf1f1, 0xf1f1, 0xf1f1, 0 },
+	{ 0xf2f2, 0xf2f2, 0xf2f2, 0 },
+	{ 0xf3f3, 0xf3f3, 0xf3f3, 0 },
+	{ 0xf4f4, 0xf4f4, 0xf4f4, 0 },
+	{ 0xf5f5, 0xf5f5, 0xf5f5, 0 },
+	{ 0xf6f6, 0xf6f6, 0xf6f6, 0 },
+	{ 0xf7f7, 0xf7f7, 0xf7f7, 0 },
+	{ 0xf8f8, 0xf8f8, 0xf8f8, 0 },
+	{ 0xf9f9, 0xf9f9, 0xf9f9, 0 },
+	{ 0xfafa, 0xfafa, 0xfafa, 0 },
+	{ 0xfbfb, 0xfbfb, 0xfbfb, 0 },
+	{ 0xfcfc, 0xfcfc, 0xfcfc, 0 },
+	{ 0xfdfd, 0xfdfd, 0xfdfd, 0 },
+	{ 0xfefe, 0xfefe, 0xfefe, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut linear_eotf = {
+	.base = linear_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
+
+static struct drm_color_lut srgb_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0x13, 0x13, 0x13, 0 },
+	{ 0x27, 0x27, 0x27, 0 },
+	{ 0x3b, 0x3b, 0x3b, 0 },
+	{ 0x4f, 0x4f, 0x4f, 0 },
+	{ 0x63, 0x63, 0x63, 0 },
+	{ 0x77, 0x77, 0x77, 0 },
+	{ 0x8b, 0x8b, 0x8b, 0 },
+	{ 0x9f, 0x9f, 0x9f, 0 },
+	{ 0xb3, 0xb3, 0xb3, 0 },
+	{ 0xc6, 0xc6, 0xc6, 0 },
+	{ 0xdb, 0xdb, 0xdb, 0 },
+	{ 0xf0, 0xf0, 0xf0, 0 },
+	{ 0x107, 0x107, 0x107, 0 },
+	{ 0x11f, 0x11f, 0x11f, 0 },
+	{ 0x139, 0x139, 0x139, 0 },
+	{ 0x153, 0x153, 0x153, 0 },
+	{ 0x16f, 0x16f, 0x16f, 0 },
+	{ 0x18c, 0x18c, 0x18c, 0 },
+	{ 0x1aa, 0x1aa, 0x1aa, 0 },
+	{ 0x1ca, 0x1ca, 0x1ca, 0 },
+	{ 0x1eb, 0x1eb, 0x1eb, 0 },
+	{ 0x20d, 0x20d, 0x20d, 0 },
+	{ 0x231, 0x231, 0x231, 0 },
+	{ 0x256, 0x256, 0x256, 0 },
+	{ 0x27d, 0x27d, 0x27d, 0 },
+	{ 0x2a4, 0x2a4, 0x2a4, 0 },
+	{ 0x2ce, 0x2ce, 0x2ce, 0 },
+	{ 0x2f9, 0x2f9, 0x2f9, 0 },
+	{ 0x325, 0x325, 0x325, 0 },
+	{ 0x352, 0x352, 0x352, 0 },
+	{ 0x381, 0x381, 0x381, 0 },
+	{ 0x3b2, 0x3b2, 0x3b2, 0 },
+	{ 0x3e4, 0x3e4, 0x3e4, 0 },
+	{ 0x418, 0x418, 0x418, 0 },
+	{ 0x44d, 0x44d, 0x44d, 0 },
+	{ 0x484, 0x484, 0x484, 0 },
+	{ 0x4bc, 0x4bc, 0x4bc, 0 },
+	{ 0x4f6, 0x4f6, 0x4f6, 0 },
+	{ 0x531, 0x531, 0x531, 0 },
+	{ 0x56e, 0x56e, 0x56e, 0 },
+	{ 0x5ad, 0x5ad, 0x5ad, 0 },
+	{ 0x5ed, 0x5ed, 0x5ed, 0 },
+	{ 0x62f, 0x62f, 0x62f, 0 },
+	{ 0x672, 0x672, 0x672, 0 },
+	{ 0x6b7, 0x6b7, 0x6b7, 0 },
+	{ 0x6fe, 0x6fe, 0x6fe, 0 },
+	{ 0x746, 0x746, 0x746, 0 },
+	{ 0x791, 0x791, 0x791, 0 },
+	{ 0x7dc, 0x7dc, 0x7dc, 0 },
+	{ 0x82a, 0x82a, 0x82a, 0 },
+	{ 0x879, 0x879, 0x879, 0 },
+	{ 0x8ca, 0x8ca, 0x8ca, 0 },
+	{ 0x91d, 0x91d, 0x91d, 0 },
+	{ 0x971, 0x971, 0x971, 0 },
+	{ 0x9c7, 0x9c7, 0x9c7, 0 },
+	{ 0xa1f, 0xa1f, 0xa1f, 0 },
+	{ 0xa79, 0xa79, 0xa79, 0 },
+	{ 0xad4, 0xad4, 0xad4, 0 },
+	{ 0xb32, 0xb32, 0xb32, 0 },
+	{ 0xb91, 0xb91, 0xb91, 0 },
+	{ 0xbf2, 0xbf2, 0xbf2, 0 },
+	{ 0xc54, 0xc54, 0xc54, 0 },
+	{ 0xcb9, 0xcb9, 0xcb9, 0 },
+	{ 0xd1f, 0xd1f, 0xd1f, 0 },
+	{ 0xd88, 0xd88, 0xd88, 0 },
+	{ 0xdf2, 0xdf2, 0xdf2, 0 },
+	{ 0xe5e, 0xe5e, 0xe5e, 0 },
+	{ 0xecc, 0xecc, 0xecc, 0 },
+	{ 0xf3c, 0xf3c, 0xf3c, 0 },
+	{ 0xfad, 0xfad, 0xfad, 0 },
+	{ 0x1021, 0x1021, 0x1021, 0 },
+	{ 0x1096, 0x1096, 0x1096, 0 },
+	{ 0x110e, 0x110e, 0x110e, 0 },
+	{ 0x1187, 0x1187, 0x1187, 0 },
+	{ 0x1203, 0x1203, 0x1203, 0 },
+	{ 0x1280, 0x1280, 0x1280, 0 },
+	{ 0x12ff, 0x12ff, 0x12ff, 0 },
+	{ 0x1380, 0x1380, 0x1380, 0 },
+	{ 0x1404, 0x1404, 0x1404, 0 },
+	{ 0x1489, 0x1489, 0x1489, 0 },
+	{ 0x1510, 0x1510, 0x1510, 0 },
+	{ 0x1599, 0x1599, 0x1599, 0 },
+	{ 0x1624, 0x1624, 0x1624, 0 },
+	{ 0x16b2, 0x16b2, 0x16b2, 0 },
+	{ 0x1741, 0x1741, 0x1741, 0 },
+	{ 0x17d2, 0x17d2, 0x17d2, 0 },
+	{ 0x1865, 0x1865, 0x1865, 0 },
+	{ 0x18fb, 0x18fb, 0x18fb, 0 },
+	{ 0x1992, 0x1992, 0x1992, 0 },
+	{ 0x1a2c, 0x1a2c, 0x1a2c, 0 },
+	{ 0x1ac8, 0x1ac8, 0x1ac8, 0 },
+	{ 0x1b65, 0x1b65, 0x1b65, 0 },
+	{ 0x1c05, 0x1c05, 0x1c05, 0 },
+	{ 0x1ca7, 0x1ca7, 0x1ca7, 0 },
+	{ 0x1d4b, 0x1d4b, 0x1d4b, 0 },
+	{ 0x1df1, 0x1df1, 0x1df1, 0 },
+	{ 0x1e99, 0x1e99, 0x1e99, 0 },
+	{ 0x1f44, 0x1f44, 0x1f44, 0 },
+	{ 0x1ff0, 0x1ff0, 0x1ff0, 0 },
+	{ 0x209f, 0x209f, 0x209f, 0 },
+	{ 0x2150, 0x2150, 0x2150, 0 },
+	{ 0x2203, 0x2203, 0x2203, 0 },
+	{ 0x22b8, 0x22b8, 0x22b8, 0 },
+	{ 0x2370, 0x2370, 0x2370, 0 },
+	{ 0x2429, 0x2429, 0x2429, 0 },
+	{ 0x24e5, 0x24e5, 0x24e5, 0 },
+	{ 0x25a3, 0x25a3, 0x25a3, 0 },
+	{ 0x2663, 0x2663, 0x2663, 0 },
+	{ 0x2726, 0x2726, 0x2726, 0 },
+	{ 0x27ea, 0x27ea, 0x27ea, 0 },
+	{ 0x28b1, 0x28b1, 0x28b1, 0 },
+	{ 0x297a, 0x297a, 0x297a, 0 },
+	{ 0x2a45, 0x2a45, 0x2a45, 0 },
+	{ 0x2b13, 0x2b13, 0x2b13, 0 },
+	{ 0x2be3, 0x2be3, 0x2be3, 0 },
+	{ 0x2cb5, 0x2cb5, 0x2cb5, 0 },
+	{ 0x2d89, 0x2d89, 0x2d89, 0 },
+	{ 0x2e60, 0x2e60, 0x2e60, 0 },
+	{ 0x2f39, 0x2f39, 0x2f39, 0 },
+	{ 0x3014, 0x3014, 0x3014, 0 },
+	{ 0x30f2, 0x30f2, 0x30f2, 0 },
+	{ 0x31d2, 0x31d2, 0x31d2, 0 },
+	{ 0x32b4, 0x32b4, 0x32b4, 0 },
+	{ 0x3398, 0x3398, 0x3398, 0 },
+	{ 0x347f, 0x347f, 0x347f, 0 },
+	{ 0x3569, 0x3569, 0x3569, 0 },
+	{ 0x3654, 0x3654, 0x3654, 0 },
+	{ 0x3742, 0x3742, 0x3742, 0 },
+	{ 0x3832, 0x3832, 0x3832, 0 },
+	{ 0x3925, 0x3925, 0x3925, 0 },
+	{ 0x3a1a, 0x3a1a, 0x3a1a, 0 },
+	{ 0x3b11, 0x3b11, 0x3b11, 0 },
+	{ 0x3c0b, 0x3c0b, 0x3c0b, 0 },
+	{ 0x3d07, 0x3d07, 0x3d07, 0 },
+	{ 0x3e05, 0x3e05, 0x3e05, 0 },
+	{ 0x3f06, 0x3f06, 0x3f06, 0 },
+	{ 0x400a, 0x400a, 0x400a, 0 },
+	{ 0x410f, 0x410f, 0x410f, 0 },
+	{ 0x4218, 0x4218, 0x4218, 0 },
+	{ 0x4322, 0x4322, 0x4322, 0 },
+	{ 0x442f, 0x442f, 0x442f, 0 },
+	{ 0x453f, 0x453f, 0x453f, 0 },
+	{ 0x4650, 0x4650, 0x4650, 0 },
+	{ 0x4765, 0x4765, 0x4765, 0 },
+	{ 0x487c, 0x487c, 0x487c, 0 },
+	{ 0x4995, 0x4995, 0x4995, 0 },
+	{ 0x4ab1, 0x4ab1, 0x4ab1, 0 },
+	{ 0x4bcf, 0x4bcf, 0x4bcf, 0 },
+	{ 0x4cf0, 0x4cf0, 0x4cf0, 0 },
+	{ 0x4e13, 0x4e13, 0x4e13, 0 },
+	{ 0x4f39, 0x4f39, 0x4f39, 0 },
+	{ 0x5061, 0x5061, 0x5061, 0 },
+	{ 0x518b, 0x518b, 0x518b, 0 },
+	{ 0x52b9, 0x52b9, 0x52b9, 0 },
+	{ 0x53e8, 0x53e8, 0x53e8, 0 },
+	{ 0x551b, 0x551b, 0x551b, 0 },
+	{ 0x5650, 0x5650, 0x5650, 0 },
+	{ 0x5787, 0x5787, 0x5787, 0 },
+	{ 0x58c1, 0x58c1, 0x58c1, 0 },
+	{ 0x59fd, 0x59fd, 0x59fd, 0 },
+	{ 0x5b3c, 0x5b3c, 0x5b3c, 0 },
+	{ 0x5c7e, 0x5c7e, 0x5c7e, 0 },
+	{ 0x5dc2, 0x5dc2, 0x5dc2, 0 },
+	{ 0x5f09, 0x5f09, 0x5f09, 0 },
+	{ 0x6052, 0x6052, 0x6052, 0 },
+	{ 0x619e, 0x619e, 0x619e, 0 },
+	{ 0x62ec, 0x62ec, 0x62ec, 0 },
+	{ 0x643d, 0x643d, 0x643d, 0 },
+	{ 0x6591, 0x6591, 0x6591, 0 },
+	{ 0x66e7, 0x66e7, 0x66e7, 0 },
+	{ 0x6840, 0x6840, 0x6840, 0 },
+	{ 0x699b, 0x699b, 0x699b, 0 },
+	{ 0x6afa, 0x6afa, 0x6afa, 0 },
+	{ 0x6c5a, 0x6c5a, 0x6c5a, 0 },
+	{ 0x6dbe, 0x6dbe, 0x6dbe, 0 },
+	{ 0x6f24, 0x6f24, 0x6f24, 0 },
+	{ 0x708c, 0x708c, 0x708c, 0 },
+	{ 0x71f8, 0x71f8, 0x71f8, 0 },
+	{ 0x7366, 0x7366, 0x7366, 0 },
+	{ 0x74d6, 0x74d6, 0x74d6, 0 },
+	{ 0x764a, 0x764a, 0x764a, 0 },
+	{ 0x77c0, 0x77c0, 0x77c0, 0 },
+	{ 0x7938, 0x7938, 0x7938, 0 },
+	{ 0x7ab4, 0x7ab4, 0x7ab4, 0 },
+	{ 0x7c32, 0x7c32, 0x7c32, 0 },
+	{ 0x7db3, 0x7db3, 0x7db3, 0 },
+	{ 0x7f36, 0x7f36, 0x7f36, 0 },
+	{ 0x80bc, 0x80bc, 0x80bc, 0 },
+	{ 0x8245, 0x8245, 0x8245, 0 },
+	{ 0x83d1, 0x83d1, 0x83d1, 0 },
+	{ 0x855f, 0x855f, 0x855f, 0 },
+	{ 0x86f0, 0x86f0, 0x86f0, 0 },
+	{ 0x8884, 0x8884, 0x8884, 0 },
+	{ 0x8a1a, 0x8a1a, 0x8a1a, 0 },
+	{ 0x8bb4, 0x8bb4, 0x8bb4, 0 },
+	{ 0x8d50, 0x8d50, 0x8d50, 0 },
+	{ 0x8eee, 0x8eee, 0x8eee, 0 },
+	{ 0x9090, 0x9090, 0x9090, 0 },
+	{ 0x9234, 0x9234, 0x9234, 0 },
+	{ 0x93db, 0x93db, 0x93db, 0 },
+	{ 0x9585, 0x9585, 0x9585, 0 },
+	{ 0x9732, 0x9732, 0x9732, 0 },
+	{ 0x98e1, 0x98e1, 0x98e1, 0 },
+	{ 0x9a93, 0x9a93, 0x9a93, 0 },
+	{ 0x9c48, 0x9c48, 0x9c48, 0 },
+	{ 0x9e00, 0x9e00, 0x9e00, 0 },
+	{ 0x9fbb, 0x9fbb, 0x9fbb, 0 },
+	{ 0xa178, 0xa178, 0xa178, 0 },
+	{ 0xa338, 0xa338, 0xa338, 0 },
+	{ 0xa4fb, 0xa4fb, 0xa4fb, 0 },
+	{ 0xa6c1, 0xa6c1, 0xa6c1, 0 },
+	{ 0xa88a, 0xa88a, 0xa88a, 0 },
+	{ 0xaa56, 0xaa56, 0xaa56, 0 },
+	{ 0xac24, 0xac24, 0xac24, 0 },
+	{ 0xadf5, 0xadf5, 0xadf5, 0 },
+	{ 0xafc9, 0xafc9, 0xafc9, 0 },
+	{ 0xb1a0, 0xb1a0, 0xb1a0, 0 },
+	{ 0xb37a, 0xb37a, 0xb37a, 0 },
+	{ 0xb557, 0xb557, 0xb557, 0 },
+	{ 0xb736, 0xb736, 0xb736, 0 },
+	{ 0xb919, 0xb919, 0xb919, 0 },
+	{ 0xbafe, 0xbafe, 0xbafe, 0 },
+	{ 0xbce6, 0xbce6, 0xbce6, 0 },
+	{ 0xbed2, 0xbed2, 0xbed2, 0 },
+	{ 0xc0c0, 0xc0c0, 0xc0c0, 0 },
+	{ 0xc2b0, 0xc2b0, 0xc2b0, 0 },
+	{ 0xc4a4, 0xc4a4, 0xc4a4, 0 },
+	{ 0xc69b, 0xc69b, 0xc69b, 0 },
+	{ 0xc895, 0xc895, 0xc895, 0 },
+	{ 0xca91, 0xca91, 0xca91, 0 },
+	{ 0xcc91, 0xcc91, 0xcc91, 0 },
+	{ 0xce93, 0xce93, 0xce93, 0 },
+	{ 0xd098, 0xd098, 0xd098, 0 },
+	{ 0xd2a1, 0xd2a1, 0xd2a1, 0 },
+	{ 0xd4ac, 0xd4ac, 0xd4ac, 0 },
+	{ 0xd6ba, 0xd6ba, 0xd6ba, 0 },
+	{ 0xd8cb, 0xd8cb, 0xd8cb, 0 },
+	{ 0xdadf, 0xdadf, 0xdadf, 0 },
+	{ 0xdcf7, 0xdcf7, 0xdcf7, 0 },
+	{ 0xdf11, 0xdf11, 0xdf11, 0 },
+	{ 0xe12e, 0xe12e, 0xe12e, 0 },
+	{ 0xe34e, 0xe34e, 0xe34e, 0 },
+	{ 0xe571, 0xe571, 0xe571, 0 },
+	{ 0xe796, 0xe796, 0xe796, 0 },
+	{ 0xe9bf, 0xe9bf, 0xe9bf, 0 },
+	{ 0xebeb, 0xebeb, 0xebeb, 0 },
+	{ 0xee1a, 0xee1a, 0xee1a, 0 },
+	{ 0xf04c, 0xf04c, 0xf04c, 0 },
+	{ 0xf281, 0xf281, 0xf281, 0 },
+	{ 0xf4b9, 0xf4b9, 0xf4b9, 0 },
+	{ 0xf6f4, 0xf6f4, 0xf6f4, 0 },
+	{ 0xf932, 0xf932, 0xf932, 0 },
+	{ 0xfb73, 0xfb73, 0xfb73, 0 },
+	{ 0xfdb7, 0xfdb7, 0xfdb7, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut srgb_eotf = {
+	.base = srgb_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
+
+static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
+	{ 0x0, 0x0, 0x0, 0 },
+	{ 0xcc2, 0xcc2, 0xcc2, 0 },
+	{ 0x15be, 0x15be, 0x15be, 0 },
+	{ 0x1c56, 0x1c56, 0x1c56, 0 },
+	{ 0x21bd, 0x21bd, 0x21bd, 0 },
+	{ 0x2666, 0x2666, 0x2666, 0 },
+	{ 0x2a8a, 0x2a8a, 0x2a8a, 0 },
+	{ 0x2e4c, 0x2e4c, 0x2e4c, 0 },
+	{ 0x31c0, 0x31c0, 0x31c0, 0 },
+	{ 0x34f6, 0x34f6, 0x34f6, 0 },
+	{ 0x37f9, 0x37f9, 0x37f9, 0 },
+	{ 0x3acf, 0x3acf, 0x3acf, 0 },
+	{ 0x3d80, 0x3d80, 0x3d80, 0 },
+	{ 0x4010, 0x4010, 0x4010, 0 },
+	{ 0x4284, 0x4284, 0x4284, 0 },
+	{ 0x44dd, 0x44dd, 0x44dd, 0 },
+	{ 0x4720, 0x4720, 0x4720, 0 },
+	{ 0x494e, 0x494e, 0x494e, 0 },
+	{ 0x4b69, 0x4b69, 0x4b69, 0 },
+	{ 0x4d73, 0x4d73, 0x4d73, 0 },
+	{ 0x4f6e, 0x4f6e, 0x4f6e, 0 },
+	{ 0x5159, 0x5159, 0x5159, 0 },
+	{ 0x5337, 0x5337, 0x5337, 0 },
+	{ 0x5509, 0x5509, 0x5509, 0 },
+	{ 0x56cf, 0x56cf, 0x56cf, 0 },
+	{ 0x588a, 0x588a, 0x588a, 0 },
+	{ 0x5a3b, 0x5a3b, 0x5a3b, 0 },
+	{ 0x5be2, 0x5be2, 0x5be2, 0 },
+	{ 0x5d80, 0x5d80, 0x5d80, 0 },
+	{ 0x5f16, 0x5f16, 0x5f16, 0 },
+	{ 0x60a4, 0x60a4, 0x60a4, 0 },
+	{ 0x6229, 0x6229, 0x6229, 0 },
+	{ 0x63a8, 0x63a8, 0x63a8, 0 },
+	{ 0x6520, 0x6520, 0x6520, 0 },
+	{ 0x6691, 0x6691, 0x6691, 0 },
+	{ 0x67fc, 0x67fc, 0x67fc, 0 },
+	{ 0x6961, 0x6961, 0x6961, 0 },
+	{ 0x6ac0, 0x6ac0, 0x6ac0, 0 },
+	{ 0x6c19, 0x6c19, 0x6c19, 0 },
+	{ 0x6d6e, 0x6d6e, 0x6d6e, 0 },
+	{ 0x6ebd, 0x6ebd, 0x6ebd, 0 },
+	{ 0x7008, 0x7008, 0x7008, 0 },
+	{ 0x714d, 0x714d, 0x714d, 0 },
+	{ 0x728f, 0x728f, 0x728f, 0 },
+	{ 0x73cc, 0x73cc, 0x73cc, 0 },
+	{ 0x7504, 0x7504, 0x7504, 0 },
+	{ 0x7639, 0x7639, 0x7639, 0 },
+	{ 0x776a, 0x776a, 0x776a, 0 },
+	{ 0x7897, 0x7897, 0x7897, 0 },
+	{ 0x79c1, 0x79c1, 0x79c1, 0 },
+	{ 0x7ae7, 0x7ae7, 0x7ae7, 0 },
+	{ 0x7c09, 0x7c09, 0x7c09, 0 },
+	{ 0x7d28, 0x7d28, 0x7d28, 0 },
+	{ 0x7e44, 0x7e44, 0x7e44, 0 },
+	{ 0x7f5d, 0x7f5d, 0x7f5d, 0 },
+	{ 0x8073, 0x8073, 0x8073, 0 },
+	{ 0x8186, 0x8186, 0x8186, 0 },
+	{ 0x8296, 0x8296, 0x8296, 0 },
+	{ 0x83a4, 0x83a4, 0x83a4, 0 },
+	{ 0x84ae, 0x84ae, 0x84ae, 0 },
+	{ 0x85b6, 0x85b6, 0x85b6, 0 },
+	{ 0x86bc, 0x86bc, 0x86bc, 0 },
+	{ 0x87bf, 0x87bf, 0x87bf, 0 },
+	{ 0x88bf, 0x88bf, 0x88bf, 0 },
+	{ 0x89be, 0x89be, 0x89be, 0 },
+	{ 0x8ab9, 0x8ab9, 0x8ab9, 0 },
+	{ 0x8bb3, 0x8bb3, 0x8bb3, 0 },
+	{ 0x8cab, 0x8cab, 0x8cab, 0 },
+	{ 0x8da0, 0x8da0, 0x8da0, 0 },
+	{ 0x8e93, 0x8e93, 0x8e93, 0 },
+	{ 0x8f84, 0x8f84, 0x8f84, 0 },
+	{ 0x9073, 0x9073, 0x9073, 0 },
+	{ 0x9161, 0x9161, 0x9161, 0 },
+	{ 0x924c, 0x924c, 0x924c, 0 },
+	{ 0x9335, 0x9335, 0x9335, 0 },
+	{ 0x941d, 0x941d, 0x941d, 0 },
+	{ 0x9503, 0x9503, 0x9503, 0 },
+	{ 0x95e7, 0x95e7, 0x95e7, 0 },
+	{ 0x96c9, 0x96c9, 0x96c9, 0 },
+	{ 0x97aa, 0x97aa, 0x97aa, 0 },
+	{ 0x9889, 0x9889, 0x9889, 0 },
+	{ 0x9966, 0x9966, 0x9966, 0 },
+	{ 0x9a42, 0x9a42, 0x9a42, 0 },
+	{ 0x9b1c, 0x9b1c, 0x9b1c, 0 },
+	{ 0x9bf5, 0x9bf5, 0x9bf5, 0 },
+	{ 0x9ccc, 0x9ccc, 0x9ccc, 0 },
+	{ 0x9da1, 0x9da1, 0x9da1, 0 },
+	{ 0x9e76, 0x9e76, 0x9e76, 0 },
+	{ 0x9f49, 0x9f49, 0x9f49, 0 },
+	{ 0xa01a, 0xa01a, 0xa01a, 0 },
+	{ 0xa0ea, 0xa0ea, 0xa0ea, 0 },
+	{ 0xa1b9, 0xa1b9, 0xa1b9, 0 },
+	{ 0xa286, 0xa286, 0xa286, 0 },
+	{ 0xa352, 0xa352, 0xa352, 0 },
+	{ 0xa41d, 0xa41d, 0xa41d, 0 },
+	{ 0xa4e7, 0xa4e7, 0xa4e7, 0 },
+	{ 0xa5af, 0xa5af, 0xa5af, 0 },
+	{ 0xa676, 0xa676, 0xa676, 0 },
+	{ 0xa73c, 0xa73c, 0xa73c, 0 },
+	{ 0xa801, 0xa801, 0xa801, 0 },
+	{ 0xa8c5, 0xa8c5, 0xa8c5, 0 },
+	{ 0xa987, 0xa987, 0xa987, 0 },
+	{ 0xaa48, 0xaa48, 0xaa48, 0 },
+	{ 0xab09, 0xab09, 0xab09, 0 },
+	{ 0xabc8, 0xabc8, 0xabc8, 0 },
+	{ 0xac86, 0xac86, 0xac86, 0 },
+	{ 0xad43, 0xad43, 0xad43, 0 },
+	{ 0xadff, 0xadff, 0xadff, 0 },
+	{ 0xaeba, 0xaeba, 0xaeba, 0 },
+	{ 0xaf74, 0xaf74, 0xaf74, 0 },
+	{ 0xb02d, 0xb02d, 0xb02d, 0 },
+	{ 0xb0e5, 0xb0e5, 0xb0e5, 0 },
+	{ 0xb19c, 0xb19c, 0xb19c, 0 },
+	{ 0xb252, 0xb252, 0xb252, 0 },
+	{ 0xb307, 0xb307, 0xb307, 0 },
+	{ 0xb3bb, 0xb3bb, 0xb3bb, 0 },
+	{ 0xb46f, 0xb46f, 0xb46f, 0 },
+	{ 0xb521, 0xb521, 0xb521, 0 },
+	{ 0xb5d3, 0xb5d3, 0xb5d3, 0 },
+	{ 0xb683, 0xb683, 0xb683, 0 },
+	{ 0xb733, 0xb733, 0xb733, 0 },
+	{ 0xb7e2, 0xb7e2, 0xb7e2, 0 },
+	{ 0xb890, 0xb890, 0xb890, 0 },
+	{ 0xb93d, 0xb93d, 0xb93d, 0 },
+	{ 0xb9ea, 0xb9ea, 0xb9ea, 0 },
+	{ 0xba96, 0xba96, 0xba96, 0 },
+	{ 0xbb40, 0xbb40, 0xbb40, 0 },
+	{ 0xbbea, 0xbbea, 0xbbea, 0 },
+	{ 0xbc94, 0xbc94, 0xbc94, 0 },
+	{ 0xbd3c, 0xbd3c, 0xbd3c, 0 },
+	{ 0xbde4, 0xbde4, 0xbde4, 0 },
+	{ 0xbe8b, 0xbe8b, 0xbe8b, 0 },
+	{ 0xbf31, 0xbf31, 0xbf31, 0 },
+	{ 0xbfd7, 0xbfd7, 0xbfd7, 0 },
+	{ 0xc07b, 0xc07b, 0xc07b, 0 },
+	{ 0xc120, 0xc120, 0xc120, 0 },
+	{ 0xc1c3, 0xc1c3, 0xc1c3, 0 },
+	{ 0xc266, 0xc266, 0xc266, 0 },
+	{ 0xc308, 0xc308, 0xc308, 0 },
+	{ 0xc3a9, 0xc3a9, 0xc3a9, 0 },
+	{ 0xc449, 0xc449, 0xc449, 0 },
+	{ 0xc4e9, 0xc4e9, 0xc4e9, 0 },
+	{ 0xc589, 0xc589, 0xc589, 0 },
+	{ 0xc627, 0xc627, 0xc627, 0 },
+	{ 0xc6c5, 0xc6c5, 0xc6c5, 0 },
+	{ 0xc763, 0xc763, 0xc763, 0 },
+	{ 0xc7ff, 0xc7ff, 0xc7ff, 0 },
+	{ 0xc89b, 0xc89b, 0xc89b, 0 },
+	{ 0xc937, 0xc937, 0xc937, 0 },
+	{ 0xc9d2, 0xc9d2, 0xc9d2, 0 },
+	{ 0xca6c, 0xca6c, 0xca6c, 0 },
+	{ 0xcb06, 0xcb06, 0xcb06, 0 },
+	{ 0xcb9f, 0xcb9f, 0xcb9f, 0 },
+	{ 0xcc37, 0xcc37, 0xcc37, 0 },
+	{ 0xcccf, 0xcccf, 0xcccf, 0 },
+	{ 0xcd66, 0xcd66, 0xcd66, 0 },
+	{ 0xcdfd, 0xcdfd, 0xcdfd, 0 },
+	{ 0xce93, 0xce93, 0xce93, 0 },
+	{ 0xcf29, 0xcf29, 0xcf29, 0 },
+	{ 0xcfbe, 0xcfbe, 0xcfbe, 0 },
+	{ 0xd053, 0xd053, 0xd053, 0 },
+	{ 0xd0e7, 0xd0e7, 0xd0e7, 0 },
+	{ 0xd17a, 0xd17a, 0xd17a, 0 },
+	{ 0xd20d, 0xd20d, 0xd20d, 0 },
+	{ 0xd2a0, 0xd2a0, 0xd2a0, 0 },
+	{ 0xd331, 0xd331, 0xd331, 0 },
+	{ 0xd3c3, 0xd3c3, 0xd3c3, 0 },
+	{ 0xd454, 0xd454, 0xd454, 0 },
+	{ 0xd4e4, 0xd4e4, 0xd4e4, 0 },
+	{ 0xd574, 0xd574, 0xd574, 0 },
+	{ 0xd603, 0xd603, 0xd603, 0 },
+	{ 0xd692, 0xd692, 0xd692, 0 },
+	{ 0xd720, 0xd720, 0xd720, 0 },
+	{ 0xd7ae, 0xd7ae, 0xd7ae, 0 },
+	{ 0xd83c, 0xd83c, 0xd83c, 0 },
+	{ 0xd8c9, 0xd8c9, 0xd8c9, 0 },
+	{ 0xd955, 0xd955, 0xd955, 0 },
+	{ 0xd9e1, 0xd9e1, 0xd9e1, 0 },
+	{ 0xda6d, 0xda6d, 0xda6d, 0 },
+	{ 0xdaf8, 0xdaf8, 0xdaf8, 0 },
+	{ 0xdb83, 0xdb83, 0xdb83, 0 },
+	{ 0xdc0d, 0xdc0d, 0xdc0d, 0 },
+	{ 0xdc97, 0xdc97, 0xdc97, 0 },
+	{ 0xdd20, 0xdd20, 0xdd20, 0 },
+	{ 0xdda9, 0xdda9, 0xdda9, 0 },
+	{ 0xde31, 0xde31, 0xde31, 0 },
+	{ 0xdeb9, 0xdeb9, 0xdeb9, 0 },
+	{ 0xdf41, 0xdf41, 0xdf41, 0 },
+	{ 0xdfc8, 0xdfc8, 0xdfc8, 0 },
+	{ 0xe04f, 0xe04f, 0xe04f, 0 },
+	{ 0xe0d5, 0xe0d5, 0xe0d5, 0 },
+	{ 0xe15b, 0xe15b, 0xe15b, 0 },
+	{ 0xe1e0, 0xe1e0, 0xe1e0, 0 },
+	{ 0xe266, 0xe266, 0xe266, 0 },
+	{ 0xe2ea, 0xe2ea, 0xe2ea, 0 },
+	{ 0xe36f, 0xe36f, 0xe36f, 0 },
+	{ 0xe3f3, 0xe3f3, 0xe3f3, 0 },
+	{ 0xe476, 0xe476, 0xe476, 0 },
+	{ 0xe4f9, 0xe4f9, 0xe4f9, 0 },
+	{ 0xe57c, 0xe57c, 0xe57c, 0 },
+	{ 0xe5fe, 0xe5fe, 0xe5fe, 0 },
+	{ 0xe680, 0xe680, 0xe680, 0 },
+	{ 0xe702, 0xe702, 0xe702, 0 },
+	{ 0xe783, 0xe783, 0xe783, 0 },
+	{ 0xe804, 0xe804, 0xe804, 0 },
+	{ 0xe884, 0xe884, 0xe884, 0 },
+	{ 0xe905, 0xe905, 0xe905, 0 },
+	{ 0xe984, 0xe984, 0xe984, 0 },
+	{ 0xea04, 0xea04, 0xea04, 0 },
+	{ 0xea83, 0xea83, 0xea83, 0 },
+	{ 0xeb02, 0xeb02, 0xeb02, 0 },
+	{ 0xeb80, 0xeb80, 0xeb80, 0 },
+	{ 0xebfe, 0xebfe, 0xebfe, 0 },
+	{ 0xec7b, 0xec7b, 0xec7b, 0 },
+	{ 0xecf9, 0xecf9, 0xecf9, 0 },
+	{ 0xed76, 0xed76, 0xed76, 0 },
+	{ 0xedf2, 0xedf2, 0xedf2, 0 },
+	{ 0xee6f, 0xee6f, 0xee6f, 0 },
+	{ 0xeeeb, 0xeeeb, 0xeeeb, 0 },
+	{ 0xef66, 0xef66, 0xef66, 0 },
+	{ 0xefe2, 0xefe2, 0xefe2, 0 },
+	{ 0xf05d, 0xf05d, 0xf05d, 0 },
+	{ 0xf0d7, 0xf0d7, 0xf0d7, 0 },
+	{ 0xf152, 0xf152, 0xf152, 0 },
+	{ 0xf1cc, 0xf1cc, 0xf1cc, 0 },
+	{ 0xf245, 0xf245, 0xf245, 0 },
+	{ 0xf2bf, 0xf2bf, 0xf2bf, 0 },
+	{ 0xf338, 0xf338, 0xf338, 0 },
+	{ 0xf3b0, 0xf3b0, 0xf3b0, 0 },
+	{ 0xf429, 0xf429, 0xf429, 0 },
+	{ 0xf4a1, 0xf4a1, 0xf4a1, 0 },
+	{ 0xf519, 0xf519, 0xf519, 0 },
+	{ 0xf590, 0xf590, 0xf590, 0 },
+	{ 0xf608, 0xf608, 0xf608, 0 },
+	{ 0xf67e, 0xf67e, 0xf67e, 0 },
+	{ 0xf6f5, 0xf6f5, 0xf6f5, 0 },
+	{ 0xf76b, 0xf76b, 0xf76b, 0 },
+	{ 0xf7e1, 0xf7e1, 0xf7e1, 0 },
+	{ 0xf857, 0xf857, 0xf857, 0 },
+	{ 0xf8cd, 0xf8cd, 0xf8cd, 0 },
+	{ 0xf942, 0xf942, 0xf942, 0 },
+	{ 0xf9b7, 0xf9b7, 0xf9b7, 0 },
+	{ 0xfa2b, 0xfa2b, 0xfa2b, 0 },
+	{ 0xfaa0, 0xfaa0, 0xfaa0, 0 },
+	{ 0xfb14, 0xfb14, 0xfb14, 0 },
+	{ 0xfb88, 0xfb88, 0xfb88, 0 },
+	{ 0xfbfb, 0xfbfb, 0xfbfb, 0 },
+	{ 0xfc6e, 0xfc6e, 0xfc6e, 0 },
+	{ 0xfce1, 0xfce1, 0xfce1, 0 },
+	{ 0xfd54, 0xfd54, 0xfd54, 0 },
+	{ 0xfdc6, 0xfdc6, 0xfdc6, 0 },
+	{ 0xfe39, 0xfe39, 0xfe39, 0 },
+	{ 0xfeaa, 0xfeaa, 0xfeaa, 0 },
+	{ 0xff1c, 0xff1c, 0xff1c, 0 },
+	{ 0xff8d, 0xff8d, 0xff8d, 0 },
+	{ 0xffff, 0xffff, 0xffff, 0 },
+};
+
+const struct vkms_color_lut srgb_inv_eotf = {
+	.base = srgb_inv_array,
+	.lut_length = LUT_SIZE,
+	.channel_value2index_ratio = 0xff00ffll
+};
diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/vkms_luts.h
new file mode 100644
index 000000000000..925a4a7b84e2
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_luts.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_LUTS_H_
+#define _VKMS_LUTS_H_
+
+#define LUT_SIZE 256
+
+extern const struct vkms_color_lut linear_eotf;
+extern const struct vkms_color_lut srgb_eotf;
+extern const struct vkms_color_lut srgb_inv_eotf;
+
+#endif /* _VKMS_LUTS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3fdd161d0f0..abe9412997b2 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -231,6 +231,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
+	vkms_initialize_colorops(&plane->base);
 
 	return plane;
 }
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d..678708df9cdb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -30,6 +30,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_util.h>
+#include <drm/drm_colorop.h>
 
 /**
  * struct drm_crtc_commit - track modeset commits on a CRTC
@@ -157,6 +158,11 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
+struct __drm_colorops_state {
+	struct drm_colorop *ptr;
+	struct drm_colorop_state *state, *old_state, *new_state;
+};
+
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 	struct drm_plane_state *state, *old_state, *new_state;
@@ -458,6 +464,32 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
+	/**
+	 * @colorops:
+	 *
+	 * Pointer to array of @drm_colorop and @drm_colorop_state part of this
+	 * update.
+	 */
+	struct __drm_colorops_state *colorops;
+
 	/**
 	 * @planes:
 	 *
@@ -599,6 +631,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 struct drm_plane_state * __must_check
 drm_atomic_get_plane_state(struct drm_atomic_state *state,
 			   struct drm_plane *plane);
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop);
 struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
@@ -731,6 +766,36 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
+/**
+ * drm_atomic_get_old_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the old colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].old_state;
+}
+
+/**
+ * drm_atomic_get_new_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the new colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].new_state;
+}
+
 /**
  * drm_atomic_get_existing_connector_state - get connector state, if it exists
  * @state: global atomic state object
@@ -839,6 +904,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
+int __must_check
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
 int __must_check drm_atomic_commit(struct drm_atomic_state *state);
@@ -978,6 +1046,49 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
 			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
 
+/**
+ * for_each_oldnew_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @old_colorop_state: &struct drm_colorop_state iteration cursor for the old state
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking both old and
+ * new state. This is useful in places where the state delta needs to be
+ * considered, for example in atomic check functions.
+ */
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
+
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful in places where the state delta needs to be considered, for example in
+ * atomic check functions.
+ */
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 4c6d39d7bdb2..436315523326 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -37,6 +37,7 @@ struct drm_crtc;
 struct drm_connector_state;
 struct dma_fence;
 struct drm_framebuffer;
+struct drm_colorop;
 
 int __must_check
 drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
@@ -49,6 +50,8 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 			      struct drm_crtc *crtc);
 void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
+void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				      struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 6cb577f6dba6..ba420444b9f3 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_lut_32_size - calculate the number of entries in the extended LUT
+ * @blob: blob containing the LUT
+ *
+ * Returns:
+ * The number of entries in the color LUT stored in @blob.
+ */
+static inline int drm_color_lut_32_size(const struct drm_property_blob *blob)
+{
+	return blob->length / sizeof(struct drm_color_lut_32);
+}
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -145,4 +157,5 @@ void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *
 
 void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests);
 #endif
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
new file mode 100644
index 000000000000..d5aebe46970f
--- /dev/null
+++ b/include/drm/drm_colorop.h
@@ -0,0 +1,442 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DRM_COLOROP_H__
+#define __DRM_COLOROP_H__
+
+#include <drm/drm_mode_object.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_property.h>
+
+/* DRM colorop flags */
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	 *
+	 * enum string "sRGB EOTF"
+	 *
+	 * sRGB piece-wise electro-optical transfer function. Transfer
+	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
+	 * to H.273 TransferCharacteristics code point 13 with
+	 * MatrixCoefficients set to 0.
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+	 *
+	 * enum string "sRGB Inverse EOTF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * enum string "PQ 125 EOTF"
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * enum string "PQ 125 Inverse EOTF"
+	 *
+	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * enum string "BT.2020 Inverse OETF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * enum string "BT.2020 OETF"
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
+/**
+ * struct drm_colorop_state - mutable colorop state
+ */
+struct drm_colorop_state {
+	/** @colorop: backpointer to the colorop */
+	struct drm_colorop *colorop;
+
+	/*
+	 * Color properties
+	 *
+	 * The following fields are not always valid, their usage depends
+	 * on the colorop type. See their associated comment for more
+	 * information.
+	 */
+
+
+	/**
+	 * @bypass:
+	 *
+	 * When the property BYPASS exists on this colorop, this stores
+	 * the requested bypass state: true if colorop shall be bypassed,
+	 * false if colorop is enabled.
+	 */
+	bool bypass;
+
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
+	/**
+	 * @multiplier:
+	 *
+	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
+	 */
+	uint64_t multiplier;
+
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 *
+	 * See the &drm_colorop_type documentation for how blob is laid
+	 * out.
+	 */
+	struct drm_property_blob *data;
+
+	/** @state: backpointer to global drm_atomic_state */
+	struct drm_atomic_state *state;
+};
+
+/**
+ * struct drm_colorop - DRM color operation control structure
+ *
+ * A colorop represents one color operation. They can be chained via
+ * the 'next' pointer to build a color pipeline.
+ *
+ * Since colorops cannot stand-alone and are used to describe colorop
+ * operations on a plane they don't have their own locking mechanism but
+ * are locked and programmed along with their associated &drm_plane.
+ *
+ */
+struct drm_colorop {
+	/** @dev: parent DRM device */
+	struct drm_device *dev;
+
+	/**
+	 * @head:
+	 *
+	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
+	 * Invariant over the lifetime of @dev and therefore does not need
+	 * locking.
+	 */
+	struct list_head head;
+
+	/**
+	 * @index: Position inside the mode_config.list, can be used as an array
+	 * index. It is invariant over the lifetime of the colorop.
+	 */
+	unsigned int index;
+
+	/** @base: base mode object */
+	struct drm_mode_object base;
+
+	/**
+	 * @plane:
+	 *
+	 * The plane on which the colorop sits. A drm_colorop is always unique
+	 * to a plane.
+	 */
+	struct drm_plane *plane;
+
+	/**
+	 * @state:
+	 *
+	 * Current atomic state for this colorop.
+	 *
+	 * This is protected by @mutex. Note that nonblocking atomic commits
+	 * access the current colorop state without taking locks.
+	 */
+	struct drm_colorop_state *state;
+
+	/*
+	 * Color properties
+	 *
+	 * The following fields are not always valid, their usage depends
+	 * on the colorop type. See their associated comment for more
+	 * information.
+	 */
+
+	/** @properties: property tracking for this colorop */
+	struct drm_object_properties properties;
+
+	/**
+	 * @type:
+	 *
+	 * Read-only
+	 * Type of color operation
+	 */
+	enum drm_colorop_type type;
+
+	/**
+	 * @next:
+	 *
+	 * Read-only
+	 * Pointer to next drm_colorop in pipeline
+	 */
+	struct drm_colorop *next;
+
+	/**
+	 * @type_property:
+	 *
+	 * Read-only "TYPE" property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
+
+	/**
+	 * @bypass_property:
+	 *
+	 * Boolean property to control enablement of the color
+	 * operation. Setting bypass to "true" shall always be supported
+	 * in order to allow compositors to quickly fall back to
+	 * alternate methods of color processing. This is important
+	 * since setting color operations can fail due to unique
+	 * HW constraints.
+	 */
+	struct drm_property *bypass_property;
+
+	/**
+	 * @lut_size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t lut_size;
+
+	/**
+	 * @lut1d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_1D_LUT
+	 */
+	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
+
+	/**
+	 * @lut3d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_3D_LUT
+	 */
+	enum drm_colorop_lut3d_interpolation_type lut3d_interpolation;
+
+	/**
+	 * @lut1d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_1D_LUT interpolation
+	 */
+	struct drm_property *lut1d_interpolation_property;
+
+	/**
+	 * @curve_1d_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
+	/**
+	 * @multiplier_property:
+	 *
+	 * Multiplier property for plane gain
+	 */
+	struct drm_property *multiplier_property;
+
+	/**
+	 * @lut_size_property:
+	 *
+	 * Size property for custom LUT from userspace.
+	 */
+	struct drm_property *lut_size_property;
+
+	/**
+	 * @lut3d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_3D_LUT interpolation
+	 */
+	struct drm_property *lut3d_interpolation_property;
+
+	/**
+	 * @data_property:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
+	/**
+	 * @next_property:
+	 *
+	 * Read-only property to next colorop in the pipeline
+	 */
+	struct drm_property *next_property;
+
+};
+
+#define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
+
+/**
+ * drm_colorop_find - look up a Colorop object from its ID
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: &drm_mode_object ID
+ *
+ * This can be used to look up a Colorop from its userspace ID. Only used by
+ * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
+ * userspace interface should be done using &drm_property.
+ */
+static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
+		struct drm_file *file_priv,
+		uint32_t id)
+{
+	struct drm_mode_object *mo;
+
+	mo = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_COLOROP);
+	return mo ? obj_to_colorop(mo) : NULL;
+}
+
+void drm_colorop_pipeline_destroy(struct drm_plane *plane);
+
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size,
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+					uint32_t flags);
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane, uint32_t flags);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane, uint32_t flags);
+int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				 struct drm_plane *plane,
+				 uint32_t lut_size,
+				 enum drm_colorop_lut3d_interpolation_type interpolation,
+				 uint32_t flags);
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state);
+
+/**
+ * drm_colorop_reset - reset colorop atomic state
+ * @colorop: drm colorop
+ *
+ * Resets the atomic state for @colorop by freeing the state pointer (which might
+ * be NULL, e.g. at driver load time) and allocating a new empty state object.
+ */
+void drm_colorop_reset(struct drm_colorop *colorop);
+
+/**
+ * drm_colorop_index - find the index of a registered colorop
+ * @colorop: colorop to find index for
+ *
+ * Given a registered colorop, return the index of that colorop within a DRM
+ * device's list of colorops.
+ */
+static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
+{
+	return colorop->index;
+}
+
+
+#define drm_for_each_colorop(colorop, dev) \
+	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
+
+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
+
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @type: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
+
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
+#endif /* __DRM_COLOROP_H__ */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..5d57a17502ab 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -206,6 +206,13 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * True if client understands plane color pipelines
+	 */
+	bool plane_color_pipeline;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 1922188f00e8..0b44f2f294ce 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 9e524b51a001..55310e96f316 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -499,6 +499,24 @@ struct drm_mode_config {
 	 */
 	struct raw_spinlock panic_lock;
 
+	/**
+	 * @num_colorop:
+	 *
+	 * Number of colorop objects on this device.
+	 * This is invariant over the lifetime of a device and hence doesn't
+	 * need any locks.
+	 */
+	int num_colorop;
+
+	/**
+	 * @colorop_list:
+	 *
+	 * List of colorop objects linked with &drm_colorop.head. This is
+	 * invariant over the lifetime of a device and hence doesn't need any
+	 * locks.
+	 */
+	struct list_head colorop_list;
+
 	/**
 	 * @num_crtc:
 	 *
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 01479dd94e76..703ef4d1bbbc 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -243,6 +243,14 @@ struct drm_plane_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @color_pipeline:
+	 *
+	 * The first colorop of the active color pipeline, or NULL, if no
+	 * color pipeline is active.
+	 */
+	struct drm_colorop *color_pipeline;
+
 	/**
 	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
 	 * and for async plane updates.
@@ -783,6 +791,14 @@ struct drm_plane {
 	 */
 	struct drm_property *color_range_property;
 
+	/**
+	 * @color_pipeline_property:
+	 *
+	 * Optional "COLOR_PIPELINE" enum property for specifying
+	 * a color pipeline to use on the plane.
+	 */
+	struct drm_property *color_pipeline_property;
+
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
 	 * scaling.
@@ -1006,4 +1022,7 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);
 
+int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines);
 #endif
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 45c4fa13499c..948ae7b95741 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1617,15 +1617,6 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index e63a71d3c607..80c35ff7f21e 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -875,6 +875,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_plane, as well as drm_colorop properties.
+ *
+ * Setting of these plane properties will be rejected when this client
+ * cap is set:
+ * - COLOR_ENCODING
+ * - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..ce14e7cf9651 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -846,6 +847,20 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -857,6 +872,124 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+struct drm_color_lut_32 {
+	/*
+	 * Similar to drm_color_lut but for high precision LUTs
+	 */
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+
+enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * enum string "1D Curve"
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via the CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut_32 entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut_32 with size
+	 * of "lut_size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * enum string "3x4 Matrix"
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 *
+	 * The DATA blob is a float[12]:
+	 * out   matrix          in
+	 * | R |   | 0  1  2  3  |   | R |
+	 * | G | = | 4  5  6  7  | x | G |
+	 * | B |   | 8  9  10 12 |   | B |
+	 */
+	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * enum string "Multiplier"
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut_32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut_32 with dimension
+	 * length of "lut_size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for B in range 0..n
+	 *     for G in range 0..n
+	 *       for R in range 0..n
+	 *        index = R + n * (G + n * B)
+	 *         color = lut3d[index]
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+};
+
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.42.0

