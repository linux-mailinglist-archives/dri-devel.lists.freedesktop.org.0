Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07651565BE2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E218610F867;
	Mon,  4 Jul 2022 16:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86F10E14A;
 Mon,  4 Jul 2022 13:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrVonRZU22FqgCLioM3yyZGxnXVuDnXv1A+WPL066dwZhp9xrNm3AS+67FqSzpbDWrRWBpytA3jx+KRzhPiL/g67x7bFRSwV4jA4rGLMyZ0dp8QngR0M8ZIV+EIsJ8F1TCyygFI/aNUu8HXnq0x5v3hrzDQdOAg2STZt+SaMEP+IPswbPFOb9l0oAVAIoWfBC72uO+68sJMMzaRzbp1tjX5U2NbmYO6oIoC1sPFrhK0viF3Y7vE0jz6XPltlzljpodsdVtxLaRDybBnjG3/yEc3qlhAvm6pVCwyOM0HxcM1lrLGkDoy2V0apD5MbXmJ7FQslyJuITHZNz25t0/mEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=facYBw460/z3zwkkHpOK8rJ3d2dquxWN2BJZZFdLeww=;
 b=kzCeivlwzzwpUvrO9uOH2dnGdzsTOnLkQ5i0bQQvIjePax7u0Tugx7MCe8nvL9gSHUYG3A7w1YIfCBdiUulhZvaFhQKLLDX1mEKEGXYLLRRIQlHRY5CXWyresuKzafAskJFnTdTZnqnzbsJZ5CRd1txtbyMQh4OhXxEToYZECx38rcdIGroepXNwSKBkmG1amh4A24W2+UFJPzDzmrSWY4Cp/u5wnECqJ+KxZdS8ccNfw5xosT3xmdjd/eHDrl9o+GyDPBD3wT311424dVMX1NIuLc59CAYgmvb3KoGH5PpL7fvPa4HLLVdjeQaIqWHKRTyFgKTi1NWdKFNLif04Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=facYBw460/z3zwkkHpOK8rJ3d2dquxWN2BJZZFdLeww=;
 b=GI7Q/PxAv08okn8uyI1ttVsc1fkiGIrTLbnLOOOLki0BtU11yyn7AEClkz+dDqU17cMmIfvMWmNVWldQu6ckH8EJT3pJFOn1bbkONA/wwYihcxn/t8bKBXUSymp0mSUQDj5Evbk0US4hBTKp7eLVmCq4XzvrD5Ol6AMxCwIPV2A=
Received: from DM6PR07CA0112.namprd07.prod.outlook.com (2603:10b6:5:330::27)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 13:54:43 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::35) by DM6PR07CA0112.outlook.office365.com
 (2603:10b6:5:330::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 13:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 13:54:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 08:54:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 06:54:41 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 4 Jul 2022 08:54:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH RESEND V2 1/3] drm/amdgpu: fix checkpatch warnings
Date: Mon, 4 Jul 2022 19:24:18 +0530
Message-ID: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 958a2920-002c-4728-598b-08da5dc4bf2d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5M+Xy6r+R1tnqfYtRUa08zryWsyQj7S/UTLKpiZdiB0FjTfGmmw0M3xpg9lRPRhFB0m9PjRBKTySk+axmkDt1bXE+5d+1yIrzPpLaLzCmNIGW71+X+flRsw6cTnTFnZC3jZHMJ3ucVngE3LhCCyTH9thT4ZMWroz4ylWHulspQ02mzhfW9mIxbBLV3hYdRHJkHx1E4zEtZGes3jUUOUl/roHu1tz4/olnD+xcvHBtNAvy0YAb5qE9XHEIGqVjtTYxMfVCEm3CHpfy/n8ApGOk+fDxQccnfpgtZZdvFUaSm5uSwT0MCbLtS2Q8M7IkY1aT8Q+jOnj4Y56xRSv/w42i2TJfT9brQ9gH1zU1rQvayjA1SB1S3xpe2I76bccUMgtNSZiGnpin6yQTF5sDbC8NiwEXmyhy+bnIoY5C9yj5jQprp7K7LkyLC+e+xhrSjD+CG/4GrdTFSUI44Mqisi3Z43NYj6h8tfLND8BPiUzD9zDq4rmCC8lu1OBp9VjXfVe9rsB25sDtx5mqz2loQvFdtrNMlTfmNVzXIsOD9DdD1HevXQAoUT8Oo2+vYotdqjZjybYo+LVsn9T3WGjow79JIetzoIRNxADaTkQxvEO1A/zhsRXoBZ1xoZQ57bmRKXQ1Bqocox6EHTIXIoWzzVyv/SFMPoXY51cVpF/wxGy7PQXRfnVnt+zrMHX5KQ1n+twFVBa/1wiP9ONlJRM2U64SFYvrUZgipKGN9dHimRzh3vBoHTL3e7kbE7pmzhTc3p04y5gVa7dV6bSrg6KqGxp3BOajet/QKIBXHm/nSNlOm5EBxHAvNA1s2OwDmaCBleQV2pRsKOAtRKw+w+j2JHVYGxE9rVXMeG1/HOlvJJtEz7hze10731D6ZEyr0XBJ/gv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(81166007)(7696005)(34020700004)(36756003)(316002)(356005)(82740400003)(40480700001)(6666004)(36860700001)(54906003)(82310400005)(86362001)(110136005)(40460700003)(5660300002)(41300700001)(8936002)(8676002)(83380400001)(478600001)(70586007)(336012)(426003)(26005)(47076005)(2906002)(70206006)(4326008)(1076003)(186003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:54:42.7802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 958a2920-002c-4728-598b-08da5dc4bf2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
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

From: vijendar <vijendar.mukunda@amd.com>

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
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

changes since v1:
    Modified commit label as drm/amdgpu
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 27 +++++++++----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index cc9c9f8b23b2..ba1605ff521f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -128,7 +128,7 @@ static int acp_poweroff(struct generic_pm_domain *genpd)
 	struct amdgpu_device *adev;
 
 	apd = container_of(genpd, struct acp_pm_domain, gpd);
-	if (apd != NULL) {
+	if (apd) {
 		adev = apd->adev;
 	/* call smu to POWER GATE ACP block
 	 * smu will
@@ -147,7 +147,7 @@ static int acp_poweron(struct generic_pm_domain *genpd)
 	struct amdgpu_device *adev;
 
 	apd = container_of(genpd, struct acp_pm_domain, gpd);
-	if (apd != NULL) {
+	if (apd) {
 		adev = apd->adev;
 	/* call smu to UNGATE ACP block
 	 * smu will
@@ -193,7 +193,7 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
 static int acp_hw_init(void *handle)
 {
 	int r;
-	uint64_t acp_base;
+	u64 acp_base;
 	u32 val = 0;
 	u32 count = 0;
 	struct i2s_platform_data *i2s_pdata = NULL;
@@ -220,37 +220,32 @@ static int acp_hw_init(void *handle)
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
@@ -346,8 +341,7 @@ static int acp_hw_init(void *handle)
 	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
 	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
 
-	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
-								ACP_DEVS);
+	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
 	if (r)
 		goto failure;
 
@@ -546,8 +540,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
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

