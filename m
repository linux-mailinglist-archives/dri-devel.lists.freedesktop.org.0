Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D577390F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862DD10E3C7;
	Tue,  8 Aug 2023 08:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326B310E3C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGQZ1K2sJyekhAVEfWI5OWRg0XHzs1jlL/eVGMOrnm9ccUjOG+F5EEZBwYDQnwa8SPTZH2F1mq+S5LUgC5gDsBClXiMMa+MjT0JjC8dmhUMzeYvsC/i++55So43+NEYiA0nTUWBe+rCufY1L+yugIEfSkt+0XNlV5Nzq2ZU1XVDIJt6Ug8NRz6PBoK01rF4j4j1fns+Qgg2t353O761ctnJqqoETIPHhU/IZhVcJSGeOEjwHokLFyCiZPQo4dUZEPBcxrqP/tKE4nETWfBeBchCnJstMdUuDAL6Cm9RBVPYEGuXZBUlolks/X98K/3VuO7jfSx2iKxwaVNSra3aNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzL/vMFnqmik6mxz2dJmVMwrK/gjTMbyAagCuheey8k=;
 b=VSMndCacu9tTYGHyH3ew4HRdwXoUJnerwt2phcdmsTszs/yEumLk2JtOlUiYiYebPaorNsx+blexrhvP1D0UN1nEtyefqjomdZRDq490f73OxXQz8MTBj8XsgGCehPCoAAcQy6I706/V/GDgQLdgbsgbbj5Bs3AzIRaVmmsHwFV+NHPZZkJgr6sQ8BCJcxtMrfZkFDrFReqly3DG6Wweqly1rekO+RdrhPlmLaXdqs5s/NWyXOucQRFNnBZ6o+PrPoMnIQOtvfXDHPSFV371vQs9PxYOITg9jbYkQ6KCx+EHB8xWLnzoGiiHZmgAm7STrRIrt6a/Y2zq0e1ty/cUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzL/vMFnqmik6mxz2dJmVMwrK/gjTMbyAagCuheey8k=;
 b=B/b3Q/dE36+0C5LJXZ+iMHyyz1/B44UzYgp/P+rKDPTscM7JrKV7/VHA+IXTBSeIlswmdsvbkW3/TTODWDyKndwvacwnE93WFUUN+fVM8PJk9jVuBU4O1/d+54n6efaor0E1uzW1mhA+nrSF6zy4FYcPTilxPs8XxtFd+MfGdj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VE1PR04MB7296.eurprd04.prod.outlook.com (2603:10a6:800:1aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 08:33:52 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:33:52 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v8 3/7] dt-bindings: display: bridge: Add Cadence MHDP850
Date: Tue,  8 Aug 2023 16:32:39 +0800
Message-Id: <20230808083243.3113192-4-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808083243.3113192-1-Sandor.yu@nxp.com>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VE1PR04MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e9ae89-dbaa-42e7-ebdf-08db97ea31e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fevr61f5D3GX4Ux/Q/f2KV20Ks+mON29+bKuCANA/jJAaZx8rd+GVSzLNxoy567u85lKQgI/wpEpvGcW9HDpPdvoCPTK00lwPZDprmdADTuyqKq+rRtGero1br+d0bpuJpr/7PxSSRGTQRYKOvl4Xj29y0CcAkuW87R/VgyZ7iWgNPDRCskT2NI6CIjTeNoDRVnGI8CvxPbFhZ9A7FEQ/ETTtaB9vbL484kGE/+4PU6fCPOMAXEIJF97+8e3m2GtYRSZx6uv/UoqvT+5tKZDniIxRLmbO73yV8Fr+EnqSl0i71TqtyRg8NZvpar7+aaWdSvAfoWqnMq7C2p402EZWgvtDE/JJdmjrz2bjooUqmufMJ1tSO96tkD0BDLLn+u8wEmGz6Hvy4KFGo0aZnKnXSc+FXV2YKxy3/VN+I8ZLXpqmCx4Ns/yUNqpnosN0oqdF25/55o0ofK6tm6S6B0Btv/Db0MYuE7R2pKmeiL4SBSNRDbIwX3z0OM1bsJpcYhrW9ZjMcqPT3Pa7hEoIwihwX0/FVGM2RxdN8NhK1jQXKrU9tQHd0MgiqYPySRGuA1uD2UDJncwV2WvavekdBJz43bMSkKudzdcW3Xk0SCHeSVMz04PYdqWTkjdCmNZbI7RvzB/NnESTf0qMCCbeQ0Ra2ybi1HwXOTy+4UpgX5VqRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(1800799003)(186006)(83380400001)(36756003)(2906002)(5660300002)(2616005)(6666004)(38100700002)(52116002)(38350700002)(6486002)(66476007)(66556008)(921005)(66946007)(966005)(6512007)(4326008)(316002)(41300700001)(86362001)(8676002)(26005)(7416002)(1076003)(8936002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91pVQpQOX0L+9WBtk/HKx6/lrP5SZeqo+rdL9x+jkKmyAzXKQFr+z5jmmW9R?=
 =?us-ascii?Q?CKNIfOuXg2sAnGBtnJPkhO5G8KmRCnceD5kt9O2YYa49Qb+KOP0ZlWWJStYZ?=
 =?us-ascii?Q?M+PY54eg0utoZ7ZZmDNWVe47pmiiMrRd2I9GjAXnmVJvZhkiyURUZWYl2LaS?=
 =?us-ascii?Q?0UA1EQ0gaZRSLbuoXipse3eNOQ60vlImh1a3/O8dkAfyPjFIdnDkVOUERsFx?=
 =?us-ascii?Q?Qb/KtCtnq0mi8mLttrBaYN1sHPZEHCZB+T9oW1Umveb63k55M37kyCBjTc9P?=
 =?us-ascii?Q?UQI3Mlf0iAWUFV7kOB0K207TfPAl4hmTBiIL+uXHuUKCZpdVNFIrS8RqoSDl?=
 =?us-ascii?Q?T84BIuSA+P9DSre9dNvk2qL9ie/KwL97zsVwO2aPmV8uUyEwbdoumWLPIwRw?=
 =?us-ascii?Q?dwpNuvj3KIHF6AU88YHiZqnJsbK1gdRxE3vmi9gEh+u0873J9254PV03SbiW?=
 =?us-ascii?Q?gbOD2tjwyty6esn6ZKGggCB55GAL5Z5amEdVwazgB0iRoxRm/RV3/rrgl4nc?=
 =?us-ascii?Q?cD3BV4psm8hcKkg9aZ0Z0ZZHyumd6Ai1HL0BRtzLHGylYk74tsTf2W3GMRNb?=
 =?us-ascii?Q?4SnLxlhD21TEQGYG1zhqsirxYyiIYfRHn70bJJ3WKmVBYJS4Biu7eME48Rtj?=
 =?us-ascii?Q?Vo2R2R5XhsBTbMu5sSugzmowwZccNJR8t9Hf072UoEUc7YKa4flcFyE4+zfX?=
 =?us-ascii?Q?Jhx0t+hbNljto7hKGKg1B3v/Z4LZxxSpbX82oF8sDSPJPm+mk0qcpaY52nUU?=
 =?us-ascii?Q?vb5fGKFXK7eETVYqMxzTKKTWtW2Y0qemOHj3ldt33kMPFzvpeFM8n9hfhds0?=
 =?us-ascii?Q?6xO5AG8RW9/oGa4XsxzxmFJ4vpJMV2cwGTi03COkZYhAjxS2emZb2jI906L2?=
 =?us-ascii?Q?UaAJu2o7YASVOJ9y5pt9k29/xa4SkUmz8AR+UbAZtFTa8NhGXc+304rKytcD?=
 =?us-ascii?Q?BcXvSjfTDUWmXUfJsvK5U9zR+lRNHK0145Ayv9SrNTQcE0vzUGp+Ghn4me6g?=
 =?us-ascii?Q?6JEQIclYFfwczac3X0jo63bm13PnE4DBXHjj2OSb+byc13lXCj7tz6C6pma5?=
 =?us-ascii?Q?k/Xw5CFRue3HujL2ViqPUreN9FC3HtDV9CPutA2eo6kaXmzXp56zluPIbxXG?=
 =?us-ascii?Q?MQI9uCH7ULYJMC5oRO5WCISy3uyEMWVHpu+GyHolyG4ghthmLGOldvsZ/raM?=
 =?us-ascii?Q?kpAnQEj5UF9jmwt7QJKRWvHxXo3faeZpaPoV+dmkdrmmCxlwhF/Cj/qxUiRJ?=
 =?us-ascii?Q?vmBN5bRyPlrLn0Zp54tb5iYnVYcd8h94w7vSEjdT1fFoiYcuxWV8pgaUxA4a?=
 =?us-ascii?Q?mHKs/RC06ddt/TNy0zUira+X2oC88gK2Wz+1PTXJMXlzR4nr7K/m/XoldDhj?=
 =?us-ascii?Q?hthUonypittRl34D6v7gcpCZJV3AJFy/rToAkf+NS9If8l1+T9m1AulMc1HB?=
 =?us-ascii?Q?twXULy/2sWhbqruay3wNqoF34Jy5LrnNwjpigJ5twiaageMfARwz59QpR1fu?=
 =?us-ascii?Q?0Aa9uYTjB/V/JxN0KZ5esX40y/pq9B6kf8CS1at3wMsF2RevTNPHB/EEC2eK?=
 =?us-ascii?Q?l2R+0cx3Z+Wpc71MzUSbB5bcvxU+FnREjw2kS6+I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e9ae89-dbaa-42e7-ebdf-08db97ea31e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:33:52.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHmTyMyKIRHlHQ0fDFU2hMRkCXRtZ05zBxNW4Nz6h+HdHAecN5kVANSL8Lo0cCTrILhO0ms0QAW728aan+zB4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 000000000000..3ae643845cfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DisplayPort or HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&dp_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

