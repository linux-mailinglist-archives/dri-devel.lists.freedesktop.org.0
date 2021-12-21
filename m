Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7618D47C66A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1C911AB49;
	Tue, 21 Dec 2021 18:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25711AB49;
 Tue, 21 Dec 2021 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640110924; x=1671646924;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8REK2afy6j7rrs+qmcOIpZB3JfHpGBG2l3ElaJYffE8=;
 b=myjh4iYrfv7VrIf9o9nqlqMaNaRSKEsIREPJWR18fxgykfK2otfCqvH3
 76ZAELu/o76dggI8xVTmafPEOYaZu9tes+eht+bQx5lZOSUdygGCxK8xW
 SSwwPpM7zOvGpFY1tuLDg8l+v3Jxn0dvrQFWTgZIAj0Fn5XpVs/Tpgu8v
 HGZ2SvRko9AJgNkPKOg7hllVC6JzG8JIo0T8qfw2GQRoVhu+Kna7GGmbq
 fwYTzGq2VTOtk0C8W0gOKdunMFm/Un6Vku2bfq8woOuwFehFZjHEiLahs
 E+1vpr/HrKM1V2vSTDOH8Kr08D8ibjvPro4G8f2JQqe/zJmVcFJCNoEoy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240417087"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="240417087"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 10:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="613561824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2021 10:12:02 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 10:12:02 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 10:12:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 10:12:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 10:12:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwfB2/V+kV0y9GsuPM4rM5FNecXuVuoDv13CrL29PPpR2WbSqm9CspSTKIHgV5bCCdnEq3jWk3YHuunErYxYRHmUGViaQU724nbvyinF7su8Fbe6WtITPrIvksfAkQbNBcqOG2II5En7hSluX87weCHKbznAZkpPkdx40OIFxAmxXFqs4Sm01FpqDO+l02gCA7Jb35h07Wuzc5K0T5K/CehqVpupZd1DUI3O0dbBUFLXgH8Wr8qfd8f6Hrxt8ytayDnvqvAY6R146+R47mx+SMupjfjg7xqZ2O2RHZo4neHrZlduTgK/ZZMFzU3TUaPi+IZAunQOleKBUArvcy016A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K57fLGg7/qMIv3e2MulTSWG+BNhmRgbeoITARWAir0=;
 b=mnq0wo8CDaNTcYLMUbqdFjIojTUpHAXYh7XX9Hr/jq8Ft12KpukIM+rj7z+jfDUiXuoOvSs3KtY8vl7CMTmufCKfdkcgq5q2LXHG/+tk48nfQQdPRZ6/yZECw/U98V/y9UcqTD6WLs2Iaw26sktEPGSYFz25eqZLdJLbX8/CaD+T6ZjEp17T0ufIslu/xNSx7K/1k+5qH0hnkLYhzEY/azwuhs5j4EA25CslUtngN+GkihANwdcu1U/op3mQ7o9JgU4w14Y9kC96OSI7TfkSiXymVUqTjd7yew/Oy7O6S/0CevDi78a6wA3vq0pu9Ua7jA5WmuGm4RaNvwa+7rOCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 by MWHPR11MB1693.namprd11.prod.outlook.com (2603:10b6:300:2b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 18:12:00 +0000
Received: from MW5PR11MB5907.namprd11.prod.outlook.com
 ([fe80::d0ec:4822:e73e:ddfe]) by MW5PR11MB5907.namprd11.prod.outlook.com
 ([fe80::d0ec:4822:e73e:ddfe%7]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 18:12:00 +0000
Message-ID: <79e3fe07-91db-7356-bf49-6a3d79392332@intel.com>
Date: Tue, 21 Dec 2021 10:11:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Request RP0 before loading
 firmware
Content-Language: en-US
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <john.c.harrison@intel.com>
References: <20211216233022.21351-1-vinay.belgaumkar@intel.com>
 <4a5ab73b-d68e-bc1a-ea26-d149ef338925@intel.com>
From: "Ewins, Jon" <jon.ewins@intel.com>
In-Reply-To: <4a5ab73b-d68e-bc1a-ea26-d149ef338925@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To MW5PR11MB5907.namprd11.prod.outlook.com
 (2603:10b6:303:1a1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 240610dd-cb21-471e-d1ec-08d9c4ad61ea
X-MS-TrafficTypeDiagnostic: MWHPR11MB1693:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB16938299EC43DBEFA850BFAEEC7C9@MWHPR11MB1693.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V31r96F01Pz/msHeVuBCXP6hRQtRs0tNfNLiMkUhSWyjTdzpheNtyA2ABkFGZenFIjR3hOkNxrk44IXTWnw0cZWQzlcUGLU/8mNLBm0xAQ85oB14SdWe56Nk1fVInOvjv/05FIM9dMwlZyRjp+/s7Zh6AJvgzDrdR9Sx9zLxozw7VQQN6QXAN6TD5RjbLgzHPLcjEep/utDv5X218KMDwsDTaXsvTyLwhZoi/OI1l0hXWPW6ObTH3mgd6FUGEXHtcNtumeFi2559M74ACO+dNT+pcShCs1rYE7v+ge4sD9vVArE4eP0TEqXBPeagwIVaOqwFsfAgyCdPwuRd/6UhDT2haYoI2dgjFhjh/gMRnsSqhjYrmsrkr+07qlg5dkYVBOUsxfxy9hz7dMkshkGJzlgaDZ/AW+Ypwummlnty0Ygr/e20dmd5qdX+G7teF9S7300mk3ytcJr+MYNEihQ3yeXQNZudFm1xcTcuBvdlY7PSHIzblBOc9WUg9+b7Q8ahKkqkoMK0hdEtbnsRbBqNUVULh4B0kMjWypdACUmMt9oEABvxqVqLY6gAUpDsBh+i6HgWcVViDjkbyP5ZmEWoO1oB5OXRvMx5ebQprru+SKWINKY9KgV2PPcsxwUv4h3fpwwWkiNWQ/9q9+jwNKJvG5/EIA6XrbSOCqs89M+566k6s6nHHV0uu9E7vQqpHicWBMt8qsXFIPoLyKmG78m6cPH1zfxDzGzUNC0V8r4qF1fxwLQY22JK8CnbaFxI2jaH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(31686004)(82960400001)(316002)(6506007)(450100002)(38100700002)(8936002)(83380400001)(8676002)(2906002)(26005)(31696002)(110136005)(186003)(6512007)(508600001)(5660300002)(66946007)(6636002)(6486002)(36756003)(2616005)(53546011)(66556008)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0E4bVJ5d0tLbkkvbmY0ZE0rODBlREVqd1BweklteXN4STN0L3E0MzVlUmpm?=
 =?utf-8?B?dGxuOEMvQ09JWW5tbkdvMWV4VGZJYW9sb1lZWmtkNG5NYjZBdGZuV2NDV0xh?=
 =?utf-8?B?V0xaakhCOTJLN0ZZRjJyR1NJbStEVUdvL0loY1FJS3doR1FKb2duYklwNmhG?=
 =?utf-8?B?amltT3hsdGNWTm1CaGhCK2RYVUlmdUFtbnIzNUZDVVFTbmpwUlhBNXFWRTlw?=
 =?utf-8?B?a3RvVnIvMWJCa3FmeDJNSWFBdGpOM0hyMUpxcWtMczZNN3MwbXhtZ2t5M1VJ?=
 =?utf-8?B?ZVNpTi9yb0I1Z1E3WGt0SnJkZnpHYzF2cHQ4V2d3bkhRMlN1UW0wNllONldx?=
 =?utf-8?B?T1dERVhxMUxURUl4OFl0YUxoSUd2WW9wY2JPUjY3cUNXVTcvRlM5Q0RaNkJh?=
 =?utf-8?B?bWc2UXNUcVBSRUUzQ1RmUzRGVjNwQ2JPQTRTdXhVSFpvT2w1bnhBR2tsWGpn?=
 =?utf-8?B?NmpMUUdNQlNTMlRyRlJSUVhpRmMvY3pTV29aeWs5dHpMOTBYbWU4TU81d3pB?=
 =?utf-8?B?amlaZ1VMSm4xRE5LR0J3b29DOXBvbFJtcDdxeCtVenNvQnN1QmFqcEFQOEpD?=
 =?utf-8?B?RUx1SzhnRFNodDBkNnNZci9Vd1BBOWJDQ1hlTE5IUm40RXBvUXFHWDdoZ3Vp?=
 =?utf-8?B?ZkxkNnNDTXdUZzRwaXovL1J2UVZELzk2TFhVY2E5dE01bG9POWhrV2w1RVpS?=
 =?utf-8?B?SnFWWGlYQ1F6MEZDUG9YdGYva3o4Nm5rNjRIWDdUS1VTcmYvZ3djUEUvUGJs?=
 =?utf-8?B?dlh0T3N4NEdKV2R6NmRieXFMUFNTMTd0OWVGT1p2VUFVRCtYUnlXaDJHTHNR?=
 =?utf-8?B?Q0tZQWRnZXRRYWUvdUlLNkwvSXV0OWFYRDZJVnozWWxwZXgyUm94bnlndkVv?=
 =?utf-8?B?azdXckU5L09pK2Q5bW1TOEx4TFovbmgyRldBQWpQZXIzekxocFhZMDRRWXFs?=
 =?utf-8?B?cmx3bEFla3hWSVVRT3ZJc0tIekpKN3VDWXFzTFVwaUowS1pFejJzbXBneHo2?=
 =?utf-8?B?S0YyeWpuZExoVEIycE8zM0NRSDNYNjBLQ093MzdYa0p6d2EvekJXZ2twbXpB?=
 =?utf-8?B?bXVjQk9ESk1ZZjJiK1k1WHFoL2VVeVZXR3U0YU5IcVVUWlozVmRHYlA5WTlR?=
 =?utf-8?B?L0UxcUJRUTBtY0VERExBRmJ4bnoyODMxUXU0K0pxdEx0YUVjWkh4YVovbm1o?=
 =?utf-8?B?R00zYzYreHZNQXBqRzVyUEVhM0hQZU96bVA5NFpTR0dybW5RaXJlNjJUTVBI?=
 =?utf-8?B?UHJ6Y2ZLRjdDZEVBZG94Tmk1ZGhGQnplT1pRNTJjYmxtMlduaXF0WW5jMHhY?=
 =?utf-8?B?TlFTdkFTRG5tL3RiTlMxK3NWUXIwNGcyMlZ6T05jOWNvQ3o0eWcralROaHYw?=
 =?utf-8?B?d295V1N2b3JlNVl6Vmc1eG9UQlIyM0ZJV1k3SjBYaEQ1eUhvMWV3ZklnbnJI?=
 =?utf-8?B?V2V5SEJtd1poMHVBbEFaS2gwWml3MzJXdVk2QTA1Z3E4d1U1UllBemJjQVhn?=
 =?utf-8?B?dW44dHlPeFgrUFRNZFZsbk5UaHdsTjVUWFU0bHI5cXVTVHpxR1VCd0pQRHhK?=
 =?utf-8?B?dkYxbzltcnN3MGxZaGFNTXU1Y05lUHp4U0MwajJYdmFacWtEZ1MvUVlBaGFz?=
 =?utf-8?B?RnN6b0xib25vQ3J3RVkyWU5CMWwzTUwyWlF3bEVNdlhyL1c1YkUxbmdJL0Rh?=
 =?utf-8?B?RnYzc3ZJQjlKU1lBazg0bzNDZzJ4TSt6UTl3T1FKVWVSR2wxRWEzZHo1MVp0?=
 =?utf-8?B?eXBtOFRIOTJBOE9FSTB4VmF1cGZzTFFQZGYwNVpiZHNMbStoZUh6K0ZMemdx?=
 =?utf-8?B?N3BaVWlodEhUd0VoRGo0SkRBV1ZYcUZTSm5hODRhZ0doT2UvNTl3UlM4cUJ3?=
 =?utf-8?B?dERFV1hFM1hRVEpvc0xXZVVScVRkRHhJSlBjYkJOSWFsVnpIbGZHMzVzVkk3?=
 =?utf-8?B?bndWRjhhSnhrMzAyZ0IzT1lUVDFiSDdsTlBzNkhDSDNVdU9rQWYvdGNOZ3BR?=
 =?utf-8?B?UjB4YjBOZm84MG1Pdy9XK2ZlQWxPWldUYW9YTXNEYXJrZ1dNT3JlVWxjSFp6?=
 =?utf-8?B?c2phRkcvUTN1QUd5enlkOEJCUnY1NGcrT2JNVnNnS3dxc3hoTXR4WVA1cnpn?=
 =?utf-8?B?TVppeG1XRWFoTkxQUFJnTWJvdmFNUXloZUk0VEp3UjliMk5sd2Y0aTdUSE1i?=
 =?utf-8?Q?NR4yQzMKGvEWPuw4C+Sce8A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 240610dd-cb21-471e-d1ec-08d9c4ad61ea
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 18:12:00.2324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpDe1OgPr8NTgfHQUpYQqgVjB5oPctS4zY1XLq3J+GDZx6BqQOSQgCFjqOw5BTzHxfBi7gqD912I+WBmZoLv+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1693
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


On 12/20/2021 3:52 PM, Sundaresan, Sujaritha wrote:
>
> On 12/16/2021 3:30 PM, Vinay Belgaumkar wrote:
>> By default, GT (and GuC) run at RPn. Requesting for RP0
>> before firmware load can speed up DMA and HuC auth as well.
>> In addition to writing to 0xA008, we also need to enable
>> swreq in 0xA024 so that Punit will pay heed to our request.
>>
>> SLPC will restore the frequency back to RPn after initialization,
>> but we need to manually do that for the non-SLPC path.
>>
>> We don't need a manual override in the SLPC disabled case, just
>> use the intel_rps_set function to ensure consistent RPS state.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c   | 59 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_rps.h   |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++
>>   drivers/gpu/drm/i915/i915_reg.h       |  4 ++
>>   4 files changed, 74 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 07ff7ba7b2b7..d576b34c7d6f 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2226,6 +2226,65 @@ u32 intel_rps_read_state_cap(struct intel_rps 
>> *rps)
>>           return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
>>   }
>>   +static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
>> +{
>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>> +    u32 state = enable ? GEN9_RPSWCTL_ENABLE : GEN9_RPSWCTL_DISABLE;
>> +
>> +    /* Allow punit to process software requests */
>> +    intel_uncore_write(uncore, GEN6_RP_CONTROL, state);
>> +}
> Was there a specific reason to remove the set/clear timer functions ?

Replying on behalf of Vinay Belguamkar:

We are now using the intel_rps_set() function which handles more state 
update in the correct rps path. We also obtain an rps lock which 
guarantees not clobbering rps data.  The set/clear timers were being 
done when we were modifying the frequency outside of the rps paths.  
rps_set_manual is now only called in the SLPC path where the rps timers 
are not even running.

>
>> +
>> +void intel_rps_raise_unslice(struct intel_rps *rps)
>> +{
>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>> +    u32 rp0_unslice_req;
>> +
>> +    mutex_lock(&rps->lock);
>> +
>> +    if (rps_uses_slpc(rps)) {
>> +        /* RP limits have not been initialized yet for SLPC path */
>> +        rp0_unslice_req = ((intel_rps_read_state_cap(rps) >> 0)
>> +                   & 0xff) * GEN9_FREQ_SCALER;
>> +
>> +        intel_rps_set_manual(rps, true);
>> +        intel_uncore_write(uncore, GEN6_RPNSWREQ,
>> +                   ((rp0_unslice_req <<
>> +                   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
>> +                   GEN9_IGNORE_SLICE_RATIO));
>> +        intel_rps_set_manual(rps, false);
>> +    } else {
>> +        intel_rps_set(rps, rps->rp0_freq);
>> +    }
>> +
>> +    mutex_unlock(&rps->lock);
>> +}
>> +
>> +void intel_rps_lower_unslice(struct intel_rps *rps)
>> +{
>> +    struct intel_uncore *uncore = rps_to_uncore(rps);
>> +    u32 rpn_unslice_req;
>> +
>> +    mutex_lock(&rps->lock);
>> +
>> +    if (rps_uses_slpc(rps)) {
>> +        /* RP limits have not been initialized yet for SLPC path */
>> +        rpn_unslice_req = ((intel_rps_read_state_cap(rps) >> 16)
>> +                   & 0xff) * GEN9_FREQ_SCALER;
>> +
>> +        intel_rps_set_manual(rps, true);
>> +        intel_uncore_write(uncore, GEN6_RPNSWREQ,
>> +                   ((rpn_unslice_req <<
>> +                   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
>> +                   GEN9_IGNORE_SLICE_RATIO));
>> +        intel_rps_set_manual(rps, false);
>> +    } else {
>> +        intel_rps_set(rps, rps->min_freq);
>> +    }
>> +
>> +    mutex_unlock(&rps->lock);
>> +}
>> +
> Small function name nitpick maybe unslice_freq ? Just a suggestion.
>>   /* External interface for intel_ips.ko */
>>     static struct drm_i915_private __rcu *ips_mchdev;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h 
>> b/drivers/gpu/drm/i915/gt/intel_rps.h
>> index aee12f37d38a..c6d76a3d1331 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
>> @@ -45,6 +45,8 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps 
>> *rps);
>>   u32 intel_rps_read_punit_req(struct intel_rps *rps);
>>   u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>>   u32 intel_rps_read_state_cap(struct intel_rps *rps);
>> +void intel_rps_raise_unslice(struct intel_rps *rps);
>> +void intel_rps_lower_unslice(struct intel_rps *rps);
>>     void gen5_rps_irq_handler(struct intel_rps *rps);
>>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 2fef3b0bbe95..3693c4e7dad0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -8,6 +8,7 @@
>>   #include "intel_guc.h"
>>   #include "intel_guc_ads.h"
>>   #include "intel_guc_submission.h"
>> +#include "gt/intel_rps.h"
>>   #include "intel_uc.h"
>>     #include "i915_drv.h"
>> @@ -462,6 +463,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>       else
>>           attempts = 1;
>>   +    intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
>> +
>>       while (attempts--) {
>>           /*
>>            * Always reset the GuC just before (re)loading, so
>> @@ -499,6 +502,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>           ret = intel_guc_slpc_enable(&guc->slpc);
>>           if (ret)
>>               goto err_submission;
>> +    } else {
>> +        /* Restore GT back to RPn for non-SLPC path */
>> +        intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>>       }
>>         drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>> @@ -529,6 +535,9 @@ static int __uc_init_hw(struct intel_uc *uc)
>>   err_log_capture:
>>       __uc_capture_load_err_log(uc);
>>   err_out:
>> +    /* Return GT back to RPn */
>> +    intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
>> +
>>       __uc_sanitize(uc);
>>         if (!ret) {
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index 1891e7fac39b..b2a86a26b843 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -9399,6 +9399,7 @@ enum {
>>   #define   GEN6_OFFSET(x)            ((x) << 19)
>>   #define   GEN6_AGGRESSIVE_TURBO            (0 << 15)
>>   #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT    23
>> +#define   GEN9_IGNORE_SLICE_RATIO        (0 << 0)
>>     #define GEN6_RC_VIDEO_FREQ            _MMIO(0xA00C)
>>   #define GEN6_RC_CONTROL                _MMIO(0xA090)
>> @@ -9434,6 +9435,9 @@ enum {
>>   #define   GEN6_RP_UP_BUSY_CONT            (0x4 << 3)
>>   #define   GEN6_RP_DOWN_IDLE_AVG            (0x2 << 0)
>>   #define   GEN6_RP_DOWN_IDLE_CONT        (0x1 << 0)
>> +#define   GEN6_RPSWCTL_SHIFT            9
>> +#define   GEN9_RPSWCTL_ENABLE            (0x2 << GEN6_RPSWCTL_SHIFT)
>> +#define   GEN9_RPSWCTL_DISABLE            (0x0 << GEN6_RPSWCTL_SHIFT)
>>   #define GEN6_RP_UP_THRESHOLD            _MMIO(0xA02C)
>>   #define GEN6_RP_DOWN_THRESHOLD            _MMIO(0xA030)
>>   #define GEN6_RP_CUR_UP_EI            _MMIO(0xA050)
>
> Regards,
>
> Suja
>
