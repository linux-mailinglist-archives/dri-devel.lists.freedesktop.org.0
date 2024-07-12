Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9D92F7D4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621B610EC75;
	Fri, 12 Jul 2024 09:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ml7HPyVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946C10EC74
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAxk6MMv6VPZ2lpDK2Omya15pB/6cGNhUrhHUORBtmbQTTRgwlCayWjbi7595YF0flzoXKWcHwGwRfxBjugrjVhIvElyAVtmylmVrY99rldvrkwzEfRIz57YFF1BuGOvf8u9mZgsDuV7txZEB7TwLKixHo8KUidSnZO2auZ8jiHffgC72vuoR7Tg5Kddc+n/YWiq4y+hAOVP7QDl58JodhkrLwRi+XHopA5LuwR+2e3ZyK0mw3txpSV60g73kmfuH6c179WdKJp0Wz3HVMHoZsgYwnFFevJyFEhuf5bMvAAr+h2rx/HpsJtfrZihXCw/9h0L0USKGaFMQfEhnpq+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI9+ARL/KKWYXh+mBLwSIVRuoKoVjpRE3kCHq6bpTIw=;
 b=xG9OqxzhtVMZZx/Mv+JF7GXXrJyhn+BYyKInPbEHa4Y18P7846RGEk/d11OWlnEGhKpq1bajThara/Vd+eqFUJPKfMsGToa43//ssy3eCk0jZpE1YdX0UJvCR3J1Hxvr0ucRdcne7jGf/g9FzbCXANxhMCGFiUq80QG7+/9jvMglaq45DKh5JcuJh1nMk7HdSySQfFxb8b6DwXQp55YXX/F+GGmcVihqXrEWOUAJh6Q4laW7NX4UriKYOkncpuWTUIejLmLoDB0yov1hGN6kJleSY4bb4iozczkGKlofKSFWVXTPOSDQlm6G2a4Wa/RAAHSeZtofSjtsddJmOpwPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZI9+ARL/KKWYXh+mBLwSIVRuoKoVjpRE3kCHq6bpTIw=;
 b=Ml7HPyVkk9h809I0/P/MrPeF6qxToURirowI0PpkEAYTxlM3UDptCR4RVu7sSh2KZysUPSsqYbEYQ0H1krtbQmMDkPD/OtGoqwgj1JelCX2/ow87Vs2N6WQZVG9KfAz2oGa+GCPTpFYcZpaw/kF0YtUBKdYPLl/Ipz3e6QIskPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:24:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:24:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 00/16] Add Freescale i.MX8qxp Display Controller support
Date: Fri, 12 Jul 2024 17:32:27 +0800
Message-Id: <20240712093243.2108456-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f2dd90-6e0f-4e26-5f5f-08dca254727a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?INp44zhcx+p5Hx5idb+DW15anl900dHfAauZ5dg4MGZKTUAb2b3cnO393Dt0?=
 =?us-ascii?Q?evbrTUd2m8oEd77SJ6qxuKf1Kn1a2iVl/rpt8E0yPypL4r8UqR23rlHIO2Iz?=
 =?us-ascii?Q?UcdAZrJ7ph98VdTydkMRNhRbx8TPD955b2vSeUyLQ8ZrhZfFU/xZXpIlFZXm?=
 =?us-ascii?Q?oI1VCGs4flEp2GsWtSxVZNUA/EKNKqu70GZlYlZgUVW4+z/PL60W6YKdqy0L?=
 =?us-ascii?Q?oKgpO/CWV8KYwh2S+B6Y0XLa7F6epWvcgrf8O6oRYgx6njs5RM06A6GlyNm9?=
 =?us-ascii?Q?MmopCuCAQ4VfzXLRxHf8jbLCo3vN9EZUfxVV1tNv5i4nbqeStgrO7wXSTLY0?=
 =?us-ascii?Q?2IT/bDPe8SR/HmQOfq7+BoEhf4r3Fof/n7zjTqQlW1CbRbvhRfdbDqhKDDfC?=
 =?us-ascii?Q?ng49TgyJjXksIvkFQsEfTGi1lHSRMIQi7fBCQ8KaPdjvXZ4ksdANYVUGAK4T?=
 =?us-ascii?Q?MBtj0cZFcwA84/k0ZCDykR3d1ZmMThExg1KLkQ3yKPmagIjZiUPB6JZs4+Zt?=
 =?us-ascii?Q?cDpbPOsEBmTu5HPCv7ek8Cci6ylWjwt6vlgYJAhK8S+FHrttboCJnoQXTMHd?=
 =?us-ascii?Q?5bjqD8SgKnTnyZACtZo83ihpDtc2Z7Kz/EbeXnf8p7ZLIyFAl9T/+KejX5Xp?=
 =?us-ascii?Q?G16LWjZSjM0yrRtddoHlF6pWUchwQSi48XrPFP2EShNHg1/ISeb9DdPCdFXj?=
 =?us-ascii?Q?n31ILoC9gPY9o2osspMczJuSl8S2vYmZObImRV5pRKRaXx7dMBddoJDvoN08?=
 =?us-ascii?Q?xKVd6se8jnhMxBfE/dkI+wG3LMgVs+o2hOG+PvI1tbZBCzvwmjMLwIYtBoxL?=
 =?us-ascii?Q?mZlVb9GtW6d1BZ9F72uIHFyr/TZGpbh6Zu/sHtcKJGFD/vDc59/XXbaZk7Fu?=
 =?us-ascii?Q?YUkVw6vxr7k7Q4zlyCBhVl7GU9E2kwFNWA8BGiuvHM6HBLfbvv88zGC9Pu1B?=
 =?us-ascii?Q?XmrMHbNA7ijs9R7zQyUV/c6MlYQyv2qdpCeNbbgxzSx6dC4h7RFPtGreHfEo?=
 =?us-ascii?Q?HQEHGi6/I6sBxtlSLUkdlE1TJ0t6pXLE13eEy1Pm98A9fKoHmbLGax1aEVMj?=
 =?us-ascii?Q?zsy108OlsII9r1+PTfwQpK+rV0iB/AUaksYqBXVVJs3EfyQJ1gwL1pOkxm9+?=
 =?us-ascii?Q?c0ijykOvga56kzX7fH5eJOQCrnvi7VQCbLIMthHqWXJErL8pemuVFzMIJ+Od?=
 =?us-ascii?Q?wjG6wYka9tcnU/pd1I2D+YQuLrHlxHRNhKRkeby94BHAHelNaVLOIU7ts+EY?=
 =?us-ascii?Q?c9fZOVdOShBfv8KE/hKD0MQ6Gc7i9OxBCrG6X9GPD+HPq7EioLOh6JGCc9IU?=
 =?us-ascii?Q?TYEJ4LTmzBcrIr3ikbSx4BnI5XNUT1GhJfHEzKPKwGr7Mw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9X532iD945jem7IMqGpZWEiBq5BWrL+sh+S+QjNtYfMPSTwpBB7e6IZUNdxa?=
 =?us-ascii?Q?G1FEsdUya2atpQrsAOZNpoaaGPyKuF/PrxUc2OycXIA7vaIRJ4xmzoCWdsoo?=
 =?us-ascii?Q?LeHVUh5xpNP+BfFO1wqKjc8N068eSQJmYUem2WseMwypQeUxTukJR413r9h0?=
 =?us-ascii?Q?rF0T6mYjgrMVf/fIoufa4wvK5mcCfJ11/bhFblHcxkbeYSy0MZD6rHR7SM9k?=
 =?us-ascii?Q?TvVLzMn0wSWCG4FGZmwqLDLv3gVlAkhhZ6fCfhZMTGVQCDVeQuZgXi19GNvQ?=
 =?us-ascii?Q?Q3LD+51h5/UeUGOWOgjDfABT2MP1O0cFgmMqmHun6Cm5Ztn9XiUqIAi7KPiK?=
 =?us-ascii?Q?OFMjSXDPeM8zgAbNyaCeXvA2EQSiRJzbe+CWPEKvSAl6Pb4iWH46MtPU7Es0?=
 =?us-ascii?Q?EV6L8Pj0cOZ4WRdU/BHa+Qzms1iKLEUgZX2NwlLwnvrW4wJ1AtZfW9xA/Xf3?=
 =?us-ascii?Q?zmDEBQkLuasAsBS7MCxYGciHOGrwiE2n+T2AL/yPIwN4jQZSlXk542QTwJbR?=
 =?us-ascii?Q?2bsEmv2uGZhDsnKGSZ5QzNAiZmyUJlGYALQdM/Oop6/G/q2M/EIvasNaljIM?=
 =?us-ascii?Q?gSCVLvN37GW66aqihsrkarqJgw3tQugT3bnRFTIRI5XNO4kRvU4qZYJYseVF?=
 =?us-ascii?Q?XMv4ShHUIQpyDG/pd+8N7kJBK4m4QlzKQ+bdj25sdVrYSIv06f5mFYtw75wI?=
 =?us-ascii?Q?YqIkm82jGYc3Z+/eCniF39AzWTVh/HoLOgGdIuxtMHRH1M+Caq8mpcvnuNiI?=
 =?us-ascii?Q?yyfCBZQXEGVbR21ESrE31pNgXhnafA1DrLGhcTrhu47unhMUvnvkRkCUPhZE?=
 =?us-ascii?Q?4X1OWYFcll5DBl/eI1Aa+Crq+3dZyz1HC2ahawIzmbpzZYX5xq1neTsJe/I/?=
 =?us-ascii?Q?vBZ61DD1IiQ9TVk8rk3+xrMcxmj1r+JCJGoB/S6+raQkYzA39cXMHd6m9lrL?=
 =?us-ascii?Q?gldflbTvw9knA0mwW4HzZkc5DG2N+uY8PWxvnfqYAG7KpRKzLn1VCl/BuQTW?=
 =?us-ascii?Q?DGvK64HQX/cpfFk6XEAS6lmHoSD2M5Tr3V2WYlHVP8cZa425u4CGqNL5h4lH?=
 =?us-ascii?Q?Us8kBRut5Rc4XijrJ4MD/YTBKsTXJr0p8sG6oEYstsv5nKC4qYJHUuM/exaD?=
 =?us-ascii?Q?c4DQANfPOgHp2R8MmQjAgJV5z0zlZImiGw1eupG54fnXq9kUNSwvnd2WAw+d?=
 =?us-ascii?Q?HZpDic8TymrfMl6Ezd3CIGVLMjArTYDkqkywnaRT4bW7JFV+a9HOAGiy/+jN?=
 =?us-ascii?Q?VmFsC9VSDm4fNshq/oybsHb4DbkJarE2nePxVlyySs/89x3jHM4gEV9B5pAo?=
 =?us-ascii?Q?W35LU6yGeD2CAaSW6CNsAt2COB/G6ss318AKza9oBcM5jc2bd6gZ4nPO3DOv?=
 =?us-ascii?Q?+MSUurruK5ioswXOr7Pv67T5mMhYTikaxYwDAl3GziHE9qxT4MFQZF8AOgZ5?=
 =?us-ascii?Q?Ar7mq1zfkjVN8TufeRN1q1lsVvjlWgjM/jnnhDvHmKURi7YpSmLBTmdZ1bOL?=
 =?us-ascii?Q?m+8tUa5n3srY+BocZly5TsInIEIYHnNILdcVkSruCiiqhs7fRBciUhxg659y?=
 =?us-ascii?Q?m0U1WlkgAZ9xU8CvlMmpc7a8Jw1EXPLxapnKv4M4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f2dd90-6e0f-4e26-5f5f-08dca254727a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:24:36.3106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izU/oiFcnlXpxpO53I1mMjd+r+Nx/dZafllrgAWJHzkvVjlGI9oWtISMEJZcU0X/Tch2Dg2/1H5IS4ZWjbA/HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10289
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

This patch series aims to add Freescale i.MX8qxp Display Controller support.

The controller is comprised of three main components that include a blit
engine for 2D graphics accelerations, display controller for display output
processing, as well as a command sequencer.

Previous patch series attempts to do that can be found at:
https://patchwork.freedesktop.org/series/84524/

This series addresses Maxime's comments on the previous one:
a. Split the display controller into multiple internal devices.
   1) List display engine, pixel engine, interrupt controller and more as the
      controller's child devices.
   2) List display engine and pixel engine's processing units as their child
      devices.

b. Add minimal feature support.
   Only support two display pipelines with primary planes with XR24 fb,
   backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
   when necessary).

c. Use drm_dev_{enter, exit}().

Since this series changes a lot comparing to the previous one, I choose to
send it with a new patch series, not a new version.

To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
diagram and represents the whole display subsystem which includes the display
controller and prefech engines, etc.

With an additional patch[1] for simple-pm-bus.c, this series facilitates
testing a LVDS panel on i.MX8qxp MEK.

Please do NOT merge patch 11-16.

[1] https://lkml.org/lkml/2023/1/25/120

v2:
* Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
* Move port property from fsl,imx8qxp-dc-display-engine.yaml to
  fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
* Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
* Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
* Fix register range size in fsl,imx8qxp-dc*.yaml.
* Use OF alias id to get instance id from display driver.
* Find next bridge from TCon's port from display driver.
* Drop drm/drm_module.h include from dc-drv.c.
* Improve file list in MAINTAINERS. (Frank)
* Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
* Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
  MEK to test a LVDS panel as an example. (Francesco)

Liu Ying (16):
  dt-bindings: display: imx: Add some i.MX8qxp Display Controller
    processing units
  dt-bindings: display: imx: Add i.MX8qxp Display Controller display
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
    engine
  dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
    interrupt controller
  dt-bindings: display: imx: Add i.MX8qxp Display Controller
  drm/imx: Add i.MX8qxp Display Controller display engine
  drm/imx: Add i.MX8qxp Display Controller pixel engine
  drm/imx: Add i.MX8qxp Display Controller interrupt controller
  drm/imx: Add i.MX8qxp Display Controller KMS
  MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
  dt-bindings: phy: mixel,mipi-dsi-phy: Allow assigned-clock* properties
  dt-bindings: firmware: imx: Add SCU controlled display pixel link
    nodes
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
  arm64: dts: imx8qxp-mek: Enable display controller
  arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support

 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
 .../imx/fsl,imx8qxp-dc-fetchlayer.yaml        |  30 +
 .../imx/fsl,imx8qxp-dc-fetchunit-common.yaml  | 125 ++++
 .../display/imx/fsl,imx8qxp-dc-fetchwarp.yaml |  30 +
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 +++++++
 .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |   8 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 157 +++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 578 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-crtc.h              |  67 ++
 drivers/gpu/drm/imx/dc/dc-de.c                | 151 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  65 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 275 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  54 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 266 ++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 366 +++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 136 +++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 149 +++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 249 ++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               |  15 +
 drivers/gpu/drm/imx/dc/dc-lb.c                | 300 +++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 140 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                |  91 +++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 227 +++++++
 drivers/gpu/drm/imx/dc/dc-plane.h             |  37 ++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 137 +++++
 48 files changed, 6756 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

-- 
2.34.1

