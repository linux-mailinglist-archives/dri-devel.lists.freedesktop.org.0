Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29845170845
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875796EBA8;
	Wed, 26 Feb 2020 19:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760042.outbound.protection.outlook.com [40.107.76.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8150B6EB9E;
 Wed, 26 Feb 2020 19:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdM+8aNQkGeTvuJoUFyySNjDA1CXpiEbpcLCxAbLWPDZGsor4jRb/1aBOeEj28tmIuSLv+CHMigZtJiekz3D8sPmKBXF1bkhxCOPB5p461mbF8hLuzoxOEkj1vwbukOr/KykiNwhfAb5XkcvN4Jn/2CmYW8NW7Kd1oDingRrLAa359tII4nxc1RvzNFU0UfYUA3onQ3AS4g9GqCU2uBtIIbC3XthRfSxtJp8QYaa8Rqviu8cfUp69HmCVH+93YOLMIeyirMLLOqab2AucbmU4BNiKnRtW8chkk0CQCbyw+opUol/FS2M5crffP5Gq/HaS7pPANH26VkMFnWFliq11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiAbqtACZxUAOCGygYgff2fSwPAHDJcNbF8JiwTst00=;
 b=SLvA45s5MsPo7PmqUoLuw3ipxEbXaX+6DBdz/BYulZxcdjXqoW/AtbZgrB48VX/g1BIe3GRmXx/clpm9uXuY6dAaXRsJeuQ1abUk+aGiEac5IBIs+c97VjuPILLQcuRPIPAZRNcEpR+GX9xmcz+QQqJ4zGmJGpXBZjM609SjFuhrvt2gCLprl31ZXqt3G8PUyXG3PpyuJxLVCXlat6hbqG+8Z4UzDUREkileceZ/uLGR0KCBZ6raDx1zFXKizaspFKL0uuVsxMsBEzjhErngxA/iheXphUV/TyuFK+CZ4oSC6pQaYYkfqnOoF4r204uFstJXWZQhuSxZaTe/RilVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiAbqtACZxUAOCGygYgff2fSwPAHDJcNbF8JiwTst00=;
 b=PAsKcD2DeUi9TP+Z2suMFjCq5FjP81CeYmYxfCFEaFU29FyQD8ZJeW5r7aqb4CCxLFdgoxC3BeP4Yo3UlnQS+rlNKinympu98pDAlajBtJNDu/F2UuhDcml+7R0xpRY9rMnXpNpeaJdwJkk5D8MEkmd+GegVHm2tY+yhmaXB4oo=
Received: from BN6PR1701CA0013.namprd17.prod.outlook.com
 (2603:10b6:405:15::23) by CY4PR12MB1286.namprd12.prod.outlook.com
 (2603:10b6:903:44::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Wed, 26 Feb
 2020 19:02:09 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::44) by BN6PR1701CA0013.outlook.office365.com
 (2603:10b6:405:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:06 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:05 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 05/11] drm, cgroup: Add peak GEM buffer allocation stats
Date: Wed, 26 Feb 2020 14:01:46 -0500
Message-ID: <20200226190152.16131-6-Kenny.Ho@amd.com>
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
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(428003)(189003)(199004)(36756003)(336012)(6666004)(478600001)(2616005)(356004)(86362001)(426003)(1076003)(110136005)(316002)(5660300002)(4326008)(7696005)(26005)(70206006)(8936002)(2906002)(186003)(70586007)(81156014)(8676002)(81166006)(921003)(1121003)(83996005)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1286; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377ebe97-3a36-4e19-4f6b-08d7baee6090
X-MS-TrafficTypeDiagnostic: CY4PR12MB1286:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1286F2F9760B7D7CB276F13883EA0@CY4PR12MB1286.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NsIjiT4hRk37weOpuzgU7mf57V82CLQLEi5OsPHKVShAeGLxTELKxuiFslHWjnAOZWoiYMGYLq/9i1ukM0Jz76yznHuJunUwxgPgGxU/rdQZyBiD5KWzN23iyfB5UDSj4gT3WA4uvIK8SCYg4EG3r8eAQnXaF0n0m+ipb0i2U/o8pcjkJlDRdkyXjz3q0uSeRP2o5f5rTBu9m3Ey0XVgtKKe67Kbd96cKiHH7le1dMFn8bR3HsZF+oSZwO2tk8UGylXGYe5h3znceTKJsO3TRrVNYziIrP3QiRMQBTD/QZD2Ay+8kGTNTpzkYIFCl8Fjmy/37yLW/VuWYem9WWTkO0fcO77Ic9mp0OSf6rTmykVM6zsM+SzJ8MQvJzOQde+WJCKHftI3t11jpA44Q36097gy9DY4zST1MibfEQDjpU+YskqhJPGqtB+MImMi6zx9gAocCkP49I2f/FzjWrVRDdq0qP1JPuQq3y+rfh3CrmM9gjNY3tAal3nD1WcXqi+DZPW+VTECGvDP7TLaI43xABhb0gd+HgBWqrb9SJLzydQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:08.0827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377ebe97-3a36-4e19-4f6b-08d7baee6090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1286
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

gpu.buffer.peak.stats
        A read-only flat-keyed file which exists on all cgroups.  Each
        entry is keyed by the drm device's major:minor.

        Largest (high water mark) GEM buffer allocated in bytes.

Change-Id: I40fe4c13c1cea8613b3e04b802f3e1f19eaab4fc
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  6 ++++++
 include/linux/cgroup_drm.h              |  3 +++
 kernel/cgroup/drm.c                     | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index c041e672cc10..6199cc9a978f 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2075,6 +2075,12 @@ GPU Interface Files
 
 	Total GEM buffer allocation in bytes.
 
+  gpu.buffer.peak.stats
+	A read-only flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Largest (high water mark) GEM buffer allocated in bytes.
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 34b0aec7c964..d90807627213 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -13,6 +13,7 @@
 
 enum drmcg_res_type {
 	DRMCG_TYPE_BO_TOTAL,
+	DRMCG_TYPE_BO_PEAK,
 	__DRMCG_TYPE_LAST,
 };
 
@@ -24,6 +25,8 @@ enum drmcg_res_type {
 struct drmcg_device_resource {
 	/* for per device stats */
 	s64			bo_stats_total_allocated;
+
+	s64			bo_stats_peak_allocated;
 };
 
 /**
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index addb096edac5..68b23693418b 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -277,6 +277,9 @@ static void drmcg_print_stats(struct drmcg_device_resource *ddr,
 	case DRMCG_TYPE_BO_TOTAL:
 		seq_printf(sf, "%lld\n", ddr->bo_stats_total_allocated);
 		break;
+	case DRMCG_TYPE_BO_PEAK:
+		seq_printf(sf, "%lld\n", ddr->bo_stats_peak_allocated);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -325,6 +328,12 @@ struct cftype files[] = {
 		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_TOTAL,
 						DRMCG_FTYPE_STATS),
 	},
+	{
+		.name = "buffer.peak.stats",
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_PEAK,
+						DRMCG_FTYPE_STATS),
+	},
 	{ }	/* terminate */
 };
 
@@ -373,6 +382,9 @@ void drmcg_chg_bo_alloc(struct drmcg *drmcg, struct drm_device *dev,
 		ddr = drmcg->dev_resources[devIdx];
 
 		ddr->bo_stats_total_allocated += (s64)size;
+
+		if (ddr->bo_stats_peak_allocated < (s64)size)
+			ddr->bo_stats_peak_allocated = (s64)size;
 	}
 	mutex_unlock(&dev->drmcg_mutex);
 }
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
