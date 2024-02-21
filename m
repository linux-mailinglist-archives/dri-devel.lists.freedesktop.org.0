Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CF85E93E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0AE10E296;
	Wed, 21 Feb 2024 20:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeOcLVDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5D310E296;
 Wed, 21 Feb 2024 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708548671; x=1740084671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EqXPmD7WaAwld5/s2zTJyS3RsZeMs3u3GYh1fWNEcLU=;
 b=ZeOcLVDJYfuAKzPwd7Wn3YVy7cboXemXzdpxafXUJddw4MxfX5liAQU+
 FZl0+w8iSARdtIIEg5D5+ppI+z/q9KUke3UFmbZxrReh3iZ9PaU5+vTLR
 aVbQSwJnJlrnycIMSLduP2T0kvzAEakKTLDPccnQuu157hyAeV6XQCHja
 Pb1bOxsX0sUCEafxKPjH8G0mW6W0cYXwh5fk1AO9QXon5yc0dIszgq0q+
 wcXjqaweoJkg/dolbNccSfaUuXw2OfpTY8xnViKljsGiczOx5iYPNaCzM
 1qtU1quckUUgemIGwXAkzDZSsviDWLrJriQ0FrxkvC+7xdJCr/8LMHz0N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2648275"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2648275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 12:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5199767"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 12:51:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 12:51:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 12:51:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 12:51:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 12:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0SlAYnHRV4gJly3t6BqJILeod4B9sbuCmqQchrynE878Z+e1mAdTpK8jiap6Q9cxuBRzP8r6KvZKxA/dVfwY48XF9T0eQuATHxVit6YHU9j5fv9s2KsohUWFdiltpEHU7BDjb/zKylExcXBHALEq0bIIbnhPL9bNIg4ni7GmZGvAJQH11/9P5QXqOz3OWaEHjVqoTsw3tktRmOFJyVp/gWkb28ERfzvhhC6lgb7PQpIzpn7XXoagh1eM+lIS94iuR6Lt7mKYwWVRlJE+2CoJA+pd3pAAsOwRTvJRzDEhzJ7eEFh4I0gCj/wfSPs8LoyaFQrfPd/MOT4lNYuqMuvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZU6KqRl1ivMlBA0ylZaWcepUKtVd68r8QtHVXBb0fo=;
 b=OEdXV77LrISBtrf8IA14u7SPzLQLSdSzyx9bVE9CL+BkrxCUbUk96a8PUwx7dPAxnqpu/ggR5gS5o7zX52q7eZMWLFP3KinXm+d5Tp5O4eGQflrNdnuVSOb5+nB1UOkTdyNWX8K5wQ50DFIAhnMALuE6VDO5l1lFP9MJnIAcHAxMhOiPV4I1BfsR2g0E0v9bPvs8vlDm/okj5qC3WMhFdqDt0acyxvusXptFV0HCpsnmPoCKY/v+1URmKwgsZ4OOSbu6LBgfQ7F3fJ2avdSOSw1HG3+5mBGAafy1g3hsp5mluAZwZUKbVscv35S9JR1L32MMH5ish4HyuZdtY+MvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 20:51:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 20:51:06 +0000
Date: Wed, 21 Feb 2024 12:51:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, <stable@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <20240221205104.GM718896@mdroper-desk1.amr.corp.intel.com>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <20240220233918.GG5347@mdroper-desk1.amr.corp.intel.com>
 <ZdU_4okr8GcSpTtm@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZdU_4okr8GcSpTtm@ashyti-mobl2.lan>
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: eb89f30e-918f-4001-7691-08dc331ed344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dbnx+p5hKJXU20fMsK23cX8afH41hYPSWBZ6CIk1AVOvgjEYKJ1L8ZDxEgDLvaXlbljDZVhtM5E9xUitSqhQZOcfl5OftXVebm3b4zznWO8RQAX/HEk26ouk8YOSlBTOrJeDC8TgB0kXPFLB/aso9E6MyqujqgE1GoyL5pAxwvIBOx489LFyRHj7nzqtWD1hZufgFrLcNC7nzVC4jRr5UASM8I7BVI8rp9JIY6l+UIIuC3PVobCyeWY31866bbEvu2SLy9tz1fibon1qM0OdoTih6XEbeucDY8eJyZMDafNY09140aXzXtrXEy7qcc9p43yEeLDXcO7BDk45SXrpEqbDDfGEP7HZkw6Vy5QgXjxmha/r81jSsPILj4LX4Z/FDbajAIP4FG96f/WhWfjAoPsiG/QOK51FP5QjLm/PhOOveVicF3Fi2MDQd2CclZvs4dJjPcjZq1mqpePpfr7yu5IYjtrqOApAbpjU3gGCBj0VGReltKT2OkZe2Z7CSLyk0qR/7sM0Oi4OeVf9oggWAKN0tkDp6xW8N/9hvp5Ot0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wsIN9eQg7KpupxFf271eLORf+uVZl+46kNN2pG6l4dvLLjy5BQRCcGK6Y/hK?=
 =?us-ascii?Q?Zc5Dq8Nw/Etg5MpQYfLG8kskAOAnlt1mgGaFRWOVeRHKn4k/VrQ7ZMkNdJHq?=
 =?us-ascii?Q?pHcFi9SK7PteX05IgAReU9EwwrFEgrEtq1AXELd3D+OClLeIagY1/pp2eedv?=
 =?us-ascii?Q?In6D/keKnm3Pc904blZ0BIt5ksaKmTtzTxSY7FfVthHvD2m5o3THwzG2YkaY?=
 =?us-ascii?Q?0nm9EVzt1HwYydG5/kRV29SIRX9vdNubtZl2bXSK7UebC2FsNhM2+edYQfx+?=
 =?us-ascii?Q?95KC+Rl+zsgG1a+BC7Y3ynzTTkPF4kkCHtCV7gY2kvmY+PBltpnrSWHd8mcD?=
 =?us-ascii?Q?AbHKs9vfva2IPNjYsNIDoCo9B2v0TuSz+6U+kG/X31GFUcaG3UclUU5C5aI2?=
 =?us-ascii?Q?AB3KcqytU7Ky5rBTRC1pPWjwoUAl1WmcYy03lUkKDkS3KCMFYRM8Z1way29y?=
 =?us-ascii?Q?O76hTosikmbomBDH7NjtE73Nve6KCMFJH1bmMXcG4+gaMfR2v6GvU/PqRlla?=
 =?us-ascii?Q?30cBPVujJKZAY+KRnlNLls80oPaZhQ1TYw46fe3il6dNrOFqMGN4LxBU9hzx?=
 =?us-ascii?Q?oBUqiS+mYJcUVhrqSS6xw7aJaYhev1kFn3lMs+fBL9xtQfMLRo0SEFnrnoQR?=
 =?us-ascii?Q?ttIvQX/YYQuJcncQF8aT2M6Xde3JxYtX51cAw1yo7XQsJ0utk5rZhAUQWeaF?=
 =?us-ascii?Q?hZVy4KQTjVtiikFJJ91dGctRxkTfzfZkX2d9yQx7ntwo4VpaiDBACVx/MURf?=
 =?us-ascii?Q?7V3NBcQ9VXHpObvPVVbVmlWQqiuDuD7v0n2BjydQDQ1dFNM1axstrAtwPkPB?=
 =?us-ascii?Q?GSEmrZomcNOIqGoKJu8SpZZsuGvtFOD5lekqMxQghg1u4aczcsAJ1rFZkosX?=
 =?us-ascii?Q?vjJvMOpDFlyxrGQuHOCD0YX4BEBuOO55aMEjptk0dxLPZWL9s0RLJmyAgCgY?=
 =?us-ascii?Q?6pFAALTsgFAlDK9ZttSot6nEX6wrr9WueshrmFR0VDFs/i887MoInVyt5tsY?=
 =?us-ascii?Q?eULPxMO/NTyB6+t/By//7T/yONzQ7ekHEgys+zShVhBSDzEeZHvblYVgF/Bv?=
 =?us-ascii?Q?6oq5otEwO0YJg8Mshd82fqPNRoYxnhn7h1a+XfvUXaAoBhWy94QMo32/68fY?=
 =?us-ascii?Q?3qWVvtJHGDTdU3J8mP69v/N1120Krdw+OquQ8k4aIxJYwk8iGg9h1V/ZY+dO?=
 =?us-ascii?Q?e64eWVGW6h261Y3dkUrXrzXERJ0VhnUh1HuOfKUk24dhGEg0Ko/ruEuv99bW?=
 =?us-ascii?Q?cSvnRZHZQ018l9ULWURfOO7yXb3/IFuQvy/GuzWSUen/vmy2gdwyBlkNbW0s?=
 =?us-ascii?Q?OEsvxZifzJO+/edSeU1MxI/b3xGQXXk2XwztudTsEISP0b5Ia0uCqoRj0j+F?=
 =?us-ascii?Q?Fl0TwaxTn3A/RX/P0w/Ix8gKUCBWKrm1Vwt9sxKzLz/08XmN8pvxxHQQLi7G?=
 =?us-ascii?Q?ZtlKIr3i0rOGh9Am/bS9IOcZ9mqrMR92Kl0wLLco8AwuPXVlme05VA4NIImE?=
 =?us-ascii?Q?hqDRbPz/A/D8v4hr5OYmaq+aQK1vJxQlE7iA2YsR3hhdu1PkuZP0c74MGG+X?=
 =?us-ascii?Q?qUegZnVwKrGtViQqx9dyeuA3hlJrz7wzsNUUYDW0Lq8Ga4w5UFVSy8WOBT/c?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb89f30e-918f-4001-7691-08dc331ed344
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 20:51:06.7396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCtTq4NLm8XJH242dMpKIARBPMnPHP8GKhoUvNZYUoACt+DSwmWrd+Q+p7BEL7grJQcSfpSL34ZD46Ekxv/+emw/y26f9OboaPQBhuoZacE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 21, 2024 at 01:12:18AM +0100, Andi Shyti wrote:
> Hi Matt,
> 
> thanks a lot for looking into this.
> 
> On Tue, Feb 20, 2024 at 03:39:18PM -0800, Matt Roper wrote:
> > On Tue, Feb 20, 2024 at 03:35:26PM +0100, Andi Shyti wrote:
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > index 833987015b8b..7041acc77810 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
> > >  		if (engine->uabi_class == I915_NO_UABI_CLASS)
> > >  			continue;
> > >  
> > > +		/*
> > > +		 * Do not list and do not count CCS engines other than the first
> > > +		 */
> > > +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> > > +		    engine->uabi_instance > 0) {
> > > +			i915->engine_uabi_class_count[engine->uabi_class]--;
> > > +			continue;
> > > +		}
> > 
> > Wouldn't it be simpler to just add a workaround to the end of
> > engine_mask_apply_compute_fuses() if we want to ensure only a single
> > compute engine gets exposed?  Then both the driver internals and uapi
> > will agree that's there's just one CCS (and on which one there is).
> > 
> > If we want to do something fancy with "hotplugging" a new engine later
> > on or whatever, that can be handled in the future series (although as
> > noted on the previous patch, it sounds like these changes might not
> > actually be aligned with the workaround we were trying to address).
> 
> The hotplugging capability is one of the features I was looking
> for, actually.
> 
> I have done some more refactoring in this piece of code in
> upcoming patches.
> 
> Will check, though, if I can do something with compute_fuses(),
> even though, the other cslices are not really fused off (read
> below).
> 
> > > +
> > >  		rb_link_node(&engine->uabi_node, prev, p);
> > >  		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
> > >  
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > index a425db5ed3a2..e19df4ef47f6 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
> > >  	}
> > >  }
> > >  
> > > +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> > > +{
> > > +	if (!IS_DG2(gt->i915))
> > > +		return;
> > > +
> > > +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> > 
> > This doesn't look right to me.  A value of 0 means every cslice gets
> > associated with CCS0.
> 
> Yes, that's what I'm trying to do. The behavior I'm looking for
> is this one:
> 
> 	 /*
> 	  ...
>           * With 1 engine (ccs0):
>           *   slice 0, 1, 2, 3: ccs0
>           *
>           * With 2 engines (ccs0, ccs1):
>           *   slice 0, 2: ccs0
>           *   slice 1, 3: ccs1
>           *
>           * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>           *   slice 0: ccs0
>           *   slice 1: ccs1
>           *   slice 2: ccs2
>           *   slice 3: ccs3
> 	  ...
> 	  */
> 
> where the user can configure runtime the mode, making sure that
> no client is connected to i915.
> 
> But, this needs to be written 
> 
> As we are now forcing mode '1', then all cslices are connected
> with ccs0.

Right --- and that's what I'm pointing out as illegal.  I think that
code comment above was taken out of context from a different RFC series;
that's not an accurate description of the behavior we want here.

First, the above comment is using ccs# to refer to userspace engines,
not hardware engines.  As a simple example, DG2-G11 only ever has a
single CCS which userspace sees as "instance 0" but which is actually
CCS1 at the hardware level.  If you try to follow the comment above when
programming CCS_MODE, you've assigned all of the cslices to a
non-existent engine and assigned no cslices to the CCS engine that
actually exists.  For DG2-G10 (and I think DG2-G12), there are different
combinations of fused-off / not-fused-off engines that will always show
up in userspace as CCS0-CCSn, even if those don't match the hardware
IDs.

Second, the above comment is assuming that you have a part with a
maximum fusing config (i.e., all cslices present).  Using DG2-G11 again
as an example, there's also only a single cslice (cslice1), so if you
tell CCS1 that it's allowed to use EUs from non-existent cslice0,
cslice2, and cslice3, you might not get the behavior you were hoping
for.

> 
> > On a DG2-G11 platform, that will flat out break
> > compute since CCS0 is never present (G11 only has a single CCS and it's
> > always the hardware's CCS1).  Even on a G10 or G12 this could also break
> > things depending on the fusing of your card if the hardware CCS0 happens
> > to be missing.
> > 
> > Also, the register says that we need a field value of 0x7 for each
> > cslice that's fused off.  By passing 0, we're telling the CCS engine
> > that it can use cslices that may not actually exist.
> 
> does it? Or do I need to write the id (0x0-0x3) of the user
> engine? That's how the mode is calculated in this algorithm.

0x0 - 0x3 are how you specify that a specific CCS engine can use the
cslice.  If the cslice can't be used at all (i.e., it's fused off), then
you need to program a 0x7 to ensure no engines try to use the
non-existent DSS/EUs.


Matt

> 
> > > +}
> > > +
> 
> [...]
> 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > index cf709f6c05ae..c148113770ea 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > @@ -1605,6 +1605,8 @@
> > >  #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> > >  #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> > >  
> > > +#define XEHP_CCS_MODE                          _MMIO(0x14804)
> > 
> > Nitpick:  this doesn't seem to be in the proper place and also breaks
> > the file's convention of using tabs to move over to column 48 for the
> > definition value.
> 
> This was something I actually forgot to fix. Thanks!

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
