Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D41EDDB3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A776E258;
	Thu,  4 Jun 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553E789CF4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 09:25:58 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b5so1219575pfp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yjR15KopJP6zOaarv5W3RFOr1FfhGQ5XkUnFKdb2y28=;
 b=JMOhtXzgXvitBoKlXVbXLhISmX+Djvz0qHp7icGepMKPD5XxVwvuRS0t/Paa05/h1h
 rS1alLFZHbZz24OO4xGvz1R3xVTzc3eMzktLA/pBfteBz5Tbi3uT5FjhpeMLozTO6V25
 GDvPgvnhQ+v1uTW5jVReN8LZSI2Wdqm8oJk9Itd5Q80UKEp361IWx65IrSxwnSLI3T4R
 fWDtkBMO+ftSkrxjcAsW4Hf+cwt7xdtLT4xts+KWQnK+OiP0q8bbs8FM1L+T4aiCBfvh
 ifB+bYo8krOQ+cOQ/H0UDvCrQcBQpX47jVz6Deslf2IaldwMRJEEtJFQPJdzil9lb+ja
 9j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yjR15KopJP6zOaarv5W3RFOr1FfhGQ5XkUnFKdb2y28=;
 b=HKj2t4xhfRn4rAfdnLYSvWAaFHKDlsEKNs0NuRqQJ1/TGyNzsiNfyucU/x+I9qOGJC
 UpFJXIV0qtReTbZ8AwJIMTbJKvqeXYjyKttIMPlvo1DMrXl45Jhn2dzgRs6+F56ZDlqX
 5CxicDAa1bpNusfM3246DF19p0VJOlv0XgjyQA1cJkaONKv0zYKwpUipx3b11lL0aQAL
 yLZ8uDGVvMT7fodxTWbArb6BGM3nxrbnaVoeTS/7PNF74xF8JEuRFzKxjtScZ1OapoFS
 +huCFxNTCqG2k65P+BYj5RdyktPCBNTbSIGkXVJgZ1Tl5gML1z5GHjIM4cCP4fSvdE/1
 U3ow==
X-Gm-Message-State: AOAM531wg74Zl4OaYAYX/UhjaJY0kpAiFB5fkMTf4VvbjC4Gt6INbSoB
 aQLtTYPnkP1zBjTCmV77l3M=
X-Google-Smtp-Source: ABdhPJy8c3SbMCVjwLGnJJ9sDOUCnnE+0fiDi4go6QAhsOfWrG+uqSUf5ar3mYtmqnZODA1yzia6dA==
X-Received: by 2002:a17:90b:b14:: with SMTP id
 bf20mr4623918pjb.231.1591176357821; 
 Wed, 03 Jun 2020 02:25:57 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id n9sm1797825pjj.23.2020.06.03.02.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:25:57 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] fbdev: geocode: Add the missed pci_disable_device() for
 gx1fb_map_video_memory()
Date: Wed,  3 Jun 2020 17:25:47 +0800
Message-Id: <20200603092547.1424428-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Andrew Morton <akpm@osdl.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Adrian Bunk <bunk@stusta.de>, Andres Salomon <dilinger@queued.net>,
 David Vrabel <dvrabel@arcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although gx1fb_probe() has handled the failure of gx1fb_map_video_memory()
partly, it does not call pci_disable_device() as gx1fb_map_video_memory()
calls pci_enable_device().
Add the missed function call to fix the bug.

Fixes: 53eed4ec8bcd ("[PATCH] fbdev: geode updates]")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/video/fbdev/geode/gx1fb_core.c | 37 ++++++++++++++++++--------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 5d34d89fb665..c9465542204a 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -208,29 +208,44 @@ static int gx1fb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 
 	ret = pci_request_region(dev, 0, "gx1fb (video)");
 	if (ret < 0)
-		return ret;
+		goto err;
 	par->vid_regs = pci_ioremap_bar(dev, 0);
-	if (!par->vid_regs)
-		return -ENOMEM;
+	if (!par->vid_regs) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	if (!request_mem_region(gx_base + 0x8300, 0x100, "gx1fb (display controller)"))
-		return -EBUSY;
+	if (!request_mem_region(gx_base + 0x8300, 0x100,
+				"gx1fb (display controller)")) {
+		ret = -EBUSY;
+		goto err;
+	}
 	par->dc_regs = ioremap(gx_base + 0x8300, 0x100);
-	if (!par->dc_regs)
-		return -ENOMEM;
+	if (!par->dc_regs) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	if ((fb_len = gx1_frame_buffer_size()) < 0)
-		return -ENOMEM;
+	if ((fb_len = gx1_frame_buffer_size()) < 0) {
+		ret = -ENOMEM;
+		goto err;
+	}
 	info->fix.smem_start = gx_base + 0x800000;
 	info->fix.smem_len = fb_len;
 	info->screen_base = ioremap(info->fix.smem_start, info->fix.smem_len);
-	if (!info->screen_base)
-		return -ENOMEM;
+	if (!info->screen_base) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
 	dev_info(&dev->dev, "%d Kibyte of video memory at 0x%lx\n",
 		 info->fix.smem_len / 1024, info->fix.smem_start);
 
 	return 0;
+
+err:
+	pci_disable_device(dev);
+	return ret;
 }
 
 static int parse_panel_option(struct fb_info *info)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
