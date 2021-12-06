Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CD46A2D1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7A73A3E;
	Mon,  6 Dec 2021 17:26:41 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302F73AA3
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:38 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 436C029F497;
 Mon,  6 Dec 2021 17:26:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811597; bh=XpJhnUJmfXBWaCSUziQ55AK68H+S/IVPt5Q3elHIhRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LzUYm9nUFqqWU5dlrVTSbCOsZoB9tYoCSjn4k5xRQU3TQmoX5cfUIBBwzBFSI2af8
 FGDc14aIwcSxVEgKuX0VmKXmn3CxGdwydMqWYZb4ruCDHTINlBPy8C+LrSjWu0jjhC
 //R3FOQDtqkz0xgaDBxsj0HEKqHYrQzNNzDeMtyVdJ+NB5U/tyoGwN3rQPzvgI6EVZ
 HkPWy6zmUMbJgQPg5wh85ywca3aqyRvbugqsLYUVRSzLmT4d5IpZ7GWwhqQ9bbgf6Z
 6wCp1EZ7fzxRfL+dbxhckkDJjOJN5qHQ1ok5K73uYZhIDXM7khbYeLyQVOSrzzhzfY
 FWPUnrzc9IK6A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 06/12] drm/vmwgfx: Update device headers for GL43
Date: Mon,  6 Dec 2021 12:26:14 -0500
Message-Id: <20211206172620.3139754-7-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
MIME-Version: 1.0
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Update the headers for GL43 userspace works that landed in Mesa3D. Also
update the license headers to conform to the kernel guidelines.

For GL43 the virtual device got D3D11.1 support with some GL extensions.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h |  6 +++---
 .../gpu/drm/vmwgfx/device_include/svga3d_devcaps.h | 10 +++++++---
 drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h  | 12 ++++++------
 .../gpu/drm/vmwgfx/device_include/svga3d_limits.h  |  8 +++++---
 drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h |  6 +++---
 .../gpu/drm/vmwgfx/device_include/svga3d_types.h   |  7 +++----
 .../gpu/drm/vmwgfx/device_include/svga_escape.h    |  6 +++---
 .../gpu/drm/vmwgfx/device_include/svga_overlay.h   |  6 +++---
 drivers/gpu/drm/vmwgfx/device_include/svga_reg.h   | 14 ++++++++------
 9 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h
index 945c84b27e81..d90d940ad3f4 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_cmd.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2012-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_cmd.h --
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_devcaps.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_devcaps.h
index 379ec15c7758..815d0ab0053f 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_devcaps.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_devcaps.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 1998-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_devcaps.h --
@@ -347,6 +347,10 @@ typedef uint32 SVGA3dDevCapIndex;
 #define SVGA3D_DEVCAP_SM5 258
 #define SVGA3D_DEVCAP_MULTISAMPLE_8X 259
 
+#define SVGA3D_DEVCAP_MAX_FORCED_SAMPLE_COUNT 260
+
+#define SVGA3D_DEVCAP_GL43 261
+
 #define SVGA3D_DEVCAP_MAX 262
 
 #define SVGA3D_DXFMT_SUPPORTED (1 << 0)
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h
index 5af442dad542..925bf4b93f01 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_dx.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2012-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_dx.h --
@@ -508,11 +508,11 @@ typedef struct SVGA3dCmdDXSetPredication {
 #pragma pack(pop)
 
 #pragma pack(push, 1)
-typedef struct MKS3dDXSOState {
+typedef struct SVGA3dDXSOState {
 	uint32 offset;
 	uint32 intOffset;
-	uint32 vertexCount;
-	uint32 dead;
+	uint32 dead1;
+	uint32 dead2;
 } SVGA3dDXSOState;
 #pragma pack(pop)
 
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_limits.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_limits.h
index 35494a728c7a..6103b41fe92b 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_limits.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_limits.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2012-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_limits.h --
@@ -82,4 +82,6 @@
 #define SVGA3D_MIN_SBX_DATA_SIZE (GBYTES_2_BYTES(1))
 #define SVGA3D_MAX_SBX_DATA_SIZE (GBYTES_2_BYTES(4))
 
+#define SVGA3D_MIN_SBX_DATA_SIZE_DVM (MBYTES_2_BYTES(900))
+#define SVGA3D_MAX_SBX_DATA_SIZE_DVM (MBYTES_2_BYTES(910))
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h
index 988d8509c472..b24b4f55c941 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_reg.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 1998-2015 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_reg.h --
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga3d_types.h b/drivers/gpu/drm/vmwgfx/device_include/svga3d_types.h
index 70b88ee16cf6..e9219eb380a2 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga3d_types.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga3d_types.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2012-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga3d_types.h --
@@ -370,7 +370,6 @@ typedef enum SVGA3dSurfaceFormat {
 #define SVGA3D_SURFACE_TRANSFER_FROM_BUFFER (CONST64U(1) << 30)
 
 #define SVGA3D_SURFACE_RESERVED1 (CONST64U(1) << 31)
-#define SVGA3D_SURFACE_VADECODE SVGA3D_SURFACE_RESERVED1
 
 #define SVGA3D_SURFACE_MULTISAMPLE (CONST64U(1) << 32)
 
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga_escape.h b/drivers/gpu/drm/vmwgfx/device_include/svga_escape.h
index bf242c21f352..405f20fc26c2 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga_escape.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga_escape.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2007,2020 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga_escape.h --
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga_overlay.h b/drivers/gpu/drm/vmwgfx/device_include/svga_overlay.h
index aec17c3c6c29..691f48f77e33 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga_overlay.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga_overlay.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 2007-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga_overlay.h --
diff --git a/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h b/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
index b3602557de2e..acabdb550c10 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/svga_reg.h
@@ -1,6 +1,6 @@
-/**********************************************************
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
  * Copyright 1998-2021 VMware, Inc.
- * SPDX-License-Identifier: GPL-2.0 OR MIT
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -22,7 +22,7 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  * SOFTWARE.
  *
- **********************************************************/
+ */
 
 /*
  * svga_reg.h --
@@ -442,6 +442,7 @@ typedef struct {
 #define SVGA_CAP2_TRACE_FULL_FB 0x00002000
 #define SVGA_CAP2_EXTRA_REGS 0x00004000
 #define SVGA_CAP2_LO_STAGING 0x00008000
+#define SVGA_CAP2_VIDEO_BLT 0x00010000
 #define SVGA_CAP2_RESERVED 0x80000000
 
 typedef enum {
@@ -450,9 +451,10 @@ typedef enum {
 	SVGABackdoorCap3dHWVersion = 2,
 	SVGABackdoorCapDeviceCaps2 = 3,
 	SVGABackdoorCapDevelCaps = 4,
-	SVGABackdoorDevelRenderer = 5,
-	SVGABackdoorDevelUsingISB = 6,
-	SVGABackdoorCapMax = 7,
+	SVGABackdoorCapDevCaps = 5,
+	SVGABackdoorDevelRenderer = 6,
+	SVGABackdoorDevelUsingISB = 7,
+	SVGABackdoorCapMax = 8,
 } SVGABackdoorCapType;
 
 enum {
-- 
2.32.0

