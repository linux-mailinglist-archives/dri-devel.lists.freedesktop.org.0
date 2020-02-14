Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146BC15DD18
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735F06F9FC;
	Fri, 14 Feb 2020 15:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BBD6F9F3;
 Fri, 14 Feb 2020 15:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYSJAfFMAYFE8gqu8576XVMEcL3dUiBsUOAdaHohAqoW0aadcOel1qJr0KSAHOBXJOYw0tgjZSzQ7+wRov+SyrOn0K02Tlk1YZgw0QK3R0FQBUEzk91N0zB3ZLYny9rVXCVPjZhcOQ/bheJO4o9rsmFdag0C2e9HI6SzRqsPKovmm1+Gb/vvqdQ4ujMtxJww6iQXWKsrxKNbS72kuCJQlSyStaMzzEZgdWOdRf5fMVBqyDHffdTffu/oX0BkRlAUHGe3+v0eHXXyW2eJ42zYq0tKRs8RppYyJqNiuHmsyhgI20c116C9pNdNCfl3A+s+A1MSTDrghV2eUL8RFTVMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDD+cg9HBA357VUjoIcAxcX6UVY3AQ/GVu0LDkHvt50=;
 b=fYSq2hIEq70calrJAHhH82wgCN9shLUqbYdj3wVF67vG3VQbTvj+LcHIGBS1C7IiTg8xWnU1gr7ohavKwwFpD92SfTYLpyoI9+uvMBLL4mmqGWaw9Udv7e+LWV3rP0w761Tebf07WEx5WgVYMRW0de9tZB0VEYu0g3yqdb/OnIhGxw81S4tBlpoGtLkrXTtCPbiKJFeX5zpIJKlmBNpCPzJBUVu0uWN78hqYXRn71QaodV9Kojdvkx27knjmyLAcdULOSN0gtvxib3DZcpiN24e6yzdHksja85uqyYyxgTsm5azSvEo+ZgKtM7vKtegNybG1bZIwlHSy2o6oC5e/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDD+cg9HBA357VUjoIcAxcX6UVY3AQ/GVu0LDkHvt50=;
 b=ZXNvmeeyMcR6EXG1zk4wJpm766woTM0kz3TirBQtRmx37K3t9N7cI7AiGX0jTjCFjp+EAfCcnDxZjxkV3BL5Kmf8uhWjksD/K9rjq2WajS6Ri8t+YhbtyW4zkckNw54UCfd+agEOhYfEsXUctJp3E7Hf7VXwrl7P0MRFaGf7Ues=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by DM6PR12MB3500.namprd12.prod.outlook.com (2603:10b6:5:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.28; Fri, 14 Feb
 2020 15:57:15 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:15 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:15 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:13 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:12 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 06/11] drm, cgroup: Add GEM buffer allocation count stats
Date: Fri, 14 Feb 2020 10:56:45 -0500
Message-ID: <20200214155650.21203-7-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(189003)(199004)(8936002)(186003)(110136005)(316002)(1076003)(8676002)(86362001)(4326008)(336012)(356004)(6666004)(426003)(7696005)(26005)(81156014)(81166006)(5660300002)(70586007)(2906002)(6636002)(2616005)(70206006)(478600001)(36756003)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3500; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8369b42-479c-4339-1fae-08d7b1669007
X-MS-TrafficTypeDiagnostic: DM6PR12MB3500:
X-Microsoft-Antispam-PRVS: <DM6PR12MB35009E030EA580E9F87B209A83150@DM6PR12MB3500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwqyLK1KmQC95I3c98hLGn9SDV7prZoUytAu4eFgTpU/zsmOledqFLxCe251O1iUx8DcoNJaTkGuSIcH+FrRVMFuzSDHa5KuAT0vIqlllg2uMCv43yZkJy0uUneeKYrmDMpo28ueJ5mrhpCicYyOOu9EImO8pUHEzoMIkmz7YEBsaMWy5E8smYJzHSdMNY9MV2FbwhGwWLIfuYzshtfvB+lHVN+4X8w/vgBIIspEMksPaS4N1xzEv65oDUzO0S+2nqNyO9vPTHp+IdTyuyOK1wSkGGJYOoLwAkinFAh5G/SLijKe/hhgm1W9bjMls22A1uloh7YaN6RrxEb25l8iJmmhWZo4JkeiDvYpxg1MgiVK9EP26CF1jYQZXE1Ez+mhkMiAK/h0fBwSX0cJ6sBTgmCivztVPwJ7Eeh4uRCLyNhQX11+a/fI+3vkR3QedONXOgvnw6f+SpfARyOyJbWkImHVs8FJTTcmz3tnkPQb8rYzuq2M5im7/CBS6dZWRSbo5QwFS7cpNbBB+zR+NRs8gFIyIiXYTaBNvfUpKmhoBbY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:15.6940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8369b42-479c-4339-1fae-08d7b1669007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3500
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm.buffer.count.stats
        A read-only flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Total number of GEM buffer allocated.

Change-Id: Iad29bdf44390dbcee07b1e72ea0ff811aa3b9dcd
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  6 ++++++
 include/linux/cgroup_drm.h              |  3 +++
 kernel/cgroup/drm.c                     | 22 +++++++++++++++++++---
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 75b97962b127..19fcf54ace83 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2075,6 +2075,12 @@ DRM Interface Files
 
 	Largest (high water mark) GEM buffer allocated in bytes.
 
+  drm.buffer.count.stats
+	A read-only flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Total number of GEM buffer allocated.
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 593ad12602cd..51a0cd37da92 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -14,6 +14,7 @@
 enum drmcg_res_type {
 	DRMCG_TYPE_BO_TOTAL,
 	DRMCG_TYPE_BO_PEAK,
+	DRMCG_TYPE_BO_COUNT,
 	__DRMCG_TYPE_LAST,
 };
 
@@ -27,6 +28,8 @@ struct drmcg_device_resource {
 	s64			bo_stats_total_allocated;
 
 	s64			bo_stats_peak_allocated;
+
+	s64			bo_stats_count_allocated;
 };
 
 /**
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 7a0da70c5a25..bc162aa9971d 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -280,6 +280,9 @@ static void drmcg_print_stats(struct drmcg_device_resource *ddr,
 	case DRMCG_TYPE_BO_PEAK:
 		seq_printf(sf, "%lld\n", ddr->bo_stats_peak_allocated);
 		break;
+	case DRMCG_TYPE_BO_COUNT:
+		seq_printf(sf, "%lld\n", ddr->bo_stats_count_allocated);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -334,6 +337,12 @@ struct cftype files[] = {
 		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_PEAK,
 						DRMCG_FTYPE_STATS),
 	},
+	{
+		.name = "buffer.count.stats",
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_COUNT,
+						DRMCG_FTYPE_STATS),
+	},
 	{ }	/* terminate */
 };
 
@@ -385,6 +394,8 @@ void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 
 		if (ddr->bo_stats_peak_allocated < (s64)size)
 			ddr->bo_stats_peak_allocated = (s64)size;
+
+		ddr->bo_stats_count_allocated++;
 	}
 	mutex_unlock(&dev->drmcg_mutex);
 }
@@ -402,15 +413,20 @@ EXPORT_SYMBOL(drmcg_chg_bo_alloc);
 void drmcg_unchg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 		size_t size)
 {
+	struct drmcg_device_resource *ddr;
 	int devIdx = dev->primary->index;
 
 	if (drmcg == NULL)
 		return;
 
 	mutex_lock(&dev->drmcg_mutex);
-	for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg))
-		drmcg->dev_resources[devIdx]->bo_stats_total_allocated
-			-= (s64)size;
+	for ( ; drmcg != NULL; drmcg = drmcg_parent(drmcg)) {
+		ddr = drmcg->dev_resources[devIdx];
+
+		ddr->bo_stats_total_allocated -= (s64)size;
+
+		ddr->bo_stats_count_allocated--;
+	}
 	mutex_unlock(&dev->drmcg_mutex);
 }
 EXPORT_SYMBOL(drmcg_unchg_bo_alloc);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
