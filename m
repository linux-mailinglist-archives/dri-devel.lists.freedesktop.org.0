Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E9993AEE2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79FD10E656;
	Wed, 24 Jul 2024 09:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HCJKzIzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180AF10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrpJTzxQl/zyTVSm6GThK5CBDIPdgo/n6B7rBMHYR72kKpwpsQMZACh4zTbhKibneIsoC0Tc173tkwt53y1ScB99ci60Fk6m7vcFVpeBmfHW77dBiDSuIAx9k55o0PvoXW4BUM3bEyctIj+KpfOEYDs//rcDlScXtPiz3Abfmkyb+sWbmyxyMBQc0DXifVFAtdFFaOICABqtlAcv0B9YZKBCNLlXfXuctC7hFOqyCO2VdRv5tnm8oZBaar7i0j1MRYOoe1AW3R7tUWQFp/g/67FhWA8BFO3Z4Ard4Wx/NU5guMnOpWnVYNOqRcZCo94JFKK9q4YinLFHv5jst2LmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqhYdcyuvC7c2x7ZIghnTKseC9t4Nxgh/TY2WoAxIz4=;
 b=YAqetqoVmzwsoowFJWGXLOFHESfeVGcXPVeE0McIlBbocCMAsmtverhAV2pOOxqtA/gygfVa6U6XPbvQeHBbuLAY/lmwOWVujyinKH3suoSlBszFaDWDZ/aO+xD8hoMDmyx06HMyVIMFWCylmQ+fgpa3ov2Rx0yKchpiDKGQyoFIw7A9A3XQtURz44TczKj4QllNm3sl6/ZBVfwX5QbrzArg0c6+EwX5NTq2KfGNXV5H9ew5w4kS02PKY2DT82MNdeV/0opwfZIdhIWw9GX0uVGsqxv+JbZWlFVEqehuiyGGWj4BRsxkO1Nd4K1bKMR3majcFMfwlWzSJYQwpRWQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqhYdcyuvC7c2x7ZIghnTKseC9t4Nxgh/TY2WoAxIz4=;
 b=HCJKzIzSYYKyUKK56efsaSw1gh2ELOxS2ReTaGJMdXA65FuupK2ltrr1aGjF4NBK9xCfh71y32ojPllTk8qMmw+nQh7uP55q+QRGlJR7aipCyc93n9sMwTpLtiF2RZXRZyeC4kr1upzVSaBh2Q2iX9MXpF7sC1hhw6TU/vjUZhFJemN+kSRAVeb9jZ7gGf8YsfA4GtW/C/luVaaOhhJzD9W+158KqN6TerWkFFOoqlklHFMj46i7Aksi7lVhEMgVWxFSpLDRV6LlG4tDdECVVwAPhnn6vdBKbL7WZkK6AccK+oWR1P2OUjiwsQMPNlqR4rdDg26hQ5Dmoq0EMekoXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:22:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:22:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v3 14/19] dt-bindings: phy: mixel,
 mipi-dsi-phy: Allow assigned-clock* properties
Date: Wed, 24 Jul 2024 17:29:45 +0800
Message-Id: <20240724092950.752536-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: afb5db40-65a6-433c-c44b-08dcabc22a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ARlJErijn1Ds2Cz7Em5u5jY4jhsu3SqfHBlHaQDnAamOPluM97CX1XpbQZE/?=
 =?us-ascii?Q?MGywKCBMqJAusiLHeGdBPH0WI9jkyEDNu7VsuiLXyNiqrqZduBzOvKrLVFMp?=
 =?us-ascii?Q?U2P/jxJmqCOYvQH/AzrsvSkCIH+qaAzOB9FhFUT9JBR5uRjgIht0PNlDyiXo?=
 =?us-ascii?Q?VYdDuo4BHQWU05zMxPatBY+7h79K7W9xiW3AOUan3ju5sCU0oeI31ZFTL1XR?=
 =?us-ascii?Q?IeRY/6uxLJf9rkuW140PElQTd8YkJkIMKzp2gZRXsm+VrbdP90pm/z7PFhdh?=
 =?us-ascii?Q?cSk2RhECJvo5779k9aTUZORBLa8IMEmE6KPQWnEdk7jH5dM/U3DCKJlIr63+?=
 =?us-ascii?Q?hpHynIWHA6wUmyeW3rTsmUMko1tPU5q/+1wr+t1dUCeEufSP2XJ8wLN4+zCj?=
 =?us-ascii?Q?HqnbJhMAFkElx+FkzGybhWt6fANvJ8KVsScPfzcpeWHxJYPueueiQh/J+a4d?=
 =?us-ascii?Q?AVaDVRiVIHriiRzsfGZnc7QP4m9fb6+IDQTM7X39dsKLSJHZBPxV9S01XVm6?=
 =?us-ascii?Q?5h6WBE17RSynWSqxpa5wb8pHOGcSncVZBp8NQyWmQu2/DxaEAiUF8Q4kSaM0?=
 =?us-ascii?Q?XR1I7/UjkIAhc4eNlfLlKf8EN3Fo6nWEuPSB/xfn+tq2SW+Mk4jERQyQ+6mz?=
 =?us-ascii?Q?7NVxeYcsqUdy0giZsbD+lOZPRwdseyEnBEfgydsTrV07ZyRGQCGS7rtYREZ6?=
 =?us-ascii?Q?uiIV1IFGCoaqUweHzU8eqCY9xrH0hzs0v4uH17fZh9Kv/LbQeg1mIQh41lE+?=
 =?us-ascii?Q?ZLmJAME3bTbVbAhtwX68HoyUF+ebhd0b5V7M1zW0sz8/PgWd2NiK9shHttDc?=
 =?us-ascii?Q?8XXDavOdoWDWoZy/afBEcKSu4B1bx6XCQZm52sY+72hR/1y0CB2wXWNVDgqr?=
 =?us-ascii?Q?fRqkuS5FEqdT+/UWJaVOvlv9x0inY3dMmzxLDG04NIq11JIbaqzag9TRgIzE?=
 =?us-ascii?Q?kacoSMjC9dKwIGs5gw/TqE3QgbU/ogWYDSdkRI/C8Nh9/LSlhve3uTRtCUtc?=
 =?us-ascii?Q?xVlo1qDBsEjc1w8eK/G0CEBkIuY/BLg7Ae52Bd4W6rIfQyzJ4UG5M2As7Skn?=
 =?us-ascii?Q?9UjP2Hft4S+0uOFHr7GV+MwJbBkrdDcVLx0mmGdcw6ghQd/9sOjRAbj4VSPh?=
 =?us-ascii?Q?EAVtGonYFDpOrkgaNL1d+JQV/qBqrnR/WQP01ya3vIfxaW2KzbNLeO3csNfc?=
 =?us-ascii?Q?JIme5fY/TuX6GuLi1qDGYrHDH7L/VKHu2SQ0WAXH50hwLa/oAeLlRfOF7ffv?=
 =?us-ascii?Q?XhYMNb+BBIWDHbv6eM7RTzjCMxcQP2f3wdQ/THiQ8/RLsPnyWKakPsoN5pCG?=
 =?us-ascii?Q?XGcd/uWUo3/vc/an2nwTx57Z8hi+ZD/jTUnR/a+T5KtXwbMM5f9ydC3O6LLM?=
 =?us-ascii?Q?1PwEr2Y63nUdQH1pACpWzDoxyftoYA8k493b8mVCo4po+FvrcQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bwyTDcV0uDpKZdaVoPqnI83fnyi4h19ggj67UF8Bc7x67TXyVgV3/2ZpM0LL?=
 =?us-ascii?Q?GljsA1Y8R7aX4cAn0RN9m90GckkHhhb0qF/Pw2ykqJ1/8h6XIotumVLgbyRG?=
 =?us-ascii?Q?4kyY6AAlit//kGt5NkOlTqHPl/fC1vfXPqaDMf8G21JH1Nhmpe01QWpIXMac?=
 =?us-ascii?Q?1hc5mpPxlRN3eXjssrZNYJn3W3ZUUlaE+T3aBGjSPkFEL8RTgzlc9MwADvNO?=
 =?us-ascii?Q?0olS8zKJ+fv8g+egL2TpcYT45aBHX12wOpK9h1XMOb8BDpebK+0rbxOxtNH/?=
 =?us-ascii?Q?bI+hSGlocLyjJZSbTKomZnjYzeNyzKXXezdb4mBfwiiQh5IpfSO5e9q+v4mp?=
 =?us-ascii?Q?CjtXSxxJTy57Xo2pwDQaOJ06B84dot3+xm91a0UDDieehROw123b9FeDlWKJ?=
 =?us-ascii?Q?FanIyupL6xbWLmFZe+3kwtsU+FRfI7GZbi82sogqJqz5lOFCTnTfxpMHO9Gb?=
 =?us-ascii?Q?z9LM2uSMVSLQ9rbZpwyEtOFo/vupM4CNrjHY1nauyfb/KgUBLenf98HcfqUK?=
 =?us-ascii?Q?E7YqrGq3VA7XGNOCx5ROiWEX1OE5UwnrtYzHFgHR4IvE+8wNIjS9/w/BGJGz?=
 =?us-ascii?Q?pvL7CjEO28R5aInXpu7zExCKw7EKX3BfWxugzxoH4pqGGkPs5dOOhIYnAI97?=
 =?us-ascii?Q?+trv+G1IsdCCe5rX2Wo74sYZScONx1fblVtF8y/H/XJcs6tkSzbn9sn5GxDc?=
 =?us-ascii?Q?oYLoxo6CcBFeAsJv5igsNuMCHTbkpN/xqYrcQCzLZ6jzsIyYqD48xW7I5jiV?=
 =?us-ascii?Q?zRsLg3xNMy+eFCyYj41TeFyyNeNoY+zAmBKCCWlld2f0BQh9cNuVuIx5CSWW?=
 =?us-ascii?Q?veFqqe17TV4drpwHwL5/768EtzU/pR6EaV152nbix6bI/D57ltBbRsL2bErq?=
 =?us-ascii?Q?YyiKlU30VX9hUpXwfnXYLIKRh7VmzhY2GjhOMOAVipPT864K3jiTzxRqO2UR?=
 =?us-ascii?Q?hRhzhX5FPZR2WSRzlbf3ZHG/0rx3drYZarRS6ABUOGEKhLeu5X5bOuFZ55Wm?=
 =?us-ascii?Q?9UpVT1hWp1/8x9KRlk4vqX2En5AT2GB7wKtClx5UK4l6aH+GsMB1zwiK8AZs?=
 =?us-ascii?Q?/73sS4uLkQ6/q6EFiDDdT3QXBB1IcxDziLOhFdWVfvK2900sVcW0Xp39O6gu?=
 =?us-ascii?Q?wr+4kYGDMMqc9VG4EmuseCRGgE45QA92KWZ4t0MyBZP9RpGISEIiMYHh9G9c?=
 =?us-ascii?Q?pDB5fd7NgSUZ74ccJnP91z7u7izkClvKuOefC8SslcEUR65OPjpakHwZtmkG?=
 =?us-ascii?Q?/89jkRUWYegNJWmOJA7NGvhaRYgiToWG7aw3/OCJhlpNaCramzbZfql0po1M?=
 =?us-ascii?Q?ZQrR5ibhr/WCmoK0QYfhflUj2rVSTFfU+LbPqX+aCuFrmwMFFI1lyle4LmQa?=
 =?us-ascii?Q?QhyXf+qP+wQ6y7H1/QcPMoYR5eSjtRtzoJgIJMApq9JKCq+MyOgrN6sQVcV/?=
 =?us-ascii?Q?ymTwqHDPYOuFZDNH4zZW+2AWlSUZPqmWK7oUyZD+k3bqYoHA9IKVS4Z9YXqX?=
 =?us-ascii?Q?/G6K6SH95N+V8qK7rtNDOT2TLiMph3HBQAqY+Ro5wkK7a/LRgugqK+cVt0qu?=
 =?us-ascii?Q?/3wTRGy2IpzmuQDkHhbcF7IikkSfjvYVWvulV4Vz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb5db40-65a6-433c-c44b-08dcabc22a94
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:22:40.9119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7cFq9uqWdOMScv4s0e9JazGUrYOHvHhcjVf8SfvpXO2jbXu7g+vTDyxlHsKFHHOM7vGDBjGQEWyo+J2UQN7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

