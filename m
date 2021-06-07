Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058A39D687
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3A96E86A;
	Mon,  7 Jun 2021 07:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2A6E862;
 Mon,  7 Jun 2021 07:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cm5KE5Ga5zaYFUBm0RR9TVtug/fmb7jOG2GB1KPTGK7RbT80WUVhDz52HnKyw7yzQhbsI4GxU0waGf6w/Y5xnF/NeAIfutxDtP5N8SIoEW2e/w6fTYWMI2X5wSWrH974u2kF13Nx0vJADuaLdNmx73PgtKtoUHJoVRpiH0aIXQ5GddkpR/U67BhdkzcrVNM5uGTHPAZ7eGPoPfHXdz5SbLRiD5kiyLfkHyOnGoJ/OSU2Cx1I19F5D5uSUf+Bv2FbExp4/bLaFY4dgyrdVVGVt6PTeGF69o9Fs7W7Y3S4+xYVEm7rjw8hgpX6oU7iJZPlB3IEjnH/fHX2/la+grYf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=erBhfYPUhLrAYlt2ThoQQNan+gh85sX/+MER1fiJqeE+yHIJT2SaEIz7eNELUXuZzob6Lwg+chQ1wUqaG9XYumYpDg8b3VCsV7CVPrw7FWjDy9Y2QhNzUusQCh94nEYUJ+fl3XOkZxob/Tt0M1ok/7fL2p/Rn8Jd8YjkzEKjKVpGuu1VdJH4m51CugB/rbcdRiaYEyS3+0RRBdwP4tl0rWlsKuBdm5inV8QGa0qpHlWal1gxlAzXsYPYltMleHS1IpygJvP71kJE8ixbtSKzSkU9VQW3qGjZQ6A4J2TbmRUfwNIqxLbvoZS7anZvWvaztr38Q3vOJx9FRxeI8piJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD3uyMV2vClc/Wdfm27HpRUHNcfDummDwIQJycXPjFo=;
 b=dyxYmtBGHg7kTynXlDc6XcQobQWWK0WC4P2aRbiZN1+PXIckajc6q9G/PBPQdLKpG/wtg8T7jEQvawUzbcifezSU4RyhvOgiquADSHdeHcWsv4/LHRqsP14B6Cv1zcE9cCyXZ/qkWm7ABoQfa1bapanyig0yI5aaojF+BsavSDnltqpX52LHBFiJGi362HV/MmaSt1dy1SF2v7TGar/pLjdEVCHX4Viwlpicn1ApphcDzXrsj3zUTL8exONWTLlLb575wqbMvt5kP9K5LOfWSpycrPZbcy97/nZNvsQwE23OkCJFLmm97Mo3MXQHCxJ9uriusvA/twIxVt/lLfK4Pw==
Received: from DM5PR10CA0022.namprd10.prod.outlook.com (2603:10b6:4:2::32) by
 BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 07:59:41 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::85) by DM5PR10CA0022.outlook.office365.com
 (2603:10b6:4:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend
 Transport; Mon, 7 Jun 2021 07:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 07:59:41 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 07:59:40 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <akpm@linux-foundation.org>
Subject: [PATCH v10 09/10] nouveau/svm: Refactor nouveau_range_fault
Date: Mon, 7 Jun 2021 17:58:54 +1000
Message-ID: <20210607075855.5084-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607075855.5084-1-apopple@nvidia.com>
References: <20210607075855.5084-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07883009-46eb-4ae2-c807-08d9298a3499
X-MS-TrafficTypeDiagnostic: BN9PR12MB5226:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5226CC1FA6316E3E5EE1E9D9DF389@BN9PR12MB5226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFp6P48vtD9oWcDv347x5WlE0ZkrGRLhZzK0UVdnPPTbrNJfvwrbC9SJ7zwsyYqL0iB3bpr3J5KEgyCcpyoxUaDCraI3+5vrYDMZ7m7WyW4hxFTRm9f6UE950x/CMha6NIXpOQMpDsyVNnT5wm/5S5RWNb/keoc1LMCQwGF/q+I82OHs7M8Ye2E1RLUhyuPe8YFhDUyKOf2fpkY/8F3bJseT8jkSI+dPXgLNh6ZlE/4+30gr7MUL7S3a7jddZXt1BrBlWPi3w8ZLhl/WOr2RS70roAfJQUk01Y1xTf3oFZbL94xYCCjmlZB5al/2Fvv5JvIUrNbaWjOxQFnccJzELllu7chQzNt6qVlwkn7TvuGJZIDZiqKNbYOG/AsDPywhFyztcFj80ejPQY10posKxOl7bAzNb/aJV8ZkgS4WI0zfy8Uf3chr1WtxttWqaSOUKMjUCRxXisegB/+Zw+mInFG4x0f1Kh28Wh1+jG21sWn72qH1zdgCtJYPjTCEeDIdmXjLak88OnVo6RObiSvXfC1YbJRtAhxcpKkVnQ/A/arQTmMndQIXZjLzy8ySnGuh++1ymuLBRJOxwoEemhLkqCzANULWUWbLHwS44r38PmJS8z3VSKqN5qj8D+1hxsjjtgmtUf+66NhiFQ4n0x4SRQcpPjfwAJWr+eB/ydfnXpo=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(110136005)(5660300002)(70586007)(83380400001)(70206006)(356005)(36906005)(7636003)(54906003)(2616005)(426003)(336012)(8676002)(4326008)(6666004)(186003)(86362001)(82310400003)(82740400003)(316002)(8936002)(478600001)(107886003)(1076003)(36756003)(7416002)(2906002)(16526019)(36860700001)(26005)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 07:59:41.3261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07883009-46eb-4ae2-c807-08d9298a3499
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, peterx@redhat.com,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

---

v9:

* Added Ben's Reviewed-By (thanks!)
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

