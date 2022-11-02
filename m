Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8256161BF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C23010E128;
	Wed,  2 Nov 2022 11:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEA810E128;
 Wed,  2 Nov 2022 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667388509; x=1698924509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MSeDC5BJZuIF2kjwOsoj5YC6pn7MObeQq/I9kASzO7Q=;
 b=Q2+4NCEque+ADMCsNs1otWWlDGoaAzijPxIAxLy0N6jt7tTHnqwo0QQt
 MmJOrMhV9BDigSoulJ6kk1f88tkJOcrsGwPPkzz9rV23JE273Q7p7YlDi
 oAPjRBMvvIaVr3X0VNpI5ojepqmjrd9WeK7YLeADifRTibDMwtEy4Ofmh
 vOJKS+lrgjDNMQ9olI1L9Blkik4234+hbc1ZrMUKqtahsJJCQFNNDNFgp
 32/yCIPsy+gjdFb4mRpx4bddzQl2b2pQwYZiVgQJamuI3hTnnYo3DVIxL
 VMjSz7TEhrr4F++EzAbIGg7xK9ACJgIzTTmKq2sY0N4znZmiOPqgwA4SL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="371474294"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="371474294"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 04:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="809247207"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="809247207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 02 Nov 2022 04:28:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 04:28:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 04:28:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 04:28:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 04:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRz4MjQPdIuoKMMsS8LB6Oo8GGhndR18nnUnMYZg6Dry/rmhV8rwd2e+8tf3769bL5Y0op+laHkBfWrrlZg8l3mT4ZUdV6Pvh3yVsXnVpgRmf0t1u6GOOeqVnquPMCTWKQKFAUMM83wY9/EYxd0VjuFJeSG56oDaMXXZY3xpP3HeAVluyHB6gFYJ6sunItMKKf+MIJ5SnEZpysv5i7lOPfWugqrRrxxUGWza7sP00DvYKyXEzt9VU6yfDI/jC6wq8ZKySS10pVjbiD7ldDBTkufoJ1qDEE0sGb3QHdDbticD8d0A+PWjzr5ISBCGEfMqBnLn0C6XLFoTyhSnAnSKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu7+X7HqC4Hb9sZQkUk6rXuNT8L2CAhQOzi7dkXocqc=;
 b=LBm4jaoRew5fAa1+/T9GUIq1L+dIJLdZyKEsmJhDG4jyUIX+ExJOkaWg4oPE6sr9tLf8fBVvVCMFthhdHG5mqSKm0RgPmpJ+PHTq0vl9JElm617amt7fOMOQIiZ2hs31UcuBzHFJCasVvWOtyAyQuuK6zch6F1MBPVZT1thvOBYI+ZwEjfssU3KvBgE5LAbVs9ol6HATr78WI4JnlTaLZ2EDzk+LsXPbvGD6v6LzZR5hmS1uF+bj11ytw0NG0Ll9GtAuo8Q8LyvS3jwtnrH/NaFJpjw7/eEgc6x9G4fzyVBLQCtHvOHGWLg5E7sVqWyboQfF7Z8qgNhJPkj4UVNv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 11:28:25 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::be9d:e93e:4ec:166b]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::be9d:e93e:4ec:166b%7]) with mapi id 15.20.5791.022; Wed, 2 Nov 2022
 11:28:25 +0000
Message-ID: <4b39009c-b7aa-8e6c-61c8-f08c03720cb6@intel.com>
Date: Wed, 2 Nov 2022 13:27:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221024201125.1416422-1-gwan-gyeong.mun@intel.com>
 <ffcfb7ce-7646-c827-8d29-7c41e4b121d6@intel.com>
 <202210290029.3CD089A86C@keescook>
 <850085e1-e420-b6eb-104d-15694a400bb7@intel.com>
 <202211011605.2D8C927C2@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202211011605.2D8C927C2@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: a468e6ec-215e-4845-4b33-08dabcc55abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnlVuSOK25PTpGGmPebA46X6bTCQwRi7KklnXLX2oqYNSZ/fVk4mRjzvrLcLvVQvQF0n6U+wYUc4FNjTB1ps3Y21MEbeOYZfG6BEnQex7vE7wNugHSjnPF2qhCDVBT0CzPrciu3h8iK3jpJf5sc36jDb2BOnVMOPT315kI0PSSrLW3trvqzYWw0AmlTaIYnqSvUPwOWD67Vxt2ZWQGKB+J7tlmFhIZoqstiTA/OCY0xhaiorqhuqbcp1P7BzJb1gd1AlIA66mUH3+tPZpTH0xbuFIEJ8wU6ggsTTrzQryda1FFrStF0qkA/g5CEFIQ8au/zPfY4BqXUva0iejt/kerBDqooOMj7u7y/gW70M5BB49Ke1kBtCHNpAdYoxF8ZEI7bBehwDCDm8MLoB8wWokdaYTp2yr1RFJKI4O6dHjaXGsMWrvHEwjWDkSTgGyaP8S9EqOgrJRgEFOcFtWl9rTvHYHa6VoxTEDsZDgmw4WCaxhvxHgyjkjjt2JPiygNYfkpRBN88wWGpaRqNMzSEWMtcQSgiqTv+qpXZEFp0ZnjDPvUSlZt4zdBZHMNxZBgVNBZp0Ec2zpteb4w46a5VlrV+lPKdOfhPsGTbRaZqHYWKdzNxfGcUkAn03ooxZIPrVzJa14RN75R4nRzA1i18UFKRpGccudiN1aTZenMOQt2RuCg4KMU0Jv8MNZWfgAM+tRvg2Amh4t/FO9jnRMqZeKsEBW7ulFcYW4KzIAwCVhKfI6kvTfxWp16pK+jwlyChkQ05meJ1i3c5AzOI5WhRvbrV2eP460lCmGdggj9PP8TM30lrsu6OAkPjO4q9y68rB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(2906002)(66946007)(478600001)(4326008)(66476007)(8676002)(66556008)(5660300002)(6916009)(7416002)(8936002)(316002)(966005)(6486002)(83380400001)(6512007)(38100700002)(82960400001)(6506007)(31696002)(53546011)(6666004)(41300700001)(86362001)(186003)(26005)(31686004)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um9VUWlKN2hvdGUyNXdpOHhlcGI4MkZLME1oV3krRjJzWXRtbzc4K29zNDN3?=
 =?utf-8?B?TXl4TWxJcEV4bEJ2WGFsYmZTcGsrdG96Z3ltUllLelVZMXU0Wmo5aHhPUE5Q?=
 =?utf-8?B?ZFNzbmlzOTNWTzhGSmk0c2o3dUxvcVN0L1MyWE9QcyttMWtsWEZKcDV0Q2ZE?=
 =?utf-8?B?TlU2dTV5TTlLcm4zc3p6dzVwS1FBNFExQ20xTmtZd3V1UmFucFZwMGZTRVNx?=
 =?utf-8?B?Rnh1djlXZDIyWXUxL1NOZXRTTi8yNEU1SFZwVmJYS2RMbzU2MGRGc3piajJE?=
 =?utf-8?B?Z0tHZis3YzlWZER1Ti9GcjMydGhqQ3dBZ2dIcU4rNnpDTHY4a2lrRUJSeTVw?=
 =?utf-8?B?NWFEL29pR0p1RFdWaWRwajBHcTVCV1l4K1pBNUR2U2pwNk8zK1N4ZzNxZ2ZN?=
 =?utf-8?B?WmpOM3d2RVJFNjlwSHVKdG5BRTk1b0hnbXBjNjdEYjZJZElta3FOWlJEdE9u?=
 =?utf-8?B?VHI5TlJEVUZpL3pCeXdmNTIrWkI3eVNrd3d3SGNhTjM0OUhBRzlHbk9lYmpr?=
 =?utf-8?B?MXVmUUdNMVdNUFlmOEFsMnl4Ty9PQnpUVGlBNzZyS3NlMjNNQ3F3NElDTi8x?=
 =?utf-8?B?MkVKK1Q0aUdpTjMyS29uV1RDREpDbWdwR0prQTZFRnJEREF1WDhpeUVFeS8x?=
 =?utf-8?B?aFZJUHRydHBrK25lYkxZNDlJcGZBQnM4alkvOGxqQkVUWEQ3aWZybVZPSFNE?=
 =?utf-8?B?ak9pL0Zld2s1RjFIem1oa3B2Q2dQcUsyUjNtL0hLbXJJaGhvbDN4TmE3ZXRj?=
 =?utf-8?B?UWxBY2NBSWQzdy9tNy9sWlYwczVPNm0rTDZCRjFUYlpteWFETHlhRnN2dTV4?=
 =?utf-8?B?QW9zT3pIc2pWOWZldU55ai9pOEpURjQ0WUJ3MnFnVEl0RmtGTUlRMElzYTJT?=
 =?utf-8?B?VjBXaTJUU3UvejZuQVM1MDBySkhINmNFTVE4UXcwMGFKeUMxL0R4T3Z2YXlI?=
 =?utf-8?B?bmd0N1JwM2JlRXJJM1k5OFoxN0psdkhmT2wzS2RzN2NqdWxDc2psekVQSmpU?=
 =?utf-8?B?M1dwNElJSWRuQUc3NFJ1L0grc0trKzBxMWpTUklsaWlBN3diV0IwZm1iV1BO?=
 =?utf-8?B?ODdXVW5KLy9oSHkxeGgxTldkZzV6ZXNWQ3FpTW0va1YzdlNHdW5CRHduQXJu?=
 =?utf-8?B?YnBHWE1Fa1UxS0l3eXBTcTFXSUVud2MySllSclVWVWlqSk9FYllKWEh4UGV2?=
 =?utf-8?B?TEhWczF6RGtyZXM0WkZjNTV0QVJhZTZIN3VvMnFOQzlNcFNUZjlwM2E2Wkli?=
 =?utf-8?B?U0NwVm02MWZMalVocllDYmpBazFsL3g5d1dOOXRBRXVwblBlTS91cXBWOTAw?=
 =?utf-8?B?MHQxWXlCMXhGNzliT2pJcURPWVVVR1paQlJQZklKalhISnpDMjd4Tll2Nmdz?=
 =?utf-8?B?VmNqN3V4bTBlVU4vRk1zMjV3OGtVaUxJM3pRdE5HWC9IQks1VktLcGg0K1dL?=
 =?utf-8?B?MHVLR3BOdjg4K1lIMDJnck9aVjdLb0s5Q3hsbTQ3RGZzN1Yvc3ZOMnhqTVhq?=
 =?utf-8?B?OHRIWVNTQ2V0OE9TOEFNMTVIRytWUzh6NWRmTW15YUFJVUFRT0dSY2dkV3BF?=
 =?utf-8?B?NnpVL3ozZWdtK3g4a0k0VXB3dEVwQk5hTGJxMm0vN1hxUG5lKzExUkl1bTJo?=
 =?utf-8?B?T010SE03S202c0Qwd05uc2JiN0UwNlhjbEphTGtzMWYvSlNQU2hRRlFyU1FL?=
 =?utf-8?B?SmtVc0gxcjhOUTRFdkYvaC94RzI0TVp0SDJDYmxmZXhNcGlsQmg1ZGk1b2xT?=
 =?utf-8?B?SEQ5L3RaUHlNTDN2ZVJNUVpCM29hRFdIdjhxWmdFcjdkdzhlV0hZQU5jYysv?=
 =?utf-8?B?MjJuWm95WHI5bC81RHAveVl2clRBb05pQVJ6M3N5RVlUM3lGYXFVam1UVFFi?=
 =?utf-8?B?cW1EVUk4Z29rNXJRL0pyRFlpd2ZiQWtrV3RyTHRtYUI5UzdWR09KRitpYlJl?=
 =?utf-8?B?a29jUytOWVBuSWN6cnVQSENVV0ozQWVkSGZTUFBscVVBZzRkWTVSRDNhbmEw?=
 =?utf-8?B?MGRNUTRmc1FKWCtZRUFxaDdka2hBUGtWTXl5TGxtNEJWOVZnRlZBM2pjUnlO?=
 =?utf-8?B?dTg2MGI1dUdaWDNNYXZVYXQ2eEdPYllKaCs4NFFmMTNLais4WitlMlc2aytU?=
 =?utf-8?B?aXhCR28vaDFVQm9USmhMYVRsN2RiTEliajZ3cThRaFpsZU9nUmhZWmN2VXg5?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a468e6ec-215e-4845-4b33-08dabcc55abe
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 11:28:25.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY0QHqGf3cGLXJtjussbn1cOQa27bESAIWsh0ETAnPaOw1ZtrOVr1TaunxUYKmDA1cGR1YaHwNmsgiDHhfVfq6FSM7BYguCWU75ajR/DEI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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
Cc: arnd@kernel.org, mauro.chehab@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, trix@redhat.com,
 dlatypov@google.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gustavoars@kernel.org, nathan@kernel.org, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, rodrigo.vivi@intel.com, mchehab@kernel.org,
 intel-gfx@lists.freedesktop.org, luc.vanoostenryck@gmail.com,
 vitor@massaru.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/2/22 1:06 AM, Kees Cook wrote:
> On Sat, Oct 29, 2022 at 11:01:38AM +0300, Gwan-gyeong Mun wrote:
>>
>>
>> On 10/29/22 10:32 AM, Kees Cook wrote:
>>> On Sat, Oct 29, 2022 at 08:55:43AM +0300, Gwan-gyeong Mun wrote:
>>>> Hi Kees,
>>>
>>> Hi! :)
>>>
>>>> I've updated to v5 with the last comment of Nathan.
>>>> Could you please kindly review what more is needed as we move forward with
>>>> this patch?
>>>
>>> It looks fine to me -- I assume it'll go via the drm tree? Would you
>>> rather I carry the non-drm changes in my tree instead?
>>>
>> Hi!
>> Yes, I think it would be better to run this patch on your tree.
>> this patch moves the macro of i915 to overflows.h and modifies one part of
>> drm's driver code, but I think this part can be easily applied when merging
>> into the drm tree.
> 
> I've rebased it to the hardening tree, and it should appear in -next
> shortly:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=5904fcb776d0b518be96bca43f258db90f26ba9a
> 
Thanks for making this patch go forward.

G.G.
