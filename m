Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F614C4EC5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 20:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC5010E81C;
	Fri, 25 Feb 2022 19:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4A10E7B7;
 Fri, 25 Feb 2022 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645817290; x=1677353290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ldSddR4cAS/8AL3zvX6zadokmiG2XzP6OIwFz0mRdG0=;
 b=oErbHe1TTiM61PZRnxLvpQjT/n/mmhRQMQrkvQ/C55I7jbXQXBs5v+uo
 dUx7RhxaunpM4IL5i7NnT+A8HQSJKdCC4a1qRThZK3iw1Pf6kWMUF7JeD
 mUfYXjFmIHIL9/wHTK3xBaHUm4Xs6gq+W8x+bJR66VmJtnFMllioHo6NZ
 yT+ZNVYvVZ4GzgD2T9EZHiewRkjcUvGHUVbCDCMUm/T3xQdTgkd4b9kE9
 StcCRBcQYXA4BdT4ntRr+QiiyP76fC1q1DNxqksHuHzlEnGzG98tluFhc
 D8TeYz3sZJMYOOzETmduyqqJkrmAK9swFKwKNKpuJyIzt65e/YQEXLHwW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252296426"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
 d="scan'208,217";a="252296426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 11:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
 d="scan'208,217";a="492068291"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 25 Feb 2022 11:28:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 11:28:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 11:28:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 11:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzWf6tn4OtrxF8Poz/EeCDLlEGvKjOQWGuk7/oFmHXwJjDljkHI7TvE6rS3EBam4f25BT0dZtegj4GsEWxPGTyhrjF3Gc9RG6pw5CrWr55rHpgSehROgiRMiSJMPJ69fRdHx4K5h9ZR2BNgmvAAS2knlkCDYTRfzVM643Fr1uKRY//Yw+p/fTQ3+eWJeKIQ5T6DWT6KBwj0awfbLB/E6ZXeqhqWhPun/hGw1r7gGqrhSpjJp294HhZHgDl09WujhNmnrRBNaaVfmNxlIPVs+zf97Y4/5Y124PAy0T7IoiufOrz5q0fx5stakuEZgYK1OP3GtFQP4b8slqHauxgbykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgxs5m8iI6W3RCUUyo/YTYFEYS+6w6Mdq/mc172p1wo=;
 b=O73iwUepKa42nnhQortijzK0+tH+/BrnlOh5Yn1OxiUkPWQH6HCjDkkfqu4t5ak5CKyD/nnGb0zoTQYlanGoKKozxegt71Cfpm2RnoVej0Uv9UqrL8x4fyIRCFAIBLFcFLQQnDexy7Kl94+mak9R+36kQ4loFiZk3fqe0kMoxk5Ov4TtrDHoKZGN0dt01lsineMxKVTnNZwjOBUl+QQQrnJAXHflDPY2WhFj9lsWgV7kv/Ov9mpIagXK/vHNd1urCLTfciskg7M1wZaDL9kgFvAYkjE5bdJdtxRVb1Fala0lK5xKf5kEFz2sllkcI9lZUE8kmncqWKyHu5HQ0C6MwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 19:28:04 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 19:28:04 +0000
Content-Type: multipart/alternative;
 boundary="------------gJNU7x7Q00uurZQZvtbXKP5K"
Message-ID: <3750c398-e8fb-c4e1-ba31-e6ac5fbc01d0@intel.com>
Date: Fri, 25 Feb 2022 11:27:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, <intel-gfx@lists.freedesktop.org>
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
 <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <5c254623-98d2-75f3-52cb-209b8de304b6@arm.com>
X-ClientProxiedBy: MWHPR17CA0055.namprd17.prod.outlook.com
 (2603:10b6:300:93::17) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa9e2bf-d7c6-40e8-c248-08d9f894f182
X-MS-TrafficTypeDiagnostic: SA2PR11MB5067:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB50679F0DD60376CA1E50ACF6E13E9@SA2PR11MB5067.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtTQ3ge/BmtwSa9/inkWrsemJMr7bzT3S+xjm6+3++k0yHQIq6b2rd+c1bppFWsZk5KoF32xnLLKhVA+ivGG+5A3DG5VrC2+7sG53JSMW93SJP17UrAnljMx8WR39yzJLyhB0kJaO8oLcoGxz8VNXPKL85rEaudXFAx1N74z0UvhMnZyzHNJsb29q99As83xVdfONwVUAvPEgvOxpn6wZhG+VQajWj2ldDC1qP6J58/M9Rrb96qd2X4wRFc8fk14DPSG7YkLmBYyfr6YRS3JK2o1IhiOnldC7V0N1LRXnyhZh9du+lWYXHaCOOtoaoEEl2/9QkYD2NKh82+9T3zH5nzKPyEq6K2o2StwsOvGWRnUBW2i1Kmlz7d5zaA5CL2et8qEq7QrfzLYwi5t0OZ5hmTW7+nzsWNHwO6HQh+WlBWgVJU7IXglhPE9oiy647fpT6azpHQ891gE9NYs62A2sL6yMmTw3iUSHZ+X7ibcXEjMeePylzMrRVbou65weXUkLyPjlFSSYeGOujBViaaMsPeuXzRjEAujWxk/Je/NIee/rXiLahaFKVxunRn9p32lXrILENsQ21wsI2QjODUe463nUr2hD465lbc3Vw9yNPLoBibo2C5LpW2YQr1KcBisdjARnYwhVV3G+rAzvMUWVcZpdi24ceVqGGkG93QGbRyn6eiuy0PSXM8cBoOZt7E5a9bDzaGJJhmlinFoJPpC6lc4GAAyuB/57zZ2QCvG5KU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(66946007)(36756003)(8676002)(8936002)(38100700002)(2906002)(316002)(54906003)(4326008)(31686004)(31696002)(186003)(86362001)(2616005)(5660300002)(82960400001)(6512007)(33964004)(44832011)(53546011)(6506007)(508600001)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVMrZVB6WGpleUdNSWE3eVNvTGxPME5iVEZPL3pSNDdQeCsxMkNNOXdqZisr?=
 =?utf-8?B?d2pyMVVkTUcwaWk0SC9Bc2NVS3ZpQnhmd0tCSWVhTlJWZ3IyRXFCcUtQcVNX?=
 =?utf-8?B?N1dNQ01QSldscDduajJCZFFBVkQwaFI4MTl2RW9Id2hVUDJwZVRTS25SM3Zm?=
 =?utf-8?B?WkZWeXJjM3JMNTgxaDVXQWRNSldtVWw3bjd5WHYybm94VE5pbGQ1a3psMTNQ?=
 =?utf-8?B?L3RoV2JhWXptODBKUnRmcGU2VjBGNGtUdGtEbEV1anVlYmZpSC9DZDhia1A4?=
 =?utf-8?B?M21OM3VqUTEwQ3U5VXhnR0o4a254M3dQRDIrVS8vQlRaKzR6YW14Y3ZDcEwv?=
 =?utf-8?B?RWxsL0ZibSs4cTdVSEg5dFY0Sk0yOGk5citUQkRNcm1haEJsOStma3NrTGFO?=
 =?utf-8?B?Q0FzWXcxV1B0cnA2aDZLOWNTbUJKZ2ZSRStQUXA2dVErckw4UHFUaUxpQ2w1?=
 =?utf-8?B?M1Jia2NRL2E5bVZJYStuRlpWYzhTMngwdFpFNVV3bHlobFFYQzlKZDZDWXIr?=
 =?utf-8?B?aGo1aFl5VHZGYkJwclhYR0phVmdWTUUzUXpCdE9VUjBGS25XODFCajQ0anVX?=
 =?utf-8?B?NnZaQ0xrbjRSeXBSOWxRQmxPZjNDd3B3YSs5TE9jOE0zejRUek00T1dJaGhF?=
 =?utf-8?B?ek93aUtSZy9EdU5obklKT2pEWVZ5MXBJWVlTU3Rod0R2L1pBUkVScklxZmFR?=
 =?utf-8?B?cjVHSURvSFZDaXBoaFlJU3RCWFhzOS9FMHpsTWpZVHR6Y092VmJyQXVpSUhi?=
 =?utf-8?B?T00wWmZTS3V5RTlVUW1KcHdvVW5nVkxwT2lFYitUVk50a3ZIeWJrZ3VwZEVM?=
 =?utf-8?B?Y0IwNnhxMWhKRmI4ZTh1T2dDZ0RQdE5rMWUrNkdNYjcvNVdrSTg4WWI1V0to?=
 =?utf-8?B?RFdFK1ZydGlHUVpTREY2Q0NzaWU5WUVZSVA4Y3F1dGxTWkRHMW9FaStENS90?=
 =?utf-8?B?QkVhSy85RnN1Q3YzbHJnMGJ1Tm5FbndTUmNtNm9oTlRFYzYxaVlwTERJRGNk?=
 =?utf-8?B?OWZDN0hTTjlNU2hDOWgrU2wydmNvdlF0clFMRGJEZjA3YnpUbUsrcnZSaGpP?=
 =?utf-8?B?YWlQbjJhRms0dE0yek5kYVlucEVCVi9FNVE0eURmUGJqN2tPRThmc3JHNUxJ?=
 =?utf-8?B?Y2FTallRWis4MmJ2Vnl4K2pQR0dudVVhKzRENFhWMEJ6aS9VZlFad25Na1dD?=
 =?utf-8?B?Y3ZhRlVNQ3FJUDBKR2Rib25UL3Z0Qmx1Y2pLNm0rOHQ5MDQ5cmtNdWwvU3k5?=
 =?utf-8?B?RlRRVyt1YVdwRE85bmFwZUtEMXR2WUQxdVozOTJ0VUxNQzZHdjA3MmtsUnEx?=
 =?utf-8?B?RlhaM3lJVWlaRlJSVE44S1BuNE5vQTZoeGovNWZhMHM0UWpDMVNZWElFSjFP?=
 =?utf-8?B?SnJvK2hieDJUU1U3MkF1aEdQMzJRV09UNlplWXUwR28xcDhrN2M4VEJHRVVF?=
 =?utf-8?B?NmNyRW83TEJpMEwwT0NoMFNVMDRpQ1UzdURVRlBoZXVlQTNScHFZUU5qRE1y?=
 =?utf-8?B?TnVRbVRGaklqY051RnB0ajFyVmJ6dWlIckJ0K014RzFCUDBZZUNXcXZaV0hR?=
 =?utf-8?B?OTFabHZBS0FzanlsdXBpd2FNc3lCclhkdjYrVk9RVXcvTnJhYmNkRU9ob2ti?=
 =?utf-8?B?VkU0cld3OEUvazR2aE9yb1F5VDI4ZkxBTi9RODZEdEJGYkhHZS84SDBoYVlM?=
 =?utf-8?B?WWJhbkppd2d6QlcvbEJ6b3Z1bjlSeE9RbERSQzd0RmxUd3pNdGREQWlsWFk4?=
 =?utf-8?B?NlhQS3Z4akVXZkhORGJZdDRBRnJQc01ZZVVBYkNRQXpDK25QOVVEb2cwb2lS?=
 =?utf-8?B?YW9oeWtyZ0dEeTFjZE5pZUN1ZXoxYzRPbnhKOHgwQkl1THpkQlM0YWNpZmtm?=
 =?utf-8?B?R0VrQVZ0N0JWUERlUk5rQ0NnSWd4NG1wS0ljSUhJRWNOWW1BeE9SQ1JLbDda?=
 =?utf-8?B?Mlp2U2pEZWNaZ1hOUVJtSGFoN0JubEVXNFhkM2JTSWFHMzRGNkhNY1hsU1M0?=
 =?utf-8?B?RmxPTWx6UThDYVFZcDl3dnRlZk9INUJUK0xYWUxSODE0Rzl1amJzZW1zN2lO?=
 =?utf-8?B?c1ZZOVJaQ1RRTEdZSFc0V05DT0xjajBuSk42RHloS3p2cXpDbzhXWHlNdG5O?=
 =?utf-8?B?R0ZCMzhxOGhLbmhCczZoUXBvTXA4REhyUXA1cUMrSUh0bHZGMDVxdmt4TlRO?=
 =?utf-8?B?MzNCZEFXd0d4WkJjK1JsTFNST3cxd1haa1g3WWlEMDBJWlJ2QTIwWFRnODg5?=
 =?utf-8?Q?F4dV4OA0mUYOdiQ8NQGAR4Qm0a4PVOdvV+EWRU4ApY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa9e2bf-d7c6-40e8-c248-08d9f894f182
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:28:04.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVivpXmiZsB4QtP3EML5Ho+j9AL0ZSNuH9ZjUFGZRDKD9wIWjb2JcVJRjJyzczHn7yUwqYtmcq5aascaaskPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------gJNU7x7Q00uurZQZvtbXKP5K
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Robin,

[ +arm64 maintainers for their awareness, which would have been a good 
thing to do from the start ]

  * Thanks for adding the arm64 maintainer and sorry I didn't rope them
    in sooner.

Why does i915 need to ensure the CPU's instruction cache is coherent 
with its data cache? Is it a self-modifying driver?

  * Also thanks for pointing this out. Initially I was using
    dcache_clean_inval_poc, which seem to be the equivalently to what
    x86 is doing for dcache flushing, but it was giving me build errors
    since its not on the global list of kernel symbols. And after
    revisiting the documentation for caches_clean_inval_pou, it won't
    fly for what we are trying to do. Moving forward, what would you (or
    someone in the ARM community) suggest we do? Could it be possible to
    export dcache_clean_inval_poc as a global symbol?

On 2022-02-25 10:24 a.m., Robin Murphy wrote:
> [ +arm64 maintainers for their awareness, which would have been a good 
> thing to do from the start ]
>
> On 2022-02-25 03:24, Michael Cheng wrote:
>> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
>> performs a flush by first performing a clean, follow by an invalidation
>> operation.
>>
>> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
>>             dcache. Thanks Tvrtko for the suggestion.
>>
>> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
>>
>> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
>>             symbol that could be use by other modules, thus use
>>             caches_clean_inval_pou instead. Also this version
>>                 removes include for cacheflush, since its already
>>             included base on architecture type.
>>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/drm_cache.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index c3e6e615bf09..81c28714f930 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned long 
>> length)
>>         if (wbinvd_on_all_cpus())
>>           pr_err("Timed out waiting for cache flush\n");
>> +
>> +#elif defined(CONFIG_ARM64)
>> +    void *end = addr + length;
>> +    caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
>
> Why does i915 need to ensure the CPU's instruction cache is coherent 
> with its data cache? Is it a self-modifying driver?
>
> Robin.
>
> (Note that the above is somewhat of a loaded question, and I do 
> actually have half an idea of what you're trying to do here and why it 
> won't fly, but I'd like to at least assume you've read the 
> documentation of the function you decided was OK to use)
>
>> +
>>   #else
>>       WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>>   #endif
--------------gJNU7x7Q00uurZQZvtbXKP5K
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Robin,</p>
    [ +arm64 maintainers for their awareness, which would have been a
    good thing to do from the start ]
    <ul>
      <li>Thanks for adding the arm64 maintainer and sorry I didn't rope
        them in sooner.</li>
    </ul>
    Why does i915 need to ensure the CPU's instruction cache is coherent
    with its data cache? Is it a self-modifying driver?
    <ul>
      <li>Also thanks for pointing this out. Initially I was using
        dcache_clean_inval_poc, which seem to be the equivalently to
        what x86 is doing for dcache flushing, but it was giving me
        build errors since its not on the global list of kernel symbols.
        And after revisiting the documentation for
        caches_clean_inval_pou, it won't fly for what we are trying to
        do. Moving forward, what would you (or someone in the ARM
        community) suggest we do? Could it be possible to export
        dcache_clean_inval_poc as a global symbol?<br>
      </li>
    </ul>
    On 2022-02-25 10:24 a.m., Robin Murphy wrote:<br>
    <blockquote type="cite" cite="mid:5c254623-98d2-75f3-52cb-209b8de304b6@arm.com">[ +arm64
      maintainers for their awareness, which would have been a good
      thing to do from the start ]
      <br>
      <br>
      On 2022-02-25 03:24, Michael Cheng wrote:
      <br>
      <blockquote type="cite">Add arm64 support for
        drm_clflush_virt_range. caches_clean_inval_pou
        <br>
        performs a flush by first performing a clean, follow by an
        invalidation
        <br>
        operation.
        <br>
        <br>
        v2 (Michael Cheng): Use correct macro for cleaning and
        invalidation the
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dcache. Thanks Tvrtko for the suggestion.
        <br>
        <br>
        v3 (Michael Cheng): Replace asm/cacheflush.h with
        linux/cacheflush.h
        <br>
        <br>
        v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc
        as a
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; symbol that could be use by other modules, thus use
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caches_clean_inval_pou instead. Also this version
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; removes include for cacheflush, since its
        already
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; included base on architecture type.
        <br>
        <br>
        Signed-off-by: Michael Cheng <a class="moz-txt-link-rfc2396E" href="mailto:michael.cheng@intel.com">&lt;michael.cheng@intel.com&gt;</a>
        <br>
        Reviewed-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/drm_cache.c | 5 +++++
        <br>
        &nbsp; 1 file changed, 5 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/drm_cache.c
        b/drivers/gpu/drm/drm_cache.c
        <br>
        index c3e6e615bf09..81c28714f930 100644
        <br>
        --- a/drivers/gpu/drm/drm_cache.c
        <br>
        +++ b/drivers/gpu/drm/drm_cache.c
        <br>
        @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned
        long length)
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (wbinvd_on_all_cpus())
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Timed out waiting for cache flush\n&quot;);
        <br>
        +
        <br>
        +#elif defined(CONFIG_ARM64)
        <br>
        +&nbsp;&nbsp;&nbsp; void *end = addr + length;
        <br>
        +&nbsp;&nbsp;&nbsp; caches_clean_inval_pou((unsigned long)addr, (unsigned
        long)end);
        <br>
      </blockquote>
      <br>
      Why does i915 need to ensure the CPU's instruction cache is
      coherent with its data cache? Is it a self-modifying driver?
      <br>
      <br>
      Robin.
      <br>
      <br>
      (Note that the above is somewhat of a loaded question, and I do
      actually have half an idea of what you're trying to do here and
      why it won't fly, but I'd like to at least assume you've read the
      documentation of the function you decided was OK to use)
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        &nbsp; #else
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ONCE(1, &quot;Architecture has no drm_cache.c support\n&quot;);
        <br>
        &nbsp; #endif
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------gJNU7x7Q00uurZQZvtbXKP5K--
