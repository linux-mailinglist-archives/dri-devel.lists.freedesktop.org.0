Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC5D38C2C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 05:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055D10E06C;
	Sat, 17 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i/Ls+cTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7C010E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 04:30:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2a3e89aa5d0so26412085ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768624232; x=1769229032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
 b=i/Ls+cTjXafm1xBsOOMjdHtnDQGt7Wr8lErSsrrDJuBduPjSzh9Dk9IO98KyEXQu6+
 c/J8bMTe3qklsRPiIiHyM7u8kvLpKOd5JzhGTBFDbEnJw0IYLImzo3l7iQGuPX7HOCb3
 kT7193Xsg4OnrMe34iI6+oDXBYxxaRJw8EL21ccMWOkoAfl1HrTFhksKhk2OG1mYIzJc
 FvQLByPyDLSRfTfmaa4RMEnuJq8CxVD9rbwyIfG5RnnXjFX/8aiIemf1npaLPfdAD4gT
 M5pvQ76equCJQl+XxXpL8LEoxjreRKb3Gfcu/ED/vn2DP4D3QKQx7u/7CadMb5RVu3ia
 vB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768624232; x=1769229032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCrSsGPr19mQwGzLbkxTfgCN7ZB1b84ZZ1vrvJhEPMM=;
 b=b+K2FdFVQrKiCIlGEOQwPF+vOnZctf7zjOeFA6aBhUlhNPCaN8W8DgzjuGD0fZ+8LH
 H1YB1/g2yHIl3zFvTGF3g7ygSd2q/aMBX7qh8+PdjBvkpOHZW4TxTpiS0PN31x7N4e8v
 lnyor4GLt/110i7+6N+LsNqgvoh7/SOLb68sRMH/mSpgZLm8FAd+/Inu1QFFF29X+9rb
 d28XB79N3D3Es3ODf5X0zSvYYcMXrKWBLRn5XLhLMF/b2ngIATj0T5BVUBkX+WyES67n
 8gl6l+ni8mY2v217nRyubjMKRazOZnWLIcO59p4aj23syX+oC7mKJkhLHEvYWiW2Luo+
 8Mhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm83Nqou5/bzczjHBqP8VDJqkfab14MeTZXnIxMSi9xK/eX6CWMmL07xoXgQdmbcprP8fIdMr+nuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPV7lvgF5BCSjBb4qNulL7Qn6G55y8snihOL+irdkzErknqBQT
 Fb4JpND/Rn0C3MqEI41P59JGFpmFIhwMyPtVtcoABCaBcB77VxfSnsLx
X-Gm-Gg: AY/fxX4aRsBG1pblxKGAxC2kV/d6mrTjg+QDFPOBB6lBbbKgjfBMq7hfA/uq9dP9bR1
 yfjUqnUdJoq1zL4iStoyjdF+c3ifOFxpYkymmBQ7wJjpBR0bcDAunTLDww+2PLM9OT2BqhB3YKF
 FknAAaKb1JyQ8J7r9JoFflSder05M8iPH+troBp6l+1S/RetLMeIQ6ZocA3ws742BWkaWOtbEGf
 EI3cPfVmlNHVsG0KYMbtIzYfdJhIp2NCQYfch2Oe8GXZcnDpIFZ5TrCA2VX205JQF0FkMinDvJi
 2kt0sGCqH2u6Huq1Ab984H6xFEmq8pNUecUutBFaF7UdAdfuHref+A7OMMOJVXRWqrvPmQOHJw+
 OpQ1XtWuyxlVpAQbjdyd+M4A1qv6WgK6QqlItRInLe758IjBOmmme5B5KXWZLZtXv4GuMT+6NQ9
 bxjDE/ra1NXjsIeTDhWf5q3u/ygO4vr8EOIjWs9IB1F2U=
X-Received: by 2002:a17:902:f78a:b0:2a0:b066:3f55 with SMTP id
 d9443c01a7336-2a7174efc71mr45039245ad.10.1768624232460; 
 Fri, 16 Jan 2026 20:30:32 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:26af:b454:d793:29de])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 20:30:31 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v7 1/2] staging: fbtft: Fix build failure when
 CONFIG_FB_DEVICE=n
Date: Fri, 16 Jan 2026 20:29:30 -0800
Message-ID: <20260117042931.6088-1-chintanlike@gmail.com>
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

When CONFIG_FB_DEVICE is disabled, struct fb_info does
not provide a valid dev pointer. Direct dereferences of
fb_info->dev therefore result in build failures.

Fix this by avoiding direct accesses to fb_info->dev and
switching the affected debug logging to framebuffer helpers
that do not rely on a device pointer.

This fixes the following build failure reported by the
kernel test robot.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v7:
- Split logging cleanups into a separate patch
- Limit this patch to the CONFIG_FB_DEVICE=n build fix only

Changes in v6:
- Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
- Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
  handle the debug/info context.
- Drop __func__ usage per review feedback(suggested by greg k-h)
- Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
  (suggested by Andy Shevchenko)

Changes in v5:
- Initial attempt to replace info->dev accesses using
  dev_of_fbinfo() helper

 drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1b3b62950205 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
-		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
-		__func__, regno, red, green, blue, transp);
+	fb_dbg(info,
+	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
+	       regno, red, green, blue, transp);
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+	fb_dbg(info, "blank=%d\n", blank);
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
-		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		 fb_info->fix.smem_len >> 10, text1,
-		 HZ / fb_info->fbdefio->delay, text2);
+	fb_info(fb_info,
+		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

