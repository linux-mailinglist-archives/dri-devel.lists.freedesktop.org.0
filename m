Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B4C5BE6F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE38910E9C3;
	Fri, 14 Nov 2025 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Fri, 14 Nov 2025 08:12:32 UTC
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79E310E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:12:32 +0000 (UTC)
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
 by APP-05 (Coremail) with SMTP id zQCowAAHC2wa4xZp1g63AA--.16037S2;
 Fri, 14 Nov 2025 16:06:53 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Antonino Daplas <adaplas@gmail.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] fbdev/riva: Add NULL checks for pci_get_domain_bus_and_slot()
Date: Fri, 14 Nov 2025 16:06:34 +0800
Message-ID: <20251114080634.2342-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHC2wa4xZp1g63AA--.16037S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr45GrykWw4ruF1xXF18Zrb_yoW8uF47pF
 Z3Za4agFWUtFnrtr4fGF9aqFy5WrW8JFWrK3ZIk34qvws8ArZrKry5KFy7Ga4FkrZ7Aw12
 kF90qa1qvrn5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
 IFyTuYvjfUjOzsDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUGA2kWr+KwGAAAsW
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

The pci_get_domain_bus_and_slot() function can return NULL
if the requested PCI device is not found. The
nForceUpdateArbitrationSettings() and nv10GetConfig()
do not check for this, which can lead to a NULL pointer dereference
when the returned pointer is used in pci_read_config_dword().

Add NULL checks immediately after the calls to
pci_get_domain_bus_and_slot() in both functions.

Fixes: e22810808354 ("video: fbdev: riva: deprecate pci_get_bus_and_slot()")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/video/fbdev/riva/riva_hw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
index 8b829b720064..5b2f2d57c101 100644
--- a/drivers/video/fbdev/riva/riva_hw.c
+++ b/drivers/video/fbdev/riva/riva_hw.c
@@ -1100,6 +1100,10 @@ static void nForceUpdateArbitrationSettings
 	int domain = pci_domain_nr(pdev->bus);

 	dev = pci_get_domain_bus_and_slot(domain, 0, 3);
+	if (!dev) {
+		WARN_ON(1);
+		return;
+	}
 	pci_read_config_dword(dev, 0x6C, &uMClkPostDiv);
 	pci_dev_put(dev);
 	uMClkPostDiv = (uMClkPostDiv >> 8) & 0xf;
@@ -1115,6 +1119,10 @@ static void nForceUpdateArbitrationSettings
 	sim_data.enable_mp      = 0;

 	dev = pci_get_domain_bus_and_slot(domain, 0, 1);
+	if (!dev) {
+		WARN_ON(1);
+		return;
+	}
 	pci_read_config_dword(dev, 0x7C, &sim_data.memory_type);
 	pci_dev_put(dev);
 	sim_data.memory_type    = (sim_data.memory_type >> 12) & 1;
@@ -2085,11 +2093,19 @@ static void nv10GetConfig
 	 */
 	if(chipset == NV_CHIP_IGEFORCE2) {
 		dev = pci_get_domain_bus_and_slot(domain, 0, 1);
+		if (!dev) {
+			WARN_ON(1);
+			return;
+		}
 		pci_read_config_dword(dev, 0x7C, &amt);
 		pci_dev_put(dev);
 		chip->RamAmountKBytes = (((amt >> 6) & 31) + 1) * 1024;
 	} else if(chipset == NV_CHIP_0x01F0) {
 		dev = pci_get_domain_bus_and_slot(domain, 0, 1);
+		if (!dev) {
+			WARN_ON(1);
+			return;
+		}
 		pci_read_config_dword(dev, 0x84, &amt);
 		pci_dev_put(dev);
 		chip->RamAmountKBytes = (((amt >> 4) & 127) + 1) * 1024;
-- 
2.50.1.windows.1

