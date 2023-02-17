Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127869A3DB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 03:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761910E3BB;
	Fri, 17 Feb 2023 02:25:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6A210E195;
 Fri, 17 Feb 2023 02:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676600704; x=1708136704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9xJ78ZPjSwZj2s9QdeqUFq5jM7hTALRDfyEnmi9fAbM=;
 b=nUb2nnGpawPFVP0ROiLzwl7fE0OKoTXtxa18gLr7aKI4AUzdZo0g3Zl1
 1PtSOhAQL2XqBV9g8fprt2whzC1jDN6se5VOZhuLNiXDrlX4T5rIto6S4
 sjiOD+8GA0Cn4stdl26ZAfoOYeBO58QHIaStbncOEsw6ZhhTkucI+xIsK
 MW1gaeJOjclFUgKi8evXXcAW3VKKpU4Sk/b5Bhy1wc38FypF5EBGPwRzc
 Xph7XWIYO+i2EzwbtFxtNfSRBlX19Kqdkz2tFgiThw4NSNMaQ+XL0NIJN
 0L1LzQ+9NZA4LwayhiGzcTVeqcxfFWFuX4noohxDs+IZ1Wl9eeOwewg+V w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334093365"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334093365"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 18:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670389089"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670389089"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 18:25:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/3] drm/i915/guc: Clean up of register capture search
Date: Thu, 16 Feb 2023 18:24:19 -0800
Message-Id: <20230217022420.2664116-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
References: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
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

