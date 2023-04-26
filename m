Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 123CF6EF986
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1519F10E90A;
	Wed, 26 Apr 2023 17:39:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875C10E260;
 Wed, 26 Apr 2023 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682530740; x=1714066740;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:mime-version;
 bh=Z5u3lBiFhPmuS09qFRvpsj/fjpjoQZ27dgXn9xvA/XA=;
 b=kXl6DzCqjzgcWsYn7tlFcjG0NrVmgID3UJqUgYHs4qkVPMSM4qoWpcD5
 1cJW8qPR+0lW3jORXwYsPbzEK3kwKuBq+wuLnEzyjPgRUWPvlibo7iBoR
 107PyIxgb3XS5wLDzYJeOuTlbVfIcPoA4j2xkxldQqqyiMPgjmMP5hpJ7
 KEnx3S8XE+TXpgNq6wAVkzCJ8P9NcQ9Nu//AhcHPuxjojwsMNPqb04E82
 fBooiVC0CbwIv5oU1YzAaApYRybAhZiUa0/5O4Z66mVne/5htUgQXc7Lp
 8ne9JaiqqOZreiRFgv52THMD23i3iZMcyi9VR35FkUIovZWZt7iIURY6l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412497599"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="412497599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 10:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="783408823"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="783408823"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2023 10:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 10:38:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 10:38:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 10:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOfjzR46XRdc3cEq3PweGtTGbOVkwtiTES1pPPkPtBxIGWC4IZ/AQ1Oce9ZPZDuHMa3cEyDl20LRqB7hcAQbmeiQuGQ7XRFli1fC+4up9C6dwsJlDpQJyL1la9p27/xfK9bn2fPE7Gf1K6IovSvh5A/AfWVlGyvZMANyhWDg26+MgKqxJdBJDLOTVus2H6Wd80UxR8M1DRi7aP5UkVdKAQfCifufK+5BYJdbwggmz9+qB99jobLtOciEzbOmrmjj0dmUymDNdp8VA1ip5jbxxFVy6x2ZsbS1VNNlqbTMDmW2AbrOSn+PRMt8DkQHAj+nUo+L+a6fPvLMs57+AN+eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8A01sCw5hxLMuxrTbJyJqRbHxPJ2hbPXxpVWhPFNJQ=;
 b=CB01CMaOhKturzblXR8/6xLamZ0vwai4cKTMq52xP4Pv8gJcg3VaR2NQdgYeX4jn865iiE+/RjOAxJSxvtgb0FIzJsiPJr+F8iZZiCK2K5WBr+A0UPga4GZnNOw6PWTkXOqyS/QvWoFGSg5xbpOJNKGAoZy99LvXAhKO5EXe6Hp79r3DfpI9y9O8dKWS9nzRj6+B1jE5qAyzKDw1G/H142wEWFADLLieLp+Ourxtl6lPD1OylzZ/cpfYCAuJi1hUXoHuKTuEjv4JGR+xH9pcXtzbtW7BDfuLn+ZCLRxfc+5DA6z0HmMgsp2+vEEjXFp1dQ8QH0vXA8guXFt74+lXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 17:38:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3%5]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 17:38:01 +0000
Content-Type: multipart/alternative;
 boundary="------------pcKlxcyzwmOA9tieRPpLQ7Ef"
Message-ID: <17322661-e12f-7e14-b190-1089cc04a9e5@intel.com>
Date: Wed, 26 Apr 2023 10:37:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/guc: Capture list clean up - 3
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-5-John.C.Harrison@Intel.com>
 <9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com>
 <413b6fc5-3182-d5cd-9a86-d7a4d814064c@intel.com>
In-Reply-To: <413b6fc5-3182-d5cd-9a86-d7a4d814064c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 67605ed9-5125-47cc-8961-08db467cfb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGOHBGnSpsepLCk5vJNK4TN9gF0uSd/Xhtpoq/eMr3fHxbdPaLejY9aqS8IjPTngsUSvP9OEAiczbS+HOdU6T+uyGfwU3YWKvQw22YqMbm2tgeXOM4qv5MBfrFFaBHP4cxV7sGzF7F5+X0HLij+RryxrSI9uTCOVsc8ZeLlwDQjSF/Y3YLhZdWpu1Fc8ROO/7sQwPsatUgebOqbZu/KqQYAHWbHhghvOU6SuBv0ilkAl9TuzI47Po3GA8lYSso5MZOu+EyyKVDvdP/ryLInCbzwVde14164euEqnckoy5VHJun/Yh/8t58KTzjgBEx+C5SwlwGTjWGxxJZoZsWjyoEgMNqqSWs6MDIKsFKf7bwG0QGC6CNhXsu4BCXCQVmZhDy3DjbTTOkIK6csyh/nGANRm1LLDNBc5pUkgU6j16x4AteajdjmioUFO1r7NGtt5bUFZS/CfCiYS5hYdWjiYkAMWXEZsWxDFOYL25fdQbcoxoRQpzFTlMV9gf9QnW9YyJe3j7DS3qtuL8Xv2T6JBW6zUE8h7Sd///NMNjIKheUOB4VRTrlj3LgPdJRi8ohA3LuYJNHjK9ddSmjVyMihOJEzYZhgsH5lMpMvaTWEGsvzReUf9ur7H1uQiFiyGSpArAcD2DWYL0IKbvkzJyx8a1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199021)(2906002)(6486002)(33964004)(450100002)(6506007)(6512007)(186003)(26005)(6666004)(478600001)(316002)(66556008)(41300700001)(66476007)(2616005)(8676002)(4326008)(66946007)(53546011)(8936002)(5660300002)(110136005)(38100700002)(82960400001)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2RxWGVHTVZYSDFHZGpqMThOSm1GdmFwaHdHbEE4N1dwSzluTGJCOTJueS96?=
 =?utf-8?B?ZUhlN0NESmxySDRsZ1M4eThQbjFRYlFuS3VFVkFDOGVCTld2RDdpMGxSK2hV?=
 =?utf-8?B?VHAySDVBSHo1NCs5dndvTU5DVWJGT0NZTXhYOHc4MVVsTkNueHR0Ujd6UFV4?=
 =?utf-8?B?OGFPTHJPSVQzYWd3V0FlWU1jNzRaeXF2dU5qMi9oSCtyTHlKWE9weWh6SWJk?=
 =?utf-8?B?ZGF6SUFvbHlyMGJSQ0JzL1dZQVpyekVDT1FmZ0hpL0RRNU1xVU1CbitqZjdZ?=
 =?utf-8?B?ZjRnMHcyeWRUSGt4aFpLVFpHZDdJSnFXV0IrRGI3R01sQUpNOTdiekdZSXVz?=
 =?utf-8?B?WnBSeVgrTkdPWG9QVzdsanh4K0w4Q3cwNnJUVkt4WFVBT05ieDkvek83ZFQz?=
 =?utf-8?B?NGREMmN0aWFLUW5YYWF6di8zbEgzejJMbWhyendMQlAvZUR1Skg2VXM4RUpS?=
 =?utf-8?B?RnhFemdSOUpmU08zbEM4ODBXS045NU5RNWF5WGxtaDlrem04Y2RtRHNqajZF?=
 =?utf-8?B?SWlBZjd2ZnR3ano1L3krM2k0bWpSbStlWUc3OW56ZkVKeFEzbXZRYnEweVVh?=
 =?utf-8?B?cXFhSHZwZE9LTmdDRmJoNWRXdXlKRjQ4Y1Jkd0N4S2xOcUxVWnNpUXM0SnRk?=
 =?utf-8?B?UG04aldGeW9aeDlDdDdMR1U3QUxRSS9UNVJiWmIyVEVTb0U2eHNoSk9jbDRQ?=
 =?utf-8?B?NFFsMGtEdzhkL1E3YWdVWWkzbXF2LzN3YXB6NXVhM1VscUsrN0lFeExib3pO?=
 =?utf-8?B?QnBlOHVydEJBdTNWZjQzOFUvWGNqRWZGMXh0ZlB4UHVZTGkzUS9LTHRaMS9S?=
 =?utf-8?B?TWxRRGdCRS9hVzhRY2QzWUcvQWdFdkNvQ1QzcDRoQWJpcFhEeDYyc0EweGp6?=
 =?utf-8?B?SEk1NmVZT1I5WkNjMWE0anNGYmlJZVVCVjVGQkJXSDRxMnBCS2JOTGx0cDlE?=
 =?utf-8?B?bVhCNTB3TWlDVzg4K3ZyWkd0N1JkVXlSc2JMZkJsR096OVlnaS9tczRCU3N3?=
 =?utf-8?B?VTEzeEExejZMeEMwd0tXN1l6enhiY0d4UlZNMjg1ajEwZVV2emRybVNSWmtJ?=
 =?utf-8?B?aFJzYnFpWHU2S1ZKT1BCc0Z4UnI3RVJVWFA1SDByajh4NThPVGVVbSt2Si93?=
 =?utf-8?B?eTRGWEdJcjFhSC9xUXdZMlZoRTZ0aHU2RXFpamJ1VjNsdXV0b2tCY2hBRVdL?=
 =?utf-8?B?KzcrbDNOS091WEl0V3IvTGlpbHJIbHo2RGljTWRldnU2MUFVYjRucnFGQXFD?=
 =?utf-8?B?aGJaWDVOYzE5dGI5cjR5VWNhUHVxclBibkxHZVIzdjZlSVBMSGR1WUFOSUgy?=
 =?utf-8?B?UUY0aCtxR3B6QUFBd29DSWg0dk1qVjhhOHRmZndpWktoTnpUQzBndm0zL0tY?=
 =?utf-8?B?N0V3YldEUVBuUUNJa3BReGlteHpmeFBDaFl0Wjk4SHdXNzljWWdzaTVzZVZR?=
 =?utf-8?B?U3hmeDhvV01McW1abjdjV0RjZUY4RENSQ0pYdEZueGExcE9HelNuSUltYytC?=
 =?utf-8?B?Vjh2L3JvNzZ3MnovaWwwTXhaMlYxY1d6ZC9HZGVIYVh0aG5Sc1JMbDk0UEJX?=
 =?utf-8?B?RU11QStmQTNuczFaZzFCN1VqYlVWV0VBeDBVb0NPLzRUSDhDZnBFWmYwUnE2?=
 =?utf-8?B?M08rMThZaDRCR0J0RXFST2d4UDl6UzM4dGY2OGQxc3Q5YWdtb205QzViWDVU?=
 =?utf-8?B?QlRoWDQ3blNOSjBSY3RDVi8ycE1Ta09UYjEwbkQvMFM4VkJ4NEJpZVA0SU5h?=
 =?utf-8?B?V0JOY0VhMW45S0JWclZGZ2ZYdkFVUFFibXBEaUlrL0pBWU1mRUdTd1R2RTdN?=
 =?utf-8?B?cDlQOGp0elRJUlk4dkdDMTVrcUdaeTNabnBxclA1TkVNNmlQNTI1NmZaVVZx?=
 =?utf-8?B?RXRxSlV1Y0NzMFV1Z0Qzc2FtRmVBcHlnWE1CSHNEMWkyald3ekd4eTVxODRs?=
 =?utf-8?B?SXo2enpFM1VTNGJjV3F6cmlhTmdNUHZqTzdqK2RPVUlPRHd1cXVsTFFNVUhG?=
 =?utf-8?B?Q01XSEJqMXNBcGJlMlBLZmFDcWs0ZmQ2ZkhDZHZyTjcxUmdXK1NaRzhESE9k?=
 =?utf-8?B?SVpPYnlzUloyclYzTVlRQXAyUkRsZzZWL0lZRVUzZFdQdTg4M1RoeVJjbklJ?=
 =?utf-8?B?N25aRllDc2F3UE1OS1BNKyt2WEJJb0EyaXlrL2NTK3RuZStWa2ZZSWdRVWtU?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67605ed9-5125-47cc-8961-08db467cfb7a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 17:38:01.3832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr4nNA9k2TYAAnBZIqFIyOzo+W3kcRuJhnt79sQcnNck3dvw7+zD0RFpiX3OrK28edysRxzrF/cYjBgsvD/JW8DkcRdAuCIXHGy+RrSRoBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------pcKlxcyzwmOA9tieRPpLQ7Ef
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/2023 10:29, John Harrison wrote:
> On 4/25/2023 12:05, Teres Alexis, Alan Previn wrote:
>> On Thu, 2023-04-06 at 15:26 -0700,John.C.Harrison@Intel.com  wrote:
>>> From: John Harrison<John.C.Harrison@Intel.com>
>>>
>>> Fix Xe_LP name.
>>>
>>> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
>> alan:snip
>>
>>
>>> -/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
>>> +/* GEN8+ Render / Compute Per-Engine-Instance */
>> alan: two comments on this:
>> 1. shouldnt this go with the earlier patch?
> See comment in cover letter:
>
>     NB: The changes are being sent as multiple patches to make code review
>     simpler. However, before merging it may be better to squash into a
>     single patch, especially if it going to be sent with a 'fixes' tag.
>
>
>
>> 2. i agree with renaming the names of the register to reflect the when
>>     all of those registers got first introduced... however, considering
>>     we only support GuC on Gen12 and beyond (we do have select CI-tests
>>     that enable GuC on Gen9 but not on Gen8 and before), should we also
>>     change the comments? I think the comment should reflect the usage
>>     not just follow the same name of the registe #define - else why even
>>     add the comments. (please apply this same comment for gen8_vd_inst_regs,
>>     gen8_vec_inst_regs and gen8_blt_inst_regs).
>> alternatively, we could keep those GEN8+ comments above the list but maybe
>> add just one comment in the default list - see below.
> Because at some point we might want to start supporting other 
> platforms. My view is that the comment should be accurate. These 
> registers exist on Gen8+. So if you are building a register list for a 
> Gen8 or later device, they can/should be included.
>
>> alan: snip
>>
>>> @@ -366,7 +364,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
>>>   	const struct __guc_mmio_reg_descr_group *lists;
>>>   
>>>   	if (GRAPHICS_VER(i915) >= 12)
>>> -		lists = xe_lpd_lists;
>>> +		lists = xe_lp_lists;
>>>   	else
>>>   		lists = default_lists;
>> alan: perhaps add a comment that we really don't support any of this
>> on anything below Gen9?
> It wasn't me that named it 'default_' rather than gen9_. I could add 
> yet another rename of s/default_/gen9_/g...
>
> John.
Although looking at the lists, there is nothing gen9 specific anywhere. 
So gen8_ would be the more accurate name.

John.

>
>>>   
>

--------------pcKlxcyzwmOA9tieRPpLQ7Ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 4/26/2023 10:29, John Harrison wrote:<br>
    <blockquote type="cite" cite="mid:413b6fc5-3182-d5cd-9a86-d7a4d814064c@intel.com">
      
      On 4/25/2023 12:05, Teres Alexis, Alan Previn wrote:<br>
      <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
        <pre class="moz-quote-pre" wrap="">On Thu, 2023-04-06 at 15:26 -0700, <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">John.C.Harrison@Intel.com</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>

Fix Xe_LP name.

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">alan:snip


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
+/* GEN8+ Render / Compute Per-Engine-Instance */
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">alan: two comments on this:
1. shouldnt this go with the earlier patch?</pre>
      </blockquote>
      See comment in cover letter:<br>
      <blockquote>
        <pre class="moz-quote-pre" wrap="">NB: The changes are being sent as multiple patches to make code review
simpler. However, before merging it may be better to squash into a
single patch, especially if it going to be sent with a 'fixes' tag.</pre>
      </blockquote>
      <br>
      <br>
      <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
        <pre class="moz-quote-pre" wrap="">2. i agree with renaming the names of the register to reflect the when
   all of those registers got first introduced... however, considering
   we only support GuC on Gen12 and beyond (we do have select CI-tests
   that enable GuC on Gen9 but not on Gen8 and before), should we also
   change the comments? I think the comment should reflect the usage
   not just follow the same name of the registe #define - else why even
   add the comments. (please apply this same comment for gen8_vd_inst_regs,
   gen8_vec_inst_regs and gen8_blt_inst_regs).
alternatively, we could keep those GEN8+ comments above the list but maybe
add just one comment in the default list - see below.
</pre>
      </blockquote>
      Because at some point we might want to start supporting other
      platforms. My view is that the comment should be accurate. These
      registers exist on Gen8+. So if you are building a register list
      for a Gen8 or later device, they can/should be included.<br>
      <br>
      <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
        <pre class="moz-quote-pre" wrap="">alan: snip

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -366,7 +364,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	const struct __guc_mmio_reg_descr_group *lists;
 
 	if (GRAPHICS_VER(i915) &gt;= 12)
-		lists = xe_lpd_lists;
+		lists = xe_lp_lists;
 	else
 		lists = default_lists;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">alan: perhaps add a comment that we really don't support any of this
on anything below Gen9?</pre>
      </blockquote>
      It wasn't me that named it 'default_' rather than gen9_. I could
      add yet another rename of s/default_/gen9_/g...<br>
      <br>
      John.<br>
    </blockquote>
    Although looking at the lists, there is nothing gen9 specific
    anywhere. So gen8_ would be the more accurate name.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:413b6fc5-3182-d5cd-9a86-d7a4d814064c@intel.com"> <br>
      <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> 
</pre>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------pcKlxcyzwmOA9tieRPpLQ7Ef--
