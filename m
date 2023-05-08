Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAA96FA255
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0B10E187;
	Mon,  8 May 2023 08:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9C910E178
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjau6VUHUJ5zSyue4ZOFML3MUD2nyj8dP9mkrR+Gj+O1WcoRWsw0T/ots7/+6ZNLrMpz42yUiHFrcQ0HAXDAg01b9pE7OsWVGf+qdZOxnNtQ5Um4bgBKOR2tN4E+FJljR6llRnvPNqJsc7uSkCu3XxfgL2R7pVvAP15g4wbQ7YbtaTtpByR7pw6NL/WRe31gxrfeLVZruAdAzcqgDBKoGKtywQQPVsS0AyRgznAd/0/rmxPQhyFJnQfnb9xIei2o9fxy44tcjmfV257YH4mWiUNe8AXkS+cUIxex9HQM6k2TS1qK4g1s/6OkP7kfQSvzMLpwJQsoOd9KgaSH2bra4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r38yO2aFobbeCk+6Kx6gDraupdhosV9aBXEcTHppYeo=;
 b=Hq4q7UsfRZ8hJSeibvAk+GSLZrTrvvh3I/nzvaqMoZf/8Vh46ozpA/dprgwDxATQXLH0jBWo4IO4FxWyIU8YJgfVbf/Zez7RVJvBoh37kCjiPTeUSdGxUrYJep7PzsQhrlec8DFSqdiPMi07D6Q6dbJ2/nBiis6HUPSksS2ya0VleIWJhFs74ZUvnPQP9a8U7+UFL3sFyHPyJBleI5xkVNZSBBJCyHbqgv1B6F5h/oEg1TLXGWReCAhnF0jDmPMoaM6pjjWkvD9zqHynYFNlIbxUm6BYDoUoDp88woWqwyPdZ3dxL2m7Iuan4zK2kOy64BdlpYt9q8mY7k9V8Vh/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r38yO2aFobbeCk+6Kx6gDraupdhosV9aBXEcTHppYeo=;
 b=q4tjLYEKnsBNEdUeCbaNQs9yMdGQnuovnJOlFrMSJPeOx5S39UJqyn3owEQGOGYq0D4wNkLDikIXbWD6A8rWQFs2C5zJeq2xRhk8Onio1DrTpzmbjllGYrYB1D7lZsel+smYfiH1lYsx2Pg3XchmS6s3mQN/rwOlLp2M/2XqPSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 08:33:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 08:33:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: panel-simple: Add BOE EV121WXM-N10-1850
 panel support
Date: Mon,  8 May 2023 16:38:26 +0800
Message-Id: <20230508083826.1016206-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508083826.1016206-1-victor.liu@nxp.com>
References: <20230508083826.1016206-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd79155-76d3-4e0d-f6f5-08db4f9ef554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BrIiWo5Dn7rNb9oiR8icHoRIi/04IcYUxUjZ3ceyZ0CVltCHYAxn2DpoVEC+r6NboZV0JQPaWkuxReg08fEl8ojgscct4SEGRABtZLMoJUMy0XqGI+XB9FkJc0/rBVqbklkNg5riAlng6BrWI290VBbEVtyBvjfd9tF2CneN7CANGEQsI94XrS9TiVzgcMseA5dQGfhOqo6XnhCsXW83fA2ltWvXGQEkoUwIeopw34cNngOztdXPh6QGydz9d+tCD1o/UO7TT5y+oRfmE/2PoM9ImCwFQHlGgFKzLOD4qbFk+G9uwJpgw7TSiDrB5aDFP8OkwXDiEvQADRZrwSA02VnXJwJVc1gK9WXo4ltIsQX38ntjwZU2Aynmcqn4RZPAezrkyBMYpnPuX0yGsdrGZMOn279yxhn/GVq9dO15Y41WhKT7sU77K1VtTkS2VkXypagKwOsKM69kDaVfznCuG58iUltzh+ktWMG3fdAws/V0jkhdP11lAw6UAbDWq9qR3ucSygQDFCeyqC+naXlmCYPDRHFRGB8SWFpdprOVnHtpxYv1pTi2aot0nYGLD4q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(966005)(52116002)(66946007)(66556008)(66476007)(4326008)(478600001)(6486002)(316002)(6666004)(86362001)(36756003)(83380400001)(2616005)(6512007)(6506007)(1076003)(26005)(8676002)(8936002)(5660300002)(41300700001)(7416002)(2906002)(186003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FiFhHUHEBoFdLCuGgrcrACA6w2xykOT2YSzHH0a/cGfispRQaV6PTss1yjF5?=
 =?us-ascii?Q?sg22mJg9EAgPBB5dYYTnkTYXZhnI8IJ7UJXZ9Rn6AKdNGINEdRal14f7Mqpl?=
 =?us-ascii?Q?Zup7RI19Q0wJ1VWS+CCj3MRf0Z5TBdCpv7dnuKPpeKSvQBLqGSWv+Bj6Iv0u?=
 =?us-ascii?Q?5JGm1dhiy9oB6yKiRM9OPOUf+zh906SJU6JE3VZysf9FWLV07+px5lxktSGN?=
 =?us-ascii?Q?TNDFgmvfQGRSa7zpL6f4TzJ1prPhVHz38HczHlLrNh+Hf8c+hgDC0gyoCDn7?=
 =?us-ascii?Q?stu+QLcvqB+x+bsWvVeb98jHouuq9HAPnvUCsC9q5htnDHzlqoQZP4Dq2S9n?=
 =?us-ascii?Q?IrMcRqFwvZJgVntzExNdsC44AtrzJNhxIOBQpHkiJ01x0chtNEby/BiqI0bH?=
 =?us-ascii?Q?+S1ZY4iMhXjgg9ZxuF+oAKI6RLu0d978zHhXLWRYSL16Axjxv31/2W9sQi5s?=
 =?us-ascii?Q?dMxTFqoRUkebTaeS2WRLVO7GgUNUWysCdhwEtU8Tf6W3+Zq98JCA1WeGkOO6?=
 =?us-ascii?Q?pnjFbUuf80Ykf6tAhQtKa6DLYReDB5lWCD07qIUimapOIGnQWpvGvWETJvSL?=
 =?us-ascii?Q?w41UTfyu8nt3mbaDMVIuKo0x0XD41C7m2ojVVx6Gn5RRS4YdFUhExlr+0lgb?=
 =?us-ascii?Q?vrvHM+fsM2M2rsXLLxWg2nVCplklahufTf6WOJouplmSRENtmHifCPYVhgdS?=
 =?us-ascii?Q?NSrbyafhKnP5i6/OiztXMPubXsAxFO1rzz184FMUTw1X+KWE/CyUFcIms1pr?=
 =?us-ascii?Q?CBBRx7WwsLgIIN8HEw8D1yBkHzvI+MdSXxRTktIjqWO3Ki5+Ad+f1Z1Se7ur?=
 =?us-ascii?Q?GUwwRPs/P0SPPBIVjhOYHCKdqT1bNFmj9SfUgc1O0Edo5vj2qJ4FFXZTYvox?=
 =?us-ascii?Q?1e9WurQQ9buSRRejmUUlXt6b1EgB74Cjc0pcRILzBP8VFkelCQm8e+SfuqSO?=
 =?us-ascii?Q?D1szv8VsE4ke3sA9n4P39r16JH/eIrSpysAbd4qacXU7S2T1JN5VFW4NS/c1?=
 =?us-ascii?Q?O+Usc4duGWmW+9Px5A9zvAbtukXy2oPhQgHF3PgnaKgcS/zQDsYCEQnDe4x2?=
 =?us-ascii?Q?jH60wgv3OeSRuxBsoIhYJ53ZBpLXp2/HFpgoFkLX51qkskiPvxD1CUArsR2O?=
 =?us-ascii?Q?3qr56QNk3zBgSne6eJbztemQYhBnhz+aAKY161duRs4KpSade03xdps7625D?=
 =?us-ascii?Q?ADdVomn7l41yPDiOwfI51Yecoeqb+dtvCUNWDNShf9rDIeHZyyM1W+uNZFwH?=
 =?us-ascii?Q?hjF43y8Fw3uReMQWcriz/dRr+MovEzz7sMPYgnb9ImdPKBUNbWY7Klo4z6xw?=
 =?us-ascii?Q?zEHmQT+F8fVEnN2dFBd/JdTmv1Ye3ZmL4fNeNc+MOKgS4Nmc+LoerQ/Eydid?=
 =?us-ascii?Q?X3h/35U8neUjgt+0M9srTKDqIrBZ58ewl/DW7gWz+pr2VaGwr+NZo3ALBS+G?=
 =?us-ascii?Q?/1vFrA5zYrDziyJjLpBPxPFpWJjuQ6n+7aBiA2+uT77iLB1wcql4P7Zwc0d9?=
 =?us-ascii?Q?ZvbW7grGwynNlmFJENyh8rJ/B6soV+cUPf/HTuI8gaiYcipKIcJD/mXckkWL?=
 =?us-ascii?Q?wXd1SZ8Q7ziB8LnJeGeQBc7eNA34o+e+qm1FAcsa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd79155-76d3-4e0d-f6f5-08db4f9ef554
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 08:33:54.4907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEMrYJAKIWmx8H3yRaC5Dqh/6ZdeuJyH9pxqTZpO0exiNr9o+58kdW9VOEUj10tDGqWXCVkzjaNVLqbv+Yb6qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, sam@ravnborg.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel support.
The panel has a LVDS display interface.

The panel's product specification can be found at:
http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Use struct display_timing to tell minimum and maximum pixel clock rates.
* Set bus_flags to DRM_BUS_FLAG_DE_HIGH in struct panel_desc.

 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..b1590a7e2cda 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1211,6 +1211,37 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 	},
 };
 
+static const struct display_timing boe_ev121wxm_n10_1850_timing = {
+	.pixelclock = { 69922000, 71000000, 72293000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 48, 48, 48 },
+	.hback_porch = { 80, 80, 80 },
+	.hsync_len = { 32, 32, 32 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 14, 14, 14 },
+	.vsync_len = { 6, 6, 6 },
+};
+
+static const struct panel_desc boe_ev121wxm_n10_1850 = {
+	.timings = &boe_ev121wxm_n10_1850_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 261,
+		.height = 163,
+	},
+	.delay = {
+		.prepare = 9,
+		.enable = 300,
+		.unprepare = 300,
+		.disable = 560,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode boe_hv070wsa_mode = {
 	.clock = 42105,
 	.hdisplay = 1024,
@@ -3984,6 +4015,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "bananapi,s070wv20-ct16",
 		.data = &bananapi_s070wv20_ct16,
+	}, {
+		.compatible = "boe,ev121wxm-n10-1850",
+		.data = &boe_ev121wxm_n10_1850,
 	}, {
 		.compatible = "boe,hv070wsa-100",
 		.data = &boe_hv070wsa
-- 
2.37.1

