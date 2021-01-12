Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A092F285E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 07:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9589F45;
	Tue, 12 Jan 2021 06:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4489F45;
 Tue, 12 Jan 2021 06:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lskdvGJOC0g2ii2CZNM8OwHq0fawGl+uR274a77Qby+UUUA0ADl4rUz6aJxBUXcO2/Al4N5NUfY6kGgFO+/G/blZXcrBNo7n0e2kjaJ5SzU1Qs5QxUj7lnk6WxKTTm0LichdPjDTHo6fAwJouaxGdWnTB1nL/AHLZx1tz+n8n9Dk1qdq6rz4mWupRTCyG6CmA0HxSKKF6GXTSTx6i9OOx4QI/+ZU4h2dWcPFbSScYx5HFUQLdQTwnQnDoDEi+AMTD5nS+h774N/FZ+sap6Q3RPgfLZZalKt03GFjI4R2nSSE5EzGVGsgsRmCHp32a1ZaP9ExDOXUW9Ok3i1WJUJ90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rrc7rP7uGSjsXXJUtKc4/phsBvKBYX4SSulqcJmFBQ=;
 b=YIDBwM5c8Tmttuv7cUb0vPf6ybZGmG3lRFv1zem5Mkj/9zJgjTNN6LMXh2Ym/1DBtx34ZIJtkJbhVQKmVauaxuMkgP5ZqKshgr/cUbImRM2ykx3eBObXWusZWoABr3pGLXMIR6CqHHY7/2i3KPGtF6VR7560eK57XmjDY0noRGs0qzz5u9M1dG+SlGccTzBvb8lCcf3xUERbUt8ul6TK9BJwbU4kH3IXGzEgRQ2JlX2v+xDvAV6d46AsFP856tzhGGVQg99h/IZwlBkIRul2aAyDLfmVOOOzCK4hP9QyKPUm1Kem2lwO6qR54aGLfTKf00AHOzxDs3WD//lRYYd1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rrc7rP7uGSjsXXJUtKc4/phsBvKBYX4SSulqcJmFBQ=;
 b=kGCTupr9g+BjGQ/hlfXebxEwRBn7knIg3Ya2UJmcCIPZRC1UR220ypJT/vi0vG+k11MheBzTQZX0FOxpSW6jyKfWuP99FJMa55oj9Psu5gpqTa3Z/tNJ9xCgJ43omqRlv41W3p9nNjCaYp0i9SYezaQdJ1HOxBJ4XSJyW2gumqM=
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Tue, 12 Jan 2021 06:37:42 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::196d:529b:914e:a60a]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::196d:529b:914e:a60a%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 06:37:42 +0000
From: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@linux.ie" <airlied@linux.ie>
Subject: RE: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT
 interrupt work
Thread-Topic: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT
 interrupt work
Thread-Index: AQHW4l887vXbH/oRiUG4Vi4a4ZyNF6ojlgDg
Date: Tue, 12 Jan 2021 06:37:42 +0000
Message-ID: <DM6PR12MB2602BC4EAE9C70F573C504C0E3AA0@DM6PR12MB2602.namprd12.prod.outlook.com>
References: <1609740098-32603-1-git-send-email-xiaogang.chen@amd.com>
 <1609740098-32603-2-git-send-email-xiaogang.chen@amd.com>
In-Reply-To: <1609740098-32603-2-git-send-email-xiaogang.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-12T06:37:35Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=0885edfe-4a3c-42a3-a80b-0000dadc764b;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2021-01-12T06:37:35Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 82e816af-9eb7-4b62-91fe-0000259d2d92
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_justification: I confirm the recipients are approved for sharing this
 content
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 840f7ac5-3d44-4582-0e2c-08d8b6c4906e
x-ms-traffictypediagnostic: DM6PR12MB4267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB426723EE67B32FB91903EC92E3AA0@DM6PR12MB4267.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yn5TAXxjWmENOaDdrNv4MhTkagKsLKFAFoFSmF5LyDaq6hub1iKs/H6Wg2qxUFk1ricOV9rrt3OwYBBsv9Xu0uIaRZnUgvtq0LsU2DSIqIuKG4GDFCe77ubbQZcchzyjY3POKsLJ9VM04N3JWDGozQDYnBPTH+ws/Rgee2jwYp3MFpZzHkFPR7B/LXXEZ6pZl7ID3kdS1H/sqKDq5GoFFsInpacYOzt1rs1c/r4peMiqqc7FrciAaSrDegE3EQ1WS0Sp+j9nqDEMbkgQN4Kf4uTYgZCdMBqzkh7Lrfx2L0PeRm1UfgQhys4BXy9n+KqbHvaJFvYq/SjS9oIR1WXmn9szDR/VF8MTDXPMfnUlghL60mDiwavnAGdgAfAsnj73AQEz9BsgE0w2BTvvHTZhNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(478600001)(110136005)(2906002)(5660300002)(76116006)(66946007)(66446008)(66556008)(7696005)(83380400001)(55016002)(64756008)(66476007)(8676002)(8936002)(53546011)(316002)(186003)(6506007)(26005)(52536014)(9686003)(71200400001)(86362001)(30864003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xcbTB6tIj5U9BRPOgAhb6XIvrtpTK9O1SSLBz0xLogq8uUG+qJFlPep3FtiM?=
 =?us-ascii?Q?c/olq4cWToTjNQ2Yy+DqET2eDNeScGfbSWyEgPRXRVqDdgoUHRTcj+6uCrdd?=
 =?us-ascii?Q?JA+7UQ5c0At6qNyGZwqagOgA8cu64zjdWzUPc/pvWcXJJ8vN/euRBncP0Tzd?=
 =?us-ascii?Q?ZSOl8+5qFAAyYqx+trUMnHG/JG+Pn8nQ7HNjKLpjDFh30L1VpBE4n4EhAspV?=
 =?us-ascii?Q?iXwDl5FjeA7JCmb0U2A5s9fTx/cs0tx6ipTXazo9bg44o7YwFAjDsH1zZOei?=
 =?us-ascii?Q?Qx3dd9KsruiCYeT1iwxLmL6Br4yd411rLAcb+UfBqrZXC+7P4eczb1d7AQzA?=
 =?us-ascii?Q?CBdwBjxD6xiQhde8TKFy+k662SiTXLKcMOdOMr8c27rkLtcDEK38XhqIPY8h?=
 =?us-ascii?Q?TbecHf6pC9jnCI8tEoBXiuCQltSzLjCUvWF2CQK14igOElsZXvr2XONSGZ0w?=
 =?us-ascii?Q?iCNGTdd810IDRruNALWLUORrS5Vl4GGaSaXZKUdMowcQ+Njp7qMz/AeodI91?=
 =?us-ascii?Q?GLzUqAEvnMI+JyDA/ZcxaFL23p+AmO/mu6NH7PnwwAg90UV7+98F4z9F88FA?=
 =?us-ascii?Q?8wwSOhIWzydvSjgcbTwNGFuH+6JHJw5T4BaBkLYFpbLxYVdNKwh5D5zY7m02?=
 =?us-ascii?Q?x5oWaWhMxlioZCpCEmk3TYsA++iEwkb68OpIV8uieX7s0Up5RepdhWgl3g6A?=
 =?us-ascii?Q?QMYY3m7ujxZZYsc7gb0NsXOlShLGA6YH0bf9gXm+ZqDuZ/Uk/clpCOz7dGvE?=
 =?us-ascii?Q?QBR2B0rT5Jep+zj04UOtAgYXFdjYXZC2Kes8eT94LAzuD+FXx29ren/IbJTZ?=
 =?us-ascii?Q?DV+yHHJcktY8VYgmI9NehoGRHaX5dc8XyD9YVOiG/W7QBfuBSFTC8nChiYQT?=
 =?us-ascii?Q?N9rr5LSLbj+7CHXJ0OK9DYi6ag5RX6b000EUTov8falHOXvcVgSPu/sRHLWB?=
 =?us-ascii?Q?Fw+AZprdTSc5VRUmw1XEewT1RE7vSxAx2vvsEtgUVso=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840f7ac5-3d44-4582-0e2c-08d8b6c4906e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 06:37:42.3243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iScsIOJkPN6gpJGWdMmhl4yqIQqFdx7zKpl6UHdMkdcb0vip++2Pu/lmxvaKSsv9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Any comment?

-----Original Message-----
From: Xiaogang.Chen <xiaogang.chen@amd.com> 
Sent: Monday, January 4, 2021 12:02 AM
To: amd-gfx@lists.freedesktop.org; Wentland, Harry <Harry.Wentland@amd.com>; dri-devel@lists.freedesktop.org; airlied@linux.ie
Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>
Subject: [PATCH 2/2] drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT interrupt work

From: Xiaogang Chen <xiaogang.chen@amd.com>

amdgpu DM handles INTERRUPT_LOW_IRQ_CONTEXT interrupt(hpd, hpd_rx) by using work queue and uses single work_struct. If previous interrupt has not been handled new interrupts(same type) will be discarded and driver just sends "amdgpu_dm_irq_schedule_work FAILED" message out.
If some important hpd, hpd_rx related interrupts are missed by driver the hot (un)plug devices may cause system hang or unstable, such as system resumes from S3 sleep with mst device connected.

This patch dynamically allocates new amdgpu_dm_irq_handler_data for new interrupts if previous INTERRUPT_LOW_IRQ_CONTEXT interrupt work has not been handled. So the new interrupt works can be queued to the same workqueue_struct, instead discard the new interrupts.
All allocated amdgpu_dm_irq_handler_data are put into a single linked list and will be reused after.

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  14 +--  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 114 ++++++++++++++-------
 2 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index c9d82b9..730e540 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -69,18 +69,6 @@ struct common_irq_params {  };
 
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
  * @bo_ptr: Pointer to the buffer object @@ -270,7 +258,7 @@ struct amdgpu_display_manager {
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
 
 #define DM_IRQ_TABLE_LOCK(adev, flags) \ @@ -111,20 +112,10 @@ static void init_handler_common_data(struct amdgpu_dm_irq_handler_data *hcd,
  */
 static void dm_irq_work_func(struct work_struct *work)  {
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
 
@@ -369,7 +361,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,  int amdgpu_dm_irq_init(struct amdgpu_device *adev)  {
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
@@ -397,8 +387,11 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)  void amdgpu_dm_irq_fini(struct amdgpu_device *adev)  {
 	int src;
-	struct irq_list_head *lh;
+	struct list_head *lh;
+	struct list_head *entry, *tmp;
+	struct amdgpu_dm_irq_handler_data *handler;
 	unsigned long irq_table_flags;
+
 	DRM_DEBUG_KMS("DM_IRQ: releasing resources.\n");
 	for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
 		DM_IRQ_TABLE_LOCK(adev, irq_table_flags); @@ -407,7 +400,15 @@ void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
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
 			dc_interrupt_set(adev->dm.dc, src, true); @@ -480,7 +491,7 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
 	 * will be enabled from manage_dm_interrupts on enable CRTC.
 	 */
 	for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, true); @@ -497,20 +508,53 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)  static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
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
+		handler_data = container_of(handler_list->next, struct 
+amdgpu_dm_irq_handler_data, list);
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
