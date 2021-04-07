Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01235671A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC096E8E3;
	Wed,  7 Apr 2021 08:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F356E8DE;
 Wed,  7 Apr 2021 08:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhsOY/VgJps6B0XnkTBfd2iZLsgnycJ5V3kQ5DCaMzy8qIi0TmdP54VNrHZXpCvAdzySIWpa9foV9RL5gl5GcBtOikv7YSnfsA+OS26UxBX+oDRnRnxn125MgnzHGNeW6Bw5qoLBoRIxDb0GYo/nsdtg6OazHZNcIgHhxnJOS6RD3Lbabgdxu/tTWSkKMgP1Dg1fxfEhfMIVS7T3X13C5NwrZG8ekwPtuw1eA5p9zBxVEd4crCNA3qhxc2ovP4y2Ap7vHjrebjDq/j+hvkYUkCRx7Pp1ylTv7hEzCOO0RxV9AjzS6+FVSS4Y7DMWGp1l/Tzt2s288PIee9jAXMapcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=hqo10jrj0Zw0S0mUMjAOLWc8rqBc/t6NRmPj4G1ambA59KMLE2giX/Zoa1OgZEpp69+nGNb6O+a3IE0U9s8vRKYdyEiJurNgtl1FmOt+VSUF6R+Nyo3Fxz1rEUhcU1oNOUkco07TNfraYYsyOCzlvQ9Hg5YNEIkwP6Oqb9ziyTOAmdKjcepcy+4wZ6S+5vg96L2sjSapp/jTg6jG3C2Dlr5plqrwUFLZLYH+34oDaADTSd5izvK1GNZDyh+SywKoXSe31RKiLkNMCdmKn++zYRbbc9BaPzXm8fcFAwOYisqZVV0BjRHQZ7765ES0bSTQll7qonVMyYHgF8PN+jKMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c9870s3/fS3cTF+SLC8wpSfZhem4zErBulvbvUfaA4=;
 b=s0KEG8oer1nBw8RdgbLhKO4zHDmeoe1CRAjn+/v9zZThCLvXgKLx1D0dmz8kLpkIEitEgHf/OFUzzZ9W4i9efIHeM7ZP1u83k7mt+k5d59uY1EHj7PQBKuWSweUf3VlpPRUdTC2lOpK7vMP5u2tOBJEDfB8X/Z9sMsKhiChNimzHdpcyEk0KhKbKAJILQfFh21Ajdt8g6FDEX+iJ2MZYEJ99yqG6RXEiNdRK00AsEry0AKiFnfmUVXHT3uhg9WT1SLuLXYiGUC6fWTzz7d8u42/i9btxT6sAuwUC8AA6OL7E1NBLUFAQpKeZ1GPNWLpFq3og+aAN/dayQtp9Ig85TA==
Received: from BN6PR13CA0001.namprd13.prod.outlook.com (2603:10b6:404:10a::11)
 by CH0PR12MB5348.namprd12.prod.outlook.com (2603:10b6:610:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 08:43:18 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::30) by BN6PR13CA0001.outlook.office365.com
 (2603:10b6:404:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 08:43:18 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:43:16 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v8 7/8] nouveau/svm: Refactor nouveau_range_fault
Date: Wed, 7 Apr 2021 18:42:37 +1000
Message-ID: <20210407084238.20443-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f88b71c-c17c-4938-fdde-08d8f9a13144
X-MS-TrafficTypeDiagnostic: CH0PR12MB5348:
X-Microsoft-Antispam-PRVS: <CH0PR12MB53481A628DCBC0C8FCD582AEDF759@CH0PR12MB5348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBOQSYbWAMzoReHvQuDjPm+di1BBkGYxkS+LbCn8QyL2H0unfUG3KafLPO6vKPichujRsXRned/HSiju5zAceOWbXQIUVXXArmmh6AYtZ1Xzs4C0ulDa8rDe3zFzwHbKVu5y6fEhPbtSnVYlBta64mDfeXr5cXV3B1C6eCmPTQ209eIGouqwcXRMDLTOC6/kxzNSYLpwI0A3jzp9+udAZ35ze0yMrUHaSVTKCfpDUwvDnpiinooH8g4AWYFnoDqsLllLXwwCejDCwOzYOFMaaAth4XfNGhqsRZXA3LAm184SeP7AtMxej96XHem1s1Nz3zq+Gub5//FqlKIQ/wuR24gV0e7pQ4a7W7Is9aJUHv5MEb2cvglBL12wqzkBeeURzQcXFTr51gLKxPYiW1IqtJJvnLsWWAn7Vd3CN5QOFlK3k488O28ix6xV3j2nGRxjcR4pR52hkFFInlVa/kFvFEBE8PvkpdYMf6YHvgcX9z3bgZIdt5ejbcdBps4po3201yMzejwDtEjqbkGSp/C2RjBieMYehOnN7IcSxOQorcRqMGXOD4g9P1DUd6ytgh+mpXEbFv3H558stQhhCTSJouGZuANNbQhvtSrQFndD+QRSw9MDjMLgzgxFtzCIcNNEQeOWqYsOLUDLwl0Uy25yzO04RtWKy3YA29ezPoMhPb8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(2616005)(4326008)(356005)(7636003)(83380400001)(82740400003)(86362001)(36906005)(36756003)(8936002)(110136005)(1076003)(316002)(54906003)(70586007)(478600001)(70206006)(5660300002)(6666004)(8676002)(36860700001)(336012)(186003)(47076005)(7416002)(82310400003)(16526019)(26005)(2906002)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:18.2912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f88b71c-c17c-4938-fdde-08d8f9a13144
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5348
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 bsingharora@gmail.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 94f841026c3b..a195e48c9aee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -567,18 +567,27 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
 		.notifier = &notifier->notifier,
-		.start = notifier->notifier.interval_tree.start,
-		.end = notifier->notifier.interval_tree.last + 1,
 		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
 		.dev_private_owner = drm->dev,
 	};
-	struct mm_struct *mm = notifier->notifier.mm;
+	struct mm_struct *mm = svmm->notifier.mm;
 	int ret;
 
+	ret = mmu_interval_notifier_insert(&notifier->notifier, mm,
+					args->p.addr, args->p.size,
+					&nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	range.start = notifier->notifier.interval_tree.start;
+	range.end = notifier->notifier.interval_tree.last + 1;
+
 	while (true) {
-		if (time_after(jiffies, timeout))
-			return -EBUSY;
+		if (time_after(jiffies, timeout)) {
+			ret = -EBUSY;
+			goto out;
+		}
 
 		range.notifier_seq = mmu_interval_read_begin(range.notifier);
 		mmap_read_lock(mm);
@@ -587,7 +596,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		if (ret) {
 			if (ret == -EBUSY)
 				continue;
-			return ret;
+			goto out;
 		}
 
 		mutex_lock(&svmm->mutex);
@@ -606,6 +615,9 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
+out:
+	mmu_interval_notifier_remove(&notifier->notifier);
+
 	return ret;
 }
 
@@ -727,14 +739,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 
 		notifier.svmm = svmm;
-		ret = mmu_interval_notifier_insert(&notifier.notifier, mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-				sizeof(args), hmm_flags, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
+		ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+					sizeof(args), hmm_flags, &notifier);
 		mmput(mm);
 
 		limit = args.i.p.addr + args.i.p.size;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
