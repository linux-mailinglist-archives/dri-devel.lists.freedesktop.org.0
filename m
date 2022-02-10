Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C14B189E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13810E981;
	Thu, 10 Feb 2022 22:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBB810E977;
 Thu, 10 Feb 2022 22:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgpbiZG/S6ltg9tqq+QBVr/sfCiVtDC9me0IQ1giExR6CuCajSjQ9JCLBHiB/9E1n6Pxtve2ZcATgFZzy40TABsEq3DfSe5qH7Z/FeOA7xd9MfxjKNmP1Mujcgbgpgh2T8bY6CM3Ae+aYx/VGldM8ur2GYmZZta5ORK0FdEZGRPnCAi7vviU/pC99E6XbzNPB9qYmRgebQ5NXmE92qEPRhpVlLYTmvgs5mPx/Yd13msXS4IbCcO86BSHgIrGpc7fStpSCvAf8+wh2o+Vmv8wqb0o94z/V/84pncSmTsHY41BVbvTuLPCojJtru5/d2WD+gJKoYcumyVrGgPMFCMzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN1eDs/KEUeUvmBl7qJuY3X9snA/o6NJJcfBhOOp0fc=;
 b=AfiEV3WMwd0Z9PsovgFhLAnw3T9gYEwOU10BzemnYMmlYPQerMhwawrAfWySZp5zV5FcO72xMeYRqMoeyCeS7MlbpwqhbRwXp1V1C45j+qy72DRtGYq4bYOWDfnieux5H4RCBBujcMmy5sKtAFw0WcbKB/nU4bOP7t5Ik/Q0OeO5Nm1lQ9iwMVzqCu+yduzLWLhcLgDTrtXHKHioxFxG8PKNL9uhIAEghRR9kyj/RJ4VEUVjKh64ELx9QKEn23Koozh9YHpg7bzaDo3FWvLIM643Ue8auYWeRYIKBH7fEFgWMiulyG9qUbAfP5ZzulKtSD82FAuLbm7pMqbKMVfd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN1eDs/KEUeUvmBl7qJuY3X9snA/o6NJJcfBhOOp0fc=;
 b=QMI7XEF2XkFvQT7T8bqhutnUKgsJKUXo2EJv70FCkWI6XCxIbwIEMm/PZIhyShjVUkEhdQG3p8goq+dTuhch3KEZbooEmvXM9j3urEW6NQULtLIYBtxAbRLgkfHWK39q9BGxtg+8Q+8EBZAV0ehn6J265H7bEEN0b26I2OEfN1o=
Received: from BN6PR2001CA0042.namprd20.prod.outlook.com
 (2603:10b6:405:16::28) by DM6PR12MB3948.namprd12.prod.outlook.com
 (2603:10b6:5:1c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 22:43:49 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::b1) by BN6PR2001CA0042.outlook.office365.com
 (2603:10b6:405:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:45 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Andreas Noever
 <andreas.noever@gmail.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 5/9] drm/amd: drop the use of `pci_is_thunderbolt_attached`
Date: Thu, 10 Feb 2022 16:43:25 -0600
Message-ID: <20220210224329.2793-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210224329.2793-1-mario.limonciello@amd.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e031db3-25d4-4783-03cc-08d9ece6ce2e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3948:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB39488B5AD81A6FDBA05700DDE22F9@DM6PR12MB3948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUQQ5elLn4HA1pcApS6YnElOcXvoqLOe96g78IqA3OwcJD4t4gHt7a9pJcjNjqZylBMUrAx9uo5tSNJBZUwyF2/jZ2iQGMecgzXDOpxJ2V9N7vW7ux+9OuJlkuy8UfaMUcRBaUvX30t2mPOAcHI7gX4+/DcPkl56k0BMLIcQuLhcc/vWjIPA4TZy+HI+mCeEH72vAkY2eIDDopsh1mk2Gj30/sJjtD+i74SH/H0qZdNIoUJDOX/E9CErMl/yUSSOuhYiE/YvDK3pY0ti1HKNDFz+ffxGBfz6C/VVqjOD0b+ohFryPHMspD82mHW2PpTTvTh2RJ3jk/vYlFoHLCtSuRMFLb3BiBTeiUuL6gdTX1xKCQeS53sh+BTFPaKDzjm2OrovLz9o6KzyjxaftjjMeb8uQIaLVjZZwG5IX8xvGBtj0nFdOrMvmyK2u8dhLpn1qS+jEUjTFzkxOHHYJwgJMg3HArQykCwnDtuviSkQAvUqDMfKfe3Oe//5+L7juckT2/VEdskSvbi6/u1ZgIrD5gnItBWQPLBWvGkBjizWdtfZWL/yz9AZtDJJu29YR5CszRdbYq81PDB7z6NXrWJl5mjV2T5mI+1bbNXDoRM7tnTgt9jx7LaJco56Vrm89+R3I8ECnFluwa64dWVhKQatfamjJ5VpE2StBjyYq4Mz58X4GD/SicLcSmcS2kNzlElXYiyxxtegKC4K5bmdBWPKNwxFSKAgvEbD87wSBHqVYHI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8676002)(316002)(5660300002)(7696005)(70586007)(6666004)(82310400004)(40460700003)(508600001)(4326008)(47076005)(8936002)(54906003)(70206006)(86362001)(2616005)(36860700001)(83380400001)(44832011)(336012)(110136005)(426003)(16526019)(1076003)(2906002)(186003)(356005)(36756003)(26005)(81166007)(7416002)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:49.4609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e031db3-25d4-4783-03cc-08d9ece6ce2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3948
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 1ebb91db2274..6dbf5753b5be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -161,7 +161,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 	    (amdgpu_is_atpx_hybrid() ||
 	     amdgpu_has_atpx_dgpu_power_cntl()) &&
 	    ((flags & AMD_IS_APU) == 0) &&
-	    !pci_is_thunderbolt_attached(to_pci_dev(dev->dev)))
+	    !dev_is_removable(&adev->pdev->dev))
 		flags |= AMD_IS_PX;
 
 	parent = pci_upstream_bridge(adev->pdev);
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
index ee7cab37dfd5..2c5d74d836f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
@@ -382,7 +382,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
 
 		data |= NAVI10_PCIE__LC_L0S_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
 
-		if (pci_is_thunderbolt_attached(adev->pdev))
+		if (dev_is_removable(&adev->pdev->dev))
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_TBT_DEFAULT  << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
 		else
 			data |= NAVI10_PCIE__LC_L1_INACTIVITY_DEFAULT << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
-- 
2.34.1

