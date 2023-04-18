Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA846E8B1D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345F10EBB8;
	Thu, 20 Apr 2023 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3C10E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 22:58:07 +0000 (UTC)
From: Patrick McLean <chutzpah@gentoo.org>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR AST SERVER GRAPHICS
 CHIPS), linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM)
Subject: [PATCH] PCI: Add ASPEED vendor ID
Date: Tue, 18 Apr 2023 15:57:57 -0700
Message-Id: <20230418225757.1361301-1-chutzpah@gentoo.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the ASPEED PCI vendor ID is defined in
drivers/gpu/drm/ast/ast_drv.c, move that to include/linux/pci_ids.h
with all the rest of the PCI vendor ID definitions. Rename the definition
to follow the format that the other definitions follow.

Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
---
 drivers/gpu/drm/ast/ast_drv.c | 4 +---
 include/linux/pci_ids.h       | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index d78852c7cf5b..232e797793b6 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -70,12 +70,10 @@ static const struct drm_driver ast_driver = {
  * PCI driver
  */
 
-#define PCI_VENDOR_ASPEED 0x1a03
-
 #define AST_VGA_DEVICE(id, info) {		\
 	.class = PCI_BASE_CLASS_DISPLAY << 16,	\
 	.class_mask = 0xff0000,			\
-	.vendor = PCI_VENDOR_ASPEED,			\
+	.vendor = PCI_VENDOR_ID_ASPEED,			\
 	.device = id,				\
 	.subvendor = PCI_ANY_ID,		\
 	.subdevice = PCI_ANY_ID,		\
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 45c3d62e616d..40e04e88ca5a 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2553,6 +2553,8 @@
 #define PCI_DEVICE_ID_NETRONOME_NFP3800_VF	0x3803
 #define PCI_DEVICE_ID_NETRONOME_NFP6000_VF	0x6003
 
+#define PCI_VENDOR_ID_ASPEED		0x1a03
+
 #define PCI_VENDOR_ID_QMI		0x1a32
 
 #define PCI_VENDOR_ID_AZWAVE		0x1a3b
-- 
2.40.0

