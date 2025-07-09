Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D564AFE8CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30AD10E07F;
	Wed,  9 Jul 2025 12:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JztXZrm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D9510E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1ptamitAvAXqurho8jSqbscWhPUSj2Ddac8BNICH2/1NkQPRQuJkzIqE7LqudchTHtRWSb2KG1k4dDh+0pqZ2FX8PYTLXpuPndH4XnbHFmvahg2v4gfxsM72EKINx2qoBcDNeRgdWRntIxExDWuflLLqJYS/ykQtfAWPFd9K2EEOK5J+pVVERcpbbYASsjZ7je141RStiaT6a9yvdf/ElMGNWAeuRUya3XzfW0lqZauaLMi+0iKiCHWHY4rpY/tNYTJ1kLFNKys17CEBoVgxTKOD4poFbWhP/iU29TLvphHnj1UJtTtAGo96FAL65jOh9tfd5iBNnMOTjepPgQyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CegsU3D3Chq1iuhHqgKEwiGMvqedv0Cp6B7VpthkvXA=;
 b=oEQ1OxG522UvkHBIp3TD+PJ/RRYJkdGozRJau/hV0Rq9N6nDszWji2AbqVBl7Gs3Au4Xo4jWl4GU3I7tXcE83lMLf5d6cBnHHihty7CJVLx4oMGaT3x1bMoiWnBNZbcc0K/5qjdpmBJ4DU3eCKpBXTZRKH4KZ7l0JmCv9XOtcfurY7tt2zUvTo6i3pyB1LZp8UNLEOAaou9dZN9ywUfH62bpOgQ6S/WK573HHltWsNb5/13xidu/ShYoqpaCAtk2xbHZW6i4Q6mrv/rXbfNAxMYcDHPOMoKhOAG1EJTrhg9yzb8N5anLRMdSNyzwbWZogFVGTu7iZLPEfTrFJPbH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CegsU3D3Chq1iuhHqgKEwiGMvqedv0Cp6B7VpthkvXA=;
 b=JztXZrm8GVbAkj6j4Sp38RSClflMG6ljVIcPH3v4e6QAwD49o9FQXGfJQzOehMWkFgvw2Q39SzyjU52qbIIEy9NPO9XRmFEOxTaYmFBGwle9zzFooPu6GyLu3cBFQ9t0sO7BmXuS0GwG9byYYcgl0eFn5dSlWl0ASfck6sEZEhhKhBM/vbazDpo81sKZbGzwm5Zj/ZHa8dJ4h99pCd9op0Wkp+D/oUkW9M3HaBH1sb5raBa29CxD0nknldIFkFm3BhQc4EffTLUhL8ITtMH3+0ExILt/w2QWwXBe4FslhlhaYwziQT1bOmyYn8BT7o1bfDydSGc7sUevxbklCm96ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:24 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:24 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/8] Add support for i.MX94 DCIF
Date: Wed,  9 Jul 2025 15:23:19 +0300
Message-Id: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: 8209f325-733b-4fdd-745f-08ddbee389cf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xfQQox7hzKZ9pLy9EfygZfdS4UGZy+8BgeYnv7Lm1KTBV5mUMkEIpLCGIZuH?=
 =?us-ascii?Q?MpNpTAfUstVzuZ+444nyERkE6cs0od9PqhUfoFdW+PMFaK9hn9J/Aqoput83?=
 =?us-ascii?Q?W6nqAhxhbVjdhmRIJlfhfrTU2MP0AsqUXEb+I4X/zu5H3WFVxdiZeJWMbYTL?=
 =?us-ascii?Q?C0AYgwm/NVyDMDQcOB9KUJxCo5PmsmQ96dKBlY+aavXx9QzDs/QWHi6i85Gj?=
 =?us-ascii?Q?0GkmCDXsdXAl8x1CQR6+rcEoONAct+QKmxlFxQewuH8sxXHXeVqfXX6U9hfl?=
 =?us-ascii?Q?3rbRe5dAwTPGl7zfK2g34gHSYUfG5UO174H1kRt+apJoRJPF8SixQP86ipU6?=
 =?us-ascii?Q?MadW4Z/gG0vOLbjij96HEbjeHd7Bh2kCaBqKEyTS+uzXGRVPwDJnzPNzeftu?=
 =?us-ascii?Q?QDbHpz9LyIqwQow0kR1EyfDW1/kj9z1sVaG7gOQegM3ue/uw7qxV0I0i7rIU?=
 =?us-ascii?Q?CHeDITk2RAuxM/1p7/s2vSZEw9MUrOGOrALJLE0yz/xlKp8KHeZkqreDmm0l?=
 =?us-ascii?Q?CFVe6paZ88aBXuhOgoWN3LuAu+8TrXo6m9VcQnTxNOvDMoA1TxeVo8jCcAsT?=
 =?us-ascii?Q?63Y5dBPiEx164He2xgN549C+BK9bccW0oe/35M4x8PFGvpuRnHv5hQ134BIN?=
 =?us-ascii?Q?afr6SVTjSaxXUJSx58UtXBELxnDVf0fpEl/mrefp2Aflk/yULhv5vIEpT8Hc?=
 =?us-ascii?Q?N0RyiXcjwtylbTa8du//hlMpYzmJ8mEfmov4HwbWCT5kqmrgaZ+tv07SnTw2?=
 =?us-ascii?Q?vCANd2kb0Mi27DkqN15WZGncHecxr5+xjy89T+I0lJFk/IBkJyRZpU1ynRP+?=
 =?us-ascii?Q?N1dJoWzWbNkCYA8/WPIFhqP/f/Rw6CKi0pxDpL8kxxODkt3DAIKJEHZgCyqY?=
 =?us-ascii?Q?haFQKXwGN6/i6MLTh2aiHDYJ5uxXshi4Gh99BmeqnTim8KA59dGuAZwOypMj?=
 =?us-ascii?Q?908EyOanVkxav2hhdPJ3INZElovZUwA7rIzVHvs8t8Kxa+MMUSWfi0V6oRte?=
 =?us-ascii?Q?sKvudgJ2iI/xrnNfA0gxCLEHMxFXRIqtl0Dn6AqVr4BpXg9l/glTwGv9YRM0?=
 =?us-ascii?Q?PM1COMgRxSpF2cT5xD6ftyvo1gEVnGyjpZR3K52J5nwHuoHN1xBg3ixy0JxJ?=
 =?us-ascii?Q?uU2Sikp4N336wDPTTy0rxPANZ1LI8cdcwahiXVDpFshb7a3UxB8F86hLu6QN?=
 =?us-ascii?Q?I7m/Loec6oAXs7tk9KbEl/rhoAz3Ef8i6+ssQfXuXew1mnfhYkGrKQXFr2MK?=
 =?us-ascii?Q?Dpvs5DmdEKxF4RKtCv4MAin7rTu3nrETWz8JO5op3dLb1IFQ2BM0dYGy15uf?=
 =?us-ascii?Q?GSH4Qq3A9s3ulKJWCRPXE18N4OXXM6r9KTYWwPGLUKzD9sXfVCu+aFkRhLnN?=
 =?us-ascii?Q?ZtBTxzw0HehkTgL1heB+o7CMydGferjKyrgOWxxJGXVZb5buqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nIOv80tW7tz+28GwaRVXbMxKG0AtxRrZaFUj9uIL4kJkBv2FUTFbXvjvfm+E?=
 =?us-ascii?Q?VSR1tQKpb/MT31xbIGuT/VMIXeh5XsQRCmm3lhzPpooAVoMALY4Ghj+ESlux?=
 =?us-ascii?Q?Vr2Q5kzXaYMTMOVWp7EPP07NHDIIRY8LfCpXHT5wy2btGpybTcbg/gtinS7x?=
 =?us-ascii?Q?33ZLikDgD6bYjQArmmf9arvKhnuPioYzZvBX/4XiETU+JBbRqQHVJsYdkm3k?=
 =?us-ascii?Q?2GuPfnM9iocWpn5AWBnNU/g98caZicqBx0Ig1UvW982l0PI5Cbxj4LBZBabA?=
 =?us-ascii?Q?FDCQifDXDyZuH2ddTqPRwS4PLVjaAfRU1TlZweVILIAQ1arzr0TGG/TR0tPi?=
 =?us-ascii?Q?bIOqIxF9ydEqxAh6V/udl1PCHohccc2IzDIXM/lM/rh6UewuTc7ajW54taqk?=
 =?us-ascii?Q?U4lPXh9QApFO3mkdMhJp5Su9oDBog1KxLajiAr+nbJ5FV4GvhKq6FavtteqS?=
 =?us-ascii?Q?UoXF1Jhjov/vHZlriN4wbuE3sDoclBlvH9pAofqNXLjdpgWL6NQqgytKWFEO?=
 =?us-ascii?Q?d49Fu+q6xCCfWC0TJZ1fYEDAIsTCzCw4CH4xYyUseeUErfXjEEs3R9VAdyS9?=
 =?us-ascii?Q?ZSBfIXgb/gZ1y7jE+cSaviPcVJjYk7NEm5OSXOHhI+/97hKu1EI9rt0MVEJR?=
 =?us-ascii?Q?E/iaR/DLrxQLg6C0ELyplBZGPu9171B7j+OevL2gkd5jFV41s9QOV83W0IPz?=
 =?us-ascii?Q?GhMNZQSDY0smjW0RnN3dpBOB7ovlmwRWC1lGWAwbuYENh8YJVnEqXchGHqSu?=
 =?us-ascii?Q?v8QOVeH5wbJaRCbuBAw2sFtyXciliJXGbdmpv/dxBdj2pUoEpVEdf+lUtPui?=
 =?us-ascii?Q?UnXHCqEBIFSHRG142flBpV3zi2j0rimacndV9h4wjHlP3zUE1tJfQv6a2XKJ?=
 =?us-ascii?Q?XBM6j63rWnqzPD1U9xGrNXT7FmuuQmURyZLVuRSNSH9UGNe+hXTSASpbS3xY?=
 =?us-ascii?Q?1lDQ4MnZkhMm5X6ZlkTN6vpV+PdomnxFXm5+yO4CxU/8vgS8x6eLdaypMrTJ?=
 =?us-ascii?Q?5ybBo8Qhw/D8f9J0wXpRFdgqXHgZAr3Aa/4+jTDuzvZXSZUc5cMbotGMvIIQ?=
 =?us-ascii?Q?XCmOwhPYe7d5ij4UQfX9pgetEC430Lnbi969A6BYV/22iyW4RZyD6EW2yLRa?=
 =?us-ascii?Q?fNCB4HRAJu08XAHV5ReTKEscLsq1zLka5E7kPzHPyOORXtRwWXBfjucGrMwZ?=
 =?us-ascii?Q?9n+EeLuXarPedWfNxfky/3cKBqPu0/rtpLS3GqMRDigTdXA+HWDjwWMCujym?=
 =?us-ascii?Q?eOTYIiAeH6t/ZZF2TFT5gFMOBbpSZ+lPTECuiW9+egaCOwTMDUu84Q8ON7lt?=
 =?us-ascii?Q?9DMhMjBDxEqyKaLKPKvuUT7Rt85GwAyTaEQjztDgtGYHQKd06kccQVJCtfjF?=
 =?us-ascii?Q?36D6xNQxDm33REfRldxFS5yZFEAG+eFajXqk9WZ+Au72M5gsArooDh7NCuQp?=
 =?us-ascii?Q?B2sKj/1YXn7rfc6nu5OIMDS5pqoib+GioB1za0nQ9ckXCT2NTCDvKyYv2wHl?=
 =?us-ascii?Q?/HvVrywLt8iK/cFDQWwj2/Q0HlGi4U/UGBoy3JHAK3iv5gK/Xn6FFiKw4YiR?=
 =?us-ascii?Q?rFtWql+mxuEvBSNiNfE4xaAv54kdl18QLPVvrZyLNPqO8CDrFtaxjw3LLaKt?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8209f325-733b-4fdd-745f-08ddbee389cf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:23.9240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCa4BSYjzTnN3O+x7sHakZlgh6uGIrn2WBqcrS2g4FvxLf9sMgYAYIqTFcazK+MQ/WFV4bLVWJHz+NTL0oXApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712
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

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It applies on top of Peng Fan's BLK_CTL patches: [1].

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/8       : this is a fix for i.MX95 BLK_CTL driver;
 * 2/8 - 4/8 : add support for i.MX94 to fsl-ldb driver. It also
			   contains a patch (3/8) from Liu Ying that was already reviewed
			   and was part of another patch-set ([2]), but was never merged;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/78
[2] https://lkml.org/lkml/2024/11/14/262

Laurentiu Palcu (6):
  clk: imx95-blk-ctl: Cache registers when RPM routines are called
  dt-bindings: display: fsl,ldb: Add binding for i.MX94
  drm/bridge: fsl-ldb: Add support for i.MX94
  dt-bindings: display: imx: Add bindings for i.MX94 DCIF
  arm64: dts: imx943-evk: Add support for DCIF and LVDS
  MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
  drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
  drm/imx: Add support for i.MX94 DCIF

 .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml  | 101 +++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 126 ++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  56 +-
 drivers/clk/imx/clk-imx95-blk-ctl.c           |  55 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  47 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig              |  12 +
 drivers/gpu/drm/imx/dcif/Makefile             |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c           | 211 ++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h           |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c          | 696 ++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c           | 293 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h           |  87 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c           | 101 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c         | 269 +++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h           | 326 ++++++++
 19 files changed, 2406 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
 create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h

-- 
2.46.1

