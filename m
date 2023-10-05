Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B812D7B9A9F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 06:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BAE10E14C;
	Thu,  5 Oct 2023 04:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D9410E14C;
 Thu,  5 Oct 2023 04:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696478867; x=1728014867;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zh2AhxTjOlM6ESq5SZ5wM5zg2essMTQ9hl5rXKDPQwU=;
 b=OkkW9EGsAvFBFlKYIZL//d0wJPgT3fDtRgk02rupi0dIfxUpToM4/dPz
 jI0wCHhy4FhsheelcD9xK7lHVchgVicsntmZfNJBA6Ds/pYrmfPH5TU4S
 KlRLXYT2j4VwkI7o/d0xiW5d/VgY8MDsmWKPLjc2CQCxjtWoe/4DyP5Ri
 WaZNq8z6cTAlhDiOKeYz+wRM/Lz4euUk5huMHU2pBzoFkOlAIvH8ABgfU
 eezghwpNy4xVSqlCM/8q/sG8XRJd+xc/RIVDd98p/jCtCGmrFk7/xebDA
 FtghkG6tjZG0u1rQ1ij+nbErEt0IUwQmAuezh92sNKUS7K6e8yMYUNZzA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447572368"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="447572368"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 21:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786794715"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="786794715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 21:07:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 21:07:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 21:07:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 21:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjWtFp1eu2qlw/o6VmsfCqUaGxrpHbXfL4Bbvx2vZHXgndO0sv+i//CMZCEZjOWVUPdeLzVhy5Do3+mM64h/AZq0aygibY38sWXgficWAJ0T9fJzalqnlJNipnnChzAtqHmQaazqErViq7QPRLyBhu+VrVx+EhqkcuGpkUl2rRM9NMu5lIHGcmwX/JFZOB7i2ejMEXeHeauKMsY5/yrRvI1W/YC05ukd9sNSNJaCCM6ma+q22IRvgBfmFC6DKatA8HH0lWz1TxPLrAsfEjwkuLwF7/ublaq9uWq3N07UlG830fWdUJCb23DK05JzE1GL9WLgQGAg7ogpPqnzvIjw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lckb7Rx1UAbHF3N9wZyzfkUqmgtfej4Rw1yOCmS6NGY=;
 b=Eguw0IHax/hJbcbDEWcL4toTlUUqNTjrCXHayMkcxxbLX8Cc01jkGKCicqxkppKzTY3kk+Uz90RzgTKrAwGJJkswnnrQXDsZWSrfcQC1LE+cJZ3MbLUbu3EZLHP6Gd8pVFgy5SuTjSAvi5RRWnV47rk2T03mzdhswx7C4WVokDMQ6ajA7A4yzTZCG5LCyzmdc7mGkTNOmZ8Nriezm+FsKOTG+fHj+uxg2MB7y6UookaEVkQ0qrLnzs400EvqsrFdRUKTJzvkW/pLEZqTcLAedbM1W+y8CdDwqPXx02NZdPbWE40ClRF1CKRe8t0o2PvuLQInaDkH3Ll1iTdXKFm1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 04:07:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 04:07:43 +0000
Date: Thu, 5 Oct 2023 04:06:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 05/10] drm/sched: Split free_job into own work item
Message-ID: <ZR42R5IZSHcE27YB@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-6-matthew.brost@intel.com>
 <15751c1b-2712-4320-9b99-54e14f42b6f9@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <15751c1b-2712-4320-9b99-54e14f42b6f9@amd.com>
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: f4081711-fc33-4ac7-4fb7-08dbc558a005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jw11YjTiQIh3n/4EYKErZAn9lzDeKbmRiJkFwtMe6gnDod7pnZpS86ztsxvzp+b5MTHqo6bPKYrdd5WPIVO5tBg/7cDtNhAO1J37epfVV3daj8bxN36qK39RlKK0P3nraQQe3LwZQ4hAYym5rjbAHL3d29MCzKkIEkRC6aMNlav1EWlInHW190+KdUddbW13oEUEDBd/BRGMtFei+5Jln3v9D0TfJMUhpwmyUfIW9zJQdy/tTIwXl1XtHdYnm0RcWI9lKslallJjOaBfYUrpa59TU/ee1fJVDxVB68hGsOZKAJ7/g4VWFqWJHLHlQDttM+iBlIpp5NvWE0RvCKlA8plLkdYE/eoPdsqMc6b7ou171KGYrpip1wAv34Q6XU5MjKKs6nKxRzJPzqspQvDjhniyULjhh1jgvHpADQxag7mjBSSXjgnBS1UF7NCBByNerJbCyYexDQLz80gJU3aefRw/5MhJO9zJGknX5NzC7nsMIrWn8HJU7dUN1EWjM+ALyjqzcZrTHJU+eoM4Vp9+hEe20Bjc+ZEItP3E0scCYfTYsZECsQrl7CwzJoBDUyfs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(30864003)(2906002)(44832011)(8676002)(8936002)(5660300002)(4326008)(7416002)(41300700001)(66946007)(316002)(6916009)(66556008)(66476007)(66899024)(26005)(6506007)(6666004)(53546011)(6512007)(82960400001)(83380400001)(86362001)(478600001)(6486002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7GCm+np4DSUaQMk7iwXLqY8CCHPZvVYNdsLDTmI8aUT4sudQylCExnkon1ZX?=
 =?us-ascii?Q?lkTGNvHBupwm44qF8Qksh4/KTzqhR3eQJs6dUJN6Su0fIOzeaeF2bOuQ/LSU?=
 =?us-ascii?Q?WuEry3bPZN8EnPVZCn1p1uaLCn81NkFL8dvHyyneSROtELPMiSzsWAcCRdyY?=
 =?us-ascii?Q?ecU2+eWnOI3ZDKBFC1kLse77SbzHtzFc2dmzVwwxrZvRYNeyXoTsKsekVnFi?=
 =?us-ascii?Q?QPlYsEFkZcX9XKcRWAXTPkY/JXVynxPu6e0EgzZPnxkvHzbrpa7g8wSG+9OD?=
 =?us-ascii?Q?mLCpr1RQOfuWJM82UDE6avazPreuZt+gXiO/D9zJ/kjQ07LPXQicJq7zrMvL?=
 =?us-ascii?Q?BI4JNBRdgHyQguNfDdaJK5ZJRZWtRlJB+aiymyXU0aqyOm855lhNUk39YHG4?=
 =?us-ascii?Q?1Rrbcbr+oEqG4taEHgW09wVBhfqpJ1xITEykMtu/JE0lWBhhyGaxsHGzd0r1?=
 =?us-ascii?Q?mTVrzSHiSvURIkE/0ASQsKWeh2SIK8gpL5oPyaHJSJoGk5lUKxNgUvBvsDvd?=
 =?us-ascii?Q?JArNHE2l/60ZqquMdGG+OPj/X8wPCqcoCWojeASJJxXyoeA7Fl1mbZRVkkGp?=
 =?us-ascii?Q?BrYSAOvq1MxkFqFETPixFnDveJRFUMYyJdiD2Ylkb/RbdZgevRE288Q9kNxZ?=
 =?us-ascii?Q?pH5kzTQ/17wc+CSFbbO1xCYbTYN+mWKt7Wp9VuHr0842Gn3AP/4HugNjuQDM?=
 =?us-ascii?Q?177G7HODAgerFXapS3sV2IpnkpbVJtOW1vproq0z4qa1fEA8f4Pda3gWJMbs?=
 =?us-ascii?Q?8MO85sxwd5hKpiUPMMbEjZdvVq4C6nZ7F4sVyUURiBeMW2ShXoSdVLxJowMD?=
 =?us-ascii?Q?AH3izL+oZY01jgjqIFWhA8IWXt/MfTi2wa7KQJuUnvgsQP9bdWPHeqLXbrhP?=
 =?us-ascii?Q?CQ8vBeA+7gpMXJYLHQJxIvR1O6KvH7k9tNoCaKF2KtEcXRgqseliIwsZvzjd?=
 =?us-ascii?Q?zwI8CkN/zmcjgu8yCCcjMqYYmWwLttHnUtIgl+B5oZqQJ2p6L2fxneGzs8o/?=
 =?us-ascii?Q?gN1phKaqIZIf8ToQMXx4C/qx7TLlKebN4lkd/yVCH5zW0MTE0phiyrT+dLnh?=
 =?us-ascii?Q?weSkBTU5yFthH6HRK5kKQ/hZN663vZmUiCNDwdrbsfyK/eGwfICm3BhqEzkp?=
 =?us-ascii?Q?pgXZxeTB+0gxQSTHEt0eLsabHtzNKf5k6DoeOcueTObWF+lFBntfwppS0Dqe?=
 =?us-ascii?Q?YrhrLxpxT8Kmz92Vgbcevm+8rkdjyMBtGtzzlcmu70LaHK7/z7O4vKDLThNe?=
 =?us-ascii?Q?TTAuQ7zy2HVqNv8Ir0CBCSB9/wCKdtN/8x5BMmlQ/Y/BYb8Ff+GDIsUqnpOD?=
 =?us-ascii?Q?UcJvemKB2PPborug3E2RV5gEJPpAhpzLe50ZAaAGabrQbfjDkuxPRJZxCHgj?=
 =?us-ascii?Q?l1IhqirYboOujMYQKTYObbrhKaehBHsmvG9ida5d0Z8kXjZ53vIcNslDNmdi?=
 =?us-ascii?Q?GF0NlcbsiXBz0aLUzRDm32ROOpMgc5WZVDg1XygujQY6RdsQ5U8N9AhiTATP?=
 =?us-ascii?Q?l5VnnMJDvGwOijr4aXPV8ojmmFQn9VW5l4FPLBGi72Z/a69MM2EnbS+WQfsh?=
 =?us-ascii?Q?7dpwl/n9ZRreRmT6+VSK3T0LkRd9VNV4f/NsQaHbKfSAsrZDTNnXYupT45Pl?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4081711-fc33-4ac7-4fb7-08dbc558a005
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:07:43.6896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf7Zx7//DNHw8lHUXZiV82tVTYEhAcDpgdeJYd/0MgvDr3bo0GWNjOXgtT6p7baiqkqr7cvHSwj5+qIhuKCT5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 12:14:12PM -0400, Luben Tuikov wrote:
> On 2023-09-19 01:01, Matthew Brost wrote:
> > Rather than call free_job and run_job in same work item have a dedicated
> > work item for each. This aligns with the design and intended use of work
> > queues.
> > 
> > v2:
> >    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
> >      timestamp in free_job() work item (Danilo)
> > v3:
> >   - Drop forward dec of drm_sched_select_entity (Boris)
> >   - Return in drm_sched_run_job_work if entity NULL (Boris)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 290 +++++++++++++++----------
> >  include/drm/gpu_scheduler.h            |   8 +-
> >  2 files changed, 182 insertions(+), 116 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 588c735f7498..1e21d234fb5c 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> >   *
> >   * @rq: scheduler run queue to check.
> > + * @dequeue: dequeue selected entity
> 
> Change this to "peek" as indicated below.
> 
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
> 
> Please rename "dequeue" or invert its logic, as from this patch it seems that
> it is hiding (gating out) current behaviour.
> 
> Ideally, I'd prefer it be inverted, so that current behaviour, i.e. what people
> are used to the rq_select_entity_*() to do, is default--preserved.
> 
> Perhaps use "peek" as the name of this new variable, to indicate that
> we're not setting it to be the current entity.
> 
> I prefer "peek" to others, as the former tells me "Hey, I'm only
> peeking at the rq and not really doing the default behaviour I've been
> doing which you're used to." So, probably use "peek". ("Peek" also has historical
> significance...).
> 

Peek it is. Will change.

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
> 
> 			if (!peek) {
> 

+1

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
> 
>     * @peek: Just find, don't set to current.
>

+1
 
> >   *
> >   * Find oldest waiting ready entity, returns NULL if none found.>   */
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
> 
> 			if (!peek) {
> 
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >  			break;
> >  		}
> >  	}
> > @@ -282,13 +290,102 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  }
> >  
> >  /**
> > - * drm_sched_submit_queue - scheduler queue submission
> > + * drm_sched_run_job_queue - queue job submission
> > + * @sched: scheduler instance
> > + */
> 
> Perhaps it would be clearer to a DOC reader if there were verbs
> in this function comment? I feel this was mentioned in the review
> to patch 2...
> 
> > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (!READ_ONCE(sched->pause_submit))
> > +		queue_work(sched->submit_wq, &sched->work_run_job);
> > +}
> > +
> > +/**
> > + * drm_sched_can_queue -- Can we queue more to the hardware?
> > + * @sched: scheduler instance
> > + *
> > + * Return true if we can push more jobs to the hw, otherwise false.
> > + */
> > +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > +{
> > +	return atomic_read(&sched->hw_rq_count) <
> > +		sched->hw_submission_limit;
> > +}
> > +
> > +/**
> > + * drm_sched_select_entity - Select next entity to process
> > + *
> > + * @sched: scheduler instance
> > + * @dequeue: dequeue selected entity
> 
> When I see "dequeue" I'm thinking "list_del()". Let's
> use "peek" here as mentioned above.
> 
> > + *
> > + * Returns the entity to process or NULL if none are found.
> > + */
> > +static struct drm_sched_entity *
> > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> 
> drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
> 

+1

> > +{
> > +	struct drm_sched_entity *entity;
> > +	int i;
> > +
> > +	if (!drm_sched_can_queue(sched))
> > +		return NULL;
> > +
> > +	if (sched->single_entity) {
> > +		if (!READ_ONCE(sched->single_entity->stopped) &&
> > +		    drm_sched_entity_is_ready(sched->single_entity))
> > +			return sched->single_entity;
> > +
> > +		return NULL;
> > +	}
> > +
> > +	/* Kernel run queue has higher priority than normal run queue*/
> > +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > +							dequeue) :
> > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > +						      dequeue);
> > +		if (entity)
> > +			break;
> > +	}
> > +
> > +	return entity;
> > +}
> > +
> > +/**
> > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> >   * @sched: scheduler instance
> >   */
> > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (drm_sched_select_entity(sched, false))
> > +		drm_sched_run_job_queue(sched);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue - queue free job
> 
>  * drm_sched_free_job_queue - enqueue free-job work
> 
> > + *
> > + * @sched: scheduler instance to queue free job
> 
>  * @sched: scheduler instance to queue free job work for
> 
> 

Will change both.

> > + */
> > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (!READ_ONCE(sched->pause_submit))
> > -		queue_work(sched->submit_wq, &sched->work_submit);
> > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> 
>  * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready
>

Will change this too.
 
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
> > @@ -310,7 +407,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> >  	dma_fence_get(&s_fence->finished);
> >  	drm_sched_fence_finished(s_fence, result);
> >  	dma_fence_put(&s_fence->finished);
> > -	drm_sched_submit_queue(sched);
> > +	drm_sched_free_job_queue(sched);
> >  }
> >  
> >  /**
> > @@ -885,18 +982,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_cleanup);
> >  
> > -/**
> > - * drm_sched_can_queue -- Can we queue more to the hardware?
> > - * @sched: scheduler instance
> > - *
> > - * Return true if we can push more jobs to the hw, otherwise false.
> > - */
> > -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > -{
> > -	return atomic_read(&sched->hw_rq_count) <
> > -		sched->hw_submission_limit;
> > -}
> > -
> >  /**
> >   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
> >   * @sched: scheduler instance
> > @@ -906,43 +991,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (drm_sched_can_queue(sched))
> > -		drm_sched_submit_queue(sched);
> > -}
> > -
> > -/**
> > - * drm_sched_select_entity - Select next entity to process
> > - *
> > - * @sched: scheduler instance
> > - *
> > - * Returns the entity to process or NULL if none are found.
> > - */
> > -static struct drm_sched_entity *
> > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > -{
> > -	struct drm_sched_entity *entity;
> > -	int i;
> > -
> > -	if (!drm_sched_can_queue(sched))
> > -		return NULL;
> > -
> > -	if (sched->single_entity) {
> > -		if (!READ_ONCE(sched->single_entity->stopped) &&
> > -		    drm_sched_entity_is_ready(sched->single_entity))
> > -			return sched->single_entity;
> > -
> > -		return NULL;
> > -	}
> > -
> > -	/* Kernel run queue has higher priority than normal run queue*/
> > -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > -		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > -		if (entity)
> > -			break;
> > -	}
> > -
> > -	return entity;
> > +		drm_sched_run_job_queue(sched);
> >  }
> >  
> >  /**
> > @@ -974,8 +1023,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >  						typeof(*next), list);
> >  
> >  		if (next) {
> > -			next->s_fence->scheduled.timestamp =
> > -				job->s_fence->finished.timestamp;
> > +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > +				     &next->s_fence->scheduled.flags))
> > +				next->s_fence->scheduled.timestamp =
> > +					job->s_fence->finished.timestamp;
> >  			/* start TO timer for next job */
> >  			drm_sched_start_timeout(sched);
> >  		}
> > @@ -1025,74 +1076,84 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
> > -
> > -	if (!entity && !cleanup_job)
> > -		return;	/* No more work */
> > -
> > -	if (cleanup_job)
> > +	if (cleanup_job) {
> >  		sched->ops->free_job(cleanup_job);
> >  
> > -	if (entity) {
> > -		struct dma_fence *fence;
> > -		struct drm_sched_fence *s_fence;
> > -		struct drm_sched_job *sched_job;
> > -
> > -		sched_job = drm_sched_entity_pop_job(entity);
> > -		if (!sched_job) {
> > -			complete_all(&entity->entity_idle);
> > -			if (!cleanup_job)
> > -				return;	/* No more work */
> > -			goto again;
> > -		}
> > +		drm_sched_free_job_queue_if_ready(sched);
> > +		drm_sched_run_job_queue_if_ready(sched);
> > +	}
> > +}
> > +
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
> > +	struct dma_fence *fence;
> > +	struct drm_sched_fence *s_fence;
> > +	struct drm_sched_job *sched_job;
> > +	int r;
> >  
> > -		s_fence = sched_job->s_fence;
> > +	if (READ_ONCE(sched->pause_submit))
> > +		return;
> >  
> > -		atomic_inc(&sched->hw_rq_count);
> > -		drm_sched_job_begin(sched_job);
> > +	entity = drm_sched_select_entity(sched, true);
> > +	if (!entity)
> > +		return;
> >  
> > -		trace_drm_run_job(sched_job, entity);
> > -		fence = sched->ops->run_job(sched_job);
> > +	sched_job = drm_sched_entity_pop_job(entity);
> > +	if (!sched_job) {
> >  		complete_all(&entity->entity_idle);
> > -		drm_sched_fence_scheduled(s_fence, fence);
> > +		return;	/* No more work */
> > +	}
> >  
> > -		if (!IS_ERR_OR_NULL(fence)) {
> > -			/* Drop for original kref_init of the fence */
> > -			dma_fence_put(fence);
> > +	s_fence = sched_job->s_fence;
> >  
> > -			r = dma_fence_add_callback(fence, &sched_job->cb,
> > -						   drm_sched_job_done_cb);
> > -			if (r == -ENOENT)
> > -				drm_sched_job_done(sched_job, fence->error);
> > -			else if (r)
> > -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > -					  r);
> > -		} else {
> > -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > -					   PTR_ERR(fence) : 0);
> > -		}
> > +	atomic_inc(&sched->hw_rq_count);
> > +	drm_sched_job_begin(sched_job);
> > +
> > +	trace_drm_run_job(sched_job, entity);
> > +	fence = sched->ops->run_job(sched_job);
> > +	complete_all(&entity->entity_idle);
> > +	drm_sched_fence_scheduled(s_fence, fence);
> >  
> > -		wake_up(&sched->job_scheduled);
> > +	if (!IS_ERR_OR_NULL(fence)) {
> > +		/* Drop for original kref_init of the fence */
> > +		dma_fence_put(fence);
> > +
> > +		r = dma_fence_add_callback(fence, &sched_job->cb,
> > +					   drm_sched_job_done_cb);
> > +		if (r == -ENOENT)
> > +			drm_sched_job_done(sched_job, fence->error);
> > +		else if (r)
> > +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > +				  r);
> 
> Please align "r);" to the open brace on the previous line. If you're using Emacs
> with sane Linux settings, press the "Tab" key anywhere on the line to indent it.
> (It should run c-indent-line-or-region, usually using leading-tabs-only mode. Pressing
> it again, over and over, on an already indented line, does nothing. Column indenting--say
> for columns in 2D/3D/etc., array, usually happens using spaces, which is portable.
> Also please take an overview with "scrips/checkpatch.pl --strict".)
> 

Will run checkpatch.

> Wrap-around was bumped to 100 in the Linux kernel so you can put the 'r' on
> the same line without style problems.
> 

Using Vi with wrap around of 80 but know 100 is allowed. Will fix.

> > +	} else {
> > +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > +				   PTR_ERR(fence) : 0);
> >  	}
> >  
> > -again:
> > -	drm_sched_submit_queue(sched);
> > +	wake_up(&sched->job_scheduled);
> > +	drm_sched_run_job_queue_if_ready(sched);
> >  }
> >  
> >  /**
> > @@ -1159,7 +1220,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> >  	sched->pause_submit = false;
> > @@ -1286,7 +1348,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> >  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, true);
> > -	cancel_work_sync(&sched->work_submit);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_work_sync(&sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_stop);
> >  
> > @@ -1298,6 +1361,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> >  void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, false);
> > -	queue_work(sched->submit_wq, &sched->work_submit);
> > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > +	queue_work(sched->submit_wq, &sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_submit_start);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 655675f797ea..7e6c121003ca 100644
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
> > @@ -519,7 +520,8 @@ struct drm_gpu_scheduler {
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
> Yeah, so this is a good patch. Thanks for doing this!

Thanks for the review.

Matt

> -- 
> Regards,
> Luben
> 
