Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE2416740
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 23:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254D6EDAD;
	Thu, 23 Sep 2021 21:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C26EDB2;
 Thu, 23 Sep 2021 21:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWrZy2NrVgY+zhHmb8NZ8/vKFvP28XVUA+B9JpioitdqQbY/kvOaZ6oyUBHAmsD5Lx3TJe89DlycXXXRTi3cJ1BgBkALb3QwUXUqLnBppaT882FTDUU4x60NOUQsQXlOO1Xu67LXMppkNDO9ByscZ+Y4KCdqMBZYtukWDcE50+jOhyP5XO5ltOuGJ3Iuzn/BwvwsHPfjEJDjhT4eOOV77yaCsJ+zgBxkEWmajdN2AIKVU5sSM+l/7QGZueHlfbKfuNBoh+D2ra8c7goEjKRFejuOC6hYNk1vPvYBGag4f9Zz2pOsfrnLjL3VXnMclPNX/xEVoc/OqWxZvPPAKBzhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yAIvs4y31/l9CUfZ60B3RmhUjceuzYdNZJc6+73YBtw=;
 b=KqmlwOPJh1kgLeONf4Dk5N+ANGQmLv4V5J1/cjoMaNiM1zzu3oedA8DVYoi6UM3Y9jOUmMBQx9/zQJVkENyySCYl8PWFhjuG/b/5bNcaUAaVKcSQX2w/EtUtRxvMcxBWSLp69z7pz3V2eQobWk3r+hgRYOFhM6w6HjZ7RIvrx6UngqU5ErgqG+aHgGb4oDr6UokReab6s4ui6jL91M08lPDJPtjC3YaRJQDtZU9w2tTKItfLoOG+MjwVmL6+ztare2ad+VafsZfeeBcjkpo7UJP8dqWp1CKsGLMMjnZaiCC1YlrOe8/Q3SLZbL9Zk4kuIBp9JgkhAaLBFXT9vtIQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAIvs4y31/l9CUfZ60B3RmhUjceuzYdNZJc6+73YBtw=;
 b=ePxs33GcPbnIBWSjPZSLe6Q+9TIBlUV367FIZ2I6P37eTV6F0cji6NJZjhbiuzhI2iHjc3qsZH0M+3QgfoPLSqpV9rhnELhU928jPN0AImHrYnFkdeua9GYd+6jTYX9Y3NQH6O600acE+dJvuQos9UdhzYB17as46/AbhqIVRMY=
Received: from MWHPR15CA0061.namprd15.prod.outlook.com (2603:10b6:301:4c::23)
 by MW2PR12MB4668.namprd12.prod.outlook.com (2603:10b6:302:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 21:13:48 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::c4) by MWHPR15CA0061.outlook.office365.com
 (2603:10b6:301:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 21:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 21:13:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 16:13:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.15
Date: Thu, 23 Sep 2021 17:13:30 -0400
Message-ID: <20210923211330.20725-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 361e991c-96e1-43fc-f4cf-08d97ed708e7
X-MS-TrafficTypeDiagnostic: MW2PR12MB4668:
X-Microsoft-Antispam-PRVS: <MW2PR12MB4668296EC42F6CFDF31F338FF7A39@MW2PR12MB4668.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VyaSCYwi2VNxEL9aSOHMilxZiWmSuJKO1M0BUynB0cSpQYS3sbuHlFHwDrF/KK0RcxsCDmaMEmyhOObXh4jN8RyiDP85c7/Jax6uye11WdhS5PIHKArsKSUD5BmfFYNo7SZiMQk1WkDHMdkM/bL3q8+Tnr4g67zMrNKTf38U4CZJmrvoOnUxgFlfCVJu74wwQ31gTv1OA26nP7PVp9ayUHJfGchDq1fEereiOqV4b2RR/+bboWmJ8cEPwPGDCKVxMFIKUuuFAUhgIg6NENMW9BX/aMWMkrpe4Udk1gg8fYUQcd8dbEIAVoC2BubrDJFjI22J5+ew2w5MWFhs3GhX2n706qVt/H0Iv8oY8CODKLtOXp0UtNY8JMTi4KQMWDzW0ndQyBjqpqgc0w+0pnTvsmQ4cKODeO4kZiU8uJN65/zyPz99U9nOhN3u5NrUkp13GT/b33Vd/0hkLcS0BbNmUkHsL9bHOdyG2aIq9FPsdLnbixA2BwnyDY7uIX3QFfCrFNTdjAbQCpPCMzatcXgLaJT956ViWKltHKN1vep72f6yBrCwRlcPcXXgSRgUqp4UTSaQ+wUN65qn0Gbm3ySfFfEn06C5ZPKT6QZzEx1Rh5vSyJBxeOtZ20tqKDB+8IYpswwJiQl8E2bTzm6uyAHis0EhjeS7e37L5uoSpwe2WcMs8guyAo7gjDJ+k8IENlSQpi1tGMUOKHMW4v7QVFdOIr+WTvus460q0TPY0vLDdvE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(2906002)(8936002)(426003)(110136005)(2616005)(336012)(70206006)(82310400003)(36860700001)(316002)(70586007)(81166007)(8676002)(83380400001)(86362001)(186003)(16526019)(4326008)(6666004)(508600001)(966005)(7696005)(26005)(47076005)(36756003)(5660300002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 21:13:48.0684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361e991c-96e1-43fc-f4cf-08d97ed708e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB4668
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

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-09-23

for you to fetch changes up to 197ae17722e989942b36e33e044787877f158574:

  drm/amdkfd: fix svm_migrate_fini warning (2021-09-23 17:06:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-09-23:

amdgpu:
- Update MAINTAINERS entry for powerplay
- Fix empty macros
- SI DPM fix

amdkfd:
- SVM fixes
- DMA mapping fix

----------------------------------------------------------------
Alex Deucher (1):
      MAINTAINERS: fix up entry for AMD Powerplay

Arnd Bergmann (1):
      drm/amd/display: fix empty debug macros

Lijo Lazar (1):
      drm/amd/pm: Update intermediate power state for SI

Philip Yang (4):
      drm/amdkfd: SVM map to gpus check vma boundary
      drm/amdkfd: fix dma mapping leaking warning
      drm/amdkfd: handle svm migrate init error
      drm/amdkfd: fix svm_migrate_fini warning

 MAINTAINERS                                  |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_device.c      |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c     | 16 +++++++---------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h     |  5 -----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c         | 24 +++++++++++++++++++-----
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c |  4 ++--
 drivers/gpu/drm/amd/pm/powerplay/si_dpm.c    |  2 ++
 7 files changed, 32 insertions(+), 24 deletions(-)
