Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE507524ED7
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 15:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02FF10E5DF;
	Thu, 12 May 2022 13:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F08E10E5DF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P80KE+ssCPspTHGsKlLiBInpKW+ucqCWIPvYIZYy+xkHxht2nFgcsrUioZhqjENoyvsG85DLBth8FXlcQVIjphj1oqMs/z3EWiZGCfPWmaIjNw5i0WNgrXhNiFtyDMHq9lkvL7hL/QSfjO6YufX86AQDjmt/nvkfkmEeQv5/KIkim3wU4b7LeG6OspB3+sekrTCQVNVW5vR1oZCcDeIfYji/eQZzl82vHHes/ThkTNVXuTzqu/m54Gtq6PkM47p0Vpd6t5/w7Tv4lFxDx6NTWLClRTFPuDNBJ8IX1lW9OY24fFbcjpFZiNGSubygncRk2tJg8CO1TbwqRx60JSXcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJlOAlKVAO+khFek/p1u5AyP9KwbPt0oQW09zCqbzkM=;
 b=i0aBTBB+3R/ktfeDzLDgDbHvRYuJRlDBS0eEp0xSfBR/gtCbozrDpNu8dP7a75l/noDPqMTYCk2o9Qm8eFI9ziHk3AEXRU87WmJuT5VZU72oAfFWprri6Z2zY6InnkTb177eRq2hFgixmz6On5GPd7zvzSdqdvbO0e5dLVzTz2ut5SVeb2Fes64SUaGo3e3wV8dROICj0kfW3mE3NVARt0y65fc56nTLr5stg6RhS4tkF5QEHPTV2VoT72pCNb0VksCGGuNfbkNt2uPn4ysGhD3Oi2DqjV/8qZm9JkPZJjLg8osAE7ZRNxbFhWZOrUYHVQk+iR+Be7rgJritqutPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJlOAlKVAO+khFek/p1u5AyP9KwbPt0oQW09zCqbzkM=;
 b=hw+nL2Vyq7vn0u9lXcovGjweXqIXJ7lsoJeMxGF1Dv6LgAHMR/xCcs1xDt70RNqzILaw6EargQTSK0q5EPz2s0smKJZ2MgROVoC40xEn/KI4UdcSo+RtdXhl3zupVNZWxmYBqp/BRz/Cv1ltwVhGgJmKX9+5uYbjCpyxNOw90Bg=
Received: from SN7PR18CA0020.namprd18.prod.outlook.com (2603:10b6:806:f3::14)
 by CY4PR02MB3381.namprd02.prod.outlook.com (2603:10b6:910:7d::35)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 13:53:22 +0000
Received: from SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::bf) by SN7PR18CA0020.outlook.office365.com
 (2603:10b6:806:f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 13:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0037.mail.protection.outlook.com (10.97.4.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 13:53:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 12 May 2022 06:53:21 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 12 May 2022 06:53:21 -0700
Envelope-to: laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org
Received: from [172.23.135.119] (port=39078 helo=xhdvgannava41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1np9Fo-000DP4-R1; Thu, 12 May 2022 06:53:21 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [LINUX PATCH 1/2] dt-bindings: display: xlnx: Add DSI 2.0 Tx
 subsystem documentation
Date: Thu, 12 May 2022 19:23:12 +0530
Message-ID: <1652363593-45799-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
References: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fdfee2e-e127-4a61-11de-08da341ec6e8
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB338169EEB3A426C5DA6494A8B1CB9@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJMEMYLOxsPwYTZDRKmCbWNLNj3gIl2XIXitF0aZvhnkERIhwP5a7+at+R31rwZv23OD3OxCGrMnCy7Akxm3siR//98WHF6iNP8lMd66gjjRgAaI578uD7+ZZ9ntcbAXQPHCXoNrjH3tqci6oA1PtvmlaOg/2O5b6QxkZjBz/KXFIpCErvzi5HjPGbKlfC9ZbARPv2XGPYLShPAZu1kpPCWJ40XPhSBI66k+v3NFYsKn1qAk4Os+LQ/4petAwm6UEXklX7AcckiVINkDpj7559NrZjMATlM96ksNmA2w7LiZs1pd8dQSVk0Y7l10OoFkpVCnhgxqQXIt8D1NFlP5qmfmlep3SdPgI9n+SXF6LcwVlekT+yEn00Vc4tg7G04jn0xpLhXNDZ2QIhKPl8Iqexx9yOVZXh7nK3M4KWH62tbtMqlH7iMrBGrnE/3E/OsbH602zq4j7PxS0aMx+pQ9e49I1hAWfZxvmu5I4EVoVlOQrl6QH+hlHzGY2TFQxnE1WQvv/IVXUBKLVZWkbcNSZMr5J19Uaj9GgYNSDhbV/M7pC6hYttEId0kK0eDbNHo5MYup7xrmt5uWcJb93HXk1NdoJyIQRIYAZfjJt9KQfOahN+OJIRMl/7bahb+Dxu/NNwkz8++pgsgRuaZmDQCPpfd81LIS03oXwfvsvR3xSP8VVzMl/0W3dmpnb9VcddHGzz+BiEJlw/R41foG+MBrChSm0yqUjp2sM3AsnrakEoVLFdtJJXw+9DUvrdMJb1tf6PpIquai1d781dN8co/fVHF2AS/Niz3jxjo635UELKf0yi5BHIm6J+37I9KEkPeG1RoYUmdYYpcahAULCnfpdA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(36756003)(82310400005)(8936002)(36860700001)(107886003)(9786002)(5660300002)(8676002)(70206006)(70586007)(4326008)(54906003)(83380400001)(40460700003)(186003)(966005)(110136005)(2616005)(336012)(26005)(7696005)(7636003)(316002)(47076005)(426003)(6666004)(356005)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 13:53:21.6169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdfee2e-e127-4a61-11de-08da341ec6e8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
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

This patch adds dt binding for Xilinx DSI TX subsystem.

The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
implements the Mobile Industry Processor Interface (MIPI) based display
interface. It supports the interface with the programmable logic (FPGA).

Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
---
 .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
new file mode 100644
index 0000000..8e23cf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx DSI Transmitter subsystem
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
+    description: List of clock specifiers
+    items:
+      - description: AXI Lite CPU clock
+      - description: D-phy clock
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
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port node to receive pixel data from the
+          display controller. Exactly one endpoint must be
+          specified.
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: sub-node describing the input from CRTC
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DSI output port node to the panel or the next bridge
+          in the chain
+
+required:
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
+    dsi_tx@80020000 {
+        compatible = "xlnx,dsi-tx-v2.0";
+        reg = <0x80020000 0x20000>;
+        clock-names = "s_axi_aclk", "dphy_clk_200M";
+        clocks = <&misc_clk_0>, <&misc_clk_1>;
+
+        panel@0 {
+                compatible = "auo,b101uan01";
+                reg = <0>;
+                port {
+                        panel_in: endpoint {
+                                remote-endpoint = <&mipi_dsi_out>;
+                        };
+                };
+        };
+
+        ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                        #size-cells = <0>;
+                        #address-cells = <1>;
+                        reg = <0>;
+                        mipi_dsi_in: endpoint@0 {
+                                reg = <0>;
+                                remote-endpoint = <&pl_disp_crtc>;
+                        };
+                };
+                port@1 {
+                        reg = <1>;
+                        mipi_dsi_out: endpoint {
+                                remote-endpoint = <&panel_in>;
+                        };
+                };
+        };
+    };
--
1.8.3.1

