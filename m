Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6909F47692F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 05:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC961121A2;
	Thu, 16 Dec 2021 04:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7641121A2;
 Thu, 16 Dec 2021 04:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAaiGXKdRAXKI17u9k0FSHOhe8sm3d2I4hesk2Na0yH3tdpQKAS3MujYsK/jGGWLvuce0DtP6y8teyEF4MJMu51U+Dw6dtWwngV/x9rjKmy2l3hJHCeKzMZOFW7yCUvszM4jPn1A7dTx+7PohxDbv8GsAkwSav6SBSYxJKcQzPPQdxWkJSbSLnd3KdMe0aDN/y6cFqaGnKtOSXHqdxXlCIJXoS5pIsiLlszeJxC/u7Tg3FGBdeyMeqHq4dQN+jafg8WUGaM5rmrk8PKDgmT0aV8jdX/VvZOFrb1kTlSx6bzNbMyLfvMxrpOnZXcIC48PA9iOQfor9d0OtmWfpGOI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMz9VCPyxdnK0nj8MFtraVvssQOW5beL0vWVnO4iHcA=;
 b=Nrle3bA+v+M+ia0OysUTS+faBnRqvHFpEA0z8RPGJJcfBYaTHEO5cg+0lJCETXVG4yJAHPdpgtYROUM/uZoa9F6p4yqwJZhQBJy6xaKMSbx1avBe8oNSHBlTeKDnbw7e/59D2fe+kay3RziHA/Ma1S208AnxGHuEkCbSC2pca3MqYIomkHPC2gu9Y/Tvpd3sGy4/18KOBm8OK8SgptMdolPFapxqemFcFXTujHDfKm1KU83i9l/8bWp7TZV6WkyK9sO4QSn/TcZjEifL/nQTpJmYP7ISYt+xWxDnXzkp3VSsup8VIe17ENOFwzWE5lysBCfdnu4w7EQDRiCwjqCSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMz9VCPyxdnK0nj8MFtraVvssQOW5beL0vWVnO4iHcA=;
 b=KhQjKZXce14Igx8jVxt+JZ1AcMdJDelAMq0Kj0tCeWHFt3tcMf+Zbr4ubApKg097ZTmGsRlPA8IXdAqSjEgJvuhdgYKdMUm399PKg87Aa82zKAFHEDYRJqsUY3sK/+0WBePCJwqMO7nXMPgNNjz1hwMM6eLaGdjY4ylCaFszU24=
Received: from CO1PR15CA0050.namprd15.prod.outlook.com (2603:10b6:101:1f::18)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 04:40:22 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::c) by CO1PR15CA0050.outlook.office365.com
 (2603:10b6:101:1f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Thu, 16 Dec 2021 04:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 04:40:21 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 22:40:17 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH] drm/amdgpu: fix mismatch warning between the prototype and
 function name
Date: Thu, 16 Dec 2021 12:39:37 +0800
Message-ID: <20211216043937.138522-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9d29472-d729-4f5b-f840-08d9c04e2b4c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4485:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4485903AB6CBA05FDFE472FAEC779@MN2PR12MB4485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fPyQmOhsusVlmpaDebhq5eYgRfGn2Oknot7JTutXdy94knHPj+5gs4t/VkThqoAeuZx74Hk9lsLaTF5+xReHovmzk0u8tZX45zmqiKisSn3dBXz+tnVQNYmR6hQ6636RBnB7Rhy71DdZxmkgnKcMlKFFpdRDBVmpKCCS9OxtLGCfsMLrxD4NL5rCtRKJIQkAWCNuDZb+F600ZyjTz8W/B6pMHXa0Wk/LLY7K0cMuaJBV/F2wdvRj1mUkYe84rkOV1yX+HkgggYnhoI0vlD6Ru96rJwRyArJhAkjg8f2Z893P0JfuskqPVbrNiAVTLyC79zkfkUVlts4ogCKIeA1SAAbBOH2YNwKs4K1guwmkqas80FTUjwUr4xCOkAixynWD6IpfplIi5+htTIXFFi3b+qJwAq11IYoswBvgSvb+CznnS255NjNYHQxw4iin+ILgUq1uQh07siEcPOnNkVDDSrEt2fjGpkIQOzKBdpT5UVG9AUh5ssj4EzEBB6CIMLvZXHe8K+epTsrC8vXr9ahMW2/32NOPi0ytoPqzlYR6W8pIKvqNPm6ieNmsoK+X3RJnYE5yZJ1HIYdb4WR9ifdoaCB0HK7PeaUrWhKlUPL4UJcPHyYUi8KPnwGdg7vk6VZ1lHVr1Tj7BEm3EYRox7OoFevTlgbS4TkZs1hSuuPSS2TBMbKIK2UOo91ViUfTCiWtSnCGI4TcIJ+sUqcRfmek/ZeE4I6/cI18ixJtbTomB4WQfCUtHwTq+3+H0eV0fkAwo4ODdegL0j1cH7bLKxC7KOO5h/+44w+cMEbPpyxwOtI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(4326008)(8936002)(426003)(86362001)(336012)(5660300002)(6666004)(110136005)(316002)(40460700001)(82310400004)(2906002)(8676002)(81166007)(54906003)(4744005)(16526019)(186003)(508600001)(83380400001)(26005)(47076005)(36860700001)(356005)(1076003)(7696005)(2616005)(70586007)(70206006)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 04:40:21.4460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d29472-d729-4f5b-f840-08d9c04e2b4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
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
Cc: kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the typo to align with the prototype and function name.

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:631: warning: expecting
prototype for amdgpu_fence_clear_job_fences(). Prototype was for
amdgpu_fence_driver_clear_job_fences() instead

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index db41d16838b9..9afd11ca2709 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -622,7 +622,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 }
 
 /**
- * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
+ * amdgpu_fence_driver_clear_job_fences - clear job embedded fences of ring
  *
  * @ring: fence of the ring to be cleared
  *
-- 
2.25.1

