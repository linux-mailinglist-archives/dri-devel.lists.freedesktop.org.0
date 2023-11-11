Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238F67E8A57
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD010E271;
	Sat, 11 Nov 2023 10:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD410E267
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:48 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so215587466b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699367; x=1700304167;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXZvMG+ePha/xCPPyQSZcW7mIHQVo6pfDhdFQ8Ys4tc=;
 b=EIi+SW/KGW9JzFc4OPIvJy83qzPIR/TlKi2BkVwlj7jj4Y9jDO3EuyZ9zX42F81uco
 6Dh2rFgzYgbmM9fwTttCmItg0wa7rRhuXgG4oj0qS9k3vbu84fJ3lnZoRHj+b54x8LYX
 ubsWMvCIYyr38UPL94h63sQjmnmn3Kt4adzQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699367; x=1700304167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXZvMG+ePha/xCPPyQSZcW7mIHQVo6pfDhdFQ8Ys4tc=;
 b=Oekh2YrV/hlPibs4/A2ypOOEA4PFM52fgt3bL2SAIkozYtn6oZzMulY8n9KIwB6n7m
 TSbsQS/ocWYjoDSmOULNHMxs1lVSbOdR0S1sAryphgBATwI8ZPJu4t5r9xCMoExcjzLN
 qeJhpcyI10JSwie45/wVLggGBAxusTekYyFvlH/Kx1z6VTq+lwJkktDPr2mVMivr286N
 tT6XoniJii1zKax6AYlRRotz+khF6O3DLSUvuIFumY3J2eeBLO8KgImEe6bxZ9gVAySS
 d/uK54OVXec6jjbgvYuZzIAdZtMQ82IM603yeLYCwC+R5g2r13wK/ClaWPzIlQ8Yf9hz
 hrkg==
X-Gm-Message-State: AOJu0YyBAXK3xX5H100UCpeT6Rrm7aeid2mY92qfdpOX1DskdacJ52it
 jGO5Cr2WFSs2HpGgKi+dZXXk8A==
X-Google-Smtp-Source: AGHT+IGJZcFy9OdyadzV+Qr9dejIzMtNTDEhCcEQriAhe7EtSGvFTDpXzYmEJXyYAtgH1pYC278gVQ==
X-Received: by 2002:a17:906:fa9b:b0:9dd:6664:1a3a with SMTP id
 lt27-20020a170906fa9b00b009dd66641a3amr1013488ejb.51.1699699366905; 
 Sat, 11 Nov 2023 02:42:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] fbdev: imxfb: Fix style warnings relating to printk()
Date: Sat, 11 Nov 2023 11:41:57 +0100
Message-ID: <20231111104225.136512-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolve the following warning reported by checkpatch:

WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...

This made it necessary to move the 'fbi->pdev = pdev' setting to the
beginning of the driver's probing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index ad293dc44dbb..a0172ff75c46 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -414,8 +414,8 @@ static int imxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	if (--pcr > PCR_PCD_MASK) {
 		pcr = PCR_PCD_MASK;
-		printk(KERN_WARNING "Must limit pixel clock to %luHz\n",
-				lcd_clk / pcr);
+		dev_warn(&fbi->pdev->dev, "Must limit pixel clock to %luHz\n",
+			 lcd_clk / pcr);
 	}
 
 	switch (var->bits_per_pixel) {
@@ -628,28 +628,28 @@ static int imxfb_activate_var(struct fb_var_screeninfo *var, struct fb_info *inf
 
 #if DEBUG_VAR
 	if (var->xres < 16        || var->xres > 1024)
-		printk(KERN_ERR "%s: invalid xres %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid xres %d\n",
 			info->fix.id, var->xres);
 	if (var->hsync_len < 1    || var->hsync_len > 64)
-		printk(KERN_ERR "%s: invalid hsync_len %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid hsync_len %d\n",
 			info->fix.id, var->hsync_len);
 	if (var->left_margin < left_margin_low  || var->left_margin > 255)
-		printk(KERN_ERR "%s: invalid left_margin %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid left_margin %d\n",
 			info->fix.id, var->left_margin);
 	if (var->right_margin < 1 || var->right_margin > 255)
-		printk(KERN_ERR "%s: invalid right_margin %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid right_margin %d\n",
 			info->fix.id, var->right_margin);
 	if (var->yres < 1 || var->yres > ymax_mask)
-		printk(KERN_ERR "%s: invalid yres %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid yres %d\n",
 			info->fix.id, var->yres);
 	if (var->vsync_len > 100)
-		printk(KERN_ERR "%s: invalid vsync_len %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid vsync_len %d\n",
 			info->fix.id, var->vsync_len);
 	if (var->upper_margin > 63)
-		printk(KERN_ERR "%s: invalid upper_margin %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid upper_margin %d\n",
 			info->fix.id, var->upper_margin);
 	if (var->lower_margin > 255)
-		printk(KERN_ERR "%s: invalid lower_margin %d\n",
+		dev_err(&fbi->pdev->dev, "%s: invalid lower_margin %d\n",
 			info->fix.id, var->lower_margin);
 #endif
 
@@ -701,6 +701,7 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
 
 	memset(fbi, 0, sizeof(struct imxfb_info));
 
+	fbi->pdev = pdev;
 	fbi->devtype = pdev->id_entry->driver_data;
 
 	strscpy(info->fix.id, IMX_NAME, sizeof(info->fix.id));
@@ -1044,7 +1045,6 @@ static int imxfb_probe(struct platform_device *pdev)
 	lcd->props.max_contrast = 0xff;
 
 	imxfb_enable_controller(fbi);
-	fbi->pdev = pdev;
 
 	return 0;
 
-- 
2.42.0

