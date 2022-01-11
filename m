Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66E948A58A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 03:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13D810E4CE;
	Tue, 11 Jan 2022 02:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5D210E4CE;
 Tue, 11 Jan 2022 02:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsdfZyI2jD5a78OG41QDW+kG4RmN0vPJqLyiplhqmPnY0SNQV6V4/tuNcHrWuQ0aPxRYVf+K86sxEnb1ttecrYaffXZAMDcvuzcQYSi9Ngk4ZdtXWe+90zhRnWbOWmq5TR4jm6rZObNxpf104528FhbU/2vu/vsC10W6BHzW3UE/Z9HFw0Ft7jI7X25/M82x2eg0xXvcKQnDkBX+jknSmDWjW+PkukPfK6ESG8T1BoNN9u6maITRL8QKs+zlHSrtl9dToE1s/ERiGWHTtxAgJycRn4o6N1Wyrlbv5AkUCMT5eaAn2qRvQLbslWUrK4ydT1LzxcdZQAKa1JkgnKgYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGxmWEuIFm1bLdpEMjsXQ12Jnd59nfH4XPBCfC5PeJE=;
 b=Y/zeyTXry75S+Hqk2ir8IbTJ5FenHaD9Lf/YxVsPHXZS7M4XODdDLlz6drkv12ii7xcnKWBROCX8IqpMbVpeEkDS2ulG0M4sKeZkDpx8CysklBbIl8r7PVk4sOqmG1n4zu0yTyVgr3CN7VUzG9EFYx8Wy1ZK9vJnBxLcsKxO9UCLKnON8d2ZOsinbH2q5C3ZM3Le8f9MlAC2WDu3C+HJ2JT1laxu4FLm6o0BHCP9zFA1+ZKwKThe1O3HKGdDDQw/mBAoBM5PDwEU4M0omex3SUOtz3+j+cjFoUaKjojIcdFbANlY4O/0beaFy+1JYb0z4xoAea/1zy87cvCRWUdqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGxmWEuIFm1bLdpEMjsXQ12Jnd59nfH4XPBCfC5PeJE=;
 b=e3BVjdTVZwxj5bPTzAHFSG9o9bcWj/UhjF+0kGp5Aunz/3i09jkd8qhACdRChdMSt2XYSzH7lM1dgR6hquNiGbglfPG3bGMmTRdGPxTw84b1qz3uqRkjitg0mndPUp17edhsCwqplU6cIMS3btfGHtSQ2l2YjKD+xrp8xvpOqIA=
Received: from BN0PR04CA0166.namprd04.prod.outlook.com (2603:10b6:408:eb::21)
 by MWHPR12MB1549.namprd12.prod.outlook.com (2603:10b6:301:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 02:23:07 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::79) by BN0PR04CA0166.outlook.office365.com
 (2603:10b6:408:eb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Tue, 11 Jan 2022 02:23:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Tue, 11 Jan 2022 02:23:07 +0000
Received: from magnus.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 20:23:02 -0600
From: Daniel Phillips <daniel.phillips@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] Add test for new hsaKmtAvailableMemory library call
Date: Mon, 10 Jan 2022 18:14:43 -0800
Message-ID: <20220111021442.3221240-1-daniel.phillips@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60afad23-34e3-4b88-3702-08d9d4a94ded
X-MS-TrafficTypeDiagnostic: MWHPR12MB1549:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB15493484A7455F5190E547E7E3519@MWHPR12MB1549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCefBW6Bn6ewjeUxAqlhkJuDHdIZBOkewmwtll3QdsGH/0pcRpHp1vJmblrMDDyxz4IyL/jt3wCvcyHOucEsyt7E6xT2+3a02UGV5qA3tiDhWdE2HPqsDgryA2WFfGMlS8HPNnmwhZvZ9zFy/LTe+MTA/XXwxBGtAo6iMrpa7OZX/LpZuDLcTzvP2P4ESJTbGj1TL3c1NNpJG8yZPjB1xD3QejrxaVHvpPjlQ+YOZMWd5cyDExlz3Z0CoqFgWuUxNCJ2ghdx7gnE9fi+CqjFtz6JF0/9sOsh0P0v5L0wqgS8LKIELJoV7tYO7xbgCou/MoRyfuMmXcLTuKf11OvwMaUVWJdBlya3fz8R2VeIWS1pb9Wdwy7ZUHBTnfj3Q/ViPQtw8Dlw58pbQFY9JpK6mEMmYulhKOVYbUSvlYeIdwf0bli8/gt2HVdra2ahGIKpNzm9kiRycNT43KdlX6E3M0DUD3pnusJmAwZZ6otQ9lDkacNTEqJenZgl+JL/gVLH+DDdGkC8jzseTAhYkFNg7ihxRAmThSr8SVAdN+OSGGQmJx3mKoccnn4mPtybDgLI9GNHbhrhlnuOmz3MlTPNI6gbr1IsNz4RiWV2bQjlmJfeA6ceRsbn5V8c0CQMZBw7EdmmXHbFLYFsjz3EGhvGqjIok6oCDV28wGKIINsliwGFZOPBi445wi8cYuIWYZrO/W3a6prGlicf/wpsBeNsq/nEy6RY+aCz7XLk0pr6dsUZighdTUu0MCGbUnGAr+zkAkomNKFnAjhNd9aFZQyKdATDw5Ghy6BHjHeZaZEWJOIsJvY/BPMWwdU7ruwmDkxkVfGd99SC8mmdgCSwQXC3fFMNuDG4HD/0dJ9JurIReS4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(5660300002)(186003)(44832011)(26005)(2906002)(81166007)(8936002)(8676002)(82310400004)(336012)(86362001)(70586007)(16526019)(40460700001)(426003)(2616005)(70206006)(450100002)(7696005)(1076003)(316002)(36756003)(356005)(19627235002)(36860700001)(508600001)(83380400001)(47076005)(4326008)(110136005)(6666004)(54906003)(131093003)(145543001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 02:23:07.1120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60afad23-34e3-4b88-3702-08d9d4a94ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1549
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
Cc: Daniel Phillips <daniel.phillips@amd.com>, Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DefaultGPUNode now instead of system memory, usage similar to
other tests. Also cleaned up pSmall, which I originally intended to
just let float away on the mistaken assumption that it would be
cleaned up automatically at the end of the test.

Basic test for the new hsaKmtAvailableMemory library call. This is
a standalone test, does not modify any of the other tests just to
be on the safe side. More elaborate tests coming soon.

Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>
Change-Id: I645006a89bd8d55ef7b1605611e8ef0c010dad1a
---
 tests/kfdtest/src/KFDMemoryTest.cpp | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kfdtest/src/KFDMemoryTest.cpp b/tests/kfdtest/src/KFDMemoryTest.cpp
index 9f62727..d9016de 100644
--- a/tests/kfdtest/src/KFDMemoryTest.cpp
+++ b/tests/kfdtest/src/KFDMemoryTest.cpp
@@ -595,6 +595,26 @@ TEST_F(KFDMemoryTest, MemoryAlloc) {
     TEST_END
 }
 
+// Basic test for hsaKmtAllocMemory
+TEST_F(KFDMemoryTest, MemoryAllocAll) {
+    TEST_START(TESTPROFILE_RUNALL)
+
+    int defaultGPUNode = m_NodeInfo.HsaDefaultGPUNode();
+    unsigned int* pBig = NULL;
+    unsigned int* pSmall = NULL;
+    m_MemoryFlags.ui32.NoNUMABind = 1;
+    HSAuint64 available;
+
+    EXPECT_SUCCESS(hsaKmtAvailableMemory(defaultGPUNode, &available));
+    EXPECT_SUCCESS(hsaKmtAllocMemory(defaultGPUNode, available, m_MemoryFlags, reinterpret_cast<void**>(&pBig)));
+    EXPECT_NE(HSAKMT_STATUS_SUCCESS, hsaKmtAllocMemory(defaultGPUNode, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));
+    EXPECT_SUCCESS(hsaKmtFreeMemory(pBig, available));
+    EXPECT_SUCCESS(hsaKmtAllocMemory(defaultGPUNode, PAGE_SIZE, m_MemoryFlags, reinterpret_cast<void**>(&pSmall)));
+    EXPECT_SUCCESS(hsaKmtFreeMemory(pSmall, PAGE_SIZE));
+
+    TEST_END
+}
+
 TEST_F(KFDMemoryTest, AccessPPRMem) {
     TEST_START(TESTPROFILE_RUNALL)
 
-- 
2.34.1

