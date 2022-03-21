Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F34E2F65
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088C110E376;
	Mon, 21 Mar 2022 17:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565910E376;
 Mon, 21 Mar 2022 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647885095; x=1679421095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UvzsXuLSr3AwYxs03/HLuDRvAtQhsj4VjKTx8qquykk=;
 b=J4FaIlU4h900C88CiI55PnjD/4/oO75FhkF+Np2c3zqHFUYgzYgk3Vo9
 Rj8RzUKTVUt/mHIJGUwnViBbFvO8Ow+5dw2BfIAFjeL5F1DqAQVrRKIY5
 aDzzGynSVbRqvuwvfpW/Van+qprTP8Aeg0dCARTyA42CiyokSqImSHTTO
 sL1Mxbm+6DSVJBkniQqZb68xzsPnQhuZ/x1d45ufIrmuITqk/Zqllj7rh
 gzW7A1KPjwtHoFSbog4m/TRmn0d59HHo9gNbph0SlKswSqSwqZiiPB10d
 PFpLWzYqOTMKpTrW3QMVLMrQ/VKmaKIq7urykAUn2hEurYmGYInGGArSA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255178704"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="255178704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="515019388"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 21 Mar 2022 10:51:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 10:51:34 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 10:51:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 10:51:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 10:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2XhaA4Z7jDAixl1ykkCyBQNhgudWWkrQD5J8aWHWVtiI02LTo42BuhRfP1jnParfDsgNYQuriy1P2b6NBQHxb6fdaYJeX/Pc85b5Su5Gd0ZfDDxsnyUJ8EDKcTglvThGXZm10XYQ4mUL9L6r3eRQIiXINVUnXfRtFzP//XPQ7Z4hi13z1h2bSZwNcPJy7jF99ZoetD64N6kn2E6/PwI7pypnPNdmIV/gh5dIzdbloc55SMQ36jwfnG7Ct0p93+c+1n2cZ51IFEpqXi2bwCgwLXuJpzL46QAG9KfDPIHU3uGnnvtW9e89QjTnbsixOHTlhSHHEl4Rl1I/A0STwVEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymA5c35k1MW+1Lm3T7xKtwKsQ0E38nFi6DZ3prKicV4=;
 b=BAG2oXT/VR5aZPMOt6zesmxxcoiYhQ0FB67XOXGpC1KwcvnqvTevU+qGfBfi6nRoaau8F6g3Gb3lXVUUdxV74py+zHG9/imgfASeZ8t/ajiJftYbVPnvLJY5Dkzb7H86piuLYCRV0zU7HccloEAqX0g0UxgsFl1nECHXDxr2oHLPOfINQtw7bI2yPXudJ9eWqzfnwtH6MMILQmSRaz9gGSW3/ClbdVMMvjpJcRh2xe4nktrAJ45PtgD1BCAG8ho4jl83vApxQta4+3nZwoyTJmZZ6fawg+KC5WyRbH5608onDAcnKvhsMNKHXgqMual7fkzLheNdOvn5RlZC1La/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 17:51:31 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 17:51:31 +0000
Message-ID: <8c5358d7-a671-f147-b3d0-2ae63fe88423@intel.com>
Date: Mon, 21 Mar 2022 10:51:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
 <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
 <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:300:ee::31) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80180543-3a41-41b9-b117-08da0b636e76
X-MS-TrafficTypeDiagnostic: BY5PR11MB3909:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB39099993D2EFBF20FA6BA37CE1169@BY5PR11MB3909.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WSAUPkk5uL35ZrsDPLlVB/icBUSH+rvMbWhgwutK2UgZlNah71SOvBoG/UYmXwHE3Emyqb9tR8wGPF0kvjk7mDzpXVBzQ3bU2xs1rz0OjwK8s+EpVss/+BmMjYcrTlKId/xbxxfxoSJE/pysk+NUq5iDxMciQaUR0+HbtY8EMjAnusuvJBBGevA5cpgErbZZfVlHW34Xf41vhbxAv9tfiUB7EhI5Mb4ToOzVrLfxgcfK06JYrCVd8c7K9shnBXJ1RkInKH8SsQg+QlxjOe7/I7hJ6F0dAd4RzaM+2KJ82VSP9ZZa8lZDt63Ns35eXK+OQWdVjRkMaE3kI1X3+claQ3QRSfmWVTC3S/MKxAq0SCIhLCuzTa7bmt5s7bDjZ50o9w2KvTJc/vNC1aalfwdk/dqha3oNfrRiXxn1Gy286/qlthcZhv+9cOxaPxmwPqUbefWE5cbiexmgG1I1FK1ii/2udd3+rCbKobQsjiOFkUfalBdFCm0xVgnyAwztdXcAscn2X8jtu+FBvBOw3AYCJAkWB9mB3O9vL1p2Cr2S8DFsdORZsnyc9ykvVP5YFqG0v49mquAc+6d7vOHrI5ZUz1tk9SspNBvz6Qcx0cDovoeeTBtvCdyyL+VzHBeEIhITRxycMfbbybTCJar3MxNB3StHV9eJz8dYnSRf2O5aHAEjH14rOzmgUovLuBmAB9Pn/B8tYReo15V/59ta3EwCw6qSwY5qSTo3n+etioCGcWjYd7m6zW/mntjBlhvifGLTosjIJ9Wwy+Ec4TdXmZim4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(66556008)(66476007)(66946007)(82960400001)(6666004)(38100700002)(4326008)(508600001)(8676002)(83380400001)(36756003)(31686004)(186003)(44832011)(8936002)(5660300002)(6512007)(2906002)(53546011)(31696002)(316002)(86362001)(6506007)(54906003)(6486002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anR1K1JpRWtUdE9aeDVCYlVpRGdOM1ZEU2prSjlNdHR4TVNQRlhsejdCc0d5?=
 =?utf-8?B?VEkvQ1pnaTRXdmMxNEZyVzJOa1hTRzYzN1B4bWRBRVNjajRQcWQ0ODFicEFs?=
 =?utf-8?B?eVFnaVRoSFpKQVNkbnJ5eXJKQm94c0xXcWJyc1FhaUlsVU9RSWxhRWswOVJH?=
 =?utf-8?B?SFhJb0huVG1MUGFkZDRsTXlzT0Ewb0swVWpwWHVUN0xzVFVmNUpEaVhDV2h1?=
 =?utf-8?B?ZXZZT2svMkR0STlzaDBHS0l3dXFaTXNPNGNuc05qV2J1ZWxBRUdxdUtZcVdH?=
 =?utf-8?B?WjlZQk1WM1hLUDZiY1lvNjEvVEUrT2ordzJVbVZENktyTS9ndnQ2NnFoaU90?=
 =?utf-8?B?NXNscnBGV2swTVBYeGQrcVNOcCtsWEZKYTA3Ly9MTG1MR0xYNWdRRlBxSnFY?=
 =?utf-8?B?T3g3YldYV05rSEhnQ0hON1k1V3c3YWdsTGgyYks3Zi9IYWZZOTNCc0d1KzRy?=
 =?utf-8?B?SnM1VzZteVVrU0tEL0UrdUNPMm5BY3FpdERiYVVEYWNnUWFhV0h6WnFiL2Mx?=
 =?utf-8?B?Y2dQb0JaejdXWjRzS0RZUEIzUXFieHFDeVJJMFoxZVBLcHJhRkJBYzZTb1Rp?=
 =?utf-8?B?d0tXd0twMUg3Z09kZlJ1YloxYmlBVHpNa3hQclJkQXFDTDNObTcySlp3d1k4?=
 =?utf-8?B?U2dUQWVNL2h2R0YwKzc2blR1dUVuZlk0dW15TU5LOUFkdUVpTlBOd0w3OE14?=
 =?utf-8?B?MXFrNzRvT2JEeDVTdUdNQjZRdlJFTk5BTWd6MnY4b1dxODdaVkIvME5BUHUv?=
 =?utf-8?B?dlRFMnJTeC90eldCQjNEdjAwcS9pWE1rR2VvOGFSamgrZTRZU3FlTXNYZnpX?=
 =?utf-8?B?S3Z1UGt5UUpsRzRMZkdBU3BZVUM3Um5hcGRjZGJteXVCQVpRUnZ5TEFuQ3dz?=
 =?utf-8?B?WEhLUUtKUnN4aFlDN252UW9yZkNkS08xRFpjQlprV0VGMUFBeFRheUo3dmo0?=
 =?utf-8?B?bUUyOHp3dHQ0cGhXVEFaZXRxcGNOYkdYWUtLeUszSFNCVUo1MUpHZUxwbVlQ?=
 =?utf-8?B?TmVicTl0K3ZJekRTeWVSRHlvOE9RNG1YQkxEbmc5akxHcWZzUFdFeUQ5OVBW?=
 =?utf-8?B?RmltT1RldXdUVXN2a3ltenQwWXJNM0dtRHUxeHZYTWV4eTV0aHVmYlFueloy?=
 =?utf-8?B?T2tGSTNOV240OHVQR2UwRi9tQTJpK0x2akl3UHRkWVVEbkhFdE16NDZ0NFM0?=
 =?utf-8?B?MHB0N3ZYZno0YXBSZDhsaDlnRWxNUHNaZXp5VTIxWmsrVDVkblplUnFKRjIw?=
 =?utf-8?B?UjJGTFpoWEpaaVZrZ0RyL2hoY1lVa2xpbmxVT2t3N1FWNlBFeE00SFE2ajd5?=
 =?utf-8?B?SHEzSS8yUnFpbXhVRkZMMWFOU0V5bE1DRk9qeU5menZvbmhxSHh4aEI4cHB5?=
 =?utf-8?B?V2NZaEZueTdZeWtTU3R1UC9DTmFUdGRKUGtUajFMTStla1dlNGdPSUxUbU5r?=
 =?utf-8?B?dU5uUGZBY0QydzNhSDMrektmQ0cvS3RLZnJCeUdaUHdFdG41WWlKOUpZVy92?=
 =?utf-8?B?Rm50NTdkRWNuSXlNK1BSYTd5UnZIMU1POVgySlV6cVdQQkJJNldIZnRta3M3?=
 =?utf-8?B?WU9oQkFqdWszN3VKU1lnNWlEZUd6OTlqbmhZSE5qRGN3SVQ5dFR4a1B1VkUy?=
 =?utf-8?B?WXU1R1lVWUlncWd0Ky9tOEd3U2Z2eFhKbjdIRm43bTB4Wk15Q3p0TUQ5ZS9I?=
 =?utf-8?B?U1V5MHc4aEtMMXdYQWRKQngxN0hETXdNK0hMYU9kVUppck8reFpZY1pNeU1l?=
 =?utf-8?B?eFNXT2l0WjhKdDQ4TG5yaGExSk5HZVA4eEY2LzlwWUtWUVo2N0xScVhlQnVF?=
 =?utf-8?B?eDNJczNRMXcxZTh4TWRRN2IrMjJ2VlFmcVNTMWpCZWFXcEthTTVMdGZzaVpm?=
 =?utf-8?B?RDByblZFTkNZRUZHSGRhZ0RGcnNhbDB4cmh4TnNmZjVXbkNsaXEyNzVTdzhE?=
 =?utf-8?B?WlFJK0lCOEJzZkRyS3BYVEFha21Mbkovem5ucmY2dEhrSHZQcW1IQTlmblNX?=
 =?utf-8?B?NVlSajU5TDc0dkFsT0lWT09nbzcwOG5IMEFjaHRsMEdhbVBVdTRreldsSkUx?=
 =?utf-8?B?ZVR6THFLV2kwNE53MzNzTC82WXcyZFVKZkdFdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80180543-3a41-41b9-b117-08da0b636e76
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:51:31.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEEYHSEZo2odvoI/Wiy/B2xCk7Y2iGKp1UABqrrOEOreYSlw4TSW37gGeSfo8p7XOIDVDmoH0TypGn3nApSPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3909
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
Cc: thomas.hellstrom@linux.intel.com, wayne.boyer@intel.com,
 daniel.vetter@ffwll.ch, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, Catalin
 Marinas <catalin.marinas@arm.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-21 10:28 a.m., Tvrtko Ursulin wrote:
>
> On 21/03/2022 16:31, Michael Cheng wrote:
>> On 2022-03-21 3:30 a.m., Tvrtko Ursulin wrote:
>>
>>>
>>> On 19/03/2022 19:42, Michael Cheng wrote:
>>>> Previous concern with using drm_clflush_sg was that we don't know 
>>>> what the
>>>> sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
>>>> everything at once to avoid paranoia.
>>>
>>> And now we know, or we know it is not a concern?
>>>
>>>> To make i915 more architecture-neutral and be less paranoid, lets 
>>>> attempt to
>>>
>>> "Lets attempt" as we don't know if this will work and/or what 
>>> can/will break?
>>
>> Yes, but it seems like there's no regression with IGT .
>>
>> If there's a big hit in performance, or if this solution gets 
>> accepted and the bug reports come flying in, we can explore other 
>> solutions. But speaking to Dan Vetter, ideal solution would be to 
>> avoid any calls directly to wbinvd, and use drm helpers in place.
>>
>> +Daniel for any extra input.
>>
>>>> use drm_clflush_sg to flush the pages for when the GPU wants to read
>>>> from main memory.
>>>>
>>>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
>>>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> index f5062d0c6333..b0a5baaebc43 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>> @@ -8,6 +8,7 @@
>>>>   #include <linux/highmem.h>
>>>>   #include <linux/dma-resv.h>
>>>>   #include <linux/module.h>
>>>> +#include <drm/drm_cache.h>
>>>>     #include <asm/smp.h>
>>>>   @@ -250,16 +251,10 @@ static int 
>>>> i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>>>>        * DG1 is special here since it still snoops transactions 
>>>> even with
>>>>        * CACHE_NONE. This is not the case with other HAS_SNOOP 
>>>> platforms. We
>>>>        * might need to revisit this as we add new discrete platforms.
>>>> -     *
>>>> -     * XXX: Consider doing a vmap flush or something, where possible.
>>>> -     * Currently we just do a heavy handed wbinvd_on_all_cpus() 
>>>> here since
>>>> -     * the underlying sg_table might not even point to struct 
>>>> pages, so we
>>>> -     * can't just call drm_clflush_sg or similar, like we do 
>>>> elsewhere in
>>>> -     * the driver.
>>>>        */
>>>>       if (i915_gem_object_can_bypass_llc(obj) ||
>>>>           (!HAS_LLC(i915) && !IS_DG1(i915)))
>>>> -        wbinvd_on_all_cpus();
>>>> +        drm_clflush_sg(pages);
>>>
>>> And as noticed before, drm_clfush_sg still can call 
>>> wbinvd_on_all_cpus so are you just punting the issue somewhere else? 
>>> How will it be solved there?
>>>
>> Instead of calling an x86 asm directly, we are using what's available 
>> to use to make the driver more architecture neutral. Agreeing with 
>> Thomas, this solution falls within the "prefer range-aware clflush 
>> apis", and since some other generation platform doesn't support 
>> clflushopt, it will fall back to using wbinvd.
>
> Right, I was trying to get the information on what will drm_clflush_sg 
> do on Arm. Is it range based or global there, or if the latter exists.
>
CCing a few ARM folks to see if they have any inputs.

+ Catalin And Robin

> Regards,
>
> Tvrtko
