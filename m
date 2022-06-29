Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE9560A39
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 21:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CE710E26F;
	Wed, 29 Jun 2022 19:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1602510E102;
 Wed, 29 Jun 2022 19:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3moDJkcj9+ao/vVSMiVwbOiVQfMWpyO+BJ86ByQkJZWP9P+kFgsYQ254M1XmVPOUUPxDa6cS7OrxKGPKRlPU9MtF7OoHdq+Aqnd7JdDLROHCetUW8g4euL+PqyOdWaA0VQ0lv+PpoDNyQzK93IB5bGOZlcGB4xq1mZZAwskJ7PdoUl0ydSPdE1sXhF8yQcrqmzUAf+4AEngGykKjN7VJc8hkKiXfmVn4EqvdeGeObbB+fswrguephGCQTsQZH5XWGD4aYGeV1LkYbozNMFV2fJIm9hDpXlYtNiGebCXExXNw+FlB+2MQHTNW26SzLuT0ZcAxCA/sX9w8EZx4uwRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gvl43XZg011fKE00Y6P09tFR2U5ghtJI7oPBKe7Om8s=;
 b=RrIG6fp9ciWKXnE5zO1nvJUepw/dkANDIPoEX92uqXavawbNy3u/1IZqTeFXAQ58QJG/UQ8jsOttlQ8ZR4EtXOsSzJw/B6QcWTDn75OBSXEOmTvq32IkqNo3Nx60lP5ajrs/4Egnfqvwd9z2NDNHCIZ3+yNgMq0gA2EPOj4uLEbfdUOM/qZ7JrrkEnBs/cJyvRERDkQJN0l3O75HyWW+qdokVG/I9wqknX9Hyh10BWK8NaZIqXfN8V53W8EPg0YJ9TeD8LpP7AMceyspk7XD+5K8/aTxD3UHc76jLTmCYS8ArdDARYjcgRQOHzHE1JDty5uXzE/IetGw3n70fhuSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gvl43XZg011fKE00Y6P09tFR2U5ghtJI7oPBKe7Om8s=;
 b=omFenE6nRbnNR70lvXXSkzOwMJlpQsQWGQItgcwOrUF5Fmec810e16HlU6H3fQlqlD7SiogJ+IBwZAJVufric/YmqAecTOZcd79qRVIzGC1BKO44BN7NfkMZ6Sq5sDgWAXa8y/S2TmttCAGea2RAZC9dknQ0cMiYpoOOlZp+fVc=
Received: from MWHPR12CA0072.namprd12.prod.outlook.com (2603:10b6:300:103::34)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 19:22:39 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::4) by MWHPR12CA0072.outlook.office365.com
 (2603:10b6:300:103::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 19:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 19:22:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 14:22:37 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 29 Jun 2022 15:22:20 -0400
Message-ID: <20220629192220.5870-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f99e1715-0b7d-4676-f5bc-08da5a04bade
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nTKH6q7FBHxPtcJqSECa5ox9hZPnj0JDcXTv6X9GKr0EAPV2LGcP53kP0RYdvfif+dwWQv1XG0hNj/YwAw6xsxigQ1f6eD0Ks1KLQN6bA4rjrgwxCypAhFitf7jFlTfP1grcmOeArknawnwvqocmdPagmB1gu6jlx3zawE2PvXEbJ1ub6s+i8u7KoJopwesfXQ5br0su1VpQI2j3+niN410u3QxEHRD3t1evVIjdoOsQTNu8eoeeteV1rEHgjIjPjDZEJnTcDXzCmBjSF68c57qjpgpuj4wGyTij4PtdcfHiSNXvCB74HRKY4oYYQHMuAabGt83P5uFNQizuVdwqHO3b/okODTfhxqO8PQlip7P32XGf6OAGC5M3rOlvm/NkOlsrMEqEugSgWazgfRaZL5kBu9Vu5jcR4+QvRikePckwEX+8JpCgdPnJ5O19jCnmVVFE1agrMLv9hPt9kPy9sUV+IF27rVZ0kRgl4gSkSn3Q5gYvlAOiRciLyvBr6M0ycueAIY4p8eGuzrTUmd9MLaNOHJbGUPLYttCjbE6DqqI/JqM47B/Hj1MlPNuJs1StxfPc7BXS4BtTqhwlebP6jy+59MXqvT1ku8noW1myfRdvMkayPDP92pJ13uwoTKZ59fgW7nYIbyFoMfUc13zqLvlhutvxJEB8+nuHy97xRYKUCe4LmVRD2CEKCq3Za/M/ZO9XHtYRy8nnl3j+6oSzyUdNZTn+GtzmPhXx2xQYYkRlhMRLVbuV4KgLDx6JeZB49TxacOaHbPYc4gEPgbSP+ZRNTE5Mg24jX6uIsOuCPL4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(40480700001)(70206006)(478600001)(1076003)(83380400001)(966005)(8676002)(26005)(86362001)(186003)(4326008)(40460700003)(2616005)(16526019)(7696005)(82310400005)(2906002)(336012)(82740400003)(426003)(36860700001)(41300700001)(316002)(47076005)(6666004)(81166007)(36756003)(70586007)(110136005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 19:22:38.6014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f99e1715-0b7d-4676-f5bc-08da5a04bade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.19.

The following changes since commit 76f0544428aced9e2f0d50ac7429e0f3064658cd:

  Merge tag 'drm-msm-fixes-2022-06-28' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2022-06-29 14:16:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-06-29

for you to fetch changes up to a775e4e4941bf2f326aa36c58f67bd6c96cac717:

  Revert "drm/amdgpu/display: set vblank_disable_immediate for DC" (2022-06-29 14:50:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-06-29:

amdgpu:
- GPU recovery fix
- Fix integer type usage in fourcc header for AMD modifiers
- KFD TLB flush fix for gfx9 APUs
- Display fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: fix adev variable used in amdgpu_device_gpu_recover()
      Revert "drm/amdgpu/display: set vblank_disable_immediate for DC"

Carlos Llamas (1):
      drm/fourcc: fix integer type usage in uapi header

Ruili Ji (1):
      drm/amdgpu: To flush tlb for MMHUB of RAVEN series

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c        | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
 include/uapi/drm/drm_fourcc.h                     | 4 ++--
 5 files changed, 6 insertions(+), 7 deletions(-)
