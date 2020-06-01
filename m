Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD31EB671
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E2A6E3A6;
	Tue,  2 Jun 2020 07:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509A26E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMpR2E9QDXd//WQFiRxwnKDcRWpjQuWFc7Hp/KqEWOUvGHabp9GcXW8I9v2uQpYyLXSL49dRES02S8mLfM0in5kgOGe/7x2HsMs4ZMhJhCSE/i0yOZFqnBMmICk6hS1qXg2JXNN9XMZEQnZh/zXwj4lsd757QqSoVl/seM6+87fFc5TzOt40somaY8piicG4S6ayxyxWGdHf2w/v1h33CQD5pKbSLUn5398V7KIuYqCtxYTb/RfurPaTZWJkoKTgccKF+WaBjKcPAnDq1qqEJ3ZW3qy/73Twef5lmtzNlFkBnG43DVhh23EuJnXgdrYujFQOZDdwKQcvy1HJXKp94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu6lIrAncbFzVl1ltS70F5JjeNb2UewxtTCnZHmYzQw=;
 b=asItazQcogldZGabqEKW8EWvD2KeuQmh6CxLXT3hOtdI2n5dgWXPgLeNxLlGC+q8KjHSpIE47WUAfxrCYnxfpMNG5dMv/6nrgCpOYoPvDxrigUX9HrY6OtCYebsEL53SVJGdLxVHacbWpsnkHcgwB/GZ7Vlddt9wciXcegI2aIhy+hpmt3C8gZyj+eMktXf844XJBLxVi3EYAlxiXhZ3KGuxhtJG5+RVbsgyFaDuwfZsh7BdGZGegNDo4UdFVzcqq/ZU1GqX89AdkH882PoSwcOSwkdcBomu5X1brU0XhmmpxN0bVZXmJgPvfXqhk4EvDDDCQYdghtJPxi/dBxa9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu6lIrAncbFzVl1ltS70F5JjeNb2UewxtTCnZHmYzQw=;
 b=ZPuJai76KutktAljnQVM6ra6y9efVXt7fX6X9qhsT88zdj38dfIoQgCErrcGTZMbbGP90YBjOi27XT8cJ9/ewZ/cAOePM7eF8b5CI/9YuwkXK0NzdBEh5JvyTDw//GByaOoPphL2FYyATJqVfWrkL7KG/TlY+yAjvxEeOvd5Y8E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4573.eurprd04.prod.outlook.com (2603:10a6:803:73::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Mon, 1 Jun
 2020 06:21:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 06:21:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA
 panel
Date: Mon,  1 Jun 2020 14:11:20 +0800
Message-Id: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:3:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3045.21 via Frontend Transport; Mon, 1 Jun 2020 06:21:53 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8c08c29-68ca-4f96-d5e0-08d805f414b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4573606A8974F5475551A694988A0@VI1PR04MB4573.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLbBQgOGJkHVg9c4eeDsO0wmsJn3OfPU70H4KI9GUaHmHWPgAj8o+cmCgjUlIUnBa4MHxrgJFuN4GpXoyFfogjuj5XQ9UXpJ6QtuyEi7TRubbPPhFDfzobGkmjFjW1eXj7UOAf+ivlel4zs3eKitszaOG1pw6Usc+fRDsfbBxLKtqFKP90vSY7zaINEEgie0S4w9Jj72PEDzAgyltUgZEhqb43Mh4d1A85BreLuOxiGdhzQvp5Y80G413Qs0JydyoJpl0XZlquP9EaySdt5gJreYt1kdEIHWHN8pHoTkuHG6HO8Bznf6oN9j4FcUlmtQShvSn4+bmWsb5Pn6B/lPXR35NY5u4aMdie2eOlMROt44Kx0SURa9KoPHqEExZkdRjE4ILAOzRTsQblYNX4rmV0lvv0IsgvirhUTYv9ol816JeLFZvOYh6mjJ9mRNnUYVZl2eXfqURbHIdEK7GcdWxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(52116002)(966005)(478600001)(8676002)(4326008)(36756003)(69590400007)(26005)(6506007)(6486002)(86362001)(5660300002)(8936002)(6512007)(186003)(16526019)(2906002)(66946007)(66556008)(66476007)(83380400001)(6666004)(2616005)(6916009)(956004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DatXFXx5KzcuHIZdzhZl+Il5VnN51qjzGxfOITcAj2Wa5Y4LXfZD2yi5611/46qBKdcnfctDWIZ44lUmVzU8Uda6Ha4ivluj4RVHRrLwNvePI1AotHQ3H9fn3TKm6vb2tJ9ZG02TiGO34kR/O8sY4P141zGEazLX5aAVeAQRHBjOgAm10h7aUaoIwkqUX5+fZJUAVWQO2pz1+QHZ8KAq7rtw2bNXp40eBQ0GGjrVJdzv3oSOJX4gqM/f8OxF8z11IrmBck1zkEZm4Ub3zsU0HlVXayatU4VNtXARVrbtQPNf33VNRpiRrdpdAkuz5RDzwGL2zeIPEIEEq2kAftkk6xbsM3IS8q1vhZ8Wi7KdRB3IBcHKifA/j4684fT6snGwTGTgULUCbAeKXFoRROWIlx80VRIQaSivaCdPtpQZPk2gjVS6gwQOcRITngGfSSX/Bqw0m8OR8NT/LWdF9Bh+71mnY4oNN5XVCwrKwEWmBVY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c08c29-68ca-4f96-d5e0-08d805f414b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 06:21:55.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+wrjjAWrd0ZRz/K+7MudeZUEZFPwo+MVhWYOXtT6Fue7EKL3YO76olV3u5BJSQeoJpcnmqEu+sb3N8Irwds9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4573
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: devicetree@vger.kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for Kaohsiung Opto-Electronics Inc.
10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
The panel has dual LVDS channels.

My panel is manufactured by US Micro Products(USMP).  There is a tag at
the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
and it's made by KOE in Taiwan.

The panel spec from USMP can be found at:
https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf

The below panel spec from KOE is basically the same to the one from USMP.
However, the panel type 'TX26D202VM0BAA' is a little bit different.
It looks that the two types of panel are compatible with each other.
http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd15..7c222ec 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
 	},
 };
 
+static const struct display_timing koe_tx26d202vm0bwa_timing = {
+	.pixelclock = { 151820000, 156720000, 159780000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 105, 130, 142 },
+	.hback_porch = { 45, 70, 82 },
+	.hsync_len = { 30, 30, 30 },
+	.vactive = { 1200, 1200, 1200},
+	.vfront_porch = { 3, 5, 10 },
+	.vback_porch = { 2, 5, 10 },
+	.vsync_len = { 5, 5, 5 },
+};
+
+static const struct panel_desc koe_tx26d202vm0bwa = {
+	.timings = &koe_tx26d202vm0bwa_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.prepare = 1000,
+		.enable = 1000,
+		.unprepare = 1000,
+		.disable = 1000,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing koe_tx31d200vm0baa_timing = {
 	.pixelclock = { 39600000, 43200000, 48000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -3832,6 +3863,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,
 	}, {
+		.compatible = "koe,tx26d202vm0bwa",
+		.data = &koe_tx26d202vm0bwa,
+	}, {
 		.compatible = "koe,tx31d200vm0baa",
 		.data = &koe_tx31d200vm0baa,
 	}, {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
