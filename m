Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54893FA21B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 02:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883796E9AF;
	Sat, 28 Aug 2021 00:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583FD6E9AF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 00:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVGEBHb9HrxB8mhWJlVEnmTNZMi7tsqPZ6oWbumhPWBhcxg0y8hFWqkbwimxeZ+Jdp/MyF1MgYAUmTJbSCMGUL0SzjIchuyquN3n0L4ss6Udzp24LwEq67+ZgtqjAXJAxpuOaD3hgP8d2k9wXOLQH0JzvtTpoglkaiyYEDo2wTjAWWWkoK/els0hcqfyG2nGNRFkNAnrshRkW7FTxajSaTt3vkABa5bZYHm2anH75i2T52cZuyLMXjNKZS3uW3Pt2AUm/zLIRMt3j281k+GfkPf3El8+pNi4S6z/CsJmvf/8BUqq3eGQb1c1AyPBHfOmVOVQz2rotgNfYZ/N/RzxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmYzz7Clx2qRrWUG5MYD7KGV28chVFdgMBwYrIf89ys=;
 b=PmuzMHjoS4xJXAaAL6Vf0SRMT5oTIBLu8QpwzPIsZZGISiQx5a3zVow8ww8FATEb+Q0ZCfqCc8bHSHgd7XLIolVzmYaUaDobvKCF+Og5xko2i7GYzIclV/Hslv7gfpNduDTfFHZNbKMyXkS4+h7tsQDH64SfB+ynKEYsvOaZS5hfx/jQWT04IlTRdyJpFYxl1DlWc5GbxaBq2GU9w1BN0gK6nSQuxuFKgts17wKVUU+bPsMwLxnNnr/h4IuxDUKTX/wl6E+zFlH9HAXOBdE0U77QP3WkJRZgLfGGiPY5yc28vaYeUJIugMfCdz7vmHisKoNAhS6rdvMpPZqwyil85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmYzz7Clx2qRrWUG5MYD7KGV28chVFdgMBwYrIf89ys=;
 b=InMfLHutKTqg+C4GXexBo3Jw8y9mjQaFkuJsg/qAJcw33lv+DTPo4eQCeMP6iu9DHokh9NX06UXOzkuoFHKcwEaew/ATeHqT2gUXhj28swevHdxbHu6syO0yMG6H1zUYDCBvWUs+/qj/4NoBCcZrKUGUCZrDnfA8vjNvzerZots=
Received: from CO1PR15CA0102.namprd15.prod.outlook.com (2603:10b6:101:21::22)
 by DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Fri, 27 Aug 2021 23:45:25 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::4) by CO1PR15CA0102.outlook.office365.com
 (2603:10b6:101:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 23:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 23:45:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 18:45:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 16:45:23 -0700
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 27 Aug 2021 18:45:23 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <wayne.lin@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Example Usage in AMDGPU
Date: Fri, 27 Aug 2021 19:43:22 -0400
Message-ID: <20210827234322.2740301-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
References: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff730c8-1993-43a5-0f12-08d969b4bde2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15158B7E9C38DED5279F1CD0E5C89@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDpbm4G4Og6lZf3jDsAEabfdFCupNokEbs7EoYbFlLaWQvMKg2UiYe2oLlij354nJxwCdZ2/J1sR1f2IFxRmxI3p/1Z+X18osjtIJBkUp5a9IEuc78iG/RRFCBUBoKugx+uc+OZu3EwU02Vr1C1KcESElhuq+kq8GbqQL6+QOikXJph+FIHWgFEXzvF/RrG1QGscf5oVmweJCGPuWNs/JOivCsnYtUaT3orF7RS9aqk0WhAP89hb19vDLRf/JPh/dc5dzr6gF7DqtG07uau8+pmT37zBsllW8ocdtn6XIMDsnEQhnVw3KQL6rbe09/G+yf1XPD+MnozRTZxBWeky7Ept6orBBGn80CRZwi97HlfuNcL59BOoZiQA1xx33UyAPfSJQP3NegIk5tRp1nFxtgV8fWeSS9bZgPiTmGtM3zKcnk49FwSqaNFFoTunkKRu3CT1/0hFTm7VZ6FgipMhTXJuwMUtWT7Vt8OT9sKNSYy9ysbxU1+L6nq12G/9/m71qHaBB7yiFbwtZvBOV+Q1+cSkvzYOFlIXVREq0UwUZYlYOfADILSyq5yhMrApo3qNqM9SEXmEBZcYzHQuHBvGkicJ6KN6b2oYDefrXBtI6dUuP/j1he9DSp1YqnVMaaV7zpzuEK4jgdQ9RGofbGMO4VyFmF2l48pouP7T5PzJcBycdeRKjCQDeojTRQCzJpcUBNLGxskUMC8uDCsX1Vm4J9dpZ3f+pSZAf/1WcGtCUqY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(2616005)(54906003)(86362001)(47076005)(336012)(26005)(70586007)(5660300002)(8936002)(356005)(186003)(8676002)(426003)(4326008)(1076003)(508600001)(81166007)(36756003)(7696005)(316002)(36860700001)(2906002)(70206006)(6916009)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 23:45:24.8435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff730c8-1993-43a5-0f12-08d969b4bde2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
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

1. Decide MST Link Encoding Cap
2. Update MST First Link Slot Information

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      |  4 +++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 10 ++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 986c9d29d686..90edf0eae786 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2302,6 +2302,7 @@ static int dm_resume(void *handle)
 			dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
 		amdgpu_dm_update_connector_after_detect(aconnector);
+		get_mst_link_encoding_cap(aconnector);
 		mutex_unlock(&aconnector->hpd_lock);
 	}
 	drm_connector_list_iter_end(&iter);
@@ -2673,6 +2674,7 @@ static void handle_hpd_irq(void *param)
 		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
 			drm_kms_helper_hotplug_event(dev);
 	}
+	get_mst_link_encoding_cap(aconnector);
 	mutex_unlock(&aconnector->hpd_lock);
 
 }
@@ -3844,7 +3846,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 				amdgpu_dm_set_psr_caps(link);
 		}
 
-
+		get_mst_link_encoding_cap(aconnector);
 	}
 
 	/* Software is initialized. Now we can register interrupt handlers. */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5568d4e518e6..2f029cbdd3f8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -439,6 +439,16 @@ static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
 	.add_connector = dm_dp_add_mst_connector,
 };
 
+void get_mst_link_encoding_cap(struct amdgpu_dm_connector *aconnector)
+{
+	u8 link_encoding_cap;
+
+	if (aconnector->dc_link->type == dc_connection_mst_branch) {
+		link_encoding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
+		drm_dp_mst_update_coding_cap(&aconnector->mst_mgr, link_encoding_cap);
+	}
+}
+
 void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector,
 				       int link_index)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
index b38bd68121ce..8339053b2b70 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
@@ -35,6 +35,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector,
 				       int link_index);
 
+void get_mst_link_encoding_cap(struct amdgpu_dm_connector *aconnector);
+
 void
 dm_dp_create_fake_mst_encoders(struct amdgpu_device *adev);
 
-- 
2.25.1

