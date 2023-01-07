Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E2661144
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6BA10E378;
	Sat,  7 Jan 2023 19:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30010E1B8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHFwZ5KWVYahcPXMiLUm5iqICbc3qqyTGQ1xxgbWuAE=;
 b=Qg5Jpuryx3t8gH38pexz3TpWoRv6ccv5YCiisGde/hqZc6WY64iPMg5WdJNyOFd5ua+lBO
 q1U0vL+75wGdJHrCCVuUU8Ct7fya6dFfMNFgYbB/IbcLBk73Mg2VUcg6TnbNqwoyRdEoh+
 oBA0Y3dBH3PQinv93fJjd6CZ4OWrBOY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-HZeTuEZIPeqfxk4rCotopw-1; Sat, 07 Jan 2023 14:18:34 -0500
X-MC-Unique: HZeTuEZIPeqfxk4rCotopw-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so2740165wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vHFwZ5KWVYahcPXMiLUm5iqICbc3qqyTGQ1xxgbWuAE=;
 b=sUX8PlVl8LTpgYaqL6tAPTKnd/uyf18kerWXRSkHg8SDuQUzcrDlFUb40q8OfecaVT
 qUHhyJK1Q2u6IFymyUCFxjQddiff5VSh5OMq6cLe8Tku8x1v3iZG22HOqrhYge9XfiML
 AjibgmA7+rcKYmb6kNvPpMqp7e4ZPkdwPR0eqkkcXjrqC3gDp2RSGJSY6obpc5ObqJVB
 vshrpcOUqfAuw3p8TuU5e4BwgX/SilMR9lOPM0PnMjYoSz7oCAgVhGT5srDDP46PI1v9
 QiiNLIJGdwLgJ1LiaiAolDL3ml8rufSd33xKb3pVqt9UNcznaqkmtb128JAQbWo0elm9
 +y+Q==
X-Gm-Message-State: AFqh2ko8Dd97Vq4GDLPKgDV3coYkYvP+eDVAx6cupwTsxWVL9aCF8EjD
 4/bHfoDlES2Fw2OI7o3IjhfLfbIJGF4kV5Es5sA4RAYuFbv0ON1hHpQOjDmSWbE/Yqo72iPiAES
 zeLL+mCMgu5Hj+ifPScO9moNFH1Iv
X-Received: by 2002:adf:dd88:0:b0:242:ac4:4a0c with SMTP id
 x8-20020adfdd88000000b002420ac44a0cmr45009079wrl.32.1673119112995; 
 Sat, 07 Jan 2023 11:18:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtuEttDcXb2+KgfpoYFh0D2+A1psW+hNliMeobsiLWNH8/iHfff6qgBGb1vGqWGiba4Rc7cQ==
X-Received: by 2002:adf:dd88:0:b0:242:ac4:4a0c with SMTP id
 x8-20020adfdd88000000b002420ac44a0cmr45009072wrl.32.1673119112787; 
 Sat, 07 Jan 2023 11:18:32 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI
 write macros
Date: Sat,  7 Jan 2023 20:18:10 +0100
Message-Id: <20230107191822.3787147-2-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107191822.3787147-1-javierm@redhat.com>
References: <20230107191822.3787147-1-javierm@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are macros for these already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macros defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Add Sam Ravnborg's Reviewed-by tag.

 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 96 ++++++++-----------
 1 file changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index b3235781e6ba..075a7af81eff 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -24,22 +24,6 @@ static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel *panel)
 	return container_of(panel, struct tm5p5_nt35596, panel);
 }
 
-#define dsi_generic_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
@@ -54,46 +38,46 @@ static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
 
-	dsi_generic_write_seq(dsi, 0xff, 0x05);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0xc5, 0x31);
-	dsi_generic_write_seq(dsi, 0xff, 0x04);
-	dsi_generic_write_seq(dsi, 0x01, 0x84);
-	dsi_generic_write_seq(dsi, 0x05, 0x25);
-	dsi_generic_write_seq(dsi, 0x06, 0x01);
-	dsi_generic_write_seq(dsi, 0x07, 0x20);
-	dsi_generic_write_seq(dsi, 0x08, 0x06);
-	dsi_generic_write_seq(dsi, 0x09, 0x08);
-	dsi_generic_write_seq(dsi, 0x0a, 0x10);
-	dsi_generic_write_seq(dsi, 0x0b, 0x10);
-	dsi_generic_write_seq(dsi, 0x0c, 0x10);
-	dsi_generic_write_seq(dsi, 0x0d, 0x14);
-	dsi_generic_write_seq(dsi, 0x0e, 0x14);
-	dsi_generic_write_seq(dsi, 0x0f, 0x14);
-	dsi_generic_write_seq(dsi, 0x10, 0x14);
-	dsi_generic_write_seq(dsi, 0x11, 0x14);
-	dsi_generic_write_seq(dsi, 0x12, 0x14);
-	dsi_generic_write_seq(dsi, 0x17, 0xf3);
-	dsi_generic_write_seq(dsi, 0x18, 0xc0);
-	dsi_generic_write_seq(dsi, 0x19, 0xc0);
-	dsi_generic_write_seq(dsi, 0x1a, 0xc0);
-	dsi_generic_write_seq(dsi, 0x1b, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1c, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1d, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1e, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1f, 0xb3);
-	dsi_generic_write_seq(dsi, 0x20, 0xb3);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0xff, 0x00);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0x35, 0x01);
-	dsi_generic_write_seq(dsi, 0xd3, 0x06);
-	dsi_generic_write_seq(dsi, 0xd4, 0x04);
-	dsi_generic_write_seq(dsi, 0x5e, 0x0d);
-	dsi_generic_write_seq(dsi, 0x11, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x05);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x04);
+	mipi_dsi_generic_write_seq(dsi, 0x01, 0x84);
+	mipi_dsi_generic_write_seq(dsi, 0x05, 0x25);
+	mipi_dsi_generic_write_seq(dsi, 0x06, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0x07, 0x20);
+	mipi_dsi_generic_write_seq(dsi, 0x08, 0x06);
+	mipi_dsi_generic_write_seq(dsi, 0x09, 0x08);
+	mipi_dsi_generic_write_seq(dsi, 0x0a, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0b, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x0e, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x0f, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x10, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x11, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x12, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x17, 0xf3);
+	mipi_dsi_generic_write_seq(dsi, 0x18, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x19, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x1b, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1c, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1d, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1e, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1f, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x20, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0x35, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x06);
+	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x04);
+	mipi_dsi_generic_write_seq(dsi, 0x5e, 0x0d);
+	mipi_dsi_generic_write_seq(dsi, 0x11, 0x00);
 	msleep(100);
-	dsi_generic_write_seq(dsi, 0x29, 0x00);
-	dsi_generic_write_seq(dsi, 0x53, 0x24);
+	mipi_dsi_generic_write_seq(dsi, 0x29, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
 
 	return 0;
 }
@@ -117,7 +101,7 @@ static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, 0x4f, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x01);
 
 	return 0;
 }
-- 
2.38.1

