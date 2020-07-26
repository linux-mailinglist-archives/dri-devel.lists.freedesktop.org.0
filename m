Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0B22E287
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCE489C69;
	Sun, 26 Jul 2020 20:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB9F89C25
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:33:36 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q4so15049626lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpVbuQILlWQf2ZZYt+NNaZwjYYiIiRCUdPFG0n/z94E=;
 b=BJ+BePGIFzEdAxLhU6xdclp/SFcAMTVuUwcctfupQAcB0E7/JoGBNOO43xa/ZcIfkE
 31UmBDCSz0FWQK4fnr1RQzcTFftkFTxpxm36jlbq/PkCkZ1f5g881LBhcP7ZnCzds7fU
 91iwUf8PWUSBWE8AMEfRa++MMBwJsrWkWpEkQ/3wtbUbf5sczyUthTZiv+hPnnV9pwBy
 C1dOvVJX5x2yBQD/u/UQoC5VExANQAMta/JPUJud3oD0zbuHHwi+bEHhVZQGU5BrWQu2
 BJk7rei+X9RyZ2pTS5XePH/oH5NPUPMSiw7ylttl8d7hPszqnb/H0qdSXU6Um2QQ4aO2
 q0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YpVbuQILlWQf2ZZYt+NNaZwjYYiIiRCUdPFG0n/z94E=;
 b=B2bDpuaFNZDJq7bWlnKWjI9M4KeFSt94eADI894AQiva+wHsZvRbkC5IMYl0mCG+z6
 iFyRWgXO03sDXpqMwTn1mo6nHdXBz2wqt1fXq7xw5GaLObH8+mim1dA0juEd6SfOaBAW
 Q6pDvAovXI/TwHuGFAQsvw/5T3//3liqX89Wd4L8h0k6LOSXGC8fGqqNPpbtDPhxOEH8
 /HRzExIB/6QW6jOneL2I8itTMoVrK4ULrL7T7x6K7TllQBvfgfsUS4hIIwHMY+oEvZJo
 8pNG0+DqYDY8Dc7dph/klLYydBcGwXK0BBR943qyfMX21ZV8CPS0t1AXWwCgFW+BKP2N
 PbYg==
X-Gm-Message-State: AOAM5317SMKaqzfgSP03jYIQ0oY6OfcUXp/T2miDT1VW28jX9JQheOkN
 HfuiGUkHNzqLFGVD+mzmYCMeGf5EJsQ=
X-Google-Smtp-Source: ABdhPJwWVx6/3ZkML12a8CWHpGWn35JXf62oSqPmr2hZ8PpWB2bAB3RcPmGj7T7Y8ZZD8I+4uJgpjQ==
X-Received: by 2002:a05:651c:1b5:: with SMTP id
 c21mr8642290ljn.82.1595795614392; 
 Sun, 26 Jul 2020 13:33:34 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:955c:e8d3:9c9d:41af])
 by smtp.gmail.com with ESMTPSA id 203sm2538473lfk.49.2020.07.26.13.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 13:33:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 02/15] drm/panel: panel-simple: add default connector_type
Date: Sun, 26 Jul 2020 22:33:11 +0200
Message-Id: <20200726203324.3722593-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726203324.3722593-1-sam@ravnborg.org>
References: <20200726203324.3722593-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, kbuild test robot <lkp@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All panels shall report a connector type.
panel-simple has a lot of panels with no connector_type,
and for these fall back to DPI as the default.

v2:
  - Rebased on top of validation of panel description

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a8d68102931e..56ab073e4e6e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -500,6 +500,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
+	int connector_type;
 	u32 bus_flags;
 	int err;
 
@@ -550,10 +551,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
+	connector_type = desc->connector_type;
 	/* Catch common mistakes for panels. */
-	switch (desc->connector_type) {
+	switch (connector_type) {
 	case 0:
 		dev_warn(dev, "Specify missing connector_type\n");
+		connector_type = DRM_MODE_CONNECTOR_DPI;
 		break;
 	case DRM_MODE_CONNECTOR_LVDS:
 		WARN_ON(desc->bus_flags &
@@ -600,11 +603,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		break;
 	default:
 		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
+		connector_type = DRM_MODE_CONNECTOR_DPI;
 		break;
 	}
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
-		       desc->connector_type);
+	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
