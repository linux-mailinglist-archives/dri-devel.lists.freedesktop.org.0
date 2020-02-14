Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FE715DD1B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A46F6F9F3;
	Fri, 14 Feb 2020 15:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC50F6F9F6;
 Fri, 14 Feb 2020 15:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9Yp88VDC6oPRIUlltYLjqXabDu1ceOUuTE1ywHmbRYKkuUz/+ux/pChy5Gr54awfWg2XxOOHyUMpfRwoUujdJYU3dgWozZUdDcrII9BOXws2ZLeyz8MqEEABBJ0VTCXrJY0SOVA2+UUAjPOxC9A2gMCqBxenNFwVKGPH0vsUM/cTt1r6lKf96mWtPlNtINeRWcmJ18i2IQ4V7cSV9qesN0vXgm0JTtTfx0fJw1YEX0FV9p3RdOjUW8wCw8VSi7bEy3KYbMIH2air6k26uBhgOgDGcPfaBUuicZM6idUJYKtvZ5j4gtW9wKUAKjiL1oPJt+c9oYLktOAazdLwAQFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEzt0MlEkEuOUnc7BpB7xU8iofhUsMuYdD0QvPihCjM=;
 b=elktfAj+KjfW46tgiD8Z2QLYehbT/9rcDeC6kdG5tpUC2jH9TcAToGxa0ulmYG2x1Wq8o5e77EOe0VFYwSvRFFPUwx0u/bCy+axsGRgSDKipswiveJgthXRReDv01C5j5OMWDiG7mgDT+dRUJ7Lxx5Iqk+FzNBOnDpmTogWvzFxJtzmYRggcFjy0LRPw60l0FAZh9w/5C/Kmr2vdOAXof6PbhSk45aYMKOujRNeEvqgx4BVZI15LK2BMkOpItRmnAP2Gi16Tq//51PjwDRZ8nNLkCo40xdvd68YC98ovjeaqe6LIFMy4XREYX2LMOii7S+NpN59xier/hrYi8Z+5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEzt0MlEkEuOUnc7BpB7xU8iofhUsMuYdD0QvPihCjM=;
 b=So/sjdQGnZckRJCyflSkqPJ8bF2RKHpWLvT0NBij1+VD4ELglC2H4E/gPvyxsXw1FHQ4hNWoTO7OkDJhIFX9Sg+L4mj7DKLErOgwrPvxVF0fpV9A4573cQDY8wvOBQkPlE3QeKiwucUJ5lxFA2HFAVe0gsDJ9PYJEGpDvkZ4oLM=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by BY5PR12MB3954.namprd12.prod.outlook.com (2603:10b6:a03:1af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 14 Feb
 2020 15:57:17 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:16 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:16 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:15 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:14 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 08/11] drm, cgroup: Add peak GEM buffer allocation limit
Date: Fri, 14 Feb 2020 10:56:47 -0500
Message-ID: <20200214155650.21203-9-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(428003)(199004)(189003)(26005)(186003)(81166006)(4326008)(7696005)(81156014)(5660300002)(316002)(86362001)(1076003)(426003)(70206006)(110136005)(36756003)(336012)(8936002)(70586007)(6666004)(2906002)(6636002)(478600001)(356004)(8676002)(2616005)(921003)(83996005)(1121003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3954; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17cb0a9f-4135-4bf7-97db-08d7b16690ac
X-MS-TrafficTypeDiagnostic: BY5PR12MB3954:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3954CA6A43BA89B9289142EE83150@BY5PR12MB3954.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYIrwvkvoBPlK/3pZ8eL2qom+H94KgsFmo8nengnMeBjiqqnOW/bv7z6uk9hRA1BvUQMoAYMlztYkZJbwIwvNjpcyY0UkNRmo9kWkrgC6aT29V23S9l5D2kTuOTJoTLiNCtL8YUkodb7QCDsyKs5BnXoJa8SZ3o+2LOZzMyzl5yeHMTtS6qUWpGNGpkRPeha1/oUFyAmT0vSiPZKPtHeko1YI5UO9MtROAN5IVgLN1pbjGuTehUs2VkNYssuPNh0jSYKUYC7wSczKynUuismXHxIN/sIh4RoHUNePqz9tHtiOLuAbnCr+Hfvf/YfykEj2HCPjCQzIVKE39XGwqQL1LxwnAldGgSpJNsCHAsAlDvrU1dLRdaH466gGFHniDTQvdZl/DJawxcggYdt7c3RId0qIRbGhNnk8vv6YqhiiftjYaXZ5YYa7OuOWsynhQtNxPJC7/vmcocT7Kr1zIo1Owl84kQvVzQFifAiiWomUgjDfD++eLy0M4cLKuVF8T28yC7/eYLsNhRVTSVJmwjbEta5bAaJVQq1SkrNBZ1Iklg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:16.7814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cb0a9f-4135-4bf7-97db-08d7b16690ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3954
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

drm.buffer.peak.default
        A read-only flat-keyed file which exists on the root cgroup.
        Each entry is keyed by the drm device's major:minor.

        Default limits on the largest GEM buffer allocation in bytes.

drm.buffer.peak.max
        A read-write flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Per device limits on the largest GEM buffer allocation in bytes.
        This is a hard limit.  Attempts in allocating beyond the cgroup
        limit will result in ENOMEM.  Shorthand understood by memparse
        (such as k, m, g) can be used.

        Set largest allocation for /dev/dri/card1 to 4MB
        echo "226:1 4m" > drm.buffer.peak.max

Change-Id: I5ab3fb4a442b6cbd5db346be595897c90217da69
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 +++++++++++
 include/drm/drm_cgroup.h                |  1 +
 include/linux/cgroup_drm.h              |  1 +
 kernel/cgroup/drm.c                     | 43 +++++++++++++++++++++++++
 4 files changed, 63 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 064172df63e2..ce5dc027366a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2102,6 +2102,24 @@ DRM Interface Files
 	Set allocation limit for /dev/dri/card0 to 512MB
 	echo "226:0 512m" > drm.buffer.total.max
 
+  drm.buffer.peak.default
+	A read-only flat-keyed file which exists on the root cgroup.
+	Each entry is keyed by the drm device's major:minor.
+
+	Default limits on the largest GEM buffer allocation in bytes.
+
+  drm.buffer.peak.max
+	A read-write flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Per device limits on the largest GEM buffer allocation in bytes.
+	This is a hard limit.  Attempts in allocating beyond the cgroup
+	limit will result in ENOMEM.  Shorthand understood by memparse
+	(such as k, m, g) can be used.
+
+	Set largest allocation for /dev/dri/card1 to 4MB
+	echo "226:1 4m" > drm.buffer.peak.max
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index 2783e56690db..2b41d4d22e33 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -16,6 +16,7 @@ struct drmcg_props {
 	bool			limit_enforced;
 
 	s64			bo_limits_total_allocated_default;
+	s64			bo_limits_peak_allocated_default;
 };
 
 void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index b03d90623763..eae400f3d9b4 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -29,6 +29,7 @@ struct drmcg_device_resource {
 	s64			bo_limits_total_allocated;
 
 	s64			bo_stats_peak_allocated;
+	s64			bo_limits_peak_allocated;
 
 	s64			bo_stats_count_allocated;
 };
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index ee85482edd90..5fcbbc13fa1c 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -95,6 +95,9 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
 	ddr->bo_limits_total_allocated =
 		dev->drmcg_props.bo_limits_total_allocated_default;
 
+	ddr->bo_limits_peak_allocated =
+		dev->drmcg_props.bo_limits_peak_allocated_default;
+
 	return 0;
 }
 
@@ -305,6 +308,9 @@ static void drmcg_print_limits(struct drmcg_device_resource *ddr,
 	case DRMCG_TYPE_BO_TOTAL:
 		seq_printf(sf, "%lld\n", ddr->bo_limits_total_allocated);
 		break;
+	case DRMCG_TYPE_BO_PEAK:
+		seq_printf(sf, "%lld\n", ddr->bo_limits_peak_allocated);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -319,6 +325,10 @@ static void drmcg_print_default(struct drmcg_props *props,
 		seq_printf(sf, "%lld\n",
 			props->bo_limits_total_allocated_default);
 		break;
+	case DRMCG_TYPE_BO_PEAK:
+		seq_printf(sf, "%lld\n",
+			props->bo_limits_peak_allocated_default);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -476,6 +486,19 @@ static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
 
 			ddr->bo_limits_total_allocated = val;
 			break;
+		case DRMCG_TYPE_BO_PEAK:
+			rc = drmcg_process_limit_s64_val(sattr, true,
+				props->bo_limits_peak_allocated_default,
+				S64_MAX,
+				&val);
+
+			if (rc || val < 0) {
+				drmcg_pr_cft_err(drmcg, rc, cft_name, minor);
+				break;
+			}
+
+			ddr->bo_limits_peak_allocated = val;
+			break;
 		default:
 			break;
 		}
@@ -517,6 +540,20 @@ struct cftype files[] = {
 		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_PEAK,
 						DRMCG_FTYPE_STATS),
 	},
+	{
+		.name = "buffer.peak.default",
+		.seq_show = drmcg_seq_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_PEAK,
+						DRMCG_FTYPE_DEFAULT),
+	},
+	{
+		.name = "buffer.peak.max",
+		.write = drmcg_limit_write,
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_PEAK,
+						DRMCG_FTYPE_LIMIT),
+	},
 	{
 		.name = "buffer.count.stats",
 		.seq_show = drmcg_seq_show,
@@ -546,6 +583,7 @@ void drmcg_device_early_init(struct drm_device *dev)
 	dev->drmcg_props.limit_enforced = false;
 
 	dev->drmcg_props.bo_limits_total_allocated_default = S64_MAX;
+	dev->drmcg_props.bo_limits_peak_allocated_default = S64_MAX;
 
 	drmcg_update_cg_tree(dev);
 }
@@ -585,6 +623,11 @@ bool drmcg_try_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 				result = false;
 				break;
 			}
+
+			if (ddr->bo_limits_peak_allocated < size) {
+				result = false;
+				break;
+			}
 		}
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
