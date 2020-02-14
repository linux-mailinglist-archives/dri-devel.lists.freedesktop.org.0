Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E824F15DD10
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEF66F9E5;
	Fri, 14 Feb 2020 15:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3652D6F9EC;
 Fri, 14 Feb 2020 15:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D05vAlX4qGuwHh5eWOffGdlS6EGZbD6r1E4YRjfqSmHD/6bRmD0c6QUPg3zJOHR3Ql5FTPvgV1NEL1w5MlrlCstk1Rz0V8R6HtZ3ptqYLZM1UsbQTNJX6xfsxZDCmuHdpkh3dXzl0s93F/iSduUTL85k6g2t2hX4oNJhY01mSY3t9nwFQl8CqI9jMUYctifrRd+H8NyFjDlqHT/xHk4655Z4jFNDcqyZrh0t7uj6O5D9WYvNx3G/N4f24N/s9mgPhlo2IIsNJXvyUkb29NPrgIqQ6+j+7J7JKkCS9Bgwm+LocMRUYx/ILsA0MZ5pON23U7N7tEtzRiDa1HD85a1K1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy38XTm1AslX2SVWlbJy84/4buILNfghMRpt4e5sNT4=;
 b=V0t/Nu/aQiYuo6saC0F86HgwDa9ppNdXQy9GX6J94BMZ9kwGGGY2K2qxTlpCW0xEO/Awa/pUI6wN+o9eGs3MjGtlHw9nLKgZfjknszE1Hh261Gj0g5TggMikntkZh/cB8zRga0p5m0dX0W1QoOBTb7WMHArrb3fvSEhJK38GWRw6QCSDNFm2IM+obdZj2IO2e2WrtRT3SB80qBkbcMHAbkmDm4cRBNJdRP6n+xjQTR4XMDDMp0XZx462jwZ28uUHKtjYCTzY71gUdagfGySxw+IgGv5WutpFVIPiDd0DnOHgweBqB88ZQOdvWtnXjexP3CRKvnNzqO2eT8/tZ7gEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy38XTm1AslX2SVWlbJy84/4buILNfghMRpt4e5sNT4=;
 b=O/tD8aOn9LPELaSLMQQEKZjmCEVywCBgQl6mzQbzYBHj9AZChiO5C59V0gxFj8yjMrVIxO9jZrDx7nsq6DFKD6U+7HOX7RQa/uo2V5vepfWLH0w0wrK+1p+1qk/COioxYPvKVn32iEQHUhTvsxc7L+2WCU6HJ2S3mczaIfi2AhY=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by BYAPR12MB3286.namprd12.prod.outlook.com (2603:10b6:a03:139::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 14 Feb
 2020 15:57:14 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:14 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:14 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:12 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:11 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 05/11] drm, cgroup: Add peak GEM buffer allocation stats
Date: Fri, 14 Feb 2020 10:56:44 -0500
Message-ID: <20200214155650.21203-6-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214155650.21203-1-Kenny.Ho@amd.com>
References: <20200214155650.21203-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(428003)(189003)(199004)(186003)(2906002)(26005)(86362001)(2616005)(1076003)(4326008)(6636002)(110136005)(316002)(36756003)(70206006)(70586007)(426003)(7696005)(336012)(356004)(6666004)(8676002)(8936002)(5660300002)(81166006)(81156014)(478600001)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3286; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2d1b88-7b6c-4f28-ef7c-08d7b1668f2c
X-MS-TrafficTypeDiagnostic: BYAPR12MB3286:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32861E229896484FFCCE8FE983150@BYAPR12MB3286.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZTP7oDK2XTQyX/6b38Q7fmmv5YXJpHsqv9bqaLN4JWoBiIe59dyR5iC9UOUDMW2rkqs1hd1sKo1ljGlBjczAt80o5C5fc9kmx/1eZMG9/mmzLP15V715ZAL56EuTn77fz3V+RZG3Gmbpx0vXeO/iE1OvkqKq7IzvOoi6gCVrgxH0AatjaAatL2sHs+Uy3SsuZgodpd+ZOKvdKvk3ofI2FmvNZkhHyPAF1CeQO7/jWIms8a1zh9Igq7uyk6z/C9J9vVDTTLxH7gxoN0r8VU+ca8YgB4qfuUedccjUJLErggXPMLdatsHOrVhXEU9gywZlZOlTjURhdPa62ruDyrsLU3Bll4wr2kcNuBWCFbbLY7roPw9oQwrhefBJ+nd3thD75m/O4HMATmqqFLWb2RE4kQISOwuP9picTQEGy0RQrTEarHiw5u/QVbVidT2y8NkBH0Sco1RrtrCkz5Vvqz1v8TbeeYLaz+0WH/dZUMCdowSAKtt3ER3cbs9F+x1EPTqlIcAuoijH7wpq//+A8HQiAWA5dFp5h2OAm+aKHBWMvY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:14.2661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2d1b88-7b6c-4f28-ef7c-08d7b1668f2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3286
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

drm.buffer.peak.stats
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
index 2d8162c109f3..75b97962b127 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2069,6 +2069,12 @@ DRM Interface Files
 
 	Total GEM buffer allocation in bytes.
 
+  drm.buffer.peak.stats
+	A read-only flat-keyed file which exists on all cgroups.  Each
+	entry is keyed by the drm device's major:minor.
+
+	Largest (high water mark) GEM buffer allocated in bytes.
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 174ab50701ef..593ad12602cd 100644
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
index 425566753a5c..7a0da70c5a25 100644
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
