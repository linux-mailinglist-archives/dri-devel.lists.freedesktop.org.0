Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A89B19FEA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BC010E153;
	Mon,  4 Aug 2025 10:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aLVJ1mU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E43C10E153
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8hq2nj6Pnh9NmFXen1yAMS+HjKB8FDDwFXtW7CM3+Do4DgstbPUcu8w0i9AOpcGcY0s3RRoezN5G2OZKohFZlCvTOL+00lg0riISmo7O1TvyY4HQA0o+7BSdmojdQVCstUJrOfDgEWUQnYGzYC7qgC2DLnWXDGB1GzTfEveRbp7ngUrKabchCraA/iIEEz/27McOCg/9m4nqbLrU85vAqvSZmLAhw7YhLxQUgFQUrAPkTyyi8lR9TFI7bpXwJ0PYpg04HpSNYAxf+GWB/qWCbAn4adA1ftI/ldvd+mhHb0CoIQI/ePEI1L+3nZvTWewTXU96NcbUQd6EWpxMakbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQGPMjR/TB3K6MYiHEbSFCl7W/wY3No6Oj9cY/b+wlg=;
 b=yBknj4hdrBURXtJPgR/QFpgKd41cMIPsXrKeX7zT000c/H75PEn1SBXhu7T5W5hnCClSzcN+vt2Sz0OO7qZhn4I2DKiK7KYy3qaT930DY7PJP/BGPkyArFenp2a+OvCOmnAnLigsnbRMg47fms/vqKWnKKtGqYz6u7HmBo8Ezob+aFRrDnwN4lYKcYpTaHZNSm/KVOMMpCe4OQbQnVf6XLrWsrPY4Kc2YArW+gddnKgsRAxyaezkRsipPk3Mhd7iqX4Mcud7Yj2bE0bZMiW/QRTncas0wbHQOAly+ijR0vEA5Cq9fRcG83JqEgJIzIiSZrhDxdDmkLJ7DTTPGj9+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQGPMjR/TB3K6MYiHEbSFCl7W/wY3No6Oj9cY/b+wlg=;
 b=aLVJ1mU/SdOWRgJhZOlu9qeyVazvm2odSOmSYbhoota+2L7Z1UfcP/5h6k0kMLfLI+VEmqMi39Lkr8DAe0fGdl6O02PclwWSxq1NoQlCNRrrc0RclVdalKvABdlO4GrKHz6rXlOzh3ZKb8E3F0fF1CO2mOGdm5WgtyihytP1as6dc5YLsvMmec53EdLrvpmeq2jKFhDHo84FH8Jr5JbUQafjaabUS1dcqNSfsDGQJjaxYhcDPTz9IjV8uILoGbdArzaHAAsL5bjfEsD6a/7U+CProqoPxEB3R3/cC14MAVCT/Hl4sk1ZTUzihuVOWIysXO29eEMlTrp+y3bet1iUAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:47:47 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:47:47 +0000
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
Subject: [PATCH v3 0/6] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
Date: Mon,  4 Aug 2025 18:47:16 +0800
Message-Id: <20250804104722.601440-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c348e8-22d5-4a56-1d9a-08ddd3445961
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dHj2suwdzxSnuZy+9/fNcqC8fC+o8YJqPekAJAUYu8Wt8xjeypHh2faPypX7?=
 =?us-ascii?Q?TLyIZi87CbhR82RHe7kN2AXAULBwAu1j/+ecndsv1uf8IET4PrfXoPOOCVwG?=
 =?us-ascii?Q?ie44XEeDLjKHPA+HULs5C98JucTW2l0YGNDyhi3FgxD8CAv+uA9fyOv41uSl?=
 =?us-ascii?Q?B2uv1WhecSfWW/P+OT4M5eHMuYnWmltCTvs4Cn6OwU8r7nbvvGBv0Bd8T5Xs?=
 =?us-ascii?Q?U3kpsGo7m62k13UJvoAhlcotDBdwjGrQNA11X+ruttT/CLy3PlzQeMvaauG1?=
 =?us-ascii?Q?kMfAyQvfsXKt4qaKx8ZYgwPTKbVmKh6z6HNNX872Dhr6k42kM77rCYDEOCIz?=
 =?us-ascii?Q?8AXJfyaswpJotVGpQXLn/TIogNHF10YikwlwCyE0Av70FUXsHq/0iejN3Ab8?=
 =?us-ascii?Q?v3gcdUdkS3hwIkoZf0S3iDja3kam3qnxyYzEMfEKE6f0QtVZxrVxYODHZ6H3?=
 =?us-ascii?Q?aB+HdTt08Am05Wf9cuDu7SZX6YI1lkUN6kICWhRfz6hg3kH4R8xMyeDvXf9C?=
 =?us-ascii?Q?2UNn3lK2be2+UoJoUTmkG2r3/kVraUYfDTywftH+8HDKGQnQrWk33a1l2G10?=
 =?us-ascii?Q?2XhH9VM1kloKXI3bbqwJFYb6nOGVIPsTqKfPyMD4tdiGrVsxCvJ4fTrUwXcY?=
 =?us-ascii?Q?U+iumMqWGm8GtN75/rMMp90ty5jCHT2HpMhSRpdMGx1Q+hcIxFuCRAuVd3BS?=
 =?us-ascii?Q?Ozwrv7YxTm9IFZt98SgwHr03t45z5uTNcR5L/U63jLwjnA3PjA+X5baIaMGo?=
 =?us-ascii?Q?r7ngHjBlR4UtE6g7pmWlZ2lkQCRlzjD7MrI00oCSsWBO01OsP9Do+ubi0ohc?=
 =?us-ascii?Q?1fKtWWxtK4lIPJwg8UqDkk6dsB9oa4eGnNOeDHkLKa9f3//04jzSzkkgxoEM?=
 =?us-ascii?Q?T9T1o6dG6rgKl4DajFKCw0pjKpHfvgzvWncOt5fniAcaPltdCebwaElckitb?=
 =?us-ascii?Q?ZtnlDyDso2n32+Mcj7X9+rUzzMaeQghPeRmHSaSf5S40PaqH98vzMpuX7Dog?=
 =?us-ascii?Q?CM8ra845DS29qAMz62fksJxInRysp1vLmz7OG1VaWEIBgAbZa/u4CT/wbxhJ?=
 =?us-ascii?Q?Qx7Nz8MVwDe4lOHSL7Y3OwMd8V8OWz1+I9kbpHAFz9CFVzem1AFHRV+MC1Kk?=
 =?us-ascii?Q?brIdL++LNxQuj4Beeo1ov/u1qj7sQ8jwPCGZudRvVfOIAcTzYpQX0Dx6n+T/?=
 =?us-ascii?Q?R3If9PnFHMM0I2YDhLsSAJgF8tzLPjOJXjgRbu8UrRDH7KOGImIRD/OPtvL2?=
 =?us-ascii?Q?POq52W9uOFr7aJ3rCeJKyCeVPK87BeHFUMq/ygG8VetHrelfQsEhzO34ioMf?=
 =?us-ascii?Q?7uDCWG9lqSEmcGZd8E6utxxnjBjbbVD1dEbGq2ubIezVSIiLsK/1Bv7HxKk8?=
 =?us-ascii?Q?sDRS89WrX9nf0oOuUi9l/s2iHe7zGaWAijmvYz74VC/GCAKt48inU8oOR9Rs?=
 =?us-ascii?Q?UmAuM/yBVUT1H/7KLzKRBpuhpsWJIZfx0XvY+0fuB460tkW+zcNGg0XXgQmi?=
 =?us-ascii?Q?S+WTjEq3VCFr2Mo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IRzQUZJ12s8GneYedWuiSJmYUdD8DaYm6lxPbD31nbYs0eEa3vE0qRNRBuyU?=
 =?us-ascii?Q?6Ev2toOFoM4iVP+0WuCH5TVNGGRd/XHp9xmp8iMOcSM1MCXrmsqz/NA95o0G?=
 =?us-ascii?Q?f3eZoTcDt3/kP8x6xMnT4WS5OVesVfucgrmXpYQXuRQK8i9lmJlQqZNK92kM?=
 =?us-ascii?Q?N3DbJZLBTvLoHYLA1BkKVWDh57wJe8L097ysiSbIVX+HEYnf6cYiuGDQ4io/?=
 =?us-ascii?Q?YmEcSlBc+rNSnRRHNX9DIhklnlK1INBeceBThr+JNMGJeMYWcXeLggf51q9Q?=
 =?us-ascii?Q?VGpxHkPY26/txoPXM/jGVbNPZg9o/PVFLx9L091jBcFquYTIJTrn5H2CF2ea?=
 =?us-ascii?Q?5q0899LbHECZ3dOksIlz4nGVkLRaYmnacUTQDgQqxLQGGtg5taAb2Z/uYFlY?=
 =?us-ascii?Q?s5nbv49NmpZOC3owtdB3gIDKn4CF9CXZMbc9O7jeX8VrHYXPiamXPeKa61hm?=
 =?us-ascii?Q?QBudAxeeoJKDVepiAxLeBnPK/TCH9UOUNzoCSQeR+LjXu4Znwzddl19HcrH0?=
 =?us-ascii?Q?rurAd0H/Mj/OHHz6sl4cUsGEb7IcpdhFwk8tfTgERKcMByBGgkOilWO8WHI1?=
 =?us-ascii?Q?q1+svCM5YbRIOOOnP/TzOVzYqbcOJUStneUVTlpJaokV1WmCxzzOzzF0JRXZ?=
 =?us-ascii?Q?5xsrDpZHXlZcgEaX1xokQ93gGYgk7Mp9gDvC30k8w8PI+Nizi3H2kjS7+hDe?=
 =?us-ascii?Q?we/gzOVCv5XmFkQ6A+qxpXBncu+8kKeePGNjUqJTDLvlMPhKUWsX7Hd9egR2?=
 =?us-ascii?Q?InD+RrXsGcjHJD8b1E3KDEnZQ5Ymjq5opBpGx+oHf1KDPVJLDx9bOZYesM1W?=
 =?us-ascii?Q?NFsuqUtaUsF7jIXsTavxbVuhCMTIe06mAPsmdQCxhb6vbnMFsGaDPFNfTbX7?=
 =?us-ascii?Q?w17MC8Tm+l9kWGVUOkz34wI3VR9942PKut0MrI2xmTnqNeMFtvFZ4j2ai455?=
 =?us-ascii?Q?PW+RaZtJ/SNeVPTzhQ6k2jWHXRqjl4G25qcWdYh136Vqe6vGh41vT6Rndwh7?=
 =?us-ascii?Q?4XW2voPZbfVjnHhRGQ/bhHemRI0pHHsvzXWjvF5jupG6Ocxzkjvb2WZPBoRF?=
 =?us-ascii?Q?nztX8UIMqshmKY+7oZDzk/UE395Sq65v3Igpw8HZ1aEulQEjVDetSCStcFiB?=
 =?us-ascii?Q?GwXYbVEP1x9TUBZKkC4RcjXH4ujG5t0tM6YuK42GUuucORdaLah6NeEZ0QJQ?=
 =?us-ascii?Q?KcpsQiy7Fxe8scDzbcZKm4EzHmucSuFC2eWUJO+L6n/Jhz3RlCjOBNK6KLOc?=
 =?us-ascii?Q?ITEBADXVpwbx1thB6PZj+Ju3uyahulrJbW27YbLo+3iN9wner+AwShCjFLBD?=
 =?us-ascii?Q?mFDT50k0efsR/tEBySOU6Oo/TYTFzmz4vEF1Nz7zAjx3YzDjJ3tlWrCiKnE9?=
 =?us-ascii?Q?nh859oADoesCesZpd0dDBPChv6nPbla4SPBzZnQ89y34oo0qwfUnLyO0WCs+?=
 =?us-ascii?Q?LHvutQiNQrwRSndZQfaLywbL9bzu3w1PTM4j+kr5UJgD1Rwz0QaxR2MtOJ4H?=
 =?us-ascii?Q?C9h4ZQQbN6jvouzDIZDP9k7s6UXV9xXXhZiMpk71igdImKFIyDFP/ksgf8Bl?=
 =?us-ascii?Q?EGpiRJc46GSudJhJrlXCJQPaQTuIL3+WKsJrsLmX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c348e8-22d5-4a56-1d9a-08ddd3445961
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:47:47.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HMX3BanJ38U3fRA2BwvJ7jgykZgiffrTUFPMK69ePCjIFoW+8KdwBqPk6iTuU7LLMAltcla69FbDkr1F1sF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643
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

Shengjiu Wang (6):
  dt-bindings: display: imx: add HDMI PAI for i.MX8MP
  ALSA: Add definitions for the bits in IEC958 subframe
  drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
  drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
    format
  drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
  arm64: dts: imx8mp: Add hdmi parallel audio interface node

 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 +
 .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  28 ++-
 drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
 drivers/gpu/drm/bridge/imx/Makefile           |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 205 ++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  55 +++++
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
 include/drm/bridge/dw_hdmi.h                  |  11 +-
 include/sound/asoundef.h                      |   9 +
 12 files changed, 422 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

-- 
2.34.1

