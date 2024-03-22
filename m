Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8973887117
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 17:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59273112609;
	Fri, 22 Mar 2024 16:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEumzYf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D96112609
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 16:45:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34175878e30so1354417f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711125930; x=1711730730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkckiT/MUZpay/oqQb7f/JkIe5zR2ftgXQzhuQxI+RM=;
 b=BEumzYf1eyXJVPGZV0oCd6CKSsBF8ggbuGxnyA138IfxfwgEmVUYk1OWMxuC/01308
 1pRAkDuhCtuTKMWY6MoqtZww4CAZ+SZs6U54yyQ2OSxi8kUV1yG2y1cAVbz9cTSF3RMf
 6hImSAgJnsadDkFgMDeTaAVcBC70PC88eeHdIFNjPZneImyGPHu07EW+9I0q5BZEJ6/O
 vEIABR+OULlXNhDFDpLMvKa/BWqUa6JZSlOLgrqfnt5PX4dFDh6qC9fQfiXPEcEJJEbI
 4tDQ22wYYxNH1h+QW5LtvVqAMP28+mqSIcl237f0kt/2bwFIU+3y36DnvuUwgDV9TOab
 xsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711125930; x=1711730730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkckiT/MUZpay/oqQb7f/JkIe5zR2ftgXQzhuQxI+RM=;
 b=OdfDxp4UnrMxwE6Xy0HpSsNu2d9ARc8SoweXut6grYqUdsY0eeUu6IO4+p3VfLAl0Q
 GMv5mZkMr2yc3VO4BYuFh0N+wYdkqfiFU6/z18OIUvs3yX+Ha2T67a76xL2hrMfcFG5r
 wB2P0oqxGVrNc8xdejlG39wH0hJUkPNd1GrbK5oZ+BT8SHgdW0OrfGLzcBMPxE+2WYT2
 jJvz4JbiFxuFuR7InLvFlOsoRO3LAbPKhMfyzlw26861mlGjvA/CZ+gaB8GVHuoZR6/7
 Hi0hg/tn98wxwsE2qgFTljWuaOCKH0p9E+AJPeg7IaI+C4p17s+/Yg0HVamoyWVgUwfj
 tUCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW+MJtK/6JyaXSVzu0yRni6AQlx1FBQAoihhUONSlY1kZUOUVLoCXSfrwqignQmDVdNa7Ad5JIRk/tiHeC34m351cQHf9cudQIyS/3rjXb
X-Gm-Message-State: AOJu0Yyza7qTWqJK+YkMFQ/vFnYhuRRwS7f7nmoIcIBH/EhJ/5Ie4+YA
 IiytrfVp5CRINpD3kCzHsZtm/cnoREAHVv+LY+cjX+cf1aIaArrf
X-Google-Smtp-Source: AGHT+IHSQaiEfEpnVF4LlimL5r8Q0Mx7e+wj/Pb+bz/9C3rX0Vqa6m/VTajZzg5PovyOp4+g+1id6Q==
X-Received: by 2002:a05:6000:245:b0:33e:7a71:1a34 with SMTP id
 m5-20020a056000024500b0033e7a711a34mr1922893wrz.57.1711125930074; 
 Fri, 22 Mar 2024 09:45:30 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a5d5a03000000b0033e9f6997c7sm1989107wrb.66.2024.03.22.09.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 09:45:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: fix power transition timeout warnings
Date: Fri, 22 Mar 2024 16:45:25 +0000
Message-Id: <20240322164525.2617508-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Increase the timeout value to prevent system logs on Amlogic boards flooding
with power transition warnings:

[   13.047638] panfrost ffe40000.gpu: shader power transition timeout
[   13.048674] panfrost ffe40000.gpu: l2 power transition timeout
[   13.937324] panfrost ffe40000.gpu: shader power transition timeout
[   13.938351] panfrost ffe40000.gpu: l2 power transition timeout
...
[39829.506904] panfrost ffe40000.gpu: shader power transition timeout
[39829.507938] panfrost ffe40000.gpu: l2 power transition timeout
[39949.508369] panfrost ffe40000.gpu: shader power transition timeout
[39949.509405] panfrost ffe40000.gpu: l2 power transition timeout

The 2000 value has been found through trial and error testing with devices
using G52 and G31 GPUs.

Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 9063ce254642..fd8e44992184 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -441,19 +441,19 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 
 	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
-					 val, !val, 1, 1000);
+					 val, !val, 1, 2000);
 	if (ret)
 		dev_err(pfdev->dev, "shader power transition timeout");
 
 	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
-					 val, !val, 1, 1000);
+					 val, !val, 1, 2000);
 	if (ret)
 		dev_err(pfdev->dev, "tiler power transition timeout");
 
 	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
 	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
-				 val, !val, 0, 1000);
+				 val, !val, 0, 2000);
 	if (ret)
 		dev_err(pfdev->dev, "l2 power transition timeout");
 }
-- 
2.34.1

