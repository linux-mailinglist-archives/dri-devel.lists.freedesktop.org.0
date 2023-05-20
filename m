Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA470A3FA
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 02:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E064E10E488;
	Sat, 20 May 2023 00:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F1B10E476;
 Sat, 20 May 2023 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684541875; x=1716077875;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dbdETUVx3JHekxQ3Kz1jLHTDRCoE09+nKDtw5CeZXlc=;
 b=RzdlwMGaGGOUzw7EPLtsqih4lHTEBrV4bY33DGjnDx0AxHmDUBRB5Btp
 kh/9hLWUmaUc0t3QvYrSVqn2Ph9aUeltIt9t9p1bkol0T+1edjR6uluIm
 Wmm2A6MvnsQEcMzU6PjLxa5CJ02eJjr57+T2WrFNpXfa3QSI0h2Q9THgA
 deeUffjyWYRIjzMMxSGGtEG+ySD4uyZf32AIraWvqjU3Xt5lgLtomuK8h
 h8s/DpbLfxTb7o/rGLAsM5J1ZgVTSmZ4as25cLr3YI889FkGhQB5wuUD6
 tEF+bbmHdzhR7Fq7loZRDwDL8wx4nvH4RXgxFptuSRtzAwfAp9CUCA9QQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="350028508"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="350028508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 17:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="792550588"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="792550588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 19 May 2023 17:17:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 17:17:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 17:17:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 17:17:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 17:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxQlFu98KXJoaWWNK1bflz8NrRRX4d4LjBtbrq55+1s9HCwsUC2JxiCEB2fpPpOnKXpK5k1L7MGq2cctqriqoEmjFyBnCAk665TQROONv4J/BI+M06AEfNa9TUvwEphVN4MgWiNMuPGz/AlNiNM05flePyK9VZEUoaUY0w3rx9iupJvQwfZOBOS3SPI4h/32ugGQLrtCENs1On33jyUx9JNr4SG9NMQAVOAmwm7Og6pOYTDIxYRaCyM0QVIcdCbGOww+6z6W6GlID3Kr4esH677QbU2InAmJ8sqn5yMyPMR6pLRLOjpEEsR18XwDDfPONdv/YLrG5cIOBNcAxEgaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJGFVbmXRaW7ssl/5LPfymedy+Vb7vj2lXL55o5P6dI=;
 b=ZAIglRymHvny3bu1e/rM5EcBK/eY4cBg1Ee0oKS9ACl9srn2F0x24ia3cFFArJH4yZsNejtDiq3PPaIjxYKlXf6AaMQruriFpwUWV/MqT3+N0iYU3TA8K88/oihh3khtvavkFIQ8WfNypsn+rguGeiPtX/euoMoLPEAJWD9Vi5KOYJlvhHdwvMWQkYYiOqCEDywMpgu0H5NSC1aKxUK83uZRRolMGl16cdoD2gTzUbeZlqucLK3XQudR2mHZwrbBJoBQjXYYPc00JLeA8tnHXCj7h5DF2tGu9d3mDUro9xQPTp+gF2pJFKQcAtnsVbwlTCkdS2cXdeajNL/joicklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by SA1PR11MB6662.namprd11.prod.outlook.com (2603:10b6:806:256::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Sat, 20 May
 2023 00:17:51 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::3e21:b089:38bd:7ab2%5]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 00:17:51 +0000
Message-ID: <b167080e-61a8-34ca-627e-be146a5d448b@intel.com>
Date: Fri, 19 May 2023 17:17:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH v2 5/8] drm/i915/huc: differentiate the 2
 steps of the MTL HuC auth flow
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-6-daniele.ceraolospurio@intel.com>
 <16f2fad7-f8dd-21cb-ca10-cf3bf3435756@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <16f2fad7-f8dd-21cb-ca10-cf3bf3435756@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|SA1PR11MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: e2898e60-f10e-4810-ce7c-08db58c7a5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhqL5SjAt8p+uuvLzfvqcSgBX4B0UYbSYaf1sur4Rh+8HVr//9E6o9GNHkeGLk2bc7LdH1bsxeavOVFxl1+0ddKbHlYgCMsWvil0qesgINZ4iTwKVoQeNfrW6SY+/Q5QzOhX0YSlf+/WvaaO6nisFfcEbpCgK2UhzagxiSPQ9Ld6qMODd/VhEW8u7PF57o+Dcm/E5L9rcqn3/FdYacJWdUOHLtmrnsasMFxTXdZsPC2OmdD85Rgg1IDyS8neUrfKv4qSzKIumzerXHGukqSWzBuwHHOOFi88PmZgd6hUwLYUdy3HQr84gWPFRig4Jas0yU1Zcz3KrVPyk3eSnWUHccw0s7/nCP9RFch4dvNFoubtcXn6YZiC3WrtG3XA2Cj3OVBjnfzkyCoBQmK20bD117Ggqc9zIUxOIqbnjualePZQixwB+cyMLxcD7HJPIhtKU8wR7lNXvKwe4aQEM8zp7OfxgkLxPpG3EPxpLG8Cp1ZNpbkzutkHHVg3Et6574IIRwHPfFUb6bJD5YdNPScxXZVbTGk3JH7ZgI1Ynt2rhOT/yr99Nydl99c4xOl5gZ8PR801vneZgrOSR4JH4dqg5aXEFlpk8fm6uyvK7rdVQisoTbcrtT2n6+6T1m/opfZmgWX0ODSr3rR2foiO0soQHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(31686004)(316002)(30864003)(5660300002)(8936002)(8676002)(41300700001)(4326008)(478600001)(450100002)(2906002)(66476007)(66556008)(66946007)(36756003)(6486002)(6512007)(186003)(6506007)(26005)(38100700002)(53546011)(82960400001)(6666004)(2616005)(86362001)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlGOGd6V25JSnVocmNJRDBIMUZ6ZUhwMXhybFdtWWhnU2xrbHJHaG9mSEJM?=
 =?utf-8?B?eWttUHg4Nkk5SXI2aEYwZW1lZUUyT3pPRmV2YnNGQ05PUG9GcHBWeHF5L0VT?=
 =?utf-8?B?QUx1TGhYVjM1Vll1b09HK3pCN1Z5clVYOWpJUkhvUFNrdUFvc2kySzhJOUpm?=
 =?utf-8?B?TVUyZWpSRG1nVk9YaDh6YlowNk1JLzBZMjFhUGpta2pPd3lDRUg4Nng0QjJl?=
 =?utf-8?B?Vnk3QW0rVXBRSklWN0lYUitETVprNURQYm5lZEJaV1dNN2I4OE5odllwN1l6?=
 =?utf-8?B?RjNRekNQN2V0dTBzWVFvYkNXS3Iwdi9SVW1pbGVJY2hRWE1KYldmSEFnWWdX?=
 =?utf-8?B?bHJsWEM2RDVpVzlLMzdZcVkzNm5hVVlHQTlkaHpwWC9xSE55SkZLZm1hb2pE?=
 =?utf-8?B?YlkvWkFCbThFTG5aa1VFaVQvV09MMW0wN3BjOURCSDFsTWN4aTlibDNjV3dL?=
 =?utf-8?B?MFdCTjVGaW1XazJqQVhpWEYvbEVmQmxZa1kwcUg4Y1U4RHduc2FQNnlPNjEy?=
 =?utf-8?B?RWFjeEZTSXJxd1VCRkVOdVR5SCtaV3Z0R0dUMHp3bHI5ZXpLSm1OVXRZdnRr?=
 =?utf-8?B?UXF2UmlzYytGOVpJaUhVL2RSRnZlbVN3dkNkNG9uRFBKUEhjZkt0RWd2RlNY?=
 =?utf-8?B?RWhjQWFSM3BFZURrYkZYUXpvQnBIV0ZPbXJuQktUMk40L1FRQVhZcHpjbXZs?=
 =?utf-8?B?MWlmcExPbFNlRXVMQTNDVVNxNVplaWRhNi84S1ZDSDVTMEZ2NW92M0pBL3ZL?=
 =?utf-8?B?SzdkNU1DYkEreWVGQTdySmhDSVpaby9ObUVQN3k5STc2UUNFbEltVXJoY25k?=
 =?utf-8?B?UWVOS1lvZ2UweTJtUkgyKzNIZHVGbmhiU1RaOWxUMDJ1OUFoNHA1cVZVbFBm?=
 =?utf-8?B?UnZUUHNiQUZMcmpmUGxZU0Z3TUxYYlE4cW9KUkNrQzVWOHhPTko3Yi84NVdo?=
 =?utf-8?B?R3hxNG01VzErTDlFcjJxOGpsLzZSYUVheVFjcWp3WTZFT1pHZ25jL3kvT0JB?=
 =?utf-8?B?bTR6Si9rbThNUTRUTU96ZktZdXdibnF1a3pGNHFOWmdvVEtURWd5ajdOVllB?=
 =?utf-8?B?aEhMUjNFTmZhMDBnOHMwZzFPSy85TjJybVgxZ1BKbVNHVy92TEY0Z3hzTTJF?=
 =?utf-8?B?c0EwaklsNG5QTnZaS3h2My9Db3p5RmlSZEJDL0Z2dE1GSmI4RWIxVzZCdytO?=
 =?utf-8?B?bDl3cEswRGFOTEhZSlNnSzZ0NzhsK214b0MvMkczbWZUQms3TjZteWVVUkw3?=
 =?utf-8?B?dTFMcTVUajUyb0I1cnRTQzVPWmFIdWs0TGNFVmF4UmV4Q0JRUlMzbkRmRDlB?=
 =?utf-8?B?d1pSRkQ0cVhsV2Y1emw4UW5jU2lZOCtpdzNISXhBeHZGYXI4QkVHeG82enQ5?=
 =?utf-8?B?dHFZbENiYS9WMFN6MXJIN0F5eCtndXNLNE1iUlh5TzM3NzBHbmhXMWxYQVll?=
 =?utf-8?B?ZDhESitHTTZ1N2ZQSGJsL3JlZ3VtK1BpVnBjcjlyVXFxM3ZKUEpLYnVYRGZH?=
 =?utf-8?B?OG1PL3FVR3VZbFZ2Vkw3Z0VYazVQeVR6eUIzczlVNllkWThsUlBnVWN3dWt6?=
 =?utf-8?B?MWJ5WERTdFREcWFKdlordngzWHU5cm5UM1F5Tyt5SCt1WHViNDZVdEFEWHhy?=
 =?utf-8?B?MFZqMkJFT2JvT09ReGFvVS82WmxYOGVJUWEwcjhFT1FpcEFtYU5KYThhRTZt?=
 =?utf-8?B?aVJ2alUzZ3VxZWlHb3N0Wk9Nelp2dktWeFBrS1l4a1dWVVVtb1B4OVdVRFhW?=
 =?utf-8?B?cEdzL3orUXpPMGVhQklvUXdJeUJXZW1zL2hwTk96b0dOZEZ5WXo5S0svcFNT?=
 =?utf-8?B?RG5JL0lxWEF0WkMzTnBuWGR6NWU5NDVJOHR4RzEwZll2a0UySHg4dG9nUVdS?=
 =?utf-8?B?bzB4SW5vb2JteVljbmhaQjhrd3pNQlFYaHBGa1c1RFJGUnM3cVZJSjZxdGwx?=
 =?utf-8?B?MjF1b2RQaXgzRXVRSm85MWl0MkJaNkY0TCs3QzlsakF2aTVlQjIrRmk5Vk9s?=
 =?utf-8?B?VnZHV1F3VmgrS1RyeGpoWVJhK1dQZTV4NDlJUURUV3MrT3cyNWVuV1UrTk5G?=
 =?utf-8?B?VFlNdyt5b0lET3VpeEd0YndWdFZWWHpBbERMcG94aWwxUXJuOUM3emJFazRh?=
 =?utf-8?B?eXdhMGVHYUU4UzgxWU1hWGFPQXNzQ08vYWVqUVNKTUlXbEd3L0JLMGMyeVFF?=
 =?utf-8?Q?0Mdq0IZexRrDkjCFYRuadJE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2898e60-f10e-4810-ce7c-08db58c7a5b6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 00:17:50.8207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIlOpK2J5M+b6dRxZv6fW6oYjUtuWXEV3yYUuaDW0uO5cv/IpenMVKhxxP0OI9XpaZLZiKMbPejuF5yY9wLmrVHZf+5hkBOzYcB6JUvCUJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6662
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/19/2023 11:45 AM, John Harrison wrote:
> On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
>> Before we add the second step of the MTL HuC auth (via GSC), we need to
>> have the ability to differentiate between them. To do so, the huc
>> authentication check is duplicated for GuC and GSC auth, with meu
>> binaries being considered fully authenticated only after the GSC auth
>> step.
>>
>> To report the difference between the 2 auth steps, a new case is added
>> to the HuC getparam. This way, the clear media driver can start
>> submitting before full auth, as partial auth is enough for those
>> workloads.
>>
>> v2: fix authentication status check for DG2
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 94 +++++++++++++++++------
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    | 16 +++-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  4 +-
>>   drivers/gpu/drm/i915/i915_reg.h           |  3 +
>>   include/uapi/drm/i915_drm.h               |  3 +-
>>   5 files changed, 91 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index c189ede4ef55..60f95d98e5fd 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -10,6 +10,7 @@
>>   #include "intel_huc.h"
>>   #include "intel_huc_print.h"
>>   #include "i915_drv.h"
>> +#include "i915_reg.h"
>>     #include <linux/device/bus.h>
>>   #include <linux/mei_aux.h>
>> @@ -106,7 +107,7 @@ static enum hrtimer_restart 
>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>   {
>>       struct intel_huc *huc = container_of(hrtimer, struct intel_huc, 
>> delayed_load.timer);
>>   -    if (!intel_huc_is_authenticated(huc)) {
>> +    if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>           if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>>               huc_notice(huc, "timed out waiting for MEI GSC\n");
>>           else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
>> @@ -124,7 +125,7 @@ static void huc_delayed_load_start(struct 
>> intel_huc *huc)
>>   {
>>       ktime_t delay;
>>   -    GEM_BUG_ON(intel_huc_is_authenticated(huc));
>> +    GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
>>         /*
>>        * On resume we don't have to wait for MEI-GSC to be re-probed, 
>> but we
>> @@ -284,13 +285,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>>       }
>>         if (GRAPHICS_VER(i915) >= 11) {
>> -        huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
>> -        huc->status.mask = HUC_LOAD_SUCCESSFUL;
>> -        huc->status.value = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = 
>> GEN11_HUC_KERNEL_LOAD_INFO;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
>>       } else {
>> -        huc->status.reg = HUC_STATUS2;
>> -        huc->status.mask = HUC_FW_VERIFIED;
>> -        huc->status.value = HUC_FW_VERIFIED;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
>> +        huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
>> +    }
>> +
>> +    if (IS_DG2(i915)) {
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>> GEN11_HUC_KERNEL_LOAD_INFO;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
>> +    } else {
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].reg = 
>> HECI_FWSTS5(MTL_GSC_HECI1_BASE);
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].mask = 
>> HECI_FWSTS5_HUC_AUTH_DONE;
>> +        huc->status[INTEL_HUC_AUTH_BY_GSC].value = 
>> HECI_FWSTS5_HUC_AUTH_DONE;
>>       }
>>   }
>>   @@ -381,28 +392,39 @@ void intel_huc_suspend(struct intel_huc *huc)
>>       delayed_huc_load_complete(huc);
>>   }
>>   -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>> +static const char *auth_mode_string(struct intel_huc *huc,
>> +                    enum intel_huc_authentication_type type)
>> +{
>> +    bool partial = !huc->loaded_via_gsc && huc->fw.is_meu_binary &&
>> +               type == INTEL_HUC_AUTH_BY_GUC;
> partial = !loaded_via_gsc?
>
> If it is not a GSC load then there is no two stage authentication, is 
> there? Does that mean the single stage auth does not count as 'all 
> workloads' even on platforms where two stage is not supported?

Single step authentication always counts as "all workloads". The auth is 
partial only if this is a DMA (i.e. non-gsc) load with a gsc-enabled 
binary and we're doing an auth via GuC, which is what the condition 
above is checking.

>
>> +
>> +    return partial ? "clear media" : "all workloads";
>> +}
>> +
>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>> +                     enum intel_huc_authentication_type type)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>>       int ret;
>>         ret = __intel_wait_for_register(gt->uncore,
>> -                    huc->status.reg,
>> -                    huc->status.mask,
>> -                    huc->status.value,
>> +                    huc->status[type].reg,
>> +                    huc->status[type].mask,
>> +                    huc->status[type].value,
>>                       2, 50, NULL);
>>         /* mark the load process as complete even if the wait failed */
>>       delayed_huc_load_complete(huc);
>>         if (ret) {
>> -        huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
>> +        huc_err(huc, "firmware not verified for %s: %pe\n",
>> +            auth_mode_string(huc, type), ERR_PTR(ret));
>>           intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_LOAD_FAIL);
> This means that if stage one works but stage two fails, we mark the 
> HuC as dead? So the previously working clear media support now stops 
> working?

No, this is purely just for our internal debug tracking. The HuC will 
still work if just the second stage fails (the status returned to 
userspace is based on the HW regs).

>
>>           return ret;
>>       }
>>         intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>> -    huc_info(huc, "authenticated!\n");
>> +    huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, 
>> type));
>>       return 0;
>>   }
>>   @@ -442,7 +464,7 @@ int intel_huc_auth(struct intel_huc *huc)
>>       }
>>         /* Check authentication status, it should be done by now */
>> -    ret = intel_huc_wait_for_auth_complete(huc);
>> +    ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
>>       if (ret)
>>           goto fail;
>>   @@ -453,16 +475,29 @@ int intel_huc_auth(struct intel_huc *huc)
>>       return ret;
>>   }
>>   -bool intel_huc_is_authenticated(struct intel_huc *huc)
>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>> +                enum intel_huc_authentication_type type)
>>   {
>>       struct intel_gt *gt = huc_to_gt(huc);
>>       intel_wakeref_t wakeref;
>>       u32 status = 0;
>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>> -        status = intel_uncore_read(gt->uncore, huc->status.reg);
>> +        status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>>   -    return (status & huc->status.mask) == huc->status.value;
>> +    return (status & huc->status[type].mask) == 
>> huc->status[type].value;
>> +}
>> +
>> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
>> +{
>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>> +
>> +    if (!huc_fw->is_meu_binary)
>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
> Is it not possible to load a non-MEU firmware on a GSC system? Don't 
> we just treat that as the legacy part within the MEU blob and load it 
> for clear media only via GuC auth? In which case, it is as 'fully 
> authenticated' as it is possible to be but it still can't process 
> protected media. So it should not count as 'fully authenticated'?

I guess it is technically possible, but who's going to provide such 
binary? We're only shipping gsc-enabled binaries for GSC platforms.

>
>> +    else if (intel_huc_is_loaded_by_gsc(huc) || 
>> HAS_ENGINE(huc_to_gt(huc), GSC0))
> Why not &&? Is it possible to have loaded_by_gsc != HAS_ENGINE(gsc)?

intel_huc_is_loaded_by_gsc is only true for DG2, while HAS_ENGINE(gsc) 
covers MTL+.

>
> Is it even worth making the engine check a part of the loaded_by_gsc() 
> helper?

no, because on MTL we don't load via GSC, we authenticate via it, so we 
want loaded_by_gsc to be false there

>
>> +        return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>> +    else
>> +        return false;
>>   }
>>     /**
>> @@ -477,7 +512,9 @@ bool intel_huc_is_authenticated(struct intel_huc 
>> *huc)
>>    */
>>   int intel_huc_check_status(struct intel_huc *huc)
>>   {
>> -    switch (__intel_uc_fw_status(&huc->fw)) {
>> +    struct intel_uc_fw *huc_fw = &huc->fw;
>> +
>> +    switch (__intel_uc_fw_status(huc_fw)) {
>>       case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>>           return -ENODEV;
>>       case INTEL_UC_FIRMWARE_DISABLED:
>> @@ -494,7 +531,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>>           break;
>>       }
>>   -    return intel_huc_is_authenticated(huc);
>> +    /*
>> +     * meu binaries loaded by GuC are first partially authenticated 
>> by GuC
>> +     * and then fully authenticated by GSC
>> +     */
>> +    if (huc_is_fully_authenticated(huc))
>> +        return 1; /* full auth */
>> +    else if (huc_fw->is_meu_binary && !huc->loaded_via_gsc &&
> Why sometimes use the huc->loaded_via_gsc directly and sometimes use 
> the intel_huc_is_loaded_by_gsc() helper? Either way, I'm confused - 
> isn't that backwards? If the HuC is not loaded via GSC then it can't 
> do two stage auth and therefore cannot be partial? It is either fully 
> authenticated or not at all?

the aim was to use huc->loaded_via_gsc for internal huc functions and 
intel_huc_is_loaded_by_gsc for external ones, but it looks like I didn't 
manage it well.

Regarding the loading, the partial auth can only be done if the HuC is 
NOT loaded via GSC. The load is done via DMA (same as legacy) and then 
we authenticate first via GuC and then via GSC.

Daniele

>
> John.
>
>> +         intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
>> +        return 2; /* clear media only */
>> +    else
>> +        return 0;
>>   }
>>     static bool huc_has_delayed_load(struct intel_huc *huc)
>> @@ -508,7 +555,10 @@ void intel_huc_update_auth_status(struct 
>> intel_huc *huc)
>>       if (!intel_uc_fw_is_loadable(&huc->fw))
>>           return;
>>   -    if (intel_huc_is_authenticated(huc))
>> +    if (!huc->fw.is_meu_binary)
>> +        return;
>> +
>> +    if (huc_is_fully_authenticated(huc))
>>           intel_uc_fw_change_status(&huc->fw,
>>                         INTEL_UC_FIRMWARE_RUNNING);
>>       else if (huc_has_delayed_load(huc))
>> @@ -541,5 +591,5 @@ void intel_huc_load_status(struct intel_huc *huc, 
>> struct drm_printer *p)
>>         with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>>           drm_printf(p, "HuC status: 0x%08x\n",
>> -               intel_uncore_read(gt->uncore, huc->status.reg));
>> +               intel_uncore_read(gt->uncore, 
>> huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> index 345e1b9aa062..adb063cd27a0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
>> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>>       INTEL_HUC_DELAYED_LOAD_ERROR,
>>   };
>>   +enum intel_huc_authentication_type {
>> +    INTEL_HUC_AUTH_BY_GUC = 0,
>> +    INTEL_HUC_AUTH_BY_GSC,
>> +    INTEL_HUC_AUTH_MAX_MODES
>> +};
>> +
>>   struct intel_huc {
>>       /* Generic uC firmware management */
>>       struct intel_uc_fw fw;
>> @@ -31,7 +37,7 @@ struct intel_huc {
>>           i915_reg_t reg;
>>           u32 mask;
>>           u32 value;
>> -    } status;
>> +    } status[INTEL_HUC_AUTH_MAX_MODES];
>>         struct {
>>           struct i915_sw_fence fence;
>> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>>   void intel_huc_fini(struct intel_huc *huc);
>>   void intel_huc_suspend(struct intel_huc *huc);
>>   int intel_huc_auth(struct intel_huc *huc);
>> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
>> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>> +                     enum intel_huc_authentication_type type);
>> +bool intel_huc_is_authenticated(struct intel_huc *huc,
>> +                enum intel_huc_authentication_type type);
>>   int intel_huc_check_status(struct intel_huc *huc);
>>   void intel_huc_update_auth_status(struct intel_huc *huc);
>> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>>     void intel_huc_register_gsc_notifier(struct intel_huc *huc, 
>> struct bus_type *bus);
>>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, 
>> struct bus_type *bus);
>> @@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const 
>> struct intel_huc *huc)
>>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>>   {
>>       return intel_huc_is_used(huc) && 
>> intel_huc_is_loaded_by_gsc(huc) &&
>> -           !intel_huc_is_authenticated(huc);
>> +           !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>>   }
>>     void intel_huc_load_status(struct intel_huc *huc, struct 
>> drm_printer *p);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 88ad2c322c4a..3b8edaba97d2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -141,7 +141,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>> intel_huc *huc)
>>        * component gets re-bound and this function called again. If 
>> so, just
>>        * mark the HuC as loaded.
>>        */
>> -    if (intel_huc_is_authenticated(huc)) {
>> +    if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>>           intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_RUNNING);
>>           return 0;
>>       }
>> @@ -154,7 +154,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct 
>> intel_huc *huc)
>>         intel_uc_fw_change_status(&huc->fw, 
>> INTEL_UC_FIRMWARE_TRANSFERRED);
>>   -    return intel_huc_wait_for_auth_complete(huc);
>> +    return intel_huc_wait_for_auth_complete(huc, 
>> INTEL_HUC_AUTH_BY_GSC);
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>> b/drivers/gpu/drm/i915/i915_reg.h
>> index dde6e91055bd..1a62e73c3d9c 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -941,6 +941,9 @@
>>   #define HECI_H_GS1(base)    _MMIO((base) + 0xc4c)
>>   #define   HECI_H_GS1_ER_PREP    REG_BIT(0)
>>   +#define HECI_FWSTS5(base)        _MMIO(base + 0xc68)
>> +#define   HECI_FWSTS5_HUC_AUTH_DONE    (1 << 19)
>> +
>>   #define HSW_GTT_CACHE_EN    _MMIO(0x4024)
>>   #define   GTT_CACHE_EN_ALL    0xF0007FFF
>>   #define GEN7_WR_WATERMARK    _MMIO(0x4028)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index dba7c5a5b25e..43b8de42a94e 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -659,7 +659,8 @@ typedef struct drm_i915_irq_wait {
>>    * If the IOCTL is successful, the returned parameter will be set 
>> to one of the
>>    * following values:
>>    *  * 0 if HuC firmware load is not complete,
>> - *  * 1 if HuC firmware is authenticated and running.
>> + *  * 1 if HuC firmware is loaded and fully authenticated,
>> + *  * 2 if HuC firmware is loaded and authenticated for clear media 
>> only
>>    */
>>   #define I915_PARAM_HUC_STATUS         42
>

