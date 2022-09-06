Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664585AF2CA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CF110E713;
	Tue,  6 Sep 2022 17:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F30610E713
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaMQM/WiKrR1Aa1PT3e/VDyLZzzYLoNW1SMvBVtj2p5JsWP1yUve28g89EYEhyNBpFrzF29b6Sjhx614oHGwoniaufHcSCSllLf5R+NpcdJdajef6M/MHDAxPzR+mBKdX2ra/4fROjiqWuwpeOkOUCr+dmSTzNkoJ7/8hKPk1nUjWTlOvNSs76Jk2+BsKMSTPM8nSYeG+7fOgydJzjSPL2O2aHJY4tLAM9ZJj3qBmhK43lOAfhSaB8kVPs0/Jsv9j6WSIvdYN3X1wVgUi8RT3f4CI/V99miQRb2UaNsNUJixXM9tlbB8rPDiqE5LX9pfR3miMetier859o4NYeUJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMtxfsA4SuHsZ65URCzPN9DCH1GWSKxmkYf18li45YQ=;
 b=jA68t5n1ygoHbt5uMWIZq2j5oRKC6qWe1TpOe2/FycvqnA4xxqz/cy3YjhE1ix9zlHIngf9qQByoed2B3glnb3zvN4+AZQ7x64KP9p1nCwH2Q8d8QAAuxWFWsXty3PI7htbFSmUw5363G2yw8eO5b2pI6dT8ZlPhiu6Ql6r1VxyyUiB3ddLf2PqYAFI4zWF1VIDpLMtasPzhutKzQTaAYpIebfW+2gPA8yZvL9AGGPnKgjzkpEepiMRHqnkn4+qsNYDzzpXTshCkRSmeTo6ScA3nOD66MB4cpY1A+U97DZtP6q2tK/Z2UjY0QoecMSNqUQmN+wavCxgY6GMC8AP+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMtxfsA4SuHsZ65URCzPN9DCH1GWSKxmkYf18li45YQ=;
 b=4fMan0m4Qv3bz62AUAbGsJGNNJIUVXMd48mrtZQ7gT/MjCuI2jfkIbmdj82qCuFdaTaSYUaNyVW8ed1itYTZiBqgyPEr9rF0fr2NH3iC1S//q804qeNG+tWl1YonKHw+45fa4YkiH8wqaNYgMLCQxI7HxW0ROPPxabx8BVQg8xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by SN7PR12MB6815.namprd12.prod.outlook.com (2603:10b6:806:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 17:38:36 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:38:36 +0000
Message-ID: <ddde170c-7f2c-d9bc-7044-4c609bc915b5@amd.com>
Date: Tue, 6 Sep 2022 13:38:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220404213040.12912-1-rdunlap@infradead.org>
 <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
 <e61a6903-550d-df70-6297-f49cc2750244@infradead.org>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <e61a6903-550d-df70-6297-f49cc2750244@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::16) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9905fd99-1fc6-45c5-053e-08da902ea01b
X-MS-TrafficTypeDiagnostic: SN7PR12MB6815:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WroCuaEcKCJiAk+gQveFXJYMyZOt6BIA2zybk4WS3RbkIApWKUfa5sIZ9pMeRSPiDdvgkmSTEhiefGl7E9pr7L11WbGe+gvPkpPj+omzzWjN9GoeDzSKJlrCYLdinaLXJOBQmVWTAdQW/adBl4YYj07f5O3uyA/Bk1l51hO2WN4axUPbR8ALBjsjV4PBlbjl5L67eRvgFVsEKfwXvGYxG9gIMibDPaYnzKqyNTfFMJxpS86hzDiOV2mN7Xe0/jsUw0Iuozde//iqtdXE4rB4Qm7dO/xCTtRwDRvQ/epHSVC2utiTNCXPymfCihJv9pG6nlZZ/MGOyyJlhfmRwOH/5hLN5ROv8GfyX2aDSyjOcxFezrwkkaCG2nvlbr8z6MxRHf9h52/rNf+JquFQC20v0WaX/u4BsxVllqcVQu363euaULsM8ih7hChtiXl5VUqykRA4/6Kd2kVsMFbUl/KNngN9KYdM0k52q9ZadqePjZLDU7KWzmmayeJ+2eP9T0icpYIjXmv/weldmDHlRl+IFaTCSWSf9Nkkcs0XGLdKUbeCnXkGobbGvwMBPosR8qhC9tQnNRgKcA6Eb5GbgYekyn7cd39bMfMbjQ0XRbH0wiWnxEenq8tz38VXvLNXJVOfsCST+d8k6/io04zsjCddM7ucjzDiHIVBB56wmusddum89B3iVOyuqFlpTmNHw8gtKXmbJj55IzFWScy2jdmIOTfAcoB3LvouqmDLUXgODImuDI0+Jz//HQsrwVR3qkebVwdDWlhWaoZORcTM+oIg+8h9KfcxDyGOvJe7qNd3sKVDUKZhtXJxTo8t68J+Ma567J4BsHmzricfCpkGvQ/jfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(4326008)(83380400001)(8936002)(6512007)(6486002)(478600001)(66556008)(8676002)(316002)(66476007)(54906003)(84970400001)(5660300002)(44832011)(2906002)(66946007)(31686004)(86362001)(36756003)(31696002)(53546011)(38100700002)(2616005)(186003)(6506007)(66574015)(6666004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDc2NlRsSWpmd1ErUHpXVEF5YzV6czA4YnN6bFpSVnFjZ2ZMWXFvL2dnUGVK?=
 =?utf-8?B?Y2ZFUnExRUZPaFVnbHVsY1hTWWZBZ1oxT2lNOXJYTnA5WG9aVEdESkJiSDFX?=
 =?utf-8?B?NXJDQldZSS9zcktZZ2JHaytiMFFoQmRWMUE4RXhlakNxZlM4Z1BScit0QjZP?=
 =?utf-8?B?UWowUWlOQ2llQTQwWTE2OXlTRGVzcUY4cHJMU1Vtc1pmMUo3TU41b2sxZXNo?=
 =?utf-8?B?ZDdOcmViaGxqWFl0RFhFZXdDSVB3SXNGWXZSdWIrcE5KVjVRYkFxSFVSTWcy?=
 =?utf-8?B?N0FBMkQxOXMrWTAvT0dmRHlJTys1eS92YVlMd1lqeXg3Z21SYm9CNW1RZVRP?=
 =?utf-8?B?Q3NoMGZXNGRrVW1rUTBTaVRoYS9oU0JDL001eHdIYTdtemVWMTZmN3ZpUmVF?=
 =?utf-8?B?RVNySnhlR1NEbGpnQWU1ck5WUy9BbSsyblN6MHFETm01QS80QjdqOHo3Qkpi?=
 =?utf-8?B?ZXdEQ2NmSFpIMFFyMnIybFg1MzIwcmd4NzNOK2l1TzBpdXV1dGJvY2lMTENS?=
 =?utf-8?B?K3FNVTMxcXUwZjRQWjZ4cnFWbXkydXVlTTE3bHV5NHY4VkNwbkdhdVQ5cEFP?=
 =?utf-8?B?ZEpBWnV5aFB0RDltdmR6Q3MwRnlFTC9EU25qODFkQkg5eEVEcDUxZTFHeXZP?=
 =?utf-8?B?VC9zKzdMYWxyMVN3NFVpQnZGN0NmTW5WbnVIV0J3aHpOTm1QQ3BDekRRTC9G?=
 =?utf-8?B?MS96eWp4dGt4TURFWmtCWURhN2JoNFJzWFdZb2VMc2J5bmJGT3ZLNjEyc2d2?=
 =?utf-8?B?N3VuYlVuU0NMVCt1MFhzMFFmK0k2UU1BSzNocDdHcCtiUnhRV0FSdHIzN3Rz?=
 =?utf-8?B?UzN4eDdkbVQ5Vys2ekllcWZ0ekNGWnNpNEJxbW5UaitSTWpuM2UwNWk4ODZy?=
 =?utf-8?B?bzdUR3ZQY0o5SlpjSnNxWVUyS1U1N2g1UlprSmNSVTY5dFdGVEpXQmRPQXNt?=
 =?utf-8?B?aWVjZW1zWDBWbEFXUDdYTm5obHBUNW90NkdnS0Rjd1pDVldkOW5TWjJtSnNt?=
 =?utf-8?B?clB2MjY4MW1Sa1NoNlp6eVlyUlNORm13dTdoSFJFaC9BT2N3NmFkUk4vdThV?=
 =?utf-8?B?Sk5QYWNET1lLMXloWmd5RlhLb0ZlbC9QL0t6TkU1d3F3TmNCRWRyL0tZTXNv?=
 =?utf-8?B?NW1QQUNQSmlHNFROK2x4ek4yZTZJK2JKNmJuOW5ZcUNqQ2hxU1lSUDFzeVJm?=
 =?utf-8?B?WGEyTmx1ZlQyV1c3Z2s3VlZ1Zit0K0d2OCtaYU5hRWZ2NEtGK0tObE1SZTY4?=
 =?utf-8?B?V0hQMGRWYmR0MThuRnJscmlwdGFESXVWdDJzZ3k2N0E5OVpqVDc3VnkvZ3VX?=
 =?utf-8?B?cE1HWCs0R0NremJrSmpWVGZFSVg1SmtLV01DRnZ0bzJlNXBkQS9memdGUXNi?=
 =?utf-8?B?L2s1YU5ScElkOTkrT01EUDVobElkKzl5TWF0OENuTS9XWUd3MUFEYVY5M0dF?=
 =?utf-8?B?ZSszZENPdExDZHFSajcwaCt5WFRGaExYNzJiWnN2SGRteGZRRUlHbEliaDR1?=
 =?utf-8?B?T0FrZlhkMlE0VDN1NHVhZ1FMYUlVSlAwa28yNGNFQnd2c3ROb3E5UnByTlhk?=
 =?utf-8?B?TWpweHVFbGdoTU92cG9HZGVLSG9IK3Nob0hac2ZDQXRsamM2RzJ0VVlUbWpS?=
 =?utf-8?B?Ukl6Ry8rTURiL0RuZk1YTEV2cmhuNnhXV2tYMG00SEphM0YwdzB0QWhFeXRB?=
 =?utf-8?B?eGtZOFZCUDM5Ujl2TGlMdW41M3ZUT0ppUVpGL1AxZjU0SjV4Q2o2WDFQSGl1?=
 =?utf-8?B?NWE5Z2x6MmR6b3lLNGtJOHRuUlpoNEpQTkNrLzFENTQzNWZ6RGU3WFB0eWVx?=
 =?utf-8?B?akNGQU1UREVmZ1E4VzJaRXVDV0ZCdGVJc3REL0JqTFhXSFdGREV3bW5ldGZF?=
 =?utf-8?B?bmUzNXBiVElXNHJYNW9SS3VrSnNGVWtQSTZ4byt4aktJN2E4cTlvdkhOcXlS?=
 =?utf-8?B?UEFta0VmS3ZiV1U2VldxMG9MQU5XRHdXSk00bHIrMWEvL3F6S0h2UUJzUFdU?=
 =?utf-8?B?ZDVJYnpiUHZ0dTNKUFVVZWJjUXZZck1IL09EV1YxUVZMeFk0OGc1ZkZnNmRr?=
 =?utf-8?B?ZjAvZk9GOTBJSWRnZU41L1krek1SU2FwQXFmOVhRVjJCdHJ3NjFlZjVsdTVy?=
 =?utf-8?B?Z3ZCYzFqL2JVRUpzbHZzYVNnWUprMFZVYnBvSk12dWZ3eWtqeUs1cXJlSC9x?=
 =?utf-8?Q?PcVsC+ImK1BOCtYuMuFlZcSV6RABiAB5cTgvUJVv2NJA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9905fd99-1fc6-45c5-053e-08da902ea01b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:38:36.0054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P812I/aeaIvrtiVLC/ZSH1RvhH6HbvEGxUJa62KHktprLSq9d3zFoqLSl2rS3MmcGu1UT2HdVfq0IEv6VGnK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6815
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
Cc: David Airlie <airlied@linux.ie>, Jiawei Gu <Jiawei.Gu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I RBed, see bellow.

Andrey

On 2022-08-31 14:34, Randy Dunlap wrote:
> ping?
>
> On 4/4/22 14:58, Andrey Grodzovsky wrote:
>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Andrey
>>
>> On 2022-04-04 17:30, Randy Dunlap wrote:
>>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>>>
>>> Quashes these warnings:
>>>
>>> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>>>    * struct drm_sched_backend_ops
>>> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>>>    * struct drm_gpu_scheduler
>>> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>>>
>>> drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial short description on line:
>>>    * drm_sched_dependency_optimized
>>> drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
>>>
>>> Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
>>> Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_scheduler")
>>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> ---
>>> Feel free to make changes or suggest changes...
>>>
>>> v2: drop @work description (already done by Andrey)
>>>
>>>    drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>>>    include/drm/gpu_scheduler.h            |    9 +++++----
>>>    2 files changed, 7 insertions(+), 5 deletions(-)
>>>
>>> --- linux-next-20220404.orig/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ linux-next-20220404/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
>>>    }
>>>      /**
>>> - * drm_sched_dependency_optimized
>>> + * drm_sched_dependency_optimized - test if the dependency can be optimized
>>>     *
>>>     * @fence: the dependency fence
>>>     * @entity: the entity which depends on the above fence
>>> @@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
>>>     *        used
>>>     * @score: optional score atomic shared with other schedulers
>>>     * @name: name used for debugging
>>> + * @dev: target &struct device
>>>     *
>>>     * Return 0 on success, otherwise error code.
>>>     */
>>> --- linux-next-20220404.orig/include/drm/gpu_scheduler.h
>>> +++ linux-next-20220404/include/drm/gpu_scheduler.h
>>> @@ -328,10 +328,10 @@ enum drm_gpu_sched_stat {
>>>    };
>>>      /**
>>> - * struct drm_sched_backend_ops
>>> + * struct drm_sched_backend_ops - Define the backend operations
>>> + *    called by the scheduler
>>>     *
>>> - * Define the backend operations called by the scheduler,
>>> - * these functions should be implemented in driver side.
>>> + * These functions should be implemented in the driver side.
>>>     */
>>>    struct drm_sched_backend_ops {
>>>        /**
>>> @@ -408,7 +408,7 @@ struct drm_sched_backend_ops {
>>>    };
>>>      /**
>>> - * struct drm_gpu_scheduler
>>> + * struct drm_gpu_scheduler - scheduler instance-specific data
>>>     *
>>>     * @ops: backend operations provided by the driver.
>>>     * @hw_submission_limit: the max size of the hardware queue.
>>> @@ -434,6 +434,7 @@ struct drm_sched_backend_ops {
>>>     * @_score: score used when the driver doesn't provide one
>>>     * @ready: marks if the underlying HW is ready to work
>>>     * @free_guilty: A hit to time out handler to free the guilty job.
>>> + * @dev: system &struct device
>>>     *
>>>     * One scheduler is implemented for each hardware ring.
>>>     */
