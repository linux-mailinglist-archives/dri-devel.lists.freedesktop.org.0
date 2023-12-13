Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B55810931
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 05:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2E110E250;
	Wed, 13 Dec 2023 04:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0223F10E24D;
 Wed, 13 Dec 2023 04:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CasPHIeq22h3Vw5tbYJ/NrclreJ37L9028MUcfT6JXQ=; b=SPvwLJC1yW2bLEcF6UV2yLV5Gy
 sMKJQ1t0C19PvzCJNm4qnLwUkysD63lAzovMd+GI0uyMbnHzsFVOcXYWgRzvtIgF7+pw5cj3cRw3n
 90T0hy0aBnWb3UsZ1N5x+AamFe94BWXcEHdIbv+HIk+m1GN9rTtz7kISFXn712zGQtfrZ8Mp9uli/
 QB6yCisg+LiJi6llpf8JAUm+N6RnJAXWwAdHhtUEnQq1P2XWzeND1pnIXjCpI5xmFiEHC7xklQW3K
 1NK9fxeA3AmBEh8mRBJYCuu9Nnb0A3vql1Ex7yYzRg5R9SpGELMMPAjtiQqyUi/Jr43U+2F+YmjBZ
 ojaKk8UQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rDH2d-00DbNX-1r; Wed, 13 Dec 2023 04:40:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/uapi: fix typos/spellos and punctuation
Date: Tue, 12 Dec 2023 20:40:14 -0800
Message-ID: <20231213044014.21410-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use "its" for possessive form instead of "it's".
Hyphenate multi-word adjectives.
Correct some spelling.
End one line of code with ';' instead of ','. The before and after
  object files are identical.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
---
 include/uapi/drm/i915_drm.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff -- a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -693,7 +693,7 @@ typedef struct drm_i915_irq_wait {
 #define I915_PARAM_HAS_EXEC_FENCE	 44
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to capture
- * user specified bufffers for post-mortem debugging of GPU hangs. See
+ * user-specified buffers for post-mortem debugging of GPU hangs. See
  * EXEC_OBJECT_CAPTURE.
  */
 #define I915_PARAM_HAS_EXEC_CAPTURE	 45
@@ -1606,7 +1606,7 @@ struct drm_i915_gem_busy {
 	 * is accurate.
 	 *
 	 * The returned dword is split into two fields to indicate both
-	 * the engine classess on which the object is being read, and the
+	 * the engine classes on which the object is being read, and the
 	 * engine class on which it is currently being written (if any).
 	 *
 	 * The low word (bits 0:15) indicate if the object is being written
@@ -1815,7 +1815,7 @@ struct drm_i915_gem_madvise {
 	__u32 handle;
 
 	/* Advice: either the buffer will be needed again in the near future,
-	 *         or wont be and could be discarded under memory pressure.
+	 *         or won't be and could be discarded under memory pressure.
 	 */
 	__u32 madv;
 
@@ -3246,7 +3246,7 @@ struct drm_i915_query_topology_info {
  * 	// enough to hold our array of engines. The kernel will fill out the
  * 	// item.length for us, which is the number of bytes we need.
  * 	//
- * 	// Alternatively a large buffer can be allocated straight away enabling
+ *	// Alternatively a large buffer can be allocated straightaway enabling
  * 	// querying in one pass, in which case item.length should contain the
  * 	// length of the provided buffer.
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
@@ -3256,7 +3256,7 @@ struct drm_i915_query_topology_info {
  * 	// Now that we allocated the required number of bytes, we call the ioctl
  * 	// again, this time with the data_ptr pointing to our newly allocated
  * 	// blob, which the kernel can then populate with info on all engines.
- * 	item.data_ptr = (uintptr_t)&info,
+ *	item.data_ptr = (uintptr_t)&info;
  *
  * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
  * 	if (err) ...
@@ -3286,7 +3286,7 @@ struct drm_i915_query_topology_info {
 /**
  * struct drm_i915_engine_info
  *
- * Describes one engine and it's capabilities as known to the driver.
+ * Describes one engine and its capabilities as known to the driver.
  */
 struct drm_i915_engine_info {
 	/** @engine: Engine class and instance. */
