Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E85787368
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA7B10E57B;
	Thu, 24 Aug 2023 15:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2751210E57B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:03:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxPOtGcedkm5AbAA--.51093S3;
 Thu, 24 Aug 2023 23:03:34 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c5EcedkEYBiAA--.42989S4; 
 Thu, 24 Aug 2023 23:03:33 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v5 2/2] PCI/VGA: Remove vga_is_firmware_default() function
Date: Thu, 24 Aug 2023 23:03:32 +0800
Message-Id: <20230824150332.6434-3-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824150332.6434-1-suijingfeng@loongson.cn>
References: <20230824150332.6434-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx_c5EcedkEYBiAA--.42989S4
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr1UKry5tw43Cry3KryxtFc_yoW5GFW8pF
 s3tFWxJrW8Wr45C3s0yF48ZF15ZwsY9aykKFWq93s3Ga45Arn7XrW3ArZYyry7JrZ2q3W3
 AF13Jr10qFyDJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
 xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
 6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
 xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
 IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
 6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ul4E_UUUUU=
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new implemented pci_boot_vga_capturer() function is also effective on
X86 and IA64, it can determine the default boot VGA device before VRAM BAR
relocations done by the PCI core. Since the fixup handler has already
identified the firmware framebuffer, there no need to look again later. So,
switch to using the pci_boot_vga_capturer() on X86 and IA64 also, remove
vga_is_firmware_default() and its relevant codes.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 46 +++-----------------------------------------
 1 file changed, 3 insertions(+), 43 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index bc5fcc855513..1dff74f778cd 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -51,7 +51,6 @@ struct vga_device {
 	unsigned int io_norm_cnt;	/* normal IO count */
 	unsigned int mem_norm_cnt;	/* normal MEM count */
 	bool bridge_has_one_vga;
-	bool is_firmware_default;	/* device selected by firmware */
 	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
 };
 
@@ -544,41 +543,6 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
-static bool vga_is_firmware_default(struct pci_dev *pdev)
-{
-#if defined(CONFIG_X86) || defined(CONFIG_IA64)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	struct resource *r;
-	u64 limit;
-
-	/* Select the device owning the boot framebuffer if there is one */
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
-
-	/* Does firmware framebuffer belong to us? */
-	pci_dev_for_each_resource(pdev, r) {
-		if (resource_type(r) != IORESOURCE_MEM)
-			continue;
-
-		if (!r->start || !r->end)
-			continue;
-
-		if (base < r->start || limit >= r->end)
-			continue;
-
-		return true;
-	}
-#else
-	if (pdev_boot_vga && pdev_boot_vga == pdev)
-		return true;
-#endif
-	return false;
-}
-
 static bool vga_arb_integrated_gpu(struct device *dev)
 {
 #if defined(CONFIG_ACPI)
@@ -610,14 +574,10 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	 */
 
 	/*
-	 * We always prefer a firmware default device, so if we've already
-	 * found one, there's no need to consider vgadev.
+	 * We always prefer a firmware default device.
 	 */
-	if (boot_vga && boot_vga->is_firmware_default)
-		return false;
-
-	if (vga_is_firmware_default(pdev)) {
-		vgadev->is_firmware_default = true;
+	if (pdev == pdev_boot_vga) {
+		vgaarb_dbg(&pdev->dev, "Boot VGA selected by firmware\n");
 		return true;
 	}
 
-- 
2.34.1

