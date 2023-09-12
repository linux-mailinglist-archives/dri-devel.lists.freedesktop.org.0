Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2AA79D444
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 17:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448F910E42F;
	Tue, 12 Sep 2023 15:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D6510E429;
 Tue, 12 Sep 2023 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694531085; x=1726067085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZiZVz2+1gixrpiznD6g+wDsHkHtJxVyGU4ka0o4j7ko=;
 b=cCnKHvTNfjQSqW+gn80eYJGwCFQUoWqCVcFBeY9nA39WgkilXc0oy7Li
 xRXXcX4D1MB2tsyMFzz74dF905jcvHcf/5HCziHZWufVT9ggifiXMS/Pf
 3yNtLZOH+EHmiRE3VR2II63fZ7ACP+3KpJttLLcWt7y1fdoyOPAozxx1t
 jVR6YVNsT+w2OOpuMom3enhrTUqMEL1eWkm7AaXh4k4JFvzCoyg5cByvq
 p0x/VqM5XPvcwU8jALeXZtSWHwR5sFtuV1IOXXwUnrbjklTwiz+JaCt7V
 BQLs6fjRqf8M9N6etJmAleMUW9Y22pdmw1cwfzshUluP2YHW5BPIe67nS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358676689"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="358676689"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 08:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809301809"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809301809"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 08:04:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 08:04:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 08:04:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 08:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfxSC+Yeqt15IH7dCKM/EHvJa+eFgN/eRsP0PsyOMxOQ1774rFU6PFIgRG8hCzDAbZpqyEkXt6HBsautg198/DTJja9txmiIWD9BVM0hR7K2GTDogvr/iY7jfkAIMQddkY6H60kxMI/Yfbw9a7NZIP4AKC3rETu9ATnRxxXKog5h6QcN6mGD9z53tBwxftGmVa8PLqgibcupbjg7lPob0vzs7TgJk0MCU10xP4QFbArZdZRdzc9YpKT5SO/WUuY75egDGJsRLZ9r1fA9Y/WGkjuZ8XBuodbapsgTuNABtjOAMAGyksDHNWV6QMJ3wK3rRV3p6fq5mVRGiYL1M3HbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMb/QPABDwmlhFwiq519MWFFDc/yACl/sRLiwzVpf7A=;
 b=OAqOscIPYDplgl/BEHkD9sPCK0iIm5bJEsK8fyGmgALLIP/mwP4tNolvDS8fA+qwQ7swSGIXEriMir2kBcXZAaZqMjxFVaOPw8DVA8CeZX/fBEbiZuuULmKqTxak2aqoeUHZlBnU7Q0I/rZNGOUr/sVH+SUkRvx1wzuwS/dmpVn1YgQnop1UZaM1/SuZ8/dqwvg1YyglhTdKRJqgS20Gx/R0ybNVeMvNYcXRGl/86Ar9u+iEHwjQVFEdqA2qrN2EdWYDEMFTJkuyy0cWw+Hf5Xpha2tS81G/t9vGZ5fy0EZaCyugT4bVRS+FxoYVh8eYicjAY7BAtVEZex+AZBxqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 15:04:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 15:04:05 +0000
Date: Tue, 12 Sep 2023 15:02:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 02/13] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZQB9fVvxWULKj1Jn@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-3-matthew.brost@intel.com>
 <20230912092953.36a7cdf1@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912092953.36a7cdf1@collabora.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: e781751f-09be-47f9-8093-08dbb3a1821a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TM2OB5A9f6YgPqvVDun+KkDzH1NE0P0VSMHxVfo6eIsPpn8TF+DO4VfEBbCJ2mkvBxG9Ww1g/rwmjMklbZPks3wQrmliDW2n1GIraGxn2hKBxbYrBxD4emCFpBuZIXKv+SioQDdk+EIuPKVNw108VRs9JZQ/sFHFOWYSmLQcTTQI0SZW1S+YCtuLXQITKe5ew85drO8C5yU/frN4qcB/AxblAg1Sdskt4gqpemzsbZzJPFcpgeKQ2+CXHWDjlUORFvMe3my6YijhIYL2tfR6LJGCtIX3Gfwspe5yOIgI+fw2qLBseSmqqCEUDwShJR3OLRzgWLUdscSJi4mDLH/2DhhO5Aeq3jFFBB/oj9bwUcHlMXXZqyxKrlj3NdLJNleRunknK/CxrFt1VzeyQIJZNTxKeFN9K74xifMRyDObIfP8Sq+g9zz+Lus7McoAdf5lezNBQ0XIMRwZ7UIhOm9eRv67DwSRnv8dVfHpnCHBsXzaGuQTFM5/8ATw/LALGQJhqp6noaJ53cUm31vnihaKPHq35RgAbsoULNK9/6iSEN25sD5dU3pl80xWiVlDwz+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(6512007)(86362001)(83380400001)(2906002)(6486002)(7416002)(6506007)(26005)(6666004)(82960400001)(38100700002)(478600001)(5660300002)(8676002)(8936002)(66556008)(66476007)(4326008)(6916009)(66946007)(44832011)(316002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4/fDRSDYGjMGZGTOgEsoh1cElhQfW5khwyDCI97fym7ASjjumDuHGtaM/yua?=
 =?us-ascii?Q?1f5oQluPcq/8XsInU9tmoN1wTsXyblnoJ9WmtumAa58J6eGEQnjOzqdXroYn?=
 =?us-ascii?Q?Blod9OtKub40E0NSFVcR0iGNkFHHYylPaRi1CeQFLWUZrZE4tUQ0l2eWGidw?=
 =?us-ascii?Q?hX2nsnQ5tEftcZ1F/olV1tswJbUhRZ/EG3QYKt738M1drXen9anN6RUYcHbZ?=
 =?us-ascii?Q?M76jjPb6S1TzKl87w9i5G4K/fwmL965o2RK5TZVm4XYXaq0NRAiBCeEYwOLa?=
 =?us-ascii?Q?y/JS9bIM5oYOzHbyoKXheOM9hBJoReoTpzqvqjTTCk0zvQDJ0r9OSQEZFfXv?=
 =?us-ascii?Q?dgDExgDU5etj7pVlHUfnJbMyI3IIQ8lLh95pDGIsLageVhNCe/qjFDSctVp8?=
 =?us-ascii?Q?jsGx8pZ24piPem+Ev0X5rDTZkFmPkxzVAq1oKZn/lm4ZZWU49d1V3xwkYNDc?=
 =?us-ascii?Q?Y3ugDr0Zgq0nUFeLNqNs4Lbm+McehQIH0uyt/7wnGgYLV8fQ1q6qJB1HUt6R?=
 =?us-ascii?Q?PmK8/OAltNIsVnSvtGs1Mm2+6iM0RDAAlqIV/TwI46yHcNZwNEMDoG3wDds1?=
 =?us-ascii?Q?mva18xlUW78b5IpQyOn2VSpIH+sd0fa9r+bdxMCbIFGT4iSMnygnTG6APB3p?=
 =?us-ascii?Q?vUSnDZ2h3JvQP/62+YRzVLbTHXSMj/fRUNWz6QwNsuo7TvQ03pVfJyDM5sUY?=
 =?us-ascii?Q?O7FmmxDW8s0BR3g/0zm2gf53e9zyWYAOTqEAlX0qdJC9nKM6eoBKE+VlDecs?=
 =?us-ascii?Q?SWnaFdQiIVSzdVBOEyUNx5OgSZl6eu1ixoXpevOvC+My9iMBcNuyOxDEcLwQ?=
 =?us-ascii?Q?bbo+eLH+6EksGfKPTDVRIRdc+4gdnMzJnI0hiyov8HfCkS0MaBQtOBXrrXU7?=
 =?us-ascii?Q?ausBn9cuPGg5D00CQlqdze8Yqpspm0ZQruj2WvuRIr606JQm3KFwBAkpZN90?=
 =?us-ascii?Q?XAS23VSsFHrVF/65sNkK6HWiHj9BQ0U/IVF/W6kgZcQWB00T3AAfX3MYIHfb?=
 =?us-ascii?Q?TvedhT/3T+zW9lKthlVQrSdkirK/BBKzlbO/H+IMQrSNYvsTt6F5I0AeV2Na?=
 =?us-ascii?Q?SZQPDeQCA7Y2nw6v8XFqxe5jkcqt0fNncDOOid2TXwM3jxtGFiqgG04vJJ2f?=
 =?us-ascii?Q?u3SB9MlN+FqlvpXOtfT+z0ivqwSH/B40cEf1SPnN/rmJ93PbkJEjul4TnYwD?=
 =?us-ascii?Q?SpORLFuBHwk+rE6JuptyVGL/NfZLBUlcmGqAs+APFcNP0QkftNI/EZRlKjRn?=
 =?us-ascii?Q?SKNnlcox7Mex72HCUTKFbOnPDnLPev/Og83lxKWVoKnX6N9gYwpkrXXBfsRc?=
 =?us-ascii?Q?02K2qw/8kK04rO1Fy3Y37zxsl/DmGdRMuHd5nGEb9k+lyzXONYhGQGlMLzf1?=
 =?us-ascii?Q?2Zl2R2szqMEAuTanPL/weIv5xbiilGQi0bytgUTCkROfQcrkT0gG6g43QFDw?=
 =?us-ascii?Q?cohvWvFWSEyRQx5FOsqwGPmqloPpKQ30uS0xLu2KPe6IZrV67QR6ZWYrqDno?=
 =?us-ascii?Q?jxQBqhsRlh+rKCjoNUPYjHotvXOTArs/gHsVH8vRVR+7nKunChW3fxURN24F?=
 =?us-ascii?Q?qlhYXBMDlqvh+YL43txM1Vtfn6e83Q6vRvU7xZpo/McQfx/tbiAioVt3MRcf?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e781751f-09be-47f9-8093-08dbb3a1821a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 15:04:05.8544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI8mSCXZKGs4hs59eJmzmqkEV3o9Xsq4bXG4EBoMttedq/Y/aVbs5Z5CSO20SfUcufnX1e0CXXZPwe7tiOGO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 09:29:53AM +0200, Boris Brezillon wrote:
> On Mon, 11 Sep 2023 19:16:04 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > @@ -1071,6 +1063,7 @@ static int drm_sched_main(void *param)
> >   *
> >   * @sched: scheduler instance
> >   * @ops: backend operations for this scheduler
> > + * @submit_wq: workqueue to use for submission. If NULL, the system_wq is used
> >   * @hw_submission: number of hw submissions that can be in flight
> >   * @hang_limit: number of times to allow a job to hang before dropping it
> >   * @timeout: timeout value in jiffies for the scheduler
> > @@ -1084,14 +1077,16 @@ static int drm_sched_main(void *param)
> >   */
> >  int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  		   const struct drm_sched_backend_ops *ops,
> > +		   struct workqueue_struct *submit_wq,
> >  		   unsigned hw_submission, unsigned hang_limit,
> >  		   long timeout, struct workqueue_struct *timeout_wq,
> >  		   atomic_t *score, const char *name, struct device *dev)
> >  {
> > -	int i, ret;
> > +	int i;
> >  	sched->ops = ops;
> >  	sched->hw_submission_limit = hw_submission;
> >  	sched->name = name;
> > +	sched->submit_wq = submit_wq ? : system_wq;
> 
> My understanding is that the new design is based on the idea of
> splitting the drm_sched_main function into work items that can be
> scheduled independently so users/drivers can insert their own
> steps/works without requiring changes to drm_sched. This approach is
> relying on the properties of ordered workqueues (1 work executed at a
> time, FIFO behavior) to guarantee that these steps are still executed
> in order, and one at a time.
> 
> Given what you're trying to achieve I think we should create an ordered
> workqueue instead of using the system_wq when submit_wq is NULL,
> otherwise you lose this ordering/serialization guarantee which both
> the dedicated kthread and ordered wq provide. It will probably work for
> most drivers, but might lead to subtle/hard to spot ordering issues.
> 

I debated chosing between a system_wq or creating an ordered-wq by
default myself. Indeed using the system_wq by default subtlety changes
the behavior as run_job & free_job workers can run in parallel. To be
safe, agree the default use be an ordered-wq. If drivers are fine with
run_job() and free_job() running in parallel, they are free to set
submit_wq == system_wq. Will change in next rev.

Matt

> >  	sched->timeout = timeout;
> >  	sched->timeout_wq = timeout_wq ? : system_wq;
> >  	sched->hang_limit = hang_limit;
> > @@ -1100,23 +1095,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> >  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >  
> > -	init_waitqueue_head(&sched->wake_up_worker);
> >  	init_waitqueue_head(&sched->job_scheduled);
> >  	INIT_LIST_HEAD(&sched->pending_list);
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > +	INIT_WORK(&sched->work_submit, drm_sched_main);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> > -
> > -	/* Each scheduler will run on a seperate kernel thread */
> > -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> > -	if (IS_ERR(sched->thread)) {
> > -		ret = PTR_ERR(sched->thread);
> > -		sched->thread = NULL;
> > -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> > -		return ret;
> > -	}
> > +	sched->pause_submit = false;
> >  
> >  	sched->ready = true;
> >  	return 0;
