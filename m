Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B2676B85
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 09:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACFB10E0D1;
	Sun, 22 Jan 2023 08:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFED10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 08:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Y68Nqh6L1nQWkFcvL9el774Wm/EZV3Q2MeMXspvrqNMW7ODNjnF/SH56Tu93PdZYtATbCwypUUR7K6fv2D+8fgvsu2FKgGf3/p23CL9wphZmBlqYLqSVgswLi2F8oYFC7Dj0uLXoByS9W7Tel6ZUtwpkX4vlXGSpStFgSpboBczcBExmqy7QzGRRVxB1FXd5MT2LsvLXegEjfnQGLWm6j7nzxG7I+rLwx37zXnJg3aFWNsnEvQgsCjm0quXtibWr2EVKt/tWO7uOc2Cxdi55uCnh34trObP4utuvr0nizbjTKfsKtYghKnFLHfUX0pUAwiVitBIqRw682qoQhXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfUziBUeXQpaUQvzKjX3mw+W9PTMrA16Fll+c9aQhfw=;
 b=QShLN4tw20G7TXnXCL7uKNZNctnlccJvl/uiA+BbqIBrGoJUJpFz7nda550jXjZorEQNcYlxSssqifEGh6YlpLK4cYMHpxVNzqOShlkdgCZrEnLWe2GUwD5zlSHHQGjglHdC+POYNEQIf5mys9S76OxzsVpTcV1O5d4AiIy4fU2qDV57STkMYO9bRlhdNhmCQKOvVbcLtNhzGbxcnZ0nI3pf3P1ZOaYbBUawK3MsceHqEJM1ujbAlunQOismKiBG+zD7ZQHk7gy6sTG7A/U4HpvJKTy600R/PWv6q2tzGd75yWErybyaIr9nF8EpUkairxG3HdwO129CAgFp4VzluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfUziBUeXQpaUQvzKjX3mw+W9PTMrA16Fll+c9aQhfw=;
 b=jGBWlFjp4L186CLHlvIFmc4oT2rXz69v4fHpG5x9uoK/TYm02TN5bVzdYwNM7pLFDazdWj2DTIQ1Wl7LuUEyIL7dp3tmQjGbZKZ1f97zz06U3fZYB14R3yyIishILjdd2M0rHYeoH5OWH+LSTwfnSR5CYCVNJTY7ywX3OUv6eTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Sun, 22 Jan
 2023 08:13:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 08:13:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Date: Sun, 22 Jan 2023 16:14:27 +0800
Message-Id: <20230122081429.694574-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc20bdb-f4f6-46cb-d30f-08dafc5083b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aokk7HghSln0G+MBIXoaOd/aSJWaixbIX5mj9Q+dyU+L53oNYkX1ktE29g1gzAt2v7x7C/7VxXHNcOAsYT0DRPF7zGZw1BFEdzhxgQ+Dnm20/1PtMFPPhbSqqi+JyTxkOC/GjfHzH7Azd53yUniQNzB/i5tuLi6Cp4GmZO/4poegrqt3bNdymi9Y3x7+cPfFP+hTrmMB3lzUBQfIA8jDzZWPzmBD86zPqnBTmkMHBMIlDxmHm5balo7Y9q7LUuxVbVka6b4mlgOHnosRYSbcXa5XXIhriogivswFhpELkMZWknKfLcxir+aa48TVk66RTmDHNg9UMv/ZM3ydcOvE+QnT1O4f/pvqBtAdO9IVBJYqFA3tQuEXpif9ABDBSOX9V3UnCgW4mseaZrgQCwcn5aOC0fFjoerwrZmYSyYaNqV//530dCa4nJgKgN7E81v7EYql9ecu9q57f5lStpBZeqL7o2kErm9ijxB0kbzH4NHsp6ifWVLkon7DsX4Vd+TRDjHZXGkpRuBgplwKg1CIEbjVWK7WYf6jW+scc32u/3FshPfclnpwbzc84oMWw2cx0kKBLFKVfKSSkzc3NGxY7xMGQolkWtobMUYiGSF+hZhkrwZG5sAT9fs4Q6Ue2Jq+4dd0IkUEulkCwTv8MhpWPGgjupEPKsc+A4y1LuJwoD1k6d8mhELVMEq5TYGpGs2ElQ7fpTWub4Q6uZ3uNrqpfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(186003)(2906002)(6486002)(6506007)(6512007)(2616005)(316002)(26005)(478600001)(36756003)(52116002)(38100700002)(6666004)(38350700002)(86362001)(1076003)(83380400001)(41300700001)(4326008)(7416002)(5660300002)(4744005)(8936002)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9UzAhphKDUsTqLm4SkFCvSncvrxpb04xez0g0UYpLusBV4JnV9+4fdMkoFmG?=
 =?us-ascii?Q?LZiM7oq9TEkVr294iSOBoWvCokE7B5WqxRrVCAP2GRukZcy+r+6QubRVQZ7J?=
 =?us-ascii?Q?9jlQOVnwvi0sV/bsfeyl3UgJ9+a09cD2lK4NOQd8x55zEWay/vb0ZF8yk/ij?=
 =?us-ascii?Q?u+cOCT2bd8OgRuLJ8NOi+anUASQPK56rAIAUd9Bi2ZXP7fsPLkQGZNqrQQm/?=
 =?us-ascii?Q?bKoRITXoAeBTlKz68scPS5eIIPf8BMrRTZoPZb4CVEzN6Uah5GCUIPw1TDiA?=
 =?us-ascii?Q?QhcBJIrCMc6uZrwXj603hVdk5AV7rgy+ScAHjqLP5zGgj/DkEfbm92Kbz6sp?=
 =?us-ascii?Q?hbkDQoiUIYSrWJQQ7nZGN3gSiNbx1vvwl7f8MoZj4SszN8Fb3Sp0B0OZnmOl?=
 =?us-ascii?Q?dxKZjhCr1EggV76m8DPynXSR3In+Y9Wd8+LuhGDMk0NDLbO5FInibZZu49D+?=
 =?us-ascii?Q?1Ao4ozhT9G28xp7/49zmENW9a5yCtxrjDFqEyLldVgedClOSpPH8KcUtaR9L?=
 =?us-ascii?Q?6dyZXFhnjqZ93Lhya98tuKJ43dZWEemtis1QX/+/HoHyHQrPySG9cTg1Pq2z?=
 =?us-ascii?Q?ce8nckdrPt0+N69Xmj2Nn+bLuS7C7CFJugdAFO5RHktWfLz3tb41btNfK7EL?=
 =?us-ascii?Q?aRPD+weOV6UoPnw4i88/f7Z+C/6OrlRBalzZ56yj/wuzDlwdC8NkUE0aPD7C?=
 =?us-ascii?Q?TnHKr4PagP2ZFo429hjz3XhfqiUI+r4Iw/uYiOu4Z4pdRUSiD2DI0/1b9t6i?=
 =?us-ascii?Q?bXUSOoTh5PbvOhAkjkBuG5pt3+fPVsbNVLVpgxOhfelrObQBYGxnvpv/qWgj?=
 =?us-ascii?Q?lguVhKw6w3DASPx+VBkPZclQzcEGqAhUyS/ErQZ6St7qUT7XqcYVnxRcOEo0?=
 =?us-ascii?Q?7cFY0by4itWn9vwHn1SI1vxQaMYdRb54kNqqVbNNAkxQxHLmUeomnqmOOxxl?=
 =?us-ascii?Q?Gh1dpZzIJblKRaHlGER7Tpg2DNrvuC+vuetIXr8UzBrga6cVmhRaFzUZ8p8Z?=
 =?us-ascii?Q?cGA/wH3Oyta6+LvAWIT++xkUth7eR0H5ZIzGvisZPrK2X1AoigJ2JBVHGL3Z?=
 =?us-ascii?Q?7zJCc3v9Q6bNqLu878hY8noSAoRzgC0p4XgKaf5C/JXw6v5I8I1YPG+WVebH?=
 =?us-ascii?Q?RtylC/pN2pVDtN86BYsjTc4ecatbD8LKHN2K3602x6JZ8gBRRAfl1E8aTmua?=
 =?us-ascii?Q?YF4oo9hVXaOZ65uPa2fJDpsBu8pTf57bcombX1FS+rB+TpiY+vRWcLqp6UpH?=
 =?us-ascii?Q?yLA38dctor/7o5JHP48KhshL0AcRwnBIyXXp0xNWs3QizjrIwjxHDIltc4aB?=
 =?us-ascii?Q?/qLPEyxj0JCPCiwJseQy2SZIfaV/ij4VrgzPnOvsHWUUeAgl8mn8Qrmt+9Wy?=
 =?us-ascii?Q?EyR6tKd4xcOjt1kEdd7Uvbb3dMqUQ3rs+RKpkvXu3nxNmJ1PewhT8dNn0OOz?=
 =?us-ascii?Q?3XbaJWBCaJ1bFkr78LrU/mVv4ksnV6QvLiulN7Q3gJqi3gRh1/TodeE8bfbJ?=
 =?us-ascii?Q?12ejbeZCPAYKoMZ9nney1s5aoQaYLmnyBUbIF1YTyyb3yURLinL46HRL+Z4V?=
 =?us-ascii?Q?ULzxjjC00Fo8dGBKNsS+FgWqCsjsjSDfjLJ21qx4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc20bdb-f4f6-46cb-d30f-08dafc5083b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 08:13:16.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fj9PbLmsf3fg7IRTGD+1UxwUlV7Hmqii+cgB2Gj6Blam9tM/Qx83zrrCCxHh4mfsHvhmsUTPGkkeudepYpGf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491
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
Cc: marex@denx.de, neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 robh+dt@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LVDS Display Bridge(LDB) support in
the existing i.MX8mp LDB DRM bridge driver.  Same to i.MX8mp LDB, i.MX93
LDB is controlled by mediamix blk-ctrl through two registers.  i.MX93
LDB supports only one LVDS channel(channel 0) while i.MX8mp supports at
most two.

Patch 1/2 adds device tree binding for i.MX93 LDB in the existing
fsl,ldb.yaml.

Patch 2/2 adds i.MX93 LDB support in the existing i.MX8mp LDB DRM bridge
driver.

Liu Ying (2):
  dt-bindings: display: bridge: ldb: Add i.MX93 LDB device tree binding
  drm/bridge: fsl-ldb: Add i.MX93 LDB support

 .../bindings/display/bridge/fsl,ldb.yaml      | 16 +++++-
 drivers/gpu/drm/bridge/fsl-ldb.c              | 53 +++++++++++++++----
 2 files changed, 59 insertions(+), 10 deletions(-)

-- 
2.37.1

