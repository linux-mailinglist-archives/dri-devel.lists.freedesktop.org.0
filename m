Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14A59DF931
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC910E415;
	Mon,  2 Dec 2024 02:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KQhxJ3Wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1625010E417
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIqym5byNHN6CJ4q8cFQdnYRCgLPByo8ZbSI0apgAElWUny45do5vzSuNQX8RvwyjYwHo1LM7wQm3IGjThVSYXaGtLELq82ecAtlWhYcBs+qwoBq1HjC7ZH2jL+ZOuAkZ1n7t0f3wgmEaM4N3t2mNuw9ssVWpXg3VDcLFlgaiEkZGZp0gqoCExVxp+JlfZM9wP0pZkmIifyd42kQ63f5cWy7QZdgZbzWA4iU28mnbqg+p/0TTnqHuI1qVdUB7LGWp4IE34LV86/PJNoVCD6cyh2FRlDd0dpiEyJCoDcUZiEatKVG1c6JZZidoEH8LoyZn3wtr4bsqgqAkpexkTqlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT9jWUHMyqYCkceLmdw6GiE/P7me1nOJ5tcMxjZ8KI0=;
 b=reICcdqt4FtEwjskE0CTxg6PiIR7e9TluEvvrpwfOO2BGwBe0E+bL0DF+C2iI+hH0s7aq1Dq8LWwUItcHHtsI+Z7fvrI9/+UcG2iQzH2fM2VERj1ijSimgVQCaY/T3f23n6fy7pkRURvzDbw1y7N2FbLxlbiqXvmMc3ToOMc2Ax+hCYGezbocJaQtqFRd/1ZT1EvFi7kFJnLgKj3a5sTQl8YpZDIf3tU+sfqeXsI0fSAZfZki/0l3aeaDEBr8NnrNVeHRj4NUu/rO615uvWkMaAmN6F4axG2v1cOJb8IuLuMCEDD6MraMmUkSOfKFicPaU7jOxfVJkL8NzRPOYBisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT9jWUHMyqYCkceLmdw6GiE/P7me1nOJ5tcMxjZ8KI0=;
 b=KQhxJ3Wr1X4Q9r9nXjFzQYlychdGNSOkQAsB+6Wz7Uz5dvJTMY7Bx+QimA0ln0i1WCSH/OYAsYM8hT2Ov9YpuFBc+8f5a26WbJNdXTm+h0R2gPZUD7i4Z6k1+qic4x2MWjjeE8MVX2Dyitwm4QHSNGosBzGU4u/d6Dc3YFWCTmFSRFkVS8zkrZS+iamni5+qq88vVuecH5wHabcWhvACK/gXcKKUDM3gFwIptyfPJIrs5TwT18T2DxVAl2zmTmFDH8inILmEtm2qV3CpBM3jwrDYLv+K2oxiuXiixaiRi+4sc0jQ/ZNalGqUXzHIYmpNZ3kiNvEIfcNUPK9YSxBPUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:57:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:57:51 +0000
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
Subject: [PATCH v5 11/19] drm/imx: Add i.MX8qxp Display Controller interrupt
 controller
Date: Mon,  2 Dec 2024 10:56:27 +0800
Message-Id: <20241202025635.1274467-12-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9a4a035d-a023-43a6-15a0-08dd127d1c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?88OIB0RXdkAOQBAwycxXpcGRlfIoe2ae1J/Iq4Ty+vdtcTHqwwmUcO+EFg0u?=
 =?us-ascii?Q?Fn8Og7B+NHdm/UVxs9frpSt7cAJoBADwzTOSNPcHBWfGSzGf3MKgnpo8SVyy?=
 =?us-ascii?Q?c+AZ5/bOiADWJMYJeXu3DUe2ksvhlAk9IfIsf7+JjBKKJR9wf/3pmAj9dPhT?=
 =?us-ascii?Q?savfOZbDnTgcpc/odCqk0KIksqvIWisSw9sYxtDjjJ337DxelgMG1Lx6tJ5V?=
 =?us-ascii?Q?YhDiMPxYX2W8FRdrf8Mt/boD5w6pkk+Dvw9qt0IFfLAlicexHibZXbuIDtM9?=
 =?us-ascii?Q?Vumz2VtoXng+KmQNUWpVWyw+JgXKW/kAnxf29gkTD11WVcnlEa3ELmflJYWF?=
 =?us-ascii?Q?48M3EFUMA8RUHMClpI4LaQkREt6SxLnfpegkb20bRioIePcMvNQPuwbkibKh?=
 =?us-ascii?Q?kQNewIk45loACnJelcnSoVaSuZmwNu7JP3jgIxmKv8vUGdd3wOrUL/sO6q+B?=
 =?us-ascii?Q?NOi/M+UwLPXj0em/g56oLC8qmHUioAJ/vrUzlfEAA+xkp2IJux5XK13znGrF?=
 =?us-ascii?Q?gkK1EMtUOWu5NNr91Bu7Yzm7AclnFcTy0GyWevrXMBAkK9MkDHdt0Slx2PgZ?=
 =?us-ascii?Q?ohgVomO0zaiYNRtLALdLHrmNWIvGWrqJ3QCaamy2CAs2PPBHCn2iBggtvgNE?=
 =?us-ascii?Q?bDI34Bi1uFAU6QvAwRHJXTb/CNvnNo5JmqQ7CJsO0b/YL/3/nITYo/gsefFg?=
 =?us-ascii?Q?eupfMlmoeSOFCPUYyE2aJv7WbJxn+ZDwfwrbZpCQLXs7UnQw6m4Vh4ajlUoX?=
 =?us-ascii?Q?4+xi69NwrM8H5s8v1O4+t7JKN4I6yl/NqAbSpzkxXfNCu7rArxU3a7UHS3qn?=
 =?us-ascii?Q?rlG5BXiBu2p/CwDgjP4RyBejuK3hlkH3+ffHJ0nSKCg41HkaGTW1mZMt/27s?=
 =?us-ascii?Q?VOiknZfZtvIXjYfZr8kDk9w79bS/uVVX4RklR21kwcCyOSrGDgZtvmitdDgU?=
 =?us-ascii?Q?sUyrxKCU80QE817nDnm7qsHMVRf/mUq5lDEeZCFBSltys3orK/5cLrkLmRHk?=
 =?us-ascii?Q?z2vrJUsao//erccgsv7txxJBq31edz+sU9xO53Sqn3qN2cDRg+bkfYE65JXj?=
 =?us-ascii?Q?RisAFvaDz1vdasfyjbeBPw1ObwbH0uNk6UOdzkc0b8GHAyRxn2toC57xuy4z?=
 =?us-ascii?Q?LMM4LCTB3sa/l5PsAx0wmCTgdrJsYKOKXbkZbSO0sILfW/PJOmZWwjOWpown?=
 =?us-ascii?Q?yxW2wWdXffAdH5+5hdajeez0p2qT6fFLE8iM9DrU6QipUgXa6Sh2uSiAsynN?=
 =?us-ascii?Q?LYPWj5yofkF0P+BRzJv0tQqfOdQfTyn4NhL6KWqgk4RAYAk4/7C9S3JkQgdZ?=
 =?us-ascii?Q?Y2cf0ODcaZplFpSxA52I+43pt4tqCnafFUvez+jJKmFfQl7QFomQ8e9Svei5?=
 =?us-ascii?Q?weTgXpgHnKtg9twOAn3HzMhRR2qh1O/KPMIM43kF1I8IPZmRKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4oBNPFy13iKhJL4UeDXN4ldJoXz6oBcINoPkP2alm+/Tso2KUMtMGXY2RB5a?=
 =?us-ascii?Q?QZHIvqi58StmZ0m7Uh1UfT41xw2brnCoLALQzpynhM3WkTE6cN937VFyCvGG?=
 =?us-ascii?Q?UrC+RlqCDswm6ar2cchFBwIf3dJTMmd77n7iZTP/EDNHQaOG2gZNkRkbdGoJ?=
 =?us-ascii?Q?YMmbCBUFjLvYBHBozY6WIvVLoH1uF873O+FNRCkUQTas1IkvOKNYePSeC9bf?=
 =?us-ascii?Q?xg9+HaKri14DUeXpYjeAxH1W62Hs0Nu7z2gFSAVtd0+9JppwXT66pjuD3g3e?=
 =?us-ascii?Q?O5D/CYfxiEdXcTs2WavU7pdfdBmQOstHBF/gJYT1nt8iE7hvUfTGJTh5/456?=
 =?us-ascii?Q?I6CwyqC7nJAvMxrFkGyXDTl0f/Ls5sWyda9Hhtwejy7AqfJ9Cnai/t3p1Tfx?=
 =?us-ascii?Q?lo0QVakaDzpuhfsEB4MxPbotPoE7W7myKy1/ALK/4nAyGysT2OihoNDtSoHb?=
 =?us-ascii?Q?9A1f7vPoimHSahq2R+bzjpwgZD3SQNPz6d2op9+FwY4wcNKzv5VaYNNB6CTF?=
 =?us-ascii?Q?R1RinB4o/VKu8vC9m9YRh5AnalWziIrU2VdDML9UuOReatrm7T6a5QsNRdW4?=
 =?us-ascii?Q?niN8QExDlp60/MBCOTNgshKA+0wYbYKBcn2O1QAZu5F056MDZU4p2C8EvE9m?=
 =?us-ascii?Q?bnxOtfm4DfkhKKH/SCMUbdXjDwlykT1c4TYmDwpVaBiw26unfzupGIctpEP9?=
 =?us-ascii?Q?sJbZXJRKNezJ3s0C55TXO41FoNNdu3EDClVsUcgoKSK2cuf1e59dz14RdsID?=
 =?us-ascii?Q?rWvOVYslkMA4wCtjT/8YAbSzonqxsjSHfFE5Po2lwCH0/pXhdqKedqrrV7NT?=
 =?us-ascii?Q?SKLyqtNr37gGva0weJRDExAoqziNxBFtaWuVdw0MoidwcrOQs/tb0EU8pW2e?=
 =?us-ascii?Q?KrH00GSJqqsQZtz919KrTaBBqAcJ+Ixva6lFLJkXmeF2bbtH7oOQP3sRNvhK?=
 =?us-ascii?Q?+9YVSh5E33Wr5CVwx3F3fbQNa92EDBbt64n6tS+7z3WeWq+n8jT4kM3sAUT+?=
 =?us-ascii?Q?rUxHikQ+az1/HW9q6d0Vkt1E54E9avhl+EZ9+ygCxVb4NmpiP5ywfqt4L3SD?=
 =?us-ascii?Q?uD1KZ84oYbsWnBETToaCrbP29178gUTbtB19it972oDCE25xPD2ZqVaqLxdQ?=
 =?us-ascii?Q?t7XQmk38CKciWQS4CBvpKYqMh7IU2Q/5qlROIKQMkQNioRNkaKpMUmvX5Qqu?=
 =?us-ascii?Q?W5HmRMIQUgv5k338kBZyq0nZ8zxeS1Oe8UCainPyrBGWthQr8s3gHpTCIb5N?=
 =?us-ascii?Q?+ayF9ERM6/7PMuYFEYX5gYiaegh7juwaB+fK7aHG2djUtegdeyTgmHtgQf1N?=
 =?us-ascii?Q?yTRbTTM5IRsynyAdpk1IYa3CV8/HEr4aqg6wrJZ+lKv7eDj9d8ENfO9dEikO?=
 =?us-ascii?Q?c3o8t0HpMs0T2qheqN9ueGtR07S5NZrXBgjfbabcpCmkm6wfLJZHIaVlo3Cw?=
 =?us-ascii?Q?HCzA46V4TfHbSG4Hm9cm7Q5tnlkgWQjLPo7f+MXw9j4X8bO290A1GfhSurRk?=
 =?us-ascii?Q?7J7EbPC6DMOoV7E0Q7hHk6BdUV1UFm1eF16AmOCv5TIla6YTUmAh4rr4CrR7?=
 =?us-ascii?Q?ngrmAAy8HGegvKoAK2OJ1iLXud8pEmFwcPxtVVP5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4a035d-a023-43a6-15a0-08dd127d1c5e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:57:51.4811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wH4z/5KYijs6BA5/fEX8RwUgdq+WApxgbLD7LGxqHbiHu3b8lFhq26T5tsY/gJAqo7w7o+4dmZwV3bazmgQfQ==
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

i.MX8qxp Display Controller has a built-in interrupt controller to support
Enable/Status/Preset/Clear interrupt bit.  Add driver for it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
 drivers/gpu/drm/imx/dc/dc-ic.c  | 279 ++++++++++++++++++++++++++++++++
 5 files changed, 283 insertions(+), 1 deletion(-)
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
index c687a36b8153..3b11f4862c6c 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -25,6 +25,7 @@ extern struct platform_driver dc_de_driver;
 extern struct platform_driver dc_fg_driver;
 extern struct platform_driver dc_fl_driver;
 extern struct platform_driver dc_fw_driver;
+extern struct platform_driver dc_ic_driver;
 extern struct platform_driver dc_lb_driver;
 extern struct platform_driver dc_pe_driver;
 extern struct platform_driver dc_tc_driver;
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
new file mode 100644
index 000000000000..f022f0374772
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -0,0 +1,279 @@
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
+	regmap_reg_range(USERINTERRUPTMASK(0), USERINTERRUPTSTATUS(1)),
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
+	.name = "interrupt-controller",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.wr_table = &dc_ic_regmap_write_table,
+	.rd_table = &dc_ic_regmap_read_table,
+	.volatile_table = &dc_ic_regmap_volatile_table,
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

