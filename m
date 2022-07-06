Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14344568589
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23184113540;
	Wed,  6 Jul 2022 10:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04A113540;
 Wed,  6 Jul 2022 10:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J29yd2lpY8RZYIf842orvCZiYre/B05eQmuuOZz0gdwxihTSlyrMe0NhNrHh1DuqHBjz5D7RO6mrbg9I9q1yA+4utLUfyO/kiillZEQC8k4+/8iQQ68n0KJavWzzwiiXim2pXpT1lh/QVCZNdC+wOw2+GwO1712fTZc552BErHA20V47pX8ACfoyrDy9oOAc2kIFiY/fq59JSLHggDSkq+Cw2dOWTjH+WHNWfnuUDvuu+TnjbQVz70HT1mwG5jzl92x1kDNszX5ULQBvHFynYBzbg50DrRopcwi6ilh4i+TkkbWfoFsX4xB95eslr9C2Lngw+lmMpj2CGCojfv19TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rN1Gw+F2UlK7cFjCkeitzaWjpiLHEjAZJOk42jV9Fs=;
 b=lR776golhZQzk7OLQWhk7YY4Zx5+C6ki2C0muoVOH5Msl4zPM9gJbyk7slr8SNFP0encZ65LkZGFlunELfj4N3PvPiUIAGTN8H3P4JG5Bw4YhzOwqeAA4TmJXJGWcj4u0c2xS9OgHriwlF4/0546NhNT5LznxzCkQZRmVsrs6tdDIRQ7Z7hQBX1/spO1vajrNAuCgXhykvi26IEmwXgC/j6oM0KitZ78DuQgGjStsY19wl+A/otOpIEWDgrum5WRdw/nOzPevpAgjroelYDNxc5jN5pic+a+91/z4vImBD2oLmsJ9V8wGM5KyJCtlsmRRGtNuxaWnae8ebngq8d2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rN1Gw+F2UlK7cFjCkeitzaWjpiLHEjAZJOk42jV9Fs=;
 b=b63GcKy42xKiCdY4R9nBWA0KTxQfeRKipa5YfQqwqBXSk9YndnaiAj38m3lARhM5V1fnUQar4CoIlk/PzEhJl6qnJWVLnbbDiHHEysm3ebVqcq/aE0AMVM0Afgf5woSPFgv7sRtwSoRP5n7lTqADA2QV+uriIKzAoAQxdZdIKgo=
Received: from DM5PR07CA0064.namprd07.prod.outlook.com (2603:10b6:4:ad::29) by
 IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.20; Wed, 6 Jul 2022 10:29:14 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::27) by DM5PR07CA0064.outlook.office365.com
 (2603:10b6:4:ad::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 10:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 10:29:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 05:29:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 05:29:13 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 6 Jul 2022 05:29:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/amdgpu: fix for coding style issues
Date: Wed, 6 Jul 2022 15:58:48 +0530
Message-ID: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67fffc3-3fd0-4213-3e79-08da5f3a5f70
X-MS-TrafficTypeDiagnostic: IA1PR12MB6388:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzKfEcAZzDREUu5QDixeGWBHAQo6yoHV0O1F86JAnfoSKBjOZjrhwil//Ah4qkZqxWCbXu90GAZE0qnGC2xhS8QdQ7FnTluiRQKP5zMaN3/p2LlnK/DYfxfekodH78cAi/x7WrOzggdNTPqSemfSKArhfFRwRZ6J++bLVoaULDYlLz5cH6xW3LtCX2tr0ctKUyVGnHgAHllZgQ40le4h5MDWrKovhMPyk3v+n7/jJJ/LleQeqwMH+V/GN15ujGlqDW6+jFZmkxL3qbEEIsT5yxad8vtTVrM6BRpqZq3QheuxaC1SxWbXGd0Bxop3+93JCSLOTVyoeLaMxoPRpI84C38LqwxTS7Z75TwqutKRK0xhTo/xtXbsFmaI2RbpaHlv22caMH1RQyDmwIsyJtQkr+h332e+1E41bv69l+i1H9KEllrtcfdl1OO6TtsejlPFahJg17RiM+YdmhtXsuZFtDoLhtGEXei1hAFiO5ou4oRKPJHoUrL4Ezejqu5KB7HEoj9VabUB9odZWgF9Hvx/um11F2pA3X0rNm5MUdpNrQ/RAmgzKvclno72cyWwEW+ufeE7gacVUQzYAcRZa4GTFWSR1mN+225YfnDybIxjEKfkukH/HcxOGoJ8fD42lSy0XNgCl2HnTGFbzBDXOQ/d9QT7KDH7Ec4v2JvIj+LJGAVujOpRK17Hc/QfaSjI4P0FWx0Z43mH1s2LSdBRE+nFUneQTJw1X5JJOESxWBB1JbaA4mJtphfRIe8vmsLS/Zn0Zyf15jUkSnJhsBWiGeSn7jukqytNzL/PoNsW0s1pyjfBh0dmnHbA2xK61woUlF4zvPccV2BxhVfRwg+SI0UfENO/vCSWgmU0sPQ6rTuz3uDgsl6YXVNVfnpBTKL2O/ci
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(478600001)(82740400003)(316002)(356005)(110136005)(70206006)(336012)(54906003)(41300700001)(83380400001)(70586007)(81166007)(426003)(34020700004)(8676002)(186003)(36860700001)(1076003)(2616005)(4326008)(7696005)(2906002)(47076005)(6666004)(26005)(36756003)(82310400005)(86362001)(5660300002)(8936002)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:29:13.9342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b67fffc3-3fd0-4213-3e79-08da5f3a5f70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, zhuning@everest-semi.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed below checkpatch warnings and errors

drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to NULL could be written "apd"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to NULL could be written "apd"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel type 'u64' over 'uint64_t'
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use multiple blank lines
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to NULL could be written "!adev->acp.acp_genpd"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use multiple blank lines
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment should match open parenthesis
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to NULL could be written "!adev->acp.acp_cell"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to NULL could be written "!adev->acp.acp_res"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to NULL could be written "!i2s_pdata"
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment should match open parenthesis
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace { should be on the previous line

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

---
changes since v2:
          - Removed Null check for apd structure
          - Modified commit message
changes since v1:
           - Modified commit label as drm/amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 35 +++++++++----------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index cc9c9f8b23b2..ceda19152c77 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -128,16 +128,14 @@ static int acp_poweroff(struct generic_pm_domain *genpd)
 	struct amdgpu_device *adev;
 
 	apd = container_of(genpd, struct acp_pm_domain, gpd);
-	if (apd != NULL) {
-		adev = apd->adev;
+	adev = apd->adev;
 	/* call smu to POWER GATE ACP block
 	 * smu will
 	 * 1. turn off the acp clock
 	 * 2. power off the acp tiles
 	 * 3. check and enter ulv state
 	 */
-		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, true);
-	}
+	amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, true);
 	return 0;
 }
 
@@ -147,16 +145,14 @@ static int acp_poweron(struct generic_pm_domain *genpd)
 	struct amdgpu_device *adev;
 
 	apd = container_of(genpd, struct acp_pm_domain, gpd);
-	if (apd != NULL) {
-		adev = apd->adev;
+	adev = apd->adev;
 	/* call smu to UNGATE ACP block
 	 * smu will
 	 * 1. exit ulv
 	 * 2. turn on acp clock
 	 * 3. power on acp tiles
 	 */
-		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, false);
-	}
+	amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_ACP, false);
 	return 0;
 }
 
@@ -193,7 +189,7 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
 static int acp_hw_init(void *handle)
 {
 	int r;
-	uint64_t acp_base;
+	u64 acp_base;
 	u32 val = 0;
 	u32 count = 0;
 	struct i2s_platform_data *i2s_pdata = NULL;
@@ -220,37 +216,32 @@ static int acp_hw_init(void *handle)
 		return -EINVAL;
 
 	acp_base = adev->rmmio_base;
-
-
 	adev->acp.acp_genpd = kzalloc(sizeof(struct acp_pm_domain), GFP_KERNEL);
-	if (adev->acp.acp_genpd == NULL)
+	if (!adev->acp.acp_genpd)
 		return -ENOMEM;
 
 	adev->acp.acp_genpd->gpd.name = "ACP_AUDIO";
 	adev->acp.acp_genpd->gpd.power_off = acp_poweroff;
 	adev->acp.acp_genpd->gpd.power_on = acp_poweron;
-
-
 	adev->acp.acp_genpd->adev = adev;
 
 	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
 
-	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
-							GFP_KERNEL);
+	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell), GFP_KERNEL);
 
-	if (adev->acp.acp_cell == NULL) {
+	if (!adev->acp.acp_cell) {
 		r = -ENOMEM;
 		goto failure;
 	}
 
 	adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
-	if (adev->acp.acp_res == NULL) {
+	if (!adev->acp.acp_res) {
 		r = -ENOMEM;
 		goto failure;
 	}
 
 	i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
-	if (i2s_pdata == NULL) {
+	if (!i2s_pdata) {
 		r = -ENOMEM;
 		goto failure;
 	}
@@ -346,8 +337,7 @@ static int acp_hw_init(void *handle)
 	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
 	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
 
-	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
-								ACP_DEVS);
+	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
 	if (r)
 		goto failure;
 
@@ -546,8 +536,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
 	.set_powergating_state = acp_set_powergating_state,
 };
 
-const struct amdgpu_ip_block_version acp_ip_block =
-{
+const struct amdgpu_ip_block_version acp_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_ACP,
 	.major = 2,
 	.minor = 2,
-- 
2.25.1

