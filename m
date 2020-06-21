Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE420290B
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820F66E44B;
	Sun, 21 Jun 2020 06:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B5D6E44D;
 Sun, 21 Jun 2020 06:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVIPbV57ZGrfNQjcsQ4vg+0LHUdZPP78+wvoaNf9eCufHwEcp80JwE57I3Ke+559VpSdFF+7OIORIwOAbCDbXNtbs7QE6fFD3Y0O9Uv2e5WIPW7Hvz4f2G+mHtIiXCqliQwAo3cpnqvt2lAOkCor174zmPLCzPcBK4OWhW1IgYf1U3USLHi+/JYw4zBHytAvO3mf85cWQJteDAC1FtB5IhJb/FqMaZFUyEAiAch+zgYdDiV5t/6q+pFs/g6Ysi1ohnC7TcvtDt6TrOdBZN7of0owO7WHFQI3wgCN5nb2tWII7sgnitcYK50PBN205Zzddg8giEL14jD2gtu25WtoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9TQbTbwKbdmkpe8dusD9dkfjTByEb0MvsSwznmmm0I=;
 b=mrkilx+/HkU2wPbEcRPXhKB06DvNoDyTIbdlOK7JAh3EVyxSFGbMcVxJQgk0Lv7b6YKsL8hFHNuhyk1VkWKpMZCiQhQWF+A8hq7F48fBxPaYEkDO34hX0MSIS/nT3PfUlm7mbyUf1/4k5EDj9QvtnQzWfh5bXZZU1VFeFcXbGrNKSHAgH+zsCJWa1i9Dj84qbe6wwxPHlS2Nt1UunE8ZNjoD97MBu1Eb47bGxg0mwWfUk+EeJrjMpgEhOCNMOnWgUegZ1e+xar6x3WnA9UapQikEglzL2+ZtBi1HJLK9rvaZ+IzGMj0Go4V8a4gvD5g7CzbRLE9LA6ytq8ZDoUZcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9TQbTbwKbdmkpe8dusD9dkfjTByEb0MvsSwznmmm0I=;
 b=19PqHaBOxUWtSVgrVjqJ/GL4ViKEkj622e6WXJlK70yUXiOkZJItJ7qY7iP8pjltcuqeUgplUjW3+XJ7RrfpmvxDn+ib4LECU98nqUkRJGD4lwI+sLfTWCsqhMxyiXzqdYQCWU4nuLJiNyLnL/b1Pmeu8rTog0+128dlrPo/nqQ=
Received: from DM5PR12CA0011.namprd12.prod.outlook.com (2603:10b6:4:1::21) by
 DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22; Sun, 21 Jun 2020 06:05:47 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::57) by DM5PR12CA0011.outlook.office365.com
 (2603:10b6:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:45 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:45 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:44 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
Date: Sun, 21 Jun 2020 02:03:06 -0400
Message-ID: <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(2906002)(26005)(186003)(82740400003)(70586007)(4326008)(54906003)(70206006)(47076004)(6666004)(4744005)(316002)(7696005)(110136005)(5660300002)(36756003)(426003)(336012)(44832011)(478600001)(2616005)(81166007)(356005)(8676002)(8936002)(82310400002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f20f85-2f7c-49cc-3172-08d815a9232a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1242:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12423CF3CEFF8E27E6A7C1A1EA960@DM5PR12MB1242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKdNuHt7slXmV5/lS8J4aaujY/b6cY0lhvIelb5Ozvb2Xd8Tw8VVCldGY5w9dMwdMsLbd7F5FIp77CgE1fH72Zdwu6RzRds9VqR/mXJJ343cVlippaGEt1L/mFM0at2z4qJVya5/8qy7sKsVePn11AoynnRQtDSR4328M1DHlT7jmEB8cEhbnj/9oNzAymMeCSdCPxYdVpDpickPSccWxceW/p8dP9YyeM4X8rI+tAknfFaLG0fNff5HPIAfgGa6tGnu6KyaEPFesghGb5sDMU1k89O5u8dz2HGl5muRgpx0obMsKDr65pIPEtfe8wCVu8sHL59+/KGQoJbhY59arDMoXUDRFNU3y3wPhlNe69Tv34D1QvQFcTV5xalpUcWZzbJTRGoqJDYKp7C6iafhZA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:45.5709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f20f85-2f7c-49cc-3172-08d815a9232a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1242
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new TTM interface to invalidate all exsisting BO CPU mappings
form all user proccesses.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 43592dc..6932d75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1135,6 +1135,7 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unplug(dev);
+	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
 	amdgpu_driver_unload_kms(dev);
 
 	pci_disable_device(pdev);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
