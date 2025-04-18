Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8EA93779
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9610EB9B;
	Fri, 18 Apr 2025 12:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IkPTTj0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9053710E20A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 12:51:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so1232087f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744980702; x=1745585502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fSI7eAOwKER7UtUiex4GHzeLYi9Hq3SA4vwSh7WcZHw=;
 b=IkPTTj0EuogTGPlvBThBwfD5tUzYkypWASvM/WCTqnC3ur08pms1eyiP4oOw5829Yj
 A1CgUm++MZO9GkZjY5lJSkIWeEGAkqIGTj/P9EnnOH9CirLwCd9IWzA2fY1GnGBrBJ4k
 V+wrcGYGJ9ef/QhLxsKswxQv7OQq/M0ycMuRVBbV/rKrU/27IS22JvMVj2xZfZ0YSpWE
 rC4JV8twT7O2Bx0/nuA6gINfW2cSLR6FqzCb4gusUgy9OTJE34e58q0Gk81sopF+dZvg
 5puy59woGpi5B+ddRUfG4N9lpcKJFzyZOqB+pTZxFauZN0eOoCpO7X0LENufj/j2GeD7
 TmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744980702; x=1745585502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fSI7eAOwKER7UtUiex4GHzeLYi9Hq3SA4vwSh7WcZHw=;
 b=NukVSQrrBlFdB/B2arC/ioOMg+N6HwkCE96b3pwACLQvSOgzix/mBAV5cwd2wOOluN
 qdCYXCHZeyhIpkhjKs0EVoqKmwKrd5LueurCalh7XzM3xJWrfnVHJH+7enmf7tnu7uY3
 pMLElTZhUzTNSyfeYEIgP8CVvJ6ZoS1/X3SJeSwBeTHxLX0SUvKIFEQkNO8BR1/Pzkpe
 FY3a28fsHJiYJYNQSDahc6F8JIKSLVFlxxfkg6KruyguFSO2rYR+KHQstSwyDNqMma5N
 E6+qzmkJ+ak0XYw+UGzXyrqcnAW9Yo4hdY0BbhMiKXLVJplqLbKHdBpGY4VdD7/OXUVU
 5IKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCNn4IghQ8zn4pxikgEyelCcKJJfwijOY4d5XUnZPG2QSHM0hdAAHL8lWutbp+K9ePpLadu0wyDxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn8hgdtrfNjS7NgcZNzxj4Y4Fsk9cgAgP64l9k3JgcTNqyqpWK
 F8u4FJVfljmaX2k0jDZW9ARUs1xHqS/TzSG3Afjzr7433MvEeTB4
X-Gm-Gg: ASbGncssI9yp4U4x8Y29P3dSmzw/bMH1TmN7pjhXXa2c8ac4Dw6oaNu/FRvaa4/n2/G
 iM6GeXUVRxnVJXf341h3J5zgFOEzZXNRKzuriAn4NVi+Fd85x2jbw6fFN89SanVsON9c5GdLcce
 PcbkyaRmVDbVnnksV1/CdeRaiZEg7dkYMu/OygK9l3zIfBzoKZ7j8hh2lkcMNKCPxHWlIiNBrbA
 Mt3pokQyBB+S7OO7adEjzY3d1ix1biSc7CPXFaTx8p10kSwXLaCPRR5YYujfuW55iK9dnDX8OYO
 /BQI+xtnxDRO9D50DfHwNtwXb7zcs2PU651N7HIsZg==
X-Google-Smtp-Source: AGHT+IGRLN4xXyDof+aLmH9LIsvIdtLHzEudvt2mvZiXNlcTq7vBl8qMI8mV10llHh3CBdT7Fc0KOQ==
X-Received: by 2002:a05:6000:2283:b0:390:d6ab:6c49 with SMTP id
 ffacd0b85a97d-39efba6ba65mr2283592f8f.35.1744980701688; 
 Fri, 18 Apr 2025 05:51:41 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa433133sm2656282f8f.28.2025.04.18.05.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 05:51:41 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, Colin Ian King <colin.i.king@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fbdev/carminefb: Fix spelling mistake of
 CARMINE_TOTAL_DIPLAY_MEM
Date: Fri, 18 Apr 2025 13:51:35 +0100
Message-ID: <20250418125135.539908-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in macro CARMINE_TOTAL_DIPLAY_MEM. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/carminefb.c | 8 ++++----
 drivers/video/fbdev/carminefb.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/carminefb.c b/drivers/video/fbdev/carminefb.c
index e56065cdba97..2bdd67595891 100644
--- a/drivers/video/fbdev/carminefb.c
+++ b/drivers/video/fbdev/carminefb.c
@@ -649,13 +649,13 @@ static int carminefb_probe(struct pci_dev *dev, const struct pci_device_id *ent)
 	 * is required for that largest resolution to avoid remaps at run
 	 * time
 	 */
-	if (carminefb_fix.smem_len > CARMINE_TOTAL_DIPLAY_MEM)
-		carminefb_fix.smem_len = CARMINE_TOTAL_DIPLAY_MEM;
+	if (carminefb_fix.smem_len > CARMINE_TOTAL_DISPLAY_MEM)
+		carminefb_fix.smem_len = CARMINE_TOTAL_DISPLAY_MEM;
 
-	else if (carminefb_fix.smem_len < CARMINE_TOTAL_DIPLAY_MEM) {
+	else if (carminefb_fix.smem_len < CARMINE_TOTAL_DISPLAY_MEM) {
 		printk(KERN_ERR "carminefb: Memory bar is only %d bytes, %d "
 				"are required.", carminefb_fix.smem_len,
-				CARMINE_TOTAL_DIPLAY_MEM);
+				CARMINE_TOTAL_DISPLAY_MEM);
 		goto err_unmap_vregs;
 	}
 
diff --git a/drivers/video/fbdev/carminefb.h b/drivers/video/fbdev/carminefb.h
index 297688eba469..c9825481d96b 100644
--- a/drivers/video/fbdev/carminefb.h
+++ b/drivers/video/fbdev/carminefb.h
@@ -7,7 +7,7 @@
 
 #define MAX_DISPLAY	2
 #define CARMINE_DISPLAY_MEM	(800 * 600 * 4)
-#define CARMINE_TOTAL_DIPLAY_MEM	(CARMINE_DISPLAY_MEM * MAX_DISPLAY)
+#define CARMINE_TOTAL_DISPLAY_MEM	(CARMINE_DISPLAY_MEM * MAX_DISPLAY)
 
 #define CARMINE_USE_DISPLAY0	(1 << 0)
 #define CARMINE_USE_DISPLAY1	(1 << 1)
-- 
2.49.0

