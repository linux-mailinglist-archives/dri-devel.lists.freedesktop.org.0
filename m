Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D771F5AD0DD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20E10E2E0;
	Mon,  5 Sep 2022 10:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2513E10E2E0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVjst3jLJmYbDWIHCX81j9c/1pVhdvCwstNG9IoIbugBR4mgWWgpn2wACzOYIrYbygjlVw/70Mq5WUmGBXb9TH5LeALoF6bZ0bH+KkpsGlp2rQgRcbhEJnr5N12C3ijTPKRJ/dOu+VaO3qhD4n+azF6RYw9iTT6cAohhUKj2jvas3r3k6shJ6DFpSnH8s8HV2IWS9zR82yWThPiUSRTBPGIuxk0tqdx7Di/HYdIWpCkYsnAGBl3qzRpRgSUU8NivBVBrpNcFEEZCItiNWgB1PXYB1gdhb8lkLP8IM1HA4J4mhJTCxHOQwYSBhGzZOociPNgAO+X2535GxhYqjAS3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ7RSs1vG3HEU2pJhRoI8ZZxUxCzQJEfOlnyxwyoPMM=;
 b=gKMudERNbhEwrVTsZpPA6QcszxgRC7pxVt+WCOkxVh6BRhXlnQdZtY/h4b+WUbBO26zw8K+mF8PpcItV+VcZKeKRFsW7K2mE78hp5Acd1qNM1lUeMK9zzXO7eaIfch/Y5HM33V6NIp0vdo+XRXhEWF2sK0QIsaqydffO1P/5b3cBWeo7/8qF7Yz3FdDAQ+8tGP32l7uGuxAB+bNgxXc8FQKpD3kMaCGELDxZcfjVxmXn0CNFhYdAj10AnY0kqyXhe5Dg6Tpsw2AjJDn+GLsYyyTUK7shIpYhtjpEfKLrS3EsGgrt05tOJ75SyGexh2ckLg7xokJJOqE4IvRYtxk4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ7RSs1vG3HEU2pJhRoI8ZZxUxCzQJEfOlnyxwyoPMM=;
 b=lo9HbVPtGBDF2oiW99uZUKCo4o6CdwCYmyrQ2gdsTW/eaejkXOTELC0wBsXZo0vEbChqaWaifZO8u258rgVF/HQ0Bch+43N0mzSOdU4ZqFf7kVR8T9JBnrNNrTCgpVVRZucGvVaVNqnrIFnyD1SJwAhNnQUNzGX1ru8pmxo0BA4=
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:57:50 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::2c) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 10:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:57:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 05:57:46 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] dma-buf: Check status of enable-signaling bit on debug
Date: Mon, 5 Sep 2022 16:26:50 +0530
Message-ID: <20220905105653.13670-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905105653.13670-1-Arvind.Yadav@amd.com>
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c046595-47d6-451c-835c-08da8f2d79ac
X-MS-TrafficTypeDiagnostic: SA0PR12MB7076:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TqzFX8Ol9s8i/kbnPhiY6uA3SqvIX+TKxa8AOLoV3yEgIu6sOCdH21p5ZUZdCsw4c/BzcnwOBNCXjBcF26jbVs5d6O/fgU2vJPEZxCy6hPDDOLRfCk3tyjXjPbtF2oF/2do8e3fxPEMtdpxiqO6eqbR5mSnS27NGlrBgyzPrnyGjGOH5cn4bRZeWyTx8myOBfc6FWl1hkQmQwc4UkynBuFGdlVlvaxKyenyILSZ1Eee/WpjrG5BIkRhA7prZ4xrin6y3wejrR0A0pWpTo1SaSiRnc1GtqNntDyjFK/z0rwCiuxoW0AcD4FBEue07fSrnT+bp/Gvhk6ijw/wmJJDn2er8xTiLQLSs5zc/vNUtuDCqtz4dMjRHpqCSCCilx7iM8vjuMWSaTHZlOHajWA/BZJUlXSNiKjRTQK5WRGbS81MbQcjeZqQNBO/I8rLWQsikD4yxJj1RlsGzGN6LLhBsum9Fm7xrCysHvh/2ONFAtPURe4ZmZ4CSRUDjrfE2RItrfzXUk5RjYF2UAgxrlxipz+pnt4oU+RN+u4qP5aHyfVg606PF3F8uhfbAf1XTY7CWg87Gd/n9hUuIbmI7jtcd8FfjRqC91n8nSlPF/lu9BgHm+1JwE5QNK5h6KUiDZb5KhLkf/54NuoW9mAl5gc6QyJWBDMUnYYaijWlEvWdtbA6YOmLgke1BW6BRJAt1N4Yk3Zo1mK0J9O4RpIHWfr93jnsTOZsxdPzZqoEWLimF5TS1k/L2I/oQdhDiIAFVauih2FJjKttqY0CWdkmZ7EWyF7rASLfqNVG9bsdaiZLaglIqYQ1UReUl3gZaNWpRDDVzmYe7ufjdKl25+uwIezbsZYKIy9RpplziuFWfZoWXMgW5pwUqkwVuyFNtGF5wq+TG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(40470700004)(36840700001)(70586007)(83380400001)(8676002)(47076005)(16526019)(336012)(70206006)(8936002)(426003)(4744005)(36860700001)(5660300002)(7696005)(6666004)(478600001)(26005)(41300700001)(1076003)(2616005)(186003)(4326008)(40480700001)(40460700003)(316002)(86362001)(110136005)(36756003)(82310400005)(921005)(356005)(81166007)(2906002)(82740400003)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:57:50.2902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c046595-47d6-451c-835c-08da8f2d79ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The core DMA-buf framework needs to enable signaling
before the fence is signaled. The core DMA-buf framework
can forget to enable signaling before the fence is signaled.
To avoid this scenario on the debug kernel, check the
DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
the signaling bit status to confirm that enable_signaling
is enabled.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 include/linux/dma-fence.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..60c0e935c0b5 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+#ifdef CONFIG_DEBUG_FS
+	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return false;
+#endif
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-- 
2.25.1

