Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1B4C382D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192B10E834;
	Thu, 24 Feb 2022 21:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299E10E74E;
 Thu, 24 Feb 2022 21:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa1j1G/GJOvFdt1u1YixauEtEBFdWSgkgXFo6qPX7CfofayAO0DFI7YsJsKOGuh3bmJyhjFAoa+zYxe4VO5tRchXrMLYm7wXicFbPqLzXraoVd17rlDCCEm5ZLNXkUxGTXY7irUZJFah+Q55rgzdS4GiYR34D7IAyR8HxXBlbbHOR3BLO0vdtgBbLGx7VK0rongGKT+NaZcFzZ+4/r2JFCf6xJj0h4CDKFCh5PzBIli4SxxXMiWXYi76m02hyb8gd0tw/j1kAmCqFzjkaYTFpz/jhdEy/2hT920gs7+/RCRIQK+HSnu+s7Z7jvG/H4DdKT71Ukm36fEvi8l1GK7XEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4yk8hvDmhzfiKFK+3l63Ar/Gg2nsFdd8RGrNekuAok=;
 b=Wer8EXWEClDYmBZczL92c39UUncYcq3MoPO/KtJDqlPy8c8qlGLyNjF3vuRh2/tWUUzSnViyLWC4LH5jvXcdb2tZYcciPAOEZw7s6VRPcYnHx+m3INiUor8oBt52K2ek5QYS/Am3kLxOnWsqvx+nyoKNr7ZVSJ3VP0og6pj3C/3dyn78QhmiYoZGD/UzvQGBMjry1YRQMdYVcB1RMOxce9APnIaPhPLZZ7Me9tcIhNvOZ0OXvP32SVEortMu8mFZjHvB/mYRjh4KgGX4hFwSZ9LAG3f2LWavGXASfP2MCBBnxUxW+ZqqfQJ8UqqhPF48tSkzBvvRHgsewKe/nM3HWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4yk8hvDmhzfiKFK+3l63Ar/Gg2nsFdd8RGrNekuAok=;
 b=N+o2tqdYBFHJ5xVALr3Quxur9fxR/mq8nsbFbnOXKKW/LBG0FnRnp/jz5wDimzPEZC0lT9V+D2RlAwrcdy/0F7nJWvqNYEDlFVTluQfNhWIZCBEEuS7Qmu5a8PeOmpXFenVaf8QDQrAmcvlP+BEFsZMsIDYL+nYAfy+aAh0Rjrg=
Received: from MW4PR04CA0180.namprd04.prod.outlook.com (2603:10b6:303:85::35)
 by SJ0PR12MB5470.namprd12.prod.outlook.com (2603:10b6:a03:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:51:28 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::2a) by MW4PR04CA0180.outlook.office365.com
 (2603:10b6:303:85::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:26 -0600
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
Subject: [PATCH v5 4/7] drm/amd: drop the use of `pci_is_thunderbolt_attached`
Date: Thu, 24 Feb 2022 15:51:13 -0600
Message-ID: <20220224215116.7138-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224215116.7138-1-mario.limonciello@amd.com>
References: <20220224215116.7138-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9de5dce7-a712-46d6-3a80-08d9f7dfcf5f
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5470:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54706252C675F3448EE293A1E23D9@SJ0PR12MB5470.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GkgvkoyynBfUiqFztC6tk3l+GjwnEh7kyC3tRDo4kycc4hkYM1mNKE3+Mns5goRd8fMKtdGBpzRqBNM19Ff16pLrhu/lC6iv83DX1vmtaha+JfFlE8vLjs0qM5ZMLqt9dnapcgjlsTorTcEx6CGqQP/X+7RQvQs0Wcu4iiV+uynt52kI5HFVWPwqru+cVb597UxroqM61HTNqt2pHE7QLHZe+aFw3Rd49AANluzE+jJNEIZAGILKv9nQvdgOBF65t3uUhaS9XBCNM/mCRkuEYzHhPIYvSuNXimev6VBNsetI/yNpxN+LpS9qDHxwM8Zasy6TnNobnGwidq8iGTW9YSbn7U4+QAtYh+Y4bfwm1W+LeGtI5Guj+Bc4eOOBUtvnTF4CVuD28eHBY0neZGVF1aUZ72JTbRh9qdnUep68PxZq8v78+glsdYiEuy1VtK4CXmfnpbOg/QYw1+WAAi9tsZTSdpnRI+7TWqG2gIS2kyIDmu6cD94OLjKrxUyTWoJlQIHKwlOoDVIz4b0o2PVql9n163/mlWjbnjc4/IlW7/23FMzPB4wYpfb/NQCLVD63KxTjuNM1i4hD59Y+1z+JDnzPmYKhmwcqFfJdUrjZWFYGqBdgjjEde6qzQz+xp9XmQVhXfHS8h6ZfXBQLLvcSvNTtrYJ7HieIh9HacxHZIwtL/GHV8qPTW5l4h9QsjAynABGOQ2OWBeadCoenrE0THGj8YlxzKwjfRicXClwceLo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400004)(6666004)(508600001)(316002)(47076005)(7696005)(36756003)(70586007)(8676002)(70206006)(4326008)(83380400001)(186003)(16526019)(81166007)(356005)(40460700003)(1076003)(2616005)(26005)(8936002)(110136005)(426003)(54906003)(36860700001)(336012)(2906002)(86362001)(5660300002)(7416002)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:27.6653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de5dce7-a712-46d6-3a80-08d9f7dfcf5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5470
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
Cc: Michael Jamet <michael.jamet@intel.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
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

