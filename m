Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A617BD3C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 13:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE9C6ED0A;
	Fri,  6 Mar 2020 12:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666546ED05
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 12:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUMV1eIOgxjVroKTRWhkToeni0X/WVMawgGWZYFvzgWM7EG7viK8Q2HdGriJTE7jgatpBMAkzWuI8ghnPDLYGSJFonK7ifCFMV3qj6JY1P1xS/pCJl6sMbGBYkXdjWuSAI3LU/WgarrSu1+a50SQW6et8UVY6D67dki9+whap+CGC2At0/bXvn+/VsyJkhIjCty8EbVbLuEqWSBAbQnNQnp761PcLjpQ4qkiVsfKrknAJanYBeiKR4FDjXAChijeOdy6cBwuSHy+BqMZYC0d4jeUHPhd1xJRdFL+HgNxb5QgnE77V2BERcwcC7YyoxQsj39sy/yGjlXGKNGMch9ahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkwlNNOMPFa9ADvxvtl8h3gM+fiOyJbMzybC7zPmHwI=;
 b=FM6YkuXI40hhJbcJ75Ws+BMznkkAOZNg78ptRPG0k/Hl5Zxl9pjT4U6q3S4+z3uuEuVrhKYKSH/QsYi9KwhjO+bDO+aPaaLIBCt723YOjTp210ESSxBurM0ECQovFDiX1ZV8+cs00pRfhXsBfKT06Kpg5YnZCwGS8ArN9x98oKpT4zY6EQdJ2D95TsgUlNaf6ZSBq4V8B9bwUDH+mx8ecQtG4V24vmXKkQaQdQcmzSXoLWx7wYx26yBFF3+fNGGybL20JU9HP/U7+RFyM3jzsdn4GsdXx1Z3tp0KeFAliL+4qg8kCp2MtH9laBMlbgpOONeWR6Iw5i1vAe8Hy0aPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkwlNNOMPFa9ADvxvtl8h3gM+fiOyJbMzybC7zPmHwI=;
 b=cBLX5pjMa7Ro06I1Xcx0T2Uo5WIZjD5Cve0JyAXLcT/LQ2McZxGRG/U5HkUn4pJWhtye5VPs+7OZwxsR609xGGxil1CzTE9cbsNsW1l5m5aWo4HwQhqAF3uWGFbkzUX1FXBqBh9iH7WZSk2I4USAxfMGcb7oDRzB2+t7Iim+R+Y=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@oss.nxp.com; 
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com (20.178.126.145) by
 VI1PR04MB6846.eurprd04.prod.outlook.com (52.133.244.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Fri, 6 Mar 2020 12:50:12 +0000
Received: from VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1]) by VI1PR04MB5775.eurprd04.prod.outlook.com
 ([fe80::8542:a5b7:a83:6ff1%3]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 12:50:12 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v4 4/4] arm64: dts: imx8mq: add DCSS node
Date: Fri,  6 Mar 2020 14:49:28 +0200
Message-Id: <20200306124930.20978-5-laurentiu.palcu@oss.nxp.com>
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
 Transport; Fri, 6 Mar 2020 12:50:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3352042-1647-48c1-d830-08d7c1cce8b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6846:|VI1PR04MB6846:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB68465F81B3CDE4B5BD51B180BEE30@VI1PR04MB6846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(189003)(199004)(81166006)(8936002)(81156014)(186003)(110136005)(8676002)(2906002)(44832011)(26005)(2616005)(956004)(4326008)(16526019)(6506007)(1076003)(52116002)(6666004)(86362001)(66946007)(6512007)(6486002)(5660300002)(478600001)(316002)(66556008)(66476007)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6846;
 H:VI1PR04MB5775.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfgVl7MT3y1lFqbJgPBCjtrNsfoIdmTSA8XwTgIzycU6rVKrlKhN9+OtooUa6YVM5tdNUxpmCuV9JphrilOyVDgqiXcdp2IMEpa/yRs/OW3YlC4c0vUpajhq4EpnhIF0pFr8z4hma7WFdhWSXQSqTebbhOd6Eszs2QjJy2AyV61AkDxk7gANINDC1ui5MZLksD8Kgq3nsk2IpdxSsysK+MM190KOfDYEZyV601DBa703ZnuFxKVfNpcem9HUU1Q4rotYEbFwlgFRWnbGxOAWYQwu1IDnu5lyYxpFlpVDLqRLMK1am4dd1dNy8JI0OYly9kvBK5YmYVzrY887XgXx2tmLIs1Vy5OM9ETD91/G/GP6aE1ZUCgiOZ9KF8+nyRjqoEwk/SNVxQXVzDXTN46JcTqIwkRRXXouqCqiFi4CKEn2GxSyKxJLaDw1ii+bGFKT2BoMYx78NTesiOkA68Oqb1HIVwELlqZRcnkXRyU5FuYdw+ug2EhWPbc0HdQgRUBY
X-MS-Exchange-AntiSpam-MessageData: dFdIWRisBKFAQPVwEfE2ZIk8jKmABdqPTm6JUb2Z+nTnjuY8pfF0vftux2Gyf16af775RCv24CxtxaoPAFVgmGncJ5fAB6S09guVv0A6SPxGbTJjEpw2h8hmH94gfvelTXbrDaZ+wp1HciLhLNT96g==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3352042-1647-48c1-d830-08d7c1cce8b0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 12:50:11.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAch1jsA0/13ZPvfpk+mY+XINKnM3IrYFcgvCz2afV+Q6Fi8csBb+TQQTcVFM0zNQt/YZf13KaDv1hxwpFnkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6846
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

This patch adds the node for iMX8MQ Display Controller Subsystem.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a1e83922c71..e04d8bbae6e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1028,6 +1028,29 @@
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				interrupt-parent = <&irqsteer>;
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
