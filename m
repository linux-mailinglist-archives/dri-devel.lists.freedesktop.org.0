Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E793DBFF5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C716F4AD;
	Fri, 30 Jul 2021 20:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4056F4A4;
 Fri, 30 Jul 2021 20:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1IS2Miq+On3gYzyqOQkRVUOfclJCMrYSIWPxcGZq7lxcPf8YFp7vmRU6g0r2VjhTaNvTD+3xyUhgN8XNkjJkd5R2ggTpsxfKDwIXH6vlwfLq6A4dPzI1rS3R/ugNxtDfjExDn5YDE7Y27o2PEvlWQ53UA6Kv1jEMQyWHvnv/VrOngkGHyQxfAeN1WrPUANnXoDKFdymtu2jFvDlwmjanFWFmnC8ZBN7J+M1Fz6wGbRjvLQ8JOUv0H0U6KWt3tHrrb7KR/SAg1I1cJrTxdXkm3W/o6HxzsRj+zkJqZV+RoGTwczhw8CjFgXKx0FuS+TLHEbxF/9tlixpHpmXiajAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QphyzuWk2RJg5SjUScZU3dhfMgN1G98GJG7aBU0xKYk=;
 b=kVbNo//gZmyTxm6+DivDTEaYfp3CnMRiL+xfNAsSsOMsum0ig4BsusXys4z29oeVk2C7+5ZOrwSgxG64bMmZJ5FS1wGMpZHlPIgFQcwHc/KnSCss8B8EAbs36m7EmQ8k3R0g4cXpz6RCGij0qIcuX2qZpCoX20/Fr1Figy3XI1OUT4abPLrWUsJ5ft7winAwUhGURyAQdPV8zoA8fPvYk4zpwTIg6JXU3wKMLkFEcNoRFHFiaHM5tOBxhwc5Yt5jQ0iR7QHi4HTn0V05XfIRifUOzPsF0MiS8sYKvcg+mZl2emV/5EQKlXnB/WMlYAyqU/zlhoVWK9dUDFSNJTbbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QphyzuWk2RJg5SjUScZU3dhfMgN1G98GJG7aBU0xKYk=;
 b=EYKqytpmH/ay8Ou6YRVZCd+eTKASI2V/7aTXiO3IbGSMGvF4pOFm+vFzKvJXYAYlvzPQirhWBw05QkeHsP3+P9QGf30fsbmvlCvKF4rEyHxHfNUkFU0WFfdksA31X+NTIWVMmgDCpYQCVrf7Gzr3bYVQ5MXvm+vOKx2c7m50iwk=
Received: from CO2PR18CA0066.namprd18.prod.outlook.com (2603:10b6:104:2::34)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Fri, 30 Jul
 2021 20:41:50 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::a2) by CO2PR18CA0066.outlook.office365.com
 (2603:10b6:104:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:50 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 13:41:45 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 6/6] drm/amd/display: reformat YCbCr-RGB conversion
 matrix
Date: Fri, 30 Jul 2021 16:41:34 -0400
Message-ID: <20210730204134.21769-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 658809aa-52d3-40a4-0d2e-08d9539a750e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4058:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40587DFCE5652F011B63CDCB8CEC9@DM6PR12MB4058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLO2GAuq5Sg8gYqCBpGEqfrehw0QiXR0H2+Pj8SfoQodPZRbnVwSW7vGRbncK9J0lyUbYSU7kVJT6nlcVRU/Uavd9UZZqgvPKNpOp+6Ej/BQqhrGbmjXOCBBxGd0Cp3xWZwlus294n4NX+kb1aTwb0Go7dn5N2Pj99F94CaZqb1oD0x3YFodFi/6zcGXeeArcgKskbzIlCt9cUlMjmCxeIwYCuynilS0ejmkIoMAHsEVvH1NgsDzd+yJL73y4E6hxMY5gOcHnqzi6mCiWUx/AuxUUyJB1HOK4WimToYC4ATsk1/Vk3U2QtJOZ0Ks1lR59mbiY23olFrAy10yTfjjwNnUmoEvQpflX4Otzalj641rL1L0AQ7Doiiq7qmCbls+x7xT78E0cqEtJE/5JZBZqyfl4RcuPgJiV0ohCuF/OkwedS5fTnbVNr7c+6fvwZyPHVUjSljYZICcYycAmrcHwK81zfgHEDfastZrOEKGGbXW9Q7AXofurIxBbz2SH0/XQxw1lyPAGefQIrZBjFkxQUQ8esfE/T+uF/1Iylk7yTV4KXAHFrGyfjkSfmeyPQg3RJzqJP6YHcqyY7Y0rqiTQjRO2jZFnKrQ7SuvCiiUYXMyNXrsAhy34NyCgRmhxEgZHh0GGAx8BbSFTJX118C9EevHz/oQ1qc2wUhnHXdaie+g9BsA0m2mx/w1+J9xrr6CfjAqJ0ahWNvJwFwbyqpsVumvD6WTIW9MANa3oZnWi9M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(6029001)(4636009)(396003)(39850400004)(136003)(346002)(376002)(36840700001)(46966006)(6666004)(70586007)(36756003)(83380400001)(478600001)(336012)(70206006)(356005)(86362001)(36860700001)(6636002)(8676002)(316002)(82740400003)(186003)(47076005)(8936002)(82310400003)(5660300002)(426003)(7696005)(2906002)(2616005)(44832011)(26005)(110136005)(54906003)(4326008)(1076003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:50.1970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 658809aa-52d3-40a4-0d2e-08d9539a750e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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

Show the CSC matrixes in a 4x3 format.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h | 28 +++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 00fc81431b43..345b3956425a 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -55,22 +55,30 @@ struct dpp_input_csc_matrix {
 
 static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] = {
 	{COLOR_SPACE_SRGB,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
+		{0x2000,      0,      0,      0,
+		      0, 0x2000,      0,      0,
+		      0,      0, 0x2000,      0} },
 	{COLOR_SPACE_SRGB_LIMITED,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
+		{0x2000,      0,      0,      0,
+		      0, 0x2000,      0,      0,
+		      0,      0, 0x2000,      0} },
 	{COLOR_SPACE_YCBCR601,
-		{0x2cdd, 0x2000, 0, 0xe991, 0xe926, 0x2000, 0xf4fd, 0x10ef,
-						0, 0x2000, 0x38b4, 0xe3a6} },
+		{0x2cdd, 0x2000,      0, 0xe991,
+		 0xe926, 0x2000, 0xf4fd, 0x10ef,
+		      0, 0x2000, 0x38b4, 0xe3a6} },
 	{COLOR_SPACE_YCBCR601_LIMITED,
-		{0x3353, 0x2568, 0, 0xe400, 0xe5dc, 0x2568, 0xf367, 0x1108,
-						0, 0x2568, 0x40de, 0xdd3a} },
+		{0x3353, 0x2568,      0, 0xe400,
+		 0xe5dc, 0x2568, 0xf367, 0x1108,
+		      0, 0x2568, 0x40de, 0xdd3a} },
 	{COLOR_SPACE_YCBCR709,
-		{0x3265, 0x2000, 0, 0xe6ce, 0xf105, 0x2000, 0xfa01, 0xa7d, 0,
-						0x2000, 0x3b61, 0xe24f} },
+		{0x3265, 0x2000,      0, 0xe6ce,
+		 0xf105, 0x2000, 0xfa01, 0xa7d,
+		      0, 0x2000, 0x3b61, 0xe24f} },
 
 	{COLOR_SPACE_YCBCR709_LIMITED,
-		{0x39a6, 0x2568, 0, 0xe0d6, 0xeedd, 0x2568, 0xf925, 0x9a8, 0,
-						0x2568, 0x43ee, 0xdbb2} }
+		{0x39a6, 0x2568,      0, 0xe0d6,
+		 0xeedd, 0x2568, 0xf925, 0x9a8,
+		      0, 0x2568, 0x43ee, 0xdbb2} }
 };
 
 struct dpp_grph_csc_adjustment {
-- 
2.32.0

