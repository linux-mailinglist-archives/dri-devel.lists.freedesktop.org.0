Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D0787E25
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 04:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3C510E5F1;
	Fri, 25 Aug 2023 02:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC7510E5F1;
 Fri, 25 Aug 2023 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692932374; x=1724468374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fr5qWOyDm4FP6vio8W5VCGPPb2J082HQ6CuI8jCLOqE=;
 b=HJdF3VqYce2pLeyvN9voud9XpBdGp75uE2OwQw+X1WYIi10iG4v3XHMj
 Gh+O2bSxBS2fYRe84FdomGqLNMBw88vYqC3kjDF0xMHWKbVHVt6ZRqRKm
 LnCK0aYltFJUyIvwVbXPeloYdvMW481jjsl2djCYoRig/eKEZuakjJyUS
 /JCeV7ZEpnVx/jzb4SbF0EgMRKWx283SAg5ht50gg1DITRamipR2hk54v
 mYS3UAN0zkP01tkuh6eRfutdfrcNbgtfCebvN+c8468UVs8Mf6y1sXrki
 dE7FwxDMA8lsirXN16p5N5DV8/5jBWznryka1W2R46kd95J8i5HsbiOaK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438557164"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="438557164"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 19:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687133515"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687133515"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 19:59:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 19:59:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 19:59:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 19:59:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlUZlcrb0E6Bgfx9ARB6ao21G/VMkkH+RZTYwG2R5Wgvm2xhkOgtRc3D02dfxI4LFPf5kgI642fnn94aFX8vLR6Ko7IA4RDcMPJo6f8xdUhLTQDgzuPZ3Ny2AZzM0t/OHnzZWrmoMkhV5HapSncrHdjGz9O/Sxhkyw7tn6yveEZ4eUbpwIn1Zrs2TyuS5awu1fd49A95dRrtpf2MfUETtZohW/QN9qkSduFzhuz2JYsn7/DHm1dqQHJqq1n2roRslIh0fI4sOGef3aW/AIInxD8ZXX6urVk3C67FIFqPmBHHZUAgx4e/MGEBoxch2wLsm7/8xJWm9JtJmCaBmOkz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8vS1wSQ/WLFVbeF0cexKSNEXv09H7Hlo7TXxbBCCTg=;
 b=SNw/9Zo7G75x7aQJnwIkl9k9Y1kLPINgzdES6iIP2MWfMyCS7u7lAA6j3FwpPijuj57SQFDKQQiOk36ji6mo4GGFMgnDhnQi59yVCOGPLvzpcDQijBo0uRsAh+gi8Ovh7oa/DE7wvCLDAIK66oKF6QwqQ5Fch1dnfYSH8yS+Nwvv0Gp1AG/yD70Ph808gF+2EmlieS8JlQfNNSNyJVycXDwgYQJF1X3Z/l/lZ5N4Nlx0e8P62TX7nU2md1lzIl228dynYLCWX9OR5+61cO+jEw3OGjEjrqua7G30BjsX7hF+hGPSJivxns4yOcllRUPKEEsySSlelsHsgNaQ48XqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 02:59:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 02:59:27 +0000
Date: Fri, 25 Aug 2023 02:58:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZOfh6o2EaGuIqZVe@pollux>
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 84420fa4-5910-4229-b573-08dba5174b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3KgWZk9hg3YWgpAu6A6jPI+UPUv6BbXMl3woaiTB6FB0774thgqCLrk/I/ao58AZ8XhGeRES05Rj9qR9Tk1jbvtGIrOT4aHPmjPsrynebDM4kMsxEhWaN/fWawxcrS5hR1/J4trRwPvwb965LUy6RYMXeeYdrtHFG6gjDS4pPFwrYd8vOZqhIr+9mocPWL/iLV9U/vM9Z3JgA6Zo5Zz459urgL2AqjeL4kMwlMydJOu8tZRzJIvq+h8wJE1dt8fXdxT6WZWf2+zg+HDKigLIvVz7hH3HcGD7VZhrVznxe0v6HF0sEtjHMpsVPaSiETHHksLoSFVmXL+8tFA6dstj8L25qTANLH6KSeR1sWZ0NL8y3SozPbLvUaeYuF/9ZOLy3PAOxtV20ON9GG7f7VT2DgjIf9YrDNJ6qSsdES6usP3BHqqLl6C4nQrgJrS+vEmDkJAayxU48DTQusFQO57Yv5PLqYhCGejdge6dgV0p08VIcOQZv1CqinISWJEF2oQ6WtNAmroi27+dfVkgoylPlwIp0OtJ3EDTo2jn7HLlcFRF46kNjl8xP9a3gAdH5X2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199024)(1800799009)(186009)(82960400001)(38100700002)(4326008)(8676002)(8936002)(41300700001)(6486002)(6506007)(316002)(6666004)(6916009)(66476007)(66556008)(66946007)(86362001)(6512007)(26005)(478600001)(44832011)(83380400001)(7416002)(2906002)(30864003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41/XTKDCTzcNpwAiY5S6ZP6lkRrjq6iGY3P4jvoubuZAInHkAtE54XbZWxPn?=
 =?us-ascii?Q?RBtCYFKgis5n0LaH/SLYD/ztCRH38z9vOINJB9sc66mVyx26m2xZrXnsHd1d?=
 =?us-ascii?Q?RqU8jsoc9x6yHcaCGhAkR1Elwj8+YlglrN58G9dj3McmpowZSBrtJhYBarzW?=
 =?us-ascii?Q?Ipn0Wlvs/E2+Xb4mmenOgFFfZMsNqyG3Ve09sNPPCFcCDWwbPqsLixNfuaPY?=
 =?us-ascii?Q?YXuK4E+MxKyKOS9MY4sDrjFnxZG+okWuun4KSfv++vjfCB5qRQC3vbxH4tPh?=
 =?us-ascii?Q?6ag1sB1U02L/ksz8VrYPrrGs7bSnn9cEosZmnZbyQkn/SB1+qF0dlh8r8y65?=
 =?us-ascii?Q?CH49Atbkln6CTT8weZk/oEUwT44ax+5N8UcebH2FqAZTZ9volBaiyC0cdV5I?=
 =?us-ascii?Q?qlVoXfEtYGpoaM1scn8W7nBKx/5nnQ/KvrBSgc0QOoSHr6lnTuKjgDMOIHAN?=
 =?us-ascii?Q?cYa1nZllkXM52LkkWkNSDMJuul3nsuw4Egy5YxAXe9GwbAYhO7VlDY+jbEQt?=
 =?us-ascii?Q?kUvOtTSiWtm02wvu4UANDhru9BYfsDmajLvlZ1xLCBmDMI1K91A5ejDfmT05?=
 =?us-ascii?Q?i+PSqlNViBj1KTRx5qNy8ea2qRVshC5zvatlL8/+xSelXBWYphzVHqLAYQrU?=
 =?us-ascii?Q?NFNuMx2XT3gAGumnWTfBalLOBeouvb3t1FTtRAOqU2gQ9V+67Jw0Jq3BIgFI?=
 =?us-ascii?Q?6W5FkHBfLAr5zytfvlvkCxSv25+VZh/QvMWeY0QzZZQlqVX5ypaZBHe5QlsW?=
 =?us-ascii?Q?xry1pG1f7AzX+YIeggp1D5WHMSCbpQWCxoDcWK8akTUmYVUpvVliPsGqjSw1?=
 =?us-ascii?Q?6wgfbb13YCE00lFVhVnd3Cwx4k9uZ3pzlms1WG5ht/HoYODWiqkbVzgcDpko?=
 =?us-ascii?Q?vO9sEXr3pnqFIP5Zn7eXZlF3dvJxVTLDwUyndgz+7hhMmy/9fXOLaCOBZxvu?=
 =?us-ascii?Q?adhz9ASJT8XvmxQWEW3D8VVUT2ip5Opvy0AZb7SvVRAAselTffpaz2oPl7Qx?=
 =?us-ascii?Q?iGLtY0Bz3CLXS0J/qDNGpQgJ+5kTPI8ns1HXovTYysG4azGlFv/5044PzsHU?=
 =?us-ascii?Q?nSOoSoW3wYLaUBUdjRUej6U7Lyb7CSumpLU3kG1luDj4UlFlGS3AaKqizadM?=
 =?us-ascii?Q?PYIWYrlrIsoVjtpY4YabERLK7QiY745P1QJUk6WsTN+VdyJDwhJqt0H5s7dV?=
 =?us-ascii?Q?EpcaQM2Mm8Wlu8DSotGz3uPr8Wkn+TGVMAwlQovjgoSTittlYNgcqu1wi/ig?=
 =?us-ascii?Q?DF0ayIhOXE2X1QUcWy8ZWFrwwDE7Krn9aFWvmLVfGFpYxMPffFsv29H5bsCK?=
 =?us-ascii?Q?Xt+CONo8cfLwzySNaIZNgbS3n3J0bYGto+YrgP52eknS8OEYizdhPQBejCAX?=
 =?us-ascii?Q?cyikPK0h27E6TEfgkIBh6PjOl37doLbpfbyhBb57e79lVLBbCvJvbvv1HDOR?=
 =?us-ascii?Q?hYTyMiF4WJpAksPFfyId2skaFcxS+O6UjXVqMTuGn3hp2uf4rzoZXt+PxZxz?=
 =?us-ascii?Q?bOj2iWwXfQsWVg+am7OplA6eph5PAz6SJu20WnoWLUo4Sun8Rvz1lXXESDF/?=
 =?us-ascii?Q?3VzpUv2Xxb0l6n8XfQiJ4O87xuvxHcfmXUlfJRimOJtK8Obhlu94FsgqAoMr?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84420fa4-5910-4229-b573-08dba5174b64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 02:59:27.2553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUuNZ+SlfOq/ML0C3FC3PAdqtC6Ut4QvTLa7bFye/fs1E5vZjH90YSTFYyZUW8ltczmsAnOzB7qZMl2UuqHGSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote:
> On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:
> > Rather than call free_job and run_job in same work item have a dedicated
> > work item for each. This aligns with the design and intended use of work
> > queues.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> >  include/drm/gpu_scheduler.h            |   8 +-
> >  2 files changed, 106 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index cede47afc800..b67469eac179 100644
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
> > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
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
> > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
> 
> I tried this patch with Nouveau and found a race condition:
> 
> In drm_sched_run_job_work() the job is added to the pending_list via
> drm_sched_job_begin(), then the run_job() callback is called and the scheduled
> fence is signaled.
> 
> However, in parallel drm_sched_get_cleanup_job() might be called from
> drm_sched_free_job_work(), which picks the first job from the pending_list and
> for the next job on the pending_list sets the scheduled fence' timestamp field.
> 
> The job can be on the pending_list, but the scheduled fence might not yet be
> signaled. The call to actually signal the fence will subsequently fault because
> it will try to dereference the timestamp.
> 
> I'm not sure what's the best way to fix this, maybe it's enough to re-order
> signalling the scheduled fence and adding the job to the pending_list. Not sure
> if this has other implications though.
> 

We really want the job on the pending list before calling run_job.

I'm thinking we just delete the updating of the timestamp, not sure why
this is useful.

Or we could do something like this where we try to update the timestamp,
if we can't update the timestamp run_job worker will do it anyways.

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 67e0fb6e7d18..54bd3e88f139 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1074,8 +1074,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
                                                typeof(*next), list);

                if (next) {
-                       next->s_fence->scheduled.timestamp =
-                               job->s_fence->finished.timestamp;
+                       if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+                                    &next->s_fence->scheduled.flags))
+                               next->s_fence->scheduled.timestamp =
+                                       job->s_fence->finished.timestamp;
                        /* start TO timer for next job */
                        drm_sched_start_timeout(sched);
                }

I guess I'm leaning towards the latter option.

Matt

> - Danilo
> 
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
> >  	if (entity) {
> >  		struct dma_fence *fence;
> >  		struct drm_sched_fence *s_fence;
> > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
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
> > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
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
> > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> >  	sched->pause_submit = false;
> > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> >  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, true);
> > -	cancel_work_sync(&sched->work_submit);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_work_sync(&sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_stop);
> >  
> > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
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
> > -- 
> > 2.34.1
> > 
> 
