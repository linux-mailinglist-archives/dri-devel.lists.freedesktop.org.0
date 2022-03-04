Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DC4CDDC0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A89C113672;
	Fri,  4 Mar 2022 20:17:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3854C11366F;
 Fri,  4 Mar 2022 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646425050; x=1677961050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZM0xJ2RKy30h5HDUrobp5BZYqaGezBLdsolKhlDHhaU=;
 b=VzxgREOVFx6+XUEbXFipNLdlsYcjZGopWbep/yAPFmBgxvvZDJ5Z6T1V
 3mc/2slipR8K2Ov2eisMLgCmxdEn9kxkIEuzQ/fx8VhdzS89gmKabNDK/
 W3JGyH2v6RezUIiCsYKksCuoB6hgmXAGr0NmGvFn/AgaHhFfLqXW/eF/E
 4lkp3ZD7Anrsi3XAF4YrcyBblrFsrh+ezyMlCXC2vHTybCUG0ZAQWZcVj
 vWIOyEo4cVLP8JDvxGi6Z5vLwBOk0GnqmSnV9EvEK6qjCoCP+6H1OwOyh
 4z8ebNnbXdcw0lCJfSbH/crJM/WGFXmZxC11u90TM8HgqPP/RBaMOoPJ+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="317286671"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="317286671"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="536392485"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2022 12:17:27 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 12:17:22 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 12:17:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 12:17:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 12:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OODhWxmCtRnvMSVofgoGKrydaeJIIdC2AqvuVEa/b/1uMvM+nRxU4umwXx6QOSwQqmqBkTpNvlrOx8XTbHjAeNKm0vbcjsdxcW/hFTYOGEdZQd4sybRJRCKJuAVt6xCtIy2g/izIoFnV6TN4gNY2aZsEE7ThPlex967b1hVrHaCJ1uB3Uy7HQaZ5tyNyZHlDH9BT9vmj0N/Dwt6Xju5Bb/x1SF08By43gCoowNDVoLbW1YIVFTqkPP0HP771a2dDezJjmlK+LknppcfeEu8VdFpitxR6BRWwxM/KyP13y4P5NEZmXRABPnnE/kQoHkgYj9DSnZSM0fP1ItZ1Tt+jQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvWMwguZgs3zFyAjE34mzR7osoiK1xEgQKhBftbf3yc=;
 b=V6hEG+E/H2maVxP/A2Vy3qrF0pryYPTJjxNGuIRGS8NShPCYkaztW7q2XxVaVkjLBWEnvq7tKmLCMgW4lFHj/EkIRxYKOqXYWMyCrW2OhYTjGn2DyvXVhmoEFTBrOh+iyr2umUX7RdPimYHVYUk4g4TCHSveloeECu0GM+gDupPfSZKhnfWf/fZvUeoKiTvur8r6vl3G+fFRkXoTYQEG5tKBc3u8oP6wLCsvrhdWXRd+xHU4M+YUcX/CrEHlNtJ9wfcVYYdnWUBEC1m44dljV4RsphTG29O+76Nd/Jvs9pHkzd7GHzFVjkLHfU7BkV86geBkv4RkAG6bBLkkZyjujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH2PR11MB4312.namprd11.prod.outlook.com (2603:10b6:610:3a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 20:17:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Fri, 4 Mar 2022
 20:17:19 +0000
Message-ID: <c6aeece0-9b12-e135-c991-25793f7640bb@intel.com>
Date: Fri, 4 Mar 2022 12:17:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915/guc: Do not conflate lrc_desc
 with GuC id for registration
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
 <20220225000623.1934438-2-John.C.Harrison@Intel.com>
 <87ilsu2aj1.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87ilsu2aj1.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:301:1::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7295d124-5084-44c1-d511-08d9fe1bfbd4
X-MS-TrafficTypeDiagnostic: CH2PR11MB4312:EE_
X-Microsoft-Antispam-PRVS: <CH2PR11MB4312986CA46536DFE4B43F25BD059@CH2PR11MB4312.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OV9DvYvNmKB+d8EpWrpJQ3ZW2xzAKV/Qo0CLRo2maymR8ilZz4EvzI3s1RsgKZXj6EJV5xnW32aem6Agn9O5TDfyByXOS91ftuASqbCubula+ASKCwSYdXStXhwNxT6/ujQqWCj25HgEqPMJ4mcyXG7XBR9RAG93g0sem8YCOTRZEu1Ti4SSmcd6mRXukiHPQTFvJhIXMgAe1z0MYc4G07s2Qxk4J1u+jslVDKQCRUlQuXLP4SiasFDUwAbMXduIg8If2ZsUOmj9Zx0SXR95Uhg37EJjzojEEbCKaMVXBABTmGrOrPJfpmfy2yTriDogd5UrCnRsfmQw5RvRdQpboYq6iat/Wx6Hdxx6rlQBhiU1av7OO2MzaYLuAtur90ex5fAdpzFtJo9l8E4P9He6Bl9IGoRBskGox8Mm/zCkCTvH8yNfFEKKD9U3wWEGZLZ1wYrOzlujakJyJTbzgfGliaAp81HsnCZ5Rvi2NmiNRKjRHtMY1S7U1hJud6V0zdSYSy6QAhFHwTeJ9dL7cWk0wkFVeiaW0UXsbCtNezgQwt6xnZoHNrbPg3MR3SvGQeYVNJLvjKdMdhHcAwCWmTAw9J/98LANEQr02RrBDFWiOZ+yN0O2b2WaMkxLVuVSVsU+pb4XO+ZCrOlWknBGFtU6aheSqXZreP+Tvnn+RDnpOaHyaUdbMzPrHMa7cp6kcZfEOLHKXQoaGXBs0gV8FlXmFdDe10yFZyRd3QYs52knciMqNVMhs7zzGnQvpByESXP1/uCJrWe9zMsDbg0Nll2yEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(82960400001)(186003)(5660300002)(31686004)(6506007)(508600001)(6666004)(8936002)(38100700002)(2616005)(8676002)(53546011)(86362001)(66476007)(66556008)(66946007)(83380400001)(2906002)(6512007)(316002)(6486002)(4326008)(31696002)(36756003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlIKzV4QTVBd04wK2duM0tqWFVocnpNRzJPOHArVHZsWlkxSEgrK05sVkND?=
 =?utf-8?B?OTdmNEpKYlRqNklqYnQzVkN2TnFQcit5eTM1NEwvS2ROVTQ3YVA4QlcrT0dn?=
 =?utf-8?B?a0xoWHJ6cjErMTJFL3NxWXI5NHpERFU1dFA5U28wVTR2SmVoT092cE1LM1pL?=
 =?utf-8?B?WEFzSVo3MnpNamt1VzhEY01tRkIxTVFrZlg4SFF4T0tIVmxrVDh6UzJSanZk?=
 =?utf-8?B?Z3VDUXRwVW01WkhRNEJzMHd2bHRyRnhVcWEvUGZaL2xrWXc4dkFHejhWd3Jz?=
 =?utf-8?B?Um9lWFpjUzgxTXcyZmJoOUJDSXlSRWZRSUdNSzJLd1g5TWNLTlo2SlA4T29z?=
 =?utf-8?B?aHlQYWdTdkRsbUNhTDFraUV1UlMwOHp6WkFpSDNRV0JOQlZHVC9KRVJxbndu?=
 =?utf-8?B?L3JzamIvY1lzMmhDMUh4NXVCTkw4cXQvSllTU0djQTJmdDlaWGUwUkRjbDJP?=
 =?utf-8?B?VzNpSlJaNm5CZDJaVlZIclZHVFBwRGpkSyttL0tQb2VMUWJlWktyaUh5Z2JB?=
 =?utf-8?B?REY0aXFtaFNLSUhpMERDWEpkMFA4bHU2dXgrK0lmRGRWNlA2TzFWT0VPSnNm?=
 =?utf-8?B?Q2V1SVNsT0xDb1E5a1J3K0xJVHU4SzMrNXNmRktiYXlUZ1VTaDNWVms4V3hE?=
 =?utf-8?B?OTFXb1E3M2hKRmVkTUdQQUdQbURIRkNrODlVQlJ3bXg3NTgrVUk2czMrVUM1?=
 =?utf-8?B?V3l6TmlleUxLVzRDUnp4V1RwWEl3d01MUmxoYytMb3NmSlcvWTJwYU0ramtu?=
 =?utf-8?B?dlF0WW5XdDYwd0YyajV3VENSWUZxeVRqTXNLQVhMM21PMUM5bmhYbGpwc3Br?=
 =?utf-8?B?QU5OUFVneDBrSEpYZDRDbTlkVW4xQzdWR0pyT0dNZ2RyTlEwWHlrTWpmMmhx?=
 =?utf-8?B?bmRLRDZWUXlrU3luREd4SGlMb05pR3JSVmxnZHRPa3hIMElJb0lWNnBVUUtO?=
 =?utf-8?B?c1I3VStVblowZG5NcmtWbVNJSmU5c1pLcG9Mc0dvVEhESUlZT1phUlNRaHVC?=
 =?utf-8?B?dU44bFBCYkZIVTlLVSs0VnZ6NkxPaXhyZkNZQmttNzJvVEtkRzhON2tzdDZl?=
 =?utf-8?B?RWVZbzZTbzJ6b3pFL25kM0poL29EVDF3Z2M4cUdpUlE4VGVwMlIxbFRJdGtl?=
 =?utf-8?B?cnJRb3o2cjdUZWJCZ3J0eHkvd3RlUXBCN2pnSHdZT2hIZXVBbWJuWFRTVUJY?=
 =?utf-8?B?UXJwdjRDNWl6ZERZTjk5aWZpSS9aVWdMYmNJdFh2YTJPOWV0di9iNi9IL1RP?=
 =?utf-8?B?NU5zSGtYUnRlS0NGU2JKODRiOWVIamdqTW10TnY5Ujl5T296V1hBOHlhbk5J?=
 =?utf-8?B?OW5NM3dzeFdldE4xQjdYYTFhZCt5UUxKeXlPblBaOXc0N2k4a3MrdkdkNk0z?=
 =?utf-8?B?dFAxYzhvZnJETDQvMkUzVXpQdVdXc3FaSkxKU1ZobERhQStXaVRuUFpmdWlJ?=
 =?utf-8?B?eFFJUGZvTzF5N1JPM0UrSmJNejBQV2Ivci9BeE4zQldDUzljVWZGWDhvM2Mr?=
 =?utf-8?B?WTE0U0R0V1pHN0w0cTdLenpWOTBDdGlmenZEUlNxaWkrRncxby9naXQ5bEdX?=
 =?utf-8?B?RUZrZlhTdWV0WHBLQTM5a3haMm41T2c1YWVMUloyZzk0ZjB5TnVRc05wdDJZ?=
 =?utf-8?B?ejlVVmo4bnliUjZnR2pLRno0R2hRZWFmZWE4Q3hXVkNjdm8rc2MyanZ1WXh1?=
 =?utf-8?B?c0VMbVZmYWhXSGhMbDJmM3dRZ1loaTZscVNZcko5UHBoZE13Um14OXlwTnJn?=
 =?utf-8?B?d2ZPc056cU9xTEN3bGFhNmg2dXRiNDJpUFg4RXJ0MHJPdUNOdlZPTVdmN1pS?=
 =?utf-8?B?QzcxOGorczN1eUkxQ0wzMDF4Vk5YcW15N1kvbjdZY2Fyb2Q4bE00VUlsOFpa?=
 =?utf-8?B?NDdhdW15T21qSk9nYVhHaDBwN3hhZUdieEw0QWlraG16QW5hNTBEWDIxNXR5?=
 =?utf-8?B?QWNqTXZPMEdwWVdNOWRpREZ6T1k4cTREdHRmekFWT3ZWMzhIUW9XNVJ3K2Jl?=
 =?utf-8?B?OTdjVW1YcDBwdmtaKzA2V3JZSmhJRCtKMUtUU2VST0E4WVJXY1Z3Q2REWmU5?=
 =?utf-8?B?RUhQNFNYNVFyYW9OTEZVNXdPWDFDRStoUWFZcGQ1YlpJRDBVTUxRL3ZyM3g4?=
 =?utf-8?B?TWovS3A0THdsT2NHb2FJQ0E0Y2JPbEJYeTNmL2VENW9zR3JWL2dra0lSYmlY?=
 =?utf-8?B?NDBHN29NUXIveGFobzVNZzUxZmRHVDNkVXE0SEtJWmJjQTA2QnI4TlE5Ujhq?=
 =?utf-8?Q?jw7rVBu2poe39/EcDuBF7j3o3LsyW4GrKlnqv6ayqk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7295d124-5084-44c1-d511-08d9fe1bfbd4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 20:17:19.3331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQef6Kka9qFd9xkJ7FWnhisdvNZkkyHbaWiqjN25ZpX+7c69x45q/IYSiTb3X0CLUOh7Oh6VRIisqzJP1e3POHuPujWE53uq3xvFxRHClC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4312
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/4/2022 03:59, Jani Nikula wrote:
> On Thu, 24 Feb 2022, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The LRC descriptor pool is going away. So, stop using it as a check for
>> context registration, use the GuC id instead (being the thing that
>> actually gets registered with the GuC).
>>
>> Also, rename the set/clear/query helper functions for context id
>> mappings to better reflect their purpose and to differentiate from
>> other registration related helper functions.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++---------
>>   1 file changed, 38 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b3a429a92c0d..7fb889e14995 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -514,31 +514,20 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
>>   	return !!guc->lrc_desc_pool_vaddr;
>>   }
>>   
>> -static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
>> +static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
>>   {
>> -	if (likely(guc_submission_initialized(guc))) {
>> -		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>> -		unsigned long flags;
>> -
>> -		memset(desc, 0, sizeof(*desc));
>> +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>>   
>> -		/*
>> -		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
>> -		 * the lower level functions directly.
>> -		 */
>> -		xa_lock_irqsave(&guc->context_lookup, flags);
>> -		__xa_erase(&guc->context_lookup, id);
>> -		xa_unlock_irqrestore(&guc->context_lookup, flags);
>> -	}
>> +	memset(desc, 0, sizeof(*desc));
>>   }
>>   
>> -static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
>> +static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
>>   {
>>   	return __get_context(guc, id);
>>   }
>>   
>> -static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>> -					   struct intel_context *ce)
>> +static inline void set_ctx_id_mapping(struct intel_guc *guc, u32 id,
>> +				      struct intel_context *ce)
>>   {
>>   	unsigned long flags;
>>   
>> @@ -551,6 +540,24 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>   }
>>   
>> +static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
>> +{
>> +	unsigned long flags;
>> +
>> +	if (unlikely(!guc_submission_initialized(guc)))
>> +		return;
>> +
>> +	_reset_lrc_desc(guc, id);
>> +
>> +	/*
>> +	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
>> +	 * the lower level functions directly.
>> +	 */
>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>> +	__xa_erase(&guc->context_lookup, id);
>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>> +}
> There are a plethora of static inlines in the guc .c files, and this
> adds more. How about just letting the compiler decide what's the best
> course of action, inline or not? I think hand rolling the inline is a
> micro optimization that you'd need to justify i.e. show that you're
> doing a better job than the compiler.
>
> The main downsides to using inlines are that you'll miss compiler
> warnings for unused functions, and it sets an example for people to
> start using inline more, while they should be an exception.
>
> BR,
> Jani.
>
>
> PS. I also don't much like the likely/unlikely annotations, but that's
> another can of worms.
Technically, this patch isn't adding any new ones. It is just reworking 
existing functions in their existing style. So it basically comes under 
your last point of people just following the prevailing style because 
it's already there.

I can add a task to the clean-up backlog to remove all mention of 
inline. Not sure why you think the (un)likely tags are bad? Again, I 
have no particular view either way.

John.


>
>
>> +
>>   static void decr_outstanding_submission_g2h(struct intel_guc *guc)
>>   {
>>   	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
>> @@ -795,7 +802,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
>>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>>   	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
>> -	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
>> +	GEM_BUG_ON(!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id));
>>   
>>   	/* Insert NOOP if this work queue item will wrap the tail pointer. */
>>   	if (wqi_size > wq_space_until_wrap(ce)) {
>> @@ -923,7 +930,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>>   	if (submit) {
>>   		struct intel_context *ce = request_to_scheduling_context(last);
>>   
>> -		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
>> +		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
>>   			     !intel_context_is_banned(ce))) {
>>   			ret = guc_lrc_desc_pin(ce, false);
>>   			if (unlikely(ret == -EPIPE)) {
>> @@ -1897,7 +1904,7 @@ static bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
>>   
>>   	return submission_disabled(guc) || guc->stalled_request ||
>>   		!i915_sched_engine_is_empty(sched_engine) ||
>> -		!lrc_desc_registered(guc, ce->guc_id.id);
>> +		!ctx_id_mapped(guc, ce->guc_id.id);
>>   }
>>   
>>   static void guc_submit_request(struct i915_request *rq)
>> @@ -1954,7 +1961,7 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>   		else
>>   			ida_simple_remove(&guc->submission_state.guc_ids,
>>   					  ce->guc_id.id);
>> -		reset_lrc_desc(guc, ce->guc_id.id);
>> +		clr_ctx_id_mapping(guc, ce->guc_id.id);
>>   		set_context_guc_id_invalid(ce);
>>   	}
>>   	if (!list_empty(&ce->guc_id.link))
>> @@ -2250,10 +2257,10 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>>   
>> -	context_registered = lrc_desc_registered(guc, desc_idx);
>> +	context_registered = ctx_id_mapped(guc, desc_idx);
>>   
>> -	reset_lrc_desc(guc, desc_idx);
>> -	set_lrc_desc_registered(guc, desc_idx, ce);
>> +	clr_ctx_id_mapping(guc, desc_idx);
>> +	set_ctx_id_mapping(guc, desc_idx, ce);
>>   
>>   	desc = __get_lrc_desc(guc, desc_idx);
>>   	desc->engine_class = engine_class_to_guc_class(engine->class);
>> @@ -2324,7 +2331,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>   		}
>>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>   		if (unlikely(disabled)) {
>> -			reset_lrc_desc(guc, desc_idx);
>> +			clr_ctx_id_mapping(guc, desc_idx);
>>   			return 0;	/* Will get registered later */
>>   		}
>>   
>> @@ -2340,9 +2347,9 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>   		with_intel_runtime_pm(runtime_pm, wakeref)
>>   			ret = register_context(ce, loop);
>>   		if (unlikely(ret == -EBUSY)) {
>> -			reset_lrc_desc(guc, desc_idx);
>> +			clr_ctx_id_mapping(guc, desc_idx);
>>   		} else if (unlikely(ret == -ENODEV)) {
>> -			reset_lrc_desc(guc, desc_idx);
>> +			clr_ctx_id_mapping(guc, desc_idx);
>>   			ret = 0;	/* Will get registered later */
>>   		}
>>   	}
>> @@ -2529,7 +2536,7 @@ static bool context_cant_unblock(struct intel_context *ce)
>>   
>>   	return (ce->guc_state.sched_state & SCHED_STATE_NO_UNBLOCK) ||
>>   		context_guc_id_invalid(ce) ||
>> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id) ||
>> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id) ||
>>   		!intel_context_is_pinned(ce);
>>   }
>>   
>> @@ -2699,7 +2706,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>>   	bool disabled;
>>   
>>   	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>> -	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>> +	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id));
>>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>>   	GEM_BUG_ON(context_enabled(ce));
>>   
>> @@ -2816,7 +2823,7 @@ static void guc_context_destroy(struct kref *kref)
>>   	 */
>>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
>>   	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
>> -		!lrc_desc_registered(guc, ce->guc_id.id);
>> +		!ctx_id_mapped(guc, ce->guc_id.id);
>>   	if (likely(!destroy)) {
>>   		if (!list_empty(&ce->guc_id.link))
>>   			list_del_init(&ce->guc_id.link);
>> @@ -3059,7 +3066,7 @@ static void guc_signal_context_fence(struct intel_context *ce)
>>   static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>>   {
>>   	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
>> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id)) &&
>> +		!ctx_id_mapped(ce_to_guc(ce), ce->guc_id.id)) &&
>>   		!submission_disabled(ce_to_guc(ce));
>>   }

