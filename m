Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN1lJnWdjWmD5QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F080212BDE3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3631910E707;
	Thu, 12 Feb 2026 09:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPApls9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AE010E707;
 Thu, 12 Feb 2026 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770888562; x=1802424562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qa1fiD2jDl2mDbIM4SKWsULQcOywiOUGmk8on/BOJ10=;
 b=cPApls9wY7PNzmedfjl6SSdSr5QmUmNneE/wIls8LbZwKhlrAx4dwh0s
 8tbCD2gqCHz14NhZPPk37pEgPeixidIcfwt+Pofx+dPVXuaud3UkulI2a
 Mnfunja8+M8CHmaCNac54wFrM5rhhYc0r7jmEREe4973i70YtpEAJxEvq
 LYeQh3XsxvCnTAIrV6NBO9RFhqt/Y1ULTzaJyy8rwxlmYyZHAPafNUWGD
 Fq+JG5yNSv1m8jRmNPQ9RdW9A29sCtywYM8NKthmgAGADuwlJc6QuEXE3
 uV4H7K2YScoBTn1rRnTeckQ2I9uw4/iffmYpJsGFtDjfCnIM2mducPb98 A==;
X-CSE-ConnectionGUID: Pm1P5jKMQNmGFOfg5JeRDQ==
X-CSE-MsgGUID: Z8eZHf/3RheVbvgJax74gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89463840"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89463840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:22 -0800
X-CSE-ConnectionGUID: qQ9t9XDyRC+OOSa3IED+Bw==
X-CSE-MsgGUID: f5WLkeTPQPWRJorAyEZ8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217016785"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:20 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/buddy: Add kernel-doc for allocator structures and
 flags
Date: Thu, 12 Feb 2026 14:55:29 +0530
Message-ID: <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: F080212BDE3
X-Rspamd-Action: no action

Add missing kernel-doc for GPU buddy allocator flags,
gpu_buddy_block, and gpu_buddy. The documentation covers block
header fields, allocator roots, free trees, and allocation flags
such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
Private members are marked with kernel-doc private markers
and documented with regular comments.

No functional changes.

v2:
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
  values (Arun)
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Updated commit message

v3:
- Document reserved bits 8:6 in header layout (Arun)
- Fix checkpatch warning

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 include/linux/gpu_buddy.h | 123 +++++++++++++++++++++++++++++++-------
 1 file changed, 103 insertions(+), 20 deletions(-)

diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index 07ac65db6d2e..bf2a42256536 100644
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
@@ -28,7 +75,28 @@ enum gpu_buddy_free_tree {
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
+	 * - Bits 8:6: reserved
+	 * - Bits 5:0: order (log2 of size relative to chunk_size)
+	 */
 #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
 #define   GPU_BUDDY_ALLOCATED	   (1 << 10)
@@ -43,7 +111,7 @@ struct gpu_buddy_block {
 	struct gpu_buddy_block *left;
 	struct gpu_buddy_block *right;
 	struct gpu_buddy_block *parent;
-
+/* public: */
 	void *private; /* owned by creator */
 
 	/*
@@ -53,43 +121,58 @@ struct gpu_buddy_block {
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

