Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CD74F7B14
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAD410E761;
	Thu,  7 Apr 2022 09:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60084.outbound.protection.outlook.com [40.107.6.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AA710E761
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQytpUSNRN6y6loibCNc1L+MwJamFVmRE5VZgH27uuM3wf0xAmvkbNULvFQo5Uta9bQlS96gFitGuxmhgkpsVcZhrxeGzqwX2BYoUk0hLnTJmTCxYg+zevtkDvjcLRvhtyS/kPz0XzWqxe4pzrWpG4aWQs06lg8slbJjeFfV1ZV5w5uAh+fg1WVOkq2BblnXeEOzDbU/Q+CM7kmO3CG1hRb0TmNgxRfAesMi7GbBVED7RpRzv3TExzFckoBJKWGfGjpqnPdcvpz9YZC5aEU8w0lLzdqRP80ow3qL6JtAGbqQMx4zDZuVpt4vvPyAzbBkxJLqKXxbqUsCr0X2iAFIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DU7lwvgs6uIz7xu3oZjtqAQUnnMvbsfjUo4fn33lWI=;
 b=WU0SXxR4tu0winEtr4LdMi3Q5RAiBV5P/+Yr/zPAVmX7XPl9lxSkE3nAay6XTc4wlYGAi8gFxWsBI3bDEGj0T5bpROBghKcDnrMgfIlmQ9OwsJ97lNaLPAZsY9lxAVERHjXi99pJXDtZABx5QVcK/7TS1nrJMCkRIrj0a6lFosqcihLqAc7fhC7/xtcsg7jiKhBH0VYZWZU98Cf/t73/hB+9ibbHeGjq7L1ErQnPHocPpaqGIn3Fv/kb/tQGvlROzBb0k9cwDt58anzzhuCupxPaXWn0SjeCM9vaHYJcaaEodTV5GiAZDJ7tKn8RdG3cXHOENEeuWyTLi65vWdFz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DU7lwvgs6uIz7xu3oZjtqAQUnnMvbsfjUo4fn33lWI=;
 b=OIgz9QXt2AGQH6xz7UtnazA8M01Vx9aC5DT8VMXkZBWjN5UVKvmETWiZyk4aZ7Xx+OwqRReEEco39K506Ha4yCyiOjhd9CpasYyQcWf91y2Q9Q+p2YNXCW2yfBrVIk1giiHdOfzkX4Rgg9qtQxLsFELtAP4znaURiKD88oTvU40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Date: Thu,  7 Apr 2022 17:11:56 +0800
Message-Id: <20220407091156.1211923-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd10edad-994f-4d6e-7fc9-08da187685ec
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB9344A74F5B76AEE33090BF6398E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 076/uNLZdSyDsv6RljIQWHifgsEnzUhDFTkLyh90kb+5FAeQQwlWFsq3BLC5CUhJFQjG1GtwdxTSx5woZOOo4KT4WBl9OtCyNbYfXzRyvX5IQbcEqRuc0glVmmtVDni386uucAfRnY8I3KaHXR+nviBDUoHHOo4uniT66VVkDMGV+JrxKlSlE/EL18T6fyjbbKk/knkENmZxQptH5OcfbgyHwx4mZMQwzWRFndIPGjHd97aC6nI8WBeqZl1PNv6Slk9TtsJeJQbS1gnyPP6Aog+w2Lsmtzg5zL6/ENAqhkD0MJ5uEJSNcbo/XBBC/SM8oze5wD3AA9OUsqZ9AjdQeSQxi63UcBBNwSZ9GHS6QoZJrQHTPTK1Xj5MDv+JHfG0VZQ2+S4ykP2/rWB7ZaHrvA/+Y4wksF/EWfHYwCQRDsvEF3/F7J4xF5pBAt+e+BnFGFeZ2QdXUIbx92JT7vtPFutqE/sSrMCMKCPWgDOn2JqXPkBVZqKRezkCyYINzYbWPyME+IB7SNgT+MGuRJb3SykHyOYXcKHsW3AOdfndZfzuIAuKvi1snE+aTbw8rFx4P3uZUhFTSL9MlLFn1J4nDRH8OCVc+7Fe0JZ8X79H6ANQYCfq49OVOGXnmBQlKpa1OEIWT6tPeGQf4UT4UlbViGDSmajndDizH4YrrSk9U+ELCdwvo3ng/YziuDvBJ+2wQNJwWocn4O04CwFp/sVYNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(6512007)(7416002)(6506007)(2616005)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6vQeWEfIWVwrzqNKXY5xeOSYww6DrsNrkwbC4IGl21lwojwWUEiLYanA34Va?=
 =?us-ascii?Q?gn7d0i2+4IqUVCARdtSp8ZEAmGcRu9e92kO6irLxJUyuNvTLGA4ecCxbsZvF?=
 =?us-ascii?Q?w78JGcyEV93m7n+RMrBoYnsy54Nsbi3dvRfxtfh4wfvSWpSSJaJXIDLllBC3?=
 =?us-ascii?Q?p+Dg7im9BBGEvXFNaT21wGA1dUwiXM9Q+mHo82zIRNDUG/k6Us42ap3KhkXQ?=
 =?us-ascii?Q?veJJVVjP3cbYkRGx1c3tAz+Xe0uytXDHVAt1d7HqoBLlJ1KD5z3nsLEm0MLZ?=
 =?us-ascii?Q?8CdOQ3n7nKrjUk4uLnY9CY9NZY396D/Nly6dh04+xbBHvEJ9Mc+9qPT68Xiq?=
 =?us-ascii?Q?xwxgJkZFahRXbaIU21jWiH+xwPmb1YUwFdPC7R6AlOMuetZs7BGW7poRGtDv?=
 =?us-ascii?Q?/F7KoNYNyPhRbmmZvikKb5dyWz2NmwyY4cISgbZQta8roO2nJaKSgZLjczN5?=
 =?us-ascii?Q?szHhJWyvOwQ41M7G9UQ6sxesTAkx3yQVO/gDWlDg2ky4SoWI7Ro2CtnzZ1fw?=
 =?us-ascii?Q?aKeHhpFRpRMrxL/dWEcNxXwCDfhfFUnESYxRX4tR/LkZjx69bF4zeV1rdtWu?=
 =?us-ascii?Q?Ow4y8nXJoqfNRVDp2bBmHlZDcnprDrLC+kfsL0osKHDrKRVqP9d1h0GPVh8W?=
 =?us-ascii?Q?lWR0MQ6gThzMpzjYA5Im3z6Cd33YaempKfSrnJXsw96+Xo2UqPU7Iq1RrDro?=
 =?us-ascii?Q?VWCB/RRA9eUDn1I6u1nhMwWpVwu/yBgL84htgphqjRvVLIuT1pTk8qcVqZ7+?=
 =?us-ascii?Q?KtMLQs0ydyx77y0DneCtlYDTqLJhZZoJzLZJqTmvOLeC/VvPvpfMCvjTwQ1I?=
 =?us-ascii?Q?Yq6oe1l+477wbIbClj1PyDtlwTmlrSfv9tz8NO0tlLIfHQMLPiuPUTofCK2f?=
 =?us-ascii?Q?sr52ydjp3gqT/ulez+o/q/8bwAuB7wsmkLij68NuAkFz9lA3wjuyJkU+1kwS?=
 =?us-ascii?Q?fUSELxEFRfBLfD/9OlRaUA+eXfqaz3+ACZ6V7ODOdiF20OPspnUneC5e0c98?=
 =?us-ascii?Q?t5kh2JSKg4qPCThk/1AKsp+CPcqQpOiOd7k2pt4wPvca16u98cRqB8xwPV/p?=
 =?us-ascii?Q?lWt4HvnYo8Fvwn70OfIX447KPmTxUybq9hcI/W41CSQaE7PfKH3VEaGDdBrn?=
 =?us-ascii?Q?XDxEsb2CGXWJuMymo5GjaRdZI0xYe/qgvy5u2tskag8bfcJvleaPZ4uOf3yd?=
 =?us-ascii?Q?2dCBfIIcp8/AW8+/EQXP/mAW2QFqItvucb7vrlhWiy2gHKG4sGvAiz1EY4Za?=
 =?us-ascii?Q?KoeMbWiQL+eGpmJ76ITOA+Xdn5dfor2sarnHJStEUZ6wp4cE1ApwYkL1e+g9?=
 =?us-ascii?Q?ZvgtIChCz0y8/ZwdvlcUV18lZX3YG+aKRuPJr0mkSTmni1+n7Gdzsb84emhP?=
 =?us-ascii?Q?k7DA+V3NlftecrOiqoynVc7Ccux1bjPbiFS61Vvk4kg4gDO/aK0mfy/Z/Qtq?=
 =?us-ascii?Q?9AxUWOwRkmVWEVCohDje0wFiqG+JNDiojtiPHbN/Mdg5GXm6PSbep8q0iucT?=
 =?us-ascii?Q?For0dpcmClva2S8cA/wj2ryU6Ih70PE4XN2gr9UPsJTdQedSYtoxBIikYlfN?=
 =?us-ascii?Q?ig9d4F1lXkPW+isRcPsVpfIMzOJ9iacHIRP2L3dRkZWSZOH1EJkPW1UC9XJO?=
 =?us-ascii?Q?MKMS2A+FP1n+4z1xei3+65F2uQq5aXPQq1FySg/ZntVNyXnQdpMID3Ptyn/V?=
 =?us-ascii?Q?N2rkh4qt6B0Y7GQR4vA38dQTrg15W7QnWKpEGhF9BzEZyZz0HTvjCob6T6Za?=
 =?us-ascii?Q?0gWJdO2NNQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd10edad-994f-4d6e-7fc9-08da187685ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:56.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HoTO1nu+oYekie2LAPB+2kfg8AgMTuCRT2MD05o1qTdSVNhHCMYaJGUO6Ibsximwidh7f2ps7uQ+57NUl4hhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
 laurentiu.palcu@oss.nxp.com, krzk+dt@kernel.org, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the i.MX8qxp DPU DRM driver.

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9->v10:
* Add Laurentiu's A-b tag.

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
index fd768d43e048..8b33b0869e4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6572,6 +6572,15 @@ F:	Documentation/devicetree/bindings/display/imx/
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
2.25.1

