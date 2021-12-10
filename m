Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C8470CBA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 22:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D78910E2F1;
	Fri, 10 Dec 2021 21:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10E310E264;
 Fri, 10 Dec 2021 21:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsprLL35PoRE5ssEn2mIEyRHNjnVsGApUlhPvknJRFQX06MkTD4qgce8NR9iBVGZhgKgOEk1Lb9LpMmfHEee6iSwEprKhffROFoHm9Zx/VJ3bGG19vCEWMs6fQS1ctlaLDxpDDDCo+1K/A75Wfbzzsw97lsvmAgNMqua06rSNQAL6p6mTt0WG6hw7OZPV5W+++QoFxePEIQOzIpdyeNm8DjkooXChOVF5+YBQo+8BmaiSUQKYOA37LvUYbMg7VcU6DSavpt1gqO/iibhmBpcP2aoWiO/VWlXOKdfdfP/KQEOF3Qc0Q5NA6th40AwgGlmFEBcXGuAdcaghcbbSxbCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbzdm5nwA2N3ChngXMMaVaMRvt+yFGpGK1QspjVwk+k=;
 b=YckH56E6KtPfyEBMTzOkhq+z18clvR/cd8PbLDWFaGi2PwAmq8UeuxrVHzIRzbRmgeSEoQspW+gQJgmuHRy42JLrDsyKXw3f8d0Qj2Yd4fU5uWyF9uZzjF2Qll5U/aXkzzh2rELok3yVdqCZZFo7ltzYd/OExF581ODWMrU/S3Srrm5jRzue+8oh3206We0wEOMkvtntTX3ef0tSWGdqDi9xMi4sksgr3xMQffXywQ/OPGceSg/xjHPNxiJAf9S752wuzLTIZI6L6zcg9U2u3Mk3T9zuQTN4RZrXEaKqgWfINBPXJem+xrho7vxLaQOz/TPgVPWeBa1enXRTnNjQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbzdm5nwA2N3ChngXMMaVaMRvt+yFGpGK1QspjVwk+k=;
 b=oQPtsIq1Pe3PuEOuyMsg9tOuPppPTikib5Q0LmgL9Nlt7I14ys/zeAqR0nFEFubkXbZrRmC+aSVkGjGMVElquTglaquhtmCHNsG7LgClX3p2q0BfZHa6jlaTEkfUajfNziPjb3KmWFRp73UYVlIt9Oac9z/ORDtDKiTXvGzcBpY=
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by MN2PR12MB3037.namprd12.prod.outlook.com (2603:10b6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 21:48:15 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::a4) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Fri, 10 Dec 2021 21:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Fri, 10 Dec 2021 21:48:15 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 10 Dec
 2021 15:48:14 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v2] drm/amdgpu: Don't inherit GEM object VMAs in child process
Date: Fri, 10 Dec 2021 16:48:02 -0500
Message-ID: <20211210214802.12620-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2e29f0b-536e-4d63-ddf5-08d9bc26c544
X-MS-TrafficTypeDiagnostic: MN2PR12MB3037:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB30378480FC438E00CCB53A19FE719@MN2PR12MB3037.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxAVfEyFI1YwfLEJXqPiUx4eurZLy1wTWZabfN1fXharxHNMJqQt2R47ZsZxY/Dy+2nQtSy+mtVcNA4oVIA3V2678j9TktASdJH/2ywKkD4qoIWWOo0S7hx+P8CUeFGOwHM2bJEK2/E0zWywoINbm0M5MfG3zvFoiZhthAmh755Spuy2FX7j8i1Re4eUGaUnfpGEH+vKaxbQH1mgsJ8pS6Aw2ddkk+QuMwIP50Ao8K7XNlSl5tcZUYIgjWqxu7hQvu9Te62WrnAEyYoVdFECnl5BZ7yghuWr4dswKaREbQutBwA8lBx3o/A+noI+rw9/OHvpCaUuLwogp8T+vjhE6pVWxXad/jiiTkr9kanty1h+6EILr+kqHH5b4GVWX8kWadyVfzGq+9XFvgUZ2/HiyagjWRdY+TsFJ7aq0NtD1Do/1wbmDHRRLtQ9AqUXblS7TNcZ0OiDOdntyOgFCe3L1TSw+cQRtKuBeN9vvhSPx3WJwmbavWnCE0+Ojk4KwKOjGnLpnZDfpVzjewHDS/s3zt1cJ/CkkVSMaUEs5g4Wr5VJLEbNgISHtyCabzUvXYZDuaiOR8cY4oGzWSGNGpG7zCi8Ud/Qr+YUy4QK2Cuqo79z9TQldynDohpJoezZs6Iuy4k5iC8MKGESDyTUnoPEBxCB8OJO7TOJBVK7WQ3/jkSHTgz9vXE4Dh/1is2yi5a0acY9HqSTgsfwYtMvJlBq4/iM98xdjxHd2opk1aKzqA2RIynxQlRHJE91zX3Was+NgV21iG1Bb7338b7uItS2CHZ865KAZzF6geOQrcm5IrI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(81166007)(508600001)(5660300002)(36756003)(336012)(47076005)(426003)(7696005)(2616005)(86362001)(186003)(44832011)(16526019)(2906002)(4326008)(82310400004)(8936002)(110136005)(54906003)(26005)(316002)(8676002)(356005)(36860700001)(1076003)(70206006)(83380400001)(70586007)(40460700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 21:48:15.3571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e29f0b-536e-4d63-ddf5-08d9bc26c544
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
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
Cc: daniel.vetter@ffwll.ch, Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, David
 Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When an application having open file access to a node forks, its shared
mappings also get reflected in the address space of child process even
though it cannot access them with the object permissions applied. With the
existing permission checks on the gem objects, it might be reasonable to
also create the VMAs with VM_DONTCOPY flag so a user space application
doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
system call to prevent the pages in the mapped range to appear in the
address space of the child process. It also prevents the memory leaks
due to additional reference counts on the mapped BOs in the child
process that prevented freeing the memory in the parent for which we had
worked around earlier in the user space inside the thunk library.

Additionally, we faced this issue when using CRIU to checkpoint restore
an application that had such inherited mappings in the child which
confuse CRIU when it mmaps on restore. Having this flag set for the
render node VMAs helps. VMAs mapped via KFD already take care of this so
this is needed only for the render nodes.

To limit the impact of the change to user space consumers such as OpenGL
etc, limit it to KFD BOs only.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---

Changes in v2:
 * Addressed Christian's concerns for user space impact
 * Further reduced the scope to KFD BOs only

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index a224b5295edd..64a7931eda8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -263,6 +263,9 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
 	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
 		vma->vm_flags &= ~VM_MAYWRITE;
 
+	if (bo->kfd_bo)
+		vma->vm_flags |= VM_DONTCOPY;
+
 	return drm_gem_ttm_mmap(obj, vma);
 }
 
-- 
2.17.1

