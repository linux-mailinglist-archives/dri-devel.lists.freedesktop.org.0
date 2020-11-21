Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469022BBD31
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896A6E976;
	Sat, 21 Nov 2020 05:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5A16E96E;
 Sat, 21 Nov 2020 05:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5p0YxrecMFdDPk7/M2k+AhqnP5BlVOJhZc3YQca/+7qYM13n06TaZFOnjiWn4YU16jw37NKU4DkXGZEuHxaqT3+E6eftDqPYQNBEgBTslvgF1doYobrgzhi9f0MAZm7UP0SBl4RWFZQubbb0KO/jC8imT2S2tlbzb1b0ErJBNm0Tl+GaUfihzFnwdjTco+6tvdWNH4Z5/emqxNCC3lJihqeAUxd99FQok+NxDIMtkWqzXP/O7rLXJzCee08QcFziIKZ/pHdDhVMH+PBE0lYyjq8M9ZbsD9oYimoL+ObuaF9ulHpZfYGOpzK86uxW8hGoLbLjOdscWMP8okGCno2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njtlVtWRFe6SSIOvTGY1Q7rjydiClrLx7fl20jsUB50=;
 b=jB5yeQ+vwc+qp1Qm9BcJiCQJnnrh0hYpVe3KAQ+2UisKthuPfiYRAfmER+xjYAAnUMDX4UUUlYV85376X/66iUXrVyqrgJVw2FQQcK4wWZNwdRfk3MkELGYP/b189SblOqYv/dx7PEAjVNKitJAHAucnv05KNsVv1QHcdgcvCQZJ4mtY35mIN/CvWgHWj8TgprYBS44QeSxqG9MNdwEyWfi344vh/A8nHi/O+w79UY0DuMZbIrUCl8wYJmIbocPH9bpZSWxqpGZkZYhs9NDStjBuYP7HhDSUsay+a6QVeBrRE9Hve0Dy+qh6MiLRpWLgeMAlMyjD2OCaAsa8eSUXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njtlVtWRFe6SSIOvTGY1Q7rjydiClrLx7fl20jsUB50=;
 b=LZ8QskTy2D4+0yB84+HKuFyoYSSEGld96yGm+K0DxsLqjSnxKddoadcvhIaWd3+2ncv/dOjKCDRToLGZcHxRx1WJBjxaehF0et916ha2qRfDGXKWgO5cuMcr/EHUGNOeKyTFTRoJUqkHgDD3aecolSaUa/dEJNfkTKht+JWeZLc=
Received: from BN6PR11CA0067.namprd11.prod.outlook.com (2603:10b6:404:f7::29)
 by MN2PR12MB3421.namprd12.prod.outlook.com (2603:10b6:208:cd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sat, 21 Nov
 2020 05:21:38 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::4) by BN6PR11CA0067.outlook.office365.com
 (2603:10b6:404:f7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:37 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:37 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:37 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 06/12] drm/sched: Cancel and flush all oustatdning jobs
 before finish.
Date: Sat, 21 Nov 2020 00:21:16 -0500
Message-ID: <1605936082-3099-7-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f77d367-9136-4755-095a-08d88ddd526b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3421:
X-Microsoft-Antispam-PRVS: <MN2PR12MB34211068DB6DCE6487B633A5EAFE0@MN2PR12MB3421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:318;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dy24OfyvFUqsc3v/BmLOGWrHXtSta7Zz2xdMMy8k3LulYr8ReNPHZXZrC/n9tA4EGWMlqZhMMI7+NF7K9t7Qbd3DsVrSUc7fAKMRjTCJmTMlKDsROX63MHtRj4MIBnIqibReYE8OgkoH2xkLUCYqckm+SedQGYPGQwgEo/3u5xdDLNnBAgJykcje1IMi6pRdG/0wi5+i59U8tYnEt4svEZXGk52WEq7SIM44tkqrCzoCoNPQGA5G+xGD7vnAlX/Hw7DKioWbp2C62rS3Lwte+GyT0mFHvoogqdtelksv8x9m2bG+rD98ErP0U418lMHWciCzdNFw9eclV9gA7BvkGYh0vcg4E9rYoXtajzf/MKRvHSLN5Y9tEt7ZORqDmrbAmHDE0fzRBsRsXXHAejQnVA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(8936002)(47076004)(478600001)(82740400003)(8676002)(7416002)(44832011)(83380400001)(4744005)(186003)(36756003)(70206006)(82310400003)(4326008)(70586007)(7696005)(54906003)(81166007)(336012)(2616005)(316002)(5660300002)(6666004)(110136005)(356005)(26005)(426003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:38.2500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f77d367-9136-4755-095a-08d88ddd526b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To avoid any possible use after free.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index da24c4e..c3f0bd0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -891,6 +891,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
+	/* Confirm no work left behind accessing device structures */
+	cancel_delayed_work_sync(&sched->work_tdr);
+
 	sched->ready = false;
 }
 EXPORT_SYMBOL(drm_sched_fini);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
