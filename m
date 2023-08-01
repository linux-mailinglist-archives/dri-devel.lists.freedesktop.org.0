Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F276BC93
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 20:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CA910E1D1;
	Tue,  1 Aug 2023 18:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D68210E1D1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 18:37:10 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxFvHTUMlkSEgOAA--.33562S3;
 Wed, 02 Aug 2023 02:37:08 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax3c7SUMlk7F1EAA--.46812S2; 
 Wed, 02 Aug 2023 02:37:06 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI/VGA: Fixup the firmware fb address om demanding time
Date: Wed,  2 Aug 2023 02:37:06 +0800
Message-Id: <20230801183706.702567-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax3c7SUMlk7F1EAA--.46812S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WrWUXw4kGFyDuF47KFWDWrX_yoW7Cr4Dpr
 WfAayftrs8Wr4fJr43GF48Xw15ZrsY9FWxKFW7A3Z3Ja47urykGr4FyFWDtrWfJ397Jr4f
 KF42yrn5GFsrJFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
 AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
 8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
 Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
 0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWU
 JVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
 AIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU74lkDUUUU
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

Currently, the vga_is_firmware_default() function works on x86 and IA64
architecture only, it is a no-op on ARM64/PPC/RISC-V arch etc. This patch
complete the implementation for the non-x86 architectures by tracking the
firmware fb's address range. Which overcome the VRAM bar relocation issue
by updating the cached firmware fb address range on demanding time.

This make the vga_is_firmware_default() function works on whatever archs
who has UEFI GOP support.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 139 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..8d5c7ee4ee7b 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -61,6 +61,84 @@ static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
 
+static struct firmware_fb_tracker {
+	/* The PCI(e) device who owns the firmware framebuffer */
+	struct pci_dev *pdev;
+	/* The index of the VRAM Bar */
+	unsigned int bar;
+	/* Firmware fb's offset from the VRAM aperture start */
+	resource_size_t offset;
+	/* The firmware fb's size, in bytes */
+	resource_size_t size;
+
+	/* Firmware fb's address range, suffer from change */
+	resource_size_t start;
+	resource_size_t end;
+
+} firmware_fb;
+
+static bool vga_arb_get_fb_range_from_screen_info(resource_size_t *start,
+						  resource_size_t *end)
+{
+	resource_size_t fb_start;
+	resource_size_t fb_end;
+	resource_size_t fb_size;
+
+	fb_start = screen_info.lfb_base;
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_start |= (u64)screen_info.ext_lfb_base << 32;
+
+	fb_size = screen_info.lfb_size;
+
+	/* No firmware framebuffer support */
+	if (!fb_start || !fb_size)
+		return false;
+
+	fb_end = fb_start + fb_size - 1;
+
+	*start = fb_start;
+	*end = fb_end;
+
+	return true;
+}
+
+static bool vga_arb_get_fb_range_from_tracker(resource_size_t *start,
+					      resource_size_t *end)
+{
+	struct pci_dev *pdev = firmware_fb.pdev;
+	resource_size_t new_vram_base;
+	resource_size_t new_fb_start;
+	resource_size_t old_fb_start;
+	resource_size_t old_fb_end;
+
+	/*
+	 * No firmware framebuffer support or No aperture that contains the
+	 * firmware FB is found, in this case, the firmware_fb.pdev will be
+	 * NULL. We will return immediately.
+	 */
+	if (!pdev)
+		return false;
+
+	new_vram_base = pdev->resource[firmware_fb.bar].start;
+	new_fb_start = new_vram_base + firmware_fb.offset;
+	old_fb_start = firmware_fb.start;
+	old_fb_end = firmware_fb.end;
+
+	if (new_fb_start != old_fb_start) {
+		firmware_fb.start = new_fb_start;
+		firmware_fb.end = new_fb_start + firmware_fb.size - 1;
+		/* Firmware fb address range moved */
+		vgaarb_dbg(&pdev->dev,
+			   "[0x%llx, 0x%llx] -> [0x%llx, 0x%llx]\n",
+			   old_fb_start, old_fb_end,
+			   firmware_fb.start, firmware_fb.end);
+	}
+
+	*start = firmware_fb.start;
+	*end = firmware_fb.end;
+
+	return true;
+}
 
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
@@ -543,20 +621,21 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
+/* Select the device owning the boot framebuffer if there is one */
 static bool vga_is_firmware_default(struct pci_dev *pdev)
 {
-#if defined(CONFIG_X86) || defined(CONFIG_IA64)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
 	struct resource *r;
-	u64 limit;
+	resource_size_t fb_start;
+	resource_size_t fb_end;
+	bool ret;
 
-	/* Select the device owning the boot framebuffer if there is one */
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+	ret = vga_arb_get_fb_range_from_screen_info(&fb_start, &fb_end);
+#else
+	ret = vga_arb_get_fb_range_from_tracker(&fb_start, &fb_end);
+#endif
+	if (!ret)
+		return false;
 
 	/* Does firmware framebuffer belong to us? */
 	pci_dev_for_each_resource(pdev, r) {
@@ -566,12 +645,10 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
 		if (!r->start || !r->end)
 			continue;
 
-		if (base < r->start || limit >= r->end)
-			continue;
-
-		return true;
+		if (fb_start >= r->start && fb_end <= r->end)
+			return true;
 	}
-#endif
+
 	return false;
 }
 
@@ -1555,3 +1632,35 @@ static int __init vga_arb_device_init(void)
 	return rc;
 }
 subsys_initcall_sync(vga_arb_device_init);
+
+static void vga_arb_firmware_fb_addr_tracker(struct pci_dev *pdev)
+{
+	resource_size_t fb_start;
+	resource_size_t fb_end;
+	unsigned int i;
+
+	if (!vga_arb_get_fb_range_from_screen_info(&fb_start, &fb_end))
+		return;
+
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		struct resource *ap = &pdev->resource[i];
+
+		if (resource_type(ap) != IORESOURCE_MEM)
+			continue;
+
+		if (!ap->start || !ap->end)
+			continue;
+
+		if (ap->start <= fb_start && fb_end <= ap->end) {
+			firmware_fb.pdev = pdev;
+			firmware_fb.bar = i;
+			firmware_fb.size = fb_end - fb_start + 1;
+			firmware_fb.offset = fb_start - ap->start;
+			firmware_fb.start = fb_start;
+			firmware_fb.end = fb_end;
+			break;
+		}
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
+			       8, vga_arb_firmware_fb_addr_tracker);
-- 
2.34.1

