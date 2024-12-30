Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483AB9FE1D5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 03:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B540610E44F;
	Mon, 30 Dec 2024 02:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KFPh/sbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803210E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dd7qz2ai73swXHdLRYGfogsbkdGLOHzYZhbrVQ6nJjmXb8lIu+7bQpv0rLo6FXrrv6IFd7xU3FQKnZNdWOlNAzcS/9D1cLs+/vFE9EyvAaghIh2aqM3UxxUYE70H1QeKxpnidQ/qRW/vtlmGg5ycjg4U7MMxm7z0Zu9q0B/XtN1KIZaI694yNamo906TyX8cmR1GpDDXTk6lIHnmZ1z7zG4V5Yod8PMP+RKfC03gDR2htCt9IV5ZlzbGARFj6Pige/VgY369OQvqqRBI6dQdD/F4OYKLDY6W944/o/1DYq96mda52Z5Ba6a0FTv9CbH2b5W9LK650/vPBptvndW+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=397/Hmb6pCcsHLs0k7LCelc2Y7nbfIpflL7n+AO0m+U=;
 b=BQ7urfkCLtsXegty8g2DFro5JUOb7LkwqUDwzmpmUVbqdJDLBDmJkdxUmEYZCVoVJB5KO2KWQo4n5P2sTLNUKnGDowb3e+8csvsZkn0fS9UvkehYB5mPINhBpG5pUHryvqnt59TBMlqVxfsIgEDGWBnXfQi1D8SG7aOF3vSkQPaFKMMkuorIEDtZGeKTcWipe1CXHeVkjMkLy0gvhjuK8Sf2io+8FXFk1qG3x+qkMKycnn0EPBKYc4udXtlGx426jvspVMrqD4nitG7aonknEnxkiRyaZtD+/mj49BYvB/Ryge6uNN5ZVwQY5a2Sh3DfXwNLckg7i2j37Rmjn5Dm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=397/Hmb6pCcsHLs0k7LCelc2Y7nbfIpflL7n+AO0m+U=;
 b=KFPh/sbxOC9vwODGxma7WNrTNBvcWcCJVoiQAMYv+0/ZR8LYzsYm2SIifzt5QL8gxmmcJaZC5HfEkjHnvJxsZxiZRvT/mrJd2OCsCplG9BCdB2NMf5MJY6xZFmbq9WVZmUNZJJfcUXg6CSYhLCwCTc32i9JcIbg50f4S1TLNgOyKAnaYdF/MQCf371P8f7WRO1PtZGS9fNwpfyWJLlLzr+BfV0w1XeSR5WId3ADcwj9Q/lF4mSOUCCA7ueoJyMCCKtd1lEVzezc+6GpVNjFVs87HsU9DkT2VXp/JSLHYZbAueIiUZqv1vtM1vwg8SsRGanTGb/cQkpKb/GxV++Bw6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:13:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:13:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v8 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon, 30 Dec 2024 10:11:59 +0800
Message-Id: <20241230021207.220144-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a054aef-4810-4f8b-875b-08dd28778cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U38MEHrJ3XLL30EuO0LyOEc54+GUpnuWiOsFw62lSVKo/7Sx7oCMfe0dkgsO?=
 =?us-ascii?Q?BDuAAIOzxExQ4Hbdh4uPbNxGQKqNrLLU8XVWuLlxO6kfiggz5A8kL4yNAafP?=
 =?us-ascii?Q?KKEPbMe5YRzio8Py8LGNg4A7qltHugssuADB+c1HaeP7auMF2PL2cO74guCS?=
 =?us-ascii?Q?//O/GE4XKUzDHrUOEA+jKkz/UdtqGiSefiPZf//3MzaG1fhSCFsDSLXcXdB9?=
 =?us-ascii?Q?G7UaqATOJou2/q8tUJ2/b0E9zUkXo7UFhiRoPV9ApQw/UxUhHZPT35m5ESk8?=
 =?us-ascii?Q?9FvxvJChcplpW6dRnGzWiZoowjmBtD9ifg4h4+1pE2UE/JVbseYuUBrXrrtn?=
 =?us-ascii?Q?DFKULQNFUCA5LVeka6EqVmxYByiXJ7YNxQS0MlUUqOdGaE6wmYEvNTivcDSv?=
 =?us-ascii?Q?wb0gIZdgKQnmjMBsOz73yGMwImFlJLfGVLkS3XFbJ4mFXOQX3+YDSQCMxfZN?=
 =?us-ascii?Q?DYrDWtYXNDEm2NnvVGYtEiYQk0rPIKbFxfA9Rw94A35b8hxn/9skS1tl9JmX?=
 =?us-ascii?Q?25E467bSYRcFVvtcBZcSKpLrZsLJ1YqEgY5DhaYTVpgnvGg3S389f3RSp9AH?=
 =?us-ascii?Q?Yw0Cxk2kCtrsUUJnoyzKLBH5Iavqd65c8T8EU24LTYlVyp+EbKGFHd5X5989?=
 =?us-ascii?Q?x6wbre7zswCiogGgDvD04zrfmqHSTZLdtO33fyCcmwV0xhcXdU4PFc97jjAS?=
 =?us-ascii?Q?34qattlzjgPuHbRDq7N+jxd20gQ/G3/3Ja/46quX/OMbuBtTMsVRLjbbTGY/?=
 =?us-ascii?Q?Qhf6ScM1SUI8tSp2ZfWzPcFoiwyQ3m5PWBXQWYQBCZLtJlrVXb5UzvnEYTod?=
 =?us-ascii?Q?PfAzInRQwF9fAZrYFurzgfuHCSc1SWZx+IjEUSY5x0UBsvWEiTYSqreNwqP7?=
 =?us-ascii?Q?udPxrFmUed/8GI9ghLOvWSDRJslmVzoE25sv9HoEaEM44OxtYi/fFdQ6leQv?=
 =?us-ascii?Q?adt6Wkynx4NSGl8kcWpOayLLrYavprmCdXtPSetav2XBALFb3psp+6y5HgRJ?=
 =?us-ascii?Q?XQMeHsvLDQ3rhRtYLjR9Kpsk2Ghx9tq5OElqh7SUeHwiaOzRNozUQGuJOYrm?=
 =?us-ascii?Q?lTXRiZHUewe6ULJc4SID287c5F9om7ZpwwxGeoLj41Ob7UzPl1WjMWENjtoP?=
 =?us-ascii?Q?1vCtfX4wwyI+KRg2txe9uUgX92NH4pdlvUAbkUJUwOGbOilCFpckMDG+Kz9U?=
 =?us-ascii?Q?EwtN0y/yS3I0wrw6QPCii33Q5KlIKeeegiukeTi5HdwvSQJK43BQfBPiQowY?=
 =?us-ascii?Q?1eZEejfOBxnsQfA4mQw4DoKH5v737nXSUNA7z/uvSd1UxVcIFU3F4bZBr6bn?=
 =?us-ascii?Q?jecorpGWUw06cXsh6bfiX++2CHxzkYaAvCZ31hUP7zSDdJWiHvI8CqGQpdEP?=
 =?us-ascii?Q?v/ICLUvYYBy+fUmhTqs82zVzMg4d0ZxTjDFjmdhHxs/6uZMyVZwo5bV8gvt8?=
 =?us-ascii?Q?hIckHH21LvnrNILMiqZyR3+k0iz4ONRO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tjdbc6Nex3wOfDHJ6aXr7EDkHPC9ULviP4h7q+xqOotJUpx8Rerd7O6sPpa1?=
 =?us-ascii?Q?l/qG3Os1dTDzAq8sBAZ3rXD+nuxg737cp+at/TNGCZCeWROH1goFsdBsZUeB?=
 =?us-ascii?Q?rKKZJnJZPgRDYr5jT2Mqg84TMYVsdOO1FuIZvLXX6swTKUwK1kp/NGG54HxS?=
 =?us-ascii?Q?dRKUOy/WxtY4DD39RWPn1HSfINwzFDNVgJfFKi/T4I5QArA2esSsYg9T0CmD?=
 =?us-ascii?Q?Yn4iC5Z3F3YSCR4OON2UkVFWvcxleDMPUe0H1gu02pYHmlCk73pS1gkO+ZJD?=
 =?us-ascii?Q?bA3uE3W8zmEtBROdLWg5lZUnIgNdeyPmYNiRuXKrrfu+voEPUR+PAbyT4Wrv?=
 =?us-ascii?Q?5wrSlmTVoAhEvzB5CiPHDvKAyBI4J7sl7uQMReksZsPaJcs59NQ+mYToYqiN?=
 =?us-ascii?Q?Nd98JZoqihUhQlKTLgQMLYYqlSoPw/oA8WoqPJyeKBB5MRhCUHgzY65ZkIBJ?=
 =?us-ascii?Q?I9rXc0ZT6mp7jXA952USzo0dzb+3hNbBPJXgvIHFGJJkrzqjjnU1XxKJi6pQ?=
 =?us-ascii?Q?qa3nyohsfu7m/FZJL+EKC4+gf7iJIM5TPtZJqC5GN66yPuv1FG6PFWE8Twy/?=
 =?us-ascii?Q?CywMgNBWJS5ITdsTXl7GUmkOjAiIHtgMH24vG8hSflBEy4itFEn7+GykuJ4T?=
 =?us-ascii?Q?22s/hFA0fZLnwhdu1y/+QAzVcEwlzaYv497LaxzsRwNTijwqhNmDe0CeQlGY?=
 =?us-ascii?Q?0HQTnnt0MrD13OP4zcpVIC0cCPc1CW85uE/ngmyyRFW6SYsgGjGylAqsziix?=
 =?us-ascii?Q?UZ9Egeq8CxAkmDeUvwPN6W/jub483OCr8H1HD5Ep+dWc2LyXwDGuaDyrq1mp?=
 =?us-ascii?Q?UWfHUj2ce2+Fcx3wageFz5cxpkAEvADKk91Hu0k+4b3d04b8ihkZ1A31TEeI?=
 =?us-ascii?Q?uS3gpkmIBZrz2APaJpoTCcwZeafRdYyZVKgb0Lv1cj+b8qYNcBxvYa389cEQ?=
 =?us-ascii?Q?Fk9IlX3wmJ95MKFtmACE/7k9a58xdwJbmM8nPpzj9AuXRCsEZAIUUzVNZz1/?=
 =?us-ascii?Q?6TjV/THWix8GTUZCPc5QLVnHBc93d3du+ZBhgI7sG+HSYDAw/gtOIOJPd7jX?=
 =?us-ascii?Q?708gXLNf2dEsADWFLtqwU5Rdlsp6vp+DGDmq7Y1lujHrY74B0thiQ74tDy7T?=
 =?us-ascii?Q?iLhyff9f6qljQIel1JghPXRMJKqzcjckE4s5UJtaE+Qi/gRr1u/vhnmMPolx?=
 =?us-ascii?Q?jYmHtNvfDHmjx/9ySPkEMFTPLIGV3gPCjq+IDkEhrZAoAotobPUgL/YFmVzY?=
 =?us-ascii?Q?kCfxbyWrVMzLVIhYMK22QHWBsDiuwPI8kuzj+/aqvbESFpaxPj4XeWAapqxg?=
 =?us-ascii?Q?QAH3Lef8MQg5WWDSn8vQRCHn0KgGXPj2bgnc5XDXGHXafkvMBQj97bw9wZg0?=
 =?us-ascii?Q?xXikZYhzPmC+wqRO+u8A6wuStKUZ/V7e/FvpVQyT+aspr84pxeRaUi6ld6J/?=
 =?us-ascii?Q?lgzLcsSTAxgOJ8dMRUWkKMyVfNNzc0EDbxgPI/5Apnff1MQpOG7gagpIClCg?=
 =?us-ascii?Q?+azNsdj6vOsXIORWA58dFkGUvrw1nj85Gv9x36FYU4X6VJY7pjdbNBNi/Vuu?=
 =?us-ascii?Q?Qn+9U6DhZDiym1BFqOYtf8sDNHm0S51lAzYlMAf0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a054aef-4810-4f8b-875b-08dd28778cc8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:13:28.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAnP/oGvDCakK1CLM6tfHD4VtGTo9z2vSDxEMzPCJvvR1EVVrRdeiFQqXfYOjTVUz3tggPCwWGhqprzaHBKZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.  Add driver for it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* Collect Dmitry's R-b tag.

v7:
* Fix regmap_config definition by removing name field, correcting read ranges
  and setting max_register field.
* Collect Maxime's R-b tag.

v6:
* No change.

v5:
* Replace .remove_new with .remove in dc-ic.c. (Uwe)

v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_ic_data data strutures.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the driver.
* Take DC interrupt controller driver as a standalone driver instead of a
  component driver.
* Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
  struct dc_ic_entry.
* Call platform_get_irq() from DC interrupt controller driver to make sure
  parent interrupt controller driver is probed first.

v3:
* No change.

v2:
* No change.

 drivers/gpu/drm/imx/dc/Kconfig  |   1 +
 drivers/gpu/drm/imx/dc/Makefile |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c |   1 +
 drivers/gpu/drm/imx/dc/dc-drv.h |   1 +
 drivers/gpu/drm/imx/dc/dc-ic.c  | 282 ++++++++++++++++++++++++++++++++
 5 files changed, 286 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index e1ef76d82830..1fc84c7475de 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,7 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select GENERIC_IRQ_CHIP
 	select REGMAP
 	select REGMAP_MMIO
 	help
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 2942ae6fd5bd..1ce3e8a8db22 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
-		    dc-fw.o dc-lb.o dc-pe.o dc-tc.o
+		    dc-fw.o dc-ic.o dc-lb.o dc-pe.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 7c64acc863ad..fd68861f770a 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -15,6 +15,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_fg_driver,
 	&dc_fl_driver,
 	&dc_fw_driver,
+	&dc_ic_driver,
 	&dc_lb_driver,
 	&dc_pe_driver,
 	&dc_tc_driver,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index b9fe12577a19..e4c2d564ab5d 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -54,6 +54,7 @@ extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
 extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
new file mode 100644
index 000000000000..66884ce72b5b
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
+#define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
+#define INTERRUPTPRESET(n)	(0x18 + 4 * (n))
+#define INTERRUPTCLEAR(n)	(0x20 + 4 * (n))
+#define INTERRUPTSTATUS(n)	(0x28 + 4 * (n))
+#define USERINTERRUPTENABLE(n)	(0x40 + 4 * (n))
+#define USERINTERRUPTPRESET(n)	(0x48 + 4 * (n))
+#define USERINTERRUPTCLEAR(n)	(0x50 + 4 * (n))
+#define USERINTERRUPTSTATUS(n)	(0x58 + 4 * (n))
+
+#define IRQ_COUNT	49
+#define IRQ_RESERVED	35
+#define REG_NUM		2
+
+struct dc_ic_data {
+	struct regmap		*regs;
+	struct clk		*clk_axi;
+	int			irq[IRQ_COUNT];
+	struct irq_domain	*domain;
+};
+
+struct dc_ic_entry {
+	struct dc_ic_data *data;
+	int irq;
+};
+
+static const struct regmap_range dc_ic_regmap_write_ranges[] = {
+	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTCLEAR(1)),
+	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTCLEAR(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_write_table = {
+	.yes_ranges = dc_ic_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_write_ranges),
+};
+
+static const struct regmap_range dc_ic_regmap_read_ranges[] = {
+	regmap_reg_range(USERINTERRUPTMASK(0), INTERRUPTENABLE(1)),
+	regmap_reg_range(INTERRUPTSTATUS(0), INTERRUPTSTATUS(1)),
+	regmap_reg_range(USERINTERRUPTENABLE(0), USERINTERRUPTENABLE(1)),
+	regmap_reg_range(USERINTERRUPTSTATUS(0), USERINTERRUPTSTATUS(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_read_table = {
+	.yes_ranges = dc_ic_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_read_ranges),
+};
+
+static const struct regmap_range dc_ic_regmap_volatile_ranges[] = {
+	regmap_reg_range(INTERRUPTPRESET(0), INTERRUPTCLEAR(1)),
+	regmap_reg_range(USERINTERRUPTPRESET(0), USERINTERRUPTCLEAR(1)),
+};
+
+static const struct regmap_access_table dc_ic_regmap_volatile_table = {
+	.yes_ranges = dc_ic_regmap_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_ic_regmap_volatile_ranges),
+};
+
+static const struct regmap_config dc_ic_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ic_regmap_write_table,
+	.rd_table = &dc_ic_regmap_read_table,
+	.volatile_table = &dc_ic_regmap_volatile_table,
+	.max_register = USERINTERRUPTSTATUS(1),
+};
+
+static void dc_ic_irq_handler(struct irq_desc *desc)
+{
+	struct dc_ic_entry *entry = irq_desc_get_handler_data(desc);
+	struct dc_ic_data *data = entry->data;
+	unsigned int status, enable;
+	unsigned int virq;
+
+	chained_irq_enter(irq_desc_get_chip(desc), desc);
+
+	regmap_read(data->regs, USERINTERRUPTSTATUS(entry->irq / 32), &status);
+	regmap_read(data->regs, USERINTERRUPTENABLE(entry->irq / 32), &enable);
+
+	status &= enable;
+
+	if (status & BIT(entry->irq % 32)) {
+		virq = irq_linear_revmap(data->domain, entry->irq);
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(irq_desc_get_chip(desc), desc);
+}
+
+static const unsigned long unused_irq[REG_NUM] = {0x00000000, 0xfffe0008};
+
+static int dc_ic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct irq_chip_generic *gc;
+	struct dc_ic_entry *entry;
+	struct irq_chip_type *ct;
+	struct dc_ic_data *data;
+	void __iomem *base;
+	int i, ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	entry = devm_kcalloc(dev, IRQ_COUNT, sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed to initialize reg\n");
+		return PTR_ERR(base);
+	}
+
+	data->regs = devm_regmap_init_mmio(dev, base, &dc_ic_regmap_config);
+	if (IS_ERR(data->regs))
+		return PTR_ERR(data->regs);
+
+	data->clk_axi = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk_axi))
+		return dev_err_probe(dev, PTR_ERR(data->clk_axi),
+				     "failed to get AXI clock\n");
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		/* skip the reserved IRQ */
+		if (i == IRQ_RESERVED)
+			continue;
+
+		ret = platform_get_irq(pdev, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_set_drvdata(dev, data);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to get runtime PM sync: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < REG_NUM; i++) {
+		/* mask and clear all interrupts */
+		regmap_write(data->regs, USERINTERRUPTENABLE(i), 0x0);
+		regmap_write(data->regs, INTERRUPTENABLE(i), 0x0);
+		regmap_write(data->regs, USERINTERRUPTCLEAR(i), 0xffffffff);
+		regmap_write(data->regs, INTERRUPTCLEAR(i), 0xffffffff);
+
+		/* set all interrupts to user mode */
+		regmap_write(data->regs, USERINTERRUPTMASK(i), 0xffffffff);
+	}
+
+	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+					     &irq_generic_chip_ops, data);
+	if (!data->domain) {
+		dev_err(dev, "failed to create IRQ domain\n");
+		pm_runtime_put(dev);
+		return -ENOMEM;
+	}
+	irq_domain_set_pm_device(data->domain, dev);
+
+	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1, "DC",
+					     handle_level_irq, 0, 0, 0);
+	if (ret) {
+		dev_err(dev, "failed to alloc generic IRQ chips: %d\n", ret);
+		irq_domain_remove(data->domain);
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	for (i = 0; i < IRQ_COUNT; i += 32) {
+		gc = irq_get_domain_generic_chip(data->domain, i);
+		gc->reg_base = base;
+		gc->unused = unused_irq[i / 32];
+		ct = gc->chip_types;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
+		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
+	}
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		/* skip the reserved IRQ */
+		if (i == IRQ_RESERVED)
+			continue;
+
+		data->irq[i] = irq_of_parse_and_map(dev->of_node, i);
+
+		entry[i].data = data;
+		entry[i].irq = i;
+
+		irq_set_chained_handler_and_data(data->irq[i],
+						 dc_ic_irq_handler, &entry[i]);
+	}
+
+	return 0;
+}
+
+static void dc_ic_remove(struct platform_device *pdev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(&pdev->dev);
+	int i;
+
+	for (i = 0; i < IRQ_COUNT; i++) {
+		if (i == IRQ_RESERVED)
+			continue;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+	}
+
+	irq_domain_remove(data->domain);
+
+	pm_runtime_put_sync(&pdev->dev);
+}
+
+static int dc_ic_runtime_suspend(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(data->clk_axi);
+
+	return 0;
+}
+
+static int dc_ic_runtime_resume(struct device *dev)
+{
+	struct dc_ic_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(data->clk_axi);
+	if (ret)
+		dev_err(dev, "failed to enable AXI clock: %d\n", ret);
+
+	return ret;
+}
+
+static const struct dev_pm_ops dc_ic_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
+	RUNTIME_PM_OPS(dc_ic_runtime_suspend, dc_ic_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_ic_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-intc", },
+	{ /* sentinel */ }
+};
+
+struct platform_driver dc_ic_driver = {
+	.probe = dc_ic_probe,
+	.remove = dc_ic_remove,
+	.driver = {
+		.name = "imx8-dc-intc",
+		.suppress_bind_attrs = true,
+		.of_match_table	= dc_ic_dt_ids,
+		.pm = pm_sleep_ptr(&dc_ic_pm_ops),
+	},
+};
-- 
2.34.1

