Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECE92A8E6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 20:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308D10E1BF;
	Mon,  8 Jul 2024 18:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="alDZDe9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AB510E242
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:18:23 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a77e7420697so251312866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720451901; x=1721056701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oGCrVrBGIrx7MPLgB/KlykXRMIJJJRJ81UrBbePvOHg=;
 b=alDZDe9ruQgP9hAio0f9fmfQIvKlUqopJ5xE59wTDXXjEfkXyZYM9yeEi24HdRpiFx
 B+yqrBQipeGF2PNiUDqoooRm/pGCqcY6O8J8mnFAtm3WYxAZ+HzDdt26ha9XqFtFxBjv
 HGxDkd6Jwh3uhQCIU9x0guIy2WK1TUYOqWaO9EavTfYC68+3abPFZUKI2vsfy0NcYWeV
 VixpKkGGVLxdaInVfCYgQ3ioZIwj/VFdgPWVWuADIu6TfHQ6GimIGm8oPxvhIyjnwVWs
 x+0r/DO8909wQAgZyxAzo04Pz3ue+/15Y94CUpswZLWT9zq1yaobXnJpIZjEpwZScuQ9
 HipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720451901; x=1721056701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oGCrVrBGIrx7MPLgB/KlykXRMIJJJRJ81UrBbePvOHg=;
 b=d7ZQU2GESJnc2o+avqvTofyprErzdGlJSv4HzMtUyIPDKtDPYxd9Jp450xy7t3yDv2
 ziTAaQUe4VYAjoB5AE4Ait+MlUPv9e5+Jpbg0p+iM9z1GQwa/lIREg8i1OnQKHPFkeqg
 MljyO07wubPyBnpnNJeBNwmGHRXqgY6+VPldjRcT58CzWCg0IvFP0gi/kISJTwFDiPtQ
 4KvewI9Tsol726JTD+0XIjGK7QzfYSZRAxGFPfjnSkUkLY/UBHKFxhWEbUTvKftvCjrR
 fVh7DFqeZ1Dc9SIFW+xCvp7I9AiBrPlj/koOa345ycENWwKuSUObTvAvMwkaPh9xqBeC
 DlRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGODqSNDP2YtecNravrtFb3rw18hIEgTLbMk/ZfYzo1pQ97MP5FzNBh1DC1zohT2V5APrvW19Ud6fDtdVM1NvYYGJPSRVUyynpJZzZfvW2
X-Gm-Message-State: AOJu0YyOLhG17ViHklyp+JUh63z7egHyIeQdbjrNu2Pf9GGKBwE5jmDT
 1nr2PyALWtH9rBzjHtOMa+SU1h7SWGHyV5KJC+5268fYWf0w57Cc
X-Google-Smtp-Source: AGHT+IHDkYDqBWV7jiUx3ikaGrYl0qJ1VuVd0nwfS410p0DwAQ9ZE96/NVk3RbpvQFL4gy7OZyyFHA==
X-Received: by 2002:a17:906:ccd2:b0:a77:dd1c:6274 with SMTP id
 a640c23a62f3a-a77dd1c6efamr481461566b.69.1720451901111; 
 Mon, 08 Jul 2024 08:18:21 -0700 (PDT)
Received: from GLaDOS.tastitalia.local ([37.77.97.75])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6dc721sm3142766b.53.2024.07.08.08.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 08:18:20 -0700 (PDT)
From: stefano.radaelli21@gmail.com
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 "Noah J . Rosa" <noahj.rosa@gmail.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Add Non-Burst mode property
Date: Mon,  8 Jul 2024 17:18:19 +0200
Message-Id: <20240708151819.40457-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 08 Jul 2024 18:21:55 +0000
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

From: Stefano Radaelli <stefano.radaelli21@gmail.com>

The video mode can be divided into two methods for sending packet data:
burst mode and non-burst mode.
In burst mode, pixel data is compressed to save time for the interface
to return to low power.
Non-burst modes transmit pixel data in a stream controlled by sync
pulses or sync events.

Adding this property in the DTS gives the programmer the ability to
disable Burst Mode, depending on how the MIPI controller is configured.

Co-developed-by: Noah J. Rosa <noahj.rosa@gmail.com>
Signed-off-by: Noah J. Rosa <noahj.rosa@gmail.com>
Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..6314c03ce1e6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -145,6 +145,7 @@ struct sn65dsi83 {
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
+	bool				burst_mode;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
 };
@@ -581,6 +582,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
 
+	ctx->burst_mode = !(of_property_read_bool(dev->of_node, "burst-mode-disabled"));
 	ctx->lvds_dual_link = false;
 	ctx->lvds_dual_link_even_odd_swap = false;
 	if (model != MODEL_SN65DSI83) {
@@ -654,10 +656,15 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 
 	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
 			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
 
+	if (ctx->burst_mode)
+		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
+	else
+		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
-- 
2.34.1

