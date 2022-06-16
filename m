Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C469C54E330
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB824113A0B;
	Thu, 16 Jun 2022 14:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007071138B1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQAEtC6L5yj3AiL3RCGruqP2kC3+aLhDXQHvTndLkIrRIYlsmH44mq6oIQ59ClUEU8eSeoynOwS1bJZWAmUA8f5BWtya6FIVCzCeI2uh116b4nuF23MDzldifiML3g/I92dLcyADJKDGjHJpAtue/eUXitOrrCvBTWw5EJ4XCCXLqsF9WekvbUQvc5eCQSYMYm7H0krg9V+XuQWvB6cMUU7WpvTBYKpYKZ8c9g35IZhq2peZcIwSGdy9FqTNOUcTj3aeaho53ii0Gf+89fub8k9n0RH1LAL58v3MQKmSUYVVCA31syV49VLgxVL4/v9lucBmRugYhyj8vSftF4dqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC/d0p2s5TbCcSH9eKQHbvAt+a4ibcqDV5PI7wby9BQ=;
 b=lWPFPOkQEfw+4sz1b5UWGAOfpvkydPWmew/knrFBzfAx9M0jWsqu861TUJ7ApOwTGyCdrVz1I5Hw4VtpaB+yE5g1sPxt1Kju6mytz+P4FWXgf5bdSTiHYiwV7ul5w7sPhOZSYBCieoEEzwul4sp9A7sUjhvUCjt3CfhfruXK9EU5Y1OqhVXkJR764tNa8sgHp/FaauJ1chqcws0vX1/PSa6fg++RJ0OGpvulz+sYPlcHfncJqXIHblobYh7t0hsznj3DLs5MiicNMZov4i/0TknY4vwoMWD/vZZayPtS6XtWwJbhU+KoxVyD/H2u8b7TO7+yQ0i2oQVArHWUQA9OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC/d0p2s5TbCcSH9eKQHbvAt+a4ibcqDV5PI7wby9BQ=;
 b=Plqo5RobXoJ14j+pf6visXV/oAQVkNSTDdxIVRMobuVUeT34t4r02p8+GX34bGHIe5M0rFsm+72OOFa4RHTJh1q/q5W/0bkoT/tPfsarDTRxI+5l4dHAbLergp+IYdGGB4lD4CM0p+UxlwZL8ssuA+K39PWj20lzlXq97UCBue0=
Received: from BN6PR19CA0072.namprd19.prod.outlook.com (2603:10b6:404:e3::34)
 by SJ0PR02MB7519.namprd02.prod.outlook.com (2603:10b6:a03:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 16 Jun
 2022 14:17:55 +0000
Received: from BN1NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:e3:cafe::d7) by BN6PR19CA0072.outlook.office365.com
 (2603:10b6:404:e3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Thu, 16 Jun 2022 14:17:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT054.mail.protection.outlook.com (10.13.2.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 14:17:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Jun 2022 07:17:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Jun 2022 07:17:50 -0700
Envelope-to: laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org
Received: from [172.23.135.119] (port=58106 helo=xhdvgannava41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1o1qJg-000507-HJ; Thu, 16 Jun 2022 07:17:50 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: <laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH V2 1/2] dt-bindings: display: xlnx: Add DSI 2.0 Tx subsystem
 documentation
Date: Thu, 16 Jun 2022 19:47:35 +0530
Message-ID: <1655389056-37044-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
References: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbed6360-0e93-4720-dcb4-08da4fa3019c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7519:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB75194FC533B632C6C4C9E737B1AC9@SJ0PR02MB7519.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/w/jF1cTS9DW30G22xjmpP3WJimNue0lv5vSy0teEhIkdm1GR7k60Hkxyf5LMEugdty4knCY87+20BX3w8/0WpQzix0GbuHdVS9MoFs7v7bpEg0EhIcDShBMUYApx97TNhO4I4r+0XCagn8U0kFnYHcfzbUu2Ie/0h/LG1yjZhFRYW/a9k+7ROuU4mJsvdGnn4YwmRe1ZQ3bY3t7tJVD4c1OAqSxVRXeJJk1vJbRXKpcwciwnYTQypwMUt4bDtojDjN7lTIW/XZKfzjFwWnGcyK5LNsLpqlo954xgPYn5AR21j8auFr2Wb5M26qdit3kHjM+nm+T6w1qpY3q+R3MsnARJqrM9T2IrJvyh3rxz+YcGZlyo/TQ7tVkxkjSpH4+putoCH/ddur096c/oA9rwu5sRL6NkpaVtNU3gGMdLCfdOzSTsPbBHFh8AqPfSG6e3BALmO7eOdttUpJJgYXAj83mW6J7lXQoPCldVsjYuGFx45n76HK0ki3EOzkcxbRn9IBHq21IN++rvdSEPia5RLT7r8jLlgRtHyIaBQDo91mPs8vLkFUlc/se3LyJ37FoUaASvvrpKacvN/wu4CawvdFdd83OxWHrP/wsHQlQ/tWY1z2sTXW9pBA/QWdKCQyYy5f2wXz3dxySUk4ROzlDHCwGQONqZMsMEIjVkBGi0fBqOGqQlE/0pkUZSCmWUng6UqU3aLZis+oztOTzpCFMeb2R7F3LEHngM7dBbqGIqX7RmR5CBS5qw8NsWFR2HwjgNa2Dcwt9LNTC8OS9T3JOk2ITRqI9sMJA71ek2O7OttllwBlsg+pqiA5/leC0OVSCQxGIzvb4EHh2eVx5/WAeg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(82310400005)(336012)(83380400001)(47076005)(186003)(40460700003)(2906002)(426003)(107886003)(36756003)(316002)(70586007)(5660300002)(36860700001)(70206006)(7696005)(8676002)(4326008)(54906003)(2616005)(26005)(966005)(508600001)(356005)(6666004)(110136005)(9786002)(7636003)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 14:17:55.0104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbed6360-0e93-4720-dcb4-08da4fa3019c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7519
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds dt binding for Xilinx DSI-TX subsystem.

The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
implements the Mobile Industry Processor Interface (MIPI) based display
interface. It supports the interface with the programmable logic (FPGA).

Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
---
 .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
new file mode 100644
index 0000000..644934d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx DSI Transmitter subsystem Device Tree Bindings
+
+maintainers:
+  - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
+
+description: |
+  The Xilinx DSI Transmitter Subsystem implements the Mobile Industry
+  Processor Interface based display interface. It supports the interface
+  with the programmable logic (FPGA).
+
+  For more details refer to PG238 Xilinx MIPI DSI-V2.0 Tx Subsystem.
+
+properties:
+  compatible:
+    const: xlnx,dsi-tx-v2.0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI Lite CPU clock
+      - description: D-PHY clock
+
+  clock-names:
+    items:
+      - const: s_axis_aclk
+      - const: dphy_clk_200M
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          This port should be the input endpoint.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          This port should be the output endpoint.
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi0: dsi_tx@80020000 {
+        compatible = "xlnx,dsi-tx-v2.0";
+        reg = <0x80020000 0x20000>;
+        clocks = <&misc_clk_0>, <&misc_clk_1>;
+        clock-names = "s_axis_aclk", "dphy_clk_200M";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                    reg = <0>;
+                    mipi_dsi_in: endpoint {
+                        remote-endpoint = <&pl_disp>;
+                    };
+              };
+
+              port@1 {
+                    reg = <1>;
+                    mipi_dsi_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+              };
+        };
+
+        panel@0 {
+              compatible = "auo,b101uan01";
+              reg = <0>;
+              port {
+                    panel_in: endpoint {
+                        remote-endpoint = <&mipi_dsi_out>;
+                    };
+              };
+        };
+    };
+
+...
--
1.8.3.1

