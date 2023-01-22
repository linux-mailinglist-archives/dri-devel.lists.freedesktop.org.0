Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E655D676B89
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 09:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D374110E17A;
	Sun, 22 Jan 2023 08:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8A510E17A
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 08:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWB1WM28PNlUtD8eYyS12gEmhDFmYRSOO5F+FIXkfpY0hxkc0n+ZZIN53AoFLoCQzJw9g2XQTxpzBq8J9UpnGUjodi9ClyIWyTYcAoKPJADdyBcWEeIdr6igGuixUMIW5yfJqHSPr0saSSHe9CjOoKuXtwJHwyA9cKLtVXbCXziAvU981V0Ikhzm8E9D5VIbFuPMdQLjA4exvMVpIeY3SHvnFzba0OZ0J37LF73cNhqncgv6sr7xoO/3W08g/4AQYU1XFwcO2EQ56MNyu6pQdrnWHttUtjpkVzO4eqmplh61QqbfDI2ycVIzayEvmDBUwuKzEqLQcMVZWrb7recv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLpcovFGscKY4IWP/xsIkZlbCWhz/eSsTLf5IflRJ2k=;
 b=YGv/R6xQT6fBtBIBwKEyJJ30yR3Pr5Sf+lFI2CLPSCWkmCjgGVpT3algjspSoP3aWuWzrIwMbzewq7KaJ+XFaYXwwoySU7zogV/QkT5uxtd4gISy9R0hA6AyLjXmpf8UrQDpsH1jMtMU8u5xPeyjI4iZeC/2R/GncgaHFnCp8GH8z29bkKiLd/XDrMbg+RMI1zs1QCFZRsUtvu0imyqruer0HzAjJRJbPlMTpNoIrbESkVfEgc6Yb4OzLnmZyw70c+01qXt155/GicIVBMwVoU7rzFeoB674s/+/opojJvj2i7I/wYXwWPaeLA7wfXGavXn06HIGoTDDRWLMkRuNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLpcovFGscKY4IWP/xsIkZlbCWhz/eSsTLf5IflRJ2k=;
 b=RqcTH10il6Tkm17JCePpPe3I49Uer5wRnZM3tkkGtTF8GO6dyFGofyv+1uwuwI+/0k6fZLLE0Ma+SvT2Emq2b9lBlur4BvhGz8XL4m6zKEkhpjxUtmcxp+NcwkXdll5BdB0Cb8Zx8WzjDBNkhQQ8DOpBAbG76RRganDWVPSwkH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Sun, 22 Jan
 2023 08:13:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 08:13:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: ldb: Add i.MX93 LDB device
 tree binding
Date: Sun, 22 Jan 2023 16:14:28 +0800
Message-Id: <20230122081429.694574-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230122081429.694574-1-victor.liu@nxp.com>
References: <20230122081429.694574-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d07126e-e800-4b35-c486-08dafc508664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BwtVgQXoF29Ku9j3fczZeuALH5GpBiyfr7+oweAh7MYfHGz0UhGnMN2sC9QNnzeeuqvwX5bGt4FVVw1ANUXd1ltfAU4bUfLkkMGrdujSWOnmclxaT3uxl/FjbBx4XPxwjm4NrIzFlaIkAwBkXCABsFPiJlnBwHq0Cxl1eKGZulxg/3vB1XYz+emIpO1MNMKujkeRJI0XjCY1E9Mo4Y43GXaTN0OG+VEHV1P9yl2/enDCPcOFRHbO+OYRqdhedhazqiHuxxAIGgHtT2BOz7UWYIOJ9OtVMNULdktLt3+V6zGvLJq+vFCBwNWJfo4agWV/aWJ/oCjW1Z6pXF9q/Hgd2aRohMpY01rkWBoJmt+VvNR+kAAXVOPEnCid0i+QtDZNbN7gnstxOUKvRIUDxgvg2oQBMRV1HE57DE3XJooTfN6P7dtHkY+nU1HsiIKsewTRuGmG9W9MxfaePG6AxppVxfqblYsX78reU9ojBg1sCqnWIfC81Ulp+zhoNR2D1uqrG0xok1obFlthmapKlPdQyBOhPbDdIVjKZBRTF8fF/E/kK+PNglR9cjO5Xht+tDfLfhiZ1wxMlmbPHVkj5pbPLtHft6qEGn8l7HnWQ6g1CveJNKkWdJMT2Mnpgj7AaZhsmC++RhZDKPFAQJM8V66d93ldHRyVpco2H8GcmiR0HA6A7FWfeaGMRMRoxVzwXEkhFO9uhTb8s74QsHuRXx0VDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(186003)(2906002)(6486002)(6506007)(6512007)(2616005)(316002)(26005)(478600001)(36756003)(52116002)(38100700002)(38350700002)(86362001)(1076003)(83380400001)(41300700001)(4326008)(7416002)(5660300002)(8936002)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3QkTKS9hNV14dy2RCKvQMYjHEccpe9bUhTn11bKFijZa6m9dLb6amrBMYNd?=
 =?us-ascii?Q?H5NTWdbNNU7d25T3ytF+kFAO4bUf3g/butYBvrx8L2E7fr+I3z5EN4374KfY?=
 =?us-ascii?Q?hd1I6W1VDLHdovAnWU/ciIQP/JRBUeYhL3pkck4x7Htu39E8HVS+9v/rch7D?=
 =?us-ascii?Q?mzYooZyEajnDbsoJb0vLw/D6qivzvxP3xJHPVCB0H4p7OI4DdV6l4r3r+pJr?=
 =?us-ascii?Q?vW4CKBs6cgJN/KeR3Ike0J92bcUVYInyUxBwNGTauc7omYyi3DkXFBfp4Xae?=
 =?us-ascii?Q?I0zs7PJ6/042YZ/jZg6CsYGpS4rXZcN/lmI/J988YEnc5ggybbYLjFjr6IG+?=
 =?us-ascii?Q?D44Rb3Yvl7qrgoCT67B1IwoZdTiK8wjczZpEjj/ClU00DMRiR4yvoyeABw7Q?=
 =?us-ascii?Q?TCvQVjR2077QuI01uNqXy+Sq4qKJRr7JlI471obOp4yFgVA847GjoZZffRT9?=
 =?us-ascii?Q?CNMKF4nvUidt0+khHABD/HJIAVnFcXvWKX94Ks6LzDtWtbBLrkgOm871nWAe?=
 =?us-ascii?Q?owt5XFlTzF9bXi5uCnIoTBJCreBgNmM1mj+8MygXlfGL8XYO/E0Kn+fjCu43?=
 =?us-ascii?Q?/6KMckDFucE8BI5yQuHsWIbs2fIEAxAFC2YL4hLHxX573bH4l+SEfJIxeUJT?=
 =?us-ascii?Q?oy9Q4yOtJcD31e3iOOpZspXEjLcMsbQk7nZ8OGQMggH3Ptmphr/8I1+KWGmh?=
 =?us-ascii?Q?mnH7WCnG6AnsGDzdtiBaGPBfJl5mk4vHt4/66FWwh6zcM0aFXOKD/URiHDwM?=
 =?us-ascii?Q?Z1d7tudfaNatWHAsXG/TweAtcFmZOJT8xHwga9T2DFhuWXOQgKtloewzKhMj?=
 =?us-ascii?Q?3qiDfRbPgmnsRI4NzCxRNA1uOc97b3hAY0aLEt4gDol6qtk7yPIorZiF22kx?=
 =?us-ascii?Q?CyhGOXtnGWt2dWVhxwkAC1/WHKM2/ICvWuzhv8paKA/IILbI2w31soyrTP2R?=
 =?us-ascii?Q?ubPDtcrCZV0ITQQGLFdDXewGbkq2RTE79ONJQd2q4Mo9uiLFrdMR5yUp4dyY?=
 =?us-ascii?Q?gOvf55O0evzA2vkVywUr1VJ7jLrLt+PDJ1FbFtxv03V9QxpWvsvTW03kvCtF?=
 =?us-ascii?Q?rx/sxidXMxTbUu1sVxHGIILYA9wX9LOitykQ/RfCjyVM/YKPec+FfyBmySlw?=
 =?us-ascii?Q?pVZZ3+lR5aWTRn6s0soF2aVN2gUJWhUqAxAPZZuhUI7cVUoKNAXZOP5/u+i2?=
 =?us-ascii?Q?v34rihANPa8i92OVbhHoepp6SgqhYH9UL+c6KsoQ9t3FwmQjN6kBsWiIwMv2?=
 =?us-ascii?Q?MDe9Q4Vo4pf5gDNFHLM6eitnV5mSJsvTG8msItBgl34DFET21LoyAvMETKp4?=
 =?us-ascii?Q?DMB2jDt6c6zi40IGSFzQv51zf3r9JGnVkbfD1lNW9MAc1v5IhkDLdAYbX8ZA?=
 =?us-ascii?Q?Y8lRW55Le0Uxt8l3UdVcxtVIkvt2Iwktg0ED9ptZxSAO9/3xZ37MDUoq1DQP?=
 =?us-ascii?Q?908I5ZUbZOCHiKRI+NzKpofFzh2uhidTru4miZxQV+axefPDTvVCR3c4fNNF?=
 =?us-ascii?Q?zU6X2+mjz710zaKbunhdXwhUO6XYX0ub2jYWrcA2j+nGbeKLw/27ex2TZ2Ml?=
 =?us-ascii?Q?KDFITrjLVhkCNYcpiGohnYe7Z/pwAqI99HC7Q70I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d07126e-e800-4b35-c486-08dafc508664
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 08:13:21.0568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7Pb7PRqr82B1CkyypQ0pNWYrYFy01zWzCu5WRFg7tB8SmHrkOgq4leMak4CYjkRzIYNl2Y52Rfgxjh6CxM0VQ==
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

Same to i.MX8mp LDB, i.MX93 LDB is controlled by mediamix blk-ctrl
through 'ldb' register and 'lvds' register.  Also, the 'ldb' clock
is required.  i.MX93 LDB supports only one LVDS channel(channel 0,
a.k.a, LVDS Channel-A in the device tree binding documentation), while
i.MX8mp LDB supports at most two.  Add i.MX93 LDB device tree binding
in the existing i.MX8mp LDB device tree binding documentation.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

