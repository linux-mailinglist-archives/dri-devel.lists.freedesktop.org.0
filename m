Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF54AF0063
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083ED10E5D8;
	Tue,  1 Jul 2025 16:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="elu2O3IW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A8510E5D8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:46:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-235f9e87f78so35154865ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751388372; x=1751993172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=88Hysw7tfEWlpEWhG5IHKz75tKeJyeimvESHZHy/1Ic=;
 b=elu2O3IWPCaGw1bR08gwwGDhcGipMMYDeYhSHAupwJC/CbF8WMiWVZWOG/IOwABN5p
 CJ6qswo4YBEuvNIdxuCgoJm4YQslOBeJGBhEOzsSuTkwIv3u2bDFo5HxfYSwhEFCiTbZ
 wkfH62Ms6S7uuLXD3eBP2eiVzZS+fchGT198pbZ/3jnIoFjSZ8FMnBbJZbmR40GaExv8
 VTzCdRgLM2HyCIj/pdCfMfGAvM30OHh2lA4+YAbsnWxE35MuOARpc//5d1bGZiDeZ0x2
 mTuuLsjVOaTdB2yB9x9XrNbXOabAdMIhKRtTztlGn6E9D+shLG5K9KGGrDk/ZyG6r4vA
 pPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751388372; x=1751993172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=88Hysw7tfEWlpEWhG5IHKz75tKeJyeimvESHZHy/1Ic=;
 b=Nz0OiM29iipT9tybE+Lr+CPSXQnLcOEeai8ud+pXLdmKcLKvGGxfHwYfvzjVXpu7DE
 Lf68NLaYwk6VXVjJ+1Osg4Dt88jwO/eHrahEChRc/BBzz4diABmwWZH/H4ji6UA4yUvq
 P80uxNXQBhwNY7/bHDX9KqP+lKohbxmBQFUIGibnJwcF+m+4aL0zmo8qlrfwMQYUYYSm
 a8JnNzrwqzGeajoczoRfduUX2uxE9a7Pd2SJCV+KGJIwQZWMM/zKBJVgF5pSDlJgnESM
 Vea17tjMDz/l7S1t/MyNz7gPkNe5mt6H0opYvxyfnrag7KLuKA55HotbWxFefYMStOeI
 c3yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJg6NcnOAaNxbRzZdhJQKQ0LlSnimAAXDsPl9FgogtRwZXMbJvX27iuPrmBTgN0o3Y4OLr2AWbuHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTbnvF5A2RWqaP+3ZAEn1m1kpVws5uhY0zL6IlOKXCQJWFfvNU
 sF+uYT8VGCURtoI69TzbzhGljZ6uUP6k3VRxE2C5C6nhrCgLuWvHfKvmRdt+Xg==
X-Gm-Gg: ASbGncvRN8+A4rcE4abx7DLCsVQchYvFfGRHHJvrkl44N08mbUNWJBKyUkyg5BODfiv
 ISXQxVFOCGEg+ugxp+uCFTfT3RVTvebjkJJnqW5X3CysufL5+fBHdUft9ZtJGkKKUiTavZGta1L
 s9em9IYv8P8PEUhCxubhj0oiQKL0m3/wdg4TNnFQvelma+0iNdLoV92txSm65MJ+RFgnu15pWqU
 lIK13OpA1qddsp2QxfrFBfpvTDbPZEknjB+/HG3u5sDGfo9NKgqaH61mx++6nlvq5LC/ZMp1uuC
 dQnvei4l+Z1jjwhgAd+6ey+qY+ho1UXhjRpB9pBoD+QL+vTYQXPCqS509BOTtycu1Jo6CxSADTx
 VJQ==
X-Google-Smtp-Source: AGHT+IHZt0VfzJMOgeHLYEftDnYkqQIleGj42Y9oD2BZX1/zzbgD2ktrtUJsRLvt9haEWURtwL3Kfg==
X-Received: by 2002:a17:902:e849:b0:235:a9b:21e0 with SMTP id
 d9443c01a7336-23ac19a8a29mr306652055ad.0.1751388372372; 
 Tue, 01 Jul 2025 09:46:12 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-23acb3d11b4sm111050085ad.254.2025.07.01.09.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:46:11 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 22:15:36 +0530
Message-ID: <20250701164537.243282-1-abdun.nihaal@gmail.com>
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

The error handling in fbtft_framebuffer_alloc() mixes managed allocation
and plain allocation, and performs error handling in an order different
from the order in fbtft_framebuffer_release().

Fix them by moving vmem allocation closer to where it is used, and using
plain kzalloc() for txbuf allocation. Also remove the duplicate call to
fb_deferred_io_cleanup().

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v4->v5:
- Rebased on staging-testing, removing the duplicate call to
  fb_deferred_io_cleanup() and updating commit message.

I'm not sure if this needs a Fixes tag. If yes, please add this line
Fixes: 505bffe21233 ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()")
Because after that commit, there are two calls to
fb_deferred_io_cleanup() on error path causing a potential double free.


v3->v4:
- Added Reviewed-by tags

v2->v3: 
- Remove the if check before kfree of txbuf.buf, because it is zero
  initialized on allocation, and kfree is NULL aware.

Newly added in v2


 drivers/staging/fbtft/fbtft-core.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index d920164e7710..9e7b84071174 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -568,18 +568,13 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		height = display->height;
 	}
 
-	vmem_size = display->width * display->height * bpp / 8;
-	vmem = vzalloc(vmem_size);
-	if (!vmem)
-		goto alloc_fail;
-
 	fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
 	if (!fbdefio)
-		goto alloc_fail;
+		return NULL;
 
 	buf = devm_kzalloc(dev, 128, GFP_KERNEL);
 	if (!buf)
-		goto alloc_fail;
+		return NULL;
 
 	if (display->gamma_num && display->gamma_len) {
 		gamma_curves = devm_kcalloc(dev,
@@ -588,12 +583,17 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 					    sizeof(gamma_curves[0]),
 					    GFP_KERNEL);
 		if (!gamma_curves)
-			goto alloc_fail;
+			return NULL;
 	}
 
 	info = framebuffer_alloc(sizeof(struct fbtft_par), dev);
 	if (!info)
-		goto alloc_fail;
+		return NULL;
+
+	vmem_size = display->width * display->height * bpp / 8;
+	vmem = vzalloc(vmem_size);
+	if (!vmem)
+		goto release_framebuf;
 
 	info->screen_buffer = vmem;
 	info->fbops = &fbtft_ops;
@@ -613,7 +613,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
 	if (fb_deferred_io_init(info))
-		goto release_framebuf;
+		goto release_screen_buffer;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -668,7 +668,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 #endif
 
 	if (txbuflen > 0) {
-		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
+		txbuf = kzalloc(txbuflen, GFP_KERNEL);
 		if (!txbuf)
 			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
@@ -694,13 +694,10 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
+release_screen_buffer:
+	vfree(info->screen_buffer);
 release_framebuf:
-	fb_deferred_io_cleanup(info);
 	framebuffer_release(info);
-
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);
@@ -713,6 +710,9 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
  */
 void fbtft_framebuffer_release(struct fb_info *info)
 {
+	struct fbtft_par *par = info->par;
+
+	kfree(par->txbuf.buf);
 	fb_deferred_io_cleanup(info);
 	vfree(info->screen_buffer);
 	framebuffer_release(info);
-- 
2.43.0

