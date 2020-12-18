Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7D2DDFF1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DA86E091;
	Fri, 18 Dec 2020 08:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09F894E3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS5JGjCl97PvlmDUUAU9AYFL5jNBwfBn81By6NRaFUw7BTZtAOQfYZfVGtCSssbt7+CAg6b+EtIfBd8aoPViKjljQP6ac3n7pBGQ6ofX0ZysLXNePAoiszZKAAPEz1qTOjwDj1Ia30bk+Wqcc6SnFI4Ru8R4vUmebD1u98i2uMiC4J6W5ctZ8UKtWgXdhzHIs1r1YxWy1kPGuGlFgIAlk5N9VmwnqwahnTitDn61VJHhZl+D7ShFfNS+8349mrHRiww+EuVBjd5MhNNPhCl8m1kzMgMMUQHG9rirprl/fWIzjOm/UOiVUVwkjGXuGYD14dtlgkq4cuktwydfYjkvUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t6+5yLKzNY287JgbsTSRFr7m577T5t9mtkKouShDqA=;
 b=CvHotWqpB0qSOnmZz0y+0fojQR6gjmc28sb10/+omMLG3dMZ9dqrl1cBAXlsduLRJK97jj/l7gQnyydhXd7A/VMNOkNAITaZ5XCTgvYjW+7Pu7Xa1nuYSSsjrh/SW/dizZrFYLpNSibRgPOVdRhSIh6XrH+KEaqTYM6pfpaf78xo/EIFDv51sA6MCBK88FNjzBziKcLAK3KurhQcu7+DkIlEDAjaO/TBjMMHeX3gBMJB+XtlyLLD0G3p/ysa1cGacAWTPPvbGVr4a/n33kQAQEHmJo+WRqzAC13KxRv2Mh0w2bBMACFeA0E99w2myJfww4WBvryEu6drzPqg5SLJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3t6+5yLKzNY287JgbsTSRFr7m577T5t9mtkKouShDqA=;
 b=oDVkNxxg77X4Q914siCoh9lI3kGPdF87qLHl13NOYkgHWG/zyHAt1J55je/tNuE9GiUQakjLlPNgktncGOOiY91J2f8StMy1shvLL+UKAF5fsuLxAAS4HsiQX4bfsYXBeO0N5lUaa7EhTwneF/qO21lGltwpe7CTSFu8SaoSdtk=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:33:16 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:33:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
Date: Fri, 18 Dec 2020 11:23:53 +0800
Message-Id: <1608261833-24772-7-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:33:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc9c62ab-de18-4631-cb21-08d8a305a87b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB281637BC02D34860C2FDC1F698C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vojE7/3ALw98SUqEJ1CReKS46WqAXFGBi3ZzBp5u6kkCKUdsb+Uabnx3YhE5wrynkIa7to5HQRTvPECg4kcRTYNFdbUY7d65LwsWIb1GXAdSaERnSw2rQ41fXAdm8cCNOut/kOS3Npelk2PJBQP1f86+N/i1UQq5pnNjAI0Z7mD2/LYpyxNZqjkuaqma6YHQqfevtfEVroltBEfvmcVfQLjVyG+gnx0p0SaFGpJA5kR0clEMhBf7LaxOPSv1fVgytHQ+rTzMHhwhWQEFSPDWzfXTEdZQN2IgpvP4HVim4AY4gqZn0p5fP/nQRW/3iYRSGdCx+e7fb1k1vNrV1+rh+1j8Go9NxsN7c32yT61BxqLKC+/uINHcOAHrb5sSmyBj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(6666004)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(6512007)(16526019)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/l7PWUHb3lYF4jvWHb3bH2LT01oH4FtJJLk5EoUPNQq82s3Uis6YsGz3MhMh?=
 =?us-ascii?Q?ZBW7o33u529QQe5cwovNEIRM1GWqOGsqDDU2zKl6cmhwdjjfHpWqKmHfn0uQ?=
 =?us-ascii?Q?UNBiYycmNlg+zZcBV003gO1p3FtA7D5S4/hmcAdCCmCfVaq95ThTbFATF1gr?=
 =?us-ascii?Q?TQJC/OsSgPNSleTMc15MTIWHcoKhvxWiOz60Msamw+sdoWbM0Gz6Qc5c2mrC?=
 =?us-ascii?Q?zRqKqHQ7aKmFcgtE8FjxD04ftsUBotXsUVIM33n29cjAbKEo4BcN40jZUWVx?=
 =?us-ascii?Q?3mTuKMcWd4418+7PrD/7lJ8/YCwHp2aBtg8C0Grt/Ct7r4dTTYRUSG3vYe6K?=
 =?us-ascii?Q?4fybfuKCfwYuHo2s07mSwcEZPwjOe2rOQpOXXSP37It4/6gKK6/untyV2Zz7?=
 =?us-ascii?Q?MTj+N40cPzjd4H0nHdfmGq4qHnwe4GgA6tDzq5+lirLexxmfsjmaKMQPNrkm?=
 =?us-ascii?Q?l2U17qjeCWXEaBeUQy6OAJQnhBl2AQpjvtMZ58ULnuhuL/AdA+mV1di/NSJh?=
 =?us-ascii?Q?N7ebqIi2zcFYGoMQlUqgVM/1lT9J4zKCg7eDtpNgaa2WOH8IK+03k0AdxTKS?=
 =?us-ascii?Q?nT5oRGsIVx9IrpUYfJG4gNolfrJ2w1c8yxqCukA2tSxdBVPKHW1rng94f/ui?=
 =?us-ascii?Q?E1GFRndYagVHFwnINQO9aIttwgDxFJoC6u2R/qNC/6LGGUX0VY1wO+jubO62?=
 =?us-ascii?Q?OPx2rdgqkzSab0YBOMWqRz3ImcrRpMzBwjgbdhj19yclGrhafvUncjnaqTGX?=
 =?us-ascii?Q?AhTWu0zp6hKTgjmbRnrEdHij8pev6XZFIBZEvZOyLZaLEngDVCEavlkUepTB?=
 =?us-ascii?Q?IFZbQmBJ9VFqegWW2DZ7Kc42A4Scd5N8eWARbItEEuEKATqiXrYHY2eAFDsQ?=
 =?us-ascii?Q?TAP4HH1tznpD5AaImVLJZqIIGTWdgWK5mxzLRhhtOnNqJ1HKLnXSrRyJTj/9?=
 =?us-ascii?Q?SJhFVkRKBnEvRQcBwNDFN2ObTOaqCjY9wlQ2S7eyeH9skGsYpTszZXn+Rg4f?=
 =?us-ascii?Q?VEMY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:33:16.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9c62ab-de18-4631-cb21-08d8a305a87b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wijAK0nyvTd9SAciV0YP4yAYh9NaVG56eCA5Kd6hO5U12+dc4JbSyH1GJe4VyY+hyaBlstOyq2vtGKKkyuq7Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:32:02 +0000
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
index 17b92e6..96e05cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5846,6 +5846,15 @@ F:	Documentation/devicetree/bindings/display/imx/
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
