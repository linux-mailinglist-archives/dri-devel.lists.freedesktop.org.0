Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E54BD431
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 04:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EE710E29B;
	Mon, 21 Feb 2022 03:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60A810E29B;
 Mon, 21 Feb 2022 03:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSzCBputKfpArmppDL0fMGxpXeA0/h6y2nxQ1stwQ1LQTMcwcJRvh9UNAQg1kGa9mwbWDkOTXcoN7feDZnp5WHJA1nSELY9qnF0Y4jnsmJ28Z4YvBNwWe68dvVcuE4/W2YWA6nOMEISNBBJunukJIqu75twZ2KgXh9yDWU4qLJC0h3MCd4t+eoaOHxl2T3zpxhsCWebXd1jweeByBzGlPYVcvkqnFQYFienz1bXJXWenDA9anKWebvRdHHZXMZKL8JbNv7Tg8ziMZxB9HZzwuiMoH1vHZNcZgGq8Jt8DzIXvsYdyMK+cUGyIFjaF14c20TX9XGcQ+wfo8eFB0mntEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5Oc66Oahg4aIKGbkLJRQC2+FqFDB3fHYsnZwGEa6tI=;
 b=QAj9hOpV89Nb2QsoqVlEeLeAxVPUlnIKbLsahri4BZ8pRyCb9OrLlGvMzk1KGGGL0ZuXj1sI7XfGjY5nKMgJxwP5RRTEDz/5qFM7VS5XCEZkXSBHhXA9VgvM49dNSAMREBz9V/psHdeDAimLq1Yb+cAHqN+XCzaBlpIwJ+LYjpntmeHAfxwJlHQG39LYPx50qd/UGNN2ZkCeVb9XRbCdeFysQLcRZVbfbTArQZgLAVg9SB/4WbbATxfy3XVjtKRQiub1osJJvFjzZyj6e3FHDN1E/IUUXcF5P+mJtWBHR2lszpESBUujP2R+StioNAlixkRrFrL46HKAA6/lIKJ1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5Oc66Oahg4aIKGbkLJRQC2+FqFDB3fHYsnZwGEa6tI=;
 b=N5psSQlFIogR1p5xY7/5WIyE2toEwb4UgAAyCmCmFgSfyqeGD2nBqDridiriqCopkCM0AZ6KatsYJzp+gsD0/7htUhHF4Aa7nH+gXkpnMQFQxivLrpEjk6bX7D0LhiYdIxoNfhXHb7qZA6iUyvlAvU6NkmnNfi3dbij7uZtaYLM=
Received: from CH0PR12MB5156.namprd12.prod.outlook.com (2603:10b6:610:bb::17)
 by BY5PR12MB4642.namprd12.prod.outlook.com (2603:10b6:a03:1f6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Mon, 21 Feb
 2022 03:32:23 +0000
Received: from CH0PR12MB5156.namprd12.prod.outlook.com
 ([fe80::f0bc:3a8f:2662:931a]) by CH0PR12MB5156.namprd12.prod.outlook.com
 ([fe80::f0bc:3a8f:2662:931a%3]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 03:32:23 +0000
From: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>
To: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, 
 "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>, "Chen,
 Horace" <Horace.Chen@amd.com>
Subject: RE: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Thread-Topic: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Thread-Index: AQHYI+tMSa7fUqVieUuv3WSOe+KAMKydX1jA
Date: Mon, 21 Feb 2022 03:32:22 +0000
Message-ID: <CH0PR12MB5156A295D22DB349CA263A75F83A9@CH0PR12MB5156.namprd12.prod.outlook.com>
References: <20220217104331.6455-1-Jiawei.Gu@amd.com>
In-Reply-To: <20220217104331.6455-1-Jiawei.Gu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-21T03:32:18Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=159312de-d32b-4c23-b059-49c32975ac14;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-02-21T03:32:18Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 16059eaa-0990-4449-9678-928d6fb1139d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dd6a37b-2cac-4608-2d84-08d9f4eac5f4
x-ms-traffictypediagnostic: BY5PR12MB4642:EE_
x-microsoft-antispam-prvs: <BY5PR12MB464274CA1E36CF575C63E59BF83A9@BY5PR12MB4642.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xMfs2IqqkSGCrYaHTaYopvENgVEpDgiReu2nf3z2SHtd8iLx4dHlkvRrMIQ03mNEDaMGXYWr46l7nE2KaOmK68mnvp45VfSzvtKDuW63D/m2K4atOIADJSpmnG8mS//n8fj7F21YqxiYWuR8BR1QBiA4Ffi4Alz139/KUTab96RHxzUbprEXeOfFhyHBRfCVA+VC9buIzaXvJDmya1UAzNKRL2CAPuo3nyRUnkmHnMvTDdXptxzilxrZQi+TaD7uh42u3jlg9cAf0+dVLZ9UGm6mgn3kPU5iTIzVND89/1u0HL71C63n/oE5rrF4VwOMmvHwZVKtukfnJ4fIvhaVYHvQPxYUiPXSa+l1cbB5/2hR+sssxR7aazEnz+1NNElFMFop8OvxcB6d7VMVqb2I5TkbvpNS3h6iLimQfsytESIQS/iV4spwbeLlwYcy6wcAuKyhDJ7+B6TQATkaJnDlzVj4dfw+/IweQWak0kv/MScDMO4e+rjOMPPq4B0DE6dW4ldNc5xlzIIa7QBeMQ0JKTCnzN/d+f/y0EwiZ4a8HNzwA5XAvTWGqzTxxiQoR12OHkA5GJ5+8Ij9p3/o7Fo7vKV+qYGpw0nc+yo624VId2GcAx784wnMMaPj2wBiO9yPTZww5ZyWmyCjCUbk9AijNPv1GYPYhstAH+Z6ofhzmDKssRkDJXZasl6eUHWiwhSOrRABoiMrZFAqFeZ1U8A/TILXIHBcSWMwZW21n7b9eEc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5156.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(52536014)(5660300002)(921005)(38100700002)(508600001)(83380400001)(122000001)(8936002)(71200400001)(9686003)(110136005)(55016003)(6636002)(53546011)(450100002)(86362001)(316002)(38070700005)(186003)(26005)(33656002)(8676002)(64756008)(66446008)(66556008)(76116006)(66946007)(66476007)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GoJpZZjw1/hKZOw3SvXbb/iewnSE8wl5OWMbXCNpL3OtbN8NC5RrGai+oASn?=
 =?us-ascii?Q?UZndSRAvrHEtwcCarc9YZPAh5MJe2coQtGNi0TFxVXJR8zO78jCxvpJ3tlV/?=
 =?us-ascii?Q?RPm+LXjW3hjcfJ6D8rQbTQsFSXIhEQo7xoAEwsDfXSj9sJUrVCHX8MB1vXSf?=
 =?us-ascii?Q?k/vsx8CfOR+cG0GfjSqLBoUTpB5Mkklw4dfjjtZ8C4qz4+uOAbR0n5zLnMBf?=
 =?us-ascii?Q?JJUcDrRk11eDjKTnpLl1Ho+cRxy0rJlPvsC3lOvUzTDs+VawxR0+H57LBjpu?=
 =?us-ascii?Q?VVbk9W8EOhqLOrglv6/u0Sb/Oa276BGsenAHwGpb2eYASiJ5aAWoR2g+z5Rf?=
 =?us-ascii?Q?1Izk1uXibE/LnQJziJAwOAhR1TARQsGZ6s1A7BMmzfZGAz7hWAiRJiJx7k2D?=
 =?us-ascii?Q?NnNHTWBrR6W6Z1IGE6LkPpioYZ4jlrj1nYEaZIbExCImBoBw5qwlpOFxdNGQ?=
 =?us-ascii?Q?lxph53a7PqlpOZnXRPhs3V4BnYOfh95X+8CMa0PiYCQahY0lB9rTWu+dYG0o?=
 =?us-ascii?Q?TkWX/ifalkZDTphWTs4YuhEoivSTZuwZxfzSQFIJaJz248aBVfDgAtc9b2Uz?=
 =?us-ascii?Q?2luEfbLvjyS8vaFkwSlDkQF/i5G9htFqctqHjJsg9XmvdKc4paFkTrKl1At1?=
 =?us-ascii?Q?bhpg8RUj5KKV8yzW/3l5Sv+GMhBAtQLSPXyIgfWbcwOeVyCvpP4BF+RxbUBK?=
 =?us-ascii?Q?Ohz8TNcJw44D3i0TAWkbvvBY9pZwZMyDobVCzawy/l2XMbNzwx9/snPnybNY?=
 =?us-ascii?Q?hC/07T1cdueq9UNZWFcqdwHYg8K8h0VjiARTnt02huev7yA0udQBGlokwY6t?=
 =?us-ascii?Q?L7kfjNr73rx+Glup/mrU1Z6RweD04di+nqA2DhzQgmc32aq/V3DuKODeShBi?=
 =?us-ascii?Q?rLaOUqPryDBj2ccyHI6NNwrOkV5uVdknpiTqFHJJw/EjS2bqZxKezbtfQ6iE?=
 =?us-ascii?Q?6a7e5CRsTK9DK1Af07pEKl6Ue9S4Z63kibqcGSiotbMiFMDpTg1CsP7B4359?=
 =?us-ascii?Q?tLFU2kN5RKBsxDQD3vmXsZRybXGWcPPL2/HvORuzxXyQ7f8Z+KFZfXONYv/U?=
 =?us-ascii?Q?rcjEXE3d9lY7ukWdCRxc14//hdgKDYskqULOoLMPzqRSVAKCoildKJ6tVR1q?=
 =?us-ascii?Q?pYnHFnw2v225MPZm9izfoBoV1WVUBM5GgJp6bXtE0KeCZ9qAaXB4U1HykkP2?=
 =?us-ascii?Q?KJFhS5deVPnYoDO9/K0hR/WhS3BFIDvJ7tmcmvFtdgLQ1pC+lIG5yED4fLMO?=
 =?us-ascii?Q?XYZrfBw7AlTN4OQcSDs5JJM6MM32dw778Ih9uCXnmwI2bBR2AgicCgBxB4+m?=
 =?us-ascii?Q?AGANRhKOx1NoqqRfkrtA0g8gBP1yvOtzXYpKCF8GFAqVny3h1qe0MmlOw2je?=
 =?us-ascii?Q?uhROgpalx0eUjV6/t/ZVDg7mnnJ/s2GFn07mEyniH/ERRZfCNqmGl4BprOgL?=
 =?us-ascii?Q?m7AeEoc9+ouFf4lrVBA4XXeSxsZja+MrC6+1KMuY+4uKrMZsCdKO+XKz+w3T?=
 =?us-ascii?Q?ieVM1BaEd+qqQpaPQBulQoa7HvsKRWQT50XPwpCAjyvAjJXbpxKTp03LrcmQ?=
 =?us-ascii?Q?ttliOh+GRVs/PotFCLwlYd1ggxmTYaJ8Yy4fYwWg3kJWgd2Ti3QBaowT839b?=
 =?us-ascii?Q?GFPxcY36kB7acXA91hgnLKU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5156.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd6a37b-2cac-4608-2d84-08d9f4eac5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 03:32:22.8243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNXA1zDw+iklz0akVmQHKcy0Non3I0O26BT0RqRvjDpGYxH4Wq9KhoJdrp3lqtvk+s9yeSXKkAlwscmU2/6dTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4642
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Pinging.

-----Original Message-----
From: Jiawei Gu <Jiawei.Gu@amd.com>=20
Sent: Thursday, February 17, 2022 6:44 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig,=
 Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsk=
y@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>;=
 Chen, Horace <Horace.Chen@amd.com>
Cc: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>
Subject: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler

Add device pointer so scheduler's printing can use
DRM_DEV_ERROR() instead, which makes life easier under multiple GPU scenari=
o.

v2: amend all calls of drm_sched_init()

Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  2 +-
 drivers/gpu/drm/lima/lima_sched.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c    |  9 +++++----
 drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
 include/drm/gpu_scheduler.h               |  3 ++-
 7 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_fence.c
index 4787cb3acaed..98217b1487fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -508,7 +508,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *r=
ing,
=20
 	r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, sched_score, ring->name);
+			   timeout, sched_score, ring->name, adev->dev);
 	if (r) {
 		DRM_ERROR("Failed to create scheduler on ring %s.\n",
 			  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etna=
viv/etnaviv_sched.c
index 19826e504efc..4240f2ae0ab3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -190,7 +190,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
=20
 	ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
-			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev));
+			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev), NULL);
 	if (ret)
 		return ret;
=20
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_=
sched.c
index ecf3267334ff..4b3a43a2b3e3 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -509,7 +509,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, =
const char *name)
=20
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit, msecs_to_jiffies(timeout),
-			      NULL, name);
+			      NULL, name, NULL);
 }
=20
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe) diff --git a/drive=
rs/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.=
c
index 2df3e999a38d..215709d61315 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -627,7 +627,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		ret =3D drm_sched_init(&js->queue[j].sched,
 				     &panfrost_sched_ops,
 				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
-				     NULL, "pan_js");
+				     NULL, "pan_js", NULL);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index 3e0bbc797eaa..4404af323321 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -489,7 +489,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, b=
ool full_recovery)
 			if (r =3D=3D -ENOENT)
 				drm_sched_job_done(s_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 		} else
 			drm_sched_job_done(s_job);
@@ -815,7 +815,7 @@ static int drm_sched_main(void *param)
 			if (r =3D=3D -ENOENT)
 				drm_sched_job_done(sched_job);
 			else if (r)
-				DRM_ERROR("fence add callback failed (%d)\n",
+				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
 					  r);
 			dma_fence_put(fence);
 		} else {
@@ -846,7 +846,7 @@ static int drm_sched_main(void *param)  int drm_sched_i=
nit(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   unsigned hw_submission, unsigned hang_limit, long timeout,
-		   atomic_t *score, const char *name)
+		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
 	sched->ops =3D ops;
@@ -855,6 +855,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->timeout =3D timeout;
 	sched->hang_limit =3D hang_limit;
 	sched->score =3D score ? score : &sched->_score;
+	sched->dev =3D dev;
 	for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
=20
@@ -872,7 +873,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (IS_ERR(sched->thread)) {
 		ret =3D PTR_ERR(sched->thread);
 		sched->thread =3D NULL;
-		DRM_ERROR("Failed to create scheduler for %s.\n", name);
+		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n",=20
+name);
 		return ret;
 	}
=20
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sche=
d.c index 8992480c88fa..6d68b155c3cc 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -403,7 +403,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_bin");
+			     NULL, "v3d_bin", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
 		return ret;
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_render");
+			     NULL, "v3d_render", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
 			ret);
@@ -425,7 +425,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms),
-			     NULL, "v3d_tfu");
+			     NULL, "v3d_tfu", NULL);
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
 			ret);
@@ -438,7 +438,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     NULL, "v3d_csd");
+				     NULL, "v3d_csd", NULL);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
 				ret);
@@ -450,7 +450,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms),
-				     NULL, "v3d_cache_clean");
+				     NULL, "v3d_cache_clean", NULL);
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
 				ret);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h inde=
x d18af49fd009..38a479879fdb 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -302,12 +302,13 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	struct device			*dev;
 };
=20
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   uint32_t hw_submission, unsigned hang_limit, long timeout,
-		   atomic_t *score, const char *name);
+		   atomic_t *score, const char *name, struct device *dev);
=20
 void drm_sched_fini(struct drm_gpu_scheduler *sched);  int drm_sched_job_i=
nit(struct drm_sched_job *job,
--
2.17.1
