Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C05E53C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 21:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006CB10E7E1;
	Wed, 21 Sep 2022 19:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FCD10E7E1;
 Wed, 21 Sep 2022 19:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663788384; x=1695324384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mO+OCypaqueGla3YgxCc0ZBPVcXOc2bjk//ntKLWczY=;
 b=GvCv0qwOe5PH4lL6ks/9aX7wxlbSvkxCIdkyUqDpNTvXF5kk3BmFEFD9
 bpAXt4tnwidavu8TvTbIx2pQvJU5oJtj4Mk2EvNnkWShaekfc7jojOTnm
 Irekbw+1VnVLUPISOghi4Kkvur9WRzimHkH2rggF1oalOV5i+dUBRMdES
 tuAvpg/6Un9ScYhcKYdnFX0qdBmkB8tvwqxkvM0BT+dH9kRc21f5C8sgd
 XnEB8Z53z42QdyR+3NKXCoIn926MnjJatdqEl7gp8F4Zj3n38twxrNo96
 dtl12O1DFSoehdXCQ5rL2N8XVB05kxV+WoT0WjgXE8tRLsxFglck6I2O2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="298822222"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="298822222"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 12:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="652668483"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 21 Sep 2022 12:26:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 12:26:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 12:26:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 12:26:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 12:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAgjsE1weHC9dBAAnjuNBsb0if763Idw9D5UzXeDlpGAqEo9r1O/O44caxdZVT8H7p/Vp9c9ndxkxoHpXZ7QClPdjUqmXYHQrW7WRVvrbDay5uBfJr87T6DNgWPkxOaCS0czdcdg2c//mLOXqQ08hVy2tgIwfUcZA5rUDNNq/dpZsQMZxaPB9k8b2oxaL2eD25Cvz2WPHfRMaUo0fJsRDixk4FH/adurA/JKoA67Ikkzxqi5l7pJGvIDQy35/he0lzpZtSQJAgfi8E22Uu5UajPRqL0IBJ8ZOPOzsuZeRGpDZWEOD/SwKsYFlRA8V1wQy9CpJ0/mQPDp8YdXobCGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsdtVv2sUpWaFak+udg78BvWHac0afN/iEJh5iKuxng=;
 b=K4mxX0gFjkNHoE/BXH1hAL+t8q4+sv5NCUn6ZUhBE3Pxaf7YQX5p7IoP7glK5C50Y9ulsUiFA726uMaGD45J5YIeAelqr6aVhlwj4TA5nDUisOiLsn8gsVUhp6eYMKT/6N/skL8I+bogfUyt+DECQaBnkOhjYY2oPlFd7gsh9sDvZC3K/5zysM359GD0J2/OxbFExsmo8I6gWYtiw2CROHBAOfI0TrZXsCbt7m3UJgG//RobCJNnVHzl4UEjBiyjT9fy6tUD/B7VD5srHNTnLfmIy827evrcMHM4X9kUkIINyMGBt6mb0y0Ne8KkwFBAItKWZssMNp9Lueiib/wYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 19:26:20 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5654.017; Wed, 21 Sep
 2022 19:26:20 +0000
Date: Wed, 21 Sep 2022 12:26:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Split GAM and MSLICE steering
Message-ID: <YytlWVMl7fe9EYm3@mdroper-desk1.amr.corp.intel.com>
References: <20220916014345.3317739-1-matthew.d.roper@intel.com>
 <e5e70c4f-93af-a903-9bf0-df283b6e7eb9@linux.intel.com>
 <YySN9FWpDxKPRlld@mdroper-desk1.amr.corp.intel.com>
 <20220921165808.GR7822@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220921165808.GR7822@intel.com>
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: bef83d24-5af9-4c9a-5c4a-08da9c07295e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igX6PfmiZxV+T3j8EofVIBJb8oxohdkkzAkkf66mPfkNz44DhbS73X4Qc4EzZZPrHsuTt0fcHq0fD0UhDVcWqj3DYDNWPQZg1f8Uy36ZF5pXDyRMrs9+ekWua+614NSKMKjkrG2zXhQb2KbvEhX8fdR07/zkWKS3wCPEeyuPRdO+WASmm/0d+MXQUOOzV8i7lMEZhEp4QptlBNx4cnnm7jy+BEVybKoHTYiWfsGrRg8E//AeQYFW+RZ7fQP0Fjp0GnGt5sc0Kf2MpnoBhXxX331iTAAlLu5ca/lYigvWgmXfYxTkQpVfepc3OuZHS5D9qWCH5IP7H97SlmWa0asfo8dafmLzEe0GKOfPP6+4gqb3XikuQM769ERXlcjuphIstMczv7ITkJp00rJdMBJ+5FOplUy72qp4/D2GlaLlKJc49LvDyWv4RKHFDJgXyEy0liZPNuFZIaB143r4/fvxTaNLKgIhbxoPKdP0Umb66U4+uEM3Lgh6SQLC+hf+JbjQ0adMNdjtBIW4mhAolktmvhXS5/pFLJvZm4+u4A7t/MLDU4sEP4y37VuL3TyjqtuWcafsDNi0asmnCYf/lJtzcxmC/1NeOGyShLiDOvNqdmLqQC8b346/IDjyWqusASl6+oMibN/GYtUEeW2CGATRuuFW5wiUP86O3iY6pIZDE6cr+MjD3G8EwcZ9wUeiMZ3CUfEZeZo3zl89Anc2V/dmXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(41300700001)(86362001)(6636002)(5660300002)(6862004)(316002)(8676002)(83380400001)(66946007)(4326008)(66476007)(66556008)(8936002)(82960400001)(186003)(38100700002)(478600001)(6666004)(6506007)(53546011)(6486002)(26005)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N6irxGmec/0nCwhrc/vykzsqZP9gqVSeCHCGAVdwkwBxfVTKU/hNPYU1pn54?=
 =?us-ascii?Q?pSfxKdlWW9BNf1FTJk839jOg4cTSXCNJ76QyD8eOaaDD6eziYhkreS61vjK9?=
 =?us-ascii?Q?JQmaw//N4qpv1d6tTo+HP2c15DiHfhP4V0MgVqOAbfjdrjkAO6S6zP3f2wEj?=
 =?us-ascii?Q?NKmrTITicPB/TrmhzGpCoxURTLda55KRF4agUPBg+2kpMF638vGjiOCeYidO?=
 =?us-ascii?Q?Y4v0sBSOIvmwlW/jc3SNsG9GJlwOWPMmRQROfpfEM0tQl1IfqzRpLFIStipE?=
 =?us-ascii?Q?2punSfP8nFY5CSyTvRmb1/lTVgKAP1USEGnU1f//AZXn3lmR9HqBDWvp6AAS?=
 =?us-ascii?Q?bC3UXAULpwzs7nmWnyaj9foroIveshKcnFkfggBGolFrmc5iWdm6XOw96kLh?=
 =?us-ascii?Q?mwBjg4vT3ZKVteQePLoRDda76QcwnI608vhguIYJGzJnvU3muELcm0KcaJjq?=
 =?us-ascii?Q?RFikMhdK8YreSk8EV3/jJTGAc7fr0d0Ck4dBamngDaNExO1Dy/em+C6VetHe?=
 =?us-ascii?Q?I8+6CkCAGmPCcL1IfzYFYEXh8jy0abdP9VfDq7aqcQEjGmgAFXQxH4mx7rwL?=
 =?us-ascii?Q?4GDEa55aoEHIwjlE+xr9mxEEvK6oDMOc7Ipig8shjqQlSpme/iQuB7Gba4Kn?=
 =?us-ascii?Q?seANDzBs+pb5tT2lY8ZBNawh0d/P4P9ACZO0saXN3iJuj/JR2rBdQUKL0wMU?=
 =?us-ascii?Q?2Trbn9ny9bILxxTPmh6je9Mudjso5zcsFK/nh8pJ/JvOlnpO13WAkS9YihXQ?=
 =?us-ascii?Q?/RIrQIltGLpTfz+qzEny9qrIIDTJi4/k+naYRxxDP1j5GbpDFJPIy3XMyKmZ?=
 =?us-ascii?Q?ChNo9eot5dZ645z1x8PoGXqQmDXCavCrOVT/jdJW1PvsDkhGwFc7vzAshT18?=
 =?us-ascii?Q?Pqn0blMEkBAjFwKCTADvCkI5yF76ZDoybqYfSMpvYuNXA9rLzf7lcJE4KjaM?=
 =?us-ascii?Q?7vwDbDls1V3KJdUPF0oxrOg5AsoYLu6NUGDaayRgEPvt8skzy0i7bVys2njz?=
 =?us-ascii?Q?s7iQ7sgwnPcAY5gx0+ThQGBPiJrW2ctVR1p2XuoEPwHPywT67TQBmHLIHPzJ?=
 =?us-ascii?Q?lO+4kRHXjtIniHpuTnjSYNupzN8pitr+3EB2fQL3JHkm9m409ANRGUYGtPO1?=
 =?us-ascii?Q?ZhGmWHR7zeXVqaOse1V0PKdMVm60Ne4hCqi2SBhnSMv1qson3G3fnmoJdgVH?=
 =?us-ascii?Q?ocDb/3OzWE3p/97r+FtC/q3h3msCRBXw+/5fZ0ibkPD6S2WQv6+64cjqWTUI?=
 =?us-ascii?Q?b1MALmaWAdBubYJZitpZZayxT7FZtIbWxMWZLGFtegSLat15M4wiuKmyls6E?=
 =?us-ascii?Q?dRLH7SRJBoii39pPawFG6YpyKBfvpaEwMC0sb2JsSiQ9SEWEq36pY8zOOZ69?=
 =?us-ascii?Q?4weXoVN0sQLmHLp0EXMgUDg4jPVNznEndLqtE5UWTZWrDvENbMfYqx4EEsO/?=
 =?us-ascii?Q?a04CX53IQY15C7z8ybWBxni2Q3NyIgfXLC9Cx6yHoFnYMnuN0l3fyC0WUJn6?=
 =?us-ascii?Q?/r4m6F4l+SKKidtMRoNmpzA+j+OEK9QFtwWATaWpSyWR5Bo/NFS7kjnBbFoj?=
 =?us-ascii?Q?0icnbbChs7PzZ2nsoVngP0ZOjagGfejq0U6+zYEIBOYu25N1GO+1kXusZqa3?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bef83d24-5af9-4c9a-5c4a-08da9c07295e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 19:26:20.1756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W9FN6PQkM/+5Vv6idHe1VGBiG7JOfevNCYcTpABLGseoOjURKh9lCiEHZcIobh0ZZEgtwDafioa8SvRRa2xkFdmzsNNygJzwP1/zh9g9vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 12:58:08PM -0400, Kumar Valsan, Prathap wrote:
> On Fri, Sep 16, 2022 at 07:53:40AM -0700, Matt Roper wrote:
> > On Fri, Sep 16, 2022 at 10:02:32AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 16/09/2022 02:43, Matt Roper wrote:
> > > > Although the bspec lists several MMIO ranges as "MSLICE," it turns out
> > > > that a subset of these are of a "GAM" subclass that has unique rules and
> > > > doesn't followed regular mslice steering behavior.
> > > > 
> > > >   * Xe_HP SDV:  GAM ranges must always be steered to 0,0.  These
> > > >     registers share the regular steering control register (0xFDC) with
> > > >     other steering types
> > > > 
> > > >   * DG2:  GAM ranges must always be steered to 1,0.  GAM registers have a
> > > >     dedicated steering control register (0xFE0) so we can set the value
> > > >     once at startup and rely on implicit steering.  Technically the
> > > >     hardware default should already be set to 1,0 properly, but it never
> > > >     hurts to ensure that in the driver.
> > > 
> > > Do you have any data on whether the "technically should" holds in practice?
> > > What would be the consequences of some platform/machine surprising us here?
> > 
> > The bspec indicates the hardware default value is already the necessary
> > 1,0 value; I'm mostly paranoid about some kind of boot firmware wiping
> > it to 0,0 by accident.  I don't have any evidence that has ever actually
> > happened, but explicitly re-programming it to 1,0 in the patch here is a
> > defensive measure just to be safe.
> > 
> > If we didn't have this patch _and_ some firmware screwed up the GAM
> > steering target, then presumably we might read back garbage or 0 from
> > GAM registers in places where we should have received a real value.
> Will firmware ever touch the steering target registers. As i was going
> through the respective hsd. The software driver impact is marked as none
> so wondering if this change is really required ?

The GAM only has a dedicated steering register on DG2; on XEHPSDV it
shares 0xFDC with all the other kinds of steering, so it is important to
handle this range independently of the MSLICE range and make sure we
properly re-steer GAM accesses to the primary instance (and not just any
random MSLICE) there.

On DG2, if we assume firmware behaves properly, the dedicated steering
register is initialized properly and we don't need to explicitly
re-steer.  However this patch will ensure that we don't needlessly
re-program 0xFDC according to MSLICE rules when accessing a GAM
register.

There's also the worry that firmware may try to "sanitize" the registers
at startup by programming them to what it thinks are appropriate default
values.  Given that DG2's primary GAM is unusual (instance 1, instead of
instance 0 as on other platforms), this feels like a place where
firmware bugs could creep in.  They hopefully/probably won't, but
ensuring we forcefully initialize 0xFE0 to the proper value just ensures
that we don't even have to worry about it.

Finally, splitting the GAM from MSLICE ensures we get more accurate
debug messages from the drm_printer in dmesg and debugfs.


Matt

> 
> Thanks,
> Prathap
> > 
> > 
> > Matt
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > 
> > > > Bspec: 66534
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 24 +++++++++++++++++++--
> > > >   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
> > > >   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> > > >   drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++++++
> > > >   4 files changed, 34 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > index e79405a45312..a2047a68ea7a 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > @@ -40,6 +40,7 @@ static const char * const intel_steering_types[] = {
> > > >   	"L3BANK",
> > > >   	"MSLICE",
> > > >   	"LNCF",
> > > > +	"GAM",
> > > >   	"INSTANCE 0",
> > > >   };
> > > > @@ -48,14 +49,23 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
> > > >   	{},
> > > >   };
> > > > +/*
> > > > + * Although the bspec lists more "MSLICE" ranges than shown here, some of those
> > > > + * are of a "GAM" subclass that has special rules.  Thus we use a separate
> > > > + * GAM table farther down for those.
> > > > + */
> > > >   static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
> > > > -	{ 0x004000, 0x004AFF },
> > > > -	{ 0x00C800, 0x00CFFF },
> > > >   	{ 0x00DD00, 0x00DDFF },
> > > >   	{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
> > > >   	{},
> > > >   };
> > > > +static const struct intel_mmio_range xehpsdv_gam_steering_table[] = {
> > > > +	{ 0x004000, 0x004AFF },
> > > > +	{ 0x00C800, 0x00CFFF },
> > > > +	{},
> > > > +};
> > > > +
> > > >   static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
> > > >   	{ 0x00B000, 0x00B0FF },
> > > >   	{ 0x00D800, 0x00D8FF },
> > > > @@ -114,9 +124,15 @@ void intel_gt_mcr_init(struct intel_gt *gt)
> > > >   	} else if (IS_DG2(i915)) {
> > > >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > > >   		gt->steering_table[LNCF] = dg2_lncf_steering_table;
> > > > +		/*
> > > > +		 * No need to hook up the GAM table since it has a dedicated
> > > > +		 * steering control register on DG2 and can use implicit
> > > > +		 * steering.
> > > > +		 */
> > > >   	} else if (IS_XEHPSDV(i915)) {
> > > >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > > >   		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
> > > > +		gt->steering_table[GAM] = xehpsdv_gam_steering_table;
> > > >   	} else if (GRAPHICS_VER(i915) >= 11 &&
> > > >   		   GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
> > > >   		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
> > > > @@ -351,6 +367,10 @@ static void get_nonterminated_steering(struct intel_gt *gt,
> > > >   		*group = __ffs(gt->info.mslice_mask) << 1;
> > > >   		*instance = 0;	/* unused */
> > > >   		break;
> > > > +	case GAM:
> > > > +		*group = IS_DG2(gt->i915) ? 1 : 0;
> > > > +		*instance = 0;
> > > > +		break;
> > > >   	case INSTANCE0:
> > > >   		/*
> > > >   		 * There are a lot of MCR types for which instance (0, 0)
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > index 2275ee47da95..2343b26e0e21 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > @@ -42,6 +42,7 @@
> > > >   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> > > >   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> > > >   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> > > > +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> > > >   #define   GEN8_MCR_SLICE(slice)			(((slice) & 3) << 26)
> > > >   #define   GEN8_MCR_SLICE_MASK			GEN8_MCR_SLICE(3)
> > > >   #define   GEN8_MCR_SUBSLICE(subslice)		(((subslice) & 3) << 24)
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > index f19c2de77ff6..30003d68fd51 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > @@ -59,6 +59,7 @@ enum intel_steering_type {
> > > >   	L3BANK,
> > > >   	MSLICE,
> > > >   	LNCF,
> > > > +	GAM,
> > > >   	/*
> > > >   	 * On some platforms there are multiple types of MCR registers that
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > index 6d2003d598e6..d04652a3b4e5 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > @@ -1181,6 +1181,9 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> > > >   		gt->steering_table[MSLICE] = NULL;
> > > >   	}
> > > > +	if (IS_XEHPSDV(gt->i915) && slice_mask & BIT(0))
> > > > +		gt->steering_table[GAM] = NULL;
> > > > +
> > > >   	slice = __ffs(slice_mask);
> > > >   	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
> > > >   		GEN_DSS_PER_GSLICE;
> > > > @@ -1198,6 +1201,13 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> > > >   	 */
> > > >   	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
> > > >   	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
> > > > +
> > > > +	/*
> > > > +	 * On DG2, GAM registers have a dedicated steering control register
> > > > +	 * and must always be programmed to a hardcoded groupid of "1."
> > > > +	 */
> > > > +	if (IS_DG2(gt->i915))
> > > > +		__set_mcr_steering(wal, GAM_MCR_SELECTOR, 1, 0);
> > > >   }
> > > >   static void
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > VTT-OSGC Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
