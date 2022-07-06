Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DB568591
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212DF113378;
	Wed,  6 Jul 2022 10:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6010F0BA;
 Wed,  6 Jul 2022 10:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzLXOvIGWP2yTQIyG2x0dl0EVxrUF5qY1g7uXBeny2pt2BoNtSyvcadEswk4GEOP6iJdw3NDVcApxMacDth2CwBDgEHqyeXn55R/eNvyxCl0Eolr4sViGJsJaI6WicrsvvCl+D4KMMtxYX8m2iO5gtBK7BHr7oALEuoB3q5OdEM1uFPOrVHnE+F4nX5iIuPWMzVgP/kxIV7I57OP1EZsg5Ri5Nt2Dri3tEeE3X/WqSLo7juCUZmlzhVQW8VHEW7TlvQm0uVdIyAFYBAYk8iOZYIFiGlaDMxSp2HL5TvKsN4Erz23TPTtpvnaHEfU8/lRbNfk2ks/T+fclKbvPkSi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcJvlEc6uwqbWnwWQyG26i5Xc7DN55ax6SX5VxR0Wbo=;
 b=JNADYwohjwRa9DMMK1Li4JhAkwY7+yj3H27LKHUGTgq4+0qyQ/++xLZIPpPQ1tjeUUe2v5JmK5Pk5gC1ky9LB71VBtQjkjULnXBvOKZN3tMCKS9Ov8V3LUHV4cqBMQhWVztWF/wIY0C0xtqRbs/56Nlugi2yCBFhl4ZBlbulZzSIRb0CD7BgdaJQM12qdFD600mNiwF2FwylSGjjyFNFmoWQEyFvWm1B07kmFpgv7f/mNUqBgNqeOi/+OLWZA8X/qTIU7onBnLwm80HzP/Rr51yTOBajCVAcVA1g9RqPz64thTZu0/tM4biHMHpCB9uqwTZ42MxseeQQ1q2Sx0u+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcJvlEc6uwqbWnwWQyG26i5Xc7DN55ax6SX5VxR0Wbo=;
 b=wfqjLAkPndDyFJFODVx2SNNNo6kjgxaFBhs7RVrW0sC+qshAkL7szOV9ae4xi/P7Pv6k++dhfijTynRcTRcQJVSBMfN8Ost9taBMBPWYYR3jmP5l9eWM5+TqoTEUPCUDDay5rvO1A7elwlJOG/HGxCMPClZZiwfNUg2vRpMT8Fw=
Received: from DM6PR07CA0048.namprd07.prod.outlook.com (2603:10b6:5:74::25) by
 BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 10:29:35 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::b9) by DM6PR07CA0048.outlook.office365.com
 (2603:10b6:5:74::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17 via Frontend
 Transport; Wed, 6 Jul 2022 10:29:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 10:29:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 05:29:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 05:29:33 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 6 Jul 2022 05:29:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/amdgpu: create I2S platform devices for Jadeite
 platform
Date: Wed, 6 Jul 2022 15:58:50 +0530
Message-ID: <20220706102851.2451164-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
References: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b70f12b7-85cb-4b30-b227-08da5f3a6bd2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5849:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkBiC4KYAcu+wT7iM/JLD/PXLZ9RUmgD9HIXYKEgr7wA2+S2aTKzNRS44rgx0qUA1coqYNq4o0Zv2aUIXVAxXpLXyoG2wpcf7FPqqu9MDUzRc5kDF8Mf9jL/69aOzzBeheNquN3L7fSX4M1tvlGfWBUtoHniHj8lXm0OB3QXpq30zZxKe0vmusmQg9SApJhwom1sGvZI3UHkhxZ6Shw+WxwxHmrszC1dSNg5x3S24r24jX6JUhX4oJ7dEIyYEfO9iuVrdLD3p1ZADAZxyXSAO9SL3uiUZDTdP8BK6d0LVfFi24/ry+QgwmHTAJ07dGXMqLAl7MbUl46Hnm2MXsn4euoaW6FiwzYGIrhBogXmfND/SXAR7Z+K3tLnB5rCx1i3mKxDxx/WwPncdBaYbvoJWJM0BchWf77tWjBXsqrKTCnR7A1/Y7VTEvKDT3w7eHIm3mpWHwoVxUXDGr4VxT/8vOourLbVi1DKwFFLQ3I1Bl243KJWUwyz6k7yjeS1c0hUSFmCwvX9M/2Y0uXAlyjPIHFpqGwQ6zD6QoXGo5cHcTGkhQRUH/BrC2y5tEE/GzePlBhVQdt/ULV12nuOTyhelaARrW/k21bfQ07Dt2wF12byV35lRee1b6+ugYcvtnE6O+/uVfZxDS/YJs2ahCR06ZTnthlmO+YUVcGNbWYFBUUcizwNq4jkwjuEbKEe6FGfyNAf92gf1C/qTQsjEfuoqI3NjbuRqpFGOFaYnFrZp97CuOBGsFlyrOGbq6E+AM+mxtahFGE7ejnZyAVFptdwNSB1aImoT+tBxcG6xVm7q0MgoU7RJW4JVvnWo+THsCeNWO7qCL5J0VnRePmaWHPOMO8L4+jeuV39i36S0uGPltB7ZF89rQDPSafbeb/GNUQg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(40470700004)(36840700001)(46966006)(83380400001)(70586007)(7696005)(5660300002)(70206006)(40460700003)(86362001)(40480700001)(2906002)(41300700001)(8936002)(34020700004)(4326008)(36860700001)(8676002)(186003)(356005)(6666004)(36756003)(316002)(81166007)(426003)(82740400003)(47076005)(336012)(82310400005)(478600001)(1076003)(54906003)(110136005)(30864003)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:29:34.6964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70f12b7-85cb-4b30-b227-08da5f3a6bd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

Jadeite platform uses I2S MICSP instance.
Create platform devices for DMA controller and I2S controller for
Jadeite platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>

---
changes since v1:
    - Modified commit lable as drm/amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 293 +++++++++++++++---------
 1 file changed, 184 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 4c265ad198b8..bcc7ee02e0fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -262,125 +262,200 @@ static int acp_hw_init(void *handle)
 	adev->acp.acp_genpd->adev = adev;
 
 	pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
+	dmi_check_system(acp_quirk_table);
+	switch (acp_machine_id) {
+	case ST_JADEITE:
+	{
+		adev->acp.acp_cell = kcalloc(2, sizeof(struct mfd_cell),
+					     GFP_KERNEL);
+		if (!adev->acp.acp_cell) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell), GFP_KERNEL);
-
-	if (!adev->acp.acp_cell) {
-		r = -ENOMEM;
-		goto failure;
-	}
-
-	adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
-	if (!adev->acp.acp_res) {
-		r = -ENOMEM;
-		goto failure;
-	}
+		adev->acp.acp_res = kcalloc(3, sizeof(struct resource), GFP_KERNEL);
+		if (!adev->acp.acp_res) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
-	if (!i2s_pdata) {
-		r = -ENOMEM;
-		goto failure;
-	}
+		i2s_pdata = kcalloc(1, sizeof(struct i2s_platform_data), GFP_KERNEL);
+		if (!i2s_pdata) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
 		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+				      DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+		i2s_pdata[0].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
+		i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
+		i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
+
+		adev->acp.acp_res[0].name = "acp2x_dma";
+		adev->acp.acp_res[0].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[0].start = acp_base;
+		adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
+
+		adev->acp.acp_res[1].name = "acp2x_dw_i2s_play_cap";
+		adev->acp.acp_res[1].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[1].start = acp_base + ACP_I2S_CAP_REGS_START;
+		adev->acp.acp_res[1].end = acp_base + ACP_I2S_CAP_REGS_END;
+
+		adev->acp.acp_res[2].name = "acp2x_dma_irq";
+		adev->acp.acp_res[2].flags = IORESOURCE_IRQ;
+		adev->acp.acp_res[2].start = amdgpu_irq_create_mapping(adev, 162);
+		adev->acp.acp_res[2].end = adev->acp.acp_res[2].start;
+
+		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].num_resources = 3;
+		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
+		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
+		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
+
+		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].num_resources = 1;
+		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
+		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
+		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
+		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, 2);
+		if (r)
+			goto failure;
+		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
+					  acp_genpd_add_device);
+		if (r)
+			goto failure;
 		break;
-	default:
-		i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
 	}
-	i2s_pdata[0].cap = DWC_I2S_PLAY;
-	i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_PLAY_REG_OFFSET;
-	i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_PLAY_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1 |
-			DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
 	default:
-		i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
-			DW_I2S_QUIRK_COMP_PARAM1;
-	}
+		adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
+					     GFP_KERNEL);
 
-	i2s_pdata[1].cap = DWC_I2S_RECORD;
-	i2s_pdata[1].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[1].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
-	i2s_pdata[1].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
+		if (!adev->acp.acp_cell) {
+			r = -ENOMEM;
+			goto failure;
+		}
 
-	i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
-	switch (adev->asic_type) {
-	case CHIP_STONEY:
-		i2s_pdata[2].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
-		break;
-	default:
-		break;
-	}
+		adev->acp.acp_res = kcalloc(5, sizeof(struct resource), GFP_KERNEL);
+		if (!adev->acp.acp_res) {
+			r = -ENOMEM;
+			goto failure;
+		}
+
+		i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data), GFP_KERNEL);
+		if (!i2s_pdata) {
+			r = -ENOMEM;
+			goto failure;
+		}
+
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			i2s_pdata[0].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		}
+		i2s_pdata[0].cap = DWC_I2S_PLAY;
+		i2s_pdata[0].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[0].i2s_reg_comp1 = ACP_I2S_COMP1_PLAY_REG_OFFSET;
+		i2s_pdata[0].i2s_reg_comp2 = ACP_I2S_COMP2_PLAY_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_COMP_PARAM1 |
+				DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			i2s_pdata[1].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET |
+				DW_I2S_QUIRK_COMP_PARAM1;
+		}
+
+		i2s_pdata[1].cap = DWC_I2S_RECORD;
+		i2s_pdata[1].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[1].i2s_reg_comp1 = ACP_I2S_COMP1_CAP_REG_OFFSET;
+		i2s_pdata[1].i2s_reg_comp2 = ACP_I2S_COMP2_CAP_REG_OFFSET;
 
-	i2s_pdata[2].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
-	i2s_pdata[2].snd_rates = SNDRV_PCM_RATE_8000_96000;
-	i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
-	i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
-
-	adev->acp.acp_res[0].name = "acp2x_dma";
-	adev->acp.acp_res[0].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[0].start = acp_base;
-	adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
-
-	adev->acp.acp_res[1].name = "acp2x_dw_i2s_play";
-	adev->acp.acp_res[1].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[1].start = acp_base + ACP_I2S_PLAY_REGS_START;
-	adev->acp.acp_res[1].end = acp_base + ACP_I2S_PLAY_REGS_END;
-
-	adev->acp.acp_res[2].name = "acp2x_dw_i2s_cap";
-	adev->acp.acp_res[2].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[2].start = acp_base + ACP_I2S_CAP_REGS_START;
-	adev->acp.acp_res[2].end = acp_base + ACP_I2S_CAP_REGS_END;
-
-	adev->acp.acp_res[3].name = "acp2x_dw_bt_i2s_play_cap";
-	adev->acp.acp_res[3].flags = IORESOURCE_MEM;
-	adev->acp.acp_res[3].start = acp_base + ACP_BT_PLAY_REGS_START;
-	adev->acp.acp_res[3].end = acp_base + ACP_BT_PLAY_REGS_END;
-
-	adev->acp.acp_res[4].name = "acp2x_dma_irq";
-	adev->acp.acp_res[4].flags = IORESOURCE_IRQ;
-	adev->acp.acp_res[4].start = amdgpu_irq_create_mapping(adev, 162);
-	adev->acp.acp_res[4].end = adev->acp.acp_res[4].start;
-
-	adev->acp.acp_cell[0].name = "acp_audio_dma";
-	adev->acp.acp_cell[0].num_resources = 5;
-	adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
-	adev->acp.acp_cell[0].platform_data = &adev->asic_type;
-	adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
-
-	adev->acp.acp_cell[1].name = "designware-i2s";
-	adev->acp.acp_cell[1].num_resources = 1;
-	adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
-	adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
-	adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
-
-	adev->acp.acp_cell[2].name = "designware-i2s";
-	adev->acp.acp_cell[2].num_resources = 1;
-	adev->acp.acp_cell[2].resources = &adev->acp.acp_res[2];
-	adev->acp.acp_cell[2].platform_data = &i2s_pdata[1];
-	adev->acp.acp_cell[2].pdata_size = sizeof(struct i2s_platform_data);
-
-	adev->acp.acp_cell[3].name = "designware-i2s";
-	adev->acp.acp_cell[3].num_resources = 1;
-	adev->acp.acp_cell[3].resources = &adev->acp.acp_res[3];
-	adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
-	adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
-
-	r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
-	if (r)
-		goto failure;
-
-	r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
-				  acp_genpd_add_device);
-	if (r)
-		goto failure;
+		i2s_pdata[2].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[2].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			break;
+		}
+
+		i2s_pdata[2].cap = DWC_I2S_PLAY | DWC_I2S_RECORD;
+		i2s_pdata[2].snd_rates = SNDRV_PCM_RATE_8000_96000;
+		i2s_pdata[2].i2s_reg_comp1 = ACP_BT_COMP1_REG_OFFSET;
+		i2s_pdata[2].i2s_reg_comp2 = ACP_BT_COMP2_REG_OFFSET;
+
+		i2s_pdata[3].quirks = DW_I2S_QUIRK_COMP_REG_OFFSET;
+		switch (adev->asic_type) {
+		case CHIP_STONEY:
+			i2s_pdata[3].quirks |= DW_I2S_QUIRK_16BIT_IDX_OVERRIDE;
+			break;
+		default:
+			break;
+		}
+		adev->acp.acp_res[0].name = "acp2x_dma";
+		adev->acp.acp_res[0].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[0].start = acp_base;
+		adev->acp.acp_res[0].end = acp_base + ACP_DMA_REGS_END;
+
+		adev->acp.acp_res[1].name = "acp2x_dw_i2s_play";
+		adev->acp.acp_res[1].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[1].start = acp_base + ACP_I2S_PLAY_REGS_START;
+		adev->acp.acp_res[1].end = acp_base + ACP_I2S_PLAY_REGS_END;
+
+		adev->acp.acp_res[2].name = "acp2x_dw_i2s_cap";
+		adev->acp.acp_res[2].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[2].start = acp_base + ACP_I2S_CAP_REGS_START;
+		adev->acp.acp_res[2].end = acp_base + ACP_I2S_CAP_REGS_END;
+
+		adev->acp.acp_res[3].name = "acp2x_dw_bt_i2s_play_cap";
+		adev->acp.acp_res[3].flags = IORESOURCE_MEM;
+		adev->acp.acp_res[3].start = acp_base + ACP_BT_PLAY_REGS_START;
+		adev->acp.acp_res[3].end = acp_base + ACP_BT_PLAY_REGS_END;
+
+		adev->acp.acp_res[4].name = "acp2x_dma_irq";
+		adev->acp.acp_res[4].flags = IORESOURCE_IRQ;
+		adev->acp.acp_res[4].start = amdgpu_irq_create_mapping(adev, 162);
+		adev->acp.acp_res[4].end = adev->acp.acp_res[4].start;
+
+		adev->acp.acp_cell[0].name = "acp_audio_dma";
+		adev->acp.acp_cell[0].num_resources = 5;
+		adev->acp.acp_cell[0].resources = &adev->acp.acp_res[0];
+		adev->acp.acp_cell[0].platform_data = &adev->asic_type;
+		adev->acp.acp_cell[0].pdata_size = sizeof(adev->asic_type);
+
+		adev->acp.acp_cell[1].name = "designware-i2s";
+		adev->acp.acp_cell[1].num_resources = 1;
+		adev->acp.acp_cell[1].resources = &adev->acp.acp_res[1];
+		adev->acp.acp_cell[1].platform_data = &i2s_pdata[0];
+		adev->acp.acp_cell[1].pdata_size = sizeof(struct i2s_platform_data);
+
+		adev->acp.acp_cell[2].name = "designware-i2s";
+		adev->acp.acp_cell[2].num_resources = 1;
+		adev->acp.acp_cell[2].resources = &adev->acp.acp_res[2];
+		adev->acp.acp_cell[2].platform_data = &i2s_pdata[1];
+		adev->acp.acp_cell[2].pdata_size = sizeof(struct i2s_platform_data);
+
+		adev->acp.acp_cell[3].name = "designware-i2s";
+		adev->acp.acp_cell[3].num_resources = 1;
+		adev->acp.acp_cell[3].resources = &adev->acp.acp_res[3];
+		adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
+		adev->acp.acp_cell[3].pdata_size = sizeof(struct i2s_platform_data);
+
+		r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell, ACP_DEVS);
+		if (r)
+			goto failure;
+
+		r = device_for_each_child(adev->acp.parent, &adev->acp.acp_genpd->gpd,
+					  acp_genpd_add_device);
+		if (r)
+			goto failure;
+	}
 
 	/* Assert Soft reset of ACP */
 	val = cgs_read_register(adev->acp.cgs_device, mmACP_SOFT_RESET);
-- 
2.25.1

