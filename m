Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28645170852
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994186EBC6;
	Wed, 26 Feb 2020 19:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B1A6EBA9;
 Wed, 26 Feb 2020 19:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL68/XCvoVpArNIHFZUTGrT1jigxcEBdiyn7A72/b30WDqQpwofNrxC5AHjq9AP5E3phqxoylueuorU16NpkPIeN23r9nQXdpJNTZUAuuTIJ+cv7/mdfuYGM53REqXF4y2RulaKZ0HUfZ9/qI/EC9lnRH3uYy2dhuZiIYDA3k7NTN5a9Z6NS3XgN3ZCNlDPeNINSwgpQ0hGCMXcjr+MZNLKq8awIMihNYp1dk7ddhRVBtxBq2fu4lPPDKFfLT3BPr8wBP29MhAjL9XO6n465c565bRw+UGK37+HPJdGAtSqo6X2CT6/T1YHDDYob6rDe7snKltSNe+JHQUlBjSikcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0yw5UORnhD9jhJZKoq3U0mozi1+naoh8kxFcJWfwYQ=;
 b=gYBHz9aNVpOj+aNocqbh2kTFmQy7L6EpvjgtBySNiGnHD7tI/pQ+cnhAONUJZTQXsGZ0Vm/VREDBfAifIi2g3qASSbhgIbVWgRtE4r/x/ES2XwsjGc1SY5YBMWNXbpx71wQYRn3UX13ePYs4Q+LtiK+UPaf6chHQsULEj0hPUx61rPWHPT10WHwJkIMZnqOQJ3Zfkr8xcsSAQPU/XdFGJer0gMlBaW3oxVSqecwYK1rvwzT526YzqwLNSyxGeKN3IuzBKYiZCwRRNt4qH3tC6tmXuj+E4Ndw5bQOUKrH3rjQ/UWonFwb2iuPTqj1WJNpY7S/KvgngyuIOM6XQqya2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0yw5UORnhD9jhJZKoq3U0mozi1+naoh8kxFcJWfwYQ=;
 b=KgJaquNe0Hwu5kpjK6KkUnJ0pP6tS1H8sRS2QGP9xFnngd7UY9bqVDejDQ0SS7tPcSvTN3kLPt7Gcocw5f5cPvMpGjveMoUOe0Opc5fRz3oWMEbnvba9tvz3qnKwdjhF32ioJrCbDgNsY3ZubGGd0SJCG9XfJixctaG0J18bTlo=
Received: from BN6PR1701CA0011.namprd17.prod.outlook.com
 (2603:10b6:405:15::21) by DM5PR12MB1337.namprd12.prod.outlook.com
 (2603:10b6:3:6e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Wed, 26 Feb
 2020 19:02:10 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::13) by BN6PR1701CA0011.outlook.office365.com
 (2603:10b6:405:15::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:08 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:08 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:08 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 08/11] drm, cgroup: Add peak GEM buffer allocation limit
Date: Wed, 26 Feb 2020 14:01:49 -0500
Message-ID: <20200226190152.16131-9-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(189003)(199004)(186003)(2616005)(26005)(426003)(336012)(4326008)(81156014)(81166006)(8676002)(6666004)(2906002)(1076003)(8936002)(316002)(356004)(70206006)(36756003)(478600001)(86362001)(7696005)(70586007)(5660300002)(110136005)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1337; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c46743ce-005a-444d-a350-08d7baee61ad
X-MS-TrafficTypeDiagnostic: DM5PR12MB1337:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1337B383AB9663E0AE9E0DCD83EA0@DM5PR12MB1337.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kx2r1P3QAN8LF4XsYHkJ8LbzczTJ8h9aBtACrEHymsrkZkpDTE9r4nP2ftBJMks3+O2m+Nai43BKdMu0ndUA9T+/5JvS9Q7tjuHUPY5qS4cCzkSxS9INPzNA1i6CB6hCdMZy3KsLgQKQWTgaQFgP/5tarorcdDE/EI/x3MzzsxrFfNvwm4dyjJhZ/tmHUX9XQsCdGj3+UPnJj3/UcyivhksiuUySXkwVEBrnH83B4VMShXz7k0ifC7aTtVqoyulFDN6VPbNwyGo3KYM6u37dliD5GncU2LAqE4W6Avpj9IKazmxMlONrvEiUYmSkanw17EF6fj/E5mBEmU0H1rZpCOjeE2tLZq7TE0eWD/N6UGDdEH6rO6ZHlz3s2cMSkE0GQHTKrNi24Wmqa1chvPiEY1Yi1f8xQlaiV1PvJKhMMVHRJ9qH95tTJoJ9i47Hb/HmB+Qw9ojrWGvLyDinSqz/IaCQEe0+Lyr8WXIGVHFO65HOAvmrebFVwfIL4KgWuqLWElTNu43LOlKT7MddCjw8l3Qj+DpYzM4C5VVfXLFrarQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:09.9537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c46743ce-005a-444d-a350-08d7baee61ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1337
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

gpu.buffer.peak.default
        A read-only flat-keyed file which exists on the root cgroup.
        Each entry is keyed by the drm device's major:minor.

        Default limits on the largest GEM buffer allocation in bytes.

gpu.buffer.peak.max
        A read-write flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Per device limits on the largest GEM buffer allocation in bytes.
        This is a hard limit.  Attempts in allocating beyond the cgroup
        limit will result in ENOMEM.  Shorthand understood by memparse
        (such as k, m, g) can be used.

        Set largest allocation for /dev/dri/card1 to 4MB
        echo "226:1 4m" > gpu.buffer.peak.max

Change-Id: I5ab3fb4a442b6cbd5db346be595897c90217da69
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 +++++++++++
 include/drm/drm_cgroup.h                |  1 +
 include/linux/cgroup_drm.h              |  1 +
 kernel/cgroup/drm.c                     | 43 +++++++++++++++++++++++++
 4 files changed, 63 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index f2d7abf5c783..581343472651 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2108,6 +2108,24 @@ GPU Interface Files
 	Set allocation limit for /dev/dri/card0 to 512MB
 	echo "226:0 512m" > gpu.buffer.total.max
 
+  gpu.buffer.peak.default
+	A read-only flat-keyed file which exists on the root cgroup.
+	Each entry is keyed by the drm device's major:minor.
+
+	Default limits on the largest GEM buffer allocation in bytes.
+
+  gpu.buffer.peak.max
+	A read-write flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Per device limits on the largest GEM buffer allocation in bytes.
+	This is a hard limit.  Attempts in allocating beyond the cgroup
+	limit will result in ENOMEM.  Shorthand understood by memparse
+	(such as k, m, g) can be used.
+
+	Set largest allocation for /dev/dri/card1 to 4MB
+	echo "226:1 4m" > gpu.buffer.peak.max
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
index 71023654fb77..aba3b26718c0 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -29,6 +29,7 @@ struct drmcg_device_resource {
 	s64			bo_limits_total_allocated;
 
 	s64			bo_stats_peak_allocated;
+	s64			bo_limits_peak_allocated;
 
 	s64			bo_stats_count_allocated;
 };
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 4b19e533941d..62d2a9d33d0c 100644
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
