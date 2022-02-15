Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F94B5EBD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BCE10E35E;
	Tue, 15 Feb 2022 00:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2C110E34E;
 Tue, 15 Feb 2022 00:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzUqH7cZyo9iKW8KEdWZvCv9t7/ADTPgBVvH58VIAixf8O3jUe9i1OxmUq/4UY6zhDBldLlI0WhoC8VloVFeeTXtid9+Jvqs7OxRQCMWZU6dXA6lSSegldnQCR7Qh3ub73K/TbdMc9mfXAQv78tZ/Xqd5XuOXiTqcTYS0x9p/PXDiYgjx/v4ZSbjsRtc28tmoYaN4T4Cv6WDnuJfxudOoqXM8UFERgC44fq2LIO65ibZjNNrH99u0S9xUb58zAb9VWY9F8h1KIS+08T+TcVcijI1+qz9Ms86mqokez0/riGv6xBa6JP6NAcSxxfazOAkdUWN5pL2Nb+2LIFbMekzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=TnthCXFErxGiQUjgomwKrQPj8iM8+V8nPULwptxn0iqLbaHPldPFDRB+ZSj5wseKfk33NDn13ZOrGR9m9Nr3egQXi3zKrkbGa6kdmXPrSxqSPKVKogknhy+vUck8F0NwKhYFldMFuvCacGqu8eJZ1Z2q9ksfq4TDbTuxjMWMlI3t+cT9c7pVDsBBxgR3TNPURFgiMAHVS+mLPt084syXe3UNFvFrkxYO1ZIFb9S9gA18rrI2JjMIVaOkzoS8NsKmMRqJ60C9Dc1jdjQlpYwGDfDMDrfrbUoKOzj6kVuGEREf84tZMCXW5kuOdoHGNmjJxarZcORCgQ7wWb3UpwjDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePYmeTfI1tYVdV1YQeEXeXNbHxPMCjFPOZ6uOCDxB6I=;
 b=0/l6wkrJzPlHVr6yGGbwOWSRvM9rVNcUoAxG1IbZGe/XgOzFN9JF4sx2v+8PJUnFV2LoH7rjrOnBROwMP/bS+QMPJrZt9/RNZZhSSblerzS9Xbv2uU93LbN7rigAkVidkY2Z12NsnyU4/Bv2yrSRDHBaCkCY9QIME9YLwCDi9hQ=
Received: from MWHPR12CA0040.namprd12.prod.outlook.com (2603:10b6:301:2::26)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 00:04:15 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::8c) by MWHPR12CA0040.outlook.office365.com
 (2603:10b6:301:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:13 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 02/10] PCI: Move `is_thunderbolt` check for lack of command
 completed to a quirk
Date: Mon, 14 Feb 2022 18:01:52 -0600
Message-ID: <20220215000200.242799-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215000200.242799-1-mario.limonciello@amd.com>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3978f08-0c6d-44da-8829-08d9f016b433
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319436DECB9FE3A126FBD09E2349@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hW542G2wyaydF/z6YxFne4hMw1TDKqvj+33ePdrrUWWPSjNjSNC6ABt/hUPEHol5l+SvtJlxpb17yOD3Vp1mjSmZdeixVx9z6Ohk3hmuiMMUtDaiML3c5IHpwTVDk4OSYmo6iUDzthLmO8BSyAt87ES+g/oiY4U5xV4yqlnXNgLZeCvyol7P4szliL/j618ESruulLfwmHScrxy5cxE7f8EDmyuuyNRYrTPP1GAxwuPaXG7vGCn8vD85YYm2HIR1T0b9xRTphrZfXNlOBDhHD4FD0YQGscPlQ+wUIX2WLuwUR0eLoCM36PVHapNGXey5OQTY5gqbgI00ZSVCCflXEF5cU3Yog4vvVAaY7wL3nmBfao6/+cY4/yb6iXYkpC9/Im1jKxAMTt3DqBGRj1nu0+ckwGHhYt+68YiNEBmXJdP7DtYI3lbXvD2sEI+6Eok5WR1jRjHdJyhQj4G+9MlXqHfO09nQqC3sePk9NrEx9v9Qte/+eNbIhJD75tvjeBL355eDtxC5P3QK5jHn7+CtGnmpUmQR9IP8wME/IjeEuBxrNzrWty1E+FI/KrmlB19Bc3ol9qqbQ1CcbHyXo4k6duh1S5J4LyQiNF6VjR04yKQhTS6IBrNVsE2dFeFaQTrwi6bwqgA310afnE73C87JJ+xtBilFIDsUya8wP2vKeJHeBBWfsEHI3yO8J0OEiRnY9hW3rpQoXiuN5IAVWyHedKKnFu+GyfxG9xjg9pLq0rY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(44832011)(54906003)(16526019)(316002)(186003)(47076005)(5660300002)(336012)(2616005)(110136005)(7416002)(1076003)(26005)(36756003)(81166007)(82310400004)(70206006)(2906002)(8936002)(86362001)(8676002)(36860700001)(6666004)(70586007)(4326008)(356005)(83380400001)(40460700003)(508600001)(426003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:14.9108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3978f08-0c6d-44da-8829-08d9f016b433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `is_thunderbolt` check is currently used to indicate the lack of
command completed support for a number of older Thunderbolt devices.

This however is heavy handed and should have been done via a quirk.  Move
the affected devices outlined in commit 493fb50e958c ("PCI: pciehp: Assume
NoCompl+ for Thunderbolt ports") into pci quirks.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/hotplug/pciehp_hpc.c |  6 +-----
 drivers/pci/quirks.c             | 17 +++++++++++++++++
 include/linux/pci.h              |  2 ++
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 1c1ebf3dad43..e4c42b24aba8 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -996,11 +996,7 @@ struct controller *pcie_init(struct pcie_device *dev)
 	if (pdev->hotplug_user_indicators)
 		slot_cap &= ~(PCI_EXP_SLTCAP_AIP | PCI_EXP_SLTCAP_PIP);
 
-	/*
-	 * We assume no Thunderbolt controllers support Command Complete events,
-	 * but some controllers falsely claim they do.
-	 */
-	if (pdev->is_thunderbolt)
+	if (pdev->no_cmd_complete)
 		slot_cap |= PCI_EXP_SLTCAP_NCCS;
 
 	ctrl->slot_cap = slot_cap;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d2dd6a6cda60..6d3c88edde00 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3675,6 +3675,23 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
 			quirk_thunderbolt_hotplug_msi);
 
+static void quirk_thunderbolt_command_completed(struct pci_dev *pdev)
+{
+	pdev->no_cmd_complete = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EAGLE_RIDGE,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LIGHT_PEAK,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C,
+			quirk_thunderbolt_command_completed);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
+			quirk_thunderbolt_command_completed);
+
 #ifdef CONFIG_ACPI
 /*
  * Apple: Shutdown Cactus Ridge Thunderbolt controller.
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8253a5413d7c..1e5b769e42fc 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -443,6 +443,8 @@ struct pci_dev {
 	unsigned int	is_hotplug_bridge:1;
 	unsigned int	shpc_managed:1;		/* SHPC owned by shpchp */
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
+	unsigned int	no_cmd_complete:1;	/* Lies about command completed events */
+
 	/*
 	 * Devices marked being untrusted are the ones that can potentially
 	 * execute DMA attacks and similar. They are typically connected
-- 
2.34.1

