Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486034EBD28
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3EC10F4C0;
	Wed, 30 Mar 2022 09:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83AF10F4C0;
 Wed, 30 Mar 2022 09:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naf0ad/Mdk9tIv4LM/BchueK+MQgQkc6Eg8YtjTw7BSt+IwkAjckcrVqir5ktq5TbufwA2vVqof0gUoO3/7K3mp8oGzjxvj79/8zw3YkuToCXKNB+lh3wbuVpChgDHIX8HZnACJfhpi8M/O51Rb4cgm5ZxWuV4mIU3MXxaaEnvq8BNrg9NXAP3TKqnGoS8rlGgeDS8Vz0n7ytSmX9Np6UohDu9HCU6vNI5a1tZAiM9YLvkQFC7ZjkGCC1UQnOgGVfWoF1eqMfA9LJOfUWVKJGRirX+fQBZFFBjEUNnBHe153rvXcEB+5+/IXlQxJWJf2OrjJBNg4XRIu0lJkULrp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAvYGNPD/BEKgPtcPZA/mfjhQces6O97Nh81vMM6jDQ=;
 b=GQTeB5e/IHc2gmsy/jvuR1t3VmIZ0TCp7+HDcwIQc14/WQ1HVudjx/sEtZUfKp5KrhIhylc0btXVbFQve2SctKlprZ3gHV6hJmccFC/u8d01Yd3OUvbPzq1FmFa9ngW0YPQ+7+5Ianq/aUve8ryjSU5LN0mKyCulUpSIKTMPNDDNY5K9DpMaZ9/q+DRT32gX8NsvMLKtjniAr5CXHRZIqTIqbjucUzSuxJMHEF6Fhv6LlaZiV89avndbAda3eoJZYB3Iw8eY1046jhTd3YELK8u/X8xJciMTR5OOIHY/mdWv7RsngMtoz5daTmicrMQEEfTT92ZZGUOZr6yUYuHyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAvYGNPD/BEKgPtcPZA/mfjhQces6O97Nh81vMM6jDQ=;
 b=UnGmsGhwH9swZuCn2cofp8NyRoGAsK85tD/qzsbw36OtwF4w2FW5GqW7DTCDLKkUamy9pLO2oyf+b06zWdSj9eGXDp76G4yPvY+76YjwVUJea3XLJbQsX0lMP3T1K3rFXkOvg7Zf640adF3wleC7FCsFSuVep/zxdqjp4kBT40M=
Received: from MW4PR03CA0231.namprd03.prod.outlook.com (2603:10b6:303:b9::26)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 09:04:29 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::8b) by MW4PR03CA0231.outlook.office365.com
 (2603:10b6:303:b9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Wed, 30 Mar 2022 09:04:28 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 04:04:24 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: round_up the size to the alignment value
Date: Wed, 30 Mar 2022 14:34:10 +0530
Message-ID: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b8bf5c2-a895-4353-b146-08da122c4bb6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB39664927246EC8D1C72DA4AEE41F9@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZkzUxkKn1EUW5d6I8LeIgdoyTaplR4DMcDoMSkROKGYpj10yDH+n/prk1ewwKvz7U64kOS57Yd8cRWeVKNiGbA38jcypmUa0kyNlHAkUVdFptrhZZ+CXpRzV1bIhj4tHW9wqFYM1iHK7UHopMQJ8xX1xp3Bd9XJrq1j0sADz0NDql6POerx08vJ7NfitwtnvCrxHU8Y6CnrYRLheao3PdRF4+/1L9QbM33IX2NHT9tyXwbrUjoBw6Xst6t3v76DmTpeJyfDGElXlyGqxaPf9DViFknL+5AGZfaA9fUWbqEQLhh/li79IF4KXit51VXB+8JYc2f0mjseinU6QIq24KzMWUx5HjoMCmPksKJGhB9aouym1pq6f3sWmsoSqiSzNrXIQPELkls1DrftVuGJcv81ORSY8U2nsWP7+AxBIk6EhrUazxBxzdZKANKjl3WK6z4IJyiI3GIjhGlWKRKwHkFmXfoBM7Tg3J/1szQrVDdbdSyjTLT+guS+kGUc8tNUdV+WU7aBD9nur8cNLzQnPFsNYpk4xy+wbsJtwWvtXNWM6dFJ8btmyEwZVK200RrPovTNW79Tpc7uRNHNoBeHZ6hxiNOylZS9nGD+SmBcEnLjNkwe90e/GaPwqxJaYjwR8ejI+xN0jr9pHT9oJ+3y8pz7oYL1fQpw/N2qowbM0eZKwsAW1MXjUGZ8g+j5GnGjUPGMyx03eSHr4EFG00JUnDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(8936002)(86362001)(316002)(5660300002)(2906002)(82310400004)(81166007)(356005)(40460700003)(36756003)(2616005)(7696005)(336012)(16526019)(70206006)(508600001)(6666004)(70586007)(26005)(110136005)(426003)(186003)(54906003)(47076005)(8676002)(83380400001)(4326008)(36860700001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:04:28.2596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8bf5c2-a895-4353-b146-08da122c4bb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Round up the size value to the min_page_size and trim the last block to
the required size.

This solves a bug detected when size is not aligned with the min_page_size.
Unigine Heaven has allocation requests for example required pages are 257
and alignment request is 256. To allocate the left over 1 page, continues
the iteration to find the order value which is 0 and when it compares with
min_order = 8, triggers the BUG_ON(order < min_order). To avoid this issue
we round_up the size value to the min_page_size and trim the last block to
the computed required size value.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 72f52f293249..98d7ec359b08 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -641,6 +641,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	unsigned int min_order, order;
 	unsigned long pages;
 	LIST_HEAD(allocated);
+	u64 cur_size;
 	int err;
 
 	if (size < mm->chunk_size)
@@ -665,6 +666,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (start + size == end)
 		return __drm_buddy_alloc_range(mm, start, size, blocks);
 
+	cur_size = size;
+
+	if (!IS_ALIGNED(size, min_page_size))
+		size = round_up(size, min_page_size);
+
 	pages = size >> ilog2(mm->chunk_size);
 	order = fls(pages) - 1;
 	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
@@ -702,6 +708,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			break;
 	} while (1);
 
+
+	/*
+	 * If size value rounded up to min_page_size, trim the last block
+	 * to the required size
+	 */
+	if (cur_size != size) {
+		struct drm_buddy_block *trim_block;
+		LIST_HEAD(trim_list);
+		u64 required_size;
+
+		trim_block = list_last_entry(&allocated, typeof(*trim_block), link);
+		list_move_tail(&trim_block->link, &trim_list);
+		/*
+		 * Compute the required_size value by subtracting the last block size
+		 * with (aligned size - original size)
+		 */
+		required_size = drm_buddy_block_size(mm, trim_block) - (size - cur_size);
+
+		drm_buddy_block_trim(mm,
+				     required_size,
+				     &trim_list);
+
+		list_splice_tail(&trim_list, &allocated);
+	}
+
 	list_splice_tail(&allocated, blocks);
 	return 0;
 

base-commit: ec57376fba5abc0e571617ff88e2ade7970c2e4b
-- 
2.25.1

