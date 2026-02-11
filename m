Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AT3XEhcVjGk8gQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29E1215C7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0210E17C;
	Wed, 11 Feb 2026 05:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYnQ0FR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE43E10E093;
 Wed, 11 Feb 2026 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788115; x=1802324115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bh0NlbbVnKZb4a5UTsDOvuqt8Wo0Ooal+RmJgx3HKY0=;
 b=cYnQ0FR1sKLsgZqiPaMN/jT1MonzCm+Ly7F7ZWyB4uQV1ZlEZr5qa9HB
 AZAZLtnKV7VtNheYG6iMmzOmmqTFmk1bWga/ONhIaEnPOUj0j7nCPMjnw
 hz0ID0rvffTUHanpC2thkNSnG3esxmRR9vj32qk96/j8s/hDbmu5yzNfD
 9CfKy3krBhFyMp5zTSyTRgPMpI2tMxjHrdOcikx+wl9sZCs4kNi13lWM0
 N6rWDASoTQLL4Q1S3Mk+tplLRR00c2ioDWyHguWpLGHXMz1274DtysBWm
 O1G13ScfZ8y+9ZTCvnffZOezwYOoT9vqvRTC1mH8lMVTsPP9giqxG3yGM A==;
X-CSE-ConnectionGUID: MS8tDMbsQ3CjfQpF3zu0Hg==
X-CSE-MsgGUID: aBcYwpqvS0SEjGE0j0kBAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82248050"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82248050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:14 -0800
X-CSE-ConnectionGUID: Q1Rdjzh9Q2K7YprVqMEk3g==
X-CSE-MsgGUID: e8GQjo+kSOygk2rdMMvX1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211464601"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:11 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] drm/buddy: Documentation and internal helper cleanup
Date: Wed, 11 Feb 2026 11:01:24 +0530
Message-ID: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: BC29E1215C7
X-Rspamd-Action: no action

This series improves the GPU buddy allocator by adding missing
documentation and cleaning up internal helpers.

It adds kernel-doc for the allocator structures and flags, covering
gpu_buddy, gpu_buddy_block, and the allocation flags (RANGE, TOPDOWN,
CONTIGUOUS, CLEAR, TRIM_DISABLE) to make the allocator’s design and usage
clearer for readers and contributors.

It also reduces the header surface by moving internal helpers from
gpu_buddy.h into buddy.c as static functions, since they have no
external users, and removes gpu_get_buddy(), an unused exported wrapper
around the internal __get_buddy() helper. This clarifies the intended API
and avoids exporting unused symbols.

No functional changes.

v2:
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Keep gpu_buddy_block_is_free() in header since it's now
  used by drm_buddy.c
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
- Updated commit message and cover letter to reflect changes

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Add kernel-doc for allocator structures and flags
  drm/buddy: Move internal helpers to buddy.c

 drivers/gpu/buddy.c       |  35 ++++-----
 include/linux/gpu_buddy.h | 147 +++++++++++++++++++++++++++-----------
 2 files changed, 122 insertions(+), 60 deletions(-)

-- 
2.52.0

