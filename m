Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62BFB1E412
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F4110E8CC;
	Fri,  8 Aug 2025 08:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="m2erI6ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1E10E8CC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCqFVbLAWW7r41t6VlEE7LjZXEyaU1tpJxZNAqhNm18oaSMCArMU+UM/vyRoPIjCZr5E//NCQGIUg0TJpSeWFN6X/c7jJHEgMuB1zK4N6DatYnstEyMWjhysmvMkfG4CJR6tz4MpFXHe2YJr4TsUczc+Zimw0tdLngchJoiDALT5WOYg6kTYKQGTYPL7I2W/q2inw9gn3eK3kCj5lwEnbum2wMDHM1Z08HFha1mA8ShheXd5x57qp1J3VLczWt/WsGuwtGjoz3FclYA/tvJxbdzARfMvqbgZBH+hH6gjoYSakplUppEnLe2cMknk17Ti08KGed2giJpUb37SKKteTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj5iRCx9lNAT8O/su1bGtEERUbtu6i+aagrS8hKtfHM=;
 b=f/5Ahph3rm3qnFeXOsVlYns4S5wcH1oNe/OzibFNlmAY9q0xgeQ840m6EMjM/wGqp7MEBdtQqN1mlnYfJDFWQIyiaipY/QfrCK7yyKzvbbMLdTN5PchGv6zvNgk4Gpm/IAKXZM4flYtw/OfzNvi5nMrO7kdEMjDJxu/7npMDr37Oxlwsu6rtQpM3Gff6FYcct7D4bznGBopvBisiPciLlyphTYpGciSCafeZ5tLF4nbSJjQZLwNflri9P4aMBSI+54vXMM+r3SfYToA4BW/AMdRcoC5iOvQRizCEyg2M4BQSTtE0b3jkz5a2btiEoNfBmTZx2mmSuOV8Rps1RCtWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj5iRCx9lNAT8O/su1bGtEERUbtu6i+aagrS8hKtfHM=;
 b=m2erI6phEorR7OY/ygKabrAIjo/B30Tu5Mib9yR0RTU9uPg0Mp+t/eHRjO4ObbYy1p3lkZ903ttg0O1a+cZRuVbAkZEYJBmsWqqb77T4gD+zDC5tmS9dAE/zN3efdBiDLdtiJM3mZUHkPpr4mExnfQL7o8oBy1mfdpAHI0ZLTw3T0JW4INjEWWJlyF3YbvYQ+hNOxoyXaI6rlimVCCSU/SrvGkiOjglRsxYti0tcggLcysIchN7PXc+ccctBnSSO38oBGEryHWrcrLdA3IyMCsu1R2IIvznAGKidD/0sgcn1GUXiL/KnTFC6A+2uiEAoahC2Ey4GRNrTBoidnB0jOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7760.eurprd04.prod.outlook.com (2603:10a6:102:c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 08:06:49 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:06:49 +0000
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
Subject: [PATCH v4 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Fri,  8 Aug 2025 16:06:10 +0800
Message-Id: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f859da-98de-41c1-07de-08ddd6528674
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|366016|7416014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hqLmEVkoN4Jf5lwIJaFjY/2rFK//VOBX6R7PrWHMlbpQQbf2LpJERB3DT9i2?=
 =?us-ascii?Q?CbLr5ahtlVafTTEYspwTvmjsXQlz+KW43ABjy0K92Ia114WxDcu3ELiyQyrS?=
 =?us-ascii?Q?JZoLF/dwi35dNu09yx3DhHK43GPc3SAQ+r95oIsW83dwMAtr2sEaF4e/Ov/K?=
 =?us-ascii?Q?trN+9PSnOsczEoAg1dFjGrz+MWqlyWQ5QhtlpIhjIjlL21idqRpIDwe+sSw0?=
 =?us-ascii?Q?RxDAnoSK1NSeg0gIyAXPP5KnDg3yskgQS/hyOso48UZ5vZMZ4ZZ4BERLHONT?=
 =?us-ascii?Q?ksOzCZKvaTJd+7wnr96Ba+bza2EAeVIebZfA2BdteraBmpIv+j9lm4jugW4m?=
 =?us-ascii?Q?3nUIXGwmmnG0vSEclWecJ5iVsUlmzyMJiaSycRau6mZQr6Mt77iAYYGXob05?=
 =?us-ascii?Q?645Amc/BZxpqBQSmY3KwXG9s57h7Me91eKs9AGbRia78p+dreyBF7ahodCgG?=
 =?us-ascii?Q?tZTY83s2X0jCCFgJIjngEQ15Vsl0tx0t6IKBZ7+tnxT17s8l9i1JdW+ME8n6?=
 =?us-ascii?Q?woKSmCnvgNI8bZ+RJYBu7Jce2StmHbqCjjtTCfemtY3Bh17oAUHvWtGAQlGg?=
 =?us-ascii?Q?arnuSjJLOovv1IwaQu/98ScFfzIic2Y9gW6fH8glm+nyS4uGr10xv4YdcUza?=
 =?us-ascii?Q?j/VgcpGu2fkSSYwn2zqDTaLv3dnDrrZNeFDtQjgonYDPQ3M1gfnKPRmTNZAR?=
 =?us-ascii?Q?WReXfsdyxhf7zCtt/Ycggv2VGDWC2OCDRulrwpXymWdusUbQJiPmA+dnQdiB?=
 =?us-ascii?Q?JbCgWO+DTtxJ4kTYTUbAqauz0dN4j75M/3StF/+ID9YAxTc5/mknyF+y6Zhn?=
 =?us-ascii?Q?itSuJMvNnzrjEO+oeY00SZjtNw9m/6Y1ehnw0Xs4NgG9/BDlht5/9LWqAnP6?=
 =?us-ascii?Q?bHyL9HcXzbYs6eg5UvnXQEiU1JtYNgQk6n/+ikEYGuxvFpQl8y6wfVAiHVlD?=
 =?us-ascii?Q?2BHPdpK6dbIYeAGrcImMSpokuvnkMmghFVs4uF2eejkVN7fyGrAcG/97fL6L?=
 =?us-ascii?Q?qfGBdDBCNnZvr0kOyilrVGZE6jYMhkebQaI2pf2D1GXSarfoBI1SgQPIrq17?=
 =?us-ascii?Q?y7rfRf23fTuH86BQ4ku2oPjdhzplhgC2DnayYsUz0afPW3Rqccw5YsEocZif?=
 =?us-ascii?Q?Z7QKenDl3mrou/+RNXk7abrm/Zmk1gpzx2fJBkkLMqeAUC2kHVGz8T/vO/Ag?=
 =?us-ascii?Q?18jB7+Y9/h2G6e7prdCUK8k2/tqY3jpjXuw7SIdSAqsUHDN8L2dmvlwDBcnL?=
 =?us-ascii?Q?/kKvXEvaOWW32ujPJnAaxJMCENxkTqJcd9ntlHtFtgHBYZQ58tjkBY1pMVUk?=
 =?us-ascii?Q?WQvFR0YPZGXp9+7lNdLWh+xQSwI5JOy/9k8Gn7cFGNsJV/qMcAzCzg4NbeB2?=
 =?us-ascii?Q?7EFZtx98EyzW+A5yeN4T1bUIDuCaK12t2cJXf2BzfIYRO3y7i9YRrFmkybSJ?=
 =?us-ascii?Q?emx0xd+9LowaU48bYvaPQJ8xlu/h8/R92xjm5+MBmFmDJMVw56MNbOCJNDM0?=
 =?us-ascii?Q?EcuaTgyBFLfq5ik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kdiWYA0HnbRneYa+GvJl9dJnAYsP7B0tIMMZeyxbBcTLGaNpiQ8hQW8Elb8?=
 =?us-ascii?Q?EFCggjEm/4auRA5uYU8T3e+bv2KA/UkkCsSxLbl3SyvVsRwNfUbNwQd4bW+R?=
 =?us-ascii?Q?poeylFxt0K84mPhQY2jGmW5WWqO643c6f/6pRz3UKGmdbvDkkai+gHcAbbxU?=
 =?us-ascii?Q?Yh7WeO6L6k8f+cKU9oz2Rf6e1w/D1lYYfocSH1yFZTPOLuvQBtMEpml78EsT?=
 =?us-ascii?Q?7sZGom7pMi3f6WkoEF7ve8N6JnGybq45mQm9FRBcVnl9ODWuO7CPuQQciC9z?=
 =?us-ascii?Q?fOL486qsbvZj5Mn29KQMaRHSy6WrFIV2kQJOCZFV0vgAPoQXbOw85Bq6Z+PG?=
 =?us-ascii?Q?SY97EpYDpUzXtSr+5ZiqUMdDIqHa1vs1OCO9YL4+JB1K1tuXieDv2NISCL0u?=
 =?us-ascii?Q?69UY/LWy9gHks9L06/bm4pftRT/nYrgsxfXxVg70iKY3HRzUBa9n01ZP5Bz9?=
 =?us-ascii?Q?o5OJd1CNPKRM35ugDJX2facF+038XIKHMtdrXW2bhRbWoB07ryv2xyfqhl0q?=
 =?us-ascii?Q?tCNQrZjDi+Igi94RWPaRmmo6JYMvFqLu/Q+64ckOWLejObnu9QqJyQrjZPnG?=
 =?us-ascii?Q?EXttQdfTfKXrl2MPrKLSY/9V1rNoCmj+CWO7nrdrKMi9FgVl/rWi9DniqbFm?=
 =?us-ascii?Q?5ZpDF133jnIP6v3hU3l3xziB0WoaRbB6wUyVqSkmefnKyLAcQhvX7Au36F2M?=
 =?us-ascii?Q?19IDXgSHJpLRXiexvDoOlFEJYNXx4u1Kb90CiUGkV44ZICH4Fowu8/Bove7f?=
 =?us-ascii?Q?THj3jVQUOiRWj92wOuEtRYECK5WBxyFC2HQJZ0VuZbbgSPVZvsEw4BtrstB5?=
 =?us-ascii?Q?6uCzFRkYLN1O2kR1do4kMEAxjCtEU/E79r3O1PB+NFIaC5pTWvh0YdV86uMz?=
 =?us-ascii?Q?hpYVwFAnxTbcL1lGWIG8kDU2qs1y7pRBYXm0DaRmwGHuf/zzGJ5GmAfrJMuQ?=
 =?us-ascii?Q?hAPTxp810OpJ50dvS1aYwvgv63bqtltdBmpIiOOQG3Ke7vY1D2SpGTp3+G6i?=
 =?us-ascii?Q?n52C+SSd1tdGmpo5DTJqDjxnLHekXCIjx0pQLsQn5V++uvJBxfdrsbSyqDqU?=
 =?us-ascii?Q?n5wYQFP7uaHxzB2do5ns+suehJXeCBH/O3HtuzbtQiALHi7q7VXaRMMr9oqh?=
 =?us-ascii?Q?nV1eP+8ft+NLF3vxfxXmuzTzA3wdPVNNJBAN6hILtWfiRs56b6IMGQMKme4p?=
 =?us-ascii?Q?9lAx2j+sClEwfwJ8K67acoaqAFRApR8ZPzPDEOblE+fMeLgVQyoUaH8Vb5pt?=
 =?us-ascii?Q?2e8I6J9Fiog56psy7rqj6XDGd3PwT96h6j0OO4yAtLYmL7amyuJfHFwqmcFo?=
 =?us-ascii?Q?/KKMEpnFQUkf7rD1L0BEoKFflafH84/ymwUz3MUofnYoQlrxDAbC9zt2nM9p?=
 =?us-ascii?Q?bvtZ0C9TCGiPUskBiSEXcuJvx8Ctq20IgdyFUhRwwGEZQW+dzNOrZ+x4FxhO?=
 =?us-ascii?Q?1VX8tJBN8UMd6sqgQz79cfproCYTRgwK1GtRD5fnCmK2WvuUM1CIDDYBpmon?=
 =?us-ascii?Q?8drntuDc3IzzyJJN/nANrYUAW5yyi5wTXH7e91iX7ywwWyQ0enoblGymj405?=
 =?us-ascii?Q?KzTLf98LufvjG7KqGFQI5Dg1brDVyRKOFkqD6U4V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f859da-98de-41c1-07de-08ddd6528674
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:06:48.9854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAWzPFVFT5uzjxWDY8VcTlc0wzAPXDVMCOqJzf8Q9PA88yTdVbFiG+8nPROn5UfCJRs6/Qjsu3VPqfQFPEb2kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  28 +++-
 drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  63 ++++++-
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 381 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

