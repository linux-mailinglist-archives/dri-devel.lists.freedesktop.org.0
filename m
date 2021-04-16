Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4B361E0D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 12:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD26EB6F;
	Fri, 16 Apr 2021 10:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE756EB6A;
 Fri, 16 Apr 2021 10:37:52 +0000 (UTC)
IronPort-SDR: jTTo1MmjgAja2C2xw/ODq3C9b6bL9KZCIOM6y/9ZVq/HGK7k4yFK4rbQ+2iUuWKTAfwH4SP04v
 5W80gA2ni9sQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="256336425"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="256336425"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 03:37:52 -0700
IronPort-SDR: C3yJhmSzaoIiuPPFmRbSTbSef3FtedMdyZ2Kkx8Y7eGrpLaJEK+9s+dIWRGju1CC5XnTq7y5KK
 TH9uGi9r1xrg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="451434335"
Received: from pmwillia-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.7.203])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 03:37:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/uapi: convert i915_user_extension to kernel doc
Date: Fri, 16 Apr 2021 11:37:17 +0100
Message-Id: <20210416103718.460830-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210416103718.460830-1-matthew.auld@intel.com>
References: <20210416103718.460830-1-matthew.auld@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add some example usage for the extension chaining also, which is quite
nifty.

v2: (Daniel)
  - clarify that the name is just some integer, also document that the
    name space is not global

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/uapi/drm/i915_drm.h | 54 ++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 92da48e935d1..d79b51c12ff2 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -62,8 +62,8 @@ extern "C" {
 #define I915_ERROR_UEVENT		"ERROR"
 #define I915_RESET_UEVENT		"RESET"
 
-/*
- * i915_user_extension: Base class for defining a chain of extensions
+/**
+ * struct i915_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -76,12 +76,58 @@ extern "C" {
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
  * the __user boundary with pointers encapsulated inside u64.
+ *
+ * Example chaining:
+ *
+ * .. code-block:: C
+ *
+ *	struct i915_user_extension ext3 {
+ *		.next_extension = 0, // end
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext2 {
+ *		.next_extension = (uintptr_t)&ext3,
+ *		.name = ...,
+ *	};
+ *	struct i915_user_extension ext1 {
+ *		.next_extension = (uintptr_t)&ext2,
+ *		.name = ...,
+ *	};
+ *
+ * Typically the i915_user_extension would be embedded in some uAPI struct, and
+ * in this case we would feed it the head of the chain(i.e ext1), which would
+ * then apply all of the above extensions.
+ *
  */
 struct i915_user_extension {
+	/**
+	 * @next_extension:
+	 *
+	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 */
 	__u64 next_extension;
+	/**
+	 * @name: Name of the extension.
+	 *
+	 * Note that the name here is just some integer.
+	 *
+	 * Also note that the name space for this is not global for the whole
+	 * driver, but rather its scope/meaning is limited to the specific piece
+	 * of uAPI which has embedded the struct i915_user_extension.
+	 */
 	__u32 name;
-	__u32 flags; /* All undefined bits must be zero. */
-	__u32 rsvd[4]; /* Reserved for future use; must be zero. */
+	/**
+	 * @flags: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 flags;
+	/**
+	 * @rsvd: MBZ
+	 *
+	 * Reserved for future use; must be zero.
+	 */
+	__u32 rsvd[4];
 };
 
 /*
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
