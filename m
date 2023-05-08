Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B846FA250
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7A610E177;
	Mon,  8 May 2023 08:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EBA10E174
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjqzjM38LuzhEtkeBVt2GCeexivhIdGPZVrmP1k5ayhlWteD9GXzSgXxAHTHGsJZs/Ym2OyuBaN3FBqMRBd01q7smI4GEf5YOABkhuIa7Z2IbroxccRtbZ9W7l6UMu0EDoCdwEpu3gzoP0ApFGVdLlE8uY5+17JcvO5D254M2uJ12dU4qMBEBXNu1tYHbE6cI7RLwv1U2hldiKRTc1aaNR3pyW4ntPPV8042fi0ko+MdNEosm/m92/35OgtanO6FoKhFIdiSeHNVBWIAnRxq+riIJN0AObbpJp7yMp0tsx89yJ2xxvM/GNNyYTz0WxmfFL+mKDRWaI48OxehUOYOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnmhfxxLO0BbzQgQ4pjNZxxBwcW2UV2hgKfY5USodp0=;
 b=C2o3j2cqnghb2dqwqqYNuM6yYcDd17kMTxwDQevYB1ejOyqXXjxEplfpD0CH1ds8NN+2hRLa5yoEwkuTcmuQA9GYWAkhESOjKdEuHcaWp4Io2IDxAhOWQi7YELVwPdqEogxZQZ7fmWBncljrQYOCCh8Jo00GmywAncr2Q5uOXfxKEnEX0kH3fn/AfiROAf3ptCryQOP6cZod7xu+01vPBbJ5tu4lilVqm5PSAjD1BDIxjS/GLoOe6j2HKBZRQpc+n19zk7itKvFcVJ44iF0ebFvrkjG151Oj41k1Eve8ulNONl/+hLxZTE0bmLljLYiGBo9n7OSF1cNlhgcAG6aadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnmhfxxLO0BbzQgQ4pjNZxxBwcW2UV2hgKfY5USodp0=;
 b=XjrcZ9Szs5ngXi3116mHYjZAnaMcpmc0FNJmVhRMMipXRoZ1t1Fa40Oktcv9HtWskANCvzZwsIgQgBV28/byITAXjsSDRToASLY/pFwm1Y7e0W9IxIzgTIOY6nl3GS57lfL53QT8Ba9SvMJ4gEEmy3ANEpUigxRr1jJE41l2xU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 08:33:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 08:33:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/panel: panel-simple: Add BOE EV121WXM-N10-1850
 panel support
Date: Mon,  8 May 2023 16:38:24 +0800
Message-Id: <20230508083826.1016206-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2218d2-4b25-4939-8ff0-08db4f9ef084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12jK8bf8qLpZ5yAc8eKOWQFwgsJie38aS75kz8atH0Xc93Ajk8RYPAqWo3h6hdzdyiAifBm+r+rUjkyhxCZgVGGGfjfpA8Wo7y7qnqQj6NFz+VdmcCPTAqbbFw2YPPp0k0j33CW+G3m54o8/KAN9BMojkg7hBiV2DLG4CiHqUT6jymmBrNCLlUWcDx5Z6Hp+XOijQHu9jh4GF9dTOnnDLm7yUQ3KuN0/7cvbW+qYkgI20c3DE3OV99rOhiJTuQITmdKAww5asiBVPySxivh7ASw44klM8qTVjCIesnm5fUXsNf4f5bkDlDvZI/ZXa7AtAVyEyvfFIDISOnHjp5oWAH1eWIiGdwrZpXwEz4xCG3fYK9IWo2RUhT+D9EZEjaxWDEhld8Cjdza4maZT13xbn7nvHUvQ7zBB7Nl7SKvtAICClU2sMoEhTlAtJYod3Ymq/ghRpQk3fsX+s/haz8K8MYT2QcGKEt9dwUX1BzPBnr1wzHUhdV+xqICHU4aTc6bGEf1BEYI42oD6ULibT82KK+zgkuWqSOicIvTFmVwDb7H8hN0N+6Ik7gXatuOw+cjM3/kwzvWFxhgEL0z2P/0/p+G1N6xoZXHnfVo8aPi77e0V0Xjq7hL2Mvxkxe1woL2D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(52116002)(66946007)(66556008)(66476007)(4326008)(478600001)(6486002)(316002)(6666004)(86362001)(36756003)(83380400001)(2616005)(6512007)(6506007)(1076003)(26005)(8676002)(8936002)(5660300002)(41300700001)(7416002)(4744005)(2906002)(186003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?up50DesUkhfZyAB4ySpdSeISHibLLXBYrBKIJjkFvalGDYAupEgQigjS10IA?=
 =?us-ascii?Q?hYmUGw41MsgNXxPjAQhNXlwzv0uyJdwbFtlb5HIQeCnu5ErRnSqdraMWvrft?=
 =?us-ascii?Q?yp/v1iXD58VdXEhH22sNj9fGMFfg7c2Tk8ukJ56DyYGvJlEtP5Pp6gFXywGQ?=
 =?us-ascii?Q?r8/b0jAeKj6WPMab/SXzNSOakgA5ay4EJbzrlR0DyPtWAJ6WMK8tpYsS6OO7?=
 =?us-ascii?Q?NPykqcTxT7QI94m8ejU8jzueuFPe5+ZRFetlColayKeFLa5K6X3KNmIfWP2e?=
 =?us-ascii?Q?lVqn/Zdze/uF8D0BGqO8K/lvnQL8AcMKkTAYW1NScd0bWWH/1E7wmj2gyC07?=
 =?us-ascii?Q?ELul4kROYxdQ3RXJMXJ6EUgtTgCBLOZWkX0JlwDr2dmeAkcOeaNZ1gsmNCpM?=
 =?us-ascii?Q?Ti7b31/bbKqH3WwJWpCYGRaLVqK2suR27jv52zK6BZS/dKqqEN5ZMSqO3aak?=
 =?us-ascii?Q?6odiyLSXBvLtUD2gPVb7Z6fb0ZuPCHuWsWofyXwJ1okbLX2pUw+5Pzit39Wn?=
 =?us-ascii?Q?ftm9BeaHKQaaeBnpc4odXX9w8WSnaOC0dLpiPTIb1OyezwTa+Qh/ue1qd9BA?=
 =?us-ascii?Q?TfVMtGrochApNGSwCmYujKsx5GJEWlPa1NTlkCdxVasg/O4thKuX/HIEexcd?=
 =?us-ascii?Q?I0YyX19iUPjmnaLWtxR7u894M3ZZfVDy3n63xW8bblq45D1BQ+LBYI5moAND?=
 =?us-ascii?Q?WABaojv5pKDdBRrOBP1W6NUgyhbV8b88I/R5KoEMVrs19+pPOsFZOcJbJRYY?=
 =?us-ascii?Q?eM06KpqNMllEjYDEa76g6BclSoqLU6VOxjrisYdJQD2Ha0SmeRhkITDq+fW0?=
 =?us-ascii?Q?kumlpRrU8zo8uT1HqD2gPHAlIjwHdDO6RcbrUSsxith5u07dkZ7BSGUkvvRt?=
 =?us-ascii?Q?Yv3BmpKM1xWwLFy0IlynEPmZADPM/U3Lax3LDQp3ekCMqlosDxp6rdbT3inJ?=
 =?us-ascii?Q?soPS+SNhkRH2VVF9bCdbgFsSr95s60OSh1Z+OQW1vB0wG1e+UYzImZ9EA0Dt?=
 =?us-ascii?Q?Xd0nGz2E5exMqk1ozylVogozOsSmpFQdni5LeBc69HNV+MTJyohO7EjkLRbT?=
 =?us-ascii?Q?rWfVcziTPOmEAgBEwcwtv7zzQgzYdPptXae/BbVOjdPQQBNl3OQzhuvF0SdE?=
 =?us-ascii?Q?1AvStNswQmtlAtvwjf9mGJxVItoKF3DR/+JIwYMxAZwpAG8Dwy8hhUnDRxVF?=
 =?us-ascii?Q?aa3vxMiGP6G7FiTfV9D5wO8XPTrMQ08AcT6rLqHI2UbwRm9eLgO6FoMBSr5M?=
 =?us-ascii?Q?m1JFBBQ86j5KxVPUyvGkv7UkYcuQsXI6Naya9aOD+HHG6lpZi14FbSNNAy3W?=
 =?us-ascii?Q?UlwBINHJBUgbi0gcxx9k+RuEwkJDALDeqD6aihUYF7ptQ1LZqz7VP5rzxJu1?=
 =?us-ascii?Q?lIbt0C++hgUgve4v49GLexCnhI5aP3/drCgWMu4kThJw4uTjk44CJFKnzB78?=
 =?us-ascii?Q?jxYCILN6W7fEvLWuW6q2EArs5ZpdXRVn6WIl+qsOAmuThHBXoIlbn2N9Fj9Q?=
 =?us-ascii?Q?3i40R9WKtDOvu06q1AySQxUd3h/TJ98N6UFqxJVOJWyFjgtjX3SOAagGbvx4?=
 =?us-ascii?Q?gLaBbmS0nPzw7LcOCG/DYI6AQX2Z7trpCWO8szhq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2218d2-4b25-4939-8ff0-08db4f9ef084
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 08:33:46.4997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjgmUVfoecRJGyGYyQz9Pe6+DxZV2of+nZbflRkgE4XpPc0SQqSVBsW6WqOu3K0ES9dK5ny4oZ6Jna8PlA27Tw==
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

Hi,

This patch series aims to add BOE EV121WXM-N10-1850 panel support
in the DRM simple panel driver.

Patch 1/2 adds dt-bindings support for the panel.
Patch 2/2 adds the panel support in the DRM simple panel driver.

v1->v2:
* Add Krzysztof's A-b tag on patch 1/2.
* Use struct display_timing in patch 2/2 to tell minimum and maximum
  pixel clock rates.
* Set bus_flags to DRM_BUS_FLAG_DE_HIGH in struct panel_desc in patch 2/2.

Liu Ying (2):
  dt-bindings: display: simple: Add BOE EV121WXM-N10-1850 panel
  drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 34 +++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
2.37.1

