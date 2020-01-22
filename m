Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A1145F33
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 00:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC89B6F938;
	Wed, 22 Jan 2020 23:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413206F938
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:37:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 15:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,351,1574150400"; d="scan'208";a="227828469"
Received: from jhli-desk1.jf.intel.com ([10.54.74.160])
 by orsmga003.jf.intel.com with ESMTP; 22 Jan 2020 15:37:13 -0800
From: Juston Li <juston.li@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 libdrm 1/2] include/drm: sync up drm.h
Date: Wed, 22 Jan 2020 15:36:15 -0800
Message-Id: <20200122233617.12725-1-juston.li@intel.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds DRM_IOCTL_MODE_GETFB2

Taken from drm-next-misc:
        commit 3ff4c24bdb1f494c217c80348f9db4896043ed81
        Author: Lyude Paul <lyude@redhat.com>
        Date:   Fri Jan 17 17:47:48 2020 -0500

        drm/dp_mst: Fix indenting in drm_dp_mst_topology_mgr_set_mst()

Signed-off-by: Juston Li <juston.li@intel.com>
---
 include/drm/drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm.h b/include/drm/drm.h
index ab9403397815..c7fd2a35fd7b 100644
--- a/include/drm/drm.h
+++ b/include/drm/drm.h
@@ -942,6 +942,8 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+#define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
+
 /**
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
