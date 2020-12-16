Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC802DB94C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 03:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13389B99;
	Wed, 16 Dec 2020 02:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42A189B99
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:44:11 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63CD945E;
 Wed, 16 Dec 2020 03:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608086649;
 bh=mobJJVF6fsSKI1EYPdSiuCNcSEbd/WCk+XyW9psheQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oskjqw5b5aJPRrs7viDroCTpEEl1aZwpHoH3qnLrXEz/UHmXXYSKlJs9IqEjqGWZ0
 d7r6IM+9vNWMYsQU3Ea+8fdXJSzy58loDKJzXRVXwthNyB6GWjWw1DXXC3OgWJBB7A
 n6wKm1mtU6LInyDoR9BjAa+v3hGyPT5SXjxXdbEU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/10] drm: uapi: amd: Use SPDX in DRM drivers uAPI headers
Date: Wed, 16 Dec 2020 04:43:51 +0200
Message-Id: <20201216024359.12995-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AMD DRM drivers uAPI headers are licensed under the MIT license,
and carry copies of the license with slight variations. Replace them
with SPDX headers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/uapi/drm/amdgpu_drm.h | 19 +------------------
 include/uapi/drm/r128_drm.h   | 20 +-------------------
 include/uapi/drm/radeon_drm.h | 20 +-------------------
 3 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 7fb9c09ee93f..8ca36b088d71 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /* amdgpu_drm.h -- Public header for the amdgpu driver -*- linux-c -*-
  *
  * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
@@ -5,24 +6,6 @@
  * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
  * Copyright 2014 Advanced Micro Devices, Inc.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
  * Authors:
  *    Kevin E. Martin <martin@valinux.com>
  *    Gareth Hughes <gareth@valinux.com>
diff --git a/include/uapi/drm/r128_drm.h b/include/uapi/drm/r128_drm.h
index 690e9c62f510..c426e6a1c843 100644
--- a/include/uapi/drm/r128_drm.h
+++ b/include/uapi/drm/r128_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /* r128_drm.h -- Public header for the r128 driver -*- linux-c -*-
  * Created: Wed Apr  5 19:24:19 2000 by kevin@precisioninsight.com
  */
@@ -6,25 +7,6 @@
  * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
  * All rights reserved.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Authors:
  *    Gareth Hughes <gareth@valinux.com>
  *    Kevin E. Martin <martin@valinux.com>
diff --git a/include/uapi/drm/radeon_drm.h b/include/uapi/drm/radeon_drm.h
index 490a59cc4532..b5c4ef813a9e 100644
--- a/include/uapi/drm/radeon_drm.h
+++ b/include/uapi/drm/radeon_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /* radeon_drm.h -- Public header for the radeon driver -*- linux-c -*-
  *
  * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
@@ -5,25 +6,6 @@
  * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
  * All rights reserved.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
  * Authors:
  *    Kevin E. Martin <martin@valinux.com>
  *    Gareth Hughes <gareth@valinux.com>
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
