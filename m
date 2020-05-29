Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49D1E7C3B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 13:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521456E8CC;
	Fri, 29 May 2020 11:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00080.outbound.protection.outlook.com [40.107.0.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7806E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzA0OqT3i0qCEf0y74XiIyq2CYSDHbUAbgtNcxl/XgA=;
 b=h4E2ILOCqJ0iBf3fPggkEv/1Z3UwWMFVtmurNO1ntvGzZ13JwDGeFDhC6NNfXkaRxg0p7IXd/kBgRBt5tDYTeweHdAotqKAaMud+fjSmdZZYfAcH4eakaTyUoH7BObswAsK1s3Hf+A8/EL6LFcghr3KMZsT3uuWilX2An3mYR0c=
Received: from AM6PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:f0::20)
 by DB7PR08MB3482.eurprd08.prod.outlook.com (2603:10a6:10:42::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 29 May
 2020 11:48:07 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::f8) by AM6PR04CA0043.outlook.office365.com
 (2603:10a6:20b:f0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 11:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Fri, 29 May 2020 11:48:07 +0000
Received: ("Tessian outbound 9eabd37e4fee:v57");
 Fri, 29 May 2020 11:48:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a356355ca06b4861
X-CR-MTA-TID: 64aa7808
Received: from 0e903e70ef46.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2CB0A95-FE6A-4557-BFCE-BAFEE2C883B7.1; 
 Fri, 29 May 2020 11:48:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e903e70ef46.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 May 2020 11:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahrD+iatpAOFMXFBrasyWPctm1rGDHRGUpLuwbJB3N9up+We9Yfw9QTzRz7r1INKNe3U06aCjhVziDLhJnRSkRmBjxvpVjv6OymdPRIH+hHneexwKISUtdrYGL2kxTn0W6XpWBD+mwJ9Tq8GkrugWgaKCZCudnF1ALuJR4TUMzSKUfV7RYjvclE9nW+zSVasQTkAZhnxVV0gtZNq8kl2xEOwe8OJzWlETNqsPaxlqhitApKZTfU6Xh/torHkjq75WqQJ6e3V/sFZf0N06gB5QuGCOSk2qvZ2oxfSDcRH9HNXgyzfI8FhQlF/szUnm/g7aSE64/CzjuYcow+2zrsfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzA0OqT3i0qCEf0y74XiIyq2CYSDHbUAbgtNcxl/XgA=;
 b=Y4vkd7rzS37ORzTkSN8ckgmldJUg+6W3Lsg763dRvOj19ydHJSPJS+2kjSvOY9jz6kIbJH7Hc8B6tVfn+74/NLOgPCUKQRx+OGgv6LZd9lTcXdh1vjCX9e97MIsxYtAVZ9M+pqPDGDMsstki+QSWut5EGyifPwwlEUdF5evDnjRZE27OhfDNqW707tRlD6G3P7unDe4iFaQq0cTatLXICAdH52vO4vhThpxfjOXwtYLDTuF3cjLQPMA57+UE/SgvKUqXcwh0/cltwHeXjx1rww60pk1X2LdrLkadtNXcfs3BIScFiLlVh+Z+ikKUElTMwplwafz83Ak0zy8K2GzDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzA0OqT3i0qCEf0y74XiIyq2CYSDHbUAbgtNcxl/XgA=;
 b=h4E2ILOCqJ0iBf3fPggkEv/1Z3UwWMFVtmurNO1ntvGzZ13JwDGeFDhC6NNfXkaRxg0p7IXd/kBgRBt5tDYTeweHdAotqKAaMud+fjSmdZZYfAcH4eakaTyUoH7BObswAsK1s3Hf+A8/EL6LFcghr3KMZsT3uuWilX2An3mYR0c=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB4422.eurprd08.prod.outlook.com (2603:10a6:20b:be::13)
 by AM6PR08MB5238.eurprd08.prod.outlook.com (2603:10a6:20b:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 11:48:00 +0000
Received: from AM6PR08MB4422.eurprd08.prod.outlook.com
 ([fe80::75cd:1275:8ae1:b3e9]) by AM6PR08MB4422.eurprd08.prod.outlook.com
 ([fe80::75cd:1275:8ae1:b3e9%5]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 11:48:00 +0000
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Date: Fri, 29 May 2020 12:47:26 +0100
Message-Id: <20200529114726.13926-1-ben.davis@arm.com>
X-Mailer: git-send-email 2.24.0
X-ClientProxiedBy: LO2P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::22) To AM6PR08MB4422.eurprd08.prod.outlook.com
 (2603:10a6:20b:be::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e113060-lin.cambridge.arm.com (217.140.106.55) by
 LO2P265CA0010.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3045.21 via Frontend Transport; Fri, 29 May 2020 11:47:59 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 289106b1-be6f-4175-b728-08d803c6276a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5238:|DB7PR08MB3482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3482CFBE00DCDD2B8642B9FEE58F0@DB7PR08MB3482.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 74BGobVnSaQC/1bRP4FurAtrSSoqW+DT1d34rZFbTYIKaKtKWVPVnlEG/8nGUO3kUtv3UoH8tQ3beCnEdikKcG+ajnHoozEuV8RSYLtehNyMFZ+XT/gwjhTFM+nOXQn9QVUgJFT3nrShuEnA7eLeYHy//ccusjZofRhQ8knim8hfTSYnUaZ6bJyynwLd7OPW/bafIjRNz9KWxG6uNm9o/nbUbK0jWoSPjuagLUZNvAMBz2W1m3JfTuNf/8J4DNAulQUAZ7BL/KG8Nu1I6IeVQ07DjJK277IyvQla22yvoBcksCvcTaFxmtJy+LN2nJdF
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB4422.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(8936002)(83380400001)(6916009)(2906002)(186003)(6666004)(316002)(478600001)(36756003)(54906003)(1076003)(26005)(66476007)(66946007)(86362001)(16526019)(2616005)(6486002)(66556008)(956004)(7696005)(44832011)(52116002)(4326008)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3bDVo7zfGhe6DxpRDW6yy2dhsBKm9OdrS1mAgCmkvBcmleMAMnbWKtc0hmcS5Sp+ACiXeodfZSe8xmCfkTkHn+2Zx048b0sd+mCRvU+LCI6jtQ4XTvwjg0WhrCEviD8Nt0puPREnz+Bktutd1GigsHis1AjVNwkDXtK/SuBQ7obFtzKqxE9I6qYrHLGVtNBjGdXfoSv72aCao2GIXgnKcjVpGjI3T7AoRpozsiyEXdZg4I9RFgxHm/+1jcKBRpyVFc1JRHhjgzOb0RJqLW8/z8XtPk8zD3M09GnoQKt/8qQ7fm5WudHoiqyhPO7guGnFP9fIN09ddOQuo1ke2keQUDJLTJimA9+z9lBCInVEG7REpg+4c4RBR7lYOBqdUtij+GlE7gRymYRw7NHrucE+q1YNJSm88+rFe1DtfJWFkg6CGiuJHjUzcei4hZN/9bSY6sAhaTO/E4IjnRj3QVXhCLa5hsqivyFgGoNW4nRxL54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5238
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966005)(7696005)(316002)(8936002)(356005)(1076003)(6666004)(8676002)(36756003)(36906005)(2906002)(4326008)(54906003)(82310400002)(107886003)(83380400001)(5660300002)(6486002)(86362001)(478600001)(47076004)(336012)(16526019)(2616005)(186003)(26005)(6916009)(956004)(81166007)(82740400003)(44832011)(70206006)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 234b342d-c17f-4453-c06e-08d803c62332
X-Forefront-PRVS: 04180B6720
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBfaXcVGFAsd81G2XT7old1yUP7rcq/I8Qilg/u8f9lT9mWtRsDfp6GDCvx/Bj8ToGO6xXEX6gIIeUXYF/+7D/Ao16l31p5K42Q+i2EQftEJSqeekEz5dJMRuz8Xxw/WLboXCSiTscsCzHwJtByr2KRC7bhx06RcMSxiNAWGmhpYJimIIaRSDFeCYGi747Hs6lAPi7MsukG9BdsDve99XEB7Na8sXNb0kzaISsE3lF4hhLf9xFLC1UzBQ4ojolCrBwMs0dlGJ5qWFhY3BIgZQ5LbG9AA4qzQHHlHomr/2baoSTtVpTtpNsGWUzRjBXlTvdP1g5UD/7yHo8Y8ieTtstexHrTA4wYQxemmOpXw2gioRj7akMBdyIoP0EF+vvxm8cjVHxlJIsRCZDRItLv5Rg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 11:48:07.2028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289106b1-be6f-4175-b728-08d803c6276a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3482
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
block-linear memory layouts. The format is similar to P010 with 4:2:0
sub-sampling but has no padding between components. Instead, luminance
and chrominance samples are grouped into 4s so that each group is packed
into an integer number of bytes:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '15' suffix refers to the optimum effective bits per pixel which is
achieved when the total number of luminance samples is a multiple of 8.

Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
component, but only 10 bits are used and 6 are padded. 'Q' is chosen
as the first letter to denote 3 plane YUV444, (and is the next letter
along from P which is usually 2 plane).

V2: Updated block_w of NV15 to {4, 2, 0}

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
