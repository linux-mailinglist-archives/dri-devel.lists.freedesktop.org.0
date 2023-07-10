Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C174CA62
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969FE10E0BC;
	Mon, 10 Jul 2023 03:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D510E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR1JtZIo5R6dUkLRH8KKfx1N5KSmY/Nfl72/i+gqgRKlkp7q9J95U2CUzAYM8HsSQ0psFge9kZas60ukJjlz9ZcaGvaF1TrbIYypyrUrbBvZRhRAuwWjcDcaHRzSTSnRgyK8nbohV9U/vvRfBTb1OjBXMb1FRblNRHMPratr3RwOC3iUSxRBecIVApyF2mFZI0qIkB/nwFiidQwXmc3NnYCpjXN97ML/9cGsfTPtEOwaRmGo73CIsW+dIQE2pnkgEUBGPHyuQJLFEe/HcrGBc9SBnKQK0NdiA+I3aKf8wC4hwEzr/dd1JkJk20/eH6bMfT9XqA8ybyuIF8HkYgErJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jehaJjYBcWJh3UI/btKH4h5bBwUKDuoQfyuspv1XyA=;
 b=lMgpGuQwoe+6OuXclMggOk5HQKqAU5RCp9XhOU0Lq/8KvmFb31ZycuKwrKCznbd4BRGuA1KVfgfEqIc2zWphIbycElKJnn4U9c3cvHwdife08C518RylFczbHCRlK0+ZXbZu+YIZIhPkME63JXBhBdkAunL5A423XneLu6ZWYJ9wY8aVKj5AKCwo3u/Uu+OSgOCxpgQVanODR15r5l+P8HSbWHfplKMkfh86j6Fv0m/SdAcJgjxBfd6HvXU1Fuwr+jktzMZNA3r1NHY5fNAZkwQBIUaMhTRS2rbKH4laJ5hovZ5jFnGy4/agDLI0l77mjmTSXDe8fxPVWvjBKvMmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jehaJjYBcWJh3UI/btKH4h5bBwUKDuoQfyuspv1XyA=;
 b=Jq8jIvWfMx/prH1NRUWKxFeYusmNnQ/L8BUlkcxfr9OCRrkoo0dqq2gvGYLcvVmX9UByQFauCNnBNvwcVKzVDMo6ZroL70RVR5xZLLuD0HRRax+jHFjvBQYmm01cWCJL3vATGQdbOuBkv5vDAuY4Y29m3jGcY6rhrj1gyG/fpPtQStu4WGg5deg9rRNAb7SnA8XrdC487ZKk4VpK85/pmfQZxxw7enzlVuU+56ipgYK5glJbisySNhHoYi2fZB7qssoP7+2pLFQHj2AskR+qNIoXtNVpd+MId8c75nZNT/WgPuCqba5k2JGG4QjAEPincMteCcwNWwP6c/sI5GLDKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:14 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/19] drm/rockchip: dsi: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:39 +0800
Message-Id: <20230710032355.72914-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b0c196-5ec2-4bfc-5aa7-08db80f52308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbBUmsKHKP6IGMKfoLaXU9r9fgiVZzjJ7fsoO2o2xYVfScIl/1cXfXwXtcoXBa5tESfQM2oU0qWpPyzbQXEaUkzUrr5eXtMgP8ohoUQjPVTILoIZ336uAjrYY4kvFNXfI1bIr1Q4BfnsC5OSFfMZlOBBL2wI2Fi59aV2RruunXRWqwTih7Gv2Qvy0GaqkPT6+Bjy1fWCjvBseCRhM/lYR0Jg82FIJcpj5a3wnJHQp4LjqRhuBxnb02ikEOlls9Wgbb06m4vFRvQUjJa97GEBt9+4aOFbEsfBTqiN5dXy776I2/xtMoycg2d73ZgBBgbzL4TNzZC9rQ8ssuB7LUj/dSLlCsM4QwTjQj2nNs0TiNTIyz2k3MNYPc+2j2S3bCZ6eq3GyoF8IuB3qJGh1VY/40g5jASQ+2ru53FaJlaWleh2YHK+YWr8FgOnUsVKbBxtRRSalh0Ni/laiFXrhuxRfRxHjmTE7Ol2XDG/wwp8TlcHgWX1hPD0dQfgDYBc9wExZFvATzkNXrQprfFOCzU/hr8Wrb0EQjaYGADjKyxCYc1tiuZGrwfKIhOhQ6qOG/U3lyiZnWZaSHV4O6hfIr8K51iMwKpxDm45sH36NJZsCBEFFzTFXR/b3RYsyer2UGA0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(4744005)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9yuDcHdFhIBaVrFavN9+cDhtDhQC99K6g2AU8kZJiIHSD2i62bPVw5cOrt4l?=
 =?us-ascii?Q?GcPNqhZmcQpqFKkyK3INIV9u1XM6nGPwmCavyyFfpNN2Z0XrCGeydzbkpZvB?=
 =?us-ascii?Q?LFT7Exuy+O+BrWffa+/U3yUiBPR4u0+DDXUsQqi72gqY8QPwztqzDtQ/Fkcz?=
 =?us-ascii?Q?V/YF685IfXI6f0nMMuILnYkFz+A2gfGA0fVSbFXTZYIg6QBmTBDVxFHeAXSB?=
 =?us-ascii?Q?RSs0Rwpkw882pP2PCgot5ciluZN8vTUSZsskRajPzctc4h2qfKAWHswB1UiS?=
 =?us-ascii?Q?dnzLPsQtTs96ibUBR5lqemSb2Llxis6bJt1wj4+da6rkv1QQc//6NXZqUOZ3?=
 =?us-ascii?Q?HmatZdWHAgHeN4FQG/Z3Hx+z5tp7g/AKIWcMK3+XXJprU9daV3hpjC7lSiEr?=
 =?us-ascii?Q?wb/8aHHJ3Bum55O705G0S+XK0RNzmbMphG324gFHK9LOpgO/qbb6/eQimOcO?=
 =?us-ascii?Q?8JWCYRLFbxNfQ3LY1jlLNijmLcPwBnetfZPW9NyWF3Y8CGgBJp8FS/9c1yI5?=
 =?us-ascii?Q?aSEbYe7UGHrSkc4NENE5P/Z3hez981zf72qYk/KgnPP0bUbtDDbK7Z+ojUvd?=
 =?us-ascii?Q?6CYOsQ/IdDUy9mRQ/dOonf95cSEKUFuVFephamcC/WAQ/LMZcm0s8wXdMAIX?=
 =?us-ascii?Q?TTv1f4qX3OVj+etY9Kt/22JG2agPp8ZST3OS188WTIAuOBnNu5x9BHKl5ga4?=
 =?us-ascii?Q?mlkcCmeofbTX62AS4huqSlAlahPUllgFy7WVjPbLpkJ5QHZcJchcKShHA1N0?=
 =?us-ascii?Q?6KSvLAxnw6vDJDquL7Ngj5GNnlXvqjgnRyx+8puf6cJhkssPZDj69rRb8nWc?=
 =?us-ascii?Q?S58bwW8wspYRU8258p1jG6/nv/agA9SmebOLVG0ADkHt1p4j0QMXuZD+W1d8?=
 =?us-ascii?Q?SBm8PqX4ziAbqDl6D1u8q/zffDtHIEeg+PxXrgDMah/M46g93qda4lMxusXi?=
 =?us-ascii?Q?I16uoAYqN5y1InQU8de+pp1SYv+NP3I4lO28pcK/wDQ20xF7bG00yP2WeMeP?=
 =?us-ascii?Q?ANCFtOYiYtv62Y1hnNFNYYodo5N7rBV7OMHYcmBr/tE544pksalYs25ezgPS?=
 =?us-ascii?Q?BEcvX9nKM+Acoj7Hz3ciKOtPx6LUNlA/QqQ7Lzu+1NKnd33XCnfD9C2DY4QZ?=
 =?us-ascii?Q?LDfFP+ZrCawOj45HQ3qNb1daRAHw0StjklVGoW+no2ZPqCAuPZ3ylCzIVqOZ?=
 =?us-ascii?Q?0rrd3wAjteLasZNeWyR0d3UVKK4iEIB3c/lH1xk1FemUCiMbSdiq073JmK88?=
 =?us-ascii?Q?CdVSxbxW+Tup4pQmQoetzgLcuv/FGMwetRxQAYLR4i79kR33nxXG2W3PcMa7?=
 =?us-ascii?Q?irIcAxGeVGWob01ZStWZoneasFvhZbrsYWEJBjCTJJZBvB/LX0IHionmTnNi?=
 =?us-ascii?Q?FgH3zPQ5ouYULttRrNwwyJbabGnI3oHBsPeFxnG+scWOogVUpCV62mhB88GP?=
 =?us-ascii?Q?dEyXtnw25+nQtZuSLDpYyyN66rCPpRv75qDDWSWMNIKOnASpGGZLAB9+8bnc?=
 =?us-ascii?Q?LyiYqnp/qWPV8I0SXq8TOPuVl+vmFr9pPbwYAb+63XfqRknzJi7MCap78uNk?=
 =?us-ascii?Q?PAvsmzM2OI1p/aqHOgbEBnqKtxZxEWKIgOpceOEQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b0c196-5ec2-4bfc-5aa7-08db80f52308
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:14.8177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYaAknh+kiV9no3n2bklNcwP1NMjD7CD02zXqcT3qiFRmkLHZ4Zh2q0GZuAnJkZhJc9N4gkgDO7QrkJScKOrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 917e79951aac..ab57df7c6eab 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1351,8 +1351,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->base = devm_ioremap_resource(dev, res);
+	dsi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dsi->base)) {
 		DRM_DEV_ERROR(dev, "Unable to get dsi registers\n");
 		return PTR_ERR(dsi->base);
-- 
2.39.0

