Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E34D212A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0E410E356;
	Tue,  8 Mar 2022 19:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E04810E34A;
 Tue,  8 Mar 2022 19:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIQpvzdfiQ0yRqsfPpzGCykKcl3wAqdjNDemq5pJon8O+YttM++FPz/UK5jvjcdwfaOAZsqnayU2gLqOUTy+BE2L35/wyyhz3HSPsK1WgytsORWjfnf9cBb/VYDZvx+cwSEVwDFpdqsV9a3IyK0AqbS+9U/vv+3VJUOI0rQDpVWuK5Nu1rkCI4qDhRHBPnpOgG8cMp1P2Uepg0j+gcpDBekykaKcNwEBT/wxrxW2sGQroPRNI8dUG234GFcKT8vGx70latnWu9jkfay5F5M4AfvGcCmM0kvFaRfWu6EaJF8r1yffEjmPAykcmCPV01ODKp0kkNka4gmsxKCBkwiLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ8m0oUVR7NXH6/nxrTaYsElJPCBfds5moyi/Tzqm5E=;
 b=PL8AXPRgoXEfLqqIMLtJKZI9Qyq7cpeH2U37j9Es/M9QfDHTnCioxoYTQZByAXQ30skgQfzM/OT8AWSAUWJHLS6UeyzQiYZeysdaI6evSmKr3o+PtJ4AVi+7DYlWJsxIevTg9P3TmQd4HRBLBDWozPrDA6cg+L7eEWQS47uB79kmGYss/+fXI9ZnaOcdKPv6yts3BpdAUMmjnA/Uorj5+rCQNAdeYkbDJyncJX5wC9xL58ykltDsojovC8qoH6X79SN6TQisOdfIiVjGbc3TJkXyWIPcj9OQPoLO2HxNHfn6v7TrdCmbfz1P1MQEBC2TSitZOAZxmJiQS4w7624hvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ8m0oUVR7NXH6/nxrTaYsElJPCBfds5moyi/Tzqm5E=;
 b=EZNwUv/IzBgznGdBtH3DnVBmLpz76e7IstFfnfTV340VEk+th3jq8EElVvqAKLKvscCkr6DfrJrhoYACULHaCK+dUFE4XqsvAIgn6jQcS3fHzr7aM4+nBaeHyuoAyD/LQbSxRrZGWzFsaLyfxwBx8ned5ddhpXg4GpF/YLZ5lBw=
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 DM5PR12MB1596.namprd12.prod.outlook.com (2603:10b6:4:d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.18; Tue, 8 Mar 2022 19:12:05 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::fd) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:12:05 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 13:12:02 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Date: Tue, 8 Mar 2022 14:11:48 -0500
Message-ID: <20220308191148.13861-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d73a99-b7e9-4482-1f7c-08da01378889
X-MS-TrafficTypeDiagnostic: DM5PR12MB1596:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1596840DCF351698D90106F095099@DM5PR12MB1596.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOsLsPEsMxUFKrBXGekZeeIvChGkVEqHgGKuHVCfEUYcLsuxtbQUkdmfW0lwCDpQczHmt8HBvIPokwj1SdMNmnTyNtv89SWlz4jZ6pZxlA76tcHml3rmubSW5TZ1pegY3tIzh6uhWz6gapBtWxYJZrNJGcmzy7sn27NPUiNe+KqYqhYbts/d++M5t7opOA9dh8sOc+XeZnZT1O2z+E91zIz5Johbo6Av54KXiROIQbNAeyJm4GHO8IXTAI/UYkwX7Spy0TaMSSMNDR8iO4hnJhGJq+2IGPdXEa6048AOKem4sSMuld4EPXa/kAOFYiw+02WbWw3aO+lkRYdAlp5KaYtdZNpxHOunuXb6tSjkvjjdgLZy4eSdtk3b7CQpqZW0ocWMyAVc5GPtj99O9rKljzSM+naWFQYbF1QU2r/46Z7POSJ1wZGXGmxrb/TuSNpm0V8ciERG1UeyrNVDuQbgqds4Q/F7KA43XGK1xxj4Y80tzR01tD86k5UBPzxtcdio6Fn0hXxXq5d2Fwz6PMNBIT4IndSHCO+bob7gRGTqKwCqp2YuMjsNJzRwDONc9JT4alum28NW+yArYavIl4bAVz6xz/3UB+7FIg47SSQ4h6x4J6M5FUxz9lv2yGkfcDzzazRSI/Apir3N9ZTpY6E6sE2FipIYDYcoCQGfQHGwRNl83KPSCMdYdpO7C9xqFzguhtU9f7NyhFN6cQjt8jvrYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400004)(86362001)(110136005)(81166007)(356005)(40460700003)(8936002)(450100002)(54906003)(5660300002)(36756003)(8676002)(70206006)(70586007)(4326008)(2906002)(83380400001)(16526019)(47076005)(36860700001)(7696005)(508600001)(6666004)(2616005)(426003)(336012)(186003)(26005)(1076003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:12:05.0769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d73a99-b7e9-4482-1f7c-08da01378889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1596
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
Cc: Felix.Kuehling@amd.com, David Yat Sin <david.yatsin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export dmabuf handles for GTT BOs so that their contents can be accessed
using SDMA during checkpoint/restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 2c7d76e67ddb..e1e2362841f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1759,7 +1759,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 					goto exit;
 				}
 			}
-			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			if (bo_bucket->alloc_flags
+			    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
 						bo_bucket->alloc_flags &
 						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
@@ -1812,7 +1813,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 
 exit:
 	while (ret && bo_index--) {
-		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[bo_index].alloc_flags
+		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[bo_index].dmabuf_fd);
 	}
 
@@ -2211,7 +2213,8 @@ static int criu_restore_bo(struct kfd_process *p,
 
 	pr_debug("map memory was successful for the BO\n");
 	/* create the dmabuf object and export the bo */
-	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+	if (bo_bucket->alloc_flags
+	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
 					    &bo_bucket->dmabuf_fd);
 		if (ret)
@@ -2281,7 +2284,8 @@ static int criu_restore_bos(struct kfd_process *p,
 
 exit:
 	while (ret && i--) {
-		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[i].alloc_flags
+		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[i].dmabuf_fd);
 	}
 	kvfree(bo_buckets);
-- 
2.17.1

