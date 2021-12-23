Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93947DC3C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452410E202;
	Thu, 23 Dec 2021 00:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4810E16D;
 Thu, 23 Dec 2021 00:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw8BKyZ4YDFIS7yCsTngPqkkrvVjSHngiA1eODIS1NO9KWbqJKk4HCIoDdODBsYfLM4LMIcWwSJ3mPZLvTAZ4h2SGYbpfyqrsQDHBZ+o70LEqJHkoHp6qkftNpt270O/LJGmxe2bfjLGcPGtppAdgxu0QK0lQGRdtXS0ijhc/KAWY2Bg4F95F03s8Qsw0IOusaf1EeXkq+oHqLCCF0PktAteiCyr6WBj2UTfZGCh1q95dHHdmZ1N94PkdFelZejvLmyFAeqLHnNSsxukp3hZSMqCw5388BGFLF0Hd9GnqZ9kzZzM09toL1sSfgJ+2AFDf+81hT1hotNmEuuGcGkaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hO1H/RSbBmVBsF+sIHu3gJChn2ZJA65I/4aSlRftyE=;
 b=ZJxravStM5SuxLmsjjEz5Chf6SoDroCUCcBhOHPDAq68KKhjf2LOC+tsHJdkImJj+CnMslm7eRZsBuPoGrIm4FpqPfW6pBxP3HwVVQvXJucKqLAZm1aAXDpOkqfM206LQfQSqsrx8AOE7637f/SkQA3cd1EdNRl4v0/A3sRBdC9VKqR63wt9P1Gh1Oi0+bBjy8pQPpcGyg5Dim2V7Jt+PmfFlR/bLFqtdRxFTgjCDNwMKzDb6YTnsdVFXQarfOqW9vsW2OSeoUkeIk8EguxbUTi6zAhkpjY1624IpnanUq5m1gLpV8m02g9B4Sowk0vHqQ4zZj3gljdt6ajQ3HQs4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hO1H/RSbBmVBsF+sIHu3gJChn2ZJA65I/4aSlRftyE=;
 b=YlU60j7PwV19bmmIFY9tk19xWAWbb1LYWr0Crw7g1G+dT5sSJN0FiwpqxhWP+qhP5qOyRwZbhPprSOooFAzlkDkSfFb5MhBm0a39gH64ok/Idxsc8A+Hjo1/RHiPMMpNud/2p0RbTHQvvfVzX/5zSCJhWc/dfilMYOp25XL/Gnw=
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by MN2PR12MB2863.namprd12.prod.outlook.com (2603:10b6:208:103::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Thu, 23 Dec
 2021 00:37:35 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::c7) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:35 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:34 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 18/24] drm/amdkfd: CRIU checkpoint and restore xnack mode
Date: Wed, 22 Dec 2021 19:37:05 -0500
Message-ID: <20211223003711.13064-19-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8de60e7-f59d-4228-1e91-08d9c5ac6a0a
X-MS-TrafficTypeDiagnostic: MN2PR12MB2863:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2863ACF672D4EDF3BCAFD6DAFE7E9@MN2PR12MB2863.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYNEJnxBJnM7JvvtvI6oWj6fe2e9cVsCuYP692BdJGFKxl+qIHhqT94/+/Uek0PVWlyg8cx932JV/HxiEMLPE/eL9fCwXK8wVK50yhPtzRULHf3z663PV+GPpwlB474eic8WzjJ2eFUxAuy9NZSz8V2ocwNfIFhuHmoh02c57eHkn1mfLZSC/KTObeiooIuLBhdQWb/RMqgX57qE9lqtSclw4XFlkM4MjAr3cqFPszSOKk6deL7+vr1KM83nGLKs7yrKaAGTkusjN6w4o9okwDDg95jZbIA6zFKDsYypJSsE86IDTm+KCdZiG4scIij1ihojqLAML8Ot1/iIAmdsLt7w9viLDyqMZHIKYS63vplnpsVNwMgYnA4Q816e7PCZjCut9wEEIo8QK2r/DOkLWaQH/DlbsFmu/A7nbFmgq9S/kNmnn9hKL1s5AJYHrc4kQmMM/iQtKPbfQGXzgxFnjnB5m51uGKj1LGjL2GVy3Y/iMH2tFB2hfsPWwExAiRLsxDVo3TZRqzgqHcPAuxjrxLiT10nWvjx1nSi499QeWLpPoeJ7Wmm2YMTodRYFM92fPTJCRZziumNGV8aDKzwl46H7hbOgdGG/yh4AP/BtzWKJfH6OTkykb+m58vW+dzrzex/65qzHhBYs5UEX01Tqa0gzS98YoBdxya8tZzdOZ7LELytkGeMvUsziIcLmerUgilhoIVzjVEW+w9OxnYm3qDH88nm0BNGsWOPCd4e2lhRLWJlwpCF/W3ZmvK6l42z8EosCyVAEio5fWS2YQifiJMKXrwVBmgu5UyklMPqiib0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(70586007)(316002)(336012)(26005)(8936002)(83380400001)(6666004)(110136005)(16526019)(2906002)(36756003)(54906003)(508600001)(70206006)(356005)(44832011)(8676002)(2616005)(1076003)(186003)(81166007)(86362001)(82310400004)(40460700001)(36860700001)(426003)(7696005)(5660300002)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:35.3261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8de60e7-f59d-4228-1e91-08d9c5ac6a0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recoverable page faults are represented by the xnack mode setting inside
a kfd process and are used to represent the device page faults. For CR,
we don't consider negative values which are typically used for querying
the current xnack mode without modifying it.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 178b0ccfb286..446eb9310915 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1845,6 +1845,11 @@ static int criu_checkpoint_process(struct kfd_process *p,
 	memset(&process_priv, 0, sizeof(process_priv));
 
 	process_priv.version = KFD_CRIU_PRIV_VERSION;
+	/* For CR, we don't consider negative xnack mode which is used for
+	 * querying without changing it, here 0 simply means disabled and 1
+	 * means enabled so retry for finding a valid PTE.
+	 */
+	process_priv.xnack_mode = p->xnack_enabled ? 1 : 0;
 
 	ret = copy_to_user(user_priv_data + *priv_offset,
 				&process_priv, sizeof(process_priv));
@@ -2231,6 +2236,16 @@ static int criu_restore_process(struct kfd_process *p,
 		return -EINVAL;
 	}
 
+	pr_debug("Setting XNACK mode\n");
+	if (process_priv.xnack_mode && !kfd_process_xnack_mode(p, true)) {
+		pr_err("xnack mode cannot be set\n");
+		ret = -EPERM;
+		goto exit;
+	} else {
+		pr_debug("set xnack mode: %d\n", process_priv.xnack_mode);
+		p->xnack_enabled = process_priv.xnack_mode;
+	}
+
 exit:
 	return ret;
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 855c162b85ea..d72dda84c18c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1057,6 +1057,7 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
 
 struct kfd_criu_process_priv_data {
 	uint32_t version;
+	uint32_t xnack_mode;
 };
 
 struct kfd_criu_device_priv_data {
-- 
2.17.1

