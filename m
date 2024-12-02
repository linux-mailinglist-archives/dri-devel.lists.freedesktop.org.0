Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCD9DF934
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FC710E41E;
	Mon,  2 Dec 2024 02:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EXFSgQ48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9A10E417
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcz7cWnDD3z/9A6I+Hupxhv+3qXlEisI4YBUlZyENJIU2PZUNHzUr9E9Kh7/Av4+wNJy5QhVUGxmJMDKiAI9v0mnPmfOiJghuUDR6IHVaAbUDpnvsCMsa7wecBTn5HtKnJduC8unptnGn//EYe4OwEfXsABOpOyevE1M04Gtm1QZ3Kdbxbf6r+/JIOWtGU6zAgzvZV9mG099g0rKmDTuUUjbND2eKAvkZGvVKkzgg9/rd6Lgy3180+XnW/G7302C5JloZSNsWHXeWFWb+LYyq18xh9ZiF2Xq5EFWJ6LgtMNUVUFsM5sGum8eDG36HbV6uLKk0njRhaAf/m79sM+EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJkefFtRVTSeSYlFVJSuM7zyPrDrORLz6Gm84DTeO3E=;
 b=Cvy+6HavesHPSg4EHVRcb56IUrp79KXAYcoqNoQMHmWcdTJjN3iU8n7YJbqRG8UdUEvY182fNrN0yiiok5wqQ53ROIkgk6CYueX9lqGV2PmKwx2U72Lnmi4BaJ84peB30XA1Dkw1E1zHRNCK+f5yfDPILokFTtvP5XNz7856FmjOHi7asgLP8mmOv0dJoex4m76XNDoiKrKkXnz4XvTXrvDxPcixo3mRyASpJXTMXwvkRThojsPEnOpJEFklMCLlxqYXcbYnZxQqvF89aguC3zfuq1cav2MVdnLrCW+P8jzSiJynl52e/rHh/boXiFcUTn3Y/LbSwlom3ycQ2AdOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJkefFtRVTSeSYlFVJSuM7zyPrDrORLz6Gm84DTeO3E=;
 b=EXFSgQ48hN36RwhwQCLBfvUexZu9gyYtfRzgWU4fUzuCGkP+9I2W6r9H2/by4nZG6/Gl6gM4mE0tKBcWpnLFktz3aEgLi5xD/+KtP1Bupm40VF3dg93FAc87/Pea2YRhRT1+8AcDgDO1oO0782RdTFh+fh7vEcpG7bDH3woTPoKsNIdVKHqq76PP6WzFV8txGPxD9HLxp8bmslJ+wZygnMyUcYEFx0IkxxjiV1zE+QToBW/xfbqTLYCVJdVc486fQAj0lKlwp4542ZTf2vR7nC+59+MS6p/MjcztyxvrwAQGsqtnuPejLjBPaHWca6y6Kc6rAOOkLhT4b1NK3RqBbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
Date: Mon,  2 Dec 2024 10:56:28 +0800
Message-Id: <20241202025635.1274467-13-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: cdca2e36-9df4-4c62-315e-08dd127d20ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LIbjYmoIRAZrMDpfner+1+tr9cxU0mbj35yORQVgyZ+YOXawBOWZmYB27eZj?=
 =?us-ascii?Q?bxaPKC1l86OQ2P1TUROBTdD1IlbMcM8ZHroQTNr2qQi/qDi4eFwMYwqtkSjF?=
 =?us-ascii?Q?rqqhHBAsbjBNXPPJ4Mf0dP8xcRwNEK6a7vD9tt7MTCBzwFQRJThmWYJKQWij?=
 =?us-ascii?Q?i/VdFsGW1EsyzsSOqCEp20vLkkqyXdyswMhIrLxYwIuoX3U0vmP+UGNhC0b6?=
 =?us-ascii?Q?Hy0WUoJ4QzptHLtQg7j5mIFdRrcCiD6yD+O5Aa3AMRWabRp3PtEIdnLt0F1P?=
 =?us-ascii?Q?nZsOS8JAMSufp+X75sOXzq33TvV+V9jnmEVE4ivJvwdnZNZzkrPTyam9y0pT?=
 =?us-ascii?Q?SW3J11R4Gq7g2BgmDuud3itfLnOxbnmp6My7vziYK3oZK8uSM08+yD1RS0kY?=
 =?us-ascii?Q?gRNcviz9GqwEzG/z3+NdAfP+I0vsDxo73a9fax/pAwilpr9Iw/BBZewKp8/d?=
 =?us-ascii?Q?g7ADQsVmXUkwlZbkI0KmMjFe0EfnkZYFhUjOkfYrKsooo55TQ4M++6u+bNKd?=
 =?us-ascii?Q?yMjWKGXs5FYix7V6D0TFg2OCwaO40Ezn5RcMxfUVUiR05hVU8rttxaSheulO?=
 =?us-ascii?Q?ZvMv2/7Kl0RxgJiKR3zGHKXKLNdXMHBivhlMGF8gwTUaLLaLxKQscfFEdK13?=
 =?us-ascii?Q?JE4Ue8nBolE9paUi7ZDmil7MQFCXxN2ACuWJQWaw119DcLsIiH2Ue1Ls7AtZ?=
 =?us-ascii?Q?i84+ZyjK6pbu1pa1+WlIDucoVGmqEmjuJ25cpt7KkHEwpBhE2BfiDM7GduHm?=
 =?us-ascii?Q?6OKdc66F0G9XfKLZU4e/pXNxgrCs2EyIfOefwDB6sfky9BVc+ZMgY0YXBdoi?=
 =?us-ascii?Q?XmfbTtRkwHL07XfQA22LzfQLkcNYBWSEMF1K9fWoF2JhKoJoJamLr0pfApDx?=
 =?us-ascii?Q?7ggxaNu9+EAgEizA4jdfG0J/N3reXd0+vcHvnVtJ0U0Gqh93hynxscnpg24t?=
 =?us-ascii?Q?G+etHXOe7MJaLFpkFMwvlA2MgiDwR22u1sZ5UdI61N6O0ihgqzwhsG6jPa4w?=
 =?us-ascii?Q?ZwY9pHoFn0kiJ6NbLp1u2Sapv8g8z+2xCOskIemqn8ZkdnzCj7/UUet1wQzx?=
 =?us-ascii?Q?VKGr7XXsh7/9+mTVJiht3AyLwlihlANHmaOZsMZ282m7yFu/FalnY7KzU6oR?=
 =?us-ascii?Q?2evxC0kSm38VPVIWH6NLi7ovgmBoQjmBujBiqQrSInKmZXYGRoBb0O7NBKkd?=
 =?us-ascii?Q?aVhxVyLoBFjlT2BlnrZKuC0Ys0XN/KXGA3ue1hTD7OGxaWcqbQo8JyRUL2a+?=
 =?us-ascii?Q?HHRSiiW83ooaGvxLF7xBiDzmCx1CYhSFttBzVxpug5SEQlfX03XCXew3bGta?=
 =?us-ascii?Q?IdVqkZ+nVBjDDGgEP57bYWurz0P+HAam083Pv4Zyq+f81wW7yoRKDyBNn74p?=
 =?us-ascii?Q?lAj3uYOVSqBJLJoXKfFX7qM52sW12bttkTNwVEGn2MSCfWVuqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Cx31QAAyDi78JamvC4hvPTYI1MErTd1oafrGcHanW3mKq10mY4PP4uby4oY?=
 =?us-ascii?Q?P3wWOf6TtmRlAeZxCGt2/McIKeKLv0+VID360GEYzdjG+kAcHKICfuivfeKw?=
 =?us-ascii?Q?6jnPfiGKu+IhJvmxkXTMxG4pFJEe5m/AZoesLbHgVHogQTXTGEGqdfUS7+LX?=
 =?us-ascii?Q?XAljADtEyqzpxiqWj6bliSDCWBLKSbyGXv6Jnx/r7DZeyI92ASKXyFRG4W5d?=
 =?us-ascii?Q?B8XxV3rUMST+MlS80a2RNYO5nwIb4r4xOR7JMeEH79bgQh853VH1XYiJYFiz?=
 =?us-ascii?Q?46d+7Mqm+6C6bOU+XUZfJ7Hw61OA2lsE9Wq0dcJoqvm4K0O4CyG9XKs5UiOL?=
 =?us-ascii?Q?67Atuz59Bp02ebdR8jTi6j64NEjZBIlvzSmf5o4+HYCQhNlzwwJl1VhIqZ6Q?=
 =?us-ascii?Q?yIY28AReFTW3Ipy2SbSFfCGXZan3pJ435Aoid17T6GzAHhn1aVSXRL6FAVgE?=
 =?us-ascii?Q?9xCYxWRUfK3Z3VesfkIE5bgdokD7AeBgdBKKTv0D5qkd+iBX1kLFM2XJhZ6i?=
 =?us-ascii?Q?D6bqA8n1dWKY8H33RWm9J/idwDXNPc43HeP/w+4+cvvQ7CPzk+AK2v3ltOx9?=
 =?us-ascii?Q?t7/VwgRKGWwyF3l7PU95L+JU1g/DPGE9srFtCfwap6rfSsXe4Drf9Om67HZ8?=
 =?us-ascii?Q?mcuGoR2SvtGI3FsYX+dIprNxyii9DfCcAWuHaHPUC4WoTGuRORkQxD7xor74?=
 =?us-ascii?Q?Sq2DUiJx8f1S8lCLo2SVs7JV09Fhi0i1BOItSVH/e18tNUzQR4AQ4MiBDcbc?=
 =?us-ascii?Q?ILZZi8Co/gmKxKtRTiTGWghiAUvFv3GOAFsvrUG5SYseIgaOUVfOsO7kSt0r?=
 =?us-ascii?Q?ZAsjoPNEAEXAzeINmoK7PPmyqOcj8JXutm4KXiLMe5YnU0N7VSRMWqzp43Nb?=
 =?us-ascii?Q?BVqFUfmOLMrQagxRyG1QwiyPgf81QTXMERPYlpegpbusELwcr07lKZl0EdKR?=
 =?us-ascii?Q?OiU0sE6PkBkHHmMELdukXCP7451s3nJkejHwrT5UQO5eUmJXr5AdBqIBzsVZ?=
 =?us-ascii?Q?KwrkZbiPW4aCdiBFd097eI+U4lXFGvUTzxjVgVukniYZdSEvlTfaH+FHQbvq?=
 =?us-ascii?Q?LxOx5esjSDtvyqgGx6Oa+92U8svtgmnnUr9uSevJV8sy7sUAUd1o2tUnZynr?=
 =?us-ascii?Q?fnp4NXOkucODVxq1KaQHyXuYqwSgduaeLAHqCxyZyOmoNJxT4XNiwp0NyIGL?=
 =?us-ascii?Q?ekznCTfMtniw7Tc8v0aUL89Le2LdJREjq+yjcDF/2kD86aqubLXuJwQIJFaA?=
 =?us-ascii?Q?qV4aaya9QJxmWTZPnXa5RqV9k0ucz0rezgVkUCcyp8iSaB+G6smJOWby2KzF?=
 =?us-ascii?Q?BF53Z0u4WAzNnz7YYgYblB0tx2bhDJJFLxERGkIhxG9sMyxOYmorYNfLjT9i?=
 =?us-ascii?Q?/xNGIH6/Uz8PWM5jIhvxA4AfdxiKlOBt6kAqBqqXEVvI3Tv2hBrQ1YJYaXGY?=
 =?us-ascii?Q?NZRPAu2FGQnPSb25xTpUBXNqxl7OGVx5Q3YH82AnHdUOF4z8mCF081qjzRh9?=
 =?us-ascii?Q?DzkwZuaQ6indPj77ufXkYD6WnL2lBSv890ontsKLqne74R5gMY2w8BIkQIRa?=
 =?us-ascii?Q?eAadm5SehTKKrD+eqvPaqO61YPCg0piRHp5R6Uds?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdca2e36-9df4-4c62-315e-08dd127d20ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:59.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nDkhMhvXRwI7bXwgKeE84jyZpnR37MHEXa359xkVKpA7W1lbL0/oLtykwhKMD8Tv5k+0dvVleT6tDitexWqrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.  Add kernel
mode setting support for the display controller part with two CRTCs and
two primary planes(backed by FetchLayer and FetchWarp respectively).  The
registers of the display controller are accessed without command sequencer
involved, instead just by using CPU.  The command sequencer is supposed to
be used by the blit engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* Replace .remove_new with .remove in dc-drv.c. (Uwe)

v4:
* Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
  function calls from KMS routine to initialization stage. (Dmitry)
* Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
  appropriate .h header files or .c source files. (Dmitry)
* Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
* Drop dc_drm->pe_rpm_count. (Dmitry)
* Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
* Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
  Instead, put it in struct dc_crtc.  (Dmitry)
* Call devm_request_irq() to request IRQs, instead of using drmm action.
  (Dmitry)
* Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
* Select DRM_CLIENT_SELECTION due to rebase.
* Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
* Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
* Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
  rebase.
* Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
  register dc_drm_component_unbind_all() action.
* Request interrupts in dc_crtc_post_init() after encoder initialization to
  make sure next bridge is found first.

v3:
* No change.

v2:
* Find next bridge from TCon's port.
* Drop drm/drm_module.h include from dc-drv.c.

 drivers/gpu/drm/imx/dc/Kconfig    |   5 +
 drivers/gpu/drm/imx/dc/Makefile   |   5 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c  | 558 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
 drivers/gpu/drm/imx/dc/dc-drv.c   | 244 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h   |  19 +
 drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
 drivers/gpu/drm/imx/dc/dc-kms.h   |  58 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
 9 files changed, 1274 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c

diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
index 1fc84c7475de..415993207f2e 100644
--- a/drivers/gpu/drm/imx/dc/Kconfig
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -1,6 +1,11 @@
 config DRM_IMX8_DC
 	tristate "Freescale i.MX8 Display Controller Graphics"
 	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_DMA_HELPER
+	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select GENERIC_IRQ_CHIP
 	select REGMAP
 	select REGMAP_MMIO
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
index 1ce3e8a8db22..b9d33c074984 100644
--- a/drivers/gpu/drm/imx/dc/Makefile
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
-		    dc-fw.o dc-ic.o dc-lb.o dc-pe.o dc-tc.o
+imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
+		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
+		    dc-plane.o dc-tc.o
 
 obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
new file mode 100644
index 000000000000..fd6daa1807d8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+#include "dc-kms.h"
+#include "dc-pe.h"
+
+#define dc_crtc_dbg(crtc, fmt, ...)					\
+do {									\
+	typeof(crtc) _crtc = (crtc);					\
+	drm_dbg_kms(_crtc->dev, "[CRTC:%d:%s] " fmt,			\
+		    _crtc->base.id, _crtc->name, ##__VA_ARGS__);	\
+} while (0)
+
+#define dc_crtc_err(crtc, fmt, ...)					\
+do {									\
+	typeof(crtc) _crtc = (crtc);					\
+	drm_err(_crtc->dev, "[CRTC:%d:%s] " fmt,			\
+		_crtc->base.id, _crtc->name, ##__VA_ARGS__);		\
+} while (0)
+
+#define DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(c)				\
+do {									\
+	unsigned long ret;						\
+	ret = wait_for_completion_timeout(&dc_crtc->c, HZ);		\
+	if (ret == 0)							\
+		dc_crtc_err(crtc, "%s: wait for " #c " timeout\n",	\
+							__func__);	\
+} while (0)
+
+#define DC_CRTC_CHECK_FRAMEGEN_FIFO(fg)					\
+do {									\
+	typeof(fg) _fg = (fg);						\
+	if (dc_fg_secondary_requests_to_read_empty_fifo(_fg)) {		\
+		dc_fg_secondary_clear_channel_status(_fg);		\
+		dc_crtc_err(crtc, "%s: FrameGen FIFO empty\n",		\
+							__func__);	\
+	}								\
+} while (0)
+
+#define DC_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(fg)			\
+do {									\
+	if (dc_fg_wait_for_secondary_syncup(fg))			\
+		dc_crtc_err(crtc,					\
+			"%s: FrameGen secondary channel isn't syncup\n",\
+							__func__);	\
+} while (0)
+
+static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct dc_crtc, base);
+}
+
+static u32 dc_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	return dc_fg_get_frame_index(dc_crtc->fg);
+}
+
+static int dc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_framecomplete);
+
+	return 0;
+}
+
+static void dc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	disable_irq_nosync(dc_crtc->irq_dec_framecomplete);
+}
+
+static irqreturn_t
+dc_crtc_dec_framecomplete_irq_handler(int irq, void *dev_id)
+{
+	struct dc_crtc *dc_crtc = dev_id;
+	struct drm_crtc *crtc = &dc_crtc->base;
+	unsigned long flags;
+
+	drm_crtc_handle_vblank(crtc);
+
+	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	if (dc_crtc->event) {
+		drm_crtc_send_vblank_event(crtc, dc_crtc->event);
+		dc_crtc->event = NULL;
+		drm_crtc_vblank_put(crtc);
+	}
+	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t dc_crtc_common_irq_handler(int irq, void *dev_id)
+{
+	struct dc_crtc *dc_crtc = dev_id;
+
+	if (irq == dc_crtc->irq_dec_seqcomplete)
+		complete(&dc_crtc->dec_seqcomplete_done);
+	else if (irq == dc_crtc->irq_dec_shdld)
+		complete(&dc_crtc->dec_shdld_done);
+	else if (irq == dc_crtc->irq_ed_cont_shdld)
+		complete(&dc_crtc->ed_cont_shdld_done);
+	else if (irq == dc_crtc->irq_ed_safe_shdld)
+		complete(&dc_crtc->ed_safe_shdld_done);
+
+	return IRQ_HANDLED;
+}
+
+static const struct drm_crtc_funcs dc_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.get_vblank_counter	= dc_crtc_get_vblank_counter,
+	.enable_vblank		= dc_crtc_enable_vblank,
+	.disable_vblank		= dc_crtc_disable_vblank,
+	.get_vblank_timestamp	= drm_crtc_vblank_helper_get_vblank_timestamp,
+};
+
+static void dc_crtc_queue_state_event(struct drm_crtc_state *crtc_state)
+{
+	struct drm_crtc *crtc = crtc_state->crtc;
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc_state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc));
+		WARN_ON(dc_crtc->event);
+		dc_crtc->event = crtc_state->event;
+		crtc_state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static enum drm_mode_status
+dc_crtc_check_clock(struct dc_crtc *dc_crtc, int clk_khz)
+{
+	return dc_fg_check_clock(dc_crtc->fg, clk_khz);
+}
+
+static enum drm_mode_status
+dc_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum drm_mode_status status;
+
+	status = dc_crtc_check_clock(dc_crtc, mode->clock);
+	if (status != MODE_OK)
+		return status;
+
+	if (mode->crtc_clock > DC_FRAMEGEN_MAX_CLOCK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int
+dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum drm_mode_status status;
+
+	status = dc_crtc_check_clock(dc_crtc, adj->clock);
+	if (status != MODE_OK)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void
+dc_crtc_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, crtc);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int idx, ret;
+
+	if (!drm_atomic_crtc_needs_modeset(new_crtc_state) ||
+	    !new_crtc_state->active)
+		return;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return;
+
+	/* request pixel engine power-on when CRTC starts to be active */
+	ret = pm_runtime_resume_and_get(dc_crtc->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
+			    ret);
+
+	drm_dev_exit(idx);
+}
+
+static void
+dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state =
+				drm_atomic_get_old_crtc_state(state, crtc);
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, crtc);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int idx;
+
+	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
+	    (!old_crtc_state->active && !new_crtc_state->active))
+		return;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		goto out;
+
+	enable_irq(dc_crtc->irq_ed_cont_shdld);
+
+	/* flush plane update out to display */
+	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
+
+	disable_irq(dc_crtc->irq_ed_cont_shdld);
+
+	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
+
+	drm_dev_exit(idx);
+
+out:
+	dc_crtc_queue_state_event(new_crtc_state);
+}
+
+static void
+dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	enum dc_link_id cf_link;
+	int idx, ret;
+
+	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
+
+	drm_crtc_vblank_on(crtc);
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		goto out;
+
+	/* request display engine power-on when CRTC is enabled */
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+
+	enable_irq(dc_crtc->irq_dec_shdld);
+	enable_irq(dc_crtc->irq_ed_cont_shdld);
+	enable_irq(dc_crtc->irq_ed_safe_shdld);
+
+	dc_fg_cfg_videomode(dc_crtc->fg, adj);
+
+	dc_cf_framedimensions(dc_crtc->cf_cont,
+			      adj->crtc_hdisplay, adj->crtc_vdisplay);
+	dc_cf_framedimensions(dc_crtc->cf_safe,
+			      adj->crtc_hdisplay, adj->crtc_vdisplay);
+
+	/* constframe in safety stream shows blue frame */
+	dc_cf_constantcolor_blue(dc_crtc->cf_safe);
+	cf_link = dc_cf_get_link_id(dc_crtc->cf_safe);
+	dc_ed_pec_src_sel(dc_crtc->ed_safe, cf_link);
+
+	/* show CRTC background if no plane is enabled */
+	if (new_crtc_state->plane_mask == 0) {
+		/* constframe in content stream shows black frame */
+		dc_cf_constantcolor_black(dc_crtc->cf_cont);
+
+		cf_link = dc_cf_get_link_id(dc_crtc->cf_cont);
+		dc_ed_pec_src_sel(dc_crtc->ed_cont, cf_link);
+	}
+
+	dc_fg_enable_clock(dc_crtc->fg);
+	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
+	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
+	dc_fg_shdtokgen(dc_crtc->fg);
+	dc_fg_enable(dc_crtc->fg);
+
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
+
+	disable_irq(dc_crtc->irq_ed_safe_shdld);
+	disable_irq(dc_crtc->irq_ed_cont_shdld);
+	disable_irq(dc_crtc->irq_dec_shdld);
+
+	DC_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dc_crtc->fg);
+
+	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
+
+	drm_dev_exit(idx);
+
+out:
+	dc_crtc_queue_state_event(new_crtc_state);
+}
+
+static void
+dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state =
+				drm_atomic_get_new_crtc_state(state, crtc);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int idx, ret;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		goto out;
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	/* request pixel engine power-off as plane is off too */
+	ret = pm_runtime_put(dc_crtc->pe->dev);
+	if (ret)
+		dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+			    ret);
+
+	/* request display engine power-off when CRTC is disabled */
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+
+	drm_dev_exit(idx);
+
+out:
+	drm_crtc_vblank_off(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (new_crtc_state->event && !new_crtc_state->active) {
+		drm_crtc_send_vblank_event(crtc, new_crtc_state->event);
+		new_crtc_state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+void dc_crtc_disable_at_unbind(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg))
+		return;
+
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (pm_runtime_active(dc_crtc->pe->dev)) {
+		ret = pm_runtime_put_sync(dc_crtc->pe->dev);
+		if (ret)
+			dc_crtc_err(crtc, "failed to put DC pixel engine RPM: %d\n",
+				    ret);
+	}
+
+	ret = pm_runtime_put_sync(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
+static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
+					 bool in_vblank_irq,
+					 int *vpos, int *hpos,
+					 ktime_t *stime, ktime_t *etime,
+					 const struct drm_display_mode *mode)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int vdisplay = mode->crtc_vdisplay;
+	int vtotal = mode->crtc_vtotal;
+	bool reliable;
+	int line;
+	int idx;
+
+	if (stime)
+		*stime = ktime_get();
+
+	if (!drm_dev_enter(crtc->dev, &idx)) {
+		reliable = false;
+		*vpos = 0;
+		*hpos = 0;
+		goto out;
+	}
+
+	/* line index starts with 0 for the first active output line */
+	line = dc_fg_get_line_index(dc_crtc->fg);
+
+	if (line < vdisplay)
+		/* active scanout area - positive */
+		*vpos = line + 1;
+	else
+		/* inside vblank - negative */
+		*vpos = line - (vtotal - 1);
+
+	*hpos = 0;
+
+	reliable = true;
+
+	drm_dev_exit(idx);
+out:
+	if (etime)
+		*etime = ktime_get();
+
+	return reliable;
+}
+
+static const struct drm_crtc_helper_funcs dc_helper_funcs = {
+	.mode_valid		= dc_crtc_mode_valid,
+	.atomic_check		= dc_crtc_atomic_check,
+	.atomic_begin		= dc_crtc_atomic_begin,
+	.atomic_flush		= dc_crtc_atomic_flush,
+	.atomic_enable		= dc_crtc_atomic_enable,
+	.atomic_disable		= dc_crtc_atomic_disable,
+	.get_scanout_position	= dc_crtc_get_scanout_position,
+};
+
+static int dc_crtc_request_irqs(struct drm_device *drm, struct dc_crtc *dc_crtc)
+{
+	struct {
+		struct device *dev;
+		unsigned int irq;
+		irqreturn_t (*irq_handler)(int irq, void *dev_id);
+	} irqs[DC_CRTC_IRQS] = {
+		{
+			dc_crtc->de->dev,
+			dc_crtc->irq_dec_framecomplete,
+			dc_crtc_dec_framecomplete_irq_handler,
+		}, {
+			dc_crtc->de->dev,
+			dc_crtc->irq_dec_seqcomplete,
+			dc_crtc_common_irq_handler,
+		}, {
+			dc_crtc->de->dev,
+			dc_crtc->irq_dec_shdld,
+			dc_crtc_common_irq_handler,
+		}, {
+			dc_crtc->ed_cont->dev,
+			dc_crtc->irq_ed_cont_shdld,
+			dc_crtc_common_irq_handler,
+		}, {
+			dc_crtc->ed_safe->dev,
+			dc_crtc->irq_ed_safe_shdld,
+			dc_crtc_common_irq_handler,
+		},
+	};
+	int i, ret;
+
+	for (i = 0; i < DC_CRTC_IRQS; i++) {
+		struct dc_crtc_irq *irq = &dc_crtc->irqs[i];
+
+		ret = devm_request_irq(irqs[i].dev, irqs[i].irq,
+				       irqs[i].irq_handler, IRQF_NO_AUTOEN,
+				       dev_name(irqs[i].dev), dc_crtc);
+		if (ret) {
+			dev_err(irqs[i].dev, "failed to request irq(%u): %d\n",
+				irqs[i].irq, ret);
+			return ret;
+		}
+
+		irq->dc_crtc = dc_crtc;
+		irq->irq = irqs[i].irq;
+	}
+
+	return 0;
+}
+
+int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
+{
+	struct dc_crtc *dc_crtc = &dc_drm->dc_crtc[crtc_index];
+	struct drm_device *drm = &dc_drm->base;
+	struct dc_de *de = dc_drm->de[crtc_index];
+	struct dc_pe *pe = dc_drm->pe;
+	struct dc_plane *dc_primary;
+	int ret;
+
+	dc_crtc->de = de;
+	dc_crtc->pe = pe;
+
+	init_completion(&dc_crtc->dec_seqcomplete_done);
+	init_completion(&dc_crtc->dec_shdld_done);
+	init_completion(&dc_crtc->ed_cont_shdld_done);
+	init_completion(&dc_crtc->ed_safe_shdld_done);
+
+	dc_crtc->cf_cont = pe->cf_cont[crtc_index];
+	dc_crtc->cf_safe = pe->cf_safe[crtc_index];
+	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
+	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
+	dc_crtc->fg = de->fg;
+
+	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
+	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
+	dc_crtc->irq_dec_shdld = de->irq_shdld;
+	dc_crtc->irq_ed_safe_shdld = dc_crtc->ed_safe->irq_shdld;
+	dc_crtc->irq_ed_cont_shdld = dc_crtc->ed_cont->irq_shdld;
+
+	dc_primary = &dc_drm->dc_primary[crtc_index];
+	ret = dc_plane_init(dc_drm, dc_primary);
+	if (ret) {
+		dev_err(drm->dev,
+			"failed to init primary plane for display engine%u: %d\n",
+			de->id, ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(&dc_crtc->base, &dc_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &dc_crtc->base, &dc_primary->base,
+					NULL, &dc_crtc_funcs, NULL);
+	if (ret)
+		dev_err(drm->dev,
+			"failed to add CRTC for display engine%u: %d\n",
+			de->id, ret);
+
+	return ret;
+}
+
+int dc_crtc_post_init(struct dc_drm_device *dc_drm, int crtc_index)
+{
+	struct dc_crtc *dc_crtc = &dc_drm->dc_crtc[crtc_index];
+	struct drm_device *drm = &dc_drm->base;
+
+	return dc_crtc_request_irqs(drm, dc_crtc);
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 17a44362118e..8a7b6c03a222 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -13,6 +13,9 @@
 
 #define DC_DISPLAYS	2
 
+#define DC_FRAMEGEN_MAX_FRAME_INDEX	0x3ffff
+#define DC_FRAMEGEN_MAX_CLOCK_KHZ	300000
+
 struct dc_fg {
 	struct device *dev;
 	struct regmap *reg;
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index fd68861f770a..1e4b8afa3eec 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -3,11 +3,254 @@
  * Copyright 2024 NXP
  */
 
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_client_setup.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_of.h>
+
+#include "dc-de.h"
 #include "dc-drv.h"
 
+struct dc_priv {
+	struct drm_device *drm;
+	struct clk *clk_cfg;
+};
+
+DEFINE_DRM_GEM_DMA_FOPS(dc_drm_driver_fops);
+
+static struct drm_driver dc_drm_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+	.fops = &dc_drm_driver_fops,
+	.name = "imx8-dc",
+	.desc = "i.MX8 DC DRM graphics",
+	.date = "20240530",
+	.major = 1,
+	.minor = 0,
+	.patchlevel = 0,
+};
+
+static void
+dc_add_components(struct device *dev, struct component_match **matchptr)
+{
+	struct device_node *child, *grandchild;
+
+	for_each_available_child_of_node(dev->of_node, child) {
+		/* The interrupt controller is not a component. */
+		if (of_device_is_compatible(child, "fsl,imx8qxp-dc-intc"))
+			continue;
+
+		drm_of_component_match_add(dev, matchptr, component_compare_of,
+					   child);
+
+		for_each_available_child_of_node(child, grandchild)
+			drm_of_component_match_add(dev, matchptr,
+						   component_compare_of,
+						   grandchild);
+	}
+}
+
+static void dc_drm_component_unbind_all(void *ptr)
+{
+	struct dc_drm_device *dc_drm = ptr;
+	struct drm_device *drm = &dc_drm->base;
+
+	component_unbind_all(drm->dev, dc_drm);
+}
+
+static int dc_drm_bind(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+	struct dc_drm_device *dc_drm;
+	struct drm_device *drm;
+	int ret;
+
+	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
+				    base);
+	if (IS_ERR(dc_drm))
+		return PTR_ERR(dc_drm);
+
+	drm = &dc_drm->base;
+
+	ret = component_bind_all(dev, dc_drm);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, dc_drm_component_unbind_all,
+				       dc_drm);
+	if (ret)
+		return ret;
+
+	ret = dc_kms_init(dc_drm);
+	if (ret)
+		return ret;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		dev_err(dev, "failed to register drm device: %d\n", ret);
+		goto err;
+	}
+
+	drm_client_setup_with_fourcc(drm, DRM_FORMAT_XRGB8888);
+
+	priv->drm = drm;
+
+	return 0;
+
+err:
+	dc_kms_uninit(dc_drm);
+
+	return ret;
+}
+
+static void dc_drm_unbind(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+	struct dc_drm_device *dc_drm = to_dc_drm_device(priv->drm);
+	struct drm_device *drm = &dc_drm->base;
+	struct drm_crtc *crtc;
+
+	priv->drm = NULL;
+	drm_dev_unplug(drm);
+	dc_kms_uninit(dc_drm);
+	drm_atomic_helper_shutdown(drm);
+
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_unbind(crtc);
+}
+
+static const struct component_master_ops dc_drm_ops = {
+	.bind = dc_drm_bind,
+	.unbind = dc_drm_unbind,
+};
+
+static int dc_probe(struct platform_device *pdev)
+{
+	struct component_match *match = NULL;
+	struct dc_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->clk_cfg = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk_cfg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cfg),
+				     "failed to get cfg clock\n");
+
+	dev_set_drvdata(&pdev->dev, priv);
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret)
+		return ret;
+
+	dc_add_components(&pdev->dev, &match);
+
+	ret = component_master_add_with_match(&pdev->dev, &dc_drm_ops, match);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component master\n");
+
+	return 0;
+}
+
+static void dc_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &dc_drm_ops);
+}
+
+static int dc_runtime_suspend(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk_cfg);
+
+	return 0;
+}
+
+static int dc_runtime_resume(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk_cfg);
+	if (ret)
+		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
+
+	return ret;
+}
+
+static int dc_suspend(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(priv->drm);
+}
+
+static int dc_resume(struct device *dev)
+{
+	struct dc_priv *priv = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(priv->drm);
+}
+
+static void dc_shutdown(struct platform_device *pdev)
+{
+	struct dc_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	drm_atomic_helper_shutdown(priv->drm);
+}
+
+static const struct dev_pm_ops dc_pm_ops = {
+	RUNTIME_PM_OPS(dc_runtime_suspend, dc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(dc_suspend, dc_resume)
+};
+
+static const struct of_device_id dc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_dt_ids);
+
+static struct platform_driver dc_driver = {
+	.probe = dc_probe,
+	.remove = dc_remove,
+	.shutdown = dc_shutdown,
+	.driver = {
+		.name = "imx8-dc",
+		.of_match_table	= dc_dt_ids,
+		.pm = pm_sleep_ptr(&dc_pm_ops),
+	},
+};
+
 static struct platform_driver * const dc_drivers[] = {
 	&dc_cf_driver,
 	&dc_de_driver,
@@ -19,6 +262,7 @@ static struct platform_driver * const dc_drivers[] = {
 	&dc_lb_driver,
 	&dc_pe_driver,
 	&dc_tc_driver,
+	&dc_driver,
 };
 
 static int __init dc_drm_init(void)
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index 3b11f4862c6c..39a771a13933 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -6,19 +6,38 @@
 #ifndef __DC_DRV_H__
 #define __DC_DRV_H__
 
+#include <linux/container_of.h>
 #include <linux/platform_device.h>
 
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 
 #include "dc-de.h"
+#include "dc-kms.h"
 #include "dc-pe.h"
 
 struct dc_drm_device {
 	struct drm_device base;
+	struct dc_crtc dc_crtc[DC_DISPLAYS];
+	struct dc_plane dc_primary[DC_DISPLAYS];
+	struct drm_encoder encoder[DC_DISPLAYS];
 	struct dc_de *de[DC_DISPLAYS];
 	struct dc_pe *pe;
 };
 
+static inline struct dc_drm_device *to_dc_drm_device(struct drm_device *drm)
+{
+	return container_of(drm, struct dc_drm_device, base);
+}
+
+int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index);
+int dc_crtc_post_init(struct dc_drm_device *dc_drm, int crtc_index);
+
+int dc_kms_init(struct dc_drm_device *dc_drm);
+void dc_kms_uninit(struct dc_drm_device *dc_drm);
+
+int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane);
+
 extern struct platform_driver dc_cf_driver;
 extern struct platform_driver dc_ed_driver;
 extern struct platform_driver dc_de_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
new file mode 100644
index 000000000000..2b18aa37a4a8
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/of.h>
+#include <linux/of_graph.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mode_config.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+#include "dc-kms.h"
+
+static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
+					int crtc_index)
+{
+	struct dc_crtc *dc_crtc = &dc_drm->dc_crtc[crtc_index];
+	struct drm_device *drm = &dc_drm->base;
+	struct drm_crtc *crtc = &dc_crtc->base;
+	struct drm_connector *connector;
+	struct device *dev = drm->dev;
+	struct drm_encoder *encoder;
+	struct drm_bridge *bridge;
+	int ret;
+
+	bridge = devm_drm_of_get_bridge(dev, dc_crtc->de->tc->dev->of_node,
+					0, 0);
+	if (IS_ERR(bridge)) {
+		ret = PTR_ERR(bridge);
+		if (ret == -ENODEV)
+			return 0;
+
+		return dev_err_probe(dev, ret,
+				     "failed to find bridge for CRTC%u\n",
+				     crtc->index);
+	}
+
+	encoder = &dc_drm->encoder[crtc_index];
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	if (ret) {
+		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
+			crtc->index, ret);
+		return ret;
+	}
+
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dev,
+			"failed to attach bridge to encoder for CRTC%u: %d\n",
+			crtc->index, ret);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(dev, "failed to init bridge connector for CRTC%u: %d\n",
+			crtc->index, ret);
+		return ret;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		dev_err(dev,
+			"failed to attach encoder to connector for CRTC%u: %d\n",
+			crtc->index, ret);
+
+	return ret;
+}
+
+int dc_kms_init(struct dc_drm_device *dc_drm)
+{
+	struct drm_device *drm = &dc_drm->base;
+	int ret, i;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = 60;
+	drm->mode_config.min_height = 60;
+	drm->mode_config.max_width = 8192;
+	drm->mode_config.max_height = 8192;
+	drm->mode_config.funcs = &dc_drm_mode_config_funcs;
+
+	drm->vblank_disable_immediate = true;
+	drm->max_vblank_count = DC_FRAMEGEN_MAX_FRAME_INDEX;
+
+	for (i = 0; i < DC_DISPLAYS; i++) {
+		ret = dc_crtc_init(dc_drm, i);
+		if (ret)
+			return ret;
+
+		ret = dc_kms_init_encoder_per_crtc(dc_drm, i);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < DC_DISPLAYS; i++) {
+		ret = dc_crtc_post_init(dc_drm, i);
+		if (ret)
+			return ret;
+	}
+
+	ret = drm_vblank_init(drm, DC_DISPLAYS);
+	if (ret) {
+		dev_err(drm->dev, "failed to init vblank support: %d\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	drm_kms_helper_poll_init(drm);
+
+	return 0;
+}
+
+void dc_kms_uninit(struct dc_drm_device *dc_drm)
+{
+	drm_kms_helper_poll_fini(&dc_drm->base);
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
new file mode 100644
index 000000000000..57f6e0c15f57
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_KMS_H__
+#define __DC_KMS_H__
+
+#include <linux/completion.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_vblank.h>
+
+#include "dc-de.h"
+#include "dc-fu.h"
+#include "dc-pe.h"
+
+#define DC_CRTC_IRQS	5
+
+struct dc_crtc_irq {
+	struct dc_crtc *dc_crtc;
+	unsigned int irq;
+};
+
+struct dc_crtc {
+	struct drm_crtc base;
+	struct dc_de *de;
+	struct dc_pe *pe;
+	struct dc_cf *cf_cont;
+	struct dc_cf *cf_safe;
+	struct dc_ed *ed_cont;
+	struct dc_ed *ed_safe;
+	struct dc_fg *fg;
+	unsigned int irq_dec_framecomplete;
+	unsigned int irq_dec_seqcomplete;
+	unsigned int irq_dec_shdld;
+	unsigned int irq_ed_cont_shdld;
+	unsigned int irq_ed_safe_shdld;
+	struct completion dec_seqcomplete_done;
+	struct completion dec_shdld_done;
+	struct completion ed_safe_shdld_done;
+	struct completion ed_cont_shdld_done;
+	struct drm_pending_vblank_event *event;
+	struct dc_crtc_irq irqs[DC_CRTC_IRQS];
+};
+
+struct dc_plane {
+	struct drm_plane base;
+	struct dc_fu *fu;
+	struct dc_cf *cf;
+	struct dc_lb *lb;
+	struct dc_ed *ed;
+};
+
+void dc_crtc_disable_at_unbind(struct drm_crtc *crtc);
+
+#endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
new file mode 100644
index 000000000000..78d0d2cd3451
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/container_of.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
+
+#include "dc-drv.h"
+#include "dc-fu.h"
+#include "dc-kms.h"
+
+#define DC_PLANE_MAX_PITCH	0x10000
+#define DC_PLANE_MAX_PIX_CNT	8192
+
+#define dc_plane_dbg(plane, fmt, ...)					\
+do {									\
+	typeof(plane) _plane = (plane);					\
+	drm_dbg_kms(_plane->dev, "[PLANE:%d:%s] " fmt,			\
+		    _plane->base.id, _plane->name, ##__VA_ARGS__);	\
+} while (0)
+
+static const uint32_t dc_plane_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_plane_funcs dc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct dc_plane, base);
+}
+
+static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
+					struct drm_crtc_state *crtc_state)
+{
+	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
+	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
+	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
+		dc_plane_dbg(state->plane, "no off screen\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
+{
+	int src_h = drm_rect_height(&state->src) >> 16;
+	int src_w = drm_rect_width(&state->src) >> 16;
+
+	if (src_w > DC_PLANE_MAX_PIX_CNT || src_h > DC_PLANE_MAX_PIX_CNT) {
+		dc_plane_dbg(state->plane, "invalid source resolution\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dc_plane_check_fb(struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+
+	/* base address alignment */
+	if (baseaddr & 0x3) {
+		dc_plane_dbg(state->plane, "fb bad baddr alignment\n");
+		return -EINVAL;
+	}
+
+	/* pitches[0] range */
+	if (fb->pitches[0] > DC_PLANE_MAX_PITCH) {
+		dc_plane_dbg(state->plane, "fb pitches[0] is out of range\n");
+		return -EINVAL;
+	}
+
+	/* pitches[0] alignment */
+	if (fb->pitches[0] & 0x3) {
+		dc_plane_dbg(state->plane, "fb bad pitches[0] alignment\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *plane_state =
+				drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	/* ok to disable */
+	if (!plane_state->fb)
+		return 0;
+
+	if (!plane_state->crtc) {
+		dc_plane_dbg(plane, "no CRTC in plane state\n");
+		return -EINVAL;
+	}
+
+	crtc_state =
+		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  true, false);
+	if (ret) {
+		dc_plane_dbg(plane, "failed to check plane state: %d\n", ret);
+		return ret;
+	}
+
+	ret = dc_plane_check_no_off_screen(plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	ret = dc_plane_check_max_source_resolution(plane_state);
+	if (ret)
+		return ret;
+
+	return dc_plane_check_fb(plane_state);
+}
+
+static void
+dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =
+				drm_atomic_get_new_plane_state(state, plane);
+	struct dc_plane *dplane = to_dc_plane(plane);
+	struct drm_framebuffer *fb = new_state->fb;
+	const struct dc_fu_ops *fu_ops;
+	struct dc_lb *lb = dplane->lb;
+	struct dc_fu *fu = dplane->fu;
+	dma_addr_t baseaddr;
+	int src_w, src_h;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
+
+	src_w = drm_rect_width(&new_state->src) >> 16;
+	src_h = drm_rect_height(&new_state->src) >> 16;
+
+	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+
+	fu_ops = dc_fu_get_ops(dplane->fu);
+
+	fu_ops->set_layerblend(fu, lb);
+	fu_ops->set_burstlength(fu, baseaddr);
+	fu_ops->set_src_stride(fu, DC_FETCHUNIT_FRAC0, fb->pitches[0]);
+	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
+	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
+	fu_ops->set_framedimensions(fu, src_w, src_h);
+	fu_ops->set_baseaddress(fu, DC_FETCHUNIT_FRAC0, baseaddr);
+	fu_ops->enable_src_buf(fu, DC_FETCHUNIT_FRAC0);
+
+	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
+
+	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
+	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
+	dc_lb_mode(lb, LB_BLEND);
+	dc_lb_position(lb, new_state->dst.x1, new_state->dst.y1);
+	dc_lb_pec_clken(lb, CLKEN_AUTOMATIC);
+
+	dc_plane_dbg(plane, "uses LayerBlend%u\n", dc_lb_get_id(lb));
+
+	/* set ExtDst's source to LayerBlend */
+	dc_ed_pec_src_sel(dplane->ed, dc_lb_get_link_id(lb));
+
+	drm_dev_exit(idx);
+}
+
+static void dc_plane_atomic_disable(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct dc_plane *dplane = to_dc_plane(plane);
+	const struct dc_fu_ops *fu_ops;
+	int idx;
+
+	if (!drm_dev_enter(plane->dev, &idx))
+		return;
+
+	/* disable fetchunit in shadow */
+	fu_ops = dc_fu_get_ops(dplane->fu);
+	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+
+	/* set ExtDst's source to ConstFrame */
+	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_plane_helper_funcs dc_plane_helper_funcs = {
+	.atomic_check = dc_plane_atomic_check,
+	.atomic_update = dc_plane_atomic_update,
+	.atomic_disable = dc_plane_atomic_disable,
+};
+
+int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane)
+{
+	struct drm_plane *plane = &dc_plane->base;
+	int ret;
+
+	ret = drm_universal_plane_init(&dc_drm->base, plane, 0, &dc_plane_funcs,
+				       dc_plane_formats,
+				       ARRAY_SIZE(dc_plane_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(plane, &dc_plane_helper_funcs);
+
+	dc_plane->fu = dc_drm->pe->fu_disp[plane->index];
+	dc_plane->cf = dc_drm->pe->cf_cont[plane->index];
+	dc_plane->lb = dc_drm->pe->lb[plane->index];
+	dc_plane->ed = dc_drm->pe->ed_cont[plane->index];
+
+	return 0;
+}
-- 
2.34.1

