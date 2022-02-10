Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20F4B0447
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 05:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5D910E3EF;
	Thu, 10 Feb 2022 04:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8510E3EF;
 Thu, 10 Feb 2022 04:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlzRbmdjJNyhz6NdGzF2glFIzY6Oq52BkvbdbzEmm8CWxjybApsMTKm3viX4OVBjWld7d29QMq+tE2CxLmVqWlaJ2JZtSggoKJDFAvCn8BRv6dwAYV8ebeOz3BlktAt4WWXbzsuk9szyOaSQU3i1rdMVTiAK2VGcT/cCkR7XQ/yGLjUcWfs5OTG51/RTx5FXna70Dam/wmgb8SawFvUa2+/oz2ZprBbItM6Iq2/r8owQTPoIBH5K4bze5m3W5LkJGH318W31tMggRG1yUtxop1LIb4Uzoy/l+2bh3i6EIz7Bv7qIzkIaXM//Du3S/AkMVXmHmN/8USkj3mn37q84tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHWbi92/puk1zdctF0nLEfm2eOR3IkGNLM43e2KbH7A=;
 b=mqBFwcTwxkZx8yHutaGk1s90/wKElN9+89+ahPBIDmpVygYq15VgEHWvHFLlpGHrRJExsEPMb4C8Sh/66RulE9da0bPE5zGSNKnsBrlzYsHSS7A8FdyiLS4r3aH1MunUNWPG5aukoiOiMVb4rDLbQETLzjECe+ED00qGCHw7SXw1tkPkIzJXzje4KauEx3usM3wJhdoWnA/L3dBUDtE0g5FBGBC5XYkTr1ji9tlElS6iuLnhLPeKxkOnkm99DPSbl6wY+8zyq2evIaJSlsQTws9WdvtG9X0pyB7bZddYhI9A0YiXTeA7zK8+SvbJ8TwXxQTCaPpVrjapDNkSfI2Wlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHWbi92/puk1zdctF0nLEfm2eOR3IkGNLM43e2KbH7A=;
 b=bgc8t75GFwhY9E6WrYwnHhnFkSpeUjpLkyKJONSfhSjyQupWpaSvZkuZKwl0t5S+vP2smo5RpDfwjOWSUtwVu6JU6CZZBjmCL2WoK4xG5q7Ipg3VzwF0edq18i2xVFHIvwcCNN0WSFRc9cnZnZ0jfsGXNkxmWZDZ1sUmzsaSsPs=
Received: from BN6PR14CA0017.namprd14.prod.outlook.com (2603:10b6:404:79::27)
 by MN2PR12MB4503.namprd12.prod.outlook.com (2603:10b6:208:264::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 04:11:53 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::5c) by BN6PR14CA0017.outlook.office365.com
 (2603:10b6:404:79::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 04:11:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 04:11:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 22:11:50 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.17
Date: Wed, 9 Feb 2022 23:11:37 -0500
Message-ID: <20220210041137.5926-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aca9433-87cd-4b3f-5b7d-08d9ec4b7845
X-MS-TrafficTypeDiagnostic: MN2PR12MB4503:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4503B0C7C01A6593224B8A11F72F9@MN2PR12MB4503.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OCIRUmhE9ESjCtU7WPDaV3N9CjjLye0GB+Uc68uEPLyWMZqfLF1oJPdcWt7cyGmSxa3SKalW2DLuG2Ft8DWa/Q8CpnHFAnatgM3W7WLeoLd7XXkuIdlXL/FxJCwgqdepl00fveqCyzqpmaHji5kReyo/FBcsxY2PQxJ8ZtX1iHPvAzqKf0Z5oE+a//vYXadeeZadFxVuvCqTkUaT9IqC9Cith4J02UJwEEo1u1rxrTv1AHMsE7ghyJ1w7bwGCcfrD4iXJefZ/imdSq2FqSXhQRcU2xwdEdqMwbtTQ6ZlYXYVWaYvPpi3lS+g5BudJhUDHWW045dI7x6IxFrGGfAxWMt2xml0nnZcO6RypxwUFC9sI3dqv2i3JACaEZ0RnIrs0S9tpO8w2DwNaJv3YOOMpnlOQPFddEC/0SFeCRMyXcNynmmyUGHa8rKTuV/eA6yWcUk3fzSyJ3wJCDENLHUIJaebjcOtem61pfwtOhpGNo6LCJcKaYokpCgh1FlDGsG1pZaHxWaVWulo8bLBkPNKQrmp5mz/Nkoia4M0OMaDjEXPbzhOrNNeze3I6pOZKhglK001NFbhwqQJQc7OeCcJllX4Qlj1RTdSLKdhPDwXeMtu+J8G8ZruJqHroIOKGuWkrejDOCiMRj4/XCtQCM+kZglXYHcvezCLPGNNUYqykHXVcj3F48M74WPEAmNwXl/A8R58RzFAfClFhKW70ttQg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(2906002)(81166007)(6666004)(356005)(36756003)(70206006)(70586007)(4326008)(8676002)(40460700003)(86362001)(316002)(110136005)(508600001)(966005)(26005)(186003)(426003)(16526019)(336012)(83380400001)(2616005)(5660300002)(7696005)(8936002)(1076003)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 04:11:53.3368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aca9433-87cd-4b3f-5b7d-08d9ec4b7845
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4503
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

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-02-09

for you to fetch changes up to 6e7545ddb13416fd200e0b91c0acfd0404e2e27b:

  drm/amdgpu/display: change pipe policy for DCN 2.0 (2022-02-09 17:20:47 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-02-09:

amdgpu:
- DCN 3.1 display fixes
- GC 10.3.1 harvest fix
- Page flip irq fix
- hwmon label fix
- DCN 2.0 display fix

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: add utcl2_harvest to gc 10.3.1

Alex Deucher (1):
      drm/amdgpu/display: change pipe policy for DCN 2.0

Dmytro Laktyushkin (1):
      drm/amd/display: fix yellow carp wm clamping

Mario Limonciello (1):
      display/amd: decrease message verbosity about watermarks table failure

Roman Li (1):
      drm/amd/display: Cap pflip irqs per max otg number

Yang Wang (1):
      drm/amd/pm: fix hwmon node of power1_label create issue

Zhan Liu (1):
      drm/amd/display: keep eDP Vdd on when eDP stream is already enabled

 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |  7 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |  6 ++-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 24 ++++++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    | 61 ++++++++++++----------
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  3 +-
 9 files changed, 71 insertions(+), 37 deletions(-)
