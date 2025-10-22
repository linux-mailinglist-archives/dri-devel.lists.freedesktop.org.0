Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5032BFA2D3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ECA10E6AD;
	Wed, 22 Oct 2025 06:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iz1C3px4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B027910E6AD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:11:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-57e36125e8aso6137805e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 23:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761113471; x=1761718271; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H0+BgDGfdaSQSOaQDhEvXyp9Ns3uPDwLDm/lWJtPZkY=;
 b=Iz1C3px4YsqpFWU8szBqeeMtHScGZ6/YE7KtxXrSAStVIz2luMquKZO+w9xFG8RlM7
 M9JV3CeSQ6GWTgJfNen1rWzhobcEYOAnLHawEvktlzsOfQah/asnAYXy21Q7+63sKZ+7
 u9GyPQLq9Yg/bFfayYoe4c1J1XKYn0QKX4bp+bqd5RL+zVmIjKNh7XGReXJlZJ0ugImu
 hgY/UrEzSd2mVagv0bLIs5FYg7n7LvD/fWc2BaZ4HZDwqg5sIrwsYrrQvRzQVE+iECix
 3HECoScmmPmTZT5RAnkBhLwcCUOA4omLB+bCMjVaMvIBbv0MFVeO2wNtJS2eKDthabet
 l6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761113471; x=1761718271;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0+BgDGfdaSQSOaQDhEvXyp9Ns3uPDwLDm/lWJtPZkY=;
 b=JDkTVWbZk32NBBrXP6JiNrDRLBRTqA3BR1m+RP1R3DLWIAD7PvBNVQ285fV+NCrYw7
 oDGfmqDYegr0i6D/MW0J+4ao4ZPYsyuhl4yyoTPwUtTpVC8/eUv51Vua7N1CEti0Cbzk
 WZMEFt6qL/wrGjtvlUQiOZ+u5MDDO64zj8ebKQ5sSh7lckl08WYx3PwXM3pUtdMxIv7y
 pDFFvJp0q1ASbeTJSWFm4+nm5F2RvVgY6dn4ZBAgitgoVRpjBKwQmlpKC2cq6B0vJ7Nk
 ifvNhXm8v9loNefW2163DPI1C/99UP8vJH1bs60iX6c0ZY4mbK/zJ3n9iczDu4vmuj6p
 4vDA==
X-Gm-Message-State: AOJu0YwA/FFIROq7Y1B2UQtP3OO/ddvAakUvkdh9hsGv4r5AKoLYAk/S
 UYKKyeRigvhCV5Vs8rtEkrBSf2FolZgSMUmsUhMlZmC7b8nkdqI8Geb6
X-Gm-Gg: ASbGncumyGwwS6RnzvliytzX5ws4yUr7N7yzeT48uZ2NwgvIkhK29QFlcGGXu3wBj58
 TF0+t3FT/22vG1FTkYHSU5zJvUai508TV8PoxLTObao+UhTeIb35Aa+wZlyxYia+iMQHxBtrsSM
 2W/Kf0dQw9cAS6YClTCorxeGy9uGB48ewcf2n7b2eR4CRye1Q2SNTdjL9wJNMqN6c6UNxbBmjWh
 J1CAp4vtAg48aNBzuUs2rQXgISKUX1RYPVRb2Zi+BdlC8bT57Y0EGmzG7pZytXjXfHHK+muk3mR
 t6/5tVZHJ5h6dQCTesFhbHhv5nJo6h1z4hdsHArYZmeOp4CmNjkm/eMq9+y6rSrItHquakj4wQq
 K89mbZV1skqeCQ6Dv0CXuujj5NHKnrBg/WRQrAqBeE0GuKcak75zD7phKG254NOaJpdyMCZjius
 UetMlI7ZJNRMMfUupohmvViqRg1Co1m0zjM4ZoSUjVQM9srKPnU3csHfE=
X-Google-Smtp-Source: AGHT+IGDud48MYPYUyRNhPw1PG4OdE3gQrYlaeAVeQROu+jTZopngjWe2bD/jmGlNJeOxKzMvjADxA==
X-Received: by 2002:a05:6512:31cf:b0:578:ed03:7b87 with SMTP id
 2adb3069b0e04-591d858a844mr5437023e87.33.1761113470564; 
 Tue, 21 Oct 2025 23:11:10 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f039d766sm208072e87.71.2025.10.21.23.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 23:11:08 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 22 Oct 2025 08:10:57 +0200
Subject: [PATCH] drm/sitronix/st7571-i2c: remove unneeded semicolon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-st7571-semicolon-v1-1-83d322618ff4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHB1+GgC/x3MQQqAIBBA0avErBNyyIyuEi3KphooDSciCO+et
 HyL/18QikwCXfFCpJuFg8/QZQFuG/1KiudswAqNrhCVXNZYrYQOdmEPXk3OYGvdTNjUkLMz0sL
 Pv+yHlD5Yyop3YgAAAA==
X-Change-ID: 20251022-st7571-semicolon-bc5287cde264
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ovaGz5LWbEQy3l3kBh4Ix3pVci1hLdFEix4Tpa7cZKs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo+HV1DRQGPHoeDhzBWKzqI6DZcw21t8+YKDd1E
 gqDGfE/y2aJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPh1dQAKCRCIgE5vWV1S
 MnP2D/sFFHeJI+kLW2rsUU0mpvB6p3CxqSWBjzBb6IuKkkuoOz9HdeMTvLTR0GTQo+5GejvRsg4
 TjusQEmXW7XqGmYFKFZGnMtMB3G8jd7ffVGao5dzID7Xgf5JBuAha9z/U1Pzd1g1vOzxl8BKhKC
 681JdoD2r0hbr7f+9Lc4EWbAtGjeRZoP5Okdux+PBDd/J7uBUO8MvDEYpiog+D3yl26wg/No/vp
 XV2GESWyiQQ+P0GvnNk6P2YRM36DMj0x6mOIW3bsQZNyCgMDBnii/yaq8tFKERl0t3qI47wdOoC
 RM+QVfU0hBD4O+1zszaiaLcX0x3FwIKNZIaHHHZCAoZQeGkJlHxJcnh6W9Ri/U7LJcrsGfupRtP
 MkWAmLQZnt78B8r5aMVNAHdY4fSrPbLgcXNgm4NK0s+iPJQzn2XRzOVgznY3YqMkk7XdRUDAOlr
 JOQGQm4KmwY38NJcFEdG0qswbx/MeZnQg1obn68GVLaahbNRxRXzP6cti+hLcUfjBs/KDuSYvOH
 AhSk1amtbju3e0giCJngh9QTuS6ScpYghvK1rEAO+ZvF6kwVVV+75KHsF2FBZpC1pjwNpEaAbC8
 oT0aE3oKrNsDUYZl3Jrdou76yvKbluiMYY6vjLtepF3oxD+qt2WPJKAdfccUapbNjAxyWZfnrHV
 /VNiVwtDxHEmE+w==
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

Fix style issue reported by Kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510221125.Cg0sM4xJ-lkp@intel.com/
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 32b91d65b768b26caa7dcef42a00d36f236fbc32..4e73c8b415d677dab5b421666b56f4bb3697b982 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -322,7 +322,7 @@ static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
 		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
 		memcpy(st7571->hwbuf, vmap->vaddr, size);
 		break;
-	};
+	}
 }
 
 static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, struct drm_rect *rect)

---
base-commit: c1a7cc00cd412505e070eb4e62bc0b0ca85243e0
change-id: 20251022-st7571-semicolon-bc5287cde264

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

