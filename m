Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8E94F9C3A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B19E10E7D7;
	Fri,  8 Apr 2022 18:03:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5FC10E746;
 Fri,  8 Apr 2022 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649441007; x=1680977007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e8sHhUqFLGkCI2/4uHbBioFnZ9cUPnxeG1X7ZJYv1Fw=;
 b=EXbPtntEHXIhIYhFZeGJjDvHoe2kCRoiHtRPaSWV0/+3rZy6V3zB9q76
 2iIYTAvt6sy9Omedxiqi42+0gZo6AwscbtHk2MKqZBtXkqzXUI9LQndTI
 rGg+Skw6XYZeF7AOVUU9y/FJAknrBey+Z86GVjZg6gpew5Gy7kFS7bvYm
 wmGFU5iZiEusAz7PfiWAj/ez4jG7w1Mr1xi5p5uNE+whtSkBakXpkdXyn
 Y/lPufOb97FTbVNuQNEGPVwDjFEXpc+6XYtFwr6nNIlsrdfVtC0dcKnuA
 mf4ary+019hvYMgBiSee+5fID5bPVLUfYml8hoI6auIJVKZNFRBVLuM+x Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="241592244"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="241592244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 11:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="557869600"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2022 11:03:27 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/3] drm/i915/guc: Update to GuC version 70.1.1
Date: Fri,  8 Apr 2022 11:03:26 -0700
Message-Id: <20220408180326.1454951-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
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

Update to the latest GuC firmware release.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index bb864655c495..cb5dd16421d0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -53,22 +53,22 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
-	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
-	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
-	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
-	fw_def(ROCKETLAKE,   0, guc_def(tgl,  69, 0, 3)) \
-	fw_def(TIGERLAKE,    0, guc_def(tgl,  69, 0, 3)) \
-	fw_def(JASPERLAKE,   0, guc_def(ehl,  69, 0, 3)) \
-	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  69, 0, 3)) \
-	fw_def(ICELAKE,      0, guc_def(icl,  69, 0, 3)) \
-	fw_def(COMETLAKE,    5, guc_def(cml,  69, 0, 3)) \
-	fw_def(COMETLAKE,    0, guc_def(kbl,  69, 0, 3)) \
-	fw_def(COFFEELAKE,   0, guc_def(kbl,  69, 0, 3)) \
-	fw_def(GEMINILAKE,   0, guc_def(glk,  69, 0, 3)) \
-	fw_def(KABYLAKE,     0, guc_def(kbl,  69, 0, 3)) \
-	fw_def(BROXTON,      0, guc_def(bxt,  69, 0, 3)) \
-	fw_def(SKYLAKE,      0, guc_def(skl,  69, 0, 3))
+	fw_def(DG2,          0, guc_def(dg2,  70, 1, 1)) \
+	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
+	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
+	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
+	fw_def(ROCKETLAKE,   0, guc_def(tgl,  70, 1, 1)) \
+	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 1, 1)) \
+	fw_def(JASPERLAKE,   0, guc_def(ehl,  70, 1, 1)) \
+	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  70, 1, 1)) \
+	fw_def(ICELAKE,      0, guc_def(icl,  70, 1, 1)) \
+	fw_def(COMETLAKE,    5, guc_def(cml,  70, 1, 1)) \
+	fw_def(COMETLAKE,    0, guc_def(kbl,  70, 1, 1)) \
+	fw_def(COFFEELAKE,   0, guc_def(kbl,  70, 1, 1)) \
+	fw_def(GEMINILAKE,   0, guc_def(glk,  70, 1, 1)) \
+	fw_def(KABYLAKE,     0, guc_def(kbl,  70, 1, 1)) \
+	fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
+	fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
 	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
-- 
2.25.1

