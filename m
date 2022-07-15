Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53FF576E9F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C41B10E9E3;
	Sat, 16 Jul 2022 14:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665C10E067;
 Fri, 15 Jul 2022 14:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLY4yiT8Kb+P1m6RDtYAdkTMyzQelvhz24/z1b3eMWcr86deT0xdGt/VSH35S3i3TWdzcraO61OyElcpOMjOBTxmgk5efhH6Boyeer0uVkjtGQVspc3ulZ8AFUfdpdtL7/bvg95Qj/21r8X6QIAVf5aIGJJnk2lSWC9VR8yNyx4rRZyCqoHerg+Yo7hFq8gui4KvVuqxKsEYWUCQarQORqqbKuTb/4zaexLYaksy4a/37YrLdbG1ToN43uvAV7zO+ls4w4XnLs0hUfft6U5ZvaS4lXW0rEnqMjzw9v3xpjYfEAH2zUaZfdGdZyed6yWvearSaeaIPnxebu0KzncayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLYg60dhi1yNyK/UAT6c4gR+PoegdAlZfXqal7bw+sg=;
 b=hqacaV5dPW8oDMVGe2+nEoTws6OBWMAIfWT2q3MJwmD5RyIqRSWFIuVzcys5KNs/J6d6I6OxO7nC4L7LiOJ3pa4NaxdzIW2jYwdrCi0GCEC9nm4+VcW/KNocyQOr9Rm9Zv9f33iKEuil7Kpp71+WP62OieeON3JyPJaJHDqtKYPADeOWQkyz4gF3vahQjEmlRupmb2sH5RXOYF/qROCZjDKQYYNoS3GmXzeAox8bPqUSQAD8MClwl/lBz7zMyK+0rwzgPBSbf4ykIJCqtrXvKjX2WWvpCkdhbMU4Xt0z62zc2V3k/8ge15zB7k5G0qUD7mdcfnHica3nmr272GK+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLYg60dhi1yNyK/UAT6c4gR+PoegdAlZfXqal7bw+sg=;
 b=bFb+a7w/UaKHLnfqDLBjveUsp8ogBvuySB/hI5RBmRM7KuzXvLFgIuchTYMYaH9ud5GeTHSyDdiNyBNcZiV48YCvKUkioNDJ1EpPrPG5ZdkoSoCYNMpaozXwlhS2P3zm9nd+PrUWrbyXbh++dvCtjQQgXF6J5ByKiJqhaxYHfyE=
Received: from BN8PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:ac::22)
 by DM6PR12MB4730.namprd12.prod.outlook.com (2603:10b6:5:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 14:13:51 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::87) by BN8PR07CA0009.outlook.office365.com
 (2603:10b6:408:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 14:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 14:13:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 09:13:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Fri, 15 Jul 2022 10:13:34 -0400
Message-ID: <20220715141334.543801-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f617717-d250-49e2-3173-08da666c3e06
X-MS-TrafficTypeDiagnostic: DM6PR12MB4730:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSjPT/OoNUYso2hTv7QeUv49wyy6A+Rq6xUWNTo7cezjE73iJ6gQ/knDODS85nH4Im2VyYmt8Sg2DCcXS7kmU8hnxIsrte1VcdVt6EmUGW9f8sQorj2CLUQd9Tj4OdMhwjUP2S1FEqtIYjTajUEz1NZ8UvGCMTz+bJ1mHS4wHzVlNExW/XWYAHcXWLFGLNPsp4oDdeHDWnI+JPfXwowHDIAMtZxUt0wv0Gf3oUW2j6zIryUvLExIskNuROxEHAnKH6gpXxnXEW5Pz3gjehdrVkEwrIcopCInbmY2kimZM4NIMFQro2NIG23o+3IdU72SLBPT9X6bF3mB1+8i63PCnA7TIi74QpUUd+0lb81XRCEILIz44MIKlgcUMj3kMoynqI6takXifZetDC59Yi7JxRa5/8iVLzf+Km8DfyucpzPe3krq6AckeE6ZzgdkrfD2/Oo/roF7o0AY+9MZG/F44XVeBhozzAOFjgOEDe3LC0nbzRrqKEupCoohompc69ACMihFtmfOtvHOr9PZlEOyHtPJh0871CbfHnwGSfj6sW2tKdHWKMhxtDyWdDJ+6LNjWPwQQeinyUBLYNY+ffNnL6e89tqNxpeCZrW+60THWLAUBeFJeyYwRmiv8CxdugUVJHkpeeSp70PEZuthmYUAL5xUZLpjB/BK2VlX70Uan84LnxXVsxMu8YnpZuhwQ1tjhwY3dAYgmuMuuZnQsFHzDp6kl3fxJeidrMFxMVz8r1lrbkoIPQDlaMmjNLjiA4cY6Y28cN9hulMpACqj8chVJPFHhRLTBitY1OXQE0Cx13M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(40470700004)(46966006)(966005)(186003)(478600001)(41300700001)(2616005)(7696005)(336012)(426003)(47076005)(16526019)(26005)(6666004)(82740400003)(81166007)(356005)(1076003)(36860700001)(83380400001)(4744005)(2906002)(8936002)(82310400005)(40480700001)(36756003)(5660300002)(316002)(110136005)(40460700003)(86362001)(70206006)(70586007)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 14:13:50.8815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f617717-d250-49e2-3173-08da666c3e06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4730
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

One more stable fix for 5.19.

The following changes since commit 3283c83eb6fcfbda8ea03d7149d8e42e71c5d45e:

  drm/amd/display: Ensure valid event timestamp for cursor-only commits (2022-07-13 12:20:37 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-07-15

for you to fetch changes up to 2d4bd81fea1ad6ebba543bd6da3ef5179d130e6a:

  drm/amd/display: Fix new dmub notification enabling in DM (2022-07-15 10:04:59 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-07-15:

amdgpu:
- DMUB display fix

----------------------------------------------------------------
Stylon Wang (1):
      drm/amd/display: Fix new dmub notification enabling in DM

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 27 ++++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)
