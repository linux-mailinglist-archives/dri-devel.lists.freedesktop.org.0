Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB987E8A50
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75E10E268;
	Sat, 11 Nov 2023 10:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1024510E267
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so7977471a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699365; x=1700304165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDgHYbXQcqXOi8pgjjCFs89msy5Cd5Tn06zlqflQDL0=;
 b=EgHDYEtOplEKIkEKzN9gslZTDfr59URUpdrP4EeOmzAA23iTxDHlqFaeUhrE3yghs9
 zhph1BPDYactNYu0JGWDab0OkPB87wN/tAGEQ4beI8qpQUVrc3euo1019/IgaHiXpAe1
 xGITcr3AQuIvYuvVMLTXYpLd0SAiHB2/7qzMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699365; x=1700304165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDgHYbXQcqXOi8pgjjCFs89msy5Cd5Tn06zlqflQDL0=;
 b=JG7gHAPbzWMDGfwP+dGtaqk4ibKP5RtDw29DzlUmoxN5IPRWLYCirH1WjsKgdPL1Q3
 jk54J8UXNrBSW3nKUigP5h+Gl1lxURYBg8gSV9nXnAws4co+1SUgEy7yE5K3w5WTAjXe
 h4D5/J5rfMd3teIe6Cmw7NTNgRMYb2Y4/ZAy8idc5j34neZpxwyOTEvrg8YSKQXNDw2c
 1lRh04cgsSotr/7n3BE3hcMj5OnrpLJIe/x7ggG+Q8movE6y+qkgDaZndJkvJh6xxDEv
 uQ8jvjsC7gNMIQLGIeY0AuHpQQ85ky9+oUh1FXZnauUR3T3vWA7M0TqtXDdwF3eH+THi
 k9+A==
X-Gm-Message-State: AOJu0YyeMlZDTbA9VbPoJK5aOLl6fr40P3V4y2HEegXaswN3seVGFEQ2
 +uCVgefsaMnqdcYUGDIosc677Q==
X-Google-Smtp-Source: AGHT+IGWjzXZAnVOpqEeTHo29O9vwepCgThZZ6Cih0GL59Twpo4NVs/EaN2y7j4ks3a/O63PR8CCEA==
X-Received: by 2002:a17:906:80c4:b0:9ae:50ec:bd81 with SMTP id
 a4-20020a17090680c400b009ae50ecbd81mr4311227ejx.21.1699699365597; 
 Sat, 11 Nov 2023 02:42:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] fbdev: imxfb: add missing spaces after ','
Date: Sat, 11 Nov 2023 11:41:56 +0100
Message-ID: <20231111104225.136512-8-dario.binacchi@amarulasolutions.com>
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

Fix the following checkpatch error:

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 83497f6998f1..ad293dc44dbb 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -280,10 +280,10 @@ static int imxfb_setpalettereg(u_int regno, u_int red, u_int green, u_int blue,
 	struct imxfb_info *fbi = info->par;
 	u_int val, ret = 1;
 
-#define CNVT_TOHW(val,width) ((((val)<<(width))+0x7FFF-(val))>>16)
+#define CNVT_TOHW(val, width) ((((val)<<(width))+0x7FFF-(val))>>16)
 	if (regno < fbi->palette_size) {
 		val = (CNVT_TOHW(red, 4) << 8) |
-		      (CNVT_TOHW(green,4) << 4) |
+		      (CNVT_TOHW(green, 4) << 4) |
 		      CNVT_TOHW(blue,  4);
 
 		writel(val, fbi->regs + 0x800 + (regno << 2));
-- 
2.42.0

