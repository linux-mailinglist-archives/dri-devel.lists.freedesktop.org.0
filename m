Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 418337BBAFC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 16:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41110E513;
	Fri,  6 Oct 2023 14:58:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812110E50F;
 Fri,  6 Oct 2023 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696604307; x=1728140307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o0yNj87ee0gEjKVJu0q5cjr25gvVCIvZpN/1babXRzQ=;
 b=czCdVMx/DgdEvSc9w46rdRFmKIYQXPmm+J2t/lp5XFG5ePHBuSxpw/Bo
 LzXaGNfoioHqcAti1jOFQRVGnq0SV+o2rFtB6MwFe/5xcI/EEHCLQOyPo
 FFmm/4AA9ZbeGN+JiJAXeYTxT2IDw25b1jmGYE4XWihO9h8Q1bWN8EO9W
 LDEiDSmhe+LO6G08A+exQ3pKUksU28qjpcpaqqKDy6zImk+9eP8RSlKF/
 9TN+R2ByUSllnMLf2uRn0l7bYNVADpRmdGlLp2ry1BDkfTRI1/87JTE9w
 0bQrLB4/g/D1Vgf8oTl57lIhJSCuu1/zFGzO7IGI005FZQTKKyIhyvhj+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="363117532"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="363117532"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 07:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="1083480585"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="1083480585"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 07:58:26 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Update 'recommended' version to 70.12.1 for
 DG2/ADL-S/ADL-P/MTL
Date: Fri,  6 Oct 2023 07:58:01 -0700
Message-ID: <20231006145801.161868-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

The latest GuC has new features and new workarounds that we wish to
enable. So let the universe know that it is useful to update their
firmware.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 32e27e9a2490f..362639162ed60 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -88,12 +88,12 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 6, 6)) \
-	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
-	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
+	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 12, 1)) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 12, 1)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 12, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
-	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5, 1)) \
+	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 12, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
 	fw_def(DG1,          0, guc_maj(dg1,  70, 5, 1)) \
-- 
2.41.0

