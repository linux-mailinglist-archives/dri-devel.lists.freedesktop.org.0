Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE547D922
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A510E34B;
	Wed, 22 Dec 2021 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805410E358;
 Wed, 22 Dec 2021 22:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxejSl60LwL2kX/P4/jk1mi+zjyA+HLTZ41oNT+FfUYKvrA9fgpHS+gnnzn/ioCFx7WUqADKn5Uk2zWGm2kutsMe49HlsnVzfVr3URq/ht4bHd+jlEqsvaZIxY26Dp7PbkVQ0zo/zKCjN7u2hqoL7fEi6sZc0Q8ZT+UjkuUmtY85VynFH5GwK1XMeD+wiMcoTAkobgPCS4ljaIuCHBZ2czwLAiwWmqP3Jf5aMZFkdSplr54TEeRjMF45RmNTilrwG6zcYZKhvVYqzm7b0BhXLM2Ao26fc9qWjP9kV2dMT+S1D13a1WKpuWZfjUZP3UISK/H6NCpdTnRKhkwaPX8t/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4/2uRIx9zwn9X49l80cVOBWoM5CWkrEJhA6a+OVWwM=;
 b=B6dHYa2tsNpoOYHg1tokITk72OZr5OX0965JNBk6TlH5ogBg7vgyBemQT3KrQkJQ1lLMmpBMdlp0c7MQHO6YkboFNdHVzHXuJmdf0kKrIXh/APJHfT4v3Onx2C4MEeTJ/TZ9dF6Y4svxhhERbLXM46G00CYltEKaH2Zzp6qOOPeF7bj9YQ5kvsq1YtJOcKrBHC0DBkd5Oi27edFMN6RsCnIQANsoW851eaUTneRbvGGki0yZBYPQ6yq0BYhuSefDj2/z1QDFWlgo5Tg7Jp4yQjyhM/93+nz9DnPhy1AT5GRM2mTjI8TnFMFQLURt9K95ndfwRFwCtZKJgzE6CcpDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4/2uRIx9zwn9X49l80cVOBWoM5CWkrEJhA6a+OVWwM=;
 b=Jm/wGMMcJNR2/fmJg++yLbk74AQJ2F5VQ7W+KtYgfbGTpwBoRPS+Hw25UMC6e6fTRXDZTyWhFXoMIJOT3GzU7NcgQu3uNaoTyqc8Al4ZkhF51elkDVveh7hQr7ZjN6tippCd4L07xvnhE0NLe+J8ONydpt8XFcsKF8SWOENKtwU=
Received: from CO2PR04CA0185.namprd04.prod.outlook.com (2603:10b6:104:5::15)
 by BYAPR12MB2776.namprd12.prod.outlook.com (2603:10b6:a03:67::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Wed, 22 Dec
 2021 22:05:57 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::94) by CO2PR04CA0185.outlook.office365.com
 (2603:10b6:104:5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Wed, 22 Dec 2021 22:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:05:56 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:05:55 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 3/8] drm/amdgpu: Fix crash on modprobe
Date: Wed, 22 Dec 2021 17:05:01 -0500
Message-ID: <20211222220506.789133-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbcfb6b1-13ae-419d-84b6-08d9c5973b04
X-MS-TrafficTypeDiagnostic: BYAPR12MB2776:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB277678A0F244BCAB4B20352DEA7D9@BYAPR12MB2776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xqXq/zbNBu/XS3PExCgHbjJ9ZTEjUxHO7AQdu5rWj/mAu+35TKjZacXsrMN3Yiu8sqJ1ZSRRjUxa+6W3xESKzPioU+EtF4gKtZKnVPn8aexnp9aKQoA2NK2LrBQSs1W9Ye0HHoBc7F5Rje2UsYHLTwnN2dtvxdMJCyDNPUZQu+FOR8cUqH6G4xvYL89eq12WiscNC3G95BgF0t8pWYNpFB0jhT62ZPxjCRJ0NqKUXCz0VyYahtu0OxyOfkWkKLoT00rvcSbKpPwg/BF1KkCUOcuT1b+Bv2gvHuqPD69StOin6m5cipODvQS4YgMdRHFMHrpCoq1ftZ7jJWa0XKRZwRFpj5mwIMSpLGfYYcZ7FM82bABNGiIoHMpFXhnz6JgmPxCwGFGb6ds4scy7sDKsHwQphS8d6Xi++dGdlGaM+mel6UTKfayCMLEMt6+FO07Psp9+QhOhNWzYxfV7flspNmuCxYNsxQrK46BlfDiK7Wnt9Uyz8JMwBYONbcQybn9oyn5OZD6+yJwuilO+gIj4BQiJQ4sGtULswAPRjBHx8l8bN8mF2KG2JCPw6neC3f2llNW3eteIuIagIx7gd7QwQ70NiL3fkaWUYM3r9fdjCEEOx2T/CDDzVpkxDzDrBBZ6s4HXzqO6igqfBmwfCISY/m/uQRyM5qnextwd4opb+s++HwRSeo4w9bxKmLl8g/MeyP+wVvLM2ahva+3Rup779y9UON5zDgGmSupabREQwtkDUSlZVHaeUkfmcrCeFN9Xen8XlV02gGchmbwxsySE/jeprA95aP4l6VWXFvm/57s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(36756003)(2616005)(8936002)(86362001)(83380400001)(4744005)(508600001)(426003)(336012)(2906002)(47076005)(6666004)(7696005)(36860700001)(316002)(110136005)(4326008)(82310400004)(40460700001)(5660300002)(70206006)(44832011)(54906003)(70586007)(16526019)(1076003)(26005)(81166007)(8676002)(186003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:05:56.9115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcfb6b1-13ae-419d-84b6-08d9c5973b04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2776
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restrict jobs resubmission to suspend case
only since schedulers not initialised yet on
probe.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 5527c68c51de..8ebd954e06c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
-		if (!ring->no_scheduler) {
+		if (adev->in_suspend && !ring->no_scheduler) {
 			drm_sched_resubmit_jobs(&ring->sched);
 			drm_sched_start(&ring->sched, true);
 		}
-- 
2.25.1

