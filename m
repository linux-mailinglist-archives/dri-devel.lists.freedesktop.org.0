Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3F9E89B3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B27D10E2D1;
	Mon,  9 Dec 2024 03:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HEEobiSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFD210E2D1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CygbHpDFMrxtnyz2noOucNVRBPh4/mcu4ZglZ33nBZtPKwq89OxHiSHpGiQmveCz5t5TbVfCD3duDG4pPd4iEeEYZknr+O9zC+loeITRhqaWmH4rYGrG86QV0QV87LrkFMu5mDJX8v4jN1IevmKgL9Nt657uapeeHjWGnJVC58dxVzA8Hx1npFOsz2DWM6btMQki5eS/uLS9FQ1Ep08KQn2rPO2c2bEqzCBk3yVwnBwfPdRL6XCFVqZg6d2xQf8USxBbDqTRk9IuKh55/SYb1yJ8iPpNzVdLdGCZlmEjyGxf4K7vIbxm4M5zXVisyeSuj8umzWI2yvrEdmRELnk3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GzqwuJXGR/ypmav/rY/KpMKlcx7MfyfwpaVD/1dTcA=;
 b=HYhNT6h2u2rAsCv4y9DtpBHk0tgkLnIuyV8htlvFuh8EWi9uzqXrcZIGTtN/HgVlrfmqJj10OJ549ggkzSTgBTKYDLFDQp5o8KhMWKX3dyE/kPXtOLHd4zXZuyjRGKMW1o6XmyDW8OnVuM8P4b0EbXLwyvJOq3YHwPzjydOU1AhKRAvOBrzg/3rHfO1IHvpowtpv+KmXLeyoJhhyAgpAd8te4rgBLrg7ae5Qi8/ePaB7M8vZJxvcpvU+ebt9zpNkDZ/grxMrMVDUFNBq/q66hJDLjWbVfC4AUTKMh8ydjqXmn9OP1eo+bgUjk7j1XvVSdY018tvBOLUf0AzQduHarw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GzqwuJXGR/ypmav/rY/KpMKlcx7MfyfwpaVD/1dTcA=;
 b=HEEobiSfJQ4oRjMItS67KL8dVM48Sf8kDAzjUx5aIfAKoMFIsWSVw5YzHs1S1Izj/RJ8McTA7BEMUeZKV0gQ18N01URU4XohCclAIG1ney6bPYJpmmTizWCXo1Xw25HO+FMwG6sXB/PTZ5skhpR45len4db554/rhqto4OgoDk5dcFBva3jiogYlVnIXnWs1pEL0XCa7S7frTtdzJ3iiQCpl3xUNZeWCjHR5GYmH2mxC87+C4qaP3cQTAzervK426ycUruUMBQbmRG7MF0oPzz1blwe6UsJQdCAGOIECSXJ3142vcNX/tTDnWLWYkrkxU4gGIYIDz1kpqjILZ/+Puw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 03:39:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:39:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [PATCH v6 00/19] Add Freescale i.MX8qxp Display Controller support
Date: Mon,  9 Dec 2024 11:39:04 +0800
Message-Id: <20241209033923.3009629-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f00d046-49f9-4f0b-c7d1-08dd18031a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8nWWFLpW3LrnYdFn98Zyu21aM57gacdmFm5ZCpGu/Xou/5+pAhXaYFhmaBrQ?=
 =?us-ascii?Q?aenu+JZ4Buu9RPZMPPkyz7m/JI4FT8y76dwOa3c+THJuqF//CH5bYDwEUiFX?=
 =?us-ascii?Q?Tp20vjG5zqPaWHtCTyf61b9vg2MDluBV4qRXdFvCIxNxxNWxXUW3I5BSKAYx?=
 =?us-ascii?Q?zMuHSIvO3cTMRMwkhrtJ0iERK3MjGFsyizIJfARGBliPTpLZQdzxsowPg/++?=
 =?us-ascii?Q?jl1w+T5p1clYyq1PWc0f3tkpRHb16mM7UBDHtvlpLVRdUrwwn1He0Gh0T6nh?=
 =?us-ascii?Q?IVTt09XUjL6j/hvkoHYLghVdROAQRI2hOmiuwZsB6sOqKbrMtmBs9LPWiHip?=
 =?us-ascii?Q?hIr33PQSc62KfxXm3uJB+7pW1JGY/ypiNjqWATAhCgbqYem0ss8EM4TlDk5S?=
 =?us-ascii?Q?OGl97qqcrmOemNUGpmn3oX2WkNRdvSnVW5fn8UVwRUQN+c2Kvcp7/tBXZ8Q2?=
 =?us-ascii?Q?I8BGDUgrDAqhRKZAbhq3K0M+m9Lg164bfHh02bswNBcCXprnA9o1zZWuQxqC?=
 =?us-ascii?Q?g3duhBkjUMyhzVCWArYpJ9NaOn/M8/kw7zDTc33jnA2E29t8lehXB6z7R3m1?=
 =?us-ascii?Q?IXCHUhF0mODSqhSBWlOmKlsKvdFbfwCapaWKQRzXy3uHiWmUGAl9yT2qjJYN?=
 =?us-ascii?Q?1LXi6LTkpNIf1FsTvdeo5gPRtCupvnv2W69w5K89ezBwhSbtXwX9ZueYipZU?=
 =?us-ascii?Q?5C9/8OarlpSZyreLIAD4h1RmKgK6Io53jPWqF5I8eib4xU4apt85PK62+b8j?=
 =?us-ascii?Q?E4zOnmwEqkWPShlDJi2/mstHAv/DbDE4mSFoR0lj1gA+eOm2h7g8utY+dbl1?=
 =?us-ascii?Q?Ge0zj+AvzlufGMQ8L6NLYyLxHp9FKsHTjNIEVs5ajEPYtdEtXOXRxNE28h40?=
 =?us-ascii?Q?HQqDmLqDmgAi3neq0VJbD9OYlI0Gz7OgQYTajyR5vRP2p7Pt5099jdMqKW5s?=
 =?us-ascii?Q?f/Mw2CxrVcpOg2AFVHgHHXsKl5Uk326pAetccP7ttTGDrQXRJOpY4v6fFzKt?=
 =?us-ascii?Q?ELy1zrg5/Uqm17xd3v9i2OGys93zPoZka6KLpITclrQqFOlGc5j+FnjFxk5K?=
 =?us-ascii?Q?0Not59WdLarK/o2s0XGbl5GEincfmrV5CJHvVMmXFbqRFF28hNGwmS1JtnNw?=
 =?us-ascii?Q?x6SvTcEnT5Lv22CM1vl/UVsmqE+1Gcyali7Uj5I+FrXnVO6ySEXyz1IX5ooA?=
 =?us-ascii?Q?arXodFxD116i6qfywE93hkADQ5CXQqN/XkjB1+ShZeVeyTCn6ZQVPyj/dofH?=
 =?us-ascii?Q?VQwJlGwPcRVwR1v6BQ7cGDdArYMjqZmK0rAdCbm2r7iSwa7kgZsHEocW/PWs?=
 =?us-ascii?Q?wxzDIr0eokPJPSTozWCUhqkfmRLke+XKACoChLhtYI9qXCW3P+aCLDSopoXg?=
 =?us-ascii?Q?ngHRADc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3Ob342FOq4QtBwekTSbv7pzra8PuOhDMbkcLUk8798r4X5b4KUVIEc6vTY+?=
 =?us-ascii?Q?tO1aK5nyNFazusKdn5r+4MjXNyFuF3iB1rBebFuaglZvso9Kux8jF9esgag1?=
 =?us-ascii?Q?4o2R8XA6JL6adN1cqndCelpyTjbWKuoTNZV7V7nM2MexPnKIptX8KJ4NOEo8?=
 =?us-ascii?Q?hTTcd+T8Tf2z+ZxXpqRfq5HdfwcZX4tkNiGqbtR9cVBGlFCFX+Joy1frGuhp?=
 =?us-ascii?Q?/VWCrFYhYGACvwGMRiFeIz54jyP1N3nRmkoMnHfX8CkOEaLmf/uhJropZpHD?=
 =?us-ascii?Q?ajvnmAjTadGnPiMntQ//7qHEMs6+R36h2g9SiUP6COoaRDt0akE6rMwmKH7v?=
 =?us-ascii?Q?f9DE5DKlUr9ze6fX4afnwhZvhCShDFM2YcFojv9BSLl+YfQHbq/6RZb4fwNa?=
 =?us-ascii?Q?IvHEF5ZSCrYpEL4DXiQR5r3K72b9oLqy+z1ovMBSfpSoPKRBbRDwcqIIzXNJ?=
 =?us-ascii?Q?EQ1t/MgiuC9W2UZb6pFZdHNr3Zoa6YM9IMg6WXyaZbT4zmQs82a9nvFjYXF5?=
 =?us-ascii?Q?rPRiF+4gwiq+DOcjUra0Q9f84kufO/bWfwoGs4nodfH61NLyNyeD5M3NV6KI?=
 =?us-ascii?Q?qNm8cOuDiLp1pcEgRTj7GsAk3zEdMJNVX3OUsVzVBXSwHQVviVV7TwgezpAX?=
 =?us-ascii?Q?Ww1GOrbc1mMfjzmCWMkW5HYgm1g8oHwT4vitHkdp/zzfmXcM/ju5P7vls7qB?=
 =?us-ascii?Q?jTqODN9m8CvGJKbDvwYmUB9WKMDlVvTMOJ34eX9I1m65j7/1jNv0Y1azXwKd?=
 =?us-ascii?Q?mMtB/avT0g5rFK6yLVd7t9Y4aeRPEj4n6/IwrPo3SYW2Z/Z2snVlsztQ8VDH?=
 =?us-ascii?Q?GsrYfVOyvEIwGhTS9FnLWm8zHboUde9c8awh/z/BxBfFlvM1DM7oskJKdWzh?=
 =?us-ascii?Q?7SALMiytuaX+z05Tkzsji153gRRSYB3mNGoTd40ixhr2K47vsQDtMw7cRQXK?=
 =?us-ascii?Q?4VFW6gSKsbxhIeN9PjCBvvMw1cC5Fly15pDjdywCNg/I2e1iE7ayVQPnAV1d?=
 =?us-ascii?Q?8zB03rH6YWv3NchaymdHIXtQnjtNewB+qrrbyOK4ceMYN3os3HaMrde2RcG/?=
 =?us-ascii?Q?sEFz+O8zF4k7YzPWtCQxu/N55XsfSuKTRDR3GU5dSxIHdlC/KcADlBHVmX8D?=
 =?us-ascii?Q?IP9mXkI1WyVdAalH59y4jnmqzIb6q+tbq4bS4X3f1mr9yVU5wlKtlkEuQCCz?=
 =?us-ascii?Q?lb8osaRMEL+ELys7ohTeVFSwsb2CNrnsKlXtoYocHP0PGn4GD/pZjjSGnDGc?=
 =?us-ascii?Q?Mwk7vT8V4MC10gKbfCLtRlb5YZFZbOGDTKwlDazB7B0hQY3W41euEA2EW/Tl?=
 =?us-ascii?Q?cCRQtbly8FbEHewFI8BM8Z8WkWjOnUeNSQuY7b5iMjC2AX1N0++fi1V1VTCL?=
 =?us-ascii?Q?UT/4s3XyGM5olpvRbxrwgQdyEJcQWuYU4GxPJyhm0HeGmTq6q862fg6HB2qr?=
 =?us-ascii?Q?11kUV7p+F3gXUQXq1sfhyzAt2PEjktPu+CrdwqXiBEA+Lh5UvKv+pOM1OloF?=
 =?us-ascii?Q?wmpgoPgvcNnyAjZPiPqQBPUF8zO+/NiPyI0XhKQU+uUfe+T5UBk9z8u9yPR2?=
 =?us-ascii?Q?8vPU92QkDdbt/iVClA+kJJNnUC5rGuQWddNQy4+5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f00d046-49f9-4f0b-c7d1-08dd18031a4a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:39:36.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d1DracKFLL30e77xHcXC6bDz74+tzD5cifq0IhDQaX7j5sln2q51o/FzS1v7H7gRLoyLbWPNKtIX3wzhGrw8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212
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

Please do NOT merge patch 14-19.  They are only used to facilitate testing
the LVDS panel.

[1] https://lkml.org/lkml/2023/1/25/120

v6:
* Fix build warning by expanding sizeof(fu->name) from 13 to 21 in patch 10.
  (kernel test robot)

v5:
* Document display controller device's and some display controller internal
  devices' aliases in DT bindings. Hence, drop collected R-b tags from some
  patches for DT bindings. (Maxime)
* Replace .remove_new with .remove in all drivers. (Uwe)
* Select REGMAP and REGMAP_MMIO options in patch 9.
* Fix patch 9 & 10's commit message to state that display engine driver and
  pixel engine driver are component drivers instead of master/aggregate drivers.

v4:
* Collect Rob's R-b tags on DT binding patches(patch 1-5).
* Replace "fsl,iram" property with standard "sram" property in
  fsl,imx8qxp-dc-command-sequencer.yaml in patch 6. (Rob)
* Use regmap to define register map for all registers. (Dmitry)
* Use regmap APIs to access registers. (Dmitry)
* Inline some small functions. (Dmitry)
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
* Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
* Drop unnecessary private struct dc_*_priv from DC internal device drivers.
* Set suppress_bind_attrs driver flag to true in DC internal device drivers
  to avoid unnecessary sys interfaces to bind/unbind the drivers.
* Make some fetch unit operations be aware of fractional fetch unit index(0-7).
* Take DC interrupt controller driver as a standalone driver instead of a
  component driver.
* Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
  struct dc_ic_entry.
* Call platform_get_irq() from DC interrupt controller driver to make sure
  parent interrupt controller driver is probed first.
* Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
* Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
  rebase.
* Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
  register dc_drm_component_unbind_all() action.
* Request interrupts in dc_crtc_post_init() after encoder initialization to
  make sure next bridge is found first.
* Trivial tweaks.

v3:
* Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
* Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
  fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
  into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
* Document all processing units, command sequencer, axi performance counter
  and blit engine. (Rob)

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

Liu Ying (19):
  dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
    units
  dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller display
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
    engine
  dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
    performance counter
  dt-bindings: display: imx: Add i.MX8qxp Display Controller command
    sequencer
  dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
    interrupt controller
  dt-bindings: display: imx: Add i.MX8qxp Display Controller
  drm/imx: Add i.MX8qxp Display Controller display engine
  drm/imx: Add i.MX8qxp Display Controller pixel engine
  drm/imx: Add i.MX8qxp Display Controller interrupt controller
  drm/imx: Add i.MX8qxp Display Controller KMS
  MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
  dt-bindings: phy: mixel, mipi-dsi-phy: Allow assigned-clock*
    properties
  dt-bindings: firmware: imx: Add SCU controlled display pixel link
    nodes
  arm64: dts: imx8qxp: Add display controller subsystem
  arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
  arm64: dts: imx8qxp-mek: Enable display controller
  arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support

 ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++
 .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 157 +++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 +++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 +++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 ++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
 .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
 .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 ++
 .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 240 ++++++++
 .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
 .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                |  13 +
 drivers/gpu/drm/imx/dc/Makefile               |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                | 162 +++++
 drivers/gpu/drm/imx/dc/dc-crtc.c              | 558 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c                | 153 +++++
 drivers/gpu/drm/imx/dc/dc-de.h                |  60 ++
 drivers/gpu/drm/imx/dc/dc-drv.c               | 283 +++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h               |  52 ++
 drivers/gpu/drm/imx/dc/dc-ed.c                | 270 +++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                | 374 ++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                | 180 ++++++
 drivers/gpu/drm/imx/dc/dc-fu.c                | 268 +++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                | 219 +++++++
 drivers/gpu/drm/imx/dc/dc-ic.c                | 279 +++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h               |  58 ++
 drivers/gpu/drm/imx/dc/dc-lb.c                | 319 ++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                | 133 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                | 100 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c             | 241 ++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c                | 138 +++++
 58 files changed, 7837 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
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
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

-- 
2.34.1

