Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A182A1FC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EC810E65D;
	Wed, 10 Jan 2024 20:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040FC10E5FB;
 Wed, 10 Jan 2024 20:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5/6xWNsT4T2Pk5uUm1WR4Xq1Dl6MezHtCcPwyZ9ynjJWN8rNcTG3+YbP/9QpYNuB/gLwo3fAMm5PQKKihE2bWrBKnsuhgj4UPZZ2SBKma56NZS0S6wwdcC4nmtTrsAYiM4yduCCBTJFQ/PIQ9uKU5iIHxg3IXPxHC3eNBMpeMdKvoAxB4Tgga9aEVdDjvcJOZOugkloMT1x0gZiB/OQFD3xkZoYUd/5zIj310+8yka+yFLVdsHQChIv0wncThVJo1YKTAzsJpVQfYlp1zbL1obi3pRv2h6vk9WIw4xjAbHADT9p4Ac27/p6U89s3CMKNudzuImm0jy37XJaVq3M1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjDHNYmZcHrRdcdI64glDEFIT2N+B2pMGxQ07FBZ5qY=;
 b=FY//tczqSBGy122WLKCsQxWq+4DCFOgP7+SpsmDcmSrgmFf0/AeA0EXyl7eLbuBUnkDr5Fx2oo1tU1un476DfHNh2awvxC5vN5K18074m0HdfCRtV+VOgCdQUfnV0PcAxqUFfTiKBjiR8h0otzndH/Q7ZGh3zjiY8/xtA8YxxfjMj+BROpGKTJBPT87CU0wJvP4HBmjlbU3keMc0dYPGRlnVItqMMDamPl+kVezPeE9Rqaw1tszLYqTEMrAqNJ1Cs36pNwebuYElj/UDmyZh7EJZk3geA4iqXtqPuMLY+9XxnTtKkQuUsfqfCKqFP12MBYv9yXBOQcDVoq2/Mwcx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjDHNYmZcHrRdcdI64glDEFIT2N+B2pMGxQ07FBZ5qY=;
 b=1d4ydjthWcPgXWcZhZdN+qL8Db8zc7jvX7ioWPifjfH7mp01BPr8qkipNHNmZKONoA2LqomNyRDRqI8AOFr1mWd1c+kSXeDk2gdK7pIZ5LYKVtUiQQAkCnpF8F6nozU58ZdKPbwHdsYuxTBNDaQEj6JKMhi1KpxCn8iqxTZuEK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Wed, 10 Jan 2024 20:17:43 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:17:43 +0000
Message-ID: <c69e2b2e-2b28-4174-9293-5b6ad6e66776@amd.com>
Date: Wed, 10 Jan 2024 15:17:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm: Add CONFIG_DRM_WERROR
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <0daf415493377f0a06970dba9247ebbbdfb79220.1704908087.git.jani.nikula@intel.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <0daf415493377f0a06970dba9247ebbbdfb79220.1704908087.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::19) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c59cff-0571-4a5b-9fb5-08dc121933d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37Gn/y2beNqgBrqGwg1e9iO5Nln3RPASp57hjO75uKGPiXUhby981NzzMjEkpChrgl9efiOG/dSdLasRte2C7CtVEyaA9IHTVIQEaukBWCxqrIui46FYGLRErwJ91Ku6n73YcRCHBGy9DYwIk+MUtwEq/XVOPJqOxJ+erBX6uiyhWSwXJhN9iqMj2ZmdgWQGHBLVIWxbYrhmIo++8nq2ep40jaDeAVs6TEA2sbYA0nw8H3qGypBylJ7kP+DHtqjGYU5fCjVxTNEftsyZGg7+QbmkUzjAnY3EuO9kIThz70VVPspFtoU/M/yguyMfS4OW4uW+TWHDwZrW9+9daL8JJRbeaMNAdItH+3hVMT5mSUFofEuZOwOe6tSsB3HKTLtlIsMleVW5fVAqtMX3lXbS772kQoaiSilrF+2wt9KjTwtDFyWNAyhGwtxuw7FcptfA96qfk5yx7omHPNOSoJF6BAJ37WVgpcpXPZ0z3ULH1am/re1E62GESc8Es/tM7fWp4YwGIU6/rF2x0nAhg5+CkCHjnIHuEgx4lCM3HgV24+i0kb4X+d7eJz4R24v0xEanC5WKLhFYow0LPiKsjpJR3UloOYKubpRZt0LwPVAYGg09ZHc/hQ839ZkFP55wK3APkrupCNdDoM6K5cQO22Xn6cEMR3M+fgG+OFaalexEEupm5teaTJDKDYTin1jOVpLl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(186009)(451199024)(36756003)(2906002)(31696002)(41300700001)(5660300002)(86362001)(83380400001)(66899024)(4326008)(8676002)(8936002)(44832011)(66946007)(66476007)(316002)(66556008)(38100700002)(6486002)(31686004)(6512007)(6506007)(478600001)(26005)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpKaDdIYkVYbGRlMWRjcDh1eVRtWlZIL0ovRzA4TFlUaHVOSnpxT1BhLzRV?=
 =?utf-8?B?UUErN2o5bjFWRjhLZGc5K042eDVwOTQ4QnpCRGZxVTdYbU9vSDN3emEzNHE1?=
 =?utf-8?B?SG52RFVLZk4wd1VTRDgzTHJEQ0c5aC83Q2RFczRNc3k1cXlpZVpVNzhYY2pV?=
 =?utf-8?B?NVhkSUJ0Ym1zVHY3emtGditJaVY3cnlYUTFUVXREQVNUWnlIUk5weGUzc1Rs?=
 =?utf-8?B?VE9yS1ZUaCszRmxmZExySTFKdS9kU213WnQvV2VPVUJsUDdBYU92dXdMSVkr?=
 =?utf-8?B?dmMzRVJRb0t5citEcDFOdWYvZXFMdWdTRjVTYWhKRVZPZkxyRUVabktLOWVO?=
 =?utf-8?B?M3Y2TzZ1Zkc1YmNuU3FMM3FGaTAyejU1T3B6cnFHVWJBczg3Y1E1ZUZBSG1H?=
 =?utf-8?B?clpyMXl4RXA2ZzNwdzJ5NlNUZjdCNFJEUnFTQnE0ZWx0dnc4ZWx5SmpkeHpV?=
 =?utf-8?B?VmdyZjk5RlNKdnNLL3dlbkUzMU1XcFR2VHlQQVRRRm1RcjUrOVFiV2RJbUFI?=
 =?utf-8?B?TlErZnFwQlpVTGtYY2EwQkFlR1hNdFV1ZVVMZ1E3TnhZOE1SM3FVa0hlbkRG?=
 =?utf-8?B?dDRkWDh5NmgzZWdXbDFjNVBmTlMwbWc4VjY1S0c1M0Q1U2w5ZWxaR210WEdD?=
 =?utf-8?B?T0hxZ2w0djRqWTN1SUFUU1ZsWXI5Tk5DTGY3TkhwcllRdVFnRi9DaFVjY1Y0?=
 =?utf-8?B?MkM0dkFwNEVDY2taWW9XVGozQWhkR2VhUjhvaFo0Ym9kZDNBNEh1WGh3VGhS?=
 =?utf-8?B?SHgrMnJyS2dlVXNuRS8yeFowRVRweWNIb2hzTUd6TGZJVTJNNFVJVk9GKzJa?=
 =?utf-8?B?UnlDalZITllqTXVnS0JjV3psNCttMWNUazgrZWRMUVNDT1JhUHpYUmNQdTZR?=
 =?utf-8?B?YVNiWWNBV3RzRi9CNTdQdFFqZkp6QlVMcGVwQ3VUdG12L1VhZEg4UmY3a1cz?=
 =?utf-8?B?ZmpPb3BIUndGMFRrUlJUaXQyOHhoaTNzWUJkTC9rUlpockNWbFVqMjhpUXpP?=
 =?utf-8?B?UHB1YjZoSEl0UDJ0ZG55OFEwbXREb1ZYR3dpaVIzVnZqTnhQc1V0QUlWamJu?=
 =?utf-8?B?Ylkyd09icWwvOWVUTldicyttYVlkYzgzRjVrdlBkQVI5eWE1TjYzZG0xaDkx?=
 =?utf-8?B?Wk93R1RSNmNqOUU0SElzTVlJNjZIVnFZSHNwSnVwZ1JDcGs2aFdlb1lhVXdT?=
 =?utf-8?B?VkIwMHIwL1VnSi9hczc3eVRuYWV5ZWNsTFB1aDBlcTNlU1YvNmxLdkIwcEw3?=
 =?utf-8?B?T0tCdG45dXgvMkMwc05TZDZkcno2aDJIVWxha2xMTFNzUkVtQTlIK2MzRFAz?=
 =?utf-8?B?blZVbDN3TnhvQ0F6OUU3MEFGRHVKa2RMRTZMR0Z0N3l1WmJsVlVYdnRnNDEr?=
 =?utf-8?B?OW9nVUNNZ1YrTkpaTnppUTFEVjQ3cGEwMUN6K0NyMlFleUdlTVdla1VsL2NC?=
 =?utf-8?B?elNsQWJZdjVMRFZteUk2RkJrNTRWcnY5NGpBSVdPWWpuVHk2dTREc1hSOFR0?=
 =?utf-8?B?SjJjc1RYdTJlU0FXdXRaZ3F1Q0hZQVJaeXljRVpiZzF4ZEorNTlRZ0tRZmxn?=
 =?utf-8?B?blo3Zmh3akJwS3NoWXFRNTZlQ2xrYlNOSHpyeXpXOGVic2R6cWNORTBON3FV?=
 =?utf-8?B?VlhVNTJLRUI0bEx1QUJEWVRKaE4wVmNFRVZMREJLSUl6MGhhWGFkbU02cm9B?=
 =?utf-8?B?ZUVpZVoydTdUVWxLMjlBNHBqY1dtUlFXQi81MkNvL1VVVHpKejN6a0lWanEy?=
 =?utf-8?B?UzBJM0RwLzVaUE5hTS8wOUhSSEVzcE8wdUlNZ0gzazZHVEp6SUR1OEZOZTBi?=
 =?utf-8?B?MU4ySFpDMEx3SUZJUFFCZ1gwZWtqczB3WXdsdkdHTU5tT3hndjR1MVRkZncy?=
 =?utf-8?B?Y3Jpd3MyV0g3TTd5YXhqMkdkdGdnOUJSMHVLMDlHaFlsVWNZZ2R3RkRMcFpl?=
 =?utf-8?B?YUJFaVl6b3ppdUtxTWoyUFd0eU05RUVuVndrdEVpdFJTZ1p1ME1nd2xLSkJ1?=
 =?utf-8?B?OGlCbHZNYmtXWHl2aFhaQzN3ZmNFRmtESGlQSjZIWUY2bklVblVkdGhLRUZp?=
 =?utf-8?B?ZzRJRjhxV0JrV0phUXRwN1hYRm1OS1UwODBmSnB5VmZmaTBhUTVRWFFodEdx?=
 =?utf-8?Q?rBuupfV6VTLIZ2J2tVYj+Ez7z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c59cff-0571-4a5b-9fb5-08dc121933d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:17:43.3753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pojv8ayEkCagx72e/AeAft/1O4HmwUIkiuG8yRpYD1RzhIOB8q4opIAl6H1IEBlyyssQd/HKrhOUxtfM7IzTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 12:39, Jani Nikula wrote:
> Add kconfig to enable -Werror subsystem wide. This is useful for
> development and CI to keep the subsystem warning free, while avoiding
> issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> hit.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

> ---
>   drivers/gpu/drm/Kconfig  | 18 ++++++++++++++++++
>   drivers/gpu/drm/Makefile |  3 +++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6ec33d36f3a4..36a00cba2540 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -414,3 +414,21 @@ config DRM_LIB_RANDOM
>   config DRM_PRIVACY_SCREEN
>   	bool
>   	default n
> +
> +config DRM_WERROR
> +	bool "Compile the drm subsystem with warnings as errors"
> +	# As this may inadvertently break the build, only allow the user
> +	# to shoot oneself in the foot iff they aim really hard
> +	depends on EXPERT
> +	# We use the dependency on !COMPILE_TEST to not be enabled in
> +	# allmodconfig or allyesconfig configurations
> +	depends on !COMPILE_TEST
> +	default n
> +	help
> +	  A kernel build should not cause any compiler warnings, and this
> +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> +
> +	  The drm subsystem enables more warnings than the kernel default, so
> +	  this config option is disabled by default.
> +
> +	  If in doubt, say N.
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 8b6be830f7c3..b7fd3e58b7af 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -32,6 +32,9 @@ subdir-ccflags-y += -Wno-sign-compare
>   endif
>   # --- end copy-paste
>   
> +# Enable -Werror in CI and development
> +subdir-ccflags-$(CONFIG_DRM_WERROR) += -Werror
> +
>   drm-y := \
>   	drm_aperture.o \
>   	drm_atomic.o \
-- 
Hamza

