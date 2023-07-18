Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5227580F4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D878F10E370;
	Tue, 18 Jul 2023 15:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001FA10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0OOxmV3ZDrdZRLWoYuukASZtQ0b+L1b15ncoEjWuWg4uZeLnIX/c0sWTiXBYtFNlOat+kDtWzhLK6k5bazSc/T2QtWhsvk24sv4mcxmGMV9bm9DriJPOG7CiQ+iYbgbkR09l6jFEAjbK+EVyMF+avFUWFezu/ycKqW48PPiBdmtNcugWdPmvRsxv8lM7yyzGfZioeR8bRfXTiLVXVugdAUcSod3K0cE/XEBs9RxmYwFwq1AkdgNeTI2hcG6x0KUl2CvadZ5PT9BtWFnE8AMcI8RtZsYiyFMh5KqZntKdSJJ6OAlEXtSKvFhja8uOwOGsGPjY1EDVIQ/5ZvzNUCHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E87Z7uT6z7qx7Gk1+ooAYQ8xSCRr8WcKOLDoY5saXUY=;
 b=nfB1W/lXLvyeCNMVHnM5fml1tS47syeiIGrtCiDoyOw2gq7u5WyFSwkq8sxVWUqN1D4VyNnv+W94GaC9eEZSP4Wgd6kauspAXnYbvunRfGBDwTU/0lXaqlIKzQ6qBql5Ib9iKLmtqWJyjUZaFxBouNUCIWFiC3sjanEwn+Jx7BXjr6RneJNH8YAB+sz4syAYapnftNyWBan1q/ZJVYtKQpWw7wMvCN/h4aKJhi7vXRmWPZdDyvNzRakOzmx8DIlmIxaWpEecYYh0mEomYDLG8L6+NucWpWvhsh1/3Ms8vpXgJU9FI82IQYtUejKZAUrd+4v42xgjBEuZiUGNjPn00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E87Z7uT6z7qx7Gk1+ooAYQ8xSCRr8WcKOLDoY5saXUY=;
 b=c67wFRzGK3B0LvyKLVq7OTMhY9HZlQvhlIixhrE6f9s3u3Y02aTb3EgLG3Yy7P/ixOXCTRa8GtgI8efEAR7MMGdowrDRSu70P1AahJIC9m1eYHW+2J3FD8kQagHl31EFxiqkTw6QYfjZhwvdNk2OEGiDn8/7rOZSEKPG6rwzPa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:31:57 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:31:57 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 18 Jul 2023 17:31:53 +0200
Subject: [PATCH 4/4] drm/panel: sitronix-st7789v: add jasonic
 jt240mhqs-hwt-ek-e3 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v1-4-e9a85d5374fd@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689694312; l=2707;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=3CXXeclMl8UbRa/nfxaHx3QccSPNJDBj5k/+SOWhXZc=;
 b=55lyc4dEUzB69ng9wtyDdOSCDI9uxJicLGUUm5FrE1nzs7H0lGGnPHOhWmAXIlP7QdHBcfLWP
 xJ6etJRRhrRCyBBE+VjAFoCrl5Vj+uGsJzxxVb8iV9wx+uEwEG99z78
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 80327518-0a33-471d-63e9-08db87a41f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9H37OKA0wmdctUa76lrDfS0RJpZaDJPrE0Gk3K4BGeolLm4he3vVvVEVUwvo3vu1j9SsGFQjlRZUOGLaxCZe2rOsGVI4kGuS9tkkPuVKHCvZTtUsmgwTGBxyCq2X/8oQg5Elyx2pWOSfJDkqtalpuFhSQMgASqob8R/DoqGsWh8REVzPHQHhHUfmhrAVqAPqH4BuFE9FKzo9fYdvvU99pGf/SOM7ucgaA7p3qI9SKjHuRvsa3xVraFjTAu5DTqCjkW5V8CETEp030xVfrIULQuiwlLiNK52cqkcljWA1If38euxMamXa7z4iH/6qSL8DX2Wez/DtSwjmfyrkPOiQVtgPXUwaNK0TPIzWjivScXuKgm8R5U6p+WNnKraKMhzejN77U5HRM0LNSRSfROWZsIHoPiH3EFYIxBeHd68edrJwLTIGb7VlS2U//PVIh6qvZKTffDs8sqKCbhXri0rItJQM5vHXtLUACJFaY/ESzTSJPIO3RlpopY4L7Uz56F5stq6ajrj7VOWm0z0BPknThz0yrswdB1y04knwJFJt9+I7WKemPwEfBaqVIAXR7rIQzE3eUMaDPnl9uLLwnE7OnpXwCgtnUGL5itHioRhQAxZSGGOMof5Pobqhwqn23UvZpP0V0GLUPF2SQrr1crnVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(451199021)(6486002)(107886003)(52116002)(26005)(6506007)(6512007)(38350700002)(2616005)(83380400001)(86362001)(38100700002)(921005)(186003)(36756003)(8676002)(8936002)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(44832011)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNUK2FrS01oNEI1UHhITXRRdEJJbVJWOG5UK2NSWU1rdi80TmwwTklBWWtD?=
 =?utf-8?B?d003WG5zRWZUb1N6ZE5NU1lZVTRxdllZWTc3SkVNR29DNXN6bjh5Mnl6RXRx?=
 =?utf-8?B?NjdIVWgxVGpvKzFreDRCRk5ZbUhXdDd5MXpjeXc3eUhRTUhNOFpNTWhMR1V2?=
 =?utf-8?B?TktRWHQvc2dPeWVaaWFxdGZqWHZTeGlWSStOaWFZZW9FMlZWMW5wcm51bzQ2?=
 =?utf-8?B?TlFvZGgzUTJadmRBU0pXNE03ZkN5dDNnSlBpSTk0SjJMY1RpdHdwRlZPK09l?=
 =?utf-8?B?WVdLNG5EZUNLVHo0dFQrRVEzd0Z1NXFwV1NWb2NYeFU5MkFuUDh3WFNLR1Jv?=
 =?utf-8?B?akZZZ21KNVRZM3FveWkxYTdLN0lWNEpGZS9pczd4WnhOWlUyMTc4VnlNR3I5?=
 =?utf-8?B?TXZOVjg1eVpSRldDUUVuZnFTRGdTYWJmUnJWeUxLQmd6TUJ4eU84aDJwT0FJ?=
 =?utf-8?B?bmkyak1QY281M0M1eVJkUEgySGVhSEIyUEtXRnVGRVM5WXVxNFlJaFcybENy?=
 =?utf-8?B?TnBXc3R1ZVh4aTU3NFdJbnJSSkw4TjdZaC9pRG45N0hLaGFhd0NGeHl3WFhv?=
 =?utf-8?B?ZmszSEQvUUhnSk5DQlQ5bVA5WUpHcXpoeXE2dUc1d2JFZEZwZFE5dXNlU3Zj?=
 =?utf-8?B?UnVWRmp2dWRWSTVpbFhGRE9Pd2ZSZVV6bVE2alVrRklKZUFCcGdyRzJpOHNn?=
 =?utf-8?B?bEkwbll4N1RaTVphby9zKzVVT2QyeVZGVFVacWJvZ3ZicFFzRldLaDV4dEJ4?=
 =?utf-8?B?UjM5aU1UT0lyWXRrTzU3dW5iT2lmQlFTc0krOWdlYnM0TXdHcWJ3ZmcwZmxZ?=
 =?utf-8?B?TE11MzRkR0g0TEp0aytOczZBY05zWmZiZ0hqdTh6RjdOZkdjSjZxLzFOeEFz?=
 =?utf-8?B?WmlWcXZBQjFiQlpaZGc1Y0RnVitGUHFRck1PVTlaZDBFVmlwb0ZtTUxzRkRq?=
 =?utf-8?B?YlBLYzNpMTdUWGthbE8ycmprd3ZKZWF0azhNM3Yza1V4WWZQMzdwaTRUUVkr?=
 =?utf-8?B?azI5Tzd3dzU1blVPbDJyc2RaUGJrWEJONzRuamRaOG14TXpBbWdNMlBaQy93?=
 =?utf-8?B?VTFzSFM3dlRCTXNxYldhdWZYaVNYKzVDampKbGhjVm1uN29aY3NzdWpYWGs4?=
 =?utf-8?B?TGFpYzg1ekVNaERacUZYZnBPSmljQ1lGdHVudEdzQTZ6Y2dVYjBYNWt6NUo4?=
 =?utf-8?B?QXNFcW9UTFlOczdrN2tvSldzMlpacWtrUGhJV08yem1VcVhtQzFSWHFXSFFL?=
 =?utf-8?B?cTI4TVRDS3RTWE9lY2xSc0gxMjhLTmlmQVFadFBNdUZhSkZiUjFET0JXQnBa?=
 =?utf-8?B?Y3d2SDN6YjF2Z1dHekhwVWtaMWJkcXZHYUFQRVpENzI3RWp4Sjl1eWtFL2tU?=
 =?utf-8?B?bWN3NExTdUkxdVdPczBEV1g2Mk4xNWJvaGpKRlJDR3NTa2N0eStFOWxpaWl0?=
 =?utf-8?B?UjhDQmZtaCtPekNrNStJWitsQTM3SHBSZll6ZTdWTVl6UU5PMEFKRktYR1FL?=
 =?utf-8?B?emR6eFFLelhWR1JmcHlQeHYwUXpOSWFRRG0ycnpsb1JZL2E1MTVyTFJsRlNp?=
 =?utf-8?B?ZUZSd21yUDFFcHJOdFQ1WHdEa2x2cHR1V1RGSGFzQUYvL2NLeVpqK2VQMGg1?=
 =?utf-8?B?anZqeWlnTUlVUTFPeU1EQjk1ZzlOb3JZRk4rMjZTVzYxN2IzK0VFZUlKQU1u?=
 =?utf-8?B?bDZoRG9ncC9vRGZWOFduTU1zUnZ2YXNoWVhlcDBhUWxDUStaNGxPa1hEUTVL?=
 =?utf-8?B?WlJtZ0lYZ1gxQkdCaGQyTjl2VTNhZlpJdEJ1cEZPeS9mOEJmQ2lNR29vNEpw?=
 =?utf-8?B?bG1nUlEwNnV0TFFGeElvNDdMRzhCdWRFNEl1TGV3a0ZEbis5eVlkSGpxRmta?=
 =?utf-8?B?MEE3RHBmQys3Wk1WSldOSGdiYmlXcXpkek5STDFMYWVCWWI3ZEJoMDNSb3Nq?=
 =?utf-8?B?QjFoOFlsTVg4SDl6ZmlUeWlCdStjcVFyVGV6U0pnc2pPUnNka0lscW5HRG9Q?=
 =?utf-8?B?WXZnOG92VVlSanYxTGZGVFN6WVROQ1FtUyt1eEYyUzhUbkpkRmR3N2MyaG4v?=
 =?utf-8?B?N0p2c1Y4RFlLYTY3bTVVdHJjanRIbUpiYkh3cmwybDV3WWxOc0s5UkxYUTlB?=
 =?utf-8?B?MmpONkdxN21QN1hSWENGWjB2ZG5adDRoTEN5SXNtUXRGZWE1dzdDSGNCM2RF?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 80327518-0a33-471d-63e9-08db87a41f25
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:31:57.0923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGVXgCda025YxcFsFZRjWV6PsKQG7Rz6j26jQ/aE0ACxG0PelEgYk5AAV4kbW8Wmif/H5ALfm+EC6ICIwUaquPKGWzcpeP3kW5vb+vCG2Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Jasonic JT240MHQS-HWT-EK-E3 is a custom panel using the Sitronix
ST7789V controller. While the controller features a resolution of
320x240, only an area of 280x240 is visible by design.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 729d8d7dbf7f..4c6aed993ba1 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -278,6 +278,21 @@ static const struct drm_display_mode et028013dma_mode = {
 	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
+static const struct drm_display_mode jt240mhqs_hwt_ek_e3_mode = {
+	.clock = 6000,
+	.hdisplay = 240,
+	.hsync_start = 240 + 28,
+	.hsync_end = 240 + 28 + 10,
+	.htotal = 240 + 28 + 10 + 10,
+	.vdisplay = 280,
+	.vsync_start = 280 + 8,
+	.vsync_end = 280 + 8 + 4,
+	.vtotal = 280 + 8 + 4 + 4,
+	.width_mm = 43,
+	.height_mm = 37,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
 	.invert_mode = true,
@@ -302,6 +317,17 @@ static const struct st7789_panel_info et028013dma_panel = {
 		     DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct st7789_panel_info jt240mhqs_hwt_ek_e3_panel = {
+	.mode = &jt240mhqs_hwt_ek_e3_mode,
+	.invert_mode = true,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.partial_mode = true,
+	.partial_start = 38,
+	.partial_end = 318,
+};
+
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -612,6 +638,7 @@ static const struct spi_device_id st7789v_spi_id[] = {
 	{ "st7789v", (unsigned long) &default_panel },
 	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
 	{ "et028013dma", (unsigned long) &et028013dma_panel },
+	{ "jt240mhqs-hwt-ek-e3", (unsigned long) &jt240mhqs_hwt_ek_e3_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
@@ -620,6 +647,8 @@ static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &default_panel },
 	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
 	{ .compatible = "edt,et028013dma", .data = &et028013dma_panel },
+	{ .compatible = "jasonic,jt240mhqs-hwt-ek-e3",
+	  .data = &jt240mhqs_hwt_ek_e3_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);

-- 
2.30.2

