Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788132ACB5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 02:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE556E0DF;
	Wed,  3 Mar 2021 01:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28F6E0DF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 01:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8KW3Cp7IzzNSOh/GXmzb81UeSQlehQRxpaXHmXqhNO1ODcPvwGnrFPFFPDxzUWAxjXRLlh5V4wUChFELzH4B90vjGnlR51h59IYWq5CKTjLZXdPtn45O+C4CvqQGLNIeSJ0QICngttRl0dicSaA+48uSLZNhLFsiiQ2uNp0nMt4/hNK6FrtbqzSTmjAK/cqkZNJEfLAqPDSjQtlj4Rlcmov0IlrTP8iA5JLHqCaRsR/76PIwNgbo35i6SkUTiECbbyyZc70jIkZ3kJjyCjZtfeGWtFtGJQ1ZQbvPyVN9TrRrRrD6fkYNr0GcUWmtubzHyLrSZ4A1xGYhnzy7r4E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9VSEAhmHtr5u0NxuuycEvWnVjKlY3qPnM2IKNZ5FNw=;
 b=G/Ay3ny2vGzD/whzeBZioG6ml2eo3sD69HEvw25Ek4SolZhm1Av00gzV8w8L2IY86Pet3XAe6hwLh7jD6Ko3PIBgdRhYqfKXp2IxBHLuQ+gfF4kVAicV9WVh76a2r+Ft7mFUV4CuNNOBJMyGZOyiNz0M8eK0KanXkW6FoHOdGiqg0hTACdij7bLjkwEBC3TJ6eUpHB29mJyvXYo3u1xT2orc6flG6oOKQFSeJTChL51KzzUOD5vud1vzBc5/WURiRtLdXtv4ijjucDgfUPTb4umboUHtVpC3A3m0ASPfZobfXwYzyR+eTp4ss0/AM3hCj7K/4fDvCvY5XvQuUpAxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9VSEAhmHtr5u0NxuuycEvWnVjKlY3qPnM2IKNZ5FNw=;
 b=0SkySzEARsthSOibseJPftVRhJRsxYfkV6PmLqy6+gMtRx5dEaorWHOm+1mbQ3Bge4naRbk4NpNKXx+z+rM72vzay4cEh4uuKxFWCLwBsLZxcUQ1XG57/r4/kNVAlNcDeD4CDBDWSYKpBl7v4TLTswDpMaxosYs4b5Vdm9Ciom8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM5PR12MB2454.namprd12.prod.outlook.com (2603:10b6:4:ba::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Wed, 3 Mar 2021 01:11:17 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 01:11:17 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: PLEASE ignore. Just test Intel build robot.
Date: Tue,  2 Mar 2021 19:11:10 -0600
Message-Id: <1614733870-6751-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3890.24 via Frontend
 Transport; Wed, 3 Mar 2021 01:11:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 994fbb06-901d-4527-29bb-08d8dde13f17
X-MS-TrafficTypeDiagnostic: DM5PR12MB2454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2454EE5B8ED6FF85EA06FFB780989@DM5PR12MB2454.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/jiivFaqgBIPSXoBX/tsyTiH9ZSdiSaxiieskN7uwsnehO+L8l95tcK9AHZt/jOqwRsMbAZcdpQkxcHoYPVjhzviKbcpLcx43OzzYbLmdck18AufF+9aaS5l5g+Xdp29kRepQdhMCxV/VZuoLufz7al4FASqvJnsxL30hmP9urMFRHzQ+WIuNvOq3uwVfEE54RaY7PF0e84mcoNPjR29wyUfVeW23eMRDnH9m5wpa/0e8UjE4b8td5MrseHv35+X7S2YJgKYe8kyWIoFnF2t1GTca2ssNWt/jsrJ5ZquVhXFBFhpp30lkd58ft65s0z4TnCalnlhvsxGXo5xN8373xH/D7UhEWhDEPf0jH0GAsFaKjzO7bWaaR1SzUfO2BJKBFYrl7FDNHwrtyY7cS70RtTiqA5N2pwkoB5VwV6ylrvDKWGIbcZEwuZgHwiiFmYnHZXfeKmJuCxMaeu7paVZLV4OjklFbhIETQxKHJ2AZM8hXUn1DZ6bVgkTZYYglLwOsIjrzsjseTiZsl+Kltqcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(6916009)(66946007)(8676002)(66556008)(52116002)(66476007)(7696005)(26005)(6666004)(4326008)(186003)(8936002)(36756003)(16526019)(956004)(6486002)(5660300002)(478600001)(316002)(2906002)(2616005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I2MAKPwUvKp8SyeHrqtwhKcM41oR/PFST7zYrKFv4+QmG6KmnCQLmHOapRBK?=
 =?us-ascii?Q?q9fx1cyI+mDThjPB0J1Zx33tBY3QiJM7+7NZI7MhW5PokvZss3/7Trh2Bg1W?=
 =?us-ascii?Q?b+VJKhux3E1CVuI47QtwNpEtTl5jiDl0T+xwGvp5Ralmbf+hiVIXu9hXVhso?=
 =?us-ascii?Q?Psvkh8VpPmG3ZVQySK4781ZL2x9qkb1jxt53tiaz4TWXI4wc5MxEpzaH69hN?=
 =?us-ascii?Q?x1GaTib8exWHpBMHTKn3PP0V6V1a7gwObhoev+MRT/rmOeMP/4RFZtPW9dBj?=
 =?us-ascii?Q?X9FEjEecVrOWN8DMDLXQSGYAO7FrYGAXZnlmvSNJ1xxtfn4afANifd9moJTR?=
 =?us-ascii?Q?Yj3AGIn4byYMgXyF1w4GH9Fh01H259MLwIg/DWxQoHuPcvn2TJj/TBSMPunj?=
 =?us-ascii?Q?dF5XS9xUvs3u5+wiGFIJjZ+qjFgR8PHv0bWhdzRG+nnBZJVJx7SwhfMmf5+L?=
 =?us-ascii?Q?5ZkJFlQZNgj6iBLrCY7qeZMsiuKyLxc2jdDqlL5BI4Xf8P5d1IEse0XW9Xhv?=
 =?us-ascii?Q?zo5Wr8S5TMGviceK6M+mNxSC3TdgMAYnrlbrNvBSCV4OEB3UnvddSdwLeRna?=
 =?us-ascii?Q?ljIaNYvCk5bu+2mE6pzpiFGs4KHMgFRePzFaepS1P2YQmmznjkdtAT5j58PS?=
 =?us-ascii?Q?hey+15G+4zF09zX5rK+1Gy7vEgPIrAAkLE/zmprB00/PL4T2x7WaLrTIPDvC?=
 =?us-ascii?Q?312iUYF9LmnY3xTYb4wt7h5U0D3+zEKa7ds47EH5ojsVQSlIrKV+YFEyhY56?=
 =?us-ascii?Q?0e+V2KnJ2pkEf3VC10joitg9HVa/GKekve27TLYh5lLONGkfhLWyhsy6hOKd?=
 =?us-ascii?Q?fucPqdaEWP009V0lrnKWg/8luCGtPQ76bGQSLakc6G9C/ZmolJAK24bUd/CG?=
 =?us-ascii?Q?sT1zmyh6UpYJyZMtxLhuSCSHj9azcqjJ1g70j2Gooo4242yAMOhpWfzL+wqb?=
 =?us-ascii?Q?pHPPPLkDJZ9E3+uCeCzl+1Ud5+papFXou+2YmlnM8WL1CjNDcUSLjyeHaYic?=
 =?us-ascii?Q?gt6+pmn6XcED8/BQwSlYsQZKwAB9g7+Rj5svHgovTHedyfMHNKfeEV32O01v?=
 =?us-ascii?Q?WwmiabUmrA+Wg6qgSk2adVuYcBdcHZKPoO4t55K91NOh4YmMB7PXVFrcgl+k?=
 =?us-ascii?Q?T5hl+h9zW23Nn5NfeDt0Ipnua9x+tFh8VnvA40UmiT8aHro/s0/dtqALhNal?=
 =?us-ascii?Q?UMdaHQfYhvtb9vDMXa+6XE6pG2fsB4IrN2ULZf1vLNiSsnKu5SXbSq/gOdAM?=
 =?us-ascii?Q?cposTG1fqjvrhexBhJLJ9/An4c9qOUrOWUofokwFTLXi+0IHc5xMNYmzzkOI?=
 =?us-ascii?Q?kV8T6t5bu0ttedkl3Y5jssM+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994fbb06-901d-4527-29bb-08d8dde13f17
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 01:11:17.0666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncXABZmHB2wUhL8pC9WwLdSjWLA2l5jFOjr1h+IYLfQ4IG27avXHoH0AhG3lVKqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
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
Cc: Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ioremap buffer according to TTM mem caching setting

If tbo.mem.bus.caching is cached, buffer is intended to be mapped
as cached from CPU. Map it with ioremap_cache.

This wasn't necessary before as device memory was never mapped
as cached from CPU side. It becomes necessary for aldebaran as
device memory is mapped cached from CPU.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 031e581..8c65a13 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+		else if (mem->bus.caching == ttm_cached)
+			addr = ioremap_wc(mem->bus.offset, bus_size);
 		else
 			addr = ioremap(mem->bus.offset, bus_size);
 		if (!addr) {
@@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
 						  size);
+		else if (mem->bus.caching == ttm_cached)
+			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
+						  size);
 		else
 			map->virtual = ioremap(bo->mem.bus.offset + offset,
 					       size);
@@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
+		else if (mem->bus.caching == ttm_cached)
+			vaddr_iomem = ioremap_cache(mem->bus.offset,
+						  bo->base.size);
 		else
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
