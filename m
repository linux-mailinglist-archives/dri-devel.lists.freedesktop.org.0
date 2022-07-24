Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6957FA1C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26443113D70;
	Mon, 25 Jul 2022 07:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258B5BF056
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 07:39:23 +0000 (UTC)
X-QQ-mid: bizesmtp84t1658648357tnyquacb
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:39:16 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: TXoNPSSaW4mNzmGZcubrXkzakWZSv2BucF8BlpBbW7QbtIbl1t+jzX3FJ+cT6
 FTE1gmNTsd4afLdOZZlklAlQm7ytCv3CKyKh98e+mY0pWl3MWinQbqdMQGzTp5oPfD5RPy8
 MfVajVY2J/sh9IWZSpS0y8dyfhHFNJIZsuQfI0TXZwlHmNdi0e3WDVR7FbiXAUR2fjgCP3Y
 wA7uZWy6EwGiwhDfebyDfU33j0jw3aci3pI/xrrRMpJzT1e/dPKEY8r4BGQkFpfG0MLBLz+
 OKCQTjPqySWTJAtajaaRWA8a4sF4Wd45jtBymRFgPH4rpQKa44DONFW8qpZpb0Fxj82pBnl
 aCkVqdbnUUQ3YzXYoAaCqfALnrGYNAl8xs9Hx6ZaGK7cXegR5IVOBUxLF10LA==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 irlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:39:09 +0800
Message-Id: <20220724073909.17164-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 4562a8b86579..1ece22e7b6cb 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -935,7 +935,7 @@ EXPORT_SYMBOL(drm_framebuffer_unregister_private);
  * the id and get back -EINVAL. Obviously no concern at driver unload time.
  *
  * Also, the framebuffer will not be removed from the lookup idr - for
- * user-created framebuffers this will happen in in the rmfb ioctl. For
+ * user-created framebuffers this will happen in the rmfb ioctl. For
  * driver-private objects (e.g. for fbdev) drivers need to explicitly call
  * drm_framebuffer_unregister_private.
  */
-- 
2.36.1


