Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F94485A90
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 22:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D60110E256;
	Wed,  5 Jan 2022 21:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337A10E256
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:23:39 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 69so742828qkd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 13:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zY0MGgHszlxJMiljmXEEiC1wEzxNY+uDQh+HxW5Uns4=;
 b=cWg7/JPddxtwQJ/HOgH3+oR1fhhnoQiqZH2jvDD93PkRI29IfqGagjO+gqGHJZVHZL
 v858zBw1z4lhms6W8dT4DFgbRNErR6ajZR6b10djp2d2/I0nFi21wGQEL6n4qGadZNoS
 3Lo7j7a8BgtoUBHMLbOI6m/Z2G+dzpcDPSwl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zY0MGgHszlxJMiljmXEEiC1wEzxNY+uDQh+HxW5Uns4=;
 b=kfNF5uPhsB9IeA8rbuQ0U0zjP/mOCsq8p/z+A3PqqpvgOinUH/YQRCe+E9oTMOdoDP
 1XWJVW6CFA8K2U3C7XVugcD3lSf0lwOmOVrq3fD44mtSGjF8UL7YZS4ooZHw21qrKWE8
 KcbteuFZQdK8+l50jYa8yUY0+V75sjNLk/b2dwYJe+6musLvb8AAAdkhRwYg+vjlzxDy
 CG8fvqvwXEgQg9u22Ux2bblJwTriidajbiuKMwuftUlxdUFrq+UoSle2zAPapraT22i1
 he4U5v5iYkROM5tUvVBUkv7FTLdJ/g8hgPxGRx027fj/ikk1dwIRBbHnUWIGGW5W4lCc
 7T2Q==
X-Gm-Message-State: AOAM531r/HxxiTRPpVBFcYmY3wZB2RIEimeAZEhLEpViJ2tF4kLTSYE3
 q2oZaF7/urZ6QTWSWV0bdWqcHA==
X-Google-Smtp-Source: ABdhPJxEyFhumzU211wdXGQ8UbL2PChXeuyZYivpZy17HeB7BR5gVki7gW29chV6s0DnDIezHae+2w==
X-Received: by 2002:a37:a70d:: with SMTP id q13mr3984850qke.84.1641417818960; 
 Wed, 05 Jan 2022 13:23:38 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:e210:d796:8522:dada])
 by smtp.gmail.com with ESMTPSA id w63sm32384108qkd.88.2022.01.05.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:38 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3] drm/mediatek: Set default value for Panel Orientation
 connector prop.
Date: Wed,  5 Jan 2022 16:23:27 -0500
Message-Id: <20220105212330.2199045-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211229184420.793234-1-markyacoub@chromium.org>
References: <20211229184420.793234-1-markyacoub@chromium.org>
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 markyacoub@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzungbi@google.com, seanpaul@chromium.org,
 jason-jh.lin@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Creating the prop uses UNKNOWN as the initial value, which is not a
supported value if the prop is to be supported.

[How]
Set the panel orientation default value to NORMAL right after creating
the prop if no DSI panel exists.
Panels have their own orientations, and panel orientation can't be
overriden once initialized to a value.

v2:
Move to the latest code where struct mtk_dsi{} has no member 'panel'.
v1:
Set panel orientation only if DSI panel does not exist.

Tested on Jacuzzi(MTK)
Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb00193..9e1d4e297ca48 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -941,8 +941,10 @@ static const struct mipi_dsi_host_ops mtk_dsi_ops = {
 	.transfer = mtk_dsi_host_transfer,
 };
 
-static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
+static int mtk_dsi_encoder_init(struct device *dev, struct drm_device *drm)
 {
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_simple_encoder_init(drm, &dsi->encoder,
@@ -967,6 +969,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	}
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel,
+					  &dsi->next_bridge);
+	/* A drm_panel can have its own orientation. If there is no panel, set the
+	 * orientation to NORMAL. */
+	if (ret || !panel) {
+		drm_connector_set_panel_orientation(
+			dsi->connector, DRM_MODE_PANEL_ORIENTATION_NORMAL);
+	}
+
 	return 0;
 
 err_cleanup_encoder:
@@ -976,11 +987,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
-	int ret;
 	struct drm_device *drm = data;
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	ret = mtk_dsi_encoder_init(drm, dsi);
+	int ret = mtk_dsi_encoder_init(dev, drm);
 	if (ret)
 		return ret;
 
-- 
2.34.1.448.ga2b2bfdf31-goog

