Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4122D55BC6A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C701B10E36F;
	Mon, 27 Jun 2022 23:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586AF10E262;
 Mon, 27 Jun 2022 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656370961; x=1687906961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=knr7wJMb1uyF64b/AS+IKupwEl22ysbqMFcZP+Ms5ns=;
 b=RZKjZCGV/yrxlxDhpMJ4s16spdiRyK4/zTH1EzzHAiZC2PG44KTH2sxU
 FCNkjswm09RnYLdCDRooGfahwplvHCUvFCZfY6YtUkwcYeV354+k5YDbi
 RG+bOTBm8efSA1u7JHQpfSOYhn3lbmZJe0i4fSHqUN2+yvVs6D9BYAVGy
 kH3YFEkAz2qeJJoa3lbbSa8VgcUAOs/WcXa7zfD0TsRCq0Q2mT+rLzAaP
 Pe4ffbaRWOMrkR5qI8VE4YQHesaasi4KwqY/Yy4rm2HMTTFbwfCYYwOne
 e0dgrfFkqjlYCkfNqJgcajRQNpRKMDmJUNnJpVi/FfHyVvkp0ZmE9Wcn0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="345580900"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="345580900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 16:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="646637178"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2022 16:02:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 16:02:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 16:02:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 16:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfxeSnTjzHW5gqG2FQZ4N1sNaI50LkszE0RTSqaFe+mxPUZqT0rAro17UBFgh/Y2HvMMZTj8P3aDii3cS0QaszZ/NAoZDmyRg8acCMgv7wt7OPyzKUYxEg9t0c8kwTf/fiXLbynfg8EJVWUQTqPwbrwOeBhE44BPZIPNlUIA93RPIRd1yL00WtGqMPw83i0hv56gZtrUuj7YNfCaQrUdEMrPyLVQGQHAEjrOfxOxm2RLsnAass8XlXy50/+cMCLfKzY4Y4C1rtozjocnTiUfOWfhzHgTiWwn6fM03DfpP4+qK3HfrNl4Oo8fxplXVIBQ9AThGOwvbtoOO6GCB58sFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si5vJcwuJ/bgM15YRF2e0ZfVcOtGjwjbrfPwwo3laRs=;
 b=SHMDKF9bg8ZCtelFqpfdKKSYO9hdYDqSNyH/L02sZz8wgn2T4oikTISDjAtHKhDmEG7MGwnGnf9Qn+LK4Ub59NJkznB1mwvuWz2dPK5LCyiiehWtpGfCJfVmMiVgbOhLRkcsis+wSufSR9zrlPAliib8e5sfMeV7a7HJjsYV5Kwv7P6k06SDaTDy2mflWwXjjyWlOnhAFdPjQgT2vgHiS0B3HcruO2nCeVDPT230eRSXCcVGqBQip+JV15g+Desm95wMIXnZr7p9Qwnhb9WqHg0/Gz3vITJuoq8ugUXSQEu58004daC3zCbT/ONQifpkBaBhOJ7UQ0R3VntcMenYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SJ0PR11MB5632.namprd11.prod.outlook.com (2603:10b6:a03:3bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 23:02:38 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 23:02:38 +0000
Message-ID: <9b8f6c8d-b0cc-30dd-f529-1e7061183084@intel.com>
Date: Mon, 27 Jun 2022 16:02:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Add a new SLPC selftest
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220623233320.11041-1-vinay.belgaumkar@intel.com>
 <87k0958kb9.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87k0958kb9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 446feed4-aa5a-44fa-9e8d-08da589121af
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5632:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fim+kHCjs5CO16ge+2ORm0LbId4lWbOa5bshgvxgpaW/4K0o7GmUAla1daOmSP3UyKrfJnviBrt+eYizLlvgc5b+ENHcT44LpT4CBeDL1SXA/i/ZhSN25B+yiKQk24N+1JCJj7LERTKBA5t0nsx0cPTMirBC6+FEUcQJXPIeMwJLTlwM+fE4hdbL2jshvVHBrozUpjiLbX537KiaZON/zex7sJM/AxgR6hiELgtYKd5zWcvHt9lLe8FBhfOUO2f6+6tIrk//YwgDC5XvXAqefbSh7RNvfybZTr3Q9o0z2IKcwviW/DXs5tj+lx6oocHfzUXPHvSNRxtm+nZ5nn9h4JNabEB/fZBwJDFZKDdKKUd3CBMNqi228t0v22Etu/8lZXuEQ8DmBTSJ+Vl8A/fLoK7iTKWbm9EOrqmJMruFHuTEuLxZrJA2SeCBjZee5oXsf6F5s92Y/pEk3pmKkJjhu3HQFylmVdZLtEQSMuXS3OsmDPyRGYebZc1zOsoa2a+e6gp86KxeQ48gG+YaoSW7+SW5UA8TLqQhbu+d95KGQ+gg5GW0dUnhHHzXwvZ2JXf87VUvWGayTqvkU9198waldMq4i27/8RLup1nsjeTCmbQZ9u28xgF9HkerbrPWCoHBZlTFNYYNzT5y/8UT+HoqwT9fd0559+CUbNr0DXRbvssh4BHi94TnWwS3HCz4IXtzWP98wy79qYGGSvGzua4zsIiMQ6Bjkjdwm+qEeJRWbnUQ9b7GofrU6QtodDW3yDaESuwnH9cT3vJpneeb8ZZwI4J0qGbdZQKPIskRgBKMM1QUBK4PINGnFl/5q/GggywB/KYNQgfH+lwzmoZMBN1COw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(366004)(376002)(39860400002)(396003)(41300700001)(26005)(478600001)(53546011)(6512007)(6862004)(6506007)(36756003)(5660300002)(2616005)(86362001)(316002)(66556008)(8936002)(186003)(38100700002)(31696002)(82960400001)(2906002)(450100002)(83380400001)(66476007)(31686004)(66946007)(4326008)(6486002)(37006003)(6636002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm13V2N2WU1Xd0Vrc2lMNVpiZ0hHNTNQMy9zVlhjWXQ1L0t5TDhNMHpZUFVV?=
 =?utf-8?B?NEFaalFWU2tJSDBxeDdJM3VaTWdtZnd3UWdJQXlWZ24zZVJKbkI2bExZOTBU?=
 =?utf-8?B?OWQzY0gzcXpwYzJyYTNnanV5VzN6OFZxSzR6SUtWdCtGNjMwUTUxaGpVVnhX?=
 =?utf-8?B?RGRnQklRWmM3NksvTDdPZ3dKT0dMRnI2a1FWOVEvZXR3cnhXb015dC84dk9j?=
 =?utf-8?B?cnFFYm1IdjMvZ05RbkZUeUI2b1VIMUtRdGNKTzhkdGZ2RDVaTm55YTlzazcr?=
 =?utf-8?B?M2ViV00vMlZmUHZXSnhVNTlhcm1QMGp6SUE1WmNDcURPRUxiMm1oU3BlODhP?=
 =?utf-8?B?S2hETlJYK2lJb2Zkc2NhU0pNQVBreG1CaFpodDEwQnMzRE1oYTRmTW9ocC9D?=
 =?utf-8?B?V2RPajd4ckhkeEZNT01vVW5Jdld4T3BEejVSSExORzVKRjc4WEhBNTlwek1G?=
 =?utf-8?B?WkVHL0FlYVVSY2Z3UDVSZTZvTFg3MllnZlZrYmF1ZzI3ckIvRGE2SWwvSFRv?=
 =?utf-8?B?eHVlRmRJUVBuNGFTRmF6akhGaTVHM1ZIN2UrQzJ1TmVhMmc5R25Id29URWpt?=
 =?utf-8?B?T21FbWplVEVSc1hNbnNlMlVSUGFUV25OV2lUNGdwMmdKZkFnc0xwTUpSR1pH?=
 =?utf-8?B?aHFBcit4YlRzV01TZnlZeWNoeDhyeEJkekFKSEIxZGF3aXAvOHdZMXE1cXpB?=
 =?utf-8?B?Z0xsZ2dLOXREM0UzZnVsM01abDVlUnN5dnZIZTM2ejBmUzA3eVVEUVhQa1pw?=
 =?utf-8?B?a3FubDBhTFBqV1FKaWRYMlVvcEx5bWVUM1ZWeVk0SHNFbEtpMWFGdjFWdnZ4?=
 =?utf-8?B?bytLTTYwa2xjM2h5YmpEWWtJdU04T2J5UUR0OEcydHVmUlRwd21wTFR6M0NO?=
 =?utf-8?B?dG9nL3FxaHZJYUlUVU1Ld29saWJ6eE9NSEU3aTEvaGd1aUVtYTZmY2FLQjBv?=
 =?utf-8?B?bWFpVG9hZUthVmRVZ3l3d3lLWXVGUTVBQkpCcEZWbHkyaEM2ZXUwQUxsVXRG?=
 =?utf-8?B?cTVOa0crMjVqdUhTVGtPbmRjZ1dtUHB3NHNEUTFVeFE4dkUrVUw1MFJ5RWR6?=
 =?utf-8?B?eHFQVzByeHJyY1pnOVFjQml6UU5YRFFab3BEMExtVU1QSkJvKzlEQm96aEFD?=
 =?utf-8?B?R3k5TnVFUkg3N0JNMlljcVpLSFdldWdrZDhjUEZXNENyOUdDTzVYaUlad2pD?=
 =?utf-8?B?VFRncXdpMFRMVG91Y0lMZGNNRzFBVWNtMUJBUjR0QnN1L2R0T2x5bGtha1Fm?=
 =?utf-8?B?WnQ3M25rSlNNYVorZUJIbWxzVzR5ZVVKOXRyekczYVJVQ0hJWXlhZlFQSHlx?=
 =?utf-8?B?Y2RWWFFLRXprbTk1SFhIWDFZRWRpTks2cG56djh6ZXpKeXloUGtkZ2VQR25x?=
 =?utf-8?B?cFliSzkxeTFpTTFybHJTbTVXSVdDOVgzaWZwWE52cXY0Y3NDTkpUaVJzTDNl?=
 =?utf-8?B?TFZlSEZTa1FiL0Y3bzI0YVJrTE9zcGtJUU80QWIyT1A1ckRKZWxPcml0bmFU?=
 =?utf-8?B?NDFJd2l3US9NcVdjdEowR0tBdVY3ZXpGTFlHbUt0ckhnMkJIK3l0Zk92ck1t?=
 =?utf-8?B?ZHA2NEtrMitGbGtTUkx0d2krQjh1ZVR2cElrR1gvS0Fua1ZTaXNlV2prb0pG?=
 =?utf-8?B?V3BMU3A5UUhFN1JXMVYvTE9FajU3dkZ0eEk0ZUIzWjVQRjQwQVhlTUFwc1p1?=
 =?utf-8?B?bE5vUTdoNTVkQlpkVmtZcS9RbzR5WldUWDh3enl4NEliREk1ektvdU1jUlRo?=
 =?utf-8?B?clZtVUNoY3ZCeHVoeFY3MXVGRlV4VHlkM0pYVDlQUHZCSU4rMkJlN0tuSlRL?=
 =?utf-8?B?WUJpS21MY2hsb2FjQmUrdnFYNW5PZlNoV3FvbHJnbUJBNGNnMURBMklaczRF?=
 =?utf-8?B?QnF3TU05dDMxejhLTjhXdmZPV0NhTWdkaG1tekZKRE1lWU9FVEFNNkovWi9a?=
 =?utf-8?B?Rjg5bnNHMWNsRnV1M2dRVlVmL2pjRy9id2FTdER0MEtaa0ZkZGlQL1FIc1E3?=
 =?utf-8?B?OGE3Ri9MMnNXN1B6RUJMakN0R3l1elRaNld4VXNXdVZoZFR0ZEpvL1pwN0VQ?=
 =?utf-8?B?czNLZ04raHpUZlNZOEQyN3ovVFp1UUkvTXQ4RnFpTjNvajcvTmtCeDMzWlhO?=
 =?utf-8?B?bHcvcERYdXZOZ3lBei9SVXNkR2FrZitLVG5pSFlTdTVYd21zM2FlZngzbXpZ?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 446feed4-aa5a-44fa-9e8d-08da589121af
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 23:02:38.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoHHiVL3CFkTYyGT/aCbGsy7RSaFvbsxOz9A92hDZ4o4MsI1EXtTG8g49P8jdRlMgrxH2/Sb09/6fsnBQEpCOiU33/qV72v3LFpe/YJjWhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5632
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


On 6/24/2022 8:59 PM, Dixit, Ashutosh wrote:
> On Thu, 23 Jun 2022 16:33:20 -0700, Vinay Belgaumkar wrote:
>> +static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps, u32 *max_act_freq)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	u32 perf_limit_reasons;
>> +	int err = 0;
>>
>> -			igt_spinner_end(&spin);
>> -			st_engine_heartbeat_enable(engine);
>> -		}
>> +	err = slpc_set_min_freq(slpc, slpc->rp0_freq);
>> +	if (err)
>> +		return err;
>>
>> -		pr_info("Max actual frequency for %s was %d\n",
>> -			engine->name, max_act_freq);
>> +	*max_act_freq =  intel_rps_read_actual_frequency(rps);
>> +	if (!(*max_act_freq == slpc->rp0_freq)) {
> nit but '*max_act_freq != slpc->rp0_freq'
>
>
>> +		/* Check if there was some throttling by pcode */
>> +		perf_limit_reasons = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
>>
>> -		/* Actual frequency should rise above min */
>> -		if (max_act_freq == slpc_min_freq) {
>> -			pr_err("Actual freq did not rise above min\n");
>> +		/* If not, this is an error */
>> +		if (!(perf_limit_reasons && GT0_PERF_LIMIT_REASONS_MASK)) {
> Still wrong, should be & not &&
>
>> +			pr_err("Pcode did not grant max freq\n");
>> 			err = -EINVAL;
>> -		}
>> +		} else {
>> +			pr_info("Pcode throttled frequency 0x%x\n", perf_limit_reasons);
> Another question, why are we using pr_err/info here rather than
> drm_err/info? pr_err/info is ok for mock selftests since there is no drm
> device but that is not the case here, I think this is done in other
> selftests too but maybe fix this as well if we are making so many changes
> here? Anyway can do later too.

Yup, will send a separate patch to change them to drm_err/info.

Thanks,

Vinay.

>
> So let's settle issues in v2 thread first.
>
> Thanks.
> --
> Ashutosh
