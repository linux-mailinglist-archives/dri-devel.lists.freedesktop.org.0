Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2A783C3D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9B210E1BC;
	Tue, 22 Aug 2023 08:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB94210E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6I7ubmsAkjVCSYtTAqmRYJ4LAJ9EwWYFKSeQQHt0FZ+K83RS974K2OGAnMguEG+1ZD8OandnDW9l+1qw9w4unREqjuHgTDVU0xzfLZNEm+FQtySI8eOF/2kXShhSuzHxZcjuJ/ayhePmGA4Y6lfZdHQwgvAPnbzu6Z+16s6ZMuRifVtwwhW/hbPuAYSyZwQY6qOXcLG2WoKyE8G5arME9+kjYv92LeanCVTVNasg/eYOvRYaajeBQeA2TFomPvNLIGNVfTc9nveXOldAOsmwKAkDKVaxEIo8Khr12ulubKD2c7JJEL9D/x4z8EywfAOgtFf2bq7h5X7xDComYJMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CFlAyI0/S7S6pWy091XZdoIPCsJONHLYiyeHv4LheQ=;
 b=NP7XkvTAzV/fIQW+QkDF9vDjYF0iUjViGd1+L2uSaX6082dKVVhmBQk1AyWRoew6ozc+Leb/+IvovEy99iwfzMmx84UIEXdvP3TyIBHMuIZu1AvBZgh2upr1nhFUuGtSWHaAeSDflLyBwPBQD8dw9EV8jLJ4yYWfsd3ZQ5f9IoYoccor9eLuOY7Q7WX1iNicIWpqFtGuu2YazpDu8ezF4GG/ePgiETxs52BqTW8cw0us7mYSIARkAda9Pjmvn0CE3LD/s0A6zwYW6Pw8GPcdPqNiqfZkVjxlh5+Oi/XQ+gk69pRUyCfNGn0B4io2OKdzDhmhJtbcRI8BPboyhPvzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CFlAyI0/S7S6pWy091XZdoIPCsJONHLYiyeHv4LheQ=;
 b=nFmDWsUV8Gh117bNZv5PnKyCdEutK+m5ZWQ8Ks8MeRg+wuZPflQxgqseRjBHGXaHYCshbtbpozbTSb3tKxO+5IgKM0PUZSaK9XNP79oEgfgCDNpUnsZ5mZ8YTggS+tBNPsq/8QuALjwJTfzuspC5Hax45olUhv3KgtZIEsCOgk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:55:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:55:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Date: Tue, 22 Aug 2023 16:59:45 +0800
Message-Id: <20230822085949.816844-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230822085949.816844-1-victor.liu@nxp.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 491e1a9d-d633-4207-fdd9-08dba2ed97b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vhkzx+Y6F7dJNgIFN7dT6RqqCsauwzqIHHgDci/Y9kOCmrd4pqJHuuNzzc3cHsfTgst3EgcQUWPD5OuY2V9d2aYTDrvbJVzAVrt4Wf/1lxD/sIHP2+AGnTO6KdDxCYGg51tqzUDIEw3aNBDJQC1eKFLT5WVLVsxOMhQtyXADLC2B1X6V7L1eIOBINCHsp4+XJn6Y5VInNAe68LlpNe7CniLamoEB/ijRMQKMjHWY3VhbZr20zuV+UTDZmJXHxx+yekxMhECk48Fk6DoZB7+LK9RUUGKd4w1D+ZVYioPiu+bGGVYmTrHBPahZkK0XxMfKWJ7myBeQ6ljc5vsSSBh5dweWQ7UgznLVj2bf8dELX88QTKFSj2D7Chf0WMsTLwlge/H7IgNhk++JSdqD5ulHxK0LKua3tReiXyrNKkT9P9hgs35dvHd9WtKVaOyj0znNlkYwk7hWJ6bGGizCX/SoYHQgzCQoS79DkZxvbYA1Z9SZeLttOYlEJYpIwXrAPdM5FsLvTOUsu1+btdWZIMsONbKckGbF+uL8WLMkXQcTgpW0F1uDi5dye1/l+ud2lgck2btpSs3DJFEOSQLlNd3dwATxrB0zjSEnJPi0a+DMDYlKstmhq0uL+ZAP4WcXGZAJwd1D4MncClMZ6RG0QoXThw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(966005)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PsqYDIs5QKiL8e1SO0SlTnjLBU6nZh+k4VwfXR2mamOnxTIt8k4pucbpqDMK?=
 =?us-ascii?Q?j4gWxwoK5kKA3Oi4GyA7VdXJmEsZdwRdg+gb+ks0dP6rOcTsCaaLl7yEnmpy?=
 =?us-ascii?Q?f0oxjj5FIWX3LWJtw7J1GghXEyIAsA4KWUn2Fqed5FrZJl7UQj4VTjoSFCkB?=
 =?us-ascii?Q?3h0WRct8wNdU9R1AJhE84FYuG8w7DAEJnndqcIgHFlDwjO0qYz3GJ5rOpfnC?=
 =?us-ascii?Q?cwx6ZTYlbn1e564XU9cbpfPrgJ55KPKPUOKN6pDunuVapX67syhvJOc077e9?=
 =?us-ascii?Q?kH/vVGsnwPtx+iiQTotRJJZuhzLF07Y2r4yu48eF+oLKLEs+5VC2FQkEciol?=
 =?us-ascii?Q?8d7al53ztNupZK9rsgHqkpXPH/BqPuHW1GnoVoC0wtTxwDKKXecovUPQkirC?=
 =?us-ascii?Q?hFr95R8rwWQx1IjWT7YOo1Obwjkbr7QOidzG6aory0/ue2k5sMzugbkJKkEj?=
 =?us-ascii?Q?pTXH94gETlhvOmXW1q/EB+qN5+XfeEct4bMUMhgSYuyQIuCCMGJZk0eD+su8?=
 =?us-ascii?Q?51AbSW2AmaM5LRDsbpU1K3ogaWxdOfyLYAEihmBwA8mXCfjcFeh/FHLOCq1t?=
 =?us-ascii?Q?gwQ0r9L/zp3A9m+CUnG2SdDJkCzkUjUot1x33ZX5La/rTuqB+56xz+KH4RN/?=
 =?us-ascii?Q?1Q4bQJxBrroPaHMnkewuVJ+OcEwybBB6k2D1TB+xJdI4+8j1hCxlBZYasQjp?=
 =?us-ascii?Q?+DNLZhzb49ilqDcMXmEu1YGoVhRKmS78yDP29m4V+FUKP2CiftUrZlCzTuPc?=
 =?us-ascii?Q?TaRBCCabpQUlvZdritQaysSN6E1d5OGDUNwbeKBI4vgzur8kwjhzQPss/L+7?=
 =?us-ascii?Q?p/scDyr9n+mSS6VOYK7EEvL1vVE44D/rJAv4Vk5DubpBE252T342eMxIlWIh?=
 =?us-ascii?Q?Fyzyj9Hsr6SitFmYzim/914xvurFvCCrNd+SZpD6SJRK8owTrrICNEhbR+Bq?=
 =?us-ascii?Q?XeD4ZdNnEZfVjK8ge543TpY54kZEq+etQTEuyYCYkdQVykWiJj2Ipz0KFHBL?=
 =?us-ascii?Q?vKOo5kncY2gpDKlSKU1SpHJ776ALqGmF1xLrkUv7wYhJh6/ynKLAYdsb71HU?=
 =?us-ascii?Q?317uKdmq+Gqs70aCCYSP7I6WX/6i6n5RUwDUfks0OaW7fhysm7VHzpx3uzkU?=
 =?us-ascii?Q?Gvv+dyiOTI0n/+DJ5r4NpmNi0CA6qW9eUPdirO7OX/W1iGH3SXwGzEpfyhdI?=
 =?us-ascii?Q?HWXAjFIdTKTv0mbhimFavWeeT0ushX03QigIZpW6nF7jRxL0TRw8wq19b/yl?=
 =?us-ascii?Q?48nYw5AhkP9O9LjYKOq4cVdpDdGqdXNRXpv4JkkZdROwStsRTA+JVr7E9vfj?=
 =?us-ascii?Q?lHzDRAIbwi89y8MnEPauiz4YHN2+Hy0hxucyXBuC0hoD2XzCLOa/LPVXUnE/?=
 =?us-ascii?Q?29UUUxRaOPP9x2mpTw8b+2VP1Hdjui4/k5V9HZAxnObbu9eLKqrJ51OdzuE7?=
 =?us-ascii?Q?TkdCWcqILcu3jxm+m+ZqimfH4/Ec6Ty6eVZRf9NSIjZSuhXGAaJRut3pSksN?=
 =?us-ascii?Q?8Oc0WqU9NpWtOwbBm42THqpxZFlqVUBsgS6MHEzRkXoDJL9bnUMD9aPmlvYr?=
 =?us-ascii?Q?1YtVOH9PQw9VrTUefUAgckdo1zcWgiyEY1pMKP3A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491e1a9d-d633-4207-fdd9-08dba2ed97b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:55:54.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHu/tqJfAipXTTd48pKuVNWcYmSFb76X1yo2suAQARSAAdRi9FJaH2In4E1RydyKzLEWA0pnuIklliwiO2U7tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v14:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 000000000000..3ff46e0d4e73
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };
-- 
2.37.1

