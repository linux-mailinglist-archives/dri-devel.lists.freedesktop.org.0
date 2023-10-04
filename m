Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E47B8DD1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 22:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E268310E1AE;
	Wed,  4 Oct 2023 20:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35910E1AC;
 Wed,  4 Oct 2023 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696449956; x=1727985956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oQdV636krxfcu8MQypLiIgSuY4tJn+HW6mIcaav/bnI=;
 b=DjZ5qBEqJEew9/3x0Hl7F9+353/BEcLi3Vsh+p2+tZ6HEaXjShM6h/dh
 E+Uy5jbA+uYNCPTbA5Bgucqc3VTgyilRkS98g+z6ZPXBwXq5SPOF2hKhe
 Uh4qlEeqb86o4ixOVHNBnkW53fY0cb+H+jh0SraPwwYNpWwCsWm3Lf35Q
 HkkSgpcoLiukoUIE3g0XjcDSam14O4vi7KgGyeBZiOM+84Rhp2jgQNGkj
 0cz2mFH1HFjwwc8oeHPfLejh0mYuuf2oCewYqduFvHzij/iLb1XrlapHK
 czBZoyUCjnlUUizhodxLfROHL3DYHG81MqEX5fo1qaXP6obLOsf4I0GZn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383196098"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383196098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 13:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="780935426"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="780935426"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 13:05:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 13:05:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 13:05:53 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 13:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4R6tnc9hAuzvQZIXSjezC/g/uPpOLnIkmdkn0K/K+mt/qezUpNEQl0QJx2AmFHqPGMyux/23N7+muP3xxz0BiH/ClqS041+Yynk5zp4knX8ZC2QQQQxb2KTG9hEKEBUWB9GwiSMy/BXc6m0yMLFU8C0b9AvmMB2fOfMTSAi7vc4+MR2yxeN+fD32IZJcAS+aDjcy/UrTyIVIXo1HT5YuqVrGlup2h8OOAIrKDJZxGDtU9TdvdK9oub+OTjkQKzw5xApkCGRMExs9puvxIjHo3HHCz/SkDnl8sU2oSyaaqZ+nojE3O0R20EuGDbae6VxypmE68jL+6EDQow/tuZ7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoiBnYLvRS3Oo/8vstP+Uoevi5/iGSKeH5XRWyUCbn4=;
 b=TAW40OQBZPJx2AoMI/wDXg04s+KGcGZKBuz5ykITI5NYAtTILjd6hf/FGNix2SNrqVxm/ShSpAU8vBJqKQNgi0sAElXxHBnr8+TxcI9RD2G8SfMAMPvkOtjXg4Tegkgn9icf+CR1XHgm0LasFqr4aFhQrETidxZPlc5/QAE1AYLsG/O/PGxYoZTXo1JF2sDlyKcYwz/6twndIxxKdRDUWSsUFcr77bS4Gl2xd3HdKPyMwNXZ6Y7xkPEqMhcArDk0jgChU0/8xzDV4sazimlE+5mVAkygttOwvacK/oWK14VvWEqlNYvzHYNQeaA9QH0QvbIDT1vhiniuknNA58kgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8452.namprd11.prod.outlook.com (2603:10b6:a03:574::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 20:05:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 20:05:50 +0000
Date: Wed, 4 Oct 2023 13:05:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Message-ID: <20231004200544.GE53570@mdroper-desk1.amr.corp.intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
 <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
 <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZR2+fyV6fW9PyILs@ashyti-mobl2.lan>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 5601912e-e810-4a72-0378-08dbc5154dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lL7Rb1tMRfSkfj0UHdB/fwUwZ/61/M4/qbkTaq+o2kFhnx+p1JTVDaZUEQtdBoj16JAnK+imUf0CV7pKK7v2QjfgMwFQftPXrZBoPSVWZOf7gYVkG00KqMDX8vsJXvdqwFDQGvVe8GE+S9P7Nv04In4FKrvpx+hqoN9RedY18VjqxHgm5GKO2WzbAf0dLSN8dZe1uH7i98B1EFVj5ldUcKe5wxxjSD20Gs040KANiKUw//0ZnMFxWZEb4uRGXq5Dr9gd/1EgfpBow63cyZYzTZIymLj89xqNB13/dlDVpqWmRJzPQ2TtitF6+0zxXsZ/2HNJRFf1o2LHVGLBBi5NIMsQw4mr95X2OLGfhycCB3x7nlZyRe053HC9PrWuF/xqR6D4N6UbDwAROu3mxKvU8Ivciub1GnHeUiqQlzqBGtC1IWzSrqvIVOg8fn3POQsHySx70dNMxR0BAYYM6qiMRACIiGi1EBJ+jyAUgWRMu5DMc8/OWp2wM9ixhpvjSIrPQefKXbBZwRYtkEe03CmMmrS5GE80tQwWyrVNMKm1FME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(1076003)(6486002)(966005)(6506007)(6512007)(6916009)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(8936002)(4326008)(478600001)(5660300002)(26005)(6666004)(2906002)(66899024)(83380400001)(82960400001)(38100700002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33iC/dUawxEmwFr2jYEkaiv9Hmz6udii2M7idmv0TRF/ogauRkfcmgkLyGmz?=
 =?us-ascii?Q?6WVFvnlyeEJUYYKNIV+29Kfx0tjU90mnuAOBOT1/o0/H6xhK9WnvvaMndeB4?=
 =?us-ascii?Q?thLB1qCEMlsI286RRRvP3K+VVKHQmb8Xge7njc5o/ruflDzD9ME89Sg/c5L3?=
 =?us-ascii?Q?gU8yW4cEEbEAhKuQvfwvj5RQDji002h47KvI9XF/2Ms7MMow7T3v0MKgYqV0?=
 =?us-ascii?Q?W5giHTA/CE5/jQz+OtnbMUuZnwlKN1XIRU5eVbRv26bh6cxDijpBcotglKbd?=
 =?us-ascii?Q?iXaa4Jj1LApPaSbAMLdHVNY6UbzIGlNbmtjihsNLdQ+tVjLS8v/hedQSLnV4?=
 =?us-ascii?Q?brAbydV+aSAeEmtrtNuyv4h40Rng/PR0ZgZGCcP1N52uDwqaiuRuzrjzbeF9?=
 =?us-ascii?Q?HboNIiJVpQjSl60vS05PubA+r37LYn7/4UALVKgnhU94UwG9XZK5fHWkNALb?=
 =?us-ascii?Q?VBkNpWx+gibg28xFQbRWcRI2lur4dXvqmwaDCmRMj1MRqrWor/NVi3IJ3hcH?=
 =?us-ascii?Q?nttXN7SBe+BlPOAdtXiocQ4zIq927BrnRRublTuDCxQrPcZl+E80jL5fAoRK?=
 =?us-ascii?Q?aDOGRz6Amtak6HZ7nEnleg+HDdQywpELQr7EHAbd1RhQ5ptJv90ZVB/qCnQT?=
 =?us-ascii?Q?0ccNV0Xn2FWTG24pKxhy1NcOBvCj9FSKpvD0MutU8gSesbS2y3ra2r0oz4y2?=
 =?us-ascii?Q?9emdHp59AhGWFh1nI6sUedkljdjEe91u8EmffJ+UZSYnDDP3ypBAEa0oAvV2?=
 =?us-ascii?Q?w6/v97bAF6UAw5WkX0NgyiOd46+xjA4IAAzgT+xmo0KqIyhcQUcRiJj0RQmj?=
 =?us-ascii?Q?IJZVgN7XLL3k1ulcipz+OeY3g26uTIRT7ZO4OqVtboONJZMTYj/3PWZJJBVd?=
 =?us-ascii?Q?b6DrqPFCDGrS5wc9cgPonNNpQjzh+CRArATV1VhLVB+h6rYg33Qk+SbKjbG+?=
 =?us-ascii?Q?mqnbx6DgWVplnuJwcB/O7FhC+z/QIfHeNgBIpeTEg08aEwVSa/TPZEzludoU?=
 =?us-ascii?Q?rE0LLoJbjKhRgL4uNadvYn1EgMNGFII+t+r92hAFGWvsEcexl9dzy4kvsBjE?=
 =?us-ascii?Q?kDzG5opLjUg7lcUusxJJ3RdnuNXmdFyLVMrjoOdjTzHWirT+V4GKy6cUJqhf?=
 =?us-ascii?Q?t660l5qPEnC4OzuZV1x4hSQ+vX8CUGsDpgy650Dw6AKhHw3Tu5eplXD92bIi?=
 =?us-ascii?Q?flTrVRZQi9o6QE0Zf/q/evFg0yHNhiNZR2Mgr1o7T7YB83v4NNo9cbQhLqNL?=
 =?us-ascii?Q?E7yyZG5eARQaEZaSedZdbLf0Uv80U0s6szLkvP5csQrVpzhVKRk9NdWJZtsF?=
 =?us-ascii?Q?k7tvaDKYaAgSFokqBCRYJMcDt5yvNrVC5r7/vTtOKhM/AaXztVY34PuAoZeK?=
 =?us-ascii?Q?2FtpNFyekvhoHptezpb9nbYEXuZ2CrQy8fwrMqwfa/1/Cpg6va7WbjqMmItn?=
 =?us-ascii?Q?HcO9sJpMbTRwzPsyGwkfhZRq254AMgwbixx6letw/lskeV+iLAFIHWCGUDNg?=
 =?us-ascii?Q?vTePK7slRTL4YsVR9Yu6lo9N5dimGeWiW4iPxXi9rg4pMWw1qq9IikyXgKOT?=
 =?us-ascii?Q?oiJp/y4HrGeuU/KQeAeLJptQkS+FFAYvqU95ndzWXThYakJqXVzVGVozmHMx?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5601912e-e810-4a72-0378-08dbc5154dd4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 20:05:49.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJZMP2J9qXNyXI31MPTxX/1EPqMG2hcglxiACrXstDHlEIIJQ9pVFsu0iIYCc6y7lCkwfsrOgnaZiFYOyoSZwp6wbAUtmKAyS8bD6ykFwjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8452
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
 John Harrison <john.c.harrison@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 09:35:27PM +0200, Andi Shyti wrote:
> Hi John,
> 
> > > > > The MCR steering semaphore is a shared lock entry between i915
> > > > > and various firmware components.
> > > > > 
> > > > > Getting the lock might sinchronize on some shared resources.
> > > > > Sometimes though, it might happen that the firmware forgets to
> > > > > unlock causing unnecessary noise in the driver which keeps doing
> > > > > what was supposed to do, ignoring the problem.
> > > > > 
> > > > > Do not consider this failure as an error, but just print a debug
> > > > > message stating that the MCR locking has been skipped.
> > > > > 
> > > > > On the driver side we still have spinlocks that make sure that
> > > > > the access to the resources is serialized.
> > > > > 
> > > > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
> > > > >    1 file changed, 2 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > index 326c2ed1d99b..51eb693df39b 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > > > >    	 * would indicate some hardware/firmware is misbehaving and not
> > > > >    	 * releasing it properly.
> > > > >    	 */
> > > > > -	if (err == -ETIMEDOUT) {
> > > > > -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> > > > > -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > > > > -	}
> > > > > +	if (err == -ETIMEDOUT)
> > > > > +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
> > > > >    }
> > > > >    /**
> > > > Are we sure this does not warrant a level higher than dbg, such as
> > > > notice/warn?
> > > We might make it a warn, but this doesn't change much the economy
> > > of the driver as we will keep doing what we were supposed to do.
> > > 
> > > > Because how can we be sure the two entities will not stomp on
> > > > each other toes if we failed to obtain lock?
> > > So far, in all the research I've done, no one looks like using
> > > MCR lock, but yet someone is stuck in it.
> > 
> > If someone has the lock then that someone thinks they are using it. Just
> > because you can't see what someone piece of IFWI is doing doesn't mean it
> > isn't doing it. And if it is a genuinely missing unlock then it needs to be
> > tracked down and fixed with an IFWI update otherwise the system is going to
> > be unstable from that point on.
> 
> But I'm not changing here the behavior of the driver. The driver
> will keep doing what was doing before.
> 
> Because this most probably won't be noticed by the user, then I
> don't see why it should shout out loud that the system is
> unusable when most probably it is.

That's like saying that any random race condition isn't likely to be
noticed by the user so it's not a big deal if we're missing a few
mutexes or spinlocks somewhere...even though there's likely to be no
user-visible impact to any race condition 99% of the time, it's the 1%
that winds up being absolutely catastrophic.

If we're not obtaining the MCR lock as expected and are simply moving
forward to force our own steering (possibly at the same time firmware is
programming steering to a different value), you probably won't actually
see a problem either because the operations won't wind up interleaving
in a problematic order, or because the driver and the firmware both
happen to be trying to steer to the same instance (e.g., instance #0 is
a quite common target).  But even if they're hard to hit, the
possibility for a major problem is still there and basically we need to
consider the whole platform to be in an unknown, unstable state once
we've detected one of these issues.

Based on some earlier experiments, it sounds like the problem at the
moment is that we've just been too hasty with deciding that the lock is
"stuck."  There's no formal guidance on what an appropriate timeout is,
but Jonathan's patch to increase the timeout by 10x (from 100ms to 1s)
should hopefully take care of those cases and prevent us from causing
any unprotected races.  If we have any other problems where the lock is
truly stuck (as was seen after an S3 resume), that's a critical error
that needs to be escalated to whichever component is the culprit --- any
such system simply cannot be used safely.  Even if the KMD didn't notice
such stuck semaphores itself, one misbehaving firmware agent could still
block other firmware agents and cause major problems for the health of
the system.

> 
> BTW, at my understanding this is not an IFWI problem. We checked
> with different version of IFWI and the issue is the same.

It may not be an IFWI _regression_, but unless we're contending with
ourselves (via different CPU threads, which I think we've already ruled
out through some ftrace experiments), then it does mean that something
in the IFWI is causing the lock to be held longer than expected.  That
may have always been the behavior since day 1 and we just didn't notice
until we got a relatively clean CI setup to start seeing these errors.

> 
> Besides we received reports also from systems that are not using
> IFWI at all.

What does this mean?  IFWI is just the generic term we use for the blob
we flash onto the system that bundles a bunch of different types of
firmware.  E.g., stuff like pcode firmware, csme, EFI GOP, etc.  If a
3rd party is putting together a MTL device, they probably refer to their
firmware bundles with some term other than "IFWI" and may swap out some
of the specific components, but at the end of the day the system still
has the important low-level firmware running for things like pcode.

> 
> > 
> > > 
> > > > (How can we be sure about
> > > > "forgot to unlock" vs "in prolonged active use"?
> > > There is a patch from Jonathan that is testing a different
> > > timeout.
> > > 
> > > > Or if we can be sure, can
> > > > we force unlock and take the lock for the driver explicitly?)
> > > I sent a patch with this solution and Matt turned it down.
> > 
> > Presumably because both forcing a lock and ignoring a failed lock are Bad
> > Things to be doing!
> > Just because some entity out of our control isn't playing friendly doesn't
> > mean we can ignore the problem. The lock is there for a reason. If someone
> > else owns the lock then any steered access by i915 is potentially going to
> > be routed to the wrong register as the other entity re-directs the steering
> > behind out back. That is why there is an error message being printed.
> > Because things are quite possibly going to fail in some unknown manner.
> 
> Yes, agree. This has been already discussed here[*] where I sent
> such RFC for the sole purpose of receiving some opinions and
> check how CI would behave.
> 
> BTW, we are already doing this during the GT resume[**]... it's a
> bit of a different context, but it still forces the release of
> the lock.

That resume-time patch is only deemed safe because we got explicit
confirmation from the architects that it's not possible for any of the
external agents to truly be using the MCR lock at that point during
driver load and S3 resume.  It's still a serious bug in some firmware
component, but in that specific case it's one that we can fix up
ourselves without risk.  Any locking failures seen later on during
regular system use cannot be solves safely.


Matt

> 
> This patch, anyway, is not doing this.
> 
> Thanks a lot,
> Andi
> 
> [*] https://patchwork.freedesktop.org/series/124402/
> [**] 37280ef5c1c4 ("drm/i915: Clean steer semaphore on resume")

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
