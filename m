Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B56607BE0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DB110E41E;
	Fri, 21 Oct 2022 16:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8289210E405;
 Fri, 21 Oct 2022 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666368774; x=1697904774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MF+p0N70lDi8D4nrkz13eQUKL4lUewu1uUzJhApUnM=;
 b=mZTHkMoQrGmRVt6Oz8bPAt5YHZtISrwcwmDIX4VEOpyblKoB7wooh02q
 5iJeHTxpoeXe0lIqHJUbd2pL5BeHDcXlxUPcO/mgj3TRMPNcE6F9Mp3XD
 XuEMszOdf1442b7wnhLvqAXOVyhYOms+AqydcxCbnGG9Utu7bWMEDuBEK
 cKakjLGMoYngvAZ93Cn6GJpDRPzn8d70nDfKh3dQWwYzKI/xcEuGolBbP
 cqZuvMkbWcVBQ3yE1fu1DsT5m7EM7xJInFgbqKINyBd/cCaZe8hQL2mNh
 1rdAwjXumepBlcD+7f/ZzHiiwahkI+uDSBRQTHpoG4ew979t3k86VRnKn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="308725634"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="308725634"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:12:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="581648161"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="581648161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 21 Oct 2022 09:12:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:12:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 09:12:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 09:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEiM99QhTG5HeNuGRk7TTAKaAV5TaLSReY3QqmxHhjfMExUzFk4ItRlV9a1EEaNzJr10TYMmPpoF9f8qC9zbNazv1oLlvN/2P+ibnguURx7QN/p/s0Hi7MCopJW+YZs2Rbq2ZFmnTN5qhnKzK8A7MhWyHRLtRKbdjk0vBE54SDXV7Wnjqyx8ZX5OcAnaL4JMli2uvuuLpyGbUBh2vFd0LpTarlcMrrgEAGsE+y/yMxZ5QvJKiXDdNj8DptBVLRMQeUzLJQ+mdXCVz79j6u8zLcF6MCeqBbchsovcDJ1dQMkabPaAG6Y91lRL8RuNPP9LNIalsuTqmHo04Zgc7f6+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lssKMrOXf0fBp3LRbxTn42vb2s0R/w2ZV9ZA/gph1Y8=;
 b=LVhUo0FreMAw4QBYVT7Vpb6jfZ+Y1U6n3sa886jE2ZoD7OC6ag+EFFY1e6gT/WLrAJXXQqlstaOlq3o19dX/9hGDSpuAv1A4lu05clyqPho5lUyYs+mPl9rn21jsCE+rRQ5yVP4vtKfQ61MeNqeRfDNiwAmuzExh5+9bCWsLV+yRqLM257EIfz50f3zPrffqSTwAlZ9YokB4K0cXjG18S835DY8Zd2tdRSEEADb/iUZvKh4lJTiuuBSrLrhu1+Fi1FL5CYm2qW2FT8d8yBMItWRKy3c3hKMNNTAf/tPs9T2oqjwRJ6ROmFa0IpvjHzlQ80tQst7GwDEwPnJFxOJvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 16:12:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 16:12:51 +0000
Date: Fri, 21 Oct 2022 12:12:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915/mtl: Modify CAGF functions for
 MTL
Message-ID: <Y1LFAAWIcxzlhkAP@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-4-ashutosh.dixit@intel.com>
 <87zgdpp3lw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zgdpp3lw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d7c7c1-4f54-438c-6f43-08dab37f1a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Twk4I1CkIDn+T1MNJ/YE1Lir1FwnZuh1bQk1CbQLZfkjRIY74uJJAC192JzD+i327BTFxV2MivVnZpqEbkDcV1hzAFvVgYX+rww+oEFfDMtT0q9I4vGZ1bFdpfSTeUYhseByuaAihV2Sw9DRU9+mQT5cXrs/aKkqe+u2lPbcm4ZcXRE8WcHcPpuF8yEfIQHLbpAWbKS+CrMMrXlSbTFPTpabubp5e9lIAJRoaXgGxHS0kQ/Nd2hLO5FlFQxWEJIxtG/1jO4i7WjpFhHX4C1+aWXE75hHrc2Wndm6bRLduEz2s3Mt3HaEzXTkuKmR9NrqdbzeqzLqe4GibwfI4nRZOykimzVQkXxdw2MdeUuZ9VHE3dICTYbThnXyVCPraxMmkAwR+7fVtkmp8asm7ARbNHeIox8jXZFKPYp3ur5cAWeV3G72JjfoBXzN0lPj/ggXfo7mTysT6MvxBl7zgoyApoLRs/uHhXSPMdgqdUZGxr7YaTfYhdA6L6yxV0kn8E0pWJxmCkZQIx2rgHStncdklGLz9UBgVbYWo8FBVVEBcTyuu64098mpCglQ/jkp3hwRrScwDgDwO2B1WbI4VTWE+S9iBky9abvcqTGkJnu3O5ARC7XpyG+mFh10i93CPWIFss8Trmmv1F84GlvGu4Oy8qfHKKcKqJzG17Ye4fn8tfm9mgStWRcmh5x26Sm5Wz7XmWnkQOvxcorU69zfJ2moWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(36756003)(6486002)(83380400001)(478600001)(6666004)(86362001)(38100700002)(82960400001)(6636002)(37006003)(6506007)(2906002)(44832011)(2616005)(6512007)(8936002)(8676002)(41300700001)(66476007)(316002)(5660300002)(6862004)(186003)(4326008)(450100002)(26005)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?feTDZjAFnIHehxSwT2WEpfqcPR5ZjxsbJiZi8b1Mzoh3EJYPJTZocnF+8jqa?=
 =?us-ascii?Q?QFST/FFz5wqimwJ2eql/T/ViN81D4BDYY+neajpS2oP22CMm5I3pC80RSRa7?=
 =?us-ascii?Q?QI4qO7N3F3T/XWnEQ/gbn8IfkGHjjSfrJ3irQIxKVTsMPXKO2kUsyZbnAJmg?=
 =?us-ascii?Q?OnhpXSQMHuuAqgpYyi43Q7p+OQ+bKEPUGtMTo7u5AtR7DXFl5oejM9vjra2R?=
 =?us-ascii?Q?4HvXR/OpFM1cQxtn/DIIhszgrA8vH9oSzGDRXSHLNNr92HQLLFSpVioh2nqX?=
 =?us-ascii?Q?heQLvVdHHUI0H0QPHjQUtB78PfcBh1R94pxMDOvakb8ui0tfcqrHF1QXi1a+?=
 =?us-ascii?Q?7NlmUWQjWvI430kgjUbEqZnmdmaRlMh9az8i3uJvYq5isl3nnZFt13Ase+am?=
 =?us-ascii?Q?OOmjePLnXatrGbHC0luDq46eaN24jsA+gWG1gPIzclGo5KSwqwqqBcBioAkG?=
 =?us-ascii?Q?AJidHvxHlmsdZDxqG6zloCAthJHK7tlWqJBsz3RasHB+xrO9OujpZziynIR8?=
 =?us-ascii?Q?vX+8vQD8tnPsXPZC8UmZvckytHBm3MJcn8HlymFkx7R+yQ6KD1+yCF9zaulS?=
 =?us-ascii?Q?Z60eLyrU7oEtxshaSC6slhgldm58V3o5246g+YOdCU229HGsBkMThR4BSTyj?=
 =?us-ascii?Q?zSOGF3cGrugx4067Shva6M3kUw3xg5RTOPBRHQS2zK5nEqOKJ8EmIQBQXnMy?=
 =?us-ascii?Q?7WBKfzeoLuym1cpNGQW1G6FDw5ppzrvNCMGoM0v9aRjIn0/gj6sH8EDsTdUE?=
 =?us-ascii?Q?izflpa86C80HaSvED/9x3eucSkd1MydOoq6tX4L6Y5ix9Xmbu1g3pCxFaDIz?=
 =?us-ascii?Q?/MDWyvgwi78f7/m2XLHdXB5Cjrln4yjPuBZryRTRkEryWehfWgEddx4MnfGi?=
 =?us-ascii?Q?AA0BOY+uvHnMFAtAETzHYVT+q5WNa6gXCv2Oj57aaqBIRw5/0PK5ZyKu+Fu9?=
 =?us-ascii?Q?jH5OjK3E2Gbeos7C3pRzZZJOqfcp64/V/zrMw5NEViXbPBJy94UxfVkgs0D/?=
 =?us-ascii?Q?cdqwKEgZ8YZ3kBHWO64Oz7DfNiviP4GLVdYfgylGAE53ojeSdvezl+1IGsjc?=
 =?us-ascii?Q?Klgs+mQCncFTtHOHzF0A4Ytkh9aEUiJEGBG0paPpywds3efOiFEqGYYTWKWY?=
 =?us-ascii?Q?8BKQ2D7TYdFATYYJpmgmgGbP5NdtLylAoAbsx5uabbhvkqonEHgA0ucwwlcN?=
 =?us-ascii?Q?928fH9Y9YrLwFMAkgdZd4gy1hRhA9JHvy7tLSeY8YplXJ5826fHVWex4wOrb?=
 =?us-ascii?Q?7IojZksws6iZ30nN3Iq1WTRQFBgD7Emr+4IgMRw/sfQDt7PFVneFlqzMbpoI?=
 =?us-ascii?Q?fOr3vDnklPKAL6JFIyYwJPcA+5whuHxzVm1vzX+LyGlG+/7JBUJ81Fa4MZ/k?=
 =?us-ascii?Q?48lEmuGfKqwcMYkMTXEcUguu0p79vevz4ERXy5vyWN0PfX2/tBriI3RIlO4P?=
 =?us-ascii?Q?EfFzyDwaOokfsVYuN+HQ4BOFE2N44JoU4+6Aj2hf8QsV0Ck9a3J6XCDxarJp?=
 =?us-ascii?Q?eUDEJkO7n0au8UsCFr0wrynTJom07Y0dFqO2JJ+aLTZB/SJaTF5YOraMnhJl?=
 =?us-ascii?Q?L9j3mr80XXzI+n+SjvtF5x0JcLXb035aA1moDFBUzBkVqVsvV6BXFZroMb9g?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d7c7c1-4f54-438c-6f43-08dab37f1a83
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:12:51.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1I0Uuv9E2XNfScyYxUx067povfEcAs0XQxB5ojO4elMCdkcY58CTmHxCoSn6HM6WsyuwxErXMHEkuwvbKABvA==
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 09:02:03AM -0700, Dixit, Ashutosh wrote:
> On Wed, 19 Oct 2022 16:37:19 -0700, Ashutosh Dixit wrote:
> >
> > From: Badal Nilawar <badal.nilawar@intel.com>
> >
> > Update CAGF functions for MTL to get actual resolved frequency of 3D and
> > SAMedia.
> >
> > v2: Update MTL_MIRROR_TARGET_WP1 position/formatting (MattR)
> >     Move MTL branches in cagf functions to top (MattR)
> >     Fix commit message (Andi)
> > v3: Added comment about registers not needing forcewake for Gen12+ and
> >     returning 0 freq in RC6
> > v4: Use REG_FIELD_GET and uncore (Rodrigo)
> >
> > Bspec: 66300
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  4 ++++
> >  drivers/gpu/drm/i915/gt/intel_rps.c     | 12 ++++++++++--
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index f8c4f758ac0b1..d8dbd0ac3b064 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -21,6 +21,10 @@
> >   */
> >  #define PERF_REG(offset)			_MMIO(offset)
> >
> > +/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
> > +#define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
> > +#define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
> > +
> >  /* RPM unit config (Gen8+) */
> >  #define RPM_CONFIG0				_MMIO(0xd00)
> >  #define   GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > index da6b969f554b6..63cc7c538401e 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > @@ -2093,7 +2093,9 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
> >	struct drm_i915_private *i915 = rps_to_i915(rps);
> >	u32 cagf;
> >
> > -	if (GRAPHICS_VER(i915) >= 12)
> > +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> > +		cagf = REG_FIELD_GET(MTL_CAGF_MASK, rpstat);
> > +	else if (GRAPHICS_VER(i915) >= 12)
> >		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);
> >	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> >		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
> > @@ -2115,7 +2117,13 @@ static u32 read_cagf(struct intel_rps *rps)
> >	struct intel_uncore *uncore = rps_to_uncore(rps);
> >	u32 freq;
> >
> > -	if (GRAPHICS_VER(i915) >= 12) {
> > +	/*
> > +	 * For Gen12+ reading freq from HW does not need a forcewake and
> > +	 * registers will return 0 freq when GT is in RC6
> > +	 */
> > +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
> > +		freq = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> > +	} else if (GRAPHICS_VER(i915) >= 12) {
> >		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
> >	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
> >		vlv_punit_get(i915);
> > --
> > 2.38.0
> >
