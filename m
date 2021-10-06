Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9394237DB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 08:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A6D6E504;
	Wed,  6 Oct 2021 06:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF36E504
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 06:12:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBRi67leMiosfuzvmThvEOIcVf0QCBM0c94aIiGYcMo1ajcYU8irdeDEsnOXFrKiM3eXk1zkYFpQ+5sy244oQ9sG3kX+e0CW9mdvOK2ZCJjutqdQp7E5lwRWiPVHo2qfouswxk8rpi5e6SCVDIlREcE/yL02HO2dm37H58+AxRB0B0vwiYgzVDHjeaY9LMnnX+fyGrEr6QM2Uhou5aO4sDn8DsjW/MITwb3P9V9U7ZHn3OTGk4oHpa2gqwreQsWFArGUiqRHg602iWaYYmhLJNPpHXCSuv7Q11WTnvewOhgZjcHAgHWuJedViQ+1DgeDJiyQ22uf21K3HYGuO8vmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vd3GtJ2gQTJRLaaFWI4Xt7iXq5HLNgTjBDhsrqCDoCQ=;
 b=gR62b0/TLruEUNjOfzpihJKA7YKBWXlp/vFCQ9cq9S6Fqh3dtss3Q9w0xiHG91Gy9pb6iPkML/1wT966nyjfX3fl8jDK5CqsG5OyM+GJdTlxVh0IzBlJUXrRQNrgVzEMcxYsSoPcTRGfC7Bmv8TMP2WofJ6mcrDGA6OFKrXyoseFK/HtYokZD++/GY0Jtn/I1R36rEkgE65eEpIkHPVIJflQHo3IYmmnG8ZDOICkFVUN5cD8oJ6L8SmzDY4BRXYsa/fBU/d1MqKqLu8cv6XcNXcq/IN9m0ckulBcdhrP7zbbOZ2obJBfeAKtT70us+CsiPIBo0CuJ+aVy3RCd36odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd3GtJ2gQTJRLaaFWI4Xt7iXq5HLNgTjBDhsrqCDoCQ=;
 b=5s3dWOnpmRnWs7XHj+lt/xTZj+1WiL5KGSksinfAbzzeqzAQybLPn2LGqN9x/iNtGS1DYlC+x9uMJGcWcxD+RPZwA95D6ygJAoetDCu41Kn0fl8xCjb8q3Mt2joTtYPfbXlJdqi1qG60XSwzjSQTKf20Dk+IRZSInj5zMEi2NaA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
 (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 06:12:16 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 06:12:16 +0000
Subject: Re: [PATCH] drm/ttm_bo_api: update the description for @placement and
 @sg
To: Amos Kong <amos@sietium.com>, dri-devel@lists.freedesktop.org
Cc: ray.huang@amd.com
References: <38eac09bf2ddd6088cc8a126e6bc4792eaa2dc88.1633462176.git.amos@sietium.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <43b0b13a-7b69-a492-0f28-51206490656f@amd.com>
Date: Wed, 6 Oct 2021 08:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <38eac09bf2ddd6088cc8a126e6bc4792eaa2dc88.1633462176.git.amos@sietium.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0201CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::22) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM5PR0201CA0012.eurprd02.prod.outlook.com (2603:10a6:203:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 06:12:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce1ad4d7-aa21-4258-5b56-08d988903ec7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB18377FFE6F3265A7D0169BD483B09@MWHPR12MB1837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyTdTURTbOs9o4ISdQsDuxSEkLK3ZeoW0KuKVuzjdj9RVy5f7ckjcWtu7kOAA5OG5HOWLv4FKHXfbdSy9yXJWV+2w3WfxCccaQZICdKARQfsjqD3hy4ujlBWasdbSVxrr3+5I81tdhxzRt7eq0Q1xb3XBXs2uG6fHUNT9sHyy8j17gpp2OuNvmNjCadajd06RB2bY7sTyxBE9aZe7aQkfMMghzV6UcRuEMMfZUpYcRIO5c2fqPvuGcgXWHRfvg8aMSyBJi0OGf9Y5Doz8FkI3ELW35snlYAX31s4BVg7cg5IFJ+9/AI0JCmIPT9JvJjqfJTQBS4+kAFhSwJS4Q/ba1vXoBOeuUuJbT1pitvAji5Y+2NaCMp9Vhhfw6gsV4HEOvM4Wn98QyyttHO/uKmgA68To3W+ULHIUUteKRIqG1moTqD9Mv7hKEJl1Ntp5AEPYaXR97EgNPxmFkdP9oAck/wrR9a9Cv8dA5vZO+gcA+IY754aKIVFDUJkZof2pPrpujphwl2Fmec90anCyr16aALcOzRydbGV6WYmP565VRi1CHkUOT+BubVyBD2ZuCJKUW44I+inJ3Orn5EX4XeT1ewAt5t9dHxH8kSEVx+ogNo42dvzsEiUquFM7nlzCw4VrNk5Rx890xwgA/vyvg9rIqO86HYs8We7G6D5xRkQMbOiW7hGIYtEwBX7gkfRbTaurAR6QTiaahURixnnxSFMy76no9mGeOjsYpSNV5l7//E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(316002)(16576012)(38100700002)(186003)(956004)(2616005)(6666004)(26005)(36756003)(2906002)(6486002)(66556008)(66476007)(83380400001)(31696002)(5660300002)(66946007)(86362001)(8936002)(508600001)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzJBVC9mNWlLVjJTVnI5MDhBZkR3ZnpVb0FIY3VvSkYrejNUTTdocjZscVc3?=
 =?utf-8?B?NUhzZzdLaEpvZ1B4SnE3alpDRVVXN0x0eEcvclhVZmhwdG1SVldMVXRpQjdi?=
 =?utf-8?B?TkJwM1hFcWJ0U2pNcjl6KzdvOEs0WXk1RElvaGFZZk9TelVmdTlHWmxOMmZR?=
 =?utf-8?B?ZlRwMjVJVmQrTjlCanJPemlVWXQ4dkNwZnBrK0ZjS0xmcHQ4bm9VdGY4RUtJ?=
 =?utf-8?B?ck5iUmhIZlhDZ3JzTWRmTklYaUtGb1FwL3dMNVc1b2x3Nldzd1ZkSHJlVHhG?=
 =?utf-8?B?NEJ1dW8vSG1WbkxzakdtRmhUWFZhZjRodFZ0ZjdEM3ByK1ZqditrWXR6b0dG?=
 =?utf-8?B?SVVSbmNxSnZmSEFaOFkvVDVxUFNGVStVc25DRFRFY0c3VmprUGJCWnl0ZWd0?=
 =?utf-8?B?cXhXa2pNdVdKcll3b2VGR2hodWZqWjkwd0ZEcEpVRjRHWW52cE5SR202Zy9C?=
 =?utf-8?B?MkhrNzdlSm9NU0VQZ21xSEx1R1E3U1NiZTd2TUZWakM1d2hoOTFkbFhMblFi?=
 =?utf-8?B?UHAvWnd5TTE0aXBjbkpwNjJGQTRxeHg4c0pVRXhLWll6TzVoeTJ1d0krT09X?=
 =?utf-8?B?QUpVMjIvYWQ1akdZOUhMcUNoR3U2UXl3M1NxdTVGY1ZtTUVuMjNjbE8xR3o1?=
 =?utf-8?B?RStFTmFWdld5alFzaThuTnM2SGdZOXY0VDdmeXRyUFR4UEZkcWZiRlBPWDZD?=
 =?utf-8?B?T25yMWE5SVZGTUhwcjVDM2RoNmJCVHBqbFdrSVNhb1hnY080WmZOdjg4M2dk?=
 =?utf-8?B?ZUEydVFQSVU0ZUdOUzVSM0pWSWZOM3BSL3dEMFluTHVsY1lJOStzbUY4SDdO?=
 =?utf-8?B?Y0RLZHlNMlVMbTlwRUxXcmVwTXgzM3hDTzZOZE9DTmEvQ0UrVGNOTXM1U09W?=
 =?utf-8?B?T2pWeW9ha0JZZ3NIa3Nna2VvdmdqbGY1bVRFMFc4VnNkbjdSK0IrMUtkUXVp?=
 =?utf-8?B?MnArdU5jM1hJMytRYlVDWUtrL0xPanE4aEtVZVpGVy81S25ndWo2Slhlbysy?=
 =?utf-8?B?SGk4b1FNMkxVR0V0UFZMcHM1d05kQnBocEpWR1gxMm03SVJmMkFLRmhlOCsw?=
 =?utf-8?B?RWtuOWk0RWpYb1NKWjJNSk5yQS9SejZ5NUhKQkVUMDJDNHR1aXcrZnFGZlJZ?=
 =?utf-8?B?T1VNY3I4OCtaaVVDYTNxc3B3V2NUNnpScFVQWEFROWNha1d1VmZPT0RFcDZD?=
 =?utf-8?B?NFZaU3A5eGpqR0lROEZETDVxZGZtQzdCOXk1d1NHdnJ0ZXhyWVJERlBQeHRO?=
 =?utf-8?B?QlYwZFJzZlBBS2h0WkpKOEJncWlXRGhQUXlMQmtrdGgrSEk1NUM1T3gwUE1o?=
 =?utf-8?B?MGIrSEs4YlFJeXJpNzBHWldRWGNLT2hML0QxbzM1anR4Q1VHWmlFQWRSblls?=
 =?utf-8?B?TCtVeXAzYjB1QkovWGZiTzFVcmYyckY4KzFYVERiVDBMRnowVGcrVmI1QlBk?=
 =?utf-8?B?NjkycWVDait1cytETFErUFF1ZG1vRXg2K3dtTEM4NVRyVkVIbDJpNkFxS3pp?=
 =?utf-8?B?Nk5TVGRIYkZLUkk3ZWwyUWUvOTBMenNFUWhPOVRYNHRpYng1WnV1QmhOOU04?=
 =?utf-8?B?bmIvWjQ4aW5EalNxTUZQVVlDc1BKYzhkcUxGOGNLSmc1QkhoMDZMVStxQTdq?=
 =?utf-8?B?Tk5xYUI5NHdWdGovMXVGNnd0M2QwaEpTWCtkRUJzTEpyQ3hnRWJmUFhMWmN2?=
 =?utf-8?B?SU5TTXVrbnA0M1Y1Y1crL0RjOU04STRzOVB5OVhTcDBtTkhoOE52c0dnNHJN?=
 =?utf-8?Q?0Do3eoKNeKBs9MfOmFvADO6cFL33UNJQJfHsR+b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1ad4d7-aa21-4258-5b56-08d988903ec7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 06:12:16.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKjNz4s2zKBtK9Sq8acVitRv80Yi7vx5DivPSfKWHt/eMWqGkN0n35qs8k6UwC/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
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

Am 05.10.21 um 21:35 schrieb Amos Kong:
> Correct the argument name of @placement and added @sg description for
> ttm_bo_init() and ttm_bo_init_reserved().
>
> Argument @flags was replaced to @placement by Jerome in commit
> 09855acb1c2e3779f25317ec9a8ffe1b1784a4a8
>
> Argument @sg was added by Dave in commit
> 129b78bfca591e736e56a294f0e357d73d938f7e
>
> Signed-off-by: Amos Kong <amos@sietium.com>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that to drm-misc-next later today.

> ---
>   include/drm/ttm/ttm_bo_api.h | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index f681bbdbc698..eb27bbee9888 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -363,9 +363,10 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>    * @bo: Pointer to a ttm_buffer_object to be initialized.
>    * @size: Requested size of buffer object.
>    * @type: Requested type of buffer object.
> - * @flags: Initial placement flags.
> + * @placement: Initial placement for buffer object.
>    * @page_alignment: Data alignment in pages.
>    * @ctx: TTM operation context for memory allocation.
> + * @sg: Scatter-gather table.
>    * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
>    * @destroy: Destroy function. Use NULL for kfree().
>    *
> @@ -406,7 +407,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>    * @bo: Pointer to a ttm_buffer_object to be initialized.
>    * @size: Requested size of buffer object.
>    * @type: Requested type of buffer object.
> - * @flags: Initial placement flags.
> + * @placement: Initial placement for buffer object.
>    * @page_alignment: Data alignment in pages.
>    * @interruptible: If needing to sleep to wait for GPU resources,
>    * sleep interruptible.
> @@ -414,6 +415,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>    * holds a pointer to a persistent shmem object. Typically, this would
>    * point to the shmem object backing a GEM object if TTM is used to back a
>    * GEM user interface.
> + * @sg: Scatter-gather table.
>    * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
>    * @destroy: Destroy function. Use NULL for kfree().
>    *

