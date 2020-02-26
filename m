Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346D17084F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04946EBC4;
	Wed, 26 Feb 2020 19:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A306EBA8;
 Wed, 26 Feb 2020 19:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RslJ6LOtyccCN2g3kVTp3s5bUxiB1nGWaZu35D79cqZtxOthqZcOyJ6ME2sutoX3Vv6vb1cx5GIEdE7CQqZWNIEbixr8kxxg+976/AiDfwQj3pcSN3+9LRQ2Emb7Wuzle9dU7/x2bkNNHSFSlemvy50oRDMYplePX2kiF0Kvr2LFtiUbXwC44T7C/ApTlR0W1IzIeRxarN8goSrFhY5o6WvqRhyvjWmFT5ZXii5mzNJvb7LmmQhGriFFKAWm7sJvqmXNqA9r4tAKX2K09+T5YZSHwXPG3ISysSDrpJIlPw98an244OTwAg30p4GGghDSM0LQ0FURbcMpkTbVjanH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5tifYjhosGpQ3nDTsS5i6AA9WKlN8ce5piRJCNyMsY=;
 b=LIDSpaY1EJn8GjsTThPkGI2PjMSeE8RkbxDAIxH5Qj4R2+BRqkfjbM8G+5E8VVXwq7W4REq+K+Io2Lhd2Nv23/bAA4k4uLXZdWC1DsnknTrAEoeKJUcsAsXNY8mugiU4QnfZuO8PYLHz0MpSiYJEsPDL4O61euqg57svrITVPSw8tn1+au+X0urUm6PnVEjQFnzCLe0iq6lM//iSbr+NGaRNZ9j4oPtgGRddAwPFytRwba7iBae51p3MQmqGJuxBDv2NMtsapTkVJ3Bky1Qxf8ON4FDfK712D4deLXFUgXV+3ZixR3FUWFcgruf67080h73essWb9acvze+VYTkQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5tifYjhosGpQ3nDTsS5i6AA9WKlN8ce5piRJCNyMsY=;
 b=Nw7DIMO17S8HToGO5q1GmJdfi2HjJFTJeuDybUVscxMDtP2l2jM9x8N7VBUeYX4Y5FgsBYtozPjXFPNQi157U04q42ZnADzjk8w/qB+w39vDQ/gSmsQrwEDkn7uTAWo1Ht7S2m801GeFLeAtfIHXGE9d2W+ymkqAys+pLfB4kx0=
Received: from BN6PR1701CA0003.namprd17.prod.outlook.com
 (2603:10b6:405:15::13) by MN2PR12MB3502.namprd12.prod.outlook.com
 (2603:10b6:208:c9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Wed, 26 Feb
 2020 19:02:09 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::61) by BN6PR1701CA0003.outlook.office365.com
 (2603:10b6:405:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:09 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:09 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:06 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:06 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 06/11] drm, cgroup: Add GEM buffer allocation count stats
Date: Wed, 26 Feb 2020 14:01:47 -0500
Message-ID: <20200226190152.16131-7-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226190152.16131-1-Kenny.Ho@amd.com>
References: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
 <20200226190152.16131-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(189003)(199004)(426003)(8936002)(36756003)(81156014)(70586007)(356004)(478600001)(2616005)(8676002)(81166006)(316002)(5660300002)(6666004)(1076003)(2906002)(4326008)(110136005)(7696005)(336012)(70206006)(86362001)(26005)(186003)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3502; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7276df0e-aa1e-4d8b-1204-08d7baee6151
X-MS-TrafficTypeDiagnostic: MN2PR12MB3502:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3502D33E6CF0D80E25E69A7183EA0@MN2PR12MB3502.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Xq9zBZRUJIJ5BpjkO1Q5MLIfONw92dFEq3xEBvzpScKh4ZPBWLnyPPFhMTy9nwgw25Tab+50DKIotQrQnt8p8n5uwTDT2U/jSsXdXlYF1CWO1WZ7+6kH+FvfZMLPp9Hjd8Mk9xJ8woDoGLAik7nXOLXXWyYN0ySWg6xiPZIAsrHnncXlayHF+uwKlbMOKy2l9VUaMgimUWFq5fz6G1Zcmhm2inniRA/e9kj6aIcS5FlG+/I+pSHVL58ott3xK3aHB6cf5tna5HC1dfoRFXc8ybY+0LVteqwW08xX0kLNXZrbW+SQ+Q7lKBKzIzi4ediOyW9VHdJSOwBaYS3IoW28kXUaLWp0fW6GV9H0mRzKysImixbFw/7UcVH0c4fDahFJqN7re8uCf7BArp1QV80EjwFA1gwnIZvYHAw05UZz/gBAyRUi00aMKRDYs2Gp2vMy1A36aO349kO25Imkebznv37fz5OdkNqILK/QFp522Y8EhhIXIHviq92bWimMiKmfadeu5IOSjYqXnZAL/diMMVM/YS6xfkrRgDD5lYYyB8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:09.3450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7276df0e-aa1e-4d8b-1204-08d7baee6151
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
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

gpu.buffer.count.stats
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
index 6199cc9a978f..065f2b52da57 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2081,6 +2081,12 @@ GPU Interface Files
 
 	Largest (high water mark) GEM buffer allocated in bytes.
 
+  gpu.buffer.count.stats
+	A read-only flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Total number of GEM buffer allocated.
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index d90807627213..103868d972d0 100644
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
index 68b23693418b..5a700833a304 100644
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
