Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B76408B3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E3B10E0CD;
	Fri,  2 Dec 2022 14:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272310E07E;
 Fri,  2 Dec 2022 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669992417; x=1701528417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J6NK9143W//UX6m91oKvUTRc8AERrnCrpXh4JA1yIVE=;
 b=e+ygEQh2Ium9uCqFevNVOOfVarkx1hwB7h+gNnoRP0psYTObgqbSqU4u
 56uRJfkUIhdADl5c0Qbw9+Tfq7VoW82JNwYtP4cRa37WQogfRo4Cu1feD
 DI6jLNtQgGLAjRuzKpDYWFsOfRXSELmHqcJceziwWC5JhWaPHMdGyy2kZ
 rTBmpUZYJqaUpYapAtsR7DMLPWkdxeOlNvkSZXGXY77Cu/Rrkp48waqRQ
 fZ5jqrrrxV4J8ptIJEwpbzCGCJiNLVIXU0li7TmzVEeM7Bjl1FuL3HAVk
 mA+/gGZ02KHKiPGxEi1BKk0yEPZPr1QJpWMZmos/w+f0Qx/Qx4yl8fDVQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295662833"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="295662833"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 06:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="819454083"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="819454083"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 02 Dec 2022 06:46:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 06:46:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 06:46:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 06:46:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrFQq9Av/TaBtxQ9X7VlOXjAm/EG8Hl7esNsU875g9PZNexZQtDzTYZkRZMef3JWYIy594IYM5PBOURmtH1AY92n1F72OalLdyzlwbDeqZ9VdWP44phtGSMc+KakiCc8OLFbs3QdUPEePkuZg8u4nnmN/kJu59RW4fwJGj52kY6jLh51YDiSDXYFeLwfMWUP+gPKdMwqv6LwqiATiPxfKhP9aaceNSl98ikD1Az8ub1b1QTJRd8A+fj/9Roj1qpIqaZ6j3JN01q//q/jf3x0mkwSEqWo1OJm7QFBOARqeExkimF+hbBWSdSbU2SmRtvwehmzAQoDWHGQ9cwXf1Zxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejB4P82zo3vbgkvmeJ3Svn/eMklZ49CFKYeqEIOKuSg=;
 b=J9mSetBxKNN7V0p313wFfwU29ZyFJvkgkJX2rYCWknw1t5j1qt2GbXEtqMPKfC6OioQs05wEuoqpRLgFC4ua5uFqBPA9c/O4ghvnVLY70m88WojCgOFs8qlRItd+j/byJRJQZkD0PUi+Mcflm0w2HQyN4zyWDcnOs9WvRDcvT5bydFBtwbZ1G61vrVnWtQQL5vxlwOBfaKpEvHynb1LeB6OmCEakiLoC2R2tevI3hzGqpiRIaHEDBA4eKH1947Q+QPQv7HAV1PHLFHgJVzx+ow6yv28EBcFI95XlWWdm/tusYuYK1oq+WDSvWbttjCLNUBPRFiZvFPcU3gUJXyV1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA3PR11MB7533.namprd11.prod.outlook.com (2603:10b6:806:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 14:46:50 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 14:46:50 +0000
Date: Fri, 2 Dec 2022 20:16:42 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl: Add hardware-level lock
 for steering
Message-ID: <Y4oMtrT1nwFvihw/@bala-ubuntu>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221128233014.4000136-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SA3PR11MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ef1cf0-5630-4628-4c7d-08dad4740b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zVHqb4nhlM+GosnC6d9LaOcqXl95zG7YLicsF3IwMjdPE3kBI9ksHOdqAmQ3INC5KNSQxg4ebZkKwmz69X+lGWr8msf12nB7ooDxsBOLpG66x/nTZiSOZftSa8sMTbZy0+l7Enf/iKrH3kEoX7Qj9RCVQ4/jGK7uQLKpb+oy+85V4lxf77WApur4zHJuTTehfOwGTr83fePi20RMTRVaWZATrUcI3cteWO5VDleaQ0c+41p9YOB7lzoGKL89iSn0MgbdtS2ISLwiQ9lX30pV0Vb6UEofjF6MYbmBmSENq4u5pJu646KVxlBuLKZy3Bw3CfxAKpKlXDWrpHNLwLjnEjNYKrjJ6k+hUZChp8z1U2laOlVg3OZhO+8SXwDNMvIVx2nZYqORIGZAWNrR5mI5xUvpzaP03lyOH6y2fgQ7vjIk4DcLVXebie6yWfaF0Ok3IIrLNYFFBShtuaAynGq6WDMKo9chuwTHSJRVyq6XMW31PLUlAI0i/bKYR+A7sAh1dZhVx8bbxYAPrIQXLEa1BUKLMqQqHG7v3Kv3X6whH563Kf/vT7bCdgvg0JSgZc101/URdohTDRv1jVfsAvCGRlZl6LTon+kf1jqBxd8KwAm/QtXvbBeQmr4XiTWK2fJbAHs792vtrGGDV42rPOeYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(44832011)(83380400001)(450100002)(478600001)(33716001)(86362001)(82960400001)(186003)(38100700002)(41300700001)(4326008)(8676002)(66476007)(6666004)(8936002)(66946007)(66556008)(6512007)(316002)(53546011)(6506007)(9686003)(26005)(2906002)(6486002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emp2SzdzeTZmQVUrZ2x2S2U0TWh5Y0NQNWwxY040N1ExRDZXaERmaWR0V2Yy?=
 =?utf-8?B?TG41QUtNL0M3dEh1anFNcG10MkdWNzVtYXE1UEROODlrODFKOTdQV09vWS9J?=
 =?utf-8?B?R1BJcllSOUp3UkpDMCtuQnp2SnVCbG5mSW1uT3E5OEk1dkp6WkFWSVNFTkZL?=
 =?utf-8?B?NUFJMDNMVVBMVS9YWFN1eGxVQ0Q5eHFQMlZLR0FYVGZLQU1uWDNOMmpMK2Jh?=
 =?utf-8?B?dzRVdllDS3RDclkzOS9Dby9aSUQrQ0JyOE1YeThtMGxtSDJBRVZzcHIwMUg1?=
 =?utf-8?B?djVsZDVUbXZhTk5DN2ZhcW5jSUZHWHVnZDN5L1FRSGlja3JmeUIyMWZqL2Fh?=
 =?utf-8?B?MXI0bFplU2J4RklnYkVtK1RuVDZZUVpvZGhLakpxODdRLzhEWStoY0s1a3ZL?=
 =?utf-8?B?aW44OTlUOUVGL1hCTVRRbFkyN1dVOGNxc1NjWU9WQnhVRjU3MldCM3lVYVBl?=
 =?utf-8?B?dGwwUDMrYU5iZG9JbkNTRG44U1ZjeFdxV2w2dEg3M1JHMzRjc1NRVzErQUxw?=
 =?utf-8?B?UDdhSU5WNzhrVkR0ZXlTWUlFZW9ROWFLWnEzUUhHN2VkRXdNSnoxMEY2S29j?=
 =?utf-8?B?ZDRUQVp5WG1BZDduTkNWbUdtdStUdnpUcS9TSTMvVkVtOUJBVUVVbEV2WmNN?=
 =?utf-8?B?aktFY3JYUDlIZmlWMlpiZnp5Nlhma2xsQ3VreWh5L3Q4ZzRDMDZFRzFtNU44?=
 =?utf-8?B?aGtBOGY1ZFN1WTYxeDBPYkNnS3ZDVzZ2Y2wxUTAvc3JCakU3dVlOVWw4RGZx?=
 =?utf-8?B?UWJQcDRNb3poM2lEV2VBMWpQQUlMVkdXSXYvNjBhbHh0NXh6dkUzT09Xb3ox?=
 =?utf-8?B?Sjh1dFl0V2VVbHZiaEE0c2tuMmJ5Q2o3UTBaamZiM0NvTnh3SS9MMHN3bDk4?=
 =?utf-8?B?OVdQaVdWcFY2RHlKL2VPNWZJSjlwelNxM3dSelJ4ZXE1YWlkZ1I5TElJWGpS?=
 =?utf-8?B?b2ljWmlNbk50MGhWWEFPd3ZFb0tjY0NqOEhlYjJ4UEkzV0hkY3hTRVdVY1NQ?=
 =?utf-8?B?ZGNkZ2hyMW9OQ1BKTGtYRnJveitPSEY4Z1plVWRsSDFRS2ROVndnZ2NPNGgw?=
 =?utf-8?B?QzRmdDZVbmR5bG9RS0c5QysvUjkzTVhGMEg5S2RtaDdFUjQzbVBQak9GS0JF?=
 =?utf-8?B?cVRFa3g2VjdSUTkyYW5YQXgyMTBJV1NuSzhhZ2lVM29WQkRUaGVTV082Z3o1?=
 =?utf-8?B?R1pLNzVVRGNTTUJxbFJEWTJ6WGpFT0NpVThSVFNMSDlpaXBSbzFGSDRoZTlS?=
 =?utf-8?B?NStEeityNGYzdjNvYnRuWmhkS0RJZjFDMFJpc3FSQ0w4UkRzSkYySVpWcU5a?=
 =?utf-8?B?NmkreFJudnEra2YrWU1tVU1rQkJWYTUyamlQYmNheWZma001RnZqbkp5L2tK?=
 =?utf-8?B?a01SS1hYcTkrcWNURnlLeVlPN2c4TWlmTkxoR2hxUXJwdU9sWFQyZjlXUER5?=
 =?utf-8?B?eGZsN09VSEdPUTMwYW9jbTExSDJaNVA2TVk0VTFkRHo5eWx2aXdiRDZYZG11?=
 =?utf-8?B?ak0rYWtvOXNwdW1TRDJ4cTRHSU5lNEhtcXN1NGFQWUkzM0VsRXVTTk9NdmQ1?=
 =?utf-8?B?SWNiOGtHQmt3YUtqSnFhcTZLNk50VTZKbDhyV2NldmVNYVRhb1BZeUNHRStm?=
 =?utf-8?B?WUxzSkNtRXA2M2R0VG53RmZLN0dCMHY5cjNqWURDQnVxZFJNMVdGN3ZsZ29i?=
 =?utf-8?B?dUtwejRmU0xvQjJmQ2FBM1IxNUMzbUhrVkMvR0diN25UdUJBemJjQ0c4dDFW?=
 =?utf-8?B?TmVKTG1idjhmVGZrdkQ1RkZHYWVHWVZjV3E3VGh6SmlvbGc0VzViOTlOYlBQ?=
 =?utf-8?B?bTdYblZCK3lyeUxYblIxZGE0S2pZOTNORkEzZk5pVG5hWUc5UGpPYTZiclRv?=
 =?utf-8?B?aDUxcDFkT1dHa053eGtsMFFPZ3B3cGMyc3BVbCtKZjUvQzg3b09QdWNKTjRQ?=
 =?utf-8?B?SWhzK2llayswL2RLVExqaUp5b0hNTlZ6TldTZXBCN3paaFBJcDVidlZ5aVpH?=
 =?utf-8?B?V255U2xNUVp3R3BibXFYWmRsaDZMc2QvYUo0aUhVZzlPT29naUVONXpVYytD?=
 =?utf-8?B?VnBMRjg5VEJpSDFjMXZxd1N4eld2bUZZYVJ5QzdtUU1BSEU4SUtMNTlGY1Q3?=
 =?utf-8?B?QXVOYU9QSUFJYWFpa29vTWg4bFJCR1VlTi9WNWFEaEJGZEtwVHF5RlBHWHpp?=
 =?utf-8?Q?BY8/wd0TvZAnIKLkI6b0N5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ef1cf0-5630-4628-4c7d-08dad4740b85
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 14:46:50.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ2CYSimGIVEpCq7LdOhCY4hQyQU0c9kRBJaoPTxYJiKU3AB7gPZ3BsrvZIy6b/6xQgG7k2nHhVIW8be16WVUMt/HWFMyvRf7jOLsRxkBz2k680pjD/DksSWejqLML9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7533
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.2022 15:30, Matt Roper wrote:
> Starting with MTL, the driver needs to not only protect the steering
> control register from simultaneous software accesses, but also protect
> against races with hardware/firmware agents.  The hardware provides a
> dedicated locking mechanism to support this via the MTL_STEER_SEMAPHORE
> register.  Reading the register acts as a 'trylock' operation; the read
> will return 0x1 if the lock is acquired or 0x0 if something else is
> already holding the lock; once acquired, writing 0x1 to the register
> will release the lock.
> 
> We'll continue to grab the software lock as well, just so lockdep can
> track our locking; assuming the hardware lock is behaving properly,
> there should never be any contention on the software lock in this case.
> 
> v2:
>  - Extend hardware semaphore timeout and add a taint for CI if it ever
>    happens (this would imply misbehaving hardware/firmware).  (Mika)
>  - Add "MTL_" prefix to new steering semaphore register.  (Mika)
> 
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c  | 38 ++++++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index aa070ae57f11..087e4ac5b68d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -347,10 +347,9 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>   * @flags: storage to save IRQ flags to
>   *
>   * Performs locking to protect the steering for the duration of an MCR
> - * operation.  Depending on the platform, this may be a software lock
> - * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
> - * access not only for the driver, but also for external hardware and
> - * firmware agents).
> + * operation.  On MTL and beyond, a hardware lock will also be taken to
> + * serialize access not only for the driver, but also for external hardware and
> + * firmware agents.
>   *
>   * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
>   *          function is called, although it may be acquired after this
> @@ -359,12 +358,40 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
>  void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>  {
>  	unsigned long __flags;
> +	int err = 0;
>  
>  	lockdep_assert_not_held(&gt->uncore->lock);
>  
> +	/*
> +	 * Starting with MTL, we need to coordinate not only with other
> +	 * driver threads, but also with hardware/firmware agents.  A dedicated
> +	 * locking register is used.
> +	 */
> +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +		err = wait_for(intel_uncore_read_fw(gt->uncore,
> +						    MTL_STEER_SEMAPHORE) == 0x1, 100);
> +
> +	/*
> +	 * Even on platforms with a hardware lock, we'll continue to grab
> +	 * a software spinlock too for lockdep purposes.  If the hardware lock
> +	 * was already acquired, there should never be contention on the
> +	 * software lock.
> +	 */
>  	spin_lock_irqsave(&gt->mcr_lock, __flags);
>  
>  	*flags = __flags;
> +
> +	/*
> +	 * In theory we should never fail to acquire the HW semaphore; this
> +	 * would indicate some hardware/firmware is misbehaving and not
> +	 * releasing it properly.
> +	 */
> +	if (err == -ETIMEDOUT) {
> +		drm_err_ratelimited(&gt->i915->drm,
> +				    "GT%u hardware MCR steering semaphore timed out",
> +				    gt->info.id);
> +		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> +	}
>  }
>  
>  /**
> @@ -379,6 +406,9 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>  void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>  {
>  	spin_unlock_irqrestore(&gt->mcr_lock, flags);
> +
> +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 784152548472..1618d46cb8c7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -67,6 +67,7 @@
>  #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
>  
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
>  #define MTL_MCR_SELECTOR			_MMIO(0xfd4)
>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> -- 
> 2.38.1
> 
