Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC824B4335D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20DD10E980;
	Thu,  4 Sep 2025 07:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Fp2VgUPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B91210E980
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmIx4M/zElCa2orb672KcdJqyHFJjyjuH2zTmPikkgctX1bINsAocEMMZSo+wHufvp5H24Zetx34F3vm9xpoGrsxsykAiG0Q+qL4T7/taHcgW+jc+OIPAapnRpvScUW5z509Ov4IniiJ7WpyRyQnLGmIpXIkbXqcsKgi6u/R4RBjyPY+pAB/g+T3RUDVJbKdO4+opkeqoui/uVnjneathItE2RqdjkhgvFnpKAIhifqdutzLIMwkoximSUEYHfbq03ULcbJz1xiplJYRLBxH2UHYwLDdpwugs6J9t9osWKIHoCH3ge7WefBZur9C+GxQ9J0jOZTOITy/UXCdjuIMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD3Ig3A7bx3mwsuWnJ1/5Axdz0bf4OoDj+aIUrrWm1g=;
 b=DoaAUW3+NNIiHyK/5sVk+9ROsSHKo1I4TPg+oSeeCAHITbmM2be+fm7SDm0tGEM1CkHp3tuLDWJrjDFL4WhynkLGN/QDpA2beYyE5czYV3SwjNR84lIswUqlAbGsRIj/bM7A+w3EFG0m55NMjMMvVmCWu5VdUqtT7Ctv00m07Ob7tbRGTjCm4MqOP1Elm6f9UX20X6Pdx8MawDo3tN2EIRQLD7Y7ayH85MzjgNotR5E03xEzMePNO4iOCDhiG2zwL3d4fR6y2Xn6GAwoEQk6M74k5SlgyXOiBD7Gj6BfuImCilIOjd094EH+jVzBz2gde/aA9TmCgCNW43xg9RcxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD3Ig3A7bx3mwsuWnJ1/5Axdz0bf4OoDj+aIUrrWm1g=;
 b=Fp2VgUPsdNMK5yRY8ZtH+WpqDLhKpttt80gJznt34nct62UcrSxY8AsduQBRUifn0zGSmBoPRU+JRkIjzk+HjaUKZ4jKU0Q1BG5I/yWwGsug4r+BnSyP2PyC8NCZDcAcciAd7kNtxkTY7Z9bVRVwCWf5isAVnlCd/loRPGMzYtXT6WqJ1Ceyld7kja5Tit7sI/Pm2gSo9KGnIx2usu0sinb4QseWBJW8hFBF5DD3+ErXyjy3ZtPM+U8LLpiPtoUssw1/QM8aarVIvSAElYqqrIGy0RUuI+mtVedvRusIFLhYYFrIjflHIIXNQZqQ4uEdbWDkAaMMgLS44nlFre+35A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 07:07:05 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 07:07:05 +0000
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
Subject: [PATCH v6 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Date: Thu,  4 Sep 2025 15:05:57 +0800
Message-Id: <20250904070600.1361165-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
References: <20250904070600.1361165-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6c5249-e123-40ff-6a3e-08ddeb81a7cb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VzZdf0qPzCkuIpZcUAisXVUyagR4gs+g3TsRXMldUpsMjCsxcJcirJVs0W/1?=
 =?us-ascii?Q?/52SbzEIacEXA7WtAmP1hrYSvrLhurfiOlBKmXZ/sbXstG+6DiNxaXpdf59q?=
 =?us-ascii?Q?xnstd4rQKN8O0NSvRnJCV0jgEGTwXudGEA0bxnljpkG15Srug5FfRC7xVuOy?=
 =?us-ascii?Q?BXPMFoXAJkC3hJFv/EJ1GO3fvM+6XOm0FtIRuc1dbkhyF5q0HB+3tSsTJK81?=
 =?us-ascii?Q?iPAMZ76dcL9a9MYJliPoJXb98yzSMjtMDaEDzoNFSSGDlVrarkMqvrtg6vGo?=
 =?us-ascii?Q?98EDG1qm5kkMozouNfJcHL7ONnBSoo2r78mwHP5DaQcXUXuNQNxFt9nfpfAs?=
 =?us-ascii?Q?WaYh+p0VqlPaEGGajMLwTfWJ/FGaLMNqU6QWKmw0T9wmblQvIXGK9K+02V7A?=
 =?us-ascii?Q?H97nPIdDgw4Fkb3UiCeruSrRLl0gmH8OYThNYB8nj0VT5e8PAGI95V8mP2wx?=
 =?us-ascii?Q?6dF29YcWYGfnDCxI7k7SICoSSSq+cPJOpFJ8kNsZmv4n6PW5I65pjBimm0wg?=
 =?us-ascii?Q?qhxFqiGxU/j12BqZWoYn0XLNplfH+0eo1ZNXtLIXgQ+vn6rfRyFxRzib3hjK?=
 =?us-ascii?Q?hAVm4k5qG8Y16JUQ2YJ6B58ZILSlv/hG36FnrBvurG2tPtBdLqdDNr6EZ36G?=
 =?us-ascii?Q?GMH1afXxv89VWnkJWXiSQQbudYDChDlgHfdMzNxUcITzlVvvHi5KP2Fvpfnp?=
 =?us-ascii?Q?n7Yt4UPJS8BtjKuXjnoN9YvaATfB/cH7JQ87K47uTmiQXkJinP061G/MeNkN?=
 =?us-ascii?Q?zNpw3f//2yMPqOiFPbYrY0flTd8uk496Dq+0i6qqYtTVBtveta+2DYXvEtDY?=
 =?us-ascii?Q?/e7R3kADHcTAGe7dxeUCZ7Z1ZQ/WoU5q5Qx0x0j/0R8l8uZTxesaX4fdB7eX?=
 =?us-ascii?Q?b1b7DrbKWIkTCoBZjYuugMVeUpzD8AHgpQvjgUfGFwhKZGKKOF3EcmSjC6jG?=
 =?us-ascii?Q?yDDjy8AdHoIlDpFsWwvYgTbPtVrt9TmGv8okETBoZph9HL+WhDYSe/TXBZNu?=
 =?us-ascii?Q?UiewApP15cXDUAUVYi96cGXgsBCATqYBMFiMgnd1Fq7jGwV60g32Wm/4/f95?=
 =?us-ascii?Q?2EkDPvlmgDLRbCpCaQx261/6mNOwR9U+62UKSF7zwUjfXCV/bFpGCLFoYtNX?=
 =?us-ascii?Q?nuKUNFpah/voWEiAOSky1ceIZ1KanNGl9HnRdeCyDa+HLcefTtfez3ULmiDi?=
 =?us-ascii?Q?hajgMltNcVSJhnHG2aGEBg2a+Nvq2AAv7PomjX91gcgzRwgQPHE9pbljO49t?=
 =?us-ascii?Q?WukzTfluRwgtbc811p8A5MBK2l62v8ESf3bKjGbQx/YVqrHwQVNK/viFYg8u?=
 =?us-ascii?Q?HVHkjCobSJb+IFMPrX7UWiVDOa3uY+Dqx3CjOkiF7UxIWP3qdxMp2ts+fHw8?=
 =?us-ascii?Q?3sEVHuin94hDLQ8uEqmtLkss/cTvysIoVIa4SuLx53KurRETqWHyOXBzijLi?=
 =?us-ascii?Q?3t65WUdMefFvYBT7n52Dcgji0+ImzKX2NwgiudEBdSNAWb10Nv9E1uiDnh04?=
 =?us-ascii?Q?kinj2YRX1w3a9Lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cY6DUqd/pa8TRf4z23yM1T7L0eZb7kk1ZulcFe9GRFZuH8vIZU/ojbYTh96D?=
 =?us-ascii?Q?/H47W/LwxCrUSPBifP19B14FwHBYorXaItUpTpfGj+PTdzMSThOVIQgTWUsS?=
 =?us-ascii?Q?rmVk7oqGSYw/6ZMMkH+4NG3qtRcWyeK4CzU60rC2MDt31Jx+2yPEyT1wED5s?=
 =?us-ascii?Q?TCQhWQb3qX6V5JxYipkBfhOab0hgJWkfDLY4Qv/lpb/LVGx4A1lVK1MTPVOx?=
 =?us-ascii?Q?zrZrOcEwI3TwZWeJYjRm288wmsc1HPf91Ddo2K8dAfvvrNeS9ROoXG1VTPkz?=
 =?us-ascii?Q?eRgJPmaO7jJseLsKyMFiK3M9dAU3Xnkwvh2+54VqcMiuaDUFaK/PXz4NwlaW?=
 =?us-ascii?Q?W2qcpjU0cPrTS6gPzhAYTSWUHU6PbDp74+gWa/P9L8971+JQrNJhILmBscFj?=
 =?us-ascii?Q?AUrEkIKgVNSDFQw3VBzyMIy49yRsprepJYLQRlKB+fO1UxpVQDJKXmG6p+dI?=
 =?us-ascii?Q?U7/+AIvhjyrHLtwP5BOlq6ZcCC0W/5s2KUr939HcHVFr6H2zrBqfIpxP1Nde?=
 =?us-ascii?Q?w7gPzS1+2ORVfmEB7PLFSq943fMP3kGWgNS02hzrM2LOH6QPqaCalMZ7cJga?=
 =?us-ascii?Q?neMLuMW0Fx+BNwldayrFalaJzyAeo8QTjtFq7l8UfiAA91UqN7MVoMAC5xfQ?=
 =?us-ascii?Q?ORAl7JQZ5jxYgqz3pql26rSNldY03t88AUSPpizVwYVaiyJADFHPbGd0m5AO?=
 =?us-ascii?Q?ZzjuOb1eWL9HqOLnKvqCqxF5IkutgL54/lKko+cJaXq050rfh/vT9zL06+zt?=
 =?us-ascii?Q?5fwJpbDHbUEI0Qs64/EkQAf/AHZDaV5eNFMexJDna4QBNjuALwNbnkUG3u5N?=
 =?us-ascii?Q?8FVFRKSMAGYzEtoiuTK9JL3qmP1Z+f2eXoI5LSaEOqmgaMVvpbIeV493SmTu?=
 =?us-ascii?Q?T8vkBAxYMXjjaDLZaMlbkFdon3JWHvyAJACnXX2ijJWb9xHOqmC5hiO73zNN?=
 =?us-ascii?Q?pW5kzsIsfImLunfianWWcrG+mCneWhqOQjKIt5RuEd+RyAitmnKqeHTByfep?=
 =?us-ascii?Q?fBpyt3DYNYTZly66F5OF5/+cmE4sq7kav44OPfckHHSlRddWlfwYrsPp54IR?=
 =?us-ascii?Q?SssXQ+tThEA0o3I0eapnfLz//KdUmQsioodvVqHL7ZvNkp/TyQkkewVhj7LI?=
 =?us-ascii?Q?VTXJUaenYgIPW6ORaQKJQN46qF21fj0Htsm1+huKEk8/a29VgZjIn4a8Z/ab?=
 =?us-ascii?Q?qIYS9uqBZH9zIwX+Nfk8veZlnY5KgNZHcTsdYnDev+4zstK22dpaZDhtd/kA?=
 =?us-ascii?Q?RpVRzbmaZVmmFg6ZFDn0VvpEg7tkLy8EchlzJpMUBxHt6ack32c5qJBMj0o/?=
 =?us-ascii?Q?A70+J+VnSbOoybsn2flg8Zvumg1dsVyAHHJAgBBu0Vsa2VZYCsdjT8lgm2pq?=
 =?us-ascii?Q?Jlm9qqvgZWpO0odAE44gR/Hw7Wmoj0+VcKOpxfYg24zztpWHhacVCb9WWyxh?=
 =?us-ascii?Q?WHEAe6r/eQTT+5ozJ7wGHcF1S7tdRGBt7jNyiIoxtVuoWMR8qqYMPTEVz5VP?=
 =?us-ascii?Q?4/pE5DuVX6V198DMrTfJXGqMHJIVMlqQxLog8ytgtSuXbFkdz7CJv1F5qY77?=
 =?us-ascii?Q?9iO9aMB3gIneYIr3D0n5RNXdFxYNNDaWkExZUdoB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6c5249-e123-40ff-6a3e-08ddeb81a7cb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:07:05.7884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EHlIJZ0m1edSZ/IX0oK4Q0236DUptk4K/mJOHhvnLicGCovVE+YowsjHgalatUZrAM0oSTkdF1xWBQrrt8iZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 10 +++++++++-
 include/drm/bridge/dw_hdmi.h                       |  3 ++-
 3 files changed, 16 insertions(+), 2 deletions(-)

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
index 8d096b569cf1..a5775e59a52b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -177,6 +177,7 @@ struct dw_hdmi {
 
 	spinlock_t audio_lock;
 	struct mutex audio_mutex;
+	unsigned int sample_iec958;
 	unsigned int sample_non_pcm;
 	unsigned int sample_width;
 	unsigned int sample_rate;
@@ -718,6 +719,12 @@ void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_non_pcm);
 
+void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958)
+{
+	hdmi->sample_iec958 = iec958;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_iec958);
+
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
 {
 	mutex_lock(&hdmi->audio_mutex);
@@ -849,7 +856,8 @@ static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
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

