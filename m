Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHm8IfaUo2n3HQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:23:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97F1CA59D
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A09410E2EE;
	Sun,  1 Mar 2026 01:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XYNEqeiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815DA10E2EE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 01:22:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3E9360126;
 Sun,  1 Mar 2026 01:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC20C19421;
 Sun,  1 Mar 2026 01:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772328177;
 bh=CD22GsfcD8LTC/ZqADJ6I6CL4lJ5jv2EThLz1A8XVO8=;
 h=From:To:Cc:Subject:Date:From;
 b=XYNEqeiE5QaEJrxH8psddDAI1+OhQVaYx0rPuNRU5F7ZXsmNJaNTzAsuFa66VsHPx
 lCpXOv6D3v1k36pgPOhWbx1+NZmq9F60JNuvGvR4hY32YYStVUPDa2z88fJhilLaxL
 HtF+aZqYvb4PkVKS51tSP5QspGFJPpXJIp0utbJwyqQzbos+FAUzclXjXkDD69nyKx
 XXM8tox2eOYmSp5Cl2BJXIE+GWs/x9ajMVFLkCxNIdElJi6KQDDp4JTPyy9yfLh5x6
 fMzunvdPzMCq6yhWo0XZFYr6q1WXZvzFrwH7O+h6I1l2VLnkTm2O0fAK5966pCLgty
 IVxrPtP9jLYCQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sanjay.kumar.yadav@intel.com
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "drm/buddy: Prevent BUG_ON by validating rounded
 allocation" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:22:55 -0500
Message-ID: <20260301012255.1679520-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:sanjay.kumar.yadav@intel.com,m:christian.koenig@amd.com,m:Arunpravin.PaneerSelvam@amd.com,m:matthew.auld@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,gitlab.freedesktop.org:url,intel.com:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DF97F1CA59D
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 5488a29596cdba93a60a79398dc9b69d5bdadf92 Mon Sep 17 00:00:00 2001
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Date: Thu, 8 Jan 2026 17:02:29 +0530
Subject: [PATCH] drm/buddy: Prevent BUG_ON by validating rounded allocation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
rounded up to the next power-of-two via roundup_pow_of_two().
Similarly, for non-contiguous allocations with large min_block_size,
the size is aligned up via round_up(). Both operations can produce a
rounded size that exceeds mm->size, which later triggers
BUG_ON(order > mm->max_order).

Example scenarios:
- 9G CONTIGUOUS allocation on 10G VRAM memory:
  roundup_pow_of_two(9G) = 16G > 10G
- 9G allocation with 8G min_block_size on 10G VRAM memory:
  round_up(9G, 8G) = 16G > 10G

Fix this by checking the rounded size against mm->size. For
non-contiguous or range allocations where size > mm->size is invalid,
return -EINVAL immediately. For contiguous allocations without range
restrictions, allow the request to fall through to the existing
__alloc_contig_try_harder() fallback.

This ensures invalid user input returns an error or uses the fallback
path instead of hitting BUG_ON.

v2: (Matt A)
- Add Fixes, Cc stable, and Closes tags for context

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
Cc: <stable@vger.kernel.org> # v6.7+
Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Link: https://patch.msgid.link/20260108113227.2101872-5-sanjay.kumar.yadav@intel.com
---
 drivers/gpu/drm/drm_buddy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 8308116058cc1..fd34d3755f7c5 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -1156,6 +1156,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	order = fls(pages) - 1;
 	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
 
+	if (order > mm->max_order || size > mm->size) {
+		if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
+		    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+			return __alloc_contig_try_harder(mm, original_size,
+							 original_min_size, blocks);
+
+		return -EINVAL;
+	}
+
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
 		BUG_ON(order > mm->max_order);
-- 
2.51.0




