Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD92C763F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FCE6ECF7;
	Sat, 28 Nov 2020 22:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10166ECEB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l11so12774968lfg.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GX2d3CpgxJM36tqAcji4TF9AW0tELXUqa0FefTGKGkc=;
 b=WSratFFtrte4qjUbFg8xQAA6BVPAs2IyKsqMRnOQIDQGIrk/QEfbf7vQoIG+F6PFaE
 bHL2xZGJ53KoPsk5eeebn/EiGEL+0sQSATGEmLvqEf+OOaTz4qIuw0uStP36H2j8vzAx
 CqyoivsQCZFEqCmF7d5P4m+nJ5NxUSid3rmiuEyyaUn4E6z0TPGzGV0AgxE9PVVRmK0S
 ePHRG/qTw3Fq5fQy98aQauwSWFh1AyaJH4gB/wdxu0iPJxcBLMywNhlr9MkTG1FXPylN
 5B4ih+9iS9tBFHM7TBLFYfQ/q0SE9yK/M6c78cAHKoX1880iGpjeWywLXJSGegnCFnDc
 pHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GX2d3CpgxJM36tqAcji4TF9AW0tELXUqa0FefTGKGkc=;
 b=EoBXdoqokpBILTOfJQqSUqPo6UAKY7ZVo1QxUQNiN0FGisrn1ms5bd2fOQVWvhw2lr
 LqkY+cwoxFSx23Ps675CJABvwC8mHvEHOJAJlBicsDlCOKvcHUfhLVcaIbSrrYU0OavX
 eVFz5AV3mvQSXe65tlvFElq9DCL1BDL/guomKLVCmh2SMtxhrWxIPuX1RlkZMHND+3fj
 vm4ECgSh/rklDfHqRPwrpB61zB1JKmkpNe2Z7tSvgUJ+jWf/3MLrKLXy6/AhuJNqH3Cd
 9zCg90gBPv0RL4jxWZSPzZWIA6QzrF53RFIg1N1yrimmMpzB/hT/MNqMSYOaZvWixfOm
 OLvA==
X-Gm-Message-State: AOAM532rHNUhxLbsKn6nfowQ275ch9N4sjCsHUTZH80BACcfaZMC14U5
 T7K1GcyPLrDpPxolvZHF/ALtfqFiKD0p6Q==
X-Google-Smtp-Source: ABdhPJyYzVm54GMBy2SMwgj7Vizf5O6IZYm8/ahMTwfLskutoesZO7VJzcBldtutdNQrv4hcHdOPLQ==
X-Received: by 2002:a19:c70c:: with SMTP id x12mr6709305lff.474.1606603314364; 
 Sat, 28 Nov 2020 14:41:54 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:53 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 17/28] video: fbdev: tgafb: Fix kernel-doc and set but not
 used warnings
Date: Sat, 28 Nov 2020 23:41:03 +0100
Message-Id: <20201128224114.1033617-18-sam@ravnborg.org>
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

Fix W=1 warnings:
- Fix kernel-doc
- Drop unused code

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Joe Perches <joe@perches.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/tgafb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 666fbe2f671c..ae0cf5540636 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -555,7 +555,7 @@ tgafb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue,
 
 /**
  *      tgafb_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int
@@ -837,7 +837,7 @@ tgafb_clut_imageblit(struct fb_info *info, const struct fb_image *image)
 	u32 *palette = ((u32 *)info->pseudo_palette);
 	unsigned long pos, line_length, i, j;
 	const unsigned char *data;
-	void __iomem *regs_base, *fb_base;
+	void __iomem *fb_base;
 
 	dx = image->dx;
 	dy = image->dy;
@@ -855,7 +855,6 @@ tgafb_clut_imageblit(struct fb_info *info, const struct fb_image *image)
 	if (dy + height > vyres)
 		height = vyres - dy;
 
-	regs_base = par->tga_regs_base;
 	fb_base = par->tga_fb_base;
 
 	pos = dy * line_length + (dx * 4);
@@ -1034,7 +1033,7 @@ tgafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 		     regs_base + TGA_MODE_REG);
 }
 
-/**
+/*
  *      tgafb_copyarea - REQUIRED function. Can use generic routines if
  *                       non acclerated hardware and packed pixel based.
  *                       Copies on area of the screen to another area.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
