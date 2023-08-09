Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C87751F6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 06:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB12F10E234;
	Wed,  9 Aug 2023 04:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB8010E232;
 Wed,  9 Aug 2023 04:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691555618; x=1723091618;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mhQu4pOx+oPC2ASqjqFXn7mV2yREda6OWFlnvYvaom0=;
 b=ai+nqtUykfTQxtZVNKFnWs9XZFjn5WdYTXiQJ5oGg7+q1zjMzpcVkR03
 2GPHu+QFSv4SXVmFlkUgFKIiC1iAsQutU5F1kixERqRp02rqLgPF5mub3
 6+6Qnta2WC1ms1Dhe+Pef3gDJ4L577hta4+SWC+QWfIcNPW7YqiTt80yo
 WjuB4mAQxWn9NxMUEWuOWSCn25ZBSorhZhArdi/ChljjUoFF02dmjpYqd
 NKsJayciDILByCMiTqROxmuafNXuBQAtQQh5hUKQZO0iLU7CqKNyiznnr
 T7gnsuZY5zWwsUVM72NffY+7w4+aCOeBNbmJsO6RaxgdScARJ4Y6X6XW/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361143972"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="361143972"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 21:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731659714"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="731659714"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 08 Aug 2023 21:33:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 21:33:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 21:33:37 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 21:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8y0cZ/JyN5xO5+AeMEeKrsXwpjrhbFSoW839j1FnBcGsZDPrHFcmWlFi/43/HfHh/AumUOQi9DZoO2fmoLGaK9Xgk/EfOUn2fRA/VVcshxQLM2Ag/PINcTv6H/A7EiO11Vzj/KFLSTOzT0naLs7b6a4CHocs7Eg0LGa1JFogSUHoKaL8PEEOW7NF7/IBO2OA/AesxhXvZ7+gj3RmKQ0aGKWkiBT1ZsVPNVVoZfASGJEdu4hvmUnL3dRPM+FUYoZaAi1AmUROgNN0epFhD+yqfI6PI/VBzGHyB+UCZT+eU6MwU3Fvj9kwto6+MFU/2AEepT3DwgOoFF7+Vpynb4clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYB8mmv/upBBZ/sLzvOW8tCiCXp7rBTBdA8axCY7tps=;
 b=ArKgHVcjDi2PL94csvHDwHuRpj0gthqUOsAhFyPHlqXwkp8ITRviuGOrZ/bmOuaVdyUTMTK12OzRGtAV0ECTY1m2rz5rg1PclA6DAAcvKh1VTXlasnc6x2lmFFIEbOv2abfhe/EQ7068QuM4cPEBw+xT/7PdgzGLXPKZKYV9m9+FMkoAJhHJ2502TEkIniXpuAHzWjf7raPTV/nz71jPePbY5HAtz2J3NDJMzsqC445KDlx8aEIDztEVvE39nSEWuUQ42l+EdzBaM+zzwGv5ZpWHK048L2h2bczJKsfypratxBVZFvLyAHFRAGnoZYb1YSCEfeYWFQFto7hFcFr2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 04:33:35 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 04:33:35 +0000
Message-ID: <90de2060-94f4-f985-e3fc-f4f01934119e@intel.com>
Date: Wed, 9 Aug 2023 10:03:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230727101352.1899466-1-tvrtko.ursulin@linux.intel.com>
 <20230727101352.1899466-6-tvrtko.ursulin@linux.intel.com>
 <fffae148-a609-4f1d-eae4-dbe253f43650@intel.com>
 <b5904977-9693-34bc-55bf-28387b69e06a@linux.intel.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <b5904977-9693-34bc-55bf-28387b69e06a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5d3afd-c048-431a-d8aa-08db9891caea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HG13szZAUtI8VMfxl10mWLVmwUraRku+Z5aJvmTtZUT4C5xNJpZsJP5xYUbRF/BFu8L4CrNNTQ8bX4nuJV2MnbMzvq+uM6iIhksAthhNSFQc7r1LMQvEw7DPMJbTeH9mWF8EqZlCEI1Fr+9mhJU6ZJ6vKchiFsfAgP/s22hpJF03hAiNCTZmv9x/UZxw6NvTMutjYyv9Y7cxXFqItJi9kgD/UAbgeqvf2BL3wRGJ+596+TNM9Twxd6i6BBqjKczRMLE5E+kf3xBBJ47GLN9YsUizfD8ulEGK0nT/aiJjE6tkL96TVSZLLnVJgO8tRAd2NrOzZxZApSpUK0ckB2XISrQ8cob87XZj6Jv8fahYVDYCgMkNLdWuUdHLhzBCdDS7qcMzGeXsScfgaa3aWZUy8vfbQ5TzCHeRady3CKK6Bbku9g0EVY2p6dAN/bKP3v3yNpB0FoAKP2NQqF+PeYbeZs6efqO4E9C/wodlplNeidb7ZKdn53zZ4edjMzlF6cRJSqdT5SrCjt6Sxe7B5DHWhZOBg8+B6vb5lY0EwOkCL2yiM9gijSQRKLh/7lmUw+RiyalblInCKD2aZeOX+p2691EyRBWY5r4UE2P9h9gHKShPVuyYtYFfMnRXzcHNJWsr4hg5Jea+Zefba4T9VMNsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(186006)(1800799006)(451199021)(83380400001)(31686004)(2616005)(54906003)(38100700002)(4326008)(5660300002)(316002)(8676002)(8936002)(66476007)(66556008)(66946007)(478600001)(82960400001)(31696002)(6666004)(6486002)(41300700001)(2906002)(26005)(53546011)(36756003)(6512007)(6506007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkRjaEZRZzZydGlWYmFaYlFIdVRvcG0zU1ROVjBMSW16bnhaV0dKT2VXSUM0?=
 =?utf-8?B?YVAwSXpxVm9wR3Y5NDRuWEErU0pCL2hpSXVudElONjJWRWVuTFRHNU1La0ZF?=
 =?utf-8?B?M1FBcnVsTEUvUldDSFgzRTFlR0JIMXViTm0xUHJtZXI5L2o2MzlQelhjNWV4?=
 =?utf-8?B?QTY0a1FDaDBjUHFlaitHNUFRTWlEYTJJMEE0OUNPODdkY1JPcU5OalpVNjVm?=
 =?utf-8?B?UEliOS8waG1ZQmh0UWExdjNrY0JZWUtIdno4My9DUmpWNk1XL3c3bkJWdG5s?=
 =?utf-8?B?d3dhdktUV2cwQjA0NUdKOEQyeHdmNkJvOTIzQTh0QlNML1JnSEppYTRtRDdu?=
 =?utf-8?B?RGhBWHhhVDM3OGl0SkgrTThQbFpacWtKWnp3WlhYdDBVOHhLRERKdVlUbEF3?=
 =?utf-8?B?VHVoc3JRYlhVV1ZRRUxkMkloZkNpZnhFRWpZWGdPTHNtOHVZWlV1ZDFzN1B3?=
 =?utf-8?B?MGprMG5pRzl5bHRWdmNFeUpiTkpjUXJ3K1d5bXZ2SUFDVXRQNkdXZVdPTWQv?=
 =?utf-8?B?ZVo3Yi9UVFpLS0NMbUxmSk1XK21jT2F3dlNlQWhWUTBCRk9rVG9IZEY4bmdk?=
 =?utf-8?B?RksxOXRXdUdkRWZaRWVET2sxSEkyaEhEekFjcVorM3RGZkJlR21obWpKWElE?=
 =?utf-8?B?bW1jVXMraUpQRHNsSDlBQlpIRmdBQk93dlJmWE1ESzBQU3FRN0Q4a00rY29n?=
 =?utf-8?B?d2dVZkNub1J1aGVaaVpHZmdnZkhGckNweDdMNXlaTVd1b3FMeFI5cUZTeGNt?=
 =?utf-8?B?WG83YS93K0pzdmtUbGdoa2E3d3VaUkN3eStIQzVDQTl3bEZ0REc0Q1dZYjV0?=
 =?utf-8?B?aGYrc0ozVDRSZzdhbkRDdnpXcGovUW9XZHZoTVZMMk81R1R1b3FaMjlwQnN3?=
 =?utf-8?B?SXpHVE5oL3VzR0dxdFp5VVpIK3RnWGl6azVVeHRmMW1oWGhzVjhFM1lhSHg3?=
 =?utf-8?B?aWlOQ0FYS1dPVE5zc3VlaE42dk80dmVvcjBLUk96WG16bDdnQTBrUUJodWdx?=
 =?utf-8?B?ZURzS3BEMWsya2dKU00rak56SHM2MVMwM3FEaFFiQ1VtelRjOGUrWmN3aDE5?=
 =?utf-8?B?TjV1a1IwVmtTWkRZb05lSHJ1NHpwYTJPcU1HU0JybC9XYW44T0d0emJWWkxH?=
 =?utf-8?B?c3dLazltY3pBSmZLTEhTN2pzeVZSMjAwUnBlZzRGWWZ2S2NvSWYwZ0V6YThQ?=
 =?utf-8?B?RVZnazhuTEtYR2Nwam05aHN6WXpNR3ZHRk8zck0vQjFwMGFvY2w4dFlZOEN3?=
 =?utf-8?B?YSt1L2lTSHdZTmloSVpEUm9FNm9mSWJqSkx3WU9mdFBURjNXV0duUTV4RWtP?=
 =?utf-8?B?SnErbzh2Q2hYekR0cjkxc1U3VnRPMzZ3VXhBVlBGYVFUeEZZWW9DY090WFhl?=
 =?utf-8?B?VHlDUjlsZllzV0FhOVYyL000cVpjNWVxdWttN3E4c3RKY29yTzh6blN2T3R6?=
 =?utf-8?B?WVU0ZFErTGhaRVFZL29Nell0UnBhNk81NGRqVDk4bWo2QUM2MzM1RmpmdEE3?=
 =?utf-8?B?K0hiUVZMRWJRY2JkY3hDeFF1bER6UnZUVVJWaURHQ1Jndytxamt4Q3Y5a3Vi?=
 =?utf-8?B?YStwZ01ETDJXTmFtYi9UZUxadzFadk5DOGx6YWF0ektQSHRkU0NwdEpmcFc3?=
 =?utf-8?B?UVRoTWorbHZ1UWNFcXBUbEdWUDdNYzFpT1JiWnFlYUNYbzFCWUFqejZDYUVr?=
 =?utf-8?B?SFhSRDFHbWY5RkFpeGVOMEtSMGdiQzJrVER1bmo4NExjOTZzN01nVkNzbmx6?=
 =?utf-8?B?M0NZYVRKMVJWMFM2OWVHZWRmTmUxSWpFNE5vZVFZNkkveFgzNWlXRVVGMFgy?=
 =?utf-8?B?Y1ZRRUszM1dUS24vMDJaVlNwYWlsSUlYUVk0elloSnMrYTVMUFFna3FBUHFq?=
 =?utf-8?B?YXhjelc1byticXZiNmpIdjNPOVNRbWNuNGdkY0c0VXVJbUVyYnZGOS9EWFNH?=
 =?utf-8?B?a1l3bytLaFZCR24wUzhDbjRLU1c3RSswMFp6eUdDUWI0ZHNQY1hGVUxYMmJM?=
 =?utf-8?B?L0dnZVA2VGdoZ0lXZ2RaVEhGQ0FyZERGMjdKVkkzd3UzQXhZaXd1aGtHaVUw?=
 =?utf-8?B?OVA2S1V2NWxudjBXRFZVZXZwb1Q0RnhkMmZIVlVNVWpMWHlvbDRENEJsdVRi?=
 =?utf-8?B?N01rd0g2VWVpOVdTVUdZb1RHcEYreUpNVkYxWmJUbWZrYlpzOHlFQzVHenha?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5d3afd-c048-431a-d8aa-08db9891caea
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 04:33:34.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rASmupZ0OKfhMj38QgNeYKaOUz1+a/eRFioOU6E8DoFeIMHOUUDzGygbgLk3FiMFo6eYvPYtJELzeH6fyAVeDs7wN9ZaOAxMBTSsWc9ifcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-08-2023 14:19, Tvrtko Ursulin wrote:
> 
> On 03/08/2023 06:15, Iddamsetty, Aravind wrote:
>> On 27-07-2023 15:43, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Use the newly added drm_print_memory_stats helper to show memory
>>> utilisation of our objects in drm/driver specific fdinfo output.
>>>
>>> To collect the stats we walk the per memory regions object lists
>>> and accumulate object size into the respective drm_memory_stats
>>> categories.
>>>
>>> Objects with multiple possible placements are reported in multiple
>>> regions for total and shared sizes, while other categories are
>>> counted only for the currently active region.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Rob Clark <robdclark@gmail.com>> ---
>>>   drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
>>>   1 file changed, 85 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c
>>> b/drivers/gpu/drm/i915/i915_drm_client.c
>>> index a61356012df8..9e7a6075ee25 100644
>>> --- a/drivers/gpu/drm/i915/i915_drm_client.c
>>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>>> @@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)
>>>   }
>>>     #ifdef CONFIG_PROC_FS
>>> +static void
>>> +obj_meminfo(struct drm_i915_gem_object *obj,
>>> +        struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
>>> +{
>>> +    struct intel_memory_region *mr;
>>> +    u64 sz = obj->base.size;
>>> +    enum intel_region_id id;
>>> +    unsigned int i;
>>> +
>>> +    /* Attribute size and shared to all possible memory regions. */
>>> +    for (i = 0; i < obj->mm.n_placements; i++) {
>>> +        mr = obj->mm.placements[i];
>>> +        id = mr->id;
>>> +
>>> +        if (obj->base.handle_count > 1)
>>> +            stats[id].shared += sz;
>>> +        else
>>> +            stats[id].private += sz;
>>> +    }
>>> +
>>> +    /* Attribute other categories to only the current region. */
>>> +    mr = obj->mm.region;
>>> +    if (mr)
>>> +        id = mr->id;
>>> +    else
>>> +        id = INTEL_REGION_SMEM;
>>> +
>>> +    if (!obj->mm.n_placements) {
>>
>> I guess we do not expect to have n_placements set to public objects, is
>> that right?
> 
> I think they are the only ones which can have placements. It is via
> I915_GEM_CREATE_EXT_MEMORY_REGIONS userspace is able to create them.
> 
> My main conundrum in this patch is a few lines above, the loop which
> adds shared and private.
> 
> Question is, if an object can be either smem or lmem, how do we want to
> report it? This patch adds the size for all possible regions and
> resident and active only to the currently active. But perhaps that is
> wrong. Maybe I should change it is only against the active region and
> multiple regions are just ignored. Then if object is migrated do access
> patterns or memory pressure, the total size would migrate too.
> 
> I think I was trying to achieve something here (have more visibility on
> what kind of backing store clients are allocating) which maybe does not
> work to well with the current categories.
> 
> Namely if userspace allocates say one 1MiB object with placement in
> either smem or lmem, and it is currently resident in lmem, I wanted it
> to show as:
> 
>  total-smem: 1 MiB
>  resident-smem: 0
>  total-lmem: 1 MiB
>  resident-lmem: 1 MiB
> 
> To constantly show how in theory client could be using memory from
> either region. Maybe that is misleading and should instead be:
> 
>  total-smem: 0
>  resident-smem: 0
>  total-lmem: 1 MiB
>  resident-lmem: 1 MiB
> 
> ?

I think the current implementation will not match with the memregion
info in query ioctl as well. While what you say is true I'm not sure if
there can be a client who is tracking the allocation say for an obj who
has 2 placements LMEM and SMEM, and might assume since I had made a
reservation in SMEM it shall not fail when i try to migrate there later.

Thanks,
Aravind.

> 
> And then if/when the same object gets migrated to smem it changes to
> (lets assume it is also not resident any more but got swapped out):
> 
>  total-smem: 1 MiB
>  resident-smem: 0
>  total-lmem: 0
>  resident-lmem: 0
> 
> Regards,
> 
> Tvrtko
> 
>>> +        if (obj->base.handle_count > 1)
>>> +            stats[id].shared += sz;
>>> +        else
>>> +            stats[id].private += sz;
>>> +    }
>>> +
>>> +    if (i915_gem_object_has_pages(obj)) {
>>> +        stats[id].resident += sz;
>>> +
>>> +        if (!dma_resv_test_signaled(obj->base.resv,
>>> +                        dma_resv_usage_rw(true)))
>>> +            stats[id].active += sz;
>>> +        else if (i915_gem_object_is_shrinkable(obj) &&
>>> +             obj->mm.madv == I915_MADV_DONTNEED)
>>> +            stats[id].purgeable += sz;
>>> +    }
>>> +}
>>> +
>>> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>> +{
>>> +    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
>>> +    struct drm_i915_file_private *fpriv = file->driver_priv;
>>> +    struct i915_drm_client *client = fpriv->client;
>>> +    struct drm_i915_private *i915 = fpriv->i915;
>>> +    struct drm_i915_gem_object *obj;
>>> +    struct intel_memory_region *mr;
>>> +    struct list_head *pos;
>>> +    unsigned int id;
>>> +
>>> +    /* Public objects. */
>>> +    spin_lock(&file->table_lock);
>>> +    idr_for_each_entry(&file->object_idr, obj, id)
>>> +        obj_meminfo(obj, stats);
>>> +    spin_unlock(&file->table_lock);
>>> +
>>> +    /* Internal objects. */
>>> +    rcu_read_lock();
>>> +    list_for_each_rcu(pos, &client->objects_list) {
>>> +        obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
>>> +                             client_link));
>>> +        if (!obj)
>>> +            continue;
>>> +        obj_meminfo(obj, stats);
>>> +        i915_gem_object_put(obj);
>>> +    }
>>> +    rcu_read_unlock();
>>> +
>>> +    for_each_memory_region(mr, i915, id)
>>> +        drm_print_memory_stats(p,
>>> +                       &stats[id],
>>> +                       DRM_GEM_OBJECT_RESIDENT |
>>> +                       DRM_GEM_OBJECT_PURGEABLE,
>>> +                       mr->name);
>>> +}
>>> +
>>>   static const char * const uabi_class_names[] = {
>>>       [I915_ENGINE_CLASS_RENDER] = "render",
>>>       [I915_ENGINE_CLASS_COPY] = "copy",
>>> @@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer
>>> *p, struct drm_file *file)
>>>        *
>>> ******************************************************************
>>>        */
>>>   +    show_meminfo(p, file);
>>> +
>>>       if (GRAPHICS_VER(i915) < 8)
>>>           return;
>>>
>>
>>
>>
