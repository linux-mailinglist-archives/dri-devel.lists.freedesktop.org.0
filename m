Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF86D2B89
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 00:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53B110F343;
	Fri, 31 Mar 2023 22:52:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C4910F343;
 Fri, 31 Mar 2023 22:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680303170; x=1711839170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0yK4TSTjBSHcc18dT1MkprIzw+DQtiQa4FCA5nNu5f0=;
 b=VNnKh2qRP7nS0SqKC4qtrYjOIeIQNRoWyN7z5cy3+H0+1aQENAkGhWQW
 yCq2+tUbKmWbPRM8W8ull6sd0ebxlicGNphQtP++DVtXOk0y9cmawRLIC
 A5ZXbOJ1wTur3Ca+GoZmygM77Bqq6E53DMOPtPRuGREB9SK79YF7l+K4C
 z4+M3Ub8G9PRT9as90LZG6fDPkBLhdA5ylsDjJc6aTaWcopg2A7zkdpmR
 7INrbXqgt0XoisAK/oUno/GFszqKBfx4EzaVOStwFnc1rMgWkECOid4ja
 jEgISHh3LCfUWWbpARPkM7+VGhlfeXkcPXyhhPQi5weT1l+6WD+Bfyy+R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406597825"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="406597825"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="715620043"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="715620043"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga008.jf.intel.com with ESMTP; 31 Mar 2023 15:52:49 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [CI] drm/i915/mtl: Define GuC firmware version for MTL
Date: Fri, 31 Mar 2023 15:52:16 -0700
Message-Id: <20230331225216.4188274-1-John.C.Harrison@Intel.com>
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
index 264c952f777bb..1ac6f9f340e31 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -79,6 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
+	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
 	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
-- 
2.39.1

