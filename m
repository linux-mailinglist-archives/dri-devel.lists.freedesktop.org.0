Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C796A78CC4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A826210E74B;
	Wed,  2 Apr 2025 11:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MeMKTa2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226710E74B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:00:31 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3700038f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743591627; x=1744196427; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
 b=MeMKTa2yVeqhWUpauivZtbeLPZ9Q3Og0IeWS2FKIC/wpWufrwossKVngvvgaai3lYB
 Xe+KHtB8xae42SD0VqewJRMjxN2BT+Tu8NDteIZFKZcNUa//DaebwA6MTOiOG2k/8Qmx
 2WPRDObLI9w1IskazycMSS7pr7+5LSPRR/mCWYCwXDQhTvAKb95tMN4mZJAmQWgWqtSJ
 bQ9jXw6tYbItUfXsiB+v0/kdSl+QpGWx0QC9IjNLPX4EQOQuLBrjHQ0vzNLo6t3MqTCX
 hY6syTw3S1qoboiDYJT16P9lgQ4IOpLfDb/zoApRxf4AAu8YPQje5BBoULIqvY4+ifip
 qyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743591627; x=1744196427;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
 b=HlB5UC0ItZmfXuW8Qw/K9mI8cFkUgogCNHx/+bpT71q9RQKmCoxDGyKa3w9zKS8Qam
 N2MhkYgTCYtcKywmi+2hTBU/+uPL+rQayYV0l+fcUo78uz8qU6FG1ZkPghnPd/BKjjYU
 7WFeGU50H9Rgl1S90CSb8dfP2sAfwQ+8eshUBsub5M4BJZ1ahGXsaKBAnmYKzDIPEclv
 yTk5luC0P/ICD389PlL5u7cI5vQgnxDvfESWdSLknV5fcvxDax4sY4NwKGbGpqTVsYZJ
 tG9Fa4Ej0oBt0kdFe+moU0I5MAn7c0NWjwgbHR8x525EO9TB8nuGulYAgNxEFb1ObKM/
 QxoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIr95kay/G1+FrM3ITTTjftF0/hMWpqwD4HURqAbSWfUbi9EwQqsZIv/H8XebHY5a2TSSCiPTSt2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhl4BrTHwA4rVLssdz0kBw1QtR7sTiPyK2RRczzZMItdFpP2nG
 X7fRD9aMjYcxW0OdBxcMEFpFcV3ygkYjMO0TRtnxi9jG5ypIfuS/DIKkWLJnKT4=
X-Gm-Gg: ASbGncuGdmQdwJ7VtWKqT7zFgNme9pNBw/GGNO+FeGVHBdmEHoR6MIYbtE2nNXyx5xt
 lVr1IMoAM5iZM8o/LR4hCbXM/1ILMO7dJZeYg4pmoF70Ip6wA7GO0/MlFLUZM90oSzFMlq4Ybpd
 lzLXxiQ87HeANHY0/gtYalRd0I5xzAmAZtpJSxNKlYTPgWawX6lg69rV3JLqSOEaZFPjZ20wC5I
 q16aukZvqrPk5I+VssSid4Ym6kDLJ8znyJ2FsMBR2kzC5FRwgpEJ3F68N8V3NEnIPM1jggiOJCa
 B3sQknXnMByN6GLnpnA+pIi06x61or6joWDRCp1i3S7Sxk2JsFgIYwh+jQwh
X-Google-Smtp-Source: AGHT+IHvGT9STHY8C/CRWfPYi1GAudkPumuwpzo+YO6OzhKYGIHwkNQif12PUb6Nnfzjdo+udYpI/g==
X-Received: by 2002:a05:6000:1789:b0:391:4999:778b with SMTP id
 ffacd0b85a97d-39c120e1bedmr13908429f8f.28.1743591627519; 
 Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b7a41b4sm16391473f8f.85.2025.04.02.04.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:24 +0300
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
Subject: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
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

Call rpi_firmware_put() on these two error paths before returning.

Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..41e9d0aff757 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->core_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
@@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->disp_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
 		if (IS_ERR(hvs->disp_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get disp clock\n");
 			return PTR_ERR(hvs->disp_clk);
 		}
-- 
2.47.2

