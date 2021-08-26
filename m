Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EA23F8CFB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 19:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FDB6E051;
	Thu, 26 Aug 2021 17:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 92151 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 17:27:44 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126286E051
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 17:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feF6oSBtL762t+v2GVSUPzBvTptfNFoJ4UQn9H+sxjK0OAvOIYRswrz6EOPbr2sR6/4oU37KG0Jsw2hcQGSw9CmhGTIyy6fLFaHPHNzkxFkqd4Mg/D3WiinQhFcJSU0y02XIAKU26Iw1V6vZYvQLHEJPv7fmvxjeywj0A8mucUiG3KZzg+gUB0mGbqUlNQ7246YtAXbhDAtwSt+c/iqXp4KB9w+8zd16cL8t4RFAMiNBng5xCNOliJnqz5TvYxqIQoQX7x5730iga8byf5CSJpOeHuHJN/cEq9YWY7SATftYbUfdmU0sRQpvcQXddmR34XSxKOYA34TAOXvBBJl61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxN+lumzoWmqeV1NKR8S0NtV/3Bxo1suG0cURv7GTM8=;
 b=N/go5Zgv+tyBFrohWyeZM4wAa3fl0S2qDyxMLHC5Z0q9Zfl/3RzOdXgjEM3TUUS2vvEpGiLJn3NyckSsyr3eZY11I/AVlljOfeoHwAkxp9lenXToPFjICmXRP0aDeZES9gve8M1EjLeNae0M1ueWL2VxSiOsRVO3iHXUCTzSJxw5HL5tyEw1Qbl2JIe924vY1+tF2BVK0+WWYvqgQjb004DBAk8OYLBtMNrsbsjRtAFdC04IYVXMKGRmTOjm9Gnus48HDaA3jBaTYZmdzKT2drGGSWQTjoC54c+9gD6E0g8LdslIi/c5fk3acGQGM768n6Wp3sPV4zNLzdhAbKcpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxN+lumzoWmqeV1NKR8S0NtV/3Bxo1suG0cURv7GTM8=;
 b=bOP0M+d5WN9n9RVtWzvtm3ux6P1+u7k93bMSw1Ad+5a1T85HBmEx2m9nK9RHTE7wB+3pMDygrvp0umWudpmvzfVeBEWPQ+JOkyD4Br43mvEW1FDBVqBCr74anVMF1mVbcJ4+hz8gZjpD9ocuFSUMpaDta4GAoGM+atlPpph/STU=
Received: from BN9PR03CA0559.namprd03.prod.outlook.com (2603:10b6:408:138::24)
 by MN2PR12MB3982.namprd12.prod.outlook.com (2603:10b6:208:16c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Thu, 26 Aug
 2021 17:27:42 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::8) by BN9PR03CA0559.outlook.office365.com
 (2603:10b6:408:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 17:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 17:27:41 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 26 Aug 2021 12:27:39 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH v2 0/4] Various fixes to pass libdrm hotunplug tests
Date: Thu, 26 Aug 2021 13:27:04 -0400
Message-ID: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8508e5e6-ceaa-4760-5329-08d968b6ceee
X-MS-TrafficTypeDiagnostic: MN2PR12MB3982:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39822FF0820E32E9F6B014E6EAC79@MN2PR12MB3982.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /SsX7f6R2ji4RYmcuJVN9Jd0YkUB+7z0Wgch4tCg2LCla5JEACfk/Nyj1gEZcOItPLU4yCFkDjrNvHFrrp4EKQMed0Zr7v0kf/9G9xs6613DqkXMpxh1O5he0+cr5u1oXbs3FKhbZNTxq9+SRyiRwdOc/mA+O9gTSNxVJ32/eWnriQLL8ze+/rK55iMurVxzaHBU7kZ4A21bfyflwPqbDRNjDufocslbbRXStHWZlGnuUW69yRBjasnpAwBuiQnbTNMPFyeyWF4tqicrk1ty25B8WPyDXUnnskuuulywYt+aUdtW5PPl+pCVjs3mZIzIxHTWZ6VCMQuz1v/H4jKCy7u6E8tPLpjLcb0TA5Xswjpph+TOmb81Q5wPIQro1jHa2FcHcDp/rmLM5W1+qVhMfUeT3jY7wuW6LfZQswK+62JnjYepv8w0vTn9K9jNx8WZolEoSInMNvVjYe9YeHnQ7Eqyma+6Mn18t0sIRmO6OKFG/HIbbx08ucF0wzz6unuCpxXqm5TYx3rpLBS3bMdKcxqlClm37SRIzsXt4PcgB1QY12OYFxJ1zJgwytPbtUbosx85xqVXkmCPun/0mVAYKrAqCV0OG4QE7InZhPqKAlFvcgn6i5o+1MeM5UA1hB6T5B9gVLQH9iPl17z7XoCfnksoLSsqLtNfP5MW1tTuCA8Hzez614TPtw3w6/2IwGvSiEBi7X+tRNn6nG/y8PDPs/7vHWTpfHwOUVw6eIFHxfM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(966005)(86362001)(336012)(7696005)(36860700001)(426003)(478600001)(186003)(4744005)(16526019)(36756003)(26005)(83380400001)(356005)(2616005)(316002)(82310400003)(4326008)(70586007)(54906003)(110136005)(81166007)(70206006)(8676002)(5660300002)(1076003)(82740400003)(6666004)(44832011)(8936002)(47076005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 17:27:41.4268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8508e5e6-ceaa-4760-5329-08d968b6ceee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3982
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bunch of fixes to enable passing hotplug tests i previosly added
here[1] with latest code. 
Once accepted I will enable the tests on libdrm side.

[1] - https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/172

v2:
Dropping VCE patch since relevant function already fixed in latest
code.
Moving IOMMU hnadling to TTM layer.

Andrey Grodzovsky (4):
  drm/ttm: Create pinned list
  drm/ttm: Clear all DMA mappings on demand
  drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
  drm/amdgpu: Add a UAPI flag for hot plug/unplug

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 30 +++++++++++++--
 drivers/gpu/drm/ttm/ttm_device.c           | 45 ++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_resource.c         |  1 +
 include/drm/ttm/ttm_device.h               |  1 +
 include/drm/ttm/ttm_resource.h             |  1 +
 7 files changed, 78 insertions(+), 5 deletions(-)

-- 
2.25.1

