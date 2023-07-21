Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AF75D726
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50610E08F;
	Fri, 21 Jul 2023 22:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5D410E08F;
 Fri, 21 Jul 2023 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689977343; x=1721513343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2UNSbJqa58FWwSdfBR+/8TRIlI6FMdgpOes6a2yzhmQ=;
 b=a1+m9Vm9lsIL9ZHKFdhom1wMPTIUCRLthIILRywGsaL6lSS3iNP53Atr
 PO5TjytjGJw44S09rh22RjoUxdNPoMWrMBy4nRulEbFm+RMZ2wv4pcrAe
 g20PK/d6/QrKMfqvuaLLSPuuDhBvVxW3O5bDYcxceGzPLELQzs0LF80et
 VgUedvFUkRS0n+km1+XdQUXeNYRHlDMJ2oUTustWVyMsw4aRDKO5Zlsm3
 kj+kOl8cAx0uLtSPWMjp7swfNOQHtpIAowyOztz0vO/qg8D8pg56BqttX
 yCJqswD518mEg6YhCXpGv0Pw57qOu8U2Lr8CxWHDVjU+JbOpc47VvZbJY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430919897"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430919897"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 15:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055708157"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="1055708157"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 15:09:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 15:09:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 15:09:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 15:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1vWCQhMKXOPAXxRPBJtsIxAWWKGo0AhNiRl5U6A+osQ9X1S52sKAy77M1MsM79INBzgW0yoOG5+3GZZp0P76VzEYYjgpR7GVp/K7S3TwYGW5nex9D8Eicsd5m/Y7hRnCQqb5zg3z8ecIt6cGLCRNgUWr1em8EXsvPTxA1QeXKiPYGY8J6LWk+9koHNjf+rwRcap9zk9NEpAEmVpuov4BzTbgId+Ibvk4ImIublJpHUwxgMjljxKMpslTXkQ+9GY8bpJ63EYJUm1pDoB3/QbGYglpHN9wfDbbuU9O24bb1PoxJtGR7UqoQYC3oRu6anKyX2xUDpoVb1QmafPYsWVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4obEo2liwm4qG85TEue0ag3zbkGkXxu3NO/VWsa/iI=;
 b=iOtJPUOvfEyNyfa+PzuQV3SuFY2uIhFtPo7hEWW4x9rDXDwgKVy/oR3M21VIy304Uoefmb50DpjpskjEK8UZmYzqD8glIi7KlRikloCrOspOFsOAnB/MDUaH61AKg87tYwDh5zEFIbxDYTd9fN6G5GzHrRSVnpZOM/9poGDhpy2UK6Si9y8LRsk6nSMYUCAnZvTbDcBxKaeZkW9jlzsOEy4zk4VOGftmpgFW0uYwpnAQs6oWko6oRpj0ozj2ssarEfgNmYkY/vAmEWDJMOerRfvoXb20QuMR8Z7cZDISrR0/J269pjQMTZntAVV7OgFquUySBdueTZvPOQgXBV+vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Fri, 21 Jul
 2023 22:08:58 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::8b4:fdfd:4a61:1e14%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 22:08:58 +0000
Message-ID: <d3433b3c-bed2-c42f-7ad7-ceb8e7afc79d@intel.com>
Date: Fri, 21 Jul 2023 15:08:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Restore efficient freq
 earlier
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
 <ZLrtcwN1TkUk/yxf@intel.com> <3ba54e32-f1b3-8c31-1135-f6d754269afe@intel.com>
 <ZLr3XJNb2JdXcyvp@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZLr3XJNb2JdXcyvp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: ca08917a-f88e-4e6d-69f2-08db8a3714d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fiD3Q4DGIycf1RX0WWWL7gYwYZ28y5Lk/fiv159qThDt4emt/n42uQ+1kmKDpCywTOmgijitVvWI3cm8GM8MypXjs3xVq6/Exw6kDJRqcAbDu+tH5mMt/s1Imm/mBJY5zqxdQbTyzzXDiY/jfTnbUKI9DGyMCSYgaZEFpZKJRuEV29CqBRRthHLhouCaLXV8rYuNc8Cnl3k6CeavLI9Q8UAnb3U8n8tVhjESWb3Dwi561YBVz4/RRdB7ZgOxOl8vI6k9JCVM09P6/kSOwhL8+xqTorgG8LoVQ+EfDU/X1j5Wlr2pllECNv/trvrkYdEoCqFcAWrnYH8BAbDUKfqUPox6ziF1YqWRrd+Upa+jYOinu/+/iHOG1bSTvkyTakAC3I9k4v7ngAKhIHVi7lr5X9DjKNIPiwic4GXdqxMFhia0ytaZnxtbDwqKRpDBZdoASs9O9zNidfJK5MAR9gfuRqfsJDz4auIq/SMHJio5Wrw6EeusQEjEvwtOEm/c59fj5nwWodWGNEKgImyPbz8bYQ9CuKdm4wZDg1cJeBy46uA/5OsWa1dsAl203Q6JkjwF5tj1mBaIrrDDWxiT4vVFeh/K52Hx4cq25bqQLUR/6GKdnwES+UVGKGVkHnWFt9E9KbU+/LSjYnLo30xpNW2eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199021)(53546011)(31686004)(6506007)(186003)(82960400001)(2616005)(66556008)(26005)(38100700002)(37006003)(6666004)(478600001)(6636002)(450100002)(66946007)(4326008)(6486002)(966005)(66476007)(6512007)(5660300002)(6862004)(8676002)(2906002)(8936002)(83380400001)(316002)(41300700001)(31696002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nno4MG1wdjZxdlNDVHFqeWRPeEY1bWRLdVZlREw0S0haMmMyVjRxYVFqck1h?=
 =?utf-8?B?TC9WN05Md01PTGJkMW1mQVc1OHZKSVZ6azZMdmV6UGNFRGswOVM4UG5BeE11?=
 =?utf-8?B?SGZ1SzJtbEI1aFpwcnJPbldHYjR6dHVRM3JyVTYzNjZDZ3ZESGtUNGp2QUpa?=
 =?utf-8?B?aGNiaHF4bXUySnF2N21XUmQ3WEFDcXllK2lzMWNJWVZKTkxQY2FJS0JqVVIx?=
 =?utf-8?B?MlYrOFVVblMxc29GQzJ1bEIyZWxaenQ1eGMxN2pXUGdFNnZiVzAyeXFLY2dY?=
 =?utf-8?B?cVdEdWljbnJvMS9abkhScGhCNERlUG1WNmgrbzBjQ0o3WlF4VDJhcWVVeFRY?=
 =?utf-8?B?RFJmY0hBc1p1ZTZHL3orWHF3LzRkVXpkSHJncUJObExJcnZjMlREUzdtYk9I?=
 =?utf-8?B?YWFDenViMm55cUpXQ0FyZ3FBZlFMZlNhMlJ5TmErTWxFcXQxNTI4dHY3RDc2?=
 =?utf-8?B?NVlOZ1pSYjhvb01VWVliajc3ODc0NTB5UkJpVUlTOEQrQklpOWplV1NkY21X?=
 =?utf-8?B?b3NUVWxHaVE4ZnUybVVkb0VIZUtYK3F0QktMTytIRGFaWEhGcVMxd2laSHdB?=
 =?utf-8?B?RWt6MVFhTFdJY29KM2ZFVVhlS0Fpa3JQdzJsY0JmUEFtZDRWViswQ1pYM0ZS?=
 =?utf-8?B?UDFianNtUitiVGRvaDl1aGlxTlRDQ1A5REMxRjZ5N0FsbzJyVzZVZjdEalh0?=
 =?utf-8?B?cVJGeVMyZW5FM0E3Q2F3N0JCRXpsbGcvdjdoQzBRTGZnZWJ0L3dzWXhnVWNR?=
 =?utf-8?B?NTE2MnY0L242QzczcUltUnZXTGNkaGNLdjgxNW1sc3RTS0U4TE9zYWJVSWhV?=
 =?utf-8?B?Q3NhYzlpVWpEbVkxUU92emcreHoybnBuTW12bmhiSnJNRHJRdDZub3Q2QmZE?=
 =?utf-8?B?bEJWQjArbmNuQ01FNmJ5T0FXcEtkRjhSZ1pRWGkxMjl5TkhmamxibUVybUVS?=
 =?utf-8?B?VCtzN1Q0elVMSlpWYVd3REViaDZtb3JzY2gvdU5CeG81dnZyY0hHajRTZHJ1?=
 =?utf-8?B?bndmTWhTcldHYzlMVUY2ZTYvQTc0ZzhtQVJHdVNCMkJ1Z1IwQzFsUk96UnZw?=
 =?utf-8?B?dlpSQ1pzRW1wdldIcEQxbjRQRVlCT2RkUGtsT21ZaTBYcGp2aXV5SytiTkpu?=
 =?utf-8?B?enFjSDV2cHdFOFB2empyR1pselpEdmhoK3FSNkwrbWorUnpqRHBHWmpFMGov?=
 =?utf-8?B?bDcwdyt3OGpRWTYreXBvRVNSZzhVTkU2b1VjVG9EajhhZ09TQVczNWRINzMv?=
 =?utf-8?B?Zjg3WnZscUxnUmhjL2VYSVRSUGNUbkJRNzIrc2g0R0J0eUNJM1RPeVBOOHly?=
 =?utf-8?B?djhtem9Na093dU95Nlg2VWxRSGl3a2NXWjZuRDMzamdWM1ZLT3VBeUEvWTYv?=
 =?utf-8?B?N1ovaGM4eWM2Vmkvbk8wSEZyRU9BK0dHdGhEQWVGeU9IV1dmaXNlNS9ubTFQ?=
 =?utf-8?B?SXZhSmJqS1ZCemF6a0ljWnYwUlFLbFIvQ0NYakpNaGVOeTlFWTZySmhqMkMz?=
 =?utf-8?B?UWdKY3VjbW9sdVllN0syNnJJMksrN0pQTFZFNVVkZyt3ME92b3BuN0wrajUw?=
 =?utf-8?B?djFROVBsN3NrRm1Sb3FHSUxCcVhOaUFvV2RrbHBTS05nWGhsNEFadk8rNitV?=
 =?utf-8?B?RytSTmROcmQ3clVCZzlSZlc5ZmVHSkdYSktLQWhoRTVUeUovTytPeUp6ZUw4?=
 =?utf-8?B?NDM4ZDJnaXJNZHNldXZzd3oraEkrajhaWnZsbnNvWDNENkdCSzJxTmhSaWx6?=
 =?utf-8?B?WVA1SVAwNjdUTmJsbmQ4eUZ0aUgzRGczdWRqUXl1QTFjMU52bnlOU2FYTFRa?=
 =?utf-8?B?RGE2VTRyWVlhYk9HcDloSU02d09qZGo5ckVhS2d1djZVZ0o2cjRmWkNmcEtp?=
 =?utf-8?B?bm9jZVlZN3N4QVc0OEI4ZXlSR001MHN1M1dzeEw1akVhS28vTkhOUnFrSUdS?=
 =?utf-8?B?OGNOVG9EbXNlRWhBRlJJWit5ZGczKzRIRW9RcmIwK25jVzREVTJMd0hJMUwx?=
 =?utf-8?B?Nm04NEJydkNjZ0F1U1hBTkpPcU1KVDVyaVZLYUEyREJ6cGF6UTZNN0ZsaEtM?=
 =?utf-8?B?Z1FaSTVTNUxpZURrb3IvV3JDelRqZThkbVRoSE8wZU81RUNsVDlLQVNEbDNT?=
 =?utf-8?B?NjBvRS9SVTJBcnlLUHp5cTFseDlqMndZZGI5blNidUtaVC9ZaWk0U2xmSHhh?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca08917a-f88e-4e6d-69f2-08db8a3714d6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 22:08:58.2381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG7RAHddngXOb8t4Dw0/XzkJdTUbZ7bCatXl/uyd0CnUnvvlfIzPfecSLZ7SUN1tjLWoUrjqmD3U90t5V+f5wfQk5ZFp1E+in0so+IxwL+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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


On 7/21/2023 2:23 PM, Rodrigo Vivi wrote:
> On Fri, Jul 21, 2023 at 01:44:34PM -0700, Belgaumkar, Vinay wrote:
>> On 7/21/2023 1:41 PM, Rodrigo Vivi wrote:
>>> On Fri, Jul 21, 2023 at 11:03:49AM -0700, Vinay Belgaumkar wrote:
>>>> This should be done before the soft min/max frequencies are restored.
>>>> When we disable the "Ignore efficient frequency" flag, GuC does not
>>>> actually bring the requested freq down to RPn.
>>>>
>>>> Specifically, this scenario-
>>>>
>>>> - ignore efficient freq set to true
>>>> - reduce min to RPn (from efficient)
>>>> - suspend
>>>> - resume (includes GuC load, restore soft min/max, restore efficient freq)
>>>> - validate min freq has been resored to RPn
>>>>
>>>> This will fail if we didn't first restore(disable, in this case) efficient
>>>> freq flag before setting the soft min frequency.
>>> that's strange. so guc is returning the rpe when we request the min freq
>>> during the soft config?
>>>
>>> we could alternatively change the soft config to actually get the min
>>> and not be tricked by this.
>>>
>>> But also the patch below doesn't hurt.
>>>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> (Although I'm still curious and want to understand exactly why
>>> the soft min gets messed up when we don't tell guc to ignore the
>>> efficient freq beforehand. Please help me to understand.)
>> The soft min does not get messed up, but GuC keeps requesting RPe even after
>> disabling efficient freq. (unless we manually set min freq to RPn AFTER
>> disabling efficient).
> so it looks to me that the right solution would be to ensure that everytime
> that we disable the efficient freq we make sure to also set the mim freq to RPn,
> no?!

Hmm, may not be applicable every time. What if someone disables 
efficient frequency while running a workload or with frequency fixed to 
800, for example?

Thanks,

Vinay.

>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>>> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
>>>> Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index ee9f83af7cf6..f16dff7c3185 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>>    	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
>>>> +	/* Set cached value of ignore efficient freq */
>>>> +	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>>>> +
>>>>    	slpc_get_rp_values(slpc);
>>>>    	/* Handle the case where min=max=RPmax */
>>>> @@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>>>    	/* Set cached media freq ratio mode */
>>>>    	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
>>>> -	/* Set cached value of ignore efficient freq */
>>>> -	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
>>>> -
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.38.1
>>>>
