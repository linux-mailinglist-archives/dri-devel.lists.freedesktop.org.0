Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3AE6F4B60
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 22:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1E110E090;
	Tue,  2 May 2023 20:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8610E082;
 Tue,  2 May 2023 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683059406; x=1714595406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ULXnnAPk9ztnjGx6v/93dTEPEwrEXw1ELaH+Hf6+A3o=;
 b=iB8e7NtkLMJq11kvGe5YB1B/e6AaGCLyLgh4UlqrS52E//lN4m6XA/gj
 lKIV24mtuVKmU+Jqo0DcbWOoYI8WkYGAz2NEpqumFRMn3hmktUDTR/IR0
 XqpEAeLIL0RYgbn9+TGXQWEzT5uGN6jHdHY9Lswv/T3F1Z8fB2VUfz2EZ
 xRmjPcAOS31xE+xu8m8qvU/3nFNChlVerQKvppUF6+uXBPQsp1+5pQhDe
 MFxtOwGGArN2uwTm2i2JNA04F98JyJO7arFfliuiH44qm5Rdw7hoROYlK
 mYeOV0e8y1FjHUrldVUABEk67MrNavnW4El0oJ+CmkrC9+DIO1tHvtlCe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="345977610"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="345977610"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 13:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="785809774"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="785809774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 02 May 2023 13:30:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 13:30:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 13:30:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 13:30:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 13:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJ95zGqoArQg6uL7v8mRceXD7OEEW7YIhof1y5oG6CJtIKSlxJ2p8lUJlf0O+28ry5nNen7ckBaQzK8o7VZ7oEysbfhqmO8qqj3d7MMNSVJPl9FvTh2zBQ/mMcyUFzO9iqbJtcKa902IB7OgZzVnJH2C0dZOaABwrHR8Tp+1TXqtTxA7bbimhl4M1sQS3v9t7wzZuFT+X8tLwV5Ryye96NCNIbEMHg/53FHtiipXEelRrIEQBdFITxkuUnKsin/WW+1/GUkkq4QZ4NF6j2sy5y1TUxZ8DaI953MJz8/mbf/WKHJ//q/pHecNC9beVdixP6j06Worq7p8HRkNBGKvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABcK35aIcWl8BAZa+0GM3Fu+Og84aDtw8PzcpK8uSYU=;
 b=QHNosHyTqVb7Wnc4jW1vpuxwUspas/WqJzB2WCU/r9ph9cRBjBj023661H1s595PA+BiASLEMJPQIJEHxjoJlzEzz1zrm4KwPG14rrBkPlOIUy3cx++BZmfUebMoee1uM21x+fru/16CE+hJ4aJohfd8RvrVMyQ+NH2jnZjEbxEM44I+6G7amJZLDRQWpFOdP9D37EJsWqdaHnMC6WUKklgy9SSjmW8znm0u3PmOAYTeEbyYXZuzaJuTJulxlgWNCd4vACBU7Sw7d5kDvAm+v/0cPouf3wXFV8wz2os9vbqigv0bzu9osb9x5wzaIWdNbY81tmJgLxOoAdL7ryj8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 20:29:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 20:29:57 +0000
Date: Tue, 2 May 2023 20:29:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
Message-ID: <ZFFytN9dz3Xl97mI@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
 <2f09ea83-59f0-f210-797f-40dc13908f7d@linux.intel.com>
 <ZFDCTkAD5M0wdJ0f@DUT025-TGLU.fm.intel.com>
 <ZFFNsemoaxUepnxw@rdvivi-mobl4>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFFNsemoaxUepnxw@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc96cfd-2112-4e5e-d317-08db4b4bfeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKjm8i6/REwUcNwnbjtJ7SOIR29n/oQW89eb0gNy3M5SQGfP39uDbOj/YDwfGK+5wEQEu/WoYQyywT0i3U/EGUqon4/s54Pf3ohvbyItFwRR/H+tFIJuHUieIlMW2M5Dl3fZHdefZNWh+iLqn9m6IQsK7X6FuuEHlfKV3k9k0dZDYhvJJPqGVaNOqscixIMnsoz2eU907sImUe9mii9Gm4LdLA8HHpQM7MXmU+xnysL85Y+7iDp2DcMqTrlarykacUOsmTgAHWTh0n0Q1rRW3mSSUPYRuaxTgxgi7U63XYL3QsxcffLcY63xkQ7uo6Qge+CPeyRKZ42pFoImeL2lhYAbAFGzsSUMnBkK7csqmoHSyI7DweoLJhyVX7X2y8//04qvpvN2jg0wh4iKSihwcW0lWOtaXcfLukC9qQLcZ5eLiy22+fO4JTVSHAPru0Yrz3jVnFvYovldvfChfalhrH9/ADMjeXyOkaEDauWAaRY+5Ju/zRzT8aD86EQ1HwoFDMWoJL5jmngNfJKzTkZCQULoa/7Xzgp57Pg4PJV6WnOc8dh0hj+Y7ZoxHUQqUTjO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(83380400001)(478600001)(186003)(54906003)(4326008)(6916009)(66556008)(66476007)(66946007)(53546011)(66574015)(6486002)(6666004)(6512007)(6506007)(26005)(316002)(8936002)(8676002)(5660300002)(41300700001)(82960400001)(44832011)(2906002)(30864003)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1BXUC2NteK+lu/i93RHdF1fpZ57pyOHNvYq7YeoB5xLBRr0D8D+SpizyeQ?=
 =?iso-8859-1?Q?C7XxhOaoerDyqqYyeHdPCbdWvLatD9FpVg2IBOvfFZjCQCKeVFdoSYMUJD?=
 =?iso-8859-1?Q?/nCuyVdXYVi/f9FQ+9EJDybJxrIEHx7m4976qtePujF/b+tufDEluEHmOm?=
 =?iso-8859-1?Q?63SgL+LLOaYnZEz1YnXhfT7uAKRT9Y7p8so6lJEq38/M0qfcM4MtFlSqSK?=
 =?iso-8859-1?Q?98OV244cpknEZxwVKRUqL2/b7StO/qloGGGs/aubAHx0WlP6qSU71N7KBL?=
 =?iso-8859-1?Q?V99k+HnvvHHXItqHzIJCWL23+H1igFBh/Nl5LHu3GtwwVeIKTViwWKg3NS?=
 =?iso-8859-1?Q?vWAjG9jKm6kPdFVFpkXIxeTgL493CSiDe4H18r3+IlOqkx1w3ifRbuhuUT?=
 =?iso-8859-1?Q?sovooJHP5tEZhlv9VlqsRRs15o2Nq3aptpRc+70ou5qVmv9YxvuuU0gxNR?=
 =?iso-8859-1?Q?qp27VfI0TjnckBLl4ZLxjID0IdQAXxK7YT8t/M+ZLpY+Edv1YFGlmiip58?=
 =?iso-8859-1?Q?8vDLxC5kArEEhszhU3FPPbbCvoeBkdGmZXSfeYU6YiwVPjxydjWHd9Oixb?=
 =?iso-8859-1?Q?oR7TvhQO9G7VkawNXRQPMSzSHLzc2TrlKWSO1EYNqIWZ7HpaUdyehQb0mb?=
 =?iso-8859-1?Q?7VQs3tpe90MC+ALjMRrv2UHTk/0n32oYarbePKDMldtazmNWlG+OwRZvzE?=
 =?iso-8859-1?Q?4gPECXYqIU6+eQ4wp/OgwEUgjOeAx7/Ukc/W2hrkw3hLoabIcQpJFwTQAp?=
 =?iso-8859-1?Q?NoL/d7s0DOXQ9Y7yHIZFjLRLqgoADZUmoQ2jQoCPudTCScdZPzQacq8JuQ?=
 =?iso-8859-1?Q?YKYys4YxnWX3HKPYgnkjNZLYphE3+r9Xuq9VbFiJft9eaExQRYINI8WjW0?=
 =?iso-8859-1?Q?Pqdfqm1y40o+AlDszsNz9wI5cIT50NE1WEdZF9tiGS/YyZRvGTJnJX5ZWt?=
 =?iso-8859-1?Q?RIQjgdAzvxU82oAD68d2ErWgiyf52vN5e4KYhtgX9ZjDAEr4FN+TPKNaJ9?=
 =?iso-8859-1?Q?GnuNj+kOW2vu1fpzOqheh89AQ3SCKrogmtW+lw3e6rEU8WwENHKLlQ0nAw?=
 =?iso-8859-1?Q?Tpgrw+CztPOJyaR149W0I33aKgzLS0OqRvzpsSIsf8PgEm3LF/rQxdVrS8?=
 =?iso-8859-1?Q?0eN7JEqb6bBz7t9iB1yJ4imrEHEhi3SVDK1XA48JJVBPTrFVCYSO3axuyA?=
 =?iso-8859-1?Q?nNEQqlGV4kThO+22CAJaXjWPCaLH4UwXIQXWrxlpJGGWM/yrje65nfpSeF?=
 =?iso-8859-1?Q?qiGV/dQzSedX5u4Wf6TkBV7gcfZlr1szxN4PCeDts5ekxLpxjyZqcrWmBQ?=
 =?iso-8859-1?Q?aWjFXx3agnDqRKfCINKZRB972R4egWr3APb23lWrJfXPutfuyAX456CNw7?=
 =?iso-8859-1?Q?53+uvg46RJBffbMOYePf4Cj5ZRBOh6nw0GJ60O907q+HkamVUMlgE85Oem?=
 =?iso-8859-1?Q?ChkmKydIe+rdc1nLrbp0YH3XqUW7eTCiqN5BHkGVEuUA/xPd7Bja1jpCZf?=
 =?iso-8859-1?Q?AfwkBTqMGP2eH0HMThC4Om+hxe3QDN3UYDPEbVM2Phj6ifyvIhoAelIlEb?=
 =?iso-8859-1?Q?cLhr5fKqUdgaioc6nrreB/McdO7uhVawW4Lv7fH1PGzoVdXNQVGKaO0+FH?=
 =?iso-8859-1?Q?iFaC/ZLaY/lNdzopPH/vjjuKw1lnFMnQdRnosg4+hdAxrox6iREQnNxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc96cfd-2112-4e5e-d317-08db4b4bfeb9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 20:29:57.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbspZLjmBFo6RbBmbvXrIzzD76HDLaFroFjmS6KwwOBS9lMYakAzSPjfc/QXTi7NvRg+2ldtR+W951+z2EEIJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 02:06:55PM -0400, Rodrigo Vivi wrote:
> On Tue, May 02, 2023 at 07:57:02AM +0000, Matthew Brost wrote:
> > On Thu, Apr 27, 2023 at 10:28:13AM +0200, Thomas Hellström wrote:
> > > 
> > > On 4/26/23 22:57, Rodrigo Vivi wrote:
> > > > The goal is to use devcoredump infrastructure to report error states
> > > > captured at the crash time.
> > > > 
> > > > The error state will contain useful information for GPU hang debug, such
> > > > as INSTDONE registers and the current buffers getting executed, as well
> > > > as any other information that helps user space and allow later replays of
> > > > the error.
> > > > 
> > > > The proposal here is to avoid a Xe only error_state like i915 and use
> > > > a standard dev_coredump infrastructure to expose the error state.
> > > > 
> > > > For our own case, the data is only useful if it is a snapshot of the
> > > > time when the GPU crash has happened, since we reset the GPU immediately
> > > > after and the registers might have changed. So the proposal here is to
> > > > have an internal snapshot to be printed out later.
> > > > 
> > > > Also, usually a subsequent GPU hang can be only a cause of the initial
> > > > one. So we only save the 'first' hang. The dev_coredump has a delayed
> > > > work queue where it remove the coredump and free all the data withing a
> > > > few moments of the error. When that happens we also reset our capture
> > > > state and allow further snapshots.
> > > > 
> > > > Right now this infra only print out the time of the hang. More information
> > > > will be migrated here on subsequent work. Also, in order to organize the
> > > > dump better, the goal is to propose dev_coredump changes itself to allow
> > > > multiple files and different controls. But for now we start Xe usage of
> > > > it without any dependency on dev_coredump core changes.
> > > > 
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/Kconfig                |   1 +
> > > >   drivers/gpu/drm/xe/Makefile               |   1 +
> > > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 144 ++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
> > > >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
> > > >   drivers/gpu/drm/xe/xe_device_types.h      |   4 +
> > > >   drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
> > > >   drivers/gpu/drm/xe/xe_pci.c               |   2 +
> > > >   8 files changed, 223 insertions(+)
> > > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
> > > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
> > > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > > index f6f3b491d162..d44794f99338 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > @@ -35,6 +35,7 @@ config DRM_XE
> > > >   	select DRM_TTM_HELPER
> > > >   	select DRM_SCHED
> > > >   	select MMU_NOTIFIER
> > > > +	select WANT_DEV_COREDUMP
> > > >   	help
> > > >   	  Experimental driver for Intel Xe series GPUs
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index ee4a95beec20..9d675f7c77aa 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
> > > >   	xe_bo.o \
> > > >   	xe_bo_evict.o \
> > > >   	xe_debugfs.o \
> > > > +	xe_devcoredump.o \
> > > >   	xe_device.o \
> > > >   	xe_dma_buf.o \
> > > >   	xe_engine.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > new file mode 100644
> > > > index 000000000000..d9531183f03a
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -0,0 +1,144 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_devcoredump.h"
> > > > +#include "xe_devcoredump_types.h"
> > > > +
> > > > +#include <linux/devcoredump.h>
> > > > +#include <generated/utsrelease.h>
> > > > +
> > > > +#include "xe_engine.h"
> > > > +#include "xe_gt.h"
> > > > +
> > > > +/**
> > > > + * DOC: Xe device coredump
> > > > + *
> > > > + * Devices overview:
> > > > + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> > > > + * standardized way.
> > > > + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> > > > + * which is linked with our card device directly.
> > > > + * The core dump can be accessed either from
> > > > + * /sys/class/drm/card<n>/device/devcoredump/ or from
> > > > + * /sys/class/devcoredump/devcd<m> where
> > > > + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> > > > + * /sys/class/drm/card<n>/device/.
> > > > + *
> > > > + * Snapshot at hang:
> > > > + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > > > + * time. For this reason, we need to take snapshots from when the hang has
> > > > + * happened, and not only when the user is reading the file. Otherwise the
> > > > + * information is outdated since the resets might have happened in between.
> > > > + *
> > > > + * 'First' failure snapshot:
> > > > + * In general, the first hang is the most critical one since the following hangs
> > > > + * can be a consequence of the initial hang. For this reason we only take the
> > > > + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > > > + * at least while the coredump device is alive. Dev_coredump has a delayed work
> > > > + * queue that will eventually delete the device and free all the dump
> > > > + * information. At this time we also clear the faulty_engine and allow the next
> > > > + * hang capture.
> > > > + */
> > > > +
> > > > +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > +				   size_t count, void *data, size_t datalen)
> > > > +{
> > > > +	struct xe_devcoredump *coredump = data;
> > > > +	struct xe_devcoredump_snapshot *ss;
> > > > +	struct drm_printer p;
> > > > +	struct drm_print_iterator iter;
> > > > +	struct timespec64 ts;
> > > > +
> > > > +	iter.data = buffer;
> > > > +	iter.offset = 0;
> > > > +	iter.start = offset;
> > > > +	iter.remain = count;
> > > > +
> > > > +	mutex_lock(&coredump->lock);
> > > > +
> > > > +	ss = &coredump->snapshot;
> > > > +	p = drm_coredump_printer(&iter);
> > > > +
> > > > +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> > > > +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > > +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > > > +
> > > > +	ts = ktime_to_timespec64(ss->snapshot_time);
> > > > +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > +	ts = ktime_to_timespec64(ss->boot_time);
> > > > +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> > > > +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > +
> > > > +	mutex_unlock(&coredump->lock);
> > > > +
> > > > +	return count - iter.remain;
> > > > +}
> > > > +
> > > > +static void xe_devcoredump_free(void *data)
> > > > +{
> > > > +	struct xe_devcoredump *coredump = data;
> > > > +	struct xe_device *xe = container_of(coredump, struct xe_device,
> > > > +					    devcoredump);
> > > > +	mutex_lock(&coredump->lock);
> > > > +
> > > > +	coredump->faulty_engine = NULL;
> > > > +	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> > > > +
> > > > +	mutex_unlock(&coredump->lock);
> > > > +}
> > > > +
> > > > +static void devcoredump_snapshot(struct xe_devcoredump *coredump)
> > > > +{
> > > > +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > > > +
> > > > +	lockdep_assert_held(&coredump->lock);
> > > > +	ss->snapshot_time = ktime_get_real();
> > > > +	ss->boot_time = ktime_get_boottime();
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> > > > + * @e: The faulty xe_engine, where the issue was detected.
> > > > + *
> > > > + * This function should be called at the crash time. It is skipped if we still
> > > > + * have the core dump device available with the information of the 'first'
> > > > + * snapshot.
> > > > + */
> > > > +void xe_devcoredump(struct xe_engine *e)
> > > > +{
> > > > +	struct xe_device *xe = gt_to_xe(e->gt);
> > > > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > > 
> > > For !long running engines, this is the dma-fence signalling critical path,
> > > and since the drm_scheduler has not yet been properly annotated, we should
> > > probably annotate that here, to avoid seeing strange deadlocks during
> > > coredumps....
> > > 
> > > /Thomas
> > >
> > 
> > +1
> 
> Just to confirm we are in the same page here, do you guys mean move
> dma_fence_begin_signalling() annotation here?
> 
> or which annotation am I missing?
> 

Yea dma_fence_begin_signalling at the beginning of function.

Matt 

> > 
> > Matt
> >  
> > > 
> > > 
> > > > +
> > > > +	mutex_lock(&coredump->lock);
> > > > +	if (coredump->faulty_engine) {
> > > > +		drm_dbg(&xe->drm, "Multiple hangs are occuring, but only the first snapshot was taken\n");
> > > > +		mutex_unlock(&coredump->lock);
> > > > +		return;
> > > > +	}
> > > > +	coredump->faulty_engine = e;
> > > > +	devcoredump_snapshot(coredump);
> > > > +	mutex_unlock(&coredump->lock);
> > > > +
> > > > +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > > > +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");
> > > > +
> > > > +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > > > +		      xe_devcoredump_read, xe_devcoredump_free);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_devcoredump_init - Initialize xe_devcoredump.
> > > > + * @xe: Xe device.
> > > > + *
> > > > + * This function should be called at the probe so the mutex lock can be
> > > > + * initialized.
> > > > + */
> > > > +void xe_devcoredump_init(struct xe_device *xe)
> > > > +{
> > > > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > > > +
> > > > +	mutex_init(&coredump->lock);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > > new file mode 100644
> > > > index 000000000000..30941d2e554b
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > > @@ -0,0 +1,22 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_DEVCOREDUMP_H_
> > > > +#define _XE_DEVCOREDUMP_H_
> > > > +
> > > > +struct xe_device;
> > > > +struct xe_engine;
> > > > +
> > > > +void xe_devcoredump_init(struct xe_device *xe);
> > > > +
> > > > +#ifdef CONFIG_DEV_COREDUMP
> > > > +void xe_devcoredump(struct xe_engine *e);
> > > > +#else
> > > > +static inline void xe_devcoredump(struct xe_engine *e)
> > > > +{
> > > > +}
> > > > +#endif
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > new file mode 100644
> > > > index 000000000000..3f395fa9104e
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > @@ -0,0 +1,47 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> > > > +#define _XE_DEVCOREDUMP_TYPES_H_
> > > > +
> > > > +#include <linux/ktime.h>
> > > > +#include <linux/mutex.h>
> > > > +
> > > > +struct xe_device;
> > > > +
> > > > +/**
> > > > + * struct xe_devcoredump_snapshot - Crash snapshot
> > > > + *
> > > > + * This struct contains all the useful information quickly captured at the time
> > > > + * of the crash. So, any subsequent reads of the coredump points to a data that
> > > > + * shows the state of the GPU of when the issue has happened.
> > > > + */
> > > > +struct xe_devcoredump_snapshot {
> > > > +	/** @snapshot_time:  Time of this capture. */
> > > > +	ktime_t snapshot_time;
> > > > +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> > > > +	ktime_t boot_time;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct xe_devcoredump - Xe devcoredump main structure
> > > > + *
> > > > + * This struct represents the live and active dev_coredump node.
> > > > + * It is created/populated at the time of a crash/error. Then it
> > > > + * is read later when user access the device coredump data file
> > > > + * for reading the information.
> > > > + */
> > > > +struct xe_devcoredump {
> > > > +	/** @xe: Xe device. */
> > > > +	struct xe_device *xe;
> > > > +	/** @falty_engine: Engine where the crash/error happened. */
> > > > +	struct xe_engine *faulty_engine;
> > > > +	/** @lock: Protects data from races between capture and read out. */
> > > > +	struct mutex lock;
> > > > +	/** @snapshot: Snapshot is captured at time of the first crash */
> > > > +	struct xe_devcoredump_snapshot snapshot;
> > > > +};
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 1cb404e48aaa..2a0995824692 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -12,6 +12,7 @@
> > > >   #include <drm/drm_file.h>
> > > >   #include <drm/ttm/ttm_device.h>
> > > > +#include "xe_devcoredump_types.h"
> > > >   #include "xe_gt_types.h"
> > > >   #include "xe_platform_types.h"
> > > >   #include "xe_step_types.h"
> > > > @@ -55,6 +56,9 @@ struct xe_device {
> > > >   	/** @drm: drm device */
> > > >   	struct drm_device drm;
> > > > +	/** @devcoredump: device coredump */
> > > > +	struct xe_devcoredump devcoredump;
> > > > +
> > > >   	/** @info: device info */
> > > >   	struct intel_device_info {
> > > >   		/** @graphics_name: graphics IP name */
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index e857013070b9..231fb4145297 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -14,6 +14,7 @@
> > > >   #include <drm/drm_managed.h>
> > > >   #include "regs/xe_lrc_layout.h"
> > > > +#include "xe_devcoredump.h"
> > > >   #include "xe_device.h"
> > > >   #include "xe_engine.h"
> > > >   #include "xe_force_wake.h"
> > > > @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> > > >   		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> > > >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > > >   		simple_error_capture(e);
> > > > +		xe_devcoredump(e);
> > > >   	} else {
> > > >   		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
> > > >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index e512e8b69831..1d496210b580 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -16,6 +16,7 @@
> > > >   #include "regs/xe_regs.h"
> > > >   #include "regs/xe_gt_regs.h"
> > > > +#include "xe_devcoredump.h"
> > > >   #include "xe_device.h"
> > > >   #include "xe_display.h"
> > > >   #include "xe_drv.h"
> > > > @@ -657,6 +658,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > > >   		return err;
> > > >   	}
> > > > +	xe_devcoredump_init(xe);
> > > >   	xe_pm_runtime_init(xe);
> > > >   	return 0;
