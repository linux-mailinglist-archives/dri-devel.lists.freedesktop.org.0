Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6C661145
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31210E906;
	Sat,  7 Jan 2023 19:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9974310E1C1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yoKSXDDHkpi6+VOPGkCgVQ6U98e6W0DrE5kW1/2nkA=;
 b=Msm4fhmR7gWF0IevU5EpjTQbjrlP2tmxdxyB5Y5KctYcgNHhO0ziStMcf3jo/LnNDzoTvC
 ncSbMQxq8eN5L4Q9+m8jbe2U8J6yytm8ZLBXayPiSBi7WtarAd2gFZSciu0881nCFQCRx7
 eu7D4LS5akb4UpO3TKTmUFt9uFPzzmU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-Bk8IpG9bP6-O6KMxUjGIaw-1; Sat, 07 Jan 2023 14:18:39 -0500
X-MC-Unique: Bk8IpG9bP6-O6KMxUjGIaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so4645095wms.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yoKSXDDHkpi6+VOPGkCgVQ6U98e6W0DrE5kW1/2nkA=;
 b=kNRjfO210SimaT/QdvyCnP+lVSlpUFckF2cRvzZIaQmlAULFOdcZmhn5Yk0laKTaFK
 lKlCDuoNmta7nwEYJ6aKqs/m6WJ5xPqxa2eIaPgPtbxANn/OclbxNJZ3faEAv/rJoztC
 ToGi3bEelek0nYJ8dp/c1825yzleE4Rm3qcxpMPIN90ou9pd1T33bwXE41riT+D5CMYl
 f2lCj+rkcuiSbmAjDMNnF7+VDRokDkokYrm5b4k5DfG9xkHm2Obw0a7M+1CRcZ3MvAvK
 e7HF26PlYpn9XYA2vWRjCG4QdYbHmSRQzNYVcZ0okruIPRs8cNRRoG4ZbGNBefoiU7nC
 FXnQ==
X-Gm-Message-State: AFqh2kpgdU+E2L26f1zm3FLhnlsVzE7eTa4/eYDHgrgC7Eh7lWxzP8D6
 9I/xAlPPSwaM/Z0QucnzxoEf597Q1t+Fv6fVxi+sqX+JiSb4mCzyKamvuwE1ze+YLYWmwBcntXM
 zAZ9wNq00zyJcZZO0dr0R+YQJNhGT
X-Received: by 2002:a05:6000:148:b0:2bb:dc79:17dc with SMTP id
 r8-20020a056000014800b002bbdc7917dcmr930665wrx.19.1673119118193; 
 Sat, 07 Jan 2023 11:18:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsN7RFr9GVqAykpRx1qFnkQH7qdpKJfYHGcL1pyJ908saGljyN3gg3+TocfMBpzxjktCTQJJw==
X-Received: by 2002:a05:6000:148:b0:2bb:dc79:17dc with SMTP id
 r8-20020a056000014800b002bbdc7917dcmr930658wrx.19.1673119118030; 
 Sat, 07 Jan 2023 11:18:38 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] drm/panel-boe-bf060y8m-aj0: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:14 +0100
Message-Id: <20230107191822.3787147-6-javierm@redhat.com>
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

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Add Sam Ravnborg's Reviewed-by tag.
- Fix identation on macro usage (Sam Ravnborg).

 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 42 ++++++++-----------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index ad58840eda41..90098b753e3b 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -43,14 +43,6 @@ struct boe_bf060y8m_aj0 *to_boe_bf060y8m_aj0(struct drm_panel *panel)
 	return container_of(panel, struct boe_bf060y8m_aj0, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 {
 	gpiod_set_value_cansleep(boe->reset_gpio, 0);
@@ -67,12 +59,12 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	dsi_dcs_write_seq(dsi, 0xf8,
-			  0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq(dsi, 0xf8,
+			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -81,17 +73,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 	}
 	msleep(30);
 
-	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	dsi_dcs_write_seq(dsi, 0xc0,
-			  0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
-			  0x2a, 0x31, 0x39, 0x20, 0x09);
-	dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
-			  0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
-			  0x5c, 0x5c, 0x5c);
-	dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xc0,
+			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
+			       0x2a, 0x31, 0x39, 0x20, 0x09);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
+			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
+			       0x5c, 0x5c, 0x5c);
+	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
 
 	msleep(30);
 
-- 
2.38.1

