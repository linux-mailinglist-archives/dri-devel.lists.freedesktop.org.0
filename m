Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FA4B5EB4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97110E34F;
	Tue, 15 Feb 2022 00:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997F10E34F;
 Tue, 15 Feb 2022 00:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idfP9zzLlVbpcaQt/8fsJ45pGfkuMlzqlu9pUafTObOltm5uc38LOJKUSXWEl5TZmzddFXWIqhiYEIRK0sTkMhIHhUH8S7J2/dxNFeTsbOhjpSByAXQOgKPyO5fwJ3Mrz2nid/K5t7/I5vJzDxIwBFy9VnMIJ5KhUhrnSCU/qOLHsDcGOLEzb8RwsbMRMoS4ZUzT5xsjG1Qdw/evWlHuu5SKDHvTdCoVqFVin0nFR4K6Lk88nQ6laGb0PAu/Q+iDf3iT4NVr8CcRihWVFH4rNtE4/pvBtyMU0EACvR9R9s4tb/b5858yhNE/UQpuaTyUV5FaC9pYJuWyYM4h3EMbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVAtGBdhTr0nI9i7P/d3nAmXfs2p7P1Q45lR0BGzgGc=;
 b=Kleyc8Ix8IYnc4tLUTxtUpzi6g2UQdbbY+KroJgRSmwiwrZT/5liH3EXyv2YaisvjgD+S2nXLjY/bo54lHbdCPd5FrlO/kYCmeLKIi8N3Q0pS8UINJySH51LysNzyfclfqdR1BppLy6cWLHFIDGgta2ecJWWRB3s20UzWAK93dACvenGId2qDT2Li96sQNcjjTp0p+VSJX3E1JcjceB17eVhh56fqaWV0g/DAnBIBrhHrr5gGYts//P3JwQ4S6vSat+/qzANw8Mc0Tf1qu6UPhehSaZhz3PUuRw29s9qeP4yR83zfJ2b/gI1edQWxu/+Dj4rkG1tsJkEWQ6bYsfM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVAtGBdhTr0nI9i7P/d3nAmXfs2p7P1Q45lR0BGzgGc=;
 b=OEAuS4XSmV9PerykY/9XUxfwiODrC7ViMLmSdU8Ln+gMhPcqCj8P4RLrt8lgmoVLVXXnTs2xFfqCzrGm4bJbXR1owJ1P3Q3lqj94B6XWH8NOGsPjZGpVUzgQs7lZLpGRKWKH0C1G2jasuMZpidzBAXH6fJl5NpN3uz+M3uzQoAI=
Received: from MWHPR12CA0025.namprd12.prod.outlook.com (2603:10b6:301:2::11)
 by MWHPR12MB1360.namprd12.prod.outlook.com (2603:10b6:300:12::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 00:04:16 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::43) by MWHPR12CA0025.outlook.office365.com
 (2603:10b6:301:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:16 +0000
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
Subject: [PATCH v4 03/10] PCI: Detect root port of internal USB4 controllers
Date: Mon, 14 Feb 2022 18:01:53 -0600
Message-ID: <20220215000200.242799-4-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba65af27-8c13-43fa-cdaa-08d9f016b4dc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1360:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB13608D74478F55D99DCF005BE2349@MWHPR12MB1360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WeKwIVssSW2binO3B6WwxmmeOlBwJ70yRXidbPpOJnQjBxtgg2HQbImRxv9eqWS8OaOejpUHYf2MJLV0z10hm2UmlLh+Wxl78s/sdOGyvi7FNHkAufGeq+Po98G/4otkottQ2Te8m+2KSLCHa58h4ba9cU6Lr/MZtcX1pxLUlJlAQLgVFX0OI4RXQcyuentcKSHwwZn45VhMwT/07Eh+6HLrBDorBaHzp4vOOvC4OsKvqjn7c1eQgEVISL6NdY1v2eNdEW+jpzm4XdiIFZnnTq6PjoElsYNFJ2lT/4W776aMkjPlJOZp/oqgIBq5yNoZWNm8ZkvlY36Aoch1xpyDEwW/9n90D0VDi1wp4ttIO6TgcHPm9d6nVl9/g3E1tvEvat7avL/VLZMRFQ+hHwfumwKexDA8mR2Sgw2Br9aoNuTRwFDAkMDtXAQdrTnUcP6EplbR3qIBdzO7xd+kcLB8KVA/jVuXw8qJ2+VySrDANN5gsxQDEv2uJWLfNl6zfkWmFcLc6qkjlEKyqp9hxf0l7iPqcZZEB7my08Z2OtYg3U5fy50UsQ34bAKURN7kCxER8JJsQOCx1cd2txzhb1CwmEBfTlyY5iRXlbHMyMssWhJz22jwSkSGdK03GjDY/7RWlZ3g9FSG1i9ESpYpIzGqqvz55FGcbNYIez2s8WMLPy+ms6eXvdKel4q29yXABEdA4w1XJB6lY5XkyGZHWnwnI6WOg9NpGvRM+WPaSq6z0VF4opKh1P5SS2Q08eQ1IDTASdP1A9Q2r2B4D7Z6mgHORKEktfg1w6LGrkq5lOvfRvo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(5660300002)(16526019)(47076005)(110136005)(54906003)(70586007)(70206006)(4326008)(426003)(2616005)(336012)(8936002)(36756003)(186003)(26005)(86362001)(8676002)(1076003)(83380400001)(7416002)(6666004)(36860700001)(81166007)(82310400004)(966005)(508600001)(44832011)(2906002)(356005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:16.2076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba65af27-8c13-43fa-cdaa-08d9f016b4dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1360
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

The root port used for PCIe tunneling is the root of the hierarchy used
for all PCIe devices that are connected downstream.  Tunnels are created
and destroyed by the USB4 SW CM.  So this port should be marked as external
meaning all devices connected to it are appropriately marked as removable
for downstream drivers to detect.

This can be done by looking for the device property specified in
the ACPI tables `usb4-host-interface`.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#mapping-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci-acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index a42dbf448860..695dbd88b8b7 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1335,12 +1335,21 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
 
 static void pci_acpi_set_external_facing(struct pci_dev *dev)
 {
-	u8 val;
+	u8 val = 0;
 
 	if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT)
 		return;
-	if (device_property_read_u8(&dev->dev, "ExternalFacingPort", &val))
-		return;
+	device_property_read_u8(&dev->dev, "ExternalFacingPort", &val);
+
+	/* check for root port for PCIe tunnels on integrated controllers */
+	if (!val) {
+		struct acpi_device *adev = ACPI_COMPANION(&dev->dev);
+
+		if (!adev)
+			return;
+		val = fwnode_property_present(acpi_fwnode_handle(adev),
+					      "usb4-host-interface");
+	}
 
 	/*
 	 * These root ports expose PCIe (including DMA) outside of the
-- 
2.34.1

