Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525716571CA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC37310E369;
	Wed, 28 Dec 2022 01:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644F10E368
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lU6VOUG1vSrY2tpqFwz0Ej2kvheVmIlXVmdfOeOCkyw=;
 b=GxKds/bXcr+6gcxqxCcSDUJNqc5qMugze/lD9vJ1D2LWoCJJ0/ahJLDtsNTmKQhlida5NL
 sZknt6XWuhZZKsfk+CsW3DKmFwdAYmGZ5wXLcuMfkPQyDPkHnDVzdmIPbuzSPaUzwNsZFG
 DDN5BAMQmIYvxbNDgpgfKdZFXz062Nc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356--UBWza6qNyehETNd-9557g-1; Tue, 27 Dec 2022 20:48:19 -0500
X-MC-Unique: -UBWza6qNyehETNd-9557g-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso7369701wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lU6VOUG1vSrY2tpqFwz0Ej2kvheVmIlXVmdfOeOCkyw=;
 b=gjmc4aCSp1uLSRLsAJzMKLjcFy/sbyYcV1PcWfJ5ywY4K+XWD2EHbbp66HgqG6+ymm
 /7bLgIYic0/KmZeD1MzjKeUUEzyDgCJSdUbzwjaaHuAYk6dx77iVbPyDvAGrCwUqGilU
 kiL1IPmxFXZlqn25dJgw40V5mygA3LPHmW/vyYUNH3LCPJ7WMqdXDRPU+l7TPebmbvH7
 nA7re+RIYC+LnyL/5E8Vb/ppiIyMHvD7gvLnzMCWtmgkXN/lWLNT6vLfcPRCah34KUZa
 v1AKU34PGz3NXZSGwTHEkwV/fmp0CDLATFBXKWAr2zD7Cbhbp2olMPkzacstt0q1zcvD
 7vcw==
X-Gm-Message-State: AFqh2kobEGYl6ugpHhjUv6d3/Aq0RT1y83Q+tK3H0M5aimLwatOR9x9D
 W9sBNm4ZToZkkM9bACHk3MS4FFTgga/Io75g+LhNjtBzETtOw4WrGONvFCYC3sX2ZWTlF1FRIY8
 eKMxzfU3+qSfTpNSdqDEXasRCcBwe
X-Received: by 2002:adf:9b99:0:b0:241:fa2d:dea0 with SMTP id
 d25-20020adf9b99000000b00241fa2ddea0mr14018188wrc.3.1672192098202; 
 Tue, 27 Dec 2022 17:48:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFinSDNvZD1/lFP5JuaVSl0nj8OZdwp1w6kixV9ufXdaQQ+vqUKiQuRf6PKWrFwFLIszkKlw==
X-Received: by 2002:adf:9b99:0:b0:241:fa2d:dea0 with SMTP id
 d25-20020adf9b99000000b00241fa2ddea0mr14018183wrc.3.1672192097961; 
 Tue, 27 Dec 2022 17:48:17 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] drm/panel-samsung-sofef00: Drop custom DSI write macro
Date: Wed, 28 Dec 2022 02:47:53 +0100
Message-Id: <20221228014757.3170486-11-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228014757.3170486-1-javierm@redhat.com>
References: <20221228014757.3170486-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 1a0d24595faa..9db49a028930 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -34,14 +34,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 	return container_of(panel, struct sofef00_panel, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -67,7 +59,7 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	}
 	usleep_range(10000, 11000);
 
-	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -75,13 +67,13 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
-	dsi_dcs_write_seq(dsi, 0xb6, 0x12);
-	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
-- 
2.38.1

