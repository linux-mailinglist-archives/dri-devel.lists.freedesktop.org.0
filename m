Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC84F18A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812F510E069;
	Mon,  4 Apr 2022 15:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5898310E069
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6E/KW6VL7wX0oqqvsu8QaecVCjCSqp3V2CHX++5VkuXGnsmHVqBmRTo88umyLOH7esnWjXoGvN/eDp4sUNvF6kQLIZ30tCOB1qQHprvyW/el2KbB32oGOKGnitE4Cr5DUGZ66tCz8gzxwOhECsshFcdKkBuCH6V5WqWz7mOZvAoYMN3jJR4mn7SvgWvkhDy2rhlUbeJknr34bdBsAUriigbVUUZQXcRj3lbSKp5EnufegCWtI0BYQO8Tkf5km7ikWQQpTPrlE0wSVZA2gBxhjlCI2JH9V282JWcLtlWfliroBAVYztLSY9SP7UkUW666+Fsuw2Qc47A1ejdYHe52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Xx22756VHh6036CISxjRUHhiv6nhkGwHk6xSPJ44/k=;
 b=jJXIBV9KHUfrK7DFeCyr0kT0Kvl9q0rKE2323gziYa495EJ0U9EpsOSCiA5ykG3zun0BFghBHvCSTxq+wpSq1ZJ3+Rxk4Fmhyy10k+rnWUcSswynT2fzuufxjGwBznLvJUSFcraHF5of3Xf0wwx6a30xpoCvdCILHaxJ6GXhZ0W6k/Dzz2evzvRx93zWMOimndNwwBCKtmYg3Mm0GzjdC5s4u3Pclokaw5DEeDFlpD/xQu/qfu5Odtc1jTyVycNwATskQbVSql6iUIyHg6VXiiXRvOwjvEbOs4+THABQa1PpotWIDeHTlZRQpvThajrLYtDcrM76gN3CYHg0ElzV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Xx22756VHh6036CISxjRUHhiv6nhkGwHk6xSPJ44/k=;
 b=O5UljscAQZmJm9kHSnxLhY6HT/CGluG5dyWkUQQwOLlFXOvfnInAPNdyANtVXWCfV1oAXOweg2Dj7RloG1p8s0MunkU2yEzU9PoaL3WEqo9qZQC2SYdfsGYU7mtIIb2qpYAEGvlEa6eh+0sXNJSgb3X/51zLZiIx2Jlb9CEw0ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN8PR12MB3571.namprd12.prod.outlook.com (2603:10b6:408:62::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:40:36 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:40:36 +0000
Message-ID: <15abd5c4-a92c-9ef7-32f3-a39ee3a9844b@amd.com>
Date: Mon, 4 Apr 2022 11:40:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220404042509.13455-1-rdunlap@infradead.org>
 <6f89be90-50fe-729c-028c-978044e6840a@amd.com>
 <db007d26-95d0-ff59-788a-0339d119224e@infradead.org>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <db007d26-95d0-ff59-788a-0339d119224e@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::18) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80887a12-8e9e-4e76-a665-08da1651762a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3571:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3571F5DB86271A6EC47C150CEAE59@BN8PR12MB3571.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3CXxKxvTNUX/NoE3+KPTct58Fi9yGsDZH8TpE3ps81T/IXFUvG3DyMpy8fw458gGTBP6HqYDiLDsXkAsnKQQIHw0zMRy2rtwIlXTFNuESaHZKJ5ilZYaf7GQ6AzQ4QNRQa4WA0zblvj7XTiIHV/yME6Twi5xQhq63SzR+Kqb7ZO1F9Fch2uxgJa65mefwy63D6UlCyIGooQGd+xM1eGrCJdjuqgAUdlxX12WufORAJ/hOs5P/n1hTyoXZFSPx00GaMVkDtvyKy+sllCLe5pWnsZ5b3PLGq8nxjo0PnwJ+0TzbWNYBKTf1PLEotNyScmiKGGSGWrJQTmKaGAUWBXZWrabKw9kEf87fxhbUVA7Mtv6R7pDLBMlqkwIL9UF0F57zfwlhLusBGV6URBEz8GF5Pp1e+Gd+QB7Cg+DS1hIJ0M5XwiiwU6ad2JHmPGivC7+GVwro/LcBgCrPklDSi3LiRl+Du6hl4PoefU2/P6cD+m7kE4nT1IijIz+FWV28uG1bmOnNOjgVnL3kwJKCIOaQ1VC+ppG+q87lE7UP8Hq09swpjv972dCalo20EN/LhGwWTF4mL8j8S4Qh5KFd9YlF98WTPnmdpmWhXJJPF/jx5lYNx9SiJBssGMN67JK1jWLuD5PToNJHPRPrFL+NHk3yyLJS4LUtOckAHt+Th/lrf4bQRay6XrhFNoFsLmU9l8kLGkW/kdUT0ui60nGw44Eev+kri/wIKlAiFUaJUSbmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(6506007)(6512007)(316002)(54906003)(2616005)(53546011)(36756003)(31686004)(6486002)(508600001)(2906002)(38100700002)(44832011)(4326008)(8676002)(66946007)(66556008)(31696002)(84970400001)(86362001)(66476007)(66574015)(6666004)(83380400001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjV0a2p3NkpTRGk0ZDRueXpqcnpTcUNNdmc5M1VMU29qdjBHV3ZWa1hYbVBL?=
 =?utf-8?B?eHVlNmdiMi9QVnpqL00xc2J3RS9hNCtGRUFQazd2cUhnWGx2c0U1SExGZ1hT?=
 =?utf-8?B?MFBzanhuc05NRVhqYS9UVzhBUW4yZWhkckRDVWYvdHB0dWhyUmdEUjFDK2Q4?=
 =?utf-8?B?TGhEdFJKUFVrZjB0VWVnbjZoMFFmckxvTnkvOGkrc0NSUHA1cTdnV2lLeE53?=
 =?utf-8?B?TTJsbnBPUWVpWXpQQTNOcndKZC8wQnVSaitxeHVjNzFUazYxcVNRUktPdmpH?=
 =?utf-8?B?UnFnQzFNc09wNFFreFN2cXNYR1V1OUxLZTd2R2NmOFF1TnhQMlZZd0g3aGxa?=
 =?utf-8?B?cEdpUW54a1FDbU4yRktBVEVWazM3RXQ4eHp1RUx4NW1qbUx3UkdxcGRVTms1?=
 =?utf-8?B?VFptTTQrdVJFclRQRVZQOUhFYWc3bXNyYUdSdW1CRDQvOGR0TGwwYVo0VEpR?=
 =?utf-8?B?bExvUFBHZ2hPbng4UWRWb1lWWUx4eURRcmczVWhZUmVlRDNHcjVvdWF2STdt?=
 =?utf-8?B?S2VuU2N5RFRPd0VRNHc1bEZGNTZIMGEyTnJTVmQ2b3pqRzAwYkYySjNPY1Bt?=
 =?utf-8?B?SkYvR0FBbzRvRTFBTHNHdVZtMGhiaTREeHBWOUI3b09RcERnWFptejBTeTF2?=
 =?utf-8?B?UzdpRkRMaVE4SE1DK0FOUmVnQmJvREdTY1R2aHpucWJtb1NZd3VjTXJvQ0NR?=
 =?utf-8?B?UkgrcFM5b2dDWUFzcjN5emNqKzlMSWwyd3RGVUkzdXdlMkJGdkhzR1h2alQx?=
 =?utf-8?B?N0JJZnJGUW1GL25SNHVHNzVQUWYwUWV1MlFJNVo2TUI0cXZRNTdrT0NnWWdJ?=
 =?utf-8?B?K3ArK2xqWG9ZZmlFWW4vaFNNSmVvMU93Ty9Wa1ZMYkw2RExPMDBZYnprTHNP?=
 =?utf-8?B?U2xHWE10VjB5RU9XSlJLVC9mQlBXM21naDFQNkJSUHRFVUpzYTVHYW9kWFh3?=
 =?utf-8?B?Umg0cFhHZWZCK05NRUxORk9wYkRXZHF3ZkFmaERQSlpDeCtwWGs1NlNITkQz?=
 =?utf-8?B?OGg0aCtEYXVQcWdxemhUeVRUNnF1dlBzQXlVNXg5VmRnN085TC9ORnpCMkFD?=
 =?utf-8?B?cUlVZ05xaWZIVVZWRTNabGd1cnh5UUpZSXM5cXpNekVJUGtMd0VpYXZNbXM3?=
 =?utf-8?B?b0h0NlNHUGx4Ry9hSFQrdnVhRzdxOVlLSjllMmNmUExlNmhXSVNVS01na1BN?=
 =?utf-8?B?VHN2TmJqeUg4cko3NEVvd0dzZGNOQXJZaWJsNVJsWHlxN3FzYWV5QlFseExF?=
 =?utf-8?B?bjhIZ2FFR3ZoSHFiQXNRdDk4TGhzODQxTUNuVHlHRUN6ZnZGTEZsK0F5Qm9v?=
 =?utf-8?B?Wi9UY0lxNm9IZ2JaOGhob1pzYjFreWZXQTlrMkl3YUNrbWc2NThqU3I4Qllr?=
 =?utf-8?B?SjZyWU0ySmJYblJVbjQwbHBwNC9nRTB0bUtEQ3FqL1c0Zk16MlFGalExakFG?=
 =?utf-8?B?VURqSGZadzZVZk5oRkk3NnpXZHg2MTRUZlh2SzBGVEJMNkx1WHhIK0hGa1VB?=
 =?utf-8?B?QmhSWEdXZFFnNS96SFdkNWQ5cXJJTExENjMxV0NhVWdJNVBJTmp1Y01nWTd5?=
 =?utf-8?B?c0JabzQ0REJuVGg1a0lnSEs0NWNsbzNKSVArRW0xdW9BWTJuZDJiYytCVXlM?=
 =?utf-8?B?S3B3VGFjTE8xTHp5VnBhRFhjMmtqZE1vMEtnZytySWZLcHpGYXhvZWdEMTc5?=
 =?utf-8?B?ZkdOeVpIVzFoVHJWeUl2b0pjZWxGa29salRxclFNOHBMb3EwM2RCRi8yYXF6?=
 =?utf-8?B?NVNXcG1LMGhoaGxGczZaWmk5TkRqTEsvM0tJeWgzYkR1aUNRU0NCbkxkdlh0?=
 =?utf-8?B?M2M5c0VyOVlpTGRXRUV1eTI1T2orTDdsNGRRQ1dQUlVHNFJjcEZVVXhZRHY1?=
 =?utf-8?B?TmRnZjNybE54bUF3ZVpxclArc2h5SmN0bG00Q3kxL0VHQnlRWWxaUUpWQ09a?=
 =?utf-8?B?bElyemlCalhkUmxNUHgxN01RWEwyUm45U2tCenBuY2pWTG9UcWhKWnh2Z1J6?=
 =?utf-8?B?c29KUnhqQ1J6MG5YbU9HTEI0WDhoSUQrb2tqWUhJOU1XOUl2ajlJTk93V0d3?=
 =?utf-8?B?ejd4bkJ0eG1uaUtZZ3FQcDhZZHdiczlBN1ZzdFRnVFhXbTVJeXk0NEVERDNT?=
 =?utf-8?B?NFI2SVk0ZkdEYVBxemwwalB6blgra2dTOHkvcDZmUVJtVERQK2UwZ3U5Rm1P?=
 =?utf-8?B?bU1hRVhYTEp4a09maFBhUmcwSk5VNkJzZ0cyOUJReWVmVkZmMlFWaUFwNWZM?=
 =?utf-8?B?RC9IZXdFWFJZTzdmalVtTWZIRldSd2MyMFZDN05zZTlVNVA5dUNqaG0yWk1o?=
 =?utf-8?B?M0QzS1Boa1duUkZwNTdyVW8rL2oxYXZIR01CMkJWaVVBV1JQSEpSTGFsUUJV?=
 =?utf-8?Q?YDX6e7loAkZKunlGPRWG5Sg0TNVF8sO1lpQ9vQc60juqh?=
X-MS-Exchange-AntiSpam-MessageData-1: HIVCzeW3DAYNNw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80887a12-8e9e-4e76-a665-08da1651762a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:40:35.9202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcX2xaX6NxvIpQdkuAw8if6wbtGHtUVHntNpULL+lL6bUEveY4R56iBLsVyObqp4PrPLSNxjSJfVUVavU8Xi6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3571
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

Seems to me better this way to avoid merge conflicts ?

Andrey

On 2022-04-04 11:33, Randy Dunlap wrote:
> 
> 
> On 4/4/22 07:34, Andrey Grodzovsky wrote:
>> On 2022-04-04 00:25, Randy Dunlap wrote:
>>> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>>>
>>> Quashes these warnings:
>>>
>>> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
>>
>> Looks good to me except one point is that I already commited a fix for the above warning to drm-misc-next.
>>
> 
> OK. Do I need to send a v2 without the header file fix?
> 
> thanks.
> 
>>
>>> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>>>    * struct drm_sched_backend_ops
>>> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>>>    * struct drm_gpu_scheduler
>>>
>>> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
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
>>> ---
>>> Feel free to make changes or suggest changes...
>>>
>>>    drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>>>    include/drm/gpu_scheduler.h            |   10 ++++++----
>>>    2 files changed, 8 insertions(+), 5 deletions(-)
>>>
>>> --- linux-next-20220401.orig/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ linux-next-20220401/drivers/gpu/drm/scheduler/sched_main.c
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
>>> --- linux-next-20220401.orig/include/drm/gpu_scheduler.h
>>> +++ linux-next-20220401/include/drm/gpu_scheduler.h
>>> @@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fen
>>>     * @sched: the scheduler instance on which this job is scheduled.
>>>     * @s_fence: contains the fences for the scheduling of job.
>>>     * @finish_cb: the callback for the finished fence.
>>> + * @work: scheduler work queue
>>>     * @id: a unique id assigned to each job scheduled on the scheduler.
>>>     * @karma: increment on every hang caused by this job. If this exceeds the hang
>>>     *         limit of the scheduler then the job is marked guilty and will not
>>> @@ -328,10 +329,10 @@ enum drm_gpu_sched_stat {
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
>>> @@ -408,7 +409,7 @@ struct drm_sched_backend_ops {
>>>    };
>>>      /**
>>> - * struct drm_gpu_scheduler
>>> + * struct drm_gpu_scheduler - scheduler instance-specific data
>>>     *
>>>     * @ops: backend operations provided by the driver.
>>>     * @hw_submission_limit: the max size of the hardware queue.
>>> @@ -434,6 +435,7 @@ struct drm_sched_backend_ops {
>>>     * @_score: score used when the driver doesn't provide one
>>>     * @ready: marks if the underlying HW is ready to work
>>>     * @free_guilty: A hit to time out handler to free the guilty job.
>>> + * @dev: system &struct device
>>>     *
>>>     * One scheduler is implemented for each hardware ring.
>>>     */
> 
