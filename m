Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6121B42F2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 13:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05246E3D6;
	Wed, 22 Apr 2020 11:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00081.outbound.protection.outlook.com [40.107.0.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96B96E3D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35E2kukSZUNzkww0iBZcUMlzI5bA3DvQ4xPWp4tPmUQ=;
 b=jDlx7bsITi3C09VsBWEW5u89EKaUzdI5Xz3SIaK1+5owe8zDE8A/KE0eRSARwZ52cIU8VVWVmL27n57pzgVs8NSRs5zJjivh44S8t58uFDhMB88KF0s+QHVBTnPYU9yIu1MZxhSlF0D0o/YQPfnToC/W+w1bq5upx/XDE4TVGqQ=
Received: from AM5P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::18)
 by AM6PR08MB3510.eurprd08.prod.outlook.com (2603:10a6:20b:48::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 11:18:15 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::f9) by AM5P194CA0008.outlook.office365.com
 (2603:10a6:203:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 22 Apr 2020 11:18:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Wed, 22 Apr 2020 11:18:14 +0000
Received: ("Tessian outbound 3a3e6dcbad0e:v53");
 Wed, 22 Apr 2020 11:18:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c76f411e5c555688
X-CR-MTA-TID: 64aa7808
Received: from 7f62e80aa6ba.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 451C649C-0021-43B2-A088-FFBCE0A24ABE.1; 
 Wed, 22 Apr 2020 11:18:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f62e80aa6ba.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Apr 2020 11:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/RnPJ+/myeD1uPr4CGtNvEK4TjRMLGm/H5gW1ooo0U+MIM+pobHKOfi9sO2Kev4/VMW87c1qAg5mtBFBwMp/a35AiTFc+aT7NFBTaUTWNZwalWn//N44zPm7Q0ogXIonWRulzrEgpEH8GuOuh+aikIM49U02aVXrJqd8uguoKaEfcUFmOiA2jmgJdgw2rQKsXQkruJGAdxRi2551HCw+/JsFnUhpr26gObXYJraAiWjJ3d8LDNPtvCC+/Ov+xCfmgTkSb8gxZCvYWDfcp0hLGcMn9RUSaephKePqQ+qA25Yinuo+OwCBUlVoG101Jc/FrBkIJ2++Ngt4WGInAHH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35E2kukSZUNzkww0iBZcUMlzI5bA3DvQ4xPWp4tPmUQ=;
 b=iBHdoj+SQkCLGt87Z+xgFZOaPxT4DahRzA3h8/Y4McsG8ile2j0MnUkO4Rl48Il8hLCeRCHto1YGRjdHdWpXsEkQty5B+0TiJQbkepbrJ5vtIAMP1Tc12pK1QFUkfK894HUsfuZysfd9gTDYOrAX2YS8RuQhUjTIS4GLBH0U8sEXPBNPxoIS6dRVQC3hTYjIfiaOXy5u0h6neMmH7WDJuEfoEh9wII8ZdsaiNpKGE6o6s55lPp3mxDfk7Wa5tCGyQNnv8aj4dLmnBLQ9WnGjFmkCokE2W61nX/2JQaJKSQv9SHT/e2OqYRBs6nATuGsMDgWytJwU3NMQqqss4OQgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35E2kukSZUNzkww0iBZcUMlzI5bA3DvQ4xPWp4tPmUQ=;
 b=jDlx7bsITi3C09VsBWEW5u89EKaUzdI5Xz3SIaK1+5owe8zDE8A/KE0eRSARwZ52cIU8VVWVmL27n57pzgVs8NSRs5zJjivh44S8t58uFDhMB88KF0s+QHVBTnPYU9yIu1MZxhSlF0D0o/YQPfnToC/W+w1bq5upx/XDE4TVGqQ=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ben.Davis@arm.com; 
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com (2603:10a6:3:81::22)
 by HE1PR0801MB1753.eurprd08.prod.outlook.com (2603:10a6:3:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 11:18:07 +0000
Received: from HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d]) by HE1PR0801MB1676.eurprd08.prod.outlook.com
 ([fe80::d8e4:e9e7:56cf:378d%5]) with mapi id 15.20.2937.012; Wed, 22 Apr 2020
 11:18:07 +0000
From: Ben Davis <ben.davis@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm_fourcc: Add uncompressed AFBC modifier
Date: Wed, 22 Apr 2020 12:17:58 +0100
Message-Id: <20200422111758.1787-1-ben.davis@arm.com>
X-Mailer: git-send-email 2.24.0
X-ClientProxiedBy: LO2P265CA0465.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::21) To HE1PR0801MB1676.eurprd08.prod.outlook.com
 (2603:10a6:3:81::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e113060-lin.cambridge.arm.com (217.140.106.55) by
 LO2P265CA0465.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2937.13 via Frontend Transport; Wed, 22 Apr 2020 11:18:05 +0000
X-Mailer: git-send-email 2.24.0
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d9b8add-ff61-4942-3937-08d7e6aed992
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1753:|HE1PR0801MB1753:|AM6PR08MB3510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3510DEB826CDF3085B5CECE7E5D20@AM6PR08MB3510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:186;OLM:186;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR0801MB1676.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(6486002)(6916009)(52116002)(4744005)(7696005)(44832011)(5660300002)(1076003)(66946007)(186003)(316002)(16526019)(66476007)(8676002)(81156014)(66556008)(26005)(8936002)(86362001)(36756003)(478600001)(2616005)(956004)(6666004)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: k0yMxBNYiP2jZZSsSP8WbNLHy9x1uqNJGMD1ltpZZmy1h6WSpWYgooN90s2buJyGAwMn0XzGEhrtx/zclDm8SgTsvhE8B8TRgIKV633MM2Y4NRmTzscMT6IdEBW+ShGviudCnpucFu7XrSALqjaWf/a4of4ju+i7vkYCmOdewuzOHVy766LxZnH72hV3CUcxxrNitKHcwHhbZHWtuoae2e6EgD6smrYwW7KnWbJltj7qZBAMZ8P3PB0FoWOXee2wDCPc/73BMurtF4rMAJSU183o3fhEbamWdXMt59dZW4TNtRHYMRY9XR8R6pLCBEK4IbQEfsojh3DYPq1TBs6AjBTBjN+2MUh2TLqhdB9D6zjCPIKlEfWM0AMGPD4HoeejbcptINBaw87LBzdj0MoY+bqk3fJVtXuE+3Ipt00gNsz6JhvnGtUQA8IFH+x+cgbY
X-MS-Exchange-AntiSpam-MessageData: bO6eonfGOSQV4Lq27CLoAOjq53hdomNOZIvYGcFA493KwDtYdahksojvZrEZcSJba0BgD19jEWwFF7KlDRBvL1+L/2stTiVpQ3iyROyNIqfdjEQ9magfZUBXVNJyosv94uOkweKEaPjjXd4kUhrja/9Ou7w49BfoGOBjC3Ka+Lv3mUz74R6+kD9RqAbuwPMh1aih7TIxQ225iHjW7TXGiv0z4xmBKrFMyMB6rCvaHsbXDHOXRle8w+mJPzc5dPzy3C9kM9D5E54K2XrdZILK8BmDxeQrriHjf27HUWjCOi8XfcyT28IpxpaOv7nGK1bdoMomYeaTapo9apfigK64TyrNfnCOdDRGeWQ51RdMeNNnkS0Z9yEEa4GpzATsu0vswR2y/wE+aZxadEPmtY7iu0RjLx6wGpmU5Q67PS7Ee1csSuJbYOF0KrmD68NqVmvfltLWem+fcccwFexGWFGnPCKl8OezRMf8ISaKPzfaCFuRoadhkj2P6HxxiYt2gMoMGvkg1Xq041z2FBCqnsEGxHEKo/WKAMK0+mCkhCrfpRLUBrVbyVJK6Db5hmAU0YC4U2IYRO6TQMC7iFjGlqbC406cBE9c0rDC0ygib1piVrpzIb5ysz5t6T4JR+WjU46OZw269Ie+JaLhyOWYnztD/stclnU1Er3I0bzyNWGqAIKKbpVyOn3EQq9ZsPnaP0aW/hW96OOUw3LDk95M8G4HTOYiD70RDjfC0mZFvTaZd3XQYZu4id8Z3Oi42Q8F8MmbRsHfgaD4xarG7zrU2pJGPz0HkgqDVOPxW+vFFSK8q5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1753
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ben.Davis@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966005)(8936002)(6486002)(1076003)(16526019)(82740400003)(6916009)(478600001)(2906002)(36906005)(4744005)(316002)(186003)(2616005)(70206006)(6666004)(7696005)(336012)(82310400002)(956004)(44832011)(4326008)(86362001)(70586007)(5660300002)(81166007)(47076004)(26005)(81156014)(356005)(8676002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 404f515f-a43e-42f6-da17-08d7e6aed4bf
X-Forefront-PRVS: 03818C953D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4lkKNdmgP8UKLsScxOkpeqBDCbdWkPZVnkodyPrmUipdnFo/wCjPpMRgOo1u8v0Tz7dbcCN5+krpylTRIiH/tR8GwyarkILYWIRLiZaQA3ouMGM5shVRXaUo25HADcpvX+sCqMya8yahlgYmyh26ZZM8hZ7cGh/r64WiPthaxOD72c4CWnhlQz5sNHTtjTf29RadvWFbdEDjvlwitPnqpmbPWxSES6JD5oG87MnMuoHJ11s2ULQjb+SOYJeGy2yaEt+yfX31eBBB2KyN5ZpseiRiAfsBb++KrXpIys26D6Axc0ZhkHF3sONOHgq5tPcp7qBTzpW/WjFXrRmdsYkZwS0D2fhybql5HFDRvoHb4GkNTKTEJmOZWufe4DUTIu2qsDf92hBWStizOrwklNYbrMr9hhQRwZvqAq3JskRbYHjsqGvhtYgveCeXUc32ZXjPJ6pTA3W604lS0l7wkeeQeV9G0lxiNd6IHRcc7xg20eNyjt4QKcWDQKJ32DJ/ObuL3386hHcsh3WG8g+jHiY6A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 11:18:14.3950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9b8add-ff61-4942-3937-08d7e6aed992
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3510
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

AFBC has a mode that allows use of AFBC with an uncompressed buffer,
we add a new modifier to support this mode.

Signed-off-by: Ben Davis <ben.davis@arm.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..97c47baef7fc 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -780,6 +780,12 @@ extern "C" {
  */
 #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
 
+/* AFBC uncompressed storage mode
+ *
+ * Indicates that the buffer is using uncompressed AFBC mode.
+ */
+#define AFBC_FORMAT_MOD_USM	(1ULL << 12)
+
 /*
  * Arm 16x16 Block U-Interleaved modifier
  *
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
