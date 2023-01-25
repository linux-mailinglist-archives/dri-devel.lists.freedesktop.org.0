Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1967AA72
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A634C10E727;
	Wed, 25 Jan 2023 06:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2055.outbound.protection.outlook.com [40.107.249.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265E10E727
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhHnt4BKGBPsxdoyFRnTuGaazglidi4eeBMJDO3HfectOFLMXxn7QbHoVHjTf4jrQi45O1ovrihDEQkXZLb0ld3lO65wVW2SuS+UepB2x/jFhP/+jb8F+PDmSg8INgT7M/X/t/XgQ+aNbaMlO8l41BhB2/6rEvjBBHcAqtT414djHFvXE+OFyEe+7pgM1WjwZ2wwg2grSeMGUar8t4UsIZJ9LmUEJiYxKN2DGYPdN7WgV+ey9IAYzjoB8H3EDhUMKFRHoW/v0UbbQdA6mgfzRf7j51Mbok2F8cZ4EcvztgFcMMGnJaVH/LRsOVT01NAAElgO3mKYT87yd4fav+DiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejD37PBFxcbuR9dxvWzFzWD6+snC12C1C9vO7diPB1w=;
 b=RDHqWCwHhzqdEX/ze8ZdK/i1Ouk9aH2vV3Rdw7Wfbq+I6Re6y191ADCem19AptnR3LzbEGQR3jwENnmiD9/5IeUFcDIJzkVTR53HWYdKSIc6tI4p6C6FQmtsfpFhqcukRZNjki2LzFGYEvatIHn2Hvu8kwMl7cAaGdziYmhA6IC0q81rpEoZJSR/kDOOTZHJGPcRogGU3XyEI9zk/iZ0JvD6LS62pm/Reid+YAu9O/epCgxDOvkcc8uNg+16r0ag8RufdRA/Ms2DkWMmC+eC7liktiQ2+p3/+/SuaAQq+NNmK7viZwy311gdMPk+xEzLy1W01EadXR4Tn7ZZIZNiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejD37PBFxcbuR9dxvWzFzWD6+snC12C1C9vO7diPB1w=;
 b=gFhpJMTx9+2vD9ER2tefTByjGn3zXhBr1YXnQIYW6GAh1QGIsjFc1PtowH1buM1D46EkcmhOYsyyDy5T3uV0jxjnnZ6ZGbyKCakg36/ivuy61/5bMjWER16S8NFpwdY82LVmfEHf9yy7GWVPAbWFcvKmiBKeyRVXKsVMzsUGYuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Date: Wed, 25 Jan 2023 14:40:30 +0800
Message-Id: <20230125064030.1222121-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230125064030.1222121-1-victor.liu@nxp.com>
References: <20230125064030.1222121-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b9efd1-6279-42ff-e591-08dafe9ef5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q434lK9riU2qPq2dWw2X58jFWynx9WeEGAxfP/472WJUB6zNZGSQtZH4n7ntcjaKMTfm5+ZbCH+/rygLpAMm6bZWQ2gMlCTpi3c/CEzB81yf/v20062mpG31fI6zcncIQd0kXluM1BpKQu2AgmrHjWNZt4hTbhEqEq1SE7b8xT+4simoevTW+mBhB2IvrNYOoHM83rcuw86ALOL695xwkFCrLLBtu2x0HRETUa7kBgSPmalxZ2jJnhlINYpWW2+W2DIuHxghsvl9QL6JTs7I5RR89mhR5Lj01ra0TrSGHLwEZuhPVzhl7qkHWLFPG/2hX22ml0iHbTuCw7yVKcfE1gOqhxAmain4+wphEPOCfcVuyS7CQCxJSrFoOQ28X25ExzWglEvkMzI0IV6m3yHVyIAwh7UiynIOcPbqtqDvqOPfWeRZt6iMRgsy9iNlSabcv5fGk63/1bVaL1HWvrwLlE5ZyW4IDFD/6UC6E/tWS9uF+vNRWpyo5kgQzzQjUtkGFwMlHOLBm3Dpzn77tKueS6YDv1DaxKewMd6hs6GE2KQdarivAeaevKvjUUCBr94Oa1tl3MHLYzodAfvbY8aUW/PtrMYRSXT0QloGDuSI8wmAbvlldZKSIOlBIHyiBQVNAKt3kj2NfWN5lxQ/QHD6NoksvEB2HaovOj+ar5VE5em/L9bk7gWCIfcqb8g+K3hcSWEBJxSjpTOzGrdrUiLMCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(4744005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(6506007)(26005)(6486002)(478600001)(6666004)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7WUG6S6yxy44lu3fekVmW+XtCtc4mjlIKgSce7guKcVFOA4zvlQ0zxcz69P?=
 =?us-ascii?Q?gimVZ1rCvVJ93DFIX/ulkrDtq23pHWlXhwnCo15+bMi8r16uG1XMupAmtpP+?=
 =?us-ascii?Q?L1Ai+rjtUVZZLTipY2HGcqSpuhcMGpTUb3+qoIybCirO6jFMCGyPgzjG5Y7p?=
 =?us-ascii?Q?S1unrxM/Z4QRS1nioZMr++I3EucYj0n40TwzdtKW+3WqUMqM//nzgk8Cy6fv?=
 =?us-ascii?Q?aFIuHmUmOygqYKI/KbJCWuWObQUtXMYU4fQCWHvHc+B0KkeWafoJ/FgQxd9g?=
 =?us-ascii?Q?fFtGLZ/Qa8uSSpQwUcBHFtwJHUJA392rEsmBAa7wSR01/w5TFfjOXfxEqKH6?=
 =?us-ascii?Q?9G8N83SiEhjcuKP3OhXqAsEopSdnh2adAtjXHMOg10Lsk/04HMz1LIsd/ayq?=
 =?us-ascii?Q?pFWdRJWtlD8vfb5ZzWFw99Y9pBtON9JhGkIYH8p+7NSWN8u4YyYtQSFqniP9?=
 =?us-ascii?Q?Bq5aG5A0zNGWQ2cVEmF9an2/c/NZB2Ohgfn56qlW5YvQ0V1w70+Ls+ayb+eb?=
 =?us-ascii?Q?1ESwzetP5Abf/BQMF3ag4w8tNnFe7wcZ62Hdiy56Q46v0rf4yUVW1Wl/2U1z?=
 =?us-ascii?Q?bJzZmIf41mZbnCz+87C1X0CvyogZMeUvO9booT+wcAoRlpxWvfV8PBEtNslx?=
 =?us-ascii?Q?8nTyUHkOHmFGT2ScoafWFXcPhowjiuTOIdlFU1bPsGsSxWCmfFaZk8Shrsf4?=
 =?us-ascii?Q?ZXJ3Iak0Dg6N2I59TUzHqOyGW/UMYEfaBeWhbSDagCW5bF65yPvjrr/1IaEb?=
 =?us-ascii?Q?f9j9yvBqPPSVeSX7rCVVvOxq9h8aoyOAXucRQiShrg2buxtGBXwCtZVJlFzu?=
 =?us-ascii?Q?ZYhUWYuDtqHQ/iEvPSWMUO8QH+b1mocj3RQ9AEu8vG0I1I4Tr1YvK5w4UwqZ?=
 =?us-ascii?Q?NsUVKyt/nE1Ve2jYhsUuLtyMIWMAg6OFdiDi2+PYFYYwefsGsezZ19uVVDl6?=
 =?us-ascii?Q?UvRgcqeaAEkc3hGZPPvuYnHX3G/r9wtlwbobn0ePbXHdekLVoqEICOdlZRku?=
 =?us-ascii?Q?cR2LSWr8qg9+x0lVIZxmOoZy+bhiiRMM4phfylpoTE2d7EibiykhdxQxPbqS?=
 =?us-ascii?Q?gH7ziw4kepTNc0dybLDdqezOklbYG6ZPa4Igf3DVzUupeJpu/xhVH3rC9tQM?=
 =?us-ascii?Q?Zcmz6HJPPWCKuf62ewoi15YFX6W8sk7lOzgT2o7OLUA4lzv/1hUKwNKaSsk5?=
 =?us-ascii?Q?W7QTl6g2FjuEdI4Dq44MedNb7duTjbLsUULpzgrWqZcLSxRPGhfyZGuURM+A?=
 =?us-ascii?Q?rDlFV1A6OPLE7FuDJ5fIZPHiS/AL1OuAl1CJCkmnknQPb+IOpKiIorzGUKQ3?=
 =?us-ascii?Q?HX3JM6vLbFvWSrM/jh+kywV1r7d3lhjBW6vwZ6NuxP8RDP0ecZ6eaC32EX37?=
 =?us-ascii?Q?rK478hwFaw0hBGjX9rwYyhYCBsh5yk3+9xe1razr07Cxs1i2IRkgs4VoBLUv?=
 =?us-ascii?Q?a/KcP+61b8Ophd/nAmJudNPM6M5ygm5k4TpfX0XyCESUo9+4UF8PdMAn8DBR?=
 =?us-ascii?Q?prcXq2dzojtzFLFnvN4qg/6vU7GyrUnKzaCLPyR5FJcRaFiexZOcuxmXn0sp?=
 =?us-ascii?Q?sBt3o32VGRuNbtI1anurF8v2kROhEhcTBOq6Ak5x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b9efd1-6279-42ff-e591-08dafe9ef5e7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:51.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUnvN282wvhanGqAszl5g3O7Sl8zuvRgoUF03fPVcksFudYT4aVkK3+OxgSnVP08wrJbjMVyA3UgO05rNVD0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all previous preparations done to make it possible for the
single LCDIF embedded in i.MX93 SoC to drive multipledisplays
simultaneously, add i.MX93 LCDIF compatible string as the last
step of adding i.MX93 LCDIF support.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index eb6c265fa2fe..48c43b273a4a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -249,6 +249,7 @@ static const struct drm_driver lcdif_driver = {
 
 static const struct of_device_id lcdif_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-lcdif" },
+	{ .compatible = "fsl,imx93-lcdif" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
-- 
2.37.1

