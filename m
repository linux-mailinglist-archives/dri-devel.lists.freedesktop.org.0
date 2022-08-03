Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43579588527
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 02:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2D62B05A;
	Wed,  3 Aug 2022 00:30:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A8F12A7DD;
 Wed,  3 Aug 2022 00:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659486592; x=1691022592;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8UgWdUtmmVtFdQQl0mydMTSYRCNU10ZyUdBO3ubQmkM=;
 b=FSVtvG4Afu/jj7QiD7DK1i/M4lUvdHdBPgkbMZWewMqoHldGkWWY01dY
 hnqSpbC7Ac9CXZhyEzETVMf33XN85xfkK5azG2Sz81ekGvlXaE+zHkoux
 NCRdhRD8Hzm0/gDrJLVSDbJsN96DtOEU+uf0X9EpMiVQV5IiUJiXO+CS9
 FVXXKlnuFme9id7nmV6//BE74fV8r4/dRMfscp39XduzSy48WwV+pzteP
 jLiVa9dVMxE5zW8XLo8qQtRAbIrWawOB4/7sfR/WtXXEKC7dxGmO61TmT
 5fzVXDrMAdF0AGEcXuivDcTfBle6PU02D0NnswQB42r8lPCeHPsdxV6PR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="289560873"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="289560873"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 17:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="602631889"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 02 Aug 2022 17:29:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:29:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 17:29:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 17:29:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 17:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYdAAJRhzaeFFMqxDNzz3uVgmoGqc/XwF6FkTUWW0qahxRh1IrysrSudRzNlyWao8VBKmZsHJwmtvygo10Yy6qXBY5APoGneLFNBlvylyZVX7WEuBCzaKDmgEf84plwR46a37IAjEWXxgUj/r2FknrfWezKAlsSufo2YBEXxElUd/uQNSKMnlblumpBn3uzVgAI66O1x7uBlNuOp+gki4P/2UIDG9LpfSuz5MkPtyPDEUZARfHBIMgAw0bz0OJ/ujxotEpUQzfozI8Ipi2Z617zlB1FVecUl+0+OURw8nHKfmFaQXUrn4D9FwNTh+OGqH9MtaoikijQFOxs7EP1vcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUrBczy3ZGMWIq09y84v5E6EAb1GTMeimHPCaK7sttw=;
 b=bXr8SEbxXQmfSF8Rzk7ici2yWSpTboUzzqSf4Ju1j55+np9PKIRc3BjY3if5pvTY4ezOkVtBGlghk/NwpzLsGNH37eZsBcpWqEhFI+PEP/SGkrMh/N6U1NmtN6VAsEEZmJygpLrqOKp+9FJ2o8K02oyBcATQxfNqOFsNLCVA+sBLaYJZVzwimb957+rEIYL/arIzRVcGqnnzZhdpV5TNHjxGTBdEWmJmuWPrpstIVPJxILyFZnKs1J6hf/Tx0I9ZDzzgJZStoMBYJD6FayAnO6fFuThXL3Pf7wTa4yUC9LyDsiloSuOWcqyMCH0LG2s9lYa078mY7YQBi3ZGcLVYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 00:29:47 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 00:29:47 +0000
Message-ID: <064d5fbe-0496-65e2-a0f9-0341a0a6079b@intel.com>
Date: Tue, 2 Aug 2022 17:29:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] drm/i915/guc: Add a helper for log buffer size
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-2-John.C.Harrison@Intel.com>
 <e8e5eaf585a38dc0af79236b83d52d51c47e3e25.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e8e5eaf585a38dc0af79236b83d52d51c47e3e25.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ceff1fd-5afb-47f3-62c8-08da74e74513
X-MS-TrafficTypeDiagnostic: SA2PR11MB5180:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98RM9xJbOvEaMAKTPVw+3Y17zD8L3FJmfanb4922CYh4neflJviUI3q1jsyHJAzhjF/oJEvYZkduJr8PoCQsfhQ8gbDjNrWbio6NtiZPetLIXYyTKwwAzEUuiUJKVTG1ohbqv3vnHevS6cBJhqdIBn2ER7g55YhVqEphEbGsoV+bDp6pGrEobUWEida6YktxudZe35wewMACghI0+gZpCJJ1yILLqsLTYtm5Sz2Ia4lkzJ4HbAtBQq+50pOg2DY58TmYyfGtTZ2v5J/A9HNxoQFWRVwIge9afT1wxu8VlgVTKmW1hjHkwYh7lhx6CT751nVuSMFT5/GlDiqP17t4+WyEOCSRgHOdnfV9u7Tiwl8jvNHm3xOkOqw0P6RjVljFCzncyy/O6gSFpUlN5+RMNP9vJ8f1i+yf5Z5iLSkIEXPEsPTLvDStIDjfIaoYUGjOs9jYYOAJ4mfThpWq9r9ITRc6PIU7iJ6Ta9ISR9Jn97JsWWiByX4fi4zWn1BXSJBoldYHqCHnr2zES0+75tMfXZcSmwa9GgvrW5R2FrQK9IzPMNK8updHDsNOQFXTOeVq4MaRE3MuxLAY17yHZ3Sw/3BG0HLL05OxLfQTXEPMNU10Il3gJiSulX+j1hcNy2F434iFXHiOwXuFFg0Oe1ffDDNDY/tsqbL7Ktq6nVzubT/18zLI61beFI/nsNaq2mixJz8oZrPFCuA33qBV6VK7p8VHCtNIghV1lCyclNZa9fhpOUzubqp9Gn1txE/JgvcgDwUW43YhtgaVgHIvn9LVpPaJev4on0rGgrgMbH5lzS1akKssTuNrEuzBGhfIn5qwlfC4jq9rcdRVEi/z/p9VGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(376002)(39860400002)(136003)(6506007)(31696002)(6666004)(6512007)(53546011)(26005)(41300700001)(316002)(478600001)(54906003)(110136005)(86362001)(6486002)(82960400001)(38100700002)(2616005)(186003)(107886003)(83380400001)(450100002)(2906002)(66556008)(36756003)(8936002)(4326008)(66476007)(66946007)(31686004)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNIYWQzL2FDdy9mVUp0MXl5ZWo3U0Y5UnlQQ1ZUajQzbUkxZjJmTzFxYk81?=
 =?utf-8?B?MC9rdXRuQVZZdVN5SHpiNFJ1Q1lEbG1BL1A1SlJUSTEzVlFxRGNGaGoybnZP?=
 =?utf-8?B?NDU1T05jaHd0STlnVjNlNllTNzhXZEg5WEswMnNoQ2R3Nnk2dXVaV2w1K294?=
 =?utf-8?B?TFJhYXlpRGJZanRaRndVRlB5VFp0dXJrTUxKSFQzemJ4SXk5UzNhb25jWUlx?=
 =?utf-8?B?UGVqaXNVQ2l3ZkJNdkxuUG9hWk05SjlqL0FuTWwzRW9SZ0Uzb2NZY1UySTds?=
 =?utf-8?B?TzRuYkhkU3dJU0hKZDBna2dHenhXaWRCakNmdGYyc21zeEFVYUhza2hvWGdu?=
 =?utf-8?B?RXpYN0Nad0NBakVLUnNGcDVTRVZLMUhkUW9VY0I5VGx6d09ZRlRsUnRYM0Fk?=
 =?utf-8?B?ZkZwK1RsNFN6dVlWSzRIVkpDcEZRdzR3bnhJTnFXUUMrV3NvWURQZVd6SjE5?=
 =?utf-8?B?czVSRmxGVDVWUGh3WTdXZUhvY01hcjNsVzhsdDVHV1pFaWh4V3BwakNmdEUr?=
 =?utf-8?B?S3FIdnF0L2M0cm84TU5ibEdBWnJMY2lDcWtGUFh0T3NsUmRwNStVazJkOFpr?=
 =?utf-8?B?Ym1pMDFqTlE0MG5rWmNaTXpVZDdKQll0NlU3UFVkV1pqc0JZb3VtcnA0L05s?=
 =?utf-8?B?bVlCY0xTTmJFQzdQNjdMcXUvVmJtSzAvcnZLTWVrRGlrdEhScGw2enVDYTF0?=
 =?utf-8?B?Q0lUMlpubE4zY2lSTndLOU5EY1lRQUc0VVc2ejF5RWtabFRlK2ExczVLZWxH?=
 =?utf-8?B?U2RvcWJNelhORFZDTDRZNkl4RnVNYWhBNDRVNmIzV0NjUkFGRE1WdTAzeHlH?=
 =?utf-8?B?ZUgyMmk4cjdxSGlUOGswRlRCSlRTNmVwNC9UYmRZUFBrcERpRngrd2ZNRzNz?=
 =?utf-8?B?dGhpNkMyM2s0S0taeU9sUGdmMlNOcDlXYkFpMkZkNEJCbXpVVkhuU0hhbjVJ?=
 =?utf-8?B?NDBkc041TGsrOTMzWjZMSk9LWDc4VFFsbDBzMVZiSzRwZ3JqQjBQU0ZORlNz?=
 =?utf-8?B?anVyNzhlTEh0bmJPam5hMDVwQ1hTR1hXZFlFU3YzSFhSTkEvTFZRTTVxT0JV?=
 =?utf-8?B?V2t4YnUzUS84R2p2WDZHV2IrVklMOG1LMHpMZzFxV0pHMDR4Sy9tT09MQVdG?=
 =?utf-8?B?bTNKSGg4SmxtUWpOay93NmFnb1Z1dnBaQWNLdW12a01CYzFRaW0zeVlhalpj?=
 =?utf-8?B?NWd3NU9wMGh4UzdCR1dxc1VuaG1nSTVzZlFkYndnNE9JRXN0MWJvM0V5YkMw?=
 =?utf-8?B?a2NBWjE5ZkszOHNqSVN3TmVQdkFVOVVhMmV6MzNLNEx4bVNiVmF4MWtEM1RC?=
 =?utf-8?B?cHhDWEZ6T0FYYWlxRWUyOXpxaVZLTmR3ZzNaUDZrcmxLc0FJYTdrZE9kWlhZ?=
 =?utf-8?B?TGlibU1qa25Eazk4THdRdTN3cmlnb21nOEsxTk5wQm9OSCtvSlYwL20wZ0FD?=
 =?utf-8?B?d1RJQ0pmdzlTclRIRFpQVmRGa2FWMlpBa2tTc0NadjVObjBPTVF0ejRZbzNx?=
 =?utf-8?B?VmNCTzJTRW56N1laUHh4V01kcHU2SVJ0S2hGMEQ5SUVTUFp6S1FIVGF3TGJS?=
 =?utf-8?B?ZHJJcUJXWU14blpSWjJuMUpxR2VwZkI2eHRnYzV1M3V2alVsVmhEcEw5dnlM?=
 =?utf-8?B?alpSREJNZjdOUHZxeUZTLzF1VFRTWjdBRWgxS1V2N3RqM3l1d094ek53WmVy?=
 =?utf-8?B?QU9OMllnVVJJNVlxM1FScGc0NU5qV2QvMjkvR0hZMXdvRHFTWE5PSi9hZEVr?=
 =?utf-8?B?MWVxK002Q3NNWkJUY2kva0xzdlcvUDJ3aStQeFB6WksxQnNSdXNEbjJLZGRK?=
 =?utf-8?B?cVVxZ1NpejZpbm1adDJ6b3RRSG1WZjBveXJNRk5BMXRYZ3dCSG9iZk10UG5S?=
 =?utf-8?B?R2pkVkRQSmNVdzg5UHc0MHRSWDlEUU56bklEVkVPTVoySm82R2R5cHJ2TmlW?=
 =?utf-8?B?cW11N2FSamZMbW5WMVNIYkx6aWVheEVxRWpuKzg0T0czYmJYZGd6a2JrL1lh?=
 =?utf-8?B?OVAzRXNRV3VyT0Zyd0hiWGY3aitTdWQvU3JKM3ZaT0tHbjRDc1FCeW9sd1Nz?=
 =?utf-8?B?RU5Ja0dYWDk0Y0dQTHlTdW1hRUIwNFF2SlZiSnUveUd6bGVKRCt5Z082dGM0?=
 =?utf-8?B?RE8xUi8rUVZRc1I0UnpDSmgvNmE3NGtLMGtjTkp1YktLODBDRjM4Z3J5Z0x3?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ceff1fd-5afb-47f3-62c8-08da74e74513
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 00:29:47.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfxZOeXKPah7HmuOQzDQ+r+k7p7O+4VNGvuiOtpASqMqlHt+B0F8+bxV+Syg0CduBcy3WHIvht6FayDFbty1wnFtUsyzkANLxuXZ23okYbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2022 10:37, Teres Alexis, Alan Previn wrote:
> Something minor in comments, so conditional R-B (please fix on the way in or reply to correct me):
>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> On Wed, 2022-07-27 at 19:20 -0700, Harrison, John C wrote:
>> From: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>> Add a helper to get GuC log buffer size.
>>
>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 49 ++++++++++++----------
>>   1 file changed, 27 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index 25b2d7ce6640d..492bbf419d4df 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -15,6 +15,32 @@
>>   
>>   static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log);
>>   
>> +static u32 intel_guc_log_size(struct intel_guc_log *log)
>> +{
>> +	/*
>> +	 *  GuC Log buffer Layout:
>> +	 *
>> +	 *  NB: Ordering must follow "enum guc_log_buffer_type".
>> +	 *
>> +	 *  +===============================+ 00B
>> +	 *  |      Debug state header       |
>> +	 *  +-------------------------------+ 32B
>>
> Something we might have missed in prior updates but i think the bufer state is now 36 bytes long no? (9 dwords).
Good catch. Yes, an extra word was added some while back.

John.

>
>
>> +	 *  |    Crash dump state header    |
>> +	 *  +-------------------------------+ 64B
>> +	 *  |     Capture state header      |
>> +	 *  +-------------------------------+ 96B
>> +	 *  |                               |
>> +	 *  +===============================+ PAGE_SIZE (4KB)
>> +	 *  |          Debug logs           |
>> +	 *  +===============================+ + DEBUG_SIZE
>> +	 *  |        Crash Dump logs        |
>> +	 *  +===============================+ + CRASH_SIZE
>> +	 *  |         Capture logs          |
>> +	 *  +===============================+ + CAPTURE_SIZE
>> +	 */
>> +	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE + CAPTURE_BUFFER_SIZE;
>> +}
>> +
>>   /**
>>    * DOC: GuC firmware log
>>    *
>> @@ -461,32 +487,11 @@ int intel_guc_log_create(struct intel_guc_log *log)
>>   
>>   	GEM_BUG_ON(log->vma);
>>   
>> -	/*
>> -	 *  GuC Log buffer Layout
>> -	 * (this ordering must follow "enum guc_log_buffer_type" definition)
>> -	 *
>> -	 *  +===============================+ 00B
>> -	 *  |      Debug state header       |
>> -	 *  +-------------------------------+ 32B
>> -	 *  |    Crash dump state header    |
>> -	 *  +-------------------------------+ 64B
>> -	 *  |     Capture state header      |
>> -	 *  +-------------------------------+ 96B
>> -	 *  |                               |
>> -	 *  +===============================+ PAGE_SIZE (4KB)
>> -	 *  |          Debug logs           |
>> -	 *  +===============================+ + DEBUG_SIZE
>> -	 *  |        Crash Dump logs        |
>> -	 *  +===============================+ + CRASH_SIZE
>> -	 *  |         Capture logs          |
>> -	 *  +===============================+ + CAPTURE_SIZE
>> -	 */
>>   	if (intel_guc_capture_output_min_size_est(guc) > CAPTURE_BUFFER_SIZE)
>>   		DRM_WARN("GuC log buffer for state_capture maybe too small. %d < %d\n",
>>   			 CAPTURE_BUFFER_SIZE, intel_guc_capture_output_min_size_est(guc));
>>   
>> -	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>> -		       CAPTURE_BUFFER_SIZE;
>> +	guc_log_size = intel_guc_log_size(log);
>>   
>>   	vma = intel_guc_allocate_vma(guc, guc_log_size);
>>   	if (IS_ERR(vma)) {
>> -- 
>> 2.37.1
>>

