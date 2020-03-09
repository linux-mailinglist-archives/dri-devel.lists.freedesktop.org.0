Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1017EC73
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 00:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FC16E5AB;
	Mon,  9 Mar 2020 23:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9C36E5AB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 23:10:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 16:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="353471041"
Received: from agabodun-lnx.jf.intel.com ([10.165.21.226])
 by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2020 16:10:52 -0700
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Clean up unused code, to improve a system!
Date: Mon,  9 Mar 2020 08:11:56 -0700
Message-Id: <20200309151156.25040-1-akeem.g.abodunrin@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Pete Goodliffe words, "You can improve a system by adding new code. You
can also improve a system by removing code" - In this case, commit
"202b52b7fbf70" added new code to initialize end of the node. So, there
is no need for duplicated initialization, and this patch simply removes it.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
CC: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/drm_mm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 47d5de9ca0a8..7cd9023e61fb 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -410,7 +410,6 @@ int drm_mm_reserve_node(struct drm_mm *mm, struct drm_mm_node *node)
 	u64 hole_start, hole_end;
 	u64 adj_start, adj_end;
 
-	end = node->start + node->size;
 	if (unlikely(end <= node->start))
 		return -ENOSPC;
 
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
