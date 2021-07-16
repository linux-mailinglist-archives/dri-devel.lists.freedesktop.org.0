Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8153CB167
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 06:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A886E8FF;
	Fri, 16 Jul 2021 04:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4646E8F7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 04:12:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271783401"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271783401"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495788657"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 15/15] drm/i915/pxp: enable PXP for integrated Gen12
Date: Thu, 15 Jul 2021 21:10:34 -0700
Message-Id: <20210716041034.382-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note that discrete cards can support PXP as well, but we haven't tested
on those yet so keeping it disabled for now.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 67696d752271..3d270a45a94d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -882,6 +882,7 @@ static const struct intel_device_info jsl_info = {
 	}, \
 	TGL_CURSOR_OFFSETS, \
 	.has_global_mocs = 1, \
+	.has_pxp = 1, \
 	.display.has_dsb = 1
 
 static const struct intel_device_info tgl_info = {
@@ -909,6 +910,7 @@ static const struct intel_device_info rkl_info = {
 	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
 	.has_master_unit_irq = 1, \
 	.has_llc = 0, \
+	.has_pxp = 0, \
 	.has_snoop = 1, \
 	.is_dgfx = 1
 
-- 
2.32.0

