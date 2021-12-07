Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3746BE44
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7187B794;
	Tue,  7 Dec 2021 14:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECBB6FE3D;
 Tue,  7 Dec 2021 14:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjbOe5TjJWGRtsqqIF2qJ2VpL92KglFGpcezzRsc1Qa1lZL70K21ErIXCuVL4pk3fszl4gcZUJTYWZuQuwl5EclKxJ/5RYB8VgRE7mK1Fl8I6Ck6iPU0Kn8x0YsAi3/AKPimAB1IHqmm6b9bX9pxcQhd/EOV49VPz0/fQycPACcv2/Rs6VCeMOx8nst7ta9sv6BbM/pofb/k/CAiThl0uMPsriEK010onz+czTEEkwMpVzF/3xkwidMJS/KSAt/CQJyEM3Ul8rlqeWPpHRHLfQWjaD2gPwYKF+Jxd+WC195hLQCLJBt5vlHTPCXz6kTrJqr7H7NzYUrl2LZGhgkL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=Z3XpGD8cgTSLhvrYptJDDOI/SyERLVZQ5iAT51UY0K/GHBapr0pMweYMhbBpAy8A45YTk1/Q9rni3r3Fg1POGcLfu6LOp76/jgf7DQVhp9DW8AZCoxZ9pBrnf97JDhp+eQ9m143As+t3qNT9j21h9XbuuDLnOKQKQEu+auj7c3iKh9aHmtBRF24phIKod2+pJPfIiL+bU3710CwCUn56l4Jx5elpgj60YG40ruwKRJQTeQ6JOdkXUlW2tWAqLJcfqBfcxHVFjzsKWD8aeDi+bfU1QjIh+0MfDiK4Yr5r6b9BfPpoV/mhZL4T6f8tRA9PC/uuNZLSmm/x7HIbqkYrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=spoocCuyar9ZosWs4/2NurV1pffkZcYtwEe+KksIseNvyYtcp5tVVl6Jt8QyEFfA6BwrwOHX5HR8zlv4HAhfMNuvsMa1/FVaQZwnVmgSMzdy9YsbnAE2/FVAn8sTxzlKCseSsV15zRptHeFyBSrT+GXKEXAYswRDPV3He/LridU=
Received: from DM6PR13CA0021.namprd13.prod.outlook.com (2603:10b6:5:bc::34) by
 BN9PR12MB5337.namprd12.prod.outlook.com (2603:10b6:408:102::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Tue, 7 Dec 2021 14:54:20 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::61) by DM6PR13CA0021.outlook.office365.com
 (2603:10b6:5:bc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.5 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:19 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:14 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 4/6] Documentation/gpu: How to collect DTN log
Date: Tue, 7 Dec 2021 09:53:48 -0500
Message-ID: <20211207145350.286037-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
References: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0cdf20e-7fe6-4877-fbf5-08d9b99172d6
X-MS-TrafficTypeDiagnostic: BN9PR12MB5337:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5337D9503C4B455E4F616FD2986E9@BN9PR12MB5337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLupNK0DrNH5QBuI1VOWO2XtD1WEjX6v/8HPh4ZbrSEinoS7polmP9e7jcyVQdroIzPd6RAym0dgydXlrYZGP6XoPEM/hiZ6tTpCHzYbSAo+SP/2VhrqVlwbNEirc7C7InH47a0jQRirHrQm54Py6wwIeOL2fSpDZAyzOGeLeUVbUR2GvsBm/LOd6xuretU1yOnhjNMW86VPYDntvhUwgrSWDfqMm6rjZSZrGHCtHUGgDtMeSqRdOtanLFJjCoSA3FQXTqCpTyja6MzsufmA2SrJjeRi8uExIruhACFYFh9pAsCc+jQlIf9jvIiAtEcItHPDKLxYC+Id1g26Tw9gKay4MQZLGmMD/yvfzCvsAil5LTrGYPbBbS4veNdWU7+EaBuajzAyXGgu62n0m+sE0IRbETeWU2GpiqD5dtI9iqsVeeQVkWtfUjXoiUSFh/kc9iIkpbpWE4/1S+hH6je3QsO+Z13tzvMyVNmmb+uspcUTS+sVvfKQkh7kmqn9uXzoewDBwXTlZU6RPcW0mbNwkorydrPiwZydDtw/LQ9MVXZoh3tOwMV5DZZNqNcZrNHJ9HXqQEMDcm3+CBzZ5Z+wfwgB2AbcH4YDJS1M9G9F1MsekgJ20Dz+bn8PLXX9Y/GXMYQW/4QtJYY7S2+7FLyLiAWx8XS1SwYpaMTqbHRhnoCRDuGsu6q0718nzJhv4C1DlQesYa8PG1Uxe1oyxg7JOEbCR7gMd4M+d2wIXBwLyMobiKT4jMI7Zhmvjh+OH9v3XOpcXhwK3PjN92QTuonlbZELG0B5W7db65ThzKn+t7frfVd3ofeA2iFAff8a778Y
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(110136005)(54906003)(26005)(8936002)(36756003)(40460700001)(82310400004)(2616005)(7416002)(316002)(921005)(426003)(2906002)(508600001)(1076003)(86362001)(5660300002)(36860700001)(4326008)(186003)(70586007)(8676002)(70206006)(16526019)(6666004)(47076005)(356005)(83380400001)(81166007)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:19.6942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cdf20e-7fe6-4877-fbf5-08d9b99172d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5337
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce how to collect DTN log from debugfs.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index 6dbd21f7f59e..40c55a618918 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -58,3 +58,20 @@ In this case, if you have a pipe split, you will see one small red bar at the
 bottom of the display covering the entire display width and another bar
 covering the second pipe. In other words, you will see a bit high bar in the
 second pipe.
+
+DTN Debug
+=========
+
+DC (DCN) provides an extensive log that dumps multiple details from our
+hardware configuration. Via debugfs, you can capture those status values by
+using Display Test Next (DTN) log, which can be captured via debugfs by using::
+
+  cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+Since this log is updated accordingly with DCN status, you can also follow the
+change in real-time by using something like::
+
+  sudo watch -d cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+When reporting a bug related to DC, consider attaching this log before and
+after you reproduce the bug.
-- 
2.25.1

