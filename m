Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80263F35A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7510E087;
	Thu,  1 Dec 2022 15:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7E610E087;
 Thu,  1 Dec 2022 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669907544; x=1701443544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pt6cnFVdIwAf1NAdO34qcSt+VUp2IM/8ND/A7y2KVvk=;
 b=D5Pc+yMWj6aVQ000s0oQdPVlNs8CIHxV+iCKTMy9B1KfRARxudft0OZP
 hXIzArHs7ETTewxJs+H6+FUKnJ+/YB+zoNWGK8cpq0+WThspczi0BR80O
 urp79KFDpOirYE9ituFpKcxgny5yKu3wKUt0gYm8HFoQZYG+ejJJUi5rj
 tXNxiuQzzmfy/F6xgXcIXkphXx5NOcb/x0J7o9lbSeGAhhM5BfMtaXEjY
 QsmJQijynISy3U3mHJ3kGbxQ23MzUDS7lxlxXE22UIkhCItYbbBEU1rKD
 m6QqUlnn/SLZFJGpLZyq/INgwATq/1Fu0t+2FTSBmsGniu3j/XiUqw621 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="299077576"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="299077576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 07:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="786920569"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="786920569"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2022 07:11:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 07:11:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 07:11:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 07:11:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 07:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoD6Xho2dz7pehi0S7FbsR471MplWm8gpooUrhg179YmmldllZS83H5bAkzNM4n7MMMRssBpsuUhkV7umZ8HZq7HB+RRCgRJY76uRG1X1xkpLB2JyYB58XNI4rbRI1syL/ap3x/RaFSWZN3AowYfp1yzs0NEKFxcOy9JYoJb4JGodFlllmPgFQXHAWN5fWwBb+Gc1LrslfJ99Tzivt54Nb8k9wTD1UW2K9JzmMPLSPsVVEFJ4L2xqk+eIEP27lWnPZGk1pIPOmdHja2WymiTu803DKKl25nH67la5cQkuHjvwmzyksaBSvYMZeGV0biq01Ws9txpQclklzycgLWb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeiQxRQs+HcW5M4Ou22w2HcMdjLUDUpQq+d70bhdfa4=;
 b=J09cQM5HVgjU3DZckzTAmW6WPD3jiQ2dsF3O1Plu91gAltM7h+BbZU965yal9FtJsY+/EyF4PNeOSlzrGedOdOyUDEsKqrbZBbARm8elNU7wcEFirYA0mTrZRMi+RjyYew+wHE3Wi/sywNnv8auC9xxa0giqhDbUPdpLT7A24uGptvtp3lSOn9vdoE9OOlgdCcbhXi+rsLgVmI+Z+GGIFgKAteMLHNrnSThTW/HweDNRD4kg+g1MprQg9fLNavDc07NJ2QK1MOsGTBkRy08G8DetnTsW/X8eF+q4f6tHCe85Biw0PhvMZ1aG5PlgIC0KrzU7LuUlhzXV1s71eVXKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 1 Dec 2022 15:11:37 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:11:37 +0000
Date: Thu, 1 Dec 2022 07:11:35 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v7 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y4jEJxebWuYehxwj@nvishwa1-DESK>
References: <20221113075732.32100-21-niranjana.vishwanathapura@intel.com>
 <a828c36b-8f89-24b0-b287-dabf62f82085@intel.com>
 <Y3O7NCxiZHjjmyN7@nvishwa1-DESK>
 <d8b028ea-4179-768a-7154-5b0bc3641cb1@intel.com>
 <Y3O/a/sF21wC3EdE@nvishwa1-DESK> <Y3Qdd2aW4AHHDgq3@nvishwa1-DESK>
 <Y3QwtyKJKCKMBvjb@nvishwa1-DESK>
 <dc5a13ce-373c-995b-42a7-4b8f658e7990@intel.com>
 <Y4aVKskHxdNWSC4I@nvishwa1-DESK>
 <f6eeb6a2-fed6-f796-2d14-5e79b99e18f3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6eeb6a2-fed6-f796-2d14-5e79b99e18f3@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd4098e-9c0c-43ad-2ea5-08dad3ae57d2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGcqmoHAe0w80EvIvEpvohIdgo25P4OKJOEdkPbvbK5p+nLO6BFKImbaQZVnhuukuc2xWqaGyjPgZ84isotaXKqz4CtZ4PJ89yZr+jgeh8vQblkVav+1/CQy3k6cQm9YuAjAvIkAfK1uoegBqGUOh07AR78e/i5YWR0rwlPyEa7Z3WHI1k8bCeC4VV1LargXCqotZDNwYP7i9OLfSCs55sL3/GeREd1cB7l9h3BBx7d4w2wMUiSpj6+wwV9tJyP9WFPMFF+uPA7rxyh3ac4maBROKNvRbtU5R3qOwWO/YYKJ0L3szGIWXbnBxDQR//37dpqxfLFdEqSpvVVNSLWZHQkfk0Mu1wm9f+SradfIIk5WKJRC5OKC+PPT5/CTWxdduDs9Rhvnb/yv9adFOuf801ocoPwj1RQ7R6rTXKqX+IadrCgafMAwTvkAeMhIw6c9tBE4nDc1bTFYjXRMX6UgZBShrwm8m/FpZSiezwvqp1ruqcSLSNSmV9iSK9yfRklalGCogUDfnwOZRQ/p9e4g+Q+unynWRtHEK4wzOHjsfIdoJ3ZE865UovXDO/kGar3R4OtwRDftgaTxEH6nZLNojqh+io571I5vpM0dFdBztizB7CBtlK3v89xZ4LbpGX6g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(6862004)(38100700002)(8936002)(2906002)(83380400001)(86362001)(6636002)(6486002)(186003)(66556008)(478600001)(82960400001)(44832011)(33716001)(316002)(8676002)(66946007)(41300700001)(5660300002)(66476007)(6512007)(9686003)(26005)(6506007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FMfiHGAQNrictTGRj6RfP92QNhAJEsic03+lU0q6DRbHbWCdifLlwh22i4?=
 =?iso-8859-1?Q?QlkZZbVAZEAVcRGK5A//BsSIwoGdFHJoc3t25XiYYZQ3VYEcUvMUBZUbcL?=
 =?iso-8859-1?Q?5Xz/s2vyoEMKUGf7pXSgOCWgPE8Oaj4pB7WGbcd6syxwSP25Rxf7GsSUwF?=
 =?iso-8859-1?Q?lekGQ227sYxCGOwpLiBspqo8rhEmr1x8RoVgBSp91TtPvEf5I5O/gxdC1R?=
 =?iso-8859-1?Q?rp/agNAoVxxyuAWQ6blcZIGd+GNybX2npDsyKAF2pzGy2FgdxkVm/rMFa3?=
 =?iso-8859-1?Q?Loivst9zXIrnH6lnFpbnn1W/3gTEcjPCV6lcoRKkNuYKdWgUKuc5OJkvCq?=
 =?iso-8859-1?Q?SthrlmcPwDOlUXdS9rA+kvN9zHOtwt9Hv8mAVqeWWeVvTd5JyR0MaRMpFI?=
 =?iso-8859-1?Q?nTap8dDIitFkQc1gu9+3emx26diBB6lelI76MecJOHuWtiVqUriQHQybm7?=
 =?iso-8859-1?Q?pt21wNRYq195Gf5XbUFot2nxRDulsvodvRSFE/1UEyEbWuKGSZWUhKXKg/?=
 =?iso-8859-1?Q?kAro0Vg4k7UNj/YNDHrL60V9NkZRiTIV/Blu8PduHCBaU4yA54DHwU9hot?=
 =?iso-8859-1?Q?o7XB6hZ4+XJG5A7aw51l6/0IWUf3tzB7MP5+kDQlWtCchK3vg320Z0dTeS?=
 =?iso-8859-1?Q?P/r1bPmlUsskxRTQDKxO+4FrlgSB0ooXmwR3acc6Isq6y0k7Qma8MOD/JI?=
 =?iso-8859-1?Q?Vd3KV8JYcfBMwiO3t7efnlU0NYTRx342j5HK3ucK75CQBk7DqhIJU+PKVi?=
 =?iso-8859-1?Q?V70SIRaiUpll1TBdVuXVBEXbI17oIY6CSW1vlbxCdWwA1XV9gh7z0FkJvm?=
 =?iso-8859-1?Q?sRH9dL5dwhxq4Qdq6eaO5Q0BUJEDdGRd2iwIyUX/tshgmE9TpawDIbvId7?=
 =?iso-8859-1?Q?crECzVg4eduE+/hX5M//rKMt52dk7fkH3EDVwbuzu4RW5DZXRjvnNnmGe9?=
 =?iso-8859-1?Q?mSe/rfx48OQr1caTNuykOhPjeEnMRoZJQBoSi9ozqXP28GgWM4zFidCgTY?=
 =?iso-8859-1?Q?/enhKF6Fxt4rpsgq97bd+SoTD9x8nYEIOH4VMlzcXgJqAlesShQNQHIHb1?=
 =?iso-8859-1?Q?TqWHAB21a0ZBjzJyyCVMgvVbcI7BSJqu6T+4GH+XJjEJCFrqUp0fwfbJmc?=
 =?iso-8859-1?Q?W6DYZQB0PrWtXTtoU15ePAba6m0VD10vJmvZGq/aCT0fbzf0tELiuBQakH?=
 =?iso-8859-1?Q?qFeM7dkcSHnFlgsq/omsRhbRm9mneIRUsTxfwsvYAvkvPkknsZdT3m7/J0?=
 =?iso-8859-1?Q?i+EfIaoB6snhhdJzGM4Mok9a/2d8WDWdpRwYhmCQK4WR3ewPKzgYv4YdPs?=
 =?iso-8859-1?Q?48Go3GVIeRlNSTohHvxVztUImEard3u4WCV7m1esDZQiOMd8z/lv89XALL?=
 =?iso-8859-1?Q?qaygOjWcQhmBByMeh9cXfOfHljF3GNgX4waDpbJPD8TVwykJqfiRQ0Phpd?=
 =?iso-8859-1?Q?wjNENL35YlV4ORQ9e4yb/E3xBoQyAri7OIhDWr/yOmGv59uNwQs765WZxM?=
 =?iso-8859-1?Q?Fu39Db6CRwSDQW4f/yV5wTL2ahCPoEcUN8gYuZj+k4lTpvQQPGDuohgmEd?=
 =?iso-8859-1?Q?1WDdE2hu9imqp7y/9rb4ZsEykGgJ4lMTFJfl53QI6fQwt6iShmM10lWrUE?=
 =?iso-8859-1?Q?DmHJIW7snGTbXU7CHjl8atdndFcsgIhQw2L1CB3V50QrIyiIREwAK1TY+J?=
 =?iso-8859-1?Q?Q7geC5j+0Datjpiehvo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd4098e-9c0c-43ad-2ea5-08dad3ae57d2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 15:11:37.8758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deLuU9uWEiBdyq+/BhKiXpfb4ZKnUs+Aobr/rn+NgfnrfCtdyepuJmU22Igw0P7Ns2rErz2WqivA31CcWiUQZrL9HPmEgkpF666t8JJ+JQGwx+iwOont8ti+NvOuI2jj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 10:10:14AM +0000, Matthew Auld wrote:
>On 29/11/2022 23:26, Niranjana Vishwanathapura wrote:
>>On Wed, Nov 23, 2022 at 11:42:58AM +0000, Matthew Auld wrote:
>>>On 16/11/2022 00:37, Niranjana Vishwanathapura wrote:
>>>>On Tue, Nov 15, 2022 at 03:15:03PM -0800, Niranjana 
>>>>Vishwanathapura wrote:
>>>>>On Tue, Nov 15, 2022 at 08:33:47AM -0800, Niranjana 
>>>>>Vishwanathapura wrote:
>>>>>>On Tue, Nov 15, 2022 at 04:20:54PM +0000, Matthew Auld wrote:
>>>>>>>On 15/11/2022 16:15, Niranjana Vishwanathapura wrote:
>>>>>>>>On Tue, Nov 15, 2022 at 11:05:21AM +0000, Matthew Auld wrote:
>>>>>>>>>On 13/11/2022 07:57, Niranjana Vishwanathapura wrote:
>>>>>>>>>>Asynchronously unbind the vma upon vm_unbind call.
>>>>>>>>>>Fall back to synchronous unbind if backend doesn't support
>>>>>>>>>>async unbind or if async unbind fails.
>>>>>>>>>>
>>>>>>>>>>No need for vm_unbind out fence support as i915 will internally
>>>>>>>>>>handle all sequencing and user need not try to sequence any
>>>>>>>>>>operation with the unbind completion.
>>>>>>>>>>
>>>>>>>>>>v2: use i915_vma_destroy_async in vm_unbind ioctl
>>>>>>>>>>
>>>>>>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>>>>>>><niranjana.vishwanathapura@intel.com>
>>>>>>>>>
>>>>>>>>>This only does it for non-partial vma, right? Or was 
>>>>>>>>>that changed somewhere?
>>>>>>>>>
>>>>>>>>
>>>>>>>>No, it applies to any vma (partial or non-partial).
>>>>>>>>It was so from the beginning.
>>>>>>>
>>>>>>>Doesn't __i915_vma_unbind_async() return an error when 
>>>>>>>mm.pages != vma->pages? IIRC this was discussed before. 
>>>>>>>Just trying to think about the consequences of this 
>>>>>>>change.
>>>>>>
>>>>>>I am not seeing any such restriction. Let me probe and check if there
>>>>>>is any such restriction anywhere in the call chain.
>>>>>
>>>>>I checked and I am not seeing any restriction anywher in the 
>>>>>call chain.
>>>>>
>>>>
>>>>Note that just like binding case, unbinding is also synchronous unless
>>>>there is a pending activity, in which case, it will be asynchronous.
>>>
>>>In __i915_vma_unbind_async() there is:
>>>
>>>if (i915_vma_is_pinned(vma) ||
>>>   &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
>>>       return ERR_PTR(-EAGAIN);
>>>
>>>AFAICT we then also don't get any pipelined moves with such an 
>>>object, if there is such a binding present.
>>
>>I had to remove this check as otherwise for VM_BIND (persistent) mappings,
>>it will alwasy be true and we will always endup with -EAGAIN.
>>Persistent mappings, as they support partial binding, can't have an sg
>>table which is just a pointer to object's sg table.
>
>Ok, maybe make that a seperate patch, since it seems to change the 
>behaviour for more than just persisent mappings, AFAICT.
>

Ok, will do.

Niranjana

>>
>>Niranjana
>>
>>>
>>>>
>>>>Niranjana
>>>>
>>>>>Niranjana
>>>>>
>>>>>>
>>>>>>Niranjana
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>Niranjana
>>>>>>>>
>>>>>>>>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>>
>>>>>>>>>>---
>>>>>>>>>> .../drm/i915/gem/i915_gem_vm_bind_object.c    |  2 +-
>>>>>>>>>> drivers/gpu/drm/i915/i915_vma.c               | 51 
>>>>>>>>>>+++++++++++++++++--
>>>>>>>>>> drivers/gpu/drm/i915/i915_vma.h               |  1 +
>>>>>>>>>> include/uapi/drm/i915_drm.h                   |  3 +-
>>>>>>>>>> 4 files changed, 51 insertions(+), 6 deletions(-)
>>>>>>>>>>
>>>>>>>>>>diff --git 
>>>>>>>>>>a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>>>>>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>>>index d87d1210365b..36651b447966 100644
>>>>>>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>>>>>>>>>@@ -210,7 +210,7 @@ static int 
>>>>>>>>>>i915_gem_vm_unbind_vma(struct i915_address_space 
>>>>>>>>>>*vm,
>>>>>>>>>>      */
>>>>>>>>>>     obj = vma->obj;
>>>>>>>>>>     i915_gem_object_lock(obj, NULL);
>>>>>>>>>>-    i915_vma_destroy(vma);
>>>>>>>>>>+    i915_vma_destroy_async(vma);
>>>>>>>>>>     i915_gem_object_unlock(obj);
>>>>>>>>>>     i915_gem_object_put(obj);
>>>>>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>>>>>>>>>b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>>>index 7cf77c67d755..483d25f2425c 100644
>>>>>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>>>>@@ -42,6 +42,8 @@
>>>>>>>>>> #include "i915_vma.h"
>>>>>>>>>> #include "i915_vma_resource.h"
>>>>>>>>>>+static struct dma_fence 
>>>>>>>>>>*__i915_vma_unbind_async(struct i915_vma *vma);
>>>>>>>>>>+
>>>>>>>>>> static inline void assert_vma_held_evict(const 
>>>>>>>>>>struct i915_vma *vma)
>>>>>>>>>> {
>>>>>>>>>>     /*
>>>>>>>>>>@@ -1713,7 +1715,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>>>>>>>>>     spin_unlock_irq(&gt->closed_lock);
>>>>>>>>>> }
>>>>>>>>>>-static void force_unbind(struct i915_vma *vma)
>>>>>>>>>>+static void force_unbind(struct i915_vma *vma, bool async)
>>>>>>>>>> {
>>>>>>>>>>     if (!drm_mm_node_allocated(&vma->node))
>>>>>>>>>>         return;
>>>>>>>>>>@@ -1727,7 +1729,21 @@ static void 
>>>>>>>>>>force_unbind(struct i915_vma *vma)
>>>>>>>>>>         i915_vma_set_purged(vma);
>>>>>>>>>>     atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>>>>>>>>>>-    WARN_ON(__i915_vma_unbind(vma));
>>>>>>>>>>+    if (async) {
>>>>>>>>>>+        struct dma_fence *fence;
>>>>>>>>>>+
>>>>>>>>>>+        fence = __i915_vma_unbind_async(vma);
>>>>>>>>>>+        if (IS_ERR_OR_NULL(fence)) {
>>>>>>>>>>+            async = false;
>>>>>>>>>>+        } else {
>>>>>>>>>>+            dma_resv_add_fence(vma->obj->base.resv, fence,
>>>>>>>>>>+                       DMA_RESV_USAGE_READ);
>>>>>>>>>>+            dma_fence_put(fence);
>>>>>>>>>>+        }
>>>>>>>>>>+    }
>>>>>>>>>>+
>>>>>>>>>>+    if (!async)
>>>>>>>>>>+        WARN_ON(__i915_vma_unbind(vma));
>>>>>>>>>>     GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>>>>>>>>> }
>>>>>>>>>>@@ -1787,7 +1803,7 @@ void 
>>>>>>>>>>i915_vma_destroy_locked(struct i915_vma *vma)
>>>>>>>>>> {
>>>>>>>>>>     lockdep_assert_held(&vma->vm->mutex);
>>>>>>>>>>-    force_unbind(vma);
>>>>>>>>>>+    force_unbind(vma, false);
>>>>>>>>>>     list_del_init(&vma->vm_link);
>>>>>>>>>>     release_references(vma, vma->vm->gt, false);
>>>>>>>>>> }
>>>>>>>>>>@@ -1798,7 +1814,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>>>>>>>>>     bool vm_ddestroy;
>>>>>>>>>>     mutex_lock(&vma->vm->mutex);
>>>>>>>>>>-    force_unbind(vma);
>>>>>>>>>>+    force_unbind(vma, false);
>>>>>>>>>>+    list_del_init(&vma->vm_link);
>>>>>>>>>>+    vm_ddestroy = vma->vm_ddestroy;
>>>>>>>>>>+    vma->vm_ddestroy = false;
>>>>>>>>>>+
>>>>>>>>>>+    /* vma->vm may be freed when releasing vma->vm->mutex. */
>>>>>>>>>>+    gt = vma->vm->gt;
>>>>>>>>>>+    mutex_unlock(&vma->vm->mutex);
>>>>>>>>>>+    release_references(vma, gt, vm_ddestroy);
>>>>>>>>>>+}
>>>>>>>>>>+
>>>>>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma)
>>>>>>>>>>+{
>>>>>>>>>>+    bool vm_ddestroy, async = vma->obj->mm.rsgt;
>>>>>>>>>>+    struct intel_gt *gt;
>>>>>>>>>>+
>>>>>>>>>>+    if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>>>>>>>>>>+        async = false;
>>>>>>>>>>+
>>>>>>>>>>+    mutex_lock(&vma->vm->mutex);
>>>>>>>>>>+    /*
>>>>>>>>>>+     * Ensure any asynchronous binding is complete while using
>>>>>>>>>>+     * async unbind as we will be releasing the vma here.
>>>>>>>>>>+     */
>>>>>>>>>>+    if (async && i915_active_wait(&vma->active))
>>>>>>>>>>+        async = false;
>>>>>>>>>>+
>>>>>>>>>>+    force_unbind(vma, async);
>>>>>>>>>>     list_del_init(&vma->vm_link);
>>>>>>>>>>     vm_ddestroy = vma->vm_ddestroy;
>>>>>>>>>>     vma->vm_ddestroy = false;
>>>>>>>>>>diff --git a/drivers/gpu/drm/i915/i915_vma.h 
>>>>>>>>>>b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>>>index 737ef310d046..25f15965dab8 100644
>>>>>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.h
>>>>>>>>>>@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>>>>>>>>> void i915_vma_destroy_locked(struct i915_vma *vma);
>>>>>>>>>> void i915_vma_destroy(struct i915_vma *vma);
>>>>>>>>>>+void i915_vma_destroy_async(struct i915_vma *vma);
>>>>>>>>>> #define assert_vma_held(vma) 
>>>>>>>>>>dma_resv_assert_held((vma)->obj->base.resv)
>>>>>>>>>>diff --git a/include/uapi/drm/i915_drm.h 
>>>>>>>>>>b/include/uapi/drm/i915_drm.h
>>>>>>>>>>index e5600f358a15..431d40bb1dee 100644
>>>>>>>>>>--- a/include/uapi/drm/i915_drm.h
>>>>>>>>>>+++ b/include/uapi/drm/i915_drm.h
>>>>>>>>>>@@ -3969,7 +3969,8 @@ struct drm_i915_gem_vm_bind {
>>>>>>>>>>  * any error.
>>>>>>>>>>  *
>>>>>>>>>>  * VM_BIND/UNBIND ioctl calls executed on different 
>>>>>>>>>>CPU threads concurrently
>>>>>>>>>>- * are not ordered.
>>>>>>>>>>+ * are not ordered. Furthermore, parts of the 
>>>>>>>>>>VM_UNBIND operation can be done
>>>>>>>>>>+ * asynchronously.
>>>>>>>>>>  */
>>>>>>>>>> struct drm_i915_gem_vm_unbind {
>>>>>>>>>>     /** @vm_id: VM (address space) id to bind */
