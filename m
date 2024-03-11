Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C0877ED5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD3D1126BC;
	Mon, 11 Mar 2024 11:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s+Y4q17X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B952D1126BC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:44 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d41f33eb05so31972691fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156043; x=1710760843; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wz3UhJ4xYSdgm48WihXb5Ur775HB6HGFpy/cnlygSBk=;
 b=s+Y4q17XoPyVQue7iASQnsAnmhkaDckMtnFiFAeVcSf0BwfYXhA3A+3/8JrrycTTgB
 h8Z/EebvDz++wDiBzeasiHfV6jiL7OPC8lv+qn6sKBr5GwOb3AGYqD/2uYz/VCXcqFBR
 TkSe+ZE2Um1RS/KW5s5WeEYgvS47JRKBuva0pLjrVVP5w5iFZBk52I8EhG69MFZINLX3
 /ddpAJv+K/2k/m0MP+eCsuO4IIEpJlq8qKVn/lAmS4Weng32pjB1SN2LVrrcIPWLOV/T
 jTayFJ/SUB6HRjWM43RxXnmyqSjHyTmVsxcq2O38pf7tH8gcotNr/2YhMt4G3j5v1yG+
 DB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156043; x=1710760843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wz3UhJ4xYSdgm48WihXb5Ur775HB6HGFpy/cnlygSBk=;
 b=O6s8whihbSVkpMWn7GfmqARdXyEtegrCoFzvCsAkS1LusfnX4BjfDHihnQD7T639Yi
 e928GVPP2b8QWj7fmXZd4MoIHW7WCMd6GCkqUIkuw8NfyPbmjo6rNxPdsNV1EFyMLqIw
 EfGXXI+7pGkFegRAWF6me88irJhpqvnQzJxfqqx6rLOtQUm2bMj2bsoOJDxhwTyGoPqh
 bIFttB0sPBv4uJwRTMHPK0xiE+Ye6FwR29AGKmxjbTHQR/Og7LAz4MkMhk9a0HvpUFzh
 zXjOuOjIlMDHUpRMZqzab2nVGB9psEclPaouxBj2XOq1MINv62zYXMiaGTPZtlDOGdp3
 889Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBiBBc+8rtScmNNGpDQNGmiu9q95kP2+Jj54+4kM65t2HDmaVfbPjnslunVREaBCbKcppqvz755/CbSh6JqSH/21g6GfF+n05t22SsfCpp
X-Gm-Message-State: AOJu0YyAnlJD3u6/Q/VsnqbVCNCzhNkGyn6qpT8jXacvkBdGrjM2yaIL
 xh1m9mvABbDi/vk3WgFfIutWXq7M5BWdgJkGJ6cJXGnNpadtDJqDyQn+6TatrbQ=
X-Google-Smtp-Source: AGHT+IEcrnshK1w7qRhGX7J1qQFS8RoY/QO4JJhjPIx4w6CjPb4xuFxESOZluR6Yd9MQJXRSu/TXJg==
X-Received: by 2002:a2e:8610:0:b0:2d4:251f:c151 with SMTP id
 a16-20020a2e8610000000b002d4251fc151mr3665506lji.46.1710156043032; 
 Mon, 11 Mar 2024 04:20:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:13 +0200
Subject: [PATCH 05/12] drm/imx: ldb: drop custom EDID support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-5-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yY+O3A74gJfvweSEVBsGsRQtsdkU2oXgLZzLvkdvTv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDC6SGkJoT7Ekr4PsAmo6dSoo+Gf1u0/3DJ
 gwDjZoJ5MOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1eKzCACTNs01xJGKPm5lsPlqv3CTCY8fSPtMKnuroBpExiZnViiBAeih4jx0cWvFr26CtQG5IrU
 vyrmbCYeiaVx9uWqcEowRyXWnd/1/meuKQOtLzH4cpi5m9XG87ShQAIA9fJuAV01Fi14cE0WsaX
 UTmqC85Yojt6AgOoBPLvrUc5Mbm2gGDYn/jEi0g7BqriqTuQUyrdm7+MP0ZjxZByGFX4/ZWPMOJ
 6P3N2KUmYFQ3wFe7faxji1b/pafP25ixxYdJLAZecg4sNjlTL1xL9uJKY5/D611m0rfnbVWdzCl
 ycYVsgSfXOyYCEPyVWBWgA9ejuncjHd3kJFVaCnaZH98NizX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Bindings for the imx-ldb never allowed specifying the EDID in DT. None
of the existing DT files use it. Drop it now in favour of using debugfs
overrides or the drm.edid_firmware support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 71d70194fcbd..1924d8921c62 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -72,7 +72,6 @@ struct imx_ldb_channel {
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
-	void *edid;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -142,13 +141,16 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
-		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
+	if (imx_ldb_ch->ddc) {
+		const struct drm_edid *edid = drm_edid_read_ddc(connector,
+								imx_ldb_ch->ddc);
 
-	if (imx_ldb_ch->edid) {
-		drm_connector_update_edid_property(connector,
-							imx_ldb_ch->edid);
-		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
+		if (edid) {
+			drm_edid_connector_update(connector, edid);
+			drm_edid_free(edid);
+
+			return drm_edid_connector_add_modes(connector);
+		}
 	}
 
 	if (imx_ldb_ch->mode_valid) {
@@ -553,7 +555,6 @@ static int imx_ldb_panel_ddc(struct device *dev,
 		struct imx_ldb_channel *channel, struct device_node *child)
 {
 	struct device_node *ddc_node;
-	const u8 *edidp;
 	int ret;
 
 	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
@@ -567,17 +568,10 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
-		int edid_len;
-
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid", &edid_len);
-		if (edidp) {
-			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
-			if (!channel->edid)
-				return -ENOMEM;
-		} else if (!channel->panel) {
+		if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
@@ -744,7 +738,6 @@ static void imx_ldb_remove(struct platform_device *pdev)
 	for (i = 0; i < 2; i++) {
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
-		kfree(channel->edid);
 		i2c_put_adapter(channel->ddc);
 	}
 

-- 
2.39.2

