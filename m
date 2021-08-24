Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919963F6ABF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 23:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B85A89915;
	Tue, 24 Aug 2021 21:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA31D897DC;
 Tue, 24 Aug 2021 21:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsSW4vaRWSpN9s2Z2HhY+OgLnn8p4kbWcCz17ujimL/7FMl5wBcEIT7OT0Utg/VqxqbtgrC4jrri9T7MUnf0NcQJkRlja4BM99juOpqE1eCRUmBFOjhQoIL1PiEk48TFZoUAJWWv4vZVJqwJHfPA0GRQGL4ZWQm3+y3XOeq4ZY9iUjeO96SH2fg0hNeZQYcpBFNw1+fURY8PVq4kF1kmt0BiMB+G2DgQBXH1ceLAzI0Nbu8ygfYLR9MAHr9gCCHJ/4a1vnoqcVHdxKRRhrme9o/7bOf1GjcnjCdd4SQi3xYskMxRee9soSy9+Mn0PLM/l5i4EGK+izyahOGsgRfxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTHxzSKayYlEuicgvMmGDvLQVJUe7R8sga6HW19lYsQ=;
 b=HyDZA9w+WJtWibYK0zSCPuM1PlBNZx8SQCF0qUQ1ZrpC+zpdoeQvMCPR1Ieorkb9kmkNlk9tK+r+hD//vhQkGgVNvjkMhsn3OwawzUzcjc1OCHBCwyirkyPZTfWQT00yWQ3ZOjRcSdUc2MtXdAaJWEnGzMRoJCtgITIwuIe5/hOaKJOi0B+hVHHyJYVUcg9we3osq8RWJLKGWqUow8vcgaoeb9kNRxuA5d3rh4k17LLQQjCdU6hjXXUkiCAxylDYeFygAB6dyxDxGd7eq8FZwO461RoMouzEZUu+TCx1/RboEhQeXMoO3piQuFrRQJFzaDCYhIHCq/98C1t15odz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTHxzSKayYlEuicgvMmGDvLQVJUe7R8sga6HW19lYsQ=;
 b=FHudlf+Ao+VOQDdACd3UeSx0cnS2sxUGeyzBl9SAwdN2L5sQaLKYQ1zUbVEw13kFVJ2HHXpvarbj0sBCA9LlfP+X3rUu+oTPWOOgJsAXB8CeY89srI454N6OCG7VvSzNOsO9wGFFtAGd25pkjzpK5ec6gEIXYFMmXVjCeKkZytQ=
Received: from BN9PR03CA0159.namprd03.prod.outlook.com (2603:10b6:408:f4::14)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 21:01:39 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::86) by BN9PR03CA0159.outlook.office365.com
 (2603:10b6:408:f4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 21:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 21:01:39 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 16:01:36 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
Date: Tue, 24 Aug 2021 17:01:17 -0400
Message-ID: <20210824210120.49812-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e518ae9d-10db-48c3-af2d-08d967425de7
X-MS-TrafficTypeDiagnostic: CO6PR12MB5428:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5428D704019DF8BF9CDE9A25EAC59@CO6PR12MB5428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBHXg68e6Sco+TiM5jxNlNNa5U1IjSSksq0STedmGywMcHK/ht6LD5FnEG/C1z01ZSDna2zuoosELLN1kBcIgYyUpx34zKoPWN4dKRcfbVs5z9LQisW8gh0bB4Sn364Yb7Dw5SzD8cQsHWjXScdXNWRZNen/hbHz4PPqH9gnxqhrAp43bQa17yfgGFkYbGWh7v0VL19N28ufqHzN/vD74U9CthhmHKqbMb/CwUOHTGiTw0LUSYc9q3V7CHO5rvhlcxIW82nJjBTvyoH/tEhUKBcoOD3x1vISx4fCbQ4FWqU0tCv0xeeKRH03hGGPd2GOc9WoZoqFhOTeGbIvegPORR7+zuQuFGnaHTgK2yocTB72br/Y6WcgG6l7KdndAzPO24zj2VOnAj36WitHsEYg2N9DOEIFyDW1KwHcKeW8zGjrFeNrhwSFHKXXs/dVCXBVwycwNRr+kh//K7bsTXTyeVX8+wDhDqQyoMyoYfDEyk1jtZ+GqiHxAoYuLgwbecSJH/xTbB1Wu7hCn2EiCcXJhynF1pVVLPDwo0VVLps1KkWyNRv6uHga+BqEjQQVzQuE/8CYDnwqyDPki7xW+OVa0oTQ14AOjNECRDFVR5syIVfnIn3wLTmM/wCn+uAUlSpS8rntTjEC/TyoacTD8uZ2qeczMg9fnxZbu/04rAQZiTDeYsQ9Zvkw4/AIMJong1GdSlRbBHqKvKWg7urBCC2Tcojt3KqL3Eclpk8CGDh7APM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(316002)(82740400003)(336012)(2616005)(54906003)(8936002)(6666004)(82310400003)(86362001)(8676002)(4326008)(356005)(186003)(36860700001)(5660300002)(44832011)(83380400001)(7696005)(70586007)(47076005)(1076003)(2906002)(70206006)(36756003)(478600001)(26005)(81166007)(426003)(16526019)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:01:39.0173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e518ae9d-10db-48c3-af2d-08d967425de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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

Attepmts to powergate after device is removed lead to crash.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 1 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c   | 4 ++++
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c   | 5 ++++-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c   | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 1ae7f824adc7..8e8dee9fac9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -218,7 +218,6 @@ int amdgpu_vce_sw_fini(struct amdgpu_device *adev)
 	if (adev->vce.vcpu_bo == NULL)
 		return 0;
 
-	cancel_delayed_work_sync(&adev->vce.idle_work);
 	drm_sched_entity_destroy(&adev->vce.entity);
 
 	amdgpu_bo_free_kernel(&adev->vce.vcpu_bo, &adev->vce.gpu_addr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index c7d28c169be5..716dfdd020b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -477,6 +477,10 @@ static int vce_v2_0_hw_init(void *handle)
 
 static int vce_v2_0_hw_fini(void *handle)
 {
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	cancel_delayed_work_sync(&adev->vce.idle_work);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 3b82fb289ef6..49581c6e0cea 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -495,7 +495,10 @@ static int vce_v3_0_hw_fini(void *handle)
 		return r;
 
 	vce_v3_0_stop(adev);
-	return vce_v3_0_set_clockgating_state(adev, AMD_CG_STATE_GATE);
+	r =  vce_v3_0_set_clockgating_state(adev, AMD_CG_STATE_GATE);
+	cancel_delayed_work_sync(&adev->vce.idle_work);
+
+	return r;
 }
 
 static int vce_v3_0_suspend(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index 90910d19db12..3297405fd32d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -550,6 +550,8 @@ static int vce_v4_0_hw_fini(void *handle)
 		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
 	}
 
+	cancel_delayed_work_sync(&adev->vce.idle_work);
+
 	return 0;
 }
 
-- 
2.25.1

