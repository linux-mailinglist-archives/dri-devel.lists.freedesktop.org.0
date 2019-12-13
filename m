Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F6411E8BA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FF86EB07;
	Fri, 13 Dec 2019 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8026E2E3;
 Fri, 13 Dec 2019 16:54:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9JPNsBFEt3MQi9RxT+/gTyXgzHiWKRX9FD/+LF77F036CXxWBhZuGPuNw3on9XBQgZaEk38ErdhplckQ8pNM9cRHtVc2CJGjf0afD7e7yZKmemOfjQsu6fG3JTErfLj4C9cSO21QPeF/0EW2s0WeyND8is/Hiebudqr2ySLytipEusoc0mjmhgU5f3Svxb8F3zAa3vOJQCckDYrJonptl5OEg6TKo0tGBvFva8WjudOho9KHScVR9FtzTcG0MnT6urD0JzbHvcf3gI1WzPO/4p0NZF+rYxioECpzGuO0wdSzp/jfEg7Ijn8sBRLt/Kx8cMX6Y46D99cvGSA1gCyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hLAlbOBcOrvhJTLP7Z5HWVHFACHBIs8J6Zs6QsJwM=;
 b=XOUgpRkscKe2ztXAKPJ3BcGR5DdieyNqai0Z8QRNL0DnRITDfdXaWOsYV78AXaspT3Zouj+x4uZbGPe4HYL/pcowEY7FX3L9P/7K6AWxpOYig0Jg8MmB8NCjQhyYefDgZMKytot/ZCFa0HYtUqb6CdiIFU8Q77ZLnmPVx8nxhPNSCDtzNEsnpCTtXI6EHXEUfmK/wkiaphku9bwefMWH1vhbpbitfl0PfDx8RoGO8Xh93xvKSYUuPsKM3WFeXdjOw9/zx5hzKfZ2SXGLVrM/yRVhIQ3AtCGfhcstyMY8llhdgEl1fduvgCO9+T3Y+S96RNKD9T55gczdHgxu93fsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hLAlbOBcOrvhJTLP7Z5HWVHFACHBIs8J6Zs6QsJwM=;
 b=JLkTH0Li2Q5CR01yHje2pVVA+wPPVkls50DMsQEbeKNdMSn5C5Y+s1wRucsnSQOqmM9qFLH1HM3wAmPU6PPeicBeCuJ4B1LPd+hpkPJKVF0Vg5LXGHrfBW6y0wV1w5t77RsWYk3cwZb4b+8+KXVzuXoBKmTWdVStx5V0FTqcCC4=
Received: from MWHPR12CA0071.namprd12.prod.outlook.com (2603:10b6:300:103::33)
 by BYAPR12MB2872.namprd12.prod.outlook.com (2603:10b6:a03:12e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Fri, 13 Dec
 2019 16:54:18 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by MWHPR12CA0071.outlook.office365.com
 (2603:10b6:300:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Fri, 13 Dec 2019 16:54:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 16:54:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:16 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 10:54:16 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 13 Dec 2019 10:54:15 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/5] drm: Add Reusable task barrier.
Date: Fri, 13 Dec 2019 11:54:06 -0500
Message-ID: <1576256049-12838-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576256049-12838-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(376002)(346002)(396003)(428003)(189003)(199004)(966005)(36756003)(4326008)(26005)(86362001)(8936002)(316002)(450100002)(110136005)(186003)(7696005)(54906003)(426003)(70206006)(8676002)(44832011)(478600001)(70586007)(5660300002)(81166006)(2616005)(6666004)(336012)(2906002)(356004)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2872; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b25414-3d85-4da1-a014-08d77fed177d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2872:
X-Microsoft-Antispam-PRVS: <BYAPR12MB287291AB7730E4FD2B344839EA540@BYAPR12MB2872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eJuq7N5lx1Ubrc+pjnhU6PdJcKZ/02RzyADqv1puLUncNr5PZ+ErflZhQMHxnc9tWx/ZXu0peWSPD3uWzk+uqGRgQ8996F2Nkiu6iydtBYWgw7iliIIGVh5dvCVof2etoYImkCvVygXxgMfGFqYCn7iO+PDdNiAvLsXsyRAFOkc6SA1eqY0iM/6JI8G7sU/W7R3TKkLyLvQxSQcf1//SfMYs7Y7eSXY06+2nkBbMViBvPWv/RP4BoYcxxXbo/LcdjWISv7wLqHapgc2c4qkMnkLpZphvfS3zFqXbu2G/NB5B8obkXk13i6qKO1X6ox/KIpfgFgxdvZ1yxmLQblaf6JOLh4XLrbu1uijt84F7601wiZEwLPFbyzBmY2WK11ppVEzIwibczsqnT3+/RPRfOrKLziRvAK2mH5zjHJ9Ys/EZP0CiKTFpB/9X7FIZRadHBVXTa8OnIfXKZEG3z8FDwF30n21+GrYSCBBhGzJ5po=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 16:54:17.2008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b25414-3d85-4da1-a014-08d77fed177d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
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
Cc: Alexander.Deucher@amd.com, Le.Ma@amd.com, Evan.Quan@amd.com,
 hawking.zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is used to synchronize N threads at a rendevouz point before execution
of critical code that has to be started by all the threads at approximatly
the same time.

v2: Remove mention of reset use case, improve doc.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 include/drm/task_barrier.h | 107 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 include/drm/task_barrier.h

diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h
new file mode 100644
index 0000000..087e3f6
--- /dev/null
+++ b/include/drm/task_barrier.h
@@ -0,0 +1,107 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#include <linux/semaphore.h>
+#include <linux/atomic.h>
+
+/*
+ * Reusable 2 PHASE task barrier (randevouz point) implementation for N tasks.
+ * Based on the Little book of sempahores - https://greenteapress.com/wp/semaphores/
+ */
+
+
+
+#ifndef DRM_TASK_BARRIER_H_
+#define DRM_TASK_BARRIER_H_
+
+/*
+ * Represents an instance of a task barrier.
+ */
+struct task_barrier {
+	unsigned int n;
+	atomic_t count;
+	struct semaphore enter_turnstile;
+	struct semaphore exit_turnstile;
+};
+
+static inline void task_barrier_signal_turnstile(struct semaphore *turnstile,
+						 unsigned int n)
+{
+	int i;
+
+	for (i = 0 ; i < n; i++)
+		up(turnstile);
+}
+
+static inline void task_barrier_init(struct task_barrier *tb)
+{
+	tb->n = 0;
+	atomic_set(&tb->count, 0);
+	sema_init(&tb->enter_turnstile, 0);
+	sema_init(&tb->exit_turnstile, 0);
+}
+
+static inline void task_barrier_add_task(struct task_barrier *tb)
+{
+	tb->n++;
+}
+
+static inline void task_barrier_rem_task(struct task_barrier *tb)
+{
+	tb->n--;
+}
+
+/*
+ * Lines up all the threads BEFORE the critical point.
+ *
+ * When all thread passed this code the entry barrier is back to locked state.
+ */
+static inline void task_barrier_enter(struct task_barrier *tb)
+{
+	if (atomic_inc_return(&tb->count) == tb->n)
+		task_barrier_signal_turnstile(&tb->enter_turnstile, tb->n);
+
+	down(&tb->enter_turnstile);
+}
+
+/*
+ * Lines up all the threads AFTER the critical point.
+ *
+ * This function is used to avoid any one thread running ahead if the barrier is
+ *  used repeatedly .
+ */
+static inline void task_barrier_exit(struct task_barrier *tb)
+{
+	if (atomic_dec_return(&tb->count) == 0)
+		task_barrier_signal_turnstile(&tb->exit_turnstile, tb->n);
+
+	down(&tb->exit_turnstile);
+}
+
+/* Convinieince function when nothing to be done in between entry and exit */
+static inline void task_barrier_full(struct task_barrier *tb)
+{
+	task_barrier_enter(tb);
+	task_barrier_exit(tb);
+}
+
+#endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
