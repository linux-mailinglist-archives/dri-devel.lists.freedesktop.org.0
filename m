Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9EB1C3D1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FCA10E3CD;
	Wed,  6 Aug 2025 09:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IMvTxLI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED37810E3CD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODYVroxXEaosE57gvslw0QE1f5yNoDLVl/ErjrLvCUPuDswT2Y/8mjQGoYKsBTC7QSIT5t/x1NiDhMIFw8bwwMC7erRJAKNCa3eqyz8lUciZqBiJ7lKBjSS8q0Q+xWhhEzUmfZ7z1PiH9yjosJUh3ETtMgR/gUkRV9CEsXs1XxfSpSMHuerL0Y3IKBqJT6girQXXI4SXHrWtLNZdHwhJ/uMGmuLH0d/UUdZ47Ft0y/RIOa+YO3hPN35WKHSEGgF0TeZVW5uBTaEsy6fqHywfqlrYq++l1HcCiZkxETFhL2Ud+Bk5wrbV0SKdd7RagGW7SRxzqxvve7oA1hLSyKQvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AInD3mtNpiXZP4yAh7NQG44bFLG3xRwaLLuqf+1BYPk=;
 b=TKwPqvGAJo9nBQwpZZfGuyxhFmvk/8c3zEO6vSL4/tYXGM3kaWeFJaeI/M4gUuAOTcEXb2j8riaQkO/Ltf4/4s9DtQrdYruC3Q0hbH4foGIPx8V7sQ2uB9Gh6NzhBGMNx8ZJDO9U2Lip2J55jkAmBLDNC1LKcWx/4KbmYImIw/4LwnnAvblGv97WtjP7+y0iFaC2S501/khlL/xIvzP8dqLcd8BX2Al+jSJOPeh0eINfeg6BsQRYH1RU89q2otl3NETTdmP6YQ2w4q5BjdjNzN+iEuN+WPl9dEjjYNGwuB05aGb6ReFXkOyY0YwjqBRp4b8Ue6dGlZbeQts1uo1mBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AInD3mtNpiXZP4yAh7NQG44bFLG3xRwaLLuqf+1BYPk=;
 b=IMvTxLI9iy4LhQZ+ieIQTXfVT5gvffAWkHOvqeMEE8hERZoQA1aswnC1ryhXZb50G6QoV2Xfz8S2p81wS6Cj1nsZ58pau5gwbt15yrr0MX9Dk9BCr52QQIkf/zJ1IcrRibWZ6fQsD+KZBZwSig4Pp3uQjYWYqgkBW5kaE3/VNXMVg5aCFFn0YrYneLqqF8bwyx+Qni0G6sjSjfO0TLfQTv0jkEJCsubK1YnjC/ruVGmjAnp8TAH4SYQJ5G71J6OuKmg9/mzxgbr5Rvgksz1582AQtgyGbrbDxJ5iQb5uz5IKz9Atc8Mvvo1Mx1UrHayVuFstAJ3UE9JoW4WJlLANcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8314.eurprd04.prod.outlook.com (2603:10a6:10:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:51:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 09:51:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com
Subject: [PATCH v2] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
Date: Wed,  6 Aug 2025 17:52:24 +0800
Message-Id: <20250806095224.527938-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 98341c0a-a503-468d-9531-08ddd4cec51f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2OhgdaBIGSjD5znXqFon3Ue9XWRn8N6Hl5CB3byzcwuEXPPf+HJoiPU6lKKj?=
 =?us-ascii?Q?k/na8qXV9h7tMeqmL992AEXtH+7BqbnEaIyxJQ4KAcEAp5hRbCwbzzXfAMkO?=
 =?us-ascii?Q?rDv+FQOKoiWyRpirdJ9X6rd+u7ogL0Kfw3mlFVoZtmVZRa2YFkLcF5dsumaH?=
 =?us-ascii?Q?4BV+mgt/8lEiXYPSperIv8yox5/hNHxYVOmBoDmF88e1fhIleblSERRjLypz?=
 =?us-ascii?Q?lS4yhymRzYjSSyBdHbnYNmLMOPHY9OEXRE4pTLx5bzYSSKEHoaHJ70H34Xy/?=
 =?us-ascii?Q?ieORgr8t1mfg0IOedm31Kp653mpFRaaA9E6RuF+//e+5ySHYfy+krIXZ3YmL?=
 =?us-ascii?Q?rhT823yWVCy3s6ttik8X4i4+V5DWAaCpoTvWS9vKJVMg/NLGk5wFxr7pq+aZ?=
 =?us-ascii?Q?sBtvLEfXRiXIeHNNDEAsFW44Xjxy7uHWaxfOIL9lwxd0Dx/DvmDHN0Yvvi9L?=
 =?us-ascii?Q?fcDchdYKNxrhw8EM5ZXfwwLbtFvfdGWyfmE2JR25bwPBGVtWuMBa87tv5nQ0?=
 =?us-ascii?Q?x2TWI0HhQaADy9IykB6bRJO7cxsTcMdSVRKksmoyfITiMUT12lT3JUCe+SU+?=
 =?us-ascii?Q?e6WSvJHsdXZGxpwmz9qTwMsZda0OZYYJnrvDPop0GvGgNGjhVOgkvGP5nvtt?=
 =?us-ascii?Q?EontgtkdMzuG6wmxs//f78a5dp8ytPceqEI4Pvyg15LG2GwBgrtl1AGrjb9p?=
 =?us-ascii?Q?LoWEOy2xIDKdnwkZLLuiiCnqMzZgIN5pH6/3aRfCSA1Z3ONK3xPhZ2byI6P1?=
 =?us-ascii?Q?RODoUf1T1jJ2OpL9MXAaLDpjE1OKU1cz4DLPxrgFfU9p3CGBJLk3tjg0q4hr?=
 =?us-ascii?Q?TYbwhekTjqKpFv7eTZhY+PpE98Av5L/7EoTRQRO7PWaXUjQZ3a0N3hzN1NOd?=
 =?us-ascii?Q?ImwMV/cbha+fymjrLep86Oc6ECcNOhi9c1aI4x+rojn4+kunB10NxhUme9mC?=
 =?us-ascii?Q?ZH0Z7iO7WEYpVuK/+Ku615LaRgYz9uRdS49PTEM2NMUIBl1nUAVXtU36qk6L?=
 =?us-ascii?Q?4s50LJcyAPvmhnlg213qs47at3k7P4GMsMd8/99g/BierzvORC8n++6+eWt9?=
 =?us-ascii?Q?eVQfOEeM9aXblSOZoDoep5dYkWW2XGvcnZDAJjfrVXrLSnx8D7FIei5k6NGg?=
 =?us-ascii?Q?zyDEU45CRFTvfp4zHhaJkz3mk2RZH/m60/OCZ3btRVicuum9/RhxoiETuxJK?=
 =?us-ascii?Q?ciLplrkBfQlKxkIipSBpqmw1vH6FexI7KeGDr/aTmBzZ9jGBDq+nkPG2/yfC?=
 =?us-ascii?Q?FuduBM59WP6XMDQ7Vh1EDSzVtzGE9NAHRoAZBDwL6K5VTqBXHUM09yt9Y0K6?=
 =?us-ascii?Q?NYsKeU8OJYHHu6ghoGb/lJ8vZ+8bfHZNbioc/0uIMpg8x/111CCgAXZ9JgTo?=
 =?us-ascii?Q?B/tqAyladIzVULdA/kbks7zwOzMKeQavc9g8m5W1YKVAVUINukefge2djX4S?=
 =?us-ascii?Q?7vABkYhQkHnM+s9Xr9mD2a7g5Z7L2GbuK/a9UiD51VSMDaQ1X5gUaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8M+v9NwhDcowM65pL9515dlJXc93mM9VTWUe/iY7SnB2USRYUQAPi6GngBE+?=
 =?us-ascii?Q?vpOgplqKTaFk4N4XKYH2KMIgpy55B2oFOVp+2ZOKuANdhzof0RaXH+flqEYj?=
 =?us-ascii?Q?OV4VCmJ+5zJkcJJoXKJCiDwyLourarZrsryd9IwWeIH8Eieuv9vQXrNdg5iL?=
 =?us-ascii?Q?Gl5vZHcs6inta7ANbn95dlCSc6HgItSn3zWNP4tdUBlsTya7ZeGtkE9u/xGR?=
 =?us-ascii?Q?TAEBlk46Tvy0W/GjzEpHV+CQo3BUVHdC/4ot0VEUKdc289uifVUadFBgo890?=
 =?us-ascii?Q?voErdbBMuRtMcmu15C6THzu6roVzLDXwkaBLNpstEuq2IsGIVcLbyrrCK475?=
 =?us-ascii?Q?y06eIziI6A3v85cuxjHbmM88LhRwO3rZK+V5kg7c28JP6rfSbVUHfBKO9yak?=
 =?us-ascii?Q?u7wyc9IujSlDwnwskrik9tJxjfVUBx6TNYYJ7aUbmxx0mxm6iZWy7gn/QOfp?=
 =?us-ascii?Q?wewn68W3kgD5jf++kAHYE2bvm9CHy2IwbcMNL5Il8LIX949SkFtZUIv8HRxn?=
 =?us-ascii?Q?CFRuzRs/5Z2XNLYzLBnmA5v5GvqwIi5M9K+by6SreT3xV/e9dwFCWCELo4e0?=
 =?us-ascii?Q?cyT+cSCGh5hORqH6AZNu8Izr7A57bDvNQh0v9Qq4WWqDNVKqG//Oyw3EDNvq?=
 =?us-ascii?Q?pRR49AI1a9DypRuZFJbQj/oWwrpFNsxCjvhJecdKggtXJEyDO4BOn7UQEjRq?=
 =?us-ascii?Q?RT10Hlck5cMkTty4pbl6RZr39Nojn0TiPPL4yqDkNNFFNDJUWYJrfqtPiYic?=
 =?us-ascii?Q?mk4B0/ABdOJmunVczXQNM6VxNhGgiIjjc4ijxWPMuFmblb8/ZPkEEmnaKaKQ?=
 =?us-ascii?Q?nnAyFokcIJp9+I2DeDVe36Ewrlztt+9ruBv3znoaikvQwhDVT2pNvnLH7/Gm?=
 =?us-ascii?Q?Z5EvB3928HrqI4OxGTB3QqrC08P5d0G58o44GbfbO+AVClRdyoF4ghgNeiZ3?=
 =?us-ascii?Q?XV8ekur56kkTXjhTEaw6VV19s7zb8XRt5iVZvEyP3f+eSU61xEr7NFDbn03W?=
 =?us-ascii?Q?gpirs+zu3NSgNfj79gMIDmg9LT3vdjAmUf2+VHQEbCxSlrIWHYCyz2+Qjyg4?=
 =?us-ascii?Q?w0TM8T5rUyaS5n1rxppGPYliQBVm6HBaiHwORczkxbnLIt1Fqvavlh6kRUQc?=
 =?us-ascii?Q?cjCIpmclN9T6+0y38i64cUe9jOrNHfTADtB43llnXWiMAzfq0QarBoyM0T8c?=
 =?us-ascii?Q?VlCknle+Br/BmOo9FBd2PRsn1NZZJVvCPxnUWdbm7+zHttfajP1rKB1TlpRN?=
 =?us-ascii?Q?LgIez2ppYdfYkMPYRC62kEx56rmwmtFZ+1d/mfChd339wVH3K4qLVdePNk9v?=
 =?us-ascii?Q?ioxlilWlOpUdZHtm84WtbeKtUwXW26O06i6C0gFyDQegFfaMDuT1ZJiriw08?=
 =?us-ascii?Q?QfKIYNrSR6vmdtTEZwa7Kc3ZJsYya4IwRJaCQLaV755Pcu+1Nzin70NqkV7T?=
 =?us-ascii?Q?Vk3zLFoG7ZxZiTJ1ity86ueRwdi3LAr+meWvrg8xDAXuhjw6yowHBIrI7ExO?=
 =?us-ascii?Q?uDOmnDDKhXzUZ8gLUirVoLLHwDXtWBhuETOjauQn/DY/Y4Vgq60kYnNRrV6d?=
 =?us-ascii?Q?u9Yt20hJHD2fBa7pmFv75ranW422utXGHNDzVHgJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98341c0a-a503-468d-9531-08ddd4cec51f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:51:09.5407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu7SLTPElj8heRj6JhaI0He6AQBPRZouhhpb+i/7ynMEp8KWLATNjZJavmROHHChOnz2+UJPn+MXV1bqMEUsqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8314
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

devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
NULL pointer, so use IS_ERR() to check the returned pointer.
While at it, on failure, return ERR_CAST(dp) instead of
ERR_PTR(-ENOMEM) in order not to depend on devm_drm_bridge_alloc()
error code implementation.

Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Return ERR_CAST(dp) on failure.  (Luca)

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..efe534977d12 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1474,8 +1474,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
 				   &analogix_dp_bridge_funcs);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(dp))
+		return ERR_CAST(dp);
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
-- 
2.34.1

