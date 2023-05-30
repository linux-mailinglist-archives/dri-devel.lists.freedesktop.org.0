Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D197153E7
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC2B10E32E;
	Tue, 30 May 2023 02:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32D10E330;
 Tue, 30 May 2023 02:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiJrOaxCSbECyxC6Hb5KZf9cnY54RFYnXkM6dSZon5ZosU2cjWz2YwjmxHsOyU8jgwwV6V6wvdK0NxfX2K3Sf5TqP681ol18580XX9UjnXE4c87edVPR5x2Q23KDzFWLIG399pKaZZc3S9C583x1RnvzuAVjMiZO+8CS/3HY+mVVPIvHATFdLnvl9zDNANv6t1p+QA67ZwXfr7OBAOEtiFNHoNm0Yu0MzTmsYJzm7DNLBVG/6K2uv+qXNsLRZX76IG9J4ZSMwgycyD82/vomjPgyx6+/ERYwUV/MxQvNu0+udyal9KlRiWvGoTT8jA99WKUEPsRu+zFf82wwJJZByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DPiMETxb14ONOEhEw63QFZbtn7slHl/H0PGwnx9R4M=;
 b=aAki85GbaYaaBwwqfXvYj4PhicDpmH+4Ux8uRD5I1AN+qPYOoNSDKgcyDfMl2fRI9NYPgHtfKTWUHkJMvETgzCCdEKe0vT8+S73vzDsofJ6zpBHNedYg/oj7r4ymFW0xsIFqasTGK2jlBJTCNCMi87gDxuOMzueozukm6++Pzxbeo3rXhcjbDNAtV0o6bEnxujRGCmyLYc8pLzf/HSpYHyhhKA2G73JMTU+/BFfZ+uX5JWhEuBkC1rKU+yF8Hlph8k33zp3yYfFuCl5VrgnS2S8Mp+tKoLX38YwFPP6/CfyXUL/QLzM1iSACVxxvkfT7y37tqJoZ5DQyosFed4NDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DPiMETxb14ONOEhEw63QFZbtn7slHl/H0PGwnx9R4M=;
 b=cZUSERpK6zQIOQYilZx7EOtZOG3fa5jqQU7Y5cRZhHucCqwCToPxVdki+QPxvYRumZakzMf7+9A4FKSyjX0oVbRx2O2zBPKg/66+XK8wgLdmwyxxawbp347RziHBENZqTMSnY2hqQK4CscmHivHPASr18dhRRKSlmjd6XwFgb6U=
Received: from BN9PR03CA0987.namprd03.prod.outlook.com (2603:10b6:408:109::32)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:44:07 +0000
Received: from BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::92) by BN9PR03CA0987.outlook.office365.com
 (2603:10b6:408:109::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT084.mail.protection.outlook.com (10.13.176.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:44:07 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:44:00 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 8/9] drm/amd/pm: enable Wifi RFI mitigation feature support
 for SMU13.0.0
Date: Tue, 30 May 2023 10:42:26 +0800
Message-ID: <20230530024227.2139632-9-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530024227.2139632-1-evan.quan@amd.com>
References: <20230530024227.2139632-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT084:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: bcccd112-40f5-4b19-f7c8-08db60b7bd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0QZKt1Vs8kWkMNf/DkV4e2rSYTOnNKcsanWZhkLVATuebrrGfag5Z9hg8Lt6WAVyLyfT/uLMb8vIh1g4Z3VMYKtp4GkaIepPMhhkg/O64KuxKg8VpP4bLIizt9GZcOlXs/UgQNAKX0p7av6sga53SUflMQbvLBSSC3WKW4RTn5E89eBmtQ++Lx+rrJ7r6Xm9T84D3LgGWJT+xQpu+xivH8jOuUl0Rmqq7510Qypy1tFoXrufjO0Wg+0E7nz6qNa3mlGTfIOxuN3Ykfk7JKDE0PBch1mJuJ5Ga6TVwA6fRhdLgiikgeTYJq+4sLDd0GNJZRi5TlNf6yQOAU22H1ja9KREZW7Prfci/Z2OUHprqTUc+uHkos1w1cIZPTJJwmA9qyVSC4/0F/+Y+mfCuKX+OQIN4e7flTOZXMNPpU/IEWEF8lLwnXxoDmJooXgxI/XZgVARXWV+GMAUxYF8ED+dI5TrVDVC087W4oNdQw4WEx6BoLxH86s8+oHrMxpqQ4DY9ij+xwJpkJ3UGY8mvtQ2YjD+YdCSO+t9p4mOI7hEQPZbKyhPMMcr+7YDuS/4peWSo4STO309QcFQF1wnZDtd55P596DbspjibeepaahqbgJLNv3CcTpqqXzn6gg9cWJNbwv5nOqcsmAH+NvLe8BnV1U4aiHa2cx581fDHwVNXFY0gThB4hBKbouWKcBr/DIFmX1oTwynuFN2O3TtMZpElUfp7gWiGcB4+66YXw+/coOkpsuvK4Wpr+px5GZP1mEJ/CHrndpWHUTjZm6kwMyf053SHUQjLKzTMGuRW2jNtM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(316002)(6666004)(40460700003)(82740400003)(40480700001)(7696005)(41300700001)(81166007)(356005)(921005)(36756003)(36860700001)(478600001)(7416002)(44832011)(86362001)(186003)(82310400005)(2616005)(83380400001)(26005)(1076003)(110136005)(54906003)(336012)(426003)(47076005)(2906002)(5660300002)(4326008)(16526019)(6636002)(70586007)(70206006)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:44:07.1841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcccd112-40f5-4b19-f7c8-08db60b7bd2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fulfill the SMU13.0.0 support for Wifi RFI mitigation feature.

Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - check the wbrf support using pmfw version(Lijo)
v2->v3:
  - some minor fixes(Mario)
---
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  4 ++
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |  3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  9 +++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 62 +++++++++++++++++++
 5 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index aa63cc43d41c..b71df196d047 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -323,6 +323,7 @@ enum smu_table_id
 	SMU_TABLE_PACE,
 	SMU_TABLE_ECCINFO,
 	SMU_TABLE_COMBO_PPTABLE,
+	SMU_TABLE_WIFIBAND,
 	SMU_TABLE_COUNT,
 };
 
@@ -1496,6 +1497,9 @@ enum smu_baco_seq {
 			 __dst_size);					   \
 })
 
+#define HZ_IN_MHZ		1000000UL
+#define HZ_TO_MHZ(freq)		((freq) / HZ_IN_MHZ)
+
 #if !defined(SWSMU_CODE_LAYER_L2) && !defined(SWSMU_CODE_LAYER_L3) && !defined(SWSMU_CODE_LAYER_L4)
 int smu_get_power_limit(void *handle,
 			uint32_t *limit,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 297b70b9388f..5bbb60289a79 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -245,7 +245,8 @@
 	__SMU_DUMMY_MAP(AllowGpo),	\
 	__SMU_DUMMY_MAP(Mode2Reset),	\
 	__SMU_DUMMY_MAP(RequestI2cTransaction), \
-	__SMU_DUMMY_MAP(GetMetricsTable),
+	__SMU_DUMMY_MAP(GetMetricsTable), \
+	__SMU_DUMMY_MAP(EnableUCLKShadow),
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(type)	SMU_MSG_##type
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index df3baaab0037..b6fae9b92303 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -303,5 +303,8 @@ int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu,
 					uint32_t *size,
 					uint32_t pptable_id);
 
+int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
+				 bool enablement);
+
 #endif
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 393c6a7b9609..8c2230d1d862 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -2453,3 +2453,12 @@ int smu_v13_0_mode1_reset(struct smu_context *smu)
 
 	return ret;
 }
+
+int smu_v13_0_enable_uclk_shadow(struct smu_context *smu,
+				 bool enablement)
+{
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_EnableUCLKShadow,
+					       enablement,
+					       NULL);
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 09405ef1e3c8..c617046cb893 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -155,6 +155,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(AllowGpo,			PPSMC_MSG_SetGpoAllow,           0),
 	MSG_MAP(AllowIHHostInterrupt,		PPSMC_MSG_AllowIHHostInterrupt,       0),
 	MSG_MAP(ReenableAcDcInterrupt,		PPSMC_MSG_ReenableAcDcInterrupt,       0),
+	MSG_MAP(EnableUCLKShadow,		PPSMC_MSG_EnableUCLKShadow,            0),
 };
 
 static struct cmn2asic_mapping smu_v13_0_0_clk_map[SMU_CLK_COUNT] = {
@@ -235,6 +236,7 @@ static struct cmn2asic_mapping smu_v13_0_0_table_map[SMU_TABLE_COUNT] = {
 	TAB_MAP(DRIVER_SMU_CONFIG),
 	TAB_MAP(ACTIVITY_MONITOR_COEFF),
 	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+	TAB_MAP(WIFIBAND),
 	TAB_MAP(I2C_COMMANDS),
 	TAB_MAP(ECCINFO),
 };
@@ -472,6 +474,9 @@ static int smu_v13_0_0_tables_init(struct smu_context *smu)
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_ECCINFO, sizeof(EccInfoTable_t),
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WIFIBAND,
+		       sizeof(WifiBandEntryTable_t), PAGE_SIZE,
+		       AMDGPU_GEM_DOMAIN_VRAM);
 
 	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
 	if (!smu_table->metrics_table)
@@ -2112,6 +2117,60 @@ static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
 	return ret;
 }
 
+static bool smu_v13_0_0_wbrf_support_check(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	switch (adev->ip_versions[MP1_HWIP][0]) {
+	/* PMFWs supporting WBRF feature are not yet available */
+	case IP_VERSION(13, 0, 0):
+	case IP_VERSION(13, 0, 10):
+		return false;
+	default:
+		return false;
+	}
+}
+
+static int smu_v13_0_0_set_wbrf_exclusion_ranges(struct smu_context *smu,
+						 struct exclusion_range *exclusion_ranges)
+{
+	WifiBandEntryTable_t wifi_bands;
+	uint64_t start_rounddown;
+	uint64_t end_roundup;
+	int valid_entries = 0;
+	int ret, i;
+
+	memset(&wifi_bands, 0, sizeof(wifi_bands));
+	for (i = 0; i < ARRAY_SIZE(wifi_bands.WifiBandEntry); i++) {
+		if (!exclusion_ranges[i].start &&
+		    !exclusion_ranges[i].end)
+			break;
+
+		start_rounddown = rounddown(exclusion_ranges[i].start, HZ_IN_MHZ);
+		end_roundup = roundup(exclusion_ranges[i].end, HZ_IN_MHZ);
+		/* PMFW expects the inputs to be in Mhz unit */
+		wifi_bands.WifiBandEntry[valid_entries].LowFreq = HZ_TO_MHZ(start_rounddown);
+		wifi_bands.WifiBandEntry[valid_entries++].HighFreq = HZ_TO_MHZ(end_roundup);
+	}
+	wifi_bands.WifiBandEntryNum = valid_entries;
+
+	/*
+	 * Per confirm with PMFW team, WifiBandEntryNum = 0
+	 * is a valid setting. So, there should be no direct
+	 * return on that.
+	 */
+
+	ret = smu_cmn_update_table(smu,
+				   SMU_TABLE_WIFIBAND,
+				   0,
+				   (void *)(&wifi_bands),
+				   true);
+	if (ret)
+		dev_err(smu->adev->dev, "Failed to set wifiband!");
+
+	return ret;
+}
+
 static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.get_allowed_feature_mask = smu_v13_0_0_get_allowed_feature_mask,
 	.set_default_dpm_table = smu_v13_0_0_set_default_dpm_table,
@@ -2188,6 +2247,9 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.send_hbm_bad_channel_flag = smu_v13_0_0_send_bad_mem_channel_flag,
 	.gpo_control = smu_v13_0_gpo_control,
 	.get_ecc_info = smu_v13_0_0_get_ecc_info,
+	.is_asic_wbrf_supported = smu_v13_0_0_wbrf_support_check,
+	.enable_uclk_shadow = smu_v13_0_enable_uclk_shadow,
+	.set_wbrf_exclusion_ranges = smu_v13_0_0_set_wbrf_exclusion_ranges,
 };
 
 void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu)
-- 
2.34.1

