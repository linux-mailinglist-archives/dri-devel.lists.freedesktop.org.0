Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367156E5A5B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4B610E6A9;
	Tue, 18 Apr 2023 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Tue, 18 Apr 2023 01:25:03 UTC
Received: from smtp.gentoo.org (woodpecker.gentoo.org
 [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8666D10E664
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:25:03 +0000 (UTC)
From: Patrick McLean <chutzpah@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpu: Move ASPEED vendor ID definition to pci_ids.h
Date: Mon, 17 Apr 2023 18:17:19 -0700
Message-Id: <20230418011720.3900090-2-chutzpah@gentoo.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418011720.3900090-1-chutzpah@gentoo.org>
References: <20230418011720.3900090-1-chutzpah@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Apr 2023 07:24:20 +0000
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the ASPEED PCI vendor ID is defined in drivers/gpu/drm/ast/ast_drv.c,
move that to include/linux/pci_ids.h with all the rest of the PCI vendor ID
definitions. Rename the definition to follow the format that the other
definitions follow.

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
index 45c3d62e616d..6634741aea80 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -815,6 +815,8 @@
 #define PCI_VENDOR_ID_ASUSTEK		0x1043
 #define PCI_DEVICE_ID_ASUSTEK_0675	0x0675
 
+#define PCI_VENDOR_ID_ASPEED		0x1a03
+
 #define PCI_VENDOR_ID_DPT		0x1044
 #define PCI_DEVICE_ID_DPT		0xa400
 
-- 
2.40.0

