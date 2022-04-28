Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD651298D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 04:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A29E10E2F6;
	Thu, 28 Apr 2022 02:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BD110E2D9;
 Thu, 28 Apr 2022 02:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iovI1Nc+UiV1n+V/taTXoc2I1hXhLTuB6kmQXcf6m0vH8Pkga2OKImwgM1shANRjKBHllIYBPvp/l7WQZE9o6zpxhnjCLcJKhjaH4NeFjxNt3Qp5YpZgmkysyfyGjjQc5Ya+PM8exGouyrWbuPOZPM42R6RhE3eRBIU42440zGsUNQVp9VAjaSm4SadR88gJoDqY5dLWES843oscxnFMLDuvx5ZJab+fdN9rXHOoJSU7HTHtgFB3QU3cAtq5HNscAiH3NPPxBBl4O/bCGb4SAYIUNvxcaZsNAN3FE2qfMqR8uUTul8NVGsL2nFDmvOAmVltOsQinLyvZUeonTw9eew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPXWM8SA34fYMxVKNViCnrfg85zhkgMcoaIqFGRLXxs=;
 b=L6bIDjdOKAt2oni/eqagJk8jgrd+olUFI/Ht6vvMhJY6E3uvJXgXt0T5lj5bNBVr6kjoLpKlZ/lGpxGQQBTaPEKvC9s30bLYQ6B+zmZzb4J6oGhkXBoPqq/gHmyIIyq66tLSBCIKphr6TjeHRPGp9RgJh4QkO1XTyZtdqIlYFoTBoYzRhsJSAnl3ANqj/bJPXU+BbiWCBaxW4nAq1+bHRCkmqfWxe6Lz3gL55vdcX1/PhWyshWGLaHHIwrCxSSfNpmbrNXovGdL+QmnZ8IucFh7QGke1q1pl8AW80tsjlphG8/MVJSKzOYZrnAiWuWpdkWBHB2i/mRt6fDhdQG9jUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPXWM8SA34fYMxVKNViCnrfg85zhkgMcoaIqFGRLXxs=;
 b=zcMVmHm3i+QZWjyCTHv5rbCNf1VabltDcLZHsLc65qXq2Esr5NUO2jNkOm/YeJixHEg0/kbZpGPe3x5FteTAFm6rZbRCh+ko5DjYU4O/89yiTSJ+gC9h/zhDxkspWEzKOs4dXMW+Li46OCAxQxnOLKtwmkihUUKlK923B/lidfU=
Received: from BN9PR03CA0621.namprd03.prod.outlook.com (2603:10b6:408:106::26)
 by BYAPR12MB2949.namprd12.prod.outlook.com (2603:10b6:a03:12f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 02:32:51 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::b) by BN9PR03CA0621.outlook.office365.com
 (2603:10b6:408:106::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 28 Apr 2022 02:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 02:32:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 21:32:45 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.18
Date: Wed, 27 Apr 2022 22:32:32 -0400
Message-ID: <20220428023232.5794-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a0cf19-6bca-47f7-c138-08da28bf618a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2949:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2949731258D0640882EDD552F7FD9@BYAPR12MB2949.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGKhYt0zDuIHnBfIgSB8Z+PXVOlICB1DDYphKb8D9MzfrcRe2oFBvzjQ4FkgzVrKH+GH9whVkiixrTtmPW6G7KiddrH2Sk2bBRdxHBOu3lPtVNJ8+glb3j2zLNGmmz7VMKQsbBnwacoycsFOk3y8MvGdRywelCvuCB2DPehOwyKIdRGE0p/OqqP4WkQ0IV706OfqsU6XmoQv71RY8DrG4PKE+ICI7uKE+36ux7d5BwLxkCeliGSMW2khScW7yUfUBg1xqZSPqim2QsJqfq+9R1BuSKnCLucvkD60azbu1EzXAv88oASlTE7CN35m6v6l0ys26hDHaU2o8g8/HCpIjjfwh5L0Ag2evlGAHBJvJqkjPAyt0KS3DTKkPWQlIUSjrenUJI4Mi4X+M9u6T29DHk5U1qNPS/seO7GQnl9PtWqb7d9ySKNXZlUnXPnz1H923vOTt9wiUHoNh3ISpvO8gfoO9XrWKynQM2z5bfGwYpvaoVE5v0LqK2PLqa4g34KPZ2Os6HjCIKKExfHzIxSIrnLDc3cvSukOLkBgV2J37RKNP9XVzCvoKHaH9E8lEJF0B0IjkwP50gtPOH8W7OQbiZJJCthbvqK+vvLBqpFNQDN7tiqJ7tNstOK1ZIksS1B9nqcbH/mKzxRVjYKnk4HiDeRiXiycqfHii5a2wOX8nMdgSGHdookVH5VSmwP6qMhspfmOHNtMob+kwNV2wEtWCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(40460700003)(83380400001)(26005)(6666004)(7696005)(8676002)(966005)(86362001)(316002)(82310400005)(110136005)(70206006)(70586007)(36860700001)(8936002)(5660300002)(16526019)(2616005)(1076003)(426003)(36756003)(47076005)(81166007)(508600001)(2906002)(336012)(186003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 02:32:46.5913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a0cf19-6bca-47f7-c138-08da28bf618a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
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

Fixes for 5.18.

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-04-27

for you to fetch changes up to fb8cc3318e47e1a0ced4025ef614317b541147e7:

  drm/amdgpu: keep mmhub clock gating being enabled during s2idle suspend (2022-04-27 17:38:02 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-04-27:

amdgpu:
- Runtime pm fix
- DCN memory leak fix in error path
- SI DPM deadlock fix
- S0ix fix

amdkfd:
- GWS fix
- GWS support for CRIU

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: don't runtime suspend if there are displays attached (v3)

David Yat Sin (2):
      drm/amdkfd: Fix GWS queue count
      drm/amdkfd: CRIU add support for GWS queues

Evan Quan (1):
      drm/amd/pm: fix the deadlock issue observed on SI

Miaoqian Lin (1):
      drm/amd/display: Fix memory leak in dcn21_clock_source_create

Prike Liang (1):
      drm/amdgpu: keep mmhub clock gating being enabled during s2idle suspend

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 105 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  10 ++
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  83 ++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  10 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  39 ++++++++
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |  10 --
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  35 -------
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  10 --
 10 files changed, 165 insertions(+), 140 deletions(-)
