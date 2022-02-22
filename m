Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608D4BF629
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F8E10E5EB;
	Tue, 22 Feb 2022 10:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269BE10E5B6;
 Tue, 22 Feb 2022 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645526211; x=1677062211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayfCVdMd4wdNcoROM0Gv+09gffhqqiIkFFhtIMM/BCE=;
 b=dWo0VYcHp0WEHndRzwUhuh08y/+dETgCOeLvpGHe/C6C0HD0VW/8zHZv
 t3IEtEEnp8DY+QB7OQCbOuf8Ne/DBFC8Iflri8KbxGCeFq0OkmUFqOh/O
 6Ux8QXhu4EK7DlTMKH0hCVsk03YwKe14Wc+PqTndSM+hNlgixuL4KTI5G
 nEfG2I5EKPChUbLO7p4YwDjE4cYX18fHXWU3FB40CntPZYJrpRRo28VsN
 8GHAVnNGurrEky5BCznvK4zDKdRTHKO2yat+Y4BIloIpaeYrLAc7okeVY
 4Ot1/TP0t/xQFHJoni7ieCCCnNSSPbAtdiw2KoAUJHo5ikS73dlB3H2YP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314921386"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="314921386"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 02:36:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="776258212"
Received: from eelele-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.245.101])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 02:36:50 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 3/4] drm/i915/uapi: Add struct
 drm_i915_query_hwconfig_blob_item
Date: Tue, 22 Feb 2022 02:36:39 -0800
Message-Id: <20220222103640.1006006-4-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222103640.1006006-1-jordan.l.justen@intel.com>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also, document DRM_I915_QUERY_HWCONFIG_BLOB with this struct.

v3:
 * Add various changes suggested by Tvrtko

v5:
 * Fix documenation formatting and verified with `make htmldocs` as
   suggested by Daniel

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/i915_drm.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 069d2fadfbd9..e44902ce8e64 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3276,6 +3276,49 @@ struct drm_i915_gem_create_ext_protected_content {
 	__u32 flags;
 };
 
+/**
+ * DOC: GuC HWCONFIG blob uAPI
+ *
+ * The GuC produces a blob with information about the current device.
+ * i915 reads this blob from GuC and makes it available via this uAPI.
+ *
+ * The returned blob is a sequence of items of variable length
+ * described by struct drm_i915_query_hwconfig_blob_item.
+ *
+ * The overall blob returned by DRM_I915_QUERY_HWCONFIG_BLOB will end
+ * at the same location as the end of the final struct
+ * drm_i915_query_hwconfig_blob_item. In other words, walking through
+ * the individual items is guaranteed to eventually arrive at the
+ * exact end of the entire blob.
+ */
+
+/**
+ * struct drm_i915_query_hwconfig_blob_item - A single hwconfig item
+ * within the sequence of hwconfig items returned by
+ * DRM_I915_QUERY_HWCONFIG_BLOB.
+ *
+ * The length field gives the length of the data[] array. The length
+ * is the number of u32 items in the data[] array, and *not* the
+ * number of bytes.
+ *
+ * The key and length fields are required, so the minimum item size is
+ * 2 x u32, or 8 bytes, when the length field is 0. If the length
+ * field is 1, then the item's size is 12 bytes.
+ *
+ * The meaning of the key field and the data values are documented in
+ * the Programmer's Reference Manual.
+ */
+struct drm_i915_query_hwconfig_blob_item {
+	/** @key: Enum which defines how to interpret @data values. */
+	__u32 key;
+
+	/** @length: The number of u32 values in the @data array. */
+	__u32 length;
+
+	/** @data: Array of values with meaning defined by @key. */
+	__u32 data[];
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.34.1

