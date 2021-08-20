Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863973F2758
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CA86EA0E;
	Fri, 20 Aug 2021 07:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3525C6EA0D;
 Fri, 20 Aug 2021 07:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LecV8F7P0mMJDx4TxuGblT+7WrSiUimbkTdfzqrBWlz1XwzlGVUVdlDqHsCywICK1pLloC2nmFwVxVRZEKXVyyma92WW6M6BpeP10xb4eDimtJEEEKYZJiBE8GdvPwDUqPsRFe/Ag06o/Afzx4LJGuypTxpiib7Ph6sYmBPirOUxLZ3K3aVu0/hC5d3QqJbac5LJXVQIJPPQ896j4VZ4fk9tpa7LQQOxizS/oNii1ZwkkFIYPHq0s1BwGMq9HleUNQLf3KiQ1FURI3/FePK985AwvYQY1O7gayv742fLZmcax5ndIxGRtxljEczsZ9W7E3AMfFq3u4qnDYAeAY76lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXVL3NXjOyq6/rrbxe0XLQie4l9C8SyMftLthw3a5Ng=;
 b=LlmOyNGc/RmzWypeC0kGKJy0NO4+fDSbrd4J4KwGTr9omss6na1XD5wI1kWos6t1L9Yp5liX1AgtyyKSTSkwfVSCmoCSGvIJL7bPFw97U2i9TUpX/7syRF7r9JFROjISf4j2aSSnmBsO8s89vr9cshAE8efufh/4Py5y7jfEO1Sr0IyGyArgelcuUutfzaKRuQC/VnqjJqe4BcCrEs7axPdbgrTAvdgcpaKNtyDR6NFG5l+GbOhhAiYXLgtgUzvqGmY1S/MaasmdNOV8LzHTnwm0mD1ovOe34hrPaRWZ2CLke5i6UXzM7y3yFii29BpR1vzwNznhI58mf0dTMcV6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXVL3NXjOyq6/rrbxe0XLQie4l9C8SyMftLthw3a5Ng=;
 b=EeCWQgL/mf+2nPoSNlhYcrJrBok7lN1a0vrVVzIqvTjSkET5CNXaXSwlsPmRut38VvWjIx2FViNjhnc6gy+DlZ6VnNGeOgZHN5glugSNG70SZ2fuC3bABc2K2LFrQoGN2NZ19oAduimVD5+JMmDNDAIEqTAr3/xaIOwQhg/96TE=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 07:12:59 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4415.025; Fri, 20 Aug 2021
 07:12:59 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Topic: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Index: AQHXlCM5tpADXUaHLkOoBAv6YPx0dat5SvoAgAAGzICAAAGgAIAAATMAgAAByYCAAAJCAIABOOmAgAANvtCAAV1rcA==
Date: Fri, 20 Aug 2021 07:12:59 +0000
Message-ID: <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-Mentions: daniel@ffwll.ch, Andrey.Grodzovsky@amd.com,
 Christian.Koenig@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-20T07:12:53Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e6ef5199-574c-48a9-8147-c533a670ce27;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bd16e84-02c8-480a-8c25-08d963a9f0f7
x-ms-traffictypediagnostic: BL1PR12MB5143:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5143B03503BB5D5D30EE4F0B84C19@BL1PR12MB5143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:374;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VeahSuAhwBmI2GlhmJC63Tp+X08nLSh9yyIAbV6ouHPgWOIN8SrN8JbfSTGc7K+9koq2E7FbdGRSmAgmD9UkWOC4/CgoJseHgh0FklvRwAut4fXyu1UQegcDbcy742V7RZ0TRWmJH7eoxCa2yvPtJO1GR/iNr1cn69pAiSWjF9I1mMxmlW5bQI/ZgL2kYTsiEpnX1ubpDaeo4OO1hW71jfa0/oxtDTIURsV/zepap8iKCVRX7oyVstg0Y8uH7zYBKk+TNBrQ+ZgA1Rye5THsGJrTKMZP+8viwB+cpQSZcZ2DFfNH50/psEAQFAliWOdWy/pqL37XJ87YB1IYqSDnvP+M6f9PMuWRO7mc16YbSJRCAzN6s44KZ1TFtwsIbZPaTPxQ94hj4pFLHAIMNX1m00pZKZcFnNlDy9TkpiLNUfuc+C8JxTBYvV7HRvNGgwfALnjVEsJgyPsDIjgj7nQlWFcRfbOVGbU5QluoEJ6oSMvVzTud37mKS3QVgYi7EtATzzWJGIN/rmv3pi6/SXTu9eyDb8ADRMwp94UTvD5xgj320SGWUjBK9Mi/7D79S6miUE+kfX3ViLnko8wgXk9mtx+H0yY1qFbXTOOtw/qeX+RR3Yg2QUsxmKl6BZcXxDS0eB/YQwt8t8z8utyVsDDI1OQ9IHiIfShX3E9H0VAnXCR0LaNch5BAGvcpmbSo3utZIMt8IediTb8vOdIIsu+jXjGCD3K5PR7Y1n05u8c7wodEQoPH7qffWv+yGvxPv9pqyzA3FPOBxyRu3+WQPNg5w/M9pLfY2wjNQAum+j7i/i4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(478600001)(66556008)(8676002)(966005)(2906002)(26005)(66946007)(45080400002)(76116006)(66476007)(38070700005)(53546011)(52536014)(6506007)(9686003)(186003)(71200400001)(6636002)(8936002)(5660300002)(83380400001)(7696005)(38100700002)(122000001)(33656002)(64756008)(66446008)(110136005)(54906003)(316002)(30864003)(86362001)(4326008)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FvEq4ZMDjloVlE1MIrxgx3QWAd5AH+k65y5Y6RxO6Rzer/QhKA0WS+KbDn?=
 =?iso-8859-1?Q?2QXnOu4KUSvqKVjGmefQU07HOxngcA+J+UhDL/x9shyUEYey9lNEgnv2hx?=
 =?iso-8859-1?Q?Xc/xvQB8vXyAtaQreTgNZk0MH+LCZ9KGMhe0/GVLH0z58s+Z91zh1Xmdhg?=
 =?iso-8859-1?Q?x642w7pdYLQN/GKHzjp2Hl90v53FnHpdH8QyT6r8KI3O0s/XkRncwWTGsS?=
 =?iso-8859-1?Q?OmqGWmFEPNY0Il0VaGJTGyLt6tdv4/AnpECklTyoexa8oW4fsB4TOPCh8y?=
 =?iso-8859-1?Q?X1PGQX7uGSSaRyOD+nzB1P3GbI3Xn9hiwTbcxlrSkF8ktSQOgeykKz6N+9?=
 =?iso-8859-1?Q?IguubNRVb8XZ4w25VXa6AeOeYbXuTU0VtFuXLX+TAkoYkqT0NxWw62NNG+?=
 =?iso-8859-1?Q?s6vUkHOE2seEQLjQWdGHQxKECSiRaSCExatxOTzREIs7vtERGBWKcDzEd8?=
 =?iso-8859-1?Q?HAWcaG7f1hQ25sE6XeJjp1cO3fsEpVcooqXE4q0MUe3xNqeaJj+pQHnC/I?=
 =?iso-8859-1?Q?5gRC71hzc/RLG8ce2g6rQMBCxeMkXvpJWwYhhPZL8y90C7c9Pe3U6bctat?=
 =?iso-8859-1?Q?1t4B4/jAmxA3ZMLXCqj8LQr1upPsZWGxTw7isVbQt6Dn7IDLw9htq59zCM?=
 =?iso-8859-1?Q?ykV4gQWAFkio2Fwqb3SMkSF4GqY0SytbBYMr+diKoFfifsjg824j7cB920?=
 =?iso-8859-1?Q?wX2FfgffhR2+RNDtR6XlKsGWeUX2lhv5OmmBEw31OH+vLaPWa1Mw6x8agH?=
 =?iso-8859-1?Q?8912mYj1kzn8sT6hE9n2YQoFLxNZKsQ7qkOF9wYk7a14aNzmGuDHjI3riW?=
 =?iso-8859-1?Q?c4kxo147UBHPL2zav8r2y6pGEOPjrzb/Uh4kvkscJp7o5ONR3VAU5EDrd2?=
 =?iso-8859-1?Q?VlQawTUalILwoeL8O317/7Beh7ShOgwp3zo0ZbQXxIpSfOqz2uqrL6bLV2?=
 =?iso-8859-1?Q?swC1a5M6m63A5KJGETnw9JYF01oY4DhAhmroYQTe8nKPsmdBGf6MS8S17j?=
 =?iso-8859-1?Q?8Wq4SIk8XLtrJ5h4li/f1zPcpMCWOW83aO4SPKuaWix3Gs3SLYu7laeW3B?=
 =?iso-8859-1?Q?FjK3ET9NnoFKrN6jPXYnyol7+m7vCNVHgVy9+n7sOcgD7ICbv58xzNoCom?=
 =?iso-8859-1?Q?YdO4eQ/ygGFOmbaEePtCO3zEwwg97E33+Gx6I3jA53xEzYtZN+QbKj9LVY?=
 =?iso-8859-1?Q?PO7Do2yt46wE1+YRRi5qFRU4G+VaOzVebm8ghWGYOD50ubInZrKdhwJWcm?=
 =?iso-8859-1?Q?jFD2IZzOMi2geo5eAmGNN4SJNXHUmvkjlAdOpopjdHayD0k0Fo4ffR6dfV?=
 =?iso-8859-1?Q?YpHJ9NB9M0pUxSYbXBJcPcH1CUqoZqddQmX4MZKUbVGwbUg1Ke+O/ppt1Z?=
 =?iso-8859-1?Q?4fiE/x6QPQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd16e84-02c8-480a-8c25-08d963a9f0f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2021 07:12:59.0883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhccfgnniuESPYi/pyiBHzgMBtRrSwDbQZgEoyn7kc9g2QbgrSTocptW7byKX+9Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5143
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

@Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
=20
Do you have any concern on the kthread_park() approach ?

Theoretically speaking sched_main shall run there exclusively with job_time=
out since they both touches jobs, and stop scheduler during job_timeout won=
't impact performance since in that scenario
There was already something wrong/stuck on that ring/scheduler=20

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Liu, Monk=20
Sent: Thursday, August 19, 2021 6:26 PM
To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsky@=
amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.=
com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-g=
fx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koeni=
g@amd.com>
Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad jo=
b."

[AMD Official Use Only]

Hi Daniel

>> Why can't we stop the scheduler thread first, so that there's guaranteed=
 no race? I've recently had a lot of discussions with panfrost folks about =
their reset that spawns across engines, and without stopping the scheduler =
thread first before you touch anything it's just plain impossible.

Yeah we had this though as well in our mind.

Our second approach is to call ktrhead_stop() in job_timedout() routine so =
that  the "bad" job is guaranteed to be used without scheduler's touching o=
r freeing, Check this sample patch one as well please:

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index a2a9536..50a49cb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct=
 *work)
        sched =3D container_of(work, struct drm_gpu_scheduler, work_tdr.wor=
k);
=20
        /* Protects against concurrent deletion in drm_sched_get_cleanup_jo=
b */
+       kthread_park(sched->thread);
        spin_lock(&sched->job_list_lock);
        job =3D list_first_entry_or_null(&sched->pending_list,
                                       struct drm_sched_job, list);
=20
        if (job) {
-               /*
-                * Remove the bad job so it cannot be freed by concurrent
-                * drm_sched_cleanup_jobs. It will be reinserted back after=
 sched->thread
-                * is parked at which point it's safe.
-                */
-               list_del_init(&job->list);
                spin_unlock(&sched->job_list_lock);
=20
                status =3D job->sched->ops->timedout_job(job);
@@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *=
work)
        } else {
                spin_unlock(&sched->job_list_lock);
        }
+       kthread_unpark(sched->thread);
=20
        if (status !=3D DRM_GPU_SCHED_STAT_ENODEV) {
                spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void=
 drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
        kthread_park(sched->thread);
=20
        /*
-        * Reinsert back the bad job here - now it's safe as
-        * drm_sched_get_cleanup_job cannot race against us and release the
-        * bad job at this point - we parked (waited for) any in progress
-        * (earlier) cleanups and drm_sched_get_cleanup_job will not be cal=
led
-        * now until the scheduler thread is unparked.
-        */
-       if (bad && bad->sched =3D=3D sched)
-               /*
-                * Add at the head of the queue to reflect it was the earli=
est
-                * job extracted.
-                */
-               list_add(&bad->list, &sched->pending_list);
-
-       /*
         * Iterate the job list from later to  earlier one and either deact=
ive
         * their HW callbacks or remove them from pending list if they alre=
ady
         * signaled.


Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Thursday, August 19, 2021 5:31 PM
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; =
Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-de=
vel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; L=
iu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad jo=
b."

On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>=20
> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> > On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > > > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > > > >=20
> > > > > > + dri-devel
> > > > > >=20
> > > > > > Since scheduler is a shared component, please add dri-devel=20
> > > > > > on all scheduler patches.
> > > > > >=20
> > > > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd=
.com> wrote:
> > > > > > > [Why]
> > > > > > > for bailing job, this commit will delete it from pending=20
> > > > > > > list thus the bailing job will never have a chance to be=20
> > > > > > > resubmitted even in advance tdr mode.
> > > > > > >=20
> > > > > > > [How]
> > > > > > > after embeded hw_fence into amdgpu_job is done, the race=20
> > > > > > > condition that this commit tries to work around is=20
> > > > > > > completely solved.So revert this commit.
> > > > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > > > v2:
> > > > > > > add dma_fence_get/put() around timedout_job to avoid=20
> > > > > > > concurrent delete during processing timedout_job
> > > > > > >=20
> > > > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/scheduler/sched_main.c | 23 +++++--------=
----------
> > > > > > >     1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct=
 work_struct *work)
> > > > > > >     {
> > > > > > >            struct drm_gpu_scheduler *sched;
> > > > > > >            struct drm_sched_job *job;
> > > > > > > +       struct dma_fence *fence;
> > > > > > >            enum drm_gpu_sched_stat status =3D=20
> > > > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > > > >=20
> > > > > > >            sched =3D container_of(work, struct=20
> > > > > > > drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@=20
> > > > > > > static void drm_sched_job_timedout(struct work_struct
> > > > > > > *work)
> > > > > > >=20
> > > > > > >            if (job) {
> > > > > > >                    /*
> > > > > > > -                * Remove the bad job so it cannot be freed b=
y concurrent
> > > > > > > -                * drm_sched_cleanup_jobs. It will be reinser=
ted back after sched->thread
> > > > > > > -                * is parked at which point it's safe.
> > > > > > > +                * Get job->s_fence->parent here to avoid con=
current delete during
> > > > > > > +                * processing timedout_job
> > > > > > >                     */
> > > > > > > -               list_del_init(&job->list);
> > > > > > > +               fence =3D
> > > > > > > + dma_fence_get(job->s_fence->parent);
> > > > > While this is true for amdgpu, it has no meaning for other=20
> > > > > drivers for whom we haven't done the refactoring of embedding=20
> > > > > HW fence (parent) into the job structure.
> > > > > In fact thinking
> > > > > about it, unless you do the HW fence embedding for all the=20
> > > > > drivers using the scheduler you cannot revert this patch or=20
> > > > > you will just break them.
> > > > btw, why did you do that embedding? I do still have my patches=20
> > > > with dma_fence annotations floating around, but my idea at least=20
> > > > was to fix that issue with a mempool, not with embeddeding. What=20
> > > > was the motivation for embedding the wh fence?
> > > > -Daniel
> > >=20
> > > The motivation was 2 fold, avoid memory allocation during jobs=20
> > > submissions (HW fence allocation) because as Christian explained=20
> > > this leads to deadlock with mm code during evictions due to memory=20
> > > pressure (Christian can clarify if I messed
> > Yeah that's the exact same thing I've chased with my dma_fence=20
> > annotations, but thus far zero to none interested in getting it=20
> > sorted. I think it'd be good to have some cross-driver agreement on=20
> > how this should be solved before someone just charges ahead ...
> >=20
> > > this explanation). Second is to exactly revert this patch because=20
> > > while it solved the issue described in the patch it created=20
> > > another with drivers who baildc out early during TDR handling for=20
> > > various reason and the job would just leak because it was already=20
> > > removed form pending list.
> > Can't we reinsert it before we restart the scheduler thread? It=20
> > might need a separate list for that due to the lockless queue=20
> > tricks. Or am I thinking about the wrong kind of "we lost the job"?
> > -Danile
>=20
>=20
> If you look at the original patch it would reinsert it even earlier -=20
> right after stopping the=A0 SW scheduler thread, and even then it was to=
=20
> late for some drivers as they would decide to return back from their=20
> TDR handler even before that. It is solvable but in an ugly way as far=20
> as I see, you need to require each driver in his code to put the job=20
> back in the list if they do it before reaching the place where=20
> scheduler framework does it. Kind of spaghetti code seems to me.

Hm yeah I didn't realize this all happens before we stop the scheduler thre=
ad.

Why can't we stop the scheduler thread first, so that there's guaranteed no=
 race? I've recently had a lot of discussions with panfrost folks about the=
ir reset that spawns across engines, and without stopping the scheduler thr=
ead first before you touch anything it's just plain impossible.

I'm also still not understanding what exactly you guys have done, can someo=
ne please dig out the the amdgpu patches that motivate all this maybe that'=
s clearer? A full explanation would still be good since I've only started i=
n scheduler stuff.

Another thing I recently pondered for tdr races looking at i915 code is whe=
ther the tdr should first block the completion fence for that job. My motiv=
ation is to have a race-free error capture (if the completion races then we=
 might start evicting memory and everything goes boom), but maybe that help=
s here too. Some kind of atomic "block this fence from completing thing.

Or I'm I completely guessing in the wrong direction?
-Daniel

>=20
> Andrey
>=20
>=20
> >=20
> > > Andrey
> > >=20
> > >=20
> > > >=20
> > > > > Andrey
> > > > >=20
> > > > >=20
> > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > >=20
> > > > > > >                    status =3D
> > > > > > > job->sched->ops->timedout_job(job);
> > > > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct=
 work_struct *work)
> > > > > > >                            job->sched->ops->free_job(job);
> > > > > > >                            sched->free_guilty =3D false;
> > > > > > >                    }
> > > > > > > +               dma_fence_put(fence);
> > > > > > >            } else {
> > > > > > >                    spin_unlock(&sched->job_list_lock);
> > > > > > >            }
> > > > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct=20
> > > > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > >=20
> > > > > > >            kthread_park(sched->thread);
> > > > > > >=20
> > > > > > > -       /*
> > > > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > > > -        * drm_sched_get_cleanup_job cannot race against us a=
nd release the
> > > > > > > -        * bad job at this point - we parked (waited for) any=
 in progress
> > > > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job w=
ill not be called
> > > > > > > -        * now until the scheduler thread is unparked.
> > > > > > > -        */
> > > > > > > -       if (bad && bad->sched =3D=3D sched)
> > > > > > > -               /*
> > > > > > > -                * Add at the head of the queue to reflect it=
 was the earliest
> > > > > > > -                * job extracted.
> > > > > > > -                */
> > > > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > > > -
> > > > > > >            /*
> > > > > > >             * Iterate the job list from later to  earlier one=
 and either deactive
> > > > > > >             * their HW callbacks or remove them from=20
> > > > > > > pending list if they already
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > >=20

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d9=
62f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DJVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCM=
svwyY%3D&amp;reserved=3D0
