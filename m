Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4304377F00A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 07:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877C910E3EF;
	Thu, 17 Aug 2023 05:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DD910E3EE;
 Thu, 17 Aug 2023 05:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSAdXCURTU38AYMnsMxF7/0+3tG3g19SWD8o9Lw2+dFUiu7atBjftJcyge9V02foK3ykzM4BJH2vBNUPyhVAL0xnzz18JQoscNlGiOkisIwjxfw1T+nxdvqVzc+5h1R6+/fkA1cgApov8y16mNS0oGbL4Q7Xf41FKolwcniJIgn3KBY0v7UECBiZQO0AlosigryFvclRTF9PXg91amuWoISRuC3XSUwWKqkSNlvGcwyrvSFdEnWuC1Qv/zOProy8sH8crKn3/D0KlHZsKNPuzeVHW40suBMpvrLHtPT6cerXyanx6HotK+sDmUYX4fHNPz4vgnIZC3yOjLA3451k3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2ZhYSAGtoDFWoPvhT4bMieRfUAmNRGxKD66P7wNkfg=;
 b=ESo4ISAq6UkmXToqlGBTT243QklD1Mi4x8mG/Zr4DMUbbAo4GxxFmfgoRGbW1jlxy6plqO0+5WBhLgzV1ijgccAY/csMKsCetssxmMI3D0LxVW8/reP4tXeA7JqgKDdtBdxV+uX2UjDAWXaaCl9EOMFQWiqHL6nZ0a4Pa5Dib3jAApGDbXvUuwsPnM9Dat9Jh0lgWRRj5hv4QARdOGaY74a9zmPHIjrUHUUQgVH4i+RGy3IoyCIVsnPQfQ0VHsKUXybQxS7kFClAB7YnPuxcMrmOeOAhAJwYWa2uEqXGb1NXzUWq26w+FNgU1eioTGkHubI/FP5DAi91o7GChsCSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2ZhYSAGtoDFWoPvhT4bMieRfUAmNRGxKD66P7wNkfg=;
 b=MuhUXj21tGKjrOAXntcivjucwXbfolb0ee/bNtzTik2KMBy3Orm9A63y0ES1aIUSgWKunCI4HnUbLQTTeV+/Mf/9DVcbstVeu5rHdf1bJw1jgF3xSFl+qS4Er37Srxd0oJqZjXiTflcvLSSYfTMR3loqWo8C/jS/SsIIN2FQjVE=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 05:09:27 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::c377:a09d:c286:5835]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::c377:a09d:c286:5835%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 05:09:27 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/scheduler: Partially revert "drm/scheduler: track GPU
 active time per entity"
Thread-Topic: [PATCH] drm/scheduler: Partially revert "drm/scheduler: track
 GPU active time per entity"
Thread-Index: AQHZ0MhhdLWT/QT4vUWnmc1JH4hWA6/t73sg
Date: Thu, 17 Aug 2023 05:09:27 +0000
Message-ID: <DM4PR12MB5165F0255324A07BE76F781A871AA@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20230817050435.3109-1-xinhui.pan@amd.com>
In-Reply-To: <20230817050435.3109-1-xinhui.pan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c073f040-a617-407a-9095-f6909db72819;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-17T05:06:04Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5165:EE_|LV3PR12MB9411:EE_
x-ms-office365-filtering-correlation-id: 57dcd798-d1ff-4456-f5bd-08db9ee0217a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0E4WadA8dXVcu7RfXEF39QrenNVz7ztNzvd7JsXomFTFs6JKTwMXr3Dh/HlxCsRHZ3P2U6CMn7qAnloVEBrc9KdRG+4gaDNLqse5UHCLfi5IwsKe7MvW/lXZK1fUp8Mp3Xm2/A6Pk15e5zQXnKtSLR0zpIsxeoIW8vMwZqMXradqEGg1LzTT66Xpm8MtHfRQ2JcpoAqkg/KjIGjYJ+pGmy8b5T4uaQcBimkBvfsLws0dK9QOTUz721aKJ7UEomVkEoioE+ReNbElCsMrYiswxQuVEWviv/HsxHKBlPfr+mFffz0jQkIxmYoPrV7r2Agu4qkmSwcvLcJeXkh4ux6ozeaInMVIgByzc0/Tf4YD3UnkVbIODFuY/2GeF38G/FILXOyXdp/E1impt/pBLaaZSgpnx7wpDkyMf8N7PgNS9g+rZ2ka1g1lZ1ROYxY8Vz2OY7iASaQSus5V9kr5yc1Wg313xDrIIzA/8bUSiOe3hu/U+fDtKt6sxjhKZK7WwRFiEGncOquw6TVgy6zKTjaGf+MGDtuHvfKW1jEaPtYvr95AqP+oXzcAzB5d3cvYQt5gY5vPG0k0WTEuLUvBPcx8gjvSg+LufX0Wk4UmtgYTvSLMYAZpuL9afwnEHIxca2xR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66556008)(64756008)(76116006)(66476007)(66446008)(122000001)(5660300002)(41300700001)(52536014)(38100700002)(38070700005)(4326008)(8936002)(8676002)(2906002)(83380400001)(55016003)(478600001)(86362001)(53546011)(9686003)(33656002)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?usKooHHb2zhqapDqcrreHjROSvRY2gKx94bktyL4ztaQri+XikknqnTH9k+4?=
 =?us-ascii?Q?//k3blUB1XQVQ9pFYL4qs24EDktEZlenJ3uXLus7eijbXK0hgljDMbBtYD4Y?=
 =?us-ascii?Q?2Q9cNZR3zWQEhFzPi9bNRBRJ0+70AAb47/Ax84Rkp7Fqe3ga3R80w2fV1R2w?=
 =?us-ascii?Q?OsfBX8K41iXbfYx0/WbhXjSikVYyxQ9MMVmE1uJvT9tltu3GDC5GIPi8Yb7c?=
 =?us-ascii?Q?h9yD8SRDOxfqXMStvp3WkrUuHfaxolYz8z9RAkei8x2rFiNbP/oyqowO2w+6?=
 =?us-ascii?Q?G0zYTJmROZUpAQdugFDfBz1akWkMRY1BjlZvU66knBf+fG6/tSVWLtImNKhT?=
 =?us-ascii?Q?w8Zl8zuytknWiEuXT51jiIA4kFZs0W4GcuRqCN2sXek5ybh6qDsfi//oG7Fw?=
 =?us-ascii?Q?/vooP71mC86tr8T8x/8xYr5qjZcpLNrG3cf2vruBC/jDwcNCVq9ks4s4/vY3?=
 =?us-ascii?Q?E695I/Rxj4HiThcnv4YPDSIYNDu0dqbV5UNI/Sclx5NIIEbVgcrJzuWvLd0J?=
 =?us-ascii?Q?qwmo74+3z8jo3qCUVEqyJjOMxxGSPl68gs0tiXKnIzkARPbBDkTvAHiTWu9I?=
 =?us-ascii?Q?apaTUeXXvfp3SuPRhO0uq6p9lsCe9i/MJziknFk4rqhUVeaNJjdVrugNphQ8?=
 =?us-ascii?Q?PS+wQzWulLvVjOr2a5+Uu3XmkghF5tqonfvazHvVIhbvTFKUPePrKLRg9U15?=
 =?us-ascii?Q?6FUs00Z/YoXffIWAjtCTwoSZBcA9UWPXgF8fEVHjbsbGDhb+9w+fXPrpt3R2?=
 =?us-ascii?Q?OfVG0C7mLqRqOwtsBy8nDT2yVCMtNTFSDcSx1aBDvpo8KTZ4Ym9dc0irjlHK?=
 =?us-ascii?Q?SOUKd5LVH3uhc5kbHiI91xhTSVHXEJON2D6IR2wUReckVMhwi2XnomBRTgRb?=
 =?us-ascii?Q?TRXQsl60hEG++pmtKA8f3Gdo9Gxdt6nCqdyR4W0v1CNaxx3Ay2c0DSZNPyXH?=
 =?us-ascii?Q?kzGIdA3HjR3ZuaLCkPDaaxMax0s8Jgu0iaACZbKWbVCa8xZTpXMcJDp6UdB0?=
 =?us-ascii?Q?9d5svnv3ii0JkrWmR4k5JMV3pNEHG2HcV9WFLhpPs39+glTa2VphXhkErn5J?=
 =?us-ascii?Q?MIvkbBU5og4yp/d2B4VmzonRKk1zjjmmHSFPIUTrxdEsd2HJhtx2xv+TMu8E?=
 =?us-ascii?Q?haVYXj2Rs4KItouzQMHpl+aq3Aw7flY0/JGklWfKew3DQEFFMHKOcRDqvYOI?=
 =?us-ascii?Q?boFp5LShW2MUHzEfPmU4fcg7d0qn+YBddKAf0SqQIXOWBVzNJFj4Mz7Zb2cK?=
 =?us-ascii?Q?RXvDGyfb455CtGWfH/QCp4INsPrXaGTyEvR1th5lqr/x1jJC+9AaEFPr1+LU?=
 =?us-ascii?Q?VRS3qJpHYga2IRQxz/tsWYrYnHCO5M18zUlfruEUuo38iL6jAGdg7bxtXeK1?=
 =?us-ascii?Q?dur+OTTj+wa1u7jS8WIMjqRacWnzhomLgy3bmdzkV9TMEcGNnvkmBv7NYgX6?=
 =?us-ascii?Q?Ne5qzj76sJcQ/rMpCaIWqw4FgWstYc24b8rQAGEN947v/itwSl3Bf2s3uITt?=
 =?us-ascii?Q?lEm5VcCpCEiLw8IRjnf5JSksSVmVbc6l3mfk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dcd798-d1ff-4456-f5bd-08db9ee0217a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 05:09:27.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X3+oIZX7d9kUqqa3TZmFOE76VWoO8k0HaNaUPb2gliyfRvkFmHS9VXV1MSkh1/HB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Can we just add kref for entity?
Or just collect such job time usage somewhere else?

-----Original Message-----
From: Pan, Xinhui <Xinhui.Pan@amd.com>
Sent: Thursday, August 17, 2023 1:05 PM
To: amd-gfx@lists.freedesktop.org
Cc: Tuikov, Luben <Luben.Tuikov@amd.com>; airlied@gmail.com; dri-devel@list=
s.freedesktop.org; l.stach@pengutronix.de; Koenig, Christian <Christian.Koe=
nig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/scheduler: Partially revert "drm/scheduler: track GPU =
active time per entity"

This patch partially revert commit df622729ddbf ("drm/scheduler: track GPU =
active time per entity") which touchs entity without any reference.

I notice there is one memory overwritten from gpu scheduler side.
The case is like below.
A(drm_sched_main)                       B(vm fini)
drm_sched_job_begin                     drm_sched_entity_kill
        //job in pending_list                   wait_for_completion
complete_all                            ...
...                                     kfree entity
drm_sched_get_cleanup_job
        //fetch job from pending_list
        access job->entity //memory overwitten

As long as we can NOT guarantee entity is alive in this case, lets revert i=
t for now.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index 602361c690c9..1b3f1a6a8514 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -907,12 +907,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sc=
hed)

        spin_unlock(&sched->job_list_lock);

-       if (job) {
-               job->entity->elapsed_ns +=3D ktime_to_ns(
-                       ktime_sub(job->s_fence->finished.timestamp,
-                                 job->s_fence->scheduled.timestamp));
-       }
-
        return job;
 }

--
2.34.1

