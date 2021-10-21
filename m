Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCD9436C3B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F5C6E49F;
	Thu, 21 Oct 2021 20:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEB56E499;
 Thu, 21 Oct 2021 20:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LioYnYC4iFCNSpqCMUzNAP3zWXFAmH2BFSL7ouPuEa6jkAHOQWutQ5euPhok8Xl/bdXkBQcuIPGv3P5UWRuJCmVXnb7Euo3muXm0hI6ocAi4aW9p5E6utmnLJUDTvxUBjZqUjQ5LO1+ghdvD2MpBqa2Vg06cb2qCct2+B6DvtdxmbOKEDpHlhJumtOugv+5C6VpPx+MLUGNCFI3V0n5fbLd8gfmUOJt03T9s/9ZWcWDk3xNVMfNpIWbYAXZsJ5IuXQVREjRGRWq5NC9AO+kclPooQGUhRNE2R66d4M9cC+GNOaos8nA+Yn7evJgoD/MGKzvNn+QjrpSX3cnRMXgM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bN05QY+rGucTG1P13CL/2yBiBHmB8wTmWCu8GyjeAo=;
 b=fuzI/XBeM1SBA0Ui0UOTAmURN92VLMqv+ziJPCxSnjr9bOxQd5B7BSN2T8do+EJZQI/scvd+HPOAhyN4fR6QQ5jojANGcoOTYJ8SMbP8xt1lBhLtndhPmWwH3b7R67KSrobSvHMMtI/Aqee4UUcAJzPDDgALA0w5D8qEZEstr2aHPsqDhtlFDKVuS9k4P0GNtxYRyctMpb6ah5R8suZNzjyzkMiaKMHa8Mzwnh9ViKSFJrnJe3/l9P9DOxfK5WlkJ/XkyQ724jjhIJWClEfohrB58zv7LLOyJ2AwLDSIgq1aCru47gVJkSuJ2lUn69wmGwPLjLKytnyz0CeKpAbJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bN05QY+rGucTG1P13CL/2yBiBHmB8wTmWCu8GyjeAo=;
 b=N1QSs6jwTwzOl712Zs3X7tMCuSn2kg4RTv3reo7d9gaOy1Rtjy14AhwScDLJZDvZTRyPVkXRa9n87cnHm9vb4T5XNY6QiSSdA4W94zvSB33LErDcbH2vPaCjPQy+bO66/8e+z5VkyZcecfPNypo++p6yh2MGsWCQPPQuJAI8eEk=
Received: from MW4PR03CA0341.namprd03.prod.outlook.com (2603:10b6:303:dc::16)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 20:34:44 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::65) by MW4PR03CA0341.outlook.office365.com
 (2603:10b6:303:dc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Thu, 21 Oct 2021 20:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 20:34:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 21 Oct
 2021 15:34:42 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.15
Date: Thu, 21 Oct 2021 16:34:30 -0400
Message-ID: <20211021203430.4578-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66ae3628-50b3-47ff-92ad-08d994d2371a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4110B344C313C91E05632D3AF7BF9@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCidOeGAEys0tO4bimsry1j/gVkMVg0gjgz8gzV685NwZCMhkMX/emHA0dCE/NN7od0GTThHg6BpOpgcizL5Zu8tFyatOtZ+rKstHl9dWpfc+uL0IIS8SNMokSbwgqyBvaePTWyOOCfSAH8bfKOydmjsoo703rXSFlXWFCLwlP3aX1NyWZXWbQykbrB9ikryrfw/4WhFsX2n/aEKyRtX+hed0StPgGmSfUyYBh+JxHT04bEAYL0j4KsoAkvnp75PYzOI8D9FQOMGQ4BRlEKCC21P/GeVb/IJ8uPOmRME9tfq1PcOqz2EujMID325WpBfPaTUIh1GLBqO4974RsND+S8fXJeBQQilXfvyn5ifu9nxZZaf2xvE/3hUI8FJrIVTeqm/G5J3yIoImjTm1ODxfXKsOqPLRQMfzVnwDBdriMbcEO10RddPlcdjJ3wpke0DRY15SQN2+fx/Hj2Tj8pB9FBGBa0/90v7VLA6Urdqp+H3WSx5qTIyYCv9V6JeTsthbWBuEQiVaUTnCDxZYqq6RP1R7FdNfwptpNiLXG5s3lX3YcEkrzh1SIOvin2nUArsJqiSDQ1xVApCQ98jfqxuNEZ+zM0YOqTX8mjZXj/3aAhKZPByzWgSO6O2MF/S9EXkg77lvdFuCc/As0YHGd2iniFCFlpeOLAxNQUirH4iqjKe6Q5VNuph1LBpofwEhWJrbDa55CrlB5HJcGG02Y4dTXjml1bbOxYC8yzv8ZCW6z0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(2906002)(36756003)(356005)(4001150100001)(86362001)(83380400001)(5660300002)(81166007)(8676002)(82310400003)(7696005)(6666004)(336012)(186003)(70586007)(1076003)(16526019)(966005)(8936002)(426003)(47076005)(70206006)(26005)(508600001)(4326008)(110136005)(36860700001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 20:34:43.6548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ae3628-50b3-47ff-92ad-08d994d2371a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

Hi Dave, Daniel,

Fixes for 5.15.

The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-10-21

for you to fetch changes up to 53c2ff8bcb06acd07e24a62e7f5a0247bd7c6f67:

  drm/amdgpu: support B0&B1 external revision id for yellow carp (2021-10-20 15:27:31 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-10-21:

amdgpu:
- Fix a potential out of bounds write in debugfs
- Fix revision handling for Yellow Carp
- Display fixes for Yellow Carp

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: support B0&B1 external revision id for yellow carp

Eric Yang (1):
      drm/amd/display: increase Z9 latency to workaround underflow in Z9

Jake Wang (1):
      drm/amd/display: Moved dccg init to after bios golden init

Nicholas Kazlauskas (2):
      drm/amd/display: Fix prefetch bandwidth calculation for DCN3.1
      drm/amd/display: Require immediate flip support for DCN3.1 planes

Nikola Cornij (2):
      drm/amd/display: Limit display scaling to up to true 4k for DCN 3.1
      drm/amd/display: Increase watermark latencies for DCN3.1

Thelford Williams (1):
      drm/amdgpu: fix out of bounds write

 drivers/gpu/drm/amd/amdgpu/nv.c                          |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c    |  2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c | 16 ++++++++--------
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c       |  7 +++----
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c    | 13 ++++++++++---
 .../drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c   |  6 +++---
 drivers/gpu/drm/amd/display/include/dal_asic_id.h        |  2 +-
 7 files changed, 27 insertions(+), 21 deletions(-)
