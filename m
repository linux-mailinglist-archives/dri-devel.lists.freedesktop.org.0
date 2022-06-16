Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4154E32E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351C710EA6E;
	Thu, 16 Jun 2022 14:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80210EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+6IjnZ6hNt8A6C6btYjbAsgaqujJ9QY5TSS44IkQzaTUDYIjeJWnmXg632YsCvGRXMPzw9HDEMDjp9nGwZCDa4yrVyqIe4T5GpRJv0G8P43fFWMqvgjG+1Ct6lhmZsJQIt98OPhmmFmzRF8qVtcB2O6s1CgxDsqYALeDHeoRj4fVm4g59KtumRS+kYQNJdR+4Hosx6EjO3uaSRZ2haW7fv50bb4DYwPOYXTT91ZTzOLvps7tw6wHLKy5YYADeOSfe7wtzDxiBTrOCaRDf5ITaUUhQJAi/tIrtsRTLNY4ePPuf/wUmMJazPJDDNTLwPNGs8oH3CAv7i3fgeBuvi9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFV9vS8U1FRaLDFVrIscdACXQ2Xiy7z2scvKE2S1JXw=;
 b=k8GnZO69ccY7SCWwUC9WoWW1m9yQp0ZEq4y0GUGqGN2LPUn1idytMjYnIezOrWfdBmNdXlwOLpuZX3VRyqi699pv81HiaWtbdncDpaJpqkulALQqOq6TurI42vtBenfBd/C5DTatuDcQfjvEAT8JxkBcnFWyUKOFhsqrwV9Da9yJQ2NtiCUBPR6U14mVSLwLdz4STilVAtTnlOyuirtbb4pwL7IPIvUTrwdF84sH8D0LJZxCFDjj0V0G7jjAmHPqsgqgG81BZopx/WeIzfMQFKDwHFGiMd8lY2bnxBStdnvkE4IzhJ6WYaTs3GCSsMmFlpGk3pEQ3+wzS8FRtYKm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFV9vS8U1FRaLDFVrIscdACXQ2Xiy7z2scvKE2S1JXw=;
 b=XLUJcdInEN7hp8w75yyf5AmLcIJrBAMAI2CDfbCKLYvCs9btfz5p7gCA3I7lpwE2yKZ0ywlYCLYb4A0Y3LFboVJfpdNfF4KW9UrarSo7ezRfUBiWBQbTuu6ptv7g/4MA8g7xmgFAdMm3eCJBEt/+E+i32rnYhO7RXt+MS3esEb4=
Received: from SA9PR13CA0114.namprd13.prod.outlook.com (2603:10b6:806:24::29)
 by DM6PR02MB5276.namprd02.prod.outlook.com (2603:10b6:5:46::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Thu, 16 Jun
 2022 14:17:45 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:24:cafe::ce) by SA9PR13CA0114.outlook.office365.com
 (2603:10b6:806:24::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.6 via Frontend
 Transport; Thu, 16 Jun 2022 14:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 14:17:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Jun 2022 07:17:44 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Jun 2022 07:17:44 -0700
Envelope-to: laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-kernel@vger.kernel.org
Received: from [172.23.135.119] (port=58106 helo=xhdvgannava41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1o1qJc-000507-DS; Thu, 16 Jun 2022 07:17:44 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: <laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH V2 0/2] Add Xilinx DSI-Tx subsystem DRM driver
Date: Thu, 16 Jun 2022 19:47:34 +0530
Message-ID: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37d0fb75-ee98-45e1-6d85-08da4fa2fbca
X-MS-TrafficTypeDiagnostic: DM6PR02MB5276:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB5276D8B832ABFDD7566C67F6B1AC9@DM6PR02MB5276.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ColoefgM7ZhimTqEVnZ6W9ZSjvi7ifr5vBqODLcNTeoPNz92V9T10+PpiH8/dAaQ9SJ+AOqaXXMRrBCY7632ZsfCxKe6nccBmQ6jVkiU00pG+UhqoBrqU/ikIlQnucMFpwJEAHnyLOWGf182BSacBOydtYlRnMbl52N3LaUSF5vJN/heetds7cnE79fwGBCEG4wxVrDwlg47nN5P4bnwrg4eX28WtyB7Z1RqEZKPlsMG5w4I82Fw5iwYxaBCCgV+n5cl66amBRnRI/BwaOWxwRJQNo50kqPkT2AElBM4mC528dI2HbMzjLbrQ9JYPaYdiuvytWcHniOqVw12RRgPrTUm/HlHi285O6YKJXqkzKYWlds8sV36JOrIM6cqkCyr+IFkb+H8UNkLb5fpewHPG36lgF3599xHc6scv0qd18b32jNlQmXU/6ouRTjB/eYopWcs6Qik+9SZpaBjsUxaqNuLlPUb1pUckMnJB06v/MIkt7+Mc8+nksfuOsrmJ4WjLs4UuTvMP5U0mSk7SHgyQ4DTXpSSpDh0du4tSl8QLi6ER48lPMpAv+qlwiadcnNMZ/zfRFQM6POtyJItm+GYHLXmhXKht8/erjvekjR085RUGBKnjhHbBIpyU+Q/0awBiU5ghbYwoITr8QnLKugH0dAizHvOzxsWo2Zb7dChI89IDnpZpDZr/DvH2g5Mqo5eA8EeBzDyQQgz1XUrTw6xqQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(107886003)(36756003)(83380400001)(70206006)(8676002)(316002)(110136005)(54906003)(2616005)(4326008)(7696005)(70586007)(508600001)(7636003)(2906002)(356005)(8936002)(6666004)(186003)(336012)(47076005)(40460700003)(426003)(5660300002)(9786002)(26005)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 14:17:45.3209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d0fb75-ee98-45e1-6d85-08da4fa2fbca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5276
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI DSI TX subsystem allows you to quickly create systems based on the
MIPI protocol. It interfaces between the video processing subsystems and
MIPI-based displays. An internal high-speed physical layer design, D-PHY,
is provided to allow direct connection to display peripherals.

The subsystem consists of the following sub-blocks:
- MIPI D-PHY
- MIPI DSI TX Controller
- AXI Crossbar

Please refer pg238 [1].

The DSI TX Controller receives stream of image data through an input stream
interface. At design time, this subsystem can be configured to number of lanes
and pixel format.

This patch series adds the dt-binding and DRM driver for Xilinx DSI-Tx soft IP.

Changes in V2:
    - Rebased on 5.19 kernel
    - Moved mode_set functionality to atomic_enable as its deprecrated
    - Mask fixes
    - Replaced panel calls with bridge API's
    - Added mandatory atomic operations
    - Removed unnecessary logging
    - Added ARCH_ZYNQMP dependency in Kconfig
    - Fixed YAML warnings
    - Cleanup

Venkateshwar Rao Gannavarapu (2):
  dt-bindings: display: xlnx: Add DSI 2.0 Tx subsystem documentation
  drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem driver

 .../bindings/display/xlnx/xlnx,dsi-tx.yaml         | 101 +++++
 drivers/gpu/drm/xlnx/Kconfig                       |  12 +
 drivers/gpu/drm/xlnx/Makefile                      |   1 +
 drivers/gpu/drm/xlnx/xlnx_dsi.c                    | 429 +++++++++++++++++++++
 4 files changed, 543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi-tx.yaml
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c

-- 
1.8.3.1

