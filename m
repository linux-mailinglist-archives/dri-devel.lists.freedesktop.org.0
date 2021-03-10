Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA97333992
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 11:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B0C6E9FD;
	Wed, 10 Mar 2021 10:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30053.outbound.protection.outlook.com [40.107.3.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889F36E9FD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 10:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5XS3g7/uj1xc8I5G7HYxC8tP+Q0ASEhdZXHJ6RPfTFb9oGWA8TFAbVde4gNC4YOvdH4ODqd9gJkr9zCrraEV6UWYALODPDZ96qjA3+H4851PT+eHaNMs+yrOQN3hfIqrPlEK4IvPbYqp+C8hDoZh+roH1bCqUtWGZGLVNZVI8atSj95BeMTI65Rnv79cWrpHbeHAILdAECbNvQGselUmGVH2jy3HKwOntolaBuTNPEHQQBFP8AZy6QQ2Plszu3jPitlZdEF19w8XYiEDKYXX+f9lL/asJqq8AObtS74oFgPUpR4qOri15cd0bMCZIt62bROR0ToTHgJsFx4SwPm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJpv4IpLCJWZkLeE9ajiDZtJ3wgjf3vjSypVj5Am2so=;
 b=DuQosVlvznvdmK2NbdMm0yAHhJU8hvA8LdoPsYmxnjcdB8LO7SzbiTHapXSSNPOdoexa526qGQ9fjs4W8KfYJUkLI8Y7ENglmAU6v+m2mPUdypDQw4DZjm6pehS+Hxb1fb85g8poW7XkiWL7Yyhg+1H4bK5FtQfTIxJqh7N+S1nwpTzcQ5XmY1nkSF+uqwKI2Jc8ldLyKJ/+74Lj8ijPToCHcFp/0644Lmyt+SpeI0aVLnXRy7qe3+s4L2Mv6tXtnG9sO8zXKfLWaaNTXsaKMg66ID2Gl7B5nrqnqwbU9n64lN//Qi/VpmqN2gEokQsXaufagmfgEgTagUu9h++T5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJpv4IpLCJWZkLeE9ajiDZtJ3wgjf3vjSypVj5Am2so=;
 b=gElM3s9VPTMS+48qR+QIVyYiKsLzEuQXugdc8l+9mhkujneMr//tgz08PRuTLJC6AxqZOLefcBmY+yQga574zZ9pqqbIZpfNx9EA9lSB3A5mdEJeOphofH/Z8eXP2GgiKNaz1CKiaZvKHQ+Fr1XGBRp5u7BKqCFC+DeyBVv4gzs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2813.eurprd04.prod.outlook.com (2603:10a6:800:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 10:10:28 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3912.028; Wed, 10 Mar 2021
 10:10:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v5 14/14] MAINTAINERS: add maintainer for DRM bridge drivers
 for i.MX SoCs
Date: Wed, 10 Mar 2021 17:55:38 +0800
Message-Id: <1615370138-5673-15-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:202:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 10:10:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c10d86b5-6dfb-47fc-ce99-08d8e3acbad1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2813462AAF430A549DC1B8A598919@VI1PR0402MB2813.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCds7/w7RjgSJ8xJw5iuDOYVL0diGHOn/TtOg5G04WWGEznfuutiTjBE9oNwXgbof+Tq8xjcKF9IfDjPnOT6is4wU+BdUGpoj8WFlcHiG9CrJVYOB8DUzrK6w1rOdWRl5YEe0USTOnKfhTReba7Wy6Qvg1t5KPG4WHcuC1iVpAPHZeET7JGP+2NsDhIOw8T9VSR1bsFwWnYIXJvRMfmIEpnf96A7hlmDPtACwcwLSqSeLVPOlDuKlPsilpERAqpptOdg8VrrCKf3vb2YVwfkiglbCQPTjLHe2+aIwcFPTsl6DXH0nePsa8KC2f+AmApnTDQydJX55JiQLFiqNOnQaIZbUNWvlMaiCThc9W4bQrC5BrvQnYCtRPi/c9dSui5HLECMRoJSyTL61QkzLDehPSKB6dj9lvbYoOPPfrJZ08qm2EdlnmSlREmtdUWecYYy0kewOBRm2fuo8M5Ua3YTcx5MVxk+iwpXv273Aqp1GfyyTXlXOvvPaEnln69jW28qLROuno40nDUu7TZFPfaPQLZgUXSaqEyd7fWLK/0diEj5DojgNlyc6TPhhpG97pGbdxpPGLTgJB8/iUtl4yC5Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(8936002)(69590400012)(6512007)(6666004)(26005)(36756003)(6506007)(956004)(8676002)(2616005)(5660300002)(52116002)(6486002)(316002)(7416002)(478600001)(186003)(66946007)(2906002)(66476007)(66556008)(16526019)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N8KDUxznc3J1NaMWifqhSje9eyclkZt7yYsH1rTj4DZmTlB7YSkmGM6NrjKo?=
 =?us-ascii?Q?rr+QD/XbFR2pvbtEu3AFhcwyUtaSh/h++b2EBHz2MyKowu8fXFm5vjNYia7g?=
 =?us-ascii?Q?G6Nbd2Xg+9+2ShdqgsKUetFWwFgKOPVpTGnsPujOoVOGrYBdXpq6dsKda+W5?=
 =?us-ascii?Q?K7R0iF4Rc5NL71baLbnhDsCohKiV1H7uUTJsA8Rozbp6QvB3WLNWS3fx0qAW?=
 =?us-ascii?Q?El1jtl7GgZo9+r687YcfoaXE73W1z1jWi2aQ206OGuZNtrHDG6heyIRpHsMK?=
 =?us-ascii?Q?tHNVgFp/3cQAgF1PO0b2KFEHlXOOFdd2dQCBdTcRNSgG1C2/WBDsgFss+kT6?=
 =?us-ascii?Q?HpJatjQqLwSpUQmmj2ut3qmxrJAPAV9mrktNBQi2W2pVVUlvlAYq3zy1T2HB?=
 =?us-ascii?Q?cLAQosNsXcGUKKnbfPm5IHNlsMN+GOU6Ts7oF0zwpbhmvT4cRJjIDAmL2R9x?=
 =?us-ascii?Q?2TtFtUQa1AwbPu3HV8xI5f6SbWt8CXld+HhGkk0kUAFHNnzfgy7bfUjOVTzb?=
 =?us-ascii?Q?GzdELCqFroajEM8XVOtTqNYQbce4xfrA3qXC1BajUDihAib4McLGxxtn4hvs?=
 =?us-ascii?Q?gAGbL/1jA17MXEqRxouhH2p6upI91/BKMSbLY2zfkqvKW7KYumjxhVnjuuVp?=
 =?us-ascii?Q?XeKWkvn5j4qVXJt2rxsgDjjBD5Iuf5FnvjK1Uady/RcnafjEHycfNJCj7QrZ?=
 =?us-ascii?Q?St1l7uwewN728FKuBr76Si06+wQ6xUASLnEoSG5C952B7RMMVJgUnzu9cA6O?=
 =?us-ascii?Q?tYuohBGsfnCMV2SRkZZkTWqu03al/r7Et+JjzDRw0xo/wqvc8FjrujR63qpU?=
 =?us-ascii?Q?RypRqYiJt974My2+cnOX7gS4Jz259JX5L9Yao1J0OQrEluiOKBukHojnz8oj?=
 =?us-ascii?Q?qnhqj0O3mQIEQUbQ60/AeUH8TwDHuvJCy3xtvJTwc0Z/qYh0+bFtFhC1L2vL?=
 =?us-ascii?Q?rOTFM/SbpTA6Jed2wK0bk/TgUB5+T2ayY3BtBs9OP7V/vEMrVsXINxqPj1tP?=
 =?us-ascii?Q?GhgAQqGPe7GKkq8uKryDbdNgLNIKeBG/XfsRe/WVGq+MoAXmNWK21qYhAGoj?=
 =?us-ascii?Q?etpg4zw5PSDQmxvim8f5eRPNjDinhz8BtQb4leD6jkucsK2OHYPgshzv6MGY?=
 =?us-ascii?Q?DvzXFhnxgj4uZwF31SzTOwhy+avSxSn+gjTJXdBOTEFbfYtbxay9UMq2aDkV?=
 =?us-ascii?Q?Tvxi3NzITv3DxMZ46HuBjnmknzObjIDrUwzet11FxfhmU/5979LyMOEeFnhO?=
 =?us-ascii?Q?iBQgf55c5+kIO2fac6pLtOep5PnSnaQH7qfeFO9ezC7naszEDLIqrjS+1QZm?=
 =?us-ascii?Q?GSlH+M1f+4KAP/WGrjZHz53T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10d86b5-6dfb-47fc-ce99-08d8e3acbad1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 10:10:28.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz4S/lbTqk1FBfyZO75bavekr5lxWuM2jD33yOylBbkS8T6SUZiw8dIs/aYUvE9TW7TxmB5RU+oVVIRZWjVsqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2813
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, lee.jones@linaro.org, mchehab@kernel.org,
 shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of DRM bridge drivers for i.MX SoCs.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 63bd69c..6e0c019 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,16 @@ F:	Documentation/devicetree/bindings/display/imx/
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
