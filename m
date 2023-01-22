Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9BC676CBE
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 13:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CDC10E0CC;
	Sun, 22 Jan 2023 12:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD9C10E0BD
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 12:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR8qEcm/L0gajnevOvbuK2wrJD1WxmfVUxZPZF/ciicC32mfACIYDZ6nR6iVpGHOiHKaq1MgNrP1ey1iqWi7DZxX87Ys+wPDxSId97gjaq3/D8/w8ElaWL/ZqQUV+jHcs+asEWpqiRAMMk8Edya1J5LPGOFY9s0k9cCMur2ccoHbz04ul8B+XtF0/2glgs+FRAYcQSafAiggkKZh2VR70uJMiC71Uu6/DltGA+PyPTJllAoPubTNcAAdIrhgqxyaGkVuX7jZrrmBZmYsSLJo3PMdJzRyC6O6HfQjFs6+dBDGOtRd9BcjQvM8q+qEc7mJBtXcYGy+q7qEyPxg8Uq8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrvuUFDgN7/vUGbc2pZ4mYh2zNcBiVkiT5dR2is4xUc=;
 b=l3p4N1z7S6bOWBgLXD02KzX0N7DePyOisS5gizYmyVnqwdFk8RtG28l9H+pHEKA5/O/Ic7+MMfRpR7DcQFJJo1TesuLJQnyu6rssmUB5Jf02LPoZwkwJdGbLnM19LVgK6TbyA3+t+k0y6HfAgRy09H6Pc22qPaR9rv7HmuchZfJTY1x0kpA8G6t5Bbq3SMYqY904Tcc5fjwk/6Ogbt1bSS0wJfyT2lTaS0gkMJrr485nGFx68cfPcxGkWpZY7cy4epyWwk8J6yBK7X/WZLenprH24/ERQAQkpG0E0L9CI4Sdo+MtRY0EClLVMVMgp19y3Xeug8L1c/7aNww7qtkaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrvuUFDgN7/vUGbc2pZ4mYh2zNcBiVkiT5dR2is4xUc=;
 b=Z2G+6n69eZSrr038lSEzFVk4yNH0+cRtzRml2QskITn2HA+vVVAn758894Mu3+JShEJzDISKR0dvFfulBZRLzGWAa4EOcjdPiGr90BiSota8wVRKGDSWnmchZazVfockOoRvUjMriZ73rmGPHmvgvx0jUikcIm1s1ob7ROszXHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9388.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Sun, 22 Jan
 2023 12:17:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 12:17:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Add i.MX93 LDB
Date: Sun, 22 Jan 2023 20:18:35 +0800
Message-Id: <20230122121836.778195-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230122121836.778195-1-victor.liu@nxp.com>
References: <20230122121836.778195-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0247.apcprd06.prod.outlook.com
 (2603:1096:4:ac::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a099faf-bf1a-4f97-f8d6-08dafc72a4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MAJ24FMYaxTSAYsewW6gItsn3axHWCOsRfWPfZ0z9kKmj+zHLbpMna6hm/kR8TSQpvygTR2ZaEsQvdXW//EaaYig6M6SGxFZ6L/lcGHIIkDh821BP+GRG266gCEVnCsYfpOiCTLTa2Kq+YZe7Ko3GVW5UoAlLYNmX+0D3ZFIlrcou/CVM5qFva/zuyFpOZ2vw1SHk926pjP+Q/GRPhb967B06CEwGVilFvhaDStqIL08snC2apz5lpmryf8jSfwgZ4mTtVBkYG8zshV8Gc4VMR/ofsBotT91kyrTYplk4+ChqkUAaDR0VWOqihS6aB5t1xo3RuSZT1Qut9kF0F71Utcu9M+E4v7ZzBzfdLCVVH8lo373EOxCtS0sOShhgcJDrSpfV7ZMcfare8QL6XMYG+ZYei+GoiLkPSZcpKdh+ukzMpq4cMezTFNDsMSYZzGANZsD5qaGUlIpAArhrQwgbDjX+vWNXBS0kuV/of2guljVGjHLQAwTfRVxXqFyijAnR14dACY+6WOiBL0iJ9auVp8/qu5N/oCuMlzzlGmL3Zay0Rh9TCUPxRnMDJ1x65Z59NwixoWvTVOmyC/33zFnZroA8EQ7V7RokRkyF1+rC5VmKzbOMI9+0mhL1L4FoW2baDyMFX0pRXpfhKPbdE/sguwrMNEc0RxZsuXEv81u72zPqKyBh0oXsEuBZyK8tytlslRBUbZC4gM3b6tGLe4kQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(6506007)(478600001)(1076003)(26005)(186003)(36756003)(6512007)(52116002)(6486002)(2616005)(86362001)(38350700002)(38100700002)(83380400001)(8936002)(4326008)(66556008)(7416002)(316002)(66946007)(5660300002)(41300700001)(8676002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Y5qsF+skEqXGvTM47Iv+6BDqPnsehKqGN0UknN69HJpSSD1b8PsF13TC5lP?=
 =?us-ascii?Q?V+viC2qdLoP45eRSiDOmABR8pFzPZ4s1DRZ+0CXHhuiOtf09nXtBP3nXgV+8?=
 =?us-ascii?Q?wHyKqNCzwFml6+j7SbiqLpwthKc+slKXaWC79KakHH7vf2HncNoSsV/XwIuH?=
 =?us-ascii?Q?++LB7LkbMz//x+YP9lH5vWGL8Bdk7D9qN53hhttKF0dUZIjEs+aPmJ3de++q?=
 =?us-ascii?Q?1jbJzZySgGLqsdCFt2W3q69/0z3c8t5QwhsGMF+efpldfG0JyRXowQI63frw?=
 =?us-ascii?Q?0XKY/WebCFgFf709LF027DTUiuwV/LTgU3w6FC95Uu25fZZn20FRbXS+wqmK?=
 =?us-ascii?Q?yVl8AkuDCTiPklVCAhCSvF9tQRATu19U+sZ9yK+PQ6ZleJK1tYNCA9c15wlS?=
 =?us-ascii?Q?J0a0wXf9X5hVGOujtId2jvnU77PnP+s7AsiEzzmD4xoMI9y2lVoPFnqldkCr?=
 =?us-ascii?Q?RqpMzhJXHkTwjp4phvggxTYKaR/KabCSAPTeEl2BCCsFqS6Dop4rg7PRedrx?=
 =?us-ascii?Q?eVhJoIOBeW87EgeI9zyi+97/mr1itAlHbhAP+S65gPNfPikrfe9TjTsMDFmt?=
 =?us-ascii?Q?aya7E+wCwj7VQXU+p/WKYkBTEtZYWxZue8nmNDgBtE8VCne+NA0r0Oymed01?=
 =?us-ascii?Q?appqe6IEFs379UUE4e6/p5guUY4SFyPCUp14djBZpC+ld96WW7sF8zCc83lZ?=
 =?us-ascii?Q?IvvPoBxhbXGV52MRhq3SqdwzPsG6LGGJArrTe3GOVwyo5ojs9NzFKKAzW/1V?=
 =?us-ascii?Q?50ZmJ6RIUjD04Txfgp1vpmiwGjpRULe77duzNtgv1Tk+/7uJlHI810EHMJ4Y?=
 =?us-ascii?Q?T6IYpL+4Mj0h5d0G9QS6EwbMH9T9Crn/GvfKWplWHPXXUCtoyUVpjLpvGNGr?=
 =?us-ascii?Q?yZBr39CCh5jbPBXiN/yNg3BQkgVuKN17HRorCNu92VUaBlxnFlOtW0L/nkBu?=
 =?us-ascii?Q?lOm+tmOnaaqw4jaNaCe9U9R6dQtH3CBwtv1/lVL71dlVVz9XrtRV/czSOQrl?=
 =?us-ascii?Q?xh6/xrB0Unb2ijqli34hNzuuaYVjJ2CzS4HzLqeqCVVQojnIIFVo/F62EqSp?=
 =?us-ascii?Q?4LWnRh89gwo/WoeEyiSvvPL1j239Qa/hPP78kiLfi9fSbSo+WEHMR8ZkB17i?=
 =?us-ascii?Q?cKUTeNmWX2Q3IGmkChZruWdKINxT/xVN7Tv1/OXn9UsxCg4e3BovFlgLj4qI?=
 =?us-ascii?Q?Kck4pprDE4Dfm2pXhG7yVx9Vf6iH8USqHzKGvfqXEwmLyqf2qrKb0CSfJde3?=
 =?us-ascii?Q?pm13ps0UTjLC94BwRKjwV47QTSMI8eeyOpiOenv/K76+7rykEsUDKxpSxx0Y?=
 =?us-ascii?Q?ZjJdqxQ4XJ/iyLtGvH7gk0Ug/cRdIPgBIGtwK6HQldRkGrN7XFUjkYvkryiD?=
 =?us-ascii?Q?ZwRQPc1I+6pfzhZ8sSkYCz7ljBws3N8DpBVhrO+0eHB+y1rQ9/QZ0XN6em6s?=
 =?us-ascii?Q?8p+S96QOIXLhGlLQ1T+1T6zGFbbiNYCz4FnFdwDpuJdea/KrtUv4jhoJtwxO?=
 =?us-ascii?Q?b8DJQdvoZuL5+AtO3iJoG0QexTch9e+mlrQ5HN4c6WLmhS6r0nnycyDGqBAH?=
 =?us-ascii?Q?eD6UcnBlMox60v4L/mml6hSJEblQ1m31xxPfE+Tx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a099faf-bf1a-4f97-f8d6-08dafc72a4c2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 12:17:35.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDP5jbBHrrOY/SUf9IDf7xspGpdWD7VKxWCGLq3cREXYza5rta9yH8DQvwcG/3T94X+2EErIs2JDnEafZhUPBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9388
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
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same to i.MX8mp LDB, i.MX93 LDB is controlled by mediamix blk-ctrl
through 'ldb' register and 'lvds' register.  Also, the 'ldb' clock
is required.  i.MX93 LDB supports only one LVDS channel(channel 0,
a.k.a, LVDS Channel-A in the device tree binding documentation), while
i.MX8mp LDB supports at most two.  Add i.MX93 LDB device tree binding
in the existing i.MX8mp LDB device tree binding documentation.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Drop redundant "device tree binding" from patch subject. (Krzysztof)
* Add Krzysztof's A-b tag.

 .../bindings/display/bridge/fsl,ldb.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index b19be0804abe..6e0e3ba9b49e 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8mp-ldb
+    enum:
+      - fsl,imx8mp-ldb
+      - fsl,imx93-ldb
 
   clocks:
     maxItems: 1
@@ -57,6 +59,18 @@ required:
   - clocks
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-ldb
+    then:
+      properties:
+        ports:
+          properties:
+            port@2: false
+
 additionalProperties: false
 
 examples:
-- 
2.37.1

