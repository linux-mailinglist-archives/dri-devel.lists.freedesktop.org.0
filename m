Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06BD391D9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 01:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3910E034;
	Sun, 18 Jan 2026 00:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EtavyVCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28310E034
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 00:19:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-64b7a38f07eso4315219a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768695563; x=1769300363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U8yPWNCbUsD1Zh7l62UZjxa3bF9d9nEOvTtSBxLfUzc=;
 b=EtavyVCNOimfVhoXJJgHdRjmuwjGnPsdMqrr7OMf6vsAI059aDxp5V8KV+23UUge4B
 jmUhcwUKewj6YXY9dIy6kkaNXxUbAhPvxdU3IQx8VBF1M9KWchgfEKfZGCh2P9iMZN+g
 dy8lbW/QG+2NXAlA1512oUVZdfX8/oD3KLu7pwgCXTGu11CFFOdo55Yj0i/PXkdDXP2F
 tvwVPDvrqR5ePaA4Snfj+6J5+f5u4Deb6aQgiWyp/whb6xTSaNmKD91G845wBhRJ4II2
 bWlNLv+hHoAi1k2Bv73w/Jz5NvOjoLtkFmRNN8ongSa4uvypVB+yo8NaEVOw4XZnJsg5
 sEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768695563; x=1769300363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8yPWNCbUsD1Zh7l62UZjxa3bF9d9nEOvTtSBxLfUzc=;
 b=ZVn28rBxWSWs5d+P26n3gH9eQYxFTym5lFDjV3tpgT/URSOFi9YoMVPBmI9sD+fJIo
 RpM2KOmmFoufiMpp5xeaCOUizqiVgbLIuUA+MRatPXN1hw7EYAbcLalre+MrFhccdukB
 8pP9+fg2B3oxwSWz26rXqL9h0pa3Wphosx2GQrCuARiqaB8IZPvyh9vMecG+BEjT0P2M
 vM35vD18rFUKMW2jb/Xr0EH0vlIjkL3yGal9V1/NDpeBnyhP6AGCLSuhkykGzmQ6/7cJ
 ckDoC1HH/PGUfvOpk27HuMcjhXpsnim0C+frB9aw1/iC16J05yohDttTHQ67Qv7K4BnB
 e19A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUik1Z3tSSmn5547zz8EwC9gRe+lpcs1HgD0jrtSqeUWqH6WDJrx2jbVA8kkU8jQSpVMN8GqS2SSs8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyypz8Hx1Oolc0ov6yV0nrXfL/pHARf73BBxEfP2Ls+PgXQXwMe
 MZb5nIajNJ9VeAocIVINPUKT2iY+txKLmq3JaSkG7Owu8WofJYN59Y6F
X-Gm-Gg: AY/fxX6uTClxagr9I8aYw0/nVCyuAMHFuu/CTeymjJXSxVz9m/dqZm4+oZG9Dw/KHjw
 z0UGTXfvYoqmJu+UnUSITmhy66b5AZCG59RQPa97omHm6u1i0V9YZ0DDhyaulHLiht4tUNUWhJA
 G2XgJwSe+a5I3FuARPbrnA/r+JEVQwzxxu3WO92muKJ4VjmbnUoGNZZnSVf1foyHA0bVzQL3kPK
 8LRAfNbJRaENFsmxibuPGYqmV30ZuFOBpAn5yMPPbZz9Ey7ZAGYF4cMSAW402lF4wEkkj3UuOo7
 2IdXx6OSOKXG45V/kTpUL458fOw7Mb2AabNFqa/9SygIuDgp3Q4NEtqIGnqrKXlhxQ7g+U20EOr
 KKZmQP3qYHs6FhWTnw7DiKNGvkqW5A9KfVSlZP9ifEpGHQcPD5xVyQLP967G7wZ0y4b7RIpE8E8
 O1iMCBAj8Ct/wqEQ==
X-Received: by 2002:a05:6402:5243:b0:640:ef6e:e069 with SMTP id
 4fb4d7f45d1cf-654524cf263mr4839330a12.1.1768695562948; 
 Sat, 17 Jan 2026 16:19:22 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:5102:ac1a:4cf6:b9b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65452bce4f7sm6543849a12.6.2026.01.17.16.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 16:19:22 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Zsolt Kajtar <soci@c64.rulez.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Osama Abdelkader <osama.abdelkader@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: sys_fillrect: Add bounds checking to prevent
 vmalloc-out-of-bounds
Date: Sun, 18 Jan 2026 01:18:48 +0100
Message-ID: <20260118001852.70173-1-osama.abdelkader@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sys_fillrect function was missing bounds validation, which could lead
to vmalloc-out-of-bounds writes when the rectangle coordinates extend
beyond the framebuffer's virtual resolution. This was detected by KASAN
and reported by syzkaller.

Add validation to:
1. Check that width and height are non-zero
2. Verify that dx and dy are within virtual resolution bounds
3. Clip the rectangle dimensions to fit within virtual resolution if needed

This follows the same pattern used in other framebuffer drivers like
pm2fb_fillrect.

Reported-by: syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/video/fbdev/core/sysfillrect.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index 12eea3e424bb..73fc322ff8fd 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
+#include <linux/string.h>
 #include <asm/types.h>
 
 #ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
@@ -18,10 +19,28 @@
 
 void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 {
+	struct fb_fillrect modded;
+	int vxres, vyres;
+
 	if (!(p->flags & FBINFO_VIRTFB))
 		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
 
-	fb_fillrect(p, rect);
+	vxres = p->var.xres_virtual;
+	vyres = p->var.yres_virtual;
+
+	/* Validate and clip rectangle to virtual resolution */
+	if (!rect->width || !rect->height ||
+	    rect->dx >= vxres || rect->dy >= vyres)
+		return;
+
+	memcpy(&modded, rect, sizeof(struct fb_fillrect));
+
+	if (modded.dx + modded.width > vxres)
+		modded.width = vxres - modded.dx;
+	if (modded.dy + modded.height > vyres)
+		modded.height = vyres - modded.dy;
+
+	fb_fillrect(p, &modded);
 }
 EXPORT_SYMBOL(sys_fillrect);
 
-- 
2.43.0

