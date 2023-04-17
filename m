Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70606E3CE2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 02:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4BA10E04B;
	Mon, 17 Apr 2023 00:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EA210E047;
 Mon, 17 Apr 2023 00:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681689818; x=1713225818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uNJReXW2GeA/7jPWcooPNdPjNG6B6+v7J+mFE6Av3d8=;
 b=KGMWyGnIPlvdFu0JXqZdpmXnUhMNB/UG36vXXmuLKKLmWi/fsMUiVp8V
 IxZxrP8UH4ZvDmnQ6yisePcnKFXGrJ0BCqJElUh67SR9qhm9k3VE1BOoC
 XFLsalA4lB412b/DO/SG4Zan5rfcoSXKPDPalkiusS/HLYD/ygtoDVz9h
 lYH/U29oD3SkmCyuIMVSnIbucFL+xgdPTGQAyqvTk6bxcIMd9373zaIOu
 slbQcATzpF9lQE92uUfYM28+7SJS6yOh5MmKmSi0TzdwTjxQSiXwelQMv
 XNqVYy67wrb6NZH/NDMcxUBQSV9B+VexFIk8nvNDxuuRiO81xiubVyms4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="333565088"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="333565088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 17:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="801887590"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="801887590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2023 17:03:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 17:03:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 17:03:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 16 Apr 2023 17:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4NQD1pPmDH+dMWhjbmTqMgIatqEwFlr2kt/vzkjk3+IUiCrMVVBGLsPY6BxcerIisFAf6rmbXnDHjqC/kN9ij/pE57qWZK86kSJ/XJNN26Jm0dYX4wncb+iKR9sVIdFHbEKDB/e/+YRHZb8dVed/cGib2aVy5w/3iLkITM128kz7QkWpil7CT+dqIqg0+IqhahIbecRt/UjSn0N9LgpAQChiH3FhQtx4TVRSq3FffYa+MQZCGgg6gbF2S3mQk5wmNaBzvLoz3FNGfKZGlYbiq8O4/DqpFDYPSo6jdyQhWWJ2YLEoJWiAGRnp9GzVpXF4XHd15DX81+lR7sb6yA6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Grhs02/+ULpZOn9CJMfg9E32tMVM75qlT6Hdm/1+IdA=;
 b=m70gZE/XCOWoqbLR8Cof1HlZSc1dJbKFagT2moERE9R7VdDUOkrheNz8sn7mAomLfSJXw4wb2BJbZQdKZar4/WZD3rfZ4ZNDd4cnmyfB2M5uv7dhOI2IQbkYX/IMUrSDUN31mv+PVsfDowdUDZdx5ABB3q9FCfbYcaHVYEN4bYPa0hZajvJxWHLtWen0cpUxpbEIChSCaUjHIQlJikgcwBklWF6zubLj9qkXusz9tdY+ENTf756rvmu060uACQhVM6H5LMyfbF5ow6ELV+Q2A8bL9wxRLkRCF4RNkjo+mHuBQvIemGJ6s0by2ED2V2E62l3qN51ugDO33wErlBhlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 00:03:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:03:32 +0000
Date: Mon, 17 Apr 2023 00:03:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZDyMyUqzcSyIBdjz@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
 <ZCuEP2NnOich9kuI@DUT025-TGLU.fm.intel.com>
 <b15831b9-7bca-7e78-7abc-bc06e99b7699@asahilina.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b15831b9-7bca-7e78-7abc-bc06e99b7699@asahilina.net>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 678026da-4220-4f25-8a87-08db3ed72e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIENJs/F+T8xkdH4KNFT1Vl2GI/ZlxIAhf+ZAKR67iSxrGtNEg3Md8xm7CKnjc3osMjC4Y8nu2Z8ZWbdvs2i1PhvPSm3CmbZjfOHSBmdLsYoyBT7V3Kt3YXwkEugSgeeDFq/SYmaaWFjpTAvgab759xFGOU8VZYXFKjpRrht+KVDgA/aylGWVpBXEYci6V/dMl5oQPYeEFAWSS9GDrKlv7WTKW5mGSFKqiPpHFOyj5q4jvuIkpsMFkFa55kyf7bMxbOt97pRNHILs4VtQsuIwU+3uT2ScbRDq39fd0AQF2icjoDDi03cGHco/qWx6ltSOzYQ8Bm4n9mfW+xkYdfyiF6tbE9PAC7dX216v89ishHGY79p5um5j4jihnbuWzWEvqbuF1N5AuafLrpS2UzSapq08TLD8BSnJpQnoaPHUAMsSkB5pn+C+CcyHvX3FpE1EmRkJ6iDVmqm7R3wBy5NdumV9oSSBf9l1in1d0XmdKDW5tzOaAEgpGA69EKWmH8rs9TiQRcUL4k+iUvjzBF9fWPFNU7C/5TytpECzjGEkNExx2ccMFOPZiy/HKuVFrHW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(6666004)(5660300002)(6486002)(6916009)(66476007)(66556008)(2906002)(66946007)(4326008)(44832011)(86362001)(38100700002)(41300700001)(478600001)(8936002)(82960400001)(8676002)(316002)(6506007)(6512007)(26005)(66899021)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiL7pUs7APVWiw7XZ7nGSdwVc060wFyDiDEoZTMd1rxE9d483DuSdN7FkyCH?=
 =?us-ascii?Q?vJ75i5j9aZivBW3EuZEg/YFy3BenIXO/gaNJ05szofoQR3NwLvxHNdYxtABk?=
 =?us-ascii?Q?cvhz6sYulQKEhfcelWuPx1OKHkz5NRNd90w+nSo4w8Vsb1um4hR33U7CsV4s?=
 =?us-ascii?Q?rBRqokqAUUCLpq3hQLGUODNPka3Ko6HGZjhFUj5slBCP2pjm1E1DQhmNlisE?=
 =?us-ascii?Q?ehv27lWMNTbo0tRnAmwkWsVi7GCfb3TjEu3tl9o+jlvxpO+ciSba+4y56Uy0?=
 =?us-ascii?Q?+pZZFQ8XNNV64tH8bYUs8eVvsLxd81MxwA6vH6Otzh73PVu0Jj0nh26qGwKB?=
 =?us-ascii?Q?teyRX2bas3asHntFkfIFKgY+yLnn4/w2ah+9Q58uksugOcnTy2qPibkmWNM8?=
 =?us-ascii?Q?npAJJCoLg7d35CpA0IsRIQeT0APTsRVRXmr87a0L2wEL0L7xDsZZwx2VlY3D?=
 =?us-ascii?Q?ndKsUb8rGjc2IkoMulk4lXjJFkVcz4FdZBMI/wtvoyQs/xXi0GU0iuk8F61a?=
 =?us-ascii?Q?2wUC7ul2HoA5djwWuEYTjc7SNAALD9++ZzedkMrvb6UFflH5mp660faCKd/B?=
 =?us-ascii?Q?EdR8AeFKaCKiasLMnv9EygJA5H/GTXjTCAE21E+NEI6LVHqU2cr4C4nb3PeU?=
 =?us-ascii?Q?A/9/wTlXvNftmypVd84FreLb9WpILca9PIgXCflqtvUe1xj76/RvuYbZxm3F?=
 =?us-ascii?Q?rMP+xonzz2dzrAOuneYVHmX8JB4jdhpn8REn4ExJI6G5qX03I/qyCxk6RcbB?=
 =?us-ascii?Q?kLSkfOyl2fMUsfOJAi2tDbCiphh0B2zivRHfEZj0+UkynNXu1VxMqwYlyM5p?=
 =?us-ascii?Q?wl6jBmsIWdSHJoObz5EdsuVsaa+sL+c6cHtnS3j0eLz3CvYOCe2Zz8sb8Y57?=
 =?us-ascii?Q?TVeDIYUGfw1jvXh4Z/Hm8/obCjpV8DRBkKADdRDW6KT4cV+XLr/yZzAb3tK5?=
 =?us-ascii?Q?g5IYU2x4DgWlSlVkIy7+S5ExBD707POqjb/E4xvkfXRMZna+TOWzmxHXvkke?=
 =?us-ascii?Q?h5UknCuVwXzdzBpm7mvO26e7r7sDZRylp3L5k0+pptj3AFvk6zW/6wNEpNz6?=
 =?us-ascii?Q?stP8271TqngZfY3jWbBgD6l6IxyzIMOC4M8PV9JTcVuF2LkaKYOCooFuJfNQ?=
 =?us-ascii?Q?+rS3pudnm5lMKEX7Nh1TJyaNBvPoe8mn3CoNe8eMdmSdhPc6Z3ILcHjX63C4?=
 =?us-ascii?Q?lO/T0WeCGxG2h5Af0oRuT3NY5rYQsfO2YrOvXNFy7MdHzIh01DWR3KvMkB76?=
 =?us-ascii?Q?ERWCRf8oy6trBqyR5wdCIt+rAwXyWNn1MAuVjYDBmielOdmNnaMdC7a4Sa1E?=
 =?us-ascii?Q?dZwxACOZAbidVBscxjBkgTsdkJY7sCqIU2sQxxx/xb53wE/tmb5K3zO4or9E?=
 =?us-ascii?Q?Yn0b44i2Hy9Qus54Wddz+DJ9neO4clQkFMhyXNzh3ihru6F/N9mK5uYy4dnS?=
 =?us-ascii?Q?AMdJ9d1WDvDwAw2TGI+LQOyW1pdicw7+DobTqqSVuQBAqqO0kpRRLZlpf7N+?=
 =?us-ascii?Q?utMdVMscY7TPFkxDTauQV9ajzDjjDAqXI3UAPkWA1R3tAVyGO3SvgyqOwxJV?=
 =?us-ascii?Q?qjkE08DlNA3N8Gc3lzDV0RWh6QPmI0ChYYdbVrm0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678026da-4220-4f25-8a87-08db3ed72e2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:03:32.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4POdb00GyOSLIWmLcoHRQkC9aJ9Q3mTJacAz3VGzwrcKGjirKg16DEiFTJUbwVOvEljwFN3F/7LKxCJmFBh7Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 08, 2023 at 04:05:20PM +0900, Asahi Lina wrote:
> On 04/04/2023 10.58, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 10:07:48AM +0900, Asahi Lina wrote:
> > > Hi, thanks for the Cc!
> > > 
> > 
> > No problem.
> > 
> > > On 04/04/2023 09.22, Matthew Brost wrote:
> > > > Hello,
> > > > 
> > > > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > > > have been asked to merge our common DRM scheduler patches first as well
> > > > as develop a common solution for long running workloads with the DRM
> > > > scheduler. This RFC series is our first attempt at doing this. We
> > > > welcome any and all feedback.
> > > > 
> > > > This can we thought of as 4 parts detailed below.
> > > > 
> > > > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > > > entity (patches 1-3)
> > > > 
> > > > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > > > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > > > severals problems as the DRM was originally designed to schedule jobs on
> > > > hardware queues. The main problem being that DRM scheduler expects the
> > > > submission order of jobs to be the completion order of jobs even across
> > > > multiple entities. This assumption falls apart with a firmware scheduler
> > > > as a firmware scheduler has no concept of jobs and jobs can complete out
> > > > of order. A novel solution for was originally thought of by Faith during
> > > > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > > > and entity. I believe the AGX driver [3] is using this approach and
> > > > Boris may use approach as well for the Mali driver [4].
> > > > 
> > > > To support a 1 to 1 relationship we move the main execution function
> > > > from a kthread to a work queue and add a new scheduling mode which
> > > > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > > > The new scheduling mode should unify all drivers usage with a 1 to 1
> > > > relationship and can be thought of as using scheduler as a dependency /
> > > > infligt job tracker rather than a true scheduler.
> > > 
> > > Yup, we're in the exact same situation with drm/asahi, so this is very
> > > welcome! We've been using the existing scheduler as-is, but this should help
> > > remove some unneeded complexity in this use case.
> > > 
> > 
> > That's the idea.
> > 
> > > Do you want me to pull in this series into our tree and make sure this all
> > > works out for us?
> > > 
> > 
> > We tested this in Xe and it definitely works for us but the more testing
> > the better.
> > 
> 
> I haven't gotten around to testing this series yet, but after more debugging
> of drm_sched issues I want to hear more about how Xe uses the scheduler.
> 
> From what I can tell, and from what Christian says, drm_sched has the hidden
> requirement that all job objects outlive the scheduler. I've run into
> several UAF bugs due to this. Not only that, it also currently has the
> requirement that all drm_sched fences outlive the scheduler object.
> 
> These requirements are subtle and only manifest as kernel oopses in rare
> corner cases, so it wasn't at all obvious to me that this was somehow a
> fundamental design assumption when I started using it.
> 
> As far as I can tell, this design is going to work in 99% of cases for
> global-schedulers-per-GPU models, where those corner cases would have to be
> hit on top of a GPU removal scenario (and GPU remove is... well, not the
> most tested/exercised use case). When the scheduler basically lives forever,
> none of this really matters.
> 
> But with a one-scheduler-per-queue model, how do you deal with this when the
> queue goes away? So far, without any of the partial bugfixes I have sent so
> far (which Christian objected to):
> 
> - If you try to tear down a scheduler with any jobs currently scheduled at
> the hardware, drm_sched will oops when those jobs complete and the hw fences
> signal.
> - If you try to tear down an entity (which should cancel all its pending
> jobs) and then the scheduler it was attached to without actually waiting for
> all the free_job() callbacks to be called on every job that ever existed for
> that entity, you can oops (entity cleanup is asynchronous in some cases like
> killed processes, so it will return before all jobs are freed and then that
> asynchronous process will crash and burn if the scheduler goes away out from
> under its feet). Waiting for job completion fences is not enough for this,
> you have to wait until free_job() has actually been called for all jobs.
> - Even if you actually wait for all jobs to be truly gone and then tear down
> the scheduler, if any scheduler job fences remain alive, that will then oops
> if you try to call the debug functions on them (like cat
> /sys/kernel/debug/dma_buf/bufinfo).
> 
> I tried to fix these things, but Christian objected implying it was the
> driver's job to keep a reference from jobs and hw fences to the scheduler.
> But I find that completely broken, because besides the extra memory/resource
> usage keeping the scheduler alive when you're trying to free resources as
> fast as possible when a process goes away, you can't even use normal
> reference counting for that: if you try to drop the last drm_sched reference
> from within a free_job() callback, the whole thing deadlocks since that will
> be running in the scheduler's thread/workqueue context, which can't free
> itself. So now you both reference count the scheduler from jobs and fences,
> and on top of that you need to outsource drm_sched freeing to a workqueue in
> the driver to make sure you don't deadlock.
> 

This what Xe does, jobs reference the scheduler / entity (xe_engine),
when the reference count of an xe_engine goes to zero we trigger the
teardown process (ping / pong with firmware) via a CLEANUP message, when
teardown is done the last step of killing the scheduler is indeed done
by an async worker as you suggest.

To kill a queue, we just kick the TDR which in turn kills any
outstanding job resulting the xe_engine ref count (at least from the
jobs) going to zero.

If a user holds ref to dma-fence of a job, then yes the scheduler isn't
going to be freed (it can be killed before as described above).

This all seems to work just fine for Xe.

> For job fences this is particularly broken, because those fences can live
> forever signaled and attached to shared buffers and there is no guarantee
> that they will be freed in any kind of reasonable time frame. If they have
> to keep the scheduler that created them alive, that creates a lot of dead
> object junk we have to drag around just because a signaled fence exists
> somewhere.
> 
> For a Rust abstraction we have to do all that tracking and refcounting in
> the abstraction itself to make it safe, which is starting to sound like
> reimplementing half of the job tracking drm_sched itself does just to fix
> the lifetime issues, which really tells me the existing design is not sound
> nor easy to use correctly in general.
> 
> How does Xe deal with this (does it deal with it at all)? What happens when
> you kill -9 a process using the GPU? Does freeing all of this wait for all
> jobs to complete *and be freed* with free_job()? What about exported
> dma_bufs with fences attached from that scheduler? Do you keep the scheduler
> alive for those?

kill -9 would trigger killing of the queue described above. Yes if
fences are exported the scheduler might hold onto some firmware
resources for a bit.

> 
> Personally, after running into all this, and after seeing Christian's
> reaction to me trying to improve the state of things, I'm starting to doubt
> that drm_sched is the right solution at all for firmware-scheduling drivers.
> 
> If you want a workload to try to see if you run into any of these things,
> running and killing lots of things in parallel is a good thing to try (mess
> with the numbers and let it run for a while to see if you can hit any corner
> cases):
> 
> while true; do for i in $(seq 1 10); do timeout -k 0.01 0.05 glxgears &
> done; sleep 0.1; done
>

Tested this and this works in Xe.

Feel free to ping me on IRC if you want to chat more about this.

Matt

> ~~ Lina
> 
