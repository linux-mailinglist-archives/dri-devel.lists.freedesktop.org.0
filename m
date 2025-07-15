Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F0B052FB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B219C10E52B;
	Tue, 15 Jul 2025 07:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="M06Z8Xaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 652 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 07:24:55 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB6110E52B;
 Tue, 15 Jul 2025 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1752564284;
 bh=RFKqX/8jGLZ0gCM1lRc1v1zeuP3fiXSjkW615zWkF/8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=M06Z8Xaa3H9UGN+wlX1SJxPTW0EF8SFkXbGXhRh4k1L0GLcDiPMNP7AiuZTTxC5SY
 oG9nNh2n1fX/kNzeWixIVNSYb+joWKceoo42oTe9QVycOtVZgiMBuQFGZSwc3gqHO/
 5xb3uwD5ljY7DSL9kJQA34fXF1Ia5SpH0WDdtH/U=
X-QQ-mid: zesmtpip3t1752563587t54e86ea1
X-QQ-Originating-IP: LAPbbLpI8/WwODO7cz/sB4Ix6FIzw86cgmvoh1lVP0U=
Received: from avenger-e500 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 15:13:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14369993403465055196
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, dave@stgolabs.net,
 jonathan.cameron@huawei.com, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com,
 dan.j.williams@intel.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, marcin.s.wojtas@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, arend.vanspriel@broadcom.com,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 akpm@linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, wangyuli@uniontech.com,
 ming.li@zohomail.com, linux-cxl@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, kvalo@kernel.org, johannes.berg@intel.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com,
 jeff.johnson@oss.qualcomm.com, mingo@kernel.org, j@jannau.net,
 linux@treblig.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 shenlichuan@vivo.com, yujiaoliang@vivo.com, colin.i.king@gmail.com,
 cvam0000@gmail.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
Subject: [PATCH] treewide: Fix typo "notifer"
Date: Tue, 15 Jul 2025 15:12:45 +0800
Message-ID: <B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MrjoWMNJTZwvsGTYCiR6JF36cJxQTyzygkbYXsNOVebz53bxTJ8zwvyf
 f2RqFUgVPqbF/zsG6AxWtzNHh32IKOLpXuxZoBo5Z194inFkMsuf6Fhij3z7Y7pC8/SHJ4E
 G4fX+l+elLG9oSeUW0xo7Q1sbF89hvDmKT5ZshVOqcS9q/24wOWTRrRaPlJJFhXNsm96Az4
 Vssbjpg2fU0pDrEIX3Ip/tzbS3zlMj9rpSzvZfW92lzlcIGD3yQneZqnIDVhP6aou9JGSaX
 odO7gGzkA63o2/Koa6C1HaIAqxM6UF2clfx4tEg/XuwPehm8u6Im5KiokX5NVhyRDFJThBO
 9THakKSVQw2LqXnhnVR3iIr0cmkiALBb9PNJiP3yCrYO5v8KNEyRCqVcs9nXs3FZn77p1ga
 h93qVlSVlGK+WQBCbPPIz140gjvATkgNlHmHAaLxyQASV1crTgiOwvxeyAo27JHKB2gYl18
 A4QLhSxONbfRNtB9taWdnAL43arCqP6CIRqbXG9zJNp+byh2BiQo3w7iLEdP5Yen1R2lr2L
 H424DwgDyP8TwtsTWOn+bEE+i1quzgscO02UPytJlds4HXk8E8/p2qpm7KMy3SpDdFOtz4p
 R+Uga/rB/bGKUSibeXKdi5haITCpRx06HfXSy4kqU0/kcRqMFjIA2dRlHvK/gHlub6GLbkQ
 8jMDiMzqITnKbwLSJH5x+gkPCnPCO62cj8OezUSUvXHEAdRWKAup0XPNRYl879LjtzYTtk+
 ZOAYzzXikseqjvdHvd0dW8lcp+ksdkZaMbZfmOJXUfV2Zq8TZGECFIRqKLNktWgZytnTJ+w
 wPZlJWNTr17cLotZB1hgoFueiqyi64gJ7Y3kehfnhH22REHo9pgURGuJWn0Ge+zJLq0n4UQ
 WsnaQSsOTaKn8E2g8A4P8G/nrOQvYrYUAO9igrSNYJ+XJXaDOI0g+CSR9QvF1a8P2RhpxTo
 jYVJsv3I4p+U5O0PW9WpboULdIWkTXPw4jJp6eXreKHxX5/4BPis2F2omKXzHLAFlcpy2c3
 vga7r17j6fFbqfvlW/FEbYF3wrS35grn2ifaxSkssVIRs9tD1/
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
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

There are some spelling mistakes of 'notifer' in comments which
should be 'notifier'.

Fix them and add it to scripts/spelling.txt.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/x86/kvm/i8254.c                                        | 4 ++--
 drivers/cxl/core/mce.h                                      | 2 +-
 drivers/gpu/drm/xe/xe_vm_types.h                            | 2 +-
 drivers/net/ethernet/marvell/mvneta.c                       | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 drivers/tty/serial/8250/8250_dw.c                           | 2 +-
 include/xen/xenbus.h                                        | 2 +-
 scripts/spelling.txt                                        | 1 +
 8 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 739aa6c0d0c3..9ff55112900a 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -641,7 +641,7 @@ static void kvm_pit_reset(struct kvm_pit *pit)
 	kvm_pit_reset_reinject(pit);
 }
 
-static void pit_mask_notifer(struct kvm_irq_mask_notifier *kimn, bool mask)
+static void pit_mask_notifier(struct kvm_irq_mask_notifier *kimn, bool mask)
 {
 	struct kvm_pit *pit = container_of(kimn, struct kvm_pit, mask_notifier);
 
@@ -694,7 +694,7 @@ struct kvm_pit *kvm_create_pit(struct kvm *kvm, u32 flags)
 
 	pit_state->irq_ack_notifier.gsi = 0;
 	pit_state->irq_ack_notifier.irq_acked = kvm_pit_ack_irq;
-	pit->mask_notifier.func = pit_mask_notifer;
+	pit->mask_notifier.func = pit_mask_notifier;
 
 	kvm_pit_reset(pit);
 
diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
index ace73424eeb6..ca272e8db6c7 100644
--- a/drivers/cxl/core/mce.h
+++ b/drivers/cxl/core/mce.h
@@ -7,7 +7,7 @@
 
 #ifdef CONFIG_CXL_MCE
 int devm_cxl_register_mce_notifier(struct device *dev,
-				   struct notifier_block *mce_notifer);
+				   struct notifier_block *mce_notifier);
 #else
 static inline int
 devm_cxl_register_mce_notifier(struct device *dev,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1979e9bdbdf3..0ca27579fd1f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -259,7 +259,7 @@ struct xe_vm {
 		 * up for revalidation. Protected from access with the
 		 * @invalidated_lock. Removing items from the list
 		 * additionally requires @lock in write mode, and adding
-		 * items to the list requires either the @userptr.notifer_lock in
+		 * items to the list requires either the @userptr.notifier_lock in
 		 * write mode, OR @lock in write mode.
 		 */
 		struct list_head invalidated;
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 147571fdada3..ee4696600146 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4610,7 +4610,7 @@ static int mvneta_stop(struct net_device *dev)
 		/* Inform that we are stopping so we don't want to setup the
 		 * driver for new CPUs in the notifiers. The code of the
 		 * notifier for CPU online is protected by the same spinlock,
-		 * so when we get the lock, the notifer work is done.
+		 * so when we get the lock, the notifier work is done.
 		 */
 		spin_lock(&pp->lock);
 		pp->is_stopped = true;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b94c3619526c..bcd56c7c4e42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8313,7 +8313,7 @@ struct brcmf_cfg80211_info *brcmf_cfg80211_attach(struct brcmf_pub *drvr,
 	cfg->d11inf.io_type = (u8)io_type;
 	brcmu_d11_attach(&cfg->d11inf);
 
-	/* regulatory notifer below needs access to cfg so
+	/* regulatory notifier below needs access to cfg so
 	 * assign it now.
 	 */
 	drvr->config = cfg;
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..6d9af6417620 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -392,7 +392,7 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
 		/*
-		 * Note that any clock-notifer worker will block in
+		 * Note that any clock-notifier worker will block in
 		 * serial8250_update_uartclk() until we are done.
 		 */
 		ret = clk_set_rate(d->clk, newrate);
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 3f90bdd387b6..00b84f2e402b 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -180,7 +180,7 @@ int xenbus_printf(struct xenbus_transaction t,
  * sprintf-style type string, and pointer. Returns 0 or errno.*/
 int xenbus_gather(struct xenbus_transaction t, const char *dir, ...);
 
-/* notifer routines for when the xenstore comes up */
+/* notifier routines for when the xenstore comes up */
 extern int xenstored_ready;
 int register_xenstore_notifier(struct notifier_block *nb);
 void unregister_xenstore_notifier(struct notifier_block *nb);
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index c9a6df5be281..d824c4b17390 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1099,6 +1099,7 @@ notication||notification
 notications||notifications
 notifcations||notifications
 notifed||notified
+notifer||notifier
 notity||notify
 notfify||notify
 nubmer||number
-- 
2.50.0

