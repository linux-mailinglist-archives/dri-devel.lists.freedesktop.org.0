Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5D551AD6D
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A810E61A;
	Wed,  4 May 2022 19:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73110E552;
 Wed,  4 May 2022 19:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU+TWCDK6dqqdEXcO57JVrFt/AlYOYyqKqysnwsS9zXGfqnBKeGeK6foUMiun1mNnDakFi7Qr7zDGbu7ufJYfbK/O3eAXjRl31kfK5a+26g0ag22b8fNV/lKV4rpnuRyJEWaxdGbsYPl65hlgXWd87rkvyzBQwReC56MlVu/cQiTFuICQGOmHfObAIzTnZ1zl5Ugeaej4cOtWd+ULUCMbG6jS0dUY1GlTNRyaJURW+0DyI2Wh197CplybftRQQLnj8uAW2k/B+OBxDId6+bFjGjS5VjZ0EcFajRZSUrpakDC3jyLzGySM2v0hitvTb3ccwLklZM3aZddLrQ9FFcYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eksLX6yr/NVwSs4VuHChOXp+VPdV3fi35XinxKYfkg=;
 b=PYhKASHiIJk3/I37N+bIs/larsXVqqLTsRsDu9P4EkVinvGvE2bAbZwrqWo1GqGqURZxMkQGL4YdYjPEacWOHvYBWZf7CCUw8cicWVDQnpregGof4MnK2nJDEbyE5gnHgH7sXTN/YAL45GvgpoKzTxq4tuoEF2sFJ1UHevE7/l0Vffaaxjk1aytHBw8UnE6GGl1x7OR5Q5FR0mX3prSI9gfEBEfYPa/bLJkuzpcHufITkC5cXwkyiMpubbb+IqVW69+pbpOYK2bv/CpiKzng3VdLhiPCgqHD0hvUrs4JSqr+Dby0vXx32vyTMQpgK6bW9WcURjmO8592Hx75fFR5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eksLX6yr/NVwSs4VuHChOXp+VPdV3fi35XinxKYfkg=;
 b=pe+yCyoQT/gMjg4E/wA6gbKk2fnI6YRYIEkH0k5IgCjSw/S7OmkRshHaPv2AIgAekYfs/70clM8yngoGYWTbdZx7lQApovMWOraybogK1tNLUrutX2rPErUy3F86rDFz3rTrtpxGyTwN+eeH7paTYS2Rbll2fkhYxUCpzgE/Cq8=
Received: from BN9PR03CA0700.namprd03.prod.outlook.com (2603:10b6:408:ef::15)
 by MWHPR12MB1600.namprd12.prod.outlook.com (2603:10b6:301:f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 4 May
 2022 19:04:57 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::2e) by BN9PR03CA0700.outlook.office365.com
 (2603:10b6:408:ef::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 4 May 2022 19:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 19:04:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 14:04:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.18
Date: Wed, 4 May 2022 15:04:39 -0400
Message-ID: <20220504190439.5723-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0821147-a1de-4018-97ef-08da2e00fb27
X-MS-TrafficTypeDiagnostic: MWHPR12MB1600:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16005D472BBD5E6432A6C4B1F7C39@MWHPR12MB1600.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDxtiDnZ0FMdy5BBPItR76jbGWrXdZhWESwnQ5/ouSx28ieqKcu4fHMKC7Ebz1UOb3Ez0T8XDo3KFettA9XnJ2JgOs1Aef5SU9nP70UzDc5i62c8WWih0GEuPQ4QA2ViPqnrgoAnn+v29cGdJtp6VR+88hp2S7wmrvAFHP20vO5DR8pWNEnT/c88OvfpkULvuIajqhusemAPx2Ot7r5N6ak/BbIHLo8RXA27SJvLF81uZDrTZfpiy5MjTka4PPMyYKFET2/WTdz4DN09QsG2jvnKx24Ul5vmaWsH2lhSgM1fw/LcbMdo/aGLJssKHBa4PtNlfNmfF4GIXVC1QIFq0f2V8fEI5ZWdLyQfCKTxQ/8m+8y4Kp/srbMua4XDfwYAR5gVvoM4+mxaQTBID1wbhG69GcYhuHYGVBnkUgVDMbdJPeBtT/1tkYxf3XxjpoWQF7JJzB+KisixyzDYoiYMFc+UAsShMTrZd/z4mAKv1WVa4huZyMhtrfcRpWLHCz2mAXT1rqwUWXwPetQYu4EJ4d2va/CxuKC8JX8o/260aY7Xv0SmoDvVzjQ0/AVpkRIVQACHLOyKy0oPzWUn6Fi9CLgYk4hykdW2GRgkDUIRDb7oruA9QwmOFril9Qw44vIxmr2/qK+PgNnciDdxCR7AB0IK6f2pllQ/Sy0/mIbqBaE53lY7sUNbRZs4WIfTg6VuJQ/dP7AG6rWZeFPK1esOUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(5660300002)(70206006)(8936002)(426003)(83380400001)(36756003)(36860700001)(47076005)(336012)(86362001)(186003)(26005)(16526019)(1076003)(2616005)(2906002)(6666004)(7696005)(356005)(508600001)(40460700003)(110136005)(316002)(966005)(8676002)(4326008)(82310400005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 19:04:57.4119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0821147-a1de-4018-97ef-08da2e00fb27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1600
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

The following changes since commit 9d9f720733b7e8d11e4cc53b53f461b117dab839:

  Merge tag 'amd-drm-fixes-5.18-2022-04-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2022-04-29 10:27:05 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-05-04

for you to fetch changes up to 3dfe85fa87b2a26bdbd292b66653bba065cf9941:

  drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUNT (2022-05-04 12:21:41 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-05-04:

amdgpu:
- Fix a xen dom0 regression on APUs
- Fix a potential array overflow if a receiver were to
  send an erroneous audio channel count

----------------------------------------------------------------
Harry Wentland (1):
      drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUNT

Marek Marczykowski-Górecki (1):
      drm/amdgpu: do not use passthrough mode in Xen dom0

 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c         | 4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)
