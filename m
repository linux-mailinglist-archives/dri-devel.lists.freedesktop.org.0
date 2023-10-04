Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F647B8E9F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 23:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9767110E3BA;
	Wed,  4 Oct 2023 21:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1450A10E1B4;
 Wed,  4 Oct 2023 21:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696454498; x=1727990498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4svmrXFwaSVRavdddJdjf39vj0s4lY4eV7apj1ZMA8Y=;
 b=TyaVFZQ0iaOdxqY3+oWMqpmTsQRa5nJY8DAMeSWimcBCNo8Phg2R2ruW
 7pJWtHWoSW9cgLDqKG92UyTokePnGQ2CGPi3VJEszrymq8emVtUt7TiDu
 OyiwuCEvGrHtcdDYoAyviip/hLrOq41/3WnGmapfIe6YYaF0PAK1KZ2cP
 aAtb4H4Wrylk4bhG+W1zdKOr5QNOuljw9PVpFs3Tphr8W2wNlnFmxRzRs
 vOFUswQVJrj71poOWK/3Jp9WkjWAcAR05uHxSPHiZlZOHRfK/kLq8SB9y
 TErXCMCO+7UQcC2C8fBQUi5aLZ+1QXrxzyAmwPmcaB0+tdmdeq0fSvwfR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469581722"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="469581722"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 14:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875271560"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="875271560"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 14:21:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 14:21:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 14:21:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 14:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWkfZleT9a+Uzy6bIv/MmRDGfapPi7KgOuY0gsH7VEJNcoUKh5DB7Go2depMdSbp3ss+CDIYh82PaI+nn6BlyGV2+mjbrBUIajWRLdUZyDO4gcBsgRUeb8sn1rFX6S3pHT/KLaieJmunPmXKjuHRGBJ4dNE2e3oIJLqRsbaM24xDohndkZBNZVruo/I2Px7QE1BsJ07t96Kr1C5gQg8i/W9wahF+3z44b1m9Y3cIOTQmr4snetmlMwwNlKPiZ7JwASEhfqZCgEeNSDbhSCRsce9yISz1HRZk0gaASI7VN/1u/A10hJPYxhnFGQpgHTmgMHI1U7OVEHKeg23+nVieCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB1BE4OjgpH3za2mmkZ3o4RbIAeh4JW9UevreZWs0rE=;
 b=MFnf0RjnwFKIpfdoExl0eLzGohy6RcPhMDonoKuGLouPMqeEY4ugl7tpYx2uqbL38SERbPtl2QUy0JX8PdHVOC6MOsrflnI10cxhaAj3NkTL9YU/fYluPFUrB/L9KMc2uwyhVAxEfCU29feedg609wrZy8g/hrkD2XrHhf7Q+3ie+Ap1zM9ksq9aHFtzFG3b2k7RvlDCMGWpEQW/noDOkhEkarwQsTepIc6FcnZHRg6JF62wHpdbpRCaxkmEQqgCIvS8UL5n4MiJRYLSAyusB1w3cyqbH0WKLyosZDsqYMYnEXhsdB8yung+NtTWCk9XZq3bCBx0dIZVLkhy7RHc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Wed, 4 Oct
 2023 21:21:32 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 21:21:32 +0000
Message-ID: <79b976a6-0824-1e92-fd95-610a44bdbed4@intel.com>
Date: Wed, 4 Oct 2023 14:21:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
 <20231004200544.GE53570@mdroper-desk1.amr.corp.intel.com>
 <ZR3R+Hr5pv/YGeFu@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZR3R+Hr5pv/YGeFu@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:303:b4::35) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 9883188c-233b-4765-dcd0-08dbc51fe1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3OhcexPmXrUPpWwAJ8VLeOWrZLxpRyusG5vLtM8YGYzXs/UNIanla/oW1NfF9vQDUbVfoNDjO4L65+LHxRzwzoqH+w+miMN8Sm0gbZ9WuUm7dhllaIpi+jbyip4t3WVkYXtKqaBFu7qM+qKsaRs4YbhvMkdVcEE/HgLN9yWNm0aLVUY3GfO+lZFu2Khtu7NUTQzb6aMfdm1Mwo+94arQW951R0TcxA//rLTZxRfMbbqRGfaVBc6MCJooEB7qR1dM/fcqR9Smte/DNVdwddfUE2IU1QPzYmRjxriA8NJoPkiwlNy2ZVrl9P3JGW44V9RVZcV3AT6la7voW6Hloipd0rEaDY8d/yGKR1Hig/y0ncjiP2xlRoVyvAwf/mVnRRg5q+XPytUdh6oEqpuZupCLqlzsLJmZ7UgRPji8T/XHECUbhMiE7tSjPbbH0Vrmbcikuypta5ervB9I388FnGi125Yrp5zVMoItXL9z6Y6EitdJ+ebzR/8E1gGF77e96o5+tt4dBci8lWhqYQgIzA5Fad2kUkoRageMPcUD0Na18WHhrUNk4Y44oUBMueIaObsZQu+HfhyPRAXHNaa8Xr2MXpTvxi3sxOT70c3dxKVXi6skvw0YjG81IL6+Z85ZJIanqJ3i6CTtRMEhKC3F57buNqyB5ykDjn3SyejWk9hS4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(966005)(31686004)(6486002)(36756003)(6512007)(6666004)(31696002)(6506007)(86362001)(110136005)(478600001)(53546011)(82960400001)(66946007)(66476007)(54906003)(316002)(66556008)(6636002)(41300700001)(2616005)(38100700002)(26005)(8936002)(4326008)(8676002)(5660300002)(83380400001)(66899024)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTlLWUMrbFl2bnpoQjlYa2hTV1NmWERDMkNhUEZHM3liaTRIdnlSc1JKbEdz?=
 =?utf-8?B?b2duNUFNbGtDdC9jSU40S0x0RnBtOGlaVEJLeENocWt5bjJnQ01ES0lhTS81?=
 =?utf-8?B?dWFjWHBjQUVtNk1xQVpSbDg2TmtpelRubHpacTFDSFBwaHhNTE1MSkRkYndt?=
 =?utf-8?B?TnB0MVV6c29DUTRVWDBYbngzam5Za2kreUdQRExYeE9rR25EY1VRYThxK1lv?=
 =?utf-8?B?WXNWU0VzVFYxWTJjK1FWb1VOTC9sT2E0VkpzUlhzZ2dSMHFleGdjV1I5TFNr?=
 =?utf-8?B?MEhKRFAvM1pnUEh3ZjQzempOTjBuSHBMb2hXMURHUUE4N0p3bjgyOUhPNXho?=
 =?utf-8?B?T09tTHdNNzZEbnMybjJaYjBEdkw3Rm1hYXFBNWIrVWYxSGF0QXZJeTlVUnhu?=
 =?utf-8?B?bExUQXcwZWhUOXcrK1UrVkh6eHN5enMyd3FiZEFmb0QwQ2s3Y284Q0RZaFdT?=
 =?utf-8?B?WnhvZ254RFRSZ1pYK1RTelJleC9kbitBTGl6U1FoNTdrNWVSUENBTytsWXVw?=
 =?utf-8?B?eVduSEZLSUxudEJqUmtvWFJuYUV6cmhseVVmUjJXS0c0RGEreG1FdEJad0RM?=
 =?utf-8?B?ZFExSUJ5OW9lU1g2djFwV29NVTJQVmdoNzk4Q2pEY2pQcndvaTlkM0M5VVlI?=
 =?utf-8?B?YUNWRThQcnZMWDZYbEdUTDlEdWZyVDcxTTB5czBhREFaNUlPR0c1OW1RcUlS?=
 =?utf-8?B?Z1RudzZOS3NMK2svRzAxYmMvQWFyT0NyWVV2eUhZMUZDQzhpWGtHUDVvTFBm?=
 =?utf-8?B?SkFqS1NRN0J4V0RZVm9hNjlhajhFMEx0QmNzSGtHUHFSVEM0UXdZQ1Z5L05h?=
 =?utf-8?B?d0ZnNTV0ZkdOaGJVUDNFSCs1Q2s3NkRwYTRPUStMRE9tUzEwV0QrNzdYeGdO?=
 =?utf-8?B?SStQZ0p3YjBCbXFMVkpxYkhNVW5xbWtaWjhrMnhKWlVoZUdnTHNLa1JRb3Zq?=
 =?utf-8?B?MkNSYlVCb3ROUlJBZUU1eXFPOGdrTXdWVkZJWjlNS0xFL3lMMXBxaXU4VzRo?=
 =?utf-8?B?RFlJSmdrM3VzVWRDZThQWXNSYWF1VWpHSXJhNHIwaXRPYXdlQWFTd1V3SlEw?=
 =?utf-8?B?dFZTRDBCRVVndVROeDJOZWFZYUZvV05EMnRTN3Y2eFoyY2xIeUVWRVNNcUxH?=
 =?utf-8?B?UEF5WXpJMjRZTGZiNldIM2tNNThtZndhaGxwc2xVTTZsa3VPVXFkcVhMY1Fs?=
 =?utf-8?B?TXR0U2xkVjUyN0FlUm1VbVlzNjNhUG1EK0tOUVdnNEVYSjBzbkhXdENIL3NY?=
 =?utf-8?B?NEdoWXZrc1l1TlhTMitkc3pVaTdFb0dxUDVzSDByeVhsN3dPbHlaZEpSRXIv?=
 =?utf-8?B?TkMwOHFINWl1cmx0VWxJKzIvMFJGL3dBZUFFWHFlM2pJOGZCT1N3clVFaFUv?=
 =?utf-8?B?REZpSmgwMGEwcUhmUTlEYzRkbWpaWVZ4Z1g5dS8yTzhIV2Z3aHhNZW1VVEtj?=
 =?utf-8?B?M2dLc0NRbHcrcEVLVmJheUNvWEhwNHgrN2JEdXlxTHJoN2ZrSU4xYk03dHcv?=
 =?utf-8?B?QkZ6TjVldUxubXcxVEVRRkVaYTRsL2JwM0tGSFZmRlZxRlRsaDNkcGcvenYr?=
 =?utf-8?B?WXFORytGUUtTR2FqVU5DdGR1S0JhcDZFL0xjT1dueU1CckNvRHh0c2RRTU1v?=
 =?utf-8?B?Q1BpZ2s1NG9HMUE3eXBGbjFyejRLUElOcC9FTVErSWJFRERXQjVKckdxY3hU?=
 =?utf-8?B?L3NvandaZ3VWYnVQR2hTRktPNmtOQ2NxZjk3Q3E1S3AwYXQwUGYxM09UVit2?=
 =?utf-8?B?Tm5nZTBvYXlDS0NUSitBakxJNGIvUWFIb2dWRzR0SHFJa0xIT2tYMEdtdkVk?=
 =?utf-8?B?aFBxV1I1TzBlR0NsdHVmYXFMUVhGSURwV0RDbTZ5aUlWR2tUS2QydFA5cmkw?=
 =?utf-8?B?alNDa29CcEZNTlZERWt1THNvbGhGN0xJVGxob0M4bzZ5cmpqVlRXNEpOU0pj?=
 =?utf-8?B?NWd2cS9PUjFkdHdsVFN2Q3RYRWxsalFzOGMySFJpY2xoaXlUR2plMzkvSThl?=
 =?utf-8?B?MEUxSFZUVTl4aXFRY0dXSWFnM2FaV3FxaHNPS2Q5OGVhT2lzMkIrNDhQOTdv?=
 =?utf-8?B?WHN5b2RKZjM3Y2dqb28vM1dEU2ZSaTlBS0E5RUFwb1dXelV3bEVkeVhhNWdQ?=
 =?utf-8?B?TDZFVlM1ZThpaFlFd1ExTUtjSzJqWlcvcUxWTU54akRCZElaOHQ0dWJ5U3dF?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9883188c-233b-4765-dcd0-08dbc51fe1ba
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 21:21:32.6793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILJJVeJgJ0L/PW7359uuz4oO/xm74AZzZKSm8QNB993XNW3Jy26hXWzluemgYc3GLfLBe6kFHTC7duDYkcrk1+GFc2Usb11GzZ+fbWPN11w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, gregory.f.germano@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2023 13:58, Andi Shyti wrote:
> Hi Matt,
>
>>>>>>> The MCR steering semaphore is a shared lock entry between i915
>>>>>>> and various firmware components.
>>>>>>>
>>>>>>> Getting the lock might sinchronize on some shared resources.
>>>>>>> Sometimes though, it might happen that the firmware forgets to
>>>>>>> unlock causing unnecessary noise in the driver which keeps doing
>>>>>>> what was supposed to do, ignoring the problem.
>>>>>>>
>>>>>>> Do not consider this failure as an error, but just print a debug
>>>>>>> message stating that the MCR locking has been skipped.
>>>>>>>
>>>>>>> On the driver side we still have spinlocks that make sure that
>>>>>>> the access to the resources is serialized.
>>>>>>>
>>>>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
>>>>>>>     1 file changed, 2 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> index 326c2ed1d99b..51eb693df39b 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>>>>>> @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>>>>>>     	 * would indicate some hardware/firmware is misbehaving and not
>>>>>>>     	 * releasing it properly.
>>>>>>>     	 */
>>>>>>> -	if (err == -ETIMEDOUT) {
>>>>>>> -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
>>>>>>> -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
>>>>>>> -	}
>>>>>>> +	if (err == -ETIMEDOUT)
>>>>>>> +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
>>>>>>>     }
>>>>>>>     /**
>>>>>> Are we sure this does not warrant a level higher than dbg, such as
>>>>>> notice/warn?
>>>>> We might make it a warn, but this doesn't change much the economy
>>>>> of the driver as we will keep doing what we were supposed to do.
>>>>>
>>>>>> Because how can we be sure the two entities will not stomp on
>>>>>> each other toes if we failed to obtain lock?
>>>>> So far, in all the research I've done, no one looks like using
>>>>> MCR lock, but yet someone is stuck in it.
>>>> If someone has the lock then that someone thinks they are using it. Just
>>>> because you can't see what someone piece of IFWI is doing doesn't mean it
>>>> isn't doing it. And if it is a genuinely missing unlock then it needs to be
>>>> tracked down and fixed with an IFWI update otherwise the system is going to
>>>> be unstable from that point on.
>>> But I'm not changing here the behavior of the driver. The driver
>>> will keep doing what was doing before.
>>>
>>> Because this most probably won't be noticed by the user, then I
>>> don't see why it should shout out loud that the system is
>>> unusable when most probably it is.
>> That's like saying that any random race condition isn't likely to be
>> noticed by the user so it's not a big deal if we're missing a few
>> mutexes or spinlocks somewhere...even though there's likely to be no
>> user-visible impact to any race condition 99% of the time, it's the 1%
>> that winds up being absolutely catastrophic.
> Not really... normally if you hit a spinlock/mutex race
> condition, you end up in a deadlock and stall the system. In this
> case, I agree that the lock should be sorted out by the hardware,
> but in the meantime i915 is *already* ignoring it.
Um, "a deadlock and stall the system" is exactly what is happening here. 
To prevent a total hang, we are ignoring the deadlock and proceeding 
anyway. Essentially moving to the situation of having a critical section 
which is not protected by the mutex at all.  No matter how you phrase 
it, that is a critical section failure and you do not know how the 1% 
failure might manifest.

>
> I'm not making any behavioral change with this patch.
>
> What I'm trying to say is that if the system doesn't crash, then
> let it go... don't crash it on purpose just because there is a
> locking situation and we think it has a catastrophic effect, but
> in reality is not producing anything (like practically in our
> case, you can check the CI results[*]).
We are not going to 'crash it on purpose'. We are printing out an error 
message to say that an error has occurred. Which it has. And as above, 
just because you haven't noticed hitting a catastrophic race condition 
yet doesn't mean that it isn't there.

John.

>
> [*] https://patchwork.freedesktop.org/patch/560733/?series=124599&rev=1
>
>> If we're not obtaining the MCR lock as expected and are simply moving
>> forward to force our own steering (possibly at the same time firmware is
>> programming steering to a different value), you probably won't actually
>> see a problem either because the operations won't wind up interleaving
>> in a problematic order, or because the driver and the firmware both
>> happen to be trying to steer to the same instance (e.g., instance #0 is
>> a quite common target).  But even if they're hard to hit, the
>> possibility for a major problem is still there and basically we need to
>> consider the whole platform to be in an unknown, unstable state once
>> we've detected one of these issues.
>>
>> Based on some earlier experiments, it sounds like the problem at the
>> moment is that we've just been too hasty with deciding that the lock is
>> "stuck."  There's no formal guidance on what an appropriate timeout is,
>> but Jonathan's patch to increase the timeout by 10x (from 100ms to 1s)
>> should hopefully take care of those cases and prevent us from causing
>> any unprotected races.
> Unfortunately it doesn't. Here[**] you can see how the situation
> doesn't change in mtlp-8.
>
> [**] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_124576v2/index.html?
>
>> If we have any other problems where the lock is
>> truly stuck (as was seen after an S3 resume), that's a critical error
>> that needs to be escalated to whichever component is the culprit --- any
>> such system simply cannot be used safely.  Even if the KMD didn't notice
>> such stuck semaphores itself, one misbehaving firmware agent could still
>> block other firmware agents and cause major problems for the health of
>> the system.
> Agree... we are working with hardware guys to get down to the
> root cause. We knew already when we merged this patch[***] that
> this wouldn't fix the issue as the issue still lies underneath.
>
> [***] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")
>
>>> BTW, at my understanding this is not an IFWI problem. We checked
>>> with different version of IFWI and the issue is the same.
>> It may not be an IFWI _regression_, but unless we're contending with
>> ourselves (via different CPU threads, which I think we've already ruled
>> out through some ftrace experiments), then it does mean that something
>> in the IFWI is causing the lock to be held longer than expected.  That
>> may have always been the behavior since day 1 and we just didn't notice
>> until we got a relatively clean CI setup to start seeing these errors.
>>
>>> Besides we received reports also from systems that are not using
>>> IFWI at all.
>> What does this mean?  IFWI is just the generic term we use for the blob
>> we flash onto the system that bundles a bunch of different types of
>> firmware.  E.g., stuff like pcode firmware, csme, EFI GOP, etc.  If a
>> 3rd party is putting together a MTL device, they probably refer to their
>> firmware bundles with some term other than "IFWI" and may swap out some
>> of the specific components, but at the end of the day the system still
>> has the important low-level firmware running for things like pcode.
>>
>>>>>> (How can we be sure about
>>>>>> "forgot to unlock" vs "in prolonged active use"?
>>>>> There is a patch from Jonathan that is testing a different
>>>>> timeout.
>>>>>
>>>>>> Or if we can be sure, can
>>>>>> we force unlock and take the lock for the driver explicitly?)
>>>>> I sent a patch with this solution and Matt turned it down.
>>>> Presumably because both forcing a lock and ignoring a failed lock are Bad
>>>> Things to be doing!
>>>> Just because some entity out of our control isn't playing friendly doesn't
>>>> mean we can ignore the problem. The lock is there for a reason. If someone
>>>> else owns the lock then any steered access by i915 is potentially going to
>>>> be routed to the wrong register as the other entity re-directs the steering
>>>> behind out back. That is why there is an error message being printed.
>>>> Because things are quite possibly going to fail in some unknown manner.
>>> Yes, agree. This has been already discussed here[*] where I sent
>>> such RFC for the sole purpose of receiving some opinions and
>>> check how CI would behave.
>>>
>>> BTW, we are already doing this during the GT resume[**]... it's a
>>> bit of a different context, but it still forces the release of
>>> the lock.
>> That resume-time patch is only deemed safe because we got explicit
>> confirmation from the architects that it's not possible for any of the
>> external agents to truly be using the MCR lock at that point during
>> driver load and S3 resume.  It's still a serious bug in some firmware
>> component, but in that specific case it's one that we can fix up
>> ourselves without risk.  Any locking failures seen later on during
>> regular system use cannot be solves safely.
> Yes! Agree! :-)
>
> Thanks, Matt!
> Andi

