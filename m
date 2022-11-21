Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B807D632B2F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 18:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E3410E31E;
	Mon, 21 Nov 2022 17:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3783010E31E;
 Mon, 21 Nov 2022 17:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyDchDqVCq+emwMwg0mp4KJ+sxpyFBRbDgB1OAXUIzc/IihYobDWAD8Q3vXzS30Dg/oudKdkuyDl34f0KknpOrPIGeq0ygKJsxh3+Axe78hUCVjBzuyTFt6WxxfKfbwMP/jOWLq/AhJMz17gzw6krpwDPjiw4TAJB/FIpCXe0npmX1hMinPPgJWVUv8zFqizPGAZuxAtFKIwIaZMKHF+hQSIejQy2Gb9s+S3P8BU+iHl3LhRG8F3Tr1g0aVMjyoT0bgPDmbnTqR2OfiUk2xrdKcubnVMyNVBsyMsS+tKy27T8jVnIMEnVowJ76rc5HF4yErLNcAZ0Hy6/S0NJT4BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g5Te8+4sXEMjCyTI2FhtO4f65tY1nVO8inPDm0NgD0=;
 b=KF6HyydZAnfzPdQipRtAB2hFQFEfVy3/R0sdFcjVR3n9xT/4cVBcoO0i1KTGoS7jT+PS2hcj7DnYWiBKk054VKB8Du6C4tsX8X1p5yh5UsS3Dz6kQhc8R7fq+Tv0xZdEzvnuEs8EXZTME3IXGBbiMAMnP+/HPC5nG2ZD9vRffNnLg61+f0n5244mv5YGQpuG5fMK/xjVNTbK7JbUgws1VEEtgopV8Gr56HR7X/9zO3aTcn6msG6tvmjbcze/Kp5LdyIkHT/U7vW+fynFpS/PLqowCFGXsiKcc9xG+55P9x3wYyfkIXjQwNQyklGNwuTuLCtyl43uaCPT1pQMVNeNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g5Te8+4sXEMjCyTI2FhtO4f65tY1nVO8inPDm0NgD0=;
 b=kIyPobNvNNI5os+qQwFF6mfnhSqZjDDjFMIDq2fyofsZcfRy3nGfYPskBuvO+R804iL1dmCid5yBlvSk3hjTEFGcKjKC0LDN+aDXWodLf1hQ5XP3bodjAbhDbG6mWGkrI/z9oIQaCzXcw4JHcEsQI7Y4GOHN4vivIZkdqliQz4A=
Received: from MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::10)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 17:38:58 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::49) by MW4P221CA0005.outlook.office365.com
 (2603:10b6:303:8b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Mon, 21 Nov 2022 17:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 17:38:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 21 Nov
 2022 11:38:55 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Partially revert "drm/amdgpu: update
 drm_display_info correctly when the edid is read"
Date: Mon, 21 Nov 2022 12:38:23 -0500
Message-ID: <20221121173823.695615-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a2fce6-a24b-4fcb-2323-08dacbe744f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJpMxqOSI4QigofZf+F81P4nG+9oDkNiE6E3946HAbvARrzvy+q4y2G/4GSiGBZSetq6Izxk/Ecm7Jg34zgQeyQkblEFqIU40pFj8dmFaH7KvMTUPlPtX5JNf3IU0EeoNsCD+DChpSUDsOl2binnwg2Ygx1nW1ldns8+ED8LGl00ipyDfcTgkW1ganRWylpyJdZ60fPWrrvb5/4yvAbx6ZH030oNhTfmqjy8zdqTBu3hEYbg44ltdShG4889+XCot/AtkfenPcgS27xk+tuCc/IlDbE+7Ni/NxaA45XiGbYD/ZK2L67LCUPNDRAY4AhxcdKDmQwp9x2l4cv0Km8XeUG8mzl6tGLE040aq5rxnMt31ndTuthOWjzLtfoPtY/ouvRjoTYULZC+XUNWoft/oaB/4UdSBySAGCNpCplxQsGtnomlK79tgH5Qy5IBOqS1mjPW+2EnMGmeMEV2/nSO8Xzt/WZEabTNBSpEB8b7wGyNbyGFZ0II7/Fyz0ceZ+FtvIukqVB4OXXMlKT8j81NVaxVzyrX7RNvzfJazoa5I0fypWeV07U3CoBD9tHpZQH/POC5qf35LoXVS27icFHynuRhJwd6OoG46dDzMcGQj/C/i2aMINGQVOYxsQcrqGwbxEfyM/HGEIBvMZvC7TX9Baj5tg7lXvWcLPA9Mn7hIMWsRnNfm9h2ML3w4FrmJhRs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(6666004)(5660300002)(336012)(316002)(966005)(478600001)(70206006)(4326008)(1076003)(70586007)(16526019)(41300700001)(2616005)(8936002)(83380400001)(2906002)(186003)(26005)(8676002)(47076005)(426003)(82310400005)(40460700003)(40480700001)(36756003)(36860700001)(82740400003)(7696005)(54906003)(356005)(86362001)(81166007)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 17:38:57.9543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a2fce6-a24b-4fcb-2323-08dacbe744f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Claudio Suarez <cssk@net-c.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This partially reverts 20543be93ca45968f344261c1a997177e51bd7e1.

Calling drm_connector_update_edid_property() in
amdgpu_connector_free_edid() causes a noticable pause in
the system every 10 seconds on polled outputs so revert this
part of the change.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2257
Cc: Claudio Suarez <cssk@net-c.es>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 491d4846fc02..cfb262911bfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -328,7 +328,6 @@ static void amdgpu_connector_free_edid(struct drm_connector *connector)
 
 	kfree(amdgpu_connector->edid);
 	amdgpu_connector->edid = NULL;
-	drm_connector_update_edid_property(connector, NULL);
 }
 
 static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
-- 
2.38.1

