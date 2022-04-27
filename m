Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D4511C76
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 18:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325610F6A7;
	Wed, 27 Apr 2022 16:55:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFEC10F231;
 Wed, 27 Apr 2022 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651078551; x=1682614551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r90TKfO1OHSggETbIDsuFi/QeiBT5xlqhshgbfieOAE=;
 b=ExhIX3ynRnOIkB6BPGKti+08UaxAk46/QGQpQu1SFlqBaOSvxgv9uqVH
 Wsw69e7weazpH+pXTHWS8YqlfpPI/JSraVBx0mVZx3xUsFCL1+rFAd8Ro
 1Zl8QWfxY5JVUEcJq7KuCEipo75TReE8FhOgPzWITuN3TDonC0gi7vNjw
 zR6/EbvqgzXXkxg/oqZJ0Bx8/QYhv5fGf9XX0zra4tFK2taZEkv5P3eHE
 p2Kwk5ngZ8lGupqtNTwXw9vb09/ZdejGBkgf7Tge4wWn1FP5I6Ld2H5QJ
 1VJk1hkN8sO8FbBCAt1RiAO1m7a5LB7Wm/4zh84zELTQ7hyRbW5iChVPE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265812199"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="265812199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 09:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="540186185"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Apr 2022 09:55:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/dg2: Define GuC firmware version for DG2
Date: Wed, 27 Apr 2022 09:55:50 -0700
Message-Id: <20220427165550.3636686-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
References: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
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
index a876d39e6bcf..d078f884b5e3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -53,6 +53,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
+	fw_def(DG2,          0, guc_def(dg2,  70, 1, 2)) \
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
 	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
-- 
2.25.1

