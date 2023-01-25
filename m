Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F567AF29
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CD810E290;
	Wed, 25 Jan 2023 10:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9E10E771;
 Wed, 25 Jan 2023 10:01:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFJ2HPoAocIUye+rU/0tBkuzPag6KHPNL65SZ4t/o+O6xM+BS2AIPD9dhwNNNVMVfoeZ3pNypDeRVADBemyHM0hn2YIsWexgYo2ghAgfG2ZAfT8ROhu+2A/JILn/etjZZx6nPCQ2H8f1INaKFVRp1P//2e/Vu9pDEyE0L208KlyChdZ3v0COn4uFZ5QKzdw8gxWkh61NigiiPX8xvBcTU4XCmwlAlpUu5WorBNHPpby4iLdsj+8qCwYWDoAzzboc/H6H48ndaZhqbeRcIdAQ4fgZ1yKi4FgDU0YEKzKTomoKRspW+FCw9X1cuuUBzI4uHquqk9VxA8sEfo16TlBTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdM5azWUXjuKT9fP7MRubgyOV8sNVh9SC65JtkC0wcQ=;
 b=YGKQV9u/j3HGoSPGFuCHhm+PS3HsDlq1/ZDPFILKBU6z9mKNJcBfRf8KUyH1tT7JtF48pAUeU9nIO8TC1Iub5zM4kTl8c/Tg/+87LRh10zxaqki4BgaWOkq1uMQNdmsiTjE7wEScUTcK7laPGj5wJnWl+DFLen80GVJjo6NkTU9DCEOTHjcKpbRs/Fw3Dfo1yEFmC3/Dlso68xSxpsz3ia5T3pZAdpJxdJ7oTbr51HyLrpGFJz6QXrohgRN4Ssa2vuxtJ8Ctuqx8a9Cyqd7v1irBXORQTVdRlCqy1xFGgWqAEVCVmUyXtYQFsReY4j6kIOU/S6Oi5/FV4FJneuHC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdM5azWUXjuKT9fP7MRubgyOV8sNVh9SC65JtkC0wcQ=;
 b=SFUGQ+qlie7eEsQGF17RzIJtK7Ji6CQSKGByZSOUDZ8aAHp5FlKfAj7EdCRu11EFKPK8lx4UjYf2tsDAqfPUwDWsTHUacYBorXtD+Clh7sWXfxtZZaiPxeHDOlQANeNKiT8y7NngrRKfRZg0Z/Hmoupjp4Zuih8rWY8o14Ms7ug=
Received: from MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15)
 by CH0PR12MB5092.namprd12.prod.outlook.com (2603:10b6:610:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:01:29 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::37) by MW2PR2101CA0002.outlook.office365.com
 (2603:10b6:302:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Wed, 25 Jan 2023 10:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 10:01:28 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:01:23 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdkfd: Use cursor start instead of ttm resource start
Date: Wed, 25 Jan 2023 15:30:26 +0530
Message-ID: <20230125100026.5086-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
References: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT020:EE_|CH0PR12MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c52533-32ce-4573-56c8-08dafebb20b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbiA3wNt27Fi46N4yBz817NmoR9oVEMzY831QXXHvXMATds3liaD2cgturMV0knRVP3AZx+3sJVfLRUOek/ll2zWaT3DVc5MpxcFwDA2dpn+ffNNQt8YaRnJ17HoC4ubQvumSxK9+VdM7hZDPIwNfKFFUd2OVLTyRWkdJzMt6KDTlR5BDdGYYMAzo4zKorr7l2zEhNxDs7nXIRFt+4AubUoA4jL6TpMRXW+tSVyZRy94eWyqj4mj2WQBRYJxlo8HnziQo29JKdOV0oePh9oZdDkPp0yVjNqRMkKXIkf+iHWM9xuvjoQoD4tmS9g2/WFewgIcHpPw4Bp1DRb5beVMbo8StRi90bv34rg/jZkgP6zDSa9q38Rm7a7FCRoCbx5HuIY1OSDUvwahGoMkOaetlCE5DlZrGLmw/DYfgMKqrx1EV7QGDNgzvy5Dqh7sH2wavRKKl+xhmNeCrp1Np6xajDiRM6BgRPsewkmC9xoQJZqpknSfgVV4AUU6+b3j1IJ3VbBh22EXNNZ9ASDlufIe2tOB8PJTmYP80l6aSZbuR2j+EGxqaFw/bwkHwfKUmp3s4j0Tn0LaTZ/fe8Cc216oPU5ncua8WpiQXLQ6rMntyDykK0LQcrXfqfpJWwzWURm9lGp2WI7En5YFnyaCOENfb4nZ2MH00ZdJ8DIGQRYFK/xvZVgdIh0YRVP76f4adctycBrrwCewwoP7s37NA8HjjI32dn1GUm4KzmzuoDYCPQ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(426003)(336012)(54906003)(47076005)(2616005)(478600001)(8676002)(186003)(450100002)(36756003)(1076003)(70206006)(70586007)(110136005)(7696005)(356005)(2906002)(86362001)(82740400003)(41300700001)(26005)(81166007)(5660300002)(16526019)(316002)(40480700001)(40460700003)(4326008)(82310400005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:01:28.5394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c52533-32ce-4573-56c8-08dafebb20b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5092
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cleanup PAGE_SHIFT operation and replacing
ttm_resource resource->start with cursor start
using amdgpu_res_first API

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index c06ada0844ba..f87ce4f1cb93 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -200,8 +200,11 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
 	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
 
 	if (q->wptr_bo) {
+		struct amdgpu_res_cursor cursor;
 		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
-		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
+		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
+				 q->wptr_bo->tbo.resource->size, &cursor);
+		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
 	}
 
 	queue_input.is_kfd_process = 1;
-- 
2.32.0

