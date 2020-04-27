Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D601B99AE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDEF89FD9;
	Mon, 27 Apr 2020 08:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD6389FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:05 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 198so13088292lfo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qe1H0UppIJU0bk0anv3RDB/Ffm44oo9jDJ5R/kYBXCQ=;
 b=iAYcV+sycQntXHcpFceMuQszFybFkiOoTztLIb97CxsVGmXC0sLBRw7Nd2QUpnnWN5
 /JH68cJbzHdGc2+fdkcAENZA8KJYf7dN6DVxINuKBlks89knace6jODyImZj3JiVUNK6
 VKHUuwkq8Tjy3Ayqy0HNZ300osfgTEUpzJ2wZ9l4XZGZIy6X5ecjPBbF/pgnBsigKuxE
 FknMCQE39RzEAkq5y2BYqpPShThkCRdeczid0c1PaKepOPbozA4uxLx5VQKE8QB8dBaG
 OiAt3m1gyC98jokbMxTT0zhLV36Hnl3SWhSDS5dthHAc7Yr9VAsYzlfCr/ypyR72/iq3
 qKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qe1H0UppIJU0bk0anv3RDB/Ffm44oo9jDJ5R/kYBXCQ=;
 b=Pqhyc+erAdEeLC52rv7rt6oO0fUF3d/y/a1Nku5xYGuwiLonii/pt0CQcQiUyoZGaH
 DQffcPY+Cecn8Ik0SfbcS7c5/nnGNgcwZ3BLUq9GB5cCn4YEB/t2gaJXnP9I0YYJw3v0
 214ebCaIDKQx7fQPZDfDc/bYaDHmShkP8d/q7lXaWSU8GoIgABJd5uECjnc6ZXLt0SSL
 Uq1p9L0YFOaM6rgds+cUnALQoFhSCX1QqYa3mH2uf11DpkaFtCoZf8c4F1ZroY43HxO7
 5DAYI6yZEOx3lghAWrYR++/yTsf3PCuoERTkYa9ybiqQL+tVVVgm3BT6aCwzBfCaNK8h
 yL1A==
X-Gm-Message-State: AGi0PuZMP87geGLcdc6W3N6hhkXH1+maS2JicFRAj/JoZL1Qjr5nLZG6
 togYV3tb2BwX0MSqLGWoAynzMDjP
X-Google-Smtp-Source: APiQypJ9ID3fmAOjZAF398JjvVtKvQr/vOkai5xR+nwwxy3h6EcnYAR0cMZsC8K0fRZDK7766FHvdQ==
X-Received: by 2002:ac2:4105:: with SMTP id b5mr14858919lfi.94.1587975543689; 
 Mon, 27 Apr 2020 01:19:03 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:03 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 02/21] drm/panel: panel-simple: add default connector_type
Date: Mon, 27 Apr 2020 10:18:31 +0200
Message-Id: <20200427081850.17512-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All panels shall report a connector type.
panel-simple has a lot of panels with no connector_type,
and for these fall back to DPI as the default.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 80388706057e..13c25ee38dbf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -451,6 +451,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	struct panel_simple *panel;
 	struct display_timing dt;
 	struct device_node *ddc;
+	int connector_type;
 	int err;
 
 	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
@@ -495,8 +496,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			panel_simple_parse_panel_timing_node(dev, panel, &dt);
 	}
 
-	drm_panel_init(&panel->base, dev, &panel_simple_funcs,
-		       desc->connector_type);
+	/* Default DRM_MODE_CONNECTOR_DPI if no connector_type is set */
+	if (desc->connector_type != 0)
+		connector_type = desc->connector_type;
+	else
+		connector_type = DRM_MODE_CONNECTOR_DPI;
+
+	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
 	if (err)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
