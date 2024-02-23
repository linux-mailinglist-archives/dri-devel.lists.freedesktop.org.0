Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111A861BA9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 19:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2144C10EC8F;
	Fri, 23 Feb 2024 18:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwGYY6lL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C517F10EC8F;
 Fri, 23 Feb 2024 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708713112; x=1740249112;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PlTE0y0wYamMAZyh8GSDyjzJyuqdwSOnKlCaiKnDfZE=;
 b=QwGYY6lL/8OnePPssucIm5zl4n/ZAfCSSEJJsUIYrddZxap9wxxielEN
 K+fZL0AgQCSthzr1WGXoH2AOPAETCm01iIA9Uo2d5uOjma9R7L9sqWBQF
 82qzOjvfuwyd2hx7/iOe/ar9sbs93ujtcT2nXDl866UC6NFA0WkTeiiK0
 mYxFoSTiH76hUdMTqAQjgVDssRhLVST0yLfgy+S7cTpNC9CdoVUZBa+EG
 2CPxhVfbC3/tTB6aw6DILaC0ghJ4GF3bL08OreXxGom9Ww5Zt3GiH8TBv
 F1lS15Bcv7FZuGbxOjrr0esQ/w0R/nkNXeGXO/GQZh+MQlbwcZYC8Pz4H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6828391"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6828391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 10:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10690636"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 10:31:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:31:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:31:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:31:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 10:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1wpPpg1d9EITgEz2EwyY+0AOzUOFyiyfPva8xFpI51feXk1zTq5VONAHt+ZWm9hZ7n1/yIRZyayydCqJk2ErES9tm/RAymGItFY7zhbIvtCM6pFGljUY54s1O8P+UmwrewPrXzlKcqEb7YcXEdWIiv1w8oCEkwYtsMtREBanItwc5D0TbwHm5DRpcNpZTDTSGE/eoVyi1RTluB2FqyKnrl3yO3MOLIySGILz/33K4m8uupoVIaFBRSG/VitizPwTR9EPVCGZRF9x6lNzmGSQSnQ5uQF5/mNbiryUWDqSJ20UPeVJ+j37NKFmn7jC/fR89j+aRVWvzvRZvkP7qB17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea9JitB+8zAPAgsj9YHP4PLlOzRFIzwyIeVF4xvzwUA=;
 b=A/Ot8xAN1jRc/pqhdVD7JxYqiepTWWDHt7Qb1ikkdXz9+q0qRqtfLZUdC7uqqEOfxm+fcpd1TLh4jS1/eaWqw1GmwHJqmrgNeemfachORt3HngyiAtPBrqF8eJZmg/kZ6/WHeeVP7tI2vFwaKIB8dJR1BlYCs9U/OG7CNcCitq0+pse/MKV1Ru1uoAqVylECrp6U0UqDKR8Y98MKRu3YxRQHHWS8HNQUVZ5X7TYgVTgjQSDqeExQ2tKSzDPTvJOXBvf3XjbGRr9plpdzpU3yVe0qPfg6wN9e5Y6QzERlziiSUt70yGRfwMisofsIav6cOIVloVOhAjoOZRYULweHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Fri, 23 Feb
 2024 18:31:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::8258:3a70:b7c5:1238]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::8258:3a70:b7c5:1238%7]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 18:31:46 +0000
Message-ID: <a3b55547-06cc-4b94-aaa9-9560bfced0db@intel.com>
Date: Fri, 23 Feb 2024 10:31:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Add Compute context hint
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240221001416.696780-1-vinay.belgaumkar@intel.com>
 <8e03bde7-fba2-4b8b-ae33-b502cf1a8e4f@linux.intel.com>
 <ZdZq9NH0VYbL-QV8@intel.com>
 <50e4ed39-bc70-471c-be44-f61920405f67@linux.intel.com>
 <166befb6-a667-4c24-85ed-efb18bd3b7d7@intel.com>
 <9702f85a-17f2-4c45-bd17-fc0a07beb635@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <9702f85a-17f2-4c45-bd17-fc0a07beb635@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 74eaebce-82ff-45c1-ddf8-08dc349db0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXlR4nP492s2B3PgexFRA2TOh3pKZ7Oekz3WFykCNZVRbYKzf9w5Abq93xVNE29rJ1r17YXoapjKHTaXmBKN3FIG9O9rIDIZzM2wyn6FKlFADNe9NjAso2NKE355PDg4srgtzYhKLQgUgT1suCAYKYhlD6YcQY6d/K5XAsUSuIMsmuq2dTOwO9lIR4PWgdwTYrv1v6OPC/dsijob5XeA6llDTd4xea8HSCnkJBMpdeAcCbCjDAeU42LnOPfh42goKWqGZKWEg4/X2TTbgRmonL6ICO3FGVHN342fjZtS3nbgkKvt45aMVOvui+ttALRf2Wreh2HhOfAfjKnNxCtb+ee52Q6gyCAuRl8zwlKXASMFe32Daw2fzQbLetqJwsu5GUHdWIbUXwjHtQVjF/aodxZoVJ2DWpBVXbMXEKfowZmLEbKYGMs8++com2kVNMGMcORJpochebclCH1dVTTGMNUgXfMo0lErm0nr48W/KqC7keVOrrdvdHcZ//n4o6cfYu+KwJvT4TTvKCitgL4iqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStmWGEraG9rRk44N28yMnI5MEJVQWVSRk1TcXBSa25CK0hkR2Y1UkNrYUtu?=
 =?utf-8?B?LzhQQlhKQ2JmSDhFOEZMS0h2ZnNYM242RjdmZ2ZLaDZCNnJSOHUrbjhqaTli?=
 =?utf-8?B?czhReDBYSTMxSm45V0tabDFJRDJEaVpDVk4zSTgvRWVkMngzbzRVUk9hbVFH?=
 =?utf-8?B?ckJvSGl6dUl2dzVDdklWYVJHaVRCQ1MzTXUvOWJCaVFrSkNWUUhuVDdtNHgz?=
 =?utf-8?B?aVI2WlhSUmtSakR0a1ErdnErWEZOcXk3cVQ4NkhBMjljdlk2TVNwMUZTNVpH?=
 =?utf-8?B?aVpkMGh1QVpTdHdGVW0ydWczK2RGSDQyZTBFdHMvY241UFg0anV1QVRieUQ1?=
 =?utf-8?B?aktxakN2ZzhjUnU3bDVJMW16cW13QkFUc0Y3TnZtUHdCakFlaitsM2hqWVJD?=
 =?utf-8?B?SWQxMGliMWdKK0l2cHltaUo4STZ1R0ZWNFVtVUQyZUNGTGx4TzdPNFpTa0s1?=
 =?utf-8?B?MnBVbU5DaGRHeEViZDBQTjZjN2NaemhsbGZYbFhOSnVRUlNSbWdreUlnaWMx?=
 =?utf-8?B?dE5YWXRvVFBMc25uTEVkNTYzU0NwT2NlZzQ0WGVNR21nVUpHVFN6Si95WklZ?=
 =?utf-8?B?NUx1UjhhR2t0MCtRT2kvaHlPS3RMMU9keTVkVS9FWHR3Z2VzbXpHRzdTejlq?=
 =?utf-8?B?dVg4UTEwZlBTTHJhOGJnZ0RUWFJZVS9CalR0QkUzSDdsNjZ6YkVZK2VzeWVh?=
 =?utf-8?B?WUwvdGJScGNkR0N6bERuUDIxdFQvcitZZ1pINFZIYzJodG01OVVieUtiQWVV?=
 =?utf-8?B?M2UzYUdvUkRabVJPWVY2dDcyNFNxaHZOdGV6ZEVkb0FkUkFKUUNuUmh5WEtl?=
 =?utf-8?B?K3RpMVpON0NURmxkMlQvN0lqM3FsSUtpeldCMkVuVzNjSXp1M1UyMXBQTXk0?=
 =?utf-8?B?d2V4UzFYTnhZdVBUR043TjRDSWo2Z2RheDNDOG9TMEV1bFNKQmZtNW1ML3ND?=
 =?utf-8?B?NUJOK1ZwNDIwaDQ1NVRHODlPMUNFd1BDeEVRVXErRW1lUEFpMVk3M2hIV2E4?=
 =?utf-8?B?cVRleUdoeEtlOUhzcnFrTmZWZGhsUU93Mnl2a2FWL284aTdKa1Y4UjluWW0y?=
 =?utf-8?B?bFlpbVVhVW9TZkVWb050VUtZbEFhanJVejNpMWxSMGlLQzlDd0Iva3U3aTBQ?=
 =?utf-8?B?WHh3SStGcSs5V1AzdzR0emFhMEFIWlh2aHY5NUlRb1oxcFJ1S1BoREE5S2Y3?=
 =?utf-8?B?bDluTnJGSGRtQVY0UUxtWWpoU2djZTJKZHp5N3RQR2VJV01CNytUY2FGN0hB?=
 =?utf-8?B?UDZFWURLWldrN0IwTDhHUWFxTXpteFkvNHpac0syM1h0akdmUnBIcTBrVXhS?=
 =?utf-8?B?M3BZWXJTTGlQZkcrRkVpaGYzRExoZlJBeFNWY3hnVDFMZ1d6U2xTSnc2VERE?=
 =?utf-8?B?WjF1eXhFKzA3L01jamVNdW9YNWhXbWJtclVmMHZYR3ZnOU12L0prR1pJaWlD?=
 =?utf-8?B?ZnhCYldXRm1KdmdMdXArNXhqV1NldCswcVc5OU0zMldwRjlTODFvZUh6VWtx?=
 =?utf-8?B?MElNTFo1U1lnbi9JZktmOWpsN0xDZldYV2Z2QXZRRkwxeTNiZjBYVGhnK29n?=
 =?utf-8?B?aW55V2ZHVnRINThkYXJYK3d4L2JLdU1OenVZSU9QVW1pcHpyMkN3bDNNVjd2?=
 =?utf-8?B?NWFZZDNUckpHUUpoWFZNQk1FdDViRVJ5YkgvWDBEWEhkZEsxUnVVVGJrb2xt?=
 =?utf-8?B?bWdaa0h1a0NhWGxRL2hUL3pheXFyb0RkZUxSU1lpUFN1SFo3Z1hSaU8rNVlE?=
 =?utf-8?B?UXMxRWovOGx3Wm5SMGd2V3pmK0F4a0VLR1J3a3RzSUhFcit6VlBQSXhHNURz?=
 =?utf-8?B?YzY0WXlvdFB3RFBiWkJBSWV3UW1KZmtnVGU1NnMzWFZQV0htZVNiMjdsTDhL?=
 =?utf-8?B?ME4rYXd6QUpPaHp4WGIyK0lVeXhzSk5tQVNrb0t3N0JDa1RnUEI5TUhWRys5?=
 =?utf-8?B?Z213c2FKMEVNVEI0aTdQWmZBVTQwa2FwZFdzY1ZvTkhRY2hKRjNaTjJNV3R0?=
 =?utf-8?B?N2VuVXFBNXBBTHpFdmJyR2JRN09ja1REUHRQdUY4WWF3M3dnS081UmhxU3lY?=
 =?utf-8?B?SnY0NDloZkI0TCtLMHlIUFdtTEtMdkQ5WVl5aDB3QkdDVzBFK3Rhdlp2ZFNG?=
 =?utf-8?B?V2Y4UW1PWEFJV3cvT0V2VGloQ2xocllxOVBRcnhBblJ1Z0lNd3hXcFplVmtz?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74eaebce-82ff-45c1-ddf8-08dc349db0f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 18:31:46.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlUGsPv6og6Bw835mCqXJM4Re5uY54h6PlMxHXq60JIt3luiGfBFe+/EFzkH3A5+/r+qAAXJbmhv1ZGLtToE9kKfObeya3C8os/2mIAlWvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/23/2024 12:51 AM, Tvrtko Ursulin wrote:
>
> On 22/02/2024 23:31, Belgaumkar, Vinay wrote:
>>
>> On 2/22/2024 7:32 AM, Tvrtko Ursulin wrote:
>>>
>>> On 21/02/2024 21:28, Rodrigo Vivi wrote:
>>>> On Wed, Feb 21, 2024 at 09:42:34AM +0000, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 21/02/2024 00:14, Vinay Belgaumkar wrote:
>>>>>> Allow user to provide a context hint. When this is set, KMD will
>>>>>> send a hint to GuC which results in special handling for this
>>>>>> context. SLPC will ramp the GT frequency aggressively every time
>>>>>> it switches to this context. The down freq threshold will also be
>>>>>> lower so GuC will ramp down the GT freq for this context more 
>>>>>> slowly.
>>>>>> We also disable waitboost for this context as that will interfere 
>>>>>> with
>>>>>> the strategy.
>>>>>>
>>>>>> We need to enable the use of Compute strategy during SLPC init, but
>>>>>> it will apply only to contexts that set this bit during context
>>>>>> creation.
>>>>>>
>>>>>> Userland can check whether this feature is supported using a new 
>>>>>> param-
>>>>>> I915_PARAM_HAS_COMPUTE_CONTEXT. This flag is true for all guc 
>>>>>> submission
>>>>>> enabled platforms since they use SLPC for freq management.
>>>>>>
>>>>>> The Mesa usage model for this flag is here -
>>>>>> https://gitlab.freedesktop.org/sushmave/mesa/-/commits/compute_hint
>>>>>
>>>>> This allows for setting it for the whole application, correct? 
>>>>> Upsides,
>>>>> downsides? Are there any plans for per context?
>>>>
>>>> Currently there's no extension on a high level API 
>>>> (Vulkan/OpenGL/OpenCL/etc)
>>>> that would allow the application to hint for power/freq/latency. So 
>>>> Mesa cannot
>>>> decide when to hint. So their solution was to use .drirc and make 
>>>> per-application
>>>> decision.
>>>>
>>>> I would prefer a high level extension for a more granular and 
>>>> informative
>>>> decision. We need to work with that goal, but for now I don't see any
>>>> cons on this approach.
>>>
>>> In principle yeah I doesn't harm to have the option. I am just not 
>>> sure how useful this intermediate step this is with its lack of 
>>> intra-process granularity.
>>>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   |  8 +++++++
>>>>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
>>>>>>    drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +++++++
>>>>>>    .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 21 
>>>>>> +++++++++++++++++++
>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 17 
>>>>>> +++++++++++++++
>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>>>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++++
>>>>>>    drivers/gpu/drm/i915/i915_getparam.c          | 11 ++++++++++
>>>>>>    include/uapi/drm/i915_drm.h                   | 15 +++++++++++++
>>>>>>    9 files changed, 89 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> index dcbfe32fd30c..ceab7dbe9b47 100644
>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>> @@ -879,6 +879,7 @@ static int set_proto_ctx_param(struct 
>>>>>> drm_i915_file_private *fpriv,
>>>>>>                       struct i915_gem_proto_context *pc,
>>>>>>                       struct drm_i915_gem_context_param *args)
>>>>>>    {
>>>>>> +    struct drm_i915_private *i915 = fpriv->i915;
>>>>>>        int ret = 0;
>>>>>>        switch (args->param) {
>>>>>> @@ -904,6 +905,13 @@ static int set_proto_ctx_param(struct 
>>>>>> drm_i915_file_private *fpriv,
>>>>>>                pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>>>>>>            break;
>>>>>> +    case I915_CONTEXT_PARAM_IS_COMPUTE:
>>>>>> +        if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>>>> +            ret = -EINVAL;
>>>>>> +        else
>>>>>> +            pc->user_flags |= BIT(UCONTEXT_COMPUTE);
>>>>>> +        break;
>>>>>> +
>>>>>>        case I915_CONTEXT_PARAM_RECOVERABLE:
>>>>>>            if (args->size)
>>>>>>                ret = -EINVAL;
>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h 
>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>>> index 03bc7f9d191b..db86d6f6245f 100644
>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>>>> @@ -338,6 +338,7 @@ struct i915_gem_context {
>>>>>>    #define UCONTEXT_BANNABLE        2
>>>>>>    #define UCONTEXT_RECOVERABLE        3
>>>>>>    #define UCONTEXT_PERSISTENCE        4
>>>>>> +#define UCONTEXT_COMPUTE        5
>>>>>
>>>>> What is the GuC behaviour when SLPC_CTX_FREQ_REQ_IS_COMPUTE is set 
>>>>> for
>>>>> non-compute engines? Wondering if per intel_context is what we 
>>>>> want instead.
>>>>> (Which could then be the i915_context_param_engines extension to mark
>>>>> individual contexts as compute strategy.)
>>>>
>>>> Perhaps we should rename this? This is a freq-decision-strategy inside
>>>> GuC that is there mostly targeting compute workloads that needs lower
>>>> latency with short burst execution. But the engine itself doesn't 
>>>> matter.
>>>> It can be applied to any engine.
>>>
>>> I have no idea if it makes sense for other engines, such as video, 
>>> and what would be pros and cons in terms of PnP. But in the case we 
>>> end up allowing it on any engine, then at least userspace name 
>>> shouldn't be compute. :)
>> Yes, one of the suggestions from Daniele was to have something along 
>> the lines of UCONTEXT_HIFREQ or something along those lines so we 
>> don't confuse it with the Compute Engine.
>
> Okay, but additional question is would anyone ever want to set it for 
> video or blitter. Would it harm, benefir, or be neutral.
It would depend on the use case. SLPC will not distinguish either ways. 
It will aggressively ramp the GT freq when this context is active. User 
is making a decision to choose perf over power.
>
>>> Or if we decide to call it compute and only apply to compute 
>>> engines, then I would strongly suggest making the uapi per 
>>> intel_context i.e. the set engines extension instead of the GEM 
>>> context param. Otherwise it would be odd that some engines get it 
>>> and some don't. With explicit configuration userspace gets to see 
>>> the clear picture of what is what.
>>
>> It will not be per engine, so may be better to keep it at the 
>
> Why? Just because..
Feels strange that we are giving a coarse control(per gem context) to 
UMD but mapping it to a finer control(per engine) on the KMD side. 
Anyways, hopefully we can find a way to extend this to UMD eventually as 
well.
>
>> gem_context level. Trying to percolate it to the intel_context level 
>> seems to be more complicated. We process the gem_context_param flags 
>> first and then create the intel_context per engine. Not sure if we 
>> want to keep 2 copies of the same flag in gem_context and 
>> intel_context as well.
>
> .. it is complicated? It is not complicated at all. There is 
> intel_context_set_gem which is just for uses like that.
>
> Once you have this, then the only difference is whether you go from 
> GEM context setparam to intel_context, or flag goes directly to 
> intel_context as they are created via custom engine maps.

Yes, though intel_context_set_gem is called before we copy over the 
flags from the user AFAICS. Will need to somehow access the user flags 
in that function.

Thanks,

Vinay.

>
> Regards,
>
> Tvrtko
>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>>>        /**
>>>>>>         * @flags: small set of booleans
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> index 4feef874e6d6..1ed40cd61b70 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>>>> @@ -24,6 +24,7 @@
>>>>>>    #include "intel_pcode.h"
>>>>>>    #include "intel_rps.h"
>>>>>>    #include "vlv_sideband.h"
>>>>>> +#include "../gem/i915_gem_context.h"
>>>>>>    #include "../../../platform/x86/intel_ips.h"
>>>>>>    #define BUSY_MAX_EI    20u /* ms */
>>>>>> @@ -1018,6 +1019,13 @@ void intel_rps_boost(struct i915_request *rq)
>>>>>>            struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>>>>            if (rps_uses_slpc(rps)) {
>>>>>> +            const struct i915_gem_context *ctx;
>>>>>> +
>>>>>> +            ctx = i915_request_gem_context(rq);
>>>>>> +            if (ctx &&
>>>>>> +                test_bit(UCONTEXT_COMPUTE, &ctx->user_flags))
>>>>>> +                return;
>>>>>> +
>>>>>
>>>>> I think request and intel_context do not own a strong reference to 
>>>>> GEM
>>>>> context. So at minimum you need a local one obtained under a RCU 
>>>>> lock with
>>>>> kref_get_unless_zero, as do some other places do.
>>>>>
>>>>> However.. it may be simpler to just store the flag in 
>>>>> intel_context->flags.
>>>>> If you carry it over at the time GEM context is assigned to 
>>>>> intel_context,
>>>>> not only you simplify runtime rules, but you get the ability to 
>>>>> not set the
>>>>> compute flags for video etc.
>>>>
>>>> +1 on the intel_context->flags
>>>>
>>>>>
>>>>> It may even make sense to add a "don't waitboost" flag on top of 
>>>>> the "is
>>>>> compute" so this call site becomes self-documenting (otherwise I 
>>>>> ask to add
>>>>> a comment here please). Then you could even move it out from the SLPC
>>>>> special case.
>>>>
>>>> +1 on the dont_waitboost flag as well. might be worth for other cases
>>>> like display metrics for instance.
>>
>> We could define another disable_waitboost flag in intel_context, but 
>> seems redundant if we already have this info in the gem_context. We 
>> don't need to check for SLPC special case, just need to check this 
>> flag as we won't enable it for the non-slpc case anyways.
>>
>> Thanks,
>>
>> Vinay.
>>
>>>>
>>>>>
>>>>>>                slpc = rps_to_slpc(rps);
>>>>>>                if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>>>>> diff --git 
>>>>>> a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>>>> index 811add10c30d..c34674e797c6 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>>>>> @@ -207,6 +207,27 @@ struct slpc_shared_data {
>>>>>>        u8 reserved_mode_definition[4096];
>>>>>>    } __packed;
>>>>>> +struct slpc_context_frequency_request {
>>>>>> +    u32 frequency_request:16;
>>>>>> +    u32 reserved:12;
>>>>>> +    u32 is_compute:1;
>>>>>> +    u32 ignore_busyness:1;
>>>>>> +    u32 is_minimum:1;
>>>>>> +    u32 is_predefined:1;
>>>>>> +} __packed;
>>>>>> +
>>>>>> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE        REG_BIT(28)
>>>>>> +
>>>>>> +struct slpc_optimized_strategies {
>>>>>> +    u32 compute:1;
>>>>>> +    u32 async_flip:1;
>>>>>> +    u32 media:1;
>>>>>> +    u32 vsync_flip:1;
>>>>>> +    u32 reserved:28;
>>>>>> +} __packed;
>>>>>> +
>>>>>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE REG_BIT(0)
>>>>>> +
>>>>>>    /**
>>>>>>     * DOC: SLPC H2G MESSAGE FORMAT
>>>>>>     *
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> index 3e681ab6fbf9..706fffca698b 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>>> @@ -537,6 +537,20 @@ int intel_guc_slpc_get_min_freq(struct 
>>>>>> intel_guc_slpc *slpc, u32 *val)
>>>>>>        return ret;
>>>>>>    }
>>>>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 
>>>>>> val)
>>>>>> +{
>>>>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>>>> +    intel_wakeref_t wakeref;
>>>>>> +    int ret = 0;
>>>>>> +
>>>>>> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>>>>> +        ret = slpc_set_param(slpc,
>>>>>> +                     SLPC_PARAM_STRATEGIES,
>>>>>> +                     val);
>>>>>> +
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>>>>    int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc 
>>>>>> *slpc, u32 val)
>>>>>>    {
>>>>>>        struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>>>>> @@ -711,6 +725,9 @@ int intel_guc_slpc_enable(struct 
>>>>>> intel_guc_slpc *slpc)
>>>>>>        /* Set cached media freq ratio mode */
>>>>>>        intel_guc_slpc_set_media_ratio_mode(slpc, 
>>>>>> slpc->media_ratio_mode);
>>>>>> +    /* Enable SLPC Optimized Strategy for compute */
>>>>>> +    intel_guc_slpc_set_strategy(slpc, 
>>>>>> SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>>>>>> +
>>>>>>        return 0;
>>>>>>    }
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>>>> index 6ac6503c39d4..1cb5fd44f05c 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>>>>> @@ -45,5 +45,6 @@ void intel_guc_pm_intrmsk_enable(struct 
>>>>>> intel_gt *gt);
>>>>>>    void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>>>>>>    void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>>>>>>    int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc 
>>>>>> *slpc, bool val);
>>>>>> +int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 
>>>>>> val);
>>>>>>    #endif
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> index f3dcae4b9d45..bbabfa5532e5 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> @@ -2645,6 +2645,7 @@ MAKE_CONTEXT_POLICY_ADD(execution_quantum, 
>>>>>> EXECUTION_QUANTUM)
>>>>>>    MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>>>>>>    MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>>>>>>    MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, 
>>>>>> PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
>>>>>> +MAKE_CONTEXT_POLICY_ADD(slpc_ctx_freq_req, SLPM_GT_FREQUENCY)
>>>>>>    #undef MAKE_CONTEXT_POLICY_ADD
>>>>>> @@ -2662,8 +2663,10 @@ static int 
>>>>>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>>>>        struct intel_engine_cs *engine = ce->engine;
>>>>>>        struct intel_guc *guc = &engine->gt->uc.guc;
>>>>>>        struct context_policy policy;
>>>>>> +    struct i915_gem_context *ctx = 
>>>>>> rcu_dereference(ce->gem_context);
>>>>>>        u32 execution_quantum;
>>>>>>        u32 preemption_timeout;
>>>>>> +    u32 slpc_ctx_freq_req = 0;
>>>>>>        unsigned long flags;
>>>>>>        int ret;
>>>>>> @@ -2675,11 +2678,15 @@ static int 
>>>>>> guc_context_policy_init_v70(struct intel_context *ce, bool loop)
>>>>>>        execution_quantum = engine->props.timeslice_duration_ms * 
>>>>>> 1000;
>>>>>>        preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>>>>>> +    if (ctx && (ctx->user_flags & BIT(UCONTEXT_COMPUTE)))
>>>>>> +        slpc_ctx_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>>>>>> +
>>>>>>        __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>>>>>>        __guc_context_policy_add_priority(&policy, 
>>>>>> ce->guc_state.prio);
>>>>>> __guc_context_policy_add_execution_quantum(&policy, 
>>>>>> execution_quantum);
>>>>>> __guc_context_policy_add_preemption_timeout(&policy, 
>>>>>> preemption_timeout);
>>>>>> + __guc_context_policy_add_slpc_ctx_freq_req(&policy, 
>>>>>> slpc_ctx_freq_req);
>>>>>>        if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>>>>>> __guc_context_policy_add_preempt_to_idle(&policy, 1);
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c 
>>>>>> b/drivers/gpu/drm/i915/i915_getparam.c
>>>>>> index 5c3fec63cb4c..0f12e36b2a12 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>>>>>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>>>>>> @@ -155,6 +155,17 @@ int i915_getparam_ioctl(struct drm_device 
>>>>>> *dev, void *data,
>>>>>>             */
>>>>>>            value = 1;
>>>>>>            break;
>>>>>> +    case I915_PARAM_HAS_COMPUTE_CONTEXT:
>>>>>> +        /* This feature has been available in GuC for a while but
>>>>>> +         * a use case now required the use of this feature. We
>>>>>> +         * return true now since this is now being supported from
>>>>>> +         * the kernel side as well.
>>>>>> +         */
>>>>>
>>>>> Nit - stick to the multi-line comment style i915 uses please.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> +        if (intel_uc_uses_guc_submission(&to_gt(i915)->uc))
>>>>>> +            value = 1;
>>>>>> +        else
>>>>>> +            value = -EINVAL;
>>>>>> +        break;
>>>>>>        case I915_PARAM_HAS_CONTEXT_ISOLATION:
>>>>>>            value = intel_engines_has_context_isolation(i915);
>>>>>>            break;
>>>>>> diff --git a/include/uapi/drm/i915_drm.h 
>>>>>> b/include/uapi/drm/i915_drm.h
>>>>>> index 2ee338860b7e..1bd12f536108 100644
>>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>>> @@ -806,6 +806,12 @@ typedef struct drm_i915_irq_wait {
>>>>>>     */
>>>>>>    #define I915_PARAM_PXP_STATUS         58
>>>>>> +/*
>>>>>> + * Query if kernel allows marking a context as a Compute 
>>>>>> context. This will
>>>>>> + * result in more aggressive GT frequency ramping for this context.
>>>>>> + */
>>>>>> +#define I915_PARAM_HAS_COMPUTE_CONTEXT 59
>>>>>> +
>>>>>>    /* Must be kept compact -- no holes and well documented */
>>>>>>    /**
>>>>>> @@ -2148,6 +2154,15 @@ struct drm_i915_gem_context_param {
>>>>>>     * -EIO: The firmware did not succeed in creating the 
>>>>>> protected context.
>>>>>>     */
>>>>>>    #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>>>>> +
>>>>>> +/*
>>>>>> + * I915_CONTEXT_PARAM_IS_COMPUTE:
>>>>>> + *
>>>>>> + * Mark this context as a Compute related workload which 
>>>>>> requires aggressive GT
>>>>>> + * frequency scaling. Query I915_PARAM_HAS_CONTEXT_COMPUTE to 
>>>>>> check if the kernel
>>>>>> + * supports this functionality.
>>>>>> + */
>>>>>> +#define I915_CONTEXT_PARAM_IS_COMPUTE        0xe
>>>>>>    /* Must be kept compact -- no holes and well documented */
>>>>>>        /** @value: Context parameter value to be set or queried */
