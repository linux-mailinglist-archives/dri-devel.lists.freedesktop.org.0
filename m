Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD382C764A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56426ED09;
	Sat, 28 Nov 2020 22:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07AA6ECFB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:14 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y10so10589876ljc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BP0tdGdOicm/g6FYqITXj/E741V7SOdfxHbuSnOa2vI=;
 b=A4+pA68yf5NQVAPnKHbZYVBDWIiXGs+Bvvu5J6D3tuTktlHbucucuyXSkvyUy1Z1ad
 qugn8GtpY2nk3MyGG1NB0/O+SXqhFzV50AwcMgZMDEIzlcPovhiNq/Vp3PCTW362qNUS
 akY1e5rXqcvvcDXERh7JZfSHWjcCL7TT1XmLL6eKoNkpqDIadVv/n/BApO2EhP/R519x
 Xwk9g4doicNQ+LGaenNYRm+DemOqIRzrgbI3ZIYi5/QYHt4ULU/wupW4572a5bKokc1P
 GCVqE5qF8LeEuIz06k9OEgsBZgfX2rLwP5Lto5zDv6y9chUDrSbEr65fc8MNx0jvyhTX
 Xoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BP0tdGdOicm/g6FYqITXj/E741V7SOdfxHbuSnOa2vI=;
 b=KmKBpuPLu2pVQSEVlAPE9GIRH1bXaVWbgsl9NC9I1TJWKN4BvTQZhO5yO/DqqZkLHz
 /qoOEldU98hHC8UV7pi5A1/71BDUEUMcJdaFSruYotK5o2UKCx8zHt0yQL7v/Dfvb7F8
 II7Iu1hdPG1nSIDCkSyetO9DT7GiQYQGm7P6VRBCCibIOMBYQhX1ccMt/Q/0tLNlWkJp
 NMqxUF8wHPYcorGTYumxznxTIm2x+QUshyXA5FrpKwu/NSXv0ggP/1yXxqALSXN2Fakt
 5fJHeZI5g6YVBFKVHUA7pyZGQiiFAkkTaHzSm8MTCeIrW3g7olFq7QW2/03VHbszCTNE
 +joA==
X-Gm-Message-State: AOAM530xJ/9B3npXDGqKL2tZ3ndmqEIbuATYGX5qO5OytJQc+qh2/b1+
 i5+sjaNYYgkyhAU4np59Jc0=
X-Google-Smtp-Source: ABdhPJwwf1ZWhffUvstO1LtukDoI2Zp+qJq1Q3l5sM/werUk5+/LklnUG0w4Xy6qOp1ekvjP6B84Ew==
X-Received: by 2002:a2e:888a:: with SMTP id k10mr6395463lji.341.1606603333226; 
 Sat, 28 Nov 2020 14:42:13 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:12 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 27/28] video: fbdev: cirrusfb: Fix kernel-doc and set but
 not used warnings
Date: Sat, 28 Nov 2020 23:41:13 +0100
Message-Id: <20201128224114.1033617-28-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix warnings:
- drop kernel-doc for the two debug functions to avoid the warnings
- delete unused code

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimemrmann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/cirrusfb.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index e9027172c0f5..93802abbbc72 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2463,8 +2463,6 @@ static void AttrOn(const struct cirrusfb_info *cinfo)
  */
 static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val)
 {
-	unsigned char dummy;
-
 	if (is_laguna(cinfo))
 		return;
 	if (cinfo->btype == BT_PICASSO) {
@@ -2473,18 +2471,18 @@ static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val)
 		WGen(cinfo, VGA_PEL_MSK, 0x00);
 		udelay(200);
 		/* next read dummy from pixel address (3c8) */
-		dummy = RGen(cinfo, VGA_PEL_IW);
+		RGen(cinfo, VGA_PEL_IW);
 		udelay(200);
 	}
 	/* now do the usual stuff to access the HDR */
 
-	dummy = RGen(cinfo, VGA_PEL_MSK);
+	RGen(cinfo, VGA_PEL_MSK);
 	udelay(200);
-	dummy = RGen(cinfo, VGA_PEL_MSK);
+	RGen(cinfo, VGA_PEL_MSK);
 	udelay(200);
-	dummy = RGen(cinfo, VGA_PEL_MSK);
+	RGen(cinfo, VGA_PEL_MSK);
 	udelay(200);
-	dummy = RGen(cinfo, VGA_PEL_MSK);
+	RGen(cinfo, VGA_PEL_MSK);
 	udelay(200);
 
 	WGen(cinfo, VGA_PEL_MSK, val);
@@ -2492,7 +2490,7 @@ static void WHDR(const struct cirrusfb_info *cinfo, unsigned char val)
 
 	if (cinfo->btype == BT_PICASSO) {
 		/* now first reset HDR access counter */
-		dummy = RGen(cinfo, VGA_PEL_IW);
+		RGen(cinfo, VGA_PEL_IW);
 		udelay(200);
 
 		/* and at the end, restore the mask value */
@@ -2800,9 +2798,9 @@ static void bestclock(long freq, int *nom, int *den, int *div)
 
 #ifdef CIRRUSFB_DEBUG
 
-/**
+/*
  * cirrusfb_dbg_print_regs
- * @base: If using newmmio, the newmmio base address, otherwise %NULL
+ * @regbase: If using newmmio, the newmmio base address, otherwise %NULL
  * @reg_class: type of registers to read: %CRT, or %SEQ
  *
  * DESCRIPTION:
@@ -2847,7 +2845,7 @@ static void cirrusfb_dbg_print_regs(struct fb_info *info,
 	va_end(list);
 }
 
-/**
+/*
  * cirrusfb_dbg_reg_dump
  * @base: If using newmmio, the newmmio base address, otherwise %NULL
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
