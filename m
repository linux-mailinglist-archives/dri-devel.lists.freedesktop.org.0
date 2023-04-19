Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8226E81FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 21:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E35E10EAA8;
	Wed, 19 Apr 2023 19:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FFD10EAA8;
 Wed, 19 Apr 2023 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681933251; x=1713469251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N+TsDhzKHrhhIQv6OzThmO9wGKxH9zDSX/Cf2IP+oAE=;
 b=c97U2V80w9DtsWv5c7CzPkSI52SKvLOqVTs6sptFlraYTXvYO9Rozg7F
 6nJbdcIGwmtk8nMZbhQnQ5a62VAJ5wyhuKSUkGgUTesbmZ+ubVBUdNzGT
 CyFXHccOh8EYvDZZNuS9ddBYJQ5C0x8RYb3CK+AmrzMY8fe4cGERl4pC2
 Dehu+K+v8Y6KizJRsTmAPSFut/WI2Wy2TIzk3ZiQi6WtG4Hc6Mt6rqeVC
 L9uqkXwv+wWTZh8Jsa9tNcHdPfUOVfVEYQw4zIf5pRE1nFVLV5/dRUwM4
 TRr2Dtgtm0B0tDpgoPx6f8Bn04a7A0TmobLr023Z7uDO+p8NLvUpHkohB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325877483"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325877483"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815723962"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="815723962"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 12:40:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:40:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:40:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e49a0eadZmfLeM5lz3DqlnWpmaWKQ5v2h2RU8rvrcj1rbPAvVUcqeQzmoNDAWib1VTttBQff3xaWoQ/SaticDqcATP/iPBi/PcBGbSoNXVVopQD3PmScmoMxaVMsPpI+XrN7jG8NgXds6bWVup+PTYxef9Y21PCuHLONOYyC/7ujGOMjPZm9pFN90X0opFE9qrIjAT26xM2Z4uOftVNABIvzF6zCjrSY6qNtGQomev8zTnf0uHpWwyFgJeXefQaZMq+ArZp1p1n93T9MvSlPTlh7Yt3nNR3O0+nnSUcr2o+CYCX08jYICA67U4QgkL4wQep0WTgBTsNNOLMRzHLfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ByRupOE6w4SDtz2LPxoLhdGTVZ/W9SPq8I7K0y/IYE=;
 b=JSXJAz56XkkLneVUvQSgaN/VgGKuU5ro7cmf+U4dSZkyYczU0sCto1bQoEUB8kwnofFxLMrlWOMKYZL/ZkGCQt40RspgYtASE2qvEvTGQYfw6PrxpNwBZ+f6869jhN5Ez+9QFdIUNNU0zxW55F/9SEgBfUWrmdsmyVmqOhWA34UNbUIfjLTHvyzqcZyUgeXcy18HToK/Ui6UVc21sod9qg9YkUBIvSm9MJWglESS1ejNYIInxcdCFsxgCPQLO0dBXjac/6GwaQ/8Ft1vYueS5EPYQVB6bjjmxdzDSao7TfjrBdKemsO4v9GOLMfYPSp8ZCGktPs43jZQ7ZaPuMbK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 19:40:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:40:48 +0000
Date: Wed, 19 Apr 2023 15:40:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to
 complete
Message-ID: <ZEBDvKq0vEx/Ow5Z@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
 <20230410223509.3593109-4-ashutosh.dixit@intel.com>
 <ZD4sPiMDhhr1wO8+@intel.com>
 <874jpdje8p.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874jpdje8p.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f7266b-97f0-42e1-d461-08db410df9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBQUULBZBllFDZFGwetNB9PsabwSwjUU+8MWjsziFSR+msOv7GEgDpOwEPeJ8vW/sayLPN/AyeXjbDDy5ltxYjMvs7z+VrTR9bsQpCvORJIwYhEaLnnBKtLNAhsKJApV47CUS95TvNAIodA3HurFk9CCaPM0mv/I44TA0yoGfjPFMUWfLQz5ini1hRtK9ZDvwoaC9+petcTuldNjZFlDzSCDwDKEujhMBo2yGPRdcUqxYkIxQbxeA0OBLj25H/htOghPj0U8FKeLkME1+hu923tJbEa9JSAzwSd9e76p+ynpdkKk2BR9EqUDDXVCtnzUV7w8mXqvK4/ltcANC0Loo5HRM5mbn/pyZqUgU3tfNttNMwmrDB2C5TFxAWMwu/f4LVvcPna95943s6VshBG0v8+l/E6VdmxdUWakPh0TRP/LtzveN+TPkm/9KyLdz/dr94bP35x8qZP3k2nkEoIN9eIB2hXFAyY4MR4GxlIVwpD4ZUBzrfvd/2+rVgWOApCEA/gOaLK1KUSb4YmBdH/tckhhOswcLVnBeoAyPQ1/G/q9t3fY9Snhs0+qE4E0CcDH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(2906002)(41300700001)(6862004)(8936002)(8676002)(82960400001)(38100700002)(44832011)(5660300002)(36756003)(86362001)(6666004)(478600001)(37006003)(2616005)(26005)(6506007)(186003)(6512007)(6486002)(66556008)(66946007)(66476007)(83380400001)(316002)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vz2ULZv3i4Jj2xjM/eZ4rwMbWVXvJqZjeILtkyfv427bTtpSaX01kblFidiy?=
 =?us-ascii?Q?KUWV2vZb/6if/kDDXeMZhdeaqFXW4bym+yeMZInY9hQg7tfR/VO0Fd4ZoDZw?=
 =?us-ascii?Q?DZfkwxmrY1wPgWRVoamNxuXCOwvT0vf+xQz2pJHhJTCAJq32dcGN+m3BgDRx?=
 =?us-ascii?Q?eJhOdd/YriRrlYpSA+asySAJMWAmcV4Srd7N7FG1maObclJe84uL6RT3Vwcf?=
 =?us-ascii?Q?bDJ3hhJB7SPrAlQ0Ra72COaaQRkhJBqbN/CxusAFav+EUHHEj9MghBIMXc+Z?=
 =?us-ascii?Q?AmIIScdUKZA1Igqg7So3FbX33l8zEI/j0QG1V7Yse7iRd+tHq48Pzvwqb6gG?=
 =?us-ascii?Q?KY18GclHe32buK2fmK6+dsCaAu8CmB4cEsqAPTVIOg78NgF/KHA84aCVRyQh?=
 =?us-ascii?Q?Z+/wySx8g/dVwPegDQRhBt0TnBSIZUPxtMnFKRhBIkQFOOYw+/zs+Oknjc1r?=
 =?us-ascii?Q?boZhuvIDkvzWseW/+UbipFbYJ3bojiNp8RsQRCMM7B7smFj+6S/wxNtweo2h?=
 =?us-ascii?Q?p0IkJMdW6eIxNjMn8LAEZl6hgz0QGgCRlKMF1jeQ8buQkAiK8NQFaV+MtaIo?=
 =?us-ascii?Q?2718ezMm5vfQerjYAQHB5PU+ee+etYp7pb3skQPNyaci3dg3/JgNdB7irARM?=
 =?us-ascii?Q?U/ze/FXkkEMAZBTxOyxLuhrafVoAzAyIF6zENWq2UE95lobUUOO9RaUmlqcC?=
 =?us-ascii?Q?uzETMQeOiBwPzurZBakl0w2SpGrAaNtIVNDMP1aOvhsjiGIPwrhiNAEMhOge?=
 =?us-ascii?Q?S2YN2zeT1lAsXc9uaRMyQjo8XpwmLaUbnLHEmAIWoLSpzmKRg7zsoLNHI4vh?=
 =?us-ascii?Q?jTcpTIwgTe+dxa614Ls8Da+Zik3NqoPh6S3CWgXLk5wUaSigeifua938Lls/?=
 =?us-ascii?Q?7m2b5BC6cIswRhCCpRJFwlfesq9skLFyFhb1T1mFe+FbM6ENIbem7HTArJVq?=
 =?us-ascii?Q?/uWg7nD8Pkx+MZjPCO+PtQh2I9ViDHzYSa4BVYDp6lUEzsl2+qNgTAIHsCP7?=
 =?us-ascii?Q?FbtmNUilHJ+0i8MHs5pKRAsvPsBD8zf0ZCw4PaZINT3QcqqTHpseu5sffMHI?=
 =?us-ascii?Q?3cvGR4FD1juqSS7LVHriU0ClkcJuLVFCBsAVR8JTMX5e2g1UG1Gpz7afB7mT?=
 =?us-ascii?Q?eAy/V7gLoWJYydxan0fgjZY6JMY4Cggh2PHkgRw1H1TXVyxgw8IC8o3COkmB?=
 =?us-ascii?Q?uG5Z7X9OE0ITzjBqbdc0RljGPZ2uIrw8Gkdy82wgvFaIYh8lujb+zpaYoPAD?=
 =?us-ascii?Q?DEc+kMaPsTczHWbk91fPaXpmfjW2eRuXo++ki7/QA93xQgmQuMR0S1mEbtak?=
 =?us-ascii?Q?sWWbLwmMWkqsQ2WnEB/PEmwSduGr4KaM7XxAN9K841/fcRW44+5xRuBqMbCb?=
 =?us-ascii?Q?3DDQs28YPWVDYMviXWgBc6PMEK8jmBLGduvmLHNb4FKr6EsI01GrBaepBHqW?=
 =?us-ascii?Q?3tJBfFmivgd2OuxZid9FyCPEK+sup7NikBf26HWotaowYJvqT1ucb8lc50tV?=
 =?us-ascii?Q?m6fNyiefGhHY3FJ9TYdzs4RXjQNkjONwBfrL3J//yz4RS/YmVBAndamHywm3?=
 =?us-ascii?Q?dAe3V3pYXUDBnmotbc8TR4MMnCEYhgomxetCwnv6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f7266b-97f0-42e1-d461-08db410df9bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:40:48.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt3C2hpLc821fTcz51r/3YLttc9Sgh0xBhJJjPk1S6mP/k2X7+39o1zRQG2T3DeAG4OsUQyK7gnTiL9k39iGsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
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

On Tue, Apr 18, 2023 at 10:23:50AM -0700, Dixit, Ashutosh wrote:
> On Mon, 17 Apr 2023 22:35:58 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Mon, Apr 10, 2023 at 03:35:09PM -0700, Ashutosh Dixit wrote:
> > > Instead of erroring out when GuC reset is in progress, block waiting for
> > > GuC reset to complete which is a more reasonable uapi behavior.
> > >
> > > v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
> > >  1 file changed, 33 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > index 9ab8971679fe3..8471a667dfc71 100644
> > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > @@ -51,6 +51,7 @@ struct hwm_drvdata {
> > >	char name[12];
> > >	int gt_n;
> > >	bool reset_in_progress;
> > > +	wait_queue_head_t waitq;
> > >  };
> > >
> > >  struct i915_hwmon {
> > > @@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
> > >  static int
> > >  hwm_power_max_write(struct hwm_drvdata *ddat, long val)
> > >  {
> > > +#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
> > > +
> > > +	int ret = 0, timeout = GUC_RESET_TIMEOUT;
> > >	struct i915_hwmon *hwmon = ddat->hwmon;
> > >	intel_wakeref_t wakeref;
> > > -	int ret = 0;
> > > +	DEFINE_WAIT(wait);
> > >	u32 nval;
> > >
> > > -	mutex_lock(&hwmon->hwmon_lock);
> > > -	if (hwmon->ddat.reset_in_progress) {
> > > -		ret = -EAGAIN;
> > > -		goto unlock;
> > > +	/* Block waiting for GuC reset to complete when needed */
> > > +	for (;;) {
> > > +		mutex_lock(&hwmon->hwmon_lock);
> >
> > I'm really afraid of how this mutex is handled with the wait queue.
> > some initial thought it looks like it is trying to reimplement ww_mutex?
> 
> Sorry, but I am missing the relation with ww_mutex. No such relation is
> intended.
> 
> > all other examples of the wait_queue usages like this or didn't use
> > locks or had it in a total different flow that I could not correlate.
> 
> Actually there are several examples of prepare_to_wait/finish_wait
> sequences with both spinlock and mutex in the kernel. See
> e.g. rpm_suspend(), wait_for_rtrs_disconnection(), softsynthx_read().
> 
> Also, as I mentioned, except for the lock, the sequence here is identical
> to intel_guc_wait_for_pending_msg().
> 
> >
> > > +
> > > +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> > > +
> > > +		if (!hwmon->ddat.reset_in_progress)
> > > +			break;
> >
> > If this breaks we never unlock it?
> 
> Correct, this is the original case in Patch 2 where the mutex is acquired
> in the beginning of the function and released just before the final exit
> from the function (so the mutex is held for the entire duration of the
> function).

I got really confused here... I looked at the patch 2 again and I don't
see any place where the lock remains outside of the function. What was
what I asked to remove on the initial versions.

But now with this one I'm even more confused because I couldn't follow
to understand who will remove the lock and when.

> 
> >
> > > +
> > > +		if (signal_pending(current)) {
> > > +			ret = -EINTR;
> > > +			break;
> > > +		}
> > > +
> > > +		if (!timeout) {
> > > +			ret = -ETIME;
> > > +			break;
> > > +		}
> > > +
> > > +		mutex_unlock(&hwmon->hwmon_lock);
> >
> > do we need to lock the signal pending and timeout as well?
> > or only wrapping it around the hwmon->ddat access would be
> > enough?
> 
> Strictly, the mutex is only needed for the hwmon->ddat.reset_in_progress
> flag. But because this is not a performance path, implementing it as done
> in the patch simplifies the code flow (since there are several if/else,
> goto's, mutex lock/unlock and prepare_to_wait/finish_wait to consider).
> 
> So if possible I *really* want to not try to over-optimize here (I did try
> a few other things when writing the patch but it was getting ugly). The
> only real requirement is to drop the lock before calling schedule_timeout()
> below (and we are reacquiring the lock as soon as we are scheduled back in,
> as you can see in the loop above).
> 
> >
> > > +
> > > +		timeout = schedule_timeout(timeout);
> > >	}
> > > +	finish_wait(&ddat->waitq, &wait);
> > > +	if (ret)
> > > +		goto unlock;
> > > +
> > >	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > >
> > >	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
> > > @@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
> > >	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
> > >			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> > >	hwmon->ddat.reset_in_progress = false;
> > > +	wake_up_all(&hwmon->ddat.waitq);
> > >
> > >	mutex_unlock(&hwmon->hwmon_lock);
> > >  }
> > > @@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> > >	ddat->uncore = &i915->uncore;
> > >	snprintf(ddat->name, sizeof(ddat->name), "i915");
> > >	ddat->gt_n = -1;
> > > +	init_waitqueue_head(&ddat->waitq);
> > >
> > >	for_each_gt(gt, i915, i) {
> > >		ddat_gt = hwmon->ddat_gt + i;
> > > --
> > > 2.38.0
> > >
> 
> From what I understand is the locking above is fine and is not the
> point. The real race is between schedule_timeout() (which suspends the
> thread) and wake_up_all() (which schedules it back in). But this
> prepare_to_wait/finish_wait pattern is so widespread that the kernel
> guarantees that this works correctly as long as you do things in the
> correct order (otherwise we'd see a lot more kernel hangs/deadlocks).
> 
> Thanks,
> Ashutosh
