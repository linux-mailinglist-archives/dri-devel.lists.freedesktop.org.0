Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36740AB31B3
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5B010E30D;
	Mon, 12 May 2025 08:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FZl1wqN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A5B10E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 08:32:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a1f5d2d91eso2117058f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747038742; x=1747643542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYXcYfmW92NwQS8DOWBMZ1iD5TRg6ruyTQhU7K965SU=;
 b=FZl1wqN5R9pQHTR9B/avmNvHZcL3lQemNtnQBFr2JV/1sOanuCk+iIjalVirwhg8kf
 rEylF7IHc1+5RHq+u1XdFc+4oTzBI47BBg9wrSYJx/Krx228l8tYTl1Z+gKfdwvTqZCp
 D+ldh+j5I4cGjBg2EQAsugryA7DzMm4Fk73Xo6cAbJqoec1ZX9mB6uDu0P02L8q0kQtK
 9ks6s7dQpIUVNYmmYlEKNxhvoI0LVOkxaRaFf3hkGDOcVs6q68sQ4Z9t6NN2/j3Ngc2R
 Lu+ecJRGnQvQs23l9shtueWiwsu8+Vs7RHz5Szm2wJIWilR0SOryWL1G8qXXHmkf+RNW
 ZXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747038742; x=1747643542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYXcYfmW92NwQS8DOWBMZ1iD5TRg6ruyTQhU7K965SU=;
 b=mUNFSECItUDNXci+RbWViMuSiVePC/W4yT4LPNgpvSOtf6ASoO0SzUEqzIodToKb8x
 TJx2XnIR2v74ujVZpYG0nKvywg030dylfGZUmvPuOPJ13m6dbB28pVXKRPBioAZkIMDL
 VKhPJNe+j3YE751KfLMKDh8ACI6opgADtmUxQ71fptdzKXfgwbkpN9ZEHJMxTBVXFEjb
 kzvAeI8Bvw2lBbQ8d9lR456sDXyEJLz7onWF6ehB2yaqoMzXfbDoJ1/Vr6zFQiV3VA0h
 yiWaazgtxYRN5rqg52/nyWD7qRFB+cyVVELJL5b3zEu+YE2Fv7SZj3wdq1RNkkD1xhhU
 vWWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/xtuwkPZhW+oPgqNQpKMlBoTQhsvt+HCZBcaKJhxUxNHzyrU0XQaRyRApAJom8247NJOfhiB6noY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvxrRZzWwOmiBXtzfWZZrl7KACD7UX8Vm1BxQ3EVIW7h/0dtUp
 9L73qgr+40XdPemvBdiTL9/wZwsYySgBZ2hBq2qvj0rp0WMjQZ0n
X-Gm-Gg: ASbGncv7IE38RaYRXDvVKkWn6XdOc+F5kiGFvsVbai9SnB8+W+UnZaKV9IbE/noPSkL
 VbRz2R4aIm4HKn+memaUf1Z5TWbkVmTUuFX7aokvRVmKcelJjR5TBTWdT3t5iNC2Ceb8HQaEQec
 OiNMbaCi1LWokebD97WTCZJ8vWFKBTFDPjFlLQaof3ujwseDytwL8eWlAFPxXDDfooJAboYMQCW
 AFYdQytttgB5j+Ku+w25lnqf39WuVqgDg/Q5UBtUX3Snic8OLp9+UJmqNCP7uJl3eioLGSisANo
 dNOykScoPSEyFocgqiCGsgUBSlH4e9l65/9WudAJXWj3u8Br7aPS
X-Google-Smtp-Source: AGHT+IEJoNDjSaA+Sniz3FqA3ByQMXjgbbgPzhBhHPvWA9YXb+3eKhQDYoPDKhbTMcwyvyd3M3nzGw==
X-Received: by 2002:a05:6000:430e:b0:39c:1ef6:4364 with SMTP id
 ffacd0b85a97d-3a1f643833emr10644682f8f.14.1747038741864; 
 Mon, 12 May 2025 01:32:21 -0700 (PDT)
Received: from vitor-nb.Home ([2001:8a0:e602:d900:7df1:5521:294c:1eb5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5a4sm11577918f8f.81.2025.05.12.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 01:32:21 -0700 (PDT)
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
Subject: [PATCH v3] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Date: Mon, 12 May 2025 09:32:15 +0100
Message-Id: <20250512083215.436149-1-ivitro@gmail.com>
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
SET_RUNTIME_PM_OPS(), enabling suspend/resume handling through the
_enable()/_disable() hooks managed by the DRM framework for both
runtime and system-wide PM.

Cc: <stable@vger.kernel.org> # 6.1.x
Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
v2 -> v3
 - Fix warning: 'cdns_dsi_suspend' defined but not used [-Wunused-function]
 - Fix warning: 'cdns_dsi_resume' defined but not used [-Wunused-function]

v1 -> v2
 - Rely only on SET_RUNTIME_PM_OPS() for the PM.

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index b022dd6e6b6e..6429d541889c 100644
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
 
@@ -1279,8 +1279,9 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
-			    NULL);
+static const struct dev_pm_ops cdns_dsi_pm_ops = {
+	RUNTIME_PM_OPS(cdns_dsi_suspend, cdns_dsi_resume, NULL)
+};
 
 static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
@@ -1427,7 +1428,7 @@ static struct platform_driver cdns_dsi_platform_driver = {
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

