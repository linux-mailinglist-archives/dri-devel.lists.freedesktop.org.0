Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C954278122
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B816EBA6;
	Fri, 25 Sep 2020 07:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1C6EB0B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:42:01 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f1so1671083plo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhUT+o1t+AMJZcWvFy2i6GGXqhceBpLqREcEoG/PC2I=;
 b=irXCwpoSu4oXTb5oMuOufQPxPk+9Kn5lUT5vU83eEIXHtXr/kllNTZJS478wgiQqAG
 lxwU8/afP/v6KSEer0vX6yiS6jf9URmv8L+Yfuekm7MM4OUbV7y2/pw6jqELmA9MvueR
 US+zjhQrx05YxiuCzPsMqPeD85j+E+W1LsQ3E5KGFziMuiJHisVjkIpggRqrx9VBP/XP
 5esQNoMkU1djjt3l/vYCqsGXdoWGAqr/Yobg3c/zd4RDyHA+VRrIRZss/9vLknWN6eJ5
 CMdbr6e8FQWVrXG+/TqQR76CfQcg7+ZngMQ9oGYYiht9kV07RJGBjTibMDYDHR2nQNXf
 NP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhUT+o1t+AMJZcWvFy2i6GGXqhceBpLqREcEoG/PC2I=;
 b=JHUDheqgGFtKB0vwuvMUOa2YBaEmbS0AYp+MTUZrKuJE5vWGFRldbPcAtdjzv6Cj/B
 sPWvVTNiuUOZHYPw2yJoRB6M6coeoNvA+rjep8r9eMxoLf1+GFnviiMHW1U2pHs97FtE
 oFIXjCwet2Ffo26D48jNA55ApQfOgd2Bfgk+okX7KMRQeECzeULFb4avL3sduXExV9r9
 IezG9dtid/QFUlnFLw49GdZ/ZEzZFSdmHcgW3jCXrbwjR1MSw8hPJSQmZji15ayWBcO5
 fBjshu2P8zanY6pOhqu8ERpr1LImH7J5+pbsCR++e5S2Z3SRCt1LLpAwAcez4qxsLXhE
 Y0Og==
X-Gm-Message-State: AOAM530aYl+ux2bmnLBlyMvjZEBCmL5+plokNF6GGZZG9q7aIor4W/W5
 gU0YROOARRxoXUr+u22zRg==
X-Google-Smtp-Source: ABdhPJwbSp22dl0/uGuIqOuYJe+1ZIMNoe26SQC8usmBFnufkGD6yDVP5qwYZlclOJS2wO7w9EIofw==
X-Received: by 2002:a17:90b:797:: with SMTP id
 l23mr4006542pjz.176.1600954921325; 
 Thu, 24 Sep 2020 06:42:01 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id j6sm3012588pfi.129.2020.09.24.06.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 06:42:00 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] fbdev,
 newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
Date: Thu, 24 Sep 2020 09:40:53 -0400
Message-Id: <7fb8bc9b0abc676ada6b7ac0e0bd443499357267.1600953813.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600953813.git.yepeilin.cs@gmail.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/video/console/newport_con.c is borrowing FONT_EXTRA_WORDS macros
from drivers/video/fbdev/core/fbcon.h. To keep things simple, move all
definitions into <linux/font.h>.

Since newport_con now uses four extra words, initialize the fourth word in
newport_set_font() properly.

Cc: stable@vger.kernel.org
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/console/newport_con.c     | 7 +------
 drivers/video/fbdev/core/fbcon.h        | 7 -------
 drivers/video/fbdev/core/fbcon_rotate.c | 1 +
 drivers/video/fbdev/core/tileblit.c     | 1 +
 include/linux/font.h                    | 8 ++++++++
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 72f146d047d9..cd51b7a17a21 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -35,12 +35,6 @@
 
 #define FONT_DATA ((unsigned char *)font_vga_8x16.data)
 
-/* borrowed from fbcon.c */
-#define REFCOUNT(fd)	(((int *)(fd))[-1])
-#define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
-#define FONT_EXTRA_WORDS 3
-
 static unsigned char *font_data[MAX_NR_CONSOLES];
 
 static struct newport_regs *npregs;
@@ -522,6 +516,7 @@ static int newport_set_font(int unit, struct console_font *op)
 	FNTSIZE(new_data) = size;
 	FNTCHARCNT(new_data) = op->charcount;
 	REFCOUNT(new_data) = 0;	/* usage counter */
+	FNTSUM(new_data) = 0;
 
 	p = new_data;
 	for (i = 0; i < op->charcount; i++) {
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
index 20dea853765f..5ee153ba977e 100644
--- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -152,13 +152,6 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
 #define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info, 0)
 #define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info, 1)
 
-/* Font */
-#define REFCOUNT(fd)	(((int *)(fd))[-1])
-#define FNTSIZE(fd)	(((int *)(fd))[-2])
-#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
-#define FNTSUM(fd)	(((int *)(fd))[-4])
-#define FONT_EXTRA_WORDS 4
-
     /*
      *  Scroll Method
      */
diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
index c0d445294aa7..ac72d4f85f7d 100644
--- a/drivers/video/fbdev/core/fbcon_rotate.c
+++ b/drivers/video/fbdev/core/fbcon_rotate.c
@@ -14,6 +14,7 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 #include "fbcon_rotate.h"
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
index 1dfaff0881fb..257e94feeeb6 100644
--- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -13,6 +13,7 @@
 #include <linux/fb.h>
 #include <linux/vt_kern.h>
 #include <linux/console.h>
+#include <linux/font.h>
 #include <asm/types.h>
 #include "fbcon.h"
 
diff --git a/include/linux/font.h b/include/linux/font.h
index 51b91c8b69d5..40ed008d7dad 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -59,4 +59,12 @@ extern const struct font_desc *get_default_font(int xres, int yres,
 /* Max. length for the name of a predefined font */
 #define MAX_FONT_NAME	32
 
+/* Extra word getters */
+#define REFCOUNT(fd)	(((int *)(fd))[-1])
+#define FNTSIZE(fd)	(((int *)(fd))[-2])
+#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
+#define FNTSUM(fd)	(((int *)(fd))[-4])
+
+#define FONT_EXTRA_WORDS 4
+
 #endif /* _VIDEO_FONT_H */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
