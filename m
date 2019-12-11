Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720A11BE12
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 21:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2C6EBC6;
	Wed, 11 Dec 2019 20:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AC96EB8B;
 Wed, 11 Dec 2019 20:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOdb+LTFOuO5x5X54Fk/WFoY1xVeCaA1g6BqUjWs+dokfAQT0aA+Fi3gifCBBDYLJ3+3MSa4zXuWmNKvZIE5MswtvmLwI0QBiCutbUY8xhsvI4iecqXvPVksiKtt8TZ2Hk8DLFtgtNxR1u9T5yKBXVGPvQ3mh3tx42q3CUkloqcraZqLXw3jPF7le5v11HYi4ctfnynISYmRT+iNlZk4x1Ca/L7xYy9llK2vJd4EOadNIaaceVofbgOQ00q9oJPCAcwsYms5GtGtBP8mhyU7dQdjkHERpBJU/VfDbJqxRThBOz9UuOwh3RHZDtpeEiGrHLvuDgxahEfPg2PVarEgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRR05pclpFlF2SM9H//7+VXS0dvCVF9T6VaEBCk6vP4=;
 b=I+aodcfATauWBdHde+rraQBH3UibtSQ0jPSutXQJXIBXzGQ3p9fMRORpl9oA/LvniBqXnSgT4ePrxmV7ExWQW0rSNOt6pd8xwLtBsgH/rbJpBP5+rHRUcTEJRI7ESj81CJrHL+oSRjHD5ZGGgm2giTRXHJzAYwVt0QYWaurrnaOs/8mRyBUuX3vY7uujFvj7k+MHezdWY1xtutb8tGwMzVzMSTJP/U5nm2SEQULXglZyXZvJRib2y/9Iihovso0+9rGqkibTsqAkGU71aDHjIkqNzNimSVz5/WU1as//aVq3tMt3jH/mliBfczBgqh1xu0UJumR1LZ79q0yn7fOzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRR05pclpFlF2SM9H//7+VXS0dvCVF9T6VaEBCk6vP4=;
 b=m/4ge/uF5GMgsYGv0KoU4N93VxhjN+35QXTKx8LHmhAPZWV86G1SfjsSsnnUWLSy1QEmbQ8LeLH6cX0GGCy13TZpRyAPXdbccXyzOPgi3NwpfTwKjHxCWNs6UOhR1wD+lfPEZeXGY75pPm2uoHvynkeK8OiybcqRaxpGqctzrKQ=
Received: from DM3PR12CA0077.namprd12.prod.outlook.com (2603:10b6:0:57::21) by
 DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 11 Dec 2019 20:39:08 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::203) by DM3PR12CA0077.outlook.office365.com
 (2603:10b6:0:57::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Wed, 11 Dec 2019 20:39:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 20:39:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:06 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Dec
 2019 14:39:06 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 11 Dec 2019 14:39:05 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RESEND PATCH 2/5] drm: Add Reusable task barrier.
Date: Wed, 11 Dec 2019 15:38:49 -0500
Message-ID: <1576096732-3596-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(428003)(199004)(189003)(5660300002)(316002)(336012)(450100002)(70586007)(4326008)(44832011)(70206006)(86362001)(6666004)(356004)(966005)(2906002)(36756003)(54906003)(2616005)(8936002)(426003)(8676002)(81166006)(81156014)(110136005)(186003)(7696005)(478600001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4155; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366cc182-ce66-4177-e144-08d77e7a2b82
X-MS-TrafficTypeDiagnostic: DM6PR12MB4155:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4155072FC9B7CC2B8ADF45F8EA5A0@DM6PR12MB4155.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ax+8LMnBwetC3L/DsRjWnvSihv3vdRWkRpgf+prW70jh4DNQODOnSvx8B8pcAkXI9HXmCyaJ+UH+uHqopWFEiScEydGym+d8Yvgp8hnw2IWl9T51lpyp5BnmJGgkmhIu6GbowfWXhD+Edz6hbJMZM5lceU2v31aAp3wLQ65Uo2kRpExLFxXuWhYfrIqy0BAMwktaZ8PP41zpRCMoAKbQu8eDBs3KhsIkC/63uG2NLCd80VW+A9lgJTgd5+qL6JG7KYEfb+BN1gKx/wEu4ExyTU7tdTgDNmVxzksf+MYDhCfJ1WENwx9Tk2qB5xbJdQ7PW9YHQ8QekvkSJ7ktx/1BEzrovxfDxQllQkxJ6pNl5/xS0aXTt3ghuUTolu1RZ65xPlCSWLisctBmiauEMBOHsQp09HI79cy5/afFRf9e1qdgxmmCvzg4lLDBJHwMf3nddQK2IaLUTb2Gyyn9LkGoMvLn5ZDpVwfN9NI1VDHcywg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 20:39:07.5720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366cc182-ce66-4177-e144-08d77e7a2b82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 include/drm/task_barrier.h | 106 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 include/drm/task_barrier.h

diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h
new file mode 100644
index 0000000..81fb0f7
--- /dev/null
+++ b/include/drm/task_barrier.h
@@ -0,0 +1,106 @@
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
+ * This function is used to avoid any one thread running ahead of the reset if
+ * the barrier is used in a loop (repeatedly) .
+ */
+static inline void task_barrier_exit(struct task_barrier *tb)
+{
+	if (atomic_dec_return(&tb->count) == 0)
+		task_barrier_signal_turnstile(&tb->exit_turnstile, tb->n);
+
+	down(&tb->exit_turnstile);
+}
+
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
