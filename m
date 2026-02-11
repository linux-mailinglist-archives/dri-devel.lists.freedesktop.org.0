Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAcFCxkVjGk8gQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34F1215CE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1697510E19F;
	Wed, 11 Feb 2026 05:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWHdMD7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A2A10E178;
 Wed, 11 Feb 2026 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788116; x=1802324116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZ2Uj4S9bmtCmGcisyDhNIut03Fumlb9Xo+JQWnO69M=;
 b=DWHdMD7FyP1CLTdeRJkHHJqqtfg3aIPL5T+mqzWw5PJX+On31P6NdFjE
 VeCrhhxxf6jtEnTKswatQ+454pUjHbhw7oiEXtA3wxX9Am/GQykylNTvF
 GVBF0cWuL8yK5GPxmBrIzvtC2cN2MVO/64ChtrTKLVdcXalZH/00mIidX
 D4kmzHVUkc/+ND0M7lU3YTKXcDoqm0eaVEw/2Cs9LsHQMJ+jrXC4c1f5N
 k9RSa7gN0aiLPGVswvRhgoatQ2TLwZhiOb96p1Zal2PqJ0JJJY3pgdtbJ
 je1HROWwS4Px6TFgU8meK4nduwoBRdH4u6sFyZqM6Ck63We+vmT7srD4S Q==;
X-CSE-ConnectionGUID: 8K6l0n+QTlOQwFCZoa4kTw==
X-CSE-MsgGUID: qt2O2lKQSAqidk7xYPXy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82248054"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82248054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:15 -0800
X-CSE-ConnectionGUID: wN6bpXvcSJSX9+GefkPf3w==
X-CSE-MsgGUID: CEsHEgQKQr66ziEyzH7SyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211464607"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:13 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/buddy: Add kernel-doc for allocator structures and
 flags
Date: Wed, 11 Feb 2026 11:01:25 +0530
Message-ID: <20260211053123.260037-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: CF34F1215CE
X-Rspamd-Action: no action

Add missing kernel-doc for GPU buddy allocator flags,
gpu_buddy_block, and gpu_buddy. The documentation covers block
header fields, allocator roots, free trees, and allocation flags
such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
Private members are marked with kernel-doc private markers
and documented with regular comments.

No functional changes.

v2:
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Updated commit message

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/linux/gpu_buddy.h | 122 +++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index 07ac65db6d2e..b06241c78437 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -12,11 +12,58 @@
 #include <linux/sched.h>
 #include <linux/rbtree.h>
 
+/**
+ * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
+ *
+ * When set, allocation is restricted to the range [start, end) specified
+ * in gpu_buddy_alloc_blocks(). Without this flag, start/end are ignored
+ * and allocation can use any free space.
+ */
 #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
+
+/**
+ * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
+ *
+ * Allocate starting from high addresses and working down. Useful for
+ * separating different allocation types (e.g., kernel vs userspace)
+ * to reduce fragmentation.
+ */
 #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
+
+/**
+ * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
+ *
+ * The allocation must be satisfied with a single contiguous block.
+ * If the requested size cannot be allocated contiguously, the
+ * allocation fails with -ENOSPC.
+ */
 #define GPU_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
+
+/**
+ * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
+ *
+ * Attempt to allocate from the clear tree first. If insufficient clear
+ * memory is available, falls back to dirty memory. Useful when the
+ * caller needs zeroed memory and wants to avoid GPU clear operations.
+ */
 #define GPU_BUDDY_CLEAR_ALLOCATION		BIT(3)
+
+/**
+ * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
+ *
+ * Used with gpu_buddy_free_list() to indicate that the memory being
+ * freed has been cleared (zeroed). The blocks will be placed in the
+ * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
+ */
 #define GPU_BUDDY_CLEARED			BIT(4)
+
+/**
+ * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
+ *
+ * By default, if an allocation is smaller than the allocated block,
+ * excess memory is trimmed and returned to the free pool. This flag
+ * disables trimming, keeping the full power-of-two block size.
+ */
 #define GPU_BUDDY_TRIM_DISABLE			BIT(5)
 
 enum gpu_buddy_free_tree {
@@ -28,7 +75,27 @@ enum gpu_buddy_free_tree {
 #define for_each_free_tree(tree) \
 	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
 
+/**
+ * struct gpu_buddy_block - Block within a buddy allocator
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
 struct gpu_buddy_block {
+/* private: */
+	/*
+	 * Header bit layout:
+	 * - Bits 63:12: block offset within the address space
+	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
+	 * - Bit 9: clear bit (1 if memory is zeroed)
+	 * - Bits 5:0: order (log2 of size relative to chunk_size)
+	 */
 #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
 #define   GPU_BUDDY_ALLOCATED	   (1 << 10)
@@ -43,7 +110,7 @@ struct gpu_buddy_block {
 	struct gpu_buddy_block *left;
 	struct gpu_buddy_block *right;
 	struct gpu_buddy_block *parent;
-
+/* public: */
 	void *private; /* owned by creator */
 
 	/*
@@ -53,43 +120,58 @@ struct gpu_buddy_block {
 	 * gpu_buddy_free* ownership is given back to the mm.
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
 #define GPU_BUDDY_MAX_ORDER (63 - 12)
 
-/*
- * Binary Buddy System.
+/**
+ * struct gpu_buddy - GPU binary buddy allocator
+ *
+ * The buddy allocator provides efficient power-of-two memory allocation
+ * with fast allocation and free operations. It is commonly used for GPU
+ * memory management where allocations can be split into power-of-two
+ * block sizes.
  *
- * Locking should be handled by the user, a simple mutex around
- * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
+ * Locking should be handled by the user; a simple mutex around
+ * gpu_buddy_alloc_blocks() and gpu_buddy_free_block()/gpu_buddy_free_list()
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
 struct gpu_buddy {
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
+	 * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
+	 * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
+	 * Each tree holds free blocks of the corresponding order.
 	 */
-	struct gpu_buddy_block **roots;
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
+	struct gpu_buddy_block **roots;
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

