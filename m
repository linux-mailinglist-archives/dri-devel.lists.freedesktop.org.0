Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356E433AAB3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 06:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA089CE1;
	Mon, 15 Mar 2021 05:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5C289CDF;
 Mon, 15 Mar 2021 05:23:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtMlBMykYw0IlSutjHTWVo6i7qq1Vbe1/dtcmVzxYAxsXZ0JMya1XusOY/uoJ0RXpGm01G7T/UUL4Z/1+pUYR1csZaFdIVWCvVj9Cw67/Zr+YlSyPE9WKYja+0kRlwuhYXjWjrRxWtIzxL/fr5ZUTe1cxDBoz10jZqrpDB/euSZvVFuNYjgH4di7HYam6VP+zigqPq9VTUAxJ+uz8bEmMOiREAZpOXqC7faibqvokzle8m78QyXQBsmQIXNqACzssEEGmuoYvu7Q7IThHMLlSpAWyPytU5XQYzX2YBukEQIo0QzMEj6bcv/fv4Kf68pjoSXT3L2bHx2r3nxHm2Ipww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW0q3j+qHb9WPNdmOXIfogf+qGbDucjTg4I2URsqidI=;
 b=EDvHM6GG4xKokp4eES4pRK6mP+CD6Ck7TEl7BhmY86+aSl8wZAbSQ4oPnrJMWek33zsT3X3Rilctw/d6cB/PT11XT6lSuNZX0qkROFO/Z07yOvdgNliHNLkvR6jgx6uzLwAw04+2/5Uyk1iEyrljT3cxoaZ5M5KdH/Gr7DlUvPjSEcUQ3Pa3Gb/M95azCJqQ0ylJjFxeNtukqxhT3ieD5LrlCxaRlPktmBeLqw78br0f0uZGWIlwS70U08TuwEFq97sI/YRqRV+XcLIgXt3GDcdobOQoxcuTqPANLmI0dlKf+PndQD51e1p6ySOpWfgYOkm07LJVput6b+Xyhm8mTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW0q3j+qHb9WPNdmOXIfogf+qGbDucjTg4I2URsqidI=;
 b=KUtXWOspfyEKj+93bhh3FLg8MplqvqieB9E1dIedEIyWcxrPFWzxCwNGFWQyHvjv58l5llAkgm4mH+byX5TbiMBBseG8Rc9fio2JhJ+mif8w3N8K7Uq7AGY8aXmmgLHzB86S9ethkqdX58jgoiQhC+JR++0DJR5eM0K9PPT4DJc=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM6PR12MB4499.namprd12.prod.outlook.com (2603:10b6:5:2ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 05:23:35 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc%9]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 05:23:35 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Topic: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Index: AQHXGVr0ttnalfpTIkyzQ3GFwzEsHaqEg4Sg
Date: Mon, 15 Mar 2021 05:23:35 +0000
Message-ID: <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
In-Reply-To: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-15T05:23:31Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=66e9be39-03d2-41fe-adf2-e4270c782a85;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ba792f9-498c-4360-c0f7-08d8e7727b7d
x-ms-traffictypediagnostic: DM6PR12MB4499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4499FAC56806C621D62C8735BB6C9@DM6PR12MB4499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 85RMsI61ZLAtFmtObIpojlI+aNZ/58yaknWm7hNxmfICbXGFe9nDydC7CDNmOlGR4i6mqBs3VNkdEviOawhZH2w3xMzvwXTEx2xETNCgtLugpcU26h4jQpRZOARBeAf5/AUp4oaGUaNqaaowVRxpeWg9hSFwH/gXldNVP2K4kWoQ5thrBxr2B2id2gh+/8QeYQjlOJAl3sE4I7ZTaXIX5zmhawzFOy4QzpoAbgO7S5X4QPZbpD++jf8fFh/Eh5eX+aLb/f1Y8Mk2oSKLV7I7DmdnQAkmwV+atXV7k0o/0APWvkuQmSye4SR3ilz9e8FftjtT7XCQ9Z/B+Y67y2At7acpHrEnq1GWE/9Pw5K7MrYaV3lABSXxFuW0CBHPqYIPz3NcLTXn5nZKQ21ZFAnI4f+IOtW4ieOVKsbUWsUvOmiPF4+8rMZABmKrfLAklvqmYJTohAPjWw1D2tTkw+WuurHX1mU0zzaSXkimHUjUrhIq3zTYC2XeAmJjf7MUcPgwAishwEN47hNQ6gmofi7Sw5GrLvMmzWiNdD0P4kCnTNUT0Nj6R2h2NLtHO2WUe/rdl19H6vlXKwMJLQjBLkr0lJA/3V7BahDRVojAL+gcJB4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(8936002)(110136005)(8676002)(6506007)(33656002)(186003)(921005)(316002)(7696005)(9686003)(83380400001)(55016002)(52536014)(66946007)(76116006)(66556008)(64756008)(71200400001)(478600001)(2906002)(53546011)(66446008)(26005)(66476007)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ulggHaPsyFnsBBVDU12W6OZjTfA/HcH275k8i210rHDwVjKm2BZY/UE7Cnj7?=
 =?us-ascii?Q?hZUcl58gjrNeQ5VmdRO2KaLqH7nDMNL0DODn7PKqMvbZlGQJq4V9Eq0ZwmCW?=
 =?us-ascii?Q?LxIoA2iCt6r7m7L+RcDGJXfvWAp50pxXMn1qVmQTx+B1eNIDSWKKWSNjd5Sj?=
 =?us-ascii?Q?oBr8Uyg0V8w5n1QFOvHfQkvXZa7YPGAhNoD1ps4WqBOZoGfphS9braAMYnDf?=
 =?us-ascii?Q?joaiyb6zG6JCQZvMpJodZL+av6NrPMGJCmoTytSVqKZhgpzGbycIMqUeA2ma?=
 =?us-ascii?Q?B+/h3VfGElxHLeqtgnI+PIChBniU7halmcUpPFSjozEaHpNpxvd56JfglgUk?=
 =?us-ascii?Q?5wbCMuYJ7IvW9i898AKt2BgtHEGws7jra/PUVdDyhhtwC3nRi8b5eSSjXCXo?=
 =?us-ascii?Q?3gWzJ/NANtbajpMMfvvqfRFc6StNonuxgjd5Uz+SVwh6dNYKG2MKMCGGrEEz?=
 =?us-ascii?Q?cEUwQlkNUdPZmuBt+nDmieu1enfuOE3Xm1x59YYs1dwlOCgKTHR1kwbS0gk0?=
 =?us-ascii?Q?XcTRanZoHzUG7MIwrMS8Q5Z/M/iwyJMpTRJJwzV4F9bvOK7Va2p1ss/o8CJJ?=
 =?us-ascii?Q?DmWD+Ne+kg3s1VaLPjge0F5/xZG2rqDbXtlDPN16hK83O6BEpfW6moKSQ0Am?=
 =?us-ascii?Q?Nl1TKPJgILBNHDupllr+Ei5m8ChvsVClMec6F9cDs/GxSwcKQwDu5msW/PgY?=
 =?us-ascii?Q?rELtbkkmtxT+xZbviTCJMtMcDkM3vNkj+AfglI701Sxv3Y9C/z7/JtqFLJ3q?=
 =?us-ascii?Q?qXz/EzWv9DikVZOQn7xn243xCUTZHTk/+vmfi1qieUPA+8yjQ5iQVlpJP5Y1?=
 =?us-ascii?Q?+LYIrhnXEumZx3oLZqG408jBMrp85IBkMWSBdNSHMoCVOpSnaI9pq/Cl5pvU?=
 =?us-ascii?Q?gLIfPST8WvtXM0ElXmTzAV9L6kifmbm1QqsIJTKohJj9mUDfzNkAqvbIrYhC?=
 =?us-ascii?Q?JqaANeA4XrBSdkhYafPyPoG2mA2QovAgLi3giLh1i+4+920x+jAriyM55Ivt?=
 =?us-ascii?Q?dMj0t96QxmewmpKZasr1eS/iwao8lQGmDUHiQ+QyRxlbjpCcrNpAkIIqFJTB?=
 =?us-ascii?Q?IkBoMFdwOGOp2e91v90fqlBACxFnaPJJtepUFVbQeU/5BqyS9ORWxqv5RzJN?=
 =?us-ascii?Q?tL5xpaZzPrBPczdRQoUpwt541swG1+gG/+k3EFnXW6sfpJplJJSZXLxxh1fO?=
 =?us-ascii?Q?7eAajNCkpmf+RATfyKj7h69tmvqxIen/XOLi8gYAhA/+rsZAlKwC04OxywHx?=
 =?us-ascii?Q?WX+p3uobCyArG14WGSAV1pBMs/Muby5323oNToGSkWDg7EIL9bvMoN3P1y+C?=
 =?us-ascii?Q?7NV8jNH2rf0mlPMfpGJ4ugBn?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba792f9-498c-4360-c0f7-08d8e7727b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 05:23:35.5542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SiSsp/HgB8NXuUnZQGWO7UT92GF85MRN0WFGhNkeylnu600/PjNoPiuptbw+qzod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4499
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

[AMD Public Use]

Hi, Rob/Tomeu/Steven,

Would you please help to review this patch for panfrost driver?

Thanks,
Jack Zhang

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com> 
Sent: Monday, March 15, 2021 1:21 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

re-insert Bailing jobs to avoid memory leak.

V2: move re-insert step to drm/scheduler logic
V3: add panfrost's return value for bailing jobs
in case it hits the memleak issue.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
 include/drm/gpu_scheduler.h                | 1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79b9cc73763f..86463b0f936e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 					job ? job->base.id : -1);
 
 		/* even we skipped this reset, still need to set the job to guilty */
-		if (job)
+		if (job) {
 			drm_sched_increase_karma(&job->base);
+			r = DRM_GPU_SCHED_STAT_BAILING;
+		}
 		goto skip_recovery;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..41390bdacd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int ret;
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		ret = amdgpu_device_gpu_recover(ring->adev, job);
+		if (ret == DRM_GPU_SCHED_STAT_BAILING)
+			return DRM_GPU_SCHED_STAT_BAILING;
+		else
+			return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..e2cb4f32dae1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
@@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	/* Scheduler is already stopped, nothing to do. */
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	/* Schedule a reset if there's no reset in progress. */
 	if (!atomic_xchg(&pfdev->reset.pending, 1))
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 92d8de24d0a1..a44f621fb5c4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	int ret;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		ret = job->sched->ops->timedout_job(job);
 
+		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->node, &sched->ring_mirror_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
 		 * See drm_sched_stop doc.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4ea8606d91fe..8093ac2427ef 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_BAILING,
 };
 
 /**
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
