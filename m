Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14824183745
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 18:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20206E1D5;
	Thu, 12 Mar 2020 17:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387C76E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 17:20:25 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jCRVM-0006yW-Kl; Thu, 12 Mar 2020 18:20:20 +0100
Resent-Date: Thu, 12 Mar 2020 18:20:20 +0100
Resent-Message-Id: <E1jCRVM-0006yW-Kl@metis.ext.pengutronix.de>
Received: from mail-vi1eur05on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::611]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com) by
 metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92) (envelope-from
 <laurentiu.palcu@oss.nxp.com>) id 1jACQi-0001BG-RS; Fri, 06 Mar 2020
 13:50:17 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jos4/Tf0MUOqlTmULF7IQIJCU7SuyZ8ebjoK3Ya055SWmzsBRFVdjGGp63SiuE1y08GQX7OEX8e9sDos2cSpuQjGszkgEqlAcA9GF9WjF2ATODYJP5DJgjYRozVRbGrQAW7HfYDV9swHA19v5YDA05waKdXmFB2CO4o7v0TRYeyAMjCwH7wByOOL/Me5dylmfY0Nm1pXI8t9xj82ELt/rgAGs0nvq8fi4zteiaOeX7FNe+CdWdS2RFkkFVSrFSc6KnvZHWvF6DDae/+ZHwGYMIHVTgS0Uqv8gYQ+O9y1/tsDmm9bnw7zuhwrPJRSeJPfZecoYD7JFP2VqqEw3QYAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix3E4bu0H44QxA95fIit9NfljQLi+Ev4rAUBhUnS9aI=;
 b=hXEUNWhgZ1Vo+wPV6MW5/DJmuIKs4vaz3Sx55khAHRkWCE3PlN4OC5g4t9AafqvUpRrmOQzgdDtS06j/ot+n9XKyLPGHOH4oKovXwwHMrnKeiKxFBRpfn418btJN+/fyhyRuOe1zSXZ1t1uiYnYfDwIL6jtyOSSHIVygYYGbC2WQ0ZcHaxG/BEUEnUkba+hzhWbWvF3GBpAnLPJwLzbZ8GV8Q8sv672RBpC/5jBbuJbtrAtFbabX9oE83xBdLc5R/a+uQRL5SSOgF1NS7HdfMfDKqpE1yh7NMup5WODiG8G7Pi51LOQJY6XhACYIuLz9CloyR0M1xhLJCi3TaUmPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NXP1.onmicrosoft.com; s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix3E4bu0H44QxA95fIit9NfljQLi+Ev4rAUBhUnS9aI=;
 b=MYOK9AbuWs/+EF1W0B8iP5v0Q6lkEpBQypCkjzwoaUKqQeLk59m8X6fZhchHG3T+v7RZkHaPvHO7fszpgzs0wdOj1N4V/h98Tzuiuq1RWpCpEBiApMqmaGC+TfOXatG8YkyzREugTQX3Q0NSEw3YNxTc5lx/S2ax+ZiNI395aYY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@oss.nxp.com; 
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com (20.178.126.145) by
 VI1PR04MB6846.eurprd04.prod.outlook.com (52.133.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
 id 15.20.2793.16; Fri, 6 Mar 2020 12:50:10 +0000
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1]) by VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1%3]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 12:50:10 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Message-Id: <20200306124930.20978-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306124930.20978-1-laurentiu.palcu@oss.nxp.com>
References: <20200306124930.20978-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR01CA0096.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::37) To VI1PR04MB5775.eurprd04.prod.outlook.com
 (2603:10a6:803:e2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (89.37.124.34) by
 AM0PR01CA0096.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Fri, 6 Mar 2020 12:50:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0768f89f-3aa9-4497-04c6-08d7c1cce7e6
X-MS-TrafficTypeDiagnostic: VI1PR04MB6846:|VI1PR04MB6846:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6846171D540165AAE62E3DA1BEE30@VI1PR04MB6846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(189003)(199004)(81166006)(8936002)(81156014)(186003)(110136005)(8676002)(2906002)(44832011)(26005)(2616005)(956004)(4326008)(16526019)(7416002)(6506007)(1076003)(52116002)(6666004)(86362001)(66946007)(6512007)(6486002)(5660300002)(478600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6846;
 H:VI1PR04MB5775.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkoXplclIruMWHcG1/f1yi9AcHknNOLcX/kC5rO+7BBvB4qYUbkdYFi7v/HP5e6a/TA0j1XXX+EMK/9jcV98pWKchrtr/3lY392nGmEE3VTYLYrrkDfdU7td8ltXWm3oq0CKTQhWogBPJcTDNf6YERnVmS5sUELFV/6M5xuWifmPFy4MdatTs066VdEI+ogiLZmamVcJcQkHRM84OyuhhoaILloFccdFU44B11FhbOLBqvwJg01SENVqciSicFS3bmGY+WdappqRiv1YazZvHqUNqQkEsN5k2ZCUZWTtCsn1sdAx9DfU/o5yFBzMnVt0rTqToCwmy8I4kPL0fJ50ZbcRNS7NF6P+Py6fK+/3FZdwILr/Zf/6OXz11ykISeSk3cEHPP1IEPn6ukjG8Sjajtgaquzvv1+MUgTQYcdQp7SEl+vUv+xkDKNHiA4R7yifQ2yp7oA4mW1unPZRdfPIEyiYpxcCKKAP46elS4iRj+xcAqGYps7nxxxN/nrqshq0hrI9pEXKOYN+BK6eh524NQ==
X-MS-Exchange-AntiSpam-MessageData: 7zX0eRmMRqmc/aHpz8MPXlox3FvAX5XnlWTko59rXhlev1HXKkx/IXL+2OHgcgAJ03Gxy9gJct89ZNDTdM225s7IdJEBqx/f9jW3wQgAJcI8z6T76h++oRhies1qfiS4JWl6k3wCe7Ug7ldrQYfnkQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0768f89f-3aa9-4497-04c6-08d7c1cce7e6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 12:50:10.6773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tb8mBK2TpTF3UVyQ200+znoR02NpMcMi3e1ExAaKw26Yv4e2kCOxQWaGZSnWr9kdiJbMbkNKKf6Thddxh/BpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=4.0 tests=AWL,BAYES_00,DKIM_SIGNED,
 DKIM_VALID,FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,
 T_SPF_PERMERROR autolearn=no autolearn_force=no version=3.4.2
X-PTX-Original-Recipient: l.stach@pengutronix.de
X-PTX-Original-Recipient: lst@pengutronix.de
Subject: [PATCH v4 3/4] dt-bindings: display: imx: add bindings for DCSS
Resent-From: Lucas Stach <l.stach@pengutronix.de>
Resent-To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Resent-Cc: l.stach@pengutronix.de, lukas@mntmn.com, agx@sigxcpu.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 laurentiu.palcu@oss.nxp.com, devicetree@vger.kernel.org
Date: Thu, 12 Mar 2020 18:20:17 +0100
User-Agent: Evolution 3.30.5-1.1 
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Add bindings for iMX8MQ Display Controller Subsystem.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
new file mode 100644
index 000000000000..fde6ec8cb0c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 NXP
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: iMX8MQ Display Controller Subsystem (DCSS)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
+
+description:
+
+  The DCSS (display controller sub system) is used to source up to three
+  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
+  2.2) or MIPI-DSI. The DCSS is intended to support up to 4kp60 displays. HDR10
+  image processing capabilities are included to provide a solution capable of
+  driving next generation high dynamic range displays.
+
+properties:
+  compatible:
+    const: nxp,imx8mq-dcss
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 3
+    items:
+      - description: Context loader completion and error interrupt
+      - description: DTG interrupt used to signal context loader trigger time
+      - description: DTG interrupt for Vblank
+
+  interrupt-names:
+    maxItems: 3
+    items:
+      - const: ctxld
+      - const: ctxld_kick
+      - const: vblank
+
+  clocks:
+    maxItems: 5
+    items:
+      - description: Display APB clock for all peripheral PIO access interfaces
+      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
+      - description: RTRAM clock
+      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
+      - description: DTRC clock, needed by video decompressor
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: rtrm
+      - const: pix
+      - const: dtrc
+
+  port:
+    type: object
+    description:
+      A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
+
+examples:
+  - |
+    dcss: display-controller@32e00000 {
+        compatible = "nxp,imx8mq-dcss";
+        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+        interrupts = <6>, <8>, <9>;
+        interrupt-names = "ctxld", "ctxld_kick", "vblank";
+        interrupt-parent = <&irqsteer>;
+        clocks = <&clk 248>, <&clk 247>, <&clk 249>,
+                 <&clk 254>,<&clk 122>;
+        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+        assigned-clocks = <&clk 107>, <&clk 109>, <&clk 266>;
+        assigned-clock-parents = <&clk 78>, <&clk 78>, <&clk 3>;
+        assigned-clock-rates = <800000000>,
+                               <400000000>;
+        port {
+            dcss_out: endpoint {
+                remote-endpoint = <&hdmi_in>;
+            };
+        };
+    };
+
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
