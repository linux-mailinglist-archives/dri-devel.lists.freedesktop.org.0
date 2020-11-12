Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612E2B04C7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103616E216;
	Thu, 12 Nov 2020 12:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3E6E215
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:14:09 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t18so2695179plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qI9FK/WV51uzQ+5U+ONFL1fdnGeKCbg3gawqygIR1rw=;
 b=LiCAKIXoQ/iIwwnWehfp70HaCZr7hqUs5nQurinaasuuQkf5shQk2yCWppH8DeypON
 FzjE8L9P9rmFDKm0sxcmuuMRBV6goxWjSJMk4AXeNaCAjqGl1MYPH81SgieJGYWE336i
 iLgXInHsw+34YgQ8Zqr/BlP5QQ3USAvuNR32SJgYj1dIWft9aXiddAZ+6VPl+CZEPk3g
 ZfUochzcS6e4jOYFecwZ0z3c+q/WgoiynQA7Ooo8DXSXjnPXcHducT25lhexyv9jRv6o
 zObOThTte/W3XhNeOXUgFxealnGRNjSg/1Q5DCjA/kK14X1rWf9WlkUdo4SRKOUq44KP
 eNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qI9FK/WV51uzQ+5U+ONFL1fdnGeKCbg3gawqygIR1rw=;
 b=JoGUrM8u1Wiwt1ihO8v7Js34C50fjeK1rrQEgZeXE9g8NjctajuUh94e8HGolkSaEd
 KAwLY37nswPPoQpzLj8m4c8Xmg41GiAmvPnOuvVlSztax27ixgZL0Fw3SIs5YIGp24bv
 gYh5TnmYyvMUn7hjWTfLVft8eCUeqbKtzwiVW3ej+PulNV1916WMXBjIFXi9i1Sgg9Nq
 GjyX0LAEnSCcw3LOxlxzoWnE2N3RslWr8EVCzb4spJgfsxgF+o+MCFagHGEWChnERrZN
 hZm6ZcTtHut2xd8+y8GuFuJvWB7nQ6OuZpUNueBZZJNrAbCcxzUWRjCa7q+l1Qjm+Vwh
 isLg==
X-Gm-Message-State: AOAM530wrQih0jipDyFTherWDIXI5hN61MlFCpZykOG+Vd81dQwksTgv
 6b3H4xJ6EkiNng2U1haiDA==
X-Google-Smtp-Source: ABdhPJzxKGVRreaxt+hicCEYOLKxX4XkRjA1eKqizBS4+nlzy24IRoAfLir/N/deiS8Yr2k49PvPyQ==
X-Received: by 2002:a17:902:7c16:b029:d8:ac5d:3e9c with SMTP id
 x22-20020a1709027c16b02900d8ac5d3e9cmr12467169pll.68.1605183247901; 
 Thu, 12 Nov 2020 04:14:07 -0800 (PST)
Received: from localhost.localdomain ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id a20sm6062637pff.118.2020.11.12.04.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 04:14:07 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 3/5] Fonts: Add charcount field to font_desc
Date: Thu, 12 Nov 2020 07:13:34 -0500
Message-Id: <65952296d1d9486093bd955d1536f7dcd11112c6.1605169912.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1605169912.git.yepeilin.cs@gmail.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subsystems are hard-coding the number of characters of our built-in fonts
as 256. Include that information in our kernel font descriptor, `struct
font_desc`.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
v2: https://lore.kernel.org/lkml/20201028060533.1206307-1-yepeilin.cs@gmail.com/

Change in v3:
  - Rebase onto linux-next.

Change in v2:
  - Rebase onto 5.10-rc1.

 include/linux/font.h       | 1 +
 lib/fonts/font_10x18.c     | 1 +
 lib/fonts/font_6x10.c      | 1 +
 lib/fonts/font_6x11.c      | 1 +
 lib/fonts/font_6x8.c       | 1 +
 lib/fonts/font_7x14.c      | 1 +
 lib/fonts/font_8x16.c      | 1 +
 lib/fonts/font_8x8.c       | 1 +
 lib/fonts/font_acorn_8x8.c | 1 +
 lib/fonts/font_mini_4x6.c  | 1 +
 lib/fonts/font_pearl_8x8.c | 1 +
 lib/fonts/font_sun12x22.c  | 1 +
 lib/fonts/font_sun8x16.c   | 1 +
 lib/fonts/font_ter16x32.c  | 1 +
 14 files changed, 14 insertions(+)

diff --git a/include/linux/font.h b/include/linux/font.h
index 4f50d736ea72..abf1442ce719 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -17,6 +17,7 @@ struct font_desc {
     int idx;
     const char *name;
     unsigned int width, height;
+    unsigned int charcount;
     const void *data;
     int pref;
 };
diff --git a/lib/fonts/font_10x18.c b/lib/fonts/font_10x18.c
index e02f9df24d1e..5d940db626e7 100644
--- a/lib/fonts/font_10x18.c
+++ b/lib/fonts/font_10x18.c
@@ -5137,6 +5137,7 @@ const struct font_desc font_10x18 = {
 	.name	= "10x18",
 	.width	= 10,
 	.height	= 18,
+	.charcount = 256,
 	.data	= fontdata_10x18.data,
 #ifdef __sparc__
 	.pref	= 5,
diff --git a/lib/fonts/font_6x10.c b/lib/fonts/font_6x10.c
index 6e3c4b7691c8..e65df019e0d2 100644
--- a/lib/fonts/font_6x10.c
+++ b/lib/fonts/font_6x10.c
@@ -3083,6 +3083,7 @@ const struct font_desc font_6x10 = {
 	.name	= "6x10",
 	.width	= 6,
 	.height	= 10,
+	.charcount = 256,
 	.data	= fontdata_6x10.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_6x11.c b/lib/fonts/font_6x11.c
index 2d22a24e816f..bd76b3f6b635 100644
--- a/lib/fonts/font_6x11.c
+++ b/lib/fonts/font_6x11.c
@@ -3346,6 +3346,7 @@ const struct font_desc font_vga_6x11 = {
 	.name	= "ProFont6x11",
 	.width	= 6,
 	.height	= 11,
+	.charcount = 256,
 	.data	= fontdata_6x11.data,
 	/* Try avoiding this font if possible unless on MAC */
 	.pref	= -2000,
diff --git a/lib/fonts/font_6x8.c b/lib/fonts/font_6x8.c
index e7442a0d183d..06ace7792521 100644
--- a/lib/fonts/font_6x8.c
+++ b/lib/fonts/font_6x8.c
@@ -2571,6 +2571,7 @@ const struct font_desc font_6x8 = {
 	.name	= "6x8",
 	.width	= 6,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_6x8.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_7x14.c b/lib/fonts/font_7x14.c
index 9cc7ae2e03f7..a2f561c9fa04 100644
--- a/lib/fonts/font_7x14.c
+++ b/lib/fonts/font_7x14.c
@@ -4113,6 +4113,7 @@ const struct font_desc font_7x14 = {
 	.name	= "7x14",
 	.width	= 7,
 	.height	= 14,
+	.charcount = 256,
 	.data	= fontdata_7x14.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_8x16.c b/lib/fonts/font_8x16.c
index bab25dc59e8d..06ae14088514 100644
--- a/lib/fonts/font_8x16.c
+++ b/lib/fonts/font_8x16.c
@@ -4627,6 +4627,7 @@ const struct font_desc font_vga_8x16 = {
 	.name	= "VGA8x16",
 	.width	= 8,
 	.height	= 16,
+	.charcount = 256,
 	.data	= fontdata_8x16.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_8x8.c b/lib/fonts/font_8x8.c
index 109d0572368f..69570b8c31af 100644
--- a/lib/fonts/font_8x8.c
+++ b/lib/fonts/font_8x8.c
@@ -2578,6 +2578,7 @@ const struct font_desc font_vga_8x8 = {
 	.name	= "VGA8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_8x8.data,
 	.pref	= 0,
 };
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index fb395f0d4031..18755c33d249 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -270,6 +270,7 @@ const struct font_desc font_acorn_8x8 = {
 	.name	= "Acorn8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= acorndata_8x8.data,
 #ifdef CONFIG_ARCH_ACORN
 	.pref	= 20,
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index 592774a90917..8d39fd447952 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -2152,6 +2152,7 @@ const struct font_desc font_mini_4x6 = {
 	.name	= "MINI4x6",
 	.width	= 4,
 	.height	= 6,
+	.charcount = 256,
 	.data	= fontdata_mini_4x6.data,
 	.pref	= 3,
 };
diff --git a/lib/fonts/font_pearl_8x8.c b/lib/fonts/font_pearl_8x8.c
index a6f95ebce950..b1678ed0017c 100644
--- a/lib/fonts/font_pearl_8x8.c
+++ b/lib/fonts/font_pearl_8x8.c
@@ -2582,6 +2582,7 @@ const struct font_desc font_pearl_8x8 = {
 	.name	= "PEARL8x8",
 	.width	= 8,
 	.height	= 8,
+	.charcount = 256,
 	.data	= fontdata_pearl8x8.data,
 	.pref	= 2,
 };
diff --git a/lib/fonts/font_sun12x22.c b/lib/fonts/font_sun12x22.c
index a5b65bd49604..91daf5ab8b6b 100644
--- a/lib/fonts/font_sun12x22.c
+++ b/lib/fonts/font_sun12x22.c
@@ -6156,6 +6156,7 @@ const struct font_desc font_sun_12x22 = {
 	.name	= "SUN12x22",
 	.width	= 12,
 	.height	= 22,
+	.charcount = 256,
 	.data	= fontdata_sun12x22.data,
 #ifdef __sparc__
 	.pref	= 5,
diff --git a/lib/fonts/font_sun8x16.c b/lib/fonts/font_sun8x16.c
index e577e76a6a7c..81bb4eeae04e 100644
--- a/lib/fonts/font_sun8x16.c
+++ b/lib/fonts/font_sun8x16.c
@@ -268,6 +268,7 @@ const struct font_desc font_sun_8x16 = {
 	.name	= "SUN8x16",
 	.width	= 8,
 	.height	= 16,
+	.charcount = 256,
 	.data	= fontdata_sun8x16.data,
 #ifdef __sparc__
 	.pref	= 10,
diff --git a/lib/fonts/font_ter16x32.c b/lib/fonts/font_ter16x32.c
index f7c3abb6b99e..1955d624177c 100644
--- a/lib/fonts/font_ter16x32.c
+++ b/lib/fonts/font_ter16x32.c
@@ -2062,6 +2062,7 @@ const struct font_desc font_ter_16x32 = {
 	.name	= "TER16x32",
 	.width	= 16,
 	.height = 32,
+	.charcount = 256,
 	.data	= fontdata_ter16x32.data,
 #ifdef __sparc__
 	.pref	= 5,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
