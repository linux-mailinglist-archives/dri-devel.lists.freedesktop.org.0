Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C76CDA6C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810010EAB8;
	Wed, 29 Mar 2023 13:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74F910EAB7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:19 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso3775284pjc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+Jq4CQBAwZOjvBLdvikVzLpWjI0SGbxRpeBtUQtDcQ=;
 b=Ou/OtLmpNc78F/fwnqk1lzBgwyfUoX8VK7o4RpfnSYek0c6mzr55RafkbJPWpVDXEi
 eUvONb1/8WR9m/S+MqqA3BfxCALKIkNuYaZPDo/X4FFKOP2gHBDL14hZsB51ThK0gMCo
 E1irsVQt1JZisYTFF7Lfw1qND+3EgJ+bff+GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+Jq4CQBAwZOjvBLdvikVzLpWjI0SGbxRpeBtUQtDcQ=;
 b=xc12kTHuP4lYxCMr0dJYGyQUkdfM4MtnP09bl2NmpjhoJGKqML7+XmEJkszNovZEy+
 SVJon0+qbAqc6bABi/bGInYDgJmFfl/rbn9y71/OWOD5f5GpgYda/DNvRzZnWYubTnqJ
 +gRO/z4Q5xIgyzna+70zBVQzo/V2d7owO+yXCjljd9Of3Rq3HKk9i+eHgTz1wksnOldO
 UAEUjs+5lkdL/GonK5kH6LlBnn+zbo4HviTv/+WaHkHwRCX7Qy83GmyuZgnXgl9blyvo
 yIsBYtEqrFwtZHlsrsXErYzdvkrGu7ijKvxtDdrs97vlwv0oIRzcgz55TNGpwrEdE90F
 Rvog==
X-Gm-Message-State: AAQBX9dmuDvo+luDvSa3E5w6v3fQoWA3AZBl3p6Z7NlHfKXx2ITRhNWX
 5PJWgJSwhyRswoop+jXCyZLBEA==
X-Google-Smtp-Source: AKy350YCiiWm/rDw6yILBFYbQ4o+gaIGsdINxQHWQbNw3orvvBWljZZZiHyHon7RGJ7hUl10VDOAFQ==
X-Received: by 2002:a17:90b:1e4f:b0:23b:4438:e9ee with SMTP id
 pi15-20020a17090b1e4f00b0023b4438e9eemr2098113pjb.12.1680095899302; 
 Wed, 29 Mar 2023 06:18:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:18 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 05/12] drm: panel: sitronix-st7703: Enable
 prepare_prev_first for xbd599
Date: Wed, 29 Mar 2023 18:46:11 +0530
Message-Id: <20230329131615.1328366-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ondrej Jirman <megous@megous.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag for xbd599 panel so-that
the previous controller should be prepared first before the prepare for
the panel is called.
               
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Cc: Ondrej Jirman <megous@megous.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..6e6112f5d971 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -65,6 +65,7 @@ struct st7703_panel_desc {
 	unsigned int lanes;
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
+	bool prepare_prev_first;
 	int (*init_sequence)(struct st7703 *ctx);
 };
 
@@ -335,6 +336,7 @@ static const struct st7703_panel_desc xbd599_desc = {
 	.lanes = 4,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 	.format = MIPI_DSI_FMT_RGB888,
+	.prepare_prev_first = true,
 	.init_sequence = xbd599_init_sequence,
 };
 
@@ -544,6 +546,7 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &st7703_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = ctx->desc->prepare_prev_first;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-- 
2.25.1

