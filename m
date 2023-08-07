Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD9772FCD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 21:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D110E060;
	Mon,  7 Aug 2023 19:46:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7D410E060;
 Mon,  7 Aug 2023 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691437615; x=1722973615;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p33102MrkkXIkgIMPgJyWlxOFfSlTNW6WvDgLfXTIYg=;
 b=QxU15AslSJi+PozAWLjackOfmY7sKr7aEj1moLkWfAC0XB1XdXW6herK
 Eu28TmmjI498h+SB4fOT8fvmIz7NGG+mmloKP5LNTjhgGhagbpANKAekx
 RmcrRhq0K5EUIeXVbzuRL3v0k5NY6Qi48PMWApHZvN8SFtI7yxAoBkjBY
 f2Xp3yzHiV39QYqcSQdXT2gkiuEHaOqZslZ1DELWIaopSv1TFI03A9A3o
 V1wx7lq7xDaLBJkp6cfi3p6XJBtSIrMagiRhoaqZnmXd5/+nYBat7ZPxt
 MOYUpqpSreY/5Azb29/ai8tjXz6lI1ucYX/WUPJHXPU15XgVmMUOQ2y6K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="436965530"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="436965530"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 12:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821087757"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="821087757"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2023 12:46:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 12:46:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 12:46:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 12:46:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 12:46:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im7WnS30PcnYI+oHtBenaOSk98ki4iW/Kc05kXHKc8m13Zuwjr0kP5fnoNMxE54T4V608v7xr6MqeKS4nFdo4wOnzruHOcgnWeuD4FrahmbYt69NrMMhWUzcmDcgtNxBRjPP+XMfPosskRGon3OjtsXxk5jFG5/I9zxKIgGuCi5h8p9SQ+RCQSYUpSsUFNQGh3yj84EUhcKDFp99sxUTJqCBoeZ0KxArzynFbgy0nG8xLluol7M/XSrvmQKnOptVPQiem8hdtnv9ERwElvGd+0ErXtjGQH5HIYhBmurwJNr/N3nVpwhmljLq3NkddYiAs3FLLLvZa3+FMJcORK/btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBfQEoarxbj+F5uxWFexHsfU07ZC+coRZR7bxXeixY4=;
 b=QWhZRpfOqyPhxAkbF6EImTwjkl7JEbFcc/1tUTDx4iQMwZxGqzufc6ZUdlUDTR21I/29MlYiQFEwbElE7bIUAN11lRGdvPl8dryzhdxWxhQkhwNXFHp5jQCI0KgopP6siPtVEbn4KCauiNxuEESZYGQ61W3+1IJxycotnASYybcHJMbhKGHm8+WwNRNfAWMu6JePcO8FGdAoIx9VE0wabugADwbaQifV2NeBcJQp1mw4B6T16g94fE5UPvw/6ywbOnkYF5F36Oa+ds7xRefD5qCwofjpZisNAGGLx3qc+fhWsZuYgiglKy21DRPw44UaDrKVxmt8MBp/zqUV0tOJlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY8PR11MB7746.namprd11.prod.outlook.com (2603:10b6:930:86::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 19:46:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 19:46:49 +0000
Message-ID: <989e6e1c-cac3-58be-19d1-2c2468615cd6@intel.com>
Date: Mon, 7 Aug 2023 12:46:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Fix potential null pointer
 deref in GuC 'steal id' test
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230802184940.911753-1-John.C.Harrison@Intel.com>
 <ZMurfYjREPl5NIGB@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZMurfYjREPl5NIGB@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY8PR11MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: e57b753e-5b18-4ba2-bc80-08db977f0a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YRgs9Ul4gBGxMMywvPOszrToeGXmQyInCVnqbeiMDYCjKE1fDHkypqfpcmXNpVmrBpxJEOcCkmz5jf137lGjBvnH/OCsy6iJztnp8cLlk6Ue39Qc8hCUqGwumJsaGSvOiG04VHhB2z/G71F+pv17YjeG7bGp3z/X2azCBsfZWz6pt9kEaEzvj2G2GQBqCWRtleZD/4MStiyinLc+En6kphgB1kz8XeNZ5lWtL3bf6VEJMZfrmO4Fm5CtRl+8Os5if5ltO2jQYZk6f0JP+41njI4U1NaECBrPvZ1BWhYi7iNVhiqwnbuHZzVRfvWNGkZzBKYzMqL0XEZT3yG5PAY3L6a3vX+bqul7ezK6vd7ntH5w6WG2+2dFzhGuzpWkgrqi/4hphqO/nk+qrVHJ4Mvlb2E4faNT+n2skhZx5vstQv4+P7JtK+iFrl8fYOieD+P7oKBwKj99gBdi6/zDlXNsNTCR97kNJCyHBZnLvZt8Uf38nIdOVKUAMypsObKCD3bOrfJsNAYdNeZfYYgtVMMU9pU1TaA8BeqScEbHN89SiH95QjxduwqMF3rhq75F96LBrX2zSygHohEWkmqQV7HxXS9qyC6mPSd9RpzBd7vf6E7QP8+T1HtCtn6OAhV8UYRG7HZLbTvl8sT42CTSLS9mcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(83380400001)(8676002)(8936002)(2616005)(6916009)(86362001)(82960400001)(316002)(31696002)(6506007)(53546011)(38100700002)(478600001)(6486002)(66476007)(66556008)(66946007)(6666004)(6512007)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cldub0VHUVlZcUM2Uml4ejRiY2Rxbll1NmlNTnFCY2VFdTRJRUZMOXcwUVBR?=
 =?utf-8?B?SHZnVzFuTE16NDNubkprTVp0VndRaFV1L2VTTGgxazc2eHJ0YWQ4SDZrQ1oy?=
 =?utf-8?B?VEt0TzhxUzF5dE5RdGhvcEJDTUVxYTczUWRCelZnSW5mcFQydXFCQ2M1ZDZk?=
 =?utf-8?B?TEczRnB3a3lBYlpHM29jb0R0OHhhNGh5UEpxV3hFaWlOZnVzVlk1QW83M1pk?=
 =?utf-8?B?MGhleDl6WkdwNXcrQlpEVlMvNFZXOUxvWW5ab1E1K1ZBTDZTYXA5eXk0SUtS?=
 =?utf-8?B?L3UxQkZ5Y2U0TU50OEI1R2pobjhBbWl3QTB0c2l4MVlESGZSVjVwYktiZzRN?=
 =?utf-8?B?eTRsODRuTmo2ckNwN2E0ZndRQ1JZc3dSMVY0d2tNQVRiL21lYnV0Z0gveXBk?=
 =?utf-8?B?MW13ZUllVDBmRnYycU4wYmVRWG9TYVFrWVVjTTh6OVBSQ1phZkdmekZqdTg0?=
 =?utf-8?B?YzF6S2RoNHBnWGMvMlBSMkQ3YVFyVzlETEZGN1VlbTlrUmhyVXhRRXdsVXN4?=
 =?utf-8?B?Uk41eFZwcFczTlI3S1F6UGtISkxCQ0hQQmpjL0src0hRQkIwVnBLWk9PeFBp?=
 =?utf-8?B?Z1dkYVNlVTY0ZjREb0UyWldwSTE0TFZNOXdYSjQrQklmYzFieS9iRVZKLysw?=
 =?utf-8?B?dEJMcVBKWHk2R0UyWHY1NjdIbXVCUHp6UXpwVlRQa2JiMCsycEtKUkhpQ3pN?=
 =?utf-8?B?KzF0ZkJaOXBONXV2TUlDVnJYK0FuS2hQUVJGT21pb2VBcmdQc3QwMXZBZ1Rh?=
 =?utf-8?B?RjhlZ3l5QWs2Z2NHamVCTUdrbldIN1piV1RrUkJmQ08rbFVLaGhWbXNGZ2dR?=
 =?utf-8?B?ZGhwRkFScmEvY0M5VlpWNlFTOHZNL1o0V1ZvV2h5TnJ5NzhzdWt2YmVNakV1?=
 =?utf-8?B?VEZJN0kwWWJDTk4zYXFvbjRCRUgzV3YyZ21PeTFCWGdLWEo4ejJOS05tT2Mr?=
 =?utf-8?B?Yzg0dHpiZUdiSDNiV0ZtTkpjOUp0VlJjZUhFUlhhbEFjUk1MbUdPcm1SYU9M?=
 =?utf-8?B?UWFNNDNTT2NTdDd4OTNIaUlEWkhKWHM1eGNCUEhaWDlzcXFZOHR2Rm5jT0Ry?=
 =?utf-8?B?UjhEbmoxZG9KR1VKV0g5SGZUemdDK1dlamJMSHM4bmt5KzRQeW0rMEJORE9F?=
 =?utf-8?B?dnVNc0ZVdDdLRVcwWW90NzhWVWFhaDZYWlRIVWxJRytENzZqZEVLY0VQN2x0?=
 =?utf-8?B?YzFPNkVpSUxvNlNyaEtuSXJSYXYzcmhTRDhoanpUVTIvUFZuRUovR3hMRm1Z?=
 =?utf-8?B?dW9yaTRxck5zNkFITjNSZmdENDJLMTNOdVEydGdjSG5LUkdDc0piS1oremtv?=
 =?utf-8?B?NUZBOUV2M0tTaTREVlV6b0xkNmpvZVhpZnpCZitMUndmT0Q0Z1ZpcDlVdGVs?=
 =?utf-8?B?bnBHYVgrSDJISXdlTzRQRFhkSFowNlMrM1dnR2JnbEY3YUNZRElZYzZ6U0VB?=
 =?utf-8?B?K2tJeW1VTnlGVlR2dmFvQWV6MGJNS3grNjFkME9xSHBET2NOZWVFTE9ZOUtM?=
 =?utf-8?B?TW15REtNOEd4T2grRnBxcU1GZUxSc3d6ZG9YT015aWhjSWllbTBzV1F0dStL?=
 =?utf-8?B?dy9aTnNiai9URDBtZmpHbVdjV01oejVFQ295ZjhybTcxbDhrbG1BODNJWVJV?=
 =?utf-8?B?SVVNdjRuRjlDNmE1RThqZDd0YVZQdGpmTW5YZzJsY2dFNTN5blR3eGNmRjRw?=
 =?utf-8?B?NTZGWlBvaGJBd0ZyYmFXeVVxTHMrWmpzTC84c2R2TEhIK25rbzY0ZzhlKy9Q?=
 =?utf-8?B?akNDdHZORzBtNUR2d1NuemZpcWdpWmwvMVJWcFYxWENrdjl2ako4cDFON25B?=
 =?utf-8?B?dlBUa2ZIYlI1MGlnSm9ES3dDd2lCNXFZRi9PN2t1NkFhV2l5Sk1hK0xwbGRq?=
 =?utf-8?B?aVMzbUNJbzVGR1I4cDJILzNIMEN3V3cxcmZuZStBQmZpMXhydXZDaFl0SGR3?=
 =?utf-8?B?Z05mSTVpRVIrSTc0UUNqRXZwZkIwdG1PZkhxWkRKQnNLbDVRZ2RnbC9oWjlp?=
 =?utf-8?B?R1RqeTYzc3hrR0V3bDVabjh5RUVmVldQZHJiUGdoN1IzQ24wRGRNQlZpckhD?=
 =?utf-8?B?dVExSnBXbDkwRFNQY2JDQ1N6dlVEK0M2RVZ1VjUzWjFNS2tuU0p0MlcwRGVz?=
 =?utf-8?B?WDlBZ05EZ2VOODhseGRKMWs0cWpCQnFNVDVuN3NzcGdTem5id0EwU2toT0Q0?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e57b753e-5b18-4ba2-bc80-08db977f0a68
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 19:46:49.5551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC8C98z5MTDqwkSbk7AbwgzrF1OomM0u6gzHMsYAqKoML9qnP0q35DAcAVKwLoNxb4SCEZZQJE/I5RrPY3Na7BN67o35nA0X4e1hdja6Ays=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7746
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/2023 06:28, Andi Shyti wrote:
> Hi John,
>
> On Wed, Aug 02, 2023 at 11:49:40AM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> It was noticed that if the very first 'stealing' request failed to
>> create for some reason then the 'steal all ids' loop would immediately
>> exit with 'last' still being NULL. The test would attempt to continue
>> but using a null pointer. Fix that by aborting the test if it fails to
>> create any requests at all.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> index 1fd760539f77b..bfb72143566f6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>> @@ -204,9 +204,9 @@ static int intel_guc_steal_guc_ids(void *arg)
>>   		if (IS_ERR(rq)) {
>>   			ret = PTR_ERR(rq);
>>   			rq = NULL;
>> -			if (ret != -EAGAIN) {
>> -				guc_err(guc, "Failed to create request %d: %pe\n",
>> -					context_index, ERR_PTR(ret));
>> +			if ((ret != -EAGAIN) || !last) {
> isn't last alway NULL here?
>
> Andi
No, only on the first pass around the loop. When a request is 
successfully created, the else clause below assigns last to that new 
request. So if the failure to create only happens on pass 2 or later, 
last will be non-null. Which is the whole point of the code. It keeps 
creating all the contexts/requests that it can until it runs out of 
resources and gets an EAGAIN failure. At which point, last will be 
pointing to the last successful creation and the test continues to the 
next part of actually stealing an id.

But if the EAGAIN failure happens on the first pass then last will be 
null and it is not safe/valid to proceed so it needs to abort. And if 
anything other than EAGAIN is returned then something has gone wrong and 
it doesn't matter what last is set to, it needs to abort regardless.

John.


>
>> +				guc_err(guc, "Failed to create %srequest %d: %pe\n",
>> +					last ? "" : "first ", context_index, ERR_PTR(ret));
>>   				goto err_spin_rq;
>>   			}
>>   		} else {
>> -- 
>> 2.39.1

