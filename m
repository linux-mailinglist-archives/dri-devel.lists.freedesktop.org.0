Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D42A8048
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED7A6ED74;
	Thu,  5 Nov 2020 14:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228536ED74
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O28JFvt651g1oT/nqb1TcnMv1wd/UqvyqRMqmQOVLTficCncSTI3l12e+Er0yT4on2V8J+aSrOw5091NBswXUwl9sxxsjnEOv7cLy/BafLDdVuVrJppgi/1a0xOInaU1f0wnYD5/GD6AVYF89qxDJ8efoyv3BZ+YNVv3v6SUjvGLjqfpTnIjJK6fpgPB8RSC7aK3woTa7lu0H0d0hYez+dpmsu5CAM2bwMA4txPuq2Vghj8+a9soB+V5ltZyVTdW1eZn0LckU1yWHnVZs4tc/z6oim8Pv09HVMfmj2fKSVH5+CMzIEdiDVznxXarb7XgGHhfuFIP4wWOe6IefcaH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9vob6+exkqWS69bcbRacyP8nAzMKeqPd6B8Ph05QXc=;
 b=On5TQZ4iJxxLWg9p4/1lsK7gyKlyejrQzqDkBdiKexmcTvto2ecQU560ffo4TOHLucBEj5OixqvJSWdStaOFoqPq0H2IRsgE0AQEM35SsTzQ/gu19iWca4hNlyjwgPUNSIO8+pneJ6mMbBFVnmVzgkJHVZD1x/0GUVYPNGqcW0hzfpf2pcKZPLUZ1LbnTxfCKZYBCufCi+sySfe/bN/CbW+RVh0x/YsBdV0fcRqHgzBXNk0WOVVggjhq0IfZ2apsB7fNIb4D2PlV5c8ZXhD9yfGZgkJItdHBx1N/+KwCXho0htPyUhh2sImwTU51O5vl6EmQ+awC4IQUijC5X8VgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9vob6+exkqWS69bcbRacyP8nAzMKeqPd6B8Ph05QXc=;
 b=X0MVHzAjU4o28HYRqw4CjuC0la+miAv/UU8Nnli9ZwDWE8sWOoZYKYz5pIlBlZqgpZRPAvmdv79Xfp4AXMaZk7lfUZ7SZ0GmleDvZrh06tz+hkbKED0fucksc7sSaTyj/YwPHZX4GYys/y+jmB+ZtjugAvHZa1J8pY3enufG8F8=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6783.eurprd04.prod.outlook.com
 (2603:10a6:803:130::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 5 Nov
 2020 14:02:11 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::f000:d709:509:bb5%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 14:02:11 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 1/2] drm/imx/dcss: fix rotations for Vivante tiled formats
Date: Thu,  5 Nov 2020 16:01:25 +0200
Message-Id: <20201105140127.25249-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105140127.25249-1-laurentiu.palcu@oss.nxp.com>
References: <20201105140127.25249-1-laurentiu.palcu@oss.nxp.com>
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR07CA0084.eurprd07.prod.outlook.com
 (2603:10a6:207:6::18) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0084.eurprd07.prod.outlook.com (2603:10a6:207:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.15 via Frontend Transport; Thu, 5 Nov 2020 14:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d13d25e6-b136-4413-3ea8-08d8819363df
X-MS-TrafficTypeDiagnostic: VI1PR04MB6783:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB678318433E98A2FA06054FE4BEEE0@VI1PR04MB6783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlrqEQR7nsPctIbtLukdMjz1rlHOH0lGFpoWZs2hONyvB2i9VjE6BaGzUTQPf4DvwelAl1R0BbKPA0N74boLfuByx1IJdcoAqqjDDzErub/HBGWwgEjkwp1rxko8d42DHTbgcEsAQSafWNiCMH/1Zues0wfAJxKJ7VglkLjBDpB9NxcwfYMlNQkeTHIZ2BxIIQJY5IR9Xx7vMo2uycF1FV5FQxREWFj1pcPv4bHyQ4UiPuwetl76KH2VK5Onj7cQufUXkCRGKaQP2gfacElHieXpYQGE4dubST8JmDRhq6vL9larZphfxq5sDNbm2GVtrdSyMyy7DOYYzd7qBujPNoWBzLe4YPE6McHsgGbE/xs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(8676002)(2616005)(956004)(6512007)(44832011)(83380400001)(6666004)(8936002)(66946007)(2906002)(6486002)(66476007)(66556008)(7416002)(316002)(4326008)(52116002)(86362001)(478600001)(5660300002)(1076003)(6506007)(186003)(26005)(16526019)(110136005)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yOgm+zg2p6koS7k/ttomf9tyMGiNNAXnrZt6FgwCzilifNVu7ptKn8hvt0jOFL9IGRs6dnZeH0xRLJAvowTA43o0cFruIqa/WchF2TiNAKx8Uovf5dlQMgwAKpUKutgEuFH/6msO1okmER/pV1AYD1JL7zHGvqHnLENiGiX7xfQ1pwMvoWA1GpPONVsE2Z/RczAiOi8i6yiqdRR7ED9KjKNKqcdt2sqE1mtt6uZ12e/HT9oaTaDOK8QoFqSTb5fP6UAr1rJxXbjr4wOsKgZI9tCscyPnQbr95uuuQm00BKtPNzsBIAorxsSKrHC40aXfm7vyrWhj+C4q9csg4SRjXxrwN9D7CI7pciCYDsjT495EAJrmo9pTeMWvMM81yIc+NeI1fApfFsKPYaX77RZ8MT4UW99FCwCgWRje8ULWsdX8ggl3E+K7iauYJdLAcQNTrdS1CwN93GS2FdN3Fhexi5eL7LKxKmKhIagUKtkjUtt45WasjE2MWaEWLi+RjZM6B6og9bseX3GhH5P0097JQnp2hQ7xOhGq1n4W31Nj1tAnB907+zj/hty4ipqGhv6hJ5nP2kcRLWL8Kne6zoMM/By6WH2zR5f2b/vUI2GydcG+RKZESYdH2frtiktWVGtNcGN+XyyagNLt95B/r11WWQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13d25e6-b136-4413-3ea8-08d8819363df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 14:02:11.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26aq0Yg/L3Ggmig1mplWKUwjQXbwDHjLV5ms+vTUD7ZUv6zxuOXCxmRkGUQ3AM+rzIm3TDEQOQIsG71y0xmBMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6783
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
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DCSS supports 90/180/270 degree rotations for Vivante tiled and super-tiled
formats. Unfortunately, with the current code, they didn't work properly.

This simple patch makes the rotations work by fixing the way the scaler is set
up for 90/270 degree rotations. In this particular case, the source width and
height need to be swapped since DPR is sending the buffer to scaler already
rotated.

Also, make sure to allow full rotations for DRM_FORMAT_MOD_VIVANTE_SUPER_TILED.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index e13652e3a115..46a188dd02ad 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -111,7 +111,8 @@ static bool dcss_plane_can_rotate(const struct drm_format_info *format,
 		supported_rotation = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
 				     DRM_MODE_REFLECT_MASK;
 	else if (!format->is_yuv &&
-		 modifier == DRM_FORMAT_MOD_VIVANTE_TILED)
+		 (modifier == DRM_FORMAT_MOD_VIVANTE_TILED ||
+		  modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED))
 		supported_rotation = DRM_MODE_ROTATE_MASK |
 				     DRM_MODE_REFLECT_MASK;
 	else if (format->is_yuv && linear_format &&
@@ -272,6 +273,7 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	u32 src_w, src_h, dst_w, dst_h;
 	struct drm_rect src, dst;
 	bool enable = true;
+	bool is_rotation_90_or_270;
 
 	if (!fb || !state->crtc || !state->visible)
 		return;
@@ -309,8 +311,13 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 
 	dcss_plane_atomic_set_base(dcss_plane);
 
+	is_rotation_90_or_270 = state->rotation & (DRM_MODE_ROTATE_90 |
+						   DRM_MODE_ROTATE_270);
+
 	dcss_scaler_setup(dcss->scaler, dcss_plane->ch_num,
-			  state->fb->format, src_w, src_h,
+			  state->fb->format,
+			  is_rotation_90_or_270 ? src_h : src_w,
+			  is_rotation_90_or_270 ? src_w : src_h,
 			  dst_w, dst_h,
 			  drm_mode_vrefresh(&crtc_state->mode));
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
