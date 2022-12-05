Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE0642C4A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 16:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3A310E246;
	Mon,  5 Dec 2022 15:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A8710E245;
 Mon,  5 Dec 2022 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670255551; x=1701791551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4N4jal0s+MfdTTodW6NxughrjVM/3qwtmrH6MuaRd54=;
 b=ihT8cKxB0+EUFkjo5DTpATrDoRObVobo+o/bDJztdcXva7833gCYirsJ
 W+fNjepicN+j0pICLV8+linwfGwnNuCAVv/tEEeFhHTM2YjfnktuCqpn9
 i19+kuxtJsBcM9U95fJV04b2ULF6xpDFxEIvTjrZC9CZGZKsCAe/Yj8LW
 TMb9bDbaqY55S9XxHLkQOQC5ZHPhM0fH+xtW24AAqL26/k7Fs1N3VPgW+
 Uw2GaJ0iVc4DDhTtYtKg67bcd1R17mUnLBybB1QxcQCIAE+lNMutXL5LI
 7HLVT2R421+nYwmZ0TbblP3bSZ9++Q0YXOnCRiEmmpCtbAXV+M/vcHGQM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296075840"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="296075840"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 07:52:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="734639481"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="734639481"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2022 07:52:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 07:52:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 07:52:14 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 07:52:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eaw5iwzTT7tFI4VAMtAX6VS10gIrjv7sVkrm0q0BiftQqX4DcmzKbtHtB98HxQPCRfkvIhF5nZfveBrdc6TsYO79Lr967/nv4qR+rvxciTG0Lv8K+JzYEOGNbPzDwtMhKLWpwGVAOLTeeUanhwyvV5i2kZyYckSvXJl31YRSqTZJjeehPUrPP3vMRaBt/18RVXrcI18hPos/gHMVMG5ODn5yLjzmApSpNNg8T9UBwTaVMV5zh+Ecx2Pobk6gtZNUU+eIOPOowEdNSUoi/CInwqnNzkkNUmBC/+CmCsxOgjZXQvEtvYzYFhRwX0L8Fk82lUYgjFvHRGNIDwlwb2aTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3I6+rnxwilyA6zO+DttUc+a3HUEFEJ2FoxWHk98uGY=;
 b=Xloz6fFdW63J1dd80y5+30Zd1jZBqT6zvSqFQAMouWXwPmvzsp6iZYlkVk02d4smPH1GP8o/sKFAbjVdZ+10nPvvrzOHlDlbEZHYulH9p8sy/s/YKc6pCvrvQgsDSjUQu+QkeoEoN6vDv5/GrIpax9Mzs8Ge/UzKDjP3wZ5HftVUE/NNbkMeuWxDsPjaPRAzKfJx2NaXX3H109rf+IuQfvzx4/QOMIBjlQCwiULiHlQXzlWlP4bxhS/hG6rl6L2Pj/Uf2DAScXvlDUzLmIL3a0gSggF8QlYmCwR+YYQ+JqR0afHPS6QyjG2YZ+/FesMWn0mqHkteNQYvmFBPmJbOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 15:52:12 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:52:12 +0000
Date: Mon, 5 Dec 2022 07:52:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/mtl: Add hardware-level lock
 for steering
Message-ID: <Y44TqD6GXLe3XIKp@mdroper-desk1.amr.corp.intel.com>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-5-matthew.d.roper@intel.com>
 <c5eca2f1-0ac6-fd0b-a9ef-d590ccf5d1e0@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c5eca2f1-0ac6-fd0b-a9ef-d590ccf5d1e0@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b5625b-bb5b-4607-ca15-08dad6d8ab9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVocEjgzMsLhaBR6O+urbcK82B/37cWM44AqYmfsueB1EsztHgTr5wbTnCAWhLvgnV6rjywimBeNgY3SX8N/OdEhgYUygjvMTFiSQTmBW+bBd7iZkgAjLeg23G8nWkzM160aYBu1qkoO/InWbTUvfYDLBihscKC7lEz021kkJXexpebJlNeibQJwvH2ZOBc24QEhX8pnGa8exHcQOw64blFZ/5A111WZrCs9Se9yEd2Av5xtjy32T/p4/cN3eOxnarmyRcL2uDaPIESyBvimS5odhFp88aV3P1y7XjzSUPSKE7LLh8TLwdv1lnfXx5lkDHDkvNUypt+ptq6LxSQQZ0N8bD/TUlDdM7ZDvCkVuTegrbVwhciI13iAqZByPYteuzIxpDx1ebLzUA6wL+ij7RU0gFhTwCIhLmrghMN0VPfONez2VekbmKOtyW7YMDX27ZU0nioAj0AcWUQmV0VfXE4MDHyMNKKEqGkr30uQOP4XnTbqo7gqZ11PayDav3W2XWOvzczsIWRy3gjBgxRaYIC5xdqUAeCdY5IvTTvg+OYDCdG4HolPlJJzD3a/UjOnBJYwPLgzBO5fsiw0Sj2nG+uRouv4IZ7+4yqRui82ijbVfLCvbqwKrFu5W9PmkaCYxRpb8aNRyazxnftGyCEtRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(53546011)(6506007)(41300700001)(186003)(2906002)(82960400001)(38100700002)(8936002)(4326008)(66476007)(5660300002)(8676002)(66946007)(66556008)(26005)(6512007)(86362001)(316002)(83380400001)(6916009)(6666004)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpmHTTyRLd792q6giWZgIGVVDOe8ujYobp3DQL74GEe4F5vc8O7N+q/R4EQ6?=
 =?us-ascii?Q?jZfmixPYyMZF+dzbocPdksyUsW2NcknMmBu5idk1gKqIbbH/z/X0Wr6+9DdA?=
 =?us-ascii?Q?Aek0UD/vkc2OyjwGBeI/1ejvsd2FhRTp8nO8nEkJiDoi2OuZGl0EURkPL0wG?=
 =?us-ascii?Q?fOW2YjzDg5DiCD4mXQ2rcalQa9laKbcceEXEy4WL+4RBZIFJF+dVBL/bxQKI?=
 =?us-ascii?Q?4c2p/Nbc+9gSWfowuxq4kF82lAXqYZIJezSuOg0weZtPmSMKbUsbf0w+ryxA?=
 =?us-ascii?Q?3mKjEJuRZZlVKJ3iyI9sV+rxC6bvMxr1pVSBU9mOQTKxkp+hVZxGYNdyPeH/?=
 =?us-ascii?Q?ZmH1HiK1HpRJKctj3bUtw88LdQnFArEycCvOK6pGqiBMhJenKV0VIAKBpj7f?=
 =?us-ascii?Q?xlG63MkXNIzRuP79jlPjbSpO0qDtwqemJ/1aEXPtE+5hLGFGGB506Y1Ia+JL?=
 =?us-ascii?Q?rmR2K4ZtzDXaNE51s6sh20INS649xkF65FdaQlhi8PLb7A3/BO4FU7L5fjqR?=
 =?us-ascii?Q?AR5Zfwzeusn7fpxlackz4t1vtmzHAgp+IXhgfFbPh7TLC487E9zI6H9CNS6h?=
 =?us-ascii?Q?MWIF97exFNLIpLU5AthK8GiHKb4VfM03rzjaoswp68Zzr+LxFwdurCduH9no?=
 =?us-ascii?Q?vVKmkqFdzcCziR4r7FUSH3AsoGKz77AmcNoJQiGOxb9EAXFg56gOwV0E90yE?=
 =?us-ascii?Q?IdWrlBZ6jKz6Y8aH80pttDZHcLpC2mOp05CRxaBs72x+Lxe/kfirGTLu86NU?=
 =?us-ascii?Q?/H1tzRMyzReVp+2G69IJ0al0nzmpDZ2OnsPi1LR/XtjcitkosExT3CdaxgPj?=
 =?us-ascii?Q?bZsQ8GwVtRWDJt/PaPzbin4mYi4t5SXtw0W0CQqNzZDQuqdWbKt2t8p4GSXF?=
 =?us-ascii?Q?YJXCNCdfVglssAdNc3juPNqP9JmBCE0LxcKK0krd2j8tQEnIYwsb+HLpxd5M?=
 =?us-ascii?Q?k5cDrE5SuBOVRJ1qGDe/uaUPf/Sk6eRad0o28SLDCnwWCgRjbfHA312Vqxll?=
 =?us-ascii?Q?bAkkIRHafjYXJeAv19owGRfIhFOL2h6g54J1zsALb8wf81PHu5ZD9rp3UyED?=
 =?us-ascii?Q?iciAmJzF3s0TbFVBNBCMYn6ahjKMrGjb2dMXEcBLniF38B8Krs7UfJLfcIND?=
 =?us-ascii?Q?VPqPnuurnzK8Qs8AVwP7+81uo83l/jXg4usfqD1uIcOYvEwQFUMLcVNF84Ik?=
 =?us-ascii?Q?X+YvNTUtmnKjLXtfC3EQQ/ZdIe4S/ka7Sl80yWLHwmFJcvL2KYUEdKTbiwh7?=
 =?us-ascii?Q?0NFBU+NYhzJCsuHYcoAnXXPZscIficKsfHG7UHYXJjmIfz9U5GbAH3/OWGN5?=
 =?us-ascii?Q?hiIN7acd/8YcjW2tMYeStr2WRR+UoRZK0z4KjtX896UIkRzU2EW43hNUsZUc?=
 =?us-ascii?Q?JSCDxMW95RSyqdKevZaV6Ywv6WH+8KP1pP7uq+Tw++/dAVWkcu84/d2esC4s?=
 =?us-ascii?Q?32Hqtby0vAb+/L1KCNYUfly8CjQXAVJJ5Hdt8gZLSazVkAKQkISgdwnoIsjI?=
 =?us-ascii?Q?zBkS5CaluJhSK7YVoF017JY6lGdkbFiUixX8vfvFCPiQo2fO87Cbc0Yg4YBT?=
 =?us-ascii?Q?I2SjRNhMg0sqRvr8z+WnvFxRlphHxeYn/mcReTfdaUMYhY1ZSI6SLQK21YUF?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b5625b-bb5b-4607-ca15-08dad6d8ab9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:52:12.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g79eaHyO9cO1mTILYr2IE31JQusjzd/zekyjx3/sbLE+6HqHaBR3IyQmsbW/IYUK4MrmLO58OntX4uHqnG+t1Tc1ycxwwKk3VbmwRQ5o/d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
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

On Mon, Dec 05, 2022 at 08:58:16AM +0000, Tvrtko Ursulin wrote:
> 
> On 28/11/2022 23:30, Matt Roper wrote:
> > Starting with MTL, the driver needs to not only protect the steering
> > control register from simultaneous software accesses, but also protect
> > against races with hardware/firmware agents.  The hardware provides a
> > dedicated locking mechanism to support this via the MTL_STEER_SEMAPHORE
> > register.  Reading the register acts as a 'trylock' operation; the read
> > will return 0x1 if the lock is acquired or 0x0 if something else is
> > already holding the lock; once acquired, writing 0x1 to the register
> > will release the lock.
> > 
> > We'll continue to grab the software lock as well, just so lockdep can
> > track our locking; assuming the hardware lock is behaving properly,
> > there should never be any contention on the software lock in this case.
> > 
> > v2:
> >   - Extend hardware semaphore timeout and add a taint for CI if it ever
> >     happens (this would imply misbehaving hardware/firmware).  (Mika)
> >   - Add "MTL_" prefix to new steering semaphore register.  (Mika)
> > 
> > Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c  | 38 ++++++++++++++++++++++---
> >   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
> >   2 files changed, 35 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index aa070ae57f11..087e4ac5b68d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -347,10 +347,9 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
> >    * @flags: storage to save IRQ flags to
> >    *
> >    * Performs locking to protect the steering for the duration of an MCR
> > - * operation.  Depending on the platform, this may be a software lock
> > - * (gt->mcr_lock) or a hardware lock (i.e., a register that synchronizes
> > - * access not only for the driver, but also for external hardware and
> > - * firmware agents).
> > + * operation.  On MTL and beyond, a hardware lock will also be taken to
> > + * serialize access not only for the driver, but also for external hardware and
> > + * firmware agents.
> >    *
> >    * Context: Takes gt->mcr_lock.  uncore->lock should *not* be held when this
> >    *          function is called, although it may be acquired after this
> > @@ -359,12 +358,40 @@ static u32 rw_with_mcr_steering(struct intel_gt *gt,
> >   void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> >   {
> >   	unsigned long __flags;
> > +	int err = 0;
> >   	lockdep_assert_not_held(&gt->uncore->lock);
> > +	/*
> > +	 * Starting with MTL, we need to coordinate not only with other
> > +	 * driver threads, but also with hardware/firmware agents.  A dedicated
> > +	 * locking register is used.
> > +	 */
> > +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> > +		err = wait_for(intel_uncore_read_fw(gt->uncore,
> > +						    MTL_STEER_SEMAPHORE) == 0x1, 100);
> > +
> 
> If two i915 threads enter here what happens? (Given hw locking is done
> before the spinlock.)

The second thread will see a '0' when it reads the register, indicating
that something else (sw, fw, or hw) already has it locked.  As soon as
the first thread drops the lock, the next read will return '1' and allow
the second thread to proceed.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > +	/*
> > +	 * Even on platforms with a hardware lock, we'll continue to grab
> > +	 * a software spinlock too for lockdep purposes.  If the hardware lock
> > +	 * was already acquired, there should never be contention on the
> > +	 * software lock.
> > +	 */
> >   	spin_lock_irqsave(&gt->mcr_lock, __flags);
> >   	*flags = __flags;
> > +
> > +	/*
> > +	 * In theory we should never fail to acquire the HW semaphore; this
> > +	 * would indicate some hardware/firmware is misbehaving and not
> > +	 * releasing it properly.
> > +	 */
> > +	if (err == -ETIMEDOUT) {
> > +		drm_err_ratelimited(&gt->i915->drm,
> > +				    "GT%u hardware MCR steering semaphore timed out",
> > +				    gt->info.id);
> > +		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> > +	}
> >   }
> >   /**
> > @@ -379,6 +406,9 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> >   void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
> >   {
> >   	spin_unlock_irqrestore(&gt->mcr_lock, flags);
> > +
> > +	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> > +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 784152548472..1618d46cb8c7 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -67,6 +67,7 @@
> >   #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
> >   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> > +#define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
> >   #define MTL_MCR_SELECTOR			_MMIO(0xfd4)
> >   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> >   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
