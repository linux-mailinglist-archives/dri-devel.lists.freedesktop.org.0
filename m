Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6E4D9007
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8693D10E1C8;
	Mon, 14 Mar 2022 23:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9596510E1C8;
 Mon, 14 Mar 2022 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647299181; x=1678835181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=196gczuuBXzGtDISHlfJVtwXK6P2QKI5BzrJio1qo4A=;
 b=aWTuvgwV7LqjT45RIsdO5QxXp+Rn0+rW64b4MYVSTnJDBARp9wLiMdoH
 gDHSzo4aX2sIQbub+fxDrVjpT9KHcG8u9xadDLmia4Q7CPyqc5Iq8YBrs
 GGi6saeBE9SpJQGJW6My5F9YMx9l0sL2bHp2AGzXUEWJs9SOkuXdNgI0o
 QojrSpJohLZFi5269OBVqgv2oGwv9jpbkjsy7T84Q4n/n2fLej5olA1iW
 1cV7IsMOC2hf8I2e5QZcPB6j/3QFIRE1V/0d1oJ8jptgaKtXHMZgvoLwP
 bKqdt24lA5oB7cBJZfmiUFNoPMtPOjIN8iJjdD4pqgi2dJfjuFAKSCerT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="255893570"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="255893570"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="580298737"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 14 Mar 2022 16:06:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 16:06:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 16:06:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 16:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBMQzGQjYC+y6EMDWZIt8sL5zI4QrG7lnqQdWnJpExVvNdrRtPPvQ5tZRxGIl0CwS53FQvRCj0OPCabHUrdKnLoXzs42EdY8Z3n1FzjtK7bCiRcwZDpGaY79k3DetW7lSJ9h+9xske+B5UwnkFHoEokfN2qjynxKCCd28SHQIwxG3T9vtjYdbZ/223vlReucICd5t98dV/dKUe+capSlXdjH4Y42aSPbeldpBLYTrFwDCFxbWeQlLz7htXNRa7n7LA/YLhHalF3MTOzUkineTS1RzKL6piICxdTVxdYMLPuTLzd0oLVDxnNXLXlF4X7eYO/kWb8IiOy4hLjl7ZP4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7B3np51GZpojMRZJQGq1gJBzCS0dCbqxocBpAvzNfQ=;
 b=B2d+E9XA5oyTycPEieJwwJRqurK/D/GBAWvfX9RyJFrcciX1miQGBfnuiLxFMkWf1ZQOcd4i7OmdpDylEK1B6/cJzKZyK/CjkFRoNtNRkhwXUvItSmPzsLalqP9a8KD0aocYRadS+yb3b+ePgRUfjjAlveOLhzp2++JNgXpfvm5+k90FEWpmuxo4Tf85CAhZwQMQaCYHDYAjZF44o3l2SZrk9I7/PjeR4ppD47LCZmk2SjQ5fbUSsMiJILNNKgYNana/oeJl50DPYb38eiO0TQgN8NpY7S8qQoOg8z0pbw+xr/qK41doHqJfCwcgYNszLKUaehudKeKnXtluZ8kc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Mon, 14 Mar
 2022 23:06:16 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 23:06:16 +0000
Message-ID: <109ec27b-3957-f13f-aec7-18fda2819ee0@intel.com>
Date: Mon, 14 Mar 2022 16:06:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gem: Remove logic for
 wbinvd_on_all_cpus
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20220222172649.331661-1-michael.cheng@intel.com>
 <20220222172649.331661-3-michael.cheng@intel.com>
 <40f820e6-6b28-fd8a-b058-13f0bbbf71fc@shipmail.org>
 <20220308175803.pszuli2ms3e7tah3@ldmartin-desk2>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <20220308175803.pszuli2ms3e7tah3@ldmartin-desk2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:510:e::35) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6b1bf30-b914-4e7b-7a0f-08da060f3e4d
X-MS-TrafficTypeDiagnostic: BL1PR11MB5980:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BL1PR11MB59806F64D989466402960C51E10F9@BL1PR11MB5980.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nu6nuL+7O1cQliMhliIyXYzsUosa6XHn7fzJUEIAMuZkviio22m87wxK55EpJaGu0dA3eNkqN3waQ49U45R9lInrN9t9qutpJbBP6LeA0zVleXm0gCyIArXEvLxhw1UFJrL8fxcX8ZKd4B8/XQ4EGXjASVOFvBhul6TbnIQqimcRaELl0HvZsEvnapHTFdCR89JyD/9he0Fant3Z0ju8NvNR67mHyJwjTAe0H0QHVrQzejW7imAv75xt7Jkt6FdHElOFONJar/IVi2nuYroM5t1v6ph2EspjXt4j8NI9fKfBurXHT9q6NVd4GkNXuNX8Lcrt5aZjLVcVPOsLyWeVfUcK8HDdBctRiJfNENInH662EUUbQERA521bgfU/F0MY0gkMQFkyVT76JfEkBj/2d+rFHif7oyzl/Cko34U5TXv39Tkk6jxEnBasm6dRy6/5Lrg+69GE5s8N17LE6T6X2jBBqE24kGXCBUfHutwgESf4Vpw0BRKXoy7J+F9EguAliSJaN02iW8woCfSazvDzEZOLPHlsO+YJAUIFtTY6TvOrGQ4s5tGjBmBN4eN+U938OC+T7ZsXJudPeMWuJys8TBbImYmpV+Aba1R5QfSUFUOoEYMv/iWWkYUP7NzXk+VdO5UdO65w3LMkCEfuFYetuBPQg5ihQz92T+RbLlogvmRAKe8sfVpeRopv1ig7ybwch0skVm5qZr107jvAf5dtX5bG9mCHq+VWY8pRtoXx5Cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(38100700002)(316002)(66574015)(508600001)(66556008)(966005)(4326008)(66946007)(8676002)(66476007)(6486002)(2616005)(26005)(31686004)(53546011)(6506007)(36756003)(83380400001)(44832011)(2906002)(6512007)(5660300002)(110136005)(6666004)(86362001)(8936002)(31696002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlFODFKU0JudUNvTTVoWlFhdTVTTWJIbmh4QWEwczVyS0xkeUdKNW0zdXpM?=
 =?utf-8?B?NCs0VnV5WHkySUJPSlMyVzJVVkZVUGlZbnBaZnhkZXovTUJZdkIvbFM4QzN6?=
 =?utf-8?B?MmVKQ1Y2T0VRaG1nMkJ5QnRXYmVKZWlna2c3QkNDNFZjaDhtQ0g3TjVWMW8y?=
 =?utf-8?B?NWR5Vkc5N3pWNGNTR0IzeUExNWl1NHhVeUowUXU1SWx3eUZOTWdKeE05Nm1r?=
 =?utf-8?B?RkZwTmFHb1F3L2crRWFVYUhxQ0RTbm5GekdBT1hic1FUVlYvSmEweFBubmRi?=
 =?utf-8?B?S2p1WE9IMWZ4MUZNOUFQV1hqNHZ3UXhTOHNWSHVNeStGYW0wZDNjYnNkSFlj?=
 =?utf-8?B?OGJxWUY1WlE1d2tCem9pUEd5bGtYdmdSRWIvdWcvMjB5dUE0bXFLUXZ5eWpE?=
 =?utf-8?B?dHJSbmtsTFNQeU5tMWx6bHZudTNCbjFCQnoyZHdVdUkzUzJBQUFDSVpHcE5w?=
 =?utf-8?B?WVRLcWY5Wk16Q2VxeWlqYkw0ejQraE8raUswTll4Ky9YeTR6bnRlVHVYTE1Q?=
 =?utf-8?B?bkRySkRCUElKcU82eFVhNGdNT2Zxa2orSWtWU2RzWUwyOGxQTXA3MXVmU0dB?=
 =?utf-8?B?WVo3eEpndVVIU2RFdTVid3RlR1BoOEZobklYWU5JR1FwYWcyeDFVTHVRV1Zo?=
 =?utf-8?B?QXhPZklBaTZDZ3JqRWFUUnFCZ3NiYm5YVVgzZjVKUGgvbUJwdWxicWZERC8v?=
 =?utf-8?B?NDVVYkZ2aW8raGtaS3V4c3FUd0hiOFpNbGYzZFNVckYxWG9jT1lXNnZnUHFG?=
 =?utf-8?B?TGhzbWxDL2Q3eXQyKzBKWkIxaDBUOUVHdUJsNHhWdHZQcFlEbTJ3bkFKL1U4?=
 =?utf-8?B?TGdPTU13d2FyN0JkV1lsTkNydWtybjV0UGl3ZjFta21qclhjQzFSelA0bGJw?=
 =?utf-8?B?VzRSejJwelc0Vkl6K2tSeW50SmxLV1kvWFRZbElOQU1FQk1ZVWtzOE9hdk96?=
 =?utf-8?B?ZldNU1pNby9kUTJqcDBMdUJ4VzgwelQ2NURJYlYxR01rWFJvcmNsQytTSHA2?=
 =?utf-8?B?eDlma2dOM1g1ZDVsU1FSVkdZOGwxK2pUaHhBZHF3UmhlNGdvWVZzWisrQVhX?=
 =?utf-8?B?cUI5RVNzdy9pTGVyMUl3NFBpVkpJSWxUQ3dGeVRYZ0o2NnlrV2o3N29ZU2lz?=
 =?utf-8?B?bVh2RjB1SU9sd2Z0OFRSSk10UWxMNzZGcG1tSHRzZEE2VjViajg1MjJscVpI?=
 =?utf-8?B?WVpZMmRJVTlOSWRzV2x3OFBPRVMyd3VreDBseW42ZElJbGt5cnRRUjFITmtG?=
 =?utf-8?B?MndXS29sVUFncTFoTlFtZTdBakJZYU5CUVZRRGxMUG1tZUU5WjhFNFRuTjNH?=
 =?utf-8?B?V1Q2RWJTWjh6N3FVUGxIbU1Hblg3K0g3MVJFbVQ4QzZHYzR0cEEzMklmOHAw?=
 =?utf-8?B?QjkyQ0Z5UHRBK1NVUjBrSUlWVHljYUhCRDNGUmVkU2JqL2JtS2JWUW11a2wr?=
 =?utf-8?B?OE5aSE85Y2V3YlozcW9UZ1ZjQ29xSUpsUm5IZGQvRTEwNmRsd3RpbXp0eUJm?=
 =?utf-8?B?UDJRNmZUcTgyd3BUMFlsNnZTQzlTd2QrdlhpWDNMNitpa3FXYU5wdlBaTk4v?=
 =?utf-8?B?TGFTdHVhSG9OSkhFYTRBdVZkQWtzMmozeHp5T25DazVrQnVkWEIwZ2k4azhQ?=
 =?utf-8?B?RXp6QWNuNzdGeXpVL3dPVUZmUG5GNitOckt5OGZSSm9MSENvSlJacHhnbVI1?=
 =?utf-8?B?ckZUQ0E1RzV4bm5zd1V4LzlZd0hOOEhjSlpaSHkxUm9SclFwWmI0MSthS2Ra?=
 =?utf-8?B?N3NIcVEzYlorY3RqWFpZTlN1Y3BZOFRCUWZNUnoyVlpKS0RzSkpGbGJVNFA2?=
 =?utf-8?B?d1M4ZmxLT01VbHVkRmhJT0hJaVBuQUdZRzF4TUp1RThJRkJwbjJxRDIraW0z?=
 =?utf-8?B?V0N2ODhWQjRINHl4TEkvNlIzZUVoV0hzdXRQODl4YXh6NnNPSlNOZm1xei9s?=
 =?utf-8?B?MTJIWjhvQ0NLVDNjdW9lWTY0Wk1YZS9RS2c4T1J6RFRFbTduK3FITlZvcHJL?=
 =?utf-8?B?QWdWZXM2SHNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b1bf30-b914-4e7b-7a0f-08da060f3e4d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 23:06:16.7606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e72Zizcsuf5PdLG/sAXtiAo9LOuVCLq8HIHwNXwF74miq+AH3cE75LYwkB1YWzzTx6wvGDh5+DeX74SaBgk+vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

On 2022-03-08 10:58 a.m., Lucas De Marchi wrote:

> On Tue, Feb 22, 2022 at 08:24:31PM +0100, Thomas Hellström (Intel) wrote:
>> Hi, Michael,
>>
>> On 2/22/22 18:26, Michael Cheng wrote:
>>> This patch removes logic for wbinvd_on_all_cpus and brings in
>>> drm_cache.h. This header has the logic that outputs a warning
>>> when wbinvd_on_all_cpus when its being used on a non-x86 platform.
>>>
>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>
>> Linus has been pretty clear that he won't accept patches that add 
>> macros that works on one arch and warns on others anymore in i915 and 
>> I figure even less so in drm code.
>>
>> So we shouldn't try to move this out to drm. Instead we should 
>> restrict the wbinvd() inside our driver to integrated and X86 only. 
>> For discrete on all architectures we should be coherent and hence not 
>> be needing wbinvd().
>
> the warn is there to guarantee we don't forget a code path. However
> simply adding the warning is the real issue: we should rather guarantee
> we can't take that code path. I.e., as you said refactor the code to
> guarantee it works on discrete without that logic.
>
>     $ git grep wbinvd_on_all_cpus -- drivers/gpu/drm/
>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>     drivers/gpu/drm/drm_cache.c:    if (wbinvd_on_all_cpus())
>
>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:      * Currently we 
> just do a heavy handed wbinvd_on_all_cpus() here since
>     drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: wbinvd_on_all_cpus();
>
> It looks like we actually go through this on other discrete graphics. Is
> this missing an update like s/IS_DG1/IS_DGFX/? Or should we be doing
> something else?
>
>     drivers/gpu/drm/i915/gem/i915_gem_pm.c:#define wbinvd_on_all_cpus() \
>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>
> Those are for suspend. Revert ac05a22cd07a ("drm/i915/gem: Almagamate 
> clflushes on suspend")
> or extract that part to a helper function and implement it differently
> for arches != x86?
>
>     drivers/gpu/drm/i915/gem/i915_gem_pm.c: wbinvd_on_all_cpus();
>
> Probably take a similar approach to the suspend case?
>
>     drivers/gpu/drm/i915/gt/intel_ggtt.c: wbinvd_on_all_cpus();

For a helper function, I have a #define for all non x86 architecture 
that gives a warn on [1] within drm_cache.h Or would it be better to 
implement a helper function instead?

[1]. https://patchwork.freedesktop.org/patch/475750/?series=99991&rev=5

>
> This one comes from 64b95df91f44 ("drm/i915: Assume exclusive access 
> to objects inside resume")
> Shouldn't that be doing the invalidate if the write domain is 
> I915_GEM_DOMAIN_CPU
>
> In the end I think the warning would be ok if it was the cherry on top,
> to guarantee we don't take those paths. We should probably have a
> warn_once() to avoid spamming the console. But we  also have to rework
> the code to guarantee we are the only ones who may eventually get that
> warning, and not the end user.
Could we first add the helper function/#define for now, and rework the 
code in a different patch series?
>
> Lucas De Marchi
>
>>
>> Thanks,
>>
>> /Thomas
>>
>>
