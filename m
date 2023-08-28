Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C370378B766
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 20:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF9D10E33A;
	Mon, 28 Aug 2023 18:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C82210E32D;
 Mon, 28 Aug 2023 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693248190; x=1724784190;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FoxktAX5IHbaoS2d4LNpHNHtuDen8Bv/r09TqmER30c=;
 b=bypvg1g27mCWFm+heVd9F9zG9BCy4TWVOoMdbQwPmoPm+u3CNdy3O+Tf
 ViHeE1i7iNLjzsxIq7dQZcRhNlweXoBDmjuw1sVrbMcVne8OytD9QgKLk
 R8hs3WQwHyVzPIxu5MlrgDT1JPMLnN+Yf8njIDrXxi1e/XnnNLpghDp6I
 vGMHapIV2H4If2n40GWPtw+c7tvrG4j3KY748l/fpa0uFJXQ3lksh6DQj
 QTEclZzuLhSkYfjaGMJ2J3zgALKOOaC5MktfsICtOYzP/I1QfQ16qZghp
 Z2YptJw66aylDxLHxALw7fFS3FxQGoOPuaaG6aM13wGT0HmVn2HuL0LVc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="374071203"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="374071203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 11:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="861925633"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="861925633"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 11:43:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 11:43:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 11:43:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 11:43:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 11:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuYbNiCQ33Bi5Pg/0WNh/MaG/G5qdh9GAsh9Ce4f030agk4iwk442KN5H74Wo+widOl1fJ2K3BYAWZVMmZ7+qYbtpcoe+InDx0FvDa6SfFqbTXqcZVz48lj/KffYwMD+imJ9K+sx3Ybx3TQlbHr/IlRfWyp6R+fc9M6bFYV6+mIgQrSyU9AyRc/oH18qyAOiy6chmslI/Jgl/I94ZGWp7Dx0IMHANLowvDy98UaTKiio7G6WgTuEIqScNg9TeHlxFtu4Z2GfUxltEtrMWim4GdD6M+X4V+sq1xzQZsWaxowhqH8n7waB5WqFdiNh9Pik2N+pUrlPIWduhRQvYBRyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhxs6xgGUBd2KSaK9YmpThhsbSaVawjFW0g3LDOpOkU=;
 b=Ms6SJE7Jzqu08esWBergZuqB+rNK/pn9SI+iOngiT7zQ5f8a0p2CQs98cvA812GTOaBZfbJ1KQFzSDBXLlK9une9cp2K6aOHudBsEVqC4SfmArTYHbiXIv7UGN+WnnQjM4y5/UEeEpwCJnDemc4iwWBDQEO89bwn0aLFno5wUiODnfL+5Vhhs0L5gyIbT/FHDIuyF+Y0BT8Rr9lmXAX2CBQ1dU0YlEc7evzEicRKWHAirZowXcsqR6xkIRXxPQkB73VhrQ90D2qb4Ry4OGUwgbxMB/FbtuNdOJVPiqfnpaTwm/3bJwClq2MQzTDKhoNkgUGZDFy4ZXU6FZF3pwE8mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Mon, 28 Aug
 2023 18:43:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 18:43:01 +0000
Date: Mon, 28 Aug 2023 18:41:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZOzqUtgXj0J4muYQ@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <bbb7fe74-bc75-8fc0-0a33-88ff86b81e00@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bbb7fe74-bc75-8fc0-0a33-88ff86b81e00@redhat.com>
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2d9cc6-f604-4760-2e60-08dba7f69b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FcHvgyJO7xZdw5vjO5sa8drUtgdaX2vJunDlBOCuC6PAXHXSMdnxm/zJGf3SgC/bxjTQCNYsyyWxMRzF4JDHs4oqLGNDmqc9AHz6ydbCVrrMdTgeOpi0C12w/FKgByl8ZcrW80fhCIakVX3vmCyIv5IhV4O+qfqfSDbBf6h3yBx9jKB4mglvlEI3VIaUWUuBmJFlvMWshP0XUdYnNMt/Reja75M/GaGPfijZgD7YaCfNR6f8k4Ad+SJDmuUokEsJXhraDSrrd7zeeLUuD/QO5v8NdzZLPXEBTWHavHOV9kpwBJTmUzPGUm+5KG+6pEsnKDrvEotCphdjmWsnX6m0g2kdmLX1TgOBnZR6qaY6llyosnlM7ZRoxb9irGsDNEXRtT37YjaqxkG8YateAGcwobrLHNN/vOPweNyy7knfmoSYnXxqSMJoCIXcAQcZuyOzWTyelSgnIa8miJfUQJwNkXL0VIzO1kBJpOAZ/fEhAbEKdXYUt3u5I0BsyCijQFsGUz5+7dO7js7NPn2iGZUlFXKM6ciZBoelaxEzahWbABCJ1xoXg8yypYE75lWFdfCW4SgLU08PLNbKPJTFddVhyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199024)(186009)(1800799009)(6506007)(6666004)(6512007)(6486002)(86362001)(82960400001)(38100700002)(2906002)(30864003)(26005)(53546011)(966005)(478600001)(83380400001)(66476007)(66556008)(66946007)(8676002)(8936002)(4326008)(5660300002)(44832011)(41300700001)(7416002)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMOw4pEprEn5yUbJs/So3s5ejixFcNYvJmMDiB9UwfJypC/deWt0FOyX3osk?=
 =?us-ascii?Q?ZE4L08TVIpBCqUG7Rr2Ec7XDAv6N0QnxklsTYGz0Lrtkze5sHUvAmAQDNe5q?=
 =?us-ascii?Q?TOFI/E2vnWb0y6qfvhFpld5kYQQXBtdrd9cD5cLMXS0xAtyiDHI47oEW/0s7?=
 =?us-ascii?Q?ABdRHBmSjlMII61xIhCbtVL9FK6mYjejrhMY0Sq+dpGNIQDgNJUVfcPYmWo2?=
 =?us-ascii?Q?d5vJSMmjoZ8DTcGwgATcFsIcLN/7J4TiHe3TVM6cP+eMmnc8OFGsZxNTybtf?=
 =?us-ascii?Q?77Nx0Nif6vwGhvt9NWtihuJf/Y3bpgRzlCm8qED5+MPcD9qdAt2tnL2rPwpu?=
 =?us-ascii?Q?jCsUrysmSpraAMVkXwdmlcjRULIe8xfv/eHxwAP9qyDkG87+EFXsh5BwO6Ay?=
 =?us-ascii?Q?Q38R02qVBt4XHLgNyeHMedSq19WeUixQxRQUPs+j56hOTb7EmwKZ10rN00aH?=
 =?us-ascii?Q?v/FG9G7d7D0+xMz2JQsP4+HueSCmiX7s6fQ1QuNRtmVz6sIeFzsDJ6QpdIzU?=
 =?us-ascii?Q?Iuti81i1Tw5ovmKaqNJ1kMglDumP99/p1GyUDNgWNCsjcb3bQzEy3Ef69Ikl?=
 =?us-ascii?Q?E1dcUmxAyWcP+jKHWUfzLWHcDAEPcqHRth7tt/rPVDOPWM8iA5Cubp1+LlVI?=
 =?us-ascii?Q?ooVGygQYZnHx8FscqMU2b1q+zDljTyeF/iOI3uya/Ga4/+l4Af/TgTzyw+y/?=
 =?us-ascii?Q?TYP/EtrwfYaeMY0v4VzHgmbM0IH0kHnExgCj7hyjG5+AYjkkPAaS3LQLpVHg?=
 =?us-ascii?Q?iqkpYdkcXOh73sZJnxQVzoNxV+I9FPKMDUd1lyO3XtdndSFoJgAsoGvPL4E4?=
 =?us-ascii?Q?gR5Q4tRttqbhzNSbioy8e+/hyavTpUlc81hLTCjd4iCRoUQZ80S8MYrL23XK?=
 =?us-ascii?Q?28wU+B09WYLdp6ez/aEMENrX5I0Z/rIBMcBeIRUavEacKgtz3DDG8aNZbU7z?=
 =?us-ascii?Q?yEVyw04019yLIP6OnHDLwpEqTKYqvCGW6T6jLkD3hQuyXxgOWPoAEdkeKi7b?=
 =?us-ascii?Q?kKJeFzys/dOPnjE3o7Nms4NiV8XTYkD5ymMkB4QT5HPtxmdHmzFulQCVzQ5W?=
 =?us-ascii?Q?uWffPox0dMwzT7NGYTDDE6tLxB9GPkHCKUEnkcpftzjg+rLLePDC/NUQpcXO?=
 =?us-ascii?Q?qP5Ad6B76OZLSL/AAwmh/Vtl5GHAHXuNzHImmIu0Zx3MMo2UcAzSXT4XxJer?=
 =?us-ascii?Q?nr3AsG8J4tcvnP8ysr9rOXlnoftsGjCL5zOkBrRjh/+3qKkDECVGQlrGY+QN?=
 =?us-ascii?Q?b9XEOCTkgHC2OZh1AHVOwqoN55fM4gMIn7y4UQf+zGcIyHM2PRbR69bQGdfo?=
 =?us-ascii?Q?+me6Cf3OGY7aeNcLBbtiMOJrwnJ3dgdf7SmlTs7iVtrx9SylyNrMZIlL4qWh?=
 =?us-ascii?Q?3HdHkldBeJmn597Kxfg3eowy3IN9EgxYAyyv1fteJjxU7/WmQJaxsnejMcqB?=
 =?us-ascii?Q?PCLjC0x6ly74FTjOOSk+mnBr7LTP+cUzLZpvMY2+GdMIrIVuAH77IvD9P3Jg?=
 =?us-ascii?Q?1jTKrJMqcChvtugmfPB4HL9gd2mk8f8GiZA94mCcclmXkIyMZ0wp7sxuj007?=
 =?us-ascii?Q?OMdQYnzLZAgH3dVCVgZ5r23huigpNBLwL12dl/07BpkoUkOkNcT5rxfi4A+5?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2d9cc6-f604-4760-2e60-08dba7f69b0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:43:00.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05QN7XheQddi8Wg5xz2Lu5uAixJHkIA00gbYMprgGyGUvnk+dI10uziBpTA4GbkwU3/Fy+P7OhNupBnwCFvSGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 08:04:31PM +0200, Danilo Krummrich wrote:
> On 8/11/23 04:31, Matthew Brost wrote:
> > Rather than call free_job and run_job in same work item have a dedicated
> > work item for each. This aligns with the design and intended use of work
> > queues.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> >   include/drm/gpu_scheduler.h            |   8 +-
> >   2 files changed, 106 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index cede47afc800..b67469eac179 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> >    *
> >    * @rq: scheduler run queue to check.
> > + * @dequeue: dequeue selected entity
> >    *
> >    * Try to find a ready entity, returns NULL if none found.
> >    */
> >   static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> >   {
> >   	struct drm_sched_entity *entity;
> > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >   	if (entity) {
> >   		list_for_each_entry_continue(entity, &rq->entities, list) {
> >   			if (drm_sched_entity_is_ready(entity)) {
> > -				rq->current_entity = entity;
> > -				reinit_completion(&entity->entity_idle);
> > +				if (dequeue) {
> > +					rq->current_entity = entity;
> > +					reinit_completion(&entity->entity_idle);
> > +				}
> >   				spin_unlock(&rq->lock);
> >   				return entity;
> >   			}
> > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >   	list_for_each_entry(entity, &rq->entities, list) {
> >   		if (drm_sched_entity_is_ready(entity)) {
> > -			rq->current_entity = entity;
> > -			reinit_completion(&entity->entity_idle);
> > +			if (dequeue) {
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >   			spin_unlock(&rq->lock);
> >   			return entity;
> >   		}
> > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> >    *
> >    * @rq: scheduler run queue to check.
> > + * @dequeue: dequeue selected entity
> >    *
> >    * Find oldest waiting ready entity, returns NULL if none found.
> >    */
> >   static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> >   {
> >   	struct rb_node *rb;
> > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> >   		if (drm_sched_entity_is_ready(entity)) {
> > -			rq->current_entity = entity;
> > -			reinit_completion(&entity->entity_idle);
> > +			if (dequeue) {
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >   			break;
> >   		}
> >   	}
> > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >   }
> >   /**
> > - * drm_sched_submit_queue - scheduler queue submission
> > + * drm_sched_run_job_queue - queue job submission
> >    * @sched: scheduler instance
> >    */
> > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >   {
> >   	if (!READ_ONCE(sched->pause_submit))
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
> >   }
> >   /**
> > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> >   	dma_fence_get(&s_fence->finished);
> >   	drm_sched_fence_finished(s_fence, result);
> >   	dma_fence_put(&s_fence->finished);
> > -	drm_sched_submit_queue(sched);
> > +	drm_sched_free_job_queue(sched);
> >   }
> >   /**
> > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> >   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >   {
> >   	if (drm_sched_can_queue(sched))
> > -		drm_sched_submit_queue(sched);
> > +		drm_sched_run_job_queue(sched);
> >   }
> >   /**
> >    * drm_sched_select_entity - Select next entity to process
> >    *
> >    * @sched: scheduler instance
> > + * @dequeue: dequeue selected entity
> >    *
> >    * Returns the entity to process or NULL if none are found.
> >    */
> >   static struct drm_sched_entity *
> > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> >   {
> >   	struct drm_sched_entity *entity;
> >   	int i;
> > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> >   	/* Kernel run queue has higher priority than normal run queue*/
> >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> >   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > +							dequeue) :
> > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > +						      dequeue);
> >   		if (entity)
> >   			break;
> >   	}
> > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> >   EXPORT_SYMBOL(drm_sched_pick_best);
> >   /**
> > - * drm_sched_main - main scheduler thread
> > + * drm_sched_free_job_work - worker to call free_job
> >    *
> > - * @param: scheduler instance
> > + * @w: free job work
> >    */
> > -static void drm_sched_main(struct work_struct *w)
> > +static void drm_sched_free_job_work(struct work_struct *w)
> >   {
> >   	struct drm_gpu_scheduler *sched =
> > -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > -	struct drm_sched_entity *entity;
> > +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> >   	struct drm_sched_job *cleanup_job;
> > -	int r;
> >   	if (READ_ONCE(sched->pause_submit))
> >   		return;
> >   	cleanup_job = drm_sched_get_cleanup_job(sched);
> > -	entity = drm_sched_select_entity(sched);
> > +	if (cleanup_job) {
> > +		sched->ops->free_job(cleanup_job);
> > +
> > +		drm_sched_free_job_queue_if_ready(sched);
> > +		drm_sched_run_job_queue_if_ready(sched);
> > +	}
> > +}
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
> > -	if (cleanup_job)
> > -		sched->ops->free_job(cleanup_job);
> > +	if (READ_ONCE(sched->pause_submit))
> > +		return;
> > +	entity = drm_sched_select_entity(sched, true);
> >   	if (entity) {
> >   		struct dma_fence *fence;
> >   		struct drm_sched_fence *s_fence;
> > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> >   		sched_job = drm_sched_entity_pop_job(entity);
> >   		if (!sched_job) {
> >   			complete_all(&entity->entity_idle);
> > -			if (!cleanup_job)
> > -				return;	/* No more work */
> > -			goto again;
> > +			return;	/* No more work */
> >   		}
> >   		s_fence = sched_job->s_fence;
> > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> >   		}
> >   		wake_up(&sched->job_scheduled);
> > +		drm_sched_run_job_queue_if_ready(sched);
> >   	}
> > -
> > -again:
> > -	drm_sched_submit_queue(sched);
> >   }
> >   /**
> > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >   	spin_lock_init(&sched->job_list_lock);
> >   	atomic_set(&sched->hw_rq_count, 0);
> >   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >   	atomic_set(&sched->_score, 0);
> >   	atomic64_set(&sched->job_id_count, 0);
> >   	sched->pause_submit = false;
> > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> >   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> 
> I was wondering what the scheduler teardown sequence looks like for
> DRM_SCHED_POLICY_SINGLE_ENTITY and how XE does that.
> 
> In Nouveau, userspace can ask the kernel to create a channel (or multiple),
> where each channel represents a ring feeding the firmware scheduler. Userspace
> can forcefully close channels via either a dedicated IOCTL or by just closing
> the FD which subsequently closes all channels opened through this FD.
> 
> When this happens the scheduler needs to be teared down. Without keeping track of
> things in a driver specific way, the only thing I could really come up with is the
> following.
> 
> /* Make sure no more jobs are fetched from the entity. */
> drm_sched_submit_stop();
> 
> /* Wait for the channel to be idle, namely jobs in flight to complete. */
> nouveau_channel_idle();
> 
> /* Stop the scheduler to free jobs from the pending_list. Ring must be idle at this
>  * point, otherwise me might leak jobs. Feels more like a workaround to free
>  * finished jobs.
>  */
> drm_sched_stop();
> 
> /* Free jobs from the entity queue. */
> drm_sched_entity_fini();
> 
> /* Probably not even needed in this case. */
> drm_sched_fini();
> 
> This doesn't look very straightforward though. I wonder if other drivers feeding
> firmware schedulers have similar cases. Maybe something like drm_sched_teardown(),
> which would stop job submission, wait for pending jobs to finish and subsequently
> free them up would makes sense?
> 

exec queue == gpu scheduler + entity in Xe

We kinda invented our own flow with reference counting + use the TDR for
cleanup.

We have a creation ref for the exec queue plus each job takes a ref to
the exec queue. On exec queue close [1][2] (whether that be IOCTL or FD
close) we drop the creation reference and call a vfunc for killing thr
exec queue. The firmware implementation is here [3].

If you read through it just sets the TDR to the minimum value [4], the
TDR will kick any running jobs the off the hardware, signals the jobs
fences, any jobs waiting on dependencies eventually flush out via
run_job + TDR for cleanup without going on the hardware, the exec queue
reference count goes to zero once all jobs are flushed out, we trigger
the exec queue clean up flow and finally free all memory for the exec
queue.

Using the TDR in this way is how we teardown an exec queue for other
reasons too (user page fault, user job times out, user job hang detected
by firmware, device reset, etc...).

This all works rather nicely and is a single code path for all of these
cases. I'm no sure if this can be made any more generic nor do I really
see the need too (at least I don't see Xe needing a generic solution).

Hope this helps,
Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_exec_queue.c#L911
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_device.c#L77
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next/drivers/gpu/drm/xe#L1184
[4] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next/drivers/gpu/drm/xe#L789

> - Danilo
> 
> >   {
> >   	WRITE_ONCE(sched->pause_submit, true);
> > -	cancel_work_sync(&sched->work_submit);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_work_sync(&sched->work_free_job);
> >   }
> >   EXPORT_SYMBOL(drm_sched_submit_stop);
> > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> >   void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> >   {
> >   	WRITE_ONCE(sched->pause_submit, false);
> > -	queue_work(sched->submit_wq, &sched->work_submit);
> > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > +	queue_work(sched->submit_wq, &sched->work_free_job);
> >   }
> >   EXPORT_SYMBOL(drm_sched_submit_start);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 04eec2d7635f..fbc083a92757 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> >    *                 finished.
> >    * @hw_rq_count: the number of jobs currently in the hardware queue.
> >    * @job_id_count: used to assign unique id to the each job.
> > - * @submit_wq: workqueue used to queue @work_submit
> > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> >    * @timeout_wq: workqueue used to queue @work_tdr
> > - * @work_submit: schedules jobs and cleans up entities
> > + * @work_run_job: schedules jobs
> > + * @work_free_job: cleans up jobs
> >    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> >    *            timeout interval is over.
> >    * @pending_list: the list of jobs which are currently in the job queue.
> > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> >   	atomic64_t			job_id_count;
> >   	struct workqueue_struct		*submit_wq;
> >   	struct workqueue_struct		*timeout_wq;
> > -	struct work_struct		work_submit;
> > +	struct work_struct		work_run_job;
> > +	struct work_struct		work_free_job;
> >   	struct delayed_work		work_tdr;
> >   	struct list_head		pending_list;
> >   	spinlock_t			job_list_lock;
> 
