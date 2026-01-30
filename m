Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIxgA5zKfGnaOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:13:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FACBBE7D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0410E36E;
	Fri, 30 Jan 2026 15:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WckZx/u5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F27910E36E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786007; x=1801322007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dwR8c/UokB19uwapBHhtnhWTa9GSBp6xCHP6I8zZ5L4=;
 b=WckZx/u5zxcasA1PYCpulVqhPrm4mm1G2bAJiPFPKrZEDEDRafBai5I+
 Jf2TC27++EnLrRElNYhDAr4wrnk+/+Kh935eQQe8DYQJMzEtL+GjGVESR
 iyFJqyVZ8xPfDDdfOeIEH6T/X0do5CuRAQiMvYYs19oaX77nUiD4zHQ0G
 wiDeQIl4yy+ogOez57w1zxsoxoVqT+STP9fs3KBzo9FFGIwCkzBagC3Ct
 ZoR6X7aYMFhyIU7Izet5quHXDC8wkbQL5HGxJ09LrR4+mhvEWekcHT2L9
 89rjf0w+DwpJK3jM0Tsjle3Ea9NpgBp8HraorljjEVsLluaI5cxptX0++ w==;
X-CSE-ConnectionGUID: Y3WZGxcDRn6VWCP/6YJBNA==
X-CSE-MsgGUID: QdDn/PztSBiVYymbOpkFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82147009"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82147009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:13:26 -0800
X-CSE-ConnectionGUID: 3+Fup7SWShyMHe88eiH1jw==
X-CSE-MsgGUID: IGXoCrsvTN+n6minbf+XRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208871170"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:13:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH] Revert "drm/gma500: use drm_crtc_vblank_crtc()"
Date: Fri, 30 Jan 2026 17:13:19 +0200
Message-ID: <20260130151319.31264-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,suse.de,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 51FACBBE7D
X-Rspamd-Action: no action

This reverts commit d930ffa5d6e8867a290db9c6aad1c62731aeb2c3.

According to Thomas, commit d930ffa5d6e8 ("drm/gma500: use
drm_crtc_vblank_crtc()") breaks the driver with a NULL-ptr oops on
startup. This is because the IRQ initialization in gma_irq_install() now
uses CRTCs that are only allocated later in psb_modeset_init(). Stack
trace is below. Revert. Go back to the drawing board.

[   65.831766] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000021: 0000 [#1] SMP KASAN NOPTI
[   65.832114] KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
[   65.832232] CPU: 1 UID: 0 PID: 296 Comm: (udev-worker) Tainted: G         E       6.19.0-rc6-1-default+ #4622 PREEMPT(voluntary)
[   65.832376] Tainted: [E]=UNSIGNED_MODULE
[   65.832448] Hardware name:  /DN2800MT, BIOS MTCDT10N.86A.0164.2012.1213.1024 12/13/2012
[   65.832543] RIP: 0010:drm_crtc_vblank_crtc+0x24/0xd0
[   65.832652] Code: 90 90 90 90 90 90 0f 1f 44 00 00 48 89 f8 48 81 c7
18 01 00 00 48 83 ec 10 48 ba 00 00 00 00 00 fc ff df 48 89 f9 48 c1 e9
03 <0f> b6 14 11 84 d2 74 05 80 fa 03 7e 58 48 89 c6 8b 90 18 01 00
00
[   65.832820] RSP: 0018:ffff88800c8f7688 EFLAGS: 00010006
[   65.832919] RAX: fffffffffffffff0 RBX: ffff88800fff4928 RCX: 0000000000000021
[   65.833011] RDX: dffffc0000000000 RSI: ffffc90000978130 RDI: 0000000000000108
[   65.833107] RBP: ffffed1001ffea03 R08: 0000000000000000 R09: ffffed100191eec7
[   65.833199] R10: 0000000000000001 R11: 0000000000000001 R12: ffff8880014480c8
[   65.833289] R13: dffffc0000000000 R14: fffffffffffffff0 R15: ffff88800fff4000
[   65.833380] FS:  00007fe53d4d5d80(0000) GS:ffff888148dd8000(0000) knlGS:0000000000000000
[   65.833488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   65.833575] CR2: 00007fac707420b8 CR3: 000000000ebd1000 CR4: 00000000000006f0
[   65.833668] Call Trace:
[   65.833735]  <TASK>
[   65.833808]  gma_irq_preinstall+0x190/0x3e0 [gma500_gfx]
[   65.834054]  gma_irq_install+0xb2/0x240 [gma500_gfx]
[   65.834282]  psb_driver_load+0x7b2/0x1090 [gma500_gfx]
[   65.834516]  ? __pfx_psb_driver_load+0x10/0x10 [gma500_gfx]
[   65.834726]  ? ksize+0x1d/0x40
[   65.834817]  ? drmm_add_final_kfree+0x3b/0xb0
[   65.834935]  ? __pfx_psb_pci_probe+0x10/0x10 [gma500_gfx]
[   65.835164]  psb_pci_probe+0xc8/0x150 [gma500_gfx]
[   65.835384]  local_pci_probe+0xd5/0x190
[   65.835492]  pci_call_probe+0x167/0x4b0
[   65.835594]  ? __pfx_pci_call_probe+0x10/0x10
[   65.835693]  ? local_clock+0x11/0x30
[   65.835808]  ? __pfx___driver_attach+0x10/0x10
[   65.835915]  ? do_raw_spin_unlock+0x55/0x230
[   65.836014]  ? pci_match_device+0x303/0x790
[   65.836124]  ? pci_match_device+0x386/0x790
[   65.836226]  ? __pfx_pci_assign_irq+0x10/0x10
[   65.836320]  ? kernfs_create_link+0x16a/0x230
[   65.836418]  ? do_raw_spin_unlock+0x55/0x230
[   65.836526]  ? __pfx___driver_attach+0x10/0x10
[   65.836626]  pci_device_probe+0x175/0x2c0
[   65.836735]  call_driver_probe+0x64/0x1e0
[   65.836842]  really_probe+0x194/0x740
[   65.836951]  ? __pfx___driver_attach+0x10/0x10
[   65.837053]  __driver_probe_device+0x18c/0x3a0
[   65.837163]  ? __pfx___driver_attach+0x10/0x10
[   65.837262]  driver_probe_device+0x4a/0x120
[   65.837369]  __driver_attach+0x19c/0x550
[   65.837474]  ? __pfx___driver_attach+0x10/0x10
[   65.837575]  bus_for_each_dev+0xe6/0x150
[   65.837669]  ? local_clock+0x11/0x30
[   65.837770]  ? __pfx_bus_for_each_dev+0x10/0x10
[   65.837891]  bus_add_driver+0x2af/0x4f0
[   65.838000]  ? __pfx_psb_init+0x10/0x10 [gma500_gfx]
[   65.838236]  driver_register+0x19f/0x3a0
[   65.838342]  ? rcu_is_watching+0x11/0xb0
[   65.838446]  do_one_initcall+0xb5/0x3a0
[   65.838546]  ? __pfx_do_one_initcall+0x10/0x10
[   65.838644]  ? __kasan_slab_alloc+0x2c/0x70
[   65.838741]  ? rcu_is_watching+0x11/0xb0
[   65.838837]  ? __kmalloc_cache_noprof+0x3e8/0x6e0
[   65.838937]  ? klp_module_coming+0x1a0/0x2e0
[   65.839033]  ? do_init_module+0x85/0x7f0
[   65.839126]  ? kasan_unpoison+0x40/0x70
[   65.839230]  do_init_module+0x26e/0x7f0
[   65.839341]  ? __pfx_do_init_module+0x10/0x10
[   65.839450]  init_module_from_file+0x13f/0x160
[   65.839549]  ? __pfx_init_module_from_file+0x10/0x10
[   65.839651]  ? __lock_acquire+0x578/0xae0
[   65.839791]  ? do_raw_spin_unlock+0x55/0x230
[   65.839886]  ? idempotent_init_module+0x585/0x720
[   65.839993]  idempotent_init_module+0x1ff/0x720
[   65.840097]  ? __pfx_cred_has_capability.isra.0+0x10/0x10
[   65.840211]  ? __pfx_idempotent_init_module+0x10/0x10

Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Closes: https://lore.kernel.org/r/5aec1964-072c-4335-8f37-35e6efb4910e@suse.de
Fixes: d930ffa5d6e8 ("drm/gma500: use drm_crtc_vblank_crtc()")
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/gma500/psb_irq.c | 36 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 3a946b472064..c224c7ff353c 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -250,7 +250,6 @@ static irqreturn_t gma_irq_handler(int irq, void *arg)
 void gma_irq_preinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct drm_crtc *crtc;
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
@@ -261,15 +260,10 @@ void gma_irq_preinstall(struct drm_device *dev)
 	PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
 	PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
 
-	drm_for_each_crtc(crtc, dev) {
-		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-
-		if (vblank->enabled) {
-			u32 mask = drm_crtc_index(crtc) ? _PSB_VSYNC_PIPEB_FLAG :
-				_PSB_VSYNC_PIPEA_FLAG;
-			dev_priv->vdc_irq_mask |= mask;
-		}
-	}
+	if (dev->vblank[0].enabled)
+		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEA_FLAG;
+	if (dev->vblank[1].enabled)
+		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEB_FLAG;
 
 	/* Revisit this area - want per device masks ? */
 	if (dev_priv->ops->hotplug)
@@ -284,8 +278,8 @@ void gma_irq_preinstall(struct drm_device *dev)
 void gma_irq_postinstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct drm_crtc *crtc;
 	unsigned long irqflags;
+	unsigned int i;
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
@@ -298,13 +292,11 @@ void gma_irq_postinstall(struct drm_device *dev)
 	PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	drm_for_each_crtc(crtc, dev) {
-		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-
-		if (vblank->enabled)
-			gma_enable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
+	for (i = 0; i < dev->num_crtcs; ++i) {
+		if (dev->vblank[i].enabled)
+			gma_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
 		else
-			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
+			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
 	}
 
 	if (dev_priv->ops->hotplug_enable)
@@ -345,8 +337,8 @@ void gma_irq_uninstall(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct drm_crtc *crtc;
 	unsigned long irqflags;
+	unsigned int i;
 
 	if (!dev_priv->irq_enabled)
 		return;
@@ -358,11 +350,9 @@ void gma_irq_uninstall(struct drm_device *dev)
 
 	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
 
-	drm_for_each_crtc(crtc, dev) {
-		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
-
-		if (vblank->enabled)
-			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);
+	for (i = 0; i < dev->num_crtcs; ++i) {
+		if (dev->vblank[i].enabled)
+			gma_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
 	}
 
 	dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |
-- 
2.47.3

