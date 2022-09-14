Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F395B8D54
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80CC10E988;
	Wed, 14 Sep 2022 16:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712010E988
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovmhpcu9H5VcTGkFJhJEulhh6h6yL5Zd7AvB6YwiA1xmgg+73+hlTSh/C80AwikoARK/uSRGl8BT83GjFodg59yRgU6XxWhH7YhjN9tMbqN141QM7aE26Bb0jUPr/TBo3k3f3MIu4b8VhY31AjZeXYzv6RFBPIwlT1Sv6M9ZI0GtwcPly7Kl2xKVn9yTI5qFMKU/hocYUmUBa4Lb9DiyV9j26OEVchJ/19HTXTdHKtYvW72ivpUCk3mOvl+7tu7ZL5gCBb4LUjiC7d7+I+dqKKRWpwq/jMVatT8Rw693t2NzCQ+YTJuDC5LfxESMzsjOmAl3ccG14ZsNSrreCSIIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SMLmMuoxRFSN9eYTijAz6hgC9Hn3OYF/sB4od3MYxg=;
 b=dlMHCUq/CuemHVbyAR+P3HUjkl6fURXjmytj0pgQfL8DBCQsT6gFAgtt6y1IBdemjt0WwfqTtdkdtViHYwVPD8bsQyo2ea4KDC3LXhWJjakHViDa3cYM2JY/QCW7LoHF3SoCzxcyxNsczJGMgN4dIE6uO8AgSgoXQ6LCmDDW0XKUHzCmPvzTOiJC71+CjMDPNEJ6WoXc7gHyXbFtgu3BHjhpTqdG4/pEGfTcAdnHntoh3HidCRzRbv6oCNBxD5YIcqGiKKWPHZVEjVrtwzX2F+ztR/A8pFOwJ43HoQjsRtG+PDt/0NvFTyv+G+M0qnhR1mwgGKcxkvUa/A2uFtpzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SMLmMuoxRFSN9eYTijAz6hgC9Hn3OYF/sB4od3MYxg=;
 b=ZOlkMg2cyFg+U3/TzPunjgXVfVf7hC+4W/5cRcf7z1YYja1y5G2nF+9Ign/NcMkumaz2DazenGQqMmQSKJI6girSTBai+aedlqVWmuq5wDuadkRTuY1wAtmEnIJb0GUO38z+sH+LlOhU4gRMWZ3N5SK/a2MA3ZliBActXMOBYOc=
Received: from BN0PR04CA0093.namprd04.prod.outlook.com (2603:10b6:408:ec::8)
 by SA1PR12MB6680.namprd12.prod.outlook.com (2603:10b6:806:253::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 14 Sep
 2022 16:44:23 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::8c) by BN0PR04CA0093.outlook.office365.com
 (2603:10b6:408:ec::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Wed, 14 Sep 2022 16:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:44:22 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:44:18 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/6] dma-buf: Check status of enable-signaling bit on debug
Date: Wed, 14 Sep 2022 22:13:15 +0530
Message-ID: <20220914164321.2156-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|SA1PR12MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1955de-c799-416d-9fae-08da967060bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRStMn06f0uygl2808BqkOEKdBac+fhswf4LgA8x0Q/9rBkTN16WJPh1eUuIdRMU+fGBiZZzd0rkO6jygv92r4RxerdE4REM3LIw0obopSwSTtA+FwXrcbVHukQolu8SZALDwcsGdP1IktkwTWlOgf4qGvoSLfuzTljJ7YQs3ZjjGE2Oxv6uc39f+5/vuuzVEQF7I/x1q6iGEzuRD7OjPQSsdozlDuJx9KA0kOGw8Da2eSuXFWECuYvjUvAs1x3bpLSf6TgCoTS10ZrxIDzIfphUjzMR70ZEAqVSDcYL/obNNac31bUOhC/sGBgtae+3u0S7No5x7yCXi7K4O/m0zSkeqUVXX9mfy4KthAs3zjD1dbfehljHCVgMCV2dwphK5Tj5JfUVXX8C0EVUwFiiQ2ZrXF+UDUR6VKaKUMEpe1y1fMpHSxivmH+h84WTx6aNxrq9pBpDcEuynDl7q1oo2FJ7W9qOTjjD//DKI7TCyn7bTIinpFE0CCsGiJkozzOSY9HAaCQO2wSGf7RWmh6BPaqaDDIxo9ftLbBrUj4EibuNgsr1uMLCi9+rGOKKe/tp8r8A0Pw/8mNQTCODg/uQPs4fCdIlQoWLHR/OEIIF99rl5s32C7z+Z8UDj2sYAqdOWc9aWvGX4hAzp4rz3uI/xwhgbqfEwY/0XHvcn6P1sWYxwbQTidSUoPprIRdI6XUNZCGm8nytNR4+zLamWGPg97UN7emLyycuxlLsA629YxL2tvf2d4cHo6A1YFWqd/3gPhE37gbbBDuxAbBfUlAjsJUbIyW5WU6rTUgqm4HZ7EIOTUrFE+kcMQIf9j27TCy4Oz6oRB5/ldAzMF9po6Oa4+00JEEzGAEANPj3ceV1gFA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(36860700001)(336012)(41300700001)(186003)(47076005)(83380400001)(36756003)(8936002)(26005)(4326008)(478600001)(316002)(70586007)(110136005)(81166007)(70206006)(82310400005)(356005)(8676002)(5660300002)(426003)(6666004)(2906002)(2616005)(86362001)(1076003)(7696005)(40460700003)(40480700001)(82740400003)(921005)(16526019)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:44:22.9239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1955de-c799-416d-9fae-08da967060bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680
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

Fence signaling must be enabled to make sure that
the dma_fence_is_signaled() function ever returns true.
Since drivers and implementations sometimes mess this up,
this ensures correct behaviour when DEBUG_WW_MUTEX_SLOWPATH
is used during debugging.
This should make any implementation bugs resulting in not
signaled fences much more obvious.

Arvind Yadav (6):
  [PATCH v4 1/6] dma-buf: Remove the signaled bit status check
  [PATCH v4 2/6] dma-buf: set signaling bit for the stub fence
  [PATCH v4 3/6] dma-buf: Enable signaling on fence for selftests
  [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
  [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
  [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on debug

 drivers/dma-buf/Kconfig                |  7 +++++++
 drivers/dma-buf/dma-fence.c            | 16 ++++++++++------
 drivers/dma-buf/st-dma-fence-chain.c   |  4 ++++
 drivers/dma-buf/st-dma-fence-unwrap.c  | 22 ++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c         | 16 ++++++++++++++++
 drivers/dma-buf/st-dma-resv.c          | 10 ++++++++++
 drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
 include/linux/dma-fence.h              |  5 +++++
 8 files changed, 76 insertions(+), 8 deletions(-)

-- 
2.25.1

