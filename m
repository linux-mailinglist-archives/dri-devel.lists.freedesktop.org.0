Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617C721A06
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C1710E041;
	Sun,  4 Jun 2023 20:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA64F10E041;
 Sun,  4 Jun 2023 20:55:39 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxZ_FJ+nxkV2gEAA--.9186S3;
 Mon, 05 Jun 2023 04:55:37 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxLL5I+nxkF7SJAA--.24647S2; 
 Mon, 05 Jun 2023 04:55:36 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, Li Yi <liyi@loongson.cn>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Abhishek Sahu <abhsahu@nvidia.com>,
 Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v2 1/2] vgaarb: various coding style and comments fix
Date: Mon,  5 Jun 2023 04:55:35 +0800
Message-Id: <20230604205536.3357439-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxLL5I+nxkF7SJAA--.24647S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXw4kur1fXFWrtrW3ZrWDurg_yoWrKw1Upr
 Zakas8CrW8XFs7ZrsrXF4rGF1Y9393CFyfArWakwn3AF15JFn2qF9YyryYv3yfJ392kF4I
 qan8tF4UuF4UJFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2kK
 e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
 aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
 kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
 1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
 1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
 YxBIdaVFxhVjvjDU0xZFpf9x07j0mhrUUUUU=
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To keep consistent with vga_iostate_to_str() function, the third argument
of vga_str_to_iostate() function should be 'unsigned int *'.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c   | 29 +++++++++++++++--------------
 include/linux/vgaarb.h |  8 +++-----
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..e40e6e5e5f03 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -61,7 +61,6 @@ static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
 
-
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
 	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
@@ -77,10 +76,12 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 	return "none";
 }
 
-static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
+static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 {
-	/* we could in theory hand out locks on IO and mem
-	 * separately to userspace but it can cause deadlocks */
+	/*
+	 * we could in theory hand out locks on IO and mem
+	 * separately to userspace but it can cause deadlocks
+	 */
 	if (strncmp(buf, "none", 4) == 0) {
 		*io_state = VGA_RSRC_NONE;
 		return 1;
@@ -99,7 +100,7 @@ static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
 	return 1;
 }
 
-/* this is only used a cookie - it should not be dereferenced */
+/* This is only used as cookie, it should not be dereferenced */
 static struct pci_dev *vga_default;
 
 /* Find somebody in our list */
@@ -194,13 +195,15 @@ int vga_remove_vgacon(struct pci_dev *pdev)
 EXPORT_SYMBOL(vga_remove_vgacon);
 
 /* If we don't ever use VGA arb we should avoid
-   turning off anything anywhere due to old X servers getting
-   confused about the boot device not being VGA */
+ * turning off anything anywhere due to old X servers getting
+ * confused about the boot device not being VGA
+ */
 static void vga_check_first_use(void)
 {
 	/* we should inform all GPUs in the system that
 	 * VGA arb has occurred and to try and disable resources
-	 * if they can */
+	 * if they can
+	 */
 	if (!vga_arbiter_used) {
 		vga_arbiter_used = true;
 		vga_arbiter_notify_clients();
@@ -865,8 +868,7 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 }
 
 /* this is called with the lock */
-static inline void vga_update_device_decodes(struct vga_device *vgadev,
-					     int new_decodes)
+static void vga_update_device_decodes(struct vga_device *vgadev, int new_decodes)
 {
 	struct device *dev = &vgadev->pdev->dev;
 	int old_decodes, decodes_removed, decodes_unlocked;
@@ -956,9 +958,9 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
  * @set_decode callback: If a client can disable its GPU VGA resource, it
  * will get a callback from this to set the encode/decode state.
  *
- * Rationale: we cannot disable VGA decode resources unconditionally some single
- * GPU laptops seem to require ACPI or BIOS access to the VGA registers to
- * control things like backlights etc.  Hopefully newer multi-GPU laptops do
+ * Rationale: we cannot disable VGA decode resources unconditionally, some
+ * single GPU laptops seem to require ACPI or BIOS access to the VGA registers
+ * to control things like backlights etc. Hopefully newer multi-GPU laptops do
  * something saner, and desktops won't have any special ACPI for this. The
  * driver will get a callback when VGA arbitration is first used by userspace
  * since some older X servers have issues.
@@ -988,7 +990,6 @@ int vga_client_register(struct pci_dev *pdev,
 bail:
 	spin_unlock_irqrestore(&vga_lock, flags);
 	return ret;
-
 }
 EXPORT_SYMBOL(vga_client_register);
 
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index b4b9137f9792..d36225c582ee 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -23,9 +23,7 @@
  * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS
- * IN THE SOFTWARE.
- *
+ * DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef LINUX_VGA_H
@@ -96,7 +94,7 @@ static inline int vga_client_register(struct pci_dev *pdev,
 static inline int vga_get_interruptible(struct pci_dev *pdev,
 					unsigned int rsrc)
 {
-       return vga_get(pdev, rsrc, 1);
+	return vga_get(pdev, rsrc, 1);
 }
 
 /**
@@ -111,7 +109,7 @@ static inline int vga_get_interruptible(struct pci_dev *pdev,
 static inline int vga_get_uninterruptible(struct pci_dev *pdev,
 					  unsigned int rsrc)
 {
-       return vga_get(pdev, rsrc, 0);
+	return vga_get(pdev, rsrc, 0);
 }
 
 static inline void vga_client_unregister(struct pci_dev *pdev)
-- 
2.25.1

