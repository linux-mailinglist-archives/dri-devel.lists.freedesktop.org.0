Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3575AD0E0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0A10E2EB;
	Mon,  5 Sep 2022 10:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7F710E2E4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PL8PNnZiEfFjbKFVsmtRICe8XZRawGSgkmeTPZq9jXCXwqVjezD+6oWAlafzD4DlR+L//UGrFC67GeqYRQ/IVkKqnLxny3A6VCDG7Op4IwQqP4Ij818LAZvhLQiLHhTaQD11ECeFNFg3IMeZiQXUiomTlhz90asSca8NqBq7kRovkxtd9wZQFQ6lf2MKxEKdjwvjdt3kKmzG5k675xUO8F9fIZ9MzNA4viRxO5q+Hgjn9hIoGp0nu56Ka9tNQxpoJ1IjJC1NXbO4EYdHj3FV3Vu6lkoaPR3nS7D66+S1D1BLz7vdQVRMh9Awg4C2N8UpvIy3Zkm6jT4fYwbjHTwfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DA4gpyajKi438nRVy5K6og8muBYEVokmVF5yl+LL2g=;
 b=dCqH/PVDHFAuozusncVXMAvuQhVAT4BadBRmn2xQVQ0j5SESYpP+gxW1R2WwOlTblACb19WwVY9iL5yHmRzXKDLpyHwvLQZhyJKKHWPISUjPOp/YwiSqfO+DKDSBv+wIoe9dnBJxhL5fHCgGFZtVhLtxMsU5IcJapMQymEKCvRcu6Ni2enp/M9LL2AvlxTtMnqYO+vPL59IHSTxXM4e68yKkG0qzCmuDw1Nkc33AwWxjXiY63F+nNbj2e/rx2KjxJ68QWmOpiv6Fib/a50MV3jIat2CRd/XrfvdS5k9lBTEGZ65DlXwvwxk9Pa03c2lAqEGROb6vuMLEqpv/366I/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DA4gpyajKi438nRVy5K6og8muBYEVokmVF5yl+LL2g=;
 b=B1X9dJBN4ocC2r2j01z1Ou7otVSf2ygdhQgSpZen4kY3/EcDyzsG/ojvB68M7D+hMWIXvdboEHqnR2K7DSJ4Rd8aBYinvDjgdus0C+G513bp4SjUUKLTDFz/8Qly0rItAMb3jVw7lLD5THgQ8aAc0GP5MR9So/fR+If+b7BMqE8=
Received: from DS7PR06CA0031.namprd06.prod.outlook.com (2603:10b6:8:54::11) by
 BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:58:14 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::f2) by DS7PR06CA0031.outlook.office365.com
 (2603:10b6:8:54::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 10:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:58:14 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 05:58:04 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] dma-buf: Add callback and enable signaling on debug
Date: Mon, 5 Sep 2022 16:26:52 +0530
Message-ID: <20220905105653.13670-4-Arvind.Yadav@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f630320-0f12-420b-da1b-08da8f2d8837
X-MS-TrafficTypeDiagnostic: BN9PR12MB5146:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3ciG/+Skcr8dYC8OcMo7L9TPtHZnIhgUwL6WoQ6Dum+flZSM9lxcBOROhuzUNjt+7ARnKNP3NhMhnT545tsSqKxK0zEVwDSYT2SfVXiN4rEEJ56CIN2KoVD14eTdR+Xt7Jf5bJwUI4IdPEgA9KtaH9VWauiYNfpOgrGFOQQ0n9+UfJS1DuYu7DOwBDVge9UnUIzDtvCRvcHmCGnF4qry9mhmTQ92UGmvU36RdMD0Bh2IdgpTmzziAJzp23og3DE/e8btwAGYfXhtPWzmum/n16eAAwCMWUn/hqqtXxaNyEKWMCqCqrlAd3W8dMOt/1eYPlSgnRHIqc/tXRoON7E3W09mL+/PDUjhGQdVmt4j/TOItQZlkL+Ju3R42fvyi5aseT1r6id+CRV8BSakz+jVSDkOvsZl8fdpovqbJI3nFuz8ZAEdT5VJF85jpkUsgzvpstqmMZ5gZfrrKj77I5Uw2VJP6mToDaUSTZ1dAuU60P4jxNTErDNczS1NzFMTnMXgT1TaO+9A+P9OD3AvezC76STvoe8NoGb/nrwobDAjpp+0bz4MMWLjiLOlPBzcxhch6e9jYfB3M7Mqwsq09l0EVLl/IxBYnNaddaO4w3UdJAsIV+6IroZHepPIOzH3U4QMUyGdSIr5+UskwyxvcfmQAF/9tFoWZa+5i/Xkv8tOeFTr4YeG7B4NKPzWhx/wFJLMXNguzj1otjbUVNA6yURchZ7H9qhGkWWuLM4w+WleSwC+dzlFRsBMIaIC8K36g6IAg9SZngmkXAPyr9kwsISN6I2GaL5bOUmJERq/SRMEO+JdCoTHFQtbbsaqHUnCW/UxBPCokW7QePbmLUGz+SHJp8xWI6GnVC/TTo+Ofc6qREJQEoba7usY2oD1ScGI5W8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(16526019)(82740400003)(47076005)(426003)(186003)(1076003)(336012)(921005)(110136005)(356005)(36860700001)(82310400005)(40480700001)(2616005)(83380400001)(316002)(8936002)(40460700003)(26005)(2906002)(5660300002)(36756003)(41300700001)(4326008)(8676002)(81166007)(7696005)(478600001)(70206006)(86362001)(70586007)(6666004)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:58:14.6914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f630320-0f12-420b-da1b-08da8f2d8837
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5146
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

Here's on debug adding an enable_signaling callback for the stub
fences and enabling software signaling for the stub fence which
is always signaled. This fence should enable software signaling
otherwise the AMD GPU scheduler will cause a GPU reset due to a
GPU scheduler cleanup activity timeout.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/dma-buf/dma-fence.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..0a67af945ef8 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -27,6 +27,10 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
+#ifdef CONFIG_DEBUG_FS
+static bool __dma_fence_enable_signaling(struct dma_fence *fence);
+#endif
+
 /*
  * fence context counter: each execution context should have its own
  * fence context, this allows checking if fences belong to the same
@@ -116,9 +120,19 @@ static const char *dma_fence_stub_get_name(struct dma_fence *fence)
         return "stub";
 }
 
+#ifdef CONFIG_DEBUG_FS
+static bool dma_fence_stub_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
+
 static const struct dma_fence_ops dma_fence_stub_ops = {
 	.get_driver_name = dma_fence_stub_get_name,
 	.get_timeline_name = dma_fence_stub_get_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling =  dma_fence_stub_enable_signaling,
+#endif
 };
 
 /**
@@ -136,6 +150,9 @@ struct dma_fence *dma_fence_get_stub(void)
 			       &dma_fence_stub_ops,
 			       &dma_fence_stub_lock,
 			       0, 0);
+#ifdef CONFIG_DEBUG_FS
+		__dma_fence_enable_signaling(&dma_fence_stub);
+#endif
 		dma_fence_signal_locked(&dma_fence_stub);
 	}
 	spin_unlock(&dma_fence_stub_lock);
-- 
2.25.1

