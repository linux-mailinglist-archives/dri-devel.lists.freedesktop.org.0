Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A374C124B99
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9114A6E544;
	Wed, 18 Dec 2019 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E0A6E53E;
 Wed, 18 Dec 2019 15:25:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 07:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="205873230"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by orsmga007.jf.intel.com with ESMTP; 18 Dec 2019 07:25:08 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/i915/dp: Register definition for DP compliance
 register
Date: Wed, 18 Dec 2019 20:43:48 +0530
Message-Id: <20191218151350.19579-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218151350.19579-1-animesh.manna@intel.com>
References: <20191218151350.19579-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com,
 Animesh Manna <animesh.manna@intel.com>, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP_COMP_CTL and DP_COMP_PAT register used to program DP
compliance pattern.

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cbb4689af432..fc54143bd4a4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9788,6 +9788,26 @@ enum skl_power_gate {
 #define  DDI_BUF_BALANCE_LEG_ENABLE	(1 << 31)
 #define DDI_BUF_TRANS_HI(port, i)	_MMIO(_PORT(port, _DDI_BUF_TRANS_A, _DDI_BUF_TRANS_B) + (i) * 8 + 4)
 
+/* DDI DP Compliance Control */
+#define DDI_DP_COMP_CTL_A                      0x605F0
+#define DDI_DP_COMP_CTL_B                      0x615F0
+#define DDI_DP_COMP_CTL(port) _MMIO_PORT(port, DDI_DP_COMP_CTL_A, \
+					 DDI_DP_COMP_CTL_B)
+#define  DDI_DP_COMP_CTL_ENABLE                        (1 << 31)
+#define  DDI_DP_COMP_CTL_D10_2                 (0 << 28)
+#define  DDI_DP_COMP_CTL_SCRAMBLED_0           (1 << 28)
+#define  DDI_DP_COMP_CTL_PRBS7                 (2 << 28)
+#define  DDI_DP_COMP_CTL_CUSTOM80                      (3 << 28)
+#define  DDI_DP_COMP_CTL_HBR2                  (4 << 28)
+#define  DDI_DP_COMP_CTL_SCRAMBLED_1           (5 << 28)
+#define  DDI_DP_COMP_CTL_HBR2_RESET            (0xFC << 0)
+
+/* DDI DP Compliance Pattern */
+#define DDI_DP_COMP_PAT_A                      0x605F4
+#define DDI_DP_COMP_PAT_B                      0x615F4
+#define DDI_DP_COMP_PAT(port, i) _MMIO(_PORT(port, DDI_DP_COMP_PAT_A, \
+					     DDI_DP_COMP_PAT_B) + (i) * 4)
+
 /* Sideband Interface (SBI) is programmed indirectly, via
  * SBI_ADDR, which contains the register offset; and SBI_DATA,
  * which contains the payload */
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
