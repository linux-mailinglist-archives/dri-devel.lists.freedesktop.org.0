Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97584D1B2CD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE8810E0E4;
	Tue, 13 Jan 2026 20:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJD53ecP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82B410E065
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:28:11 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-431048c4068so21919f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768325290; x=1768930090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EEEjpAa0hiVuWSNQpUBIYifaKxqsQfJ6JiXcZAA+XqM=;
 b=PJD53ecP9qdXJzde83zqjhUdAeYZKWEmFDwQDx81cndOJIhCdyq5Lgym7mPBOQORU4
 ElgHgCPv6pugYaO9Ss011JX0GZSN5mBrhAe+z2meNh+nqpFqGNIAB4pBTse8gmKCJCqH
 gMhLwBBiL0WJeZD8XQcNwWe1wBZokhSWsMp5ADAzlqx7RAEhmtkOwae8sbGg3+nsgGbG
 6R1wEblbJTzZSJfbiSZQW7X7+DRtYWZNk2xulcaAZKHdFn0tuMgm7bkMlgdPkUycZWo6
 7mReVVU0t8wHElGl6V0JDicFu0EACcDhOTht1KYziPtEclQ9dXKKFL40CyZR5MQXO9uh
 83ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768325290; x=1768930090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEEjpAa0hiVuWSNQpUBIYifaKxqsQfJ6JiXcZAA+XqM=;
 b=w3MoM6qEHmiW+hjYul9pGTBGC9kJ2h2PoRClOrYwWhfrO084qci34LeVlYp731B1Ei
 Bpy4pRn1grv1Cks0h5BLYbP2izyH1uGwpKLJdy3GPd0udO7OwrcH76ZhJT4OOlyBKCZ+
 EcSp04iA7KB2ICyyveDPro8qZdB4AAazLxrFY0BqOOp/aTXMWIGwVmPHYylvGr+aVfU3
 KV5Y2gui273hv3zD9+KRwiKYGsiy+yHbl+VUJLoBOs1Z6Wv7qbBOOmtaqQaQc3WCzCDu
 ixdXnIy6ULQ0c25FfBNI4xxg5sAZS606wKENjEfq96qfUPyaG+2WTeg5/TZoZH9Ed7Wl
 JZww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+jmZBjFghrHR1agAQmcZcodoedhK3iuitGiLib6mp9SlkU8SAAd0nSwBk2lrKh6DB3RoqG5+MXYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9h7IihYWlq4CadgbcXGa9HWJFZJTxOm5cMLN24tvPSTQyC+0i
 WxuAfWikXiFvSR0PfR4LfN8oBCuN7EQkK0ci1JLqot/tZH74ZJn7zqmq
X-Gm-Gg: AY/fxX59kwfpEA1ZSpbPyF0cUh0EgxLRyjgciqI6UB1JflRZEpxw1cMcOaKOMncQAaw
 JLfZSFxAr/oc367gGgpUAu4CkLyBOuyY3FuJN8sIXPB9OT8B8QUsxvaiioUm15bdRWtIE3YLmhw
 VqSIWeT5fOU6CIteeCQPTWuq/e4zDu5EA5Xqzjc4xLpGFHAdjhevxLgz9A11kTsPN12byYR2NV2
 bLP7puUN6g7FednQAmFkxuPBzlyxbi/AAJSsZWiYMILbc0dZ1uhnINqd6se/O/0FD8+kZBbsNad
 NNsdjX/M64x/0fR/z2+Z+BrVa4dVptzD+sim4fp17TSQzBppDnZQdi/i7EwimVCdNwHQxWjCuD7
 0KpOwXBM5DN1+WCt1vuBOy9MGmmILD4Dp9WKqeZJzCR226G7BH0idwuguoNT0ROrd57ipN/tn8r
 j27ViRizEq4UUrGFkyBDw3y6/QgKBC8WKEJkbMbUWiRruf
X-Google-Smtp-Source: AGHT+IHH51cskQ/rWPUY+DHYeuVH4jyvuoMluFfD7D37fHpkEs8+rYtzPOXZVsHRQyZzJD5N1Wq29w==
X-Received: by 2002:a05:6000:230c:b0:42f:f627:3a88 with SMTP id
 ffacd0b85a97d-43423e77f7bmr4931500f8f.4.1768325290175; 
 Tue, 13 Jan 2026 09:28:10 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.61.30])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm44792388f8f.1.2026.01.13.09.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:28:09 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH] staging: fbtft: Change udelay() to usleep_range()
Date: Tue, 13 Jan 2026 09:27:56 -0800
Message-Id: <20260113172756.14744-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Jan 2026 20:19:08 +0000
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

Replace udelay() calls >= 100us with usleep_range() to avoid busy-waiting.
This allows the scheduler to run other tasks while waiting.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..ee8d6b10374a 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 400);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..aed5cc7cabde 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 400);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

