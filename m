Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987757700B3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252F10E6F2;
	Fri,  4 Aug 2023 13:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2052.outbound.protection.outlook.com [40.107.247.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FF410E6F4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/A4NkRCYay+aadn4im/HFEfnENW2hiWsCpUl/B/oMcSmujlXQFtN4gwei+yKo+gt2FPPm9rBkA8JKxHVQpeC9Ri5aj4NxPdYPxE/NEIfKI2ENUdrrNDfvNmIMTvP3Lo62dPxmizGeWlX9wmszymS5SjHNpSwSDqtLsfV/PJly9v/IoXDZ1S9hIJ81n03Op1HfEt/QT7n4ib3d7oEdDv5/vAnLMS9zY8U+yCPsy098ZUh+K+9vJmdsNZkaLLWoneYuxPRe6UddpC76tAf2mHGU6mXcHCx2SbhVDJKFNdp95qp2JMh38qU+5uwp9gS00jop4lGyIFFC5gld1oM1GmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hsn3c0RGoeCkDm1NLEXg6HgBH949T2CLuU8Bhe+3b0U=;
 b=GYvMRXC8XcljYXjvgfT9y7hg1FTnHs1Mms1GLrjBs7/exbJsQuPxxA6LAp9NTWUZTj0+KnewBBLe0gYq0fS1cuGhpWD3E9I5ZMUh/RNjYL0fj7tFRB80kds/o7jYefC+/YlrZkkSqwSuGjG3BmiygEG6hwMiRHatu8kcmnOUnVG3c+H1CYdcYdmCE/IDKJp2yIVysyyxnP+Cn3gXM9Aa9EeZn+IcUmykoTtkxQnSKb14mLElH8eIdRGndrNyXL7Jv//5VU1DWs3zDjtXtBdgmTA4XlFm+Xv91XwuZEzJAIE6OrQUR5k2TT+fLJJHWsHMITPwLIAUGHaZqNEZOstsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hsn3c0RGoeCkDm1NLEXg6HgBH949T2CLuU8Bhe+3b0U=;
 b=dpQ9vLaqVdYAzoNna+82+9Gdk6If1sgMmVNHZ22Ed8TGGdru/GKoppXXKVY7zUlYQzhPDZPXiyrcaMBC9KdvgW+GeT3nTUqYOahGtsyrB6bxaSTN+4dlb9gDNDLBwa5iXFr53MHhjduUnmGWFmd0yjsUeLZx0AY2MFREnkbjxQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM0PR08MB5348.eurprd08.prod.outlook.com (2603:10a6:208:189::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:02:43 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:02:43 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 15:02:35 +0200
Subject: [PATCH v2 4/4] drm/panel: sitronix-st7789v: add jasonic
 jt240mhqs-hwt-ek-e3 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v2-4-2485ca07b49d@wolfvision.net>
References: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691154158; l=2707;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=cXTYdavmo4hFsusdgsAm73qug20kIR6Ap3YAIMZ140w=;
 b=Ht7w5AjpBh3lxgll+qiafR/sBy6FZDw2Ik9zg48EVHTO7keHTFvcJafH1BjhsRyBvoZFAf2hL
 yMRFpZg6KAYBw4jWlgYBPTN7Oa0nd7BDAtEEKgJRH5oU9xKvKo+B3aG
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM0PR08MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed2b378-cf73-49d7-3b1b-08db94eb17a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rcnUiVV8JU3QOmYjxw+AZa4bgdXYivmkzK92k7KRZQ+68Qc1zLeXKPkKHZF5S1d2q6jQzocb3lqclAGvWBzIxq4bgybXpclkiFmHOJDQzQGiZiZj94Se+6QpsgCQR24bE9LqvK6AGzipf8guI3OJGxeRC+QwvG+Ov9mhPTRblpE75c59j/iMg4vYnqdlBBKNHei7x5cjD9l+O125oLCx7pceOW+HkL4EJUYqy19eUTUetClGWj/Du9s7Zr+tHhKq6NI804ogqmY0xNPHGO4zzaSkb7vOGQPPoLnmRPXRnFjgqbd5a8s6Og9ztOWK7ojYCRzN3it+lscAAdm8doD51l4DhzG9SyjR//ySyW15Ngn/Fp1KNZvHPgDwEOjfKMOdjXvJjvzCHgkKy+pFqpXVtfSgag4Wurk9u/r2LDfEUz1JHTZLHHEGPR3NlzjuTB0twn8I04QcSgXgxneYnYt6IjjBV8ILy2L9TtBEfMnv9+6is9mk6rmSpRrq7sO3w8lNu/2RPmRTg+KS1OfS2eTpwEQHfoSYqkvx4llfTqL1Iu8IA8vaVCM6FPtaV8gtkR4PT910nrfRXuNH396+G6u4MTS9I0MQ01Mvq+DdOmk9K7PQLkaOISmbtpFJXCbgLT+xHRDjqJr4pfL0yP46KnHfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39840400004)(451199021)(186006)(1800799003)(6486002)(52116002)(6666004)(6512007)(86362001)(26005)(6506007)(107886003)(36756003)(2616005)(83380400001)(38100700002)(921005)(38350700002)(66556008)(66476007)(66946007)(4326008)(2906002)(316002)(6636002)(5660300002)(7416002)(44832011)(41300700001)(8936002)(8676002)(478600001)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXYrSjMwa2V2Q1QybHdWMnhVemx2U0NTRlYwa0QrcGJMbEFLTC9kVjdGZkRT?=
 =?utf-8?B?YjJlTjQ4MmFKRVdjWkpyU1kwMDVBd2syWFVMZlZiSDZDT1dicHZ3bGZHU3FC?=
 =?utf-8?B?RFNtZXM0WVJPRlVjZ0tDNzltT0JPYWJnanIzR2hrWW1xM3pNMGtoWVQ2d3hU?=
 =?utf-8?B?NlVORzJaeWt6anRBZ2ZoS1BlVVFWNWphWUsyK0ZtQUF0cU9kQUc3bDFEdnNC?=
 =?utf-8?B?TDRtNkJhL2NqMHBVUGw0NWs4WEdGbWNBUXJnQUFUSlhSaXhWNXhRYnhKRnU1?=
 =?utf-8?B?VVFCc2R3c1k3Qk45RTFGRCt4T09OOXhhSm9hejRVM0pLZ3d1T0Q2THg4VWxR?=
 =?utf-8?B?c0NKQncwNnJ3MTJPZVh3M1RqamR2eHlrQkRTQ3JnUDdiZHUyaFdFQzhFTHFh?=
 =?utf-8?B?QVFnRHJ6VVBLaFpBRG5VbDZ5UTZvRXlMVlJKMFVHM3NvNVJRaEx5UXNxU3hq?=
 =?utf-8?B?LzZScjAwZEM5OFhBRW5jbkxYZGU4dzRTR2ZSMmlPaXZQazZqbzdGd3ltanhH?=
 =?utf-8?B?UXRaelhyYlpWbmM2Y2pSTTJSZURKck5DMU43bkIyb25ia1dNVWFWRXFvMS9v?=
 =?utf-8?B?a3VOaHdGak9uRlBYWFF1dU0wYnhJOVhKV1d4Q1VSWkdlM01nditCakduOFlC?=
 =?utf-8?B?STNNVTc1Q014ZFRrZkpWSXdaRUxYTENjY3FkWE0rdmpWcUdPQ2w3RXloKzJz?=
 =?utf-8?B?dkhNbDBKS0NuaitpTENNeFh3NHdjUzZWa2ZhanB3bnU0Zjg4ZzBoSmtab2N5?=
 =?utf-8?B?MVRjK21WcW5XMU9MZG1lRDdFYVg5bnlJdWpVaUxiQkQvUHErRytUNWZFUWt6?=
 =?utf-8?B?dnQrRVlzS21CeFdrVlNFZUNVV21IcVZOZGVlL1BKNEovSTRwZHh2ZzVhWlRL?=
 =?utf-8?B?S3NScFhYS1JOdE5jOWJVMU5VRGdNS0xNRmQ1R2NscXptM0o4anMzR0xBMUtI?=
 =?utf-8?B?b1RrTWoxeVBLSWYyMVArU1JaNHRSSlNnOEVIZEdrNXFJejZ5b2Y0N2xSWUN2?=
 =?utf-8?B?Um1tdFJaQUJuRnZFNVp2eitnSHdLdzRKK1ovSU1YbUtjY0V1M2F3b0dJZ0g0?=
 =?utf-8?B?TUplZ2Z5S0srL3J3MGozWnBLMWk1WmliQTFlWU9lNTJMUGRuK0l6R1E5NmJs?=
 =?utf-8?B?UUg3SVYxNktibzhZY0s3dFhpd1FRbzcyYmxBQmtnRW91anFWNHY0ZFJZZHl4?=
 =?utf-8?B?eXVDWTlTK3BrUUgvM1NZemhBR3B5NTd6WDlzbnlVaXJ2WUE0QlcyZjJHbk81?=
 =?utf-8?B?ZDZrSVpROXJ2TENta1Y5VVFEM1A2OTBiRm96cWRnb0pSQ0htbUdEbkJEcWdZ?=
 =?utf-8?B?OHp5emZLTHRyWW5NT3BDWCs5V2p2UHVwTHpBd1J5eGkzck8zUmdrNkVIeFYv?=
 =?utf-8?B?NVBIZ2pvOEdhbnhYRVRtaWV5ak9HRlRnejZLa3lhUC9zZDVtMVBPTWs5blJ3?=
 =?utf-8?B?UmxkT2E5c2cyOFdydEFweEdsYlFGSDMzS1J4WUJvOHh6ZjlTd3hDT2Nsd0dT?=
 =?utf-8?B?U25JNGg5M3hJYnhXMHpmNjVCbFBoWEdGQU55NFpnTGdCanBvMDBMdEdWRzJU?=
 =?utf-8?B?TndpalhLcmdoZmFLajFWNnhxcG8vSEhoMC9FaFVjNmh2YjhNQ2oyS3RydEFI?=
 =?utf-8?B?OVViUjVPN1Q5WU1SYXpOT201REdHanpOVkI1aldkdmtNTzg2SEluY1YzSG5G?=
 =?utf-8?B?MFhZM0xxNkV4eXllY2pYZXBIempGYVNEa1BsN0pBbFNTWlA5UmUrT1MvY0Vt?=
 =?utf-8?B?VFlqSHpUa2JBQnlMa29wZldmNUliTTh5R2tRalZNUlRYN1JBTHR1WXl1MlNU?=
 =?utf-8?B?YWxvQmIrY2JZUU9JRThndzhEclQvZTRmdnJHZ0VQLzlVUXpXWUttdFNDQlB3?=
 =?utf-8?B?MzQzNzBUSWVRQnk1UUhDQko4enpxL1g1cjNaNnlIOUxzT2lkbmNZU3cxYldO?=
 =?utf-8?B?SUFxMFJ1clI4dnYyZHFjZ0hmLzEwSi9ZZ1hWRi9PYm03cXI5S0RhdGgvYyty?=
 =?utf-8?B?NHhWTjZJeSt5MlVISWJhR2FCQXV3QkNveGE3VW9nS1h4cTRzcVV1UnVRZkk1?=
 =?utf-8?B?OE03UGpmR2hsb0NqR1lWcExPWHp0TU5pdUtScGNwYkhzWk1ibXRNbmVoL0Js?=
 =?utf-8?B?NU5wY1orVkRNUlFQTVlud3kwOU5CZUduVTMzVC8rYjhZN0hra3VqUXpadjQz?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed2b378-cf73-49d7-3b1b-08db94eb17a3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:02:43.8725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7m2JzLnXMTaOqU8mk3/Etnj2biDUryazqnnitrGcsFImDTgzKByAZIl6EcLwN+fZrajx09KBNdcPI8dXW/iI5wbdw/b5l0vqi5KSM5xlvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5348
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
index ebc9a3bd6db3..88e80fe98112 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -279,6 +279,21 @@ static const struct drm_display_mode et028013dma_mode = {
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
@@ -303,6 +318,17 @@ static const struct st7789_panel_info et028013dma_panel = {
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
@@ -635,6 +661,7 @@ static const struct spi_device_id st7789v_spi_id[] = {
 	{ "st7789v", (unsigned long) &default_panel },
 	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
 	{ "et028013dma", (unsigned long) &et028013dma_panel },
+	{ "jt240mhqs-hwt-ek-e3", (unsigned long) &jt240mhqs_hwt_ek_e3_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
@@ -643,6 +670,8 @@ static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v", .data = &default_panel },
 	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
 	{ .compatible = "edt,et028013dma", .data = &et028013dma_panel },
+	{ .compatible = "jasonic,jt240mhqs-hwt-ek-e3",
+	  .data = &jt240mhqs_hwt_ek_e3_panel },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, st7789v_of_match);

-- 
2.37.2

