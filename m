Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F376571B3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E111310E361;
	Wed, 28 Dec 2022 01:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2B310E361
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:44:31 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NhZ7y1pxfz5PkHg
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 09:44:30 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4NhZ7m2gCdz501Qh;
 Wed, 28 Dec 2022 09:44:20 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
 by mse-fl1.zte.com.cn with SMTP id 2BS1iAG9052060;
 Wed, 28 Dec 2022 09:44:10 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp01[null]) by mapi (Zmail) with MAPI id mid14;
 Wed, 28 Dec 2022 09:44:11 +0800 (CST)
Date: Wed, 28 Dec 2022 09:44:11 +0800 (CST)
X-Zmail-TransId: 2b0363ab9f6b7fd5e0c4
X-Mailer: Zmail v1.0
Message-ID: <202212280944112670081@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <deller@gmx.de>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGZiZGV2OiB1c2Ugc3Ryc2NweSgpIHRvIGluc3RlYWQgb2Ygc3RybmNweSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2BS1iAG9052060
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 63AB9F7E.000 by FangMail milter!
X-FangMail-Envelope: 1672191870/4NhZ7y1pxfz5PkHg/63AB9F7E.000/192.168.251.13/[192.168.251.13]/mxct.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63AB9F7E.000/4NhZ7y1pxfz5PkHg
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
Cc: linux-fbdev@vger.kernel.org, xu.panda@zte.com.cn, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yang.yang29@zte.com.cn, wsa+renesas@sang-engineering.com,
 christophe.leroy@csgroup.eu, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL-terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 0ccf5d401ecb..851c1236fddb 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3192,8 +3192,7 @@ static void aty_init_lcd(struct atyfb_par *par, u32 bios_base)
 		 * which we print to the screen.
 		 */
 		id = *(u8 *)par->lcd_table;
-		strncpy(model, (char *)par->lcd_table+1, 24);
-		model[23] = 0;
+		strscpy(model, (char *)par->lcd_table+1, 24);

 		width = par->lcd_width = *(u16 *)(par->lcd_table+25);
 		height = par->lcd_height = *(u16 *)(par->lcd_table+27);
-- 
2.15.2
