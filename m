Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696816C940F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 13:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD15F10E080;
	Sun, 26 Mar 2023 11:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1110E048;
 Sun, 26 Mar 2023 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679831593; x=1711367593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FbLUOx1Aorn3+gxTqaX4yVB4foWbcvXHidcieu2DBm4=;
 b=R3rT1lIo0m7GiXkY2SGsovw1a43OQfRv23V0kh3lndC3bCHa8P8fXftz
 qtNVPm02wUN7JQ4WftyPRjm4oKmB0mk9hKIGT7bsNInnxZXUj36NPseHC
 fh8WY94xMSJtUvQ/egwLXzgRIw52n4Xh2/HzZ2vQzZwWOoUa/Z44dlQKq
 RbXqj3FPIKmStXrjx5WLJCscQLpFbE4hhS6/XXs+TOsUsHh74zWXhMsWh
 wZU9bz8Wy9A8wKPepkSVCJITTfff0kNpic4p6jSNMOux1LAsDAMzBqLbM
 qNcvjkryK1ckiO9FAQE1F69qg4H8DvZJHsjE7dGLsu8Xq3zGI9qC8RvRQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="402673701"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; d="scan'208";a="402673701"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 04:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="857370455"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; d="scan'208";a="857370455"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 26 Mar 2023 04:53:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 04:53:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 26 Mar 2023 04:53:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 26 Mar 2023 04:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anrx6klYp29hzfWR6jXOufoZSwU18jir9/Q8x1G6h/Avts2IKFiDyDcof2rltp3rBiZogjxu28EOe6QoRIPVrrSvdC2tm69QBXcsVcbO6FwfciC+BUo84pfJ50OQ/Se3+iIcy1a66lXMC0R41ByJhGxue5D6LHpK6uZ5a8gYslvyuumCShyI4bNBtesSoKdVO6WvOzsIq5TmKmrnehhK6KuHSYuMYt09kMwiDv8KrqnHHPpJIXJ6jy4ihLMHN/eEdDSoUN7AobU0WBjlY2BXQ5J72qKT9U38mjDUbhO4dKV/pjkBQvi/E/7+MBtEy53o/HzMIDoKpMvT3ccMSRj5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UANbqNFDCRc5s64XYN6X7+WrducDbW8YRusInTyOXZc=;
 b=lEgIGpZ9uMSrk4V3Y9WeJhuSZ2bQRQMsMXfLyt+A7CxIgsrNb9JINFm8lvCReY6wC1/oIgyTLxPRNWkituEDgb6jh6AnDg+/rctFcpDoFpBHfm5msZ/Z4nCO9mlGF4MEhS5eobwl5OdTGWebKmm3rYTGfXmUxLs2b6/q71tT/3H5fUAGokHlMkmacFtOvQptoGI3lB4xAb9XdqzszdQvbMQEWEjx+GS0mqtwB92JLpL9POsHUekm0R04jsGSvp/R1eEgZTJ5uRKT5YVmd0i99qXlMnTnq7h1YscnjbMyl2sNQzaZJAlzjxwzjwk/XY/1EBVV2zwCajbtgDJZspjA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sun, 26 Mar
 2023 11:53:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6178.041; Sun, 26 Mar 2023
 11:53:04 +0000
Date: Sun, 26 Mar 2023 07:52:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Message-ID: <ZCAyGzvnu5mwHMJg@intel.com>
References: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
 <4760d41f-c237-9f97-eb32-5d2ab05eea20@intel.com>
 <87sfdtload.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sfdtload.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: efd50461-2163-4cfb-9ed8-08db2df0a7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rgk9z6f3V8RnQjt8+PSFRtc2fMczLEpOvqrV8i8P/viRW7JaupMN5bheBFC9SV/CwoYBA9Wdz04D3wZUI166b+Oz0Sf6hez1oNedXB/tbJo/G0trLyzsyJ/9kd5i50mPvg8l6GYhCYxT1qAlzh1eFSPaWuwXH3+UVcqvyvXtdyoATC6ibYtUTd9Pjzv3uOET7cAm5G9gr/laNTyyzZ9NbuUtSNhrX/VPoVNJk6hXIGsF3MZUAg9VNX5m54uwIihCEqB1hU+i2svEUV3+DubHYG1sYOIbGxPT+XXVUnNSvrVdGFYf5k4+rzRiRB5udt9eFbJip1PEjHhD6zdDqnS9UqOYSijHm7IrSp0dHR5yzWVmAdkJm5avuue41/yMzL0G76stK9fprH1NK6IZstf0imsICFbMqfkCChw40WE8pH2HTVV2GTOMZ1j4ykHGv2x1rwJ+EdmfzVc/DRuzmrVeBQDQvkrySifIYeNAdQZgrHQdzySb26KaSZSNue32+c001QvHIDuzDo5ognQleoB4qZapL7Ye2YLasKdh7clnKvJZLWq0eGJQ/0cAwIR5mW3N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(86362001)(36756003)(2906002)(44832011)(66899021)(478600001)(6486002)(966005)(26005)(6666004)(107886003)(83380400001)(2616005)(37006003)(54906003)(4326008)(450100002)(6636002)(316002)(66946007)(66556008)(66476007)(8676002)(186003)(53546011)(6512007)(6506007)(82960400001)(30864003)(38100700002)(6862004)(5660300002)(8936002)(41300700001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TJLTdCAnlD9WVwstHXQTg1jD4o3P10LUz3YS7gdCc+CcOE4EVajPJQv9Wg?=
 =?iso-8859-1?Q?4AMQAJI58beHq5BDunrYV4KX21yd8YOXvH9JUzGYQNk5yEg4wBi/HjrJVr?=
 =?iso-8859-1?Q?N/HQkxOCvusVOSvu27UvBJpjfo0jFmmWTj4IIV3iaMSNXSmjnf5wSMlSaU?=
 =?iso-8859-1?Q?UMtsKr65n2P1WI4TUiJT2mJNn9oHF08Ms72GFjGvts41cxZVFjNQkPxgC8?=
 =?iso-8859-1?Q?Y0ZTYrJ0JisBc3ajGwjq7MdkHkdJCYqBhGGhOFf6HYwn0SJVhJ8mPqmmBd?=
 =?iso-8859-1?Q?vuKh9Dh8p4Z24SGGOfNZQOcershZZxGgGA70ZhMZL5oFol29aRLiy59hh6?=
 =?iso-8859-1?Q?TYnPiMem9ljs3wwb8VlxXJ/9CdD5MzWRmcT6NWHfqsHfObcAeOpnmz5w0u?=
 =?iso-8859-1?Q?uCGS+J4Ek8nK/BmjaDQnbief1JNM2KGz6ajyH9MjHxfBgFE2Jxc9QZFnpF?=
 =?iso-8859-1?Q?qVtrZqWaPJ+fUObFLKtuIGpdxRho49nFHQJ3TlsdoeH/wPCXSVTCsdsVG2?=
 =?iso-8859-1?Q?vTl+JCc6M8z3E54k0lZCq0xHoki/K9cenXXWyxdJ/en5DPk0g6HvjQLUKU?=
 =?iso-8859-1?Q?eXnWeTIZnCr0ly8O11KHRxh8+KzUioc/BwU6VyHxUTKGDMSLGcPyWbnVP5?=
 =?iso-8859-1?Q?it5XrV4WnJTJQmwTU1ZmyasGYJOLrLP/+Zp266wcICysZILuQrfU9L2Ulf?=
 =?iso-8859-1?Q?yZEQE5EQpbSqyD7hgR4sv0KkwNli8tOJsBLTtlXADLv/N4RH7WJrmPzThO?=
 =?iso-8859-1?Q?mZmgaMdnyNbvwjq3Y1Bvrah+P5vEi9LyzQNf9DS5wcAAectNr3Q/3V+lM7?=
 =?iso-8859-1?Q?/tXTgfv7Kkr/solILQG3+ipuNATinvN52ZvBhZhXHTJNS4ZPHeMFfIrXEY?=
 =?iso-8859-1?Q?IQ4Okff0SMqg4gbCOGqkdJxiF7UgvYanj6KUqkAuOSY4YGAypQ7kvuE2xd?=
 =?iso-8859-1?Q?/zI337vrUMMvO99yK3Sopb+U2zOmCZfeV25Z1El2sQHvhKJtmGz77uTXTN?=
 =?iso-8859-1?Q?cbeuh/ZaovPlD4/ttsnBLFcecSYd+IXKOvw4t3VcZx5efKAX/tzBuGOTBj?=
 =?iso-8859-1?Q?PBAraN0EyQA+1HpUtxsNd8tOuWHbX3a7f/enq+sQSjn9QXX+lpxdPipAj1?=
 =?iso-8859-1?Q?pFSWDk4x6VNLDxqe8eDpwvlhIBpawdLw8LO5QPTTS7rwu2TQleGQ/ibEpi?=
 =?iso-8859-1?Q?1YmiCCoDHVm4rE/o24VHbKm74/pVReK+P8yOER6O4cmlS0zjgTFoIkdwp1?=
 =?iso-8859-1?Q?Up9SbjENC5kIteyv733iGJszR626EZmpJszX8hRHZZBo3OQjre0oysFHIj?=
 =?iso-8859-1?Q?VYcoHscmS1NxyFj22Zq0ymAdSTGkm5G2n2ods7GMUL4rjw52q51GXHiPqR?=
 =?iso-8859-1?Q?1l/0ZtAGHJnh1ILt1JEKLIGXqf3Ev44AZ1EXUCIBeeYYm9qkw7Vf5EB+hZ?=
 =?iso-8859-1?Q?2SJhE6gR5osSFqEh9QG9wh6oYAww5IvwKBcLhWPsNFdDFqwHffIsWtJqRS?=
 =?iso-8859-1?Q?H2NSPHNbJhjrpSHumvrLy93tmPYLCepjld/VZGgfTscmy9gOOeV3Eq7Ncn?=
 =?iso-8859-1?Q?6bLgUGDRWKl/YYuj8xNBTc3ShBGet5QH1JJSX59gVR0RImyZQaFXVwKg7F?=
 =?iso-8859-1?Q?0s5AsC8GqW11PujWfvxpAdd0OL3NbzG053?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efd50461-2163-4cfb-9ed8-08db2df0a7e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2023 11:53:03.8726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSbuJ9JcVgob6KlaeFnau4lH9M94ViZr0gEO5oLGmP1DHeeOgzIVTZ9NxuVCtfSDlUlvVdzOdb+O063lxRQy5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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
 intel-gfx@lists.freedesktop.org, Badal
 Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 04:31:22PM -0700, Dixit, Ashutosh wrote:
> On Fri, 24 Mar 2023 11:15:02 -0700, Belgaumkar, Vinay wrote:
> >
> 
> Hi Vinay,
> 
> Thanks for the review. Comments inline below.
> 
> > On 3/15/2023 8:59 PM, Ashutosh Dixit wrote:
> > > On dGfx, the PL1 power limit being enabled and set to a low value results
> > > in a low GPU operating freq. It also negates the freq raise operation which
> > > is done before GuC firmware load. As a result GuC firmware load can time
> > > out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
> > > limit was enabled and set to a low value). Therefore disable the PL1 power
> > > limit when allowed by HW when loading GuC firmware.
> > v3 label missing in subject.
> > >
> > > v2:
> > >   - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
> > >   - Add hwm_power_max_restore to error return code path
> > >
> > > v3 (Jani N):
> > >   - Add/remove explanatory comments
> > >   - Function renames
> > >   - Type corrections
> > >   - Locking annotation
> > >
> > > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
> > >   drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
> > >   3 files changed, 55 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > index 4ccb4be4c9cba..aa8e35a5636a0 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > > @@ -18,6 +18,7 @@
> > >   #include "intel_uc.h"
> > >     #include "i915_drv.h"
> > > +#include "i915_hwmon.h"
> > >     static const struct intel_uc_ops uc_ops_off;
> > >   static const struct intel_uc_ops uc_ops_on;
> > > @@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
> > >	struct intel_guc *guc = &uc->guc;
> > >	struct intel_huc *huc = &uc->huc;
> > >	int ret, attempts;
> > > +	bool pl1en;
> >
> > Init to 'false' here
> 
> See next comment.
> 
> >
> >
> > >		GEM_BUG_ON(!intel_uc_supports_guc(uc));
> > >	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> > > @@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
> > >	else
> > >		attempts = 1;
> > >   +	/* Disable a potentially low PL1 power limit to allow freq to be
> > > raised */
> > > +	i915_hwmon_power_max_disable(gt->i915, &pl1en);
> > > +
> > >	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
> > >		while (attempts--) {
> > > @@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
> > >		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
> > >	}
> > >   +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> > > +
> > >	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
> > >	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
> > >   @@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
> > >	/* Return GT back to RPn */
> > >	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
> > >   +	i915_hwmon_power_max_restore(gt->i915, pl1en);
> >
> > if (pl1en)
> >
> >     i915_hwmon_power_max_enable().
> 
> IMO it's better not to have checks in the main __uc_init_hw() function (if
> we do this we'll need to add 2 checks in __uc_init_hw()). If you really
> want we could do something like this inside
> i915_hwmon_power_max_disable/i915_hwmon_power_max_restore. But for now I
> am not making any changes.
> 
> (I can send a patch with the changes if you want to take a look but IMO it
> will add more logic/code but without real benefits (it will save a rmw if
> the limit was already disabled, but IMO this code is called so infrequently
> (only during GuC resets) as to not have any significant impact)).
> 
> >
> > > +
> > >	__uc_sanitize(uc);
> > >		if (!ret) {
> > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > index ee63a8fd88fc1..769b5bda4d53f 100644
> > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > @@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> > >	}
> > >   }
> > >   +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool
> > > *old)
> > Shouldn't we call this i915_hwmon_package_pl1_disable()?
> 
> I did think of using "pl1" in the function name but then decided to retain
> "power_max" because other hwmon functions for PL1 limit also use
> "power_max" (hwm_power_max_read/hwm_power_max_write) and currently
> "hwmon_power_max" is mapped to the PL1 limit. So "power_max" is used to
> show that all these functions deal with the PL1 power limit.
> 
> There is a comment in __uc_init_hw() explaining "power_max" means the PL1
> power limit.
> 
> > > +	__acquires(i915->hwmon->hwmon_lock)
> > > +{
> > > +	struct i915_hwmon *hwmon = i915->hwmon;
> > > +	intel_wakeref_t wakeref;
> > > +	u32 r;
> > > +
> > > +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > > +		return;
> > > +
> > > +	/* Take mutex to prevent concurrent hwm_power_max_write */
> > > +	mutex_lock(&hwmon->hwmon_lock);
> > > +
> > > +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> > > +		r = intel_uncore_rmw(hwmon->ddat.uncore,
> > > +				     hwmon->rg.pkg_rapl_limit,
> > > +				     PKG_PWR_LIM_1_EN, 0);
> > Most of this code (lock and rmw parts) is already inside static void
> > hwm_locked_with_pm_intel_uncore_rmw() , can we reuse that here?
> 
> This was the case in v1 of the patch:
> 
> https://patchwork.freedesktop.org/patch/526393/?series=115003&rev=1
> 
> But now this cannot be done because if you notice we acquire the mutex in
> i915_hwmon_power_max_disable() and release the mutex in
> i915_hwmon_power_max_restore().
> 
> I explained the reason why this the mutex is handled this way in my reply
> to Jani Nikula here:
> 
> https://patchwork.freedesktop.org/patch/526598/?series=115003&rev=2
> 
> Quoting below:
> 
> ```
> > > +	/* hwmon_lock mutex is unlocked in hwm_power_max_restore */
> >
> > Not too happy about that... any better ideas?
> 
> Afais, taking the mutex is the only fully correct solution (when we disable
> the power limit, userspace can go re-enable it). Examples of partly
> incorrect solutions (which don't take the mutex) include:
> 
> a. Don't take the mutex, don't do anything, ignore any changes to the value
>    if it has changed during GuC reset/fw load (just overwrite the changed
>    value). Con: changed value is lost.
> 
> b. Detect if the value has changed (the limit has been re-enabled) after we
>    have disabled the limit and in that case skip restoring the value. But
>    then someone can say why do we allow enabling the PL1 limit since we
>    want to disable it.
> 
> Both these are very unlikely scenarios so they might work. But I would
> first like to explore if holding a mutex across GuC reset is prolebmatic
> since that is /the/ correct solution. But if anyone comes up with a reason
> why that cannot be done we can look at these other not completely correct
> options.

I see what you are doing and it looks indeed a very safe approach to ensure
the pl1 won't be toggled by other paths while we need some guaranteed state
here, or hw init fails badly.

But in the end you are making your lock to protect the code from another path
and not protecting the data itself. The data was already protected in the
first version with the lock in the rmw.

maybe we need to have some kind of a state check with other state-lock and
then if we are in this forced state for init path, the request for the normal path
ignores and move one, or maybe we queue some request...


> ```
> 
> > > +
> > > +	*old = !!(r & PKG_PWR_LIM_1_EN);
> > > +}
> > > +
> > > +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> > > +	__releases(i915->hwmon->hwmon_lock)
> > We can just call this i915_hwmon_power_max_enable() and call whenever the
> > old value was actually enabled. That way, we have proper mirror functions.
> 
> As I explained that would mean adding two checks in the main __uc_init_hw()
> function which I am trying to avoid. So we have disable/restore pair.
> 
> > > +{
> > > +	struct i915_hwmon *hwmon = i915->hwmon;
> > > +	intel_wakeref_t wakeref;
> > > +
> > > +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > > +		return;
> > > +
> > > +	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
> > > +		intel_uncore_rmw(hwmon->ddat.uncore,
> > > +				 hwmon->rg.pkg_rapl_limit,
> > > +				 PKG_PWR_LIM_1_EN,
> > > +				 old ? PKG_PWR_LIM_1_EN : 0);
> >
> > 3rd param should be 0 here, else we will end up clearing other bits.
> 
> No see intel_uncore_rmw(), it will only clear the PKG_PWR_LIM_1_EN bit, so
> the code here is correct. intel_uncore_rmw() does:
> 
>         val = (old & ~clear) | set;
> 
> So for now I am not making any changes, if you feel strongly about
> something one way or another let me know. Anyway these comments should help
> you understand the patch better so take a look and we can go from there.
> 
> Thanks.
> --
> Ashutosh
> 
> > > +
> > > +	mutex_unlock(&hwmon->hwmon_lock);
> > > +}
> > > +
> > >   static umode_t
> > >   hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > >   {
> > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> > > index 7ca9cf2c34c96..0fcb7de844061 100644
> > > --- a/drivers/gpu/drm/i915/i915_hwmon.h
> > > +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> > > @@ -7,14 +7,21 @@
> > >   #ifndef __I915_HWMON_H__
> > >   #define __I915_HWMON_H__
> > >   +#include <linux/types.h>
> > > +
> > >   struct drm_i915_private;
> > > +struct intel_gt;
> > >     #if IS_REACHABLE(CONFIG_HWMON)
> > >   void i915_hwmon_register(struct drm_i915_private *i915);
> > >   void i915_hwmon_unregister(struct drm_i915_private *i915);
> > > +void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
> > > +void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
> > >   #else
> > >   static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
> > >   static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> > > +static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
> > > +static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
> > >   #endif
> > >     #endif /* __I915_HWMON_H__ */
