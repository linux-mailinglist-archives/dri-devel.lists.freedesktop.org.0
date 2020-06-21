Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0A2027E7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 04:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67D6E1BD;
	Sun, 21 Jun 2020 02:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F417B6E1BD
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 02:07:31 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C289728D;
 Sun, 21 Jun 2020 04:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592705250;
 bh=ufNNMSvA0z0J+UVo0vYDTzTKt7UAghjMquSfvCBZqeU=;
 h=From:To:Cc:Subject:Date:From;
 b=HQqZh+U1yOFPV2eHbFmW0KM50EB4uRZ8XDPAHvlYqmxXxR48Ks2PA5Q5ZTc7ygYbf
 KdeHJjA2ueufxZiZDN8M8wFXBW6S7XFAVBL2qWujXr1kG1buYz+4too7x7P/SO0D+Y
 l4Qk/lAvTTOB1Q8amRkWu7giN3NbD+lgpM7hqn60=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: uapi: Use SPDX in DRM core uAPI headers
Date: Sun, 21 Jun 2020 05:07:01 +0300
Message-Id: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM core uAPI headers are licensed under the MIT license, and carry
copies of the license with slight variations. Replace them with SPDX
headers.

Following a discussion with Daniel Vetter on this topic, add a
clarification in the drm-uapi.rst file that independent closed-source
userspace implementations of software using the DRM uAPI are accepted,
as allowed by the MIT license.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
---
 Documentation/gpu/drm-uapi.rst |  4 ++++
 include/uapi/drm/drm.h         | 20 +-------------------
 include/uapi/drm/drm_fourcc.h  | 20 +-------------------
 include/uapi/drm/drm_mode.h    | 19 +------------------
 include/uapi/drm/drm_sarea.h   | 20 +-------------------
 5 files changed, 8 insertions(+), 75 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 56fec6ed1ad8..de2ecc76dd6c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -107,6 +107,10 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
 for the same thing co-existing. If we add a few more complete mistakes into the
 mix every year it would be entirely unmanageable.
 
+The DRM subsystem has however no concern with independent closed-source
+userspace implementations. To officialize that position, the DRM uAPI headers
+are covered by the MIT license.
+
 .. _drm_render_node:
 
 Render nodes
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..14d57361e580 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /**
  * \file drm.h
  * Header for the Direct Rendering Manager
@@ -12,25 +13,6 @@
  * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
  * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
  * All rights reserved.
- *
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
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef _DRM_H_
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 490143500a50..d2c4a597620f 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1,24 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright 2011 Intel Corporation
- *
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
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef DRM_FOURCC_H
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 735c8cfdaaa1..c34a544fdf29 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1,27 +1,10 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
  * Copyright (c) 2007 Jakob Bornecrantz <wallbraker@gmail.com>
  * Copyright (c) 2008 Red Hat Inc.
  * Copyright (c) 2007-2008 Tungsten Graphics, Inc., Cedar Park, TX., USA
  * Copyright (c) 2007-2008 Intel Corporation
- *
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
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
  */
 
 #ifndef _DRM_MODE_H
diff --git a/include/uapi/drm/drm_sarea.h b/include/uapi/drm/drm_sarea.h
index a951ced60ebe..1e38d028332d 100644
--- a/include/uapi/drm/drm_sarea.h
+++ b/include/uapi/drm/drm_sarea.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /**
  * \file drm_sarea.h
  * \brief SAREA definitions
@@ -8,25 +9,6 @@
 /*
  * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
  * All Rights Reserved.
- *
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
- * TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef _DRM_SAREA_H_
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
