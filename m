Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E818C452
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 01:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27296E0ED;
	Fri, 20 Mar 2020 00:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103D6E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 00:43:26 +0000 (UTC)
IronPort-SDR: T3PQOn7MUlGVc4Cgi2yRZkO29j/A/iN+YO/eqEL4nNxhoAM2QtiWDYn28QMKO4Xrs/PCTLMK1p
 cNxtazrlzDdQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 17:43:26 -0700
IronPort-SDR: O+mFqMYWPLlV8ra8CkMk7sx7IViEMdMgwutycLYzdnY31w2Su6d+2v3QafF55E36T0va1NYFSg
 LCfOKMs9/82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,573,1580803200"; d="scan'208";a="238640497"
Received: from sdhanava-desk2.jf.intel.com ([10.165.21.144])
 by fmsmga008.fm.intel.com with ESMTP; 19 Mar 2020 17:43:26 -0700
From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Date: Thu, 19 Mar 2020 17:38:30 -0700
Message-Id: <20200320003830.7655-1-swathi.dhanavanthri@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: swathi.dhanavanthri@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes:
91b79fb35d67 ("drm/i915/tgl: Add new PCI IDs to TGL")

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
---
 intel/i915_pciids.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
index 1d2c1221..662d8351 100644
--- a/intel/i915_pciids.h
+++ b/intel/i915_pciids.h
@@ -593,12 +593,16 @@
 
 /* TGL */
 #define INTEL_TGL_12_IDS(info) \
-	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A40, info), \
+	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
 	INTEL_VGA_DEVICE(0x9A60, info), \
 	INTEL_VGA_DEVICE(0x9A68, info), \
 	INTEL_VGA_DEVICE(0x9A70, info), \
-	INTEL_VGA_DEVICE(0x9A78, info)
+	INTEL_VGA_DEVICE(0x9A78, info), \
+	INTEL_VGA_DEVICE(0x9AC0, info), \
+	INTEL_VGA_DEVICE(0x9AC9, info), \
+	INTEL_VGA_DEVICE(0x9AD9, info), \
+	INTEL_VGA_DEVICE(0x9AF8, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
