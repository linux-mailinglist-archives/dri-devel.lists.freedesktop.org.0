Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9361FF8F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B9D10E458;
	Mon,  7 Nov 2022 20:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A548A10E458;
 Mon,  7 Nov 2022 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667853118; x=1699389118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yRyXZ4g3fa0iIpK4aThE4JJHRQsu8XrexeBAccxcPpg=;
 b=SAX6HSwmat9/sX8XqkHXKlxwRsuh0Vp7mNmdFltXtZwfZG/qzL/+VVU0
 nofQ4doKLu5I0LphudaOu2PZoDlFXH+JRfhroeXF8B0wwZbZDoKJmZo/m
 vhAEfBhfdHZF5I7fKFCS/FCDrNkf7IOSrr71uecNI2p5dXaVWw0Q3/9LI
 DqLN9rR2HSjGzidxuZPoeehD3XcAMZH6tHLqedF+F8BAci5KRA/gPsI1T
 6kcCkGFas3zHMgua0YCMYGW4unFtxNb+HiNDZfbWvsyLbkFwDJ2qjA1Iv
 niw98CBI8FpR0wyhAaSFGarqqj0Hpwa5RokwFyIhuova/MvyVFbT8Sqqn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="309228016"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="309228016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 12:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="761231508"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="761231508"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 07 Nov 2022 12:31:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 12:31:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 12:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wqhz00/lGWigrUyNhOCLjC8pouiZMqiWpe3JpcYoe8T8dSnIqb2XlbHqk4Y0HumyNnAtSyaxjNqjbYbJW+eTGPEIqlhwOlNcFjZtgS4fhiYtS7Jor2T/qBUO8GACKJF0p74eCnIZwRHplTPcmdxx7QfHqEREf62fgnW+jZb7fqG+F+rhrfL0/ertA0FbHHc+XORNCobQcYlZZ1uL+en8qZ4SEi+UYs71TWJSTMkl3bbTPCCEhkoXR89hw0XlfiBkyJe23c9StHaOywIwGb8LcAPnhb6ZLqlQUJE3lQiMzl4oErNVUnHBze+o2LQsNOYnfEafNNIAPA4kDCwZB4LJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoGj+rNU3vr3UwlEzCCLVKOQP0KA9tb5wkJ8cR24Rbk=;
 b=ksj+vNbJ53vmsmUAY82LG3zqAFg9sXVlD6IUcBUP+k4UBMQlK3Oix8DoVu3P3b3cDExDKaRzJp2Wh0u8aDcx53QgVpNJ4etb54TwqbEHlD73ZHDVygtMkD8vcRrJ/uZrg/zi4ScZMrxAAhTF4AtGLplt0L3QKCIOkFYqZrdjAvW1xiHrMfPjF7Qve8hf/LoJP1NgZoLwXYT18tP+tCZNhF5cbAfbBuFll6SWnUTTVK3whUJ088WSw29chg2ROmjkKJIaiTvUD4Uy6hpiy0kua38w+At1I4WJF8jijd2fwaXU2q8810m7CDPmvqO/9Qre0GeLEGDfqjwjQWVsT5AdpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 20:31:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5791.023; Mon, 7 Nov 2022
 20:31:55 +0000
Date: Mon, 7 Nov 2022 15:31:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 26/26] drm/i915/gt: Remove #ifdef guards for PM related
 functions
Message-ID: <Y2lrNbA4t8RHOwPB@intel.com>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175510.361051-1-paul@crapouillou.net>
 <20221107175510.361051-3-paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221107175510.361051-3-paul@crapouillou.net>
X-ClientProxiedBy: BYAPR21CA0018.namprd21.prod.outlook.com
 (2603:10b6:a03:114::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c854e7-681b-44b5-9b25-08dac0ff1c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q/zdpXF+uOr9j+SRxI4FDGJ3GgQE+deCjypkLZfQ85TQqqKoHeILK0WyG1R2MoGo05Jc+xQbmXqtM6x9cJCz+H6VqI8uwKmreC0RYfSjfovtFyvUo9Xb5zlSVlCl0+F2A6jRgCBZOYTeonn/TK5LCdOCzNh6e5nFe2S7v4Ru/eLjYKQ34H9btncIR9lGl5Rh3jbyaznFMejqdoUP0oj1WBfjlV+L8GqHja+QmN82vvgbsGHB3SLVBVmknADO4FCzVj368mhBeJohnpkDzPV131vaD+1N/BCSQYWLRKv/DfaiyyI15DA8MN79XKRoj+Al5rfumEIhVE2/Cems8kzPtTGebrittfpBqNafshB1hq57hzMlmDbJju8FiCNxg0BaVVdan5Rg43B0ZwVOcBs7GhRrS0RQJsjjVZGJu/aNwFrgKSzsQ0WlYeMOQcE4W+c8rBVNKCWcvyDwD/Jnu1Pu0BNaLRw/Cee5XhCLhuSyddZ3GLIiTHFqQ1X3TtpqG6hIgFcaQ2SbTWjla/x+4dP5GJGV7eaQZO01Ubmi2AujI33z/UOZ760rACQ6OTUe2ahzq9DDvyJbm3MiSOEUIODK//YsweKgoqdvbOQ1oDPEz9VcBBaN3DEtcEbNujCeZ7QPqVB4xz5Ku6numHbmkB+VHM8VayxTY2t1kidQaxdlfh0Egb4z/+9Dl48mAUJn8wxHJRH5Uh7V2xNN6ARxxV6HQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199015)(186003)(26005)(6512007)(6666004)(6506007)(83380400001)(2616005)(66476007)(44832011)(2906002)(316002)(478600001)(7416002)(6916009)(4326008)(54906003)(6486002)(41300700001)(38100700002)(5660300002)(8936002)(66556008)(66946007)(8676002)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RWrVv/fqI91uuCiP2zX2Db9ZYwl74H6PbQHWehCXggXDFL3GlweCVGDiD6Jz?=
 =?us-ascii?Q?Jhr4Dup6c2FlXiYEsIpMi8sFR5yl004FIAgVRF253QQZ9tro+bw6zNjdfprX?=
 =?us-ascii?Q?RE2tgx+5jnp/+6KBNzp9VGROyyTJsYc/RdTpSocnzNAtXzpDxxBo51xmJ7ih?=
 =?us-ascii?Q?CJFbPT+YgdOnCFFG4aDO/pU5YDJcEcfs0qMcK1l3p2b4JGbwSdyV05Xn6F+F?=
 =?us-ascii?Q?8Dy50srx6G3rBdWSsyGAD/1OBbn3Ij65RwTfy8KVK5pVlHprMan3a6MLr9Fd?=
 =?us-ascii?Q?j3X/OofBzqFtv5Fb/w8TkmPTIN9VUEtXnu1b6N1JzwNYXibR7tMrr5PRgxPt?=
 =?us-ascii?Q?x3m1EiGhO3zXAnfLTG+pprK4x3/Q7bmKHD7XQP+7fhOrtLcSj46Yrx7U/Dvf?=
 =?us-ascii?Q?DwV9qIfIebECT0hFQWNeFxdhzf/OHoZpcQh5rsrt5r4RzSrfbyQ3j4C6jAcp?=
 =?us-ascii?Q?VjUNNVCu15qTF8j0f+amj1r6XnfRFPH6enWO9VMWeQMlyfJoz7acRTO1wX8d?=
 =?us-ascii?Q?FbqX56ET3qXKyULSo4Qi581fFNQLXjqAqIOgmHQWTDBqxI3t0BnDllK6dK/1?=
 =?us-ascii?Q?J0rMNS22oEQ3UlyDk/jkkLPgU+T5a6hzgD6Mb04h+OV5MyCn1KJ5r7TfhmGo?=
 =?us-ascii?Q?s4J6X4aLuGwF6QoooAe38Vlr02EIXHe3Grq3dQHC4rr96vSkVBJpuzWrA/76?=
 =?us-ascii?Q?JEwG++hXQds1znLWqcoW5asYR6ObrJn3SlOkSuukCP0lc6NcP2xS4AA4I8v1?=
 =?us-ascii?Q?6qN29A3UxyrHR3gWEQkvzKmqYTbgkSldrVG2SOIzzGEaBigJVura3TOzskof?=
 =?us-ascii?Q?wGjMhm4jW5T1N7a39JoBNJBoLD8pRODkRaAIdoSItf+hIRzSN0uOxLufRRX9?=
 =?us-ascii?Q?Gg+mgfhe5CPB2R+TfPDlz7YmQYAbXCDL2qdPB3BZuDG+SThzNvtPU+nVLdrI?=
 =?us-ascii?Q?OJVGwfV0tO7Vr0z5jMULGJ1n3fIw3Kmbx+uc88YJW+grwFbzALOA+ywy1wHV?=
 =?us-ascii?Q?HQ8QAoIRpYqfcNM5oT20PxSywSXcZ9WSej2ZaiYATVO274yxJ+4DVJV9KZJK?=
 =?us-ascii?Q?i8Q+yW/4cC7Kms7TvNZj8h5Rk83qKW6NxC6vNbvap61IfsBd+3+oV8s6O1N2?=
 =?us-ascii?Q?YOhLIQ7/TasVtSDgKU+pySHAe09MrahpKC8duZcJWnfKfAWerXmKVNfh/AQD?=
 =?us-ascii?Q?Vh+p5EHV+/1PfNL+u90nDATRtGhBTqx5RQDvw3XVL4O/2uLc29YEvFeZLYm+?=
 =?us-ascii?Q?P/yPZgqjdInHmJqtNlMSQZU6nYObE9L+EgGD0Oqm0YE1Go5LnGiTmdbQPOwB?=
 =?us-ascii?Q?1QqGbOIPfZ/WzLbEaRntdsrtzfNrsIzeSTT8PL6G4RIajGpOZET4qOHVGFQI?=
 =?us-ascii?Q?OeyAS5TqaSTa21AvUVTDT4zbFW/1yQNcI/qTmtLqR9DU8E8tj5JK02X8kgXU?=
 =?us-ascii?Q?AMQV+jlHGUGs047HRPqa8S0a9MSsiagzNNt3wELJeMkJZgJf3WD0YKEFGbEY?=
 =?us-ascii?Q?lc64kRQTfPXTjhwmV3XbZZsFT/r9zSqZKTxQC1318lhILKJ/tcRNWH8Gtbmj?=
 =?us-ascii?Q?uvHnlwlIYdBG0Nu0qBVo6Q6c/QMgatkjLxTxFHNI+z9o3de6jdCbCOqZkRXU?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c854e7-681b-44b5-9b25-08dac0ff1c42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 20:31:55.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtLMxda3prJVzHp8AxjIoVCZ5ZCL+sc2pzrZ87zIstPmH6zgHrAm8Yd/vG4g7zvwzDAJlNmfYwXIMFZ+icRJbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:55:10PM +0000, Paul Cercueil wrote:
> Instead of defining two versions of intel_sysfs_rc6_init(), one for each
> value of CONFIG_PM, add a check on !IS_ENABLED(CONFIG_PM) early in the
> function. This will allow the compiler to automatically drop the dead
> code when CONFIG_PM is disabled, without having to use #ifdef guards.

Making the RC6 to depend on the CONFIG_PM is probably an historical
mistake and probably the right solution is simply to remove that
dependency.

> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 2b5f05b31187..decf892a4508 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -164,7 +164,6 @@ sysfs_gt_attribute_r_func(struct kobject *kobj, struct attribute *attr,
>  								 NULL);			\
>  	INTEL_GT_ATTR_RO(_name)
>  
> -#ifdef CONFIG_PM
>  static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
>  {
>  	intel_wakeref_t wakeref;
> @@ -300,7 +299,7 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>  {
>  	int ret;
>  
> -	if (!HAS_RC6(gt->i915))
> +	if (!IS_ENABLED(CONFIG_PM) || !HAS_RC6(gt->i915))
>  		return;
>  
>  	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
> @@ -329,11 +328,6 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>  				 gt->info.id, ERR_PTR(ret));
>  	}
>  }
> -#else
> -static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
> -{
> -}
> -#endif /* CONFIG_PM */
>  
>  static u32 __act_freq_mhz_show(struct intel_gt *gt)
>  {
> -- 
> 2.35.1
> 
