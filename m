Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD69427B2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D190E10E37F;
	Wed, 31 Jul 2024 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 545 seconds by postgrey-1.36 at gabe;
 Wed, 31 Jul 2024 06:52:20 UTC
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com
 [111.22.67.139])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12D4510E2AB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 06:52:19 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
 by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee166a9dcffc8f-9e589;
 Wed, 31 Jul 2024 14:43:12 +0800 (CST)
X-RM-TRANSID: 2ee166a9dcffc8f-9e589
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.102])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee966a9dcef34b-10ed8;
 Wed, 31 Jul 2024 14:43:12 +0800 (CST)
X-RM-TRANSID: 2ee966a9dcef34b-10ed8
From: bajing <bajing@cmss.chinamobile.com>
To: ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bajing <bajing@cmss.chinamobile.com>
Subject: [PATCH] accel: drm_accel: remove incorrect comments
Date: Wed, 31 Jul 2024 14:42:53 +0800
Message-Id: <20240731064253.24523-1-bajing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 07:19:04 +0000
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

accel_minor_replace is of type void, so remove the explanation of the return value in the comments.

Signed-off-by: bajing <bajing@cmss.chinamobile.com>
---
 drivers/accel/drm_accel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 16c3edb8c46e..09fb64444cc6 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -161,8 +161,6 @@ void accel_minor_remove(int index)
  * This function access the accel minors idr structure and replaces the pointer
  * that is associated with an existing id. Because the minor pointer can be
  * NULL, we need to explicitly pass the index.
- *
- * Return: 0 for success, negative value for error
  */
 void accel_minor_replace(struct drm_minor *minor, int index)
 {
-- 
2.39.3



