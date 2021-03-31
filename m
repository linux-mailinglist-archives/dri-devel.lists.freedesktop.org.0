Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36134F928
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9196E9F5;
	Wed, 31 Mar 2021 06:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8AA6E9F5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkX0IsNmXln9m+KUWZUED1qGae6lbw90KHwC+YX3lM5fc2RHnv7GR+ybCS0of9u2za9lFyPXvcr/VSRnBhe8qs/F0mvOFSbs0WSxyXjDcH53lO6u75aeFFgie/1jM9mu86VIb9NOqnhye0ujDloPxO+cFXTwUECU57WY+KqJuvrJswN2C+LOOrAFD5xUCDIFmm4IgB0E70OBTw2OBghHdOEeSD4RjA4qks9tD1U7XRL5xtt7I+5NptAhFCJI8ywUFpViHpImfKGkbDymQPHQ2anjnhWcMlbt9/eZ5rwBXrm1Jq/pfgTOAohp7JNzk/XewV/TtOhfOoSMhlIlljCYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuWwNrXQyIlnasUYMuYSUXt1x8OcmCYh/KNfGQpJtgQ=;
 b=DSNJBXN8Fg//JxZpLYEOM7VvQ8LO7n0b1+BX9xV9NasrCB2JZf4hs7CN1E9KX4p8ocdk+QavtvtCWQQICundT8RDFUMZvrkAai9DFGeNGL0k0BNVyre/Bhm8EnhYF59s93cDF+avUc4/p9z7rsyojZ83SwAI46Pu2Ezcr7M9g4ibuohoK4CyRUNSgK+JKwxaTnk0f8w8EnWzsnK4jCiHQDS9rGw3oOdpc1J7CIO2u1b/w2K9T4SjmoVJT2c52Kmw6rX4WEenmCTvgIBd3HXyfhk6iTZSyw36Cp08lViUjVJ+aSISduxphPiN5TSSUC6zj3ibDrmi/EKYBAhakpx5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuWwNrXQyIlnasUYMuYSUXt1x8OcmCYh/KNfGQpJtgQ=;
 b=oz6jHBtdPlC38XzTFgXUIVTLTZQCi/1pe/zew88FnfB+Woz5Coy5c+j7xWM1pDLU1ekxU+mqpotZZFOmxpebEAbg2MGrOe1+vf5uud7wM+t3lsDn8sOT6oZckXp+gbG5QhycdOmV0M+68tww9GHOiw/4UtY37H2YanbhSj78N8Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2318.eurprd04.prod.outlook.com (2603:10a6:800:27::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 06:50:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:50:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Wed, 31 Mar 2021 14:33:25 +0800
Message-Id: <1617172405-12962-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e85a1ee6-dcf2-479e-742c-08d8f411372e
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2318:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23189626D8D45F24D5389F88987C9@VI1PR0401MB2318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96T6PO6JaKB0rI6x0FFNnmW7UY8dnUwbyM60czjINOcsZdYxz3D3/6rhh6G5b7P60Sl20PHY8nLf2xVj8jBDrT/Y5791F4oEsU+Dkx6xzFF9x4LAKhXTLfQyaCr+PX7eFoT+D6dhM0Be+MIeeKhNC/iCmu3+Zd/+tU3O4BQR+PWUHjnoNVU/Cw0TzwbesGD+JQqRaZkmP50uLHTXpl8M8+Yh6L2ARj7ZrSO3ES2+9ozyAj8Vzd0B7VGUlBUNf97zvKZWC8EOGMuT7UxKYezHFCdxgcczdu6GbcIKow9hMEY8X6C7s8qKWT7QrIsSpSlaPp2HhkRlsXJVU2xQUMlQ5Mfe4mmt+4PC8cccoSpzRtgMqah4J7S63aSAn6deMX4IuZDT49x6/KzPEHvgn7su8UDbzkgcLd2DRIpQq1QG24m0acSgceAIIz3OY8AbnTqmYhrr+gtPEdtOa1qORRTcWFyeG/w/J0z4lXO9c7BgYwF7oG4N1QpUlUx8/7SHoO4Z240wDJVU81kQwu3kEickfGLiWr+kiifskEVNI6nYidD/asY5jXTUsfb2C9j3R30KH9MjA5kafKC90Xg6+ZCw0qLfGC3bhjbSPZ2GKpl2NnUix4pksDDa9rDTdKJf4atH5VYpA2eIkpQVBRa97a64yHA6A+fXiB7EVvl8ZicyOcriytUQnbYuw9AYBwtcGkkW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(6666004)(69590400012)(36756003)(498600001)(956004)(16526019)(186003)(6486002)(26005)(6506007)(6512007)(66476007)(66946007)(66556008)(38100700001)(2616005)(4326008)(86362001)(5660300002)(7416002)(8676002)(2906002)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KYNRu5zJHRBL6W2POoHPFDuWMO236+Ob7zQQmneQ/gCwRCTR1zyWjrLK78YY?=
 =?us-ascii?Q?p5JUacD9lIYkuGEuPijPKpSANasSha9W5sGtwJKXtbLsBV7861iKKXes0IHW?=
 =?us-ascii?Q?3L1qnpuqcZMCBlHgJHXmb5DkFAnl7YQLHpqd4+OcN3GBxhqp0gMqT5JVmhrd?=
 =?us-ascii?Q?xspnjwPt51e3sXeouIUM7xWGQGepaupp2vgBrIgSOdCThmLA1SWIpzzWXcxe?=
 =?us-ascii?Q?pxxsA7RDlQZkaVGLCtXSFyQN9EC/1vUdv0CioUJWPBg/FG5X0zObE/fOBlS0?=
 =?us-ascii?Q?aX7QbW7mUjJEapnhVR71I6GNpaZ2vs2AlF6TX/aiwzR8VWuudwMIQlOBS4JJ?=
 =?us-ascii?Q?8SRkb1brlS6onBHPorlCuTlzOPsRr62zRY4hlOXDS1etCRsBT1n+o3WMkosQ?=
 =?us-ascii?Q?7NrX3gTygDTdZBcHPB+O0R9CPfbVzPrW7EG4yQj/3fYJ9Pd5vwJ5EQfWeB7l?=
 =?us-ascii?Q?r4caYBfnn+r+Tzq9Klee9sFtdsoO5Z/heR+kCk/PxciGhliGw5fQ1unS/NEe?=
 =?us-ascii?Q?Bpcp13yiKlKK4AbIVNtRjDljhxl4hTlISt7P7k36LSG/noXb2DJJRZMdXC1/?=
 =?us-ascii?Q?YI1g/PSTYs7M20HuYi5ywMeBzHXjfLVJvTsjKvnf2MaEVceklKUboXIou16+?=
 =?us-ascii?Q?JFg1z+I57psD2BZurXn44k/dAVgN7yoGkNM4sOIb6cufJa2+xz5EktT5/4Kr?=
 =?us-ascii?Q?fXK+78Kde2fGZgYohPP3vdAlxw9hPvMdiN8ZU2yfd3GRBpZjX/D032KfX05m?=
 =?us-ascii?Q?OKy/GT67dRkakhjMyx1H8u7RbySIIkuvNeS7tA0FcBMxG8R8Nf1G/V3RYA/p?=
 =?us-ascii?Q?SveAEF9AJQd1bZKvrVcl/JhtVquWj9F6QTtwzDhKNfO9HFEySIwfXRK17gv4?=
 =?us-ascii?Q?6bj8u3JtW8peBYNDUBlgvZ2JdnXqaEK7IDL5/M0lHdXMzTuU5G7MaKzVOuaM?=
 =?us-ascii?Q?mTCUs0P527XiWW4sLIceiqU9veriKq7LTR/3in+/w5Q4r58wuJo+qKMGkTYy?=
 =?us-ascii?Q?A122FxOz5mdPnUAvpuQqO+tG6CupioRqJble5yfXvCi1GzaShzu+vFQtWgAe?=
 =?us-ascii?Q?icU3yzCmogTT5DUr82USG2PTgrwGYgCk6hKgP9SZOyje9eC1FB2MQuy3jrVC?=
 =?us-ascii?Q?b2OKVTTGt7UWrPMBn920pAtPMu0J/k/PBSgo71IB/Vgp0KO/IT8S2xlM/cfv?=
 =?us-ascii?Q?yo7od4R+1D1LR1Ub5c/An8DQKvJRre1Qp0INUyRbBEmH41+J8Ow7us4I+CZM?=
 =?us-ascii?Q?8R/yuDAfnLAz+EPpYphYOQQEnz1levv02ysK0wodVcc5FysmMxQNDeqaVl8B?=
 =?us-ascii?Q?ra3CWlXzEB+p77BPuQCN7V1y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85a1ee6-dcf2-479e-742c-08d8f411372e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:50:05.3755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr4Sls161WDORpPQyhh/y6H1pg+bEXLWQahmQHj21KXbU07UYg4M4E93qPs4qsEXqaTYDhS6DuPiSWrq/Msrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2318
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v7:
* Add Robert's R-b tag.

v5->v6:
* No change.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a247285..e286f3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5946,6 +5946,16 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX BRIDGE
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
+F:	Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
+F:	drivers/gpu/drm/bridge/imx/
+
 DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
 M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
