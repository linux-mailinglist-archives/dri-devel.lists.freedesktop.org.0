Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED13F6ABC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 23:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809E8972B;
	Tue, 24 Aug 2021 21:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6831896C4;
 Tue, 24 Aug 2021 21:01:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCXBa18VgIQLqazgEqWqnpnrNXaV2lPExe6YG4lm4Sndow5i0UXjH5PF/ZY3sOz2B9TEJmtY9JVeODrCCaLelENwil1xWpFIN6MDfYLkxMQJ3IOtYsHkFYLMus/+3MDuQETtdGZmqk4nhS/JbQKe/AA2aW07DOT1ljxK/DHbEx6vW+TbZZEfr83I3eglBwfl8OqA3P3/ItbsL3VVgP9bIlZ35Cx+1rKSfJRjmUGIBhzCrMp33WTUQrB8djMUruYQZAlgewiNyeurIxAEhr1rpxslXpmqLm3vs19rRtXOpibeEPKvOA2nyy3XlVN4MfOg7XQlw3K7cDWOKXiYwM+b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9n/9d6XrprzD6SEO9URH7e8iBZyh+5vdB6/7FvHnMQ=;
 b=ZtzxS/DgImAU3iLsti+xMcqLCe33oqG5zn6WMCB+L0PzWnQjFcFmoJZIl7DS9mRtTRgD69+lNW+285yi8p9+cOHkKa/cI8Xw7BU/wvWqK02Ylq6J8xmVaYlTTtGu4VwrwPZObkeFIq04INQsNF0b+oi42zx1eM9QKxEAnC09GpzfwkUaxUM2Kt37IY9Gtds39++yoOWTRIfC0S2zozyKa9bvD4pE0u7AMMl8HB4RqSinJwr062lwn8dguwTMoSohkA0yb5e7nl8NFlLq7bxTqwobshERxPcAlkg2dBQM4xcfqCpOJUnaxQO2XLEnR2lrd8nuhzABPEHN0iyTYjbFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9n/9d6XrprzD6SEO9URH7e8iBZyh+5vdB6/7FvHnMQ=;
 b=w+F5QD/B/Na+CXHJ95Qqir9Ac1x8S3K0QIpSUMtFSlDuHwphiS7a83fkkS9b5qhW8RpbgNGU9XrbQjQw0/BSXKY9j+9yjnwHB6HYQim+nl2M2D1s9EAVyYBYi6YtYFyJQP5r1TEVw5ZoZkwjrxD4yozfhLe4INwDkaVTq4lsEYE=
Received: from BN6PR19CA0100.namprd19.prod.outlook.com (2603:10b6:404:a0::14)
 by DM5PR12MB2392.namprd12.prod.outlook.com (2603:10b6:4:b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.23; Tue, 24 Aug
 2021 21:01:36 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::77) by BN6PR19CA0100.outlook.office365.com
 (2603:10b6:404:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 21:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 21:01:36 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 16:01:35 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH 0/4] Various fixes to pass libdrm hotunplug tests
Date: Tue, 24 Aug 2021 17:01:16 -0400
Message-ID: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864c1d0e-4525-4c2f-5b6a-08d967425c4f
X-MS-TrafficTypeDiagnostic: DM5PR12MB2392:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2392D1279FE1A6BAB70E6D09EAC59@DM5PR12MB2392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AG3RO2ts1Gqzx55ZnR+hVdOd8HP+iA1Zv5aZxd2lO9rirhRzT0uJAHH8Eoe72lvU6NHJUwWmJ7Gn80Iq83mnzk71d3yvNC1/ioNgIRIt2CEktDMyk+qjLuFPy6RU9SRu+icEDh59i0H6vcmJVeMxB/rESIAhhE9+tclFjVxtEsrCaOt/ilHosq6XSDPgwrD5XvlwVJQ36Fcn59AxVPPLRDZAWLTMYm7mYnQQil4+S5UFuA7FOH1gPJZQwo7dnjTdHKmkHeHtHTyseuKo7CtcUkbaIk5SymcCY8h5ka1U1mDgzGUwkzlh6wOtSpeedamOFNnDJtkKyVnVKkFkYDXn0P4A14cxJwtTDu0/mRSnMm6P+5u8JB345OspIdDOSBbIJFu+kOn9ZEVjwERz3sy3i+McaxXKjCBBUBwU5oOHzSJknFXZaeezZyxNXCj3MUrjOlv5tGkGcq76xH+Tz0C9V+cR26WtkEbziJ8YxynQyYlzXctE3hB7GvUZxY0MDJBZWQAxH4lGhOa45rAf2NpCFWO9ZfkQmBPyNoJ/3rV/wOMJo4L7ABWVdnnI8nMR5TRLKNcF8bZ7WzjFYXdVcm1TDoSzjzqoKmEyAIf6dP5x+7BQ3UM+Uilp97YdbXjUXzmBAYqceA163RWTvZRlevgNgY6221IvxSmLl8C2bqFrpIRTzbnBI5tc62Uh6F54E2Xng4q1iPl5ABiXRg6k6Xr3do2/8J4tC8Ub9mqZei21kaY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(6666004)(70206006)(44832011)(36756003)(83380400001)(478600001)(966005)(70586007)(81166007)(36860700001)(186003)(16526019)(86362001)(2906002)(356005)(1076003)(8676002)(82310400003)(7696005)(8936002)(336012)(82740400003)(26005)(47076005)(110136005)(316002)(4744005)(426003)(54906003)(4326008)(5660300002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:01:36.3393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c1d0e-4525-4c2f-5b6a-08d967425c4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2392
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

Andrey Grodzovsky (4):
  drm/amdgpu: Move flush VCE idle_work during HW fini
  drm/ttm: Create pinned list
  drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
  drm/amdgpu: Add a UAPI flag for hot plug/unplug

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 50 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c    |  1 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c      |  4 ++
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c      |  5 ++-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c      |  2 +
 drivers/gpu/drm/ttm/ttm_bo.c               | 24 +++++++++--
 drivers/gpu/drm/ttm/ttm_resource.c         |  1 +
 include/drm/ttm/ttm_resource.h             |  1 +
 11 files changed, 88 insertions(+), 6 deletions(-)

-- 
2.25.1

