Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEoZFbMjg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:47:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E2E4BC0
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29010E5C7;
	Wed,  4 Feb 2026 10:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwApyFcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509410E5C1;
 Wed,  4 Feb 2026 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202030; x=1801738030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hwu4eHY6VsrfpshKes9XNVRqxhj6WFiYCuj6/bwTtEI=;
 b=PwApyFcKByTIeijK3gOuOZj+eHJbPuoZMpyB3IVo0WqlYsIF/IPzvWcJ
 J5Lt019zD3qSV2JAMKRcAJo0VVOakamjTOSAkq6lY3mIcP7kn4qUHclZf
 VGvhy/Ft3+XtbT8TRh4iDomdTiV+sn60RGrI5or53R4KEw4P3Spc7NPQv
 qg7inizAgNH7zAZo4HBDX4HmqWSBCKwvrfpgtSwK+MGB4aVwbmFgVTxDG
 Hx5BKtTvD167+d6kRSqYewKvuXwfxONc50AJcldL3fHdwXFIhY85X40B4
 msPY9sBup3jSaY4EGEAquc4ntISo0vaJa9TAOD4SswFvcfQ5wLx74Mbvl g==;
X-CSE-ConnectionGUID: HXyDa3WeQvKw5EffHK1q0A==
X-CSE-MsgGUID: h77yRW7cQl2+h/aOc8eNiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94039270"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="94039270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:10 -0800
X-CSE-ConnectionGUID: wGrlAfQ/T2a9V8dw9+dJJA==
X-CSE-MsgGUID: vFgMMBHyRL2U/TQIHZR6PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209926631"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:08 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/2] drm/buddy: Add kernel-doc for allocator structures and
 flags
Date: Wed,  4 Feb 2026 16:13:46 +0530
Message-ID: <20260204104345.1980047-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
References: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: EA7E2E4BC0
X-Rspamd-Action: no action

Add missing kernel-doc for DRM buddy allocator flags,
drm_buddy_block, and drm_buddy. The documentation covers block
header fields, allocator roots, free trees, and allocation flags
such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
Private members are marked with kernel-doc private markers
and documented with regular comments.

No functional changes.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/drm/drm_buddy.h | 122 +++++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index eb8b4f5e15b3..5e2969822362 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -14,14 +14,81 @@
 
 struct drm_printer;
 
+/**
+ * DRM_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
+ *
+ * When set, allocation is restricted to the range [start, end) specified
+ * in drm_buddy_alloc_blocks(). Without this flag, start/end are ignored
+ * and allocation can use any free space.
+ */
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
+
+/**
+ * DRM_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
+ *
+ * Allocate starting from high addresses and working down. Useful for
+ * separating different allocation types (e.g., kernel vs userspace)
+ * to reduce fragmentation.
+ */
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
+
+/**
+ * DRM_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
+ *
+ * The allocation must be satisfied with a single contiguous block.
+ * If the requested size cannot be allocated contiguously, the
+ * allocation fails with -ENOSPC.
+ */
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
+
+/**
+ * DRM_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
+ *
+ * Attempt to allocate from the clear tree first. If insufficient clear
+ * memory is available, falls back to dirty memory. Useful when the
+ * caller needs zeroed memory and wants to avoid GPU clear operations.
+ */
 #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
+
+/**
+ * DRM_BUDDY_CLEARED - Mark returned blocks as cleared
+ *
+ * Used with drm_buddy_free_list() to indicate that the memory being
+ * freed has been cleared (zeroed). The blocks will be placed in the
+ * clear tree for future DRM_BUDDY_CLEAR_ALLOCATION requests.
+ */
 #define DRM_BUDDY_CLEARED			BIT(4)
+
+/**
+ * DRM_BUDDY_TRIM_DISABLE - Disable automatic block trimming
+ *
+ * By default, if an allocation is smaller than the allocated block,
+ * excess memory is trimmed and returned to the free pool. This flag
+ * disables trimming, keeping the full power-of-two block size.
+ */
 #define DRM_BUDDY_TRIM_DISABLE			BIT(5)
 
+/**
+ * struct drm_buddy_block - Block within a buddy allocator
+ *
+ * Each block in the buddy allocator is represented by this structure.
+ * Blocks are organized in a binary tree where each parent block can be
+ * split into two children (left and right buddies). The allocator manages
+ * blocks at various orders (power-of-2 sizes) from chunk_size up to the
+ * largest contiguous region.
+ *
+ * @private: Private data owned by the allocator user (e.g., driver-specific data)
+ * @link: List node for user ownership while block is allocated
+ */
 struct drm_buddy_block {
+/* private: */
+	/*
+	 * Header bit layout:
+	 * - Bits 63:12: block offset within the address space
+	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
+	 * - Bit 9: clear bit (1 if memory is zeroed)
+	 * - Bits 5:0: order (log2 of size relative to chunk_size)
+	 */
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
 #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
@@ -36,7 +103,7 @@ struct drm_buddy_block {
 	struct drm_buddy_block *left;
 	struct drm_buddy_block *right;
 	struct drm_buddy_block *parent;
-
+/* public: */
 	void *private; /* owned by creator */
 
 	/*
@@ -46,43 +113,58 @@ struct drm_buddy_block {
 	 * drm_buddy_free* ownership is given back to the mm.
 	 */
 	union {
+/* private: */
 		struct rb_node rb;
+/* public: */
 		struct list_head link;
 	};
-
+/* private: */
 	struct list_head tmp_link;
 };
 
 /* Order-zero must be at least SZ_4K */
 #define DRM_BUDDY_MAX_ORDER (63 - 12)
 
-/*
- * Binary Buddy System.
+/**
+ * struct drm_buddy - DRM binary buddy allocator
+ *
+ * The buddy allocator provides efficient power-of-two memory allocation
+ * with fast allocation and free operations. It is commonly used for GPU
+ * memory management where allocations can be split into power-of-two
+ * block sizes.
  *
- * Locking should be handled by the user, a simple mutex around
- * drm_buddy_alloc* and drm_buddy_free* should suffice.
+ * Locking should be handled by the user; a simple mutex around
+ * drm_buddy_alloc_blocks() and drm_buddy_free_block()/drm_buddy_free_list()
+ * should suffice.
+ *
+ * @n_roots: Number of root blocks in the roots array.
+ * @max_order: Maximum block order (log2 of largest block size / chunk_size).
+ * @chunk_size: Minimum allocation granularity in bytes. Must be at least SZ_4K.
+ * @size: Total size of the address space managed by this allocator in bytes.
+ * @avail: Total free space currently available for allocation in bytes.
+ * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
+ *               This is a subset of @avail.
  */
 struct drm_buddy {
-	/* Maintain a free list for each order. */
-	struct rb_root **free_trees;
-
+/* private: */
 	/*
-	 * Maintain explicit binary tree(s) to track the allocation of the
-	 * address space. This gives us a simple way of finding a buddy block
-	 * and performing the potentially recursive merge step when freeing a
-	 * block.  Nodes are either allocated or free, in which case they will
-	 * also exist on the respective free list.
+	 * Array of red-black trees for free block management.
+	 * Indexed as free_trees[clear/dirty][order] where:
+	 * - Index 0 (DRM_BUDDY_DIRTY_TREE): blocks with unknown content
+	 * - Index 1 (DRM_BUDDY_CLEAR_TREE): blocks with zeroed content
+	 * Each tree holds free blocks of the corresponding order.
 	 */
-	struct drm_buddy_block **roots;
-
+	struct rb_root **free_trees;
 	/*
-	 * Anything from here is public, and remains static for the lifetime of
-	 * the mm. Everything above is considered do-not-touch.
+	 * Array of root blocks representing the top-level blocks of the
+	 * binary tree(s). Multiple roots exist when the total size is not
+	 * a power of two, with each root being the largest power-of-two
+	 * that fits in the remaining space.
 	 */
+	struct drm_buddy_block **roots;
+/* public: */
 	unsigned int n_roots;
 	unsigned int max_order;
-
-	/* Must be at least SZ_4K */
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
-- 
2.52.0

