Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE634C39E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAF389F08;
	Mon, 29 Mar 2021 06:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E967B89DC2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPKzmJATWK8KniYQuXDdfq69shIoArc+ajqwOaMAlFczFUeb0wqzEWLhToWjw/5yDo79JSDzLw6R0ShxMbZwL4W3jRPsX4acdesCR9e8BaXpzTiptaXH46Akou/0OPJg/okh58N5/Dc1cehHq54e+g1bgpJXIrevbQKUrfcB+9IZ6DfVjFb9gf6kDHWQJvOn7G5NQegB5LrT3p9NZgNFzglbZQ4+SSEml05jxuZPdCsa2HtlqyX38JbNpRBQ+Fhog3c5BdHWvb+IqYjNzMxi8kT1KOp4e68oORVm+vRtGvwI8fgrLDXVHHC1A0qk+wuoLc7dijEa1DY76SmaU10zWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdzn/NcgPJx6uaYkZ8xJk61LtrluxXGyIF1UgZVKYWo=;
 b=U86Km6sitkpZRgvkesW7EEesqFOlKRiD2l1JQHdMNHnmxn0f1ehFPHzy9sYNAnBlJ3J/rRZsH4twT76HnFfa++zVxLE9Vj+WMVQ/dcJ0gauA9aVYP9PY7l8BVib7THNm9yvfOq5+79qiEtX/Y9ir2y5GRzWnmYQGJyqHsby9gVjWjGYZnBCmTIA1+bPkBSelC7i4pJvbJa2JHr/uxmsmZvirPLwXG7sSdVD9NaFEFhBzIxCinsCkN/ZtCf15OkiCig06pG0vmFW7WC1g537aVbNOYptjD2MErHgK8p2QJW6b+X4LDilrqN2a7Autid6kM9UFIHN3fkc97X86GZns6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdzn/NcgPJx6uaYkZ8xJk61LtrluxXGyIF1UgZVKYWo=;
 b=efIwu3x3W0swuyOZIBqlITFv/GYriZBF7ZweG76tZnEkJoWbLIraZcd0T0YL63qVUR1H2PsBHwCUEx+FfU+yaSnTjiWWgfna0ILA4CJ1OsnAfLYjjDzCJj9zpP7+jeZV5GKeLrLk19uWFPcV2/wlZJVRK6720NQfVUlhx/YYOBY=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4895.eurprd04.prod.outlook.com (2603:10a6:803:56::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 06:12:38 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Mon, 29 Mar 2021 13:57:26 +0800
Message-Id: <1616997446-8783-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbd899ff-0a76-445a-0cff-08d8f279a749
X-MS-TrafficTypeDiagnostic: VI1PR04MB4895:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB489554B25FB48D1CE513559B987E9@VI1PR04MB4895.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+Fs269squR+Kwk33w1dC7M4i62qHBCHptPt7410zWFwaVsvdYPuzD/dKKd6dV6q5Pxe3jFTbOuXnAWC/qa6U1Jpa4V1eLzETvQHdXNebGLe+phczSO+gOARasVLOkGRzkoGvx2SQ7//Usfj21VYHjxvxb2Bir+2EwEECcTAj1OkJpBTwM5Q5sWH15ujWOzUe32ZqC/GSdUAc5d+NTk4naFePafmIavjLaf+fU0WeOt9+rdmZ6728r67UvpqzRRl3cFuh3nKQWI/mtnQZoNnCDF7Z19r92wbI6Z1ZhGIthPWUSe2T0TUIh59YSsUf4pHewTfSjpmP/4S+omr6NNq7zArl7V1KKBxSNFwuIHGJhckWgvbKgizrSiSqTAZDfLdXJ5H+q68pOQnkaG0E0PKB81iv1QvvVnHkIEwzXogOjAtE8Tt9Rcixi1l9oU3wKEvkJGjw9j6xictD98wWHcIo/9UpI7dgHF7Whn6D3k0RVaw8iaa1hXnWdbKwEKeHzIVNDRHwpwEV8KQqMPYlomxURfMqFmepjSjIeD0m/dV8YWV9uOKJD1qIngH/lyWTtXDpdALQd8qRuNPlCS7JTjWMeEcs8g0hcm9dGO8rn3gWFq6ZY1hImnNSz1NAs+7eb0bLGQZH0nmOqHbbCK3lZYPKLoaxQ96Md35GmCbZxodWzm3qWd/0fGF9Hofe5C7OktB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(26005)(36756003)(6666004)(16526019)(186003)(8676002)(8936002)(6512007)(6486002)(52116002)(6506007)(66476007)(66556008)(86362001)(316002)(5660300002)(2906002)(66946007)(2616005)(478600001)(69590400012)(38100700001)(4326008)(7416002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oyalr+l8R+XR5DLicRJvGXhT1B9+nvIZUVr7sC+bWaX1LP1HEahGdjKyP2q+?=
 =?us-ascii?Q?2kuvetebZBiz+aOOmhQrlVj9YOeCU48Q9evlwgoReMlMvVonVZxtdZPMGN1g?=
 =?us-ascii?Q?toTDqwisZeXaKlGTmOG25ZUZ3PvtxK2Cvgv2eKAysjGuihseBMdgVPa+M3QI?=
 =?us-ascii?Q?pPBxLjkTMmL5qDV8mO87hcyqaZkt75mZ1Uh5af9qLn7XVT/GcPN5aECckFio?=
 =?us-ascii?Q?V7Xiz3HXXoJ4OmvFgxBo/GTsX3gClJbsTat1WFTwqC/CGmE/dRNf6YQVwTJH?=
 =?us-ascii?Q?74pfk4bNqPI0dawDS+n005YHjwWsw6WY4lb8xIJeFQbQvC7EurORAVaN13Dy?=
 =?us-ascii?Q?gAfkMXK78S/9Iy9VuyGJD0LNcDRkuVE39e1fFV7dbDVuv2s/c9gH4nur6nCA?=
 =?us-ascii?Q?NBk6HdoeG53gkJHRX+9UqGOYvjRRUzmgko5lYQc4buRqZY6kTVPJGgCUMZjT?=
 =?us-ascii?Q?Xofozq0ikw+i3VJAboTakoK1luDcyrPKSQXUJ8prqfXnznttgQnUtRbW/rxx?=
 =?us-ascii?Q?ZW8Rac1nujIrfVdWoyldB0M7A1FBikmINTYGftIsWsEsM7LgMxuZPJN1fW8n?=
 =?us-ascii?Q?NNdRsGg/xVxHZbL8H+RsRMrtiN3aaKwLNquUPGUukz1kcmsM+O+jXjqWl7hb?=
 =?us-ascii?Q?11Gpj5Pqnjnkz/JyTxfYu1jsXLvCMgTLVZ2qvBPQiCCPKr4DKWZN5tA/q100?=
 =?us-ascii?Q?6+haq5nNiQddhpAJ7w8FJU4b//l+S8yyBSznslJeaP3W7/IGQdXYvSYGlMfp?=
 =?us-ascii?Q?AvRNg0+8uvpFshnjJpsPcuEhOpVtObvEK7ecKtFSGa4kDe1AqyuLf2ImJl6Q?=
 =?us-ascii?Q?a89wYGrOkWgAHsnOJqEz2kf+nJdOFYdxg/7iqU+VWHPPzdqa5N0FXD6fIgjg?=
 =?us-ascii?Q?njpL7AYIuCga1GfaqqzxAg6gyiaCHuN8pMqCv3zt70KYhYtsPLffV9roz1Ky?=
 =?us-ascii?Q?m4Rr2l14nCOhoFUTIOZAH4IbQ87MFCV5m0t2kSMbM3l5CvJY6bQJf/fws14X?=
 =?us-ascii?Q?fGTn9xLMOCrwRmf0MEgo51/gLCl+BJIMGb7jgnjTAs5cMEMMLL73Pj45eRlk?=
 =?us-ascii?Q?52784cz891IcJv1GXNYIm9t2Bu6zSgT+17/ysYJe9hsmBhU2JfIpkixKVXNb?=
 =?us-ascii?Q?vpmay4rhJ1mHkUVyw6Y7OjnqaJKGk7jbjYU79vfrvj1vHsg5GIBu6aICiZUb?=
 =?us-ascii?Q?ut5OWhCwvxqr6De+9Rzl3/kl3HV7KQ7Yb1totp5yARprv8ulYe5zb1bt+njh?=
 =?us-ascii?Q?QQEJP/aufg2mIKFufKKFxxyf+LYK4RJx78UIikB6ls7ov5Dq7efpTLIh21Fc?=
 =?us-ascii?Q?lM4mtFM/F+1gk5smlqlqEVIV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd899ff-0a76-445a-0cff-08d8f279a749
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:38.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3DZ3LJyFtpHL85AS8BPeg9l+Qx3MW3lhveAYcw9icEN176GIAEYuNhPEGUN3TEP3Q0PJ/LBLWCA90angB6VBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4895
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
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

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
index a247285..ec82d42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5946,6 +5946,15 @@ F:	Documentation/devicetree/bindings/display/imx/
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
