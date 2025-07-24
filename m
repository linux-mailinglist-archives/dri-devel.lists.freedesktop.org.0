Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB2B10198
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7CF10E898;
	Thu, 24 Jul 2025 07:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DOMXKDGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55D10E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8RdC2I67MXLYJCn4v/5FcPVbuDRfZA5deae98pAX2PYLSmKdBXUsQ2c/pWqvq2lPe50i87u/ZxYDvYHzToUkNCwYq5ZVaVNDTrtUwJdkMnZBiQjjJ1jmchnTsZcINA0zRmLWrfXYhPehPg640mkpX15fG9MKfFDsRJuHlr+8ON43mo+5siEpI3wRSG5pC2bnCQepJIagmoC8+yn2P9XFOp96TldgICswvII2p5gMoNo9N12I9VHgHKzfxGnqKLujytVLgygiFjNJ7yFRB8B4tJ82WuD4MlqPP/sZwBaWyTjoBH9IZQCyhUDUBfaZ+kdqCjHJfBxaZlJrVi6Z++X7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwuzSRcdbT4FeTWmL6GOGjyAYrKZdmCsC0Ftjbi0UFI=;
 b=yMkEOVUja4MkE0qSlJ5ygRAs+T2X9NF9nSCaT3qTCw/WRPbFjkBBBR/6yf67dxcWvwXczPVLB4nc8K0RocOhHW6GX1Lehd4Kx8/BqhF2INDgWYbBcdrNK/uYhvcfteCVBaH0BSsN6VoYEHei546Qvh6E1So9sq19mGDnFUy0Zyj2o6DLgRTiNRCOVYCPwUn7iyvqn0WwruKwi22T1BS3b1sMlzyJ4rpN9ksporcAt4XdFQq7JsnwgZ1dGIMzMuQkrgVcEMfkgORqiX/d5Jw+r6MqQayibfrj6a0Q1KR63QO+/6qshGZ6UhzWK33PFKQxuTmPnGa0kjIT41c1OgpNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuzSRcdbT4FeTWmL6GOGjyAYrKZdmCsC0Ftjbi0UFI=;
 b=DOMXKDGScS28d/xWYZzAqrS0w5tSK3VxiF2FdnZ0QnhIdV1nWcM8MWKu3r/h8Ub6/RNBBHWI5saHgTxdWEMNxeppJqGjbtfKO7xPLz8Zw6+v7/lOe7srDjnIFFnoq1VdzRxyA9Zkjt5hYT4YFPwIhtO+s32yRxxneEj34Bf959QHIPbaGZfjCAiARtSuJfi3BHyHRnIf5nx1U1LzvNKX2b9k406+tf6nZlNAWTIU0a8nO8F0kYVb0/L9WwMYpCEwgQ7jXZMC47tqR0WiWoEQ+6r5TlJXaoaYDzbBsy8fyNFtILbo4Z39qfXP2Q248lV5phCIIqnajEEtbATJv+iV2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:23:53 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:23:53 +0000
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
Subject: [PATCH v2 4/6] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Date: Thu, 24 Jul 2025 15:22:46 +0800
Message-Id: <20250724072248.1517569-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2220e3c8-8150-46b8-39fa-08ddca830b21
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vlt7pF+WXFVZ6iAruwNhPG5VGGAjcHpeT+ylgPEtdugCnSZHOlDWcnI32Gev?=
 =?us-ascii?Q?WRFlh9Gk4D7UmZE83Kg0bz4PvMvFek7i697PKaRJUsHssjZPz+J+NgzVGZbw?=
 =?us-ascii?Q?xb/22oS2ZvoH4P+/LTbktetE6hwabX8hrvsIOKeST27qSlNcSBaD8RD1jv+X?=
 =?us-ascii?Q?ReQoKHVPxx+0Ep4UtuWUmdMOJA51OFdzxAa0jd4+G5SbhogjLgSMlbeRaqII?=
 =?us-ascii?Q?FQS2j47K7tHdCZxePa0JasECX66rm/91yskjw5bFN9NQ0C6xLyPP6v6kcyjG?=
 =?us-ascii?Q?tSYx+PXiQ5avo9psKShHP4qditkI518708Y3qTuj0kyp4NEyVLbXECtHqzl+?=
 =?us-ascii?Q?GqRXXMhMf0E3k31yzF8srdaUDL0LDYIHCjDwVMkG/gZvjKUUQxOZabqe6j0E?=
 =?us-ascii?Q?reNPw8GPAnj0Z1t/5KZcv+4LiBB/hiQinTAWoBoCS8vF0EZvMTlGEw2iNSaG?=
 =?us-ascii?Q?jN0yBRW/oGrmygujF/S1DgCT2xaDkLLl7XF/yS5+uDaRnVzRSjRc+ylDrXS+?=
 =?us-ascii?Q?ZBqVKA9CnUpwUdtH0rUgUhsjfNZ8vuAQYwJ/meRx3E7OUX9GdX+8G/veak97?=
 =?us-ascii?Q?+3Thd++h9b2YFa0ighxS7wOpQ0X3TG3UGjAaaaxNRtrQqmXh7z16UzKPO2MJ?=
 =?us-ascii?Q?Izs+1KDXlyTQwA7Yy7CiFdbcg5rAGGyIajnyUHDwegYdxnwJ3AvQcyNyGa8E?=
 =?us-ascii?Q?OrDus06Vgd2zKpNF+P8axB47eBa0ABgsTfJMd0y6W2hHr9178sXK9izYyLtf?=
 =?us-ascii?Q?sfBSujZiM1bl1jVrJTB51E/k/2GxFrZQ2c3bdU66HvEaMvggO0wSjcsCZ6hd?=
 =?us-ascii?Q?wxrecmtU2MtzXAuo69mz4ZGYwKOK6qcaGJ2ilVqufGD2K/0e8XsvtwV4BmK0?=
 =?us-ascii?Q?3KERxdHLvQb1jk9T+GdpEBYgFBpw5so9pjgKc+FJ18GXIF6RjqFFFezOLhDp?=
 =?us-ascii?Q?1+27jMlDMcg0JFuLEnhUbEdi8D1TCSjhUZpQSmisagM2w+6GKMa7nILYQXQW?=
 =?us-ascii?Q?Mp72yeumCm9qz0ekmMcXUQBAJRjB+Hyk9OSk9IMsLNjfTtWs0ZPOdGH/0eDU?=
 =?us-ascii?Q?O4g6EwDpSffGdTAMWFM0xHJWsne/zNQAIlCZRpdMVmxizAFGWUzetUWkmumZ?=
 =?us-ascii?Q?OhMyPRLD7b8Fw4yvNEQ9KUM+WVILT/RAe/gy5fR+HQ6MsAgT2HCzleWq3AZE?=
 =?us-ascii?Q?w05HpiMfFyY/fbhQ2vFovH9WBWBFnrtg/xSnx0w3Q2DXUMOIeuV6z+n0oIXQ?=
 =?us-ascii?Q?PB/9slvXDuQmDATuJaMXs4JXcIBfNsVlvLi7ybC4yglPbjQ69PAUGP9QMN4+?=
 =?us-ascii?Q?a6tOT2AXKOFmmNNacmGl6wsTs2KRbrqg4MOeijTCUKTYcv6gXk7ughX6oN9v?=
 =?us-ascii?Q?nOcGwV+hLexMSXcVicl0NSgoJyX4PqwLrw+XgcN8krb43Ij0Y9Q8LpmksdyY?=
 =?us-ascii?Q?VJXhpInYMekkjG3Eww8EKDnrhG9uN/M9q3z5BfvMWeTM+GwoPumjntPRHSA7?=
 =?us-ascii?Q?eQ2tDQw/zdwg9GA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Or6AfWGBOA6na1vMIboVUwEd11vXNID/Zj5LYJn8GC5r3LZoqREX8ORXsQad?=
 =?us-ascii?Q?kdz9wtxEYXbxZPxKb/peACJvNcMU20amwdZ3CWElTD9Gjdsuq+gNJpetz0Bv?=
 =?us-ascii?Q?h1uPykDZ0Y3P48tcJRVEfsYmlJTGhWm5xac82uq3S6P8hDbHZrVhHey4w/f8?=
 =?us-ascii?Q?HlHwEgjOXkF1QgUoy70A9QHL3+q7RZSupI8aBmJbAVp9H9drkMXFbIOw4zUx?=
 =?us-ascii?Q?E0xTuzxSNLU4UiAJQrzZdWRdpCiJBRBm1724GDGn0/JohSJhwqKbDiqA7Osf?=
 =?us-ascii?Q?mXVd92uHyy+0+KACudCLdadPh2tHrWY/kpDengjXI7LXiiPXEGqlwWx59OAD?=
 =?us-ascii?Q?+mamC3+wKfpY7tmOGIXx1H3I6z/CPLOshMz+wAegzC3xa7oUKf84V+XtUguS?=
 =?us-ascii?Q?oAbG1ZGZnKijD1KlGdB18Zvb4f0xKOpyJYCNlYI1fj2KTmIkktqNNXEDlyOu?=
 =?us-ascii?Q?WMkAP5LkerqaQ0iUqZiliYz+E4eG1YHYaStAM2cMvlhow0+TovXU3pHQtpSu?=
 =?us-ascii?Q?+04OIzwCDgMT11F4QG4NIO0/Sl3XLM26KfLMKtdb0hrubH6ptBWNM0FUQxcP?=
 =?us-ascii?Q?1+Su3ln5JGcyPAJwlOykWgDxm4nnOigXKCdhd3AVMeoba52RXZ7TKcUWk1sf?=
 =?us-ascii?Q?0bouPu1JkR/ri+hbNp7mROneWrOk79t4Q7wOPq6rNE1rVkAeFMD3d1t90M1X?=
 =?us-ascii?Q?lGBynB2CxsldvODRgoV7OzqSd6JlAPaKGJhWoKD+JDR7kzyD51qpvHf3/hae?=
 =?us-ascii?Q?g1N9O4JImEbQquqdvIomwcDW183wB3SVNvFEZGDvf7zFCIibf16CXtro3JZ5?=
 =?us-ascii?Q?e7rWvEkaWgRi6M/SN4rTzuxx6q260XVaPmDmrVGKlvM0Vlkk+IuX4G354yCd?=
 =?us-ascii?Q?PQrolbe3dUHh3hfogTyx0xCF9PBSlSGlSUvVnZNEjxgeu8ywrihDRDJBpu+i?=
 =?us-ascii?Q?lUOOVdiB/zkacbnmRZ2EWIAFo8pYcyTF5KMOCglYJY/6MfPQ5rHY30z6i5NN?=
 =?us-ascii?Q?ETXZzGbbpd0gQY6Y5E0vSlD/XhnNrzgqGbaMCdKO82BEi0X/+c9OP4uRHLWq?=
 =?us-ascii?Q?VVeJsZboNqhoHws4nwhviI6MJDqPuIj9i7StNT7azwBEcUaduJ0UK0OsI/oF?=
 =?us-ascii?Q?tFglk4oHbAioxg+OQGGiv6rxRs5xhT5hmtBDVQtmexGhAjJIT2GZ/Gu5d5TT?=
 =?us-ascii?Q?2dl9cctCJZMBYcblwAXxjvBT7qHcuUGvzH9CUMeGbNg86K37oUwbGWr0kqj3?=
 =?us-ascii?Q?IxcVFPAnHS6d6cTDB8PvgOp06KSSOB0JM6cRsYT/qGZyWOQR0yy9L4cEjBxB?=
 =?us-ascii?Q?ciz2VWgUtYBIYOlaXtt19AP+aKCSMXzrzGUTJK/3Q0osKUUoflZKypiuMDiQ?=
 =?us-ascii?Q?f20hQfgTow30lbrZH85F7VPfVLm0xpNh5PGYBKhI9WcTEbaXGMhUQ7bubxK0?=
 =?us-ascii?Q?GvZ7alyWR1ZTgjZsoU0qjGgj2/RtBtcXN1Nmub3q/BZvev2vkw9mWkapO+lv?=
 =?us-ascii?Q?rDpGCDbT9biv2dS3xT33V9bkyuPen/OxYnv5pezSWDvhS6Fw9gImiJ/r5yUj?=
 =?us-ascii?Q?Z5s10+SaUZCe4t50b+XHZvaoFqpeItRTE6LMPlWi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2220e3c8-8150-46b8-39fa-08ddca830b21
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:23:53.6096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqoznPtbc6ZOH2J2cZlZHsgMVqnpjm0uw/XwMMWhqyAvcrxYXE0mXe7GGfrgc5StzCXAxBWtwfDhkgJ1+7KR1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

