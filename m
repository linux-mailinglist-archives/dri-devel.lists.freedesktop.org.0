Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1A6935F6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 05:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A44710E1B0;
	Sun, 12 Feb 2023 04:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2085.outbound.protection.outlook.com [40.107.15.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D250110E1B2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 04:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2BGQmkzCs0Q2bSybKTDkR5a9JaPAIalIDx4/70pfwgblu7B1hc4UydnNjXxQo9SdlUaee8zRc95dS8MEdZJUdz83gI9gLyIy/pBI5ZFhHsvvihHSjJGuQspZQb9u/BRLLZ6EG7mAgE23B/8MXrCNCWtyWao3/ODB3OyubOES4jXWe72U/oEjJFsNaiSY92f0kHSvC8WqcU592pZ0er2+cjH8vBB/64nYCfihj6uGuWGMpsHcdnuP0vvFaiBE9MpZpjcXo4hi0q/2cKPl/B78yw51LZcCSHqJooBoy3PbK9UUt5RSRuBwFd3gjP29TbwcZNp2Z3+7uM5/onH3tgmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGO1zSxZ9NgzNArzpe1C73I3mD6yNaz/wIg2gW9T/hs=;
 b=n3hvlWQO043UE95t5CxwD2teHq32nSjHEKBKUHnNC1t3E+RvQUm69wyl1V+bvZdCHfn/zC2Nl4lJyzmuUXsgebGWpSfIffFEC6GJSsTpgE1egaaKIsqQRKDKxZfSSzIGXRYwV1vvQEa2iGeVBCTEQXtT1cFTn57xUe75BWMs+t54YXnneiUj/a6Kdr34aVbx3aAWFznUwZItUTwpx/yMuxYfiElBwgJbCbJkDjfUJ3lMV91kFhcSVSUJ+v5srpJ2DiCzgDg4B29oOgOq3Mr/RaMnu5R4ryDB9hHRZcH0Ooa2AmpSjm7pIR+P3mRxjizBRneucPcPS2nYZmSafzMIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGO1zSxZ9NgzNArzpe1C73I3mD6yNaz/wIg2gW9T/hs=;
 b=DzfAXoNGZEgcCodgbdVvdikEMkgNYIUg+lfcH1FzmuZv0fDcWWRwqeTtTeFR6NeqT/2OnitjxOqe9o97kGLqgMeAKZ4Juxh/eyhrOOScK2KqHdgWAbIprHZE14L014kEuOV1ns7Uj/V8XdVyKYPLEFHOMBYAW4VZLZiyumnPe5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 04:07:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 04:07:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel
 support
Date: Sun, 12 Feb 2023 12:08:43 +0800
Message-Id: <20230212040843.231934-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230212040843.231934-1-victor.liu@nxp.com>
References: <20230212040843.231934-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 533c8b57-d869-4c9e-4bf3-08db0caeb0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VQh9VdAMbf4HKJrE+gme4Oq0sEOliDBHjQew8d8uu5+bjv12bbfQS/t+QQ0+wIn3W5k4V850W8LIk9e3eR2q+PPWOkcM4C0HaCCgBD1ErWx3PEIaZBntHJNvQDIppNUOsF6COb8+7sbUnOaOPK5ZaVR1ZUSTE8o/2QGcgSvXQyFSoJpKsoLVHs7kwZSBMgEEScnyZWvHZgvsOvfQHxogOWKzHD9DG9Kg8p1Ofon452DVa5KSVm1wQBrLwY+kTxdmjaxusIAAoRmopLOq1dWOluMkjtODSyIprUNpkSPW5JCKVFxTpfgWdN/MIML0aQi52Zm+0QM3YFb7NT+NE8l/lNSxLbdtbmOLB/H0l+8k8m8e1AFslTNLhWa3tGEgqde2ddT3mM84BbZXMMF1vRlcQSG6Ojx5aDnnX0ofDqzktHHnXoWudKHTYFZshmMZikTH3lbPp5whyf8N5ADREYfQaVzmC5jD2ugWRMoUU4LsM5z60LzbppQzJ8CNkXJpvKOTHyp9GgrqlFgFyxjw0QCp7RdOhkJDIkZFiZ7ZqyC24lUgoN1UVckH0pLhFJ03rN8tmJwNoFu7zfXio4k+GnT/lBXT7wYM8lKJLB9negG1TCyqxJ1OBDrWr2aVaOrOeRYo21z46HpE0jSSFMNlOcaUJIHRr2vm3hU3dypdn1BtnSA1w4+bf+0hoe1FuFiGNrKL5Gp2d+UAxJdY+CUNykF2p9G8UbQDvrt5H2WazSTtAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(86362001)(316002)(2616005)(6506007)(6512007)(26005)(186003)(1076003)(478600001)(83380400001)(966005)(52116002)(6486002)(2906002)(8936002)(38350700002)(38100700002)(36756003)(41300700001)(5660300002)(66476007)(66556008)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HISK8nZSCSKviNo0brDxl/MI3igu2t0inSOneaAa7XPt6LnlKpxbvmrfSrHI?=
 =?us-ascii?Q?k46JiiI0yZu2KGLjfbJfXExUslkKINOaJuvmMDMEnT8/IEGdSNbjwFiYUlCE?=
 =?us-ascii?Q?nseCMKU/Tu/j9AFm9q00LHiVduN6rR1MensRwHfw5pkuOr8ExqttBAHViThj?=
 =?us-ascii?Q?tjY9emw2nP3y9FWd87/k/8JSIzxCDA+Rf2ZcJpFjqYDYVFaCTiyQx/jlTkj9?=
 =?us-ascii?Q?ZdxZIzddFoX0wXpF5eBkFmyD16ovfo1+rIsvFtYsxXiTLJWCItRWP/lfC+v2?=
 =?us-ascii?Q?goGIV4vAvBpiosoKbNb43ybFwnnl04BZrZmEogeDtkE1eYIHqK9/CphCChAu?=
 =?us-ascii?Q?0qwTSRBBUuzVxWzVS3NFGcXiP+XSPcEKzqDxTNsMvSZxyEhcolsRJDGYlQxH?=
 =?us-ascii?Q?x1no+60n/INPbs8SPgPPWcj74a/+n46WhTfn9Z9FaII0ZCwsJ7jJVcOgMxDy?=
 =?us-ascii?Q?5H6x8XTBsNGNjQC0S3cXuEDHJHJRYPCcOkIbN1uJTG13oFiE9cmMIXTx1/mf?=
 =?us-ascii?Q?T/oa1Tz32oEuQ/0dbmdJCNkLbtaQBYHFlsSUzAU4Zyixwqp59qG38A/u9WxD?=
 =?us-ascii?Q?PFjxL7lwN7rb2Sy4KznUB0hydICznQie3PJ/CiEPGttoLBblXny93IWx6OAh?=
 =?us-ascii?Q?MJJRzkylmH70lyK0Ld/FQwfkBXy+qrBLBa4RK6HgqmYtWucuPtNY71+wjEgb?=
 =?us-ascii?Q?nqcbjijVXSgdcCkI2KDjr6vDLx01Mh6kRUfSKM4VAhic7Z+avbRSM0ncnqyF?=
 =?us-ascii?Q?Bejd+7BsdhOuPh8ti28kKwyCReYBx9xf75O2g0LYSUUPaQB1HykX/vIdmXfO?=
 =?us-ascii?Q?y0RgGjQVxTe4fDcm5KPn6YngJW/8ckAlDT90lweMrkIsESM1Zm7YSIqEWfOp?=
 =?us-ascii?Q?4++FVzcAib9Zh4y/4H7Ho90izAoCvnZcBVV03uSKM43Y86yHuGiiwWpWb9YB?=
 =?us-ascii?Q?D0lIQWnnE6RWTXluh49IwukxhTFYc64/4jr+aNrIp4T2bRP7pUmzQegLKhYD?=
 =?us-ascii?Q?mrkoZfm1toYvokFC3ib8pkznKt7ukUpepagYbMezErgUcbjeTEuHLUVJzk+1?=
 =?us-ascii?Q?0xHYvX7CsQBjloGUOkTbXPFGGibXcBPot25MOtUl2V/NFkGNBa+js32vT3f8?=
 =?us-ascii?Q?txfQnKeU85nLzAeAsV5ITQ4s4ZgWDA8bW70ZccXIBp2VPeSYUEIHNgGB+Ukl?=
 =?us-ascii?Q?6N2DUoR4VtxI5Ae7da8ENM3XvO6+LOc1i2GehldcDCCFdkjL+U8sFDtzquZ1?=
 =?us-ascii?Q?oyF8j6lZQBWjDNIbvzyNyadlPgHcUl5RyTnLqK/lD/CMBDcJ1s0HfjgNgNZU?=
 =?us-ascii?Q?rP7Pn17AI7AnBH2qM5imVKjSzCMT2tXmqwvHYsk7diowOL+pbFJO/KCXtOEc?=
 =?us-ascii?Q?3tAfRK692N0jYHSf0g9DzTQ3q16LrmwWz/+/kmLNAK7vqd6WTZCRebsXV2/e?=
 =?us-ascii?Q?f3tV7rphe+LQNIgmkOJuG3fC2ch0S5vy0wF3H+dxXlRLED56GiriZHqT0+mN?=
 =?us-ascii?Q?xtMgZcC+5H9z+HrFmMpCRw7YBo3K7U4p4fqenuExqt3zHs0OtE5uDPWTnZcl?=
 =?us-ascii?Q?L9dRf9z16Y1Ott6HSXpQ34EhWXUPAUa7VRArsJ5c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533c8b57-d869-4c9e-4bf3-08db0caeb0b5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 04:07:43.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA1aNz7wggt/nRdyp4i0mNR8PRND8N4qGba91e3l1uxTRg9dE+1KUNWJPwIlVWprqBqA6lZ1QbddROEgbeW2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105
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
Cc: sam@ravnborg.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel support.
The panel has a LVDS display interface.

The panel's product specification can be found at:
http://www.onetech.com.tw/files/EV121WXM-N10-1850ProductSpecification_20180801.pdf

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8a3b685c2fcc..ac7aea7c186d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1211,6 +1211,36 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 	},
 };
 
+static const struct drm_display_mode boe_ev121wxm_n10_1850_mode = {
+	.clock = 71000,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 48,
+	.hsync_end = 1280 + 48 + 32,
+	.htotal = 1280 + 48 + 32 + 80,
+	.vdisplay = 800,
+	.vsync_start = 800 + 3,
+	.vsync_end = 800 + 3 + 6,
+	.vtotal = 800 + 3 + 6 + 14,
+};
+
+static const struct panel_desc boe_ev121wxm_n10_1850 = {
+	.modes = &boe_ev121wxm_n10_1850_mode,
+	.num_modes = 1,
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
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode boe_hv070wsa_mode = {
 	.clock = 42105,
 	.hdisplay = 1024,
@@ -3984,6 +4014,9 @@ static const struct of_device_id platform_of_match[] = {
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

