Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D46FDA96
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCE10E473;
	Wed, 10 May 2023 09:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1F010E473
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pf7efIkCfQeiIB33VzR53n8GcN7kfDvVYHuyDOVrwoXC4s2epnnBEfHrePgiDrAFEL3+LDif/IDgIEFaMnEvw+L2fffTJJ+DHgO88Pl1WJ6WeLa0SYkcT1WsKwuut4tUUIGq1zO7BX9vhh7BOukjNyOsDcTuqGlqi/igdgBvy+lMBrv0AQZo3aIXX+UpXSXywbLuuamXv1BhPrT6cxXdah2ce/H0RXwtywWEJk+xWQOHexLLg9b7Vm4SHR2+a7u5VgV9CChl9tktoujkjxMJJPeVeSc8QNPPbHlXioct9050s4Ien7XqwFDCAbJEPjc8O58osZ8W5XWtWTN5mVB75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+8OTKynV/Lw2CW+oOPo/MREJ3R42EIFCrnmzBOnXnk=;
 b=fCGlsCINA0EXfNrfZJUOLPoHts73Ohb+0Y3SlPTkRChcNH0dYYBWSXUXQwS7TdPZZ6XZYiGHzhDQq3xMKfdMopNyy6UxMPREt9GfUoX8NNhaMQnaFVKON8/wfmpN4fYAh/dFVK01mgrTwUreNe6GMcKvkzh1JFM3wU3xCgG+oWv3pIetcfq+qsTKc4soD8ltQ9YLwx3ScK8ZlIIC3cenkb+KQXE3HeGUsfqhe6bgZFQW7dD3Qcf3Zzok0UIHrFr13pjK4ZyO3q8NzWBFepoH3oP2OgH3IbLO1ur/x75aH4vHcsi5aNOMcAyavQ/yxEBwSOOn1WLYbAU2lfRYgKqPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+8OTKynV/Lw2CW+oOPo/MREJ3R42EIFCrnmzBOnXnk=;
 b=PQda/cddOFYo6167yRLl5EupM5mHrcibhkN8JHqXnIK4ZB84w+hOAguX1zYhQS+fH6tlfzj12by9cxYSrg2BKF1GYOX73CQ2/ksJOU9VDRBC7me1IGEXynFuF3isGwaojnhowS9M7uvjvfawUNazdU3xZVuwwLIYx47n/+mIQWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 09:21:08 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:21:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Date: Wed, 10 May 2023 17:24:50 +0800
Message-Id: <20230510092450.4024730-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230510092450.4024730-1-victor.liu@nxp.com>
References: <20230510092450.4024730-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d45a33e-b014-4102-93eb-08db5137e2df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpu3P8v+ma8ZJn1atC4WFjwoDVY4a/F2YOKrLGUG65Y2pNSIw0dwvsmocB+RsX11A5lvy4HDZzrdMF48WiwPSrHYvXE/4VnEKJsIWX1vbKtsgjwrAhg/hN/Gv1QQEeUyWnKuMZfM8uqKRRd8Vxw9qeQeYc89U/UDKm4t88q9hrrcOfBy8ZYwRY00vTMZftB/kuMVJ2FUBJpVB0XVmUhwniyKNPuzmVJNlSi+hNW/99qcTGuB9EUeIuWf2bs395AqgZoN02C6CNQ41x3/GFFl33R/ZkOaVUwQ8Q2yY7AXVq4QAoVvl/WjjKaxYRmNhZlDApAqv2+MnErMhc2njBZRPwmhyx5ZyZpR7FF4iQk6un4jgbGUzhWekHnWIYOO+kSm8CEeJ1XKR/SX5kDVJ0owwSAZuCgevqrdok1+EG037nAaZ9HrPpVP0gckZ4YaXxdHjdQ+XOf93rdeyl308nEsFobHPoWzM090zhVrLtzSg3hKr4KnU7xnvKP6A0Dne0MOeSH2NvzrttcgJU79YbmfE1L3dwOjMV5kzneaVdcgEaBK11A5qlMJfhr4TFDZm3o4jNZKqNakRnPMk005a8WWB+PUWmI8Ws9Fiw58hWEYngRm6vp9JPEqUA2VO1bnoZzO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(86362001)(316002)(52116002)(6486002)(66556008)(6666004)(66946007)(66476007)(41300700001)(4326008)(5660300002)(8936002)(8676002)(7416002)(478600001)(186003)(6512007)(1076003)(38100700002)(6506007)(38350700002)(26005)(2906002)(2616005)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gc48jROz1qddYmjRHbupozctCbUoU1kEKkcuSxG7zG7bVQJXGPNY0dE//Z4k?=
 =?us-ascii?Q?78nD6S3HOlLkwM67jahCC5es2FVQfKAR95Wk7GXOR73P/myYpZDbYXgB2tCv?=
 =?us-ascii?Q?vbaJeb0XXeddxl4ES28dgjf1JyfR5mkpG+Zp8YDCcoLBxEsm+yBLu8mkuUjM?=
 =?us-ascii?Q?ktivZRxTJqybz6cOqmAH6Q84ZaowKdCyVVNUIm7IR2Aa05VkLtWLjcicPE1Q?=
 =?us-ascii?Q?sgCN8PfIX6WbXys1JS5KrWJTc1o5ag+N+uJskX/SJHdPAIEAE1Sn3ORkfiGX?=
 =?us-ascii?Q?r4Lsym4nlewoPkEVWWHabukvuvBkY8qY/I4KyEKVpqLbZ9LbVNJls7HrTj80?=
 =?us-ascii?Q?LioiTPy6liIsveQSvlgFEZ5Pu1jjG0Diacv52LZzdIofj203+a6m67Ju59xG?=
 =?us-ascii?Q?H5pbLAnEGgnj126jCxyw9jv1oNOxYrfGrgSF1YK1ifPSMnrRwRZXTpuWJ0EV?=
 =?us-ascii?Q?7/2pvxPjsGxxDU9TSATRmCvRHqim7oQYxq8ZPyag5T7COEKcZK8zFekul3FI?=
 =?us-ascii?Q?uXl3A7svG5khdscclUDNrOJp0qNeD9+DEnh2zVrO6ANM1kPVdA3wppILHp+t?=
 =?us-ascii?Q?fJGGicdWGPHzMz6hjTz8A6X4XnQ7ABGDI++YrtyZP96LLVx64OxANPHRV7TC?=
 =?us-ascii?Q?rAba7fOEzXnT9GSPZUvSSYDOl183SDiOeiPAhXfxvsyTH6bP/seAS6PmIvaO?=
 =?us-ascii?Q?ywVVKcNNoZkddr7vt5Y06zIIJNNcv350m86HYG+vg7w2lEAgIKz1r/Rov5kw?=
 =?us-ascii?Q?Cah41GiP0fouLEA7Glc7JHfOhX9TolfKSjRdzJRoK6c3DhYm407bRh2NLXht?=
 =?us-ascii?Q?/apsQJ/3uv9WBB8svObqT7Ty6m9+UnE8yimHe1zL52uFtl3LEiWSCIDIC0P4?=
 =?us-ascii?Q?LYLlXxhffDl/iGvbnKqEOJuSsYTxGOKRf+sbiC2szVVLlgJC03Eo0sYmooUn?=
 =?us-ascii?Q?tpz8sr/MIFKzYlO7dvxlvaNO/SY/Fn9NgK/euFTmm2hw71sArjmnyqYcrxrz?=
 =?us-ascii?Q?maAd6hzA5fPU3KvSUitW2USbBdhVAYFRaR1wtj+C1uWFoe9CALaUhVWMZYgH?=
 =?us-ascii?Q?9pBZ1d00c/fZVp8hX3D47qPoq5kRWnGAgQHCC9Oht13T+szj0xyJJqMWl4zT?=
 =?us-ascii?Q?xnRu7H7HrD8DWmwkPgEyDYN1wFcZ8CTzCKN7oqXpM2JJyLftpDjIWZdty1OG?=
 =?us-ascii?Q?lYNCB8A7znnyiei/53o1tvb2ZaIYdQUjRooRCekRC+d2B+S6qGTTw0WUxDgy?=
 =?us-ascii?Q?9zCi7GuvSNHVwJOh5qvzy+Jma7DjzKtLlCTpM9y51YtxCjGAORDOMGtpgmr4?=
 =?us-ascii?Q?ZiCCPCg+4niAIfSStgvdzFS/gqQeDLN76lG292kqDoFAYQ2SCv63i+fdtpyi?=
 =?us-ascii?Q?mA0egTVofk/uHqamw/T41k20wKsT1sKpMw1gRIFyR53vtFNGWy+vvl6//Xbu?=
 =?us-ascii?Q?ow0kD12gNYYbrmA5seToyt4L/48ZrM1QCREipp89PDtvr1vDVuQkLeOs3UUs?=
 =?us-ascii?Q?nWg17gtxCNRAiqCQ2oPK7OQpxnMqr1tA56dRIlXfaywjEfVOX0JoZf6JZpcf?=
 =?us-ascii?Q?dMh7WmjQ1z7wV2oFN4+z+YzTLqhvBKFJbE8TgTQh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d45a33e-b014-4102-93eb-08db5137e2df
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:21:07.7466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1s4FXarLc/1muTcXKOLF3CYYb5iSxum8I59eruWGEovsIW0sxf5ncVbNizEkvOeWL67TOWpK7Dwn5dVRwThEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all previous preparations done to make it possible for the
single LCDIF embedded in i.MX93 SoC to drive multiple displays
simultaneously, add i.MX93 LCDIF compatible string as the last
step of adding i.MX93 LCDIF support.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Add Marek's R-b tag.

v4->v5:
* Add Alexander's T-b tag.

v3->v4:
* Add Alexander's R-b tag.

v2->v3:
* Fix a trivial typo in commit message.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index dc85498b81cd..c9d8cbb21407 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -251,6 +251,7 @@ static const struct drm_driver lcdif_driver = {
 
 static const struct of_device_id lcdif_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-lcdif" },
+	{ .compatible = "fsl,imx93-lcdif" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
-- 
2.37.1

