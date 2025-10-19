Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E690BEE654
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 15:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585310E1F9;
	Sun, 19 Oct 2025 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WxVYjbNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6E10E10B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 13:59:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b5dfff01511so94648766b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760882388; x=1761487188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IpzQRX6WX639uhyZU+I8IkskcZk9DHNRhRlL05G9pLA=;
 b=WxVYjbNX3kWnSA6lxHaYfYXdpPuHGD7zZllKbmEFB0+c60nDDZvRmRGgRFnxNj6pIT
 w/99rnU93PT1RAm/RZihApfHr8kn9bIN7gCbfg//JYi8u4t4ohXFohXlfUzJRskPjvYY
 is4Jy+dDXX2ed6/aUCVb2qx2a+nkez8AJAUnygctwsqZp3CHZ64ldsdhx+nqSgTiZWZF
 yaBTj5n1ev0jAMnDXX70lfc22dFDVCKFlTL15jcy2oP0MBAvRCw8wM5qPlypkyOvkr64
 lhUb4NEHgwCQpCU/W0xMcs/XzkqlGMkqd0rqxqL6K+N16JIM45J6WEYz4MoQocO909Te
 Zmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760882388; x=1761487188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpzQRX6WX639uhyZU+I8IkskcZk9DHNRhRlL05G9pLA=;
 b=pxYTzE7kVHeDqYNmqINatyFrKbmz2VwnVYRFVb3RXKmemr0kapM9UqStN1Fw7YSLd8
 lf+psg4uReS2+JsMOdHgSr3rmyGXA36GndjJnLHUJsGNfXUj4q1taqWafYRyU4FfcoIe
 CnJ0UjJhleCQ5g1jlNGtdfnZz2p8posFELSaoVx1+92fWkq46olNnV9ore/yVaLMLwkr
 CZOCSud3NDQezL1rgVMO5g/cYMn/OYoLgY6ZjEX/uH9np1mivLvtHYzyLCVCuZXSCpbB
 Cygq6jsUTR8lGfea/KXbZRscc+WAQ+02qoT/YPqYFEIYKLaqsYz/A1E/JwBSqaZvFMnk
 yQzg==
X-Gm-Message-State: AOJu0YyxidMJVAF/pDEWotg7aBhKl76KKYW0QPau+4A3w7BJXyeBaytY
 p7M56QRJwxfa0LbQoscb49R+1P03wb3kLbwkIZ/j37LYmitOyoIkJJ7J
X-Gm-Gg: ASbGncurw4T5/MHHEcZHoalUx9WtxYA9+kf65NQaQWafqjFM0ls+mWamwAy/7uBlLyS
 EZkuTxJxnOpQ94a82PjZWWedQ8VZzzDQXG7QR8d3G1X0V4jmDjhhHpvMrIElMbU/Hxxo82HsOui
 FQGqDhio7hkXXDKr3HruKakrV/zzoej045ra+kNiYNHlQcALzkNwvPFROrdFyLTIS1sX7EnV1dM
 iiAsGPI9B8SHFx93+cfyVVPC+1n4BNktQeHsJWM9YB9EkbPwYS2D2XfmuktLd7Q2THwCJjGCbeU
 +Qoy7NcXFHibHL5lOs1rwl7jdb1Z/+lkmpLIkh5W/VWBnLYJlzK1LamYo7dIsEwG+RxYFakV36g
 zmaOgc4KvbittlzpLZG6bC6GJ0yDcpHhBxxGvyICj1g7NhspQXzuDWfeyp1rYq52lDbJBBAOgfq
 hgR02X
X-Google-Smtp-Source: AGHT+IGKsrS2Ps3uAG4Ijn1Z/Ftl6Ae/MX6Mq06xwDMBoDY2q0splxnviYgwXvJO0FFabIICGi4lTw==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id
 a640c23a62f3a-b6475505d94mr636158166b.7.1760882387324; 
 Sun, 19 Oct 2025 06:59:47 -0700 (PDT)
Received: from bhk ([165.50.121.102]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da25c9sm520425966b.11.2025.10.19.06.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 06:59:46 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
Date: Sun, 19 Oct 2025 15:58:56 +0100
Message-ID: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
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

Replace kmalloc() with kmalloc_array() in several places to correctly
handle array allocations and benefit from built-in overflow checking.
This prevents potential integer overflows[1] when computing allocation
sizes from width, height, pitch, or page values.

[1]:https://docs.kernel.org/process/deprecated.html

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index eec43d1a5595..0ce630861d34 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(pages, ssd130x->width, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1519,7 +1519,7 @@ static int ssd132x_crtc_atomic_check(struct drm_crtc *crtc,
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(columns * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->height, columns, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
@@ -1546,7 +1546,7 @@ static int ssd133x_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
-	ssd130x_state->data_array = kmalloc(pitch * ssd130x->height, GFP_KERNEL);
+	ssd130x_state->data_array = kmalloc_array(ssd130x->height, pitch, GFP_KERNEL);
 	if (!ssd130x_state->data_array)
 		return -ENOMEM;
 
-- 
2.51.1.dirty

