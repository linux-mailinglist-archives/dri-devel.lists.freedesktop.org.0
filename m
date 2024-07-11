Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738BC92F12B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 23:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF19710EBAF;
	Thu, 11 Jul 2024 21:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fh4CckVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDF810EBA8;
 Thu, 11 Jul 2024 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720733624; x=1752269624;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8aZ0p5Q2HsO8AffLfBQg9xtywlTPGIPk8si8iGa3tgs=;
 b=Fh4CckVA9pEhNmGs56xi5o99b0enq3rIVu80/EtxTOd6M4FBCq26vnRA
 HAHP9pf4n8M7hYKctZXmw8AeljS/tNiqPiNW3mzxxORK7FMoiz687PwnG
 Pm/FCr64MajqZjSeu7Ad9ZtusoNsd2RSgrS8rP7r8vUlZ11+467QcXNX0
 /j3vwm9pau3dg5+aBu1ANPL5varI90jQoW6E1fzlbtHTBRZgnr7tr5rFk
 PKHyHmVR8vNNDBvRN+6hq23rie0SO+B5Q9j8/sg6qbNiURgvLGaarOlaK
 Jmp8jH/ziK9yMXyIssu2RHWcMhvb8UOD3Q0wl/+1h6WyNpmBM6/58RToa g==;
X-CSE-ConnectionGUID: dgTPXkQISMuIqD4g6NaGJA==
X-CSE-MsgGUID: bOyQj18KRxCmC6lLVLvFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21910875"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="21910875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:33:43 -0700
X-CSE-ConnectionGUID: Eiq4wwUXTWSTmnx1SqEJOg==
X-CSE-MsgGUID: p/p0L9eqQrywLXNxnNE6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48599417"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 14:33:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:33:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 14:33:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 14:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icPu2L741PCoOEeews30+CZV6M1C07HmhVPgj+g+FKmdcJdr9a0LANvlx6jQfhgd2uaJTSbgdfd7VqB0o/OxnOnE3AF+Ey2dU5QmNJHpcMM4COXkhx7J9zplJmFRrur6xr8ivlo2gy5lVfVxafa2dxDkIHuoVnO9A8odqy2Ouu+Ghx9jo2/N7z2E92CtVWX0EAAEbXHiJoChB/ySJ98+FzPzLy1bbmljdZ6+N87U0za+zfjjxhU91MGUcIz2dUmi44JnEKmTTgT7wQiV6CfQbeMHMrLx/chOQ00+sOV3XXp9sY7l0cI+TSAcog0UJzcvXyQBUIkOUZsax9Vs2BbPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CrzJ7LjF/GIg3okT3NSwN+3W0+KFTc40wrOTcZ/qlI=;
 b=o4DMFqmBZgrs7L3xe7mUBj1zvaVDyGhvuMAhIfcZhWqFbcySNbsUx58+GKQ4lX4DK+MOSgVDpXxgLywrBcSO9URiWSyT+asTdXurjG11i1Uci5d+MjnFzFO+s/ioxbNIwaD4hZdbSLKkAfMHKPBghBHiaBEkUbq8+LNj/YmC/h4oaNh5gGgaQs8/oZn6mnuOjLXQ62C5GmFeba/3JMH6xHvJnZ5svsaiUseRMxN3eCOhPjxmUq4wT//dguhoupLb8vWSULTyr6yfaaxVY2ad6fKgF7417dLs4raCgop/dNww9m//RaDR4tUWoin6R4c6IUqh4TvrzEwQNMQ65tHYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.38; Thu, 11 Jul 2024 21:33:40 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 21:33:40 +0000
Date: Thu, 11 Jul 2024 17:33:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, <ashutosh.dixit@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next-fixes v2
Message-ID: <ZpBPp8QDFCS5S5L4@intel.com>
References: <Zo_3ustogPDVKZwu@intel.com>
 <172073334417.323134.379928595741854448@jljusten-skl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172073334417.323134.379928595741854448@jljusten-skl>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf48627-d9b6-458e-4019-08dca1f1217f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mQ9oQa8nLe/aaUNp0FTe1hM3sQFRD7OOMU239AgCFa7PpPMKyVdh7++TYcah?=
 =?us-ascii?Q?9ItC8pac2o173O05DpkCau0FE7hObvMHJRWU8w31IGsLRH+cp7nfepIdRoUp?=
 =?us-ascii?Q?1Rufs2VgfyL2p8h3mKwYOUMUsdm4Mu/ICJce2pfP5oQO9TZacMX5FcYn+SmL?=
 =?us-ascii?Q?0sLEyh1nT2hCMV6wwKWMR4BDR5akuos/NRyiR6KjQ/nZt7B2LEaWGHRZL9W2?=
 =?us-ascii?Q?h8kYK9lQBV/XmWYhu0lxLYMnCBWkA4gmOHFqyxPA1lwR2cGwIqX37nF5FmPV?=
 =?us-ascii?Q?WO2dzQ3Hi9uc6JllnLYDJ8mngWZGjP+E/F4/2C8jQ7o39a8XZlcamZrp1+BY?=
 =?us-ascii?Q?oP++fCYOONymchUTXNpGB+TI3BHPQyr49OFEDibUo0ptGQFpbV6dD3jINZos?=
 =?us-ascii?Q?Rd1ajytGVEnRDLEIXcJwA9ttVXPY1rfMsLEWZmeTwBeWd96XAkUgsW796I8e?=
 =?us-ascii?Q?i3z+eZDNGG+bzlVX7S6Ug/+so5TGhcCHBjw9ZeD7fl4ccohCK+25y+ERamhB?=
 =?us-ascii?Q?XUZg1tRTcAOUK5sKf/G3yN5DWxR6osv4lj1PdnBc0NJ49giE/wmGidMhGIIp?=
 =?us-ascii?Q?lqr31dml+73DWknQ+mnf/jDgbHbOMjJu8GvXXilH72McuYVm9nwm62IIwNHD?=
 =?us-ascii?Q?YhlFYZeLeTdjGOBzLi261UmXyn4wckFXTM0nl1EqHznTHDdQZfmLrFLvloNU?=
 =?us-ascii?Q?VnyO3/s+In+MUZZhIRTPAte2Jupe3WXrefYlyaqNme7FUv5LSzfN4sXxlli/?=
 =?us-ascii?Q?CSNfOcI5UN0IXtEt2X3OaxeP+QRfMQWgkUUtBWeHaBNTHqT2OE5wPlaDqbo4?=
 =?us-ascii?Q?9idZ6O1L+aQ3LZa/seIC/Sd6YXMIjnXSyaLk+faTjnGwrYpfpANSFaTz9Ga3?=
 =?us-ascii?Q?BCjzlHKMvkB9OrmZYuIzipoSZxBYbCxi+kSCIxukb6W2JVhrOTlv8/OeWeIc?=
 =?us-ascii?Q?NH9xYcquMktVStHSbPW42e3YyQYdfFNgDpc5gOSFlHbLL4AVkdZz+rP4K4sv?=
 =?us-ascii?Q?wTCgGH0DETjPlcKub+p3M1QtP9sw/J3rNMqd58NYqfrHUvmDtx3F3YK7Rl+3?=
 =?us-ascii?Q?1M6VlQfzXRKxufwgsHMK6d+opr/pToHMiwJS3xSBWbGS/lYvGIhtwn29zjyk?=
 =?us-ascii?Q?lKtv+Me3OEZSF3Wcl7eC9WmJc33Uk+JTlHcDExmOTgI40v+cHjpxjYOiHNN3?=
 =?us-ascii?Q?V1/8G5Azhlz0j7KQX6ECCkCbCWbMkgMTEci+CALBWrYPM9xQQ0cx5BvcXyj3?=
 =?us-ascii?Q?Ds3QI7jKyEwl9BCgSuyZ/mBTZQy6h+BnOv+ygAc3AliVOgLzCCd7wFXP3W9l?=
 =?us-ascii?Q?DEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q/ems8ljvZ3y/grSab/QaKsn4z0Y+3xYQucgR3vhVqMC+Mish28N36pag/qE?=
 =?us-ascii?Q?V5DocpnN7vmyy4b3UBhoui2uBKcgLZB/aCSlUOPHPLxqXopFJ/6n8ajsOcvJ?=
 =?us-ascii?Q?LmzQaYrG2kvQdX84XzuKtO/vFbhOnP1bVHt5XcJXnWazRMfv9E+ocuV4G3dc?=
 =?us-ascii?Q?o9irUP9ZedX+Me6YPxi+8nnaXYZJFTx3UbNkWs6VQs2rKItLuXWYGfAgHVW4?=
 =?us-ascii?Q?lnIhpDj0LHLI14mDVHBjydaYB6MVeEx7FGhmXAlaG6Vdj8k/Qnxc/o73y5s3?=
 =?us-ascii?Q?XnFK0jFdTbXEUNQbyxD4a0Gd6rkAJM/ExoJv/qATXXgib0iR9Zm7eCvlDjiU?=
 =?us-ascii?Q?LQJHrQ8puln5tJv9ELSkyhUVQxCZ/9Bk1iHa2aKA/dNZls5hms8rsrgnVC+a?=
 =?us-ascii?Q?AzQhLlMmUI0qmdjQktngEC+xf+R0xWNCQCNeKrVk+RLdGeBddFA2far++cFl?=
 =?us-ascii?Q?2T8jQPAegwMqJHTQnR2rXR8DpLkP9iYp42RvDG+ZkB5XIczTLEJlhyGCgUSh?=
 =?us-ascii?Q?aE+tTeEsC/VueEsdpEX/d2QLVw/3ZHUzS4rHQHm2qNsKirPUX34u5BUCecHp?=
 =?us-ascii?Q?COK0sXN4Z96k4ey3e7C2NW0EzEFAxCbDp8W5gwkE8U4uQJSeE1D5hajGBiGW?=
 =?us-ascii?Q?TZSwkTLBTlcDNZGnBZK3vrknTydcWTmppQ3K0fAEaWJnDgnrSObDFOHjzVMZ?=
 =?us-ascii?Q?51Vv5snwCW0fTMbt1a/mycqEtI/KmUnbI1stn3VcCYC7izQYhlozjQ6QCdNc?=
 =?us-ascii?Q?olpYTSwjGwzApe+1Qp4L5WI//wE3NPhFPhnGzgazzLkHmvjki9SBkanqqDOS?=
 =?us-ascii?Q?76Oz/Dpm33XIH87Pi+vQhh0fGLZ3VFPdqaxLnwSL9wSCeR1VphFtKJ8g3IKD?=
 =?us-ascii?Q?KZQQgcNPCoAy/r1NzNOfpGvtvr4F4s4glfARvmRHtMEsywpkzpEkRFxbl7hy?=
 =?us-ascii?Q?36dKfbnw+W2SHwgvpcTAMe0r7LiTvYYQsiUaC/xD3NjcXJprOYtqX5N1sqAU?=
 =?us-ascii?Q?UY2gsWr8Y7xYx+DQWr6y6a66E+Sl+YtK2PGq1fAsynsyWQc8bGTv3SRKCOZA?=
 =?us-ascii?Q?2+86H06bzV7mViigjehUjF9LoRxFT+Q74vArOOFgPheh9sh6MQc6lYXOflXm?=
 =?us-ascii?Q?Qsar3ujyxIh0Nqo3iEhKB6+tw8j6IRp4f/4Ovtnod4EPf/4MYd4Sd/k57t2L?=
 =?us-ascii?Q?eOitDR1IpuYY+QRjCqwpVBS44xYtxwFA9NqkCiYvK0uT+WKkbYRVZtw6B99+?=
 =?us-ascii?Q?CN81Yekctl5ZDynIacntRLy7tJdflgpuq/tYIWmWN7jmWm1bSqdku2vR0h2C?=
 =?us-ascii?Q?raAtVhr/YZLqG3CXqPpujm+lKq3OZtgNoI+iLxRMo0kQ7opp6pnFYZZ0xwUe?=
 =?us-ascii?Q?gZXq0drscMENJDNjLKHNkLmc7PsY+Dqn207C1WagCU50ir6aeHVUJog9XGlR?=
 =?us-ascii?Q?2kSMB1PVdJWQj/B1qqyLudCFxjjm0M1k/xvkiag6MfdTuOnl+R8gdYY3rj0L?=
 =?us-ascii?Q?gTnnS0BHNdmxQ3TM3+n0Az9CxbZdQp2wfsN4Pv7nQNCuzyq/bXBFViA19xAf?=
 =?us-ascii?Q?CVNy0Fl38hQOr/ncGCNCsYEqn+KGcaJaWBAa9nASMljWEbfOQ3yNbSy2uXNf?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf48627-d9b6-458e-4019-08dca1f1217f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:33:40.2886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3Dj41ABiwG0yRqXFmxzlIuLrj/T9BYcyrUbiT3Bpr+7cCLq14BpkAVaE2PaJtiJnoROpAQgEqSnxWvFzcE7Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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

On Thu, Jul 11, 2024 at 02:29:04PM -0700, Jordan Justen wrote:
> On 2024-07-11 08:18:18, Rodrigo Vivi wrote:
> > Hi Dave and Sima,
> > 
> > This is a v2 of https://lore.kernel.org/intel-xe/Zo2sO4t32dxqy6Q7@intel.com/
> > 
> > v2 - Removed Thomas' write-back caching mode patch since Lucas will propagete
> > that through drm-xe-fixes towards 6.10. So we remove the amount of patch
> > duplication.
> > 
> > Again, it is important to highlight the uapi rename present in this
> > pull-request.
> > Mesa is aligned and waiting to merge their side:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027
> > 
> > Since this uapi was recently merged, after we get both sides propagate
> > there won't be any kernel or mesa releases with the old bad naming.
> > So we should be good.
> 
> This looks to be a simple rename, and it appears that the binary
> interface is functionally the same. So, even if there was a Mesa
> release using the old header, it should function fine with the
> interface to the kernel regardless of which header the kernel used.
> 
> If the binary interface had changed, I'm not sure an argument of "no
> kernel or Mesa releases have happened" would be a good way to justify
> such a change. Luckily that is not the case here anyway.

Agreed. If it was that drastic we should never do and this argument
shouldn't apply.

But it is not so transparent as a full rename because there's one
sysfs file name that also changed with the rest of the renaming. :/

> 
> -Jordan
