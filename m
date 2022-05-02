Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A88517153
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521C710E72B;
	Mon,  2 May 2022 14:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E29B10E894;
 Mon,  2 May 2022 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651500879; x=1683036879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IW+Mnok42lROVoAYAnarmztOZNy49bHnFCCaqVYee78=;
 b=deJEPi1s5Zr3kCWFW0llH+5XBbyxFCEWEEIkHtB2qtplSa3BiVpicqD4
 pty+PDjx9sikDaEfIAz5zHYIcdsl2KWuAsJZ/DfhqCVsPqNucO4yCtb2g
 jE12ryWaEhNuWSQB7YOKVZySE4YW5424/20WuTGKyV5zWBZtwpHj3jj13
 ne/6izbW691fEyqmXH9F43r5dIBhGBMqKfdJhyhKR25CRYRWO6GZR6cJ8
 UtkKBxIKMHtz8oCbaMwEJ5FqMQncgMTaCOSqbnXD93dIL7BTRT3SbF0cO
 dXImXshvuCE7Z0w+9Mis+od16orNfinKjUHpKnYo3vQ0oCpLuJPEGdste A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="264811605"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="264811605"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:14:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="546375388"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:14:05 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
Date: Mon,  2 May 2022 19:45:08 +0530
Message-Id: <20220502141508.2327-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Tony Ye <tony.ye@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capture the impact of memory region preference list of the objects, on
their memory residency and Flat-CCS capability.

v2:
  Fix the Flat-CCS capability of an obj with {lmem, smem} preference
  list [Thomas]
v3:
  Reworded the doc [Matt]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Matthew Auld <matthew.auld@intel.com>
cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
cc: Daniel Vetter <daniel.vetter@ffwll.ch>
cc: Jon Bloomfield <jon.bloomfield@intel.com>
cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
cc: Kenneth Graunke <kenneth@whitecape.org>
cc: mesa-dev@lists.freedesktop.org
cc: Jordan Justen <jordan.l.justen@intel.com>
cc: Tony Ye <tony.ye@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a2def7b27009..b7e1c2fe08dc 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
  * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
  * along with the final object size in &drm_i915_gem_create_ext.size, which
  * should account for any rounding up, if required.
+ *
+ * Note that userspace has no means of knowing the current backing region
+ * for objects where @num_regions is larger than one. The kernel will only
+ * ensure that the priority order of the @regions array is honoured, either
+ * when initially placing the object, or when moving memory around due to
+ * memory pressure
+ *
+ * On Flat-CCS capable HW, compression is supported for the objects residing
+ * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
+ * memory class in @regions and migrated (by I915, due to memory
+ * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
+ * decompress the content. But I915 dosen't have the required information to
+ * decompress the userspace compressed objects.
+ *
+ * So I915 supports Flat-CCS, only on the objects which can reside only on
+ * I915_MEMORY_CLASS_DEVICE regions.
  */
 struct drm_i915_gem_create_ext_memory_regions {
 	/** @base: Extension link. See struct i915_user_extension. */
-- 
2.20.1

