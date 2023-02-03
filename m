Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1BE688C52
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 02:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5E10E6E4;
	Fri,  3 Feb 2023 01:10:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB0010E6D2;
 Fri,  3 Feb 2023 01:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675386640; x=1706922640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SF0gbr5LQ6BigMAU+ZRpz/C1+EuJ1ggUvL6c7dnwOXY=;
 b=aHNIWDba/OGDlvpBQcQYKCqxKNSNHqWeRH2F6EKXWVw9J5lh6nIxc8rF
 zoavgHl97ZxP2/jqwAVor9RwG+OrD/9vfV+IciE4QuamK+3C8++qM1Cbf
 YnxMQ8+YHGTSAS0F/s/acSmrtOjqmrrD9INKOMO5+65cl9de3AT9ZM3I4
 Y7w8CotbLB2ddJEdrGyCV8OKocdAb26Q2Hvhq273cfWhzrIEARk98fBFe
 5UNDkOu3fQdytggx77yTcyeIt9TXovRRZ80VIhrjUcGX6/HI4Q0dJpg3U
 FQj/ZFnGnR7UmtEUru81RURePr/Mum/3bgCVVNkDrwx9OIGnh3EPyLJcx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="391021624"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="391021624"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 17:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665528234"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="665528234"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 17:10:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/guc: Clean up of register capture search
Date: Thu,  2 Feb 2023 17:10:42 -0800
Message-Id: <20230203011043.3427096-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
References: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The comparison in the search for a matching register capture node was
not the most readable. So remove two redundant terms and re-format to
keep each term on a single line, and only one term per line.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 710999d7189ee..87b080dd6bead 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1627,9 +1627,8 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
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

