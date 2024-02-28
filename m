Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68286AC14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324B310E224;
	Wed, 28 Feb 2024 10:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uQuFGwtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0888C10E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 362D3673;
 Wed, 28 Feb 2024 11:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709115765;
 bh=+sBHCZnxivJtqIeiUvexiV7eXf7chM+H+qwLmI6n69I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uQuFGwtzar/edgluCPsOSNrciZTBRB3yWqsgrA3i1ADmLGQ8JUjw4s+MZqYEKxfUT
 sTCqNL6cjyErAgKaZjCBz1lPfUVaiWqW4GtKPkMZkX6ewMdct1QfBSm1Uw2QaBBI5r
 8MhWY4cEmynrmjOGDjEzuZhJHmpjVqY6ZdM/zcNI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Subject: [PATCH 1/2] drm/fourcc.h: List of Open Source Waiver projects
Date: Wed, 28 Feb 2024 11:22:43 +0100
Message-ID: <20240228102245.80469-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
References: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm/fourcc.h header includes an 'Open Source User Waiver' section
that lists projects using the header in potentially closed source
software stacks.

To prepare to expand the number of projects to which such waiver notice
applies, make it a list to maintain the paragraph readable.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/drm/drm_fourcc.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 84d502e42961..4e6df826946a 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -93,9 +93,14 @@ extern "C" {
  * -----------------------
  *
  * Because this is the authoritative source for pixel formats and modifiers
- * referenced by GL, Vulkan extensions and other standards and hence used both
- * by open source and closed source driver stacks, the usual requirement for an
- * upstream in-kernel or open source userspace user does not apply.
+ * referenced by the following projects:
+ *
+ * - GL
+ * - Vulkan extensions
+ *
+ * and other standards, and hence used both by open source and closed source
+ * driver stacks, the usual requirement for an upstream in-kernel or open source
+ * userspace user does not apply.
  *
  * To ensure, as much as feasible, compatibility across stacks and avoid
  * confusion with incompatible enumerations stakeholders for all relevant driver
-- 
2.43.2

