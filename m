Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57413F8CFD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEE86E889;
	Thu, 26 Aug 2021 17:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE296E888
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 17:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya4w+of25VhHG0RbAa7VKumZXGEz4cshSVH68MLIIM85b3ROcTGXeFGSYXJs67RSp/qVhyUvS6e6RrCFLqTxy5kGq77Uk3TysUJZ0FHLGBmZAFVigk9r8ZbU6bNVPlou25wT4+Shayj5ObdtNcdweIrCVa3H0SACgc78LqUo53oEdqnmkN3zIpz5Um2CKJ53yheqLaibcccz6CDQMrw+L0Ye1QkAr+Cyd//TQ3bTa8/ackbajTYZwISNYsNJSldAueQO/LZvGYDHRdWCqRY/iJRJdbILxVLwOdaWnyegtOaK4l3dydT7lMkUUy++YwExwKdg63sMD4hI4eZpal9IDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEJ3bxndkHkCmfjyUevUX60/6ebTDNvZQu40KYV997U=;
 b=C2Q1EQ01DmtGBI3FBvsIAgsdm/y1mYkpJTwPWXQ2SW1L66q/Bpd1kVDjCNJ/Ta7tx7X/KydIljZS9tMX6wQx7yDbcvHLDjgCct1WSPUgCoqgJjE1NM+nzfV2ZnBuR/hbXL+XMw40UJteKplzuN/pYP9IB4Z87+isDHhH0fxR5AcecWhSj7vRkYHelAjD161XhdWWrKkZBH2amMPHr3t9XEnfbAqMBkvvqJ+E6eJimkq4GT6zB0xsSFpwemCGj4V35C/fK1nifncARlzua5U4XIe3dDGjKVdOjXLAv5gUBBpFfCOwelzA5Gjb1QllA0rXGwROX7jAOcnNmysU86xIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEJ3bxndkHkCmfjyUevUX60/6ebTDNvZQu40KYV997U=;
 b=4dD8Ni+6QzJoEQNJ9AYexSFvMzcQV1ddfwTpB2J2kQlcKGVXC99D1cZzKzhvIWAvKvr6cY287fl1O7hp3gOkawvLR1Ek1zeUp1ThxtWQo3CH76ZBHI2WzIq9QAE5cEdLDubehTxGuKETiDJnydM6hVp2Vq+hfgpt62I3kuMokKc=
Received: from BN8PR16CA0027.namprd16.prod.outlook.com (2603:10b6:408:4c::40)
 by SJ0PR12MB5439.namprd12.prod.outlook.com (2603:10b6:a03:3ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 17:27:44 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::e9) by BN8PR16CA0027.outlook.office365.com
 (2603:10b6:408:4c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 17:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 17:27:44 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 12:27:43 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v2 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
Date: Thu, 26 Aug 2021 13:27:07 -0400
Message-ID: <20210826172708.229134-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 842eb84c-7773-480a-9ee4-08d968b6d093
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5439:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54399B94BCB1306F23467ADAEAC79@SJ0PR12MB5439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0rPaZtlqXWKw9DyoEV4HTdKPetshSa2cmG/v/+K3e9P4wSCmmf+qcCvAbL9enxqghvVs15hmyPq+sg8abH0UjLG2cDg+h2HbuMeC/smpVXuDS+zO9InOe4SUOz2p6bAGIGNHqmXYOejugufZ3eUPe6qJLlU6cAMgjT1diG+6l3XxltnfrP0ax2XY3J3Nl9OfvwX6EHxVgtGBfNQAfyvEEbJCbuC/aPpWchWB3PW55S9ai64aWZaYCIvsiIZVXxVxZ9L+CrdbPioxzKT4SKZiqyus2qU79LxIYtSHWXdH0uQPlvonzc/ZvmCiQ99yEwk3LScLK1vmZsY+ju7Di5IV6NPdon37lDm3WakuyPgKSmySnUsZjQMGIWGTaEiFy77DfMisa1LV3uRK+tIc/bucG+8GdgxyJaZLygiIJVXXdzoUnPXy+8zyPtcWBtOQObqN0MmAYmEKwiS4lRCzg1qH4obR6Ca0bPTSP0Y/V5sMv6zszQMlfVev0aQia6/CthtjJAnA4oJB4bRRKL/QqwNRwQTaXI4Llqf81XwUnz9KOKqMGXKnfKlOGaaKO0FHJ9112Nyp/WQaEzbyvslfX4nHgsaPyKFhZTxaRPhlzf/hW484eMiNgQNJXeX9GKpoujQek3SXkpecEX8/ss5hzwxWJtQaCPIYw3Oo/YXMN4jev6ch3nOasJGr4aTCQURN4ZgfCIj9HnreS7Y+jLuF3dJL6ibJpPnviE9WGL13qHG5Hw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(54906003)(110136005)(2616005)(36860700001)(316002)(186003)(70206006)(8936002)(36756003)(70586007)(2906002)(82310400003)(16526019)(4326008)(82740400003)(26005)(86362001)(1076003)(5660300002)(356005)(81166007)(426003)(44832011)(478600001)(336012)(47076005)(8676002)(6666004)(4744005)(83380400001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 17:27:44.1548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842eb84c-7773-480a-9ee4-08d968b6d093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5439
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

Handle all DMA IOMMU group related dependencies before the
group is removed and we try to access it after free.

v2:
Move the actul handling function to TTM

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0b5764aa98a4..653bd8fdaa33 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3860,6 +3860,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	amdgpu_device_ip_fini_early(adev);
 
+	ttm_device_clear_dma_mappings(&adev->mman.bdev);
+
 	amdgpu_gart_dummy_page_fini(adev);
 
 	amdgpu_device_unmap_mmio(adev);
-- 
2.25.1

