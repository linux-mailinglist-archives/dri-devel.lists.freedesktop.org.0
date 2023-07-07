Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2681774AE80
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAA710E55A;
	Fri,  7 Jul 2023 10:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D246010E51C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYz9VGMDLWxBZskdistyB+tllr/YoidQVivr+iRcQJqLpvzrmM3F9VT3HQVt6kn2Dg/VYLIo/EvwmEEXHyfOz4205/YChfuPA7cvd/9il2vLOob8FYJcn/DR2JIGVI9ZFIj4l8MlzIjU1eA7vsJDQWVC/IANTfSOekvJOBPUo4SrXWl6bBEcNTlztCpiP4cRmOZaAFHJK5nIkqDQEHbLQMvvNRuuG34NwlTBTljYCY5h2UNiofGtAR5Ikr+EuzNvxtyg6+XSdJ3dM4+tKuC2LJ5dXAdpnJfTsyF7ched/ZthBW+UqzbgiyLVopex8JSg3KkmUNi2f2Ig7AIlAMDcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGxx+VePSjXYlpTqopkI+y0GcumA4d+Xb8ZaUtaDV5s=;
 b=OIUlknIregq6vvkTMAv2S4wHVtcC8o9kBS2AUXDxOb71MDlt598/7cQWhPwf0yLQDhoVGSTp/aR+njv7QCAsNvo9M1AyEgKH7SSRGauFskh61t3PzUNqn0zV9ureEBj0LqZX5eURzQA0N/QLW90LDagAmZ+q/5qO2VfDp5ocHn6zsVt1OZkcCvv7y85wI5HlxBkhWZGVYlaUhhj0n5E2ZoNhPkCjML0gefYWDmiVR1TmdTncpHkYWWiIBg1n4HtAkgCG/XfIVrKYLuklH+aTa7F9b6Z6nWX7sKVpEmNcMGmybCNJOhynxOdyTCkECJD6RMjqwBc3qUThcpHLrxqtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGxx+VePSjXYlpTqopkI+y0GcumA4d+Xb8ZaUtaDV5s=;
 b=DQsdHnyIIGwp/Dxfi7ROvl8TIUIMcif3C4g/vfE7EXYOsTwaYYAtfUsJItYVQ8spnUsXYUWm2bxfHryvIg0d7f34NYs4+8SwY3vlgJZGhjDO8F705cZ5Zy+44P9zTlpOHoyi/Y/8MeeXkhB9TdDv5BhB++w67GwWBFDUb64luNWJwR7CTzyrOyvfGhQhFXRkxS9Vu1o3dyB0sa4lj+32WkR7nXJphhU8rIEeXjvAA9MnGTUAlSvx3p7uiXglItm3a+seDFO47pz7/od50YnUvGpsHXeh/ylpXo6/zGCPNdRoSM2FnvIYhFjW0xrc48Z+Kx+uSDB9iKETSzVkyodt8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6743.apcprd06.prod.outlook.com (2603:1096:101:17a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:42 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:42 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 18/18] drm/fsl-dcu: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:34 +0800
Message-Id: <20230707072034.48977-18-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 9152a4a4-2205-4fd8-06bd-08db7ebacfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zJkFZ44bgDgJbkrb4Z/ufK9oKq90kjtCgwh1YeV9iVuWKAPqO7ePtbcRzUfq/u1TKgeCe9aR3JF1o85FCorxmxx+ZPLk3EH5e2JfnbFDQGYBgSMBhok3bgfNGi3RZY6iiHnnzB30e5FniIDi1LJOcI2zR2d+nkGxxhJXyvndWKq63N6WtKdJpFtLFnS8J9nPrpVrfjZTI0xUN1rSoJg5nMG4qbBeKF1Z/aRsaD8BA+92NRaduuhCfFnwfsgzUJG3YHD/7xaNz7CzNIf0ijxF2dwtxHYGaZr8Hj51wlLTYUrnWHKVJ+S86Di/xmb0Qx0aPVDIZCVq7oUybw1WaqQOd1Whll+Jc6jzz5xxecownO/Kb+YH8wid7VRe+3u1eeU5jOXaE74F1ST3RdnrRW5REeOBJ8t37ch6c/MDjeyFxKNETNEzOH2EobpQ2psQEePIgOiZBZQrdgE25MamHw/dFCahtxdtcaAG/ZhyrDlcqW3aShaQPnVANO8+MZoOCrndowCHeda9jbVKmmLdRF4YIHFBpghh351RWA5vZZiOGQnj2nRpjOb0VM5UiCLPP57YObdi6V9S0OgWD1rddlG8OEJzAHJ2I1//Aztm387pLQQSWMMVXF0dUMcEYCyYXTd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(6512007)(6666004)(52116002)(6486002)(478600001)(110136005)(1076003)(186003)(26005)(6506007)(2906002)(66476007)(66946007)(4326008)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(38350700002)(36756003)(316002)(86362001)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/B1/Dvl+4ln7/XZI0SfZaYWz+xkfUusvIzFSPEX1JQ+PWimom5hlUiN+ZUvi?=
 =?us-ascii?Q?LeACaFRIdGgAvR8HTLSw6l1bt9ag2qc1mVrMznGwxl/f+/vbWl7Ngfm3lYrK?=
 =?us-ascii?Q?HK3ENQqWBA/nzS6E7BWvRv1pAWlqY6HulR4dtzIy/7jzK2L2OQD3Sozb2Anc?=
 =?us-ascii?Q?Ruc6GdY7ncz0PsX1PUMCQ/NUoMgAZfN+jGIoBbg5kBBhkBdYFGaXH3thmhup?=
 =?us-ascii?Q?TWVweZY8C9TKYCrXXcFDCJjCq4Rw+xCe9iMJ4LLZr1zz2LFPmWCR+J4sOKdi?=
 =?us-ascii?Q?riNWyULf9V+usuT5B4fSSGnqSI+JM7RYXMQmvApxLgLbfa1sw+XaI0dOjxAN?=
 =?us-ascii?Q?fz/2jvg4zuRQw6LuzKJvH4chXtrRHomp7i02ITpYCAIlG/xlIGGN2Dgqm4Hc?=
 =?us-ascii?Q?Oqv3XMHlhwtw+THHHhqIUeYGkFIn7NCmu/T7NEJDbYOezEbNREwlc0NYFAUI?=
 =?us-ascii?Q?3H+0HnG/4pVmx+RGghM1PyE9HNWILHMBcTCTzdix5oMEiCh1Lntzo6zxD4Op?=
 =?us-ascii?Q?xkp11nd+Bbum62Cm8tEQwtDYyN7AqraBXF0k+KtwoAvv3tmfZP6q4rilEpsn?=
 =?us-ascii?Q?wbt9t1U18YL7tLTjVwfluoX/RYY1jyyn+C+8UdY7NuJB6q/JaVoK+y/iJAVN?=
 =?us-ascii?Q?hRv5Qi4sVhZkPhTx006gjKbeeGZJ3VwtSDFe58GSxiKK9IRgiUqKad6Z9N6I?=
 =?us-ascii?Q?0M3us09pw+2zl8qbLiV8Q/e4H/EPQVRyhPmHzYYJY0aWqCoOGGvjkp+aQ+pB?=
 =?us-ascii?Q?bTmtEa61HtvXFKjhfbFkGuMtOxqWef6v7+uCJJqQwSOCnBhNEPVqJuy61sIi?=
 =?us-ascii?Q?d+ssAWDgM5D8HdqE8vPTHbbz/pO2Iv/eWDRP3q87L1d50C1+pfSyX4hGDY9S?=
 =?us-ascii?Q?BFBdsUN5qswaDnqHs/LvfPHZJVi1GG7fnIFygbSt8WHBmBbTAlFOkXT0yPH/?=
 =?us-ascii?Q?IkblwX4Gf8HWaOk2fg0rMulKTXcYW6W9uClRAY1cdmalbg4LMAhaB3Ln0Iqi?=
 =?us-ascii?Q?99oK03ThQYj18SCgAZocHMD6h05BINEMpNB04FVsrfdMU3bfDYzahAU/9h3D?=
 =?us-ascii?Q?TiA56fuegtyPQGhK4kcZZzM2RdRzddJgwqus1NkkDrPmlUmpsdEhUTuQ0bgI?=
 =?us-ascii?Q?fYRA+2AhoJEtbj2YLlW8dWdwaiSD9YK7GDGfW667oSyzLN+Jy7I5+I/a8wQk?=
 =?us-ascii?Q?CgN7gbOmOzwXH8MQm6wcKhc1vuZOTxP1voCVLYrfwwxo+haAhNvqcIexmJiG?=
 =?us-ascii?Q?Ia87SrZwqASrK+fQ+QQO+69CWJRjLyBd8hmnpT2Wesm7f4m5H3i+w8VAAPjV?=
 =?us-ascii?Q?kVw3wVo78I9Sh/O9kCJfCi2O7Qdeo1s+cIlQL6oET/SXKZJ0H+gxpujSomyH?=
 =?us-ascii?Q?++3jbQ+TTVHZ/guZ+5Q1r4lm++WqLwQQAiseNZ7v8iPNlYw4mlzLjatI/N1K?=
 =?us-ascii?Q?yjZyCPfoJNIzv6Ls3de9B3lAMMvhmzhy2/BIr071kEeU5oEJfbA1hycw3CGD?=
 =?us-ascii?Q?Tbt2mJ+JwMycVsd85rrZVH5RCWl7NWKhvoit/GG2n3aA0CX9wRyltB70OLTj?=
 =?us-ascii?Q?DP/LzsTd50iVWDbbS7vxYVeW4A2pW+uW7M8j15Iy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9152a4a4-2205-4fd8-06bd-08db7ebacfcb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:42.0492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYpnUZ8OH2EnMN6JjolYHsULkgY5jXC9nG8Lb44G/5ztF/y+leZCdA3VjZMw+4pIh6qzhLb87lDse/RVu28QBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6743
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index c09ba019ba5e..14661912e60f 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -246,7 +246,6 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	struct fsl_dcu_drm_device *fsl_dev;
 	struct drm_device *drm;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *base;
 	struct clk *pix_clk_in;
 	char pix_clk_name[32];
@@ -264,8 +263,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	fsl_dev->soc = id->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		return ret;
-- 
2.39.0

