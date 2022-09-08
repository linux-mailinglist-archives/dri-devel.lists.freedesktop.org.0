Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1435B2EA6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD9A10EBD0;
	Fri,  9 Sep 2022 06:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id D46B710E568
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 22:06:27 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7928E204A5AD;
 Thu,  8 Sep 2022 15:06:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7928E204A5AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662674787;
 bh=clRlDW/UKU55qy4Nhd5brXYsUV02HVnxKRgDRmJFpXM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z9VWtNQUK23jDB0GlWl74m51KMrqh0BhgccO2813dJAJmVKZrheyjY1er6b5u4WVH
 WVEuz9ykp2wJgiWMnGERBZOCcnZl9ONv9mPMnG/E4jaEuxxYp1MYq+vcT4ZW/bjMxE
 L402v8AfZ3/4KZVxkTXrxz9RqBjRapos5kNm6GsU=
From: eahariha@linux.microsoft.com
To: Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Helge Deller <deller@gmx.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Easwar Hariharan <easwar.hariharan@microsoft.com>,
 Colin Ian King <colin.i.king@googlemail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hyperv@vger.kernel.org (open list:DRM DRIVER FOR HYPERV SYNTHETIC VIDEO
 DEVICE), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR HYPERV SYNTHETIC
 VIDEO DEVICE), linux-kernel@vger.kernel.org (open list),
 netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM)
Subject: [PATCH 3/3] pci_ids: Add the various Microsoft PCI device IDs
Date: Thu,  8 Sep 2022 15:05:57 -0700
Message-Id: <1662674757-31945-3-git-send-email-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662674757-31945-1-git-send-email-eahariha@linux.microsoft.com>
References: <1662674757-31945-1-git-send-email-eahariha@linux.microsoft.com>
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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

From: Easwar Hariharan <easwar.hariharan@microsoft.com>

Signed-off-by: Easwar Hariharan <easwar.hariharan@microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 4 +---
 drivers/net/ethernet/microsoft/mana/gdma.h      | 3 ---
 drivers/net/ethernet/microsoft/mana/gdma_main.c | 6 +++---
 drivers/video/fbdev/hyperv_fb.c                 | 6 ++----
 include/linux/pci_ids.h                         | 3 +++
 5 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 61083c7..695d3a7 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -23,8 +23,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
 DEFINE_DRM_GEM_FOPS(hv_fops);
 
 static struct drm_driver hyperv_driver = {
@@ -53,7 +51,7 @@ static void hyperv_pci_remove(struct pci_dev *pdev)
 static const struct pci_device_id hyperv_pci_tbl[] = {
 	{
 		.vendor = PCI_VENDOR_ID_MICROSOFT,
-		.device = PCI_DEVICE_ID_HYPERV_VIDEO,
+		.device = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
 	},
 	{ /* end of list */ }
 };
diff --git a/drivers/net/ethernet/microsoft/mana/gdma.h b/drivers/net/ethernet/microsoft/mana/gdma.h
index 4a6efe6..9d3a9f7 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma.h
+++ b/drivers/net/ethernet/microsoft/mana/gdma.h
@@ -476,9 +476,6 @@ struct gdma_eqe {
 
 #define GDMA_SRIOV_REG_CFG_BASE_OFF	0x108
 
-#define MANA_PF_DEVICE_ID 0x00B9
-#define MANA_VF_DEVICE_ID 0x00BA
-
 struct gdma_posted_wqe_info {
 	u32 wqe_size_in_bu;
 };
diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
index 00d8198..18cf168 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@ -1333,7 +1333,7 @@ static void mana_gd_cleanup(struct pci_dev *pdev)
 
 static bool mana_is_pf(unsigned short dev_id)
 {
-	return dev_id == MANA_PF_DEVICE_ID;
+	return dev_id == PCI_DEVICE_ID_MICROSOFT_MANA_PF;
 }
 
 static int mana_gd_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -1466,8 +1466,8 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id mana_id_table[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_PF) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, PCI_DEVICE_ID_MICROSOFT_MANA_VF) },
 	{ }
 };
 
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index a502c80..b9277e5 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -73,8 +73,6 @@
 #define SYNTHVID_DEPTH_WIN8 32
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
 
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
 enum pipe_msg_type {
 	PIPE_MSG_INVALID,
 	PIPE_MSG_DATA,
@@ -998,7 +996,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 
 	if (!gen2vm) {
 		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
-			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
+			PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO, NULL);
 		if (!pdev) {
 			pr_err("Unable to find PCI Hyper-V video\n");
 			return -ENODEV;
@@ -1312,7 +1310,7 @@ static int hvfb_resume(struct hv_device *hdev)
 static const struct pci_device_id pci_stub_id_table[] = {
 	{
 		.vendor      = PCI_VENDOR_ID_MICROSOFT,
-		.device      = PCI_DEVICE_ID_HYPERV_VIDEO,
+		.device      = PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO,
 	},
 	{ /* end of list */ }
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index c008fda..0bef8e6 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2080,6 +2080,9 @@
 #define PCI_DEVICE_ID_VT1724		0x1724
 
 #define PCI_VENDOR_ID_MICROSOFT  	0x1414
+#define PCI_DEVICE_ID_MICROSOFT_HYPERV_VIDEO 	0x5353
+#define PCI_DEVICE_ID_MICROSOFT_MANA_PF  	0x00B9
+#define PCI_DEVICE_ID_MICROSOFT_MANA_VF  	0x00BA
 
 #define PCI_VENDOR_ID_OXSEMI		0x1415
 #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
-- 
1.8.3.1

