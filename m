Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1499A18BD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1557B10E78A;
	Thu, 17 Oct 2024 02:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0+U3gLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48C10E786;
 Thu, 17 Oct 2024 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729133164; x=1760669164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FzzAdl1cXn2YMJ1mjl0AjIXgVqioDlIkTG3/XYW+liE=;
 b=D0+U3gLpoIAAKj2Wovv6i2+mAfHzVp8ZAAfQ88UUiy23n2QzhOybDmBN
 ASAo5J+HiWyId7QMxiPvZWsM4mCMZKmcNL9vcViX9V/QQrOFgWchK7VJN
 AxE9PD5PwA/dSbVSWWq3rP3RjpXEQ9HMr7sldnP/ee9O0V+Df9sFMgTGE
 WMujMnYMX+YEUfk9pDvoisAb6Kg4DR6DCValQEepeTzG7sSd4+jwd0ghI
 WXOqktjEdqiBMWycYsZSYPwEe5D7/Q50ZjOARGbY9r0rimBSYceUgXiIo
 gy3+q1aOAirYLbPhvDq2tWV1mx0tWN9oC9vEJbmGuwwrs/LbF1vD8ILBw A==;
X-CSE-ConnectionGUID: iCVdE2wZTN6S4yd7fLGESA==
X-CSE-MsgGUID: zMHyscAuQ4O7i5nfPIBOzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28485065"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28485065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 19:46:04 -0700
X-CSE-ConnectionGUID: jV23FiFjTWigVZwIPqq1JQ==
X-CSE-MsgGUID: u7k5pulWSMWXNbNUlF4Vrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78065283"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 19:46:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 19:46:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 19:46:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 19:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiuJl2eHieUH1QhA5ml4v376goofNK4KJQ+sPSBD97swu3M18oLO8x2/GHr5r83omBAYzQvgCnyfzVwUg5p2d9NWnND2HvQLm3Gi7lnpi2d/qjk+YT9BhoZN9llxkvx7zCzdHfLaDETdczNtbo9TKFK2ZRPU2aJM1OHZGW+IbKKlOEgxaoU7BLol1Ji1Uo5KwJKPYtCS8EdYWEofhlblrM7yaZOVoFSZRx9uMSPm4tpqhNV8cTstG5q1OytCgtn+Ho/RO4ICZ0XU+o0TSW5G6Z/Cqnx+vQBvRCEFZvxcxdRRefR5hZt7Xsf3bajZqldO995sNsPXhAqO84PSrqKKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA1VxH1oJMDD4lz7q/XTaSc/2vHNPlT4S9Podp+Jy/8=;
 b=R1vKyLFgECEKgRolun4YxldIkDHFdidQLsNvq7twGxbtLtLRuHf+1tUE36NsyE4RFzVYPX0Ly3B9Pqzouc7COfC6nQUB8WZBa1s35gvSNBwBZV/o0ZVhougG/06zOI1aDjhTTjPBLqPp2hqKNiRfRrpgrDNypx7oUM5yNP289sTkEzpqj0RBhx+poOQHSxkefHw5/DhKPQCQBfgCjtB8K/tP0i7e8jSJm/wQVr/jonXHc3pRS4auf0+njN+bHlzQ0JPNd6/iVe1yq1xIDDfmcqYZe8X/vjUbNZkMPtJ4sgqd30QEPDKgNowsl5uFCwFrIbRFHeoQkNIZEJl7DIrxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7008.namprd11.prod.outlook.com (2603:10b6:303:227::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Thu, 17 Oct
 2024 02:45:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 02:45:55 +0000
Date: Thu, 17 Oct 2024 02:45:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h69bo5u2.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b8c48d-5fe9-469a-a216-08dcee55d2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z82LMozlSQcjm7yLTSxPlRfAo9CJ+BPpEZMUZ8+Er4YcinQV2wB0Ef0y41Rg?=
 =?us-ascii?Q?h3fd40EIkKxUCcSPHHlxpp5pn/pur5XmUUd3HxX9VsFzQgkp+rtk21NHF7Qq?=
 =?us-ascii?Q?cAB3IgH6O3fnmcA1jLuByyLytuOGyDHRVwhFP1XNxJ3oEds036RvuHH/bl79?=
 =?us-ascii?Q?AYe5IYb0MQSWl+R/LjU+krs8LswnMQyrr9urwvOly6yLi6ZclHRLoV8Gd3nb?=
 =?us-ascii?Q?fKQxDP5LNNFD5cnWXuP4yst313gkOmHKCLh2b0lrl2v+9rdj53VLGm24Wdv6?=
 =?us-ascii?Q?5i+RTTz5qnCul7d/5GCQv2zUFATLhL9IK5kC6I7vJYkegtA/tDvpsIQMEkny?=
 =?us-ascii?Q?42hVL9C6TO63BYGVCt19QBBolglpdmS771nAYvF/ZQkG251FnvH9ujM2wYW8?=
 =?us-ascii?Q?R58e7THpe+HVfL0v7mUUk3a4ewTcDTHToJeeU3Z4UdTc36MaKAuCjTsZ5IU6?=
 =?us-ascii?Q?OU0M7xnPtmOlho6kHm9ml6QlAANis4XX2WYbYv/BN9k54af1xQho8jRs0USy?=
 =?us-ascii?Q?F96wGgspY2LghmnaioV4u+mFA7v+K9nVU2VwljSwQ1258uTbz1oYHMRP5n/Z?=
 =?us-ascii?Q?cOgda4E4iB1A3DjOoRjKsiIVqhuogwSF5mDC6EMsMXLRmONZspyBT2CUKcj4?=
 =?us-ascii?Q?4jd2Jv4rdywgc4DtpEgzou4Tg+ygSrraUBZC+D+n+7pp0XQ950Iq1aHzwxWq?=
 =?us-ascii?Q?MOF6IERRNILoPdawvSlLp9ImQmlYnW2rzCKf8AktahYg6xh+kpH2mlsBGsCJ?=
 =?us-ascii?Q?mFGRYvyXDUEp47r1DHOb3rgJSUXyAtmtbiAPzhneVsCQAUMdT44Q4fjFvVzS?=
 =?us-ascii?Q?fSdlV3A9z1s6iIHR/Iumb66Lc4cvbN9bkzm2NS3wqDMrEbEfe5V/mAowb5La?=
 =?us-ascii?Q?hUqOVoBXTb2EIFALtBFHDm9N1UOzhe1lTxjumITus4nra0Wx+HAuE80A8doj?=
 =?us-ascii?Q?PHnyM0pkzNWzkFBcTHhhh5CJKXerKMxTCaUzFqYTMhzOsb3ugxajyP2me0Nc?=
 =?us-ascii?Q?zuM7/q2aSnhgHqpTPtdAtUMI7ylG0hpXlwd8EPtM85nMAOdaGtMqAuew9ybs?=
 =?us-ascii?Q?nKlkZKY3Gwoiq6D1hOu8lERlFpLT+wxaha6zNmBggGrxwfaFfTpvorn+6+UC?=
 =?us-ascii?Q?gMOwZTmS1LB3yalSxc6fen2vdMgA9SJVELjm+F2OzMwJ1z8IjfBYk6QzpUqD?=
 =?us-ascii?Q?dcmthHbvQV5Gwu/3MsybbCaHprQMWq3sTHiaWfAP7gAEPXv8ThVEt3d31Fmw?=
 =?us-ascii?Q?2EMKUfrMGF4pm5E1S88fPn+T9YktH6X6CJ9zU4S0Vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+JgvEvgyB8ca0edJtng/8xPTnm7AwlxZSWukzd/5KqrGSSJUH2moXFGS2oC?=
 =?us-ascii?Q?9z3oCt8sMoxL18oPV3wZGhq7kytbFToxIij6TWJkUrSOqjwgGB+ny/pFMUVC?=
 =?us-ascii?Q?VYwxmrKnix+9wDTsrH0hMeQLJZffLLOs562oqiRneFWHiZFCqv7ZSAJSzkq6?=
 =?us-ascii?Q?EgsKaPQbRJoMA5TGxR7KCdO1zu8ioGGIDeT5xz9+0SFkn8EvbBiiFM4dpEEM?=
 =?us-ascii?Q?RVuxWQT5kpH38qss8gRNaE5rrDf6WsvxJi4SuWz1XoIJI9Eb71i6NWQBidFO?=
 =?us-ascii?Q?5Kd64XtRajK6v7byZTymER2WOgnhc/ja+Dl6klRGTuHsBz3361QP8AHDl46y?=
 =?us-ascii?Q?JEVxzzM1hC1BXQPlVueuaqUich8clc1i778AGfAb2cUeRlxZxtYbI8NCeQoE?=
 =?us-ascii?Q?950D8e7ek01Wh8rpT/UQjWFMZfc/8YRIQqaJgrpZ6eXOHVlvzUWV3GmIuRPW?=
 =?us-ascii?Q?XRvyu0NfdNEJ7QHNV8r7XIXC/7NhhvdxIHNVPIQT4nTH5/cmRlbNDvMSloXl?=
 =?us-ascii?Q?lEWiXGz077eL8fMq7JJ4LfREAFOheuep/QH8AxnNQZfnBXCF2XhITgrYqpel?=
 =?us-ascii?Q?32k4AJ8OD23aktoj/84DR6laLsX+kSy9OXEZO0k0lQH5ZErPWJvCfD5M4mNn?=
 =?us-ascii?Q?qw+VCJVXftK//nsZTHrzsgpGEasINrTTpfpOGaYulYYEN2XSTlP/BafqGBcn?=
 =?us-ascii?Q?HHRsA4IT7OnVgCXe7Kaib8WNiXUEwgukXMxLLKvgOwiNKLQvgq7fBEsR+8Ei?=
 =?us-ascii?Q?q2E1a0DujnAQkmNIKJ5wgJSoKyaftYd/YqaICSJdFo9q7Ev31gJ6YS/3Oag/?=
 =?us-ascii?Q?tbDYcIt1NwaCcW4Z9x1QSZyiqMN5EJMyA4lUPc+8au8eHDjodZ6za+EyJ4MC?=
 =?us-ascii?Q?BYAbdIO/C2GMXAYw05yIYLUgUQG03SIsF3uz8tRs3zOlTKqTuUcnOCBAJcS4?=
 =?us-ascii?Q?k08vieKvlC01xeRd7mZI/AZWaik1Z8D0KXmgcnE7EkbvaekW5yLnI0O9D8bg?=
 =?us-ascii?Q?DtbrRXhj2mKvTphW0eyOUnuFISQIBBnP43LL4N7X3OQbbM3l/EZ4RGb7cL+u?=
 =?us-ascii?Q?mq08JUuY2GMKoyDTgABJ1jlE3uAKQTPlnfBf61vjkSD6aHptmeYr8KJr6jOl?=
 =?us-ascii?Q?PhU6FI/jm9AnGJrKIWOqfQiB4n65sCEc3f4b8VJrCMqpSvl/LkUk/4Z30ZjC?=
 =?us-ascii?Q?WwZFsC/4WeBZNpIeh8hJNsEgKZB6GF4wTnho28zEaaWpSHeew29UPwIHWRL6?=
 =?us-ascii?Q?aH0Q8YQws9AhO2Vu8qhsG3YYEdPNncxlJaPTppo3Ani03Z/8lgxqe212+4zE?=
 =?us-ascii?Q?vEsoJhqCZa2i3lnZSyHbKY9VAPDAHdlVDXov2GTIIhAf5hDUuYN/+RKjJbWw?=
 =?us-ascii?Q?HxOs60bMsI69rRb+JxB+1DfKVcOW8W86hIpggk3po60SIpbnzL6/7UkwcPxi?=
 =?us-ascii?Q?u5IJdQMrrqdshEQkM/cYcFxedcJtgR3Vh5dj3wNuKihgO6j/WR9zsmo/xaTk?=
 =?us-ascii?Q?vCZlzzaSJDfYCfJ/1J93PI8eAOpBBZWQFVoD+dJFtx6D51XmMq5O+DPzTJmR?=
 =?us-ascii?Q?lqzTPynuyw2ziyEvD88uo4/cqwCFVh1GdGirG/5YjOgZ/atyd/9ccFP0afut?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b8c48d-5fe9-469a-a216-08dcee55d2bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 02:45:55.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+nocNPuXxxu4JBVaTVrpGqS6ek0GDx6hH6CnCTxyK/mQKyFfX7RcnxBuWfsH8O3kM46FN7CFcObIhS5uNu58Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7008
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

On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> 
> [...]
> 
> >> > > +{
> >> > > +	unsigned long i;
> >> > > +
> >> > > +	for (i = 0; i < npages; i++) {
> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> > > +
> >> > > +		if (!get_page_unless_zero(page)) {
> >> > > +			src_pfns[i] = 0;
> >> > > +			continue;
> >> > > +		}
> >> > > +
> >> > > +		if (!trylock_page(page)) {
> >> > > +			src_pfns[i] = 0;
> >> > > +			put_page(page);
> >> > > +			continue;
> >> > > +		}
> >> > > +
> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> > 
> >> > This needs to be converted to use a folio like
> >> > migrate_device_range(). But more importantly this should be split out as
> >> > a function that both migrate_device_range() and this function can call
> >> > given this bit is identical.
> >> > 
> >> 
> >> Missed the folio conversion and agree a helper shared between this
> >> function and migrate_device_range would be a good idea. Let add that.
> >> 
> >
> > Alistair,
> >
> > Ok, I think now I want to go slightly different direction here to give
> > GPUSVM a bit more control over several eviction scenarios.
> >
> > What if I exported the helper discussed above, e.g.,
> >
> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >  906 {
> >  907         struct folio *folio;
> >  908
> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >  910         if (!folio)
> >  911                 return 0;
> >  912
> >  913         if (!folio_trylock(folio)) {
> >  914                 folio_put(folio);
> >  915                 return 0;
> >  916         }
> >  917
> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >  919 }
> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >
> > And then also export migrate_device_unmap.
> >
> > The usage here would be let a driver collect the device pages in virtual
> > address range via hmm_range_fault, lock device pages under notifier
> > lock ensuring device pages are valid, drop the notifier lock and call
> > migrate_device_unmap.
> 
> I'm still working through this series but that seems a bit dubious, the
> locking here is pretty subtle and easy to get wrong so seeing some code
> would help me a lot in understanding what you're suggesting.
>

For sure locking in tricky, my mistake on not working through this
before sending out the next rev but it came to mind after sending +
regarding some late feedback from Thomas about using hmm for eviction
[2]. His suggestion of using hmm_range_fault to trigger migration
doesn't work for coherent pages, while something like below does.

[2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461

Here is a snippet I have locally which seems to work.

2024 retry:
2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
2026         hmm_range.hmm_pfns = src;
2027
2028         while (true) {
2029                 mmap_read_lock(mm);
2030                 err = hmm_range_fault(&hmm_range);
2031                 mmap_read_unlock(mm);
2032                 if (err == -EBUSY) {
2033                         if (time_after(jiffies, timeout))
2034                                 break;
2035
2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
2037                         continue;
2038                 }
2039                 break;
2040         }
2041         if (err)
2042                 goto err_put;
2043
2044         drm_gpusvm_notifier_lock(gpusvm);
2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
2046                 drm_gpusvm_notifier_unlock(gpusvm);
2047                 memset(src, 0, sizeof(*src) * npages);
2048                 goto retry;
2049         }
2050         for (i = 0; i < npages; ++i) {
2051                 struct page *page = hmm_pfn_to_page(src[i]);
2052
2053                 if (page && (is_device_private_page(page) ||
2054                     is_device_coherent_page(page)) && page->zone_device_data)
2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
2056                 else
2057                         src[i] = 0;
2058                 if (src[i])
2059                         src[i] = migrate_device_pfn_lock(src[i]);
2060         }
2061         drm_gpusvm_notifier_unlock(gpusvm);
2062
2063         migrate_device_unmap(src, npages, NULL);
...
2101         migrate_device_pages(src, dst, npages);
2102         migrate_device_finalize(src, dst, npages);


> > Sima has strongly suggested avoiding a CPUVMA
> > lookup during eviction cases and this would let me fixup
> > drm_gpusvm_range_evict in [1] to avoid this.
> 
> That sounds reasonable but for context do you have a link to the
> comments/discussion on this? I couldn't readily find it, but I may have
> just missed it.
> 

See in [4], search for '2. eviction' comment from sima.

[3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
[4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78

> > It would also make the function exported in this patch unnecessary too
> > as non-contiguous pfns can be setup on driver side via
> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> > in [1].
> >
> > Do you see an issue exporting migrate_device_pfn_lock,
> > migrate_device_unmap?
> 
> If there is a good justification for it I can't see a problem with
> exporting it. That said I don't really understand why you would
> want/need to split those steps up but I'll wait to see the code.
>

It is so the device pages returned from hmm_range_fault, which are only
guaranteed to be valid under the notifier lock + a seqno check, to be
locked and ref taken for migration. migrate_device_unmap() can trigger a
MMU invalidation which takes the notifier lock thus calling the function
which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.

I think this flow makes sense and agree in general this likely better
than looking at a CPUVMA.

Matt
 
>  - Alistair
> 
> > Matt
> >
> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >
> >> Matt
> >> 
> >> > > +	}
> >> > > +
> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> > > +
> >> > > +	return 0;
> >> > > +}
> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> > > +
> >> > >  /*
> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> > 
> 
