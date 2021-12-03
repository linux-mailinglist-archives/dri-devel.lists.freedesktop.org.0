Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7E467210
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 07:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA13D732C6;
	Fri,  3 Dec 2021 06:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A151732A2;
 Fri,  3 Dec 2021 06:37:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="323174333"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="323174333"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 22:37:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="478221037"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 22:37:24 -0800
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [v3 1/3] drm/i915/rpl-s: Add PCI IDS for Raptor Lake S
Date: Thu,  2 Dec 2021 22:35:43 -0800
Message-Id: <20211203063545.2254380-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
References: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 x86@kernel.org, dri-devel@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Raptor Lake S(RPL-S) is a version 12
Display, Media and Render. For all i915
purposes it is the same as Alder Lake S (ADL-S).

Introduce RPL-S as a subplatform
of ADL-S. This patch adds PCI ids for RPL-S.

v2: Update PCI IDs.
- Add more description to commit message (Jani)

v3: s/IS_RAPTORLAKE/IS_ADLS_RPLS (Jani)
- Fix comment (Tvrtko)

BSpec: 53655

Cc: x86@kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 arch/x86/kernel/early-quirks.c           | 1 +
 drivers/gpu/drm/i915/i915_drv.h          | 2 ++
 drivers/gpu/drm/i915/i915_pci.c          | 1 +
 drivers/gpu/drm/i915/intel_device_info.c | 7 +++++++
 drivers/gpu/drm/i915/intel_device_info.h | 3 +++
 include/drm/i915_pciids.h                | 9 +++++++++
 6 files changed, 23 insertions(+)

diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirks.c
index 391a4e2b8604..fd2d3ab38ebb 100644
--- a/arch/x86/kernel/early-quirks.c
+++ b/arch/x86/kernel/early-quirks.c
@@ -554,6 +554,7 @@ static const struct pci_device_id intel_early_ids[] __initconst = {
 	INTEL_RKL_IDS(&gen11_early_ops),
 	INTEL_ADLS_IDS(&gen11_early_ops),
 	INTEL_ADLP_IDS(&gen11_early_ops),
+	INTEL_RPLS_IDS(&gen11_early_ops),
 };
 
 struct resource intel_graphics_stolen_res __ro_after_init = DEFINE_RES_MEM(0, 0);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7e1192aeef90..fe36d0f5da67 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1469,6 +1469,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
 #define IS_DG2_G11(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11)
+#define IS_ADLS_RPLS(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL_S)
 #define IS_HSW_EARLY_SDV(dev_priv) (IS_HASWELL(dev_priv) && \
 				    (INTEL_DEVID(dev_priv) & 0xFF00) == 0x0C00)
 #define IS_BDW_ULT(dev_priv) \
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index f01cba4ec283..061b2e076373 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1131,6 +1131,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_ADLS_IDS(&adl_s_info),
 	INTEL_ADLP_IDS(&adl_p_info),
 	INTEL_DG1_IDS(&dg1_info),
+	INTEL_RPLS_IDS(&adl_s_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index e6605b5181a5..a3446a2abcb2 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -170,6 +170,10 @@ static const u16 subplatform_portf_ids[] = {
 	INTEL_ICL_PORT_F_IDS(0),
 };
 
+static const u16 subplatform_rpls_ids[] = {
+	INTEL_RPLS_IDS(0),
+};
+
 static bool find_devid(u16 id, const u16 *p, unsigned int num)
 {
 	for (; num; num--, p++) {
@@ -206,6 +210,9 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_portf_ids,
 			      ARRAY_SIZE(subplatform_portf_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_PORTF);
+	} else if (find_devid(devid, subplatform_rpls_ids,
+			      ARRAY_SIZE(subplatform_rpls_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_RPL_S);
 	}
 
 	if (IS_TIGERLAKE(i915)) {
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 669f0d26c3c3..2bedf73e0a7d 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -110,6 +110,9 @@ enum intel_platform {
 #define INTEL_SUBPLATFORM_G10	0
 #define INTEL_SUBPLATFORM_G11	1
 
+/* ADL-S */
+#define INTEL_SUBPLATFORM_RPL_S	0
+
 enum intel_ppgtt_type {
 	INTEL_PPGTT_NONE = I915_GEM_PPGTT_NONE,
 	INTEL_PPGTT_ALIASING = I915_GEM_PPGTT_ALIASING,
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index c00ac54692d7..baf3d1d3d566 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -666,4 +666,13 @@
 	INTEL_VGA_DEVICE(0x46C2, info), \
 	INTEL_VGA_DEVICE(0x46C3, info)
 
+/* RPL-S */
+#define INTEL_RPLS_IDS(info) \
+	INTEL_VGA_DEVICE(0xA780, info), \
+	INTEL_VGA_DEVICE(0xA781, info), \
+	INTEL_VGA_DEVICE(0xA782, info), \
+	INTEL_VGA_DEVICE(0xA783, info), \
+	INTEL_VGA_DEVICE(0xA788, info), \
+	INTEL_VGA_DEVICE(0xA789, info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.25.1

