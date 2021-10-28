Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBD43D95A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 04:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F166E040;
	Thu, 28 Oct 2021 02:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38F16E040;
 Thu, 28 Oct 2021 02:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd0BpB6CZWHlk8dx9WZZytcB0/iqrq3pO8gc9yYsMgEfv5QsNXvXTfR0HOMaLBKbnICwvv3T9z9ZI5w7+oCqYdTZO8fkZJizNULwnOIO4wVHG8T1KlYY9UsMKKomOScuHYOppmmp+QZbwGIjXXuKCrD5arTlDdwkFg0tiJznyTmETSSYy84f16eo0EdRntG2mHejtRZGfWHBVAbY1OQtP0P/5NeVNoqjw69aRGYO+NLZlgw+ky/Ka/nzuAW3qD1Mazk/DJJ2Y4s75oZRvXCutpYxs0MkCKUr2DjYkYfPo3C15TfCSFb33yx4jeu76nimgkaHH5/PG7V2KDAZVIB8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuBSFbPR4unxExfeq0CjqpcYHeDUcnJ2mcWwzBIYD8U=;
 b=LK6kKqsilMjBXsTE+/LXia3xGeHtspuVK1f3xOnlmKbE8qp1X8a7RpphEuAXQzExq0K/8N3jvI0A+3Ul7d8vHSO0YfUMQJ3iIKVbm0ZghuHPowk7mhPWqTJYEQsnK+9GSkiyQVL4dFD/73QX7YEu2AqC5atDSr+KoErvDEFSd78wap3rVmc+doQmHRFsnoaG+H3PCvc5Lbzx9H/BNex6kbd2usd6ZaIj4kDQVUYwZCiPEpYXB01pVLzlsrf32Nj+IHyjj3E5w1yKXxjuGKqEEhGKwD1o9Jy75crSfiRZSkZGIUm8NGK6cEvycpdgrfBKCxhAktw8NNUilqAL6+a44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuBSFbPR4unxExfeq0CjqpcYHeDUcnJ2mcWwzBIYD8U=;
 b=Gah7WGCOU6ACS8Q/tq2UiHso54+rd0/kSUfWTh/lo9CsRX3lowEMyT0Mjt+I4zzJScYshg3CGQlvIX047kraQ+ld0KYD+ASipWO7afXfaoKRF2FOCsTzTqxrKaGIjC5AzudvgZKIp2baDZPerpWjiBeT9f1n6AsRpGJi+D/19oo=
Received: from CO2PR04CA0106.namprd04.prod.outlook.com (2603:10b6:104:6::32)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 02:31:50 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::96) by CO2PR04CA0106.outlook.office365.com
 (2603:10b6:104:6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Thu, 28 Oct 2021 02:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 02:31:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 27 Oct
 2021 21:31:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-5.15
Date: Wed, 27 Oct 2021 22:31:30 -0400
Message-ID: <20211028023130.4528-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 838452ed-0bb3-47e4-6ab9-08d999bb187f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4318A145E179C115D506B542F7869@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SdIjWOzKHchsm+FUv35IYzewHnmGJGxJwjMgze+MAY7RaV0gVaE1n/w9Ic/knRDrSJQ1A9hj+V9dlb/Sr4saC1uhlFsvnD46zSYYSqLf0ND0HKFsnuHMgraYD4K+//zcxxGTeAcJvWMSGEMogVIwpeUszZ+sw61hOol18NCHAUIlWpu1rkh0SR3mQcLZkFbw41Q2x+PSzb60kbbr4lf/RNOGbZIiz4jte1ksY5XYxDYZpeANsXy+uIEIiL3ij88qJgAeiHhAotdlSmnEykuIkNtEwDdIDAwJ76YgDdwjpsrvLCDR10qyyUufkmgj84ZbJ7467pzfBIgUnftErEBYwjV+SOJjWpNEFjlYxZNd22IUvZZKyaxH5VZeVtAmwkkqVTjf8T7suL04zCdyln4PtNyN5ZuhTkV/PUMK4wkcLxFFXNnnFFCDjf2/p7tDQNQrjeD2vt7FamI3a5K7XPbJBkdbCdxnGeVtez3SwvZYpVR3pQOmTDEK+PieLOup3BFjLRuohF8/hYUqC6GxhSQUoWWvFDz7q448okn+BJNNUvfYNUpZGHL1jMbDlesNMR/kYyqm8DETm3qV4hFHhodxXVHXcI+wW633kzqewEQMV2lIvLY7balDc5kuQYt24798OSG8a2UHL0fs7jlRjf3ViEjO8RvC3cwgyE4hISq363KakpCeJY9Rum4ytcQSpX6LLZWEoY3s5oZh8l+6P/sDIkQfsRsOUnW/kSHKc+FmRSw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(8676002)(82310400003)(70586007)(47076005)(1076003)(70206006)(26005)(6666004)(356005)(81166007)(336012)(2616005)(36860700001)(508600001)(36756003)(186003)(110136005)(16526019)(7696005)(966005)(316002)(4326008)(2906002)(5660300002)(8936002)(426003)(86362001)(4001150100001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 02:31:49.7114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838452ed-0bb3-47e4-6ab9-08d999bb187f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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

The following changes since commit defbbcd99fa68cb7feed453662048baa87e9a441:

  Merge tag 'amd-drm-fixes-5.15-2021-10-21' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-10-27 10:01:21 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-10-27

for you to fetch changes up to ad76744b041d8c87ef1c9adbb04fb7eaa20a179e:

  drm/amd/display: Fix deadlock when falling back to v2 from v3 (2021-10-27 22:04:50 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-10-27:

amdgpu:
- Display fixes for DCN 3.1
- Fix potential out of bounds write in debugfs

----------------------------------------------------------------
Michael Strauss (1):
      drm/amd/display: Fallback to clocks which meet requested voltage on DCN31

Nicholas Kazlauskas (1):
      drm/amd/display: Fix deadlock when falling back to v2 from v3

Patrik Jakobsson (1):
      drm/amdgpu: Fix even more out of bound writes from debugfs

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 18 +++++++++---------
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   | 13 ++++++++++---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |  6 ++----
 3 files changed, 21 insertions(+), 16 deletions(-)
