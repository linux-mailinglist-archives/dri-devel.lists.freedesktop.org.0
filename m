Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F476896B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 02:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3F510E085;
	Mon, 31 Jul 2023 00:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D505610E085;
 Mon, 31 Jul 2023 00:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690765046; x=1722301046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l1z4FzVgQTym9ATs6ptMKNE7dTHnSfhMse/nuQjbjYg=;
 b=Pd0KKolMuq3EIwvymQte6FkTLo2yowR14+YTxbXjshYwHf8kXzPgXfzf
 vrMsWhJQZlC0Tu047ZS+B+XhsEdpI/JEbsfQ8b66dM2+Ku4NA5x5EkdD7
 R+fOLAqPt8KQE4+BT4YgmT/tcH7CCPpbsRjyEqUAcDW8kEEaWVGjFoQSm
 5kodS49CdNQiax8tj9h82saoTbosRlJEfDq4NkH5sLHFz9YS2/D96hjyV
 pL8RHhJja+jiXdOUnsKBdtOEb9WlOqf9VjTmDPXtf43PPD5kUW03Mo2jJ
 o+HVepcE48G9cMxbupwKTh5xDIvF6LHe/dkEQlpMbcJ0VLY3n60S3n78v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="368901793"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="368901793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 17:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="842028717"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="842028717"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 17:57:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 17:57:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 17:57:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 17:57:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 17:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqQ8zSapr02sI6Q2qSWR/eddywP4W08QIgcpLcRyU746C50102GAqE5rglkS74Tec03JZE/2gdb0qtGcrnB4rSN0GviZklakjNMY4hDS0sToYIoJuwMmMwprJWEGAtNDj10WshPivEUZ/bsfqR0qTXk2WMY3csx7VYTEXAAEjEC+NuaNg3oZ1pJSnDmCHZd1Z789EoBtqYg11hlskai/MrCM4Rn22vzQi68c6+NOO9fIwHZC4OzgJSd9F+yT56SudqdIGJjnj0btp7zUcA18PmsGF5+LCyG+GMWG7XKzw/rR9VTP2mMky1sdy88/+1oFfIo+/sQL2ouUAa7+mHrHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msBuuRlQeoIuMECQxZxFV/0OLmJFgUNJRDth3j2Gorg=;
 b=dKXYCMDLoWQDa5O6sV8WHgZRS+YGQbAB7j4Kpg00o8Zg2xqoGluPuMi1h3OCHP02qVY6F/vMbmoVSkQ61l7e0nxoeuzHzNiVG79Z0VgXI5ffEx4P8N+fJxjF0nMGmsY5le8xaPPA/kISTiDKbLtYnWheU/Vy/ZdyOPWfGLrFrpuYjhz9kRs+uwmX47aHKjbsmxW8TRte6hXRoghsEmth2VyEEmQvmojtPTji7tbDnxDUVw3y4C7beUVQAlYmHvipyxn64t/+s29Fu/tYvs1aSy7e2dLmP6nYLE6hWlG9CCHc5pAopyYKwZe7kCOvFvg9940RximHHdiM/Sx+bcll7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Mon, 31 Jul
 2023 00:57:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 00:57:19 +0000
Date: Mon, 31 Jul 2023 00:56:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 01/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZMcGvwVZK7HYPKZF@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-2-matthew.brost@intel.com>
 <20230609085839.3fc9e237@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230609085839.3fc9e237@collabora.com>
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df600a0-3f68-41a2-91a9-08db91611741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpDkhmNnGf1uwS39bn3pefUZ2b+89SbmPiOKeUSM9a1os6iv3DEY8Qlup2w464Amo0bmLL0q6cGgwlPa9QzpKp7uSGm15ng6/0SdBYVuYTvfswNJdZrR9EXhy2Mrw9mQ/QCgqqyPgJS2liz11H/nkQZZEiJZNMuxa1eVlsA/D5wkmru1DYXj5atAGlw5bEVYUPFfgHGMEzmQgQ+2odQ+HG7Exa26n7EIQLIDB4O/aGswPAuqY/R4FHQQ48IFHKC9v2TW2LG/2b/iRPt15L7FrQhsQhZIiZEUhqfbrFbFT8dCtHp7jqitjj8zeWnNFBEJVFQLTnKSNOh5x71iOMeQyIZCVLEGa+p6tXcZdGliOs0D7RAzhcPm1yHuuDRQUnrgIPHPwFyWF05cVqh8mCIFKTVU3C99XA6vaXjrqILTGvnX/uhlqQ3ekXuEPg1JFixW7WS+F7tbB/WjvUFLZ1belseR562wGJhJqoLOA/2jh6kBTyFEFaoZUec3gkgIkHqPUb09HKvaeI59Fl18iYFfpQX0gk0PoooQSZyEeC9c5nf0nAc29DgQ0ImINKrEm8BY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(396003)(376002)(136003)(346002)(366004)(451199021)(86362001)(186003)(82960400001)(6506007)(66946007)(2906002)(478600001)(38100700002)(5660300002)(54906003)(8936002)(26005)(44832011)(66476007)(41300700001)(6512007)(6486002)(8676002)(7416002)(83380400001)(6916009)(6666004)(4326008)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqcVqIqwVff/kbD8uH0KyAIX4ZCHPkOXMU44J/GRaAnaAOrx2IsjWBBWptcV?=
 =?us-ascii?Q?Mur8xz9d3Bvk9UfEcvDuHwxR7/DHEb86u9XUu2EJzXKYDMTi/U7w+paaxTc5?=
 =?us-ascii?Q?U2xU931d0KOXrFz8MUaaTCdiDEol3Vt6mxPkChCrSBVvkIzUQclTj8PJtQwe?=
 =?us-ascii?Q?XAIzfk2PHKZvpbEQqHwzPhYO6OR+JvL1vd5t5yCNjr3l0CuYlGkUN9xdFpvf?=
 =?us-ascii?Q?p2Sar243jbX011Eth0OVnEgSEMJNiL/zQuNV7ip9EXfTE0XZqP0UPxY8kNfE?=
 =?us-ascii?Q?+1y4kjlAcYNpYat4++nE3RaDqkXxqj3r8VH+09dqRtfeCROfJYj+c5Ou5rQw?=
 =?us-ascii?Q?YCypDgS9kDDfT80wZInXiH6/3y9ji3zJhEGotnwBSR4+AO3q7xRxv/sUf5aQ?=
 =?us-ascii?Q?sy0IF480bh2DezJCdFusIv7wN05i2VIv8eOXBYFL1am+cXWGUce+KwFrHbKz?=
 =?us-ascii?Q?Q/Ub9giT/ajIMTrYbjJgtM1EpyvaWXU0MRGL1SP/WvuBpH3HdFdkL3X8ydbN?=
 =?us-ascii?Q?gyfY1OKIfGHzJaRAMFKh7qkimw06jfnJddGgh1XIsSUjFE2H5uG8clrvXYLM?=
 =?us-ascii?Q?IGmN++GtS4QnquBOfPQoXaLTUInQAi9cQgHEOveiQUUeoipKvj6b2jYkF6hb?=
 =?us-ascii?Q?CRRXFEH5J3e168aMvxYMtLzNDGlF/XWArkdokzH0gPrfXklEo5JAT055p7W1?=
 =?us-ascii?Q?CC6ocmew8Y5Lc/UIIoCb1M7TaOS5fr+cHiar0wYZzzVHfKHobUWN7kQ1town?=
 =?us-ascii?Q?/SlHxjOcuzuy2QUdZgwvMJqSF+DHK6X7+qzs5dWmP2QRLvDIRbjYWqPzB+cM?=
 =?us-ascii?Q?J89GBMvPRPL+Sh3MEUwJLx1zvlt7lYhrxuq5+sMAs4sv+8Cq7ZOCa/wTYAgh?=
 =?us-ascii?Q?eJxYxWOkhewilo9JG+gt5QrCqAQKrsMW195SLGl/ShMPHb2AloPmrI9jVWr4?=
 =?us-ascii?Q?4islEUcI98bUzCFLb8eUV/3qMn/NpHjfPh6Nz9Qajp5lX5lHvmDpCVrsHNrf?=
 =?us-ascii?Q?bVt6wmqo6wKgWl7ZGONndbDQHZ2HgVFUbU/ap10HWwGcE+1BknIkDjqgBITe?=
 =?us-ascii?Q?b2hlcqzalkCaljpVz+jPNN6f1Z6RW50T7ilXKqKNhOCRh7ttKN8aZj3eKGI3?=
 =?us-ascii?Q?n7gcqpA/dgvj3zVHkgm9stADMq7xMs1L2NiannI9EX03NATDHUbOzr3eeTP3?=
 =?us-ascii?Q?m8R+IcZe3TtWBFpoQpy64Ae7A47060kUXvg59Z+mBZwsF9wNedx3smb133Jg?=
 =?us-ascii?Q?hEotlllsYl5EnyXPDVkNOMbH+8NriMkx7I4MdsrKVLTA6gxn3YLMzh+sST+p?=
 =?us-ascii?Q?BKTRwMDPiF9uITOJeZfAuyTSG/Kci5P++4KzfTK2/jJ1QzpenqzaCy/BW+Lj?=
 =?us-ascii?Q?0uyNEEsQrv7eI5fuoIDndTqzYiwqJUzucqz80vE6D3c9d3dAbfWNVJ52GzsF?=
 =?us-ascii?Q?hEJloq6humWfm5L1JjoTp8PvQTMfJCmGcoJPRvFaXnUjv9/xOj77pR9/tCHD?=
 =?us-ascii?Q?3YPL+3MDCxUWhXZ2K3eWJLKutJZjZrxclG9uf0ep9I9Lx/QVlBln8tipaS5m?=
 =?us-ascii?Q?Gs0P/kzRK/mRj+KCgui/BPuI83pBvf9ARp6fxP+YAOHPjOYj4RjvfMBDyxQw?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df600a0-3f68-41a2-91a9-08db91611741
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 00:57:19.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uUqV/5iSAz29HIpWcwDNFt+2rCpAZkHNhGozT4hGOc6BQ1FmeWNRSKeiMxybocbRVhzEeKCp9P80bxW7LI2Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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
 Sarah Walker <sarah.walker@imgtec.com>, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, Donald
 Robson <donald.robson@imgtec.com>, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 08:58:39AM +0200, Boris Brezillon wrote:
> Hi Matthew,
> 
> On Mon,  3 Apr 2023 17:22:02 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > -static int drm_sched_main(void *param)
> > +static void drm_sched_main(struct work_struct *w)
> >  {
> > -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> > +	struct drm_gpu_scheduler *sched =
> > +		container_of(w, struct drm_gpu_scheduler, work_run);
> >  	int r;
> >  
> > -	sched_set_fifo_low(current);
> > -
> > -	while (!kthread_should_stop()) {
> > -		struct drm_sched_entity *entity = NULL;
> > +	while (!READ_ONCE(sched->pause_run_wq)) {
> 
> During an informal discussion on IRC I mentioned that this loop might
> become problematic if all the 1:1 entities share the same wq
> (especially if it's an ordered wq), and one of them is getting passed a
> lot of requests. Just wanted to tell you that we've hit that case in
> PowerVR:
> 
> Geometry and fragment queues get passed X requests respectively, each
> pair of request corresponding to a rendering operation. Because we're
> using an ordered wq (which I know we shouldn't do, and I intend to
> fix that, but I think it shows the problem exists by making it more
> visible), all geometry requests get submitted first, then come the
> fragment requests. It turns out the submission time is non-negligible
> compared to the geometry job execution time, and geometry jobs end up
> generating data for the fragment jobs that are not consumed fast enough
> by the fragment job to allow the following geom jobs to re-use the same
> portion of memory, leading to on-demand allocation of extra memory
> chunks which wouldn't happen if submissions were interleaved.
> 
> I know you were not fundamentally opposed to killing this loop and doing
> one iteration at a time (you even provided a patch doing that), just
> wanted to share my findings to prove this is not just a theoretical
> issue, and the lack of fairness in the submission path can cause trouble
> in practice.
> 
> Best Regards,
> 
> Boris
> 

Thanks for the info Boris, about to revive this series in a non-RFC form.

This loop seems controversial, let me drop it. Going to cook up a patch
for the Xe branch and get this merged for CI / UMD benchmarks to absorb
and if there any noticeable differences.

Also be on the lookout for a new rev of this series hopefully this week.

Matt

> > +		struct drm_sched_entity *entity;
> >  		struct drm_sched_fence *s_fence;
> >  		struct drm_sched_job *sched_job;
> >  		struct dma_fence *fence;
> > -		struct drm_sched_job *cleanup_job = NULL;
> > +		struct drm_sched_job *cleanup_job;
> >  
> > -		wait_event_interruptible(sched->wake_up_worker,
> > -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> > -					 (!drm_sched_blocked(sched) &&
> > -					  (entity = drm_sched_select_entity(sched))) ||
> > -					 kthread_should_stop());
> > +		cleanup_job = drm_sched_get_cleanup_job(sched);
> > +		entity = drm_sched_select_entity(sched);
> >  
> >  		if (cleanup_job)
> >  			sched->ops->free_job(cleanup_job);
> >  
> > -		if (!entity)
> > +		if (!entity) {
> > +			if (!cleanup_job)
> > +				break;
> >  			continue;
> > +		}
> >  
> >  		sched_job = drm_sched_entity_pop_job(entity);
> >  
> >  		if (!sched_job) {
> >  			complete_all(&entity->entity_idle);
> > +			if (!cleanup_job)
> > +				break;
> >  			continue;
> >  		}
> >  
> > @@ -1055,14 +1083,14 @@ static int drm_sched_main(void *param)
> >  					  r);
> >  		} else {
> >  			if (IS_ERR(fence))
> > -				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
> > +				dma_fence_set_error(&s_fence->finished,
> > +						    PTR_ERR(fence));
> >  
> >  			drm_sched_job_done(sched_job);
> >  		}
> >  
> >  		wake_up(&sched->job_scheduled);
> >  	}
> > -	return 0;
> >  }
