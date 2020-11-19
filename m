Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A32B8EC8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFDE888AE;
	Thu, 19 Nov 2020 09:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70446888AE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBxCx9gCdAElV0S23/Fy8PTD5F0MD39P/NeYPV4FlffTaIGg9Scx8bdAdAyOADqc9SJDEhSsEJco2vl8Qk0yiT7l5b9htX7O1IrTZEc6JbCy9PCEDigxSINYY4AyR8Dqgnvr3vD0NlrGV3fRlX2M1pcBOflRsEH4l/g87V1nd4M5sgWmlZkbZ1YB+mAzHA8hTXp70NK82k4DrFmkiADD7JmvNODByu6aHhFzwTLJ5iadt6F6oHkcT/Fu1BDLCsU8xHU7/zYf6TQuC1mihHyQDMoIThrSP6KUfFH33zbs0/aYVLcugMQCkioIEOSkKZoFHYWDvPXWptyBSh5+RwFktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05GdNYve5W2oUX4Cd0igzh9xVN2FAQjsQdXgLZia3Bk=;
 b=jgI0BlHAuM2kqaftpvRnznl1x3Um6ecBYFgdzZGfW161yt0EcmPYGNShBXV/LyrUsdcY/gklcjl1La/uLgIFLoV5L1FbRmqUgZBiwLghfEdmreXvAVfsHG64k9cgpJRfy20H6eYEh2QZewBcN50sI8lVZ4PYHS+iqTfCfGTZHA2V2Ynzq1t90+GPB5u++VABjLHxkBYC5XEojvIk+4e051hGJWQD1kwBF4WejsB4fq711dE67jy5PxPdBCctxalCGa5ZLfNQLRc98tDNU8VYyQD8ER/KhYay8Bwdfz5lHJvqvWefawK9xpGAWoVaGwsVppLIh5YK8/34mVlSqflYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05GdNYve5W2oUX4Cd0igzh9xVN2FAQjsQdXgLZia3Bk=;
 b=G/Bth0VFlVkFdUQaAamB2MaoeoBCWhdNXE7FrlxR9Dr9Y5q4ESR6vp/dnytfzsdNW1ob0m4l71lZssedKEaTwIFUTyoVwO1Y1rmZZEfR4El4PKU9ogWJ5NVxQVsjwzVcQHIKrg5RS7lSLhzgw6rC5RyDWaLjQSTLea5fMc2M6OI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:53 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Thu, 19 Nov 2020 17:22:23 +0800
Message-Id: <1605777745-23625-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9498d65c-b142-4c12-ea0f-08d88c6dab73
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29737FFD8DC5FBF2E9DDFF6998E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSmhi1pELIQsoQUPpYT+byRqu6Qi9mbVepGaPrJGBDnSKu63RvmYz332+U44rhl1to2MUxNSCLmHJzzeUwMy0QP5+YEbvOkZH6/Z8i7oYxply7gmOf1ABeteV+RR8N0I9HaMC63qEs7YOuAzKQ4tFrHcJgVEu8IzhBwZh46QublF2wBPvcoisvs/npS+vmABC/WSWMYl5hYw3IAopnpXnGXAGDyKbe5BodmFCJh5A0VZjctqtjWT65R8Yj6PHZZThYX5M4HNxmcoNUTvqOEISQ7GuLGyE19GQ1D2Iozybpfs5TQR58763di8n3Dxu55uavGcGHqMPFmAVAIl7fLA7JTX9Y3khFxViEv6tJ83Wf3s3pMI140Gr11WznipPEYc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(4744005)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(478600001)(4326008)(7416002)(6666004)(8676002)(69590400008)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0quj6yxlIRbNwRQ4sZp9TKZpRRBxd+zh4RnukaGdciPCF4tyViTyt9mztUiVQd0PJsMDANdp/D4uHBt+irRnxjmDJUzxCQgcX6z63YVQxYn+3XKBMEk3QWfz+Xo9UYj+MXs6CqImSueX3k4af3kdTFt/rJZYC3l8wcLh0qZ7DKzL9Dw2d92NPQWXolvHuKOZTjuFbcah+6pD24tMwqBg82dQiMw9VEzELNAvXQfgwcbSugX2APE1rrBm0rbbdkccwubUAYqif1eRYyFFKIv2KichQB6B4g2P8nR7NdY7lBUdwhnSaSz8RBZaxUQwLAgdH/vd2z3QbsSECY0t65m1ZXXaTXhdfUi+kh45glwFrDrOZzZtbxpnqjx9QqNFT02E8KI4pPLIMsdlQEj/ip2zgeGB2O4Wy0cgYjBAxMV4F2KdgZZVE5YwhPmqTSnoEKYiYLtncq6jWsRl+dD4CQGmue6KmUxq31lX9EGWWwuoN/wEd+PiclXkZ8Gft0DkbHoJF/fg1f4eaG8cDmiUd8a4mQEZBY+QbDGBuWpBs6rzupb0zzIPbXpoNTAFjqHloPvngy3exqitIrbb5Rzr2vwnMrH+0KZBQUV8LmeUHva5wadetHNrJRqhzDs2zNfCDpOzaf4/M8y6lqsqjGucK6Jevw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9498d65c-b142-4c12-ea0f-08d88c6dab73
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:53.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MaKoafH6oxbf5rORVmeVlTa0hEGq525LioIH/sCfFWgixUpTrT4VdRsoO6sB6phujUx6tuA6heeQYKCKqDijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 970d9ce..dee4586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5834,6 +5834,15 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE i.MX8QXP
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
+F:	drivers/gpu/drm/imx/dpu/
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
