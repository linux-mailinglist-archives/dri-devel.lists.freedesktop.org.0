Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51231A26D9A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C8010E5CA;
	Tue,  4 Feb 2025 08:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=matrox.com header.i=@matrox.com header.b="a/LM2cDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2025 13:15:10 UTC
Received: from mtxmxout4.matrox.com (mtxmxout4.matrox.com [138.11.2.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A910910E428
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:15:10 +0000 (UTC)
Received: from venus.matrox.com (unknown [192.168.1.36])
 by mtxmxout4.matrox.com (Postfix) with ESMTP id 7BB8A400D0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 08:07:34 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matrox.com; s=dkim;
 t=1738588054; bh=Rd91snfQISx1V1oKL6wKfZGoBBLlGokbPUcaLbk6dYE=;
 h=Date:From:To:Subject;
 b=a/LM2cDhfO2+0NaeMKmysXkLazoupHyCI971/kiXFbswZ5yh8nSOR4NnxdE1Gw59D
 dGziP4C1qXysk/dqtXXQvKjs80RvckNTpq8fSqnt6PlwvjBkP11p4kaTCba3vQuRd3
 37+zczhLdKbs62YUPiLli/UOLkRxmcy+lPRyqe/k=
Received: (from ssmsp@localhost)
 by venus.matrox.com (8.14.6/8.13.2) id 513D7Ymo010889
 for dri-devel@lists.freedesktop.org; Mon, 3 Feb 2025 08:07:34 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by venus.matrox.com (Postfix) with ESMTP id 6D64B5F760;
 Mon,  3 Feb 2025 08:07:34 -0500 (EST)
X-Virus-MTX-Scanned: by Matrox Virus scanner at venus.matrox.com
Received: from venus.matrox.com ([127.0.0.1])
 by localhost (venus.matrox.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qDoW15h4H9d4; Mon,  3 Feb 2025 08:07:34 -0500 (EST)
Received: from venus-in.matrox.com (localhost.localdomain [127.0.0.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by venus.matrox.com (Postfix) with ESMTPS id 58D9A5F75B;
 Mon,  3 Feb 2025 08:07:34 -0500 (EST)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.8.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by venus-in.matrox.com (Postfix) with ESMTPS id 5707E61F04;
 Mon,  3 Feb 2025 08:07:34 -0500 (EST)
Received: by pluton.matrox.com (Postfix, from userid 3820)
 id 5463E340366; Mon,  3 Feb 2025 08:07:34 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by pluton.matrox.com (Postfix) with ESMTP id 51C62340365;
 Mon,  3 Feb 2025 08:07:34 -0500 (EST)
Date: Mon, 3 Feb 2025 08:07:34 -0500 (EST)
From: Gwenael Georgeault <ggeorgea@matrox.com>
To: David Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mgag200: Added support for the new device G200eH5
Message-ID: <alpine.LFD.2.00.2502030802150.30536@pluton.matrox.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

- Added the new device ID
- Added new pll algorithm

Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
---
  drivers/gpu/drm/mgag200/Makefile          |   1 +
  drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
  drivers/gpu/drm/mgag200/mgag200_drv.h     |   7 +-
  drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 212 ++++++++++++++++++++++
  4 files changed, 222 insertions(+), 2 deletions(-)
  create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 5a02203fad12..94f063c8722a 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -6,6 +6,7 @@ mgag200-y := \
  	mgag200_g200.o \
  	mgag200_g200eh.o \
  	mgag200_g200eh3.o \
+	mgag200_g200eh5.o \
  	mgag200_g200er.o \
  	mgag200_g200ev.o \
  	mgag200_g200ew3.o \
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 069fdd2dc8f6..1c257f5b5136 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -214,6 +214,7 @@ static const struct pci_device_id mgag200_pciidlist[] = {
  	{ PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_ER },
  	{ PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EW3 },
  	{ PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EH3 },
+	{ PCI_VENDOR_ID_MATROX, 0x53A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EH5 },
  	{0,}
  };

@@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  	case G200_EH3:
  		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
  		break;
+	case G200_EH5:
+		mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
+		break;
  	case G200_ER:
  		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
  		break;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 0608fc63e588..065ba09d109b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -196,6 +196,7 @@ enum mga_type {
  	G200_EV,
  	G200_EH,
  	G200_EH3,
+	G200_EH5,
  	G200_ER,
  	G200_EW3,
  };
@@ -333,11 +334,13 @@ void mgag200_g200eh_pixpllc_atomic_update(struct drm_crtc *crtc, struct drm_atom
  struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev,
  						const struct drm_driver *drv);
  struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
-						 const struct drm_driver *drv);
+						const struct drm_driver *drv);
+struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
+						const struct drm_driver *drv);
  struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
  						const struct drm_driver *drv);
  struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
-						 const struct drm_driver *drv);
+						const struct drm_driver *drv);

  /*
   * mgag200_mode.c
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
new file mode 100644
index 000000000000..5e39504785d8
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/pci.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "mgag200_drv.h"
+
+/*
+ * PIXPLLC
+ */
+
+static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
+					struct drm_atomic_state *new_state)
+{
+
+	static u64 ulVCOMax     = 10000000000ULL;   // units in Hz (10 GHz)
+	static u64 ulVCOMin     = 2500000000LL;     // units in Hz (2.5 GHz)
+	static u64 ulPLLFreqRef = 25000000ULL;      // units in Hz (25 MHz)
+
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
+	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
+	long   clock = new_crtc_state->mode.clock;
+	struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
+
+	u64 ulFDelta     = 0xFFFFFFFFFFFFFFFFULL;
+
+	u16 ulMultMax    = (u16)(ulVCOMax / ulPLLFreqRef);    // 400 (0x190)
+	u16 ulMultMin    = (u16)(ulVCOMin / ulPLLFreqRef);    // 100 (0x64)
+
+	u64 ulFTmpDelta;
+	u64 ulComputedFo;
+
+	u16 ulTestM;
+	u8  ulTestDivA;
+	u8  ulTestDivB;
+	u64 ulFoHz;
+	int iDone = 0;
+
+	u8 ucM = 0;
+	u8 ucN = 0;
+	u8 ucP = 0;
+
+	ulFoHz = (u64)clock * 1000ULL;
+
+
+	for (ulTestM = ulMultMin; ulTestM <= ulMultMax; ulTestM++) { // This gives 100 <= M <= 400
+		for (ulTestDivA = 8; ulTestDivA > 0; ulTestDivA--) { // This gives 1 <= A <= 8
+			for (ulTestDivB = 1; ulTestDivB <= ulTestDivA; ulTestDivB++) {
+				// This gives 1 <= B <= A
+				ulComputedFo = (ulPLLFreqRef * ulTestM) /
+					(4 * ulTestDivA * ulTestDivB);
+
+				if (ulComputedFo > ulFoHz)
+					ulFTmpDelta = ulComputedFo - ulFoHz;
+				else
+					ulFTmpDelta = ulFoHz - ulComputedFo;
+
+				if (ulFTmpDelta < ulFDelta) {
+					ulFDelta = ulFTmpDelta;
+					ucM = (u8)(0xFF & ulTestM);
+					ucN = (u8)(
+					(0x7 & (ulTestDivA - 1))
+					| (0x70 & (0x7 & (ulTestDivB - 1)) << 4)
+					);
+					ucP = (u8)(1 & (ulTestM >> 8));
+				}
+				if (ulFDelta == 0) {
+					iDone = 1;
+					break;
+				}
+			} // End of DivB if (iDone)
+			if (iDone)
+				break;
+		} // End of DivA Loop
+
+		if (iDone)
+			break;
+	} // End of M Loop
+
+	pixpllc->m = ucM + 1;
+	pixpllc->n = ucN + 1;
+	pixpllc->p = ucP + 1;
+	pixpllc->s = 0;
+
+	return 0;
+	}
+
+
+
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200eh5_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200eh5_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200eh5_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+		&mgag200_g200eh5_primary_plane_funcs,
+		mgag200_primary_plane_formats,
+		mgag200_primary_plane_formats_size,
+		mgag200_primary_plane_fmtmods,
+		DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200eh5_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+		&mgag200_g200eh5_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+	ret = mgag200_vga_bmc_output_init(mdev);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * DRM device
+ */
+
+static const struct mgag200_device_info mgag200_g200eh5_device_info =
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
+
+static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs = {
+	.pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
+	.pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // same as G200EH
+};
+
+struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
+	const struct drm_driver *drv)
+{
+
+	struct mga_device *mdev;
+	struct drm_device *dev;
+	resource_size_t vram_available;
+	int ret;
+
+	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
+
+	if (IS_ERR(mdev))
+		return mdev;
+	dev = &mdev->base;
+
+	pci_set_drvdata(pdev, dev);
+
+	ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_device_preinit(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
+		&mgag200_g200eh5_device_funcs);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	mgag200_g200eh_init_registers(mdev); // same as G200EH
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_mode_config_init(mdev, vram_available);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_g200eh5_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
+
+	return mdev;
+}
-- 
2.34.1

