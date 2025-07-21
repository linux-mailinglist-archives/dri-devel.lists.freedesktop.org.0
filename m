Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A93B0C188
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE3A10E4D1;
	Mon, 21 Jul 2025 10:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axISOskY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9DB10E4D1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:44:18 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-55a25635385so4844102e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753094656; x=1753699456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g94RElh8n5FdWhINQBgf3TM1P9IZtqRvM+lGnJwdOEI=;
 b=axISOskY39KHx9IZ/aXYt+NaoIG75oIejbpXGL4w7O5GuO/UNgND+DL7pW7HWtjc8g
 cRyzfH7qj/mT8vPqPGold5LrtR/9UiL67dHWuC6RvRo3Md5qf6ItIIVvcGcpT9mDvSvP
 AdfdVmAIenIQEEYJhl5rbgSu6e+e0yAQHLdwZmPWzrJFCoHaP1BGldw1ygo/xYTKWTBt
 xtncPPknBiIGIIrox7o1RLJuJwhewO+MWvix4eiyznBdEQwNgTzQlF0Vgn3tkuUzd7EW
 KPmwKP4LJZvYEbdJlsStJsZEEX/7HQ3HuSubGNfiOHJfBrGKiWnXoYaSRd3ff0wM754V
 sEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753094656; x=1753699456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g94RElh8n5FdWhINQBgf3TM1P9IZtqRvM+lGnJwdOEI=;
 b=IIfGbzqjN+gLd+QrRK/Tes/+i9Id7Q+M2IqBUq97EC/lfqzp5z/KUkp8zfnvg/gxJp
 szjPQRRpgzJuB7SnCEahuyyeOluDnu2SRBaxbxYsnbVGbXAc0MPpEIzoiJYSb4QylLvn
 5w9xc0JMkzd8WCmHjIQ0mAiTm42N7DRl/v79MFYgmzC6lq8nY/EzutgHcD4iGVpRiXFe
 TTS6g1e39yZVoKjE3743QbhM2YRv1/+Xipayr3gLLLUci9vN55V3IxxluX2OPdYzl9P4
 y0m8NFSLXFQSV7MmB/mbIzc1zwLWd2mxkEAi8i9OFaCZpcPs5kwo/AoavrWh767N+q8/
 osBw==
X-Gm-Message-State: AOJu0Ywf8NEG17jhFv/D5SR0X47SbktN+vr86tZ6S9EVtK6pwoe8geKS
 Xd8gs1mD0unnINGIh2qUuKPXcqH58pR3KKmDFZK0Yuem2CS7HZTIGcpT
X-Gm-Gg: ASbGnctuPb2SDA0bfeb38Jlm6wNk8kXQv1GTvaIArVLaphmAAZjib86kVybrG9nhewA
 ku1Gr109FxvUa5WhzvRc6DTO5Elo6WXdUOQshO0RzdxpxDG8WZUsf6Nn7q9h90NyD3/PTEWYukH
 rl8sp3cbD4pUrtIDoLbd1EpWlj/bdHDkJU8V2J+dxgGonUX55uOQjD9XibCQnm0TRk4wjdzRamO
 tr0qR5AhtdmdpG6yKMG6/tcf9vMyxQwBcDjSUmbUODnjWy73NOCVnv324L/Ry8SpYrmS3DHNOFi
 WENugnh/pT7l+XAr+nsvyzre6riKEJB4NFGAK+GHF0VNi7tOpTOPUL4kdODP5URLivuXA5/2dJN
 fTY1JSRsXeFYWOAiEFeBYATjicYWc00pcfR2b8U1QyYjkbiOWMwsDEfZNg9qElEUChO8=
X-Google-Smtp-Source: AGHT+IHkGSC0km51BD6ZF4Mf93uahDRHJELprcnQqkqQ/veK9u3GssP0LAfbM5e/0BcP+puuCr3y7g==
X-Received: by 2002:a05:6512:3d02:b0:553:510d:f470 with SMTP id
 2adb3069b0e04-55a23300e4amr6363513e87.4.1753094656252; 
 Mon, 21 Jul 2025 03:44:16 -0700 (PDT)
Received: from [192.168.1.198] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31db89bbsm1505164e87.237.2025.07.21.03.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 03:44:15 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 21 Jul 2025 12:43:34 +0200
Subject: [PATCH v2 4/6] drm/st7571-i2c: add support for inverted pixel format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-st7571-format-v2-4-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
In-Reply-To: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2429;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XXw5Ljs40nuD+6Xw/IEzZjAPPPvss4V5WiaBhIEjKmM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBofhnoXeJ5E1rL0wCRLER895ZymN6j36cstqv2u
 RpuZEaFDjGJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaH4Z6AAKCRCIgE5vWV1S
 MonCEACA0O2iGW1ogh59ZdknKyjz24l/VRyP5T2CXUH073SIz9mlwGnd2KV5VvDbkID0c0CbRMQ
 Po+hscDGzVgk+p5ml1yzX1TcG6RF/EIL4pP3HLr4yLhu7KcEGLxgAoUYbp6U4p1ymmOgyXlj673
 ZZUHs0yVw/E49bfNnrg2tcTFC6frf0IyJN+ADrZVIsyvQDF00smM48V38BxPQFoRLZAGB0jcB3Y
 oH8kV9LfkbELthvvlYX4MUMvdowjQw4qBu0bNO1Ek8E64u1pruat8kO0HhF8B/8nHtHBW37B/dA
 /uiWpIuBDGn0EEr+NOMDWn71otV0+3SB+tDYZbnbmVbPFKgFOppjVh7su/N+drgcwKFr6W3S+VP
 km6xdnY47b1j5YgQgEqJQCKgYpFMYyZNHtf5Y8ViuN6PeEmUliPr865Ct9QuOv0FHKcaew3HP27
 hOja8noIRsN/ZxnqEXsFVyZvQclXU+Jr0X1utlzU/p4lwpHtMt5YQG73X3kgLp2QV/JYC4xLID9
 0OrGcPDIIwdtHgxKBICTELJzr7m9gpBJE3c01akRl2moohTKHwW6or0Ee4nA6MdVD8BdRtfsePq
 laA604TFpnPVepLMNc5gcCeHTPbobvF1Sk1sDkdBwuG+aqk0oLOXOLAMKlDeyAdWox5c971k27m
 QATuWptg+wz7ESw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Depending on which display that is connected to the controller, an
"1" means either a black or a white pixel.

The supported formats (R1/R2/XRGB8888) expects the pixels
to map against (4bit):
    00 => Black
    01 => Dark Gray
    10 => Light Gray
    11 => White

If this is not what the display map against, make it possible to invert
the pixels.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index dfdd0fa4ff24090c3cbe7ab162285be45464d6a6..9f2de057ce9d990fdd77e395a6c32ba1e2f36137 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -151,6 +151,7 @@ struct st7571_device {
 	bool ignore_nak;
 
 	bool grayscale;
+	bool inverted;
 	u32 height_mm;
 	u32 width_mm;
 	u32 startline;
@@ -792,6 +793,7 @@ static int st7567_parse_dt(struct st7571_device *st7567)
 
 	of_property_read_u32(np, "width-mm", &st7567->width_mm);
 	of_property_read_u32(np, "height-mm", &st7567->height_mm);
+	st7567->inverted = of_property_read_bool(np, "sitronix,inverted");
 
 	st7567->pformat = &st7571_monochrome;
 	st7567->bpp = 1;
@@ -819,6 +821,7 @@ static int st7571_parse_dt(struct st7571_device *st7571)
 	of_property_read_u32(np, "width-mm", &st7571->width_mm);
 	of_property_read_u32(np, "height-mm", &st7571->height_mm);
 	st7571->grayscale = of_property_read_bool(np, "sitronix,grayscale");
+	st7571->inverted = of_property_read_bool(np, "sitronix,inverted");
 
 	if (st7571->grayscale) {
 		st7571->pformat = &st7571_grayscale;
@@ -873,7 +876,7 @@ static int st7567_lcd_init(struct st7571_device *st7567)
 		ST7571_SET_POWER(0x6),	/* Power Control, VC: ON, VR: ON, VF: OFF */
 		ST7571_SET_POWER(0x7),	/* Power Control, VC: ON, VR: ON, VF: ON */
 
-		ST7571_SET_REVERSE(0),
+		ST7571_SET_REVERSE(st7567->inverted ? 1 : 0),
 		ST7571_SET_ENTIRE_DISPLAY_ON(0),
 	};
 
@@ -917,7 +920,7 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 		ST7571_SET_COLOR_MODE(st7571->pformat->mode),
 		ST7571_COMMAND_SET_NORMAL,
 
-		ST7571_SET_REVERSE(0),
+		ST7571_SET_REVERSE(st7571->inverted ? 1 : 0),
 		ST7571_SET_ENTIRE_DISPLAY_ON(0),
 	};
 

-- 
2.49.0

