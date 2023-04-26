Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C51F6EF9FE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D32E10E99C;
	Wed, 26 Apr 2023 18:24:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66C10E995;
 Wed, 26 Apr 2023 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682533445; x=1714069445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6jgi78cXGG1cuzu6uolWHAGKmrrFlXVWF1r+f7q5ZrE=;
 b=Dm4f+lwxNfgV+nVfTbRIdMK7XDnRYqAy5iNAT0Gi+w8zAkZPUd/G+aA/
 X9tEQV3yQXEXUD6XSD6HeqwvxFWjDearwafFy89hWwBJNo6ed4/Vplf0b
 ZZbidX3qXkrgdylqxrAdRe8bkqopeoRAPiTmZt0aV0B3+cbqk8rqBr1cK
 LhauQ/3Ukksrm9utwvqe7rswFtWUohPjhVLYjqMiuYpF9c3a0Vh3gfEPE
 XaQfn/5eeroxod8Sd17MKUDiVrLdneOkQHec2poSXQGV2a13okvRT2hgl
 JXURpBNkKH1HSbjx2h8UVMoyNxCiTDFLxAICILEd5/6a39h8zsFZr9QRK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412512041"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="412512041"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 11:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644347964"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="644347964"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2023 11:24:05 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 6/6] drm/i915/guc: Capture list clean up - 5
Date: Wed, 26 Apr 2023 11:24:07 -0700
Message-Id: <20230426182407.4097589-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <17322661-e12f-7e14-b190-1089cc04a9e5@intel.com>
References: <17322661-e12f-7e14-b190-1089cc04a9e5@intel.com>
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

Rename the 'default_' register list prefix to 'gen8_' as that is the
more accurate name.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index c1a75a2d17f1e..729a8fcf20dda 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -141,13 +141,13 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 };
 
 /* GEN8 - Global */
-static const struct __guc_mmio_reg_descr default_global_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_global_regs[] = {
 	COMMON_BASE_GLOBAL,
 	COMMON_GEN8BASE_GLOBAL,
 	GEN8_GLOBAL,
 };
 
-static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
+static const struct __guc_mmio_reg_descr gen8_rc_class_regs[] = {
 	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 };
@@ -172,11 +172,11 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 	}
 
 /* List of lists */
-static const struct __guc_mmio_reg_descr_group default_lists[] = {
-	MAKE_REGLIST(default_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
+static const struct __guc_mmio_reg_descr_group gen8_lists[] = {
+	MAKE_REGLIST(gen8_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
 	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(default_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
 	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
@@ -366,7 +366,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	if (GRAPHICS_VER(i915) >= 12)
 		lists = xe_lp_lists;
 	else
-		lists = default_lists;
+		lists = gen8_lists;
 
 	/*
 	 * For certain engine classes, there are slice and subslice
-- 
2.39.1

