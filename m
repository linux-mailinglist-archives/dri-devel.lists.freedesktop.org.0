Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBhdDU+CcWk1IAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:50:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79056084F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418A210E8C3;
	Thu, 22 Jan 2026 01:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8zmX7zJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2443110E272;
 Thu, 22 Jan 2026 01:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769046598; x=1800582598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=45KwksrFeqit60vWZSvUTCYAtyIeiO7AlHAoUdCzQmQ=;
 b=m8zmX7zJc3GohKFvY83qxNTbiSKMnjlUo5sQHAdg0LX6UMYZHlr+8seX
 CSGL6RgWkODZheMwfyt9wpnLpvyMdpPe/z4l0tFQuMNf7lXrsfj80DIrW
 slHgnrVAyRj94t37CTTekknq12H4dvoDvI9BHL23M6yMjH4n5sqtrWiUn
 bBhhBOY9vaRqzLlv5cN75bA6/0wcS/0Zjkfc7CtsqJ6qP2T1LSQrar3B3
 Ztura13FjhNJVgQCeNBAFQAZfPmo27upkBoJ/A8tLIbzRBmjmoLNGeL+G
 P7Rk3j67vQ4FpJ4RMkyVLdiEt3r7GKUbQeCkYTRfmqCX9fI3fGDmV2ECN A==;
X-CSE-ConnectionGUID: coVM0ONMQcqMhvH9kSjbgA==
X-CSE-MsgGUID: whYwvTIwQgeB2ZURtmXufw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73910934"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="73910934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 17:49:56 -0800
X-CSE-ConnectionGUID: CS7ykybvSUW1wPjcwl43FA==
X-CSE-MsgGUID: MgjoLqcZRdycpDSnSVlcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="211616423"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 17:49:56 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/6] platform/x86/intel/vsec: Make driver_data info const
Date: Wed, 21 Jan 2026 17:49:43 -0800
Message-ID: <20260122014948.3158069-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122014948.3158069-1-david.e.box@linux.intel.com>
References: <20260122014948.3158069-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D79056084F
X-Rspamd-Action: no action

Treat PCI id->driver_data (intel_vsec_platform_info) as read-only by making
vsec_priv->info a const pointer and updating all function signatures to
accept const intel_vsec_platform_info *.

This improves const-correctness and clarifies that the platform info data
from the driver_data table is not meant to be modified at runtime.

No functional changes intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

v2:
  - New patch

 drivers/platform/x86/intel/vsec.c | 20 ++++++++++----------
 include/linux/intel_vsec.h        |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index a10e2c65205c..61b32ae7f064 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -42,7 +42,7 @@ enum vsec_device_state {
 };
=20
 struct vsec_priv {
-	struct intel_vsec_platform_info *info;
+	const struct intel_vsec_platform_info *info;
 	struct device *suppliers[VSEC_FEATURE_COUNT];
 	struct oobmsm_plat_info plat_info;
 	enum vsec_device_state state[VSEC_FEATURE_COUNT];
@@ -270,7 +270,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct dev=
ice *parent,
 EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
=20
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
-			      struct intel_vsec_platform_info *info,
+			      const struct intel_vsec_platform_info *info,
 			      unsigned long cap_id, u64 base_addr)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
@@ -406,7 +406,7 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
_id)
=20
 static int intel_vsec_register_device(struct pci_dev *pdev,
 				      struct intel_vsec_header *header,
-				      struct intel_vsec_platform_info *info,
+				      const struct intel_vsec_platform_info *info,
 				      u64 base_addr)
 {
 	const struct vsec_feature_dependency *consumer_deps;
@@ -452,7 +452,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 }
=20
 static bool intel_vsec_walk_header(struct pci_dev *pdev,
-				   struct intel_vsec_platform_info *info)
+				   const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
 	bool have_devices =3D false;
@@ -468,7 +468,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 }
=20
 static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
-				  struct intel_vsec_platform_info *info)
+				  const struct intel_vsec_platform_info *info)
 {
 	bool have_devices =3D false;
 	int pos =3D 0;
@@ -519,7 +519,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 }
=20
 static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
-				 struct intel_vsec_platform_info *info)
+				 const struct intel_vsec_platform_info *info)
 {
 	bool have_devices =3D false;
 	int pos =3D 0;
@@ -565,7 +565,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 }
=20
 int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info)
+			const struct intel_vsec_platform_info *info)
 {
 	if (!pdev || !info || !info->headers)
 		return -EINVAL;
@@ -578,7 +578,7 @@ int intel_vsec_register(struct pci_dev *pdev,
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
 static bool intel_vsec_get_features(struct pci_dev *pdev,
-				    struct intel_vsec_platform_info *info)
+				    const struct intel_vsec_platform_info *info)
 {
 	bool found =3D false;
=20
@@ -622,7 +622,7 @@ static void intel_vsec_skip_missing_dependencies(struct=
 pci_dev *pdev)
=20
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *id)
 {
-	struct intel_vsec_platform_info *info;
+	const struct intel_vsec_platform_info *info;
 	struct vsec_priv *priv;
 	int num_caps, ret;
 	int run_once =3D 0;
@@ -633,7 +633,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id
 		return ret;
=20
 	pci_save_state(pdev);
-	info =3D (struct intel_vsec_platform_info *)id->driver_data;
+	info =3D (const struct intel_vsec_platform_info *)id->driver_data;
 	if (!info)
 		return -EINVAL;
=20
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1a0f357c2427..d551174b0049 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -200,13 +200,13 @@ static inline struct intel_vsec_device *auxdev_to_ivd=
ev(struct auxiliary_device
=20
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
 int intel_vsec_register(struct pci_dev *pdev,
-			 struct intel_vsec_platform_info *info);
+			const struct intel_vsec_platform_info *info);
 int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
 			   struct intel_vsec_device *vsec_dev);
 struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
 static inline int intel_vsec_register(struct pci_dev *pdev,
-				       struct intel_vsec_platform_info *info)
+				      const struct intel_vsec_platform_info *info)
 {
 	return -ENODEV;
 }
--=20
2.43.0

