Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C85B2EAE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28A10EBD8;
	Fri,  9 Sep 2022 06:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EBD410E568
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 22:06:11 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9CF5C20B929C;
 Thu,  8 Sep 2022 15:06:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9CF5C20B929C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662674770;
 bh=ch/5/cm2aut8sVA7LsCY7bS7GtYymUIOxpzSvQK1PWQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jCCnNfQVhM9/unHCtZWNTvR6KP1h6I7SWG0furjlcpc0QvmkyMA/i9FMRrrJGlq2U
 yZCSJ5Uvy8rukE5Fhip0TtfdoqDakhHDhqFlRI9WcBbvz1N4f+A6Oco0caqQZgxk4M
 nLS9KdKZ22JVd4K1KQfse+l0e5d5toqAlbllDCVk=
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
Subject: [PATCH 2/3] pci_ids: Add Microsoft PCI Vendor ID,
 and remove redundant definitions
Date: Thu,  8 Sep 2022 15:05:56 -0700
Message-Id: <1662674757-31945-2-git-send-email-eahariha@linux.microsoft.com>
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

Move the Microsoft PCI Vendor ID from the various drivers to the pci_ids
file

Signed-off-by: Easwar Hariharan <easwar.hariharan@microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 1 -
 drivers/net/ethernet/microsoft/mana/gdma_main.c | 4 ----
 drivers/video/fbdev/hyperv_fb.c                 | 3 ---
 include/linux/pci_ids.h                         | 2 ++
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 6d11e79..61083c7 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -23,7 +23,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
 #define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
 
 DEFINE_DRM_GEM_FOPS(hv_fops);
diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
index 5f92401..00d8198 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@ -1465,10 +1465,6 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifndef PCI_VENDOR_ID_MICROSOFT
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#endif
-
 static const struct pci_device_id mana_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 886c564..a502c80 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -58,7 +58,6 @@
 
 #include <linux/hyperv.h>
 
-
 /* Hyper-V Synthetic Video Protocol definitions and structures */
 #define MAX_VMBUS_PKT_SIZE 0x4000
 
@@ -74,10 +73,8 @@
 #define SYNTHVID_DEPTH_WIN8 32
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
 #define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
 
-
 enum pipe_msg_type {
 	PIPE_MSG_INVALID,
 	PIPE_MSG_DATA,
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 6feade6..c008fda 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2079,6 +2079,8 @@
 #define PCI_DEVICE_ID_ICE_1712		0x1712
 #define PCI_DEVICE_ID_VT1724		0x1724
 
+#define PCI_VENDOR_ID_MICROSOFT  	0x1414
+
 #define PCI_VENDOR_ID_OXSEMI		0x1415
 #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
 #define PCI_DEVICE_ID_OXSEMI_PCIe840		0xC000
-- 
1.8.3.1

