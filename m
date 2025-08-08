Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F2B1E415
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77D210E8D5;
	Fri,  8 Aug 2025 08:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XbemA1jQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011045.outbound.protection.outlook.com
 [40.107.130.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1488710E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erz/ZhvAy6zZduXpdc6qVOBdzBX22ND3rcnRUthTjcNXlMxxEynKA5D+7FrawtyTewBlxf4iRZryGIezW+nIWR9j05ekD02EefThh72G/dOXVHB5PyPHNEieFiS1Nxb+VqeY3T+8Y3HE/6M8r4cT1kenar6tGIQVgNARacss+/yKR4CHG2g6ujBdJeyMWxofkWxRXjUxlKsSLbvqr5GgkzTdY+dssOuKHhuXp3uqJsd/mEeJhkxMaJl1lzwT3pMXZqU3sRqk/LqIQSekCHJpv4iWXoANxV3IwYdAXzFWnBMmdVDUEbgoAczeU8nvpscdMWXiYPhavp9qnJ6D9ZrsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJJk8waZAGUmtpJCix864mNIrqWzOzu0644eEgIapGU=;
 b=id+LHgb5rQ/BJXj6ttyujVcpxM6kg3dWsgxemksYm143wf9Fg1Obop548uFDxRm4+LHspMzAtmutoijJy/YouyoS6jjY+Uc9QZ69smFIb7kYFkyNPsHzplJi2fArZZqBsqj5UuoTV+ccF/4ljbXmol4oDjH4MOheX2e9JjpbYqdxSsLV4XvD5OZA/YNMMA3kLzSFdeK+sRVvfGqJsrtBHIVWTlO9D57B6NLzjrio7fwuh9cCm0jifoJu5+0rv/ZYzTYEEL/ED9Qvm9vSKbV/0yI/J/fveYGM0WKxsdpoWjZGe2dC5LodykneHNmY/M5duQq/SEo8TLdmxT5oAybyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJJk8waZAGUmtpJCix864mNIrqWzOzu0644eEgIapGU=;
 b=XbemA1jQWVVwfuR3Q91eOXHDpI1tHpefCfcKzU1Xc6wIwaO5LBcKvdZMqnmpsI54CZvkyPgrsldLR/Ik4IsFuCumrNtMcKbGU8DPW+LPbWgzqp+VeGJmx82Mkpi16XvSCnzEmYHkE7BdSqY8ZyMD6Ilz7CGBNtO01Os+uo6wVk98NvBlVnJSWHO5HEpQ9g9AMQgje8jdpxXcCsmQJ2F96x7n66CeU6c2LZG9GAf5aT9lQe54FB6WkSL8i6dP7g3vN9SB8KgptkJnjwy5/d4/dKeIxDdzveL2VuY9DXxofgdrEPo2eCPKIYOdzA3qS5ewr32UpS7NAD9a4sdHCUAc8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB7760.eurprd04.prod.outlook.com (2603:10a6:102:c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 08:07:07 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 08:07:07 +0000
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
Subject: [PATCH v4 2/7] ALSA: Add definitions for the bits in IEC958 subframe
Date: Fri,  8 Aug 2025 16:06:12 +0800
Message-Id: <20250808080617.2924184-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: eab6f35e-8916-45c2-acc6-08ddd6529196
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|366016|7416014|376014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bCZ4F2M5ef+UV8L341PO/5AzWfJidE2fzYuEGxb8/yhZAPAkIwvIcYCq6JYZ?=
 =?us-ascii?Q?3XsB8gruDOlLFksKUZ2X1VHvIMZjLY8XQvBGy6mv/VL+CDUKLngSp8G0HyXH?=
 =?us-ascii?Q?B0xXIGwWKl/cZBRf3uHuJQ2PRBDIksl37pt7w0aISdeYNd/+Cn1RtzYn3FqQ?=
 =?us-ascii?Q?b7iMvZJbZXJnr4nddqR2zGOFAJuIKXYpiAcY3qq+Wg4Yz5g055Cnr+fjq+Y6?=
 =?us-ascii?Q?pxw2Mt9y/ATKdJ+mchILaYQ8HYDcO3a9D7qsFQBDIwr/hKti7l/Pk7PdUWNJ?=
 =?us-ascii?Q?RPlRmyyRb8kUiQS6VWkt6ncGGdRiXSxPl+4WVsL+W6nfMWTnsvp5FKrzbbNq?=
 =?us-ascii?Q?buz40X7i1CeLTUjNP96uHRLW847I0ts1wORcWQsuq/L2KPIuAPjOAl1fZjA/?=
 =?us-ascii?Q?xjW4qA7yCR6+xwVxA15NAKtuhBAnYdEAOj8OtCaZPEww17CLJeWd+3bUuACq?=
 =?us-ascii?Q?ApExHnLn8305nrkUAU3emnHV0bgPdT1lU1Ke4oJc+UWIOqkPESC1kbPihCjw?=
 =?us-ascii?Q?WhazHGDSayJO8Fm9SmqcZ5L4otiOwHqhCRUKE8JoJSwEiQWY+z3OVFrrKMC0?=
 =?us-ascii?Q?fl3aqk02eDg+BAF/+qlfbAlwdGiZs3ENpQckTNFqDBmjh3hdRe8HUbRQnUCu?=
 =?us-ascii?Q?gjewBpen241UmZXE9OM9FLUxwl+iAvb4Jnj8z3JabAtDn838N76dHa+LBbPz?=
 =?us-ascii?Q?asxOAlwuGWeMB3nk9bWFOzApXU0NxRU3BS75sN9f28f9SBBUQ5mwNl5+UV+L?=
 =?us-ascii?Q?jsXgZrtRzo/t2pEGe95wL0gEGMcXIbYeSepf4XjClafAtFOmNX9noF+6ZbZO?=
 =?us-ascii?Q?o2fclHCVv2uphN53JAPaz53Qz0a0Wle5qLCfnP9QlcP372PnxoTpbXK2UmbH?=
 =?us-ascii?Q?9T9rgDlFsH+vNOtlXjt6NoxydQ/XvAW0lygugfTg8pGHd4dQV84CJFaHkHxU?=
 =?us-ascii?Q?QdjRdnhgrmLeP5agXf6qGEIJj6XRKpwB1qXD6wy9gH+6VMSrbZvLSY3C2b7w?=
 =?us-ascii?Q?kfGrlRakvN0M7uG8PjhxOV/HPbdWdfhkPtMMiD/OgtFLJxg4GevKKKs+KXoo?=
 =?us-ascii?Q?VV/oSJFP37rnknN4JYOeh2vzoLNL8cuk5HO6pE9FENhG8coEjiBeD89sMQnb?=
 =?us-ascii?Q?sH0vzdbY18XgTmBIiW28LbRbokVOWBIOR70hXSGkcyPk6mctFkV++N9V0Aud?=
 =?us-ascii?Q?9qn8pw2Cc8xKt/ox72mvwh5vTljKKvl0Fifohsaypc1eGZ0YpFvquH658+sr?=
 =?us-ascii?Q?RhS5kx4+49mPECkTymMnaTlVIOjwaezs6suH6iSM5G2wTjwAdDt5s7V/DWmY?=
 =?us-ascii?Q?05F1NQE4+FHWSifFXrbq6j2O+l4a6dHHUawcgWJHS1bPLw5WuD60KqzS4Rlk?=
 =?us-ascii?Q?gVctIUd+xbDrvkVqEP0WDdhUXkSueBA8j2r1Qjf5rKojM65chsdYBIsaUgAZ?=
 =?us-ascii?Q?RCMFhuWdS4doUSPAimMMMEIaWjL/eU8nBm5kAJhPASp/J0CFxF0p0VhVQuL+?=
 =?us-ascii?Q?yy+A+b74nqFNky0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FttSNRwGnHOa9tZOL+m01xGT9GCIKDHzRUUNS70nxWfsDP5J8HwKpbZmrE9b?=
 =?us-ascii?Q?1PPXEINHTNz6SHDS7oD/vvJJvGm/WrOQfkMrq/7ZBQdwkOW1t92QK4UObEqm?=
 =?us-ascii?Q?vkz+OYrhY3jpNacH8/ZFGc2pmJ8dBRuyl/r2UNIWef8Pjp2t6Htc9IrXuFFq?=
 =?us-ascii?Q?MwlIuAHgXouKgvoDUGSWVyKr06U/JVys7xwyTqw2R8WdLFo0VrU0B4ViRSF9?=
 =?us-ascii?Q?sMj8JkzEcV204RK71kPxU35X/vAozSQauE3TW0i4esQD2eV+bQWVHu/IDo63?=
 =?us-ascii?Q?94W8h3yKyvJDOr/kQrILURMHCbia5Qnzp7cay2oMk+GuNanYp6gU24jRrgpK?=
 =?us-ascii?Q?lF4OhhqUq8zVpjUPg3epjJPnitRAOJlacji3WAQJ5t8Y7CVz+h25JAqrD8FB?=
 =?us-ascii?Q?+pKuS8V77IYRQ/Aww+wn4Te1nYhu6dCxCb9UhL9NHS9VZiYElVYgtC247VL/?=
 =?us-ascii?Q?UIyZHCt5D41dxE/YqkciGakBpNnQTYZ6Z35GjL4vzNE7zi3boGPR7wS0k2Ta?=
 =?us-ascii?Q?DZRM0kZJnOlHOmt4nLcbGHSm6iskfQrtqoCB8vacM/WekPmzoqRjsPRfDTEe?=
 =?us-ascii?Q?0jNwXpPOAoWfsU2+E278GDJw4pRj9uX9I/2pnF41fdPb7o/NpVqdjGuNlA8X?=
 =?us-ascii?Q?HB2qO/vLyJVHW5bl1TTqCnlxs2NZsLk6jwKa2jotNJUFJDoCgPZAIy2QKc8I?=
 =?us-ascii?Q?fl8GFrLoSCTSNw9YELjYGhHpAyhHk8bmxq7QS2AIUn+mwUNSA2Ae+Qb9eCmM?=
 =?us-ascii?Q?6M6UJvz1bi44Hx5QKYZm62Bp50VS2j3CbO78bD4Vv/PiYuHCCo3XVjpX3zaA?=
 =?us-ascii?Q?6jGDQJeDqXOZBPS58rvOdGfVxi/WmkKwVZXCgUdmNp8C+zk7YJ49qwqvvDkZ?=
 =?us-ascii?Q?YNUsTav9LO2rMoThfdCKHMBvOzyl1vcN15sd4D/JkR7mNVunIeUja4ivr7jV?=
 =?us-ascii?Q?wEGo4ng2qWSD7j1bduGkYZqQ/zEBtcJ0WNiR2MvH1+HYD0RC+OkejjFRcg7g?=
 =?us-ascii?Q?UIfNzoV1n8I7nvj0jn+1YktIVr4t516pAh5HqgtJWYPhC0BVydzCKnVX0wRT?=
 =?us-ascii?Q?Nb9eadlVGSh3fx2woWs54gL0jH0ZurlV0EeX7F2WViz8+u04iLkbdFyOF63R?=
 =?us-ascii?Q?0HyqP+z7smZgdQvqiNkUt/vBeef/sLlFO4+MfKK5qyJGlBMecRykxc6TkdN4?=
 =?us-ascii?Q?GoJy0Wbd8KOosdsMof5ZYrtow8UH0RFy2Se1YQt28d1D6CFDAPbcQe3BS3/j?=
 =?us-ascii?Q?lBntISRBKPMZLtu9Wy53wjMvm8djm6UC8Y0qjVIN5O+ToLR/3QEoefYDR/do?=
 =?us-ascii?Q?gH5RKjz0k4p/W6j+C9B5+1aNBkvX75ZfUYJeO3AFM5szmuGHrSQSfdXvXPdb?=
 =?us-ascii?Q?AILQBB11IsU/0HjI5lR3zUU0LeTMZm+RmlfxGDQ9mBDRrwDaa03G3tYvfTLA?=
 =?us-ascii?Q?Aae26CzNg/yC1j9uXMeTKVyeVjrZkwxCSEhnsQNkl0E4Ja0mhdFzSPsIlsdy?=
 =?us-ascii?Q?1M6xyTx3bfOtDyjJ9QrnJQAUl1DQlB1jTICbfvquDAOZmvC1UnltzI49Qb9R?=
 =?us-ascii?Q?Xrargf++YqavtGb1tNfy9N3NT3DscnMXXFCDKDrK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab6f35e-8916-45c2-acc6-08ddd6529196
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:07:07.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jemAuvp+18g/QDrVzfaM1eCJCbe0l/myrAKmnK7noP7hzMk43uGhCOdYHeidFt0FrlmbOu2beep1WtLWhk1acA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7760
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

The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
in HDMI and DisplayPort to describe the audio stream, but hardware device
may need to reorder the IEC958 bits for internal transmission, so need
these standard bits definitions for IEC958 subframe format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/asoundef.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 09b2c3dffb30..c4a929d4fd51 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -12,6 +12,15 @@
  *        Digital audio interface					    *
  *                                                                          *
  ****************************************************************************/
+/* IEC958 subframe format */
+#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
+#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
+#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
+#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
+#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
+#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
+#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
+#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
 
 /* AES/IEC958 channel status bits */
 #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
-- 
2.34.1

