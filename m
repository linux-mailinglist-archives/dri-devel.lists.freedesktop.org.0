Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECDB19FF7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B2210E164;
	Mon,  4 Aug 2025 10:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OsCVs0XE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6F10E430
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiS0yeY4Z1uq6Inw4MpWELAe1spDTj2FwqWgmBy9LqgtwsK3E1DF9LzBv4WgidneHtJDnH0ZWuYZEwoY1FzKhPSHm6wK+Xes6t+anXWG1KUZP/J1c8PTjVigO67NHwKrC/H3sFtEeBmOJZgFHA2f2gNBc0Pv5/Q9/cfJzEqYosg4aHs5ZAAV0b2NScB9NkpY0VqBpEZInGIILfQXiJfu2Q2FgkIYUoQ/k9BLxRZ9QVrg57bn2qyokG5rkUBbFli6btCWZD9DL8V43yznimTGOL70g9eBH+zaNLDq1TVbIkBfFUhOn+APtHqHFWmeY1iGOI/JqTU6z3YIp3bSk+xUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW5ZBdaGuQfqNvVE5K1Stwyc3QEVSa7G6E/XxZqUQJc=;
 b=QcBsgRP/m3/sPUzPvZ94a2fIf0C1VNL3afNsIVcXfwMoDwyxAqmYos8nlX3ps4sqQqNpjeqqPIisZCAfndw3LQdx6ZaE4k2D6hIh4TVmfnrU/CZO2Ow3bpuzQE+/nQ9t6FlVECQu+pJPMsYJRJX5sNZZLKTrdiStZmJykjmEuAWmHBDMpfzlvFWsk4NCvlRP0K0E8/gWlvWdss+UeHRi3z1OufQqlCAH7STItzUgMakKV0MNKO3dJIdGHkITNyMW3xM6CXL+av36tRMgBRixE7El19Igmh1o5XmgwlDrlbMfF73rQICogrsWxtkkCrvVRXT2PK9WNZugQhbFWn250A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW5ZBdaGuQfqNvVE5K1Stwyc3QEVSa7G6E/XxZqUQJc=;
 b=OsCVs0XEOWMPAwU9T7Xye/bFru1fjINx6TT4Lpn8lEuGVn07fo+kgcjtefgi87vHUgvq6yO7QEiIG/TjPyCvK4wBpMJZjreLK/OJTzq9uMmCZIoMvHAnY/U9hroscRbteYSCM0y4RJhTHxFibF0tjB89yT7LCgc4dtl7Mub4/TmCh4vAT0AAjgqmaFzWeF7PwLUwcv9/U9J1GWu9WzU/qqhS+1GyTE6Ltgj9et+ueTPP8ZLVGLMxvdF9TO/LuExg/Pg+gIcKrTmerFrOU4w6L9MHSa4URmrHjUSpF+zs1bhfJDnKtma22JfwFf3JW+qL8PzWmQawGmIupfuFlLfW/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:48:30 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:48:30 +0000
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
Subject: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel Audio
 Interface
Date: Mon,  4 Aug 2025 18:47:21 +0800
Message-Id: <20250804104722.601440-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250804104722.601440-1-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: bb81b7e2-8d88-49a4-780c-08ddd3447349
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7tSPC1OaL92xPrjqP7YiloM0PDRvWIiAN2PUE8FjG6yyzBvXFlWplFDntCI?=
 =?us-ascii?Q?hjA4Oc03kCipJE3+bvRTv44DwSism7tAISjrOC6fCUb1hKvuVTO46W3hG+o9?=
 =?us-ascii?Q?EbDmN6QfQxvWi2AJFfNbMvnpr2yiSZMXYMX8X3Tv75O66qiMM/MRfccajqxD?=
 =?us-ascii?Q?MjSJRBfqZ/byXg18wpjDDD2g9g8iv8jEt8sWzNTpxQFUdEgsB0ciPgIZsac3?=
 =?us-ascii?Q?ijrWnC0dc5Tkcg+XqZ44dxIZptnuE5pYu9F3OWCtLwd2dqCbUT9YFZlcq+JI?=
 =?us-ascii?Q?e1SQBoVTs0OxrnUQMuFLVoDnZbXDnnkkTHIimvX3fGvugCRVjKlN0/zg2ZlV?=
 =?us-ascii?Q?tSvQaFOQZqJ6D9siCysWaFN9iFdNg9dI19D+3VEzqv16V0bAlYVILk7ItZb0?=
 =?us-ascii?Q?FS4KegDFVh3Dh3ITrL+PdqADtcq6DsbzjeuzM0qAo1r0Q5rwpNv72b343k2R?=
 =?us-ascii?Q?PuXudO0Dn4bF5Q8J4z4c+eF07FpqrGBhzTYPc+Tp16HtLOkBv+6tymm1KTCd?=
 =?us-ascii?Q?45uTFJv6QH2I2ebYq9IKyK/aM051QgOmFITfpqJBx7JN2bhEbhxHyVtHaG4L?=
 =?us-ascii?Q?ZEZBmu9rFWl6O45Peb3mLBQK9yNjDq+EBf5s5ClDf9X2QfI89bF8uPU563el?=
 =?us-ascii?Q?m3tUKBBHwUBbv/lNLsa3B/FUGgw54Mgnrr1o2KLAT6ppo4bUdy7H1SdwfaAJ?=
 =?us-ascii?Q?HwxqkVYJCLDHbXZpu1EkJ2gz9iBaQDNSrGtp+NbPSswfxxaUWC1IAzEFf76T?=
 =?us-ascii?Q?ZjbwIEgGBXdcL6/WIalLc5WX4YF7KAPb6op9UXBwT6Bxia2yxYzQTOvfeMDx?=
 =?us-ascii?Q?VMwMVCTvqZRX6Bgpo2T9Smc2OlrNF+v6K3jBAsLpmSMYoUqzQ+HZW2Gm0J4k?=
 =?us-ascii?Q?6d9P/RIw9+CK9ToZtGYF4Kf8zAcmAwz01xXdiH3ZIqLJi4O8ANNR0jKwqb8R?=
 =?us-ascii?Q?s9ZjSg250ecpgSuktRIZV8JXyYZ+ryu95nNSBtL0VqejRBpVndj+B0zsg1Fw?=
 =?us-ascii?Q?6H95ZAVEnpzBCTni0TJe7vqX91cjkuo3LwdT3c60wsXjCTjZnrWYfs4cZZ22?=
 =?us-ascii?Q?llmjpe5cpDawaKG5pPBOfoF1Gd12OnHxWiPn8s7CoOFe9oLEy790QTEQFZ0e?=
 =?us-ascii?Q?oqFJbD8HSsSlDDY5GxRvdxmISGmADTcrgTXuWVezSmpWppPcUZkR58zHwHKS?=
 =?us-ascii?Q?P5UtSDZurzkg2vBb9XjOm4eSHEZ8XMw3KJ64Lzcv5d6NdNmfPrJrtIL4VBFl?=
 =?us-ascii?Q?ev95thD1Ze14hk60LWwAb/vWYImO4pS4tk2CfCQVaLdw9ijMzWv/YZaxzXmA?=
 =?us-ascii?Q?tmcSZiGCt2Ob1H+7m3jWl8V52i55Mu3R1x/PN3H9D0cRC7Unzml3Thk/aZJN?=
 =?us-ascii?Q?jxS8W6PyVaNyrSiP8Hzr//leYDBm2dMeSPcNWivuHqVuliBLOvfxXdp0SbFs?=
 =?us-ascii?Q?RjO1IwUEq2KrYUZy9o4r0xWeg+Avkc3pyOHETByegjeprg9XHBaa8KVaHrJJ?=
 =?us-ascii?Q?g5mB+QLUvVN0ag0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjQmia+w+ACpxWnJcnqJvS32cuvUNwHqZqyaeQ/J/9KzKhK6DgO6r5pYnTm7?=
 =?us-ascii?Q?OMPxTigw8bFCSygXp+T7YAm9GbgancqLzFCaeJLdmyhENPBM7prImFTvxS61?=
 =?us-ascii?Q?dI1ZwndpiLgZwRUTHFt6mSH9/Jj0R4FrrlKLw9o3fTXdvYsm/y/AoMX82nG8?=
 =?us-ascii?Q?TORlrfO/jYmj2WN8zp9vczeszH5GGhKsZpJ769cyka4sY2Vja8zmo9xEe1so?=
 =?us-ascii?Q?X5E4EVvBayhxsIO1f7JEBmtznpXtreFrhbitRMZzquXbrVIQfpDX2BhOSPwZ?=
 =?us-ascii?Q?jnCJbPkV8W3a6uP8nIKdrkHD3jxiOVRbGEpnKhlQJjhwkSe0087IRc2VsZ81?=
 =?us-ascii?Q?gi9fq93rYcXIfXK5RNCLIGaTFJJWWVwLuHaiTDPtXX5ejnyAfVA023rbltHn?=
 =?us-ascii?Q?hi0fDsgJhoJVKu9Xd+STRzz+4gxQKqCJ0ssvFqRRz469Gx36dSMHTecvbDuV?=
 =?us-ascii?Q?jeIb0+t1EUgh+LWbvhi9TT/dObsjQWPGXFLnoHy9b0Ty5ZuCWIdmtuHTyaJi?=
 =?us-ascii?Q?ZFn47vJWp1zTSGn3znjHJ9wxrqJ5KFQ8WcOBcmcA7lI3df6vsMxnDc7J/8pc?=
 =?us-ascii?Q?ObFPD8xkPIyuqnWX5qFYVI35tM0w5wwiDzkrD6utLrISYyF5M7qofYOZiMLB?=
 =?us-ascii?Q?rReJDvvP4E0DhNYHumJ0wLKJrX8QeBjr+/XqkCxddMrxqpGiWmFY6FJvDTpu?=
 =?us-ascii?Q?N2qJ56rNNZx+Otwtkcg2sARsxLAN4Bb1Fl0RfK11caJuot0JUxLKvSsSMaIl?=
 =?us-ascii?Q?MeaBBttLrENnseZWdSVHEyKjayVXCfvjmDL0zLrXJew6zEFSaxoo/IC2vcQS?=
 =?us-ascii?Q?/UbKmijBnV/IZq2Ih4pE/fCT3pmhvrq44KOlLz5XRIxGzjMbInNMTWRcSgw3?=
 =?us-ascii?Q?v8EJf9gCwgkzmqls+VeSIA2YiualFyB6et6IzuGjamPCZ6iQQwZaFwaNKscg?=
 =?us-ascii?Q?RGeFYtcpOet22C6JHgvsIJqVuiZEO4O4SwqDuP1AbFjuAoj0j1flIYQEP+Xr?=
 =?us-ascii?Q?MG9YAe2lmt4NeroaWO2UqlJV6A7RhTYpBulUBkfCA7CfqG5rcL3tSlbBXDdt?=
 =?us-ascii?Q?R1CEVQFMJtl+Xyie1Rt+nILnCqxy7wtlm2ZBBA6GEzWhrV/PcoNVgO5YKTax?=
 =?us-ascii?Q?Smr7nK/36TsXwmTPOlv5Txy+HhAI/NS8p9IhF3Z3MV7JDGldED9+Ur9Rf4+i?=
 =?us-ascii?Q?4qvUWQwX2vZ8LL3SmeoABpxfsci3tpemZ8/qBLhpidEwmnx8pJe/msrQyd+l?=
 =?us-ascii?Q?AxQMSdsP6xg/mVIvPSv1wgzOxwfOO435ITiKL2RVhMR+P9e0GyhE8DkQJrIl?=
 =?us-ascii?Q?WykzMXzSCRiVwj+C9F7wu/3L9BOzc4yixAJCnmrMOl59yY0pCHtGcHjOByu6?=
 =?us-ascii?Q?UoFHQ6K7z4Ebxi0rVBRxmZh6iV9829dYOc3rfOA1PEhFf+IHrDMhcRYGhdP6?=
 =?us-ascii?Q?B/inZfCBonk8rgMClqSXXSvOuWliP45rqA5MEfUZd4gWWAMtz12kCwVvaarO?=
 =?us-ascii?Q?mg0vFfNtIpmGGQkqDy/Xbfb+Ie6+vdkH5vmu2gmu986A3BS1kPd/LXLa8yxR?=
 =?us-ascii?Q?cDsirkcP6JtP4yAm/jXNft3GicmiyS3pcwLOgEIq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb81b7e2-8d88-49a4-780c-08ddd3447349
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:48:30.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA9HJnOKuDDDGh+ECJydF6gL2V0J2DYA3kVW/QEpk1viTJJzLJhFUwC3G3UekNzoZLqqBuZl6rtiDKf8+0OxtQ==
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
This IP block is found in the HDMI subsystem of the i.MX8MP SoC.

Data received from the audio subsystem can have an arbitrary component
ordering. The HTX_PAI block has integrated muxing options to select which
sections of the 32-bit input data word will be mapped to each IEC60958
field. The HTX_PAI_FIELD_CTRL register contains mux selects to
individually select P,C,U,V,Data, and Preamble.

Use component helper that imx8mp-hdmi-tx will be aggregate driver,
imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
bind() ops to get the plat_data from imx8mp-hdmi-tx device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
 drivers/gpu/drm/bridge/imx/Makefile          |   1 +
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 205 +++++++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  55 +++++
 include/drm/bridge/dw_hdmi.h                 |   6 +
 5 files changed, 275 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..6c1a8bc5d4a0 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -18,12 +18,20 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_DW_HDMI
+	imply DRM_IMX8MP_HDMI_PAI
 	imply DRM_IMX8MP_HDMI_PVI
 	imply PHY_FSL_SAMSUNG_HDMI_PHY
 	help
 	  Choose this to enable support for the internal HDMI encoder found
 	  on the i.MX8MP SoC.
 
+config DRM_IMX8MP_HDMI_PAI
+	tristate "Freescale i.MX8MP HDMI PAI bridge support"
+	depends on OF
+	help
+	  Choose this to enable support for the internal HDMI TX Parallel
+	  Audio Interface found on the Freescale i.MX8MP SoC.
+
 config DRM_IMX8MP_HDMI_PVI
 	tristate "Freescale i.MX8MP HDMI PVI bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..8d01fda25451 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
 obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
+obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
new file mode 100644
index 000000000000..9002974073ca
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <sound/asoundef.h>
+
+#define HTX_PAI_CTRL			0x00
+#define   ENABLE			BIT(0)
+
+#define HTX_PAI_CTRL_EXT		0x04
+#define   WTMK_HIGH_MASK		GENMASK(31, 24)
+#define   WTMK_LOW_MASK			GENMASK(23, 16)
+#define   NUM_CH_MASK			GENMASK(10, 8)
+#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
+#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
+
+#define HTX_PAI_FIELD_CTRL		0x08
+#define   B_FILT			BIT(31)
+#define   PARITY_EN			BIT(30)
+#define   END_SEL			BIT(29)
+#define   PRE_SEL			GENMASK(28, 24)
+#define   D_SEL				GENMASK(23, 20)
+#define   V_SEL				GENMASK(19, 15)
+#define   U_SEL				GENMASK(14, 10)
+#define   C_SEL				GENMASK(9, 5)
+#define   P_SEL				GENMASK(4, 0)
+
+#define HTX_PAI_STAT			0x0c
+#define HTX_PAI_IRQ_NOMASK		0x10
+#define HTX_PAI_IRQ_MASKED		0x14
+#define HTX_PAI_IRQ_MASK		0x18
+
+struct imx8mp_hdmi_pai {
+	struct device	*dev;
+	struct regmap	*regmap;
+};
+
+static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
+				   int width, int rate, int non_pcm,
+				   int iec958)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+	int val;
+
+	/* PAI set control extended */
+	val =  WTMK_HIGH(3) | WTMK_LOW(3);
+	val |= FIELD_PREP(NUM_CH_MASK, channel - 1);
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
+
+	/* IEC60958 format */
+	if (iec958) {
+		val = FIELD_PREP_CONST(P_SEL,
+				       __bf_shf(IEC958_SUBFRAME_PARITY));
+		val |= FIELD_PREP_CONST(C_SEL,
+					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
+		val |= FIELD_PREP_CONST(U_SEL,
+					__bf_shf(IEC958_SUBFRAME_USER_DATA));
+		val |= FIELD_PREP_CONST(V_SEL,
+					__bf_shf(IEC958_SUBFRAME_VALIDITY));
+		val |= FIELD_PREP_CONST(D_SEL,
+					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
+		val |= FIELD_PREP_CONST(PRE_SEL,
+					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
+	} else {
+		/* PCM choose 24bit*/
+		val = FIELD_PREP(D_SEL, width - 24);
+	}
+
+	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
+
+	/* PAI start running */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
+}
+
+static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
+	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
+
+	/* Stop PAI */
+	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
+}
+
+static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
+{
+	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+
+	hdmi_pai = dev_get_drvdata(dev);
+
+	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
+	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
+	plat_data->priv_audio = hdmi_pai;
+
+	return 0;
+}
+
+static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
+
+	plat_data->enable_audio = NULL;
+	plat_data->disable_audio = NULL;
+	plat_data->priv_audio = NULL;
+}
+
+static const struct component_ops imx8mp_hdmi_pai_ops = {
+	.bind   = imx8mp_hdmi_pai_bind,
+	.unbind = imx8mp_hdmi_pai_unbind,
+};
+
+static bool imx8mp_hdmi_pai_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HTX_PAI_IRQ_NOMASK:
+	case HTX_PAI_IRQ_MASKED:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool imx8mp_hdmi_pai_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HTX_PAI_CTRL:
+	case HTX_PAI_CTRL_EXT:
+	case HTX_PAI_FIELD_CTRL:
+	case HTX_PAI_IRQ_NOMASK:
+	case HTX_PAI_IRQ_MASKED:
+	case HTX_PAI_IRQ_MASK:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = HTX_PAI_IRQ_MASK,
+	.volatile_reg = imx8mp_hdmi_pai_volatile_reg,
+	.writeable_reg = imx8mp_hdmi_pai_writeable_reg,
+};
+
+static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8mp_hdmi_pai *hdmi_pai;
+	struct resource *res;
+	void __iomem *base;
+
+	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
+	if (!hdmi_pai)
+		return -ENOMEM;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	hdmi_pai->dev = dev;
+
+	hdmi_pai->regmap = devm_regmap_init_mmio(dev, base, &imx8mp_hdmi_pai_regmap_config);
+	if (IS_ERR(hdmi_pai->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(hdmi_pai->regmap);
+	}
+
+	dev_set_drvdata(dev, hdmi_pai);
+
+	return component_add(dev, &imx8mp_hdmi_pai_ops);
+}
+
+static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
+}
+
+static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
+	{ .compatible = "fsl,imx8mp-hdmi-pai" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
+
+static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
+	.probe		= imx8mp_hdmi_pai_probe,
+	.remove		= imx8mp_hdmi_pai_remove,
+	.driver		= {
+		.name	= "imx8mp-hdmi-pai",
+		.of_match_table = imx8mp_hdmi_pai_of_table,
+	},
+};
+module_platform_driver(imx8mp_hdmi_pai_platform_driver);
+
+MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec289..ee08084d2394 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -5,11 +5,13 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_of.h>
 
 struct imx8mp_hdmi {
 	struct dw_hdmi_plat_data plat_data;
@@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
+static int imx8mp_dw_hdmi_bind(struct device *dev)
+{
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx8mp_hdmi *hdmi;
+	int ret;
+
+	hdmi = dev_get_drvdata(dev);
+	plat_data = &hdmi->plat_data;
+
+	ret = component_bind_all(dev, plat_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
+
+	return 0;
+}
+
+static void imx8mp_dw_hdmi_unbind(struct device *dev)
+{
+	struct dw_hdmi_plat_data *plat_data;
+	struct imx8mp_hdmi *hdmi;
+
+	hdmi = dev_get_drvdata(dev);
+	plat_data = &hdmi->plat_data;
+
+	component_unbind_all(dev, plat_data);
+}
+
+static const struct component_master_ops imx8mp_dw_hdmi_ops = {
+	.bind   = imx8mp_dw_hdmi_bind,
+	.unbind = imx8mp_dw_hdmi_unbind,
+};
+
 static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_hdmi_plat_data *plat_data;
+	struct component_match *match;
+	struct device_node *remote;
 	struct imx8mp_hdmi *hdmi;
+	int ret;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
@@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hdmi);
 
+	/* port@2 is for hdmi_pai device */
+	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
+	if (remote && of_device_is_available(remote)) {
+		drm_of_component_match_add(dev, &match, component_compare_of, remote);
+
+		of_node_put(remote);
+
+		ret = component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
+		if (ret)
+			dev_warn(dev, "Unable to register aggregate driver\n");
+		/*
+		 * This audio function is optional for avoid blocking display.
+		 * So just print warning message and no error is returned.
+		 */
+	}
+
 	return 0;
 }
 
@@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 {
 	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
 
+	component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
+
 	dw_hdmi_remove(hdmi->dw_hdmi);
 }
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 095cdd9b7424..336f062e1f9d 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
+	/*
+	 * priv_audio is specially used for additional audio device to get
+	 * driver data through this dw_hdmi_plat_data.
+	 */
+	void *priv_audio;
+
 	/* Platform-specific audio enable/disable (optional) */
 	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
 			     int width, int rate, int non_pcm, int iec958);
-- 
2.34.1

