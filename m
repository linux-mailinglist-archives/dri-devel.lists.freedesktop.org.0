Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519786AC15
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4A10E3AC;
	Wed, 28 Feb 2024 10:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tp40M9G2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B4010E224
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:23:00 +0000 (UTC)
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3682C67;
 Wed, 28 Feb 2024 11:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709115766;
 bh=/PO7lrdNN+BR72WBPZIhaziNaBZeuId0bz42VMXWQ2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tp40M9G2UffKnuDlJTFNv5RWVC9uFN2Nt4uERmoadORysTz60wgDrTUHitUqVvAtB
 02xJeS1wOY9DDUImljKdk1I34GTOUOC3hJ5zonjn7bLy2NbEfFWkMnwg3tnmYS/HPg
 4m/r5Rr+2Yfxi/v4zCq9T5lPWbWMCQGDC03gBfAk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, libcamera-devel@lists.libcamera.org
Subject: [PATCH 2/2] drm/fourcc.h: Add libcamera to Open Source Waiver
Date: Wed, 28 Feb 2024 11:22:44 +0100
Message-ID: <20240228102245.80469-3-jacopo.mondi@ideasonboard.com>
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

The libcamera (www.libcamera.org) project uses the drm/fourcc.h header
to define its own image formats. Albeit libcamera aims for fully open
source driver and userspace software stacks, it is licensed with the
'GNU L-GPL' license which allows closed source application to link
against the library.

Add libcamera to the list projects to which the 'Open Source User
Waiver' notice applies.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/drm/drm_fourcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 4e6df826946a..beef743ac818 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -97,6 +97,7 @@ extern "C" {
  *
  * - GL
  * - Vulkan extensions
+ * - libcamera
  *
  * and other standards, and hence used both by open source and closed source
  * driver stacks, the usual requirement for an upstream in-kernel or open source
-- 
2.43.2

