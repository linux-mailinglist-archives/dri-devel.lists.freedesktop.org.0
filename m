Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2B44AC7C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 12:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D526E84A;
	Tue,  9 Nov 2021 11:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B7D6E848;
 Tue,  9 Nov 2021 11:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls49JTRle6WNnFUxaXBH3G85rjgUJ9ys0hHixhqwGcvvzHf3MPCQ69y4oTJDD/aeM4SA2/3LzonpgTkYaoR6kn9w5tuKL3NI6+Lq/78FM9TYzD2GawzNcT95QJoSNMHHYLYxkTFYmGJGhg5oQejce7dCxPzLEdSmgIcdWFBjt/d+KU7ae9sX8XyHZ2clz/YFAo9VQ/y7YwiVm9QP66WEk1MgKfMa8qlJYV7Ll56oMT2H7TtkfkYvPfQ1II+lcLe/sv+3H4e5MrFyfXEUXAc0QiB7RzXqbOw2I3lHRJDKjrJdGfXwB8kqUn2W/oPGElAnxCtnxMvk+FIrh3eJu8IWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0v0Fd16rj7i6pSxFr0srq2hkTxsjaLnveaJGRFuSCw=;
 b=Fjw9jBHVUOwe2kYPvfHMI9vya/tw1VzAjfKJp07j6lqop9Ctvl7iDlD8fOlJjDQeIjawaJrhQVW1p/m4afHrGklcsCepyJ9sQ5dMIS+2Lw+46oOTn1iLUjH5eb7iVrzj0EnS33jSrb9O6wzV2GvJArOEVL5FojxdCAHVewX9fCeceqbG9smjthUr3w96hBsXr1Pdw2iNoHcsb/aAy5WvITCoUqQV8kk7qGk/mLxGzZ1M2WL7hjFe3mGQZr5/Pv8IG5/oWL9I6VHNqIfW2y5ynFYKhsaSDAzwcS8fo7fkzzfjWHJuFrSKm7Yhp/wBCrY4PZsXga9GtkVHN6LDcUAcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0v0Fd16rj7i6pSxFr0srq2hkTxsjaLnveaJGRFuSCw=;
 b=qduPgFKFuptRXJcroE5d146BJm80qKN2jIlHIDswdI/tUpteodFZQ8zfP7CaqP5t6wwt7eUWcrnBrx3GG/gq0g8cYV8NSi763kTqzYrQjaIQz6KjOuKZwiNsUOTuFbBd1inVi1a2h+4fMGLpGqtsitufQScZhJZVa4q0S+DK3KA=
Received: from MWHPR20CA0003.namprd20.prod.outlook.com (2603:10b6:300:13d::13)
 by CY4PR1201MB0246.namprd12.prod.outlook.com (2603:10b6:910:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 11:20:43 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::30) by MWHPR20CA0003.outlook.office365.com
 (2603:10b6:300:13d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 11:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 11:20:43 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 9 Nov 2021
 05:20:40 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Put BO in its memory manager's lru list
Date: Tue, 9 Nov 2021 19:19:54 +0800
Message-ID: <20211109111954.41968-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecf92cd2-64b4-4cdd-e759-08d9a372f810
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0246:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0246C982C9B0EA165EE57ED187929@CY4PR1201MB0246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3twTvMZ0iDyaVVZGXw7dlJL9GEzC8StauRg1PqQSjB1BTFqM/NozZlUdm+/HD8enmQGcdx4nP3C2gdjCbT7CZIyje5Ay8Cc8uMWyME+FQM9x5wk8ONrzZUGNwn5jgJFj4Uob73OkF3APhbCm9Wr8IeNuYRj0kpAT7qG6RSCitHHv5hR/zqKqOzta0yBFZa5Ddj9F+gCmHcXTt0rfEEhvZT7LkJS38IT9srx1k1LMZ1Pwy69bJK8G+1F5zi3WyPgLpwlKFjTOfUl7GsxiPVCTT1+P9DuwR6Dq22V/IApABMuag6G9ToHsvn1MFgFOfg7vFC9qPwZjApMbiW2CaojKX+sDGu6wtJKHTNy3FYzPU22T11EP2HUnw5jqEl2pHN6VHlTnAzPcYGDxdHSHD5OIgpWjkLI9Pu0eXzEfowx37m7nfdfaZw8CsIX2M5R8F7jBiOcgFYM1ChmfilQfVFpw831IbJHZGMZpVLwEb/WhTzJumLpeqkRuaizfvA62VS0OMlYT4AobrdXqoAO52MVfvU0rhCDxDZ6h9Tq2GFmiD8XtVmjoIXLvjCSxN0oFpyKOB1paFuu+cWlmFEOM1jXX0cXXKEF/quG5SZ763tVz+rAZDDpOZ1wUUzLMGCfCXO4wneFTuXzdkexA2K14fcj0jPQwAqz5uHzg9Y5FHI8BLGPArnovJzCfCEKx7Vj6Pyg7svi19ZRufB4gsLxBkznmjWD9Yt9Pro1T4jndKobAz1Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(426003)(86362001)(8936002)(6916009)(36860700001)(7696005)(6666004)(1076003)(82310400003)(70586007)(47076005)(16526019)(81166007)(70206006)(26005)(356005)(2616005)(508600001)(36756003)(186003)(316002)(450100002)(54906003)(4744005)(5660300002)(4326008)(2906002)(8676002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:20:43.1533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf92cd2-64b4-4cdd-e759-08d9a372f810
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0246
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
Cc: xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After we move BO to a new memory region, we should put it to
the new memory manager's lru list regardless we unlock the resv or not.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f1367107925b..e307004f0b28 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	ret = ttm_bo_evict(bo, ctx);
 	if (locked)
 		ttm_bo_unreserve(bo);
+	else
+		ttm_bo_move_to_lru_tail_unlocked(bo);
 
 	ttm_bo_put(bo);
 	return ret;
-- 
2.25.1

