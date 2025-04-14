Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D2A87669
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623A510E45F;
	Mon, 14 Apr 2025 03:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mEXE4ZHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013058.outbound.protection.outlook.com
 [40.107.162.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E210E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbEJLxhSbPAAOxDWx2xqK9gz5I9FyfKTeQalQWkOI8i6jThuc5+CNmNfIiuzZNyl8QZyKwpSGhJDIx0L9HNz7kWQU49vIjHyHpOrpUeAk9ubme8/2BvXwmZJlUKUWhDmNCLHbIbcqp4gsxDONcrxZ+mKNuVtzFEnc/GgjkcZI2ngX9oUAie+VEQr36LNt8VGhXFoXKW1BTnVxt+L2cmjtIyeeS5elukaejzVAbGqPkEJrVgIp9kn701x51JFIsVjaGU7VPmJ8VHyOhy/b1eSg3N+sUwnnAjNoPZaRZDECL+Hr8MCAhUeyzYKc5nIdts3NOv0tbDmkFQXErGnuodmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R55nSeN+y7oeVukyeV2ykUebUEL77bqWuirpn74lVOA=;
 b=snv0UdT+lX4MKqn2N1E3TamZFlApX0GFAcn8CRf6EiPVpA6gQuQlTbkc63+uQMN8xUT8E2Z1KJJMPzXaOhD9sn8ZmOlo7zYqtI3z2cmFjtnHyO0uRZ8E1tnZoiGiDoIhK7eheqiGGljoCLce2zYN25Zp2YC+VrpnKfsXlXrQHXvnBNGeQ/p2Zh9J24gbqBFCOnuj4U4gUzxDKU2eQOc7cJqLn+sS5xIgxXOGhZI+AlOBAmv+DKVNPRg5m9cquN//gzhoHd8AVCLxAGkbE5e8ldbVL7CfCpuHgUfFeqsArUrfJJzCILq2jG+PJG1brYmUkWdqyrK+gjsdUpRyizg0Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R55nSeN+y7oeVukyeV2ykUebUEL77bqWuirpn74lVOA=;
 b=mEXE4ZHObv3T1p4YM25Rz0Fru7Ag0yx1w/Sg2lPsRQfIpBsXpiSXlx1g905+v1zU5E0NRekXPn1R6p4j1FyHoHnXG65pj3ZtBrbD2BLbBXE4G1Z9VEd2Ce5h0hQZYHLgo42rWNuwuuh+g0/xYfSY/dPMwq076nYj3kAJJHYhEQUcM84ZHZbuqz8mH41Ieuq6J6WDbOxJcT8/K3pVR5dbhMNpZ0esxDqZ7p6s4DRWHi6AY73LBr+owucRWrYQ/QJXGfGilUbkaqozf5WZQMzrErMKPvpmrogxkFzKzWG/4z/2FnFyVPoUw3KcDvW1hjj1vt11XxqV+etcN2HFK+v86g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:50:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:50:36 +0000
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
Subject: [PATCH v9 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Mon, 14 Apr 2025 11:50:18 +0800
Message-Id: <20250414035028.1561475-10-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: caa1af6a-81db-482e-07e8-08dd7b0783cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v3Dev/7MKb4oXdcTC0Cp6XY1I4mb+fee08PZsWfjgU1SxqVpxcYGBwwIDy5+?=
 =?us-ascii?Q?42S11RMn7qlA5kSNzubeMqi7Y9VQk00c+SyqUUDru8kI4u104uTCY3Qb75UM?=
 =?us-ascii?Q?Pui1ul+TkqnLGaIPwpNBqqZxIlYZCSC7m6Eo+1c9JuzVk1b5xYz7Kz8hanjp?=
 =?us-ascii?Q?0YPz0QBThpb0VlM3wqAe+c+H/aDt/cN7yVDAuzIW6uyqBUq8TrkblbSP7LOO?=
 =?us-ascii?Q?P62EpACBuGWQeEF+deedvDJAEcyxv+wIyQQ5HSp5oOvdhhJdP1Pxb9Vry/jQ?=
 =?us-ascii?Q?9QnjRtQkN+3NgCwXioZBPqsv3GVpSUQ7kts7JHNInMRVXXmyuBJjRpNOV0gt?=
 =?us-ascii?Q?ykPHX2W8/qumQIoC6T5b3hDL3wCMhjvmQdR/AqRozy17nvg9e+dQgamAPZvV?=
 =?us-ascii?Q?ne3SQeLiUGjxFQGoeVupSBypIEqMQNTbv/Qg3J5mDUuBe4DSZS1NcNvgXfO2?=
 =?us-ascii?Q?GAzcDbZCXpk2VXdV/z0HVFhegzq/q1L8Cw+Pv1nFJN9XUKaDG4SyEhP5q1GZ?=
 =?us-ascii?Q?0TkaCSpn2ZgAiboHv1suPTJfmuYFa0kSogIrdkj9782E3fqMVlhUjIXjj+pQ?=
 =?us-ascii?Q?vou2S3GfPkAcqx0V23aeHu8FfjujqEfzsuyyAT/+oJ+meirVsD7D3QHq9NCJ?=
 =?us-ascii?Q?S/zB/azyeXQC6k8fyyQsf5m4RYsfqzlykuJ+0++9hhyku/pab0DTA8HivItR?=
 =?us-ascii?Q?7q234PauNdOhXA9YYSiXg5Vu+VmKzWKPIHzpKnp7fdmDqb0a89jIuR41DQyo?=
 =?us-ascii?Q?rvezRA+0KSu6ClC8uKEFZVicVU5R9XmNRUKFMavJeIiX5+o/b+2gVL1dCTBV?=
 =?us-ascii?Q?Z16lJDdqd4J8y744W0HF50Mve6r119NewnE5UqKhXiG9CoNbijmEI4B8W1JW?=
 =?us-ascii?Q?gBOWATcYCcclAdZhUCaLxp+YY62OC9rBf30NudoTiMAJmBNtBIj8h0WWHY2c?=
 =?us-ascii?Q?c2pkihNLDB+iiqMk6Rx+tTaNZ6k7kEZms3K3Ql6WF0hJlgKgzrDeWIhYPffJ?=
 =?us-ascii?Q?rJhvWRGu/ab0P5uhx8zwz3646qx0SEke6cgkI4uVyRy/pNVz8YaBdj/Jroms?=
 =?us-ascii?Q?LxfrHQ3pOc7F9H/KcoANcwij9VJFSYj8S3KJzm9eAawUHHHhBQ3mRafnYeEP?=
 =?us-ascii?Q?h9b7KoXSO7ZPrbrQ77A4tpXbRCnzr7diGGU6JQTUWdg5ik6jcxBlw0RougvQ?=
 =?us-ascii?Q?wVUhFeWMg2h/pKKK4ByaA8QOi2CagFe0fyxp8VP15ffPedXlonqzpzkNZ5Xj?=
 =?us-ascii?Q?saka+CIjXYvvzpUyUZAC+LwfplPeKKG0p7fH5N0AjllxLU9pR4B7/O+LrC6Q?=
 =?us-ascii?Q?lrEZ61zmz3XEvhAaTpZ1C7DhLDA8SJku16yXTj9rSmVX8gdyterqVV0dlzLG?=
 =?us-ascii?Q?bzlQwX/lAO3IX506I6Qn/ROwq2t8yyjjVmjFd08yz5hYTErjvKuoRGAF0Oi3?=
 =?us-ascii?Q?3g4tR30UkN7kc/Yf2RYnbHZTRR8b3WWRdDYilJy23Ijr1dUfQTp0Vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8uQQCUAcbUftPNdSQC7nkcwhURkDF9QLGUfAVg1d1wcnjO/D6bfD/xdRRFH?=
 =?us-ascii?Q?+Y8q5hiM7/aIyxZHE+0t/pqzEhbKmj5kEcAZ1Q/Eynf88GVVRFI53jv+FSxj?=
 =?us-ascii?Q?KnFR3HIwSoM19XjBiVhN2MflxSl1jSoarG5TnuQXry/AF/evvHQI/j6tKlpZ?=
 =?us-ascii?Q?vqwesgW7f2YEfPc5i8t+Wjr0Sy+G2iwjbQQU5Skmfs3Hzj7awsWslCEVJSHh?=
 =?us-ascii?Q?2yotA3V9q5TngKnVdXYNQpU5UhY/U6SO0BGD9Ax3CKxHnt2Uk93A2pDXxBPG?=
 =?us-ascii?Q?/biEsOkQ8HZBPL6MKm50Nya+zdsexSzopKsY4xtA2L1qbo5eFANUIDgE4981?=
 =?us-ascii?Q?Q5Uo+1bTkx5zwNaeIuaaEh6Enah28VZ7kReb5o6qxNT/TAThjXrTjkc7A9CZ?=
 =?us-ascii?Q?fOF4z4CTef22lRBWYBotJPGOouO5WeSRiYJLTdlwJL2dDNkDHJV52xzkSZvj?=
 =?us-ascii?Q?YGCEoV0N7eMnSaFxh6tYzEwGJcNDxV6NNCap8qYs/hhDBZiVyLcjzzgjMMvZ?=
 =?us-ascii?Q?edjePCHAPCSLJSjS7SHqYo9RxQ7mNAl1ek9Mkq6A7bKXwCT5uxmjEsEqJLql?=
 =?us-ascii?Q?6QY73nlXmtuAlQhfeBesHJbkJGS17uqEY31bhSzWQjROKlqbFW14qeCX4lnI?=
 =?us-ascii?Q?PxYsIwMwA53Fv3uXEKzfFpP6/jF4YnYFsofDKsGa/FqiaxOpYy409Mg4KMXQ?=
 =?us-ascii?Q?lWNR1ZKm8mW+6ZG1k8V2jccloFsW/18ymbmgYg96EMfnKxEdejpOUn3YRhIJ?=
 =?us-ascii?Q?C1LR1mjtorFsmHCzCMDMdtrLXpsCEKgMrp9CHR2HFDDQSA+0894Y7qZ1Q0Ic?=
 =?us-ascii?Q?dyHdKO+MaY3ePIs4+20WRjBdb6TAwJuT5adqnXp2obWJsicIiPzv6v40w5o6?=
 =?us-ascii?Q?YThdlUmA2sgoo2K2uBihgDCTcIM4kg//37kcMIQ5d+xU24Ys13k69kOmADGe?=
 =?us-ascii?Q?yj5hDunQZ9M0JRpVDWj3ih8zG3UM40crO55/4m323yAqr6QVayCmiKw45DB9?=
 =?us-ascii?Q?EVkcVWmmcz7diXlWb+JJMGm5I396NMqZ+bfoZGhOsvnejdK2H0/FYuXcQr2a?=
 =?us-ascii?Q?bAflq7pZnZ6kxKA66AqgIGZKko2LouYgfoimL9rRVR1HN1LwSvr+7P9UP7Fx?=
 =?us-ascii?Q?me9FoVuq4T5s4hSMIn/cH9iSZT+fLW4sZY9PByZdNIEcHtURKyLPSKbxqVKB?=
 =?us-ascii?Q?BOdkImJ6kq7v0P43Wrwg8Qr6ROFliBQlkcua3d2yrOavoIN9MALnDrvEzvlD?=
 =?us-ascii?Q?ACRU2qPE7bbGAEGEiLmGWMrL/EvMe19BO8Gd8oi+QFU963bqByZudlqC22lJ?=
 =?us-ascii?Q?TRYp/92OqiIiovNT0d77X7QBqpwJc7fDjWOzYGHcgI39G0pPmlQm4t/HUr62?=
 =?us-ascii?Q?Ap49EdrK4WmnguItu7/fSk/7RCWL+neNpUFjnp8OPBUOlIDaUSGdbJTvnEuL?=
 =?us-ascii?Q?vN0ZUucLlw9uJmrxmgBdadJtqAkPMtTejoQEb/9O3xkFpcKJFWn52lLbAlNO?=
 =?us-ascii?Q?Vtsc/9AtugXmqx5/YR4Z0PouFcoB5XHpuagfDQwcr20T8TaA0BFGIyCx7Blv?=
 =?us-ascii?Q?Fv3/cY3qMjD+yColjcVW9PXD2PpCP3T+7NQVQr8i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1af6a-81db-482e-07e8-08dd7b0783cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:50:36.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F5BWWxyEjlLt7/dC8GWiqftCiMiGZtYa+QbzLc0skauGB3JEMXCXj3kRmYu7hvI9B7y6+lQYchnm1rQx+/G/g==
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

i.MX8qxp Display Controller display engine consists of all processing
units that operate in a display clock domain.  Add minimal feature
support with FrameGen and TCon so that the engine can output display
timings.  The FrameGen driver, TCon driver and display engine driver
are components to be aggregated by a master registered in the upcoming
DRM driver.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v9:
* Add Dmitry's R-b tag.

v8:
* Get DE/FG/TC device instance numbers through register start addresses of the
  devices, instead of compatible strings. (Dmitry)
* s/shdld/shdload/ for DE IRQs. (Dmitry)
* Drop id member from struct dc_de. (Dmitry)
* Add dc_de_post_bind(), to avoid dependency on the component helper's way of
  implementing component binding order. (Dmitry)

v7:
* Add kernel doc for struct dc_drm_device. (Dmitry)
* Fix regmap_config definitions by correcting name field, correcting read
  ranges and setting max_register field.
* Get instance numbers from device data(compatible strings) instead of OF
  aliases.
* Collect Maxime's R-b tag.
* Trivial tweaks.

v6:
* No change.

v5:
* Replace .remove_new with .remove in dc-{de,fg,tc}.c. (Uwe)
* Select REGMAP and REGMAP_MMIO Kconfig options.
* Fix commit message to state that display engine driver is a component driver
  instead of a master/aggregate driver.

v4:
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
* Move dc_fg_displaymode() and dc_fg_panic_displaymode() function calls from
  KMS routine to initialization stage. (Dmitry)
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv.
* Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
  interfaces to bind/unbind the drivers.

v3:
* No change.

v2:
* Use OF alias id to get instance id.
* Add dev member to struct dc_tc.

 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   7 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 177 +++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  56 +++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  57 +++++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 376 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 141 ++++++++++++
 10 files changed, 853 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 03535a15dd8f..3e8c6edbc17c 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/gpu/drm/imx/dc/Kconfig"
 source "drivers/gpu/drm/imx/dcss/Kconfig"
 source "drivers/gpu/drm/imx/ipuv3/Kconfig"
 source "drivers/gpu/drm/imx/lcdc/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index 86f38e7c7422..c7b317640d71 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DRM_IMX8_DC) += dc/
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
 obj-$(CONFIG_DRM_IMX) += ipuv3/
 obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
new file mode 100644
index 000000000000..e1ef76d82830
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -0,0 +1,7 @@
+config DRM_IMX8_DC
+	tristate "Freescale i.MX8 Display Controller Graphics"
+	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select REGMAP
+	select REGMAP_MMIO
+	help
+	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
new file mode 100644
index 000000000000..56de82d53d4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+
+obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
new file mode 100644
index 000000000000..5a3125596fdf
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLEN_HIGH		BIT(2)
+
+static const struct dc_subdev_info dc_de_info[] = {
+	{ .reg_start = 0x5618b400, .id = 0, },
+	{ .reg_start = 0x5618b420, .id = 1, },
+};
+
+static const struct regmap_range dc_de_regmap_ranges[] = {
+	regmap_reg_range(POLARITYCTRL, POLARITYCTRL),
+};
+
+static const struct regmap_access_table dc_de_regmap_access_table = {
+	.yes_ranges = dc_de_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_de_regmap_ranges),
+};
+
+static const struct regmap_config dc_de_top_regmap_config = {
+	.name = "top",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_de_regmap_access_table,
+	.rd_table = &dc_de_regmap_access_table,
+	.max_register = POLARITYCTRL,
+};
+
+static inline void dc_dec_init(struct dc_de *de)
+{
+	regmap_write_bits(de->reg_top, POLARITYCTRL, POLARITYCTRL, POLEN_HIGH);
+}
+
+static int dc_de_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res_top;
+	void __iomem *base_top;
+	struct dc_de *de;
+	int ret, id;
+
+	de = devm_kzalloc(dev, sizeof(*de), GFP_KERNEL);
+	if (!de)
+		return -ENOMEM;
+
+	base_top = devm_platform_get_and_ioremap_resource(pdev, 0, &res_top);
+	if (IS_ERR(base_top))
+		return PTR_ERR(base_top);
+
+	de->reg_top = devm_regmap_init_mmio(dev, base_top,
+					    &dc_de_top_regmap_config);
+	if (IS_ERR(de->reg_top))
+		return PTR_ERR(de->reg_top);
+
+	de->irq_shdload = platform_get_irq_byname(pdev, "shdload");
+	if (de->irq_shdload < 0)
+		return de->irq_shdload;
+
+	de->irq_framecomplete = platform_get_irq_byname(pdev, "framecomplete");
+	if (de->irq_framecomplete < 0)
+		return de->irq_framecomplete;
+
+	de->irq_seqcomplete = platform_get_irq_byname(pdev, "seqcomplete");
+	if (de->irq_seqcomplete < 0)
+		return de->irq_seqcomplete;
+
+	de->dev = dev;
+
+	dev_set_drvdata(dev, de);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	id = dc_subdev_get_id(dc_de_info, ARRAY_SIZE(dc_de_info), res_top);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	dc_drm->de[id] = de;
+
+	return 0;
+}
+
+/*
+ * It's possible to get the child device pointers from the child component
+ * bind callbacks, but it depends on the component helper behavior to bind
+ * the display engine component first.  To avoid the dependency, post bind
+ * to get the pointers from dc_drm in a safe manner.
+ */
+void dc_de_post_bind(struct dc_drm_device *dc_drm)
+{
+	struct dc_de *de;
+	int i;
+
+	for (i = 0; i < DC_DISPLAYS; i++) {
+		de = dc_drm->de[i];
+		de->fg = dc_drm->fg[i];
+		de->tc = dc_drm->tc[i];
+	}
+}
+
+static const struct component_ops dc_de_ops = {
+	.bind = dc_de_bind,
+};
+
+static int dc_de_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_de_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_de_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_de_ops);
+}
+
+static int dc_de_runtime_resume(struct device *dev)
+{
+	struct dc_de *de = dev_get_drvdata(dev);
+
+	dc_dec_init(de);
+	dc_fg_init(de->fg);
+	dc_tc_init(de->tc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_de_pm_ops = {
+	RUNTIME_PM_OPS(NULL, dc_de_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_de_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-display-engine" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
+
+struct platform_driver dc_de_driver = {
+	.probe = dc_de_probe,
+	.remove = dc_de_remove,
+	.driver = {
+		.name = "imx8-dc-display-engine",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_de_dt_ids,
+		.pm = pm_sleep_ptr(&dc_de_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
new file mode 100644
index 000000000000..5dd311cde076
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DISPLAY_ENGINE_H__
+#define __DC_DISPLAY_ENGINE_H__
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/regmap.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+struct dc_fg {
+	struct device *dev;
+	struct regmap *reg;
+	struct clk *clk_disp;
+};
+
+struct dc_tc {
+	struct device *dev;
+	struct regmap *reg;
+};
+
+struct dc_de {
+	struct device *dev;
+	struct regmap *reg_top;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdload;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+};
+
+/* Frame Generator Unit */
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
+void dc_fg_enable(struct dc_fg *fg);
+void dc_fg_disable(struct dc_fg *fg);
+void dc_fg_shdtokgen(struct dc_fg *fg);
+u32 dc_fg_get_frame_index(struct dc_fg *fg);
+u32 dc_fg_get_line_index(struct dc_fg *fg);
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg);
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg);
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg);
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg);
+void dc_fg_enable_clock(struct dc_fg *fg);
+void dc_fg_disable_clock(struct dc_fg *fg);
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
+void dc_fg_init(struct dc_fg *fg);
+
+/* Timing Controller Unit */
+void dc_tc_init(struct dc_tc *tc);
+
+#endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
new file mode 100644
index 000000000000..e5910a82dd4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "dc-drv.h"
+
+static struct platform_driver * const dc_drivers[] = {
+	&dc_de_driver,
+	&dc_fg_driver,
+	&dc_tc_driver,
+};
+
+static int __init dc_drm_init(void)
+{
+	return platform_register_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+static void __exit dc_drm_exit(void)
+{
+	platform_unregister_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+module_init(dc_drm_init);
+module_exit(dc_drm_exit);
+
+MODULE_DESCRIPTION("i.MX8 Display Controller DRM Driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
new file mode 100644
index 000000000000..65ae9c7c3694
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DRV_H__
+#define __DC_DRV_H__
+
+#include <linux/ioport.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <drm/drm_device.h>
+
+#include "dc-de.h"
+
+/**
+ * struct dc_drm_device - DC specific drm_device
+ */
+struct dc_drm_device {
+	/** @base: base drm_device structure */
+	struct drm_device base;
+	/** @de: display engine list */
+	struct dc_de *de[DC_DISPLAYS];
+	/** @fg: framegen list */
+	struct dc_fg *fg[DC_DISPLAYS];
+	/** @tc: tcon list */
+	struct dc_tc *tc[DC_DISPLAYS];
+};
+
+struct dc_subdev_info {
+	resource_size_t reg_start;
+	int id;
+};
+
+extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_tc_driver;
+
+static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
+				   int info_cnt, struct resource *res)
+{
+	int i;
+
+	if (!res)
+		return -EINVAL;
+
+	for (i = 0; i < info_cnt; i++)
+		if (info[i].reg_start == res->start)
+			return info[i].id;
+
+	return -EINVAL;
+}
+
+void dc_de_post_bind(struct dc_drm_device *dc_drm);
+
+#endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
new file mode 100644
index 000000000000..7f6c1852bf72
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+#include <drm/drm_modes.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	GENMASK(2, 1)
+#define  FGSYNCMODE(x)		FIELD_PREP(FGSYNCMODE_MASK, (x))
+#define  SHDEN			BIT(0)
+
+#define HTCFG1			0xc
+#define  HTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  HSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define VTCFG1			0x14
+#define  VTOTAL(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VACT(x)		FIELD_PREP(GENMASK(13, 0), (x))
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(x)		FIELD_PREP(GENMASK(29, 16), ((x) - 1))
+#define  VSYNC(x)		FIELD_PREP(GENMASK(13, 0), ((x) - 1))
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define  EN			BIT(31)
+#define  ROW(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTY(x)		FIELD_PREP(GENMASK(29, 16), ((x) + 1))
+#define  STARTX(x)		FIELD_PREP(GENMASK(13, 0), ((x) + 1))
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		GENMASK(2, 0)
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX(x)		FIELD_GET(GENMASK(31, 14), (x))
+#define  LINEINDEX(x)		FIELD_GET(GENMASK(13, 0), (x))
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
+
+enum dc_fg_syncmode {
+	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
+};
+
+enum dc_fg_dm {
+	FG_DM_CONSTCOL = 0x1,	/* Constant Color Background is shown. */
+	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
+};
+
+static const struct dc_subdev_info dc_fg_info[] = {
+	{ .reg_start = 0x5618b800, .id = 0, },
+	{ .reg_start = 0x5618d400, .id = 1, },
+};
+
+static const struct regmap_range dc_fg_regmap_write_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGSLR),
+	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
+};
+
+static const struct regmap_range dc_fg_regmap_read_ranges[] = {
+	regmap_reg_range(FGSTCTRL, VTCFG2),
+	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
+	regmap_reg_range(PACFG, FGENABLE),
+	regmap_reg_range(FGTIMESTAMP, FGCHSTAT),
+};
+
+static const struct regmap_access_table dc_fg_regmap_write_table = {
+	.yes_ranges = dc_fg_regmap_write_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_write_ranges),
+};
+
+static const struct regmap_access_table dc_fg_regmap_read_table = {
+	.yes_ranges = dc_fg_regmap_read_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_fg_regmap_read_ranges),
+};
+
+static const struct regmap_config dc_fg_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_fg_regmap_write_table,
+	.rd_table = &dc_fg_regmap_read_table,
+	.max_register = FGCHSTATCLR,
+};
+
+static inline void dc_fg_enable_shden(struct dc_fg *fg)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+static inline void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
+{
+	regmap_write_bits(fg->reg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
+{
+	u32 hact, htotal, hsync, hsbp;
+	u32 vact, vtotal, vsync, vsbp;
+	u32 kick_row, kick_col;
+	int ret;
+
+	hact = m->crtc_hdisplay;
+	htotal = m->crtc_htotal;
+	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
+	hsbp = m->crtc_htotal - m->crtc_hsync_start;
+
+	vact = m->crtc_vdisplay;
+	vtotal = m->crtc_vtotal;
+	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
+	vsbp = m->crtc_vtotal - m->crtc_vsync_start;
+
+	/* video mode */
+	regmap_write(fg->reg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	regmap_write(fg->reg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	regmap_write(fg->reg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	regmap_write(fg->reg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	regmap_write(fg->reg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
+
+	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
+	if (ret < 0)
+		dev_err(fg->dev, "failed to set display clock rate: %d\n", ret);
+}
+
+static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
+}
+
+static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dc_fg_enable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, FGEN);
+}
+
+void dc_fg_disable(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGENABLE, 0);
+}
+
+void dc_fg_shdtokgen(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGSLR, SHDTOKGEN);
+}
+
+u32 dc_fg_get_frame_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return FRAMEINDEX(val);
+}
+
+u32 dc_fg_get_line_index(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGTIMESTAMP, &val);
+
+	return LINEINDEX(val);
+}
+
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+	u32 frame_index, last_frame_index;
+
+	frame_index = dc_fg_get_frame_index(fg);
+	do {
+		last_frame_index = frame_index;
+		frame_index = dc_fg_get_frame_index(fg);
+	} while (last_frame_index == frame_index &&
+		 time_before(jiffies, timeout));
+
+	return last_frame_index != frame_index;
+}
+
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
+{
+	u32 val;
+
+	regmap_read(fg->reg, FGCHSTAT, &val);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
+{
+	regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
+{
+	unsigned int val;
+
+	return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
+					val & SECSYNCSTAT, 5, 100000);
+}
+
+void dc_fg_enable_clock(struct dc_fg *fg)
+{
+	int ret;
+
+	ret = clk_prepare_enable(fg->clk_disp);
+	if (ret)
+		dev_err(fg->dev, "failed to enable display clock: %d\n", ret);
+}
+
+void dc_fg_disable_clock(struct dc_fg *fg)
+{
+	clk_disable_unprepare(fg->clk_disp);
+}
+
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
+{
+	unsigned long rounded_rate;
+
+	rounded_rate = clk_round_rate(fg->clk_disp, clk_khz * HZ_PER_KHZ);
+
+	if (rounded_rate != clk_khz * HZ_PER_KHZ)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+void dc_fg_init(struct dc_fg *fg)
+{
+	dc_fg_enable_shden(fg);
+	dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
+	dc_fg_displaymode(fg, FG_DM_SEC_ON_TOP);
+	dc_fg_panic_displaymode(fg, FG_DM_CONSTCOL);
+}
+
+static int dc_fg_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_fg *fg;
+	int id;
+
+	fg = devm_kzalloc(dev, sizeof(*fg), GFP_KERNEL);
+	if (!fg)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	fg->reg = devm_regmap_init_mmio(dev, base, &dc_fg_regmap_config);
+	if (IS_ERR(fg->reg))
+		return PTR_ERR(fg->reg);
+
+	fg->clk_disp = devm_clk_get(dev, NULL);
+	if (IS_ERR(fg->clk_disp))
+		return dev_err_probe(dev, PTR_ERR(fg->clk_disp),
+				     "failed to get display clock\n");
+
+	id = dc_subdev_get_id(dc_fg_info, ARRAY_SIZE(dc_fg_info), res);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	fg->dev = dev;
+	dc_drm->fg[id] = fg;
+
+	return 0;
+}
+
+static const struct component_ops dc_fg_ops = {
+	.bind = dc_fg_bind,
+};
+
+static int dc_fg_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fg_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fg_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fg_ops);
+}
+
+static const struct of_device_id dc_fg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-framegen" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
+
+struct platform_driver dc_fg_driver = {
+	.probe = dc_fg_probe,
+	.remove = dc_fg_remove,
+	.driver = {
+		.name = "imx8-dc-framegen",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_fg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
new file mode 100644
index 000000000000..0bfd381b2cea
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "dc-drv.h"
+#include "dc-de.h"
+
+#define TCON_CTRL	0x410
+#define  CTRL_RST_VAL	0x01401408
+
+/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
+#define MAPBIT3_0	0x418
+#define MAPBIT7_4	0x41c
+#define MAPBIT11_8	0x420
+#define MAPBIT15_12	0x424
+#define MAPBIT19_16	0x428
+#define MAPBIT23_20	0x42c
+#define MAPBIT27_24	0x430
+#define MAPBIT31_28	0x434
+
+static const struct dc_subdev_info dc_tc_info[] = {
+	{ .reg_start = 0x5618c800, .id = 0, },
+	{ .reg_start = 0x5618e400, .id = 1, },
+};
+
+static const struct regmap_range dc_tc_regmap_ranges[] = {
+	regmap_reg_range(TCON_CTRL, TCON_CTRL),
+	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+};
+
+static const struct regmap_access_table dc_tc_regmap_access_table = {
+	.yes_ranges = dc_tc_regmap_ranges,
+	.n_yes_ranges = ARRAY_SIZE(dc_tc_regmap_ranges),
+};
+
+static const struct regmap_config dc_tc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_tc_regmap_access_table,
+	.rd_table = &dc_tc_regmap_access_table,
+	.max_register = MAPBIT31_28,
+};
+
+/*
+ * The pixels reach TCON are always in 30-bit BGR format.
+ * The first bridge always receives pixels in 30-bit RGB format.
+ * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+ */
+static const u32 dc_tc_mapbit[] = {
+	0x17161514, 0x1b1a1918, 0x0b0a1d1c, 0x0f0e0d0c,
+	0x13121110, 0x03020100, 0x07060504, 0x00000908,
+};
+
+void dc_tc_init(struct dc_tc *tc)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+
+	/* set format */
+	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,
+			  ARRAY_SIZE(dc_tc_mapbit));
+}
+
+static int dc_tc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct resource *res;
+	void __iomem *base;
+	struct dc_tc *tc;
+	int id;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+	if (IS_ERR(tc->reg))
+		return PTR_ERR(tc->reg);
+
+	id = dc_subdev_get_id(dc_tc_info, ARRAY_SIZE(dc_tc_info), res);
+	if (id < 0) {
+		dev_err(dev, "failed to get instance number: %d\n", id);
+		return id;
+	}
+
+	tc->dev = dev;
+	dc_drm->tc[id] = tc;
+
+	return 0;
+}
+
+static const struct component_ops dc_tc_ops = {
+	.bind = dc_tc_bind,
+};
+
+static int dc_tc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_tc_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_tc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_tc_ops);
+}
+
+static const struct of_device_id dc_tc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-tcon" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
+
+struct platform_driver dc_tc_driver = {
+	.probe = dc_tc_probe,
+	.remove = dc_tc_remove,
+	.driver = {
+		.name = "imx8-dc-tcon",
+		.suppress_bind_attrs = true,
+		.of_match_table = dc_tc_dt_ids,
+	},
+};
-- 
2.34.1

