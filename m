Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF52DB952
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 03:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779E889BE8;
	Wed, 16 Dec 2020 02:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278D89BB3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:44:17 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A379145F;
 Wed, 16 Dec 2020 03:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608086654;
 bh=HM3tG6K9lGcdM8O2BuVhIFCGQcSvs5bjOw3hQeJ4zQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bj0/98k/j9U4YKc9Z+79MPN1rBCFBwBKpgQP/0FvQV3nbNzA2uMIq43KKeZZjIiTe
 fdficBbj/y+IwyiBqav1Af4gu/ghAZ+rallPQPTIVLaFAwcG6NIkC0vJXVtldHCCIl
 7LaSgU80JmC7u9sv/RHlOYRJgQ71b8feRMfgDpqo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/10] drm: uapi: Remove copies of GPL license text from
 headers
Date: Wed, 16 Dec 2020 04:43:59 +0200
Message-Id: <20201216024359.12995-10-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several DRM drivers uAPI headers that are licensed under the GPL carry
both an SPDX header and a copy of the license text. Drop the latter.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/armada_drm.h  |  4 ----
 include/uapi/drm/etnaviv_drm.h | 12 ------------
 include/uapi/drm/exynos_drm.h  |  5 -----
 include/uapi/drm/omap_drm.h    | 12 ------------
 4 files changed, 33 deletions(-)

diff --git a/include/uapi/drm/armada_drm.h b/include/uapi/drm/armada_drm.h
index af1c14c837c5..f711e63a9758 100644
--- a/include/uapi/drm/armada_drm.h
+++ b/include/uapi/drm/armada_drm.h
@@ -2,10 +2,6 @@
 /*
  * Copyright (C) 2012 Russell King
  *  With inspiration from the i915 driver
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 #ifndef DRM_ARMADA_IOCTL_H
 #define DRM_ARMADA_IOCTL_H
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index 09d0df8b71c5..e23e0f885655 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -1,18 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (C) 2015 Etnaviv Project
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __ETNAVIV_DRM_H__
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index a51aa1c618c1..a96fa566433c 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -6,11 +6,6 @@
  *	Inki Dae <inki.dae@samsung.com>
  *	Joonyoung Shim <jy0922.shim@samsung.com>
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
  */
 
 #ifndef _UAPI_EXYNOS_DRM_H_
diff --git a/include/uapi/drm/omap_drm.h b/include/uapi/drm/omap_drm.h
index 5a142fad473c..b51dad32122d 100644
--- a/include/uapi/drm/omap_drm.h
+++ b/include/uapi/drm/omap_drm.h
@@ -4,18 +4,6 @@
  *
  * Copyright (C) 2011 Texas Instruments
  * Author: Rob Clark <rob@ti.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __OMAP_DRM_H__
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
