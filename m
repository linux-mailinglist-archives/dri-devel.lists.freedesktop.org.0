Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB416F1E6C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BE410EDC2;
	Fri, 28 Apr 2023 18:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3D10EDB8;
 Fri, 28 Apr 2023 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708311; x=1714244311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rs2nq581ldEuTM6lWyDSbnCHfj1xsJRLbiW5aWmTsjw=;
 b=Z66sqn/tAJBKek0sGxj1CYtrOJXRHAEMSuj2UX1FjvDhjpD1og6IwXOc
 UACY8jH570hvUFKRAV2qLMn35pOlaWehmX5WuZVjcsUmeCL4kvzNBx6/O
 hRqQYgHc1iwRnj05tKs/7SrHuGymunKuH6eaB2j01N0kGVncv2gLvcWee
 k/6tl55F8i94PXwGFAowI3WDE1eOTdrm7QwS67Q9QPNarDEDTLd2lDF0G
 3Kq4F55+jJhtnQUbwwz56a1vF4QNhxG1xnEYGelnJLjBt5OfbHdUl39jz
 TnMQzlrtnYkDq/kNReggNOkK9R68hkLGZHnci1+x7RARJwWMfmfROK1Qy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="350747191"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="350747191"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="645254623"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="645254623"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/i915/huc: define HuC FW version for MTL
Date: Fri, 28 Apr 2023 11:58:10 -0700
Message-Id: <20230428185810.4127234-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the same logic as DG2, so just a meu binary with no version number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 3338dd45e78b..796f54a62eef 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -102,6 +102,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp, huc_gsc) \
+	fw_def(METEORLAKE,   0, huc_gsc(mtl)) \
 	fw_def(DG2,          0, huc_gsc(dg2)) \
 	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
-- 
2.40.0

