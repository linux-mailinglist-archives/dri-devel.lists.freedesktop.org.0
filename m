Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC93D847B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B386E1DE;
	Wed, 28 Jul 2021 00:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415B6E1DE;
 Wed, 28 Jul 2021 00:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRrzVnkJI6bNsOzt1cmTNenFqmM9FOfenYcV6mD20r9fBj7R74uJwHuTuMCWKXxbtMzF1dYvpMMhwPLeg4AksK6SAQy3ZqEMiAWt9Z0nvT3zsbc0CrVHggxCFIorE0scyENy3mJSrvWPgTw89dFj8ZnRkIFu0RnWkQd9eixOi4swpXaISib97VZHOGbTC682z6FssFl7b0+sYvay6OREpryYJA3edYaQG2kv8PLRtjODUrT3icl1tqNabq2lUaL6tWQgivSXPPdMHNA0LXqEABqcm0sU1LcInUb71dlTk843wOpO9bDEG5SobFs/iIq9oaGlSSr6PM5+WhkmcqiHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjfYk5WmUSwAEkCyZLHL3zA0NqlivsnAUH4dubiRFDs=;
 b=HOd/0iMSyDHSoxVyQbXe0h+Hx2iffA71A+19nlw/9zB1pJv6Ti7yw173z5eui0wci6OKCL9fSOuq5nvmDpYWazozNdfrPUw+jdyra36o66fnormuLC3dyiYfnt/dV68lpwnBFbIUt9Z8GPzFfcgdnhhh3O0hpO7yoSYObpjG5PZ8A9i4Bo53cxGvR+GLs9Zotet5v8E3ne76toaHqM8F6Kd/0ruVblTjLCxl9A0stmIyLEEEHwfzA3hHUb131ZZO9v7KL5Tw4c0FMFpoGIYXtbN7l5ozAmE3ABjabBQjKqOSR6vtwZ08nFp1xIwvcR00Aw0RhsfAkDpxuOAAJBCKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjfYk5WmUSwAEkCyZLHL3zA0NqlivsnAUH4dubiRFDs=;
 b=mWbiRgd4a+Dzqp2i3TIXkOAuEWA8KuSCZG04D+2DfJfKx/73fryxj0EioHtTzHrCaPop3djcd4D1i37vTKkPxXAw3UhsSKnnyVMJPToJQ3OxIe9wB4lnQR2I5btR5rp3FQSnAbADip31CpAI/bRtV7aPHyg3sqyuriAt2TmpwoI=
Received: from DM6PR13CA0069.namprd13.prod.outlook.com (2603:10b6:5:134::46)
 by DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Wed, 28 Jul
 2021 00:11:38 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::ce) by DM6PR13CA0069.outlook.office365.com
 (2603:10b6:5:134::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 28 Jul 2021 00:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 00:11:37 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 27 Jul
 2021 19:11:37 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/amdgpu: modernize virtual display feature
Date: Tue, 27 Jul 2021 17:11:16 -0700
Message-ID: <20210728001119.12807-1-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a96ac1-c21e-436d-07e9-08d9515c44b0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3962:
X-Microsoft-Antispam-PRVS: <DM6PR12MB396236F3C324F9A7244BD985EAEA9@DM6PR12MB3962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ehFkzRCFK/ZbOi+NQsy6zdVqjYNF24C7MU5HLQFDBEzrwVtPn4nPCqC9w45s2wKZ09I5Po7l52HbQH3mAR57Y13qafUE7xWcUHkusf7pqFSx8jXQ0muw1PYDC5WoR9vzUZuNf1L1RUbS+iPVUnhbb8FTWux14X6RBJyEOgR+7BQ2x7Phgt40waLhMtQQEBMuV2Zo3j9Clro9gsEScIXU3wyGM7h+a4KXDykEuUxBPyxem98N6TufStpQoH831Ew/v8ESjmWn63d//7wRErYENEgcz2W7j6J7o7DI9ONUnmiO2edtFqy50YpeeCEnq008bSj77DeVkYFIsKauu53se6dadpeVt6ctnvLIZCQyi4LdNvgW/6bT0BtkFcHvOnjVo2kR3HRZ7XNFHLm9f1Hceq4/jityf4KgRXEM8tWbKeJAIIwQ+oTXrGqRceCttIwB2CEal42sVlJX0sNVJPV3yb2ZgXTjLHR9IUuxT897cZXu8foxxGZA63FmmiqeGo7E0Xp17d6OdmQXJNpzsfdOY4TOtfjch2EKCRfKJHqGSRP/Ir8jC8yTKdiB67YPh/cn6NmN/D4UUHANVO5bT72Z8QAaKMZAY8VK0NOn7B7cd0Pgq432t5ovFtWvjMiIy9am54Qb/WNBJH9pwvAvKqRKtjQbn7v/X2DqtYgexLheU7wyRGv3Gt3VOWvVzE9Ux8ySnKcv+fP5+PPT+xONuE1jJVMEgD98K7f+qFDEWYnaFo8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(36756003)(82310400003)(70206006)(70586007)(478600001)(36860700001)(81166007)(186003)(16526019)(47076005)(426003)(8936002)(336012)(1076003)(316002)(2906002)(2616005)(54906003)(83380400001)(82740400003)(4326008)(86362001)(26005)(8676002)(7696005)(356005)(110136005)(5660300002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:11:37.9824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a96ac1-c21e-436d-07e9-08d9515c44b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu vkms interface provides a virtual KMS interface for several use
cases: devices without display hardware, platforms where the actual display
hardware is not useful (e.g., servers), SR-IOV virtual functions, device
emulation/simulation, and device bring up prior to display hardware being
usable. We previously emulated a legacy KMS interface, but there was a desire
to move to the atomic KMS interface. The vkms driver did everything we
needed, but we wanted KMS support natively in the driver without buffer
sharing and the ability to support an instance of VKMS per device. We first
looked at splitting vkms into a stub driver and a helper module that other
drivers could use to implement a virtual display, but this strategy ended up
being messy due to driver specific callbacks needed for buffer management.
Ultimately, it proved easier to import the vkms code as it mostly used core
drm helpers anyway.

Ryan Taylor (3):
  drm/amdgpu: create amdgpu_vkms (v4)
  drm/amdgpu: cleanup dce_virtual
  drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)

 drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 641 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  26 +
 drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 780 -----------------------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 -
 drivers/gpu/drm/amd/amdgpu/nv.c          |  22 +-
 drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
 13 files changed, 703 insertions(+), 845 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h


base-commit: e0186426a7efeb506164da7d4a56cfdaea38b380
-- 
2.32.0

