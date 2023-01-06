Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788565FB0F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 06:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982E810E2A4;
	Fri,  6 Jan 2023 05:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2E10E2A4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 05:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0a1F307GCLO/IKFed38y22ju7EBj3DM8Y5SwToaXEU41Kv7C0dPEh9jE28787q+CD6R6NsF16oGwyXvy8uS6q0ymB3g3REGd1RXDtu7dEb3Qw34iLV6RiM/uogwKU4/307LrBvCLxAwviifsQviglxsAZdMwkrbkOYyQ1SXPZM9XcFvBNjoDhmoDL1MQ3oMOMgkCgVe27CR0oNSXcwUdhEvH6dJIRYIyjOzkxFUxnRlJBbiMRK2SlQFKXuooZjtinYbg7jYF2hKBUimzpA3dKDrJxsqppbfIlffFImNl4s1+TXIIKDZ8abooVtVINzpG/rFJXFu2YvCiaoR15aPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2B3fTU8TPvwrMPSmU2T4Gaozm5rgXK8XVIfHgW3bDQ=;
 b=ZJNaud76cP+lpMbWkHb0ISccLSRf2oBiE5eSynVqScSn9gUKryP+NhiXNUx24ecHreYZ6f2Ti+HUD7jJwZxM4ndeL5BATTuAvWSJOr0q7DYRR278Db64oyknWJ2A9SR06ym6mIRscR9XpcwuWGSGUFSIgpTPwTCQyKLInDQ/aajqt8vU8RaqERL7dxApJZZdAsS5b41Bou/fmejCvCSCkHnU7CPJaFS8j7bFnObhsQVC0wCfx28K5AdM9U3stobM+L06llBCFqfS8Gem33a3GiFnOUfIVD4ne7Ohv9405J/m3wciBCntdgacv1sJPeqNkr19yPPcCwUPrnwAqTxpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2B3fTU8TPvwrMPSmU2T4Gaozm5rgXK8XVIfHgW3bDQ=;
 b=QYwU2HGTqQrdE3hNeXX6rzziN/GJm4QTQ4bWniUfc9pwBXyU9k7p7JDQaOCDx1yhSBHtyADw6JdqyYhLY3kdLTyithNUIRS0jQUO0GLCuQE2w56/uPK6MzsoP6Ria4uxCrH7XGl0kAfLUCet3r95lqkIsjqzycH1/32fjh5W2xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 05:50:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5098:b45:626e:a5c1%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 05:50:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Date: Fri,  6 Jan 2023 13:50:56 +0800
Message-Id: <20230106055056.2883302-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230106055056.2883302-1-victor.liu@nxp.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0b9820-0f4b-43a1-2800-08daefa9ef86
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMeWNcv35iOYwKx0gluquPsmVjn3xnn95sUKw66BluLckY4XNTSLSjKY0whoM2ydHv4/A4swxBniMb1v8mFNGynle5z7KgcpntfSwx69S8+PMdc4YalpDgtovF1GCbQkbM6Wi59BqEOCoskKooE4en9lO4gGA3OUnPyCLCcEI0kMY2hGI3dtIcMqNbXi0eUjENnMjrEjChrGRgDuGJYqfptRjZxniIRjSoUGJ5I8/z32ERBDa9pl1FyeKHc3G9gKkIpv6HI0oEK33R7M626TQEc2Q7CKq4IxStxM8YDqO9743Kwkyk5f5oV+paN+bEHrbSJO2xF6dU/PKmqQ3yxERMsDw63/TMU+1H6MlZRvo9nWjDz0Vd6y0Ga7xsxq9E48OGnE9O+qeulStDHvoIg1Ueil1X7aBVxRJThhjv+LgrfyEnL8M5INcQvgoniD6M22injIm9Uts+y11twDeAH0I6USfNi92nPvaOlo5AO2hZs2BJFX5oMCeHxd3HfmjWVY0+XIw8g7SBrCaOeZrPjrIrxsqtWoyaYnu3iEEfejKLpWvp8d3kyh6VCmLOtHf1x9/lUuLGROGIB/8f6UMMiP+Ft5KmlqxSU9P0gSye/b6t32bwiRrNiuz3amoTPVDO3t0eOQ/OvU+h3fRNy7NRxRk9H5LQ/0jtOLx/N20BWKa9b3UiEBXqGy4YBOaFuBSn/xIFygVzTlKLxo4kEc2UXKYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(186003)(2616005)(26005)(86362001)(38350700002)(36756003)(6512007)(38100700002)(1076003)(2906002)(4326008)(5660300002)(66946007)(8936002)(41300700001)(7416002)(8676002)(66476007)(316002)(66556008)(6666004)(478600001)(6486002)(52116002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlGFfQs3G1YQ3L/QNHc/n9fBz8lGNMB+gBxYvN14HUnVflHmbBbqdlHA3Z+f?=
 =?us-ascii?Q?yMK8NVbkPVgaG1Y3v6m2LYh2WnEf0p13itK3EsPx6sFSFc8GcscVdEJQaEIS?=
 =?us-ascii?Q?NZVzKxEX0PdUUPCgu2zBVfVS14jhKsLhPpiqOzClvkVZz90lRFuUltx1X2Qo?=
 =?us-ascii?Q?lgCivqZgBjJkWuQ3//s5AlApxdmhfmAWsnWIAOFxBkwct4QEnYRNfR+vpKNS?=
 =?us-ascii?Q?RjDhlBklYnSO6JTBE/DgTWE5VHKvomfMiOioColFP22oHoWed88ZNcGoNTva?=
 =?us-ascii?Q?Ug79NBKJyS4nVB+8iJlWRk/eY+XodW7GqraTpD5C5aCfjoIq0JbaEUWy6oSA?=
 =?us-ascii?Q?FCa64HVWjuiqQCoZSty4ja8Exn3pXYRoRXrlEGCkXL0M/ifuSWoJ/Bj1kYzn?=
 =?us-ascii?Q?J70nFFAGf1gVVRy8L1wSgKfPfQm6UewrBaIa5PFDNOHVqGUsK0DA3/IeU2dD?=
 =?us-ascii?Q?72znhKR4a8jM8iE1BzXAbBAKdLvm0CDDGgVNImVzfgiQRgjOMpYt1KFlVdnj?=
 =?us-ascii?Q?sylxLqTPMLfVFhY49srXTzcCvcZTi2zhaNH+j8F+cgIyOCKmTcam96CKLnVd?=
 =?us-ascii?Q?saDhyqq1bZVaoxkCaNU8EbrTEGBsbsEBf1tpXrGGug6LLcPm2BizGsklHXEq?=
 =?us-ascii?Q?wHTrsfmkVcH6f/SBnT8Gie9qHOxa+1crKiiMOldj25jn2PuDxLePZxuWVWTb?=
 =?us-ascii?Q?g7lwOGA7Zm8zIRX1hvTZkx+jybD0lbhPXIQa6ELTsGGwMDp5zi48v4ute1G8?=
 =?us-ascii?Q?kjIRLaifgKV8OqYPi4ZQuAGOjXxHq1aJYL4KXnuYjXngm3LBDzS84Q7ZdYVD?=
 =?us-ascii?Q?kuMp/Rj0INYGdr7sthV1EKPtSjI8grQD40cYcNUpDEdyoJhB0svTAGc3I5C7?=
 =?us-ascii?Q?rfnFKdRm/qWVURkVLNYbVO1RbNOXxBuLHj7esklbFa+u2cOswX4+pRW+kxlw?=
 =?us-ascii?Q?bfSP7kyquY3F9CJASxdLiT/ZWwtB1abeqZOK7Smnj/pesJ1AsgcGPWp/Ulaf?=
 =?us-ascii?Q?YA1upBMlOU/XBy32DCr7YwYVKENuF8knbN1AYZ+g7LKYETmuSaCsS7Ft0wGc?=
 =?us-ascii?Q?gzg6UkEi2JfUVZa1YUzjxoNZzZiLfjCc4dMmgpjaZATEISKIXl69EO9YiZWx?=
 =?us-ascii?Q?MiqQTHCk7ZUBdIGTCh/as3jUhkv3NDmKmqoCUmOTNG9lTiI+cq0gtXzpCFYF?=
 =?us-ascii?Q?ywxIuWwtjCj5KLjRIzDxEVtpHC6gk+1T9dcM6rs0UZjSJjbUsxykDIzG3PVD?=
 =?us-ascii?Q?B+QfRSlAJiL40l1+lh1GF4OIOP/WGPwf+2bpSe64XGoC0vUzxxY0/LUhQzE3?=
 =?us-ascii?Q?yUTk16f7hFY6vMPOob/95F6UwcudrItQVCSnAhseLR4fiBd3D5thf5jCRtA/?=
 =?us-ascii?Q?vda9GduNT3x8PnICY5N3c730KhW7Po1RDj5NZq55K+9/kaRNYZW7FMITPIYU?=
 =?us-ascii?Q?VVTfQz78B4EnHZsHkHVoHJIss0epliVI0EuJRqtMvrDhh1sSoamDP4ejwQOV?=
 =?us-ascii?Q?MJIUzgUSN6QDQdhwwBhfpEgl2FBWhlCG591f1Ozbl5JQTzk3pD13rRUoD7ev?=
 =?us-ascii?Q?f2Op0y2aCwMNo4pm2HSRRzK4mvE7bDg3qqwktPG9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0b9820-0f4b-43a1-2800-08daefa9ef86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 05:50:37.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9FAip3ItNOPrbeYuih8MB6iwr+wWUvEJu0PzCNKnwjDi9euvyr4NfvKe90xOY0EPf4rTvh6w1u6g5W4I6FRpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
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
Cc: tzimmermann@suse.de, marcel.ziswiler@toradex.com, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v11->v14:
* No change.

v10->v11:
* Rebase upon v6.0-rc1.

v9->v10:
* Add Laurentiu's A-b tag.

v1->v9:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e832cf29bec..cc0e7432ea2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,15 @@ F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 F:	drivers/gpu/drm/bridge/imx/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.37.1

