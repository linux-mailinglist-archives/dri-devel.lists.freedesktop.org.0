Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA5329681
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 07:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6296E8C0;
	Tue,  2 Mar 2021 06:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87436E8C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 06:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpUFceYUORD9DbZFfuHNZbV0bh8/vqZEne7xPQT+62nhruqZMP1vyZatY12mgAqoQ223Y23KxE52vLhGJlVZVKUM0OdyUgh0ULGZrKE/FjSxHBFfOzAHlkL8J+dpbhaPjd29jWk9H+lgngZPzddol+DnBJvUaXruHCXFDkWOWnB767qHxq7HoubpI1BmZ2TZ91mecbDJkziZD92AcNfaZu02z38X8vdJtNSTXxUGka93ORZJQNH9rBc2ZjxCzxb8AjPiHjSdXGwfgR55r9xCJUqHx4FpmBu5On1RNg2j8MVCynKBojPVcvFvEjmP+ESFWW+dSXXv58BgynMPhvddig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhiF++Dsm0f2rn9RfdTs3Gk+Tg71c+wP/7WcnY452T0=;
 b=K2bChBgHbjxzVKcN/u1oyDABoa4VU3mfxFdYAhZodU90rMjjoWR4+qmc6e/z5Du2UdG1OOS2H+9fc6JfxrEcYD8XG5Qdpc5WWfd7kaRteKHI7X8NyXBG2Ym2yx5L8avLXoeo/ui+xNa7QirDYVu8EeL7WTkMpfzFq0Mw1AbO2csF03atWj/PdsZkkr1nFvx1nm0iGX5g1Hq+22UkyWaxOEGrg23+wpz+PEVu+/u2v6GX3yrYVhwCWe08yC1z5YcST7HSfUFY3gWPBZykI6g+rILuNJsJjjMZHeChPGZR47BYlgA2N4EUdh1BzsLkuz/XnxRoGQRCCVENn3QwuOrk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhiF++Dsm0f2rn9RfdTs3Gk+Tg71c+wP/7WcnY452T0=;
 b=G/gmma1TYTaoZRUT3Y6SsdjA/FRyhBhbfoDTTQPdTUEvc3sJ0A++M71WLnhdpxMXzFHnpLCKKHrgfs8BUpjxkBdbIMHyZpFKEQPX/EfGpU7/L2/wPF/LkEbRK/d9FNB0inNjQWfw1WsoAc2mPYdaXDy5yJnwyniuxU1p0UCTvnE=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7117.eurprd04.prod.outlook.com (2603:10a6:800:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 06:46:38 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:46:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Tue,  2 Mar 2021 14:33:16 +0800
Message-Id: <1614666796-19374-7-git-send-email-victor.liu@nxp.com>
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
 15.20.3890.28 via Frontend Transport; Tue, 2 Mar 2021 06:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2cded1f-def0-431c-24c1-08d8dd46edba
X-MS-TrafficTypeDiagnostic: VI1PR04MB7117:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71170A19D1AB027D49AE730798999@VI1PR04MB7117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3N8Az+7LkuuAyj6WKukbcKT5QO65qLaaFhLx+WQYerfEIOzGklfWvnzNXBCGOSNONIHwuK8PEHCdJovyWOKSIMHUVcvYowjDd1Mcbv8s4tJ35uLs4BYCHbBNG+Vh0wRa2GFq12NqP99imd5fuXZxhueqAie2CVKAPCNG5AQRDMhDDhaBXTOUY/f9cIMQfBn+Jk7aJZxF+W9vZYRkncdaEl9k+Ebhax0s7dKJapAdXGLTI8r80Goa4uJ9DOvn4DrQU9fDGWkwBtqCZE+RHenJ7egzbPbJ6HCtRa6tN6uSsob8k1oXHBWGQvIoY6E7G6ql6zCm3oily61a3opQFiZro6pU1q4xtdlvgd64n+Uj7/FmPtgkve2msJvvw46hBuL24oJ7WrYpAWqjaNvuJvAyX0eY8ATxQqv3u2xZkcOdq065uurhKj3wW9BoGNKPeSCydc5snZXodvKh+lauxo/19LTEScLkakoPu1y8QdFtRj+bLwlrzq5gWKzlaK3d/snns5u9XyqSLfUGjiXu02BA2sz8uctG8UhgxFCWp3uYAkWjmzY1mjfy5rc4bIT4+0B8YEJJEBkkvHv7a18vzyMRjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(2906002)(16526019)(186003)(4326008)(478600001)(66476007)(26005)(6486002)(52116002)(316002)(8676002)(66946007)(66556008)(7416002)(2616005)(6506007)(36756003)(6666004)(956004)(6512007)(5660300002)(69590400012)(86362001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4cB/lI0J73Y2KDPq5nTQnJ1U63c5R0g5tDo/VhMkgQ5x5/GEB/yTxgeIkuqU?=
 =?us-ascii?Q?xk/4Bl1GzJDa65otiS/HSKzzSIuZYHeJYH/68u8GU6y7JhPynJYaM+pInacG?=
 =?us-ascii?Q?XTJVEL6BM2Nq5n2fkZhQuMIZilokP+WKCfg2LyJvrd+ego+FMSxDcShZI8FL?=
 =?us-ascii?Q?QQ5PJymIfhosWVvC3vxZGvYhVY31tpdVyCKet0PPop8MDSVzr+fUv0tWMImh?=
 =?us-ascii?Q?sRdjtYf3qAOv1B4ZZedOk0TUHt2P+wo5A/pQH8hd2CcjzXu6YTk1XQJSHpqS?=
 =?us-ascii?Q?Dfz9XVg2DyB0xVhNTFYUqEvJCIWqgvCb3YCf2A0IUWxnVoxkh6FOE2XR+Ir3?=
 =?us-ascii?Q?vaCIBd3dgFazV1GwwmYVW3U/GlRSHGgimQxqgBanx2lrI8i/zL5VE4zwC4jA?=
 =?us-ascii?Q?5RnfK1mMquoUNVAkpwmSgH9/Irt+ZCsD5umkgQO7HQq7h9BzXhSnATgXjhPw?=
 =?us-ascii?Q?sNpffC2RrIVjWHUtxKDOwbYTVqptRXLVFAEKfdo6jcUIWkhLOYGmHqqHTtX0?=
 =?us-ascii?Q?qyjBABsLX8IRTyJlsIQiVyBhGD7RApMEcN6p/NcoCd4Ve3ID9TipVcNeLxnd?=
 =?us-ascii?Q?2I1pltkx9H0mibHqfXd4Y711wL50ypIYrNfJ3FMytkpyb2oh89GZiRpTat4F?=
 =?us-ascii?Q?OvmPEq8xZ0AK99r56yNYNnMTZsY/wP6R+c+lc8ZMes/c4X3s/Pdy9WbHE45e?=
 =?us-ascii?Q?cx5eGs8C4k/Yv0ZbLagJclMWph1PE45eWOVVgJbGic54ymApZwt3y+koecV2?=
 =?us-ascii?Q?MpSxKnJsza3agjiHggAmvdpsOVSOzKPTUaGFqPHVa3lt8OrFq3/Vc4ymS8XR?=
 =?us-ascii?Q?Rg2vnu/wUIFVqInsGpz6L8HxjhWUrN4hmYdL/SIpUa000Vkbj+DkZ0L006ue?=
 =?us-ascii?Q?QlJXmypVN4JTfTlLGMkV4x3zJtYTpN88BjgpznSj3XtWBZ+A89iNM60/VWEY?=
 =?us-ascii?Q?mCw63l/1FMqZ/csLpdROKF3K7HBT7iwDivsvia8IONWfEMxAAoKr/RJFrRQA?=
 =?us-ascii?Q?CrA4itnsBOWVPS2c4sT/zqXDjJPi2j1yVJZmXURzyUbDwy/wb5RFodmXKy5e?=
 =?us-ascii?Q?xJFGbtAR94PlXOryRNc18QdaYZ86P0tbe+d/YTFDSswxyh4uOaI1lZKyxJQK?=
 =?us-ascii?Q?og7JiwsDPNs0LrqHiwDi0yEzAm+oWygNtDsY0anfJK+k4oh4QyJgik3zNnic?=
 =?us-ascii?Q?Pm0ON5kCms2UQ3lEa4blOvzuNH1Y+R2+oG1J/yO/SnLHkI0PbczzUfkm4dlC?=
 =?us-ascii?Q?Hel2DgfPdFcxxBrwSzt0GwBVM+qMHH3gt5kKroUcD6eY7eJ/+YtM6f727Jco?=
 =?us-ascii?Q?tlS9z56BA8UPrphgDX2gchMe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cded1f-def0-431c-24c1-08d8dd46edba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:46:38.2811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbnjlipItTHCaZUSs49U2bNur8AE3hjVTQbtyNhZFOPGHFlCjaKbNQ5mvGXCW60MxbNCZl//plF2JtjTVbL4+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7117
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

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

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
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63bd69c..08cd9cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5892,6 +5892,15 @@ F:	Documentation/devicetree/bindings/display/imx/
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
