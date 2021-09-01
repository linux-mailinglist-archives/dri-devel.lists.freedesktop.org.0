Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB023FD208
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 06:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F166E048;
	Wed,  1 Sep 2021 04:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73589FDE;
 Wed,  1 Sep 2021 04:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLefnCLNEU3zH9KcxM6bpOUpobDqXQMjmy/dVYN8z3mDSfF40MkV4DhLmmVsLZsGL9o3THBMk1MsAa8m/8fvhxRaKZ3xlrTpb9j0BbautT097yLWTDnHHYCSWxBzGgnXxF7c6mfvYE0n0YulRiRAT9SFMHgQjplWZj9HYJDKBgFLr1VwUJ9brgXNxYYOpNmg288A5f6tl6QGE3fCA4NCjj7geLf8139XIFKWNXDH7+nQ4q6aCfsoFp/yFBKFKfIqfPm0wc/FkEAdYV5kDMvLnrGorScSQeiJHHvEgDsylSVdk817z4HcNQnwkax+1rmvnnhiN497dCRBoVO6CjdaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Kpp+18p/yZqiIswcebjaQW6mBQ+kt1KMbkYI2g7VuUQ=;
 b=ODknumz5UQEjjGwI9wV76LwCK/FggN1cJ3AJSkGI5h6MkGVvxX3FoEf4Renv+GRYWKBoy6DheU0/Akd2et7uImZzu+7o9WMlzVxhWgj85rpcNCWTU6BdMSSecXKaZlHKPQIigs7qmeq4vFb++E9hiopV0TswTnPeNugkTsXASRuWgO8eKKDnHybTFK3hkEM0GdaK9CxcccE1h+YChthDP894z8yVPJjehR0UkINh+UXBctVAtnVZTGORwIoCKw4NZkv5jMnE4FnhmzcTzF1OPUk5Mni97IhjLAA86lEWsnqhdhc5ZVdH6frIlisEARLzmRdCmJl8lUv8fniy0xbO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpp+18p/yZqiIswcebjaQW6mBQ+kt1KMbkYI2g7VuUQ=;
 b=lqG76vz5/UC3hapWD5hXmE7EV7jKMW0p+wDIvpQ9ADc6RcBph0SL0U5l2gqsarYbFdiC7iGjcn+AK1W/4zKkINLvqb5Hr7Kg/ZaiGEklwFOqdWkiNPH/wk83+5jd6exzHUXglAQm4aRq2vg99uxbUvEY/J+rgx7BnWLzjUaW/pg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2576.namprd12.prod.outlook.com (2603:10b6:802:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 04:04:50 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 04:04:50 +0000
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Chen, JingWen" <JingWen.Chen2@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <abf7b9de-67ef-25d4-a4be-11df93d2f799@amd.com>
Date: Wed, 1 Sep 2021 00:04:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------B3441C262FA1F04623829E59"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Wed, 1 Sep 2021 04:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb75e64f-1c1f-463d-5632-08d96cfda539
X-MS-TrafficTypeDiagnostic: SN1PR12MB2576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB257641AE2E24CE25B7884D61EACD9@SN1PR12MB2576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiYq8iap6ytWsn7DSWoSgIaP2/UjxxkKo/AmlTBwOOmDytNHrZb6njd221fHGtzz96ZyFKL2kiZ3XHfsyGwq8bwZtfJ1STRUOVmbhQv1RkHMGwrcNOISy8km+/CVoIhOAJO/AAyHSf/iqlLh5CYK4W4V3OccWLiNLCl/h5X0UbN9zigJbP3rk+MuIEwMBjoP1SZjioga2bhj22LMsAcAHTwIKIqQhH/nGLbXDGI680DqyVAgLuyI8/VWi6UUPWFba/BkJ3waYZqan3M3gJROk6SxPSiYrpHqknJV3bBp1YlFMIlKQJDDc/GZcDittrjsy4UOFaLE0IdBBMzoLI9QPcsVov3q17i+/r2NFwKjhOV7NQJ1gPhs2ttnaFzZAk2xHk2Xgi+m8fqWzV/D23eOf/S8t5E+yuuwx9CwCBamla9ngxGy3iPCC1JP9Vk3KWR/Pn5Ryvlewwr0aYzxP5bjy155MfB7zhCmBxTo6zymb8UPcZB37Pworz7S1fSabio4Xjc7Y6sJsQjgy8LAkhLHO9yOGIQgM0GAs3mVtUzR7YjYSKliH0krf1M1w/eyyBRRq8YcQ0DlSxZctpz7pqOnuuMXKyr29YR9xBRwcZzMV5qtY5k097oVHTYQASfQ9CB9Ke/klpML818J1wiY/YyjD/MEE2D5olI8nsAtgjG+9HjG5w4BkqZWWTJV1v75W0Xj06pr55WSVeNqqmwS/reYu2oHnp9yUQVqTlBrmGo/abc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(33964004)(31696002)(8936002)(83380400001)(8676002)(86362001)(38100700002)(478600001)(6636002)(30864003)(2906002)(2616005)(5660300002)(66946007)(44832011)(110136005)(4326008)(54906003)(186003)(36756003)(66556008)(316002)(53546011)(6486002)(31686004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtjOHo4Zjhyb1RTbzIvTlpnS2VQbEE0REFRcHJxeVFpNFIvT0l0SisxQ0gy?=
 =?utf-8?B?NStYZTNUZWtLbmJnVzg0bmF2WGJDUUVsSUtJMFZ3dlVUOXR4RkxRQnNlMHZW?=
 =?utf-8?B?czY4QXpNd3hWZWpSMXZlczUrNGZDdTBOd3VqUWdndnNBYXM2V2pCNVREbU1V?=
 =?utf-8?B?Yy9sWVlLWHMvbnBzb2dlK01JdzNDTGxJcVgyWS9xcXhpS0x4Y2hKZmI4UDJy?=
 =?utf-8?B?MEFxZzJpcTFLKzNhZHJqUVM0ekVKMTUrQWRsZHhIeGRzOFAvS3RPYzZqOUdm?=
 =?utf-8?B?enhaNlN2NEN0MnNRNzVlODlQVGhBR1V5dXdsaVBEVFYxbFZ6YXVlQzRPZy8x?=
 =?utf-8?B?SFpQR1l2V2RDUG9tZEVRSUpYMS9uYXpTemxGbkI0bHFucFo5M3JYcTVqdG5K?=
 =?utf-8?B?QkVvbnlEZGlPSDdYc0w0dlZrZ3BoaHZjSEhWbm1UTERKd0w5eWxUMkVQazJ0?=
 =?utf-8?B?NEE4ZS9FeWVqVXprMWR3c28reGJmV0t3SmdXdlAxd0lVcVIyZXdpVjRLdzNR?=
 =?utf-8?B?ZXF1UzArOTcwL1FpUGFOaFdVNnFnOTFqMXlubjAwSFB5TGNBN3d6SWhOOGdG?=
 =?utf-8?B?eVcwL1dOaEcwaVVqbVBKZC9sM3QrTTJqM25HUTRVTGtkUjY1aFZ4a1BEbnJr?=
 =?utf-8?B?N1I2OGs5V1JTVDJOY2NYMU5EV0tUV3pBakhqSUdJMXcrT09wUWptMEkxVHVK?=
 =?utf-8?B?UzhuVXhnYkRPdisyQ2Yrdm1OQmJXeUU4OTBPNXJtRWgzeUw0S0dZNVRLWmpz?=
 =?utf-8?B?Z2M3MVR0Zk1jN2h0MmZOTGQ2UjBkRkhoUSt6MDJNNzhjN0gwVEhVSUhyR0Q5?=
 =?utf-8?B?RDQwLzdQZWdISlo2ZmpTejJjWXkxaHExYlZCcEQzT2lrYVVPU0U2em5Xc1Bz?=
 =?utf-8?B?RVdNUXF6ZVVOMjNxVmgzSWR4dnZtbTB5VDBzQnc4ZDMwd201VDUyTHk3bDhQ?=
 =?utf-8?B?N0VUd00wUnVkL1ZlK3A2eW5HaGtKWWNVR3d3YS8yTW1oLzN6VjBVemMrVTRV?=
 =?utf-8?B?S1lkVGEzcjMzVnVTaG8xOFA4R3lDQXAxRzV6K05vZmpnblRiYzdpWkpiSTh3?=
 =?utf-8?B?Z0JXZEo3bklTQ1Y4OFRrdG5TK2MvV3pjdjE5elBJNE14Z2FrMHZORXZRaW9a?=
 =?utf-8?B?SElrUVdYTUhnMGplUnQwTGRUelV3K2lSNEVDK3R5V2tGV3VxVWs2NitJWmQ2?=
 =?utf-8?B?VkRwRzFETEVCZm0xKy8xQ004b0VTc3paRzlZeG9BcUxYdmlrZ1h0SW90QVVH?=
 =?utf-8?B?Z1ljUzBNaExmbTdHcVRmRm80dUs0eWVtY1hKMXlVSENERkc4eG9VRDZhckFF?=
 =?utf-8?B?cHBjbUo1ZStESFgzTWlVanNQNDdSeTR0UVVpMGhwZlJzYnJTM1g0UVNuOW1F?=
 =?utf-8?B?MjlzM3QxSkQrcWdGSXVJMFF1TWdsUVU3bURKTmxrNmJWRTlTRllxVDVhUDY2?=
 =?utf-8?B?Wm1jZWNGRXB0UHRIQ1FoUW50bzB5SGp2RWs3UFA1d3BtRGhFcEEwZnlTbTRk?=
 =?utf-8?B?Mi83bzVmRXZERFlzNWt4QkFTaklJM09scVFqSjR3eHQ5WlRlNU5Jc2wvS3pB?=
 =?utf-8?B?c0ZHRmVtc2VlaU8vUkFvc09TMzM5eUJjSlhJaFgrU3VNeFN3c2o1OGpBUWov?=
 =?utf-8?B?R251OFdVa3RRZnk2SCtuYnZGTUpPUmZ6ODR4bVlBQ1NrbWw4THRZUFk4N1Z2?=
 =?utf-8?B?UUNKazF4U0N6ek9OaXR2OXY2ZDRPUkFIQ0pnRTNVRU9PR1hMY0tpQW5sUmIy?=
 =?utf-8?B?MlRCRStFWDYvejBkUVVIUCtpVUh3a0oxQXRPdTlLSDlHL1RWUW5yRVovUjNx?=
 =?utf-8?B?WkhuR25JNDZRNGJqWkJHSkU4am5IM3l0ZDBqM2V4NjhraEdRVUJUbXZ5allM?=
 =?utf-8?Q?uqJSffDH/qXIF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb75e64f-1c1f-463d-5632-08d96cfda539
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 04:04:50.5479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVIySoWCW9BlHokgcOd6LXOK3Xbm2sjdVH2QKXnI43G16IFxInUhGWQq4nqCpYvszn2HkQdncG5+fNSpiSV+tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2576
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

--------------B3441C262FA1F04623829E59
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I will answer everything here -

On 2021-08-31 9:58 p.m., Liu, Monk wrote:
>
> [AMD Official Use Only]
>
> In the previous discussion, you guys stated that we should drop the 
> “kthread_should_park” in cleanup_job.
>
> @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct 
> drm_gpu_scheduler *sched)
>
> {
>
>         struct drm_sched_job *job, *next;
>
> -       /*
>
> -        * Don't destroy jobs while the timeout worker is running  OR 
> thread
>
> -        * is being parked and hence assumed to not touch pending_list
>
> -        */
>
> -       if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>
> - !cancel_delayed_work(&sched->work_tdr)) ||
>
> -           kthread_should_park())
>
> -               return NULL;
>
> But I suddenly have a question here: if return the timedout job no 
> matter kthread_should_park() or not, then we are backing to the 
> original problem again: that the timedout_job is suddenly signaling 
> and cleanup_job still returns it to sched_main and job is freed while 
> it is still handling by vendor’s timeout callback
>
> If we return NULL when kthread_should_park() in cleanup_job, we can 
> prevent above scenario from happening: once a job is processed by 
> job_timedout we can stop its scheduler, and after that even this job 
> suddenly signaled the cleanup_job won’t return it so sched_main won’t 
> free it in parallel …
>
> What do you think ?
>

Is your analysis above takes into account that you also submit
'[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then I 
don't see a problem -
I think that as long as you put kthread_park(sched->thread) BEFORE
fetching next bad job from pending list (under spinlock) there is no
such issue as in the case you describe because this potential bad job
that became signaled will be removed from pending list before you
even fetch the next job and by the time you fetch it the scheduler
thread is already stopped anyway

If you don't submit and we keep the removal hack for now then also no 
problem because
we temporary remove the job we fetch for TDR from pending list under 
spinlock
exactly to avoid this race


> Thanks
>
> ------------------------------------------
>
> Monk Liu | Cloud-GPU Core team
>
> ------------------------------------------
>
> *From:* Liu, Monk
> *Sent:* Wednesday, September 1, 2021 9:23 AM
> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey 
> <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Chen, 
> JingWen <JingWen.Chen2@amd.com>
> *Cc:* DRI Development <dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org
> *Subject:* [diagnostic TDR mode patches] unify our solution 
> opinions/suggestions in one thread
>
> [AMD Official Use Only]
>
> Hi Daniel/Christian/Andrey
>
> It looks the voice from you three are spread over those email floods 
> to me, the feature we are working on (diagnostic TDR scheme) is 
> pending there for more than 6 month (we started it from feb 2021).
>
> Honestly speaking the email ways that we are using now is not friendly 
> and quite painful to me ….
>
> Can we try to put all our opinions, suggestions, or even objects here 
> together, let’s go through them one by one, it’s too hard for us to 
> reply each email on different questions .
>
> For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
>
> This is a fixing patch on the timeout timer in scheduler, can we 
> complete this one first ? it should already resolved all the questions 
> and suggestions.
>

I have no objections for this one besides getting rid of the 
kthread_should_park()) return null part,
if my answer above is not wrong then it seems superfluous to me


> For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>
> I think I already explained the questions raised by Daniel in other 
> thread , regarding why I use __kthread_should_park()
>

Is this race free ? Can't the other thread execute kthread_park after 
the check ?


> For other aspects, can we put all our opinion synthesized here ?
>

So to summarize from previous threads I think that the best solution
to the problem being solved in this patch is if we do HW fence embedding
at the drm_sched_job level instead of doing it only for amdgpu, and 
modifying all
the drivers to support this we can both remove this hack and solve the race
against concurrent drm_sched_cleanup_jobs job freeing just by taking 
reference
to the hw fence of the job at the beginning of drm_sched_job_timedout

If doing this refactoring for all the drivers is not an option now and 
you need a quick
solution such as the serialization you do here then take into account 
other concurrent
TDR handlers that might run, as mentioned before, without serializing 
against other TDR handlers from other
schedulers you just race here against them, e.g. you parked it now but 
another
one in progress will unpark it as part of calling  drm_sched_start for 
other rings.
So you either need a global lock or dedicated single threaded queue as 
Daniel suggested.
At minimum we should change cancel_delayed_work in drm_sched_stop to 
cancel_delayed_work_sync
to cancel and flush all concurrent TDRs and probably move it to the 
begining of the function, after kthread_park
and before we start playing with the pending list.

P.S One comment I had regarding single threaded queue is that in case we 
have multiple TDR
arising from same event we will proceed to resetting multiple times - 
something that with trylock
we mostly avoid today within amdgpu (see amdgpu_device_lock_adev and 
amdgpu_device_lock_hive_adev)
Daniel mentioned it's not a problem but I still haven't understood why not.

Andrey


> Thanks !
>
> ------------------------------------------
>
> Monk Liu | Cloud-GPU Core team
>
> ------------------------------------------
>

--------------B3441C262FA1F04623829E59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>I will answer everything here - <br>
    </p>
    <div class="moz-cite-prefix">On 2021-08-31 9:58 p.m., Liu, Monk
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}p.msipheadera4477989, li.msipheadera4477989, div.msipheadera4477989
	{mso-style-name:msipheadera4477989;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="msipheadera4477989" style="margin:0in"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD
            Official Use Only]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">In the previous discussion, you guys stated
          that we should drop the “kthread_should_park” in cleanup_job.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">@@ -676,15 +676,6 @@
          drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)<o:p></o:p></p>
        <p class="MsoNormal">{<o:p></o:p></p>
        <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_job *job, *next;<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't destroy jobs while the
          timeout worker is running&nbsp; OR thread<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is being parked and hence
          assumed to not touch pending_list<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt;timeout !=
          MAX_SCHEDULE_TIMEOUT &amp;&amp;<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          !cancel_delayed_work(&amp;sched-&gt;work_tdr)) ||<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kthread_should_park())<o:p></o:p></p>
        <p class="MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">But I suddenly have a question here: if
          return the timedout job no matter kthread_should_park() or
          not, then we are backing to the original problem again: that
          the timedout_job is suddenly signaling and cleanup_job still
          returns it to sched_main and job is freed while it is still
          handling by vendor’s timeout callback<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">If we return NULL when
          kthread_should_park() in cleanup_job, we can prevent above
          scenario from happening: once a job is processed by
          job_timedout we can stop its scheduler, and after that even
          this job suddenly signaled the cleanup_job won’t return it so
          sched_main won’t free it in parallel … <o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal" style="margin-bottom:12.0pt">What do you
          think ?</p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Is your analysis above takes into account that you also submit<br>
      '[PATCH 2/2] drm/sched: serialize job_timeout and scheduler' then
      I don't see a problem -<br>
      I think that as long as you put kthread_park(sched-&gt;thread)
      BEFORE <br>
      fetching next bad job from pending list (under spinlock) there is
      no <br>
      such issue as in the case you describe because this potential bad
      job<br>
      that became signaled will be removed from pending list before you<br>
      even fetch the next job and by the time you fetch it the scheduler<br>
      thread is already stopped anyway</p>
    <p>If you don't submit and we keep the removal hack for now then
      also no problem because<br>
      we temporary remove the job we fetch for TDR from pending list
      under spinlock<br>
      exactly to avoid this race<br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal" style="margin-bottom:12.0pt"><o:p></o:p></p>
        <div>
          <p class="MsoNormal">Thanks <o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">------------------------------------------<o:p></o:p></p>
          <p class="MsoNormal">Monk Liu | Cloud-GPU Core team<o:p></o:p></p>
          <p class="MsoNormal">------------------------------------------<o:p></o:p></p>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Liu, Monk <br>
              <b>Sent:</b> Wednesday, September 1, 2021 9:23 AM<br>
              <b>To:</b> Koenig, Christian
              <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Grodzovsky, Andrey
              <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a>; Daniel Vetter
              <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Chen, JingWen
              <a class="moz-txt-link-rfc2396E" href="mailto:JingWen.Chen2@amd.com">&lt;JingWen.Chen2@amd.com&gt;</a><br>
              <b>Cc:</b> DRI Development
              <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              <b>Subject:</b> [diagnostic TDR mode patches] unify our
              solution opinions/suggestions in one thread<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="msipheadera4477989" style="margin:0in"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:blue">[AMD
            Official Use Only]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Hi Daniel/Christian/Andrey<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">It looks the voice from you three are
          spread over those email floods to me, the feature we are
          working on (diagnostic TDR scheme) is pending there for more
          than 6 month (we started it from feb 2021).<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Honestly speaking the email ways that we
          are using now is not friendly and quite painful to me ….<o:p></o:p></p>
        <p class="MsoNormal">Can we try to put all our opinions,
          suggestions, or even objects here together, let’s go through
          them one by one, it’s too hard for us to reply each email on
          different questions .<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">For [PATCH 1/2] drm/sched: fix the bug of
          time out calculation(v4)<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">This is a fixing patch on the timeout timer
          in scheduler, can we complete this one first ? it should
          already resolved all the questions and suggestions.</p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I have no objections for this one besides getting rid of the
      kthread_should_park()) return null part,<br>
      if my answer above is not wrong then it seems superfluous to me</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">For [PATCH 2/2] drm/sched: serialize
          job_timeout and scheduler<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">I think I already explained the questions
          raised by Daniel in other thread , regarding why I use
          __kthread_should_park()<br>
        </p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Is this race free ? Can't the other thread execute kthread_park
      after the check ?</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal">For other aspects, can we put all our
          opinion synthesized here ?
        </p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>So to summarize from previous threads I think that the best
      solution<br>
      to the problem being solved in this patch is if we do HW fence
      embedding
      <br>
      at the drm_sched_job level instead of doing it only for amdgpu,
      and modifying all
      <br>
      the drivers to support this we can both remove this hack and solve
      the race
      <br>
      against concurrent drm_sched_cleanup_jobs job freeing just by
      taking reference
      <br>
      to the hw fence of the job at the beginning of
      drm_sched_job_timedout <br>
    </p>
    <p>If doing this refactoring for all the drivers is not an option
      now and you need a quick<br>
      solution such as the serialization you do here then take into
      account other concurrent<br>
      TDR handlers that might run, as mentioned before, without
      serializing against other TDR handlers from other
      <br>
      schedulers you just race here against them, e.g. you parked it now
      but another
      <br>
      one in progress will unpark it as part of calling&nbsp; drm_sched_start
      for other rings.<br>
      So you either need a global lock or dedicated single threaded
      queue as Daniel suggested.<br>
      At minimum we should change cancel_delayed_work in drm_sched_stop
      to cancel_delayed_work_sync<br>
      to cancel and flush all concurrent TDRs and probably move it to
      the begining of the function, after kthread_park<br>
      and before we start playing with the pending list.<br>
    </p>
    <p>P.S One comment I had regarding single threaded queue is that in
      case we have multiple TDR<br>
      arising from same event we will proceed to resetting multiple
      times - something that with trylock<br>
      we mostly avoid today within amdgpu (see amdgpu_device_lock_adev
      and amdgpu_device_lock_hive_adev)<br>
      Daniel mentioned it's not a problem but I still haven't understood
      why not.<br>
    </p>
    <p>Andrey<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:BL1PR12MB5269EB4E07A80EEB48A391DF84CD9@BL1PR12MB5269.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">Thanks !<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoNormal">------------------------------------------<o:p></o:p></p>
        <p class="MsoNormal">Monk Liu | Cloud-GPU Core team<o:p></o:p></p>
        <p class="MsoNormal">------------------------------------------<o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------B3441C262FA1F04623829E59--
