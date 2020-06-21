Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E7B2027E8
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 04:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799646E39C;
	Sun, 21 Jun 2020 02:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C256E39C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 02:07:33 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CFFDA5E;
 Sun, 21 Jun 2020 04:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592705252;
 bh=dkpidZQZdtNJ9nEU3y9CTisKCAU4YWInAxPRm3cbsGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uHeVMg5gxIK6hc27YTqRFrDb2kRV3ZycAEMU+K0NoNKm9pHHJnAL6y9I1CEfcJY4L
 J7SNtLXzEByawQGaQrNkbDxf24RPxZ+wjZRxhfGzj3bcA/XNV/oJbuHw6QzSPmY5pq
 8j7xYstlXo1haK/OC6Xd8fBUqjgl/x+PZtLEZCVY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: uapi: Remove copies of GPL license text from headers
Date: Sun, 21 Jun 2020 05:07:03 +0300
Message-Id: <20200621020703.864-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621020703.864-1-laurent.pinchart+renesas@ideasonboard.com>
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
