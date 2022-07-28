Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D558488A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 01:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16D510F8F1;
	Thu, 28 Jul 2022 23:07:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0211BC7F;
 Thu, 28 Jul 2022 23:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659049645; x=1690585645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+Qwmq/TBaJXioEAAVetzA+1jOkku1A0T2Grq5ICrgA=;
 b=Q+MPdUFVWG5bico2lf75V69ri5B0d8/QJHk0FIr3RqwkzV0VQ6lztCRC
 E5y8fcrjIk82sIjcwCAQxitBVGn5VniA/pRbYToYxwQq+qDSZAh7/JwOF
 Mxh2/QK9lD/KOIUiTlHc9apQTxV9TS5ldYeMRo3nQ4MSKQubuNpbthOda
 oK3KzxJNl7Os/bU2oMSO20hGqFR3N5x8gd7++CVEH8BBaU6BYg3F1u/1v
 g0vjujh5RsCucZNqAhqnuARK4MqmEZ+4OWZAa3F9m13VJQ2sRDKgcGElh
 fRkJHZ8HxevAPB2V0vZiRA1Q7zFS3VtD1Ks95KRPf9d3MN1MXU/+Lazhu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="287401899"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="287401899"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 16:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="928521116"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2022 16:07:23 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/1] drm/i915/dg2: Update DG2 to GuC v70.4.1
Date: Thu, 28 Jul 2022 16:07:22 -0700
Message-Id: <20220728230722.2749701-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
References: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
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

New release of GuC with a bunch of fixes specific to DG2. Some of
these require follow up i915 changes to enable.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d5fca1f68eff2..58547292efa0a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -53,7 +53,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(DG2,          0, guc_def(dg2,  70, 1, 2)) \
+	fw_def(DG2,          0, guc_def(dg2,  70, 4, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
 	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
-- 
2.37.1

