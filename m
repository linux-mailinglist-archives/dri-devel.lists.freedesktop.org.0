Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B845A01BD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBE6C2CB9;
	Wed, 24 Aug 2022 19:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB488E9D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1660826751; x=1663418751;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sFuE9GvKGB4ujTSHCIWIiScJXOM/pRvxv9JHmg8A+n0=;
 b=ZijPX1ELXW8XWrE2tkdHPNVKXjQ8iflO1kCVNxC+pmExGvqMTnH4ms/gjiCS/CL2
 uWv+S1zJF0x2mfFrMucVuceXZ1S63CjPcEyTwjk4+19nQX/alUukZwlrqbxZ47s3
 H/WkP7kkUELPacX3DMQsats+PFJYP9Bgdu2n7ZL3eHU=;
X-AuditID: ac14000a-833f270000003940-0f-62fe347f0bc5
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F4.B6.14656.F743EF26;
 Thu, 18 Aug 2022 14:45:51 +0200 (CEST)
Received: from lws-dhaller.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 18 Aug
 2022 14:45:49 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh+dt@kernel.org>, <sam@ravnborg.org>, <thierry.reding@gmail.com>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] drm/panel: simple: Add EDT ETML1010G0DKA panel
Date: Thu, 18 Aug 2022 14:45:18 +0200
Message-ID: <20220818124518.42080-2-d.haller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818124518.42080-1-d.haller@phytec.de>
References: <20220818124518.42080-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRpKBV7fe5F+SQftBXYv5R86xWlz5+p7N
 ou/FQ2aL1r1H2C1W/NzKaPFz1zwWBzaPnbPusntsWtXJ5nHn2h42j/vdx5k8lky7yubxeZNc
 AFsUl01Kak5mWWqRvl0CV0bTsl6Wgq28FX0dq9gaGL9zdTFyckgImEhc2L2IsYuRi0NIYAmT
 xKnb51ghnKeMEgf/zWUEqWIT0JSYPmkrmC0ikC/R/u0CUBEHB7NAtETviTCQsLCAs8TpDVdY
 QWwWAVWJW0fvM4PYvALmEvf7zzBDLJOXmHnpOzuIzSlgIbHh6xSweiGgmllHPrND1AtKnJz5
 hAXEZgaqb946mxnClpA4+OIFM0Q90Jw13awwM6edew01P1Ri/prv7BMYhWYhGTULyahZSEYt
 YGRexSiUm5mcnVqUma1XkFFZkpqsl5K6iREUDyIMXDsY++Z4HGJk4mA8xCjBwawkwnvjzp8k
 Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rz3e5gShQTSE0tSs1NTC1KLYLJMHJxSDYxL/3j9j/21
 Pel7/+P76kclr2ctFDDX1Ms9a/nKvtFrkVYJx9opIr/VL18JXCRf9GPF6l0b5P/+dn4Q/6jI
 ePOmr/ccBPZ3qb5JVQud+HTzFznhp8V3ZlQ/Yltq8lbu3vX/7P3ah4+ZhMb27/1lZr/McMY7
 Bt5pG1R/LOTfcMJ4W+fExe/3skfOUWIpzkg01GIuKk4EAD5inO11AgAA
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the EDT ETML1010G0DKA 10.1" 1280x800 LVDS panel.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f9e1f85daef7..9314db24ab51 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1779,6 +1779,32 @@ static const struct panel_desc edt_etml0700y5dha = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode edt_etml1010g0dka_mode = {
+	.clock = 70000,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 100,
+	.hsync_end = 1280 + 100 + 19,
+	.htotal = 1280 + 100 + 19 + 41,
+	.vdisplay = 800,
+	.vsync_start = 800 + 4,
+	.vsync_end = 800 + 4 + 4,
+	.vtotal = 800 + 4 + 4 + 15,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc edt_etml1010g0dka = {
+	.modes = &edt_etml1010g0dka_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 216,
+		.height = 135,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode edt_etmv570g2dhu_mode = {
 	.clock = 25175,
 	.hdisplay = 640,
@@ -4057,6 +4083,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etml0700y5dha",
 		.data = &edt_etml0700y5dha,
+	}, {
+		.compatible = "edt,etml1010g0dka",
+		.data = &edt_etml1010g0dka,
 	}, {
 		.compatible = "edt,etmv570g2dhu",
 		.data = &edt_etmv570g2dhu,
-- 
2.25.1

