Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48671EA7CD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 18:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA2689DB0;
	Mon,  1 Jun 2020 16:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E5689DB0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoqi+AI33dGIZUwFuBH/jamLEe6EMcWDqYAqon3hK1o=;
 b=I6+t3nHoWS93NdaXyQahgepgyc0qUgT+yPFI8zlpHaxH2GTAWemke+/rqhPfM/zGyCBKPD/BQjxvdB2SWO63f1Y2/Pdod7LlcE0dyyuWk5idT9cpamdRkh+KS9bE7bJcI+hDcVb0QjtFDf8EtYa18NENk8MQNWcsxz2qMv++a54=
Received: from MR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::32) by
 AM5PR0801MB1939.eurprd08.prod.outlook.com (2603:10a6:203:4c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Mon, 1 Jun
 2020 16:28:46 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::47) by MR2P264CA0020.outlook.office365.com
 (2603:10a6:500:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18 via Frontend
 Transport; Mon, 1 Jun 2020 16:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Mon, 1 Jun 2020 16:28:45 +0000
Received: ("Tessian outbound 444e8e881ac1:v57");
 Mon, 01 Jun 2020 16:28:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6f6053877f3b3df
X-CR-MTA-TID: 64aa7808
Received: from 5a1c34479bdd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BFB8185-F1F4-4C07-8DF4-42F9493894E1.1; 
 Mon, 01 Jun 2020 16:28:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a1c34479bdd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 01 Jun 2020 16:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCCqbqT+x1+ulsG2ynv44vx+JswMyXXbsstULpnu5uPpfyK1GFcgm+fDeKHgf8oHUbF03Comf3j68Msh9Wao7cWc9Fn/pcsfrRvltQVMaYrj4zIKoGk+KTN2EqnnCO37/fUM60aJVjgyQSsT/ghkWwp3MJiXsYww/P9HCU7syTSd4ad/Z+E7fTyX3og6GoPd0RJqrDBlk7T/sVBplfKQcbvhvqqC2fHmkXlezsMp+IEEnr+Gyyb9BAGWne/B6tgC+tl69Kh6BNUhHv2BbUmgyGBFLH4J5DlGZADf0jstRlPO4NjGsIoKjpjY/LoEGzDNe93sNtRrO57zgdBv3YxAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoqi+AI33dGIZUwFuBH/jamLEe6EMcWDqYAqon3hK1o=;
 b=icFlU846qcHrE8rL1+Bh5EqyacLoN0rCwld8xPtKAV+SpPK4Ih+lGUqdP4xqXLuo/05qWUlUOsjqy4vCqWtSKn7nVQKMJj3PQmGOzmgdBGXd3ShSD12+Tn5GxicNmx/gPYSA5YesDTGV9WQfuJ4QGLhE857u8nu7NoE4iqcjeirMMqbnI7uhsWlz/eAs8qKh+QStXnyX5c+PjgUxQzuWbk6tq5nq+MWPJcsWqjrJek1Am83gSix7y26qpn7mdZan1Kj7WaIoHy04tEXf37bc3oNaJwoGVGgDoBKs8BHas2eeMG3vRyWmHcziDxjLgqwNmth2puc7K/7OTLRdjkX0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoqi+AI33dGIZUwFuBH/jamLEe6EMcWDqYAqon3hK1o=;
 b=I6+t3nHoWS93NdaXyQahgepgyc0qUgT+yPFI8zlpHaxH2GTAWemke+/rqhPfM/zGyCBKPD/BQjxvdB2SWO63f1Y2/Pdod7LlcE0dyyuWk5idT9cpamdRkh+KS9bE7bJcI+hDcVb0QjtFDf8EtYa18NENk8MQNWcsxz2qMv++a54=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB4422.eurprd08.prod.outlook.com (2603:10a6:20b:be::13)
 by AM6PR08MB4581.eurprd08.prod.outlook.com (2603:10a6:20b:83::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 16:28:38 +0000
Received: from AM6PR08MB4422.eurprd08.prod.outlook.com
 ([fe80::75cd:1275:8ae1:b3e9]) by AM6PR08MB4422.eurprd08.prod.outlook.com
 ([fe80::75cd:1275:8ae1:b3e9%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 16:28:37 +0000
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Date: Mon,  1 Jun 2020 17:28:17 +0100
Message-Id: <20200601162817.18230-1-ben.davis@arm.com>
X-Mailer: git-send-email 2.24.0
X-ClientProxiedBy: SN1PR12CA0087.namprd12.prod.outlook.com
 (2603:10b6:802:21::22) To AM6PR08MB4422.eurprd08.prod.outlook.com
 (2603:10a6:20b:be::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e113060-lin.cambridge.arm.com (217.140.106.55) by
 SN1PR12CA0087.namprd12.prod.outlook.com (2603:10b6:802:21::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3045.17 via Frontend Transport; Mon, 1 Jun 2020 16:28:34 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 472142e0-6ac1-4f5f-970f-08d80648db56
X-MS-TrafficTypeDiagnostic: AM6PR08MB4581:|AM5PR0801MB1939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19390FE64315BF385CFFE3C3E58A0@AM5PR0801MB1939.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:525;OLM:525;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rg7AvaqYf0lzC+Pb0NKb7915N4s/dbnJWv5EGzzsLYunVog2zXBB7baX4d1aGxBr2xkFgsYwAvCYpbViXC4JelCMnytVb2UlfI4nZ+EA0Rnv2e4emR48wQTtJ7KX9SwIZbSf9vjcM5Fn+3cyZP+JPPHYuyuUxK3iG0TQ3pR/ivqAPSsCSY4o02ocIuERRYjittExbuWkV983NamB1UxLHmFuMlxy3ObIa8XyhWb7AluCdaBtOoQsh0uVn7Gnft9wr5J2Mz8KZqcgBjxyzmy5XoAE9rkBMRGmtlIp8RmcE2J1pRbHdjoUIWi5ZKs4ytey
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB4422.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(2906002)(86362001)(44832011)(36756003)(2616005)(83380400001)(6666004)(5660300002)(956004)(66556008)(66946007)(4326008)(8676002)(54906003)(316002)(7696005)(52116002)(8936002)(6486002)(1076003)(16526019)(478600001)(186003)(6916009)(66476007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: AjkntPs9wAfMc4w/Q2SdkjdXrwQ3Rd7Tq4fNWYUylQQcf2cb7l9H0OLJvrKULX07aHsKFKTzkGgmFL2byxNVYNj8Ni2fHOEiOZAdpCipCov4clk+dOEY7C/wS/W/BzAtUnFw9ekcvV8H8OWsCcYeCHy9GJsBX+ItVpF0HMk8s9hD1l5j7YyuZ8u9P+V4gjlckDNkm8DD5kG/UaANmbO78hQGB/mQ8zgY+fooPeoyAkU3qFOX1CDn9Zeo7Zp414b4DzZp4kn3d1XPjxwNHSplsFLw3jXl61xuAD4rooTEgTABjbClWDEYchtyAAk17OrKO4CXzXeumwcDDRiRZeCjTs331A6oe7ENV+PvLFGnmRYdjqbnglW2k84yg6koxkEzLIEokloeRff/3Xpa3eeVaOJoXmqSrH4w2lA3acImBd3Jurup9feGvUNOtmBbcWuwweFBxAQhWU6qEAdg2UIoBhNTtsg0dJ+5O+lOnl1AvQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4581
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(7696005)(86362001)(70586007)(70206006)(478600001)(4326008)(107886003)(5660300002)(2906002)(8676002)(6916009)(356005)(82310400002)(956004)(2616005)(83380400001)(44832011)(8936002)(336012)(6666004)(186003)(16526019)(316002)(26005)(54906003)(82740400003)(6486002)(36756003)(81166007)(1076003)(36906005)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 536c86f7-588f-4bc7-d626-08d80648d632
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gEKbvSJK4oJ7toQowoCK/0OC1v+2OesUsyCX8TpcF6ojgJV120836EyLgOWM0LegJ0AQCztq6Nj+pGUFc4NVJhyHYw7AaYA2InaRkiS8K6LwsGClv3Qf4E7AzhjZ0k00jZmDX5SPsXND0ulWKsOcg8NfKnQoS+c47sC0nYfSJyAhuDakehKmyvEyqn15X6ICd+4eNafm7qskUwfk0RakJqL3Bmn92tWuqRW50kvCtqmOOIHlCMyddCt5E7htzP89rd5g3yKv3Ssbw1a8v0oVq1SyhtBCGHN8c7LE8OHeLcx/XEOqkqQbPyMvTqqkENpoUQFEbbKtCGgMs4J+E46C+Ygia7DPOnVvZ/Yms9vp5cNhmgqgE+WMYZEFJlokNXn25mtoHOrJGzwW17i1/Ups7Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 16:28:45.9142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 472142e0-6ac1-4f5f-970f-08d80648db56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1939
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
Cc: tzimmermann@suse.de, Jonas Karlman <jonas@kwiboo.se>, airlied@linux.ie,
 liviu.dudau@arm.com, matteo.franchin@arm.com, nd@arm.com,
 Ben Davis <ben.davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16
block-linear memory layouts (DRM_FORMAT_MOD_SAMSUNG_16_16_TILE). The
format is similar to P010 with 4:2:0 sub-sampling but has no padding
between components. Instead, luminance and chrominance samples are
grouped into 4s so that each group is packed into an integer number
of bytes:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '15' suffix refers to the optimum effective bits per pixel which is
achieved when the total number of luminance samples is a multiple of 8.

Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
component, but only 10 bits are used and 6 are padded. 'Q' is chosen
as the first letter to denote 3 plane YUV444, (and is the next letter
along from P which is usually 2 plane).

V2: Updated block_w of NV15 to {4, 2, 0}
V3: Updated commit message to include specific modifier name

NV15:
Tested-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Brian Starkey <brian.starkey@arm.com>
Signed-off-by: Ben Davis <ben.davis@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
 include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index b234bfaeda06..722c7ebe4e88 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
 		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
 		  .is_yuv = true },
+		{ .format = DRM_FORMAT_NV15,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
+		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
+		  .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_Q410,		.depth = 0,
+		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
+		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
+		  .vsub = 0, .is_yuv = true },
+		{ .format = DRM_FORMAT_Q401,		.depth = 0,
+		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
+		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
+		  .vsub = 0, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 9e488d10f8b4..bed51236aed9 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -236,6 +236,12 @@ extern "C" {
 #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
 #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
 #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
+/*
+ * 2 plane YCbCr
+ * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
+ * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
+ */
+#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
@@ -265,6 +271,24 @@ extern "C" {
  */
 #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
 
+
+/* 3 plane non-subsampled (444) YCbCr
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
+ * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
+
+/* 3 plane non-subsampled (444) YCrCb
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
+ * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
+
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
