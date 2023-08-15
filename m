Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2A77D414
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 22:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9AB10E28E;
	Tue, 15 Aug 2023 20:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62C10E293;
 Tue, 15 Aug 2023 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692131359; x=1723667359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wQ6SUgwc051LWxzshtFxzYkiYuHbwKJMeWigrpB7ikA=;
 b=jNJ98PoJz/MZlYQ4ka4q6FHnIBNz/lEG9Ahz65SSYj3/f6fnOYluKjsc
 Sp+ywza7o9FK07sSZdrn5Kz7YpYcvGHbBkW/bs74jwcaeIJGGyfm9ywEW
 NX9Dj8t6KToB4oerjWRKjAT3ZWjhXA9Er3vmGCfvN6WUEqHWaQAPMb5oR
 313iY9gPx6X65/so/BAhNu9v8JyX8iJ9jg9x9xW7ifkEkGQEV9RHM31SL
 9Q0ErXpfy7K5ASvkmLV2+sC35GH+fIWp8knfVVBLVk91Th3I9ZjhalDwE
 VB8vncKl13BbAtRD9EarVbCoHV9Gm6IACp/0KW6DM/Uvq466bAm+jJ9iW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372366876"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="372366876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 13:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907746497"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="907746497"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2023 13:29:18 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Date: Tue, 15 Aug 2023 13:29:15 -0700
Message-Id: <20230815202916.1211768-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
References: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..fa460491ce42 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -15,7 +15,7 @@
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
 /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+#define PXP43_MAX_HECI_INOUT_SIZE (SZ_64K)
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
-- 
2.39.0

