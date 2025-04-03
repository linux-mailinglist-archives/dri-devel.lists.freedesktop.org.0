Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED277A7A295
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A75510E226;
	Thu,  3 Apr 2025 12:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XQBNsLI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9556610E226
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 12:14:38 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso5239175e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743682477; x=1744287277; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7/jCevx24uOhH2Yv9CVXT91AbhBZfEmtWMRKLBjAx74=;
 b=XQBNsLI+zAxiDZojSTLYUxnQrv7JzXG1gpO4ngdkleHG3oEvn3lDmjDERQFvqMLohA
 lpTnOZPsnoYypF1zTg+PCgOcRVy62OWoU2z3YndhCFz6r5ivD1WgSEB60Lf52ribGyO9
 fCfyWI3qjfmvkGGQKVM+PeTMsYZyyOO7ZlMUsQFAJIQ6Ly9QAM1RB6Nmn5RVqRmuyMxc
 JSOLzP6zAiANa5/1HJbPnQF4xMltMijmTbTaRovQ8KveUciNxXRHEFIbJM+K0lrcerkh
 u3+IFxrT/uYwc6RPV6RHj26FEw/iXj86cGXM+8GJikKGnuLLYjZd9y7pyS/CdVgOHiDj
 pc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743682477; x=1744287277;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/jCevx24uOhH2Yv9CVXT91AbhBZfEmtWMRKLBjAx74=;
 b=UdcGpDFIaJRBwwv1EqdUxBbZubAEVy0iMKdHRhmHZNGIcfR7FelAVi12ED5Xz4V6jc
 hgu68xrczi7DIeMGJUIonnWMlV8DokjNJ/bUEfq1kHq2C0/m7RxpEiU1uBmNke4jDI4d
 jNYC7iFhh/dUly/eUEQvpUNYbVJbChuzCb+FNMCxt8rXGv9a5c0j73h7eEO2UU9t+IPP
 iduu8PamQyWNLVyU3dx4SH8KXUTTVqdFFAsg7ojf6EJJzmMIp3+VKDqLA8HhCI3t7rRH
 C5ClZfJ7pxpdWrHwYtMH5CFLeLXAaBFFXI8hyz8IeYHk5EjTLPxv9qtrZdmBeQNnty/U
 MfnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH7JneIbPCP9ZvMDB2cSxI5iTHWdBs2+XQ0eLR8lTWtmnTRwoumFJGndQ/7Bv/6MW3cLPdO26dc9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymseznynX4CGb+X3kXNsJ1T5sXYYdGok/H1nTWnFo0r0lnC3pf
 HlKjL//VCfbdqTOVMi/QJBwtN0WKbaBjVd4xDjA7hSmJvzaI2823OAl1Y0xOO4o=
X-Gm-Gg: ASbGncuyUQm+cZLhhlFnlSKFwmQVUhGnpPUYGmBYfDHUMQ6PEtdaaLW/r88y5ZhdVrU
 ooeifwVXXl2q2zxynUV7QiZSljpcAOoNjfB9jByxKGc5C9KKqDKP2PpjbMnewPQYfQKyhboI3me
 KZtM5hA8IotsJSoHlUhk/0kDI1nIViVJQqaJ6EynZgGexDvaLesHk0AhDGTJkDYPLdIZlH9+nXD
 gzJKdKb/VK2g9nTkikuBXXhKLRiyjaP712fCT69pivwTS7WEEGBn7FvkjYytARKZ2oovPlDN60i
 M7uPX2QRWofTqiNBJHcflI7NM/KQzJJe7IGbEDL6dopr7lqShg==
X-Google-Smtp-Source: AGHT+IGkavCS1QLioI0A5um9YHakZm/b68w7/8yrhL34IDIj0Vn7SXOf+jbx8K2zNM3v9nUYnPtePQ==
X-Received: by 2002:a5d:5d13:0:b0:39c:1257:feba with SMTP id
 ffacd0b85a97d-39c303ba531mr1381065f8f.58.1743682477082; 
 Thu, 03 Apr 2025 05:14:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c30096b9csm1667479f8f.13.2025.04.03.05.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 05:14:36 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:14:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

There was a bug where we should have called rpi_firmware_put(firmware)
if devm_clk_get() failed.  Really, it's better and more readable to
move all the firmware code together so that we can release it one
time.

Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use a cleaner solution

 drivers/gpu/drm/vc4/vc4_hvs.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..06aedd906d74 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1675,6 +1675,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (!firmware)
 			return -EPROBE_DEFER;
 
+		max_rate = rpi_firmware_clk_get_max_rate(firmware,
+							 RPI_FIRMWARE_CORE_CLK_ID);
+		rpi_firmware_put(firmware);
+		if (max_rate >= 550000000)
+			hvs->vc5_hdmi_enable_hdmi_20 = true;
+
+		if (max_rate >= 600000000)
+			hvs->vc5_hdmi_enable_4096by2160 = true;
+
+		hvs->max_core_rate = max_rate;
+
 		hvs->core_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
@@ -1689,17 +1700,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 			return PTR_ERR(hvs->disp_clk);
 		}
 
-		max_rate = rpi_firmware_clk_get_max_rate(firmware,
-							 RPI_FIRMWARE_CORE_CLK_ID);
-		rpi_firmware_put(firmware);
-		if (max_rate >= 550000000)
-			hvs->vc5_hdmi_enable_hdmi_20 = true;
-
-		if (max_rate >= 600000000)
-			hvs->vc5_hdmi_enable_4096by2160 = true;
-
-		hvs->max_core_rate = max_rate;
-
 		ret = clk_prepare_enable(hvs->core_clk);
 		if (ret) {
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
-- 
2.47.2

