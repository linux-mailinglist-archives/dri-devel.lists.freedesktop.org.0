Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D163716BC55
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2BE6EA30;
	Tue, 25 Feb 2020 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2117.outbound.protection.outlook.com [40.107.220.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF50B6E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 06:14:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJtojjrVydTcoGTBYika9pJO+H0dqyN7JMRQRXoMiwKH/rWcfIlRr4xC/3DzBUWpZbKwv2qdvdPXQVmaO9SkHEIlOB3N69q3Xmzj6U4oNkpFKDNpYyd18JUBsQnarBO8Odmps/FnL8ycdy2FA+IH3RsiO/YZ9KJ4qZp433kCoRjFgKL3wjSscisz4EiXVNT+Ei2qjHtuZiiXn2NrUB9uLR7QX9zqDf/qbEZJhfsNzqdQYDauTd9YHsSDUnc4bFCDXSVm8N7VMOtLLxh2+wPGFbLR+RmiVSR60O4ZDk24BqAWeMHtd9TwnpFvNbn9x8/zFGFAxEMkywxfRs4OhFf14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3dfc4ziFptkt/bkpbGubhkAqjkBfgj2Sy9MOVNPYkU=;
 b=KaKpnl3Legd1REPbraxni4OH8gG5vLVLzhaJbBKBs4s9P/7ZdX9PF+wIbuAMezlTxdtusQIr2jvbn3XtL2N14Z8ibSiqFghvz7hZhqbeJkOQbJk/PAC+3O9BY6na9d3RfvfljEpONGUtg1G7XCN2Otw9hJpsaBDtwy9LsaJ7KZZK2puIIpJ204+7JysBM3dpq8CR2mJMDwH7ldqvajRPE/Yy+EhUFKebLmiNyEm96Za51J0x+p4G81U2uo+3ZPx8E3OyJENnHT6EyV0VrZWRA3WWQv8v8FGKJan+oI1/q3XcKO2KmEGNdOsFBiIgXZyI7oz/oLmVqR5HvUciHA/HpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3dfc4ziFptkt/bkpbGubhkAqjkBfgj2Sy9MOVNPYkU=;
 b=kdhjfoSvptR4pUyqmdjCfoj90DnruFdSSsnPU+7kksi8Fpii85fHKMqzXkiMy2N1+HAItq2QaEaoSXAIJxC+3WzkF6Srhv+QkKkZUh1LXz1KRJRO8gFJh9+YQQAfJzBQJOJVN3SPl1X0Tt2qb+ptP21nxSMkf603Bwbt+4QHjuk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (2603:10b6:805:a5::18)
 by SN6PR04MB5232.namprd04.prod.outlook.com (2603:10b6:805:f3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Tue, 25 Feb
 2020 06:14:14 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 06:14:13 +0000
Date: Tue, 25 Feb 2020 14:14:03 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Message-ID: <67ccead807b7d0a50df479cab2c9d325041224bc.1582529411.git.xji@analogixsemi.com>
References: <cover.1582529411.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1582529411.git.xji@analogixsemi.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a5::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:202:2e::14) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 06:14:12 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8754c43c-5145-4e67-8994-08d7b9b9ef7f
X-MS-TrafficTypeDiagnostic: SN6PR04MB5232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR04MB52328C69BDA29C727ADA7011C7ED0@SN6PR04MB5232.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(39840400004)(136003)(366004)(346002)(396003)(376002)(199004)(189003)(478600001)(4326008)(66556008)(66476007)(36756003)(26005)(16526019)(66946007)(81156014)(81166006)(8676002)(5660300002)(186003)(8936002)(86362001)(2906002)(54906003)(110136005)(316002)(7416002)(6496006)(2616005)(52116002)(956004)(107886003)(6666004)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5232;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzEhxeIQW4KU8rjYqSR1kj4LGCyHW2alHOy7idN+IS3pQYAmvuOsQY0oGBAST27ltuoaibukekhfzpfZx7srhrCtBcVf0coZW0WYLDRjGYsJhrgOrUbXNFu7nR/3Uqtf6MIf71fEEcblqPCi8PxyBJZkijdKxctc/tP4FtgNidRpimW5IHMDcrdo390kQ9JSc5oYjAFBciC6P1/B6qTvd7RBxV+cjUYDf7vuzebSD8k9V+3TsAxEXpYMnEwXNmPkMFYWmagowoIQqPe0tfXKcyKLqpRrbOTKeMjB+AzSMSqE8vLFAOJ+NnFuPrjeha6At0QIMoaRt7lPiGzGGOXxP/f/GF2xnoNOv587q3KgYfnt6ZiLC1Eo4iGNAGMKpU1REO8J1cwtMThAl/uXaltUYg3Vytwb3eo9BvCmLWQKriF4z845a7xVCGx5f2k93y4rWS0A91lof3T826tWJmcKrEzD0oS/dUSNHz/TH3Ux27kQHYSDk1fh9kPWxJR3d4OM1zsvNHzpjGtdZJbjmy1qxA==
X-MS-Exchange-AntiSpam-MessageData: MV7+wGzHkeA+41xbBDVNo2cmBjQIVvYWqXo+yWZqcSUpupuG9aL0XQnaWUnVQ9/zTLtDjju8XMJIyqrDf757UY3rYk3JDapiUv6qjFmehVwLTZb5ofcKmjK4htQ+K7CfWUhMyZ2L3Wc1GwMMFgnI0Q==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8754c43c-5145-4e67-8994-08d7b9b9ef7f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 06:14:13.7893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2qCkZTzhI4w1v54hJ4MY2BIC/3kXcyVR/OsThaSxkVokJThRJgGm5xevBjtPboW64cooOzH4EbZbniMrvmStA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5232
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
for portable device. It converts MIPI to DisplayPort 1.3 4K.

You can add support to your board with binding.

Example:
	anx7625_bridge: encoder@58 {
		compatible = "analogix,anx7625";
		reg = <0x58>;
		status = "okay";
		panel-flags = <1>;
		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
		  reg = <0>;
		  anx_1_in: endpoint {
		    remote-endpoint = <&mipi_dsi>;
		  };
		};

		port@2 {
		  reg = <2>;
		  anx_1_out: endpoint {
		    remote-endpoint = <&panel_in>;
		  };
		};
	};

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../bindings/display/bridge/anx7625.yaml           | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
new file mode 100644
index 0000000..1149ebb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/anx7625.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Analogix Semiconductor, Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/bridge/anx7625.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analogix ANX7625 SlimPort (4K Mobile HD Transmitter)
+
+maintainers:
+  - Xin Ji <xji@analogixsemi.com>
+
+description: |
+  The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
+  designed for portable devices.
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    items:
+      - const: analogix,anx7625
+
+  reg:
+    maxItems: 1
+
+  panel-flags:
+    description: indicate the panel is internal or external.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  enable-gpios:
+    description: used for power on chip control, POWER_EN pin D2.
+    maxItems: 1
+
+  reset-gpios:
+    description: used for reset chip control, RESET_N pin B7.
+    maxItems: 1
+
+  port@0:
+    type: object
+    description:
+      A port node pointing to MIPI DSI host port node.
+
+  port@1:
+    type: object
+    description:
+      A port node pointing to MIPI DPI host port node.
+
+  port@2:
+    type: object
+    description:
+      A port node pointing to panel port node.
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+  - port@0
+  - port@2
+
+example:
+  - |
+    anx7625_bridge: encoder@58 {
+        compatible = "analogix,anx7625";
+        reg = <0x58>;
+        status = "okay";
+        panel-flags = <1>;
+        enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          anx_1_in: endpoint {
+            remote-endpoint = <&mipi_dsi>;
+          };
+        };
+
+        port@2 {
+          reg = <2>;
+          anx_1_out: endpoint {
+            remote-endpoint = <&panel_in>;
+          };
+        };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
