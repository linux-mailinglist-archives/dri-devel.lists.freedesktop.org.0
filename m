Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B645629C42
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F29D10E408;
	Tue, 15 Nov 2022 14:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC8F10E407;
 Tue, 15 Nov 2022 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668523212; x=1700059212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TYZXgla9j6MnHAQSxOiXmbLDtNRpsB1WIiK9E9G/nms=;
 b=SOWMA4BQWqXd0UgBB2/wBZUTi1dIubGr2+aPfj3PRsU4L8rdZDeAx8tl
 T44EdPmg8YwFWUoUCXMrUD8XA4XS99kJTNpz1Zj10+cCpXS8hnGynp4zV
 Sk3xkH6l/wKlCx3AdzQcAJljduk80OaXxp/rQ0dnYis7vscG1trtz+tMf
 Na3FJgo32VqmaQpkqUSxC/misrR5jA6bmFpFtwId3bCPevB99A4Tc+12P
 Tvxnc49wUzn1lFTLKiWYCV/inYs9b0ZjSkNQ+tLOyM7gyuc4MRsaesDx3
 lk2Oj00DvhCmqa+6D8Ck56q9HkkphDX68hHGH3NIyt15T3MV8cyvAMDkt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="309892857"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="309892857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 06:40:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="616772510"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="616772510"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.11.11])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 06:40:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915: Fix build failure with debug and extra logging
 enabled
Date: Tue, 15 Nov 2022 15:39:41 +0100
Message-Id: <20221115143941.32097-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A comma is missing, fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 3b969d679c1e2..947fde68e5f53 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -73,7 +73,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 	char buf[512];
 
 	if (!vma->node.stack) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm
+		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
 			"vma.node [%08llx + %08llx] %s: unknown owner\n",
 			vma->node.start, vma->node.size, reason);
 		return;
-- 
2.25.1

