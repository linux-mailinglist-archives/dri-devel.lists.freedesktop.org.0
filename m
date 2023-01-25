Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396467BB7B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B79F10E860;
	Wed, 25 Jan 2023 19:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9A110E391;
 Wed, 25 Jan 2023 19:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0sl7SrPAO/fQ2OHGLEo66Uoou7+5Q7QIU8PY6a21WApkLz6sO50tiVx0OR5/lqcAtwSPG09Z3/8Ozi3hZz+uv9fNtE2H9CXp2IKyVxxyKhJue/gKOwGcjRNo4AcgJpCoM6P41SwdSVlLcGNEaTqMZgZD+BY5DhixTJRGo4oBpSeh0dm5yyjacfsdrN7QUE1pBzM44EOK+HVoDvjxuZmO2OyG0FnhX79Ad7tuYqX4qi4dRAN7hCt+JMQgp3jG43oJgSymh28aAREXEjjGZk+s1afZipMS3B1/qjrR2nPC9iUBtPD3yfFlRM1YJpLL8Gg1SycDAorqxYpxahFGWXELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKfSG5u6OlI77Qm/QjMfB9JCccWSfpw0bv4BZZ68lqs=;
 b=h0C+bMsgMf6wHaYi8Ge5YRequC4qF4avKX0p+VhIE7jGgRQsd5Wpfssue73MRyb0P7eA/cjQEzyKHG7lQuETXYY20iAzgqZ0OoC/gwueX5tyV/enW3w6orOe4r9aY76cLv+mKYv1RIvd28xDID+Z/6DnsW1Xm3fpom82OGaqnFDKY2QVjSo4UqLJiyE3X26ZWjkptb1xtZHiXC1M5sFAOXz7u3me+EUw/0nRTHQW38frMGpDYAHlVHYklhi4QfqbS9aHqCLIfJAccp/GTnle6EK1g5XCcwLhYcw/TV8aCKB16dTQuPynmrMwgSts+7jN/0WwP9lPWMklAR55HS/uuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKfSG5u6OlI77Qm/QjMfB9JCccWSfpw0bv4BZZ68lqs=;
 b=h/vdx4WdBk5LnRQRAFR1op+U21KzEWp9TaWRAx2pXoYqvjUk0xRKjVGpdpa4Va+4Ag60i+tUqlEKiUpm6CMMXfqsOuz2GgV47ijS8ToB+WgBVbckYPxbxIoBXVEDoTCZ37pCfJ3gykjRo6QrtXpuPWPgJCrl1EB2+g3IX5wAMrw=
Received: from BN9PR03CA0691.namprd03.prod.outlook.com (2603:10b6:408:ef::6)
 by CH3PR12MB8074.namprd12.prod.outlook.com (2603:10b6:610:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 19:54:25 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::d4) by BN9PR03CA0691.outlook.office365.com
 (2603:10b6:408:ef::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 19:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 19:54:25 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 13:54:24 -0600
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/32] drm/amdkfd: add debug wave launch mode operation
Date: Wed, 25 Jan 2023 14:53:53 -0500
Message-ID: <20230125195401.4183544-25-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125195401.4183544-1-jonathan.kim@amd.com>
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|CH3PR12MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd8997d-83a2-419f-65d7-08daff0df5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYMEW/LhOS9fdH7BKvvp5GGuLvJtEDB5wONXjW7KN+ekr+FsW6ntQLfkQ0PNmwJRk/gg5RYYmD2Use1hoUOWGRE2+tZdAkosxHD1w1Iq1GIThTfOF1FOdLpyxMx54+x31yXCHcU37xVH3OXl8YWih/XA27SS/1C2vhfNVre1qNQcMbPEcmCf7KtzcdbBC7IrHYH+R6mlLUUNgZA8Vs5XiFOqD3LUXz+3jZV5RZFF1tCEj1XK0yMCZdttpxzwGq35UAVrpTPtW0WMY0ysdYjOIRbIK/6mkc/PNbKCHyIJ/QA9bGSoZ3WVWZsnTN5tr5EY35FMmSYEaOy43HCdz5KuoLXOIv99gSOyeXf/kzpYbCdHUCEIokszuuBmAJKN/a0JBFXdsEOt1VMZin6+pVfApGHqJfKpy1/KheC8dr0WUEi8Du85nDOxo1x6av6dmGS+1PedMV+GVC4WKyXEtR/FkJqGpxSLXSUXNTZ2ghFAOSLqkd8Y5GTuQkUDzxILnHfnrof1ZmzKiuwAzlP5yYrwa6PvusQo+tfu8Gmt3Kx807O+F5PfpFNQIlgUQ5IJUWyOwXwb24Aydi/ew0BZhHEEfunQKPP/IffYlL7EPMciyf6rAAQrvn5RI9u8vLo8C3SsqZZ/isrOvz+T76zLKhYrg7/IVFyJ+u2VHJOxE0R5NbqP1fVUNV/TIvWP27F4loZlOM6J1ecleAX8FvsPM8h23QdMzHz2tUK+Rn0W3uQk5qF2+H+KQ9p/eHYKRhdYlZb4HoUEuk79UkqXjaPUvvLD7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(36756003)(426003)(2616005)(41300700001)(8936002)(47076005)(336012)(356005)(81166007)(82740400003)(2906002)(30864003)(5660300002)(44832011)(83380400001)(1076003)(86362001)(82310400005)(186003)(26005)(478600001)(6666004)(7696005)(450100002)(70206006)(70586007)(4326008)(8676002)(16526019)(54906003)(316002)(36860700001)(110136005)(40480700001)(40460700003)(36900700001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:54:25.1471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd8997d-83a2-419f-65d7-08daff0df5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8074
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow the debugger to set wave behaviour on to either normally operate,
halt at launch, trap on every instruction, terminate immediately or
stall on allocation.

v2: add gfx11 support and remove deprecated launch mode options

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 12 +++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  1 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 25 +++++++++++++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  3 ++
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  3 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 14 +++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 25 +++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  3 ++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 36 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++-
 11 files changed, 124 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
index 84a9d9391ea4..4de2066215b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
@@ -107,6 +107,17 @@ static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device
 	return data;
 }
 
+static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
+
+	return data;
+}
+
 const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -128,6 +139,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
 	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
 	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 0405725e95e3..500013540356 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -412,6 +412,7 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 32a6e5fbeacd..7591145bc69f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -854,6 +854,30 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 	return 0;
 }
 
+uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+	bool is_mode_set = !!wave_launch_mode;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			VMID_MASK, is_mode_set ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			MODE, is_mode_set ? wave_launch_mode : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
+
+	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -941,6 +965,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
 	.program_trap_handler_settings = program_trap_handler_settings,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
index 85c929fc2926..34c04a2bb83b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
@@ -36,6 +36,9 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t trap_mask_request,
 					     uint32_t *trap_mask_prev,
 					     uint32_t kfd_dbg_trap_cntl_prev);
+uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
+					 uint8_t wave_launch_mode,
+					 uint32_t vmid);
 void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
 void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
 					       uint32_t wait_times,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index ae3ead207df4..8627c5458973 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -675,6 +675,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
 
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 3fb81e6e9422..4fdc25222dcd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -725,6 +725,17 @@ static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *
 	return data;
 }
 
+static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+
+	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
+
+	return data;
+}
+
 const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.program_sh_mem_settings = program_sh_mem_settings_v11,
 	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
@@ -744,5 +755,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
 	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
 	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
-	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
+	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 81643385512a..a3c8f5578788 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -790,6 +790,30 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 	return 0;
 }
 
+uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	uint32_t data = 0;
+	bool is_mode_set = !!wave_launch_mode;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+		VMID_MASK, is_mode_set ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+		MODE, is_mode_set ? wave_launch_mode : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
 /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
  * The values read are:
  *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
@@ -1060,6 +1084,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
 	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
 	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
+	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
 	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
 	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 47cff392b434..2a2ab42037e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -67,6 +67,9 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
 int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
 					     uint32_t trap_override,
 					     uint32_t *trap_mask_supported);
+uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
+					uint8_t wave_launch_mode,
+					uint32_t vmid);
 uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
 					     uint32_t vmid,
 					     uint32_t trap_override,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 28b9db5806f4..205a487d91d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2904,6 +2904,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
 				&args->launch_override.support_request_mask);
 		break;
 	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
+		r = kfd_dbg_trap_set_wave_launch_mode(target,
+				args->launch_mode.launch_mode);
+		break;
 	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
 	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
 	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index a9b52f114ac6..b630633609b0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -303,8 +303,10 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
 {
 	int i, count = 0;
 
-	if (!unwind)
+	if (!unwind) {
 		cancel_work_sync(&target->debug_event_workarea);
+		kfd_dbg_trap_set_wave_launch_mode(target, 0);
+	}
 
 	for (i = 0; i < target->n_pdds; i++) {
 		struct kfd_process_device *pdd = target->pdds[i];
@@ -599,6 +601,38 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 	return r;
 }
 
+int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
+					uint8_t wave_launch_mode)
+{
+	int r = 0, i;
+
+	if (wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL &&
+			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT &&
+			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG)
+		return -EINVAL;
+
+	for (i = 0; i < target->n_pdds; i++) {
+		struct kfd_process_device *pdd = target->pdds[i];
+
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
+		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
+				pdd->dev->adev,
+				wave_launch_mode,
+				pdd->dev->vm_info.last_vmid_kfd);
+		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
+
+		if (!pdd->dev->shared_resources.enable_mes)
+			r = debug_refresh_runlist(pdd->dev->dqm);
+		else
+			r = kfd_dbg_set_mes_debug_mode(pdd);
+
+		if (r)
+			break;
+	}
+
+	return r;
+}
+
 void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
 					uint64_t exception_set_mask)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
index 864eb01f8973..0d70f162d6d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
@@ -25,9 +25,6 @@
 
 #include "kfd_priv.h"
 
-void kgd_gfx_v9_set_wave_launch_stall(struct amdgpu_device *adev,
-					uint32_t vmid,
-					bool stall);
 void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count);
 int kfd_dbg_trap_activate(struct kfd_process *target);
 bool kfd_set_dbg_ev_from_interrupt(struct kfd_dev *dev,
@@ -51,6 +48,8 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
 					uint32_t trap_mask_request,
 					uint32_t *trap_mask_prev,
 					uint32_t *trap_mask_supported);
+int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
+					uint8_t wave_launch_mode);
 
 int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
 					unsigned int dev_id,
-- 
2.25.1

