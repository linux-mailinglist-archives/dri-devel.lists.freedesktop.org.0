Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C96B5903
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 07:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9934F10EA5B;
	Sat, 11 Mar 2023 06:38:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD3010E09D;
 Sat, 11 Mar 2023 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678516696; x=1710052696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xJ78ZPjSwZj2s9QdeqUFq5jM7hTALRDfyEnmi9fAbM=;
 b=jjDpuox6jjcwYcKY5CJgOj3o9OsJ3yxYsn6SEuBgnGP7FQxdHWifsbKe
 C55frbMI5Q0xoSx9840OwYY1q3Fu3ZxboggcvXkhAc6RdGyNcH2o7g+Wt
 r9Hh4sJSIRdPzNrTnvRGS3/7qefr+0LxKVlEb2XrTJqgdkVbZa685DUmu
 EE6E/x4aycKoqCMeZmdaRKfDfQ9MmiSVOSr9foLbXcVo2ku6sfSOKVKyy
 /W9u8hHu8O2TIdxiqRVP5l8rklsDPxook3wQopi4fsGMJk9cCNSk3GVij
 bxbqEjtwyBCeabsYjU5tX+7y7eQP/RhCxUszbGx4qNKwWCj2zHdVpTbeT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335579553"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="335579553"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 22:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678086697"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="678086697"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 22:38:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/3] drm/i915/guc: Clean up of register capture search
Date: Fri, 10 Mar 2023 22:37:13 -0800
Message-Id: <20230311063714.570389-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230311063714.570389-1-John.C.Harrison@Intel.com>
References: <20230311063714.570389-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The comparison in the search for a matching register capture node was
not the most readable. It was also assuming that a zero GuC id means
invalid, which it does not. So remove one invalid term, one redundant
term and re-format to keep each term on a single line, and only one
term per line.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 36196cbb24c6b..cf49188db6a6e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1616,9 +1616,8 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
 		if (n->eng_inst == GUC_ID_TO_ENGINE_INSTANCE(ee->engine->guc_id) &&
 		    n->eng_class == GUC_ID_TO_ENGINE_CLASS(ee->engine->guc_id) &&
-		    n->guc_id && n->guc_id == ce->guc_id.id &&
-		    (n->lrca & CTX_GTT_ADDRESS_MASK) && (n->lrca & CTX_GTT_ADDRESS_MASK) ==
-		    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
+		    n->guc_id == ce->guc_id.id &&
+		    (n->lrca & CTX_GTT_ADDRESS_MASK) == (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
 			list_del(&n->link);
 			ee->guc_capture_node = n;
 			ee->guc_capture = guc->capture;
-- 
2.39.1

