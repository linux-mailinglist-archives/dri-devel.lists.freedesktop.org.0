Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B58FCD35
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE6810E5DB;
	Wed,  5 Jun 2024 12:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEAe4Wsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB1810E630;
 Wed,  5 Jun 2024 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591105; x=1749127105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YME78cLVLK1QXmtOfTj7/b8EswHpQF3InScUiYSUH98=;
 b=QEAe4Wsp78O3lVBPmjg6hzbOzdw2pzkHr7XCjFi6YxG2+mXyAATcsqyb
 +SjXWibio8pq9Pg4ku/QYC0ah00EDXy5PbcZmRlQOeaJ0e+Ao3Zr07fBv
 dElgl1QMzBr/2ZY+CZ43Z/DCLdsdPvFpE4Lr8vxGhjXg74ce4g7d8OLcd
 XXe2VyQlbB/3JSP/l1xwDbU73xOAMqLGJsU8/+0RV8ymbn7ul8G1T/7a+
 jbAcEpsGoa6m47XeBwqZt4vGnyzYzXtaassY/9VwmB+pCPDc0tw0upeN8
 ARVoAS2xOJXwX74hiOPMjO3zCLXEgst8pdugUa2Ogo0/cP88+7lKMHm5G A==;
X-CSE-ConnectionGUID: BTHBSqnqTxOV3VxT5Px0aw==
X-CSE-MsgGUID: 45fs2WuCSnqpIFx2HQJ2FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36728156"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36728156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:38:25 -0700
X-CSE-ConnectionGUID: SualHfTjTA6DxnvvqJP54Q==
X-CSE-MsgGUID: TwV+mkLySA26pgeS55XwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="38216595"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 05 Jun 2024 05:38:24 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v12 3/9] gpu/drm/i915: Update indentation for VRR registers
 and bits
Date: Wed,  5 Jun 2024 17:57:56 +0530
Message-Id: <20240605122802.488124-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the indentation for the VRR register definition and
its bits, and fix checkpatch issues to ensure smooth movement
of registers and bits.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0569a23b83b2..6b39211b5469 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1152,7 +1152,7 @@
 #define _TRANS_VRR_CTL_B		0x61420
 #define _TRANS_VRR_CTL_C		0x62420
 #define _TRANS_VRR_CTL_D		0x63420
-#define TRANS_VRR_CTL(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
+#define TRANS_VRR_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
 #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
 #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
 #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
@@ -1160,7 +1160,8 @@
 #define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
 #define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
 #define	  XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
-#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))
+#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, \
+								(x))
 
 #define _TRANS_VRR_VMAX_A		0x60424
 #define _TRANS_VRR_VMAX_B		0x61424
@@ -1190,7 +1191,7 @@
 #define _TRANS_VRR_STATUS_B		0x6142C
 #define _TRANS_VRR_STATUS_C		0x6242C
 #define _TRANS_VRR_STATUS_D		0x6342C
-#define TRANS_VRR_STATUS(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
+#define TRANS_VRR_STATUS(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
 #define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
 #define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
 #define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
@@ -1241,7 +1242,7 @@
 #define   TRANS_PUSH_SEND		REG_BIT(30)
 
 #define _TRANS_VRR_VSYNC_A		0x60078
-#define TRANS_VRR_VSYNC(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
+#define TRANS_VRR_VSYNC(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
 #define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
 #define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
 #define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
-- 
2.25.1

