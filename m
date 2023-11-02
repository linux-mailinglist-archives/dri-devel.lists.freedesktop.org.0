Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B07DF82F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10FB10E949;
	Thu,  2 Nov 2023 16:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BA610E949;
 Thu,  2 Nov 2023 16:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX2EorICqkM2lO1fvTUDrwZsJ9zMG7dBWWxqKrrRFRfgI41ywzb/aZBGOL8cEtUHaj2FfKZGvG8HavumDetZi6eyHdUrq0UqCicKzHEDnHoSkEgYNiDICbqz8CWLUsz694jdr+UmDCF5SgaMN7MYeD1BCdaUwaCqMYGK4bJSOIsOSnFu3vAFh8/FBknK//ekKHFP4Fh1xl2V69ID3Hxdhs9IrKkGG9+Qz6L9BljBqhH9snnsc+p5hx21rjQCFztgVXM0KCfivZangsNSlBGkd+eek//NTrjrTtrCqXb+U39FWII3mjhQ9Ao7AVtmdNnu4XLhfgtN8W9FKNdzRn2GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD7S+sfZmj42CFqYC41a51pGRDPG7phn0Q8eHe6ytXs=;
 b=DozvNkwBQm4beSUR4u7lHdqFrJQBDy0ou5EUMxAUQ18cvLg4hrkadUWEsDH2Dx8tS32L5XcR1lkmS/VGHuMRKGHES+Zm/MTK6hW3CjwbJQGKCcQe7amnnNEDagsTnq+BM337ReE9Oa5atrpBow5LqRAb7BjvYi9H1GhDvqBYJ1OQsGlDJlznpVVZQnFO2yqPyIHKpmZfGcVWKl1cr1eBwroGYhiu6FS1sP/oFGG1vM03WGbWjq2hZ2tmbsPxNlFApka/kOBGMAD1O7RTu6yAiUrFE2//Wtt8+k/8Sq05nDgZ+Y6gTcroJCBYzKuA6gZQRVdQIzH4aExN+IUFysoYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD7S+sfZmj42CFqYC41a51pGRDPG7phn0Q8eHe6ytXs=;
 b=zGefxlRO0i/kddmqcOr26veQJBrwQ9nF5M6dOWomHPB1IEpmJyFAHgqeb8i1yBTRfES9HBAOyiV9aZvEJWXg2QSSEqKyARAMJEx8UMltZ9YaPkb1BmxHoz7LGZCnDmzy+jSNGysdqWPT/Ll+C+Tw3BrtBBVIIM1m7eArpq11KHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.21; Thu, 2 Nov 2023 16:59:04 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 16:59:04 +0000
Message-ID: <bb3b74c8-8ab5-472c-84c1-8aa0d8bfa3b8@amd.com>
Date: Thu, 2 Nov 2023 12:59:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Increase frame warning limit for clang
 in dml2
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::37) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 672653a2-1867-4998-3256-08dbdbc504dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKQI9KcDj/ma3TDTQBmPWvEB4aTuZwaXG3Ef0i1dexOX7/h0zzQ95plMJRlAYAb0nCDi6NedL84iXUyjj5FQtLjxBjeBG0qWda4LYQjVIGXOOA80qVGZ9G/2CHRshMY1Fs2mAgAaf+9OqKOS7IE1Cd9KSj4jxg7e1cC9N7OzUv5LDSiE0v9bWhtctEnTGmHNDqJHBeWJtM8Kz6O957HtEpJwPPKmc9sN7G23d9iNyLOQhAXVJUtAzfoyuGHcv5ESpTQuBcIGZzo/lXeTygNxy06zJdZjwoZRKtx+SsKsaZG15Cbk9/NoZcj84CrVsbxjlnXYiTIB2Xk0WTGSJOD1SpGDyRElbihMdqKetjgThoO7EiyBGBterYo+28AkQYmnOUkOsj1a+D9XtaTH1SMZDF2IiTPbCqKHdRDxsYZNuE8mgKAT/wlrI30/s5fiNLzE6J3KFcxbuLXRtOKMQswNq0ev0IWjME9ROHi7Ef41dDvkK3txdc1S1LpJCvUHN1uAHawIZDC4nEiaOFvLeZT9bq5YcIgAa8G/sT9MMTSL2nCoWtRn3EGK6JXNv/hn9S5IIMI2AIot8ZW9R/5whPobESnUAl0hjXETaE1gGcO+GNDgXi9v9uE3eu75dNYWmK5B3juZb7dhZEJ3PAF5rfIBzNY4wwH2Ae4ODRW5Y5SEiPCDqHjN+Zh03GrhHHpQ6ZvT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(1800799009)(186009)(6512007)(2616005)(26005)(478600001)(6486002)(8676002)(44832011)(36756003)(5660300002)(8936002)(4326008)(41300700001)(31696002)(2906002)(86362001)(66556008)(66476007)(66946007)(6636002)(316002)(53546011)(6506007)(6666004)(38100700002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXlUb2FOYzRQZUhCNlJBRUdYc1M0b2M1d3p3TU5UcVZqNHhtOEFtRmhrUlBI?=
 =?utf-8?B?Q2lGa05uY0lFdDBwSmZyN1k3bnl3L1o0dGhlc3VoVENIYUxsd0h1N1RDVjR6?=
 =?utf-8?B?ZWUvNzNqbFB3em1xN0dyV0dCUjZGNzVUdVJKdkcrYzZacEpCZitwbW05SHhX?=
 =?utf-8?B?cWN2RDJEdEg3UWRtZkJjY09FUEFvSU92L3BNWXFJODZXNVNjcFZzeHoxcE5k?=
 =?utf-8?B?c1BzV2YvSkgzVlh0M1pPRlVsNFJhVHhEV09LUHBVNUxVRUUvTVBBLzJwcUkx?=
 =?utf-8?B?TG1Vd09UZ1ZZMXlKd3lERWc3c3FZaDR5TTVzMWZKRjY1emlicHRTNzZnTWdU?=
 =?utf-8?B?QndqcytoVS9KMHo5WWxlWEtUYk1ycGJhYkFTdTlxZ0xveXB2TzNFZlVrTllK?=
 =?utf-8?B?bEdyZitGSDZxeS9GY3JCWG9KK1RxTmNQcFVJWW5sSWFDOVkzOTFyekJ1NXNL?=
 =?utf-8?B?TGwrSWtJd2hXR1pqZGFCU0k5bGp4MXl4Z2RiclQvRDBNWGw1YXlEcm0zdndY?=
 =?utf-8?B?NkVXaWlwR3gyb0doRjJRajFLL3VpclI2UzZibGRlYkF3RkFTWDVGSVg3K1Iw?=
 =?utf-8?B?bVMwUENDQTBQUTR5T05LMVRsT3N1VjFjNjlqVm92NEpXakpJbjZYWlE5alU1?=
 =?utf-8?B?eVFvQUN0WDZXQnRlK3p6KytTWnNscVhhYVh2WGplQkx6ZzlCOWFQTzQrWTZS?=
 =?utf-8?B?YmlxOVVxR2FCK0ptT0p5TkpBSE8yc1V1S2ppWS9mUm5FMVdnM1RRNVZEWTha?=
 =?utf-8?B?ZkVvN1hHcWRZR2hEVktITnI1LzNmWVUxcjZqejl0cUN4Wno0U1JGSytUdlZV?=
 =?utf-8?B?Y1dEekFaWEkzYlFqWG1meDIwMUh3ck1GRUJYdEFBR0l0Yy9DT0tpRGdRL1ln?=
 =?utf-8?B?MWUwOTJPLytKN0Y2dEwzWHVFSjJKZmkvRWYxY09kQkovQjNpU3FPdjBEUmlY?=
 =?utf-8?B?WWZuS1pybVBSVTVGcXYyOHVlLytaVmUwU2FVWS9HZUFmdU1ZZXg5UHE4bWEx?=
 =?utf-8?B?c1IwU044bXc0eWNZajQ5NzRaTVh4dUNsdGxyRjBXeFI1d2hac3lsVVpyM3VM?=
 =?utf-8?B?ZDdxZWV1NnRDMU4weHZTRE4wenkxclNXNGNsMDFMeW5vQ0o1aEJsQTE3QTFk?=
 =?utf-8?B?aWZhQkpoeS9ickVlSkpMcDJNdEUzTUpUaUlIYkpiNUpQcXB2NE5qeDlFYTJM?=
 =?utf-8?B?WHQwaUFYRVl5UmZldWZLWkhNdnZhbDZPNXpTRVFjeUVMSnVYRW5pL3NOdFJz?=
 =?utf-8?B?Y2hsYlI1R0lkRjVkdStKcFltdjVtbTFkeUk2WnZHWkFhWStreFBMMXErTHhW?=
 =?utf-8?B?U1loZHU0NjJqcDZzaTJtYWFJVUZXTFVuSlB0TjNLd1NtMk9uR25KZkFIcE4y?=
 =?utf-8?B?SnRESUpmdVN6Zk43dW82TXo0c0JZVFBGaTN0OFBISVREUXNJZllZVVEzQ3JC?=
 =?utf-8?B?cy9DMjZhWEQwcjBPK3pHN0J5K1B3VS9zY0FQOHdkb2hCOUxjK0p1Zk5tL1J6?=
 =?utf-8?B?Q21OTmQ3SVdObnVhTUh4SDdWM0p0dmVjRGVLT1FoMHRuUFhiUjIyNFZJdm9j?=
 =?utf-8?B?LzhKdjF5WGJoQlViMXlML3FiUlh1QkVOUm1mdFkyTWFndUU0U01Wd3RjRWxz?=
 =?utf-8?B?MldQUXNJYmYwSzd0bXRlY0crRkxpVXRONkR2UDF6UzBXUERnTU5yWTcyVTZJ?=
 =?utf-8?B?TCtKcmV5Q0IzenBLYVBuZHowWGdjdjA2dzhHWjl4KzNsZUhPUkJpelAzK3ZZ?=
 =?utf-8?B?a2w0NzR3Y3M3MUN1NlpNVjladUovWHF0Y3BCdlF5MkNFbUh6SU1yREl5Ni9X?=
 =?utf-8?B?V29jRFdjSytVLzlmMzhzb3YrSzJLUnR6d1Q5NHNkWFBabDd5VGV2SElqbkpX?=
 =?utf-8?B?U3VHUytad2ljZmZ1WEJlSUZDSEcyT0x4eEUrWmNROStXM3dDTGNBaGhOeVNR?=
 =?utf-8?B?cmxNRlViczNEK0t5eUduQzJtZ2ZNWm02NERTc2o4M1RyRDBPT3RjR04zYmZI?=
 =?utf-8?B?dzRFSXQwTExwRUU3Q3AwRHArR0tHd0FJQUF4bVJkMDlCT20rY1NGNVBPNUdN?=
 =?utf-8?B?aWVjTTB0TEFuZWdBbURua1l0V3k1bkZkVUhGcEptM3FDWGdvK2hLNWc1MWRB?=
 =?utf-8?Q?5K06H5xxN/SZS+D3mTYz4BFnS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672653a2-1867-4998-3256-08dbdbc504dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 16:59:04.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeMJVvxrkeM9SloUsnv8S2q7bTow6m/uYt5kG9XIF6Ns6M4RDUaXbDx1Sg0f5FNOKS4fYZPwP8x3zpbsIuFBww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/2/23 12:24, Nathan Chancellor wrote:
> When building ARCH=x86_64 allmodconfig with clang, which have sanitizers
> enabled, there is a warning about a large stack frame.
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
>     6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
>          |             ^
>    1 error generated.
> 
> Notably, GCC 13.2.0 does not do too much of a better job, as it is right
> at the current limit of 2048:
> 
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
>    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
>     6705 | }
>          | ^
> 
> In the past, these warnings have been avoided by reducing the number of
> parameters to various functions so that not as many arguments need to be
> passed on the stack. However, these patches take a good amount of effort
> to write despite being mechanical due to code structure and complexity
> and they are never carried forward to new generations of the code so
> that effort has to be expended every new hardware generation, which
> becomes harder to justify as time goes on.
> 
> There is some effort to improve clang's code generation but that may
> take some time between code review, shifting priorities, and release
> cycles. To avoid having a noticeable or lengthy breakage in
> all{mod,yes}config, which are easy testing targets that have -Werror
> enabled, increase the limit for clang by 50% so that cases of extremely
> poor code generation can still be caught while not breaking the majority
> of builds. When clang's code generation improves, the limit increase can
> be restricted to older clang versions.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> If there is another DRM pull before 6.7-rc1, it would be much
> appreciated if this could make that so that other trees are not
> potentially broken by this. If not, no worries, as it was my fault for
> not sending this sooner.
> ---
>   drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index 70ae5eba624e..dff8237c0999 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -60,7 +60,7 @@ endif
>   endif
>   
>   ifneq ($(CONFIG_FRAME_WARN),0)
> -frame_warn_flag := -Wframe-larger-than=2048
> +frame_warn_flag := -Wframe-larger-than=$(if $(CONFIG_CC_IS_CLANG),3072,2048)

I would prefer checking for `CONFIG_KASAN || CONFIG_KCSAN` instead
since the stack usage shouldn't change much if both of those are disabled.

>   endif
>   
>   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
> 
> ---
> base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93bd2d6a871
> 
> Best regards,
-- 
Hamza

