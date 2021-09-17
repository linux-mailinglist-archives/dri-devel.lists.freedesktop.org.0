Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EE40FDB8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22046EE54;
	Fri, 17 Sep 2021 16:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFC46EE52;
 Fri, 17 Sep 2021 16:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4kMzh7giWNzGxy5vjlIkbjpy11SfyRdu6jFIziU6t+3nSeE69StJvJYnunedQ+l/02sLYBViYRZX+wTB7If7GK/IjQsg/1xQ2Lu2fbtaHzKY6jphhk2Tf91PmsehO8sEmQUXab112zK+tHUxYGb9MGZ4+TosvAaXNx7vtfkaPd/t8yLuNbhBOTfgx0Z5QL5ki4C43SthOYmHN7JeHrCD9IQeIb7eb4kIgoM/VdjGMwDBG5Mdn7l14+hO25B4nkQmBI33WQMwHPeG1rzm9WFZV2k0VICc7bDGJ/s2hFPI6pu8hlWIi2Y5coIhkjOrnSCZXXwhAMUvrmj63Gbh5ro6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=68E/yQdgcWdcmGMlyH7gwEiQ5IbGlqN5Ib+lGG4OSFM=;
 b=YiQZFykVeuLRC+NmvVo1xks5z7Ato6QoHYoH25U5L9V0h93zHl1VuwDak52qShNIl6qUy2M2AqCNOCBZckzuoi2oGDhHXLHL3kgE2dTb2f6cX7WJjv08HaDopJzTlGZIIbh8j4ibB91yYVvTKY1kOQUH9Kb3eh+XSuIR49mFwlQmIdKtFwvFIes3GKMnU/VAyKKVeTkL4jWxvjs1pBZgGlMnIVx2hK9OFQwvB0izmVDTycBWz1ggiuJ1U2KqHmzvz6KJ/KqWd5SU6wiSFYSZ7zoDy3fEFVauEjq8QeH+pu79DKjWw8eemPFAUsdKmRPsOds2FEoxAgeniCFoFjnE0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68E/yQdgcWdcmGMlyH7gwEiQ5IbGlqN5Ib+lGG4OSFM=;
 b=Ry+FhZ/NyalWLYzebPoFf/vV9DqXztO10LponJN5YCuFCUXnvlzcoiq459WjmEj9iZ0fOHLqSObNPu/UqTBQOEWZoVnuattes3o7yEnvXj02IoaC+SKPhC+TgQCWO2hXtdtQUw32KGKn2+VCxNpjlqZhFBvhT0FLebOawv3hZvg=
Received: from CO2PR04CA0189.namprd04.prod.outlook.com (2603:10b6:104:5::19)
 by BY5PR12MB4836.namprd12.prod.outlook.com (2603:10b6:a03:1fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 16:15:57 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::b8) by CO2PR04CA0189.outlook.office365.com
 (2603:10b6:104:5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 16:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 16:15:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 17 Sep
 2021 11:15:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>, <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/2] MAINTAINERS: add Andrey as the DRM GPU scheduler
 maintainer
Date: Fri, 17 Sep 2021 12:15:40 -0400
Message-ID: <20210917161540.822282-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917161540.822282-1-alexander.deucher@amd.com>
References: <20210917161540.822282-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ca952b-21b8-4ac0-804e-08d979f66e94
X-MS-TrafficTypeDiagnostic: BY5PR12MB4836:
X-Microsoft-Antispam-PRVS: <BY5PR12MB48364BBB8EDC37E4E77A15F0F7DD9@BY5PR12MB4836.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjOe2a2wmGcj+mKT2NWCIqaFGwrVlTeE1Ul1lh+vcx+KF2Gyz5cfUa9UEIL6oZ/yeBOO0gO0xyqTszQtWrLyT32YFyAeUcAUb6QS0yrWJvH/5eH3OW9eN+hca8PwIsQt00OtIFJi6C9Jmtevm5ZVx4K8E6VvMVjlE59tULVAWlqnevS83LaFedKP9KF688GWx1kCchScD9w0eNFT6EL4jQhg3u3UEr7QcmOgf8ol4zhYmBWmJ1YHWsX8iasSrYJTtK7kS2ZyEaEcspSKEwirWdk111E+jW9B/4XYdy13DfZ8psEkEMGuZxkMhtSiGJVVlO0EBanE8+RHLRr0orU1FsyIFdkuMjC4I+YwQMDSBYfpwfWAoC6EeewdYKdn5bbM1EZnTM3Y0UclnBhN1tn13nPMU7hnwtxl9yUhmIb9IRQiqV9ImEiB+sAQ/Sm6EEpjtsKkjirHcBsaFAyzAqRsrkvi7nLzYVFtbVVajWbg+J6MNClw0O+z5lQq0YdywUJqmIA8zqcygbxim+Ufyna3OgV+iHecNGaGaG0ZU4egMnB1g+xEMI1WTJ0IvhckX0AR86dImc+jRI0Gd9UAT7ORIYI5oXS2/LizNiCd1xmNM9utne/8sQdRBMJRDZiZTnp9I2RWLoiwrCLiuUbehmsuumO8IZVjZssr3hNb70KoqTVXfkn2ocnG/2jACQ6h0wfwenXAmC2NL4qMb24kZA/nzfNEIv6XTd2SEvixrKeZx9s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(6666004)(4744005)(336012)(82310400003)(8936002)(2616005)(86362001)(82740400003)(16526019)(426003)(7696005)(36860700001)(478600001)(186003)(36756003)(8676002)(81166007)(70586007)(70206006)(356005)(110136005)(47076005)(54906003)(2906002)(4326008)(1076003)(316002)(26005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 16:15:57.2148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ca952b-21b8-4ac0-804e-08d979f66e94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4836
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

Now that the scheduler is being used by more and more
drivers, we need someone to maintain it.  Andrey has
stepped up to maintain the scheduler.

Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: airlied@gmail.com
Cc: daniel.vetter@ffwll.ch
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 379092f34fff..9d567e66a65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6369,6 +6369,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
+DRM GPU SCHEDULER
+M:	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/scheduler/
+F:	include/drm/gpu_scheduler.h
+
 DSBR100 USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.31.1

