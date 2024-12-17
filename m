Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B019F4621
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0EC10E1B8;
	Tue, 17 Dec 2024 08:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="D4m5Akb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972F710E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 08:35:17 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-725ecc42d43so4257089b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734424517;
 x=1735029317; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6T3nxNZsTtm6HapI0ZCIF2ZP6Z01lkg3GaUKIVcPns=;
 b=D4m5Akb5dyI++1ZV4rdmmcwZaxh48cq3EfFz+tVmBaFUhUjCZI0Q2EhAefQ451nCJx
 8Z/VWdEXx8Pwm8lVgIukrAr/YNixGPFAYjG9s3KOEF7vW0tBFaURTDXkjSZZObgMC3Xn
 LYqAXf4/sP5ES8vrOuEWNKWm+b1Zy0Cs2yjEzhJuDf180Xz368yeAhFSIKGOYG1Bty6m
 p5WG8ZeyuRkNyR/1ENa/F9x3xBxgLINBX77FLp+SIoEvzrSA19fEupRMCAjA6BfTrQ0H
 +IyqslsKr8HZ9eOqzTefM/nWAKLtGPy0ijHx3OUczx7b/tGMeInHNWdoZJkeiJsYT0my
 +fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734424517; x=1735029317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6T3nxNZsTtm6HapI0ZCIF2ZP6Z01lkg3GaUKIVcPns=;
 b=iTRPqeDynGq4ajQZiy6jpFIEyxqhA2aeFvPkJmO2ZVnFA0xoBxn+eHcnXkb2lmwwTo
 60w4Ews2nlJxY0/rcec0bwqupaKcGAr9IvAvcnYU+mHKSVekYnT+GYkQHI22T6K517CB
 QJrdbN++DA6+ecDH8IuDTqju+YaMr/RMZSED2YNdRs+ux/w+qbHqgQ2aXsNc9V4yjLF0
 1Az7Qnt99wRL9nE1fc1LRS/oDg5n35y8Q3jdUZM9uHHAAIyYSth3HAOBynWjOIPXR+Lw
 zgdcFsD5pq2LfpeNzkpBZaje8oRJLZj0oouhEnetzZ6eSI1wNqlrs58ogsPI2Ac2620o
 +Rkg==
X-Gm-Message-State: AOJu0YyJIuh0tXuvR+waOqI4g9V+6hzB+pgVTk3hk7fVW/Y8Ulox98sU
 6hjJnxV6QilIUbhVM/MiQfs84HvYdrq8qY2MjIAha6a/WR83/8kOfjx67YsgapM=
X-Gm-Gg: ASbGncsP3qkZ0GVjuzB0+4Pv0KcqbirBsPLBhi1wHerdKcCzpydxRlNeWDHd2fEBNRK
 /17wb7B/U+2INCW67fyP/LOW34Ez7tMLgSjH4zF5kjN0tj/uDs+heLuSxM2j8GjcPkQpIfZXrJc
 iEOVWgdA0dSBkm7LMAB5dvXzDQpjDDAWm4vYQGsY+yK1Wi7LQnmvzJ5AUOAbG1CkNj0mogAohl8
 fa7XGZlXoeAjQgtfbdgkYPbrp2XvNK8prpCvumsEgyvzRZaTHFb+U9RgTUk23O/Gi8ebIEU2YL5
 FQPo
X-Google-Smtp-Source: AGHT+IG9r2E020to3EivbbvzUfJ4UJL8Hh6Orxu6UF5gYPQTiKsD3uD1fNNWLLou4WmbDKfxRRVjWw==
X-Received: by 2002:a05:6a20:a11f:b0:1dc:2365:4d7d with SMTP id
 adf61e73a8af0-1e1dfd54832mr24303077637.16.1734424517043; 
 Tue, 17 Dec 2024 00:35:17 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:fdbb:f275:7572:b1a3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bae6e0sm6087076b3a.165.2024.12.17.00.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 00:35:16 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] drm/tegra: dsi: fix the reference leak of the ganged mode
 device
Date: Tue, 17 Dec 2024 17:35:11 +0900
Message-Id: <20241217083511.106397-1-joe@pf.is.s.u-tokyo.ac.jp>
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

tegra_dsi_driver leaks a device reference, which is obtained by
of_find_device_by_node() in tegra_dsi_ganged_probe(). Add a function
tegra_dsi_ganged_put() and call it in the error path of .probe() and in
.remove().

This bug was found by an experimental verification tool that I am
developing.

Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpu/drm/tegra/dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 4a8cd9ed0a94..4225b1979f64 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1561,6 +1561,12 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 	return 0;
 }
 
+static void tegra_dsi_ganged_put(struct tegra_dsi *dsi)
+{
+	if (dsi->slave)
+		put_device(dsi->slave->dev);
+}
+
 static int tegra_dsi_probe(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi;
@@ -1581,7 +1587,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 
 	err = tegra_output_probe(&dsi->output);
 	if (err < 0)
-		return err;
+		goto put_ganged;
 
 	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
 
@@ -1681,6 +1687,8 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	tegra_mipi_free(dsi->mipi);
 remove:
 	tegra_output_remove(&dsi->output);
+put_ganged:
+	tegra_dsi_ganged_put(dsi);
 	return err;
 }
 
@@ -1694,6 +1702,8 @@ static void tegra_dsi_remove(struct platform_device *pdev)
 
 	tegra_output_remove(&dsi->output);
 
+	tegra_dsi_ganged_put(dsi);
+
 	mipi_dsi_host_unregister(&dsi->host);
 	tegra_mipi_free(dsi->mipi);
 }
-- 
2.34.1

