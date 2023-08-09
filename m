Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C943776422
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB8B10E45F;
	Wed,  9 Aug 2023 15:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238DC10E45F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 15:39:49 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-583b0637c04so15396907b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691595588; x=1692200388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heTCs7dsv6GvWxFtBKhqH5NxQvlDCWaKtVOhiBVjHzo=;
 b=XNMmLG7ZfSIjfMuOUzinZG7jUOlFW/1qPQ+VX2RL6CyWKVVBVmGGOLj94aVupt48aL
 5v6+ol4FalLFWgiRHaXMMdy00hlrkhFTyAx4JOzc2FmZPUTKmQmEN+ZDIgt1KMt3T+Ls
 O5Qw61eeRCczz8qGSGvTqIxNk00FVMPBVpkfQTkojmTG5vD4NjKYWw2CBKLGrBARYcAg
 KSQu1Mkmq09gCkMex/E0fb3Z4UEHlhXv3qqzEmSjSnHVaJNo1qiRtuc3dXmiR8Dfm/5t
 ndLFzHeTOIEUyTs2f57LEUvEb5PWUbvZAfKN8PaEQ732CP4vo9SsKUzeoRPgn27g8jpi
 qPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691595588; x=1692200388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heTCs7dsv6GvWxFtBKhqH5NxQvlDCWaKtVOhiBVjHzo=;
 b=C5OCUg59Beuwix4/SNc5o9dBJUEf031F8wEYPTtu3XoWQr1tYucoIBT2C2f9KnqLtr
 3JC6UNvJsK/YQ4NkiERNfaMZLwldHPnBCNWGePmlPQIk+/2M8Bjjv+1aiZLXb6fkn4eq
 feTbCBCCBL/cWuQLsyHscOqPoZnv3gU/BnueO31S601dDEFOZh+Cw8g2jTz9VhkR1woT
 nP46bOH4gScpActqStBTXT4eIYjzzxnNDaNEuHR1A15XiDKjuwsuiewIsKl4MIGUqDTo
 wD6bWwz7p3nhgIHxC3MggB7/fmPjo4+nkXsj7K1s62dzeAcQRvORmtKHZyDxJFIYyPeq
 TeSg==
X-Gm-Message-State: AOJu0Yy1lO8MWZOaFvVICD7+HA2ThrLJ1Wxn8SMSINKCW41Yw5y48Tdn
 +cAEEqkr8E5f8KPrz5LY0uYq5FmW+BY=
X-Google-Smtp-Source: AGHT+IGo7Klo90Ro2NwyFAAnkPv29d+Pa3MnKtD1QRsaDN5/qrYptNrTr6b1H082Gtg//Df0gteYZA==
X-Received: by 2002:a81:6dc9:0:b0:57a:3942:bb74 with SMTP id
 i192-20020a816dc9000000b0057a3942bb74mr2862592ywc.17.1691595588241; 
 Wed, 09 Aug 2023 08:39:48 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a81a50f000000b005707fb5110bsm4043969ywg.58.2023.08.09.08.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 08:39:47 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V2 2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
Date: Wed,  9 Aug 2023 10:39:41 -0500
Message-Id: <20230809153941.1172-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809153941.1172-1-macroalpha82@gmail.com>
References: <20230809153941.1172-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic 351V. Just like the 353 series the
underlying vendor is unknown/unmarked (at least not visible in a
non-destructive manner). The panel had slightly different init
sequences and timings in the BSP kernel, but works fine with the
same ones used in the existing driver. The panel will not work without
the inclusion of the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, and this flag
prevents the 353 series from working correctly, so a new compatible
string is added.

Tested colors and timings using modetest and all seem to work identical
to the 353 otherwise.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../gpu/drm/panel/panel-newvision-nv3051d.c    | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index a07958038ffd..dc0d6dcca683 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -28,6 +28,7 @@ struct nv3051d_panel_info {
 	unsigned int num_modes;
 	u16 width_mm, height_mm;
 	u32 bus_flags;
+	unsigned long mode_flags;
 };
 
 struct panel_nv3051d {
@@ -385,8 +386,7 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->mode_flags = ctx->panel_info->mode_flags;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -480,10 +480,24 @@ static const struct nv3051d_panel_info nv3051d_rgxx3_info = {
 	.width_mm = 70,
 	.height_mm = 57,
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
+static const struct nv3051d_panel_info nv3051d_rg351v_info = {
+	.display_modes = nv3051d_rgxx3_modes,
+	.num_modes = ARRAY_SIZE(nv3051d_rgxx3_modes),
+	.width_mm = 70,
+	.height_mm = 57,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
 };
 
 static const struct of_device_id newvision_nv3051d_of_match[] = {
 	{ .compatible = "newvision,nv3051d", .data = &nv3051d_rgxx3_info },
+	{ .compatible = "anbernic,rg351v-panel", .data = &nv3051d_rg351v_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, newvision_nv3051d_of_match);
-- 
2.34.1

