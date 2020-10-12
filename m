Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7B28BE30
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 18:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615AA892A8;
	Mon, 12 Oct 2020 16:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2068892A8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI/R7FszYqDYGFpHo4EV1quZdDfYX6DtzMoBbasU9k4=;
 b=qIie8d9yoyGZZvivEqNWLHumP5VnhsC4zkf7Dygf5I6IFcjB6oT8PZiGm2tqzj5fWrg1yAM0bLm9ba9p3ZydqYauS9gnVwQZl5Pf8L5Lhwc2qL4atWrP2YpPBJbJfplZ9LRo2oXh+X5aZHPx/AkLeH5dQPbIcw25QdaFfLVo5YQ=
Received: from MR2P264CA0183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::22) by
 DB7PR08MB3515.eurprd08.prod.outlook.com (2603:10a6:10:50::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.26; Mon, 12 Oct 2020 16:42:08 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::fd) by MR2P264CA0183.outlook.office365.com
 (2603:10a6:501::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Mon, 12 Oct 2020 16:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 16:42:06 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Mon, 12 Oct 2020 16:42:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea9e987ab417e9db
X-CR-MTA-TID: 64aa7808
Received: from 1d70988bec98.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AAEF01F-36C6-417C-A8BB-F90F2387EE67.1; 
 Mon, 12 Oct 2020 16:41:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d70988bec98.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Oct 2020 16:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB4ZAlxGa6ZRyqqMnb50i+o9ogXnWjmAtZRqZBGkLw4uEMM/3SbaQAZQTavEigkjFIHQ7P2rbKRuHNNtvaAeWGUAHQdHCJ9lOpe4yw89BJnjWF1Yxrtky8ITqPy9kv6l+keUHP4vnaLXvs3PWzuRTOjKWFKOMM1bHXMZQOBKw9sNNrxemE+b9Mlqqqk3bbjXrxA+ZzDsTwPgr4cozVCLAvtfII85tFxecRR51UmVzCKdSCOlpCN2PJ9AkB/h3ukvlBAPnQoKOw3ecSlPiJ2dbfY0/eb4sjTlMnT0Dbz5udELkS5ERKNJGaNSxH3bK9yJDgA0iF8/mfP+9ZMn3KuL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI/R7FszYqDYGFpHo4EV1quZdDfYX6DtzMoBbasU9k4=;
 b=Nuh5n4Km9CZh1YTtpUOjwV4IYi4iv2WwgkaoUJsn1CicmCTmFnco9LVNUPq/f2pN6I/qxi7fSfTNGwBmizyOumsGuZjnuO5hGgDzhW7/EsP2E8wSy5agmjuxybRyrXM/oJfw9vgKTTZA5hN3dSs3yp7CH+g0sxPvIeCXy3yYcJ44CXVP5kigWSes656zbVe9cj+s4sxqbgZeGtWQwGDUxiVZZZvGjWyeX9zFrjDo3VXXANY7Jdbx8kSZv4ze7jfATmw0MWIEVkoG5OajxqLSu1hqz/8x1jSMcWIDqCjPArjSVab1En/zlHD40dHEScqSwLJRASOXOc4yMlg6YWv0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI/R7FszYqDYGFpHo4EV1quZdDfYX6DtzMoBbasU9k4=;
 b=qIie8d9yoyGZZvivEqNWLHumP5VnhsC4zkf7Dygf5I6IFcjB6oT8PZiGm2tqzj5fWrg1yAM0bLm9ba9p3ZydqYauS9gnVwQZl5Pf8L5Lhwc2qL4atWrP2YpPBJbJfplZ9LRo2oXh+X5aZHPx/AkLeH5dQPbIcw25QdaFfLVo5YQ=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com (2603:10a6:20b:4c::22)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 16:41:57 +0000
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56]) by AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56%6]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 16:41:57 +0000
From: Matteo Franchin <matteo.franchin@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/fourcc: Add AXBXGXRX106106106106 format
Date: Mon, 12 Oct 2020 17:40:43 +0100
Message-Id: <20201012164043.23630-1-matteo.franchin@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: DM5PR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:3:ac::31) To AM6PR08MB3653.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lagrange.cambridge.arm.com (217.140.106.51) by
 DM5PR21CA0021.namprd21.prod.outlook.com (2603:10b6:3:ac::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.3 via Frontend Transport; Mon, 12 Oct 2020 16:41:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4656db2-efa5-4ee2-dc49-08d86ecdc157
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|DB7PR08MB3515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB35157A6B39DDDE54F6441F62F4070@DB7PR08MB3515.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:222;OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LmFHmkSK7HZZ3Rs/MRCdtflKTC3K60Kn51xbyPygHUo0f/wkOECTm+huF45S76VLGy3ErvmeXP0qsmdZcjwV/qXJSXOXmdUJnyV/guwB1mi3f8CVAJvfH6OxEblKxTSVp7dnb/L+yKqFwuczZDbU8rbQ+tEqp+xaIKnSnqA9wwc7a+pTfuAK0h++v0bhkZf8aTfFDsnnJj0ii7kYJOZk+Iy8sd+pKqiqYk687hfRTzEsJAfRdsprvsmy3N2MV4EgtVtVzeYpzB2JSBYol22XHeVKi0A4CmIPz/JJTQ9ccEAAVXDXpXShXii79TOuQ8QLStc5BQ4fbTjT7osbDHSU+w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3653.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(6916009)(316002)(66556008)(52116002)(44832011)(7696005)(26005)(2906002)(66476007)(36756003)(6666004)(186003)(16526019)(8936002)(1076003)(5660300002)(2616005)(956004)(6486002)(4326008)(66946007)(8676002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YtVlETn5xaTfW7+ih/VoN+cYaimDELl6a3HdfyCQapIjkg6J4gzBtda1p9ym3/v0OewsHRUYOl5Bxlw6ttfL7QBNTzUrWB+hz2utUXMpZcocypG990dofe7gjDN8W02IShofqmV+LIWoTjvE9n4B3kgL+fTJY3eiYaA7TBXwOCIO2IN5nk1p6ezJtKjnRAmp6rYvaIrrXPE0tuMejhwOOpdToflxtsB7arMy9L5FrmeQO7/Jd6LMEsLWeXLXhTpPmIao7nbFzaRvgAplnDGvO9RI4yLw2pfJempnHedQTNMzkiTTMr9cvazd/XloQWpQvBwXK65rC4wCTU0J8fW2u+DQg+12o5YiJHuTpAwJrNYN0MmS6h+Y+utoRZkZe5tjZC4P2k6fHOBSoCE+UDrOoU3qTXQZHAYCFZUdchTLI40X28IH0yR4XXcOsXTPWGlf3SJEhNLXLC9FCQIqFTMJv3VUvYgBKx40hF/sp1mILGX/aGTHk+X2WZGVbxfCvCBP/FGQZmiGibpgpsH50XpnZXoNQAMfOoLwyubcUbhNfJUKxRnU4YBhhhbYNiVE6/y2VzvrX0PLhxloy8JVluB7s57b8ine0JNju/FdjZx2nwBW1w+d4e1DdIWXYnlVK4F37p7tqW7aI0hWl3RUbsReqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ecfdcee7-0732-4d9f-103e-08d86ecdbbe4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTUWzxAXtdxUrdK77L+WzTXU83lQWCqjIXqlR4q4XUEFFJ4wh7Qb2az0AEhVI1x8Z7vMAGsjvlhaRN5J4KlpdVORtobJF5ZTCsw0jL1OgBP2KpjMPs8M6tOXhsOfOllMYtcr9eQDuxOXIPDlfbs69vrgCFSYYzsg8tl2yyeqL2pLjo/msn4nEwWqhQF6QQ0TSBhU4HoPtxKHssLJNGK2qfZxxPnF5xhKvskJuJVNy9KzQ7DQFKZysV9ZCrWt87LVIDeYR3aTOol2Vbm24hqbTmU92cpJG6uVu/jibYac9fiF1GE0fLnO7GlYwShKe4KvvOX0xmUUceeeHVbjzTSCx4osrtnyYmLp/+L1zNMagYfRILp2DZwGRVZp3ch146jdUhPcpUp1joHK9ssKizoGkw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(2616005)(5660300002)(186003)(6486002)(316002)(82310400003)(86362001)(82740400003)(47076004)(44832011)(956004)(6666004)(8676002)(70206006)(6916009)(336012)(81166007)(4326008)(478600001)(7696005)(26005)(16526019)(356005)(2906002)(1076003)(70586007)(36756003)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 16:42:06.2957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4656db2-efa5-4ee2-dc49-08d86ecdc157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3515
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
Cc: tzimmermann@suse.de, airlied@linux.ie, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, Matteo Franchin <matteo.franchin@arm.com>,
 joe@perches.com, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add ABGR format with 10-bit components packed in 64-bit per pixel.
This format can be used to handle
VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
architectures.

Signed-off-by: Matteo Franchin <matteo.franchin@arm.com>
Reviewed-by: Brian Starkey <brian.starkey@arm.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 722c7ebe4e88..03262472059c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_XBGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
+		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_RGB888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_BGR888_A8,	.depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_XRGB8888_A8,	.depth = 32, .num_planes = 2, .cpp = { 4, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6f0628eb13a6..d720f1e8ae5e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -179,6 +179,12 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+/*
+ * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
+ * of unused padding per component:
+ */
+#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
