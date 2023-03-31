Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEB6D2B37
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 00:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6130510F32B;
	Fri, 31 Mar 2023 22:20:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28E310E57F;
 Fri, 31 Mar 2023 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301243; x=1711837243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgQ9J1MmAkUavgeL/snjpNyivqiivHm2ZZ+DqYZ0pTw=;
 b=OBW6gIlW6JDLpf5/Zlvf2EeZ5Ghu5S70akSwftY0PFSqkrnovepbE4ZK
 Uk30gSa4/X5+GInMpai18i2q+iR85etmX/gWgcHciLCh0wdEAXI3m5tp0
 +8Cc2XSW+f7v544N6gM1YF/GYOzN0g6s0HsMYNMdUYUFdZlrdJ1QP7tgk
 RKT1hHcJ88448/LI2R/erJYLTOCG9k8WWLZOvGpYwStSDuh+o0/J01C8t
 +et/Y3/Rdomu1RD5wqByeHTLskeHIW5Zf9wKLUP92YTMbslHkuG4EEbhj
 s36yF+qogPKZSc7v84GZCRqO7jlzndQyCR23R4rnsoCXps2LVybodwEqJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="427846427"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="427846427"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717875815"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="717875815"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2023 15:20:40 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [CI] drm/i915/mtl: Define GuC firmware version for MTL
Date: Fri, 31 Mar 2023 15:20:07 -0700
Message-Id: <20230331222007.3965626-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

First release of GuC for Meteorlake.

NB: As this is still pre-release and likely to change, use explicit
versioning for now. The official, full release will use reduced
version naming.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 264c952f777bb..ae25cfbdc697e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -79,6 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
+	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 4)) \
 	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
-- 
2.39.1

