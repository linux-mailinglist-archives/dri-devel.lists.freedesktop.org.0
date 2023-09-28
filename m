Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A237B11AF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 06:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F126A10E559;
	Thu, 28 Sep 2023 04:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796910E559;
 Thu, 28 Sep 2023 04:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695876429; x=1727412429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+qrpY4sDJG1s61PTSKSWhcWtkC9I0TgQ9pJFxRodItI=;
 b=Gh3F9erVaDJlcvujQYrCO0KeSkJ/RoowqUrylsUGklKoIBluqse+ipqV
 bJv+H28IvaS8ZETTRI9gmjKAcmkBMeVekqGx7TwZFQa4/B1uwU2FCl8aB
 CHb0Nn5nsoFsTFQqJz952cwLoOoII53LRazoOQHMKMkYlTdjdiKGRB5my
 qj1dmW+PFVgLNnO0mdjJLy9xq1DtLvvgiOWR7mH9tjmo2+THcImskkBWG
 ADr/MRVwZE696BYxyUYjF0x7G/K3rUb9jVNVTY+2zMZEuGrz0GK7FBvy7
 oSgB+kdrv2sSA4JdqOPshGhJkbqDea/b9eGCIw3d4TouysOR1Zn1gujTY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381889566"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="381889566"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 21:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="726099346"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="726099346"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 21:47:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 21:47:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 21:47:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 21:47:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 21:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4QXrgr8biWTSlINF+YroeWE9FpJgeQO/i6rFsxiJ55v+BR10J7hVZFzo/hO42DIez6DHbgDuyBmX95nXxZA/TmY8os8D54JTWyLwM3Tcysme0RJjM+VC18pquoEK9D8eJRvQoh+p5eGvUgsleKaEt5I6j3c93hfrve4b1ib50Skm9cGsL0sxpJqTlLZ3lS4qeEcQj225s97+zeihS+ekFmIrddRxHLRgzZCsJ9ZJqJBp2Dw/yFhoEYQVc2CE1xRGnRLYeKWesoDcE/H3foXJEHRGNlbXLzY0HlcNG8H5Q6tbFaOlf9LHouEJB5Ucl67MGb7nLUPuIbv7xpU71labA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhUN/tvj8UjTiR4LiKI5elwX3NL/cozaddOKK89RsE0=;
 b=FBcOViA4Nt6FBmhDjuBYZuepN3wwj+N/SgNP5KIN8eMNQI1PZb2mSM4q4fNeiNUFPm1RD0Jh/WJscmZKJkM5kslCCmHehLuZxryqgqjeZyt6AZmC9ZUhpuoQoCe0iPuFzFtyRegLE3hQuugEXSwLAGHxxW4+K5EYxhkdN2TYM9Q8MnpjXy5kzIVGTkabkFRAdyk3qaLcSsmE7HFko5MGWA9q/r2jj7B1hUP/o6AHprB1jCKpkTMATEynTiOz8CiT87/1KMbZFypxUjgTFaSYIJz42x2e6Km8BGgz14ZFWR0bH2MTjiy2ayeH9HsCMYulMqZAyfmbO5MKkmN18DRzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3406.namprd11.prod.outlook.com (2603:10b6:805:bb::33)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 04:46:59 +0000
Received: from SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::1189:a7c5:3536:65fc]) by SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::1189:a7c5:3536:65fc%7]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 04:46:58 +0000
Message-ID: <de4ce324-eacd-09a8-6e2d-4a9d41a0683a@intel.com>
Date: Wed, 27 Sep 2023 21:46:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [Patch v1] drm/i915: Add uAPI to query
 micro-controller FW version
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
 <c248c6b1-923d-2e19-9ee9-60445d822fa9@linux.intel.com>
Content-Language: en-US
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <c248c6b1-923d-2e19-9ee9-60445d822fa9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To SN6PR11MB3406.namprd11.prod.outlook.com
 (2603:10b6:805:bb::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3406:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb096d0-4111-4539-8921-08dbbfddf286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wNUAaiNVr1tCRWv/RWnKMoR2QNtp3MtvYC1B8F+75YuoBLI5IUlPku2lueAImZTyrtumpxJRgmvV7jKw6F5CXcz+KKMRKEgq95TVCFQylOIESE87ne8XrUV47eqkmqk+9F/xjXnE9flLxPlrX6FavqOnhTRxvBrkE7IJs4Y+wjZOHPNsKHeqVLtt8VeZrum5BwdYxO16jXdM7d1kBFTttkeA9g0P0nnVqdmGisO3nvYWMhQByVxYT+4gVzuNBX93C7SwRQsDq8VSraoFTZ6Wf9p8bR4PFXqI7vH2OilljvpW9/HiKKXfxvwMFiOYByg+mUPDHQIlv+Ba4BAAEds53WPw9qnfJO0556zJL5JQ5P1fMIo3NeMC/Gotdt9DqIT5CJehpvWWYhEoNQ4Cjvy1QDv3nAidNjnou7w2HR5RW/ak6dyOrOI9NtyHKIVtjTLLqQVZq1lqSOhGC0cVtsXAN/zBaUC0e0oNEQqusXrsdy8FI1g9cGHik5QVd5sZ5OgY8nzymg3MZ/Wjw4jAqCA2Ef8sH3DFwaOjJMuY1BOytj5JaW3pe7WmqiPSP7tdzjCTShkoUnugCahMv0BMnMA3VRTCKKECnYAAQWrZTzTZhUQwjonySxujf9TdsSfPtAYGztl7YCHAAFYJmAhF7bfOUe19glQZnKQX1jetDC+nxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3406.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6486002)(53546011)(6506007)(2906002)(6512007)(86362001)(31696002)(2616005)(966005)(36756003)(478600001)(8676002)(4326008)(8936002)(82960400001)(38100700002)(83380400001)(41300700001)(5660300002)(316002)(26005)(31686004)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0YrRlNpVXZhOVpxeHVXYjZPZStpamVPcjFsc2NnSnpGeVZCRnA3dG9ldFlB?=
 =?utf-8?B?YnJtYUxDMURaMnhzY1FOVTlJTThhTDZWRlZ6ZllsRzdDYTNaS3BXQi9rR0o3?=
 =?utf-8?B?bnMzVEtOeFZvK29zRU1QTXVhN2I0Nit0TGVhUno0T2pGZXFtbTEyM1RQT1lj?=
 =?utf-8?B?eWdhd0E1VEhyR2VORHIxRVcvWjdCaFJuRTdIOS80K0piS1FWQnBQS2dQN3o3?=
 =?utf-8?B?dERJN2l4Y3ExeDZvUXFOTnpkVG91QlhiOXU1UWw5TUpKK2VqM2lIMktMSE02?=
 =?utf-8?B?ZFBaZVkvR3loRlk2QlI5VWk5VWF4T1NFWmdTKzduQ2ZSb2F4SmZjYnFrMVlC?=
 =?utf-8?B?aXBmV1VKcEx1aWptNFg4RWVrdVk0ZUdoeDZaYUQ2Q1FuZm5GaW94djJQMzdj?=
 =?utf-8?B?Y1RNYlEvVEgrclRxUkVMelg2cERVQ0FGdEVIQWdnL0RxTjRXY3NVVU1FdnBj?=
 =?utf-8?B?cWJ4RGtaMU1FOEtaRGk0WEZiaUFuRWVoSitvNSs3Rko3OHFlODRWQUNoQWZY?=
 =?utf-8?B?RUZNZ1FXN1pUMGFhWHVmNk1vQ0lkbS9VMFB2S3J5RmV4ZTBSWlhnNUhpY0tr?=
 =?utf-8?B?TjhhMk9KRkYzR3ZLY2NIczU5NDd3bG04UXJQWnFTVjI4NWY5dkJhdHhOcmJp?=
 =?utf-8?B?c3pKNjUzQVBNaWNpRUp4dUJNQ1c0djRtZTJuNzdLN1B4b252REZJcTl4TlhP?=
 =?utf-8?B?dkVrSnRMMi9CeHJ5SGExTThNLzF6TE15N0NoYllBallzdFVHMTBmMlNKT1Fz?=
 =?utf-8?B?eS9LQjJmWS9GaVZBVThKS2p2alV6dHlvVElhY2JMVUUxaTF3SW1LczdpT2cv?=
 =?utf-8?B?cXR6ZmpvMlZ5MUtVaEJ3L2RhazFrK3VjcGxpZjc5cExTUStldUh0ekMrRndE?=
 =?utf-8?B?dFRwVnpBTWJETFcrNGZHRXQxV3FQYWppZW5PNzNWUVFjSEk2VDRwVVJnL0Qw?=
 =?utf-8?B?MW1xVU1zaTNkazNxNlN6S2Q0THRjdDJSL0hzSlpsb0ZkUk9XcDZaaEFwM2Ns?=
 =?utf-8?B?TVpGd1NwYUlyRWhZZWYyWVE1eFhZZExxeVc5RFRWT2xiY2lLVXJUV1BZdFoz?=
 =?utf-8?B?NE9mbVJ1aXhGOEIvQXc4MmhCbDRUQlNUWDE5Z0pmcUlpSXpyTTdtcHBvR2p0?=
 =?utf-8?B?dWxkYnVUbTRYMDdHaGxRZlFSVThSaWt0eXYvdWd4ZDlJM0Rmc3ZEb05Md3d5?=
 =?utf-8?B?R0gxMDlqcjhWSjMxL0RIeDNRUmROYndkVmN6M3VnbTl6cVRrY0s0YUIvSzR3?=
 =?utf-8?B?aGhkWURFRjViQzZzZnRIRzhNKyt5bVUxZVIyeFNUalVSaHVPd01Cc0ZoRzM2?=
 =?utf-8?B?N2lVSThWZldZVTRCS2JyRFJQRVJaTFVWbW5FdW44MWxqN05oQmx0c3p1QlVU?=
 =?utf-8?B?aHh1RTRYK25tSEI0ZzRzUE9jWjBueDJSdG5UUHBkdHhpQjl6THI2dmJmb0t1?=
 =?utf-8?B?UWg4NFlOSXE5SkxVYjBPR0tua1I5ejRWM1IvYW0xbFNGa3RpcWRCNFYxYXV6?=
 =?utf-8?B?VWtNakp2MnUxbnkzaWpJamZRWHRMaWEyRkpRQi9XVWFSMkVCVCtTRWxOdVpt?=
 =?utf-8?B?SVJnMmZpazhlWk5mRmtjalJyMXRoWWkvd3c1bUl2NmtPakNxbHBJd1dVL00z?=
 =?utf-8?B?UDJCamR3Rzc1clk2S0tmUUdpR3ZtejBBMFNXdWI2Umd6SDhCWnkydXREcnM2?=
 =?utf-8?B?dEt3dWtKcEpVS0M2b2o4cEJkVGtHQWU1c0JseTYwL3JBUDB0Q3dOSkpGTlpn?=
 =?utf-8?B?T2UrV0ZSbW5rRm12UlFLOEI4eHNJYlFVWU1zenQyNXB2aGFvWHBacVZ2YzIy?=
 =?utf-8?B?ZTRQclBRMEgxVTBCeDREaGw5WjY1clZxUDVUZEcvMUc2UGdGd25jZTIrbkJ4?=
 =?utf-8?B?TEgvbmlJV3RGWTRsODk4NXJkNFJXWUp6WXQyREZjSW82akdRMTdaN29HaGIr?=
 =?utf-8?B?RHRxZFhTSDB2OHZvU1pXWGd1L1pNRGVIQnVTdzZkMGpQMi9uaXFOR0ZRQ3Zn?=
 =?utf-8?B?ckxDd0VqNGRHOXVuL2d5cWtyZlJ1NjYrMGhwUFFSZEpVUWk0bC92cGdDVXFa?=
 =?utf-8?B?eEdFZlk1ZVlpcTdnNVl3bFo5MGlpWFRZeGxVbG9sNm1JUmpLdko1emNqOTBP?=
 =?utf-8?B?RG1rNkFxaURWbTBIS2JTMUtPZ21ibEs4TDIvNVIveWUyTjlzdmY1ZTBsQ01y?=
 =?utf-8?Q?8PglgxJspKSqUDOF3U0P4pc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb096d0-4111-4539-8921-08dbbfddf286
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3406.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 04:46:58.7287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/4/qRTFLYQMx937PpnjyQ86WgJwqzv4/3OtVUJ0DgPHk86b09hL7MrJQDDNQVGGKFXqbeaBgR4jmcAFnwi7v3yb2HfLr9uMkP3T/vjoSoZ6wUs/XhT27J59PNYXRtbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/2023 2:20 AM, Tvrtko Ursulin wrote:
>
> On 27/09/2023 05:14, Balasubrawmanian, Vivaik wrote:
>> Due to a bug in GuC firmware, Mesa can't enable by default the usage 
>> of compute engines in DG2 and newer.
>>
>>
>> A new GuC firmware fixed the issue but until now there was no way
>>
>> for Mesa to know if KMD was running with the fixed GuC version or not,
>>
>> so this uAPI is required.
>
> Is the firmware bug making the ccs engines generally useless, or just 
> not suitable for this specific Mesa use case?

My understanding is that this issue was found as part of this specific 
use case (enabling async compute queues on DG2).

We are adding the new uAPI to cover for similar situations in the 
future. Will clarify in the description above.

>
>> It may be expanded in future to query other firmware versions too.
>>
>> More information: 
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
>>
>> Mesa usage: 
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
>>
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>
>> Signed-off-by: Vivaik Balasubrawmanian 
>> <vivaik.balasubrawmanian@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 47 +++++++++++++++++++++++++++++++
>>   include/uapi/drm/i915_drm.h       | 32 +++++++++++++++++++++
>>   2 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c 
>> b/drivers/gpu/drm/i915/i915_query.c
>> index 00871ef99792..7f22a49faae7 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -551,6 +551,52 @@ static int query_hwconfig_blob(struct 
>> drm_i915_private *i915,
>>       return hwconfig->size;
>>   }
>>
>> +static int
>> +query_uc_fw_version(struct drm_i915_private *i915, struct 
>> drm_i915_query_item *query)
>> +{
>> +    struct drm_i915_query_uc_fw_version __user *query_ptr = 
>> u64_to_user_ptr(query->data_ptr);
>> +    size_t size = sizeof(struct drm_i915_query_uc_fw_version);
>> +    struct drm_i915_query_uc_fw_version resp;
>> +
>> +    if (query->length == 0) {
>> +        query->length = size;
>> +        return 0;
>> +    } else if (query->length != size) {
>> +        drm_dbg(&i915->drm,
>> +            "Invalid uc_fw_version query item size=%u expected=%zu\n",
>> +            query->length,    size);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (copy_from_user(&resp, query_ptr, size))
>> +        return -EFAULT;
>
> The above can probably be replaced by using the copy_query_item() 
> helper and it would work a bit better even since no reason to reject a 
> buffer too large.
>
Yes makes sense. Will send out an updated revision.
>> +
>> +    if (resp.pad || resp.pad2 || resp.reserved) {
>> +        drm_dbg(&i915->drm,
>> +            "Invalid input fw version query structure parameters 
>> received");
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch (resp.uc_type) {
>> +    case I915_QUERY_UC_TYPE_GUC: {
>> +        struct intel_guc *guc = &i915->gt0.uc.guc;
>> +
>> +        resp.major_ver = guc->submission_version.major;
>> +        resp.minor_ver = guc->submission_version.minor;
>> +        resp.patch_ver = guc->submission_version.patch;
>
> Submission version is not the same as fw version, right? So 
> DRM_I915_QUERY_UC_FW_VERSION and uapi kerneldoc is misleading.
>
> Name the query type I915_QUERY_UC_TYPE_GUC*_SUBMISSION* and make it 
> clear?
>
> Regards,
>
> Tvrtko
I think this makes sense. The use case requires a read of submission 
version vs. the file version. Will update in the next revision.
>
>> +        resp.branch_ver = 0;
>> +        break;
>> +    }
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (copy_to_user(query_ptr, &resp, size))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private 
>> *dev_priv,
>>                       struct drm_i915_query_item *query_item) = {
>>       query_topology_info,
>> @@ -559,6 +605,7 @@ static int (* const i915_query_funcs[])(struct 
>> drm_i915_private *dev_priv,
>>       query_memregion_info,
>>       query_hwconfig_blob,
>>       query_geometry_subslices,
>> +    query_uc_fw_version,
>>   };
>>
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct 
>> drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 7000e5910a1d..9be241fb77d8 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
>>        *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
>> drm_i915_query_memory_regions)
>>        *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>>        *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
>> drm_i915_query_topology_info)
>> +     *  - %DRM_I915_QUERY_UC_FW_VERSION (see struct 
>> drm_i915_query_uc_fw_version)
>>        */
>>       __u64 query_id;
>>   #define DRM_I915_QUERY_TOPOLOGY_INFO        1
>> @@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_MEMORY_REGIONS        4
>>   #define DRM_I915_QUERY_HWCONFIG_BLOB        5
>>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
>> +#define DRM_I915_QUERY_UC_FW_VERSION        7
>>   /* Must be kept compact -- no holes and well documented */
>>
>>       /**
>> @@ -3213,6 +3215,36 @@ struct drm_i915_query_topology_info {
>>       __u8 data[];
>>   };
>>
>> +/**
>> +* struct drm_i915_query_uc_fw_version - query a micro-controller 
>> firmware version
>> +*
>> +* Given a uc_type this will return the major, minor, patch and 
>> branch version
>> +* of the micro-controller firmware.
>> +*/
>> +struct drm_i915_query_uc_fw_version {
>> +    /** @uc: The micro-controller type to query firmware version */
>> +#define I915_QUERY_UC_TYPE_GUC 0
>> +    __u16 uc_type;
>> +
>> +    /** @pad: MBZ */
>> +    __u16 pad;
>> +
>> +    /* @major_ver: major uc fw version */
>> +    __u32 major_ver;
>> +    /* @minor_ver: minor uc fw version */
>> +    __u32 minor_ver;
>> +    /* @patch_ver: patch uc fw version */
>> +    __u32 patch_ver;
>> +    /* @branch_ver: branch uc fw version */
>> +    __u32 branch_ver;
>> +
>> +    /** @pad2: MBZ */
>> +    __u32 pad2;
>> +
>> +    /** @reserved: Reserved */
>> +    __u64 reserved;
>> +};
>> +
>>   /**
>>    * DOC: Engine Discovery uAPI
>>    *
>>
>> base-commit: a42554bf0755b80fdfb8e91ca35ae6835bb3534d

Thank you Tvrtko for the review and feedback. Deeply appreciated. - VB.

