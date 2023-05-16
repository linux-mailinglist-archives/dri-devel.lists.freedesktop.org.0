Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B361705A66
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE3610E377;
	Tue, 16 May 2023 22:06:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD6010E373;
 Tue, 16 May 2023 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684274782; x=1715810782;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CClGAJcUJDIcxMOG+w8cqwuIucgxv2Ttqd2nV2Muk70=;
 b=M4Qv5VJCOjuqXAaCuHkTnRbU1NtyWeTecIzPlHS5xQidkoaEmnM9EdIW
 3W1GTEsIxJ1zqbKMDwiuKzy1NahOhtB8bCHqnQxEarwhZXH4TLVZkBwye
 Fig7S5j6hAWM8fUtZE5jRNa3QgCqXeiSG5uRcn0oDulNTYgT/K/jyYC+V
 5YhDCctPkA8m+WqF1zYL419HyVnlIsB9DotxInrGGaH+HMqwDSM3XBe8M
 gKJlaHBJnX8OCmmRD07EB5TQf7/KddyxcJOyO85gLF+7KP0sx4/1+ja13
 pkw5ciPwdFsathygG3+K2ie6CJ2nOnvmeKS5VTVRS+DpAVw2GbIV7lvcF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331965108"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="331965108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="704569705"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="704569705"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 16 May 2023 15:06:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 15:06:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 15:06:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 15:06:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 15:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0GNqK5J4AFBQUoWbc6mzezeuDqnI5WZdTCU8dd7JEsqFcJgj3l1EpNyQRGv7LBR7IS+4SivnDmqghpDAtjTkR4d/zjKk20wsoHwLOSl988FoUTOrN1DIpk7XegI0p9bf8pMDhcCaIYC5YN/hVb2YPd0iQk4GyL+4V1DiUBm911U28bfyQuQaDl/w8qsa8QqJR6GXBkc51Ioc5CvuRGKHXKxElgMTRhJGQX4Q0BoOUFfSh7bDOVcICvPglduQfVKYpDj/hfPl5j10qyQPvHonda+7XKOQJwzgBJvR68xPOmMVRnqBhNwSUBV2aORLsJXEjbXEP4U7qk/7VgnZEEx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyI8BTaNGCaMrfGPWsg3i8D9Up4G2aXhNP1n0HXrcME=;
 b=iAh5EUC7Eiro+smZPcQtBMmxys3jEKqZ3Zx/tLAFSB3QQVW5ylTlTPVVw7Ee0MJqjM6pHNYPD3I56syOX0jFD12WlmeIzASMkJGLa8dSlxjksLcSg+gxcZDH5iQn8Vyw1NuPerkDiHLbBi9toaV9FjCEEPKF4v/HDFc4lmAxGKaIVdtPLQp0XhT6TTam67hpsbsXj0hXLihWCx1/bsQQHw5fBgV/xt7FClWC8KtjapC8Kj6G29gRCpzZ1QbSOSqL0Cw3Yj0gqXPzexjJUPrSoKv7PmB1S+VcaG9Rjfv5Ny+y/JzXW8vJAMMLMhmoePUFaRxk3a67nMERpZdasNEd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 22:06:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 22:06:06 +0000
Message-ID: <ddd088bb-4827-8281-a073-6ac6ae547164@intel.com>
Date: Tue, 16 May 2023 15:06:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915: Dump error capture to kernel
 log
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
 <20230418181744.3251240-2-John.C.Harrison@Intel.com>
 <696ba7f2-4353-e154-af0b-83604dda2546@intel.com>
 <61e0ef39-308b-7384-d5db-8cad2a152729@intel.com>
 <ZGPs/HyLdNVBh/At@rdvivi-mobl4>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZGPs/HyLdNVBh/At@rdvivi-mobl4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 581eea08-dfef-4cc1-6028-08db5659bf1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfSDPESp9NaedKA5+OgRpgys14aiM+OVeizV+VefMkCtPrHRgn5sGwxJ6wtyXscqTS2pN7hD47x8cEUGj9hLs/wlOpbTJdnRYUJ432lplXb8VrHZxd/htwEIB0YUeXbFhs0qbDEwpteBIl15yDy3ceRL7vGkPhov924Jg5LluRiPLu4GIMoMGY0bmCk7eqhvWTJvg8cIJNvCecJIAXFk9FXb2Hk35pxrMg/5PxK3breo+iXWvH6PIAHtFNNw4F7C6mr0V7q1R2lP9HsL+WKjrKsXft6z2I7TDwCS8J6lFxJZv9lPY0p+qup8BVSBfOvVsBaflYPeMwZKeLP4xCXvRQA5j3B5TrEOCP+J9DU+wyNWM7nwnLYBJYg+oyI08YJ80rq5d1/j5EuqQJAHkDrhUyTQS3EgsHzkm48qgY6tUOp9SnJOOUQAvjAMgqnF8X1xIW9n9pCqvbuFJ++ykslEt1RbnN/Fhg+Y6dljAr2sjxxfZURjuxT+njfDybebf8nx9O6WtAWq1kc4H1WPrFfFjNQhD0BLFcsVgPBojA5grHDn2+Plxi4Xz3j5oSctw5ouGs1NcTuDNeqm1bc/o/xAcOzcUKRL+/vKKo3wJqjwQnbk8fFNxWDHrD+6r0tzQSGJ+NLVj94A9GTMLo1K9ibXcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(478600001)(6512007)(186003)(53546011)(26005)(6506007)(86362001)(6666004)(66556008)(4326008)(82960400001)(6916009)(83380400001)(66476007)(66946007)(41300700001)(31686004)(2616005)(6486002)(5660300002)(316002)(8936002)(8676002)(2906002)(38100700002)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1loZmkrdDNWc0dXTG83WXBxeEpuQ04yUmtXSENXSjBXUVowdEJhbFM1alU4?=
 =?utf-8?B?VDZuTndiK25YRVNWT0d4N2s1bWpndVdiMHhEYVRNZm55ck4yRnAzeHNLQmlY?=
 =?utf-8?B?YkFqYmpUTUFlWnU3OHhuOS9VcU0yMHgwcFl2UTVOcnZEY1FTdjJKRngzSTdS?=
 =?utf-8?B?eDI5aklYRWQ0ZDRkdTBlN2RXcVMvV0hxTkRiaXh4elVkbVlNeDBmM2JSK2Vz?=
 =?utf-8?B?ZW1salBmMjFldHFKMGNQb0xLUmw0WTIwcytzSWxFdTcrZ3NnVVY3UWE1UDB5?=
 =?utf-8?B?VDFSMDdCc3E0Q1F3REYvQ1RGdU5uUWh2VTZFZ3pMdEQrM0xuZUswRlFpbG9u?=
 =?utf-8?B?Ym8wK0JlUG9TbzJlTXdkdTg5alVPMmFrZnZJUkI3elh0VWZNdlpvN3ArSjNx?=
 =?utf-8?B?N1JiLzVzaUtxV3IzRTAyTEFtQnUrRThkRGdoWTUvVk1JcWFnRWhVV3JqSEto?=
 =?utf-8?B?cmdkcmxtYVpVK0JvOUJoemY0eEZNT0tqMXRZUE5PZ3RWelN0Si9uQ05oMUVp?=
 =?utf-8?B?bDhEeXNIZmhKQ1lMV2dMS0xJQm80aGU2MU44cHRoN3pEVENhanZDSldTaUZK?=
 =?utf-8?B?MkIremVPM1NuT1A0MlA0YWk4aTV1OXN0UXVCUXFmVE8vdGVjcWRkSUJEVW9D?=
 =?utf-8?B?bWcxczdNMUxFTFNoQ0xuTmNFem9tNkk3Z2x1ak5jUER1emw2VTBuUXdFU0hQ?=
 =?utf-8?B?bnNRVFJiK3l5MnR0QjFvV1BXRk0vZCtsRnhQbVhkNFlFVkFULy9EdThCalNh?=
 =?utf-8?B?N281eGpxUzI3RVN5ZjJtbUtnWW4xUlNnQS83NTZIVlQzOFdlQ3FDeVBMNFRj?=
 =?utf-8?B?TW5yYlVlYjlPU2FjRVBEcnVSYXN1ZUtmaWR5NnVDQVlySFhvdWhWb0JNVjNJ?=
 =?utf-8?B?b0R3QVVzcndVZlVxMitGTWNiRmVwcUNIWFpzZjFManVCRTR3NGxYZHhsWFJ2?=
 =?utf-8?B?WTQxT2k1VHIvSldyKzcyUmM3cjA3YmFPNGo4U2plRkNmbGtkaEc5REtiV3Z5?=
 =?utf-8?B?QUlSVVBQM095c291N1Q1UzhodzNEdmhrVkpjOFF5WXBOUmRkMkQ3dkpEYURn?=
 =?utf-8?B?cXdQcUJkd0JTcTUyLytFb2FaRG1yRXQ1WU5mQzVrWUJnTUxEQmxvamI5Wkkw?=
 =?utf-8?B?d2Z0UE9NdGZiNGVWMHVvK2ZXb0Z5YTNCc1E4ZHZ4TG0ycnpRdElRZDF2N1Q4?=
 =?utf-8?B?MVE1UWFzYTIvcXJSWUZzRStBWTVJbjFZRVlGWUtnUVRkQ1YwbUN0UGJxWnFs?=
 =?utf-8?B?L0FMamw1c2Fyd1NpM2kxVnhrYklCNnUvWDZBSWpkeVlYMXBYS0YyclovbHll?=
 =?utf-8?B?blo3U3BpcmhrTUR4a1RzR3N2NGpIdGNGY2R3cXpnUFNsZjRRQVR3L3V6clZa?=
 =?utf-8?B?Yjg0M2N5L1c5cjFBYzBQam8rUUFuSHhHTGVVaWdmRVBQeW5rbXNpTFlqdEFM?=
 =?utf-8?B?K3g0MThlUWJ6QlJqQmRLV0M0OSsyT2dGZWMrTVp5Mk9yakdUTGd2QTVSU3dU?=
 =?utf-8?B?MGZMMGEyL0ZNT1pqOVhORmU3d013TDV2R0JBZjVNV3ZnQ1YzWjh0TlpMU24v?=
 =?utf-8?B?Tng0ZEhmQ2Uwd3VyQWpqYVNMMWpnWkcwdXdEcDM3dU01NHRONEFKTkpaRk1s?=
 =?utf-8?B?dDVYYnJLQTRTOEgxbnRRaS9tK0ovMy95dEhXOG9LR0VNWjJnYzg1cE5yQ2NX?=
 =?utf-8?B?emxoSU00bnZISndPNVk1b3U0MEpBZ0F5cGdLaWREMEVCRlBCeWRhUllmeDFm?=
 =?utf-8?B?VjNmN2p2b3RTS04vZmJZaDhWMTFZRyt4bVpBVU40UVJRS1BnMzZaNitESDdC?=
 =?utf-8?B?RVZHNFRpK2c0Qnc1M01UV2pCUlFXZ3N2aDNjRHBRdm51NHFqYkl4ei9VdVI3?=
 =?utf-8?B?WHMrRTBhZmRPWk9ZK1UyUTJiemsvVjZqOW1qeVhRc2F1SW4rS0Rjd1FYdVFv?=
 =?utf-8?B?MHdMSHVKTlVNYmZROVNsaldqUkdwODB5Y2Y3Mmx0V2trRmxlTnRDWHEvRGl4?=
 =?utf-8?B?MERUazZKN0pSNWkwZEhtL3ZDWXRPcW9nWWlVYTVtQk1ZTmVVaHJEVnM4RTho?=
 =?utf-8?B?TFhrL2dkUFhqd3BCWjcvcE1YVENHWkFCNnVIQ0FFQWNnV2ZWVmVuLzhIUkhn?=
 =?utf-8?B?S3RFQzdZOVhPK3Z4Umh1cjBreVF1WEZKQTFiTVR1OEhZY3NzRVZSYm5GOU53?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 581eea08-dfef-4cc1-6028-08db5659bf1c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 22:06:06.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ71vwGcLDUJJ+4YLpXwEeHst+YBzN9MLTwY1AN/EJKWPO34l3sEkdTzL056FgoNOxxtQw4+6MYfOgW7xYMQhfNZci8a1ZDFWjsZZS8mydk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/2023 13:52, Rodrigo Vivi wrote:
> On Tue, May 16, 2023 at 12:21:05PM -0700, John Harrison wrote:
>>     On 5/16/2023 12:17, Belgaumkar, Vinay wrote:
>>                                                                                  
>>     > On 4/18/2023 11:17 AM, [1]John.C.Harrison@Intel.com wrote:
>>                                                                                  
>>     >> From: John Harrison [2]<John.C.Harrison@Intel.com>
>>                                                                                  
>>     >> This is useful for getting debug information out in certain
>>     >> situations, such as failing kernel selftests and CI runs that don't
>>     >> log error captures. It is especially useful for things like retrieving
>>     >> GuC logs as GuC operation can't be tracked by adding printk or ftrace
>>     >> entries.
>>                                                                                  
>>     >> v2: Add CONFIG_DRM_I915_DEBUG_GEM wrapper (review feedback by Rodrigo).
> Thanks
>
>>                                                                                  
>>     > Do the CI sparse warnings hold water? With that looked at,
>>                                                                                  
>>     You mean this one totally fatal and absolutely must be fixed error?
>>                                                                                  
>>     Fast mode used, each commit won't be checked separately.
> You should never rely on this assumption. There are bisects and autobisects
> out there. Also every patch needs to be independently available for backport.
>
> So, if there's any issue it needs to be fix before we merge.
What assumption? That sparse claims failure even when there are no 
errors at all, just a notice about 'fast mode used'?  If there are 
errors, please point out where I can find them. AFAICT, the sparse email 
is actually saying the patch set is clean despite the fact it has a big 
red cross on it.

John.


>
>>                                                                                  
>>     Does anyone even know what that means or why it (apparently totally
>>     randomly) hits some patch sets and not others?
>>                                                                                  
>>     If you mean the checkpatch warnings. One is about not reporting out of
>>     memory errors (because you are supposed to return -ENOMEM and let the user
>>     handle it instead), but that doesn't apply for an internal kernel only
>>     thing which is already just a debug print. The other is about macro
>>     argument re-use, which is not an issue in this case and not worth
>>     re-writing the code to avoid.
>>                                                                                  
>>     John.
>>                                                                                  
>>     > LGTM,
>>                                                                                  
>>     > Reviewed-by: Vinay Belgaumkar [3]<vinay.belgaumkar@intel.com>
>>                                                                                  
>>     >> Signed-off-by: John Harrison [4]<John.C.Harrison@Intel.com>
>>     >> ---
>>     >>   drivers/gpu/drm/i915/i915_gpu_error.c | 132
>>     >> ++++++++++++++++++++++++++
>>     >>   drivers/gpu/drm/i915/i915_gpu_error.h |  10 ++
>>     >>   2 files changed, 142 insertions(+)
>>                                                                                  
>>     >> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
>>     >> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>     >> index f020c0086fbcd..03d62c250c465 100644
>>     >> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>     >> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>     >> @@ -2219,3 +2219,135 @@ void i915_disable_error_state(struct
>>     >> drm_i915_private *i915, int err)
>>     >>           i915->gpu_error.first_error = ERR_PTR(err);
>>     >>       spin_unlock_irq(&i915->gpu_error.lock);
>>     >>   }
>>     >> +
>>     >> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>     >> +void intel_klog_error_capture(struct intel_gt *gt,
>>     >> +                  intel_engine_mask_t engine_mask)
>>     >> +{
>>     >> +    static int g_count;
>>     >> +    struct drm_i915_private *i915 = gt->i915;
>>     >> +    struct i915_gpu_coredump *error;
>>     >> +    intel_wakeref_t wakeref;
>>     >> +    size_t buf_size = PAGE_SIZE * 128;
>>     >> +    size_t pos_err;
>>     >> +    char *buf, *ptr, *next;
>>     >> +    int l_count = g_count++;
>>     >> +    int line = 0;
>>     >> +
>>     >> +    /* Can't allocate memory during a reset */
>>     >> +    if (test_bit(I915_RESET_BACKOFF, &gt->reset.flags)) {
>>     >> +        drm_err(&gt->i915->drm, "[Capture/%d.%d] Inside GT reset,
>>     >> skipping error capture :(\n",
>>     >> +            l_count, line++);
>>     >> +        return;
>>     >> +    }
>>     >> +
>>     >> +    error = READ_ONCE(i915->gpu_error.first_error);
>>     >> +    if (error) {
>>     >> +        drm_err(&i915->drm, "[Capture/%d.%d] Clearing existing error
>>     >> capture first...\n",
>>     >> +            l_count, line++);
>>     >> +        i915_reset_error_state(i915);
>>     >> +    }
>>     >> +
>>     >> +    with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>>     >> +        error = i915_gpu_coredump(gt, engine_mask,
>>     >> CORE_DUMP_FLAG_NONE);
>>     >> +
>>     >> +    if (IS_ERR(error)) {
>>     >> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to capture error
>>     >> capture: %ld!\n",
>>     >> +            l_count, line++, PTR_ERR(error));
>>     >> +        return;
>>     >> +    }
>>     >> +
>>     >> +    buf = kvmalloc(buf_size, GFP_KERNEL);
>>     >> +    if (!buf) {
>>     >> +        drm_err(&i915->drm, "[Capture/%d.%d] Failed to allocate buffer
>>     >> for error capture!\n",
>>     >> +            l_count, line++);
>>     >> +        i915_gpu_coredump_put(error);
>>     >> +        return;
>>     >> +    }
>>     >> +
>>     >> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumping i915 error capture
>>     >> for %ps...\n",
>>     >> +         l_count, line++, __builtin_return_address(0));
>>     >> +
>>     >> +    /* Largest string length safe to print via dmesg */
>>     >> +#    define MAX_CHUNK    800
>>     >> +
>>     >> +    pos_err = 0;
>>     >> +    while (1) {
>>     >> +        ssize_t got = i915_gpu_coredump_copy_to_buffer(error, buf,
>>     >> pos_err, buf_size - 1);
>>     >> +
>>     >> +        if (got <= 0)
>>     >> +            break;
>>     >> +
>>     >> +        buf[got] = 0;
>>     >> +        pos_err += got;
>>     >> +
>>     >> +        ptr = buf;
>>     >> +        while (got > 0) {
>>     >> +            size_t count;
>>     >> +            char tag[2];
>>     >> +
>>     >> +            next = strnchr(ptr, got, '\n');
>>     >> +            if (next) {
>>     >> +                count = next - ptr;
>>     >> +                *next = 0;
>>     >> +                tag[0] = '>';
>>     >> +                tag[1] = '<';
>>     >> +            } else {
>>     >> +                count = got;
>>     >> +                tag[0] = '}';
>>     >> +                tag[1] = '{';
>>     >> +            }
>>     >> +
>>     >> +            if (count > MAX_CHUNK) {
>>     >> +                size_t pos;
>>     >> +                char *ptr2 = ptr;
>>     >> +
>>     >> +                for (pos = MAX_CHUNK; pos < count; pos += MAX_CHUNK) {
>>     >> +                    char chr = ptr[pos];
>>     >> +
>>     >> +                    ptr[pos] = 0;
>>     >> +                    drm_info(&i915->drm, "[Capture/%d.%d] }%s{\n",
>>     >> +                         l_count, line++, ptr2);
>>     >> +                    ptr[pos] = chr;
>>     >> +                    ptr2 = ptr + pos;
>>     >> +
>>     >> +                    /*
>>     >> +                     * If spewing large amounts of data via a serial
>>     >> console,
>>     >> +                     * this can be a very slow process. So be friendly
>>     >> and try
>>     >> +                     * not to cause 'softlockup on CPU' problems.
>>     >> +                     */
>>     >> +                    cond_resched();
>>     >> +                }
>>     >> +
>>     >> +                if (ptr2 < (ptr + count))
>>     >> +                    drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
>>     >> +                         l_count, line++, tag[0], ptr2, tag[1]);
>>     >> +                else if (tag[0] == '>')
>>     >> +                    drm_info(&i915->drm, "[Capture/%d.%d] ><\n",
>>     >> +                         l_count, line++);
>>     >> +            } else {
>>     >> +                drm_info(&i915->drm, "[Capture/%d.%d] %c%s%c\n",
>>     >> +                     l_count, line++, tag[0], ptr, tag[1]);
>>     >> +            }
>>     >> +
>>     >> +            ptr = next;
>>     >> +            got -= count;
>>     >> +            if (next) {
>>     >> +                ptr++;
>>     >> +                got--;
>>     >> +            }
>>     >> +
>>     >> +            /* As above. */
>>     >> +            cond_resched();
>>     >> +        }
>>     >> +
>>     >> +        if (got)
>>     >> +            drm_info(&i915->drm, "[Capture/%d.%d] Got %zd bytes
>>     >> remaining!\n",
>>     >> +                 l_count, line++, got);
>>     >> +    }
>>     >> +
>>     >> +    kvfree(buf);
>>     >> +
>>     >> +    drm_info(&i915->drm, "[Capture/%d.%d] Dumped %zd bytes\n",
>>     >> l_count, line++, pos_err);
>>     >> +}
>>     >> +#endif
>>     >> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h
>>     >> b/drivers/gpu/drm/i915/i915_gpu_error.h
>>     >> index a91932cc65317..a78c061ce26fb 100644
>>     >> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>>     >> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>>     >> @@ -258,6 +258,16 @@ static inline u32 i915_reset_engine_count(struct
>>     >> i915_gpu_error *error,
>>     >>   #define CORE_DUMP_FLAG_NONE           0x0
>>     >>   #define CORE_DUMP_FLAG_IS_GUC_CAPTURE BIT(0)
>>     >>   +#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) &&
>>     >> IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>     >> +void intel_klog_error_capture(struct intel_gt *gt,
>>     >> +                  intel_engine_mask_t engine_mask);
>>     >> +#else
>>     >> +static inline void intel_klog_error_capture(struct intel_gt *gt,
>>     >> +                        intel_engine_mask_t engine_mask)
>>     >> +{
>>     >> +}
>>     >> +#endif
>>     >> +
>>     >>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>>     >>     __printf(2, 3)
>>
>> References
>>
>>     Visible links
>>     1. mailto:John.C.Harrison@intel.com
>>     2. mailto:John.C.Harrison@intel.com
>>     3. mailto:vinay.belgaumkar@intel.com
>>     4. mailto:John.C.Harrison@intel.com

