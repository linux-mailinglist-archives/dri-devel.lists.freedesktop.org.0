Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B0A5EBD45
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 10:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A41E10E0BF;
	Tue, 27 Sep 2022 08:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C01F10E07E;
 Tue, 27 Sep 2022 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664267405; x=1695803405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GjO7mHFpNJFbXOmP/V9CxBsZMA4UUwNpyaBSjFk1/WE=;
 b=DH8l5NScRLONCHqMVWO3zk31SqvrVNQHkFb/1/ZJGFByRNf91IFtS3eL
 mF8Zk+05ek2IaGbrA27uoCY4D0id7reM00NjLv2VBbfJ61CJwoOsLedLb
 i9xpDgMKox9bte+ptfzUmNPK8WeKO4TPFcNVBikAgKIee9dza7x50tkpN
 hGhn8ksH6hE0hvk808dJbllm7uAEU3SDf8FarGea8925jEwqAMyITWKnC
 zAtpZphX3T4IJ6iBMzwTdDZ8m4SbNLKDe/BtSPw381gt+8JqGXWqq3M2D
 w4gcyc0HQ+nhyt3u6Flc4N8gP/cWsy/NpJtVS5YJ5LtnAg7JFGHR7/4k4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284384257"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="284384257"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 01:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="616750619"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="616750619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 27 Sep 2022 01:30:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 01:30:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 01:30:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 01:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1wn36bdrLJb/8Uj/NZmoXPwepqQkgHmltHQG0NY/LRfKy9r6uufujjVf4ewu3guHjT82OW9HsPeH1hT/UFuGSv8WPAdZ/Uo7cMJM3O0krb364s3/WHfznghaNwkzXjQnbAl0YTc8ORj/W7ehD3BsdnneNg0cmQia+LNhgJGdwj7uwmQCuaDBqsY+KXhVnFhL7fKa0IZ9iby2ZRNYaqU1vvjFhIl8TLzyCE2vcXFEBgZKI2Bs0M8Tj/6gPtz1OQXg8KvWm2PhkYM3JeKGY8yTT040lbjmpktKY4dwat0pIyy/n6PDFql9ysjgsF1gI+ngo+XEJ31/VgwPZtv2IJhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3NyQlN+/ZhbCFUrrn1BrJdkx7soUgOxd6KlBSxKdgs=;
 b=hscpDASi7Z59XYK07avXUCUGHmvASZCGDo2R9FFrwzbvVDk2nCSJTk8Q5ZKjFv4XqOwlLVw/PWWh/2Y6vXSlQORuBTHkEmFzTO/DjTgrzLiLH0UE5Q7Rp0UnS7Fclh3MHYUlKVkOaY4RG1GR+HEOb/ZrVY+5WDk56R6oB3NsBKWy7lYiX/+SiT+uhhZT9UaDALE3asg1kp6CmjhHrOh8CWv6rLJLpteKZ5EJCHmWTZnBwoTy4WFWjIzQCUEbs51q5u2BaZIjD9X5E+56RcuV3GEqkhgZpR3B3u28Rn7VZK+ohwvYfJSQPMx1PIOlP4Vrwdj7hE76lCS/fxCKKifK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 08:29:58 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 08:29:58 +0000
Message-ID: <82dba5ed-a683-4727-42f9-373008d77381@intel.com>
Date: Tue, 27 Sep 2022 11:29:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] overflow: Introduce overflows_type() and
 castable_to_type()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220926191109.1803094-1-keescook@chromium.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220926191109.1803094-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0042.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::29) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a815b39-2520-4c4c-e5c1-08daa0627675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtUeDf9L3Cq3ORx01bfYm4qIRvuX33OO10dAiqoan0Mty3vnS1v9jhUp3k+Ase+qOQgwW2jDY1dbT068x52Lm4gz+rwbBnhchY0NtsuXxpSLqnf7morIFPc74HCW5DCRfjs5Lf6zKpoBdtHRrjcjmtVMn699RlCpMG4lH/9GiDHbnYVCsb4CKPbl23UgUcTcLv+zVv/7iYNH6ZAus5cH9R18SjcQ2shIuB+4sE3ztAZ3yRI1+Zl3a1XQbBOPHRKOxqAWdnvW32NQC/qZbxLtk42BpyXzpQeWZVK5m0M4HRPVsSR9Fn5udyKAlANP8imS1Ja8QTs7QlBRJgBZKK1WhrW3it1qPjYLJD0wEuL/IdzN83D1lo5gKwshp8TCIKbt7UMmOMTGCzI+y2KwLqEeVUgXqAcxqk0xqjJx9LP1Eir9ysk0X+/CrbkW75MtkrXaE7q8MLr8etC1ZnEZ2AB5gRpg8nqkmSH2Mxbea4ocHcBTp5gtttouyE+EWFmkiZxGBdMrPouNvH36n+Z/7g1e9P7+QYDm8CPjpeR0g/bLX7aV6l2pdBefK3hzur5eWpK1zmkuuLm590CkWcwhLvPx4gxh14H7a+8FmbZ4tcoF8HvBlqeP73cbG1Po2+6kdUolZo4/WvfMFxMUvZNiX10SR2480csMpYh6bbu6SFdkjmcTs6YbUT9NQ31RATOaj6o2KnO1D4CabDdqWdDI7X+G2vJhe5F4BEHaELHwa01g3vgj4WkxtWpVJQYJQbOiCVVfwnb5ugDDA+TFewzgV+06uWtQYQyy7tu8EVXgmmFdkBN1vueOg9mABevo/Mbe+MmARY1d/ESUz5SEcFqhEYgewiY0oXwtmFx/8MFNIxaD5Js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(8676002)(4326008)(66946007)(6916009)(6486002)(66476007)(66556008)(54906003)(478600001)(966005)(316002)(38100700002)(186003)(6512007)(86362001)(2616005)(26005)(53546011)(6506007)(6666004)(83380400001)(31696002)(82960400001)(31686004)(36756003)(2906002)(5660300002)(8936002)(41300700001)(30864003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZhdnY1L2VCdXdGLzRtK2ZzR1paZ2lpbXlLS2NaSUx0aEJlTEdFQUF3anNK?=
 =?utf-8?B?V1cwTkt3eTN4L2luQWNzUkRJcE5SSktsZllURU9LNXV5UlNCU0dmdFBwVmFv?=
 =?utf-8?B?QlU1UWlseERwTkprUUUyVFdFcVhsaTJYOHp2Q1diNWZOL3BWeHNoTnlmeEVU?=
 =?utf-8?B?UGFnMkcwMmlibDFhVnJMUURacmU1NGE3MHJ3d3lKWnltMndCeURpVHNyS1NR?=
 =?utf-8?B?RWoySTl2cGdxckxsN1V6STlCZk5SNTVzeVVnN3VmZWFYU3VEUGxoMXB1Tmht?=
 =?utf-8?B?VXVhNFIzMHpabDcyMkZqT3RTY1RUQmVSa0tnUlFMclI2SjdUUmZJZ3FDSWFu?=
 =?utf-8?B?MnEweUV6eHhCVUpYbTdNQzFZV0pqQmpMc2Y3YkNDeVVOTVNzS2o3UktPSk9H?=
 =?utf-8?B?TzljRitFUkpqT2xLU211K1Zsa2dyV2pVUlMxekVuRXRGUENPUERnTVltTHc4?=
 =?utf-8?B?UHZhVHU3Q1Z6OVg4OS8wb3V1VlkydDRPNVJiSEk3UEFEWGFzNnhOdlBGWjVE?=
 =?utf-8?B?SzRqY093bnBoc0dTMklpaWFCQWNNRWw5c0xvNTN2dW4vaTNNclMwWkVneVdP?=
 =?utf-8?B?dlpkd0QyOUtBNTE0cFdsYUtrR0plZDlIQzBLL0JJVStkOWpzTjNkc3B5Q0Zx?=
 =?utf-8?B?T0NreFJqMVNtMDVhQitTK2pPOVJEYjY5c3dYT0tMQ2ZQb21hSS9JbmVqR05m?=
 =?utf-8?B?SnAzUFB2aFZBQ1dYZjF2NlVKWUM2Q3laMEgramdYN05wQ09BUUp2UjI5RXRR?=
 =?utf-8?B?QXJnMm1VYWN5K1o1V0NsYnJWdXF4OGF0RmVUbytJbXV3Y2xiOUd5R1NDSkpO?=
 =?utf-8?B?L0Y0Yk1VbVlCQW91QjhsQzJ4aTM5TnVSN3UrK3NhLzdoWDlsdjljWWR0VnFH?=
 =?utf-8?B?QWhsa016TzhEMXR1emp1MTNuZDA0R29RNEk3U013WTFrUnBRM1R4NU10bnNR?=
 =?utf-8?B?VnRodmJSb0s2WFR1Z1h4eVFyUmc1b3Zwc1RsdTByRUMxUGx0YkFNWHpNWTRi?=
 =?utf-8?B?ME1SMmUyMkpvbnlFWlFDQVd1VFM3Q0tyRlgrcG5ydnZ1Smt1eWVtdjd6SEE2?=
 =?utf-8?B?Q0FXdUtpSy9ITUtSRFVKVW0wMWw3VmMwY3J6eTA1Y24zS1lQZklHQWhnSlRn?=
 =?utf-8?B?YkxIaGd2cnBzWUdmZVBUOEZaRmdWejdsY2poaGtqVUFUTFVvcm5GUzBjVjI5?=
 =?utf-8?B?ZU50UmI4dEtyamdFbzF2dlhRemR1aEVWMm5nVU0wL1pQQ3NDRmpDRGR1bWho?=
 =?utf-8?B?TzBlZjVnZDVYQi9KNVN3UGxWS2huU2lMazUzbkFseVg5eWJ3Q1lISGNOUmFt?=
 =?utf-8?B?V1R2OXlETFM3YWRJWWUvQWxBM2pOSk9GdXdZaGVNYVNxSzFFaXMzM2x5YzBa?=
 =?utf-8?B?a3d1Y25vdElLL0MycmUwTjN1R01Ra2ZobVlJeXBpN0lSOEdBRTBSYW55emp1?=
 =?utf-8?B?OGQwWTJkU3RXZWFVc3UyNDZqb1NOQVBiSnNMZXB5b2ZPUmJUeGpPbkpHMFRP?=
 =?utf-8?B?K0RBOE1UWTRzU0pzNVBmYVNTUXJVK1E2NVJpemhTTmpXbzZuZzkxOEZQRGwx?=
 =?utf-8?B?Tml6UG1PMUJ1L1R4cXYrWko1eGVJZk5uYVZ2aGlCc25QYTY2VUZpUkNkTm1a?=
 =?utf-8?B?TkpnRW5hRGlmVWw3QkZJbjdZb0VYMlJabS9IOW5YNHA4ZHkvUEVvU3g0Z2tW?=
 =?utf-8?B?RFh6QllPcGl3Lzk4L2JKaU1iWnZsTi8vend6V1Qybjg0Vkd2SEt2TFFNbnBF?=
 =?utf-8?B?dmpLMzVrZGFubDlSU0lJN21XaHp6UUJVNUxDNUZQV3YyTW9DUHZwcnJ5RzRG?=
 =?utf-8?B?bGtPSkwvd0tKSXplUVhPUDBPV3ZMbU9HODVtSHpNRGlTZ3drRzRYVVVxM1Rk?=
 =?utf-8?B?bXYxS04yVktLNENiUGNobVM5NDgxS1o5S1o5eXU5SUpEdzNHUmF6MHlueTdC?=
 =?utf-8?B?N2FVWkpDM2hGem5iSzJxcVNtblpGWEEyT2tIck9yNmlSTG9pL0dSY1Y2NmJ1?=
 =?utf-8?B?SDR0czYvRWswYlF5dzBnY0dERmpaakFob1JLc1AxdjhzVEUxZW5ZK3hkaE9Q?=
 =?utf-8?B?UUtpaEp6cEdoS3lWcFc3RHNqS0dIY2htYVg3NFpBbHlxcW9SNTVEQ0Zub0Rv?=
 =?utf-8?B?OEV6SnRlZi9qZzlGVlpadmxEM29BcWpia05GcnZjL2FOa3drRTNHR2VTVW90?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a815b39-2520-4c4c-e5c1-08daa0627675
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:29:58.3847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnteu03pbeMPUCXDkpxGTzVDiKAxZpG580Z1YxRxMx8aH2HWJ462PBEUyLBEC5gWkCwizm0MgtwW8e3jb7vP5d77OjmltSfMrrFci0QGP08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Daniel Latypov <dlatypov@google.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, linux-sparse@vger.kernel.org,
 linux-hardening@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,
Thanks for update it to v2.
I'm leaving a comment because the patches this patch depends on aren't 
part of one of the series.
If this patch alone is forwarded to the intel-gfx mailing, it will 
report a build issue.
If this patch is only for review, please ignore my comments.

In order to remove overflows_type() from the i915 gpu driver and add the 
updated overflows_type() to overflows.h, the following two patches must 
be applied first because of dependencies.

"overflow: Allow mixed type arguments" [1][2]
"overflow: Introduce check_assign() and check_assign_user_ptr()" [2]

https://www.spinics.net/lists/kernel/msg4495457.html [1]
https://patchwork.freedesktop.org/patch/504792/?series=109063&rev=1 [2]
https://patchwork.freedesktop.org/patch/504791/?series=109063&rev=1 [3]

br,
G.G

On 9/26/22 10:11 PM, Kees Cook wrote:
> Implement a robust overflows_type() macro to test if a variable or
> constant value would overflow another variable or type. This can be
> used as a constant expression for static_assert() (which requires a
> constant expression[1][2]) when used on constant values. This must be
> constructed manually, since __builtin_add_overflow() does not produce
> a constant expression[3].
> 
> Additionally adds castable_to_type(), similar to __same_type(), but for
> checking if a constant value would overflow if cast to a given type.
> 
> Add unit tests for overflows_type(), __same_type(), and castable_to_type()
> to the existing KUnit "overflow" test.
> 
> [1] https://en.cppreference.com/w/c/language/_Static_assert
> [2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
> [3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
>      6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
>      Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
> 
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Vitor Massaru Iha <vitor@massaru.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
>   - fix comment typo
>   - wrap clang pragma to avoid GCC warnings
>   - style nit cleanups
>   - rename __castable_to_type() to castable_to_type()
>   - remove prior overflows_type() definition
> v1: https://lore.kernel.org/lkml/20220926003743.409911-1-keescook@chromium.org
> ---
>   drivers/gpu/drm/i915/i915_utils.h |   4 -
>   include/linux/compiler.h          |   1 +
>   include/linux/overflow.h          |  48 ++++
>   lib/overflow_kunit.c              | 388 +++++++++++++++++++++++++++++-
>   4 files changed, 436 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..d14b7faee054 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -111,10 +111,6 @@ bool i915_error_injected(void);
>   #define range_overflows_end_t(type, start, size, max) \
>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>   
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>   #define ptr_mask_bits(ptr, n) ({					\
>   	unsigned long __v = (unsigned long)(ptr);			\
>   	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 7713d7bcdaea..c631107e93b1 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
>    * bool and also pointer types.
>    */
>   #define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_unsigned_type(type) (!is_signed_type(type))
>   
>   /*
>    * This is needed in functions which generate the stack canary, see
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index 19dfdd74835e..58eb34aa2af9 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -127,6 +127,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>   	(*_d >> _to_shift) != _a);					\
>   }))
>   
> +#define __overflows_type_constexpr(x, T) (			\
> +	is_unsigned_type(typeof(x)) ?				\
> +		(x) > type_max(typeof(T)) ? 1 : 0		\
> +	: is_unsigned_type(typeof(T)) ?				\
> +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> +		: (x) < type_min(typeof(T)) ||			\
> +		  (x) > type_max(typeof(T)) ? 1 : 0)
> +
> +#define __overflows_type(x, T)		({	\
> +	typeof(T) v = 0;			\
> +	check_add_overflow((x), v, &v);		\
> +})
> +
> +/**
> + * overflows_type - helper for checking the overflows between value, variables,
> + *		    or data type
> + *
> + * @n: source constant value or variable to be checked
> + * @T: destination variable or data type proposed to store @x
> + *
> + * Compares the @x expression for whether or not it can safely fit in
> + * the storage of the type in @T. @x and @T can have different types.
> + * If @x is a constant expression, this will also resolve to a constant
> + * expression.
> + *
> + * Returns: true if overflow can occur, false otherwise.
> + */
> +#define overflows_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),		\
> +			      __overflows_type_constexpr(n, T),	\
> +			      __overflows_type(n, T))
> +
> +/**
> + * castable_to_type - like __same_type(), but also allows for casted literals
> + *
> + * @n: variable or constant value
> + * @T: variable or data type
> + *
> + * Unlike the __same_type() macro, this allows a constant value as the
> + * first argument. If this value would not overflow into an assignment
> + * of the second argument's type, it returns true. Otherwise, this falls
> + * back to __same_type().
> + */
> +#define castable_to_type(n, T)						\
> +	__builtin_choose_expr(__is_constexpr(n),			\
> +			      !__overflows_type_constexpr(n, T),	\
> +			      __same_type(n, T))
> +
>   /**
>    * size_mul() - Calculate size_t multiplication with saturation at SIZE_MAX
>    *
> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
> index f385ca652b74..fffc3f86181d 100644
> --- a/lib/overflow_kunit.c
> +++ b/lib/overflow_kunit.c
> @@ -16,6 +16,11 @@
>   #include <linux/types.h>
>   #include <linux/vmalloc.h>
>   
> +/* We're expecting to do a lot of "always true" or "always false" tests. */
> +#ifdef CONFIG_CC_IS_CLANG
> +#pragma clang diagnostic ignored "-Wtautological-constant-out-of-range-compare"
> +#endif
> +
>   #define DEFINE_TEST_ARRAY_TYPED(t1, t2, t)			\
>   	static const struct test_ ## t1 ## _ ## t2 ## __ ## t {	\
>   		t1 a;						\
> @@ -246,7 +251,7 @@ DEFINE_TEST_ARRAY(s64) = {
>   
>   #define DEFINE_TEST_FUNC_TYPED(n, t, fmt)				\
>   static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
> -{							   		\
> +{									\
>   	check_one_op(t, fmt, add, "+", p->a, p->b, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, add, "+", p->b, p->a, p->sum, p->s_of);	\
>   	check_one_op(t, fmt, sub, "-", p->a, p->b, p->diff, p->d_of);	\
> @@ -708,6 +713,384 @@ static void overflow_size_helpers_test(struct kunit *test)
>   #undef check_one_size_helper
>   }
>   
> +static void overflows_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	unsigned int var;
> +
> +#define __TEST_OVERFLOWS_TYPE(func, arg1, arg2, of)	do {		\
> +	bool __of = func(arg1, arg2);					\
> +	KUNIT_EXPECT_EQ_MSG(test, __of, of,				\
> +		"expected " #func "(" #arg1 ", " #arg2 " to%s overflow\n",\
> +		of ? "" : " not");					\
> +	count++;							\
> +} while (0)
> +
> +/* Args are: first type, second type, value, overflow expected */
> +#define TEST_OVERFLOWS_TYPE(__t1, __t2, v, of) do {			\
> +	__t1 t1 = (v);							\
> +	__t2 t2;							\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, t1, __t2, of);		\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, t2, of);	\
> +	__TEST_OVERFLOWS_TYPE(__overflows_type_constexpr, t1, __t2, of);\
> +} while (0)
> +
> +	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
> +#endif
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
> +#if BITS_PER_LONG == 64
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
> +	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
> +	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
> +	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
> +	var = INT_MAX - 1;
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
> +	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
> +
> +	kunit_info(test, "%d overflows_type() tests finished\n", count);
> +#undef TEST_OVERFLOWS_TYPE
> +#undef __TEST_OVERFLOWS_TYPE
> +}
> +
> +static void same_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +	int var;
> +
> +#define TEST_SAME_TYPE(t1, t2, same)			do {	\
> +	typeof(t1) __t1h = type_max(t1);			\
> +	typeof(t1) __t1l = type_min(t1);			\
> +	typeof(t2) __t2h = type_max(t2);			\
> +	typeof(t2) __t2l = type_min(t2);			\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t1, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1h, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t1l, t1));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(t2, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2h, t2));	\
> +	KUNIT_EXPECT_EQ(test, true, __same_type(__t2l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t2, __t1l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1h, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t1l, t2));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2h));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(t1, __t2l));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2h, t1));	\
> +	KUNIT_EXPECT_EQ(test, same, __same_type(__t2l, t1));	\
> +} while (0)
> +
> +#if BITS_PER_LONG == 64
> +# define TEST_SAME_TYPE64(base, t, m)	TEST_SAME_TYPE(base, t, m)
> +#else
> +# define TEST_SAME_TYPE64(base, t, m)	do { } while (0)
> +#endif
> +
> +#define TEST_TYPE_SETS(base, mu8, mu16, mu32, ms8, ms16, ms32, mu64, ms64) \
> +do {									\
> +	TEST_SAME_TYPE(base,  u8,  mu8);				\
> +	TEST_SAME_TYPE(base, u16, mu16);				\
> +	TEST_SAME_TYPE(base, u32, mu32);				\
> +	TEST_SAME_TYPE(base,  s8,  ms8);				\
> +	TEST_SAME_TYPE(base, s16, ms16);				\
> +	TEST_SAME_TYPE(base, s32, ms32);				\
> +	TEST_SAME_TYPE64(base, u64, mu64);				\
> +	TEST_SAME_TYPE64(base, s64, ms64);				\
> +} while (0)
> +
> +	TEST_TYPE_SETS(u8,   true, false, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u16, false,  true, false, false, false, false, false, false);
> +	TEST_TYPE_SETS(u32, false, false,  true, false, false, false, false, false);
> +	TEST_TYPE_SETS(s8,  false, false, false,  true, false, false, false, false);
> +	TEST_TYPE_SETS(s16, false, false, false, false,  true, false, false, false);
> +	TEST_TYPE_SETS(s32, false, false, false, false, false,  true, false, false);
> +#if BITS_PER_LONG == 64
> +	TEST_TYPE_SETS(u64, false, false, false, false, false, false,  true, false);
> +	TEST_TYPE_SETS(s64, false, false, false, false, false, false, false,  true);
> +#endif
> +
> +	/* Check for macro side-effects. */
> +	var = 4;
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, int));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(int, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +	KUNIT_EXPECT_TRUE(test, __same_type(var++, var++));
> +	KUNIT_EXPECT_EQ(test, var, 4);
> +
> +	kunit_info(test, "%d __same_type() tests finished\n", count);
> +
> +#undef TEST_TYPE_SETS
> +#undef TEST_SAME_TYPE64
> +#undef TEST_SAME_TYPE
> +}
> +
> +static void castable_to_type_test(struct kunit *test)
> +{
> +	int count = 0;
> +
> +#define TEST_CASTABLE_TO_TYPE(arg1, arg2, pass)	do {	\
> +	bool __pass = castable_to_type(arg1, arg2);		\
> +	KUNIT_EXPECT_EQ_MSG(test, __pass, pass,			\
> +		"expected castable_to_type(" #arg1 ", " #arg2 ") to%s pass\n",\
> +		pass ? "" : " not");				\
> +	count++;						\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE(16, u8, true);
> +	TEST_CASTABLE_TO_TYPE(16, u16, true);
> +	TEST_CASTABLE_TO_TYPE(16, u32, true);
> +	TEST_CASTABLE_TO_TYPE(16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(16, s32, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s8, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s16, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s32, true);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE(16, u64, true);
> +	TEST_CASTABLE_TO_TYPE(-16, s64, true);
> +#endif
> +
> +#define TEST_CASTABLE_TO_TYPE_VAR(width)	do {				\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expressions that fit types. */				\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(s ## width), s ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(u ## width), s ## width ## var, true);	\
> +	/* Constant expressions that do not fit types. */			\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_max(u ## width), s ## width ## var, false);	\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(type_min(s ## width), u ## width ## var, false);	\
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(s ## width ## var, u ## width, false);		\
> +	TEST_CASTABLE_TO_TYPE(u ## width ## var, s ## width, false);		\
> +} while (0)
> +
> +#define TEST_CASTABLE_TO_TYPE_RANGE(width)	do {				\
> +	unsigned long big = U ## width ## _MAX;					\
> +	signed long small = S ## width ## _MIN;					\
> +	u ## width u ## width ## var = 0;					\
> +	s ## width s ## width ## var = 0;					\
> +										\
> +	/* Constant expression in range. */					\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(U ## width ## _MAX, u ## width ## var, true);	\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width, true);		\
> +	TEST_CASTABLE_TO_TYPE(S ## width ## _MIN, s ## width ## var, true);	\
> +	/* Constant expression out of range. */					\
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((unsigned long)U ## width ## _MAX + 1, u ## width ## var, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width, false); \
> +	TEST_CASTABLE_TO_TYPE((signed long)S ## width ## _MIN - 1, s ## width ## var, false); \
> +	/* Non-constant expression with mismatched type. */			\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width, false);				\
> +	TEST_CASTABLE_TO_TYPE(big, u ## width ## var, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width, false);			\
> +	TEST_CASTABLE_TO_TYPE(small, s ## width ## var, false);			\
> +} while (0)
> +
> +	TEST_CASTABLE_TO_TYPE_VAR(8);
> +	TEST_CASTABLE_TO_TYPE_VAR(16);
> +	TEST_CASTABLE_TO_TYPE_VAR(32);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_VAR(64);
> +#endif
> +
> +	TEST_CASTABLE_TO_TYPE_RANGE(8);
> +	TEST_CASTABLE_TO_TYPE_RANGE(16);
> +#if BITS_PER_LONG == 64
> +	TEST_CASTABLE_TO_TYPE_RANGE(32);
> +#endif
> +	kunit_info(test, "%d castable_to_type() tests finished\n", count);
> +
> +#undef TEST_CASTABLE_TO_TYPE_RANGE
> +#undef TEST_CASTABLE_TO_TYPE_VAR
> +#undef TEST_CASTABLE_TO_TYPE
> +}
> +
>   static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(u8_u8__u8_overflow_test),
>   	KUNIT_CASE(s8_s8__s8_overflow_test),
> @@ -730,6 +1113,9 @@ static struct kunit_case overflow_test_cases[] = {
>   	KUNIT_CASE(shift_nonsense_test),
>   	KUNIT_CASE(overflow_allocation_test),
>   	KUNIT_CASE(overflow_size_helpers_test),
> +	KUNIT_CASE(overflows_type_test),
> +	KUNIT_CASE(same_type_test),
> +	KUNIT_CASE(castable_to_type_test),
>   	{}
>   };
>   
