Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41662E9058
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 07:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5789C5E;
	Mon,  4 Jan 2021 06:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7EF89C5E;
 Mon,  4 Jan 2021 06:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WehlLnSiUWFWdZqQfBYiJYcmGCJ6MQY4G0vFRpPQ38FDLf36hIPJoEkZvfJRvus1B53E4Fry218SS63Q4PW8RTU+8tuqg0QYzxO1MicQsbzhJIN4lv3TE2oMZ/+uFf06A2KzPCWXTlsv4LVhQzC+bWaF4Uc4E3mo+2xCu1GwlCXhaZ/2As3cpHYsnj/Mlyb/2LJkOpnxoc5jyZ/JAKpZUWY4w9OOFRtgKtQetlQk4WbEehz8hcZBe8+D5K1TjwPAm80uQBApqy4NQZ40lgiigGjjSFlYlobJF03pYL+DZyjVka6iepoPURHEr7wXE+IGGZmgq+MKC0LN1zreCf4PDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJoWSUxvYy9YEGT+Oz/pBO2GHbfF2/aJb86DWuUJW4Y=;
 b=M171sFMflVQrMRbGwtnC4xmuMiRDKaloY5dWV3kN4IpR6AZKf1ImVqYQfRmYz7vb2wMGPGoBTqSWQC9MQoECOFE+tkGHX2Q+gGi34gXnCIbD4Zj18FjA5OjQfSfSYJL7FZd0U18IRkgnHkz9OhKACi5gqlAaAIAZoohGkgF0LZIl3R0K9XzE9CmfMllSCypbjLpEbGXyZYrzf4ngyt1u5CDWARIVdYWWtMvsn34KPTSrnifCuPwWvhnVQXFwA7Kei73P9zhopbCAzNombVnxPUFbojVjQiKRk8rNE3/sKKTNnQIAsfh/l9aH2/cEWyEdvFh+uLofd9Htamf0ttLdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJoWSUxvYy9YEGT+Oz/pBO2GHbfF2/aJb86DWuUJW4Y=;
 b=HNsERiFIK1+GRlNq5/RjT6bk/uQWeqyATeQ4io5I3/X22snOttrCBDfgbJ3DfS+vtM1oKplI9oIlHAZY4n7q7f8Frlyq0l3y+/Sj8wnEgyn4YTcOMHXZkWR7q+aiRod3MK6sjUNCnBQmNB08fzlaJe9qnWTG7Pd4CXjFf0yVA64=
Received: from MWHPR12CA0046.namprd12.prod.outlook.com (2603:10b6:301:2::32)
 by CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Mon, 4 Jan
 2021 06:02:49 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::70) by MWHPR12CA0046.outlook.office365.com
 (2603:10b6:301:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 06:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 06:02:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 00:02:46 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 00:02:46 -0600
Received: from XChen-BuildServer.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Mon, 4 Jan 2021 00:02:45 -0600
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <dri-devel@lists.freedesktop.org>, <airlied@linux.ie>
Subject: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT
 interrupt work
Date: Mon, 4 Jan 2021 00:01:38 -0600
Message-ID: <1609740098-32603-2-git-send-email-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b50487b-eeba-4c98-a06e-08d8b0765ccd
X-MS-TrafficTypeDiagnostic: CY4PR12MB1432:
X-Microsoft-Antispam-PRVS: <CY4PR12MB14325FA5C7BBF5387C742B5DE3D20@CY4PR12MB1432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apNmFeN9uKwlkwsHApbhLIG5yWgQfctYSNYOquK/qO/ShqUJFtaqe7DC8pONI6zODipexylwYAShkRHrppudGfZDSN9jv9OAlWo6bwlImjtDJKSC0mcz57WAacrjexdt9CnSytdBeVLVQS6E+YjDTLBP7izHj3+Mj8pW4kpsvpKz+/jkBAmSbqVQPPVYsZrPKoOucuOKAYqjszTtDh7jSeseXYxgB+4hefPR8iSuQpOTWkLteMJNxlmJs+z9qenxpo0fzqloRQ26NCP/8EvP1jDIl2oNkP8TZy2uKoqcsIdvAF4P4xsHFG7xYj0riPudiMSBE84AzLX8xe2b+f6IvoNGqmK22URcxngPEWT7kn3uAlz/HslztyiXtS2aIhSof500m+HJjGQWsdQUgpe/6Mz64Tvbp9l5MK7QxEo/u1zntxeoFNsdWaZzcaRms7wEY80RYUBjAXazsQ/K/PabDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(70206006)(70586007)(82740400003)(8676002)(186003)(426003)(336012)(6666004)(2906002)(86362001)(356005)(47076005)(7696005)(110136005)(26005)(82310400003)(83380400001)(2616005)(36756003)(478600001)(8936002)(81166007)(5660300002)(316002)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 06:02:48.0845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b50487b-eeba-4c98-a06e-08d8b0765ccd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1432
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
Cc: xiaogang.chen@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaogang Chen <xiaogang.chen@amd.com>

amdgpu DM handles INTERRUPT_LOW_IRQ_CONTEXT interrupt(hpd, hpd_rx) by
using work queue and uses single work_struct. If previous interrupt
has not been handled new interrupts(same type) will be discarded and
driver just sends "amdgpu_dm_irq_schedule_work FAILED" message out.
If some important hpd, hpd_rx related interrupts are missed by driver
the hot (un)plug devices may cause system hang or unstable, such as
system resumes from S3 sleep with mst device connected.

This patch dynamically allocates new amdgpu_dm_irq_handler_data for
new interrupts if previous INTERRUPT_LOW_IRQ_CONTEXT interrupt work
has not been handled. So the new interrupt works can be queued to the
same workqueue_struct, instead discard the new interrupts.
All allocated amdgpu_dm_irq_handler_data are put into a single linked
list and will be reused after.

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  14 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 114 ++++++++++++++-------
 2 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index c9d82b9..730e540 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -69,18 +69,6 @@ struct common_irq_params {
 };
 
 /**
- * struct irq_list_head - Linked-list for low context IRQ handlers.
- *
- * @head: The list_head within &struct handler_data
- * @work: A work_struct containing the deferred handler work
- */
-struct irq_list_head {
-	struct list_head head;
-	/* In case this interrupt needs post-processing, 'work' will be queued*/
-	struct work_struct work;
-};
-
-/**
  * struct dm_compressor_info - Buffer info used by frame buffer compression
  * @cpu_addr: MMIO cpu addr
  * @bo_ptr: Pointer to the buffer object
@@ -270,7 +258,7 @@ struct amdgpu_display_manager {
 	 * Note that handlers are called in the same order as they were
 	 * registered (FIFO).
 	 */
-	struct irq_list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
+	struct list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
 
 	/**
 	 * @irq_handler_list_high_tab:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 3577785..ada344a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -82,6 +82,7 @@ struct amdgpu_dm_irq_handler_data {
 	struct amdgpu_display_manager *dm;
 	/* DAL irq source which registered for this interrupt. */
 	enum dc_irq_source irq_source;
+	struct work_struct work;
 };
 
 #define DM_IRQ_TABLE_LOCK(adev, flags) \
@@ -111,20 +112,10 @@ static void init_handler_common_data(struct amdgpu_dm_irq_handler_data *hcd,
  */
 static void dm_irq_work_func(struct work_struct *work)
 {
-	struct irq_list_head *irq_list_head =
-		container_of(work, struct irq_list_head, work);
-	struct list_head *handler_list = &irq_list_head->head;
-	struct amdgpu_dm_irq_handler_data *handler_data;
-
-	list_for_each_entry(handler_data, handler_list, list) {
-		DRM_DEBUG_KMS("DM_IRQ: work_func: for dal_src=%d\n",
-				handler_data->irq_source);
+	struct amdgpu_dm_irq_handler_data *handler_data =
+	 container_of(work, struct amdgpu_dm_irq_handler_data, work);
 
-		DRM_DEBUG_KMS("DM_IRQ: schedule_work: for dal_src=%d\n",
-			handler_data->irq_source);
-
-		handler_data->handler(handler_data->handler_arg);
-	}
+	handler_data->handler(handler_data->handler_arg);
 
 	/* Call a DAL subcomponent which registered for interrupt notification
 	 * at INTERRUPT_LOW_IRQ_CONTEXT.
@@ -156,7 +147,7 @@ static struct list_head *remove_irq_handler(struct amdgpu_device *adev,
 		break;
 	case INTERRUPT_LOW_IRQ_CONTEXT:
 	default:
-		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
+		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
 		break;
 	}
 
@@ -287,7 +278,8 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 		break;
 	case INTERRUPT_LOW_IRQ_CONTEXT:
 	default:
-		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
+		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
+		INIT_WORK(&handler_data->work, dm_irq_work_func);
 		break;
 	}
 
@@ -369,7 +361,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 {
 	int src;
-	struct irq_list_head *lh;
+	struct list_head *lh;
 
 	DRM_DEBUG_KMS("DM_IRQ\n");
 
@@ -378,9 +370,7 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 	for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
 		/* low context handler list init */
 		lh = &adev->dm.irq_handler_list_low_tab[src];
-		INIT_LIST_HEAD(&lh->head);
-		INIT_WORK(&lh->work, dm_irq_work_func);
-
+		INIT_LIST_HEAD(lh);
 		/* high context handler init */
 		INIT_LIST_HEAD(&adev->dm.irq_handler_list_high_tab[src]);
 	}
@@ -397,8 +387,11 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
 {
 	int src;
-	struct irq_list_head *lh;
+	struct list_head *lh;
+	struct list_head *entry, *tmp;
+	struct amdgpu_dm_irq_handler_data *handler;
 	unsigned long irq_table_flags;
+
 	DRM_DEBUG_KMS("DM_IRQ: releasing resources.\n");
 	for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
 		DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
@@ -407,7 +400,15 @@ void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
 		 * (because no code can schedule a new one). */
 		lh = &adev->dm.irq_handler_list_low_tab[src];
 		DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
-		flush_work(&lh->work);
+
+		if (!list_empty(lh)) {
+			list_for_each_safe(entry, tmp, lh) {
+
+				handler = list_entry(entry, struct amdgpu_dm_irq_handler_data,
+									 list);
+				flush_work(&handler->work);
+			}
+		}
 	}
 }
 
@@ -417,6 +418,8 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
 	struct list_head *hnd_list_h;
 	struct list_head *hnd_list_l;
 	unsigned long irq_table_flags;
+	struct list_head *entry, *tmp;
+	struct amdgpu_dm_irq_handler_data *handler;
 
 	DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
 
@@ -427,14 +430,22 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
 	 * will be disabled from manage_dm_interrupts on disable CRTC.
 	 */
 	for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, false);
 
 		DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
-		flush_work(&adev->dm.irq_handler_list_low_tab[src].work);
 
+		if (!list_empty(hnd_list_l)) {
+
+			list_for_each_safe(entry, tmp, hnd_list_l) {
+
+				handler = list_entry(entry, struct amdgpu_dm_irq_handler_data,
+									 list);
+				flush_work(&handler->work);
+			}
+		}
 		DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
 	}
 
@@ -454,7 +465,7 @@ int amdgpu_dm_irq_resume_early(struct amdgpu_device *adev)
 
 	/* re-enable short pulse interrupts HW interrupt */
 	for (src = DC_IRQ_SOURCE_HPD1RX; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, true);
@@ -480,7 +491,7 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
 	 * will be enabled from manage_dm_interrupts on enable CRTC.
 	 */
 	for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, true);
@@ -497,20 +508,53 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
 static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 					enum dc_irq_source irq_source)
 {
-	unsigned long irq_table_flags;
-	struct work_struct *work = NULL;
 
-	DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
+	struct  list_head *handler_list = &adev->dm.irq_handler_list_low_tab[irq_source];
+	struct  amdgpu_dm_irq_handler_data *handler_data;
+	bool    work_queued = false;
 
-	if (!list_empty(&adev->dm.irq_handler_list_low_tab[irq_source].head))
-		work = &adev->dm.irq_handler_list_low_tab[irq_source].work;
+	if (list_empty(handler_list))
+		return;
 
-	DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
+	list_for_each_entry(handler_data, handler_list, list) {
+
+		if (!queue_work(system_highpri_wq, &handler_data->work)) {
+			continue;
+		} else {
+			work_queued = true;
+			break;
+		}
+	}
+
+	if (!work_queued) {
+
+		struct  amdgpu_dm_irq_handler_data *handler_data_add;
+		/*get the amdgpu_dm_irq_handler_data of first item pointed by handler_list*/
+		handler_data = container_of(handler_list->next, struct amdgpu_dm_irq_handler_data, list);
+
+		/*allocate a new amdgpu_dm_irq_handler_data*/
+		handler_data_add = kzalloc(sizeof(*handler_data), GFP_KERNEL);
+		if (!handler_data_add) {
+			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			return;
+		}
+
+		/*copy new amdgpu_dm_irq_handler_data members from handler_data*/
+		handler_data_add->handler       = handler_data->handler;
+		handler_data_add->handler_arg   = handler_data->handler_arg;
+		handler_data_add->dm            = handler_data->dm;
+		handler_data_add->irq_source    = irq_source;
+
+		list_add_tail(&handler_data_add->list, handler_list);
+
+		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
 
-	if (work) {
-		if (!schedule_work(work))
-			DRM_INFO("amdgpu_dm_irq_schedule_work FAILED src %d\n",
-						irq_source);
+		if (queue_work(system_highpri_wq, &handler_data_add->work))
+			DRM_DEBUG("__func__: a work_struct is allocated and queued, "
+					 "src %d\n", irq_source);
+		else
+			DRM_ERROR("__func__: a new work_struct cannot be queued, "
+					  "something is wrong, src %d\n", irq_source);
 	}
 
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
