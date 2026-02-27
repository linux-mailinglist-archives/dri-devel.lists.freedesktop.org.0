Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLGxCA8BoWlVpQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50E71B2041
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7710EA1E;
	Fri, 27 Feb 2026 02:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRAbORQ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95C110EA1F;
 Fri, 27 Feb 2026 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772159239; x=1803695239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DyqyNnnTAap7JTHFe3VSBGAB2kKzNc6UeASax20VDi0=;
 b=mRAbORQ8o7fNG2VLKC5fbPuu43n8mziH3nVsB7q2NfrbnySe/IXneSl8
 6we7lc39GMlV9sUTQCLv1iTvP0HU+eaoFkcrlUFeBbzGricN9TP6jC4NS
 mNpnpjSW7xH8NDU602oUp30oxXkRYqS0U5VxxJ9wL4FE1MzM/S3CkMqap
 SVFOTTruQvMXLYo+/ea7FVPsVeHix2FcmmV5Nn8r49ji4WxiOMVaiHaCY
 zf46+RcfpCyM7bG735SMh9qZOuKbwR5k9x4wfa1tZ6iQXypO9TWCi5DUw
 dVLo2FUm0elNqO1kVd4ssw/ihtTaq8O59X8TUx8+2yVOnna6ctl40cahI A==;
X-CSE-ConnectionGUID: +uhGp9QaSZm18E/Z29siRQ==
X-CSE-MsgGUID: XixMQ3h/TmuHc7nwELQSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73283315"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73283315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:27:18 -0800
X-CSE-ConnectionGUID: YTgZLCUsRKe2ulh+D/r4mw==
X-CSE-MsgGUID: Lgjpmx17QmWEdzwozWPLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214662255"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 18:27:16 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 2/6] platform/x86/intel/vsec: Make driver_data info const
Date: Thu, 26 Feb 2026 18:27:06 -0800
Message-ID: <20260227022711.3513663-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227022711.3513663-1-david.e.box@linux.intel.com>
References: <20260227022711.3513663-1-david.e.box@linux.intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C50E71B2041
X-Rspamd-Action: no action

Treat PCI id->driver_data (intel_vsec_platform_info) as read-only by making
vsec_priv->info a const pointer and updating all function signatures to
accept const intel_vsec_platform_info *.

This improves const-correctness and clarifies that the platform info data
from the driver_data table is not meant to be modified at runtime.

No functional changes intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v6:
  - No change

Changes in v5:
  - No change

Changes in v4:
  - No change

Changes in v3:
  - No change

Changes in v2:
  - New patch

 drivers/platform/x86/intel/vsec.c | 20 ++++++++++----------
 include/linux/intel_vsec.h        |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 46966edca03b..e0096be605d9 100644
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

