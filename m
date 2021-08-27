Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239683FA0B5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 22:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE186E9C2;
	Fri, 27 Aug 2021 20:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96016E9C8;
 Fri, 27 Aug 2021 20:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+xrqVExNU4nmjx4Nu8xP8c3I4OdoVMNtshGjMCpPb1kMu6LlHyFOUce8YDM3vvgp/PGA7DWKR1gKLd5/ph+D2J60T/oV4GyvH6MJ+47aoK6MmNNyvH33lty8TTXtJJx9H1yoP8XJoNf5VdOP6wHoxALTuU4Hb0izVeU4z2OjC8aaJq8j/8AJBB2T+DUGTnvIAs0OtCpXtu3teYmqmiE69aywyu3JCBVFOfmKFqL8z3ajWzUYr4na1KsdBKKOhiQW1DDjkXht1d2r9Drue2f9tL6wQDCylS7TWmk2m0q6eib/WujDSRlnlo+sY43IZzMsrSCUajwxTVHXGK1KTkpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEJ3bxndkHkCmfjyUevUX60/6ebTDNvZQu40KYV997U=;
 b=NRQJ+FPxwfhxsi9vHofkTPqQwdx2tHJnNmtT0NjUnQ9u5T0i0MYKHML44t4yvZ1dhG/6DX+vv6+YPPyCFc9dheq89qgYMfudAJClmqhrbLhOOjCYLR819jWEeF8i25H+d8vkWYVFDLUf6Sd6FICnWDQi5AzVAOZ1lMn5IdyWHjBW9RC23XN5ZPpQcrh5NIuN1+8piRce9PkZBSvwFatdXLA9ztQPW89oHTc8Lwwe/ZBmp5Y2hPrPTVTkeDfVld2BITcziHYB/ZlnY+/q/2pGqKaYvEaNwUyv/ccrywjqb8qfi1KjKUcokb0Q/1q9MTtAbxDd4aBk/eSWPqnwIVtXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEJ3bxndkHkCmfjyUevUX60/6ebTDNvZQu40KYV997U=;
 b=YRWB1OwbFLx1MBKErPGgg/ne2FF6f2JiE8odo654D9fSL4CWuteO+D1uUrExZ7BWKUgA60fPjqL/c2WJR64FBKAm4GhUMdstOV+Mv2SSt5UE/qq4FHhtQSiXUjfXWU1WVCzhgAgtkTKwNhyPYMIomjMboTiW+iemfNMCOmwLI1U=
Received: from BN0PR04CA0186.namprd04.prod.outlook.com (2603:10b6:408:e9::11)
 by CY4PR1201MB0198.namprd12.prod.outlook.com (2603:10b6:910:17::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 27 Aug
 2021 20:39:25 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::36) by BN0PR04CA0186.outlook.office365.com
 (2603:10b6:408:e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 20:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:39:25 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:39:23 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v3 3/4] drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
Date: Fri, 27 Aug 2021 16:39:09 -0400
Message-ID: <20210827203910.5565-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36a0d826-212f-42b5-c22f-08d9699ac20a
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0198:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0198F4038084D3557CB30DF9EAC89@CY4PR1201MB0198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZD0uX0QHXOGxKADLyk9Gab2O7Qkr9G2K9jco6jnPhdvJpw+EyFoOgA4Y+F97Fm9/rN9cHiRWwH2hRytnWRzP7pa7DGG372EZAWpKZkUsCyFoOeFx0TxiuZALaJhjCdS/oQLvlymqz35OLr+X+zgH5tyPt3kls3bWP07TMIoyh2N666X4UTqRrHMvSZ9zmE2F+lQOg5aOoIbtUtF4mi+r9oehlba5eBfpoVq+F0iYuBUy4JOrhkx3+zoEg37yA64ogXD+kaSbhsLL3AoOjI4M3hnf6fKYf0jwXeRNuTLUlHETe69G6DEajSdTfpyi8YHhUMIOyr5pKXww77GVTqiQjU5cbpp3z4Ugx/3KW1FNdhNLd0Lz4eLJ52VBFrhcBSjvHGG9LnanxcC8ARm28atNw1mX+iIfa/4H8z+/8FMb8uQXRzude8xvWzzEQ4d0T12Rei3pcOjSaTI3ArLMO5kxgEYH1/WiTcnLlFNS6ySOizcvUiTQgFH6+v+siWtoCO7gE2bAinBP8G6fYQ92fANkm8GYermTEHoUtzGJPxtfLtmRqFskBHvTOVCWZETXodmNBjPKHBVQKi7RHmGV5QiTCkiNyZrdauxqP3Qmk7X4LF+L4Sk0XRS9OhFdl38/NIrH3Xs0m5zR7VOp0cGrdZdFWQuF0Z+WhEpnQ4WsIFJvYIcUceWdS1vQG9/YC674n8gStuJOPIiTX+6cvl+RIRxwCg39I3anC8AUX0456OT+lcA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(36840700001)(46966006)(478600001)(86362001)(7696005)(82310400003)(47076005)(36860700001)(8676002)(1076003)(8936002)(186003)(70206006)(4326008)(16526019)(2616005)(426003)(36756003)(82740400003)(5660300002)(4744005)(26005)(6666004)(83380400001)(2906002)(110136005)(44832011)(336012)(54906003)(81166007)(356005)(70586007)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:39:25.0571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a0d826-212f-42b5-c22f-08d9699ac20a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0198
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

