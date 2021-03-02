Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94D32967E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 07:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5572C6E8C6;
	Tue,  2 Mar 2021 06:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7406E8C6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 06:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8rVHodh+2OIkeLoQAgSQM0urqoXogVAKCydI74WeJeB7+txpEarFUt1D3bhsQ/FxhlWEjGS8Ev3OoOxUOV5By0HNFTpMPDD16Ph4RrxXlmBbqiIQ8He/9ZJKwIyve7/j04h8gpp3pSj711oRrclfOIrbX6xjBTfodoZzKoaEhYBP/sDFEi+WdQYcdJYPWGGiM9Wd2e6FjRV6B2OGeU+Q6c6c2zJAwe3yZlfNNgdLy/kEyHuNIJRZWHPaLdr4s3sG10VL0SePg5FRU51s27nNlDvr5/3Q+WmdGJ2oE1xRtlulwUa1QuV4SQUBqgRCaqrEWMS8O9bXLW0rpgwc8zXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni8oGn9dztdE5PX7ZWhiq2bFWVAZaKGnO8SMD5dapsQ=;
 b=iJt/0bQu54EO1HrRgGhM5IcKigynuTx88Sw/D+js8+HJQfddEjAhUE665Va8wgsC3edSwZGc7F5lD29hAUiaG+rbCzD/SgZrLuFX1mWhMLlkyrn/eclJiHF5X0rzeL8/6rhus2fAtYZPouPdGMrhdqJ/a0eLU8Yeerzc6FP+o8CWzcryWitIOcV7Ad72eoXI+bKLOhhAdcwwvHHYUDMdGml7qBBcbItCqSB7khC0xq6NeuqrsvrAO7jt5gNufo1Htshqb8iBcXKDBfxLs3ktwEpFf/T8pLnbKut75rLZ0pJMY7YzS1VSod3z6Gwf/594Ord5NBI9HtQJIUxgmeGeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ni8oGn9dztdE5PX7ZWhiq2bFWVAZaKGnO8SMD5dapsQ=;
 b=MIjpUSwmmaFJPU1NbwMEsnbSdx9CoThXINcFfaaJ2Txw+rcWg2W4X2eSz6rosCi2amHw56NgP0UbE16AapzkTH+08NQSy/qR7vslJFdMaWHD42e6LQOwFYHXC+B16Z5L0+T3sGfbjlyj1M3LfSNupr15NF4kdrAfmxvPygDxekQ=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 06:46:14 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:46:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Date: Tue,  2 Mar 2021 14:33:12 +0800
Message-Id: <1614666796-19374-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
References: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0191.apcprd02.prod.outlook.com (2603:1096:201:21::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.28 via Frontend Transport; Tue, 2 Mar 2021 06:46:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d2e6ad6-0ebb-4a62-63c0-08d8dd46dfba
X-MS-TrafficTypeDiagnostic: VI1PR04MB6816:
X-MS-Exchange-MinimumUrlDomainAge: devicetree.org#4161
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6816F8E42E3CAF025B66276198999@VI1PR04MB6816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QF65qQvpvT2tuj0hLnhdHMaxU3qIkusY60DpCz3ww3j+ZN2mYlOd/rJm8m2Xiv4//BZDagRQm+EhOWCmXQY+nU7mkEG3vFPA3qJPCwxhQgoUvZjT/eKmTn/g0fJYI6nLG6ijo09lyRMgkJw0Xsuho5wt+hjLqB0bwMArWxZ9mSRBG2jzgn3wj1LRXeNDZgWWcFGGguSJqmwhixMJXeRMa0P6tJdMkJFz1t9NSJDZjiQGixkArc+P7E9KECG/o5ro5CAtQ59UGvJhC4kNeUbZpawDmbWZ1h3teY2xb1ro6caZamdIG3lzX8VHS/VETQRwq/y5EQEN3qpqz7XnUOGxlHq7wgDQTdxgzzL6+VTlia9pGGdwD3KQ5Fdp+CT1xJIFrS125Ovnen9TwP01bQ1JAYy2hAm3eyIHSm2/xDH+lLl7T9wn89vH17Wq6p5euccyu/89/9KKaqw+f29rNGe9yTUi5o+uInQyOJop6zSly+3Bycyqmx/TnwdUqQ+XrMLxdSuCmXNssKcFtz6r+UnYNS83hDt0DvZKf+vUeOjwMCMY6HAYcx4tD0lW5RGVQBw79sO70tsXpV5wrzhuo8L7Af+mgzWaHJwSGjQCupx6z/vMpHUt79OkgqMgcG/WVHcftj2eIArLhTv3mBLSRSSahWzswu8DYqU7CAR/k4HWgJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(956004)(69590400012)(66476007)(16526019)(52116002)(83380400001)(186003)(6486002)(966005)(2616005)(66946007)(7416002)(26005)(66556008)(86362001)(36756003)(8676002)(6506007)(6512007)(478600001)(4326008)(6666004)(2906002)(316002)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TDQnpdLvpd5U+B6VGltDFYPxqyPFDye10epw2yqYfnH7R+36hLMiR2e6kWxy?=
 =?us-ascii?Q?ytEaDGcytjGKM6QrOH9YPmsynAYtuni7iqDfl6JyeVk2psJqZCI4mz2+DmM3?=
 =?us-ascii?Q?Yrpl1IXNQqJesh84mbj0SSPrhttzDHDWReDxl/DGjamyF7F+vuEvOQNmZk7B?=
 =?us-ascii?Q?tE+SEgJnS/sEB9SUQ7xYDMRLv9/LxmsO8laLMULE7J/yCL5aMADN9ExB1JoQ?=
 =?us-ascii?Q?m4L+Qg3cDwsjwyQwzp42cmPZ4wngL7bQ0M2iNzqjMbXzut2htJn1c9sKnFPF?=
 =?us-ascii?Q?SVXvAqEAnU3qvfUQQNJDM3D+jKMqZqQ20K35x59PzIj4He1m7IwvPUW7/kmi?=
 =?us-ascii?Q?pjwfD7FyJ9jtrmTMSkqkfBchrp64tThfuWt4C6a1N0od5dWoGfkxutSpDss3?=
 =?us-ascii?Q?oozYyEWJshcsZFCm2U4iQUmb2NWozceRVuP1+BqbwpVsvSzADQ7iKNmsEFbr?=
 =?us-ascii?Q?CUeme7dIM7GVtMZ+ImMZyH8dyP0I6Wb5cYqM8pgcgNX23/itavIN36FkaASa?=
 =?us-ascii?Q?Y6dY6WDAGkoZ3vcdmgXNuf67S5SMKoPJ7mlL4O1uHxNDItQ+xsg6StJCZQyr?=
 =?us-ascii?Q?y1PcT+GQFezonsgEkGQ2GdnBVA7n8wlQRciKABdwzwgKnDEdlc59xFH02Pd9?=
 =?us-ascii?Q?PsvREZbdZwLoCqJZTbYcXiJXmZKrJyNXFzdAnJ4TKBUobYiXe4NbwpvtiMG+?=
 =?us-ascii?Q?9mA7JqS+QAdJcJ+gz1j0JA+gYja1CTN6Lh37Yh1Mn9QhY/9GL7Jl52raDF9J?=
 =?us-ascii?Q?T09caPSj0FJhaoFuCrkqZkTD/oRXI2s4UnQw9ygIBhwtirV3HB1dB7mIySYP?=
 =?us-ascii?Q?hJUa8RWnFgqlvsegDlEP774wE7jZ/ydaU0f0kSD5b/FmoXKV2fdTvR1gES81?=
 =?us-ascii?Q?YzhDZwS/E6aHaVBnKl0Pg2IiNOajlYj93050mt3CUxsTDyUwM4cgS9AC7dQO?=
 =?us-ascii?Q?hkjdjRaPPjiMXHQnTlejN+lvCcjSedAYRT5+M+aqYl4OTtv+qkg3txH59Pix?=
 =?us-ascii?Q?Ydfdd3Nz6At8nhOfmwgMrIPYMw8gcKcUcn+ozqQTOM6V2pH3RLswLFkRLA3q?=
 =?us-ascii?Q?8vnvmAqiuJdVOHEtnNk7vhu7F5H5tv24Z3gIfMhMAkxMLC8CTUHx/WN8V8X8?=
 =?us-ascii?Q?3gjN2EN5KOQlm+XaA72PSPmzP5L9ullVhTMXUsO9a0a9/6oY7n5HLegX3Tny?=
 =?us-ascii?Q?QMHSvoDY1ziSJhj6TkjS+6rmrQkA3+KlwVd/RPyV3PP8MRH+UiQyEuUW7fqI?=
 =?us-ascii?Q?Wo22ab8WgjpA36llIYpc4eeuo92Dn3/fdj0HkMNFQ3NqEu9oIyziT5ZRKCEH?=
 =?us-ascii?Q?4vdvw8KXqDw+EyuXPss76cN7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2e6ad6-0ebb-4a62-63c0-08d8dd46dfba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:46:14.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1YT02hvGqpqyxUIwkKO4Z7FtGL1gGLDm7w+lgztD4/ejv3l6oURJ1e4qodhdEUP1YTDup1RdGIrILifQV3hBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* Improve compatible property by using enum instead of oneOf+const. (Rob)
* Add Rob's R-b tag.

v2->v3:
* No change.

v1->v2:
* Use new dt binding way to add clocks in the example.

 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 00000000..3ff46e0
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
