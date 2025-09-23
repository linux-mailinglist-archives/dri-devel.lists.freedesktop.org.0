Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459EB94666
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BF710E090;
	Tue, 23 Sep 2025 05:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jQrx9rLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D4810E090
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye2dG++68/CggHb7/jM9aTkWkUimljz5hYo9RMvgiMeKHyY5BaGy7AoBMvF7mCqE49xWsR1DW0kYfaZlbpS9JCnSsjTNJ58/SyUS5qU/DzP61BTPn71D6dcfVFeHB9ND2X6JxM2kzW49BI0JNUU5x2tSKV1brC2QWErDdkaXOHauaryTMI05FNFmHDtm9uoUxuZq5jZ6RO7zqgicX5LlVk7ShLIZgLCDZ3y6xDvzodzcvPwrUJzwK32Hn6ZWPMokZuZsij26rPIIxkdT6KI0bHatC6yhGahmFBujPSaFajxj7ADa7dAhvWBajqHF7oovUuiB1r+OGGcRoLZ//M10Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBGN5dLImOiCT6+4mHdC1DnIyujxrylEbe3QbW9x8To=;
 b=YraEm3Jhy6jvEgPZPJVwBO/LgSy8EOo6IKHlY5x+IHsfCfheRAktIqocs6AndwXxyRq/IO1On4D6zjcritrO857HdWkwX+uJ0W7WGuZWaV+7jVvxEIglr3Q1cWxUoyEA9qq7uZeCEI9fRJPG5aPXhkC1+UQgj5U2YnfiplHR5Ihmhspac6Zw3/RiuVWOluivVg0O2qyPj8WpavYFdh7k5RJBL7cc3g4i8RNV3WbtsGg5vkqE7rxvTCGJvCz9T9TYA2vj9WFwZQ1HekiBOKpiVQbasA62qDEOAXEKocYqij0ZCXp5pkzIEcxUTIBOow/2F9CQZbyJ4MVwHfHFE1X/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBGN5dLImOiCT6+4mHdC1DnIyujxrylEbe3QbW9x8To=;
 b=jQrx9rLdqmMWZhu/waUgtN+WMQ+rDzok11LGJKFx6SzTsDvw5au+tBxUuRFIkJfJ2vPLRXt7gvIrgjaUrPmRmnBmawi+5xdKu9j4sk25q4GkTM+hw5zmMFdMSWoaa+J2Oln8i6fbXfgXgoYPklJxMYiz/KCo+sFFktQMUHHWx25HnhVrHYPm4lRRFvaHzQstKAnFWVKC4Zk95456A9cysVf9Qy6TPOrPme4nhMYMIZl/F+f4ya/my2T9pOPstnRpRzJMmrD/ZNkNhDbzj4uhpvpoCzsoTLf3QGpTZmvmz6PgzMEZlR9ITjvJLVXhuULZ7DtvMTgTIHVi0K7zY4UdqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:30:31 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:30:31 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Tue, 23 Sep 2025 13:29:54 +0800
Message-Id: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 34de0a9d-8273-45dc-45ca-08ddfa624feb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YBXnhyBquJlthqW9RB9FYSOswahCCzWLUYwHjpGh4PwUWtgOa9XLA9uKj7Y9?=
 =?us-ascii?Q?j2Fkz8pF0NAZ73J8jClV/vCBHcalkFZVW2NSB1+Ekx8IMC4Oxs+iN9eq3Z77?=
 =?us-ascii?Q?9old26seflrjzHVHx82PNQ735Tlqn1mhJ1HZlwEieU3ABwI5UFvDzD3WRVDd?=
 =?us-ascii?Q?ujqhFdMv9GCJcHS4x4AqYadB48SMiQkzdoutz4yeC+d7xZj+KkraPDmRQmwa?=
 =?us-ascii?Q?B8UQh5BrHY5yongsqO44h9dHP2YCNeQXzHDwNCf3fh2BDwm5HyNdSiJZQWCu?=
 =?us-ascii?Q?tr6l1CNTnfxlBHGz9kcG/CDATMkkkaFd5b9ksVguC4K6jfC+JusbnhYtdTG8?=
 =?us-ascii?Q?Nzf6ywA0iO7mPfB4ExCC+NrulTNsjAc2EjOH+MNPTVPs6V2i1jxPAjvk/dbh?=
 =?us-ascii?Q?6bJiHhQLGCs101FHjSb4Vt76Vkdyo0epoRS1+E/AwT6Hbbd2vpHkZFvvxVzY?=
 =?us-ascii?Q?xIb2Pw8R2UINYAIuW4F4eHTg35+AQEAXXR41pMJ+Qny6JjetgrfRaMDole3W?=
 =?us-ascii?Q?DP+1OW2UImiYuyfRjXD2BdTJelmxu0THanbfiJ3w9FC1ujt8dBG8DC6bnxsa?=
 =?us-ascii?Q?j3uAPehRSiP6eiQljy61mnQfCYJ9xUZPVHwF5RC+vO3UBH4wHrsWwIBqD5Es?=
 =?us-ascii?Q?lEIKrSTaMLSurhs9ub+EIfIjsf1Ffd/Nx/CHsNIQEL1b8yDZDHNT7cCdAOCo?=
 =?us-ascii?Q?rlyLtox1r21tkaciaAl0V1+utmoiRsxweoR03+OcrfO2Es6sSiHlUvuQK+Hs?=
 =?us-ascii?Q?Y86dFaYAU5LoPVZk1Zi6h/NuLMs3joeIT0f17XKTAb4N1eU+iLVwoXWOAY3w?=
 =?us-ascii?Q?WAPEFQDeP3uU2Xv3t49HsuqVfZiZyU1tKGYeMM0kdZ7JQCMQruFQVBAI6Cmv?=
 =?us-ascii?Q?RWYTNO2MBQ7TXlHCLHa1bdbpZ0jscWljr/Xj7Y6swOHA+W9R5iLeIL091lOT?=
 =?us-ascii?Q?C484B0aRJrRTfzBrYBqG3vuTWMNOS3Zj9h2ZyBtCE7Pxfoa03enV8NYuMeLk?=
 =?us-ascii?Q?Od2rI8MzkLRWuJaBzTwURhY3qmpw0RF3650pwx2jif9Q12RBHX2y65zfEodt?=
 =?us-ascii?Q?x5zEsNvxnO3r8tbI6p4nrmIA5E4X4zUm7a4jF1jh3+iajFJ9pGQ4A0d6itYQ?=
 =?us-ascii?Q?NpZ3NWxz0CTdScsTc3XwC+1h7ZzQKaE3b3WUiAiczJqr34e/AEI7eO1CApFG?=
 =?us-ascii?Q?zOOSMFFxV92+Y9QcvsxtxEvP0RGMs30QZV8hcSVo26kCzl0e5sagsubimwVF?=
 =?us-ascii?Q?ujVpYmZe0ydSW8LX2PVtOvkP+l1le5TGVJ+TWJ1f3NRD1dRvg6ozXocH1Ase?=
 =?us-ascii?Q?BJ5JYmvFPjtGsqCfEISwp41GIPCTJghK55kv9JhdEe0FZghqSv29/nfS6YGL?=
 =?us-ascii?Q?18eLYyjanNaQPpuRqtHgK7wkeyl+xzqtM3YjQAwWQDwVkHfwm6X83A2cfSf+?=
 =?us-ascii?Q?SpYi8bVvf1FNqHOdTS3S2M+VdhfC+5DaQNPgviPfgf8BSdUts0OenWI8r4hX?=
 =?us-ascii?Q?ZjQzlXBJMY2VlWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ulU9jbiIAvTh0o9Q+y/QEphMK7hczuZ++CVNyj8/Hs0rENm/NEPUZxqWYKAp?=
 =?us-ascii?Q?B1c3/w/SLFvT6osOXSnG7c48JgX7cwI1aKHOsh9/ASTON5gSU7vepqw0DckK?=
 =?us-ascii?Q?yuyAqnhCLkEiRT1sILPeduTEmfWvhURB3SHd6ZuZP54+KO6L7SaZhAkhEGj5?=
 =?us-ascii?Q?0QU7N0c75Qcs63gDp6tPEdgva3L0VPPEIPpRe2528BB0UWjh1Csi8UfsHyTl?=
 =?us-ascii?Q?PztmnxA5DKdT/t+VTSN2hR9DZRseIJip6wGi3m2wVrXwErL4XrPEuFC3AHtD?=
 =?us-ascii?Q?kU05y9Ky4PrvaN5fsKqrJAiY6x5w8YVsrH8gSw6YuUTHrNUdXg4kw61mQNlH?=
 =?us-ascii?Q?OM1y6QuVqJpcX7QPQL41voePPlP626D+nn/rwzdsIy8f2WOIGy61uYJpr8Mp?=
 =?us-ascii?Q?2/j6M1SLSMBVowtOXus50MTihXdNE55C30KATcvu+erzSHg5WON65ngH+Wsm?=
 =?us-ascii?Q?8Oj8YWrHunc6o3GrlrGha44Yj2D4zpIPrYgKZOcmQBTt3cMalx+8h3ELYtPd?=
 =?us-ascii?Q?wCFc2TC+UbYbIwPoVPUJ2n3O19s1tbzqug+tv2Y9TTDrbds5hi51n3BssU5P?=
 =?us-ascii?Q?1h7Q/VIAyXT2KJiEV1WsVidGWHVTKGAxsygPbWTFoN1lJf6exs4+Y7ah8RpL?=
 =?us-ascii?Q?aRqoqQunG2dXc5zB/ycog3zAqJUbBi9sjS7yClGyE7OiE/TNNChuc00mxQzA?=
 =?us-ascii?Q?OVQd65iYKoKMBvMIlthFCBuofDUcaaWcdBM8t+RgGHLUMa9zh3H4sDvnM0Gg?=
 =?us-ascii?Q?VyIMh9KEAE6xyBaGGyr6UfwhNWQYtTqjRnIrl3GWfzWjowrhb+5HkUwMtbpK?=
 =?us-ascii?Q?Qya1EbQDIQFBYaiNPCbumjQzDkFU+7kFZ446VkpJYrKtqEMYy2Pqi+d7O2FY?=
 =?us-ascii?Q?QZ70d7MISNhLSxSQ4yKwvod7VuQvuAhUqDtNLHn034tPF1HNaRAmj3gQhy/K?=
 =?us-ascii?Q?kWfkMGCkyVVcZAyiDMz79Czo7TsHssxVKpfRuTlMuUD2YHprg9FvMfTXdJIr?=
 =?us-ascii?Q?N78eydrMnZFZStNaqQlWdBep8cgWEuuDadfj/4pzwK3VZ+Cow7Fy5RMsRqmy?=
 =?us-ascii?Q?hA+b1iRQm3PrHgLIbSICIMGkpodRutyd6p/a33V/FSN47IEeMuQLcmco/Bn6?=
 =?us-ascii?Q?19rDY5wOkC3KoNLzzo+o81BDd+4hgvi67Ib8LrAYRVFpMLJIaPDGBONEGti9?=
 =?us-ascii?Q?y8kK+EAwGzBda8fUiiZBF1IsHdt00SpfrknFtmhFTdp1pFW+/47K13TCbE1p?=
 =?us-ascii?Q?MLZ73G+7f3sWhVhLi+GOR//5Jsgb2PBljgL+fm3PgzeyKdOBk3wGilhrmJkv?=
 =?us-ascii?Q?7/O4Z701vRWm9mdIZA/QL/rddPoCj6f8jyoRBEtXiFw6KSrRWlyUXdm7eIv7?=
 =?us-ascii?Q?e9YvUQXBzDDqpCRccwg2E/M/EXOak2OLc/vSrBOZPanHsevkg+T0Xkv4KfZV?=
 =?us-ascii?Q?SQyT5zihSx8MsTyOmHPFSeyJBM2c4ZE1GNTPOYpad+1HrLXjAl/dC/x8E8k8?=
 =?us-ascii?Q?zp1sg5xhpy6X8Hb7EbVd9rMU/ucNZmLETz3IVR9ZnYfyNbpi8DJO/0AsKUGc?=
 =?us-ascii?Q?3zYYC8ZdsJS9AqSev6k3YdKPjjJcf//5KlZf57bF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34de0a9d-8273-45dc-45ca-08ddfa624feb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:30:31.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwXfhy58HA98SId4THQZwpW767NIVVcZJ0ujrRpBBxqeI/ZrSm/U3AiQDoOATICUFSy9dqJbqnaLhVncmfuuQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7920
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
acts as the bridge between the Audio Subsystem to the HDMI TX Controller.

Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

changes in v7:
- add back the mutex which removed in v6
- add Tested-by tag from Alexander.

changes in v6:
- remove mutex in dw_hdmi_set_sample_iec958()

changes in v5:
- add empty line commit message for patch 7
- remove blank line in dts node
- add component_unbind_all when dw_hdmi_probe return error

changes in v4:
- separate dts for soc and board
- bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
- add "select DRM_DW_HDMI" to fix build error reported by test robot
- remove unnecessary code/definition in pai driver

changes in v3:
- add space and 'U' in asoundef.h
- add more commit message for binding doc commit
- add bitfield.h header for fixing build error

changes in v2:
- address some comments on commit messages
- add two more commits:
  add definitions for the bits in IEC958 subframe
  add API dw_hdmi_set_sample_iec958() for iec958 format
- use component helper in hdmi_pai and hdmi_tx driver
- use regmap in hdmi_pai driver.
- add clocks in binding doc

Shengjiu Wang (7):
  dt-bindings: display: imx: add HDMI PAI for i.MX8MP
  ALSA: Add definitions for the bits in IEC958 subframe
  drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
  drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
    format
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  arm64: dts: imx8mp: Add hdmi parallel audio interface node
  arm64: dts: imx8mp-evk: enable hdmi_pai device

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 382 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

