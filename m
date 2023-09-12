Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487C79D3E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 16:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27DA10E428;
	Tue, 12 Sep 2023 14:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD1510E332;
 Tue, 12 Sep 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694529610; x=1726065610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YtnUPFEP1qB+EsCAX+KM/p4eEzWtaaVII9OGt8QtsW0=;
 b=AZ5a50kJoB6KDRxSsJzNoDhDJdvKurplaBhuJQFy2iI0botIUc/LwRRc
 bY9+8+Hrwqwstj3LbBOU2K62HViEhaW1I1XEV0aV3KLUTqfHGs/fMeQ1S
 fWWuzQR769Ke5oFNaMeVURcD3ty79l5KuuFzMPLg+//Hoes8r8bXj7R1p
 mcxvqstAE4XFPXfHaP9m0Gx7TKI+inFBJTxquQAvEkZivriYZOjmZg+AW
 DICDjxJOyKZeprGmVidNd2jkoG5MeAOjNr33Dnx/97IZfQWLNZEYZSbDx
 zjLl9YnCdfleO77cHowPBgbVOY+6tDMYwl+9vsVHY+H4M8SxD8EIYAw2v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442407159"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442407159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="746913522"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="746913522"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:39:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:39:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:39:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsIzbiku8g+JVLauwGfUg8J1HcrJncfQQ3ogTghmbbc2WY9LJxAPB52neoh1wmjZKJhiQXcfbQXVqr1FTpYAA7/FwxOe26F7o4hKHxsvUXiH5AMKHKSCevgsvm7hIvp3j8WOgPSwTOfAS4//sl2ABVyGTXoxO1y/Of69U5XVRe7WdRSU+7jeK5phKFW6Y7r+wkN2i37tqwU251g4+/3HXFkzE/F5/YguGlp01Y7noxVBDNhSVNSVTXY6BFFvatfSeqpIIEFwJ2oJ9qVV+FScDjZNdl86ebruY4fPEBqK/XRb2ul5R774T8SCx+wAf9wbdvS2XXSdoA4JC1rVe1wQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbktdfaOmDumglhGiRjafoQTRaW8V6g6nl2CKaH0uks=;
 b=WTbGjSl7vegkt5lGhzP/0kHB6Sy3mAH7R7iDjJZiRgDJw4Q4sGuKQFhI70FqQAOF0ejnO9PjdYJiCE/ar+veUKnzs3HohTDw9emc0inpXHOu2GGiUvcd6O3wYyNJMD5YT2G6RrWSjsC/q0Irf4qogmLnGgB7KM9UEWR2m9oiR+8O+3dd+LRgR9I47H/FN9QhOJcdypG16+k0CajG7Vr0mlh+bWNVaIZDUOsHF0+Ot52T5UWBTF6DktgYU6lEA1IxKwFhqjate/okOgyh5/MacXnrOGMzjoUcVZsqfFvWUBt8rnaRJhKlZSq6g8ENA1tAO67VOXzKiKAO973zctVsug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 14:39:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 14:39:42 +0000
Date: Tue, 12 Sep 2023 14:37:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 05/13] drm/sched: Split free_job into own work item
Message-ID: <ZQB3xdWpukcxB4dh@DUT025-TGLU.fm.intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-6-matthew.brost@intel.com>
 <20230912100833.792eacb6@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230912100833.792eacb6@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cde7994-bdc8-4594-aa62-08dbb39e19f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zn4m6Ym8gDUFPcS2Q68cSxss5pWwneG2i7QenEGId27h6OpXexBHM1rlKsQsVt1+GWYQDZacKf58RUdIM65jQiO/xj3acN1SFZS5gb8OlurCKEqwIZUEAj6q+cZ83xw86uEh9r4ELu2tVMy3kXMQIk/kdPRhxr44j20O0jUaerTG/LuJ0FL8FVILm6Y4nCJ+llYe/XXbihKC1RV492BNX745xUDoTjjWCf0RUsb4Ve1DrsPv1xO8cZ7w4ydKt/9YQAhJKujksTgXypIK1BxlYF/jETZI+Ntu6IYrJjdWU1s5M70ZdI68PbmZFYzQPM6iZO7aj3faPvWh/iHYyVm15J1MjvuTnnxh6d7M1PQnEoL7kI4Hs0ZZwX6FRYqHx83kH1jkPcHqb1zHHdjHKdMF9njRFT2szrmpNuSwVu2AWDUyIL+M/oF5EB28plrTk/l81Jj4HnZplvOzuyDguJIIHuKk1GwJdH3z3s4IGwVMjOf+tBDFnc0qF5Aoq4LVdhJyoicQ0C4rBsL+Kmho5S//k9pep/j6OWVSTcyxcrVjDdsCb8auC8a4xXQKc3ehLaG0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(1800799009)(186009)(451199024)(6486002)(6506007)(6666004)(26005)(6512007)(83380400001)(2906002)(30864003)(41300700001)(5660300002)(66946007)(7416002)(6916009)(66556008)(66476007)(44832011)(4326008)(8936002)(8676002)(478600001)(316002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q20+Bs7z8bNQyJimqdYjW9urjLmU7fyJK32zTj4RICzcvHxckMR+Scptef/e?=
 =?us-ascii?Q?ZXjz7Xv4O1ZZyoVyl7SSREHDWDGLnZ0VrpKZTbn9KRXFGcLWosoZuQ83kzUs?=
 =?us-ascii?Q?YSoWMAaMYqmyavn6BojmQFB3V19RwKgeHBSqP3SFsIVDVXSQL4b7uSIhkYSL?=
 =?us-ascii?Q?wFIZd74WPaJ6oL6ePcTl7OWbhZmFWmeoh5cDXy1xTnBA3EbJuRP7oO0CpcUk?=
 =?us-ascii?Q?CW5Aj0B+P6/EHMIio7SrA7hEVuQZ16u/iHOSigp4PiJvKQeoZi+TOjcxODWz?=
 =?us-ascii?Q?hxS8dYf6gBUi3F7zmtvhaW8XOGYyC1pSkLbbYu9q8wusRJ/oUiK0qB88+0GW?=
 =?us-ascii?Q?mHPwr7D1U9uE8mxQ8G0wLEfyZiRqJiUMODUvnkAGXSZR2J5wqvk9oAhhqWFA?=
 =?us-ascii?Q?newpYvEafBBx9PaZg5H1s2Bt029+sHm6+WzO3LkUfyCvg9rMe2++k6I5y4iL?=
 =?us-ascii?Q?nq8FZCkEa17wE8myRS7Fh8swSYHLjB4wUm0u38PB36cmyQ6QB70mlM3tFxQo?=
 =?us-ascii?Q?VIri7mJn9owwWSKRPDZWx/Yi36cKqROXIXV2fm2KWo6Nh8FF0yOWgPiDHd1t?=
 =?us-ascii?Q?RtNpk36KaVOfx4g1v1OCKf+p0TwCRjkw7OiB6MCKLF6lTEhVToebUMTdJYqY?=
 =?us-ascii?Q?GG3RK+6FhJ8AHJswG54PbhnBeoge3Q0C+t3yZKWStlA3Oe8uzTIkpYl1qZdn?=
 =?us-ascii?Q?VlA1p4Vp4A/EjCRzsAmZ/feNGGI6GeIuZGgCBRJrDkOMoyD7wdgFwC9PpZ+I?=
 =?us-ascii?Q?Ucv4Nsa5Wz1QqFMF8M8lGu+qWQCxiBveN7o+wk18MlSuPYR6geMD3jSoP4Qi?=
 =?us-ascii?Q?DMijoBrCe1O3yuP+t4bXqW20Nj4I1tMTqcWkhKu9moObxoHjV1mcz8EYylZ6?=
 =?us-ascii?Q?3EkyrVvMKJhm93rkxJdQrPhrRb0EKNhgCGijcXg6BTwyR3kszveJx7moIwsz?=
 =?us-ascii?Q?uFOfb9+pcAb2/zlZYRWwTRRcs5ctjUfDCRR7aLTrNEkfj63Ke1RUq0y39meL?=
 =?us-ascii?Q?KNIgntloXmD/ClPEXF2QAsG/z4HRNEEbjcXdjUZyMDEBGzl5IJCjJ7uB/C2E?=
 =?us-ascii?Q?ws8aJK10bcre+u6Mm68wK/yGmWuLG0TwHlbEAawIwXgAqS4KF8sBTI/ncRHK?=
 =?us-ascii?Q?YRrZ9kcQUHG6qOGzRANPqlx0RrQ/KkllYHBxbz7VFolL+RWKDfY3HYocztzM?=
 =?us-ascii?Q?uyVqadj9L5kAlekU5G3QpLWFguJ9EkqWLhM5t4vGqgc2lUuu07HRecoE8TSq?=
 =?us-ascii?Q?jDhVyWh339b7CojH/ezupIKsRclckwPNT+9jT+Ft8sg1jvhAnX6eiTDhTXdT?=
 =?us-ascii?Q?6Hud5WvoZyYoNlRQuiNtDdhEBCUzCXvCB828Q5+G2L50hQOos/cO92HyemxC?=
 =?us-ascii?Q?fPj/002yQVHZR5p9gnmvzB2C5ThAoOCSI38v+MP8vD/4B4b8m73tLXuKDqy6?=
 =?us-ascii?Q?86LeDoE9RkVxPzfHymb6iv9ZEHSbq5Zlx+Ozx6RH/ok9NHho3jmaR4flh6/w?=
 =?us-ascii?Q?0RcpgGxdtPhE+mgZyZ2alVIEPNwGQDjxLgMvohidLMlxlk7PaAM5419lmCBy?=
 =?us-ascii?Q?anQFM6jGvy7wkft80//enHyZPzlYzEG15zVbdwCPlLbQOq29GLiCRxfQIdbv?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cde7994-bdc8-4594-aa62-08dbb39e19f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:39:42.6617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUqZWVqlIxQJksszDjIbIM4CF1O5Y6ti37rsyzC/BWW6XDuiDeAtxbNVsvEY6P4HEnrZrAPYUgW4N+aOqpdQ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 10:08:33AM +0200, Boris Brezillon wrote:
> On Mon, 11 Sep 2023 19:16:07 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Rather than call free_job and run_job in same work item have a dedicated
> > work item for each. This aligns with the design and intended use of work
> > queues.
> > 
> > v2:
> >    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
> >      timestamp in free_job() work item (Danilo)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 143 ++++++++++++++++++-------
> >  include/drm/gpu_scheduler.h            |   8 +-
> >  2 files changed, 110 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 3820e9ae12c8..d28b6751256e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> >   *
> >   * @rq: scheduler run queue to check.
> > + * @dequeue: dequeue selected entity
> >   *
> >   * Try to find a ready entity, returns NULL if none found.
> >   */
> >  static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> >  {
> >  	struct drm_sched_entity *entity;
> >  
> > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >  	if (entity) {
> >  		list_for_each_entry_continue(entity, &rq->entities, list) {
> >  			if (drm_sched_entity_is_ready(entity)) {
> > -				rq->current_entity = entity;
> > -				reinit_completion(&entity->entity_idle);
> > +				if (dequeue) {
> > +					rq->current_entity = entity;
> > +					reinit_completion(&entity->entity_idle);
> > +				}
> >  				spin_unlock(&rq->lock);
> >  				return entity;
> >  			}
> > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >  	list_for_each_entry(entity, &rq->entities, list) {
> >  
> >  		if (drm_sched_entity_is_ready(entity)) {
> > -			rq->current_entity = entity;
> > -			reinit_completion(&entity->entity_idle);
> > +			if (dequeue) {
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >  			spin_unlock(&rq->lock);
> >  			return entity;
> >  		}
> > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> >   *
> >   * @rq: scheduler run queue to check.
> > + * @dequeue: dequeue selected entity
> >   *
> >   * Find oldest waiting ready entity, returns NULL if none found.
> >   */
> >  static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> >  {
> >  	struct rb_node *rb;
> >  
> > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  
> >  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> >  		if (drm_sched_entity_is_ready(entity)) {
> > -			rq->current_entity = entity;
> > -			reinit_completion(&entity->entity_idle);
> > +			if (dequeue) {
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >  			break;
> >  		}
> >  	}
> > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  }
> >  
> >  /**
> > - * drm_sched_submit_queue - scheduler queue submission
> > + * drm_sched_run_job_queue - queue job submission
> >   * @sched: scheduler instance
> >   */
> > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (!READ_ONCE(sched->pause_submit))
> > -		queue_work(sched->submit_wq, &sched->work_submit);
> > +		queue_work(sched->submit_wq, &sched->work_run_job);
> > +}
> > +
> > +static struct drm_sched_entity *
> > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> 
> Nit: Can you drop this forward declaration and move the function here?
>

Sure. Will likely move this function in a seperate patch though.
 
> > +
> > +/**
> > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > + * @sched: scheduler instance
> > + */
> > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (drm_sched_select_entity(sched, false))
> > +		drm_sched_run_job_queue(sched);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue - queue free job
> > + *
> > + * @sched: scheduler instance to queue free job
> > + */
> > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (!READ_ONCE(sched->pause_submit))
> > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > + *
> > + * @sched: scheduler instance to queue free job
> > + */
> > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > +{
> > +	struct drm_sched_job *job;
> > +
> > +	spin_lock(&sched->job_list_lock);
> > +	job = list_first_entry_or_null(&sched->pending_list,
> > +				       struct drm_sched_job, list);
> > +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > +		drm_sched_free_job_queue(sched);
> > +	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> >  /**
> > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> >  	dma_fence_get(&s_fence->finished);
> >  	drm_sched_fence_finished(s_fence, result);
> >  	dma_fence_put(&s_fence->finished);
> > -	drm_sched_submit_queue(sched);
> > +	drm_sched_free_job_queue(sched);
> >  }
> >  
> >  /**
> > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (drm_sched_can_queue(sched))
> > -		drm_sched_submit_queue(sched);
> > +		drm_sched_run_job_queue(sched);
> >  }
> >  
> >  /**
> >   * drm_sched_select_entity - Select next entity to process
> >   *
> >   * @sched: scheduler instance
> > + * @dequeue: dequeue selected entity
> >   *
> >   * Returns the entity to process or NULL if none are found.
> >   */
> >  static struct drm_sched_entity *
> > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> >  {
> >  	struct drm_sched_entity *entity;
> >  	int i;
> > @@ -936,8 +986,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >  	/* Kernel run queue has higher priority than normal run queue*/
> >  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > +							dequeue) :
> > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > +						      dequeue);
> >  		if (entity)
> >  			break;
> >  	}
> > @@ -974,8 +1026,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >  						typeof(*next), list);
> >  
> >  		if (next) {
> > -			next->s_fence->scheduled.timestamp =
> > -				job->s_fence->finished.timestamp;
> > +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > +				     &next->s_fence->scheduled.flags))
> > +				next->s_fence->scheduled.timestamp =
> > +					job->s_fence->finished.timestamp;
> 
> Looks like you are changing the behavior here (unconditional ->
> conditional timestamp update)? Probably something that should go in a
> separate patch.
> 

This patch creates a race so this check isn't need before this patch.
With that I think it makes sense to have all in a single patch. If you
feel strongly about this, I can break this change out into a patch prior
to this one.

> >  			/* start TO timer for next job */
> >  			drm_sched_start_timeout(sched);
> >  		}
> > @@ -1025,30 +1079,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >  EXPORT_SYMBOL(drm_sched_pick_best);
> >  
> >  /**
> > - * drm_sched_main - main scheduler thread
> > + * drm_sched_free_job_work - worker to call free_job
> >   *
> > - * @param: scheduler instance
> > + * @w: free job work
> >   */
> > -static void drm_sched_main(struct work_struct *w)
> > +static void drm_sched_free_job_work(struct work_struct *w)
> >  {
> >  	struct drm_gpu_scheduler *sched =
> > -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > -	struct drm_sched_entity *entity;
> > +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> >  	struct drm_sched_job *cleanup_job;
> > -	int r;
> >  
> >  	if (READ_ONCE(sched->pause_submit))
> >  		return;
> >  
> >  	cleanup_job = drm_sched_get_cleanup_job(sched);
> > -	entity = drm_sched_select_entity(sched);
> > +	if (cleanup_job) {
> > +		sched->ops->free_job(cleanup_job);
> > +
> > +		drm_sched_free_job_queue_if_ready(sched);
> > +		drm_sched_run_job_queue_if_ready(sched);
> > +	}
> > +}
> >  
> > -	if (!entity && !cleanup_job)
> > -		return;	/* No more work */
> > +/**
> > + * drm_sched_run_job_work - worker to call run_job
> > + *
> > + * @w: run job work
> > + */
> > +static void drm_sched_run_job_work(struct work_struct *w)
> > +{
> > +	struct drm_gpu_scheduler *sched =
> > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > +	struct drm_sched_entity *entity;
> > +	int r;
> >  
> > -	if (cleanup_job)
> > -		sched->ops->free_job(cleanup_job);
> > +	if (READ_ONCE(sched->pause_submit))
> > +		return;
> >  
> > +	entity = drm_sched_select_entity(sched, true);
> 
> Nit:
> 
> 	if (!entity)
> 		return;
> 
> then you can save an indentation level for the rest of the function.
>

Sure.

Matt
 
> >  	if (entity) {
> >  		struct dma_fence *fence;
> >  		struct drm_sched_fence *s_fence;
> > @@ -1057,9 +1125,7 @@ static void drm_sched_main(struct work_struct *w)
> >  		sched_job = drm_sched_entity_pop_job(entity);
> >  		if (!sched_job) {
> >  			complete_all(&entity->entity_idle);
> > -			if (!cleanup_job)
> > -				return;	/* No more work */
> > -			goto again;
> > +			return;	/* No more work */
> >  		}
> >  
> >  		s_fence = sched_job->s_fence;
> > @@ -1089,10 +1155,8 @@ static void drm_sched_main(struct work_struct *w)
> >  		}
> >  
> >  		wake_up(&sched->job_scheduled);
> > +		drm_sched_run_job_queue_if_ready(sched);
> >  	}
> > -
> > -again:
> > -	drm_sched_submit_queue(sched);
> >  }
> >  
> >  /**
> > @@ -1151,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> >  	sched->pause_submit = false;
> > @@ -1276,7 +1341,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> >  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, true);
> > -	cancel_work_sync(&sched->work_submit);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_work_sync(&sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_stop);
> >  
> > @@ -1288,6 +1354,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> >  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, false);
> > -	queue_work(sched->submit_wq, &sched->work_submit);
> > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > +	queue_work(sched->submit_wq, &sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_start);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 04eec2d7635f..fbc083a92757 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> >   *                 finished.
> >   * @hw_rq_count: the number of jobs currently in the hardware queue.
> >   * @job_id_count: used to assign unique id to the each job.
> > - * @submit_wq: workqueue used to queue @work_submit
> > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> >   * @timeout_wq: workqueue used to queue @work_tdr
> > - * @work_submit: schedules jobs and cleans up entities
> > + * @work_run_job: schedules jobs
> > + * @work_free_job: cleans up jobs
> >   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >   *            timeout interval is over.
> >   * @pending_list: the list of jobs which are currently in the job queue.
> > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> >  	atomic64_t			job_id_count;
> >  	struct workqueue_struct		*submit_wq;
> >  	struct workqueue_struct		*timeout_wq;
> > -	struct work_struct		work_submit;
> > +	struct work_struct		work_run_job;
> > +	struct work_struct		work_free_job;
> >  	struct delayed_work		work_tdr;
> >  	struct list_head		pending_list;
> >  	spinlock_t			job_list_lock;
> 
