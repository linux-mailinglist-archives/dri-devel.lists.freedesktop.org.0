Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D256D1B1843
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 23:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C196E853;
	Mon, 20 Apr 2020 21:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4036E853
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP9AztaoUCen8N9Y1mAxp78UZHPg0SHwDTZMY7Vduc24q5SpxQNzLaXklUolrg/wSUKXLp4qbPaQd1KD/FadmUfnIsAS6lqBV+zak2GD1x+gQErseXgG9P3avq7HS9/LjghHgJ+pgt4RYNMALZZggIcZk8UiOgqA7btw/Do7mqafY4JltFqT/L/nidLbbHIEiaN0D2MEBt1hnY+5ObQPUe0ZJ7hP89LxPT01o50AEvtRKmEMQu5NWjOucJ0Q7lrWh4mdDaYM1VXjkTwfFAlmNSR0aV7BgxpLPABBPGNs5iknxnBf4ZHB/OI0GJWvNPfJYVQH5VX6GwYzh/IjTDOWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OltIbxtNDPxZ05hF2m9dR1Ya7nwmP4ZbGr9OPyIAE0I=;
 b=UagPlFD+qJJRIjgV0NYh651A653kedrbyszyVN+tH0r3TqdhuH/D7XLacwAbWDwOEWAAyn3oe7JCMXaJ2JArAnwVcpMq+tuYBldtODW6XlxGMXNe2CUjyIQopM+o7lewHJY+1T5f3rPvsGQl8bfwQRtwhS57edmAfds0jCsvWpJBpnPILjxN3YIZv1S/OuDJFRTGBK/R73a/Ix0v2ybAeT9taTQ6Tr4eQkzKg6t5OtXXYh6aUUpXnei4wXw+BgKkvvnUDrS8RJ8qxZ/2NHXojIA2tKG3u4OQUwzeaw+OFTGERqTyVfuAJaL5oEo1t6/ESEAuegogeWabuyIhwNfnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OltIbxtNDPxZ05hF2m9dR1Ya7nwmP4ZbGr9OPyIAE0I=;
 b=qSqtEXm2At8QObZNkWhtax93Oc3fBHbq4r3wxx9dbwmRmXPndug5jM0lBZ8nTY01eE21PnvSqykXfi3+B1CIoWvrVdWQ++LOVmIImTTNZy1cys5ZNbn7a/NldEuXqD4yPSBmt5WH58xc+VWm0tgeGXymWQoGitbJuA9xHyZfa5k=
Received: from CY4PR15CA0012.namprd15.prod.outlook.com (2603:10b6:910:14::22)
 by DM6PR02MB6361.namprd02.prod.outlook.com (2603:10b6:5:1fd::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 21:21:13 +0000
Received: from CY1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::3b) by CY4PR15CA0012.outlook.office365.com
 (2603:10b6:910:14::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Mon, 20 Apr 2020 21:21:13 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT010.mail.protection.outlook.com (10.152.75.50) with Microsoft SMTP
 Server id 15.20.2921.25 via Frontend Transport; Mon, 20 Apr 2020 21:21:12
 +0000
Received: from [149.199.38.66] (port=60257 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdpt-0007rg-6z; Mon, 20 Apr 2020 14:20:13 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdqq-0003Iv-7L; Mon, 20 Apr 2020 14:21:12 -0700
Received: from [172.23.62.221] (helo=xhdrdevl201.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1jQdqj-0003FI-Sk; Mon, 20 Apr 2020 14:21:06 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] dt-bindings: display: xlnx: Add Xilinx DSI TX
 subsystem bindings
Date: Tue, 21 Apr 2020 02:50:55 +0530
Message-Id: <1587417656-48078-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(8676002)(478600001)(47076004)(82740400003)(6666004)(356005)(81166007)(70206006)(70586007)(107886003)(81156014)(9786002)(2906002)(36756003)(316002)(4326008)(186003)(8936002)(426003)(7696005)(26005)(5660300002)(2616005)(336012);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eddd861-ca6d-4dcd-d595-08d7e570c084
X-MS-TrafficTypeDiagnostic: DM6PR02MB6361:
X-Microsoft-Antispam-PRVS: <DM6PR02MB63619A6A70BA131D947FB098B1D40@DM6PR02MB6361.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 03793408BA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjyM6kc0HL1+PFBAnxQ9/dcZ+V+O4uWPynD3TPpAaGobLplgf6U0q/R6c7TdjJ724UxuGpcHotoZYhRP+zTaid5zSn+cP8P8the2gGW5jzTZxxICEBB8eECkkJw5sy2cOeyOY91JeIGb4b5/T6LOJOD5lyM4wZtENbfRSjNlrafz4sqOrctT8Y6F9fwu3RbwwzGSZijEefRelZvSiyMNK0OmBY0yYPvWyXYTDuieSgOTgfZxLfziUMXy2G3h2KntrOlV5SJinqfRqN0jlkIvvA3GC2nxUro4E9JrirVWhVEfOrZXX8H80CrWrGWtyaCUnlHE1ARZOgTSQrvuM1v40LaeKS555vB98gGRho30HdMDRo+nBkfToXUsAY37h7Ux8x2253ZlGT/bNe6rSiS2zqVBZRMpm5sojvThHFWBoyySL2WufXnONhx77KNFcmCVBWqPsUwzZ6Lyw9Chw/fQDxIBfP9NVDlZUQ/v9r8JUcJXLwV3u0UfNt7S8cf8kMoF
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 21:21:12.5113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eddd861-ca6d-4dcd-d595-08d7e570c084
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6361
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
Cc: sandipk@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org, vgannava@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add a dt binding for Xilinx DSI TX subsystem.

The Xilinx MIPI DSI (Display serial interface) Transmitter Subsystem
implements the Mobile Industry Processor Interface (MIPI) based display
interface. It supports the interface with the programmable logic (FPGA).

Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
---
 .../devicetree/bindings/display/xlnx/xlnx,dsi.txt  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
new file mode 100644
index 0000000..ef69729
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.txt
@@ -0,0 +1,68 @@
+Device-Tree bindings for Xilinx MIPI DSI Tx IP core
+
+The IP core supports transmission of video data in MIPI DSI protocol.
+
+Required properties:
+ - compatible: Should be "xlnx-dsi".
+ - reg: physical base address and length of the registers set for the device.
+ - xlnx,dsi-num-lanes: Possible number of DSI lanes for the Tx controller.
+   The values should be 1, 2, 3 or 4. Based on xlnx,dsi-num-lanes and
+   line rate for the MIPI D-PHY core in Mbps, the AXI4-stream received by
+   Xilinx MIPI DSI Tx IP core adds markers as per DSI protocol and the packet
+   thus framed is convered to serial data by MIPI D-PHY core. Please refer
+   Xilinx pg238 for more details. This value should be equal to the number
+   of lanes supported by the connected DSI panel. Panel has to support this
+   value or has to be programmed to the same value that DSI Tx controller is
+   configured to.
+ - xlnx,dsi-datatype: Color format. The value should be one of "MIPI_DSI_FMT_RGB888",
+  "MIPI_DSI_FMT_RGB666", "MIPI_DSI_FMT_RGB666_PACKED" or "MIPI_DSI_FMT_RGB565".
+ - #address-cells, #size-cells: should be set respectively to <1> and <0>
+   according to DSI host bindings (see MIPI DSI bindings [1])
+ - clock-names: Must contain "s_axis_aclk" and "dphy_clk_200M" in same order as
+   clocks listed in clocks property.
+ - clocks: List of phandles to Video and 200Mhz DPHY clocks.
+ - port: Logical block can be used / connected independently with
+   external device. In the display controller port nodes, topology
+   for entire pipeline should be described using the DT bindings defined in
+   Documentation/devicetree/bindings/graph.txt.
+ - simple_panel: The subnode for connected panel. This represents the
+   DSI peripheral connected to the DSI host node. Please refer to
+   Documentation/devicetree/bindings/display/mipi-dsi-bus.txt. The
+   simple-panel driver has auo,b101uan01 panel timing parameters added along
+   with other existing panels. DSI driver derive the required Tx IP controller
+   timing values from the panel timing parameters.
+
+Required simple_panel properties:
+ - compatible: Value should be one of the panel names in
+   Documentation/devicetree/bindings/display/panel/. e.g. "auo,b101uan01".
+   For available panel compatible strings, please refer to bindings in
+   Documentation/devicetree/bindings/display/panel/
+
+Optional properties:
+ - xlnx,dsi-cmd-mode: denotes command mode enable.
+
+[1]: Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+       mipi_dsi_tx_subsystem@80000000 {
+               compatible = "xlnx,dsi";
+               reg = <0x0 0x80000000 0x0 0x10000>;
+               xlnx,dsi-num-lanes = <4>;
+               xlnx,dsi-data-type = <MIPI_DSI_FMT_RGB888>;
+               #address-cells = <1>;
+               #size-cells = <0>;
+               clock-names = "dphy_clk_200M", "s_axis_aclk";
+               clocks = <&misc_clk_0>, <&misc_clk_1>;
+               encoder_dsi_port: port@0 {
+                       reg = <0>;
+                       dsi_encoder: endpoint {
+                               remote-endpoint = <&xdsi_ep>;
+                       };
+               };
+               simple_panel: simple-panel@0 {
+                       compatible = "auo,b101uan01";
+                       reg = <0>;
+                       };
+               };
--
2.7.4

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
