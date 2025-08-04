Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B6B19FF5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165DC10E433;
	Mon,  4 Aug 2025 10:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eEAXlq6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203B010E430
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAC/wmWl9RudISS0DJGCOG0QpCBMnpPevS7BT8vYZuAGzCHhkLwyhFupjUtz7fEGq5rm1eLE2EtrXoiKtFhdN33VTiVrcAFDdXD6xsQ/LU/P7wApAaKpOe0jqp5sAxHDb8E3rxmLUTHMhep9C6A6+L3R3hoNnNyna0he2ifH0x1AoWnCDj1fSy/8CrWpJx4aHY4T+6l20/AM1h8WGXymTaat1tfz1qxXaDZs8+Wcfx95blf+PG8AyS4VLrW0U2JbgJ5R2IlO0ki6TvmkWpJPQkO2T0RhfiKannUkXYCz4T2lr8VBGKS2zj+C2kuv8PJjmQtqJQPWOU+hdisMxn7JXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwuzSRcdbT4FeTWmL6GOGjyAYrKZdmCsC0Ftjbi0UFI=;
 b=Y5PJBLtx3IzxbZz50OaG2rPIy6KSr0jimJZ4fx5WiRtLWBzNqs+CTiGYRJa1dUFUgGVfdvk7Zs8yMxjqB4SCMyyumzt3vuHBTa4COuhw0SAIBw2Gn2XsqPqhil6PZDwVmLC1BywwXe6259EELcmi8A8rTO1B4l2Ko1AzYcKK8Gixo1llFI3hySxmet2x+VLPOf9znjAkEt+/nrIIUeZDqwGgFtsDOF5WW6jrGbvciXqmtPO5oPomYiVt6o/Wl2Jn5shLMsacb1URxa/5g/MPgTmilqNuP7Uh0wOY6BW+St94TiHHEjdbuYBx9aVsuw9n9MoPTqth6uGCTqq3zYWGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuzSRcdbT4FeTWmL6GOGjyAYrKZdmCsC0Ftjbi0UFI=;
 b=eEAXlq6ZNrUhYBJo7g2rbTAC6YOrJAIJ+MkjwqnU0SLEb+qW/2hJWetuqU4rv6QFcPhETaBS3kgdu4UknP7Nw2E2jtWzp+Djj8Fs12d1OFj8Zw5U1WRahLGE2Ou8zHXC0x5foeQEeqj+aAKVooqOUwS0yenqJ2nw7ACNjSgc7UxEzmocyMNpyfXQ59/OK0zmE2O5KUStsX379ohfLDo1i7XIFWvUfW7rtejh5LGcklvVe+uwl2XSnNna6ygBFdbdJ7iSVvTaNGK7HpfXlmk4FWbFHb/JuFSv4A26hy7/K1RDNDzwVdIz4dRRgdlx8JJh9hEk8XkhPq2JENtxnTtUaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:48:22 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:48:21 +0000
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
Subject: [PATCH v3 4/6] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Date: Mon,  4 Aug 2025 18:47:20 +0800
Message-Id: <20250804104722.601440-5-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28b5ff31-7dd3-41e0-037e-08ddd3446e24
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uhJ6+oFNpsQuk9kUX+Xt//lV7oJkZTcgj1kscXxbn5QIl8vUTZAZ+linDxmi?=
 =?us-ascii?Q?a0Q9OTtHHnnlaMn/yuZCSSWS16+BghZurOsJ74GHMPZFjhLQbKw2Hj/DGg7f?=
 =?us-ascii?Q?WhLiVuI0s9UoSqAgdljZH62ZTBxd4G67mXnr1quFzeCjKHBBKDGQzAAACOUk?=
 =?us-ascii?Q?7yBHwmiSwIgNY1D3kbHIcIV/yuEjZaGERwvc9mDlwWjDAIQrd10gKzZmlFYU?=
 =?us-ascii?Q?HW03WkKvZPTuZTumnm+z89C7BNK80SeYvQK8dWz24885lbW3CB5fb/acwFc3?=
 =?us-ascii?Q?aJdWe7G8MQRUSYNBTFBDQQWdncv94WIhAFez8jwZxgxl5aBjbBRccPKuojdk?=
 =?us-ascii?Q?rowk51QOYZgwMLnN1lecyjlan1AmMJavVAzye5295czHqHrL70iOB/sRaULW?=
 =?us-ascii?Q?AEU2qikp/JDdDJoJRvNPunYUSDl9CZB1z9sd9o8qMHQaq5xscEvoviHgAN9N?=
 =?us-ascii?Q?hOwGN3Z8YQ8D/t6l9gqAfpIY4mn7GiFRmZ9WQp57yv7rEcmsMqeOupQzS0D3?=
 =?us-ascii?Q?Jhgose3dzGEtlLsfC6ojWO9l84MQh9OIf87+2cPGPcAownjJIfBZQjNT3ONc?=
 =?us-ascii?Q?E9glZv4HIf74fBICm/l52MJRGIrFXSr4k0p6p3sI4sLttxl2Pw1p1Dswecf7?=
 =?us-ascii?Q?zDAwB7JW3885frvqr1FFV1Kr7bDB43oU+7GvrAOxMgrqulgRpbqEcZXzg+5i?=
 =?us-ascii?Q?mBmFg0kbiIgs2Hi2VRrN9h6dO46T1msGcMf1733C2ZSw990Ya2R11QoaG/nt?=
 =?us-ascii?Q?2CR0IfkRXHqqj3yFVFnzL9KdBCwbC3btFhSacXHSI/b5p3r5CSr7v5Tc7ivg?=
 =?us-ascii?Q?jh81xdqI8o30ShnwRK01pd+WLoRwv/GvDVnv1z+zoZZgR6Horla2ptW9l/6z?=
 =?us-ascii?Q?W9IYyA7REUs0EF5kqNdZm8XvAvvBSlm3PsqfiTR//k22mit6zNhOGxi3b+51?=
 =?us-ascii?Q?kV3OgZTQUT+AVsKa0XLy45MELFnjvGLvSwkIPjFiGDg6pG3tH1S/AaB2tM/S?=
 =?us-ascii?Q?K86i4fmelg26S+7v9zMIULtQqmM5XghQV0QNFc5k8LzXbN54I4LJQ5nGbLOW?=
 =?us-ascii?Q?OU0S8Y46lKmx6i5mL88/6e71Kb/DCfIk2JbDupL+Mym5+81pZQzboyHpZUUw?=
 =?us-ascii?Q?+ytHk8vJS59HwFcFdLvUU/F4RYPYEs5BkZV86SlbBk7vBwUwpHgRWzn03M5v?=
 =?us-ascii?Q?PdGFWDZYimTmIHpraL4mR6L1uaAN0cZP5QDsL7qwGoxZ+QUKRRqUFIbZpDY0?=
 =?us-ascii?Q?MHofw24BM9+YNYyBex8gMraozck4PKqrdd6+aHL5FHvveJ1plyZrB3HIB90m?=
 =?us-ascii?Q?uI/u/3vd1OHGZ6INlgssvydAnqzDme5t9nN7WqrjqCK3nft9jVFKaicpHm4p?=
 =?us-ascii?Q?OSgGPa8uHwOtZJsflb8r8X9MBFhypKuMbmlyPkE0TAUa+G99Ubu2FYIXerH7?=
 =?us-ascii?Q?5PXHz1PkEg1PNpgH7krmaR/4YTM2bb578TKVRwP4QR7bZ/s2FuWAqHk2wI1b?=
 =?us-ascii?Q?U2LAxrmrPLXB6Hk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHqWynKR+yIWRP8GkU+KzPsJ/JTs0tro2kPhiMdBGiow93+lJ9SpmpVcmti/?=
 =?us-ascii?Q?/9FWlmRsNLcJpomIakh6OJPrc2eoNQ+eAgXQWmmQFdzwWl7CtgKJZWGrB2XJ?=
 =?us-ascii?Q?mwTf8qhNk+WSE3kayg9DM1pm/nyie+8YZckhLRuq3Zkuo0SNXKbhCou3aJag?=
 =?us-ascii?Q?OlENkZ5vbkn8vnaUI8lkWzRoUbjv5L0/Y0dDPL67xh9K8QDybLlqJ7npBpYW?=
 =?us-ascii?Q?kY371Lum+dHDft0WlkZLWyPa4D8PXmwA7Pac2bY7uOuevu943YFkD1IyYR9K?=
 =?us-ascii?Q?dJM3X/nyZFBqcXGXkcfTdU0hBHeS7V2g05UsXjO8X1N8Fb8EtTxeC39pwQv/?=
 =?us-ascii?Q?BbCKGalPBeDXZZND5HOXgpejN8x9jWUvXUv1HMlW0cZ6C0qWg66L3pG6LKaJ?=
 =?us-ascii?Q?Qlg6KUxa+xawPrM1x6poPlM/axxhEqHEGkpRQu704LS16UreDPrWfWqU7Goh?=
 =?us-ascii?Q?iiWYfHOqi3ORO2twYM1qch02IiybocFoMrCJpC220AicMgwpD7iCeaqjJiJs?=
 =?us-ascii?Q?psKKYHcbHgbv6WiNdVr/wI7SEAHgrX5Gv5btW8q8EzCziVZNYNfxhYxVg2/L?=
 =?us-ascii?Q?HNWGDy2JfDKpY9cyaPtF9E8KfRGFWZ/R6ZUX27ZFGpNGoqpSDQZaNxIawrIP?=
 =?us-ascii?Q?fgqyiStgmnWy7vPWwM4CrYQg4ZRxV46fm5jj7vfZWSO0j1YbMxyANhXR9wr2?=
 =?us-ascii?Q?9w8iHgaU0aKGfn0QV66pwFnfliJjl/Y4oDqA1ilEfaBZ2AI7t95y7ic6I96m?=
 =?us-ascii?Q?g7591V8Vc1Yj2KRW7C0oxdqp58v0KVTmTG11v48OEzkzbk+25HsZXXiX0BYC?=
 =?us-ascii?Q?1McOJO+y1ucoqV5SziLVIujRglFBqQkSAAq6QXSbmTB4hir1XOml74/M6tma?=
 =?us-ascii?Q?KUVkDx+7Dep6J5gUU2pEufKRdLEieJN/McWVVij8FLX8Tu0Onb/PdcjTfrM6?=
 =?us-ascii?Q?5K1RRLEDnBzvVOUHbB019ZCy5uKpYJaU7UYLy4uol/YX47xRiJw05N/OzxMu?=
 =?us-ascii?Q?1wLiIQ3LO/iakNPkxBcLarnnKFoZAWewbhUg7Mbb75XHHI0+GSJZPCU8AoDg?=
 =?us-ascii?Q?HrrEmukz/8fO4jo/L2FB/LqHSJxHSwh2Kjo3V9eHtxFTQcYWVD0XYOaQwxva?=
 =?us-ascii?Q?o1DtN67ZZ2qC9G2f0FaFJF1FunOlOnZsvJraOOxabaFgVUL3TS8QWS9kohYj?=
 =?us-ascii?Q?5nVnGP+IsJcxNveCR5hSwG6bBeEIoa37Qd0dss5uiQUMPp0hXWX4m5P6naJx?=
 =?us-ascii?Q?E5k8ok8at5kpY+FmwdVaFmjaoZknBFXJCgOahy4B1wTUbpZx995lT5FKDtoH?=
 =?us-ascii?Q?OfDzBJD7s24hnpMtkKlW+x4EhqumuD+g6tEnHTvZXHxQsftiyB1NLOzGlEMd?=
 =?us-ascii?Q?hM9mFmxNVg5KPWDL95RYsl30SDKzJUGSA7CSjl1oYOj0gkZyGgdbPI7E4utw?=
 =?us-ascii?Q?z+Gil+OmZvXdebQyQbIaWZngG8EiU79gqECDC32PI6YGvKUDrTnJtK+N3PjR?=
 =?us-ascii?Q?ke4UE1fgEarWkE5WDxuJzsditatBxfxQ8WUYKmz6AehH7Akk9YDnKbtlJBiX?=
 =?us-ascii?Q?cz+HrcjY+YrNnSo5uCRkAbfGFLaFx04QhVPO8FOn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b5ff31-7dd3-41e0-037e-08ddd3446e24
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:48:21.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tt+N9UtuX9mTg+IIiqXMuXjtQ0TFLYVGcB3oyJhTTtxvqmVl0jig5wgvV+9giBUeDYIDSyg7u3SxtmyLdYiZVQ==
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

Add API dw_hdmi_set_sample_iec958() for iec958 format because audio device
driver needs iec958 information to configure this specific setting.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |  5 +++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 12 +++++++++++-
 include/drm/bridge/dw_hdmi.h                       |  3 ++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
index ab18f9a3bf23..df7a37eb47f4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
@@ -90,6 +90,11 @@ static int audio_hw_params(struct device *dev,  void *data,
 				   params->iec.status[0] & IEC958_AES0_NONAUDIO);
 	dw_hdmi_set_sample_width(dw->data.hdmi, params->sample_width);
 
+	if (daifmt->bit_fmt == SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+		dw_hdmi_set_sample_iec958(dw->data.hdmi, 1);
+	else
+		dw_hdmi_set_sample_iec958(dw->data.hdmi, 0);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8d096b569cf1..3b77e73ac0ea 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -177,6 +177,7 @@ struct dw_hdmi {
 
 	spinlock_t audio_lock;
 	struct mutex audio_mutex;
+	unsigned int sample_iec958;
 	unsigned int sample_non_pcm;
 	unsigned int sample_width;
 	unsigned int sample_rate;
@@ -718,6 +719,14 @@ void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_non_pcm);
 
+void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958)
+{
+	mutex_lock(&hdmi->audio_mutex);
+	hdmi->sample_iec958 = iec958;
+	mutex_unlock(&hdmi->audio_mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_iec958);
+
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
 {
 	mutex_lock(&hdmi->audio_mutex);
@@ -849,7 +858,8 @@ static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
 				    hdmi->channels,
 				    hdmi->sample_width,
 				    hdmi->sample_rate,
-				    hdmi->sample_non_pcm);
+				    hdmi->sample_non_pcm,
+				    hdmi->sample_iec958);
 }
 
 static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index b8fc4fdf5a21..095cdd9b7424 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -145,7 +145,7 @@ struct dw_hdmi_plat_data {
 
 	/* Platform-specific audio enable/disable (optional) */
 	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
-			     int width, int rate, int non_pcm);
+			     int width, int rate, int non_pcm, int iec958);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
 	/* Vendor PHY support */
@@ -179,6 +179,7 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
 void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
+void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958);
 void dw_hdmi_set_sample_width(struct dw_hdmi *hdmi, unsigned int width);
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
-- 
2.34.1

