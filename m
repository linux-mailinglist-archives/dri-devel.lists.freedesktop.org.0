Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B86F76ED
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FDA10E522;
	Thu,  4 May 2023 20:22:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2744010E1C0;
 Thu,  4 May 2023 20:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683231761; x=1714767761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84afhfByTW10EnXTasVhm2/sggpFyegCFHAEgH0ofMQ=;
 b=nzJEWH2cUEw70KKV5ustbgvZceBFPnrv4VjinGovZBE9f7b6zNIX/8VM
 2Q8h4ddTJxsP/6r1slhdpICwZTl/YqcIgoXuHv54NXJvyw31cUUvdVnF8
 W0q21mDQUiACKfzO9E79zA7IkBfa6zYCBqTYSSSrUubLvjhyrGtKboP8x
 ZYcKInD5mLGCgLz0fILLYG4mN/goIk4hoTKKg/0am6qUkbNyKoJxCnH33
 2RZEpDDo4b2uv7L6vJULOwuofGfIjjOdXsldoK3lhnU2SOUVhH1t3Niph
 vBoIMhvcKLieQL6fiu6blURWEd4pEcuXjeUGfoAm+90/c6MgX1N0ZPlZC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414569995"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="414569995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808900445"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="808900445"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 13:22:39 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/mtl: Update GuC firmware version for MTL to
 70.6.6
Date: Thu,  4 May 2023 13:22:52 -0700
Message-Id: <20230504202252.1104212-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
References: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
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

Also switch to using reduced version file naming as it is no longer
such a work-in-progress and likely to change.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 55e50bd08d7ff..10e48cbcf494a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -79,7 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
+	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 6, 6)) \
 	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
-- 
2.39.1

