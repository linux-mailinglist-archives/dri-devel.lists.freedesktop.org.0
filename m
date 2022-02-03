Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E273B4A7E7A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 04:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D83810E8FE;
	Thu,  3 Feb 2022 03:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925610E8FE;
 Thu,  3 Feb 2022 03:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnw6t0prbpwqZInli11VyWzZv0z42Q62emrvxbyg1v/n1WsnGmrTsppm+wFP+XGkoD+Qr0mkZIePtp8UIeHwamtJAaVN/dqpEx/lIgLGoTnFLZOgOcR47HymD67G2ZpH14zEcZzCsPmc+G6iGwKjnUP+BQuPK0AX7DhJI7XWhAXr1HL/O6JZ/+ssVCpnPsc7IdJfD44p+oxYL3jUqj/a32YiLX7aj2flOcx0InmOC5k7KewE+I3OidOS5TgRChGDXV+jR8tqaKBbITaDmA9NYw65rjER8URd03lcDqUZxdIqM1NvXrdDIXka6Qelxf6H6eIQXQBa4ozoT5WAx7fj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmWpwNzrU4VmS1k72MMjQcFYcqvo8KiN/ZpO/jnVa+A=;
 b=PYCuF6a9sqLyQZDfp9Nb9Tdbsku2t4pJUnQeU0ILwNvtUiLS7vK3dRmyzWFouWAGl9+2gvIJTzDp1IYuA0wtUrKFtf0CZP6luu24ahP+M7r9c1ps6kFdzB77Yt2oSZquuV7Vc9lRdlFjuIK62pVU/i961eVKeT6pChMPt+K2mBmJtNSYR6Q1sLjnTDb5JhKihjAqg3eKIgCnQmnGcdYwbnfpWmqYN124oRq8PLMeNPRgqysgBlWDY0ph3oRM55M972+X1uNWko0IS1NGIaC1wvYbytnmrbC3iYTC9SQy/MflS8jEV9SrcRGl1zzo0PDEMSoQhWrKoFzk7wmucxbGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmWpwNzrU4VmS1k72MMjQcFYcqvo8KiN/ZpO/jnVa+A=;
 b=NFbk64x+taam02TFDUI8QoagN7y9Ntz479HIVqpOCXMW7G93CM2aB3XY/MQfUeftXtkKOpMSKLD2d8WRouGsmMow9Z7geXiRkGTHklCLZUkmqVeYggedWoH/1TIfMEsKaxtRGnwwaSc9jwoxhOAQLtfpmw0+rXUABDH4jH49eg4=
Received: from DS7PR06CA0033.namprd06.prod.outlook.com (2603:10b6:8:54::15) by
 MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 03:52:40 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::c7) by DS7PR06CA0033.outlook.office365.com
 (2603:10b6:8:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 03:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 03:52:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Feb
 2022 21:52:38 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.17
Date: Wed, 2 Feb 2022 22:52:24 -0500
Message-ID: <20220203035224.5801-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 880f208d-ee6d-4364-f838-08d9e6c89fcb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB37925DA17937CCD5718F3F87F7289@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7n+X+CqKDgVJd/8n0e2ugyWCjs+pjuJkewrNcVhiFnCx5LuYCNRQc1Wg+ilscxOTCR5Ys5wuClj0nz3hzkAjphbrf9l5yD9fl4bHeBRZkrLmgtfZjknJ0ysHgd7fO2H82Bsfxb2tMXXeCCqBwF1NflwS2YWlWkkUOUy59ezqAJlshpkHzMGU28Cfk2hNa160VlEE8j4leuZ2SJKbKfg7FmS0hPGwkSRUXVSyvjCelxnsh/WO0wr/xz0/M01QS5n21XhwaKJNT9C6fk+XSIMhRw3h3pOyRkMHKFXnVz+AzwkNKYp95JXmf8zvu5dHSNV9NsxHC96b2U4Z6R4ud6Qg+1FXlDQQ/Eps4T6pTsdtmRPsm5Cm35ct2rmt9IWu3RgTF/v3Qb94N2OZvauYlG09FHHTQLkPI46JhiVmjqDxUaUTV3YLNwYGbPmlU9JKNf0mzOEB8AC8xqJz+2R4rBU+lwSF1RwZt8i5xlEqmko6AvIZIlAxEiUdNsiBpSsCyt596Wi/dwndFCnog74jFDfQ4DJVmwS+w+juWMrm1SXUjmRVOcfDJH/OsuWxvaWN9VBR07zKGXWUlPDNjcaQzn25pBVZkgKE0/xVgsGxddLl4bE0nS67f2ms0Y3ca6c2xr6uW6lRfUgondzUH8cl0iqiN/LtJzQUmx7ATZ4pmPXGeY/ea2JM6S8WLBruWkqQqynql0ta0O2dg4CXpdjKRAXnQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(66574015)(83380400001)(47076005)(8676002)(40460700003)(8936002)(26005)(186003)(110136005)(966005)(508600001)(16526019)(4326008)(86362001)(36756003)(426003)(1076003)(2616005)(336012)(70206006)(70586007)(2906002)(316002)(36860700001)(6666004)(7696005)(81166007)(356005)(82310400004)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 03:52:39.7334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 880f208d-ee6d-4364-f838-08d9e6c89fcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

Fixes for 5.17.

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-02-02

for you to fetch changes up to e8ae38720e1a685fd98cfa5ae118c9d07b45ca79:

  drm/amdgpu: fix logic inversion in check (2022-02-02 18:35:00 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-02-02:

amdgpu:
- mGPU fan boost fix for beige goby
- S0ix fixes
- Cyan skillfish hang fix
- DCN fixes for DCN 3.1
- DCN fixes for DCN 3.01
- Apple retina panel fix
- ttm logic inversion fix

----------------------------------------------------------------
Agustin Gutierrez (1):
      drm/amd/display: Update watermark values for DCN301

Aun-Ali Zaidi (1):
      drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15" Apple Retina panels

Christian König (1):
      drm/amdgpu: fix logic inversion in check

Evan Quan (1):
      drm/amd/pm: correct the MGpuFanBoost support for Beige Goby

Lang Yu (1):
      drm/amdgpu: fix a potential GPU hang on cyan skillfish

Mario Limonciello (4):
      drm/amd: Warn users about potential s0ix problems
      drm/amd: add support to check whether the system is set to s3
      drm/amd: Only run s3 or s0ix if system is configured properly
      drm/amd: avoid suspend on dGPUs w/ s2idle support when runtime PM enabled

Paul Hsieh (1):
      drm/amd/display: watermark latencies is not enough on DCN31

Zhan Liu (1):
      drm/amd/display: revert "Reset fifo after enable otg"

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                | 10 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           | 37 +++++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 11 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  3 ++
 .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 16 +++++-----
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   | 20 ++++++------
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 20 ++++++++++++
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  5 ---
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    | 15 ---------
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |  3 --
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |  2 --
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |  2 --
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |  4 ---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  6 ++--
 15 files changed, 94 insertions(+), 62 deletions(-)
