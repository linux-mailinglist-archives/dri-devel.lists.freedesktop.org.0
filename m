Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD22D0C3C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410456E59F;
	Mon,  7 Dec 2020 08:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0B3897C5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 03:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMpQ0OmCmci3zoLuEk0FsLlrkG2pjUYhU7g3osDIfU0tYh0Q/jx256Z4Rx1ud6DRbMT/z3xe/Vutx1S3xdh4QZWzEU+RRO/MJsbqGC/pHJl5NpdTh3uDmMQqzTbDtrBd7Tvn6HTDtL9H1Q8NiUUKruNRLFLn+o2NonDd8ah971WB8EYoFETFjhjYEHGPTmoPUK7o8m9vWb5tgaD3B9Nsc6Q1yfpo1RM6P9tjfirv8vPTVWAFwpJPiwW7QUUknRX+Px/Lwf+XgyAe8dea23rirXA9QdquQvJeN4oLlFIj+NYFmNkltbyoMvqF/Xw3ZrFAFp+YA/wRozmrIyaOE+ozSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JSeJ4BfHUTWIkNllgctdEGRJjyABC52MC+dm/mcAfs=;
 b=kCNSfv195JjlWZ5QmjIqObwBdWo3eLTPgp7bCSJR9SUo43wOE6HXsgE5kD0wVMC5enYvN7O6oYGm30BarNuo4z6mMVKVLTFb3MrwGYsuYHUfuvh7qOm9F8UR2BiDfOxrao7f867hW9jmRM2FUu+NIhWMNIQiPKPL7ZNgBTvHPysL+KHIoWcKfXLJP8mqdrXFiO4/k6t5VoOGxCIjyHSGUVBOeVaiOmd/bwakmL0T6xYwOAjclkEsjbD22/WfRpnXg/N9ApaOn12Zj0K3LsSPrpoPQmrx1mRR2R2kdTW7+eVkw+tXxr6bOeD3TtkYdd/bK3JsvYGyCvAJDlExWOJIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JSeJ4BfHUTWIkNllgctdEGRJjyABC52MC+dm/mcAfs=;
 b=bco3VsWqsIAKkN+uevREvXMGDhQHQxtnq6uz7z6Ky9RkILF41wy9j6t14bCedxY+lK6xfwioonIfji/3GIRpfeePeB4JX1rQ6+4VO6mD5vORMaGsQyY97o/kVQmvCZCfpPf8UVfusKcFjCwbzleyv9YHtTbmLwTSB2EQlM1jaBQ=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 03:29:39 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.038; Mon, 7 Dec 2020
 03:29:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Mon,  7 Dec 2020 11:21:00 +0800
Message-Id: <1607311260-13983-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
References: <1607311260-13983-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0085.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::11) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0085.apcprd01.prod.exchangelabs.com (2603:1096:3:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend
 Transport; Mon, 7 Dec 2020 03:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 850444b1-da72-4e25-d00e-08d89a605407
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6349420C7CB177EF956FB8E598CE0@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BfUP86UJ7/v0trpJIE45kkpSZBjx+K2rs2J/345uu5crqyZHyn3KEvOUzPSnp6yR5a2NaLlQj4D15alshDv6PY4F+hciN3S7NR92u++6znFDzJGaW3M0pc4qTmiN+t42qHGIOiRFncutYCJQwke7k0QPsJpDtUevFNjacOZu6Qc9IRV2wOg8OjGQCzye/+H9KBSYKO9JH6M+FDrOZaZPqow9DJLorNsLMRyEZuCJ1wCxSFIoF745iYg3QsUXmkZl6vefK9wT6S2WxrkHPBb0e6J7kxZb4Y0UV4eCUpnKVWQXaOYqgMCkhXHOZerQZZ1HB8eUkxVkpMuuDEMVRpGtlTQybhF+mQ82wYyiRooxMPuCf8MXes/evgVpWbiiaKCM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(8936002)(6506007)(6512007)(2616005)(316002)(52116002)(26005)(478600001)(69590400008)(16526019)(186003)(6486002)(6666004)(4326008)(2906002)(4744005)(7416002)(956004)(86362001)(36756003)(66946007)(66476007)(8676002)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2lDi/cvu5syncVGyGmdSL3K2kvKhPTQHf8KiSN7pp3GhKUq62oykNX74l+QY?=
 =?us-ascii?Q?OtXlJIv/8rcZs8pKUkjJnT8WOIvF6vobLLnmvQodB3Qp7fKOp1D6lSrCUHR3?=
 =?us-ascii?Q?JR6O1RMyfPrfXCyHO+IoLHNQNVFL3+IFpACnRiQkaOExwnO4mHeHcHT63nA/?=
 =?us-ascii?Q?S2hmA7iYsiJQdhdzldyM47EMlLGnxKWHid/3mxLxORTLwWsAdEYueNTnCMoA?=
 =?us-ascii?Q?1jyxDy3U9d4H0SukjJ00QQ1CozEhqEsn4qppmERgNlnmvU+RLfpd9lLrm1cB?=
 =?us-ascii?Q?kKRWSjoRQsQrVs6M9r7nMF+xYu0juTg6N1knks2VwtNjvJ6rki4jizQ6d2dD?=
 =?us-ascii?Q?x+P0Yz/pLRZ73pb7JNjaXWeAcOyAX0HjDWmLR+X15pVuLdKSc1dW+psUUJwt?=
 =?us-ascii?Q?bEn300tQCWSGYwIf/5hnqSay27dm1opLxaw4u0bASocHAe0L1CPitQE/Kj/F?=
 =?us-ascii?Q?Se3rOHqNT6zL9J0EUkC35Z6ZgW61wgXlQBsaJBagYQpbF3ej2EY3+Swv20VU?=
 =?us-ascii?Q?v8GZAxZSiEmVPoF3X2dF70/dqYaBj5lg+3MnIuRDy8HbAHRj4yd7tggiypIf?=
 =?us-ascii?Q?1GcinXjRTccTWPHup72ffTLBIaPr/r4F7K94YqVSt2RSzrKTKD1PCJag2nW7?=
 =?us-ascii?Q?hHKazC57ddJ6mrrySM176bE/aIuBpO9nj0ordsQH/tDyCJ3qWGbB0HjbH3DF?=
 =?us-ascii?Q?uRAinZu2aBa4vkvv2IfQvsCL+DaMBkTqwQefiSTabns+exKReIqv3+1PVTMG?=
 =?us-ascii?Q?0QlNXa81XcZuffadsH794YvZG0Lov+J6/eGvuxDlK4BGeHXkWcCRsER4KMBG?=
 =?us-ascii?Q?RA1JpASyvwyu5SUlHftqRPmgul2rzluuKtqu+fwJn0G/tmR4bRF8TUvYua5K?=
 =?us-ascii?Q?sijiHG8jAP8CIXKGv3ZvVQ1LRa7zSHM6W7gqky157GLJ+SlE+GH1dPQd00fJ?=
 =?us-ascii?Q?HAeP2715fMfoAqXlLhAwSDnVG+btEXJFiZiGMIQ8QIGhg3jfOzqR3/pwOueO?=
 =?us-ascii?Q?/bPL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850444b1-da72-4e25-d00e-08d89a605407
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 03:29:39.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zt9c2ZDdLzDHUKP6mQgQtGPz614oWXF+ZlBSv9gIGRdga+I5OayqGszxetFcKsJrjM/flBq9rMKDE7BnG/Rb0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* No change.

v1->v2:
* No change.

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
