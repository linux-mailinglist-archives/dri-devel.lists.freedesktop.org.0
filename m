Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3034ADD78
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7F10E6C7;
	Tue,  8 Feb 2022 15:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3108410E538;
 Tue,  8 Feb 2022 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644335411; x=1675871411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t3nx02etzxhmdIGHXkj3AzCjVxjIzZ6QpuM4R0nGewI=;
 b=HndfaIosNAWmCXBmX1AnqHQmF7I4zVb92wXg3eGAAqyvTSX15VwjCnq4
 NIXuyUMfBdaK6TVXiBOT4zTv90IkzfpR6dpFlDm1J+zYAyzH9z2z8AOHv
 M3fffCJnHhXBZi0ore8cpfMuRlXy1F6zMPh85kbDmZ2kX10u+lVCiayDw
 HXauzluYd4K3ApL8oVG57bfaIvxxJuD0s/j/8tq/DCQWytm0iDONPuhBV
 HL5t6usVV91UNvjMTgWODOWcyujk7P+66GDLE1lUVmGenysdRKyz1TyO9
 I203VKSAvZpVGegk60uVASNEw9rTeUxN4H3V2oqlidedAGMjrIVgA3u79 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248736678"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="248736678"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="678141183"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2022 07:50:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 07:50:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 07:50:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 8 Feb 2022 07:50:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 8 Feb 2022 07:50:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT7Qe1ctOh/UweMEG4xpkBfb5yA7wv/KvSVmh2BXCqEdkq0JnQybsCRSYpGuWxhSb7Zfulh0I44UnkAnQZQvnJRwea2Bn/ymimj6Nk2v74JdLIew0x84m8M42a6MmnMQOwspkVD59u5B6H3+4C4s3r8uJOX9d5iONBcvT+bEm7BokdWtc8uC6X918LozShsSH59WjBGCuN1XXvybKGUSBoeeRiNYzLI+NdbfdtyrpD/bqEGe9CDVBcRIX7Zq0Ijm7qFO5kWteime/rF+1oRas+5XJuXqWN0ONYEkl6IcXp+/HJ4VjuDdd000OFDcfj9Hu90SHI7maBQWPhpJDhTovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaCJy34QqaCseU+BMfSpzbhRNrYiNRv5ejOHAUgjCz4=;
 b=P6f6lcr8N4FOv55LZnjP6iPIekMaadYAqg6bsOiPySDmQszTBpwUa1NBOKIePNz2hl5/yVsM6l451s1lYEfe+Z8nW824nsX35qz1suCeYEJBM3f2V73h3loL86SgpglYXLbP1z8yPeVXlUjq3tWgxpJ26UrBoXYHlvjFwk8AuvAbYXpQcaRwHEBM8TkZr63qBOh/HxlB/cHEgXv0wW4cWUTQxyovhDCwv56t1bGgmKdZ2GEWUZveeT8D+mZniWMovwX4HHw8yddzBRs+m8vlCqrdsFBMSBKKc3Kw47eoRUmilyYxg3d6HnfiU35hl/yOoK6TW8RncAqovoWPRqunrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by BN6PR11MB1763.namprd11.prod.outlook.com (2603:10b6:404:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 15:50:07 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 15:50:06 +0000
Message-ID: <ee5fa3f0-b1ac-bc7d-cb1c-b1c832bbaf3e@intel.com>
Date: Tue, 8 Feb 2022 07:50:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v6 6/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220207201127.648624-1-michael.cheng@intel.com>
 <20220207201127.648624-7-michael.cheng@intel.com>
 <cc66b673-a875-1c50-e437-1ce29e7b2d15@linux.intel.com>
From: Michael Cheng <michael.cheng@intel.com>
In-Reply-To: <cc66b673-a875-1c50-e437-1ce29e7b2d15@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:300:95::32) To MWHPR11MB1645.namprd11.prod.outlook.com
 (2603:10b6:301:b::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07c1a41-2e8e-4928-e4a0-08d9eb1aad89
X-MS-TrafficTypeDiagnostic: BN6PR11MB1763:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB17630DED041C6B67FA18E4ADE12D9@BN6PR11MB1763.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4uQ0gkXrqFWB+Q+KoJ+YZEgopJ6oaBe2+OcgXplX+xcP7UmmCU0WWDRjyzifRQDCKx26HEkZcGxBpKfNFxWS3lSHotFx0mFBfzzz9IprafPDhxAbnYC+ppxZKJHyqlI+QrIIeIDZP79FIGmQCnsktovco2lTg8OYyAbJghfpiNBpf9y169SmVjDbINSrXJc8C79lBhMD1EZV/qyVQ2Fl5SfdUDcRKgwMDIOJyJFnyrB2LjjexA9Xvo2o4yndlFrkPdf65NuezVEUCGJ7385ZHjZoFqVAfMBWcEnOB5hJ1HYlPKjsHukKC0i3tojx6U9XssZJmTWS/etg4whYRBgzUUx+BpDfxAGR6Y8oPST8veHr1GVQLExIO1lQMuayPf/Aq9pJ+T/2dRAGYsEu9QbJ68w9dw9DPYzXUV8wsI3mi8C8YFj4TPbEbmsRuucVrCQsuET81mCd07HAPdBEw9a4pnERkU+zaEDX6HeOqEKPBQsYPlT0Eb3BByAYmG63KLvwr0ebIDSY4zf1ATV9AV6zJHx16TG8lyT9849beh9pOYJTVt4HjABjb3pTMnMbis1zD5SwILWCs0kTY4oxgWqgP8w8Sojdq82YYkGR7Fm1VbhE5lBuQ0oJp3+ieDfjO7/EUzMTUlojwuM0YN5iTNyvzohgDTyFyLaVtL2uvMxg8fzitOzorEodwYLGySjH3++tdu4h98WDx8F4t7xK97Cf71zbmw3Q6aOJQVuv9Mtjfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(5660300002)(2906002)(6666004)(36756003)(31686004)(6486002)(83380400001)(38100700002)(508600001)(186003)(316002)(8936002)(66476007)(6506007)(53546011)(86362001)(66556008)(6512007)(2616005)(82960400001)(31696002)(8676002)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b09zNlFFMXpvSk9VTEN0aU45bWkzNG53VC94anJteHJWdThSclFtMTc1YURU?=
 =?utf-8?B?OVlLUEI1QkdVYUllOGRJbGQ4M2VmeklyUGhhaCs5RFBONndkSndPWkNTdnpB?=
 =?utf-8?B?Q25mRldIVDRuTjVrRk1PMzdmbHdmbmFXQWhJQVQvTTJaTStmL29HOXNmbGNY?=
 =?utf-8?B?elQ5aUZqTHlDWHBBYmQvTm45Q0ZYUmo5Mk5vdmhrQkZrWmpFcXAxSEtxWWly?=
 =?utf-8?B?NEN4RzgrTVlrWFcyK21PNGpkdGhZWGhuZWxLUFl4aUZRTmpxSUJDZy9IYmlS?=
 =?utf-8?B?NzlUUllSVm1jUUN1WGo0cDlJVHlCYmNRWmVtRUJ0L1VKRTV1VGRvNUVsSkxr?=
 =?utf-8?B?UDVNK2Q3ZmozNFNTRTkrc0FMVGdvdnoyeXdKMk5qb05kK2hWb1NPMFk4MkJW?=
 =?utf-8?B?WEFyZGpNbG92bllSQ0QzbHAzVmJ2eWJGd1daa2hDeWN3QkF2Y24zWThtdGh6?=
 =?utf-8?B?dzdNb2RvcVF4N2psVnV5K3lUT1FJMnlkVkZhcFlpaDl4MklJTDZ6dExYZmhv?=
 =?utf-8?B?Nm53R0hZQy9zRlM3eXY4MVNiN1BGU3hESTJjdm9qckNOUjhSZFpqRWlGaDhO?=
 =?utf-8?B?K1dSa1dpVVlxUFp5NHlJZTVDMkxrS1J2bmNFQzBIdGE4L2g2dWFPNCt4b2tR?=
 =?utf-8?B?cTdaeXJHTjU4MDZqa0pKOTBWeWpZREh2S1J6T0pKb25ENTVsTzRtZnhWVG1y?=
 =?utf-8?B?THpUVUlna3JrNGhMcU9FQ0w5Q3ZoamcxQ1l6djU4V1gwTnEveGNPU05LMGEz?=
 =?utf-8?B?cm1aaFB2aElyZ3V5bmx6dTk0ak1ZaTZ3YzJoQTFic20xVExPK2lvZVNwMjJN?=
 =?utf-8?B?MGR0Mm93QjZabENZdEY4azZ5NWUrblk3V2s5YmpIdTlyMEhmVWdNQm9MM0dW?=
 =?utf-8?B?TS9uMDZrRTlzRitPZitkYVpTZ1VMV3Bjb01oM1lnNXNLem5zUURlbzhoSjFQ?=
 =?utf-8?B?YTBsTEM0SEtaN0lrK1FTWlJGT1AwcU05ZmlCYXNSbkdtVWcrVmltT1JJWnFD?=
 =?utf-8?B?Ry9YSVloVjFDODRaTXhRcW9zR2tBY1RTVUtWdElBMFBzd0U1K3I5bG5ubG56?=
 =?utf-8?B?MndEY04wQlBvSWpvUTJkN3E2d01UUmFNS1p3c1VJQlJwVmRicTRWNnlUa2Q1?=
 =?utf-8?B?S0I1YXU2VEJhL2p4MkpiWC9QZll5SnVhU25rWmpTY2V1WE5GaHlrQThObGk4?=
 =?utf-8?B?dkc2STFGWGhsZDF3QXZFQ1hiNWREeU04VVEzZjBUZjV6MXlwL2c1ZUlScG1Y?=
 =?utf-8?B?MjBVMWg1S1REMVQ4THFJZ1phWE9XZk5xU1RuQlpWeFBPRE1ZWHBaYm00ZWJD?=
 =?utf-8?B?akdpNnptL3g3djRJNkFEWkxNZFplMThoYVlhYlcvZ3dadzJVd3gyb1RqQ1ZJ?=
 =?utf-8?B?QTZDNnFSUUxuNExnQU83MEZLQnJFK1R4cEx6Z1ZTT3k4NU53TEpMTHZTMUUz?=
 =?utf-8?B?NDE2UCthQVNFRVV6L0RuQzYzVlVlWTlBQWY5SjI3MjFJNVFxZ0g1L1V1YnBY?=
 =?utf-8?B?VElDMkJ3V1dyZmJoTURPcDNHdisvN2l1eEtzVmlOUTNBODBidUlMWVQ3RGNi?=
 =?utf-8?B?Ylc2cTM5VS8zaEJMK0hZcDJCZDBacks3UzhJcVNVVGZqVDJwZnpYcWJTbTNk?=
 =?utf-8?B?RmM4Tjdkc3hPTFNENnJ6T2xyRGM4UzhwSWMyaEJCZ3JJN0VqZjBLbXpnaG1F?=
 =?utf-8?B?Q2pDTEl2TWlUUjVZSHk3NldxT2pwVHcvam5WYjFkTE5GQURRNFVERnQ5b3FM?=
 =?utf-8?B?QlZrK295MWZBZ0d0QXE5S2lRL3Iyd21QYitVdXZncHNrK0dYVjZiOE1jZnRz?=
 =?utf-8?B?Wkhsd0psVjdGUG1laTNUNDdYdHZwaUpPUEpYUkdHRjZNRWxYMFF6N0pLdmtq?=
 =?utf-8?B?WXhKS2lzaUlNZENxNWVXaGVyVTFQa1EweVljSFh1Tzg5akRCUnJpM1ZNYkcw?=
 =?utf-8?B?QXpYYkZrS1dPKzlpZjlDSTlzV0kvRE1rbEVGZjM2bldUSVN2SzdVRm1xV1lV?=
 =?utf-8?B?WDdNZUQ2MUtzRXhMczF4OHF6dzFqMlZxYTU2dzg2VTNGUHJ6OFNRMjA2dWFx?=
 =?utf-8?B?K2gzTEN5RUp6amdoc0F3NG5YS2JEcU1QN2RPVWRoeWFxMDBRM0dRcVcwdm81?=
 =?utf-8?B?QXArU0NGOXUrTzhRdTI3S0NlUFdCM2kyZU9QbWd0T3lwdXJwbDc1RWtxUm96?=
 =?utf-8?B?NXJmeU8ySFJmcnVEVUFUalZRK0pQdGdsa2xJRzFWUVl4MW43dmNLM0F0WVZR?=
 =?utf-8?Q?oBxAomVWgKOcGQVQwy1oH4icDWB4UXtKh8E47GSIkE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a07c1a41-2e8e-4928-e4a0-08d9eb1aad89
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:50:06.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFNaZWAuXv/YV9CYRFblP/7t6Xut2z0Zix7tsZRDXVibSgDKEKg4flQDH8RsCn+OAo57MElQaAiSMFf7H/o6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1763
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, thanks for asking this question. It seems like I was not thinking 
correctly. We are trying to flush dcache lines within this function and 
not the tlb.

On 2022-02-08 2:20 a.m., Tvrtko Ursulin wrote:
>
> On 07/02/2022 20:11, Michael Cheng wrote:
>> Use flush_tlb_kernel_range when invoking drm_clflush_virt_range on
>> arm64 platforms. Using flush_tlb_kernel_range will:
>>
>> 1. Make sure prior page-table updates have been completed
>> 2. Invalidate the TLB
>> 3. Check if the TLB invalidation has been completed
>
> Arm does not have a clflush equivalent but invalidating TLBs there 
> includes flushing caches?
>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
>> ---
>>   drivers/gpu/drm/drm_cache.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index f19d9acbe959..d2506060a7c8 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -176,6 +176,10 @@ drm_clflush_virt_range(void *addr, unsigned long 
>> length)
>>         if (wbinvd_on_all_cpus())
>>           pr_err("Timed out waiting for cache flush\n");
>> +
>> +#elif defined(CONFIG_ARM64)
>> +    void *end = addr + length;
>> +    flush_tlb_kernel_range(*addr, *end);
>>   #else
>>       pr_err("Architecture has no drm_cache.c support\n");
>>       WARN_ON_ONCE(1);
