Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170476E2CB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0724A10E5C2;
	Thu,  3 Aug 2023 08:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58D5110E5C2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:18:01 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxfOq2Ystk3pEPAA--.9103S3;
 Thu, 03 Aug 2023 16:17:58 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM62YstkmOdGAA--.51590S2; 
 Thu, 03 Aug 2023 16:17:58 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: suijingfeng@loongson.cn
Subject: [PATCH] PCI/VGA: Make the vga_is_firmware_default() arch-independent
Date: Thu,  3 Aug 2023 16:17:58 +0800
Message-Id: <20230803081758.968742-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801183706.702567-1-suijingfeng@loongson.cn>
References: <20230801183706.702567-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxrM62YstkmOdGAA--.51590S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ww1fGrW7ZF15CrWkCFyfGrX_yoWxAF1kpF
 Z3AFWrtrs8Gw4fJrsxGF48Xw1rursYvFW7KFW7Z3Z3Ja43urykKr4FyFWDtryfJ39rJw4a
 gF12yr1rGFsrXFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=
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
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the vga_is_firmware_default() function works on x86 and IA64
architectures, but it is a no-op on ARM64, PPC, RISC-V, etc. This patch
completes the implementation by tracking the firmware framebuffer's address
range. The added code is trying to identify the VRAM aperture that contains
the firmware framebuffer. Once found, related information about the VRAM
aperture will be tracked.

Note that the initial VRAM aperture (the one that contains firmware fb)
identification should be done before the PCI resource relocation. This is
because we need to lock the VRAM aperture before it is moved. We achieve
this by using DECLARE_PCI_FIXUP_CLASS_HEADER(), which ensures that
vga_arb_firmware_fb_addr_tracker() gets called before PCI resource
allocation.

This patch overcame the VRAM bar relocation issue by updating the cached
firmware framebuffer's address range accordingly if the VRAM bar of the
primary GPU do moved. We achieve that by monitoring the address changes of
the VRAM aperture.

This patch make the vga_is_firmware_default() function works on whatever
arch that has UEFI GOP support, including x86 and IA64. But at the first
step, we make it available only on platforms which PCI resource relocation
do happens. Once provided to be effective and reliable, it can be expanded
to other arch easily.

This patch is tested on LS3A5000+LS7A2000 platform and LS3A5000+LS7A1000
platform. This patch can be applied on pci-next (6.5.0-rc1+) branch cleanly

v2:
	* Fix test robot warnnings and fix typos

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 140 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..1f2d464e5812 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -61,6 +61,82 @@ static bool vga_arbiter_used;
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
+	 * No firmware framebuffer support or no aperture that contains the
+	 * firmware FB is found. In this case, the firmware_fb.pdev will be
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
+		vgaarb_dbg(&pdev->dev,
+			   "[0x%llx, 0x%llx] -> [0x%llx, 0x%llx]\n",
+			   (u64)old_fb_start, (u64)old_fb_end,
+			   (u64)firmware_fb.start, (u64)firmware_fb.end);
+	}
+
+	*start = firmware_fb.start;
+	*end = firmware_fb.end;
+
+	return true;
+}
 
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
@@ -543,20 +619,21 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
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
-
-	/* Select the device owning the boot framebuffer if there is one */
+	resource_size_t fb_start;
+	resource_size_t fb_end;
+	bool ret;
 
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
@@ -566,12 +643,10 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
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
 
@@ -1555,3 +1630,38 @@ static int __init vga_arb_device_init(void)
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
+
+			vgaarb_dbg(&pdev->dev,
+				   "BAR %u contains firmware FB\n", i);
+			break;
+		}
+	}
+}
+DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_DISPLAY_VGA,
+			       8, vga_arb_firmware_fb_addr_tracker);
-- 
2.34.1

