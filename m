Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CFE4C3905
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C05810E8F2;
	Thu, 24 Feb 2022 22:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EA610E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7751061B9C;
 Thu, 24 Feb 2022 22:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E42CC340E9;
 Thu, 24 Feb 2022 22:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742900;
 bh=IRqDHR7QQT0K7ufrl0SxHZX4jvEeyzRHDl7tey1+fOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jvGbbN17SKADaKGdOhI6ofwRl3zTJNbmQF/CYiAg5HzraR9NMSzBa0Xi66yDFo873
 o8TzqG4UWDjRUE1o/Fkc8e5Ks9VLYADEPVn7W8lKhkWz9Q/DyT26Qa0P5/1yx/fwxU
 4bpVRNrLosrIWiGLgsX5gkgmRL5jeiRTirJ6zknmhocb7fztOThLs1BBqdmCylU76f
 Qskh3WnFtZe2Cj+mkP2S163aYGP76ZDUl0XXtDJ19hgcaoR3VJUVOpkfSBH+f9iTNk
 S6TDQ2HBZ6MRcocT323X8BbWC8iithcp+dWDtGM4KCzuK0eLG4GOZgOA1roMeK9/BA
 70HZ0cCXDZKRQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 08/11] PCI/VGA: Remove empty vga_arb_device_card_gone()
Date: Thu, 24 Feb 2022 16:47:50 -0600
Message-Id: <20220224224753.297579-9-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224224753.297579-1-helgaas@kernel.org>
References: <20220224224753.297579-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

vga_arb_device_card_gone() has always been empty.  Remove it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index e8d5efd85ba6..582f0054b71a 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -123,8 +123,6 @@ static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
 /* this is only used a cookie - it should not be dereferenced */
 static struct pci_dev *vga_default;
 
-static void vga_arb_device_card_gone(struct pci_dev *pdev);
-
 /* Find somebody in our list */
 static struct vga_device *vgadev_find(struct pci_dev *pdev)
 {
@@ -878,10 +876,6 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 	/* Remove entry from list */
 	list_del(&vgadev->list);
 	vga_count--;
-	/* Notify userland driver that the device is gone so it discards
-	 * it's copies of the pci_dev pointer
-	 */
-	vga_arb_device_card_gone(pdev);
 
 	/* Wake up all possible waiters */
 	wake_up_all(&vga_wait_queue);
@@ -1131,9 +1125,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 	if (lbuf == NULL)
 		return -ENOMEM;
 
-	/* Shields against vga_arb_device_card_gone (pci_dev going
-	 * away), and allows access to vga list
-	 */
+	/* Protects vga_list */
 	spin_lock_irqsave(&vga_lock, flags);
 
 	/* If we are targeting the default, use it */
@@ -1150,8 +1142,6 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 		/* Wow, it's not in the list, that shouldn't happen,
 		 * let's fix us up and return invalid card
 		 */
-		if (pdev == priv->target)
-			vga_arb_device_card_gone(pdev);
 		spin_unlock_irqrestore(&vga_lock, flags);
 		len = sprintf(lbuf, "invalid");
 		goto done;
@@ -1495,10 +1485,6 @@ static int vga_arb_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static void vga_arb_device_card_gone(struct pci_dev *pdev)
-{
-}
-
 /*
  * callback any registered clients to let them know we have a
  * change in VGA cards
-- 
2.25.1

