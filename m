Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C24C148CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36B10E3A8;
	Tue, 28 Oct 2025 12:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Do+4gl0P";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="OUONIk+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108DB10E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:12:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-6m4c.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761653570; 
 b=e6iZWvUBvQBuz+rxugraZIMPOv3YcMFNZZEZEGO9wFJttTrWLxR16Jg9rtImkmD/C0plat0c3e
 rOYdrcj6SagrOcUlpZi1z4nvy8wqof8GRDs/Q6o81TUuzQanbPGG98U6tZ/SKIuwaRLbhbw0mY
 NewtxmcNqihfRuws+waY3SMtPvN6QuyvJLcoxQx474VRy1g/zUM5si1dg8gYnk22xJFV88xZGi
 k5DPVVeNc56BEX4TDvIbI0jZFUM5lnINAtTTsKv+ccBR2s3kwudAS6FBvz++4Wx6i8NkRuJaQt
 EVHnL5PfPnrdHxHY1euJMfXg7/87OlN37ij8JtTbwSY3rg==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-6m4c.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-6m4c.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761653570; 
 bh=LPNuOvV5GIfBMgx0l/rLWwK1QWOgIasJTyq4uGGl3as=;
 h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=Ys2u9E5TcugwpvuMtC04NAX6pXXldSceXswGHclw/Yz1IWBL//CI9Y2fQegcYY7jK8AzK9TQYq
 DFVwvf2kPprPQwsnOIeAM0PiwAIVaXV0kFu4FF4rS2mD7rGRcauBb2yIQRKaQc21fQ3raFw6hs
 8TB6lVM39dFTzQM8XFte37rOwQBzQtTXPuaP8ZmbA+ZQSumj5Xkqc2WwEPQPTyeyUJoJrxmkxu
 BeedPAs+UBo9g4L9d3Ckozz4k2kEF5oQSJxl+jMxPFArYRqM47CwYKU/xBTo64vbcaF7yNB3k3
 CupYPFKLCurxhtSO5Sm/OI4jhdDvbSb7QdmmAgcCWg+iKA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=VG6cm4G4x6Z3D7MXtTK+Y6amsUkDuaGsyQbRz1bw3mQ=; b=Do+4gl0Py/ItlPWKBrw/wQR3l3
 X/cB4egbbq+mXeu4oqeq+ou4F1brmo6KA764l/5VEaIRcgQcVz9fBQHQXCJN+O689g6qI60eeqDPb
 ov5aq3atEf3uqV4Pisp8GaYfX/xQbFUPmsBKaHP9SWJipn5AZO4WWF3HVoc6tfwwEvRQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-6m4c.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDiZC-00000005gER-2z4r
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 12:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=VG6cm4G4x6Z3D7MXtTK+Y6amsUkDuaGsyQbRz1bw3mQ=; b=OUONIk+tp/9U4/2UzIK2MKESkb
 EWYaSFEzux4RHxkDR5NqeTnb2PUvtqkXXnElXdiwxfxkU65Mzn8v9RHKWYb6kfEbx/SJSe337hH89
 q/0OjaQ4w05M1W2IB+57kDrym8FZhZpH1g8+hWcOk2swPsJpWtGhUB8+C0nfow8piJ1I=;
Received: from [87.17.42.198] (port=61382 helo=[192.168.178.74])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDiZ5-000000004BL-1CX4; Tue, 28 Oct 2025 12:12:39 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 28 Oct 2025 13:12:29 +0100
Subject: [PATCH] drm/bridge: ldb: add support for an external bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
X-B4-Tracking: v=1; b=H4sIACyzAGkC/x2MWQqAIBQAryLvO8EF264SIaWvetCGQgjS3ZM+h
 2EmQ8RAGKFnGQI+FOk6C8iKgdumc0VOvjAooYwUquV0pE7b3c92DuSL105IiU1rau+gZHfAhdK
 /HMb3/QC6aGlvYgAAAA==
X-Change-ID: 20251028-imx93_ldb_bridge-3c011e7856dc
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3272; i=francesco@valla.it;
 h=from:subject:message-id; bh=LPNuOvV5GIfBMgx0l/rLWwK1QWOgIasJTyq4uGGl3as=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJkMm82SNsa8OHinb6/mTb83ZcsTq5/uXrUuf2vNSo8Wh
 Ql/lJ9ndJSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATEbzJ8E+JpSBxrptKlEhZ
 9bEZ3lf+316Tq/m1pfuevUraQ7np2wwZGW7z35vssMSS6+rqi4wra9MCO1oeCR5daDn5yP/8tLO
 qN3gB
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f3d1eed614e9d6fde5903f9cf620ba6b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDiZC-00000005gER-2z4r-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-6m4c.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

One option for the LVDS port of the LDB is to be connected to an
additional bridge, such as a LVDS to HDMI converter. Add support for
such case, along with the direct connection to a panel.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
I was trying to add display support for the i.MX93 FRDM on top of the
patch sent some time ago by Fabian Pflug [1], using some of the work
already done by Alexander Stein but not yet merged [2], but then I
noticed that the support for LVDS-HDMI converter bridges was missing
from the LDB driver already present for the i.MX93.

Not a fail of the driver itself, obviously, but I wonder if/how the
existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
correclty. Unfortunately I don't have the i.MX8MP hardware to test them.

Anyhow, a patch for such setup is attached; it was tested on the i.MX93
FRDM using [1] and [2] plus some more devicetree modifications.

[1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de
[2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com
[3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso

Regards,
Francesco
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fcd0022da0f35284e 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
+	/* First try to get an additional bridge, if not found go for a panel */
+	fsl_ldb->panel_bridge = of_drm_find_bridge(panel_node);
+	if (fsl_ldb->panel_bridge) {
+		of_node_put(panel_node);
+	} else {
+		struct drm_panel *panel;
 
+		panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (IS_ERR(panel))
+			return dev_err_probe(dev, PTR_ERR(panel),
+					     "Failed to find panel");
+
+		fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(fsl_ldb->panel_bridge))
+			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
+					     "Failed to add panel bridge");
+	}
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

---
base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
change-id: 20251028-imx93_ldb_bridge-3c011e7856dc

Best regards,
-- 
Francesco Valla <francesco@valla.it>

