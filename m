Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05D799BF1
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 00:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607D10E2BE;
	Sat,  9 Sep 2023 22:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9234410E14C;
 Sat,  9 Sep 2023 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694299131; x=1725835131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4T60bL3Wecx0crmZlZxRB3FyynXNiqex6pRA563PLEg=;
 b=IPN4df20SvIAYsNOc7Xt6Sxp0ntHpcATp9/wjZOBQ36qySOZY0k7XjaB
 7H7QoSYZYi2fFU2xwbjIJu1YX6rg+VwTI8hSu8HhuDuZUMFhMLFzpEZ5X
 r24pdTMKogI11xuiTwoWr7TH55inhgU2y85ZJSEqfQK86nXIsTO7RDPys
 V/t3esvs+F+5OisI3yUqDiimh9VYNziK9Mm1gjWwvqheLnQId//x6X2O2
 yD7MwgnZyo5kGjoyUdRbkKy0hmtNAhGHw7Ia0yg+OJ8vGVCSyWO/5epp8
 /fZ+A0+q2O5HlWyPcldPnjbj2zOfAOpMjsbRd+aECSrjDLhGAzQSOROXQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377767894"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="377767894"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 15:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719532033"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="719532033"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2023 15:38:50 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Date: Sat,  9 Sep 2023 15:38:47 -0700
Message-Id: <20230909223848.427849-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
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
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the GSC-fw input/output HECI packet size to match
updated internal fw specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..e017a7d952e9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -14,8 +14,8 @@
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
-/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+/* PXP-Packet sizes for MTL's GSCCS-HECI instruction is spec'd at 65K before page alignment*/
+#define PXP43_MAX_HECI_INOUT_SIZE (PAGE_ALIGNED(SZ_64K + SZ_1K))
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
-- 
2.39.0

