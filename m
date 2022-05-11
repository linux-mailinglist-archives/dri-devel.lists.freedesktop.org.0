Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB24523BCF
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 19:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85010F222;
	Wed, 11 May 2022 17:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2064.outbound.protection.outlook.com [40.107.96.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259D310F009;
 Wed, 11 May 2022 17:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tqx8bHNTlxVXg3y9KjQHGgx9M9v9qJQksa8EbskYl7pIOgVrDUiSDPM01+ysYp/nNr/1NcWHJaRdRNjRQlweTWJ5+Mr9dmQTZXNhbYdkA5FpO8M+fm3aPz6X5CR+fb4XTtbA2wkSQdeGFDa8y4IZVEhhhKSbxUHAk8TD04X+jyjqtzBEPJ04Prb0guukMyCuDvWF7XFVqjJ6UqYhCCKKWgOHBQbs6XtFjwrqK3iThGqlIr9uFhKll81Ya6MfbUwTaSB3H/tXj1yu4AwR3P7AmKpVGxtmOB5r81FS7YhTpUiiXnggCdqV8jaWDky++8cC4rr1vXbCXp65vxoudIeSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ms9SV6ZlGmKD6PVc24pLKIgJoFjLoGc/LgYuSpW1bmg=;
 b=XwK7G9HadixXVQgIc1o3lVVVEhKZF0RSOESxCEqpa5XZKh5sG6jIpIYjkDG5FrRbkxpNsCCfRhrU8tsXPkqE/k9IlUF8Fh/7VZQKr6IqUhS2uDFrKwo3z5OeaSdXEdSduwRhf7mc3IUSRni7+2mgLEnX3BQXeVuObndYLNP0Nyt4cLoMLlGm4NcGFGueQDz+Hifz9SvysTAtgcgF7psRQXTvZkJoeWuX154wztm5OffCFO3lRiCb3ip8tvlNM6APQVRYJrheJAOKkkLUdTttx47Ev23n8qYQh2GInXaW1fvjah2C0fHnS3hlL+Nf90F/0ILy78LaL+uDbUeQjwk3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ms9SV6ZlGmKD6PVc24pLKIgJoFjLoGc/LgYuSpW1bmg=;
 b=BdRDD1ZI78fkItt9AcBBUUlBy/jPER9iWEqiQQwPOCQVCeNXtGI4dni/jqvOrYL/gy4YSDxCY+n5giYd1MEyjDPGtVr0g/0jj4eTm/L46SVOVd6PhCbdEgrtRNaJyJ8LB4dwTeuv59PAeEA+ANIQAK2SreF7M2wOutASfnwAyFc=
Received: from BN0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:408:142::30)
 by CH0PR12MB5076.namprd12.prod.outlook.com (2603:10b6:610:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 17:44:42 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::d8) by BN0PR08CA0008.outlook.office365.com
 (2603:10b6:408:142::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 17:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 17:44:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 12:44:41 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.18
Date: Wed, 11 May 2022 13:44:22 -0400
Message-ID: <20220511174422.5769-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fecfd8d-0cdf-4165-126b-08da3375ee38
X-MS-TrafficTypeDiagnostic: CH0PR12MB5076:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB507614CD8BE73FD4489818A2F7C89@CH0PR12MB5076.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fECBNheomQITdu1+HFllnHCkpdKQRztwBAToBIfHsKSuZSLJkJWH0ZPLweXTfOVzZxc4cDuZTCH/l8sBjLr6DFwFYNHqkdDJIsebwnFonhJzzO3C8bh2nSj9ybG+COBLZe6/i4sXEIh2g/TMZ5SCmov3FsZrtYID/cwoFWHycfsNomdXN+W1BjeLuzHuqfcyNfYr2wFvk4AgQ03bz9SEelEw6hnnhnoq0HIJqInK/BSDQqc8ntCfUUqrINSThYZx2ZU5CaOZrorBu0ZjdsctkB8sI+r0biPs2UWBQ8gQ7RT+s6bsccR9OAnqcOoiBSeg0pwwNZc54Z6Uc26BgdqdBoihKv2pIp1QiBhqZMVCea4PNZYXK33EhfHKVJozZijqm9P5GYdWRgHzzmI2ys4/vTX+xcNO6RxdCpSkU1MOJmxIbO1vsKS9V8G12+bMr64wWN+zHTcsOAskx3TeXsR47RSo+fWNUeEzSYCsi4QhtL0WH/2wLLoqlvR+CO8/FImufAwz/NCv+ZK7wufgzDrlEBlihBNC8oI+6LKMU5Fr5K932F8DhX2w4xBiYDQRrXv4y0H6Mguz1HidoryFVAaRTX3yQcIlpyn8Ot9PTeGFAjQqD7tILJEUMFYgcyIIE9d8ogjTC0yHdkJuY8OLNUw4aKUl7WDP9O/boc4FsQYI+txOGhu+QNYEe1vWowqS3oVyThFXprLZCQUuggLC2BEeeQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(70586007)(2906002)(36860700001)(86362001)(36756003)(966005)(508600001)(316002)(4326008)(8676002)(6666004)(16526019)(336012)(426003)(356005)(83380400001)(81166007)(40460700003)(8936002)(26005)(5660300002)(7696005)(1076003)(186003)(47076005)(82310400005)(2616005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 17:44:42.6563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fecfd8d-0cdf-4165-126b-08da3375ee38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5076
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

The following changes since commit 5727375215b0915f28806c337a7ba9835efd340b:

  Merge tag 'drm-msm-fixes-2022-04-30' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2022-05-06 11:22:03 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-05-11

for you to fetch changes up to c65b364c52ba352177dde6944f5efaa29bd40b52:

  drm/amdgpu/ctx: only reset stable pstate if the user changed it (v2) (2022-05-11 11:50:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-05-11:

amdgpu:
- Disable ASPM for VI boards on ADL platforms
- S0ix DCN3.1 display fix
- Resume regression fix
- Stable pstate fix

----------------------------------------------------------------
Alex Deucher (2):
      Revert "drm/amd/pm: keep the BACO feature enabled for suspend"
      drm/amdgpu/ctx: only reset stable pstate if the user changed it (v2)

Eric Yang (1):
      drm/amd/display: undo clearing of z10 related function pointers

Richard Gong (1):
      drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems

 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c           |  5 +++++
 drivers/gpu/drm/amd/amdgpu/vi.c                   | 17 ++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c |  5 -----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  8 +-------
 4 files changed, 22 insertions(+), 13 deletions(-)
