Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339B81549A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 00:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F7110EAA7;
	Fri, 15 Dec 2023 23:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D6E10EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 23:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TfwCAA9rMzkhfqrrIg704MCtQiFwiMoz9kpT2FQboTI=; b=l0ByrVu7BkDBMKvnQ2RLOLYv8q
 b3X/1R/EdNoP5+MFQp8UqtS7rO562f040IgJk93pXEmTu7ND2Ap43Q3x/6wdBNJSqM0QfvxEqpsxv
 I9pjmWx5IbLhzoZ9I/piKUjuf5B+uqe/xtJbNN0K/TGwBlVvWRLF0uwv1Uh6VcKjqE9aTrYpCjL9T
 QNFFsSxWhXOKUdk1021kyLXkYCf6M06RUAnXF+Am5jw8Hkfx9ou/HM1NBLLTkBbLkCHGTDyf0u2E5
 b98Z0o3tAvt9sU3+r49aFgXh7SZRBIlE2BpufcDNP1VfkpBPt99eL5e4Is82eVkGRcLwj76ulUtxj
 oHASiC1Q==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEHnj-004sOp-1A; Fri, 15 Dec 2023 23:41:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: fix all kernel-doc warnings in stdu
Date: Fri, 15 Dec 2023 15:41:02 -0800
Message-ID: <20231215234102.16574-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel test robot reports one kernel-doc warning in stdu, but
running scripts/kernel-doc in -Wall mode reports several more,
so fix all of them at one time:

vmwgfx_stdu.c:76: warning: Excess struct member 'transfer' description in 'vmw_stdu_dirty'
vmwgfx_stdu.c:103: warning: missing initial short description on line:
 * struct vmw_screen_target_display_unit
vmwgfx_stdu.c:215: warning: No description found for return value of 'vmw_stdu_bind_st'
vmwgfx_stdu.c:320: warning: No description found for return value of 'vmw_stdu_destroy_st'
vmwgfx_stdu.c:551: warning: No description found for return value of 'vmw_kms_stdu_readback'
vmwgfx_stdu.c:719: warning: No description found for return value of 'vmw_kms_stdu_surface_dirty'
vmwgfx_stdu.c:895: warning: No description found for return value of 'vmw_stdu_primary_plane_prepare_fb'
vmwgfx_stdu.c:1470: warning: No description found for return value of 'vmw_stdu_init'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312150347.5icezNlK-lkp@intel.com/
Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff -- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -53,7 +53,6 @@ enum stdu_content_type {
  * struct vmw_stdu_dirty - closure structure for the update functions
  *
  * @base: The base type we derive from. Used by vmw_kms_helper_dirty().
- * @transfer: Transfer direction for DMA command.
  * @left: Left side of bounding box.
  * @right: Right side of bounding box.
  * @top: Top side of bounding box.
@@ -100,7 +99,7 @@ struct vmw_stdu_update_gb_image {
 };
 
 /**
- * struct vmw_screen_target_display_unit
+ * struct vmw_screen_target_display_unit - conglomerated STDU structure
  *
  * @base: VMW specific DU structure
  * @display_srf: surface to be displayed.  The dimension of this will always
@@ -208,6 +207,8 @@ static int vmw_stdu_define_st(struct vmw
  * @res: Buffer to bind to the screen target.  Set to NULL to blank screen.
  *
  * Binding a surface to a Screen Target the same as flipping
+ *
+ * Returns: %0 on success or -errno code on failure
  */
 static int vmw_stdu_bind_st(struct vmw_private *dev_priv,
 			    struct vmw_screen_target_display_unit *stdu,
@@ -314,6 +315,9 @@ static int vmw_stdu_update_st(struct vmw
  *
  * @dev_priv:  VMW DRM device
  * @stdu: display unit to destroy
+ *
+ * Returns: %0 on success, negative error code on failure. -ERESTARTSYS if
+ * interrupted.
  */
 static int vmw_stdu_destroy_st(struct vmw_private *dev_priv,
 			       struct vmw_screen_target_display_unit *stdu)
@@ -536,7 +540,8 @@ static void vmw_stdu_bo_cpu_commit(struc
  * If DMA-ing till the screen target system, the function will also notify
  * the screen target system that a bounding box of the cliprects has been
  * updated.
- * Returns 0 on success, negative error code on failure. -ERESTARTSYS if
+ *
+ * Returns: %0 on success, negative error code on failure. -ERESTARTSYS if
  * interrupted.
  */
 int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
@@ -703,7 +708,7 @@ static void vmw_kms_stdu_surface_fifo_co
  * case the device has already synchronized.
  * @crtc: If crtc is passed, perform surface dirty on that crtc only.
  *
- * Returns 0 on success, negative error code on failure. -ERESTARTSYS if
+ * Returns: %0 on success, negative error code on failure. -ERESTARTSYS if
  * interrupted.
  */
 int vmw_kms_stdu_surface_dirty(struct vmw_private *dev_priv,
@@ -887,7 +892,7 @@ vmw_stdu_primary_plane_cleanup_fb(struct
  * backed by a buffer object.  The display surface is pinned here, and it'll
  * be unpinned in .cleanup_fb()
  *
- * Returns 0 on success
+ * Returns: %0 on success
  */
 static int
 vmw_stdu_primary_plane_prepare_fb(struct drm_plane *plane,
@@ -1465,6 +1470,8 @@ static const struct drm_crtc_helper_func
  * This function is called once per CRTC, and allocates one Screen Target
  * display unit to represent that CRTC.  Since the SVGA device does not separate
  * out encoder and connector, they are represented as part of the STDU as well.
+ *
+ * Returns: %0 on success or -errno code on failure
  */
 static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 {
