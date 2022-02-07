Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9C4ACA7D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387D010FA10;
	Mon,  7 Feb 2022 20:36:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BE810FA0D;
 Mon,  7 Feb 2022 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644266203; x=1675802203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+IyODFpNsQ1iMhDCMb0P5J35rPjw517vn8+xz95wtYw=;
 b=Nc/ksgzioVYnal3XEJ5gmXsyZMD5Ju0QXDCJcgiZ8BtUU/I17b9Y+va+
 Of9Pmf2gvqLkiE3/WxuQbOsSkCp/YX5gQ54PTVSi8l+4LbSNpJLjKF2fp
 usxmjYD0LgBZBvTTPQOFg3gdcK9li6qcDcDsiP2kWc+ye/6pXSLlKAK3z
 3/TCLBVU0tIMmIDuxSpI1OxeAeYc0d5Ftx5/Z3fC6V29xg/HoWAEDM8aS
 IKktg0D2tJETCl4ZxLXeoK0X7c6xDS1ADpfCKIanKYVck/EBuHswTBpZf
 V0RqiZ46wnjY2C9RmtwzUoxJidRs1nQt7Pe23Asq01kh9dRh5pnZe/0tg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335206205"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="335206205"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="772906876"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2022 12:36:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3] drm/i915/dg2: Define GuC firmware version for DG2
Date: Mon,  7 Feb 2022 12:36:42 -0800
Message-Id: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tomasz Mistat <tomasz.mistat@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

First release of GuC for DG2.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
CC: Tomasz Mistat <tomasz.mistat@intel.com>
CC: Ramalingam C <ramalingam.c@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index ba4f0970749b..efe0a6dcf9f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -50,6 +50,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
+	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
 	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
-- 
2.25.1

