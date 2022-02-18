Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B381D4BBFCF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E3410E71F;
	Fri, 18 Feb 2022 18:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501AE10E7BD;
 Fri, 18 Feb 2022 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210061; x=1676746061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cc+KBzSk90QHeEXAYZ+q2QPbk0ZOVFRG6Y9ZZAuaGpo=;
 b=ZTBf3cm4cd2LpfjHbct17HLGisD4EwF2Y0gUITU2lyugkLfrnG4s8EsR
 wDBhEiQQ1l0brrSK2oaTq/HR6OymGApl3NLwab+5DN79bazPHH4fvnMVr
 p20cxU3wkJsdX6IS52hPS0IriAJI35Jxc8la4NVilMemYdqV7DjNvgj3H
 bv+6wd0Q7m5FA9RciANdz8XdAtcaXLK1S/a1tMYSmrdDcHf7VZaZXyg+v
 axJRRze71pDH25HH0FVKhUDnUWYtkPYGkydltsqh8Nvt3m6aQzPRka2oS
 oXjrAZzRP/sp/9kDKjRdbnIic3LCrGIm+ZVBe7CDlOvrcBsBzKFdxAmy6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238592912"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238592912"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642012"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:38 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/15] drm/i915/dg2: Define GuC firmware version for DG2
Date: Sat, 19 Feb 2022 00:17:38 +0530
Message-Id: <20220218184752.7524-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Cc: Tomasz Mistat <tomasz.mistat@intel.com>, lucas.demarchi@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
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
index c88113044494..55512db29183 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -52,6 +52,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
+	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
 	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
-- 
2.20.1

