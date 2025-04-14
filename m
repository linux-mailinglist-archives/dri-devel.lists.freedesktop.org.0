Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09538A8766D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C8710E462;
	Mon, 14 Apr 2025 03:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DLqD8aCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE49D10E462
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAMBjqxu2rpXxP6wqTrYe1tLt+XBJujGYW6GCUFzBKe9Cvr7jfKngNxRd7E9CwOhaMnXlDvgE+lLZ4+6zOB4ch5k7+yJokAE31lk0urf6naY1dqvgT0ZD4llYKt0ifXR7SzNijsQZwv/lvoBB8RGdEPNMj0oJQxxsqkAC4wuzQpLjOlKmm+9J1aM3w7AF14T6YXdKPFGCnchSSBP7w56KpREFWjz74P5nM5zGKwqyTqFtVvzIsqsyWdWtyjviXvxeKLev7DSKF7nIzTAK53iJvPGM4aUxFuW23lgilkEhFUkKjklO88+2BY3M/p6YPSkwdc/4JqVnIkWYIIxB7NNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gBdGgm+wPAnS1YfNS3rp74WxcBuPReaxpZf/KTTxbM=;
 b=Eai46hDNy+9rar1NBXEPzPoPoLXhDNqsNnUzFrU/Rdfz0Bx3fDAjO0LL0O2xgtFGUmpI/ODOH80qHymBUNglR7DMF6oOOiv4ZbTRRO1o2GJmfXWuXt/m7ulbKVXQGrFD9KG1KrrYF8JhnoDKsH2Wb2rK0JTSZMa7iW9rMJlk8J9EEfH5JZ6IiWX0jPdL8fUtUTmxHPEPTq+WYrqJltT7h6673qAGBpz0/vMr9nnO44huTfrypJcsb7I1zGSZcTc5lYqqtcR7n/Xbi1iyt5FdJqc+umbhlFKY0ZC8oO3c8ZE3EvkjhJjDlDk45gZahRdmDVQbqMI9l6xncOyxItb0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gBdGgm+wPAnS1YfNS3rp74WxcBuPReaxpZf/KTTxbM=;
 b=DLqD8aCYYbe81NGB+/GFJmc8NK4N3GWeIqmy/4ZfPb9ZU3oCVWDaTQUJPHqs0dBxxv1mu/W35x+bpVh6S1HHGJ4SZSb/0EpDGDvJ1Up9CiMEte0zjZZTUudB1bc5BxBJhJOp1oZDfKAKwwydweMsc1Z4g7totTxqnJZja0bgQxjH+fqUorZkjMk9+bOl+QrQ/E62Mgll324eVeonotIw3rP8e0FS3N9s73pLfksc1nGrtqS3I3kvhB7v2um96JmxIR5yYLsHBRDRiRh7Jo5u3iwh1EHi89OkqcHwydn+hn1WCzuG7ljINhSZ5lHEP8BUaNY9+ioa3TyW7sRPdsQgeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon, 14 Apr 2025 11:50:20 +0800
Message-Id: <20250414035028.1561475-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: b41df072-5524-4f6d-dd12-08dd7b078d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qIVuQwHbV9dMS2DhJtrxLq6l4N4o0rtzAIlP5WVP+xJskxSuwxcObtQrT/1w?=
 =?us-ascii?Q?ERabzOf0IFWxDJSlvOWUDQ3n5+taWY68icSbBiUaVsYhz9aPiGa1FdomxsJ3?=
 =?us-ascii?Q?8fX1M7p+xr3GFPgz7wFinUvUWx6NSAjgh1YFMvu3lssgZ1O6H2oZCkbTINI9?=
 =?us-ascii?Q?cnzjWZy2qaaK9t9YQnMBRBHQDxEXM+1r6e/TAs+iL2b2azucutJ8ydYbArUT?=
 =?us-ascii?Q?oyi8V7b0964tQiQjMXs/ONftKx9wpDQp9lg6lldyTssTKU7WG8Ws23AsIkWv?=
 =?us-ascii?Q?+cRobkggfItg42MmLM8DeS+hbF7EkNNtxpzCwCQKcrfSHzTiSqAVNrRpinIx?=
 =?us-ascii?Q?qEESdqU74rRXJ0thyTsZMFa1tFkj+DwcnZoYXco7A3wxww/zEG34VLiHS1zf?=
 =?us-ascii?Q?BJRhENcbKDwhqlUXu4kpIHwo7aJ12jXnPn2uxzq5qFtkCI2oo4wqIl/qqDf9?=
 =?us-ascii?Q?cu2Tuaqw68a0ary5+gvUT7N8yA+Ln7GYRaR9eHJ0BgRH/RhNI1tWwFBO80Th?=
 =?us-ascii?Q?46nQF7x+gFEW817dHMXjfQHdM8NkmhhXsuxl9bTmyP7ObYyWy/e9uG/0CFYa?=
 =?us-ascii?Q?4WZgy/Qhzodiny29R1SR4sgj5wZ2kIkiqgjucx+e9fnAQj8zb3YUUV0pRXCq?=
 =?us-ascii?Q?QZy/fguhNIF17Ug1fHHfU1GXqj4r5ftLJojYYVF+MF9T8NynOulRF0dI3TJh?=
 =?us-ascii?Q?fMKXCua/iOm2FDRgIhbgQoonh1JlJsgj7F9HAkWt7yw8V7IwavMWiuy/hVuM?=
 =?us-ascii?Q?MOn1VbYiX1vbhWN7ekuaiqCH6eUehMR3mXGt3dKpDJUZGSaHYbak7DJk/FUw?=
 =?us-ascii?Q?7tqleYV1LTx9bN88nHylg9KGvItI127//D6Ov4ZmCtd1FxU1/X9C5tiibTjo?=
 =?us-ascii?Q?sl5Em2eT7Rito76bmyw+EwqkBevC4eCOejKjGaSmeUmjW5PGNMqo69JnYt23?=
 =?us-ascii?Q?+6Ze6xKBYiRyMwqmE5f93vSvvEj31mDxd5OFUCIazmQw8kcGQVvukjFHiM/m?=
 =?us-ascii?Q?nmbVQ8m1Xh9MpAUNboIkSHpDP2IBQ2GG1brYBySaDrdPhmsyS/Jjk3yxwCLO?=
 =?us-ascii?Q?01TXuWmwYb3e2BjaemZH5L6eu8jWl2+hQhjlktmm3GSMDb5NZPu+qQmEE91q?=
 =?us-ascii?Q?6SqiPQyuhbgSx87UhsIez3nZTtioFhg0cF1VnvTt/wADkmQr5Dtd7ce+5udy?=
 =?us-ascii?Q?awLfoJZCEpn78SViVUPMA2A8p+ippX/TCV1pIGRrIHtAH6RI5dfL2flo60n8?=
 =?us-ascii?Q?nIJcTHY0xkMh/YjsWqiXr49fmekhXnFkyK2GcZW5t/lLPN9i01lTLCRwIX8K?=
 =?us-ascii?Q?x1Hq+r3demGUxISGXL2Co1ls1ISKJ7EMQjsN09RNkYz+kX+F+iBMrtTiD/Ck?=
 =?us-ascii?Q?KQeoQn1AtKchQM4/W75sKWgxiBDA6Yiz7cMZKgQwGY8Ix4hkXwWz9PVyYaBg?=
 =?us-ascii?Q?wqUDCQlfW9zNJxn+2dnPlu3VMB95DISF+XK9akft85uRUXuWeGp3PA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1UwHKGX++uNqTrSmG0S9SfxrRJO0YNTI6z/WcW8TfqruCvLwFd9pY18Dobi?=
 =?us-ascii?Q?F+KKqHdoETi7BED2WbUd6ZzmJhR77/Ea8tVSRbi2ybxr9l6Lakimm7eZaknH?=
 =?us-ascii?Q?L9A+6+z9SmTqpW8OmDHWSI+p1prQxoyAsXrQHUzFxh7bOMHnlsiRfrWMAI+b?=
 =?us-ascii?Q?amqyA0rqrYslvQHRu1b80lFqKqxD8n2UKhSN+vmtkUQGkEvLbnLEAwUOmrU0?=
 =?us-ascii?Q?0VplxeR8UePM//a/RuyAfFyaWPQ2krcCXz5EeE2WzdRp2WIXhJjZhPanF62J?=
 =?us-ascii?Q?hPnsg7ErKtqV9jZT0ucAEnMopiKLPCw37a4SxU4HHzydGdm7XDeuCuTVoG0n?=
 =?us-ascii?Q?WLsn12UukeqH7VMlgN5yVVto24NSN+lKYnT25dqDKbAjVZlumo26bu4DHgxj?=
 =?us-ascii?Q?xvIqeFSB0FxQKJ49QAj8wns74trLy1InpjODZDZp4VBfudntl8F7jPDFor2i?=
 =?us-ascii?Q?lizbFZuo0cmpgaP02A74YV9fnq+a8lihvrLrpLW9+DAgNEBEMxnzU0zyI81x?=
 =?us-ascii?Q?bWbCXpW/dhvK/Bc7IhVAvlutsWQpYYBppYPWyQbrYZkAefgykVJCnVcrpatc?=
 =?us-ascii?Q?z33udb+CNCvSYrxa8KAw6kQMf0aCruYoPAMl9BRRGesmCAbDDdyuFpGHzAxl?=
 =?us-ascii?Q?/P970VxMVxPIiAyqR4EIbvvAs+MZrTu9sku5Br0T9Fo33/Aa2UxoxOg6RxTE?=
 =?us-ascii?Q?tSAI9a2yrbRwRgkDVs2CekW8YXZERKBgiUbZUkyaoivrjzmS2djTLlgK+x/j?=
 =?us-ascii?Q?KHPou14VKyOpZOhO2nXzJAI/gNt517ebsZHCrU1FLDBVtdK23IeV4pG82adJ?=
 =?us-ascii?Q?8KEEfMUTH0aqHFR81RD4AXvUlrdytlhhlolipVu0pFYaGFKJVQPxnVkH0vKU?=
 =?us-ascii?Q?6qjWFtsOUTKxvBpCA2pjI6Huh70PipDzNBYkgBguIVxoENUo2ejpqrXla/uQ?=
 =?us-ascii?Q?UsB6hkMNIRcthnkJI29WcTUpTeTzLhZBc4dffqIWLhryDyOfspo7JdhSfk0Y?=
 =?us-ascii?Q?2CVFHV6iKpKbBq9YIA67R3xioPdo0bBUORmbbQAM7Vd44aTtRWuxQpfrvDw1?=
 =?us-ascii?Q?rAnGq0acKx91Gnb4/pRHS3epXIjqvfoPIyQSvgB26XMupT3B0bcmH54Wyd/w?=
 =?us-ascii?Q?EgpL9lwnO4pQTA9G/s+XrGXMh6ZN8Z35bx4tZBalNi5LHVsiIpRDJO1kxBQE?=
 =?us-ascii?Q?yz122D+0/HnaBUe8YNNONfekJgne6THzo3B0/fsQjzoJoQ30YN76PDMoLzzT?=
 =?us-ascii?Q?q3rBAMhrjnPPHszKlK818QSd11r6HppBQfmEGFQ0hz23lMVvBJsr9yX6cPO/?=
 =?us-ascii?Q?8BfrkrjQhRpoRSmNdRuF7G9+2RSaOssYTmPMtOXMQo+NwjEw9TDU9qN2yjcT?=
 =?us-ascii?Q?Wuis7C1NMySEpXD5opGu86iwuwswdih7rnVfQ7Lyyukin5gP7DB65xvkchUk?=
 =?us-ascii?Q?UaF0D9CnBd2jIZpo0pIaqnfpNQDWq0IdHUpuAi7s4CFuTMi53FEfOyCy+0HI?=
 =?us-ascii?Q?2LOiDSmLv5bHzma3zbvsoMKGLFuPgC123fglFIGCVncvmEIF0+j+bar5rIVZ?=
 =?us-ascii?Q?fBb+CGSephuurIj3bh3zGMmqRbIM1/g0fOEnyMPl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41df072-5524-4f6d-dd12-08dd7b078d17
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:52.0799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OXXuMoSIpx1NPADLCrTKlu6FP0vOY4N6v8CEV9k8rizy7FEibqC+NdcnO+3+9GWaaKAeBETNZdUtP7NuTIN0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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
v9:
* No change.

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

