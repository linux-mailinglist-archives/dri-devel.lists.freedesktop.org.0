Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3C604A2A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAD210EB03;
	Wed, 19 Oct 2022 14:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997510F251;
 Wed, 19 Oct 2022 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666191505; x=1697727505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MAUpZRlDpekWCtT6HDd+3u7JrS+pmBUyXlZHV72GpG8=;
 b=hBI2m0TLFDru2yaeoSB5SIx5X9QWwAwVdxaE6vQ9t2N5mLe/6wPmJbK0
 BhWMTcrBeJY4ONAAXoHQ3szG0v9hh5KfzgqtuA9VbFi48K1/rdtpejyoD
 edu44XqmF7CWjO1hIKRT9+LqJkdX2wtc+AIaXgHp8j23ToaB5QRhyOmnB
 aNxOhxqoWve5YIhaDJ9tRcDRugLSNfoA/bDu8g8S6Vgs8SQKFEhXzqcSR
 Xz+HKXk620ARjcTqEMrZjgmLJFdTxa1HxS1ovwgLNQI4lRLsoX7w7ooJB
 gBsROjiuKiPv0gGsj6O3m4FSVfYHg5wecfkXfs2AqrMN8NoCUuRiDzFtO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="308119292"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="308119292"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 07:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698110983"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698110983"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2022 07:58:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 07:58:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 07:58:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 07:58:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 07:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndnXVK6OShIu/msMpUYd50NrRBmV48MqFJ9c0NZre6lZ9j6ZNyUD6ZS4nJCQpJWEkj6eYV1JgVYxpz6oqdfpdD8HwRJCQIPBYRHu/b11UVjCGCCY1ETgGJDZYaRiwoCdIyRatVpWxX8S1WIOYXMaKLY/5+Rvcyxn6i7L8oxVh3wTVsizcuvIHwu+I/QfBaHleOUAf25H5G6SI31GbqmeyXAeEQPcTs3XDoccxDIuFhlVjH7XiSt09yyXBFnPv058qPL/JaIoEvHYQunWMDZrnXUlPHmU9T03XjYQc7B6eWGSDDZIiVR7ECal1MO8RgcsZ9cFAbpqXWQlRUv/FYHp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDrd0oTDhVSWI3ZffbicnWSCfjOAa6jjBfkVGu+Ndv0=;
 b=NpGIsrk1o1iOktL2hQUanupPTvYqJOYicTbshrbmNIi+X1x9M+OtU+ongScBV1ZKnUOVlZl6dzMT6y6RvQA+kB55ztNNF57E61OkR3E/Zr0aNg2wny3VUOfbf25BK6PwmZPUGUmtptqsbwG8BNMkOZvG3r/6Xf6lUvqXD3w/TZHNGbPOaOeP77G6aHdPm1jAN6m5W0MEmTbZAiF4r1TkXMZsYb4Hp82OnQZWU+/5mFexcnCMJcYFhmRs9+ENLUCzb7W9h4Xoi5E5YJF8if4RkWt/QUFxWKd2qQlBUaShZnjByQHjeXcnd0cqFRNPbQNgeE9+iaLP2rLVinzdB9PvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 14:58:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 14:58:18 +0000
Date: Wed, 19 Oct 2022 10:58:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/4] drm/i915/mtl: Modify CAGF functions for MTL
Message-ID: <Y1AQhT4n4lYUUh9z@intel.com>
References: <20221019052043.3193842-1-ashutosh.dixit@intel.com>
 <20221019052043.3193842-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019052043.3193842-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e8a16b-d4b7-413a-b2d1-08dab1e25b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /A4MdzEydgjMUQTffm2ub6xNlWLrDvHvjNuL4ao7gLeVAhn+70Hr3d8nxBmR3lNLSjKXW3F8qOsTW7oPO9suoRKnVnGoj0cumDQ6zY86hCxrwmg0+Fgwddpx1B7spMw7ebJjhIX9hLbd5omkDCMN1RzdoiSqqEK1hZJ51ccSkjpKMeS4yDGdfn2LVgJ2AP+CfXl9htvLyR/JNY+DWoWhkcaMyzUqcBMQCdu+UgvwMTjJF0BSCJOFUAYzrmj/B1+tq/5ldv0GFVzkSRk+ABroqE3ri/0oTMqHKeXxBJ+BAWDqHmrH9eW8Uty8J8zYqzbiq3SWPmaK5TmL7vB6EAnVZy/KeNzQ/vQM+EUxv1fkPfbEDFGwdORZ5NQeN2E2/g1F1J+E+B4ztpXwbqRE4LZyWXHDTrrpriwqlopM1smX0rqFbnHu98R8lSZNyt+fAGAdCX0IaT36SBI7RpZVkUKZ+e8/9gh/1XUO/U8PNNMTpBT+tNqMbmIzAtCpUQMRQu01W7gXWKDB3KzTFzTtVut+o38XwooIs6OgLEy5340hfbJZCWOm20lDvboHDbbdCiK1nYsQrzvPW79ojAdVd+gApGH5mBIA/TLq6HygfXFiAvtFTdKiev0vcbISWKWRW8EaX9s3pmQa5GeOucn33KczbqfsNBxXiwZ3Dc0R0DbN7adGD1wIe77EoXccUN3q8dK8JQqpYSwv2u3f5MGptDUUDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(82960400001)(38100700002)(6666004)(86362001)(6512007)(5660300002)(8936002)(6862004)(41300700001)(6506007)(66476007)(66946007)(66556008)(26005)(4326008)(8676002)(37006003)(44832011)(2906002)(186003)(54906003)(6636002)(2616005)(316002)(36756003)(6486002)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7sOKdmzebYNIP2xWUlIxIDBd7yI8L/I8TDMZeAVs1h6cdpUcM5LcxEY2ZfTC?=
 =?us-ascii?Q?JOyl4gdhBudR6sh2RVd3MuF0BSozd7f7JIINXCA0dfR/+94LX+kpaI11EEgV?=
 =?us-ascii?Q?ogbSDw/Y7Ouuz5BCEPTozFgGxVtJOCr9q59qGMHB68jFI+Yl3lOyGwF6997/?=
 =?us-ascii?Q?thRkZsn/DyD7RrdDg+aTW4AbDzp3U0CeRtaP+jAGldfTDf1y3/QzFa9bYtR0?=
 =?us-ascii?Q?N1QmPWfnUy0bFyq3gIBMt2g6LGhh7qJ5ry/BUUYBQBYzPkypSSG2W5avasnN?=
 =?us-ascii?Q?hObFx3p0Eq4wKke24Ke+CdFyBZefyVw8pHK7NRUkhAY9is5IdmEvU+9pHDtM?=
 =?us-ascii?Q?Sin5dA0AEbz/+N3oe1X5soSETBYYulGwcq5q86RnR9qaCEuq1HjHK1/uib3o?=
 =?us-ascii?Q?V6SjWTkX5H6bMuDeZqb6pHRTxlOOIMBcXeBmz8ZlNMElFWPD2wQPA/m/sDCU?=
 =?us-ascii?Q?ob4VmgDutHsqRba6ivQAxiEaEJ31g8itzOXlhFalHGZGJN7PGJzUuoYSLI6k?=
 =?us-ascii?Q?cuzUNCW18OOtX/hqBk9jeffzG3ExaJDRP5d4Xj8M3q2CxCY0EGr2fwdYZ0KV?=
 =?us-ascii?Q?CLN4Nf1rCVfINDqbh3jf5c547x/WtlbZ3U97Z2KUajavHMY1O+qHSfbSvpgC?=
 =?us-ascii?Q?KZ/R7Oycf7vwxtWx7nHXZ1/RVMELhQ4HhNy7z2w3gGiOUvCqR9x+YihuCMBz?=
 =?us-ascii?Q?QA6TbMGcH21SeW1a3E8agw8O9SI9Fioia8FpbNAMla1+RH5nCB0bv6vv514N?=
 =?us-ascii?Q?uY0sX1nm7VZUrIZlmsZWLnz1jbfg1ekEF+8qMZD17Plaq6z4sPGulSFDM4vZ?=
 =?us-ascii?Q?vFVg46BxTliYH/MDmV39vTi3tEoZ3iE2TGWGviFeMTFrqjq91fIVFjhFEY01?=
 =?us-ascii?Q?JpN9KacpjUTQLPf2HLxJTdBI5CgQR+1OgSrA6bbL9Te5WJW0IwMpBxbfUhLd?=
 =?us-ascii?Q?YwytrXclV8/lrETJTAv2/MY5zkszjJ6hN45f/a7ywneIqXLBNVLXnR0RAnSS?=
 =?us-ascii?Q?nlLYb/EyvMZWKME8c6SoewLsC/So088BsmokYCY41FwS7mpbrDzTMIkuYjdU?=
 =?us-ascii?Q?DKDRoJPiIcZQ6J/hEs1x+NCk6T1yNA7XEc6JJitlTSE0PUkb6vF1uWNymHYf?=
 =?us-ascii?Q?93i2KstsFa3JN1uXmOF915Ai8qH+Q1rLZWLrx8qDHv2H05zQ+Ppss1JSMa8J?=
 =?us-ascii?Q?otE83VVHxXSAERbrxTjTrghkMTUpwwNgemt8YT0J8QNywrpi7ALOVGLA1tIT?=
 =?us-ascii?Q?1qYYzCiGIw4XLxxm04DHsxW/Xrcb3wHXRXUAgofYwvf/nY+1mHUX9bHjbOWK?=
 =?us-ascii?Q?yyS1skwzf8hlxPBHWojcHYmSRJbZ9xjx77PnnbWPtucZnU5MBacp4SoKnEvp?=
 =?us-ascii?Q?sYWatJjjLPh2axrcpDAYinAeECANxnNEdkXvfQyt5vcSSO5oppK1s7Xjzhi3?=
 =?us-ascii?Q?puJtVNlAKiRdwVf2ZCoKKWFAB+Y6zUtKkRVWowcB45WYP4EzkdFeieCUNuaV?=
 =?us-ascii?Q?Fma9+ymITIAdyRaASlA6KHE+tMMnFbo+/d2optvN4tCyh18sB/6V7TrIMV9I?=
 =?us-ascii?Q?xhT0fphI6z853ddEeaXyBZLqD16AgdGA7eZZCdmOLyQ5CnMYta1IGu6EBlzY?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e8a16b-d4b7-413a-b2d1-08dab1e25b64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:58:18.4928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXiTGMTG2hTlyVPlxltGWsveUdrEg1iPdxbSn708P8QKK3B0acEgCBgHgf0T23H3ES3tXn4maz2WiSdUg8yMqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 10:20:41PM -0700, Ashutosh Dixit wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Update CAGF functions for MTL to get actual resolved frequency of 3D and
> SAMedia.
> 
> v2: Update MTL_MIRROR_TARGET_WP1 position/formatting (MattR)
>     Move MTL branches in cagf functions to top (MattR)
>     Fix commit message (Andi)
> v3: Added comment about registers not needing forcewake for Gen12+ and
>     returning 0 freq in RC6
> 
> Bspec: 66300
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  4 ++++
>  drivers/gpu/drm/i915/gt/intel_rps.c     | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index a7a0129d0e3fc..b4b1b54ad738f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -21,6 +21,10 @@
>   */
>  #define PERF_REG(offset)			_MMIO(offset)
>  
> +/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
> +#define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
> +#define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
>  #define   GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index df21258976d86..5a743ae4dd11e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2093,7 +2093,9 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  	struct drm_i915_private *i915 = rps_to_i915(rps);
>  	u32 cagf;
>  
> -	if (GRAPHICS_VER(i915) >= 12)
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		cagf = rpstat & MTL_CAGF_MASK;

I believe we should advocate more the use of the REG_FIELD_GET

  cagf = REG_FIELD_GET(MTL_CAGF_MASK, rpstat);

> +	else if (GRAPHICS_VER(i915) >= 12)
>  		cagf = (rpstat & GEN12_CAGF_MASK) >> GEN12_CAGF_SHIFT;

cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
// witht the proper REG_GENAMSK usage on the gen12_cagf_mask...

>  	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  		cagf = (rpstat >> 8) & 0xff;

 #define RPE_MASK REG_GENMASK(15, 8)
         cagf = REG_FIELD_GET(RPE_MASK, rpstat)


> @@ -2116,7 +2118,13 @@ static u32 read_cagf(struct intel_rps *rps)
>  	struct intel_uncore *uncore = rps_to_uncore(rps);
                            ^

>  	u32 freq;
>  
> -	if (GRAPHICS_VER(i915) >= 12) {
> +	/*
> +	 * For Gen12+ reading freq from HW does not need a forcewake and
> +	 * registers will return 0 freq when GT is in RC6
> +	 */
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
> +		freq = intel_uncore_read(rps_to_gt(rps)->uncore, MTL_MIRROR_TARGET_WP1);

here we should use directly the local uncore already declared above with the same helper...
and consistent with the following elses...

> +	} else if (GRAPHICS_VER(i915) >= 12) {
>  		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
>  	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>  		vlv_punit_get(i915);
> -- 
> 2.38.0
> 
