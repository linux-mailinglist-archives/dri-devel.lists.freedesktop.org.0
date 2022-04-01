Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B34F001D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 11:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BE110F75F;
	Sat,  2 Apr 2022 09:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4602411212D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 08:42:07 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 1 Apr 2022
 16:42:01 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Apr
 2022 16:42:00 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] Hvideo: fbdev: pm2fb: Fix a kernel-doc formatting issue
Date: Fri, 1 Apr 2022 16:41:57 +0800
Message-ID: <1648802518-10571-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-124.meizu.com (172.16.1.124) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Sat, 02 Apr 2022 09:24:49 +0000
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
Cc: linux-fbdev@vger.kernel.org, Haowen Bai <baihaowen@meizu.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function had kernel-doc that not used a hash to separate
the function name from the one line description.

The warning was found by running scripts/kernel-doc, which is
caused by using 'make W=1'.

drivers/video/fbdev/pm2fb.c:1507: warning: This comment starts with '/**', 
but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Device initialisation
drivers/video/fbdev/pm2fb.c:1714: warning: This comment starts with '/**', 
but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Device removal.


Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/video/fbdev/pm2fb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index c68725eebee3..d3be2c64f1c0 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1504,9 +1504,7 @@ static const struct fb_ops pm2fb_ops = {
 
 
 /**
- * Device initialisation
- *
- * Initialise and allocate resource for PCI device.
+ * pm2fb_probe - Initialise and allocate resource for PCI device.
  *
  * @pdev:	PCI device.
  * @id:		PCI device ID.
@@ -1711,9 +1709,7 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 }
 
 /**
- * Device removal.
- *
- * Release all device resources.
+ * pm2fb_remove - Release all device resources.
  *
  * @pdev:	PCI device to clean up.
  */
-- 
2.7.4

