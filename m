Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12A727F26
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 13:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D55D10E245;
	Thu,  8 Jun 2023 11:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F80E10E05D;
 Thu,  8 Jun 2023 11:43:32 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:48916.660287130
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 615DE10029E;
 Thu,  8 Jun 2023 19:43:27 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 e4cdf3a7b06f4b5690ebec352dc8a3cb for alexander.deucher@amd.com; 
 Thu, 08 Jun 2023 19:43:31 CST
X-Transaction-ID: e4cdf3a7b06f4b5690ebec352dc8a3cb
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
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
Subject: [PATCH v3 1/4] PCI/VGA: tidy up the code and comment format
Date: Thu,  8 Jun 2023 19:43:19 +0800
Message-Id: <20230608114322.604887-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230608114322.604887-1-15330273260@189.cn>
References: <20230608114322.604887-1-15330273260@189.cn>
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

This patch replaces the leading space with a tab and removes the double
blank line, no functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c   | 26 +++++++++++++-------------
 include/linux/vgaarb.h |  8 +++-----
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..bf2921e3cb06 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -61,7 +61,6 @@ static bool vga_arbiter_used;
 static DEFINE_SPINLOCK(vga_lock);
 static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
 
-
 static const char *vga_iostate_to_str(unsigned int iostate)
 {
 	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
@@ -80,7 +79,8 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
 {
 	/* we could in theory hand out locks on IO and mem
-	 * separately to userspace but it can cause deadlocks */
+	 * separately to userspace but it can cause deadlocks
+	 */
 	if (strncmp(buf, "none", 4) == 0) {
 		*io_state = VGA_RSRC_NONE;
 		return 1;
@@ -99,7 +99,7 @@ static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
 	return 1;
 }
 
-/* this is only used a cookie - it should not be dereferenced */
+/* This is only used as cookie, it should not be dereferenced */
 static struct pci_dev *vga_default;
 
 /* Find somebody in our list */
@@ -194,13 +194,15 @@ int vga_remove_vgacon(struct pci_dev *pdev)
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
 
@@ -1079,7 +1080,6 @@ static int vga_pci_str_to_vars(char *buf, int count, unsigned int *domain,
 	int n;
 	unsigned int slot, func;
 
-
 	n = sscanf(buf, "PCI:%x:%x:%x.%x", domain, bus, &slot, &func);
 	if (n != 4)
 		return 0;
@@ -1431,7 +1431,6 @@ static int vga_arb_open(struct inode *inode, struct file *file)
 	priv->cards[0].io_cnt = 0;
 	priv->cards[0].mem_cnt = 0;
 
-
 	return 0;
 }
 
@@ -1544,7 +1543,8 @@ static int __init vga_arb_device_init(void)
 	bus_register_notifier(&pci_bus_type, &pci_notifier);
 
 	/* We add all PCI devices satisfying VGA class in the arbiter by
-	 * default */
+	 * default
+	 */
 	pdev = NULL;
 	while ((pdev =
 		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
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

