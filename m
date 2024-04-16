Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FF8A746F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 21:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103EF10F1BC;
	Tue, 16 Apr 2024 19:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RP5WY1u5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99610F1BC;
 Tue, 16 Apr 2024 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294915; x=1744830915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yq9ryk7DooaMTsmLhWz5wAHaxgZX0qO3laTKvfZW7qU=;
 b=RP5WY1u57juPG14vSO5CAY1gwDsbI1FnKSUthkcqX4BxBXePGy3jupuW
 w9AGxUsOmYc/PAQD1zZllW3jav0PqbAri6LXEZOTFUrlLBQ+VZ5TXLPfb
 cKFr8ONvsFo8wfKDTR6smeFtQUDtlfS1nWIS3ckVMeQfl6xJ7UinF9yXZ
 T4sMKl2Wfy88M1hnW8k5H3ChMZRg4CzKMkyzW4/kLHhzpaTTtVAMCwCWs
 0jB0lBzWcPJpG/XHPg+LEEGwv6kcbqnq72SDX18YtTRect6A7Uh8gLX6W
 6UNzyZcmc0LdySTGmpsC+oHFR2qoc50NyXrfQNAxqPgNsPscKsSMNFstz g==;
X-CSE-ConnectionGUID: OGyKJy3MRo+aqUIJaq6y3Q==
X-CSE-MsgGUID: mC9AnUdPRge4sLcMmSQA2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34145789"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="34145789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:15:14 -0700
X-CSE-ConnectionGUID: gBfUgT7bQuGipkx7/oUz7g==
X-CSE-MsgGUID: 5+SdpzeMRAu66hKCD4OzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27151333"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:15:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:15:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:15:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGdpiay85+/k4LD0okHWC/RTYaQd8gVQhCLNJL4R0ZZjT0f0CneedVn2otQgg0mRY9HkXPg3Idskjrwkz4NyD1yXx7F1rWa7+vVf24aB2gLhVkQ8BqV9rVfb2gILZ0uk0pVDbNpgKebD1HJ/QJAner1LBu0OjijTmTjV6Kqxd8DqJI3sFa0pkMFTlr7qFlF/jl27YOXU96WIVSUNC15gSSEUvJimGaH1GC5zAu3FrR721tPPGSpwEvRQ84AahuquEJjqzvRvTkhraM92RSKOzZ3DHkp21XtmRB4lADoraMuDy8ZW43aIrnp+kAbRHb3I2tBp1kGXbFRN0CiohVlXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDYZWVAKbOulFCXqZNHZEtxXdx0ScwJgMQ3i25Jd/sM=;
 b=oGMgnDTngFsQtYp5jPyEAFCkualUN/3FvTuw/jk+BZSUazd9Dd2cw2sC9e+KBroA8w2fNopgOs4xCuy5PU14tnH5mX8Lcyjz4M/ebBSzgTVWgBT8KFIjDMKHR2/Jvu+lZf8DSEfNXQQb0wSBNZ+OiRSZBecFCy1ix65qgLsOiJrDND7Axsq1SaYO8ISz1ww0sFJvxd9xr4YYx1VVJV3Odg9AUHbjhKrnQtquqLtnVmTOeq8B1854+SlIGs1mWYejpgcvDrW1o3WGA6ozYnGomWM3fyubehH8imov7GavoKmDI5MOUqe9MItA+C6GiL8+5NzUAYtA8SYDu5s2MNzg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 19:15:10 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:15:10 +0000
Date: Tue, 16 Apr 2024 15:15:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Badal Nilawar
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 <linux-hwmon@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
Message-ID: <Zh7ONCTo8GOOC9UO@intel.com>
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>
 <Zh7JmPQ8XRJwMQnQ@intel.com>
 <85jzkxcerx.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85jzkxcerx.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: d610659e-f6c1-4f9b-2815-08dc5e49887e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uztz0qh1v9N1ZY2RoFAz6Gx/GlJbjwt9vJzzNec2fcwNJ9QdPzUP74Qce0JA9A6Sq1klSCrqNbQnpTfv5pL5f/TYF5WX1v8Ah4NLWxn5iF4MxoUOhs7BTnbEq8rOyQukPC2N+hNM7xAM5qIQ+HzkEdxy4S0FgbEGOgJ4hbeE0fPkAas4t6OWOeVqTspD51OVIHhI4ykQkEh1NFprc1eG6F8iCNW2dZt6aFZ0a0BPegPAN3niXYMH4HA7wJ2Qx1JG8rsRXtiHgfjg04SGMHx12CNnfWvF1eGgmR+a4yg0REnYUX9P7qNV6Wf5J1ZW3y+QLsmKqjqH6LHHdd5g6ZvhUwQLR1qsjoelTUcsf4iVPfl7uLfj6zAAqtJFeTcIBwzqUVr3ZwXQuQo2w86ogHa984iF0uOmxeKRrbLvDJAPaOVf0WqEbMB5dDNpjUjK2DfZZc6Jl88b5v/46NAWkbe01M2iQcOi2ZR/UQd/nPzOTuYGNUW5U2VAMP+jJvYlaEXhvrk+7LYoewhMsFoA6znr+HCnAT0++JHEsunN0sSqVmE/Od/5FztJoSO3y9Zp1XrFUhuqnrj573ij0EFLXTuNO9HBNObM5yW80N9fRapYhVatcFRdRvgtlgcO+Cj/jRfbdjzI17kR+DwS49Vm1LV9NqoR/f/1TABUrbF2Pck86oc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ibs/GL3n4FgXCuN+y8DV/U4C5Dm6JZOqU39gEq922xzlnfsIZI26UuxfgmhX?=
 =?us-ascii?Q?dWEYGgfnWPVy1PP3CFiLd5l1jTmS3FDXD2jNUvQyksy5Nf3bK6cBdyFsP+La?=
 =?us-ascii?Q?x2g4nMg360kehNb0Z1keOElO1/DTM3/EMi/VY1h9GC0+cNoUciHp0lx3hmyy?=
 =?us-ascii?Q?eIC5cS+qgD9g0lIeh837XhNiJoViQe5g4cvgXfkbFwmhq8q9ifEEAs8kpl93?=
 =?us-ascii?Q?7vsryKk2UyYLDjR4jVdOoupRUSURVAeNluN31RpdIZT0+NMgCKczJPBKaZbl?=
 =?us-ascii?Q?gpPYMwSRmIbJGQglsqXl5nRwiOgTGvYgyJZwyEGt6ZfYuOEllp4w6U1QBMR6?=
 =?us-ascii?Q?suGpZ8kzG3fY0WOEipvwVYKQ7dkIKrDIexn8Tuk/CqDT7hcZ46WIpnLgNjam?=
 =?us-ascii?Q?KQiQvd8CD32rLhW8iCGsW3c8dfwctae+pcLGUS5xlABneRe291OL+fbeULEB?=
 =?us-ascii?Q?7W5AwTYu4UVPMhU4ztER7FWI1jZYXcuIRPp2RvYGB4VfcPeCPyERhJiIrrAc?=
 =?us-ascii?Q?JGNiUFTD1PPri1HSKQeXsitl+GQqUgXwo5VESP6zXE9x/GlBHeG6gxsrI0sr?=
 =?us-ascii?Q?wu4nG5eEm43k6z6QsFbWdHPZP/iXsipAtz+RaAsnmKPlFlYn05UOGkM+48rJ?=
 =?us-ascii?Q?qBpyrFRYLcJhd8gVYuvO5FlzqkJ9xkWiGZrXO3XBBUtcqY8gbAwrfAE4+ggS?=
 =?us-ascii?Q?Sx5HiKUEINUp9QRfYC1lsA7H/JZTs/jXiWstChOo5TvrCzSDVcZ6sazCNndZ?=
 =?us-ascii?Q?hLzHOaQ/gcffKq9y2V1sRy6zHSjOR4ne7r7EtRU5ScT1x6KmpUdCmrLJgOvv?=
 =?us-ascii?Q?2rAQcVGm42XXBdXUk80tP38exEEhtTlL02cu0iVxy+ej0/I3qr88EUXq4jWi?=
 =?us-ascii?Q?g8qli3daUvxLNNgL66B6LVvtZDgC+hBi996s3RAor0CnqenbmfQINS/oySgZ?=
 =?us-ascii?Q?dOZNkvvO2FP/ZguUHmacfkKtbF/ifiWASxYUi1F4p02ypva+lOfW8kpf6kgU?=
 =?us-ascii?Q?XaXDooRxguXANF1ypqXCnzPB3uAcznFytk63ho8EyohT4EWPfdpJFXheNzyV?=
 =?us-ascii?Q?lWkcBzna1390qaYzFRJZcOiARCpLpR3ITgyd9+/whgkaYI1cJEB+GQ8mpIp6?=
 =?us-ascii?Q?/DWpKypQ8MaYFZo5f88HUvbvXAkACofo+7wbsyfzxbh7sLtQk5Cymr7E4ODA?=
 =?us-ascii?Q?0Yc7vuqHtiJVdnUp+hZiHdQ+DwYLS/yrP2kbzWJdwtlGYuHYWz507Y6B3cam?=
 =?us-ascii?Q?7oKuJkKS48eTou4T1CKReqpN5gkrwsvVfSM1BZ7EsC1pY47D2uiGiann9cFj?=
 =?us-ascii?Q?cZcQMF4Ln/u4eBJhwEbAqX1EY8beHnczjTUrq4GXSZaSuHPAoQWZIDKQQqOa?=
 =?us-ascii?Q?IS28Yhf9pfZEz7U865R6Pex6r3sIIBbObU5QI3gx5RhQLr8UMMr1Prt5sXYE?=
 =?us-ascii?Q?gVGytjIiWsPMfOUtIjHEYuN+9pArSkvS7a6WVESDBms6+0Ka8aO3req42+yS?=
 =?us-ascii?Q?Qv2kE/dFZyg6CU8PnRBKbdsqiW/6x/aUOYzsVTgRcbgwOjGqQd1xsdudK3Ib?=
 =?us-ascii?Q?ekCTEs5Yho2Al+A1Vv6jsIYWxtqWqiLy0w4oiQGx4qZ20mxnYOTOFCtMEjwU?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d610659e-f6c1-4f9b-2815-08dc5e49887e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:15:10.0453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7r5/wKh7ZbbcRTvhD1Oo9M03obAAh4QILCEQUuxsEBGDpWEsmCkuwBoOVEvrzUkD2b66Q8nvujznrjfsZZpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
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

On Tue, Apr 16, 2024 at 12:02:10PM -0700, Dixit, Ashutosh wrote:
> On Tue, 16 Apr 2024 11:55:20 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > > @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> > >
> > >  void i915_hwmon_unregister(struct drm_i915_private *i915)
> > >  {
> > > -	fetch_and_zero(&i915->hwmon);
> > > +	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
> > > +	struct hwm_drvdata *ddat = &hwmon->ddat;
> > > +	struct intel_gt *gt;
> > > +	int i;
> > > +
> > > +	if (!hwmon)
> > > +		return;
> >
> > "that's too late", we are going to hear from static analyzer tools.
> >
> > beter to move ddat = &hwmon->ddat; after this return.
> 
> Yeah, I worried a lot about it :/ But then finally decided (and verified)
> that we are never actually dereferencing the (possibly NULL) pointer.

yeap, another acceptable approach is to simply remove this check entirely.

> 
> But not sure about static analyzer tools, maybe you are right, I'll move
> it.
> 
> > with that,
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thanks a lot :)
> 
> Ashutosh
> 
> >
> > > +
> > > +	for_each_gt(gt, i915, i) {
> > > +		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
> > > +
> > > +		if (ddat_gt->hwmon_dev) {
> > > +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> > > +			ddat_gt->hwmon_dev = NULL;
> > > +		}
> > > +	}
> > > +
> > > +	if (ddat->hwmon_dev)
> > > +		hwmon_device_unregister(ddat->hwmon_dev);
> > > +
> > > +	mutex_destroy(&hwmon->hwmon_lock);
> > > +	kfree(hwmon);
> > >  }
> > > --
> > > 2.41.0
> > >
