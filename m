Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C579AA27E1E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088C510E19E;
	Tue,  4 Feb 2025 22:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdD7G2N1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F7010E19E;
 Tue,  4 Feb 2025 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738707411; x=1770243411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pdWSRs1MspImCgwbinPUXkP4GLH3HK6Eb0HZSyAimC0=;
 b=kdD7G2N1dE/PGtjon5zlM1Ed1cakSytDRtAcQNSJqNmdbPhdIb8VIm8X
 9xa9gdk7EPRtDfVB11lOV3X1gVwEERW9/484TVPPJfNCMfdmqeKwRkJN0
 /PGBmu/IGQSNZOA4HvRm8aWFQufU3I2ga4klPPahqq6VUYagCOK7N+VfO
 5GA/blh4T87mA3oNbqUwPhn0jVjdRDZmsFX5yOeRQORjhTLwurWACFRtd
 JTEkYtnKc3GRQBuuwEmfO0TtPmvlot2WUXPDzHLlKHZKGoDTcHw2244ng
 EsGjisgFrt6F0xCEvV8lXVcxT8xmdQTQ9IG/esuBhklqDOVHZe6xk/SZK g==;
X-CSE-ConnectionGUID: Yc2AQaqdSkuFww+jt9rwxg==
X-CSE-MsgGUID: 8MX1Qc/0T3y7UsPu0eZKLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38959648"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="38959648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:16:50 -0800
X-CSE-ConnectionGUID: E371tWK+SgKMbLEnqOkzdA==
X-CSE-MsgGUID: Sx63ybCiTTSUFfCTOn3K1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111160703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 14:16:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 14:16:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 14:16:49 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 14:16:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHrTQ00Yn7jx4jb3UxBnNVqXouwXa50nSeZiv/PR5hNPD8bCyT59O6cwpaeBTcbpfuQbGLF2rYDjYf1EY4RPSkAra9sJ+Xt+9f4zsxZhdofgGxl7FgLqMRg+QLFOXALcriQwUB7CuJAjYrw0zZu44UpYo91tt2q8IL2/eEZTE7Zq7cr1RVobx/X+1PfHY7T1uvLVG0E/cG7Aw6wMMSv8Rfv+XryLhHLXlqwZVRKSBdpp25q8fHyYoOHYCD/1vBFW/NHLZOv6FnRuZHHOrGns1v/HblEGoCNRPQ0ObWmyQzCApEE59hOoQX6LpFOtI4qXps1ZJ7jdhkprhlBsVnVCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2jF6zCf6JM6hIvU6mBT7eUpvEnxwL3lmeOE+mxkPx0=;
 b=wMhiHMRzZqvJITpAVGcU/M/Md14Ws7/pc/LOiicwWzU9CphuQ+abBGtSjuwM1DLHa1JuO2XjxihwelANM9pBNY7nwVBAN6wwfrF9vIMDYFZ942ajuuAZrJ/MXBqiuHP704zMKXayF10m411qG0dkouMFmn6wWilHSycQ1Yt+C3AhWxps9sgn7VPtEpwagwz3uLOCk6kYzOCY+DiL2+0wr6/uGUNcIC3qH6RI2i2pa4hHdB2XyQmMrc3t9jEN9jMQnSmRS3p3TnM+zVlPMgRJhv0iMN9IYVxHPGuw3VtoPN61MWmppaDE8e8FMuafQwqHFLbHOlq6BzSOZXQ2io4dOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 22:16:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 22:16:47 +0000
Date: Tue, 4 Feb 2025 14:17:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 02/33] mm/migrate: Add migrate_device_pfns
Message-ID: <Z6KSCB2ZfpxJngDO@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-3-matthew.brost@intel.com>
 <e6f93c69-d6a9-4cb3-8f86-65a1e3f04985@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6f93c69-d6a9-4cb3-8f86-65a1e3f04985@intel.com>
X-ClientProxiedBy: MW2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:907::40)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 036d5073-f035-485b-4f74-08dd45699d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dHFuGv9jnm+mK9SgYm0JXc0Z5woWq3LQ4luJ/c3/dr8bv3jBhyySkGotP9kP?=
 =?us-ascii?Q?lOBva094LteFTCDGApLEEliYH/60PyrtQ9uBoACE15IChCshkElSVVRO9/F3?=
 =?us-ascii?Q?Pg1WQq7GgeysQq1kUrubrbpIc8JS8Vd9Z4WzVnQPvy6N/sBaIKnqL2weOqTB?=
 =?us-ascii?Q?wNOx4OAHzh1sv726N63gXB41sC2KvOFrrDaQlT3l5K18USvMCpi8+mVs/lyt?=
 =?us-ascii?Q?kBO9QrnvT9qDLvqwyj157f4BG4Iw+pAfQnCE9AmcXJ7vT7MhMWORBDoyscFR?=
 =?us-ascii?Q?nfLiruZjzcqPJW24o7ZW++veywjGUh6igHVp1fnobb18+gHIculnTQfxbm0b?=
 =?us-ascii?Q?Ye83iFgasrLmBwGScFp8R1ketxoaizpkySq+kKmvXtaDVJtcLFw+tQcsynvq?=
 =?us-ascii?Q?wURVfpZJf+FbVVitdzCL8vQdV4rHyacsK3599Hp9WsKy3YfQtce6nqF25eNm?=
 =?us-ascii?Q?9TjI/Wfd25UCVpnQnaBVPpeW1Nib2/KqhxfXafXj+ZqtmUdDKsflZbnWe2jP?=
 =?us-ascii?Q?T/9KYDk1IT+ZUQWKh+tj4Z9HgMISEDMDmgmK4E6Fotm9hHOunzlu8TbqrNcH?=
 =?us-ascii?Q?nxqRWSzu/KmQco4OTKxqZY2wA1AF/ZftIDDrY8J+7doN6wJdEY9eVxiRzbH4?=
 =?us-ascii?Q?fj7evjUntdszyf2pXifZ17v3DMrGeBNJ2CFYwa9aIiYGkspIoAKyFk42qygq?=
 =?us-ascii?Q?7Vd7ze35eOGCf0UgQwh5ZffHij5//WZXalQhHUlCox99Peom6D10920Xt1uc?=
 =?us-ascii?Q?pwJtVzXBGTkrODCatMkqZNe5sUv4OYUVbXhfFA9ho0M75swALcyV30HXg7rc?=
 =?us-ascii?Q?NOyJWQRAoutGyT9Unr+0adb+h+MTZkFjo7PS+luVVzk6EskFs+ghTdiNfaCJ?=
 =?us-ascii?Q?Ggk9NXDSBSj8PQZ4tjgwrD7YSHtoQERTUw6FmI45eyKPmHvy/EwPdSBVrmo6?=
 =?us-ascii?Q?wNpHQwbS4n5SxrVyruqQFFVeY5z7wGxGRN1LBIThjgiiwwqUhg7mkTQJvZVb?=
 =?us-ascii?Q?VviLzNq9lVzcRhAC/pxLEhnHA0ONw6as+lrmPgoI/q0T9zl6sKiNmhSeLwUx?=
 =?us-ascii?Q?/YURt1hpTzFGGgsOFMLA72ZxvnOqZWu2JLopq3RZWvNU54QQDYvu4CgL3ZUG?=
 =?us-ascii?Q?u/KFQ811egx/WekBENYuDPBFakPcBp60BYAKuHiVRHoCYq4j2cmRI4znkieS?=
 =?us-ascii?Q?ICc2jsH4fcveyyhBuK0GK3aY/FzpzP3FS8dKxqr+RTH8FP2X7m6rwrd/+B7D?=
 =?us-ascii?Q?/PsmDhEQJ+JgTbOWgy8SnJ0pZTrMyx3mbQfL/65lsPeUoJGR07J0M1tun/3a?=
 =?us-ascii?Q?gWJFhFW0xH4HYiCk2ZrvKZiZf9kLAWBBSBYeqKL1n3faSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rITmqiVtdVXur6djPbftwEiCe2yXiYMxHL2ugbxdHirM+l0woc8GSbvS8yrZ?=
 =?us-ascii?Q?6xgvolpp2lq2CG3IycPn/rBFQnBH2iwetAMiENQYrN0DPUrDxoJOAT8FsFKj?=
 =?us-ascii?Q?WSOvjg9tiCXel/K88k4NEXqrqA7MaVQelStO2H8oNgC5E69uXhv9j7SVY1T7?=
 =?us-ascii?Q?ZiisG8qoJHzKXW77r4Whf4ZuReY4b3xk9pYnz7Wy8MdK8YFSkOmSDQdaeZGZ?=
 =?us-ascii?Q?rfehPUoux5ourqP/ribz8Gh30JHve5auhQ4ACH8iZk4hUVqLZIrok4+abFoL?=
 =?us-ascii?Q?u/tsz1kuD7SI9L2DhP1y037f/gP7S/3ymgWOvBGHd8eTZWkvOB5iclMKutii?=
 =?us-ascii?Q?kjR4f84vOfeVxPjJIs7coRp94cgdJWBVfSU6mIvtmwRt852j9IoKSi0ur0+m?=
 =?us-ascii?Q?Q92zasQFkT1Drrc6xPelkmLY/UrO+pqY8PZAbnOjtJO+Zf/FVZAemhER59pX?=
 =?us-ascii?Q?PIJS/GamLylGke94OAsSRYpyUX8+SzzNHitjKcOFPOLYuQMkYcMyYGU6S/6k?=
 =?us-ascii?Q?6UulUaIJlKoHS78Na3YPwq7p5ZRJCH2NO9SDA4FxPYCl870yy3NR26BoDExA?=
 =?us-ascii?Q?/v3hRnXyTsoQcU+gdq5S9vhazySJTPPoe7jIyWvgUrWSsWRZsZAH8jHudwOh?=
 =?us-ascii?Q?vOyIYFt8kR4CZIxSE9D/b0VuKwkDhYOd2pmfmh/okhHFNNMJDmwS6fWOxMfa?=
 =?us-ascii?Q?zGX22e2Doph2GZkFn52mq57f8MZhkj9/xBJiA7p5SybUCrSyPltHuULzkQvF?=
 =?us-ascii?Q?Y1fyHkjAEHx+PFgSrf0TxxvKxXv5v8hiNO7ZkA0iydgi7z1mGeNQKY/DRFB/?=
 =?us-ascii?Q?AKcQZS6BGgtwZOBnfpJNo3ofdFjl3LsYsoBolVTIQrld4XdVJMkdv9e4WumT?=
 =?us-ascii?Q?7wMUIw+z2Zl1re1y+6auFtaclVaAbThdUf4GIygiS/miTPxqQPJ0QrwrY+89?=
 =?us-ascii?Q?2wyhXn2hVyKx0HY7tCHEEVyBED2WgoNynpGlVxjDqnnzC3mgnIWMymqU++Y4?=
 =?us-ascii?Q?vBzJpXh+Y5Lw2BiKPAWmahXHQYFkBqohWsO+76zeXGEhXDm95l1/xo+wyx4+?=
 =?us-ascii?Q?NBB3xTn7sicjw0Q90BFbP9TOufKAgdPvRaw8HgqI7mKoIhF1QHUFft6Us1iz?=
 =?us-ascii?Q?0XYQ3MpwLnljEy90SwAQnFgl+9Y2mpRAHieEQMItzityejNs6kcYgF4tNvu+?=
 =?us-ascii?Q?s/vaoXWDlhH14RMy7NuokmZZ/ns1LsCUDlkLvoi5fgXfzbHFYsGWj/m8D1G3?=
 =?us-ascii?Q?uTSW4TVOZY+CKtTk85HAYeL0YdJKxk0ASNcD0NtN0slTrufnu1OrqnJiSBAy?=
 =?us-ascii?Q?2lWJIbWXxtzAYI+1gqEyMXSYvRYT2A3iwXD0pCALV9TuBUN8zkc8XRrh/2KJ?=
 =?us-ascii?Q?IArxCjwtimMV3m8q2+slJFnnd4+iV8LOL7yVxpz0Czep0CmddKI8IFh/64Td?=
 =?us-ascii?Q?c2dIt2s5JjhibrO+Hf+mHc03UFgdBN1UawuTY/mNREsBEqiJ8hyyZ9GS9Iom?=
 =?us-ascii?Q?v/xTU/5Mf2gP7yxyfvaa/uLM/By6YBf8X27xPfKRYQuzheu1Z5Yb4n+v9g12?=
 =?us-ascii?Q?9l6G2oaPD3lWBrp2XEXiEld23zt0OwLtk7v5ooJEe5kmUIplrTMLITtwVbWp?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 036d5073-f035-485b-4f74-08dd45699d48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:16:47.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgFtWwyyWIUD2kmMimgfY0guOXW7mqttzPZOhiUYVhBBOBjVawrOrmUxHjmXQKTN12WeYJGYFxCx6uEVC74hJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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

On Fri, Jan 31, 2025 at 09:47:52AM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 1/29/25 9:51 PM, Matthew Brost wrote:
> > Add migrate_device_pfns which prepares an array of pre-populated device
> > pages for migration. This is needed for eviction of known set of
> > non-contiguous devices pages to cpu pages which is a common case for SVM
> > in DRM drivers using TTM.
> > 
> > v2:
> >   - s/migrate_device_vma_range/migrate_device_prepopulated_range
> >   - Drop extra mmu invalidation (Vetter)
> > v3:
> >   - s/migrate_device_prepopulated_range/migrate_device_pfns (Alistar)
> >   - Use helper to lock device pages (Alistar)
> >   - Update commit message with why this is required (Alistar)
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   include/linux/migrate.h |  1 +
> >   mm/migrate_device.c     | 52 +++++++++++++++++++++++++++++------------
> >   2 files changed, 38 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > index 002e49b2ebd9..6254746648cc 100644
> > --- a/include/linux/migrate.h
> > +++ b/include/linux/migrate.h
> > @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
> >   void migrate_vma_finalize(struct migrate_vma *migrate);
> >   int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >   			unsigned long npages);
> > +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages);
> >   void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> >   			unsigned long npages);
> >   void migrate_device_finalize(unsigned long *src_pfns,
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 9cf26592ac93..19960743f927 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -876,6 +876,22 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
> >   }
> >   EXPORT_SYMBOL(migrate_vma_finalize);
> > +static unsigned long migrate_device_pfn_lock(unsigned long pfn)
> > +{
> > +	struct folio *folio;
> > +
> > +	folio = folio_get_nontail_page(pfn_to_page(pfn));
> > +	if (!folio)
> > +		return 0;
> > +
> > +	if (!folio_trylock(folio)) {
> > +		folio_put(folio);
> > +		return 0;
> > +	}
> > +
> > +	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> > +}
> > +
> >   /**
> >    * migrate_device_range() - migrate device private pfns to normal memory.
> >    * @src_pfns: array large enough to hold migrating source device private pfns.
> > @@ -900,29 +916,35 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> >   {
> >   	unsigned long i, pfn;
> > -	for (pfn = start, i = 0; i < npages; pfn++, i++) {
> > -		struct folio *folio;
> > +	for (pfn = start, i = 0; i < npages; pfn++, i++)
> > +		src_pfns[i] = migrate_device_pfn_lock(pfn);
> > -		folio = folio_get_nontail_page(pfn_to_page(pfn));
> > -		if (!folio) {
> > -			src_pfns[i] = 0;
> > -			continue;
> > -		}
> > +	migrate_device_unmap(src_pfns, npages, NULL);
> > -		if (!folio_trylock(folio)) {
> > -			src_pfns[i] = 0;
> > -			folio_put(folio);
> > -			continue;
> > -		}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(migrate_device_range);
> > -		src_pfns[i] = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> > -	}
> > +/**
> > + * migrate_device_pfns() - migrate device private pfns to normal memory.
> > + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> > + * @npages: number of pages to migrate.
> > + *
> > + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> > + * array of device pages to migrate.
> > + */
> > +int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; i++)
> > +		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
> >   	migrate_device_unmap(src_pfns, npages, NULL);
> >   	return 0;
> >   }
> > -EXPORT_SYMBOL(migrate_device_range);
> > +EXPORT_SYMBOL(migrate_device_pfns);
> >   /*
> >    * Migrate a device coherent folio back to normal memory. The caller should have
> Looks good to me and I have confirmed that a code flow has been added that
> calls this function from the actual driver (xe),
> which did not exist in the previous v3 patch series.
> (This code flow called when ttm performs eviction when ttm needs)
> 
> There seems to be no test scenario for testing device memory pressure in the
> test cases mentioned in the cover letter.
> Do you plan to add this scenario as well? ( Please correct me if I
> misunderstood.)
> 

The *evict sections in [1] to test device memory pressure.

Matt

[1] https://patchwork.freedesktop.org/series/137545/#rev3

> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
