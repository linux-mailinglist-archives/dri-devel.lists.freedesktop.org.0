Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD879072C
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 11:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11F10E228;
	Sat,  2 Sep 2023 09:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB1210E228
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 09:51:20 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-401b393df02so28323465e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Sep 2023 02:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693648279; x=1694253079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fbb5oQMsQ8lmQSEo8cUIG7jOpdgmCm7bwk/9zmNVbiQ=;
 b=LRN7cPg6MvwP7daxJ75Yl9LgPWPD5/h02ic48DsUL5MgwCyK2hL+hQf08eIxkB+ozN
 qa5kuJ+tgaS9QbrR8I5LgyT5W7XL9BtlMB8g/hO+cERd/VxT3cpp5Lsjc7mtlD/tZUss
 9uq4akziRA013vnaHyUl9STfgaMSoZ0bbF8ThRej8Jff7W/USq20LhJUN5y8ejwNvDli
 b8c0zdpkHTznYoMWxYPZYcdTTMIHT4k+Y9HK76vtTNAN7uNRyKvJyJhpFKrAvRi+gtBG
 JMMpdg6TSHEVoF2u0csRSMsZHpZuiP90pcIxSe+Z4dSLVi0hPh6eESdA3OV7rXjCbujL
 39Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693648279; x=1694253079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fbb5oQMsQ8lmQSEo8cUIG7jOpdgmCm7bwk/9zmNVbiQ=;
 b=HzxY8EPFQ7ARkljgjPwZJCN+TGvlIyitzfGng48KAgUhZqlvOqw3J6fv9VOzqOaB2o
 Wc6hU47lkK52TSGP37X6Dm1bNtH4ymVjGLRkkMguj4oNFC1eUaA4hgKrsreDRKQG3ydh
 nVxSREFB6eWGkqSNlaLYERSifTImB+i2fiSE6M0yGqd6ATtOMPw+kWnxl5+JL8Fh9qUF
 Cs1n3tRef1XRkYMbUSxaMz8TcAVxN4cObjVEY1Jl/s/Rw3/IjRuIT7SUJslANoXF2/x1
 zIkVJY5iwN4GKcw59KGa8NYv7HvpVU5L/Rtsx8xlqn7iAxrM8W+RC9C4b116y93j0NTu
 0PYA==
X-Gm-Message-State: AOJu0YyabybJHaj9sBTT1N/ZFu+bcET6NttWGvQVqwYVdz8rR0Xv5aN9
 J83zmRxtXR/qk6rCMcmnRPY=
X-Google-Smtp-Source: AGHT+IGmQa/GauRsf0/aiYROnGceuCwUpNyZyYJJQm+ebKyOLg4+r2rLhUqGi6WPLcJtraEtJNsWhg==
X-Received: by 2002:a05:600c:2153:b0:3fe:e8b4:436f with SMTP id
 v19-20020a05600c215300b003fee8b4436fmr3465957wml.14.1693648278261; 
 Sat, 02 Sep 2023 02:51:18 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b003fc04d13242sm10786628wmi.0.2023.09.02.02.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Sep 2023 02:51:17 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
X-Google-Original-From: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
To: Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbdev/g364fb: fix build failure with mips
Date: Sat,  2 Sep 2023 10:51:02 +0100
Message-Id: <20230902095102.5908-1-sudip.mukherjee@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Fix the typo which resulted in the driver using FB_DEFAULT_IOMEM_HELPERS
instead of FB_DEFAULT_IOMEM_OPS as the fbdev I/O helpers.

Fixes: 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/video/fbdev/g364fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 7a1013b22fa7..ee6fe51e0a6b 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -112,7 +112,7 @@ static int g364fb_blank(int blank, struct fb_info *info);
 
 static const struct fb_ops g364fb_ops = {
 	.owner		= THIS_MODULE,
-	FB_DEFAULT_IOMEM_HELPERS,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_setcolreg	= g364fb_setcolreg,
 	.fb_pan_display	= g364fb_pan_display,
 	.fb_blank	= g364fb_blank,
-- 
2.39.2

