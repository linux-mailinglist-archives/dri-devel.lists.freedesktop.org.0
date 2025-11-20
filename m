Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7DC75DB1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 19:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3386410E7A6;
	Thu, 20 Nov 2025 18:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZEA61RPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555AB10E7A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 18:02:59 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-297e264528aso14012745ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 10:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763661779; x=1764266579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OVOCoFGzHJ7bReA22yhITmPN5CZ4NhXsYXi1foSFcWo=;
 b=ZEA61RPIasMZ6BOIl0tgac6/hKK52w6OaEDTfygzBADz6IdSmE1i8V/ULmQXJqW2xk
 CGfyPmmj928H8UA4XNC8umc3G89tAaneG+t8L5MdIhzQcIyNXSqFskR3lg4kcgiVhYv/
 BtLZTPYHOxexpX91z2bI28df0YxyGmZIAkjJ9k9Rfo+TryWees20rwaahIWh7oCpgFF8
 kr7B6DcIH8pUQlq4k5m0r4hjp9kS4wwGEOluUUVl+QdJz8p/aSKuhQR4ouAZPVEVv40a
 JVV3yi2z3oL+r8tTaeOSDKH4kVWy0UfUTwQtXvxCaPqg6U31R0FWdnH6ZFPN3oUB1set
 8ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763661779; x=1764266579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVOCoFGzHJ7bReA22yhITmPN5CZ4NhXsYXi1foSFcWo=;
 b=RS2326MbiWbPBwBc9kUs8vwRcgKC+UPLnk1bXvO7XZciVJCTsb3eeOsYvuRZgYFNkq
 7S0hEjSgQATsN4xQ0qHggZtMao/8fb/8SAbDj+NWyHY5EpDQyw95alfLcJQlfE95763U
 S0fjZr1ZsYa3F36OyjTbTO6EQepHLJMH2Kd30jx93krLTJEa/27Jg1MVSQ/s3zRdo57a
 3V5+Cy1q3xdaxQCbWpxu4t3hx59JjYqfc+txmfYhJxXaw4gtqA+47kyMkc7Kekl3Gb9k
 kaR+EWHbd4RnzDRBh1lSKHsGNqEhenXR7ROdhqEluE22NZDN+Ukox9ay0K2qxjGBM+cJ
 wvQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM5DZnop3rJq4gXaG7W5S9zD+/JZ6wKcCdGIwALX2mTXF2z+qmGd70tUoOh0IxFPkeydO8EIGv0yc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEiLB0sXYbu8jrQHu37Zl26oYIxw5FQs0e9+eE47Grl6jjng1C
 H/0pmnqUE3EoH3UtvT+CuBKWdgfoU4QV2ocETMf6AnTo1vguCeK4l4t+
X-Gm-Gg: ASbGnctc3z7GVLiSePtgCptB473qeAZpwfe8sNg7dcqdRq2xV2koqlvexNo/gm+VDot
 u8Ba44RyAjypgoCpvQYODKhlOVIihudhFmLRxQarz4l1Ip61NPJRPHNhXoaLSQyI6fI5nKDbKuN
 qVY3mfGp/7N0J8x/3CQIxV3Nm38hSVt5xGjYNbcU7JqxSN7AcG9l+VLei3pkYwW4mVtm1/k+1B7
 n//I/4sjjw67pbxJzZijQXQbn5te0GZSV70rz0/qo+HyGLsXymN52M4Mn1H5RNqBGIdclfhm3l8
 W/zM8PuDjXLe8s1VYdap3SjOjEbQQEak9OphYHn8uvMUGHOi8+9m7szTI4fp0JWyl0CQE5ArMZP
 Iq3Pgc2eAqm20kUYiTg+iTs03/GUzXzy4svcsJIZmATnhmyf303yZ+ComJHzxMDatLkf3/emCAJ
 MrASPnWwg=
X-Google-Smtp-Source: AGHT+IGQuK6OHOkNhp4JqOpNkOEA0iq7GPJam063fPFCVHzw2hLDL/dgREEsMf/1FgZxDvo6dgcodA==
X-Received: by 2002:a17:903:2ecc:b0:296:3f23:b910 with SMTP id
 d9443c01a7336-29b5b02ea46mr45621375ad.9.1763661777896; 
 Thu, 20 Nov 2025 10:02:57 -0800 (PST)
Received: from hsukr3.. ([2405:201:d019:4042:962d:7736:8598:eb91])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b111e01sm32720885ad.7.2025.11.20.10.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 10:02:57 -0800 (PST)
From: Sukrut Heroorkar <hsukrut3@gmail.com>
To: Helge Deller <deller@gmx.de>, Sukrut Heroorkar <hsukrut3@gmail.com>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: shuah@kernel.org,
	david.hunter.linux@gamil.com
Subject: [RFC/RFT PATCH] fbdev: q40fb: request memory region
Date: Thu, 20 Nov 2025 23:32:27 +0530
Message-ID: <20251120180233.763975-1-hsukrut3@gmail.com>
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

The q40fb driver uses a fixed physical address but never reserves
the corresponding I/O region. Reserve the range  as suggested in
Documentation/gpu/todo.rst ("Request memory regions in all fbdev drivers").

If the memory cannot be reserved, fail probe with -EBUSY to avoid
conflicting with another user of the same address.

Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
---
Testing: This patch is sent as RFT since Q40 hardware is unavilable and  
QEMU does not emulated a Q40 platform. The change is therefore compile-tested
only.

 drivers/video/fbdev/q40fb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 1ff8fa176124..7b5c31745041 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -101,6 +101,13 @@ static int q40fb_probe(struct platform_device *dev)
 	info->par = NULL;
 	info->screen_base = (char *) q40fb_fix.smem_start;
 
+	if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
+				"q40fb")) {
+		dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\n",
+			q40fb_fix.smem_start);
+		return -EBUSY;
+	}
+
 	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
 		framebuffer_release(info);
 		return -ENOMEM;
-- 
2.43.0

