Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC78B2EFB8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86F10E88D;
	Thu, 21 Aug 2025 07:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hSfistYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A9010E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AK9jEQSiwwpFsB0UZ01R2yJinGyJK6rFzEAMl28/Wv7+1fUg64Yf2LYtTjnrTI18B7j5fAJafEQXADGT1iLh5rwWpm2US27IA5G7G+mM9xymHsv8JjCE9z2UMM4PjefFRfPtXY4fTGvbNBc2qflhdbAQH3xF6Z1JQhMbY8po4QO6Xqf/yWmT6UvjOtCpoyIqJV8C3SNB0yX8NV8HVi0gVw3qk5KVVkGHPh48M52IHeX+0nxShaI+asKSkxbZKiI9peuEN9LvlhLHdYQXepK8tf6nFbI3kJfFyFfLs/rWAIDNqL5vHbPJeQ/+NmwkKH92fVPwVFPLn1ee2aTlv68Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKglpKMyf+h2HQTwKcBDsmkGuawOfxE7T4ChmVXjsUQ=;
 b=US/Byo/jsHgcpmDyusgXxcwdgdy/dQjEMKq7cGuu5yRaERmm3Tms4beYwge4+VPFYr0u+haK725oT3b9QoB5eF5MXUQXJ+27Ch6LEOY77u2jPx9eUu+4aPikuUu13fGkxAzJDRCbCxDNRlYBf3ez8NAtimqt4fJeOyzpbnETtbMVbEkbs3BP0oCcKbM/omv+NVbjfNpaYz/dBMWA7D+xlTal2tI4TWcgJIbVDPAxeNRYx3a332IOd04hUPkwTDJmYiDHdYGUoX9pIsWYBWF/zqwL8P0eFBIf845+FkbMA4xIqhdoki5xII3/50msHuhHPRd7XUrANKE48z50o0d/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKglpKMyf+h2HQTwKcBDsmkGuawOfxE7T4ChmVXjsUQ=;
 b=hSfistYI6r4Vp43QLA9runpfAfaT2O/5vgZ+LTQiZzQ8Pz7l+oPYX3stxmChWi9KVf+Z7yzKRN2L8IKM3PyvhBCFIZrF6bA7JT4YnEdjNzhpz3TtMKFmMaCi/ociXRaX18H9dd/kFu6COv/7IgSpwR7JHnlWEcDcJGC/Ytku5drEKptIropsw50/aqUycDLBUgOPbB9NHEw0OOzUe5piJeM6JnCvrNNJTQv68hMDfoDv4oQh3NqompRGmqbiOV4kvQA8BvsDyDZvs3Cu6yJbGfy537W7yuHhr8gMa8nN4nIVhZeCdd8u7KhU8UmMH7w9DuNe6LINq1Yx6719kWHO7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8887.eurprd04.prod.outlook.com (2603:10a6:10:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 07:33:09 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 07:33:09 +0000
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
Subject: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Date: Thu, 21 Aug 2025 15:31:28 +0800
Message-Id: <20250821073131.2550798-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f4cbc5-59ae-4cfc-afa2-08dde084f9eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jt/kmzoT30UtK6ef+IOEp7sSyqSJr9iYhIDor71w89cg3m7RnXCDi7lgnTjf?=
 =?us-ascii?Q?pvmrHiYOWpJX0De6aZaYGWkhJELkpbp8p6SgIC4KWh2lBBAhONsIfvwtvAPy?=
 =?us-ascii?Q?js7h3wI3DVRSXJ2rZsaJP585B351/8WlVtWz9cJkr0oyYO091HIbBIx+7X8v?=
 =?us-ascii?Q?15O6YUC/Roexaxgh5EeNyUO16SJwavyLV5L0gXOH7NVyalnBGMEt/x5pFYa6?=
 =?us-ascii?Q?QJh0iDZuaykisdi6B5OriwL9m/44WIk/PpUBIPpUSHC/8yrKk+HQPt3E56Lu?=
 =?us-ascii?Q?efiH7fGcox49o1gkc5CcNq4aF9xMsh+evbBtMzg0PWaKi/sdbBTvMXOPUbs4?=
 =?us-ascii?Q?IFRpSJQKOFkao1FtzKRt3Oc2aR8ymP01B/k5VTzmHlQy0FK0eNcb/N7T/Hpk?=
 =?us-ascii?Q?bzkJE8DCfHOk9Ma/IHN2wuRQgPbYYW+X7yDZCdEB9TPCIsTBhug5ppCesZdc?=
 =?us-ascii?Q?Y83BXkDKb7hP076RTvjVAsHLTmhAlKsesnJFizaeif+/3uiciiQJty18311A?=
 =?us-ascii?Q?jEhxRrs9K1o6pfihCjb33zC1cu3a6TjLUKdhqWtFsiGItc6ZKiaBl6BEn8In?=
 =?us-ascii?Q?xXxPyagste6ZF7lDwhuf7B92xs6fIKewFOiDjBPNceEyXSe7Qpi0nJStoTPS?=
 =?us-ascii?Q?Kf7/N1yvIJ5+WkJVwVYM27Fd9b1biNRgQ4tLFTeC93sggkR2irtcfbvEmlki?=
 =?us-ascii?Q?YMMzrd43+2NG/sFz+qWsQTg/wPgioif3xW46bVn5sSsmqlUaAqDGazaX/V5K?=
 =?us-ascii?Q?i046JgcI5XSaZAeKLFIGNurLjIzif2hG0s5eesjhVqG1cSNXsOHPPyYVf4EH?=
 =?us-ascii?Q?Y8dxgL3NjYedZC2St/dXSKzRmdCF1fmBVn7dxMEBMl7elszt3qd9P9AvlmbS?=
 =?us-ascii?Q?4cS4/wR/9VOXHHGHroPzwdYtK7U2fVLba9BAfR9nAEf9gpFQkimgGU/CHY7L?=
 =?us-ascii?Q?jxtWRxHJIZK3L5MWFUT8w0hBiykJ4pQSFJOncsmqGQ8H9kmhdT9z/6TxAFEh?=
 =?us-ascii?Q?NphYBn038AsrjOYkKfEps4V/DBP7zmwbSuWTyCpmvrglHK2n/Esf7c48YRwo?=
 =?us-ascii?Q?B6Ipjiil/l4mzxbOsXFLxb3n/qJr1GC4TSpIdQXwMOIBZswoBPNHmvtIPsBV?=
 =?us-ascii?Q?N65lcHBTCyxxP5BZJE7TpADnkpynhLoCBEpd9KdwyoO1Toj086qFALS8WGkO?=
 =?us-ascii?Q?ApfHcvQ648xZhe/BkkaP9Fc6vkyjcDXGNtYILAG/usKEKHxcQ46/a7nk9c2r?=
 =?us-ascii?Q?ywDbZfU50AeI0I0OEXSbwd9W49msN65xSQWAC9k6e12D7TjV31JmC5ZEjvRu?=
 =?us-ascii?Q?lN9KoOrwJfqrpgd2XAsKlwHc2mcnYIphKCX8Hamoqu21kpivn8Vy1AN5ZXiO?=
 =?us-ascii?Q?STv8XkL3bZQ4QhuFyXnrJC4aQVWPVPcPwgoXyyAA4i+TJp6HMutLPvkYv3yt?=
 =?us-ascii?Q?NwDPRAP/FkSHbzE8oDKBL8m6fZx01uGewCIOxIGAOmGY4srwhtDKExm4DI8w?=
 =?us-ascii?Q?yfMDTA4ZAt0chaA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+m0L/fzd1k8TXEgkzVJ+tzrftfy3dPJb9qmyHYo2OlJ5sMpeUc3Lrcn1KeOl?=
 =?us-ascii?Q?zF5NkiAf12Z9dEFqNvHO8lBmrfkPNDHWbJ9kiD9uOkdzKHeM6uVyMhidV9jt?=
 =?us-ascii?Q?ORp/DUVfQm57FwGta7AQpynhj28nEkcwf17H8km2DZGMK82TLEHkLoSGODNM?=
 =?us-ascii?Q?xdaTZrSTagP7sCzWyQIpgS1u/F4XHa9hgqi1s7RKd7xj3Xg6XendE88J4kgW?=
 =?us-ascii?Q?RkCva9MiMOIEK60wAGnZ7RsflEoR90LDdfBVdnKGLj2OOditNKPdO3fdemY/?=
 =?us-ascii?Q?8ZdD9r/ihhzpUOAIVVqcbuGaiz2PA1zJsCRj+w0fs620jQJWDmFHJhbL8EBS?=
 =?us-ascii?Q?j732c9pwQ060qdQPfxQPIJRvCE1OjTKZKVKRQ3b1fzo/Eq8VzQVxlLgVWW0+?=
 =?us-ascii?Q?kW3GZGcVUSmX5m2aKvRMkxch1I9tlMAkeJB622FH7Wj+f/iCrvwofXz16gyR?=
 =?us-ascii?Q?HBUwSjEDJuNxwD0pVl4g5ZBKT+vCx12azn85y5brUTohPcXYcAhee0gmSR+w?=
 =?us-ascii?Q?Ed2BXXGzzqcoQxKaUC8UZ6L6O46Xjtoxuo0VPbT4NALlpcHdmJO/LqCt3nu5?=
 =?us-ascii?Q?2MahVtmO5dHrP3Z9oErh3Vaxu+0RC3Zm4VjTReTWNsgtojLFJdaCUtOOueNR?=
 =?us-ascii?Q?b5kr/VD1/Lah/2qijf6XZ0PQCEeJyGFBfmA3Ds7Mr7OdYucIkx2nDDEyXbzr?=
 =?us-ascii?Q?uSvH+Xfc3MFy1H9GK69annr7jtQlOnX9uHiaK3//Dek0DGsweI045T+ml6CU?=
 =?us-ascii?Q?rnMVCv0CpVsDArunpkgCnVzdRk1W7odv8hDC/eCNICkugses6Szjv5rwW6A3?=
 =?us-ascii?Q?aX2bSY3tshseDc2iSLbyw2SwBZXbJDhzyG25zk2e2GHcpeQBl6H+g4Q23IZc?=
 =?us-ascii?Q?JmXLrU52gEhjeegxcLB1scA6OaWWF4REjY5f8IckJI8I0+CZZgb4ec/HsmGY?=
 =?us-ascii?Q?7TcjhuSQ+p5nWc2jJBQMq9jtx1FDlvjD84NlbnIG0aLAUWyMI7JZt80fTq2m?=
 =?us-ascii?Q?EMCkDZo6yrf/1NtiUldZ3rIujuTWCLaQ0kJM8c9ipLK7A2BZyHP4j7R5ADxh?=
 =?us-ascii?Q?3ovh16A3S6rrc9v0Yil9ILWlBrkXsN6rcXCOKGI11yH3L5UZlSUXEVJBIlFa?=
 =?us-ascii?Q?H1b3Nw+PxCF1TExrgiW2Mn3RJPG/QrSlSQNuYOBsJOmEi+g6F7EfNsCqvFir?=
 =?us-ascii?Q?6qC09ac5+2XAQnLvzrH81vyf/kKQpg0+niryNFTxXVI7ewPN63FjIMppeas7?=
 =?us-ascii?Q?MyN9EQjFE/C5qlW3kENOWw15NFX8iqm4b96rMGaaYUB5nn9wQqkzAjAaICCV?=
 =?us-ascii?Q?sTi8b7eM6OKaj/RhZXSn52HZPeUqGxoz8CvnOIQ5jwwKg8Xwkw+NGOQ19oU3?=
 =?us-ascii?Q?tTlrDa+DPuNoXnKotr7pXLowP93S0xKl7NiEi2sbI0msrsk1u22VR3rU2tlb?=
 =?us-ascii?Q?v+xUPRiyBysP4uVEX+Kn4x+JYZ8BdnYVNNjRROQUtAIXb2ozVRuB1JgNfk1C?=
 =?us-ascii?Q?g0YVT4QPlpxBIrFv0dR/ZG49FTufnDuM1LqHZcxh7kM50nB/l775FZcWIOb9?=
 =?us-ascii?Q?6W5R4fDkWa8mLWbXkSMDwmv1yWzm4/4+aAQYKFRa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f4cbc5-59ae-4cfc-afa2-08dde084f9eb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 07:33:09.1682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NQd5bQWjrYqYRraOX5gFrP91Tr2VmdPKJUx/Htt8lvrRB/SAEh01w95n0pSiY57YiZQfspadRGmb426trcctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8887
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

Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio device
driver needs IEC958 information to configure this specific setting.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
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

