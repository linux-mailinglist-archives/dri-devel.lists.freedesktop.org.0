Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D725C6AC787
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DF210E2CB;
	Mon,  6 Mar 2023 16:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83A410E29C;
 Mon,  6 Mar 2023 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678119516; x=1709655516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M2+RLtFAk8A+x3GMXXwjoOYOf9ta2yygBrH4gY3CKPU=;
 b=ewVkiYhhx07FpFzXfYGEgvQO3M8TspapsS2jEdQsxlILUXZiaMSuDaO0
 y2hCyFFvhTYKDvGH7rih3hqTKNDCqQQudOu9FT730BCvs8Aq3B2jOy6kx
 rRPyEgLHdLrb4br2WX/ttD4TxPMpfZKksArQDaXz5MrAIfcl5rfa2sHUe
 oJokVqdZlwXtROPO6kdOHirUVWYp96hb/ug/J+4XKZrXSMW6we4K37HEh
 yu0MQMqFCPn4E4SQjlDxjFS2HRfHp72DjLiY6OVZWGb3z8ocW43eX8+yj
 vMD0jfa7SMykInTNdw8/WneN2iumUcOr/vGLNk7Jjso3hLhcuUjkIxhHp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398176772"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="398176772"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850351677"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="850351677"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 08:18:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 08:18:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 08:18:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 08:18:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 08:18:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca4T7CG3DZ6fAeLjexMpIQWghFiI4DmPRQvdTVC33kUf9nvT4saeEWAtwW56qr1l5CS6HfEpqW1SRx9qNR0zfL9VM/vsy/1hRnVMOCqKt8eiQIhTBS1FQCZy+tLgVUbT6KrZ/0mvE91KlrpJR5Otju9KrryOpAxZ2uXLljHT8M1S9AJv/o+HH3F5xIlr8Xh7fXeM7yz+FTcFOOPbktgwTUJUCm6nZsft6zdu+y54KxqruVYLQRUhTxpcaOEljpd6dor5rBdaaQwgeiO6D9tJiPd2Xo2nx9G/JP0j4/PGfUE1a2Tt6sbw00FcXqJc664fkGfc1odizS9I13UhLAcOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2d8bepeK8fs4iYEOk32yAwJTEAFe7//aYCE/bWo7hM=;
 b=ngtgvb/+bMizKkbrLnHabDOX9Hg4UoHy5g5YnuILUNWL4J6ebCM0WjUqQ2ainSP9M7rfYxP/rRaujRTuDfU4LcN8Z/8yH3y2nMlmFf9qmA6QP67/J4YfcOU8YmiuewhXDUZr0QQK+4UEkJ/C1dmIQ8XekCMjuJeAVvG8AIzXL8tajhxvXvS7Pcw5az1dYCJeJ3UNo6upyd07EZYoKPUhmXvLOiNKOXa0MmTzGxGd/xq4R2R5S7k5wfBF7vhmpI7HOyEVqldIMfxdWENqozyWuSzh+0s02Z4Dnvt23U9F8giPvw39va4nQvE85EMa8Mszy87x8E7LcswjQWeJjdzdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 16:18:31 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::cc58:aa84:72be:b4fa%7]) with mapi id 15.20.6156.025; Mon, 6 Mar 2023
 16:18:31 +0000
Message-ID: <8f5b928c-aaa7-fe0c-f3fa-844d0a943ab5@intel.com>
Date: Mon, 6 Mar 2023 17:18:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] drm/i915: Add a helper func for gem obj mmap
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <20230306102850.18299-2-nirmoy.das@intel.com> <ZAX4LLcCWOe0UZOA@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <ZAX4LLcCWOe0UZOA@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 653ec66e-aaee-41a8-d07f-08db1e5e6bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9GSidgoYpDdZP9xUMPMO1Rno1vl6AGvGG51wisSnvAwg0NYnrW2goqb+CBN5e9CyCln5ClTt96SpKvg8EbrQerVwc6rFGexmlIgu2O/5lVtJ6lboXj838xmncIgUAjHUSiuVeuYJdCm7sCDlPy79L8qaVT0inSTL+kE7j0Nzb65DKl/tIP1c6WBZbYv3UVhAoPsWmNExBZy22bpkUkPL7AQI17ivM+NqDjMHzo5C6eEX6e76EvTGiwN41ClvI3KMZHQ46QgRslwODQ9oBLqZeMJcQaK4TMIsZBdWong7wX/s2VVH1ysQeB2krYl0nS35/b6gSUfA+LA4Coy6voOi2xcMyd/Vq1+SUCb3FNUkmfvokuHZNO+w9rtflaXZPmFRrCY9IRxzn82wumYjxBhuc14I07C6bzOggPFnotsd/aee05uEsa3Yr7nD7rjXF/P5WJqmNrh4S/E6C7/RLmeclZyzZWdJ6dSoacX/pD919+Hc9pn/nj6s9iGQSvYkA9somBCfz47kyAESh1NltoIsR2+gBXi5dQXB/4erN6OwYpFwttLRvyKCf5EtW3SVry3M/r4EsoazOT2wNjjELOOAH0krY2Za5YFlWSdIZaNBJjMGbk5DpRZphOuMQX9o7Zqi4ndMbWIQeQqYdRKiRQFPxWTmmWJCF1hpvske5K4haFNIS8Ewyb4mq5Q0y9Pr1VIFUVY5HscMV7+ulQMs4cKdt54ZTGPLZ8paaaRUgadldc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(6512007)(6506007)(53546011)(66574015)(6486002)(6666004)(36756003)(83380400001)(31696002)(86362001)(82960400001)(38100700002)(186003)(2616005)(26005)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(6916009)(2906002)(31686004)(8936002)(5660300002)(478600001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFzRGpwS2xLeE5zY1Z5Mnd2WUFmbE1rcjRjMW5RdG9VRi90T2FHMTRlV0k5?=
 =?utf-8?B?dVY1aTVwTGV3WUV1VmFGUGVwS1FuZ3pJZDJmSFNoTm90VnNWRHdYRDUyWmta?=
 =?utf-8?B?MUdXVitIZlF6aitKUkI2SUo3UXNsRWU5Z1JUNnVNUTdnVFJMbkZhSGdiMnpl?=
 =?utf-8?B?aWIvVEcyYTAyMG1YbGZSYTQyTllZbzlQV1oxZENXZ2dPUFRWVm1jMXVqZE5Q?=
 =?utf-8?B?YlNtV3FkaW9aNW4xMjJxUnVjejhJVDdSRm9ONG5qNHo2N21Hc0dXaWhJYzJ2?=
 =?utf-8?B?TVRYMi9TVWozZE5EYkV1Z29vVDAwQVFtOXVUQXcrSWhqMWc2OVBqZE54d3J2?=
 =?utf-8?B?NVdXeFdVaHY1NUt5YVVlcUNBWlZrSUNSc1VFYkQzdDdKdmZjcEJnclpVMUVJ?=
 =?utf-8?B?K2Vyb0RTYTUzUnhUdjZGSjA2RXhUT2h6Z2Zib2ttUGxGOXpZb2ZuOWJvYldi?=
 =?utf-8?B?azRZeklBSHBiRmc3WWVGVGhCSk14SGxIRHRMbHJFNEthRW9pR1ZwRjB3dVl3?=
 =?utf-8?B?UVdPZ1VxaXBzRGRVNlY2UTJRNG1kaG05NUw4ZEhVc3ErUkV6ZjJRaGl5bnY3?=
 =?utf-8?B?bHZvNk11OTd2TFozWmdzeWRraW0xL3V4ZTVqUEpJWUd5WGpVamVBZjlPMC84?=
 =?utf-8?B?Rkpzem9HZVBLRkZvbGRyMzgzengzYk1OdjNoK3NqK1QrTk5ha0FHVURyUnNy?=
 =?utf-8?B?NkpUbU9lRlZrZGQvT2NBQzJJMU42eWVSanZsLzBYaXdFbTNZcysxOExzSkNs?=
 =?utf-8?B?dGVaUWozZ1FidDRldTloeCtmL3hhT0VjYWtIQThQUDEway81ek1leVNJNTQv?=
 =?utf-8?B?OEtJZE13d0NqUXBFcUZLMy9qRFh6WWQyZlhwU2hRYjRFWlVCYldsTFUvSEZt?=
 =?utf-8?B?YmE3WlZqeFdhTVZOWWhZYlFmclk5MXhpdytObzFXU0h4UGhNdmcwRTZVcnV4?=
 =?utf-8?B?ZDd0c2p2TXJ1M29tVkowR0QrOUZIVTZsOFUrS01GMitnWUNiem8rK1ZtbEJs?=
 =?utf-8?B?R01LOUJ0Q3ZoUEIrVzREUXI3Q0JWdHpMeG1uWDlXOVlsNGVSTDNoZ1BSY0NQ?=
 =?utf-8?B?dWtXTitsazkvK3d4cjlqSHBnWTUwQjNKUHFGeVNwaFY3anFQY2d2TWpoS0l2?=
 =?utf-8?B?R01IL2Y4Z0MvT2N3SjFxd3FORkU3SGRYaGtPcWxvYUhTSzV6c2dMdVNiZmpT?=
 =?utf-8?B?bTg1MGIyOFZsL3RnRHh3R3NwUWNqYkdTcm0rcklEWW0wS3ByV3hGWEhWWlE2?=
 =?utf-8?B?bzM2YkloMVd6aVVSeWpVQUpnWmVzYlMwWUd1aGtkUXVSQVJBZjZMMXFIaTRO?=
 =?utf-8?B?M2ZOUnpZVGpqb3dJN0ZJenlMVFBpVWgyN0p4Q0ZGeHRFcm8xNjFFa3FMS1Jp?=
 =?utf-8?B?a1piSCtxeGMzRVV2Zkd6T1REUTNtTWFsckdGcXcrdTUrZElrK3hxRHM0Y2d5?=
 =?utf-8?B?V3QvdTVCK1RtbEZSWjlEVDBQOVlNUUVSd3RKUXNGTlErajJiakpxQUoyakl0?=
 =?utf-8?B?WVMxVlFBbVF0OWlxRmlCOVRVMlc3RDJ2cWZsUTNLLzFkOXZybnFUd3YzNytj?=
 =?utf-8?B?UXBxc2tkQVEvaEVkWEVGT1ptanZpN3k1VDNYTEJpRlM1dHFuQmFrT1dMWVla?=
 =?utf-8?B?d2t2NlFFWjdUVVFSZ0FyZEJRclpUT3VyVTFvUExybzhvVjBUb2Z2UHNhMWVZ?=
 =?utf-8?B?SWZnNkN3YUN4dlpSckxJYUZ5RU9jcXBKS0YxaFhEMVhqNElIL0dDaWdCT0tE?=
 =?utf-8?B?UHh4Z0YxL2pxalJ4Qks0TmhSL3V0UHFaVUIwOTd0NzU5SG5vWjdrY08zNTFO?=
 =?utf-8?B?cTUwUzMwSldFKzZvc3hBU1lvLzVsdWxmNU1GajA3N3QyLzljbE9tV3hZUVZ1?=
 =?utf-8?B?S29uakNIbjNLZnhNejg4dGNFMndCYnJKYlc4ZTZiblp4UzhPb1krMnRpemw4?=
 =?utf-8?B?RzYvS1ptT0FsNDJYNTJCbTZ3YVQxWlZkS1gveDRsSnROYnk2Y1ZlYUFTTkhK?=
 =?utf-8?B?dzFheFQwM081eTZBRURFSWpudWJjcldrT1BOcFZGK1YvUFpORUorb0VqNHBB?=
 =?utf-8?B?Z3hFcXhFNG83dVJQVUZyYjJNblRHeC9SVXdTcXNZdW9DUVljRUdnWnJJNk5s?=
 =?utf-8?Q?hM7QeEaZM1p1MBJ8WXiySR7uj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653ec66e-aaee-41a8-d07f-08db1e5e6bf7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 16:18:30.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZstJFwEFgXvE+OIxhXSnumzgGdf/xKXSgjfpSy/FT8YQZI/WsIlG4aUjCBMVWDO9A3Y8vtCp1IiyweIrKwcOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/6/2023 3:26 PM, Ville Syrjälä wrote:
> On Mon, Mar 06, 2023 at 11:28:49AM +0100, Nirmoy Das wrote:
>> Move gem obj mmap code to i915_gem_object_mmap() so that
>> this can be used by others.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 20 ++---------------
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 25 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.h   |  1 +
>>   3 files changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index fd556a076d05..831dd8ebf819 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -12,6 +12,7 @@
>>   #include <asm/smp.h>
>>   
>>   #include "gem/i915_gem_dmabuf.h"
>> +#include "gem/i915_gem_mman.h"
>>   #include "i915_drv.h"
>>   #include "i915_gem_object.h"
>>   #include "i915_scatterlist.h"
>> @@ -94,27 +95,10 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
>>   static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>>   {
>>   	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>> -	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> -	int ret;
>>   
>>   	dma_resv_assert_held(dma_buf->resv);
>>   
>> -	if (obj->base.size < vma->vm_end - vma->vm_start)
>> -		return -EINVAL;
>> -
>> -	if (HAS_LMEM(i915))
>> -		return drm_gem_prime_mmap(&obj->base, vma);
>> -
>> -	if (!obj->base.filp)
>> -		return -ENODEV;
>> -
>> -	ret = call_mmap(obj->base.filp, vma);
>> -	if (ret)
>> -		return ret;
>> -
>> -	vma_set_file(vma, obj->base.filp);
>> -
>> -	return 0;
>> +	return i915_gem_object_mmap(obj, vma);
>>   }
>>   
>>   static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_direction direction)
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 2aac6bf78740..d378720ca626 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -11,6 +11,8 @@
>>   
>>   #include <drm/drm_cache.h>
>>   
>> +#include "gem/i915_gem_lmem.h"
>> +
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_gt_requests.h"
>>   
>> @@ -1043,6 +1045,29 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>>   	return 0;
>>   }
>>   
>> +int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
>> +{
>> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> +	int ret;
>> +
>> +	if (obj->base.size < vma->vm_end - vma->vm_start)
>> +		return -EINVAL;
>> +
>> +	if (HAS_LMEM(i915))
>> +		return drm_gem_prime_mmap(&obj->base, vma);
> Calling some prime stuff here doesn't smell right.

Yes, I should use drm_gem_mmap_obj() here.


>
>> +
>> +	if (obj->base.filp) {
>> +		ret = call_mmap(obj->base.filp, vma);
>> +		if (ret)
>> +			return ret;
>> +
>> +		vma_set_file(vma, obj->base.filp);
>> +		return 0;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>   #include "selftests/i915_gem_mman.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> index 1fa91b3033b3..303e81ddc5ba 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
>> @@ -30,4 +30,5 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>>   void i915_gem_object_runtime_pm_release_mmap_offset(struct drm_i915_gem_object *obj);
>>   void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
>>   
>> +int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma);
>>   #endif
>> -- 
>> 2.39.0
