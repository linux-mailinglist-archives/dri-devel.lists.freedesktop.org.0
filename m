Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A01B9468A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 07:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F411810E55F;
	Tue, 23 Sep 2025 05:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="l3CsVjbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925D10E560
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 05:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut2A6M7abC7qbqlFu7hi/hMcuwtj7PagDkPl6F8JcwIU4Ib0Egd0jnTiYjohHlFS4+sxBVof0m8bOqAKU3gO68gezrCVPVb+sphEUvp66sTIkYiOgxT12i6LYvSN43vbHfFRpwm6+3XxSBZxWAwCi35wrbZMWbFSKaiXwlasPgECJTbOMBWEpWYWTuBqXaBcEKo8mPigTVLNBFjYKlkNqcdKNIpoq3z8Kvoot0xG6dKjWbUHOcdZNL06anoUqosxyycDyd0J1PLR4j+Rp/A1j4ry80mbQUySSTcssgC7xYpapDH+akRANHsSGNUa4lKK0oQ5wxzN8VhsuBymQlAlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYietfS2OIuPTRlNGvgXQq3Cq0lBKIxlMpQfQ4EyeAY=;
 b=evuS0w4M+SIT5TfmB9jNw+Ja+GENA44NMC07I0Ya1//UqRK5Qsx1mAL3lJCeUPgQ3QcKBZ2vT221MbeHLcKha1tpYtLNiop7QQRNZ0u6CCyin/C+8fR8+CrE+SfGDvth4HoVObFQpW9qAD6Kc6Qwq/S1W+JVoi8wZg7guHRG+H+08v0u7QAQ0M1xZVIEnzQPPYPuYvsXtppmD6vFQsnWrT36nYfoFt8doo5YciR/7lNuB+16gziUFhzThB2DR4mQICQ/OJWjuG1waj8+koGgenf2+rRAIQjKyfWAWVnVrQWhMwHl2ChL0M5Odg2eA67+rVxvwnHyo89FZJQj/LwCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYietfS2OIuPTRlNGvgXQq3Cq0lBKIxlMpQfQ4EyeAY=;
 b=l3CsVjbprzvsqTmN/vpf0cpgzAa8XRjwmwDG766WpmMTFwt4W/kjr8cUIu5IXbGsg/HQtYp5vrj3/xVdFv9LvbdCmFVMIsinY12YEDJlE4xpx9w0s/+ho76yZx/HZmZrPT1PLqM3FEzPlTxD2Vk0gYK91KCb+VVAVIZrIfCZI4A61CqNiSIDqBRYkqpeACoW9Sh8HI+jdd88eZVQJerFpGtvZPuktYp1d8i/9XOG62Gaz/Kj/IgwSbSRWCQ1CaMxe1Pd3TuNSaYZx7+ZL8Nf+LHr+UPoOk+//x5aLF2kILbMUIt0TI+23GBkLYtmOtvrYaTnIkrP1zkWbfln535YvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7920.eurprd04.prod.outlook.com (2603:10a6:102:c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:31:07 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:31:06 +0000
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
Subject: [PATCH v7 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Date: Tue, 23 Sep 2025 13:29:58 +0800
Message-Id: <20250923053001.2678596-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 16aa5c9c-ae24-43e4-2a02-08ddfa626516
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q/oQxlEybA9U0YhaD8k971QuB7ak1Z1qWH6NSl+5P7DvoZSlu1yimB29AT2d?=
 =?us-ascii?Q?oadWC1NskCnbO0kMOfo657MEHf3kGSFzqL+qWelKcM9CEuxbS+3vpU4CRVl2?=
 =?us-ascii?Q?F7unAi9m9cG0+s8JTr0pH63vFVY7BNIxwuNnPYQ7DCMirf4YX6NbI6rt7cgP?=
 =?us-ascii?Q?2Eb0WskzeddNUP6O8bYPoLtIt5oHwaZnOaOGyOBRde47astaY5ybYAeXT3TU?=
 =?us-ascii?Q?H8t10nb3OZ6FdUrMaL6qkUxUS2nO69Z0UneoFzK0EuC2uuuW9Gcrezh4lPHB?=
 =?us-ascii?Q?+o8J7QmSRHL7Z3cX2hJ0gsTIPCeZYKvgAtRDEbF4MSlCmSpJ8IRV+qcZW4I2?=
 =?us-ascii?Q?OcI/g5FMJ0L0P4zKsbSV8ctwLE77Af2I11cxbYSKs9zc1FsIlpZAgYRE5fgN?=
 =?us-ascii?Q?5Eb1nD4T6XAuIzKeKUhdcXX4UzIkRTQRPudcwloA/KZvtDrjaopZTJS9cbOx?=
 =?us-ascii?Q?CmoUA9uBR68WUYB9fQ76pX2NnZtqSRMSiWY49QY2EVg0XFkR5d3dg0B8nTnk?=
 =?us-ascii?Q?O2w0iOd8YIkryibHeLuFxpIlXWMycKayYbsTM9licSzxzOUUKtQZdN5iddIM?=
 =?us-ascii?Q?fPMvUr2ySreKdvrCfMQZtuR6DwXTjuH6s3IOR3WGfU7cEDCISN48RBDjNn8y?=
 =?us-ascii?Q?hxX5zNw9R3HhytybNZxe41ZOr9BM4ErKNYEZpkSjt5w/I61G+V06OhZwGETn?=
 =?us-ascii?Q?FCyzCg8UBU10DyMji/zt2GOGFQYfcrIMJOR0azC9kj4KNbjGtTfyq6GtswWW?=
 =?us-ascii?Q?gXMxmQXTAaZCd+pUd0VGFdEJ2DMCC6w+/dSMzdR+aAtiwY4jgNPxwO9Y5wlD?=
 =?us-ascii?Q?ga+t/pChd3d95d5sWBPI+ynHbSFTSM8v1sEa0aoPQ/58nKKUTIpGJT37t6Nu?=
 =?us-ascii?Q?csioLLEiuzcw8Z39uNtqiT6hN49mrkdOwz/M+evrHvEg46ueXeixIggz/eJJ?=
 =?us-ascii?Q?vBP2eSDvExH9jAfyGcBhIcPctPQE/PNS/6K31dhuzwTuQT3QW939wk7wstuI?=
 =?us-ascii?Q?qa06gx9AhsKvX2+IYaXhZMo5Yre1S5RzZQo7kZs3SEGgn8OgggnVr5Tn4zyw?=
 =?us-ascii?Q?IKuY4wKssxAlbgbQRAm3TmKDQRv9NgLMZt7pcu45mH8dNN3jCrj5CtlUTUBS?=
 =?us-ascii?Q?AxR1OcEFQFc+EK78CD8NWiQkAHBvyzezpGQqdaI4LKHqOcGDmN/51Ewwy2AU?=
 =?us-ascii?Q?2ZBgBGv6gSF/94ePUCHFyX/ixebli1SLQl5SZq+Tx0s9wX0HHVgAOLVyJMhC?=
 =?us-ascii?Q?hc/tZjvR091AauqTwD8piWA1PVRfvC58vkNy7QvIW66cTaAXPYWQRKFytNak?=
 =?us-ascii?Q?yICZID9qh6Muy6Hy/Anjq1t8uka4H/RN5S05snA63CIT9Y83z953X/15EjrQ?=
 =?us-ascii?Q?V3OiOcNIbqKIDYnUzwiJUvKhYf/CSLJKScJZlT+PazqxZTfBNF+pqt9H08XQ?=
 =?us-ascii?Q?5estrNG9MTRvgXinFDtOX6LV8Wh7oC1gvr+T/2wI004lEyC0NhMiDe2J5IPG?=
 =?us-ascii?Q?AZTTgg8P5mnj29I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2jdbEMpVfS8N34ELNRxMymA7eEBZMNubrII7z+9h0Gg5m4px5bxBJO9aeW5?=
 =?us-ascii?Q?OT7w/FXdFfUzsCCc0PTT2x71Cp433OjE4DCN/yJ2stBpRfw99S0pR1Mk0/B5?=
 =?us-ascii?Q?WhfUyCy8/gcUbwUlv9AR7qDw0Pj3WYg8uGkVg5K+Gj9YvatEEFlQYCJxeeC6?=
 =?us-ascii?Q?jN6B26DCGNA3UoT8A5aYMA52CXJvbD1PdQfvLNEI3fcs6Xt3ThX3/3Ekig4H?=
 =?us-ascii?Q?dnqteHM4M/Rq/ZGEXvRSzcQwja0APG0XWVYNOrwVjvqeuh0V2ck6BArOceC7?=
 =?us-ascii?Q?wki9a0LURcEQYKR6V+VjsAac718GIwl9SV8cfBBB+SM2vcaNEzq+1H444nuo?=
 =?us-ascii?Q?8zJZl3KF59pF3M/Lf578MmPSv6bjC06GucWEqeqZr3dBo7hnA42JgPNsvGlM?=
 =?us-ascii?Q?4U78SX/1qOxaCAWYq6Z4JRKAXYlQDgp03fAqdmfRpZig0H62i0W/y1jhnwlt?=
 =?us-ascii?Q?w3dYMxH7ZUmC+IlQN71RZZvHIn79CHUqGZG7HRgpo16mdskFvtCFdQld1uON?=
 =?us-ascii?Q?fxzO9Db70f5n1oF40CE5pRN9RAfyDAgLA7Pt7PVxkFeTBb7a9ZdGOihykFPE?=
 =?us-ascii?Q?jqaJkk4Tl0OmE6Ym+YmGErGWMVpxRCrWB56pqhIx81aEDgGlhe1vS2a+yRC8?=
 =?us-ascii?Q?QXCoZPZGvo1vOzgkXVSm1VaZsMCa/a90+IeA0t+Udf3eXoYYjqxiS6caiw+s?=
 =?us-ascii?Q?X6ShPJBCGovVMtkGmVzeXm9cGUPB4KTkJNHMaY0pJ8VMg4X9RMEKQLiJ7LPY?=
 =?us-ascii?Q?0B+d3OpToiIUbI+RS1gOd1Hxea2zYhkTKegNo9bdgwx/xFeh5j6qnXuOtybM?=
 =?us-ascii?Q?pj7i+XeUc7uGi5fUMOvUW125ee1COAMVEhMxW9B8xSoaWDQcjVxYaTSNOnL3?=
 =?us-ascii?Q?AkrW1m++CC980gYWRbbcgS2d048/nTL//Xb5+ExqrbQENMIZReRE6KAZgEVM?=
 =?us-ascii?Q?x0nGYB495b8xkJECj8SBkPWNb25Mzo6LM2dHAObDYnC7QaUh/1e6/VURQG2N?=
 =?us-ascii?Q?vrNg6KhLnX7N3LuHMMqaE6Bg1sncK+OSB2neM2uzb2DjDwZZSuVlbwY/inii?=
 =?us-ascii?Q?j0rw0mav+gYwuUC1akInvuwqwBQCzczPkFeD3c9KtmcQckLCUzvjBfqjSOE5?=
 =?us-ascii?Q?0329ZPs7PG6cfpH3tdDtxrjCmdZ+facStW+KdtBWDQ5bJ2GTZAH8AUXzj/Tm?=
 =?us-ascii?Q?aFQP0UWd0hSgwcBIrg6GSJhFxP+VDsvnXR1Wxeq3ytDBVmTKt4mgJYWW5ulW?=
 =?us-ascii?Q?+cWeYEbHnZ2JQ4vixxk2o4+LYynGMwbkpi1MHOd82g036Vd4KN9dCC2AbdBX?=
 =?us-ascii?Q?0nim1SVtcszxXtEW/SR4s2ol3PmW/NjXlUtpUVOSUydZ1p0INUb5CR6nbUG8?=
 =?us-ascii?Q?0zfcF9256X1p4JebzavsijeMSGv5FNUF3Poa+Qvz5Xe0nLSOGyKv42YQOv1d?=
 =?us-ascii?Q?ZcIb13LUxP1HtcUmgYD36UTWBHUpIN5KJTR0cX7qXTVUP5QUn+cAnKWsCKo9?=
 =?us-ascii?Q?xGjIvUtrmqV6U0cdzI+Hx7sYvdPyx260ksXT1iHGgGnqO80NneTE6tHuIc3W?=
 =?us-ascii?Q?HEPQs5bmGGuKmNil88XiWwDANCw9bWC2nqHVsmGf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16aa5c9c-ae24-43e4-2a02-08ddfa626516
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:31:06.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0ytIHi4XC7zr2S9FzN86RUKw5CvQDLn3+ul2U0S2tsU7u4jqWpndZwydt9ny/vgcs5pqe9ef2ICQ9cHp7aWTg==
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

Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio device
driver needs IEC958 information to configure this specific setting.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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

