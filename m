Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC87694004
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44A710E054;
	Mon, 13 Feb 2023 08:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2083.outbound.protection.outlook.com [40.107.241.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0910E054
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG5N2t/9ZOjW7BQLuWh0t4qv+1G7xWJwftom7HzsoUXOojtA+pTstbGSGwM/tGkUDrN2c6PAM9ipMRlxlGzihAIoEPtjAXAz/HR/4QA0r8wEpI2N4GtJC45AtQrWOcxj3PTK/7yh49dBI+jiaPvXAEE6I7rf+SZuqixUiI6a9RdR2TWNHSjZxlA7rJvQIiFFtXhAtL6wVgerveaEtMA9hhaEPpOXKomJuLhyRZ1ZnAlDvLWzS52xz0YuYzC6mTRq/Lu65SZEdOrnQF9ONq513Jii/ZXg7gvbFg0hROut9fw0HyIat6es+3ozwUIw6NpqiRCouYlvjPhcVg3jW3DkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SUhQVQzokpbnZ5hLrxn16lkitUjkIbMyWXVpWOhCJY=;
 b=DS8SH64AWK8tgfc5t+2Eue1ACngM2ZvmGlYTJNcGnYTZX6DMGt7sJyMB11ZXZ7ykRcHBoiktzf8mlw0bVWhB/XyaP/AMb0pA/Kh+4if//22rw3U+nBIMre5gGUnedjPHJq6l8M92HsiEonj6OawKZEsGCc7lS8GW7gehegF+NI6SMVfuwDX6xtT1+hYbDMUpdRDhG5e2vqL8zL+JMBJRa4C41fnrZQHk9YO9tysOSk0IFIVBRNJayk3Yvgso8UiXWgG3HyLy0ZKa9Tn1HkvYL7NGo341RqgLpEdNJ/q+uL05wanlE5+oc+yqoydAWzhoSjpfdGyWp8ybIc04/msDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SUhQVQzokpbnZ5hLrxn16lkitUjkIbMyWXVpWOhCJY=;
 b=pvFnckTLdJlr9MGdLiLWo/zLZ0E1IDTs+VER8KIyEmi2vumzLMP86VXJTNNAXSP6PeT3G0ljfrorZPI/bN5Hmr6sTnaNfRMLzlUowJJd95RGds4QLtz5rPmG4/gQZkw7JigJ9TZ6qA+O4V7XkWcqOupwLEeGyiJeuXREXXt7T8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Mon, 13 Feb 2023 16:56:07 +0800
Message-Id: <20230213085612.1026538-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230213085612.1026538-1-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2c6fbb-9d7f-43a8-7773-08db0da00433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwDVYcBx1lzJhbB83re9vGKK3lnmVd21qtclL/o7eorEwfsPFG60ZTA6/bi/1aJti+ge16Yy8nnPIGqHpqIeEO1qeZbQDzas/ApW16mgafDQ9467tqjonEHDqJlfJ0zyDn+9fDxuTbUY+tfEyb00ebA+OuU4e6xcNJqfJOx6YH7F/8rNozjoWjKtKxmmsBhvcZZ88d5vSu2kHH8oVS9iRRqz3sTlmT+NsqpgB4nA9u53Rwoc9kLsm4HoZ73QJ07j1RK/9vsZsFp+PzGuuKXomEcsS4hsAaoEVjUW8Dd1Or2e1/3ZwmZ1ay7SGgiI7Vq5EjLvJOXHovue/2wy3+mKZyCIKzqVN+RyOydF8IDOejcqBHEQTCw9Au9/jwBtjFsxlT3zOGpo7k40mG2G4pKYxtuc6jkMZEGruuvYpJS2QRdPONLIi3QMb85wEJb79of4tMXa4VcPkFKC68+TauL1CRbFtQ9cQZHSjgyIJz7ZX3+dYpHr48DxwEKF1STmpJ5gT666tQ7FxacG3a7o8usoMYa3DQVZmfBI0PbYWyaIk/wdDC9X6y3hIAwWzep/0mEJAxqGgwYBLm1CaYhqzoA8JFAqoDoTfBW7TdkKXYVWGYzFy+vyX9b0AM0vPEEOdx5NztK6QwoaQ1+0n8rBl1+38NWL1aYMUO2xMuncG/E3bK5ey+hbmRIaphmTz/3fP6xrQKpA4ow9ovZdkFvUedldYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199018)(26005)(186003)(86362001)(83380400001)(36756003)(52116002)(6486002)(316002)(6512007)(1076003)(6506007)(6666004)(2906002)(38100700002)(5660300002)(38350700002)(478600001)(2616005)(8936002)(8676002)(7416002)(66556008)(66946007)(66476007)(4326008)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nai0GX83DPAdmaWc/iPq2Fj4Ee8/CIWHlXVqsrapkd7iA2X1qlIwcByO+FYz?=
 =?us-ascii?Q?IvnVssc8WePNdQTPOWD/Ixx+vj0Sf22N2pvVHcmt+w+N886gLoo454uacP1C?=
 =?us-ascii?Q?ARRMA9S+jB67cnJ1byGqj5X6frDDfb/jCl2+mhrWDqcSF03Z9e2JPqHVo1IW?=
 =?us-ascii?Q?OT281R3t1f+cm7wSgS6YzRZ6Ok7PggnS1fTAuNd1s5I0m66PPfpanexV6Nhw?=
 =?us-ascii?Q?ZuMY/+jnD89VChkt+9nm8qgydMp2zjfkUB3SNgFKVktCMYtvSeZ5GDvXke6f?=
 =?us-ascii?Q?qRbIOAyVMEpLwbIfK5c7jtlvWqvvY+AJ5KPFaG4gpuK/2Z3+u3MFGX5U3SJr?=
 =?us-ascii?Q?ZXP8WS/Dofir/pgJKNYsBApcs9Swepds+4Vzh+4lFsFPvfrZ/VGzXjWYXbT3?=
 =?us-ascii?Q?85xc3kcSOFqW65NEnIPueg3ZZtg+WYsLKAiDrHivFi7LXTvWt3Ei18vDMQ76?=
 =?us-ascii?Q?p0Gj7pmbM5fThVapmlKox4S80aq0qBkdFiuNRTB0gkHeWBJIi9I0McBbj+GW?=
 =?us-ascii?Q?r+FJfybaNwGsoedUh7LJgcWiIQyl2pxv5pXbIAx8n/udl3b62kwwevir0PBf?=
 =?us-ascii?Q?vYHI5xDl7kvF8kvjOCNFzZQl9/Qp5V9SLPj36wcTfCWFZQUxABvSMMr9H5te?=
 =?us-ascii?Q?Z0iodyxGn7NBagM96eFRuSKQrsKkwNf0QWBVyY20xXihUjvgJ4LM8MmuKM5Q?=
 =?us-ascii?Q?R9EbITLA9EXBm1uCb8eQniIKHJJIeiMGkV9CB+Jbq4/C2dJVH3VBtUoAehAC?=
 =?us-ascii?Q?rgMKKB0SGiXDlZyXaQXHZOvM/QrS53lR2UEXEn+mJ0QQjxGY2y9FoBiASAyp?=
 =?us-ascii?Q?En8brR1U6KmPEAmjDnR8DnbV8yVpg/MNui50tlx8CTAMVhJiaq4Oi++Wp3dr?=
 =?us-ascii?Q?3J5fQCSQYm6Ep1TORnEHi+bcR95KbG6jCDibGSaw7pB9vYLQLfL+OMAegsy+?=
 =?us-ascii?Q?eoJ3Gzc2Py7bTAv05LvLmbFTJYewXpTcgvCVSyo2jfcx31AD4fg+30SMH1YN?=
 =?us-ascii?Q?g32uZQtQszFXU7AQGE9h8ORv5A6ndaG3mlBjwPjICdsnBh9ay7An1dqUYq4R?=
 =?us-ascii?Q?K/14aM3vJ7IV5jytw5nxnXGTLzrydazH+A4sgr+zQqgwg0CBlLuBB9wm1t/M?=
 =?us-ascii?Q?NOhDdlNvbuOvTvEz+ZlleoXV+Y4zRmGopNB2/ZRKG1YbxW7f6fmcxgtfdhsV?=
 =?us-ascii?Q?2FkYOhlSrzy2WUqUFYG7qAcpafJbawizWO19z6oRQX7BijnbtzXhZGBXGpSC?=
 =?us-ascii?Q?3D/CsesDl3STe2Q5rDRVGSBTGhMu7ht0bEmRnWLsSRMlirI6mlssmi+m4434?=
 =?us-ascii?Q?ZllUPSUtrGy9GzDQWYQTlpVIWDF4so29wZ9bZokF3UxT2Q+ixFeCYqfY0+6x?=
 =?us-ascii?Q?UAim+DA9ycq0SEMnYDQzAc+zO8HDxYuYLFsEnobtSMfFFqbaTjrgqWdKB5zV?=
 =?us-ascii?Q?jNlyO6TafmDYQLmbFmASUkPJxOVgz2q2DDRUKA3fpf7OT9dm3amcmfkLliBy?=
 =?us-ascii?Q?jQq1oP99wgv8DNmGtF7+Imr8RVY67KFkyBfoqK9tTI1Kk3TcjDpOiWHtxw3K?=
 =?us-ascii?Q?pRxi5jzH6Z9EfDo6xpT8o14Pf4oSc6k1zRNrmasL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2c6fbb-9d7f-43a8-7773-08db0da00433
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:12.4634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3qmzM2mFi8F91tXOQJZGM1AQQbLlMUAA+IP7kGY5xbmoDK/RuqzssNJOu6M2OudSEN5CeQu3n1/pMjEZHFnXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135
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

There is one LCDIF embedded in i.MX93 SoC to connect with
MIPI DSI controller through LCDIF cross line pattern(controlled
by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
directly or connect with a parallel display through parallel
display format(also controlled by mediamix blk-ctrl).  i.MX93
LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
tree binding for i.MX93 LCDIF.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 75b4efd70ba8..fc11ab5fc465 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,imx28-lcdif
           - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
+          - fsl,imx93-lcdif
       - items:
           - enum:
               - fsl,imx6sl-lcdif
@@ -88,7 +89,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mp-lcdif
+            enum:
+              - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -107,6 +110,7 @@ allOf:
               enum:
                 - fsl,imx6sx-lcdif
                 - fsl,imx8mp-lcdif
+                - fsl,imx93-lcdif
     then:
       properties:
         clocks:
@@ -123,6 +127,7 @@ allOf:
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx93-lcdif
     then:
       required:
         - power-domains
-- 
2.37.1

