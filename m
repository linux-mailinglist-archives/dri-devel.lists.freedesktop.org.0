Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5F3893EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104DC6EE22;
	Wed, 19 May 2021 16:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Wed, 19 May 2021 12:13:02 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28E66ED84
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:13:02 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by lucky1.263xmail.com (Postfix) with ESMTP id 0C4FFD1806;
 Thu, 20 May 2021 03:52:12 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.207.172.18])
 by smtp.263.net (postfix) whith ESMTP id
 P30809T139673931085568S1621425646703999_; 
 Wed, 19 May 2021 20:01:00 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d8bd1af7ca0da760329237065e3fea88>
X-RL-SENDER: songqiang@uniontech.com
X-SENDER: songqiang@uniontech.com
X-LOGIN-NAME: songqiang@uniontech.com
X-FST-TO: sam@ravnborg.org
X-RCPT-COUNT: 12
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: songqiang <songqiang@uniontech.com>
To: sam@ravnborg.org, b.zolnierkie@samsung.com,
 penguin-kernel@i-love.sakura.ne.jp, george.kennedy@oracle.com,
 arnd@arndb.de, tzimmermann@suse.de, jgg@ziepe.ca, willy@infradead.org
Subject: [PATCH] drivers/video/fbdev/core/fbmem.c: add pointer judgment
Date: Wed, 19 May 2021 20:00:28 +0800
Message-Id: <20210519120028.7350-1-songqiang@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 May 2021 16:38:09 +0000
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
Cc: linux-fbdev@vger.kernel.org, songqiang <songqiang@uniontech.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: songqiang <songqiang@uniontech.com>
---
 drivers/video/fbdev/core/fbmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 072780b0e570..6036ab849475 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1859,6 +1859,9 @@ void fb_set_suspend(struct fb_info *info, int state)
 {
 	WARN_CONSOLE_UNLOCKED();
 
+	if (!info) {
+		return;
+	}
 	if (state) {
 		fbcon_suspended(info);
 		info->state = FBINFO_STATE_SUSPENDED;
-- 
2.20.1



