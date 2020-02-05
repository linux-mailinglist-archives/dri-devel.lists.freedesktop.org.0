Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E8153AE3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC066E25F;
	Wed,  5 Feb 2020 22:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19976E25F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:23:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 14:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,407,1574150400"; d="scan'208";a="430307321"
Received: from jhli-desk1.jf.intel.com ([10.54.74.161])
 by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2020 14:22:59 -0800
From: Juston Li <juston.li@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 libdrm 1/2] include/drm: sync up drm.h
Date: Wed,  5 Feb 2020 14:22:24 -0800
Message-Id: <20200205222225.5015-1-juston.li@intel.com>
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
Cc: daniel.vetter@ffwll.ch, eric@engestrom.ch, Juston Li <juston.li@intel.com>,
 daniels@collabora.com
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
