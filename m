Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B731F422
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 04:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119946E1B3;
	Fri, 19 Feb 2021 03:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2066.outbound.protection.outlook.com [40.92.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0746E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 03:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDU7QeeWJRQxEUnQDKAMrKiuEQmMvAOpWQqZiLYanyesCcgZupfwismM0ZIuIkqsRwthhSzuPg6hiLPzB1ykNSGJCm28w7GXY4kg56kpFx6LFTgdB+Assr7H9fcuOhpvQ4BmHxXZWETEPizsOucb6Jyt80QAoJhn+v7yhSCDWs1MbiA1inqGIEbtTNlmEvvus4vrAeEn/6NOTCkzKhEWHs1Xa5+lt07JaAQkidtJSJrJfpvkxkq1dF7WirxqZjt9uHMDgBYwG1J0yJ1/nrcLmxpuuB0ynaaVPtWD0yi5V08fTxvPLRxlG2AXfhip90NqRPksG+7f6TrBHtiduMm8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aEPlrEZNzkpLw4JAEoLcBssH5EUP3YzeF3Pq42aihg=;
 b=GvNiRS03xQH6PseKPUAFOnjNclFSr6NNmJM6gcfod0HhoPDVlC9L+zlUY5B78nNN2O5TiIhzYNia30fBMK3WQGQ9K/dkD9mktIpvzTVqV5t2Ul69FXAA/uZ/JtOr0eYc772xGvCeuKWJYFE0m2gv5OGn0wRZ7yLCwUS5PSEcywRctoaVpnJIwMSOSctHPx6w6tJH0fbHjzRkXYdyUeYONQ+t4M5C9RtTP/oNYMQ9N29nmqR80OV4WKKY/i2RizTJw2WYpPv6CK5wbh+3iO3HT0zRbeghbXUCBPI9VJDCTqVvtL7cCzHOGv3Rj0gt8remK04+c6r+Tn8oIL6JSf/qlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aEPlrEZNzkpLw4JAEoLcBssH5EUP3YzeF3Pq42aihg=;
 b=MvEH8s/bwpzCc36N+kYqtnLf935VQrILoVdpaf1srbTMJXZqRxKesegNU3MoLfLi3QOHDP086gBQDYbLcXxQJ9fCvS2FsR+XgH4o5yRSdyPqnSzNRNOrIEUBcuPnq4Um0o6Mb3VImT7ZYZdbnXaLgyuT90UmZIy7KfyzlxAxqh3JVRIHhCAaZ3Nu5VNNZ3TZELIEuccvgIyYM6HeEe1/7A7fRXITECqgkgLBYZMhLv427ubJZVUKBvEyYdV784/X91wWrVu1e/kLmNaqH5q5TnjaPqCVWgZS5yZc7grGVF92NjF4wCWPx96dtkT1vJ2LIRz5UaSx/A7G7bey8JN2ZA==
Received: from DM6NAM12FT021.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::4e) by
 DM6NAM12HT257.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::88)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8; Fri, 19 Feb
 2021 03:14:10 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::4b) by DM6NAM12FT021.mail.protection.outlook.com
 (2a01:111:e400:fc64::476) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Fri, 19 Feb 2021 03:14:10 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:FAD4ABBF874C82F965DE60C468641455556EC4DC8C260BDD54F2839157AD1A9E;
 UpperCasedChecksum:BB74A6932C01CFA2014DA031BA971F092734DAF476830044F9BEE94EF2334942;
 SizeAsReceived:7475; Count:45
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a%3]) with mapi id 15.20.3846.042; Fri, 19 Feb 2021
 03:14:09 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: tzimmermann@suse.de, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, ezequiel@vanguardiasur.com.ar
Subject: [PATCH] drm/panel: elida-kd35t133: allow using non-continuous dsi
 clock
Date: Thu, 18 Feb 2021 21:13:56 -0600
Message-ID: <SN6PR06MB5342F273F5DAA0DD24E89EA3A5849@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [Jx7zoVe3t122HNO3wrTqudGNTCbHNJ23]
X-ClientProxiedBy: SN4PR0501CA0098.namprd05.prod.outlook.com
 (2603:10b6:803:42::15) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210219031356.11905-1-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0098.namprd05.prod.outlook.com (2603:10b6:803:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Fri, 19 Feb 2021 03:14:08 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 59716c12-b152-4b65-6d71-08d8d4846c76
X-MS-Exchange-SLBlob-MailProps: zswcL9HXbeWhICPerYsZ52PZim4LrAkuTqgN2+NmZJ0AQG+vxD6E3tlRiIOpkRNG0ayROfvm7ujWIIHR2TeugsGNxuaxpXwvUGb0RrEuHuhw5Wa9eo5Q9atrhtZDArUX/7FZ082R/DlkHn80K41qXLtrEcLj+MbNlxSOjtm34Fy25JbpTHgtyT3Apgt97Ew0GN8mAgnnlqMZrTdf4erfyNgrtsCnjYGh4AE1kbRcS3bNgK+HA3lDXlAGo15M+9/SRWAyZ3bA9ukCBFnnptW45cRt/EC+ts5BO6CYS//NCoGMfM0Kuq9i0tQU46ZdZ54bcVCYoGsRlTN0v336c6sp4CIz/X1QeuDUH9QOPoJIsL1TtbVQY8Vo4H1Idh/MiZ4BSPIye+yMTOfH9F2H6VaRpg691mguo6jkzGzozuGYxPM89lY5QVEuqxhqQQ58+oF0quj61czwOoLv9ThtGuMsbp4ns4O5Up9OuH5G0b6IHfv2DLxjiCmOYkdcQ+41RJbAl9Wx0peG9332rpPfQJ4LNyI26RW70AAtrKio+cobMDwh2OikVEkOfrWkpTN0WVmqT6q0SxXqDB2kVAij39Hr4FaV7wDr/HVV6A/f42icpGWnpevkBhVrqx7qQiuoRJniOM8zUtmJPYVo+iqYNoGb+3/8kynA/Sc8IF47OGN8wWpm2/D7oKvWmxXOsvZWphu4Iyxq6+5FfuUWxbsQyyfjo28RApH1918hy2LfHAbtzZNHHtS/tLL69C5IGJ0f7y64
X-MS-TrafficTypeDiagnostic: DM6NAM12HT257:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3kSVyfOizcf0uQ6CzrvbK4tCerLKZgAkJyI3oqN9/B8IyrouFxo4CkUXBNucuMqrbM2h4qu8IGQ4D+rIZ7W3dBpM6ZSOWeb8U9nLEIpypzWU4Ts3xDK1l3uGST4+nN+JJYehfvBX3tDpUpab4Q1nxqhZLjciT423bvAaoZp9TNdLLC2ILdEuW4aLh+E3IhBF+FEvlYdVbsbsGVH4YDyZGspU27jnfE7H/bnFV1NGySyqGPFUFy+YktwKMJW9Ao2lXW0s3y/FarrA7G6MFNhcR8QYqN83mTwEZCF+nhW/JGKFRd/zn53WsDQbdPgiwjJdEj92hqdFNES9deOY0Yg6N4KmWqLfK2joTxYYz5O1N/mmcQZ7ccyHfEZ6ZNgAB0V8IFW9LNBzeU9OcsNXCq/9w==
X-MS-Exchange-AntiSpam-MessageData: Liv4//8yHriYZv+sitSv6jEhrF7o2tIOyD56Ulq2wF6FlBZAlCvp9pRiehXbiO7f6QuQ24WCVX4OXdWu7+9mU4MHaD7REUMSEt97UX5JRhzrr9KyE5mzesesT4AwORxjTHQx5hPL8nkenMC08AyeMQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59716c12-b152-4b65-6d71-08d8d4846c76
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 03:14:09.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT021.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT257
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
Cc: Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes an issue with the panel not working after
commit c6d94e37bdbb ("drm/bridge/synopsys: dsi: add support for non-continuous HS clock").
With this change the panel inits successfully and displays an image.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index bc36aa3c1123..fe5ac3ef9018 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -265,7 +265,8 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET;
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &kd35t133_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
