Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58658D67B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17491146;
	Tue,  9 Aug 2022 09:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B3390A15;
 Tue,  9 Aug 2022 09:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILfuOhN2n6AB5JCV8m8nWkrQ9167VMwt5OhUWQNmhcPxxYomI/vi79UrbcKNN9fOU9gGTCTQ7Jrt8SS2r8aHVPNEk3zMg9VHxNcAFnS8dCrEo8wjCXV3nEDUc8nj8b6Pl8XCXJ11fRDsjSj2J32DTo4XFCNBLyJ9FYjB7fwQzeM9kN5yojaGDS26KXoYO065oFIOgXIcCMKXkUhmXZBkxD402CN65SKIBbTo0+8dwfDEf6m3WWswEWxj1753/+Xja/HF9YTj9tDyxdeG+hJp+G9L2IrATIpTT8ioeMPnc4LkLNRppSDUKp4RLaR3WQds/mVT6v7G4R1AyWJwRVLcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=ZdRqI/ji+obyvEjodiCyCvPMpkPaOdq4ZE9gzhXdUTxq9/Drz0imzhk8TmjzzwIeigyjrw/cjL4vyK3B2h3j0M2tDoiekhc7HLVft5/6FvYaJtpgXsvI1jEd92dHzdlajyp1N1ZPP3kzr7bdbk1fM48q2j2fYf2cIoNKrneWBhEkJ6F/6F5jrQEpD6ACrs74VK7Kl/0ZbBTLduePOq83rLrgcr/LisQfgtGmnFkbuAQxcohkw3lORtP31eAa1JRUQ0emzuy+jfJj7VG3B1HS6ZgV7hmCAZ3tIVoLI9Ih28XV0qA77E1qzEfAF3BM5sQSxz86e8GsIemBKMYfLdbLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO9cpq7gNK7adIY3F8pLCFd9WyxhZp3RF8abfTiVzJA=;
 b=ddpY5eP9qdsPddxyr9A25ECiV15zIvmJlHDZ55SvgsdRTq3m7Ewaqk5CXVwwruDVP/J08zUbOkvj1grNrPQhPQlRr5zNbssIcl4P+HkxQBDdOtTr+mZv6Ybd1kx767BgouPJglkGk7oMMpMXn8E5+eYQzgCUhkTBMX4P2mp3JHM=
Received: from DM6PR03CA0089.namprd03.prod.outlook.com (2603:10b6:5:333::22)
 by DM5PR12MB1770.namprd12.prod.outlook.com (2603:10b6:3:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 09:23:24 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::3) by DM6PR03CA0089.outlook.office365.com
 (2603:10b6:5:333::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:24 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:21 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 2/6] drm/ttm: Implement intersect/compatible functions
Date: Tue, 9 Aug 2022 02:22:26 -0700
Message-ID: <20220809092230.2808-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e157852-c309-4257-9e8a-08da79e8cf66
X-MS-TrafficTypeDiagnostic: DM5PR12MB1770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/tpkYKcp2ZNQKJ7GAJrY9Rxnjfw2Fiav6+Hwuigf153jKhk3X6sKH6dZ5hAR9DEldOU34FtyU49Qvm3WGBvDADHsVM+CTMOXPqxfVx3wLWdogXOq8jGsrMaOMc+r9Awa2wQMG+Bi3d6WqJPWncIIkc/4XbpCcZNk7Au756LTapqlkwqjFt9xejW0pp/c+YC7+Sh3CJ7iAgq6gmEipkOzSUuRwsIcejeHSR3+le7l+n71zxRHY2ASQATP3xyq+E6Hs9WN7SNJy0z/YwlkEljeo5rHI+JPk+84XF+1Scw4x/iBk047xS3IZ3vFD4mPbuVsxFStNFQPqKTCmLKM4y929FVF4o3kG0ppPNEsESccJfI1PkGSWwAuwWS5SOefMuf8i8q0rnMg84uiEWwVahEomF8DfrIaoYGP6lKr5TtSC4cyoxiiYyjWLRDB0+btda3U6GO/Zp2kXKZdusmhgXYDfIeVianzIyPDlNnBLvmqtDKMAWSrwpXL5kEbGEfaxW3pfGynqd7NERKGROMPNSHYg/AMwOr9czsJirCXaSH5YYTjWH9OimJgkQlxt9tB2x0QM/4v17/aHnjicHCUy3OQZrnXmvaVI/HYj/ODSb4mb62nABiPJObXptnfo60a+YR0K4yE0Wo5rNwz8pMrLIEMXYnvMPq7AdDHeCdXGUWFtms3fF68GhLWV8D8HcCzq/qKstdmPxnjjBBb/QnDGIqBIILy1N0dP/VYY12ONqmeZgfN8deqRlhPzdUBW1LafC1LRm2G4EPU2S1y7c2xGnJz4dcnDpEHkbCgZKEs5eKUroWjYv2EBswGwwwH/lw8zHw0k4abpG+DRdEhFI/42P9BA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(40470700004)(2906002)(36860700001)(82310400005)(2616005)(81166007)(40480700001)(356005)(40460700003)(83380400001)(82740400003)(8676002)(26005)(41300700001)(110136005)(54906003)(5660300002)(4326008)(70586007)(8936002)(70206006)(7696005)(316002)(186003)(336012)(47076005)(1076003)(478600001)(426003)(16526019)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:24.4391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e157852-c309-4257-9e8a-08da79e8cf66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1770
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback functions
to ttm range manager fetching start offset from drm mm range
allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index d91666721dc6..4cfef2b3514d 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (node->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= node->start))
+		return false;
+
+	return true;
+}
+
+static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	if (node->start < place->fpfn ||
+	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
+
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
 				struct drm_printer *printer)
 {
@@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.alloc = ttm_range_man_alloc,
 	.free = ttm_range_man_free,
+	.intersects = ttm_range_man_intersects,
+	.compatible = ttm_range_man_compatible,
 	.debug = ttm_range_man_debug
 };
 
-- 
2.25.1

