Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CF952290
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D1410E527;
	Wed, 14 Aug 2024 19:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OrYs/jRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E5F10E527
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 19:17:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyoRuaa+/K1xHxT0aruqQRb2jdMHAEyTeTTsczavCyLEPoZFI12Tj9uwxzb649vYRG7TzLzgNNLEULdlCAt82owbdcSBeYGQmgysxvX+DMet6GP4ZMergRLpf0EqTvj0v6iwpq1/WT1dDDoGwK4LhJVeer6ti7ksVHDzhvIxQ+OHWyfuHr5NKq4VmNj6lR5SubuoXO4fuPQSNaGWDjnayjF2YsPOqRyC1JhOWdfK/6x+XIGcLbqm0PDDsRnqiyelYkxSt9GBi9ofNbhJaXkF07e3SNxcPJ3gH2N7jU5QhB2UnL4Wzu4oWjXPxpSYKqQWjTD2jCFW8VKXLfJn9H7/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yGVqJksGzouU1v1GWfF4KYj4LPbqcipUJoxu8iNakA=;
 b=tuvVWiqK6YFlI1iLchWdim0t5smuiIJnWWCYHZnUNTbvnTr2p2NOQcgM26Tvlkh2w7P3fsXT+AlAjTWG8c2pLkZKE+4or+z3fVvHGOW5vS/2KgUhlgVVje2d1OP0h1IKEOq21+IpFx7ZKX2As3r76/p9Cta5Yv6OsHt5UpsOg4bcGwZIqhmZ6vcWZRlHhSg9dE06e3f028CKl0aY1dzupBnOtSqmARZvhPwRgZfDBvj+rowM4SMpaLyYAKt+bQam1Vdzp/RTqne8Ff4yOmmNvyR+djEBw9PaqNkdOvDYLWjJYguZjPQ1XWtRpmHuJRNPCHMlHn2ogQSmrdHL/NPtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yGVqJksGzouU1v1GWfF4KYj4LPbqcipUJoxu8iNakA=;
 b=OrYs/jRigzttOEgJ41v7mxhWCnunf53FOFP4YaJCFX7kpLYsPUzfBWB0UtgfzuXDAqr+IDgfsTcQ3/XyPP1Cuok38XUiTF4BZzHgXmwn02P8jE/P/ES5sZlN6MHKkIDIkxmIBrMfqNMCTMDY3HNDrSS3a5HKWeiLVQUQqbsggDQ1rLhd0faO6ugWrjAKJbfnwkV1Tcu2WKumw0I2GESURK9BTUjOU2Fy5qOEx6XwvGJezzZSCVufcn+6QV6p3JHctXj4U315B0E3rjWMvNcCe+ZFe0sjI7BSzVNhVALBNawJUpmULyTrn/hmX0m5xZaVbBKOk+3wPimey3H3Sfq2cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10684.eurprd04.prod.outlook.com (2603:10a6:150:218::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 19:17:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 19:17:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: display: panel-simple-lvds-dual-ports:
 add panel-timing: true
Date: Wed, 14 Aug 2024 15:16:56 -0400
Message-Id: <20240814191656.4035551-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3df06c-6287-486d-df64-08dcbc95b472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZHBOwBgFrRVbGfb9FF/jhHR36goZb2zFdwCmwp+ziD9K7PV/7296mZN13Tv5?=
 =?us-ascii?Q?EFjmgqWuVfwpoRmjGGFmPnTnfJCohWMqpv5OxH0oDzEX22GBQb4LG6uBCPMo?=
 =?us-ascii?Q?iQ6W2ynbTcKi/QnjkG2ocikN4skarTf6qghnf3bY2qeOqhq55VJ0cNB5mAOl?=
 =?us-ascii?Q?tiHq6S6AYWZaLJ3a6P9A7aon6l/eWBSt43u8AXp5egJT1GFyBs4NO1lAUl73?=
 =?us-ascii?Q?DFZPEQyuAVZ0rHEtPIeYGzGNRwjBiQnXD94qU14kF/Gd7jtt1zPP032l0RF0?=
 =?us-ascii?Q?X7Urwq1xgAITbpjO4lRlu4vGVQiOCD0GedJFJK0E5RVTPj7HccNWVsiyCZ57?=
 =?us-ascii?Q?HZGcfgH868/vnnG1idfpE/ZkEEcbKHMtKFX/GO5nDgV0sF0xL759qACNQhJ6?=
 =?us-ascii?Q?ZI0V6kg6tSnR+zdjlWdcEXNjKr6kjICKJ7rPk+PvUcVDccKKYUmDWgoxOsDK?=
 =?us-ascii?Q?e86XCqQ+Ql/VTrXKLdb5IFcesnQFDdT3WXAtJn5pbfffO93CoFKof8Xc/N4e?=
 =?us-ascii?Q?YAadWqO1Hd4b+stjHK//aVRPbv5/GR9R8tU4qSDM+ii/zZEaY523lHXRnxv1?=
 =?us-ascii?Q?uasriZ59EOvMrHW65pDlCtk1/sdTfVfZ4TNCsUnquPxkadFWcGsUXOgTUIPk?=
 =?us-ascii?Q?MNO00KhUyI0bxewL4eUB+00R9KAZ/sxy9lm3wfNEZnqtnav0LlqDAkqddjbq?=
 =?us-ascii?Q?R0ZU7u5Pu909dhY0ECBxNfXG/0LgGp3SkcecNDsg3QIDAAMv2XJwOtgpdEBp?=
 =?us-ascii?Q?o0p9N+IdMtF4am/PNHbtsNyQzvR1GZ3EFCM/gWLEZv9oS1AqI/Vgld8YhOl4?=
 =?us-ascii?Q?hJgiyb9ZBAnYWo7FRIqK81O1y/+bfPXXpbgPMwvdM/L2zNgHsIb4jWhsOMv8?=
 =?us-ascii?Q?nuYaoawih3zixoh4Bb+3Gf/KPh2QafvcJx/HDcI/03/X+KkuUHlpKfwc/AfU?=
 =?us-ascii?Q?CKSLLK2qiZ7nT/DlVP14kH1SiRUnUQgHzGm9KSEPrB24XouTpie40JSFuJTB?=
 =?us-ascii?Q?CnZVBJgMEOwNVCwnesCc1p6SNVXFkR/M8VzxFlqXvIjsYtKu/q5M/q61o0B+?=
 =?us-ascii?Q?5memQon8BuCdWRatwt1CeYv49Nik7D6GwmBNnc9plJOla8UnCbFAOJn+xunD?=
 =?us-ascii?Q?3vI3Hcbxx1/q/URtR42Rixrv2hY2RWTpnjFasOzxw1K5WWfXa7gMfXCaaIoT?=
 =?us-ascii?Q?+0nq1f0KVOM/2l3cRhsUmfm7hfkAxhiFCJwklnrxkz2U/onZr0pgpsvbC0uY?=
 =?us-ascii?Q?ALELVq0B505G6PLnd7FMe87JNecuwlVjIPYYdp4v1zKD420sasd5OdxcHLT+?=
 =?us-ascii?Q?pzwBNaPNj1M77rO/Pgtev3GUjGtUgOLudxBWubebais/IQYBB/xBn0EfWTRb?=
 =?us-ascii?Q?2pejT/DkMEheCdGhe2sZArP99n4H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ByehlaxYOWKOGNMo/wLv8HcuI9/ZL+1IGo40WhiMphTSyjlEu8o/Cfvo4cF?=
 =?us-ascii?Q?ySYohm1Nmve9VsdkUjzGl9QI9G+gAevCU8iWStzN8xj3uoBzNX3/wamtUbBj?=
 =?us-ascii?Q?iu7FE5V3e0nttGx4TJoTW9o4/F68WTVQifjtynJhc8/ZIf2zs9EAm72ze67c?=
 =?us-ascii?Q?I9UmuHnyfnlGansV4BE0rwDnewe9W+4HglPTNte4A6N44Y58tC3evV4D4qt1?=
 =?us-ascii?Q?A+p0dMk+OsX2M7uPvDwsNG4V6C81E7xEHTCQ3LZDBDaWEam7fmT9lev65ZQu?=
 =?us-ascii?Q?7UiPiT05st0mQK4XI7MSt/S2/TVywHwM+rx5KQQqBK0z473y34vJ5YGRK7Ba?=
 =?us-ascii?Q?gvnm4gq6BwdaaSNx4Oczr6lPhloH3K37zGhLWw32OrYhZICxEuIw9zBTcKhh?=
 =?us-ascii?Q?pVPpVOxp7hHoHr85ZQXLCv5IgfgnSiCynFLaduSn4gEYG/dN9ASA27TVX39w?=
 =?us-ascii?Q?2vMy84gcpIhVT52U74cqj1NWtBef+zJ/wpimtBFJ9ZcFFKIH8N/VH4ggDzjW?=
 =?us-ascii?Q?8yQtEI9R1pBLTutolQ1NZpt/kk2S3IWa0oH/UJFdOisPxK8FmDRFWcawO5Ds?=
 =?us-ascii?Q?e/xKgAPa7D+m6yRKXrHd2hvlKLAFRNlgZOVA72CwrZuohaMB0zu3LjeXb1/v?=
 =?us-ascii?Q?2Y09Z0YzaMggvkyJyi8ZH1HFXIN4Vi0KL/3X3szF+jP8lkjf5BPvJeFyKhiD?=
 =?us-ascii?Q?R7o3bOSlN+efYA1DuJVoOoxAE+u/GJ4oDzbHqOS7SqmQ34XtrjAxtnk8vo40?=
 =?us-ascii?Q?b4lo2P/+K1JGDcxGDpTsLTKmbrAIAfnuoi6S4gfhdXBedA70BVsQHtNd5bR8?=
 =?us-ascii?Q?FmIlH/5WXZORVfj50e50E1xtw6gHIzMyipOAASJ/V45ueEyX9E8Gj03HEXce?=
 =?us-ascii?Q?InBRrZlEr5TawloLvf2YlttvF3I+JEQ1qvkRlAw+LqP1MaZUp6zTnhqpxCd9?=
 =?us-ascii?Q?YdWLRzdXfZxRizgG0E3GCYKGUu68+5xG3hJPosdItWpjSexfUsC/8MqWmdRh?=
 =?us-ascii?Q?wDzE2rffep/oJQJiHTFwLR19/Oo7CcBQ5RWDRgmTWRfbdzO7j1v0Fy7RYwXU?=
 =?us-ascii?Q?baRj8DELjXzN9iHvP45jbdbAUR1wiwRmj5JUw+5GnTe2z1q3rj1JOyMCj+us?=
 =?us-ascii?Q?4eUSLZV34x6Cywh5mzrDX81WUUo0LqH+xoO/1S1U1kafpS2KNGODNsQ0V2SM?=
 =?us-ascii?Q?mXpGnCip2LjSIhuvBSZhUDLFHRJfPvLl+uEJi/E8MvPVu6gY7/ie+jNrgXCt?=
 =?us-ascii?Q?H+pTIHqYWkSWgf4djUDikHS0P2/fszbedP0xZDDR0P4CC9yW0GDJ4LE4wzsm?=
 =?us-ascii?Q?hhCeIaubBBaezo5RsB/02gPaXLF7V4Flr7NYypnStUH/j8Udh7yKDYCTE2S7?=
 =?us-ascii?Q?DMqF+r03mzNoqhbYyeG5hE6K7oQ32GBzSlcgIE+kNQ2Fz3K42bIIzBwcQaJu?=
 =?us-ascii?Q?xrKW9JgewYotmIgntKjuftWcmBydBgClH+MHudkirQbcGiFjV+ATAzchy37l?=
 =?us-ascii?Q?UAgtjTMmKILcs7k0dnfdjScf0uE1DimOnI3FPlH3DTqFqVRZP6kF3qKQDqqa?=
 =?us-ascii?Q?vjTN5dC7P7+bVQW2JNw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3df06c-6287-486d-df64-08dcbc95b472
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:17:14.6405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaQ9MHqzaW5F8FW6hpyfOmKqZlU5GJX3Ln49H1PT/F7OgVHBxsEqtaZAJVO2oTb/793oKkvkZVfwxC9YTbbCxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10684
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add property panel-timing: true to allow use 'panel-timing', which defined
in panel-common.yaml.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#

Suggested-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- move it after enable-gpios: true' to sort the referenced properties
alphabetically

Change from v1 to v2
- add panel-timing instead of change to unevaluatedProperties
---
 .../bindings/display/panel/panel-simple-lvds-dual-ports.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index e78160d1aa24c..bf6a2e5bb9d2e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -86,6 +86,7 @@ properties:
 
   backlight: true
   enable-gpios: true
+  panel-timing: true
   power-supply: true
 
 additionalProperties: false
-- 
2.34.1

