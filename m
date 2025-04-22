Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130DA970AA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502EB10E5CA;
	Tue, 22 Apr 2025 15:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="WuTyJ6f1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010002.outbound.protection.outlook.com
 [52.103.68.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A47410E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBuRDvJsdHCyZio9wfHhaUIgn1aIOyIVrjV2B2v9ZHMyBIFKPLcvkXpx+V0Sk1Xj+Er4y7K2fxaMYDgNQiBK8DMjFWXeOBEBb5tmb74/XlM4g0oX3OPmFpFdNzFy5MGJwpGI+XXmthn0/3q5OR9mmzudOc3bjEJsPAC5xQv/Ntq94jXlJ80JyUPtHzZ9tjgzJ/CWigLYCgLY/vImaD0LMb27EPt9KdRzgpqPBaKa3vbMt5EU1LP3F+mVdHqBMFXe4TfRJysFEgXc/tocQ6KwLJmW9OGGrmE8REj3AdniZ42DuKEXIzTruPVgB3+F4lP1fbsJlXxzi4youkkT4EiJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPTFtERnovtt18Wt92Gp3DEKmhZm46vwLzZ24LqM1Ps=;
 b=quHHZLYeWGFb7/UprxxbLRslGM3WfwdLuSCX2ZOlcxJ/eDj5w/Hg0Y+nUWjllWssPEXolp+Hk9/f7cierXBWFEXDfQvlkMGRBCwNmBOmFL2y7RHkyqmAvgo1/Bt8npQ0F++EeCBW5T5RzK6wy8dAGQccGiZ0u0rPLjqOvbHkCTEFlHJvBs/nNpYPfX7/aya1C66V9vrxHzIPfnCw3ArkAQEClOf9QrW9QuPoLIjaZ7tVe3ySLtkNa4mV0RbYRpq4c6+aU09TzE0Kb3U7pAePwrb8wbvEEcSnma+d30pbUH+mRJwImqep9TucpsOQS9QrSjoeSdv6t4pD5EaR64rnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPTFtERnovtt18Wt92Gp3DEKmhZm46vwLzZ24LqM1Ps=;
 b=WuTyJ6f1rT0rCgKmr3iO5vADlbisdJF++70L7AcMakvfq4VoLs0/beH2Lfd23d5FG7XObdHY/61J4NSuFznwM7YitKjf/umX34laOB0SWl7fuL8dKU0QLuhIH8/yBQdNgBlgKHDC4WqKVGZNDNZwp/T5a0+JS731gGEb4wj5NFxDG4HR6DKuBoazR+YpyAgMc0SJEY5p8JmCT3AAObgEFb0ZsU63zdEPGYMv2pbewSROAB7PVzO3C4dOWApamGTbaCr9/O0kduyfcNk/P+Jps++7vswgdBQ7I107d57ulxglS6W/jjsX3J70VT9hl3byX6SOAYy5d5+v10YI9fUAyw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9381.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 15:28:21 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 15:28:21 +0000
Message-ID: <PN3PR01MB9597F37026275E5CF1DC3353B8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 22 Apr 2025 20:58:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io,
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 netdev <netdev@vger.kernel.org>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
 <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
 <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
 <PN3PR01MB9597D8AE22D48C7A5D351ABBB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <aAe0O50RmUw3k0o9@smile.fi.intel.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <aAe0O50RmUw3k0o9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::10) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <5d47d3a8-ab3f-46d5-bf80-5f150f118a0e@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ffae44-bc6d-4ba9-ce34-08dd81b2508a
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8060799006|7092599003|15080799006|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU5aSTlkQWJFdUVnQWF4K244K0h1Um1URHg1YmhyZm8wZi9PMU5BT1pRWTM5?=
 =?utf-8?B?cEc0eEFmdjl2UERaeVBUUENFUXBDeCtOcE9lUUp5d3A5U1dIREpYWjFDc2tG?=
 =?utf-8?B?NUJ6NnBJelZueklnNmRFN3RNLzlsbm1XVEc3a3Jid0k3L21LRG5acTYvL2I3?=
 =?utf-8?B?eFVFbjhkbkJoRWZlSXUwNVZxN3Vock9jQVhnMW93ZzFtZFJDN3JuOXd1cHhO?=
 =?utf-8?B?TW93TXo4ekhhcEVhVXNYZHgzaldXaGxIMU1wWFlUYUNyMW9EQVFmQWVzSXA0?=
 =?utf-8?B?a2lzaG9lRFI2aXdxaFhZTnZINVNzbHNWenA4Znp5S2luRzBHTXlkVUFVT3VR?=
 =?utf-8?B?RjZJSnVCYm5rTVJjNi9ZMXBBNmwwZjl0OFBBNytVNkJaaVljWVZyQ2MwaUFz?=
 =?utf-8?B?M0RIZlJuc3pWSjgyTmJMYU5weFFRZHE5ajVaTjBYcFMwejkycVVmMHBTUFJi?=
 =?utf-8?B?Q2hKVkFZTmh6bnpSUXZCb29Ha29CSGhmYUxsblF6M2k3Z211YmhzdVpWQlY0?=
 =?utf-8?B?eitTRFBTVjhwQzhCTFIydnhveEs2OHVOZzdoZkJ3ZUxCMmtUcjZNQWZMUjJU?=
 =?utf-8?B?MEZVWkF5NjdZL21iL2lwSDZHS0NERGlCb3V3MDJPNDRQS0N6d0M2RDViS3pW?=
 =?utf-8?B?ODQ3RFdNR3EyM0VjdnpqN3lDYnQrU0ZIbHhMOWVGb1NQejU1MTRBSXE1TUxI?=
 =?utf-8?B?Zk9ISW9vNDZWZTVCM2xBbVk0ZzNBQTJCN2dEbGc1cDBIWkwrOGdpQ21NWWVY?=
 =?utf-8?B?K0ZSbHFCWnQ5MW5ub0ZpcWdxOHh6VlV5Ymp4anhJV0xYQ3haWVdYV2U1ZXRt?=
 =?utf-8?B?UkM0SVVPODkxeTVZR3AwNzg3aENsdzMrc1ZlNlk0SitPaHEyS3JndGV0bXJa?=
 =?utf-8?B?UkJUSStzeTRmUXpjRTlkWFVSaTVmNm1TSC8wWUM3K1doV2xUN1Z4UFBoVmZC?=
 =?utf-8?B?Rk9NSWlTNnNUblIrL3AwNzhjQzU2aFVHTjNJaUhXVS9mMkJQMmNKLzJOWFFn?=
 =?utf-8?B?eEdWZEkrMkxENlg3V2o1ZEE2R0cxVjRIWDVSbkxGK25kRG1lZHdwbTlQc0NP?=
 =?utf-8?B?QjkyMVNpRkJteWhlWmxzYmFFZ2V0RGw0dVgwZkNRMlprWGhwRnR0WkNLc3Jp?=
 =?utf-8?B?K2h3bndtRFBZeWZjaUh0N09XS29yZWVwOStoZkpMeklJSXN1RWNtRXJqRFZn?=
 =?utf-8?B?RElMc3JKN05hOVZTOGxndDlKeXBFSTNiYkhGOXUrbnZLd2NnVWtIODdSc0V6?=
 =?utf-8?B?WmtDSi93Y0l0RndJV0NSWm9mNVZDZUNFdHh0Q3crcHkxTmdCVW45cnhKTTJL?=
 =?utf-8?B?TW1mME52TWo1WHJDc1RhSVJoWWpwa2Q1MHZwRW01bTdtSVpJeEh2SmZTQTJG?=
 =?utf-8?B?My9mM2NISHVGN2lRZUlkUCsrNmNHa2F5N0daU05GenBySWVEa0FYUmdwYnF1?=
 =?utf-8?B?eTJyRm5EQndxMWdCaUVnSGhVMDV6TU81aW5kRzlvbDIwRWJxdmJ0dWNmcEox?=
 =?utf-8?B?Q2FKTU5ONHZXdCtvTm54L05MQkdLUDBKU1hlNEI4eTJvUEkxRCtSWjloTVNV?=
 =?utf-8?B?TCtUQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW1EVmpPMHhTOFZBUiswbUx3Q3ZzUG53RzNVYitzUUhnTm81dFoweUNjM1Q4?=
 =?utf-8?B?V1hVZS9IZEdyVmExRUJJMS8xWGRpeTcwWFFsVmlQVGRtTkRvb0ljbThocVpF?=
 =?utf-8?B?ZXFhN1lKL3ozeXNBd2krbVc5NTIvOTczYVN2enBQai9ZRDl5d1NnR3cvdVFY?=
 =?utf-8?B?V2hJMTJlaHpnOHJDODFCZkZ6Yld3TnQ3bnl4djhUV3d4NFZYVFFDSWVTczZS?=
 =?utf-8?B?dktWU1o2Z2tZb0JKcld0bWZMNGtKamVVSnpSY096TitJSzV1OFlaVUR3RDlB?=
 =?utf-8?B?bEQ2NDRTdGNaNW1nZWltUStiYjl6WCtFQkJ2YkNFOXZQQUsySkhiZXpkWmRW?=
 =?utf-8?B?WDJVTHAySFNHY1J2VzFkYkk1b3pEVmpkTm9wL0RmR1dzcTczZUF6RjFYRlUz?=
 =?utf-8?B?K1YxbWY1WlZGb1JuQzlQV1hvWlN4eGFkY2NGbEdyOEdlSWFZeEpRaU5pYU1R?=
 =?utf-8?B?WUNPaFlTRGNwSEhRcGNCN2tWbzJCWVlNOTRvZHdsYS91VTl5d09WTU0yQkQw?=
 =?utf-8?B?WlhrNVZpL1o2TUNEc1p3RDBLTHVFcXFsMURuYndweG9hcjZYaHNEVHBuN3pV?=
 =?utf-8?B?eHdkT3UvSXpaWk1wWWU2ZC9tOWxjZjNFTWdpVndZOEtFSnRTam90VkNodHdG?=
 =?utf-8?B?SFdUQVJuQ0hTeXpoUGY2R1IyWFFMK3hOSG9FRlN1UGg3UnFzcGxpSFc3NlhE?=
 =?utf-8?B?QXZjUFlRSnFYRHB3aW5waUl2emIrd1k0bmFacEx1ZU43QXRicGI4N2l5OGt3?=
 =?utf-8?B?aDBMcEpmeDJwNEkxZWVIMTJ0Q25TUCtseHpWN3JBeXp3YjZYVU1CalJJM2h5?=
 =?utf-8?B?REhwZVJWSDVaVlI1dlp6Z29sQ3hrc3JiME42dUc2eURmVm45Z3hPQlRGQmox?=
 =?utf-8?B?amdTeUswYXhnNFU0ei9ad0lkVjAwbVZEcDEyd05QdVEyVTlkSzl3ck5RUHpp?=
 =?utf-8?B?aEgzNjNBWkxiYnpMQ0x5aVBqbWtsWXJ6d0t1QW5ibGY3YzQwWk9iTjhIUldw?=
 =?utf-8?B?cEFGRXJTZW81dHpHTEU0OTZwelExVmYvRVp5R0NuRW1vZS9WeUdNWmpybG00?=
 =?utf-8?B?Z3hpWTBXN1hKZTFVVnRQRDJTN2R0ekxnMUxkQnVMenYzeFg3WFBNZzdwTTNU?=
 =?utf-8?B?NkVtQThxTmRtTkF6TGF3Y2ZMS3c1bER5Wk1YaExVRm8wK3JMbjJEQnBnRTlR?=
 =?utf-8?B?OThMQjdla2pOQ3FoZEFWUWl1V3lrejBkM0l2dHVqTE5HeXJCQnoxMG5mR25p?=
 =?utf-8?B?bTlVMlpGWUlkTTJvU29BZDJ5UzlxdXlzU0szdW5jYTBHKzJRVEk0a0RLTkZX?=
 =?utf-8?B?bzZrTUR6UmdjQ2x6QVdLcWVobitJbWFOL2liS0QzakhBYUxWZW5lN2lPdmZB?=
 =?utf-8?B?ZWVZelVENEVSTy85UGVJczh1YUhjRjVTdkw5ZXVxUDI2aDQ2aVVLZnMrMXAr?=
 =?utf-8?B?dmZlZ2FaSXdrSWYxUkxBZ054VTNILzVYT0FENkdWdmcvNG56TENMQ2w5UUEx?=
 =?utf-8?B?aGVwVjNxMk1iSjN1OXZ5aGZ0MjZ6bWoxWlpHYklCOVVFM1hxVGh3RDRhLy9i?=
 =?utf-8?B?MXNwUktpOXVRU0YwY24xMjFTelppSFZHK1FaKzhZRkNPNGZ1bmtRb2lPSkZR?=
 =?utf-8?B?UDV2WEJjZ29ERlprVnRkL2E3U2Y1RWF5SXJaNnJlYk5SU2d1NkRjeVlKMDl0?=
 =?utf-8?B?SVNFV01Vc1lMMlI4VEdrQm9BNFBLckg0THhxWHQrd0xQbFQyWkF3bk9XTWUw?=
 =?utf-8?Q?QJCQbFZo2WD0ITboxE=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ffae44-bc6d-4ba9-ce34-08dd81b2508a
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:28:21.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9381
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22-04-2025 08:52 pm, Andy Shevchenko wrote:
> On Tue, Apr 22, 2025 at 08:45:31PM +0530, Aditya Garg wrote:
>> On 22-04-2025 04:02 pm, Geert Uytterhoeven wrote:
>>> On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
> 
> ...
> 
>>> I am not against h/n in se, but I am against bad/confusing naming.
>>> The big question is: should it print
>>>   (A) the value in network byte order, or
>>>   (B) the reverse of host byte order?
>>>
>>> If the answer is (A), I see no real reason to have %p4n, as %p4b prints
>>> the exact same thing.  Moreover, it leaves us without a portable
>>> way to print values in reverse without the caller doing an explicit
>>> __swab32() (which is not compatible with the %p pass-by-pointer
>>> calling convention).
>>>
>>> If the answer is (B), "%p4n using network byte order" is bad/confusing
>>> naming.
>>
>> The answer is definitely (B). As far as bad/confusing naming is concerned,
>> I'll let vsprintf maintainers decide. As far as usage is concerned, %p4cl
>> is used in appletbdrm and %p4ch is used in to be upstreamed soon smc driver
>> by Asahi Linux.
> 
> Can it use %p4cb? Or in another word,
> why does it require "host" representation?

Sven might know why. He is already CCed.

