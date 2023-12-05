Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5198062C6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 00:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E959A10E63F;
	Tue,  5 Dec 2023 23:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C1910E63F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 23:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SEYrcEs9MxnuTOU1kwL+n0OPPR/LYIWzA9eTewrMYPY=; b=SObVE2TCBYHgbbmFjoJeNCGm9G
 BZ24lj5KLBeeuSJxFwhACG1jROd/LhngIXfyubzMNcBJfsuUF4yQ3vEBQ0zQGoEa4xLtox29en7iU
 o1Rs9vobmt7Gd2IVeRKOOa5AL5bYea8wdjCh6ZTf1IaSpKqFbU3aYLCupWG+nbQ6du08dgV9C7/kl
 Cr5Y2JklH1RclinuMHYATN3ui8Z7kZtGKnHvrRDT4Ti7a5uztnOFWYtZRNk/NDB1NBTlzYF92NQxY
 PAcBLiNelsT56HDYWIHuqXw/zuVtr4eeCTg0Mgn2lT3wShEceYEHpyRGu2xY4I3ZZj/mtnXmc9fc1
 xYNYaPgw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rAecD-008ay2-0J; Tue, 05 Dec 2023 23:14:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: hgafb: fix kernel-doc comments
Date: Tue,  5 Dec 2023 15:14:08 -0800
Message-ID: <20231205231408.1234-1-rdunlap@infradead.org>
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
Cc: linux-nvidia@lists.surfsouth.com, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-fbdev@vger.kernel.org,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings found when using "W=1".

hgafb.c:370: warning: No description found for return value of 'hgafb_open'
hgafb.c:384: warning: No description found for return value of 'hgafb_release'
hgafb.c:406: warning: No description found for return value of 'hgafb_setcolreg'
hgafb.c:425: warning: No description found for return value of 'hgafb_pan_display'
hgafb.c:425: warning: expecting prototype for hga_pan_display(). Prototype was for hgafb_pan_display() instead
hgafb.c:455: warning: No description found for return value of 'hgafb_blank'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-nvidia@lists.surfsouth.com
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/hgafb.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff -- a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -364,6 +364,8 @@ error:
  *	hgafb_open - open the framebuffer device
  *	@info: pointer to fb_info object containing info for current hga board
  *	@init: open by console system or userland.
+ *
+ *	Returns: %0
  */
 
 static int hgafb_open(struct fb_info *info, int init)
@@ -378,6 +380,8 @@ static int hgafb_open(struct fb_info *in
  *	hgafb_release - open the framebuffer device
  *	@info: pointer to fb_info object containing info for current hga board
  *	@init: open by console system or userland.
+ *
+ *	Returns: %0
  */
 
 static int hgafb_release(struct fb_info *info, int init)
@@ -399,6 +403,8 @@ static int hgafb_release(struct fb_info
  *	This callback function is used to set the color registers of a HGA
  *	board. Since we have only two fixed colors only @regno is checked.
  *	A zero is returned on success and 1 for failure.
+ *
+ *	Returns: %0
  */
 
 static int hgafb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
@@ -410,14 +416,15 @@ static int hgafb_setcolreg(u_int regno,
 }
 
 /**
- *	hga_pan_display - pan or wrap the display
+ *	hgafb_pan_display - pan or wrap the display
  *	@var:contains new xoffset, yoffset and vmode values
  *	@info:pointer to fb_info object containing info for current hga board
  *
  *	This function looks only at xoffset, yoffset and the %FB_VMODE_YWRAP
  *	flag in @var. If input parameters are correct it calls hga_pan() to
  *	program the hardware. @info->var is updated to the new values.
- *	A zero is returned on success and %-EINVAL for failure.
+ *
+ *	Returns: %0 on success or %-EINVAL for failure.
  */
 
 static int hgafb_pan_display(struct fb_var_screeninfo *var,
@@ -449,6 +456,8 @@ static int hgafb_pan_display(struct fb_v
  *		@blank_mode == 2 means suspend vsync,
  *		@blank_mode == 3 means suspend hsync,
  *		@blank_mode == 4 means powerdown.
+ *
+ * Returns: %0
  */
 
 static int hgafb_blank(int blank_mode, struct fb_info *info)
