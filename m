Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735553CB779
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 14:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133576E97B;
	Fri, 16 Jul 2021 12:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207126E97B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 12:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9MZrWaH2MIyVsXOZWCwoWTFqts1UhM+eocBVuxCiqiLq1xGAFi+f6HRAKLjRXZ0WJ9EF9qJlpPUVs4wSRvMPj5g8UJBFTTDS6h4zbVJZ/i+SOz2YmDLOEmIpIH8XHVXIqc0KzztpqIMMFtrORojC83nmh/ZNeeMGu5kRAu2LWHP7z1t1Y/p8URNq0UMXyTJJ0B7jdpqPMPyjoeT2jM37XReae4sMHbY3lLo56Sx0jkTdv2m8ApEZqGu5Wn4k4Ace25/DzONX/Eiq+Mh0DICoIvN1t9ld8SIJkcx9FcXkZ/XnnPhCctUcwwUXYZ9+/LunFg8EbhHgEGxUp3ckrP1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hDhAsh0jYpuS8q5BuxLn2scPrzMHb0I/KHigXD9xAs=;
 b=XsLDPIZOmugyYWCv2xmkm/0GF5SoksiSotgOr1Su6onMlLjxza/KteokhY3zaVbdxxEtRBB16NRjchAIwC8f5d5aM7wtHZj/fubvn25ddu2y2b3fqKqxjEHbt4o6FXMul2XZE0NJ4fDGGqiAwxJT2/0R7/1W2/g41pQd1uKtIe4diuhZfNV/mzXjuA2yx9arICd8rTnX34+s1QpRyXHyBqLvDroJLxgvAueQe/lUUvxcGIG6DnCI4ISNba9CrsGUUGDSfrVW13yPm9R/PtDRwolHMoxxw60P+ULYqHfvNn26R2os5atpIvMHWRjD7fbso2RL4WK7RTLM7hgfFSMiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hDhAsh0jYpuS8q5BuxLn2scPrzMHb0I/KHigXD9xAs=;
 b=djzPD+GmBi9GpDCfEEn9OOrO2wsLog8Nmggg25+G6yMmsxd9+ffczreb5Zy27FnkgK+VwXtd8fe8FTLJ+MVoDnzmi8aAYwKi1BgiAYz7CHMpN/ip9IsAZ7zhPbsda//KsycPa5C2yu4IZhP6yvAeTCxqSgIQuWJPtjVkb7PE5BXEjDPTngBUuvttBYixrSRbSBB5uiax31GiwyU2ycbRCRJCX7hZP+nlIlRgs1A+/qa+L3sd0fOk+C6BAXm3BqSYT5UcYHzSNrUtmR4QOlbIaAu2AnM/pEtPlLxgyILldmYOXZIzn1hVCpMJNbHEBr0CpScFWMyWMVqVX4LPAqJc4w==
Received: from DM5PR20CA0008.namprd20.prod.outlook.com (2603:10b6:3:93::18) by
 BY5PR12MB3826.namprd12.prod.outlook.com (2603:10b6:a03:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Fri, 16 Jul
 2021 12:46:05 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::95) by DM5PR20CA0008.outlook.office365.com
 (2603:10b6:3:93::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 12:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 12:46:05 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 12:46:04 +0000
Received: from moonraker.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 12:46:02 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter
 <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, "Naresh
 Kamboju" <naresh.kamboju@linaro.org>
Subject: [PATCH] drm/tegra: Fix compilation of variadic macro
Date: Fri, 16 Jul 2021 13:46:00 +0100
Message-ID: <20210716124600.507871-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd077d0-36bd-4d6e-96b1-08d94857ad26
X-MS-TrafficTypeDiagnostic: BY5PR12MB3826:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3826A3A517350A387E4C2477D9119@BY5PR12MB3826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQGlBpm/Sq/Myvqt5cwEUxRGygyns9xNYM8ZXdEFM7ZAGS9pv0qdz9V62it7z8POwcPa2hKrtjn47kyJNJSs2zqjLKaZL7kJEjEjAndKIBBp/8THcyAn68nHasaoVPsfCvEV2bzhMv5Uw5YSL7zYwg+OC2yYVRgLNEeZMFPq6dd1gFSgaSe+gHJe3M/u4raHR0/ywwUAYHBkZb7AQbyihV7tSX/u8fFsXeEnkbiG54XDVoIWoQYphgxp2jlWk63lyOvG4o0VaDgcMxc8beLkKHaQo9tBXZXa1toXGqzBS+6AImgy32lt/GO//b8of0C+B+WaZX5uQD0COHVJWlyDPiVllqs3Rx0fILBxA7mvcYu1t0kcNoYMd/qtYfhmmlPf2YVJrzYn374K/vunTJ8u+Ip/ZkXbQbNSZgudd1SWxv3Viy2itwRccEH3I/NDqe7dFUC4IUAOSZXqbuBqUi60NZi/AH6NymMSvLg6Z1Q7h8kX8JSX+zkm3MnbcSEnbT79IgYosWLIGXlNP1coUgoOkkFdWGl716UYQ/oGHzYVzObrq2ZNTz6IBH9hApdFdTgMDljWu7gIre84ldP3Z++BCZzvgB/ltI4sIEKzbnk+QKBJE2GtbPDHHmFGoaYNpr7iW18UOGL03Br5FLCkPqvcOHQw2hz6sqk45fLHENRt7IGFuQuncJAjqigwaDVNsO9G1+hceokFDsb6GTuixM24zMTJC/VHL4NDSs963pEYB8c=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(36840700001)(7636003)(47076005)(54906003)(86362001)(82740400003)(110136005)(478600001)(316002)(186003)(36756003)(70586007)(70206006)(83380400001)(36906005)(356005)(2906002)(36860700001)(4326008)(5660300002)(1076003)(7696005)(26005)(34020700004)(8676002)(2616005)(426003)(82310400003)(336012)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 12:46:05.2808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd077d0-36bd-4d6e-96b1-08d94857ad26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3826
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
Cc: linux-tegra@vger.kernel.org, Linux
 Kernel Functional Testing <lkft@linaro.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 43636451db8c ("drm/tegra: Implement job submission part of new
UAPI") added the macro 'SUBMIT_ERR' that in turns makes use of the macro
'__VA_OPT__'. The '__VA_OPT__' macro is not supported by older versions
of GCC and so causes build failures when using older versions of GCC.
Fix this by using the '##__VA_ARGS__' macro instead.

Fixes: 43636451db8c ("drm/tegra: Implement job submission part of new UAPI")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c53b7207c478..e49630089149 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -24,7 +24,7 @@
 #define SUBMIT_ERR(context, fmt, ...) \
 	dev_err_ratelimited(context->client->base.dev, \
 		"%s: job submission failed: " fmt "\n", \
-		current->comm __VA_OPT__(,) __VA_ARGS__)
+		current->comm, ##__VA_ARGS__)
 
 static struct tegra_drm_mapping *
 tegra_drm_mapping_get(struct tegra_drm_context *context, u32 id)
-- 
2.25.1

