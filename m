Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD071B42E7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 13:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023D96E3D3;
	Wed, 22 Apr 2020 11:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10044.outbound.protection.outlook.com [40.107.1.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB616E3D3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOq0uuO4kMwFPQEfm+46BzvKif9xZwk3W5NIbBBg3nM=;
 b=CUcD1qdIW5eydSAoYzqir7OL7frSi4M3RCP0b+FztaqaHt9OK3F2T+75RcTHUjeqVz+EgFQ+8BA8nhqfd3S12jySBfz903/aWWWkpuuj6KXIHUYc3Xqry2exIAzorprRS8pzzUxD0N9Bn+k86x7tyQJNr5EX8jUI+d/mU452YzM=
Received: from AM6P194CA0090.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::31)
 by DB6PR0801MB1672.eurprd08.prod.outlook.com (2603:10a6:4:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 11:14:27 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::77) by AM6P194CA0090.outlook.office365.com
 (2603:10a6:209:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 22 Apr 2020 11:14:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Wed, 22 Apr 2020 11:14:26 +0000
Received: ("Tessian outbound 76e9a4cf1540:v53");
 Wed, 22 Apr 2020 11:14:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c05b033f11a3095
X-CR-MTA-TID: 64aa7808
Received: from 628c18dda771.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBD77846-D88C-41A9-A6DC-466907678D87.1; 
 Wed, 22 Apr 2020 11:14:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 628c18dda771.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Apr 2020 11:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgDAEORHnBBcoxOuAYt5g0wldXzIWZAJLJGfPDTRf7cx6vTPazmcia4YpJ3VHYkqyLqKwYWUfpQrrUJ7QRb15yrWIWT/mQdpglLdWoS0FEcGzHhMQpJQoBvYk1W9nroQb47UTbpaGhpt2T8lNWog2VVLCKlPjUZ1SuYU+gClXv7142k2YhM25BeoQH01ZWoSJwZNWozLk4heVMhBG92cZ8R8DdlBmsNoUOtvGKtgzlN8RnNyIMNY3nHJk+8GQDAIuOmlITfZzP6IpSuH/2Tnf15BKNVkZ1Y2KZe8AGAST0q9wgVWjfaDGyFIpwBdjlDOx7Gz/LlAWnwPEwtvp5gipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOq0uuO4kMwFPQEfm+46BzvKif9xZwk3W5NIbBBg3nM=;
 b=mB8UnHUKMJV77b2WOz3V4+aeY7ACd8fvPUqLaaT47UQ7RSp2sw2Lp7XR++4O9W+TB8+hswjWiMY9YCcNmdFc/WORNwlQq0gBjSys6cv50KVKRwomMJH6mWwwGXuRU7z7AoOUewTyGxNuOnYU9LyQwSLPj1W7TKz4CZ2OFcH92RIUe8eD+yeo8Bex87v6JgpWvAiwKIDfwy/AZVu5yUgmx07I+F3iCHVUniZfL/SqKSRGaELYdRPB89HFlFW/x6aKvs3q2XjfT/0wM7Eaz/pDCTDlaz9eio35dSbERvUCZPN40cIp5YqOQ92XLgY9cmIB/9TD70x9SrjYIqo0WO+VTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOq0uuO4kMwFPQEfm+46BzvKif9xZwk3W5NIbBBg3nM=;
 b=CUcD1qdIW5eydSAoYzqir7OL7frSi4M3RCP0b+FztaqaHt9OK3F2T+75RcTHUjeqVz+EgFQ+8BA8nhqfd3S12jySBfz903/aWWWkpuuj6KXIHUYc3Xqry2exIAzorprRS8pzzUxD0N9Bn+k86x7tyQJNr5EX8jUI+d/mU452YzM=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ben.Davis@arm.com; 
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com (2603:10a6:3:81::22)
 by HE1PR0801MB1753.eurprd08.prod.outlook.com (2603:10a6:3:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 11:14:19 +0000
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d]) by HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 11:14:19 +0000
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Date: Wed, 22 Apr 2020 12:13:49 +0100
Message-Id: <20200422111349.1632-1-ben.davis@arm.com>
X-Mailer: git-send-email 2.24.0
X-ClientProxiedBy: SN4PR0501CA0080.namprd05.prod.outlook.com
 (2603:10b6:803:22::18) To HE1PR0801MB1676.eurprd08.prod.outlook.com
 (2603:10a6:3:81::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e113060-lin.cambridge.arm.com (217.140.106.55) by
 SN4PR0501CA0080.namprd05.prod.outlook.com (2603:10b6:803:22::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2937.6 via Frontend
 Transport; Wed, 22 Apr 2020 11:14:15 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcc1926e-601e-4b1b-1df1-08d7e6ae51f7
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1753:|HE1PR0801MB1753:|DB6PR0801MB1672:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB16721BE2AED0CD0B893161FEE5D20@DB6PR0801MB1672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR0801MB1676.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(6486002)(6916009)(52116002)(7696005)(44832011)(5660300002)(1076003)(66946007)(186003)(316002)(16526019)(66476007)(8676002)(81156014)(66556008)(26005)(8936002)(86362001)(36756003)(478600001)(2616005)(956004)(6666004)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NGDg2LLFCep4HCz7Wq7sJ9HqBNbqHxhoPc/886ijhM1e9r21i+9w8YUuCs9OcLe6gmjKUpBc0NeIBUVg++3smDbwING2usUIRhIQhqQ8PRO6BqOklenYMqkA3kIcP7O3B5lOWV2w6UXmJfTEG92ctO3BEXTm3JFYA6kYpZSDbMjvyiJmGBjppIAufeL79xDEezFXy61vzxS8qdqBUVcc0DtCrYmALWhMza0lb5IIZCUQ4vpl+VjCWwHc+Dn88vMBTAEnTfcyvffGZuju0nhgzK8uD6Jx1SVCuLAIew+woqJOuetxMpvoOj1ht1HGd3SjSJNGtgnhCAqbtrt2yr87XoiqR3haJC6MY8s4Tzyz6m+0SHxpQo7UYkayzYhtB7LJZQerA3DxdQKtmXHiNQejU74jRN3Ch4TnWvdcVagf+4I/S8jW9dfMBKI9Hhj7Ughl
X-MS-Exchange-AntiSpam-MessageData: 73G+coe7+LvaqHgbjljyCBSvBoGmSqDpsvT2C/z88yKYH6iOzH6eOtQ5ytPC7NGPOOrbKwHwOJ1q3ynhHRM1apwzQ7d7bcdS1nSi46meoav42X8DYM3TjmIFMYNV8aiWc744Fv/ZUachQr6dTQ8XncCGG7xHhDbtD5zve9xmBtQQ0UINpKerfZiJp44374bwkzluHLvK+7D9mhEBph2r6gOCcD5OWCh9bop4b1PCqKvCoUpCzi7sgQt8x1eqidnvU/LSW0Dtw7zzD2hhdnII7oS8SyhoTNUUkhEWrTwOAu4PSQqfsA+KYtqHu6Za8s2R+UcAUDVQojPp0nJAWJgh8I7bNJUH76Y04e804pRqhSzuH5UfY0SJFZR/tGe2Hjl5ZOWioIfqaCKCQVGnzAUrJJcu1PUv9SY6Pn4NdBf9mbtnNdlV4qy61OSV0mR8pn0Kxt/Bh0BcjLJ/B7HkOazE863uQ3z6TdqaNXMxwrRit9ausMxRUyfD6Kyy004dYD3y58EpCQWnf5I3ATvwxyzpUbUx7uUmip+/FimAKtLCDWAwE41aqEtKKiD7eJ5KBL6rsDwyizyafVioOyz2UdwBvmebY3C/qgIQPpcYP14L0bF61SUmUwmIwxJlJ6ZFSKSn5r+FQ9Rgogryy+E0Xl1oYPYH3+W7eErmOY3YjL61BXSgp9krDp8akbppEIsV8tUoJMCSfxykC4KzvJ0nPI+P3roPotjyEn/DAKmugk0zce5dIHFBty54c8rGFr03S+2htHqlBPBmZdk8t4mZ4/S+TCdH2/KblcgWnggSuj8Inok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1753
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ben.Davis@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(1076003)(86362001)(36906005)(4326008)(956004)(186003)(6486002)(70586007)(478600001)(5660300002)(16526019)(2616005)(316002)(44832011)(2906002)(70206006)(336012)(8676002)(26005)(36756003)(81156014)(82740400003)(6666004)(6916009)(7696005)(47076004)(8936002)(81166007)(356005)(82310400002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b313b9ee-620f-4cbf-dbfd-08d7e6ae4d40
X-Forefront-PRVS: 03818C953D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6c4M0sqkn1QK7s1XD5ZdQ2rNOvMXoGUTOI85+bWipyhkfQegD7Q2g4SBbsSf2tJqVso9bbA6Vvy0le0rXmUFGa8KNYLLNchlg3xQHBqCExttuUsMNfiUsizaZrdTdf4FiF7+gBtFwKrbi7F5N8fmjgvuuuTz8W3kl5ZAVlCRVN5makh9zwfxM1FTEJmZ9VLaqBeiwEczjqtHdLv8gtteFQhApoyHFm/HiW49yyI1mlToedMfH7E5kM34Y5szG8MCTnQrs1HRddhtMiaJn5gNTL3px1/g0+XyWy69m1u1foIcMzmj/P6hczCkQer/PRuBoZ0dMXXkil9TznVu1QnNFoWeTQb92wS3Oy82tWDA8bPjU4IfRg2ukJzw44/hj2JLym4+GDx/rQ5bwsqFb+ucu7O8JFjB+b+84ivPTqv+MDeP/L6cvFBeZoj9ErjvvWdZlVwVV9hCSL87zQ1F6gAXoGKNz9h6bzuZq2qt8JP9SPAuH7xpHTn2iHEBwjrC0Hc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 11:14:26.9061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc1926e-601e-4b1b-1df1-08d7e6ae51f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1672
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
 matteo.franchin@arm.com, nd@arm.com, Ben Davis <ben.davis@arm.com>
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

Signed-off-by: Ben Davis <ben.davis@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
 include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index b234bfaeda06..0c0a65481afd 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
 		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
 		  .is_yuv = true },
+		{ .format = DRM_FORMAT_NV15,		.depth = 0,
+		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
+		  .block_w = { 4, 4, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
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
index 8bc0b31597d8..232b9ad3534d 100644
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
