Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63863A9FC75
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335510E27C;
	Mon, 28 Apr 2025 21:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9hVPspO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE210E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:40:56 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso53066785e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745833255; x=1746438055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWdl+Kqq58dT2qY6KpY9tsh+8ZNojmQ7ty0C+vUxAbM=;
 b=i9hVPspOlBYI8f+oSNOk4OwXBe9/6taF3bR03ASCAVNS5Hg4niAxDuVCthDM38fZj0
 SjpQBqakFQURJvZrU5tpQG+VtsLPkPlHMhqQgvRS7P9M0aHHIa1sfAcHRWi5mrJ6GrA/
 vAKYa87U96yyP3UK5xtslM9Q+MeThXIQrCn9IVgF7z3tmjGDQLSaqJsS0FMk2vQJsMWs
 k4Y7OnM4I6J2459AsqqnC+XepvLO16rY5i5eSTmx+BY+JWjjcbSBRI5VHh0wRq/YY3hO
 whcp8lJlCtIYlEAHo0LBuQXIrUB4Dd8BVdU9klwPOCg9XqXbET9/IoC+JHhxIPCD+vZW
 rqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745833255; x=1746438055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWdl+Kqq58dT2qY6KpY9tsh+8ZNojmQ7ty0C+vUxAbM=;
 b=N9RQ1tM1lDu/iRHsDRqO68/zuDVJ05+sGbsknv1SB6+SRdVAkQfHTkfUM1sdys0VnP
 S04or6N01Db62lp/KBwsrsq3jS2cAMRIgOGE/ObsyRWzXBFXF3dCa9L7ZoLqvioQkWFX
 mEVnspmB05ac7vS48Y5WZDXGX+aYQiVS9p5ZBAOVRRMFd/P455Crk/1LvJWqUnSr/bnK
 SfZx7UHTX8VQibWi0V9caqNdjspmxwsJ1VAvr/Y9H/j86cf0FZZSkh7oIYC4NisGyuTZ
 CHuSdaCGSsj6EVRgWfCmu4HqBCAy+nYlv4wlGP9TW/vIDe5UUZLArjjH1MravLjUlyvY
 XkjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt4PGaInuj2VtpcXYSOVoa4sN+rVpshY6aVSMGVMTmfSOPjZ1B2gPbNqPkwT2BB5gyJa6YD3orQeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVsUW4aFH8jApGzwYAL/iyVF5THzpQyHF2Byker+JooTYj+26J
 vnWsorsyypD99SSALUpmy7TkwLBAeONBzq7K7nFgW0zWNqGPm3AF
X-Gm-Gg: ASbGnctxR/HGqb8MHF9fXFrincuCCjTKMmf6XEp7y7SRUt3JmrqUVQUoDL+N/2XnRbi
 ECv6P+DYz8V7f61YsxQyUSKK+KIRMMrZCrQT1PkU2rdsBh1IQLyHe44c6ojJwZ0OEE9i6udmWoS
 cCOqCR5nd2fbQMpGBGsloTa833cv5eQmXE1rdmyj0hHgHYhJuJEl4ljeYPfgbANjPGrN6Ko3I68
 h66inDvoHJiJX4UXUrhunaOIaZyPAF/t5/XkW2kYtUIz0782OfFmi+xsjaKKK8BESVz6OsIE3IG
 OYgm+iPJ+jQXwjLJdICg/lwIbsH93UlrOT+NaA==
X-Google-Smtp-Source: AGHT+IH5WZ2I2b6xONMXmkTLp55tTW8AkFEOLovibWPPY96a7fFSfSjudvpq3AXJ+RQ8zoo5DYpahA==
X-Received: by 2002:a05:600c:5120:b0:43d:22d9:4b8e with SMTP id
 5b1f17b1804b1-440a65d8e5bmr109031545e9.10.1745833254418; 
 Mon, 28 Apr 2025 02:40:54 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e602:d900:4f54:7a4f:dfe1:ebb6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2d8343sm152687785e9.28.2025.04.28.02.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 02:40:54 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Vitor Soares <vitor.soares@toradex.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, ivitro@gmail.com,
 stable@vger.kernel.org
Subject: [PATCH v1] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Date: Mon, 28 Apr 2025 10:40:48 +0100
Message-Id: <20250428094048.1459620-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Apr 2025 21:45:29 +0000
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

From: Vitor Soares <vitor.soares@toradex.com>

The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
for both runtime PM and system sleep. This causes the DSI clocks to be
disabled twice: once during runtime suspend and again during system
suspend, resulting in a WARN message from the clock framework when
attempting to disable already-disabled clocks.

[   84.384540] clk:231:5 already disabled
[   84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c:1181 clk_core_disable+0xa4/0xac
...
[   84.579183] Call trace:
[   84.581624]  clk_core_disable+0xa4/0xac
[   84.585457]  clk_disable+0x30/0x4c
[   84.588857]  cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
[   84.593651]  pm_generic_suspend+0x2c/0x44
[   84.597661]  ti_sci_pd_suspend+0xbc/0x15c
[   84.601670]  dpm_run_callback+0x8c/0x14c
[   84.605588]  __device_suspend+0x1a0/0x56c
[   84.609594]  dpm_suspend+0x17c/0x21c
[   84.613165]  dpm_suspend_start+0xa0/0xa8
[   84.617083]  suspend_devices_and_enter+0x12c/0x634
[   84.621872]  pm_suspend+0x1fc/0x368

To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
DEFINE_RUNTIME_DEV_PM_OPS(), which avoids redundant suspend/resume calls
by checking if the device is already runtime suspended.

Cc: <stable@vger.kernel.org> # 6.1.x
Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b022dd6e6b6e..62179e55e032 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1258,7 +1258,7 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops = {
 	.transfer = cdns_dsi_transfer,
 };
 
-static int __maybe_unused cdns_dsi_resume(struct device *dev)
+static int cdns_dsi_resume(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1269,7 +1269,7 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cdns_dsi_suspend(struct device *dev)
+static int cdns_dsi_suspend(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1279,8 +1279,8 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
-			    NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
+				 cdns_dsi_resume, NULL);
 
 static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
@@ -1427,7 +1427,7 @@ static struct platform_driver cdns_dsi_platform_driver = {
 	.driver = {
 		.name   = "cdns-dsi",
 		.of_match_table = cdns_dsi_of_match,
-		.pm = &cdns_dsi_pm_ops,
+		.pm = pm_ptr(&cdns_dsi_pm_ops),
 	},
 };
 module_platform_driver(cdns_dsi_platform_driver);
-- 
2.34.1

