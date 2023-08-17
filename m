Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DF77FD51
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 19:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB17A10E08D;
	Thu, 17 Aug 2023 17:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE3610E08D;
 Thu, 17 Aug 2023 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692294925; x=1723830925;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1Avw0U9v2isJSiaPoY85XUksioyyXbdZZgNsVNjA2fc=;
 b=L8GtC2gt0dMT2opEAOuXi3ck+dZ+W8rPlmIuf/5mR6aFbceNZgU7L1wl
 0xui7aCovivNGZgLIQNlBVH2xtQpj55OpvDtdPwXq7c1WPHEJ3gh5dsJt
 TJg97p4cGZ/yEt+ku3jsiiqTbV1XEnkGdbeO0CimErFgzSloImN5rZ5hM
 QtwhoMtQHbvYyWdUnLQW+p5IUes1hwW3/zu3fQKAboUaiW9QOa1AwDWTz
 pNv/1pDyZWcbDmrcCrB+iiGWbWAsb1vyJ9N4BeYTnVDrcFUsrMWDNl8/c
 vClzZ/3mwCXIAIGnfPPwDTC7ZzldMnXhp9cVsqx+41dmut9uPgRSLG5ZU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370356259"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="370356259"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 10:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="858308191"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="858308191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2023 10:55:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 10:55:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 10:55:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 10:55:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 10:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYpXB36np+e6Tgj3NSS55aLjTy+d5v1WlPmXUssUcFncgH26EFPwaxC/tUV2HNi9HjiJGAPhptb/I4Jr098RxpSMwCvT8r+Lz3v3vqEmv3vKKXCo/TqjFElfxZaur/R+M1y1ukjC8KQroY4Ljg7gd6796guv+IWp/pV4E6RNyl8VuS9iJ2DE2l/58aG0ZVY1yjlY6CR8Kx9175+6P9q7vHgdjylpUfEjR9PtmLIxgkWTHOpOmBuDGPAu92aibGEq3URaNrQeU8pszJD0S0iKzqljOyaV2WX9AcjlWXV4fTshmWOzxkkpy1yxnJT9j9uZgW7i1L4i0AYpA3quuQMlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dBhwU/CxTPHfJuadq9me23ZJ2G7F2F/gFyO4viNcUA=;
 b=hTzMjwKTRReOb2u8oE1bC0bouu++1a2vWt/pVNRVVU6pkK5taMbpHaYCau/yHBJCYJP0pAkfZZKu9pkZ4UAzNINaTc+b7G/nd5L5F91LbS9ShmWhR2mgjggsid+qlt7U7yQDARqmt+3OJDwISJUDU5LcRyPHS+Kh3hDyNaBvvhmq0egVfcdkZy+Ag74FrX5g8J7U9s95izRJaC1DWbGGxvM5317mHSbnZikQ2ehXkWLgoGcYjY3B+nN/wsWCpsX7Hcfzmq9qaT97XB9+87cOByTva17uGlZrcxQyPdbesvsh1o9+fcdSOO9THVmFg8pppfMchnOOYob737qj7jXZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 17:55:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 17:55:12 +0000
Date: Thu, 17 Aug 2023 17:54:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: bce943dd-cf75-41a2-4cb1-08db9f4b1a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYQHZj8zs4kXhtEm0kvGlJIf5zolgkkpSHKXWkq3xTm3tX9uJMl6+PgdyKXRnhLOTioFuthnx77fLAiq194p/fIdLpZW7jj80a0NPSX/xPMfsLLJjdMiXLLG+cZG+2yK+CGoaN1bmChqtoh1tWy6FIIMNFd8KHUmeQlvRvq7/albxZMsjL/xOnb3wCiIJIB/A3x8AfmhBISZTCDcrCJedNnwZCHTjp5ZVORKkz5khW/NgcmpRlgtYiv0wk3Ju6E0Oq/wbb/Dp4I799iNVDc2qBPVgJtksTvGmccRvXXw/E16AEcSHxjAWF0A11wqhj1cO6Q5uGczEbKPXzgoaEj/LochIguDvu9eViJkksj82w+9xWlyToUOEZUz1XWVUvgwHj5DcWz79CFlvw84JoaAbBdGLDqp0Xe2PKQ9yXj3XqjcSkfIglg7c1N/V0RSHL4xmeRxZlsZFhgU7Ps1RCJxxOCcAuCdulJRITkpcajTuGL5H382TyEvVf9UeoHvtMJmvJrnBlsvjuTFfBXV5HvLHOmHh5RbfSzipSOXaeoFJ4a9tgVvbor/9jvg2AIm8oOw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(1800799009)(451199024)(186009)(6512007)(6506007)(6486002)(83380400001)(38100700002)(26005)(86362001)(66574015)(82960400001)(6916009)(41300700001)(316002)(2906002)(30864003)(66556008)(66946007)(66476007)(44832011)(5660300002)(7416002)(8676002)(8936002)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hjS7P9/Q5f8s4f2SHd6vdXFfcU9sRpR1oCjnM4C4qzWfLgF5pz9C4uKLYP?=
 =?iso-8859-1?Q?xmrnBxIf41B2jyFCqL23FEng+BpscmZR7QkJQx476B2XfdC7wheD07pKK4?=
 =?iso-8859-1?Q?8VrFe7W0qnMcQ1z6GuwHa8fLbzOyJm5y4eAMEsdXZa4xgGVYXgD0y8IXeK?=
 =?iso-8859-1?Q?Daz6/oQJE08ImMMOW2Nbn2dhTVWumiZ0dg8jqL/ANfHrfCjTPQocpFnZUD?=
 =?iso-8859-1?Q?x7PS9pzeuPtn3GvU0OKD+0tCLFc+II3PXQnDjw1IbMx2Tc4B+JrtAA7jji?=
 =?iso-8859-1?Q?XckcYgXRjhsNCCMY88t4d3FBZiKVSIo6NzAQlB/eTlI3z/Ai3yMd+oh32D?=
 =?iso-8859-1?Q?kzqBuxv50UMxPNdobuQd7ow334GGykD+SFaoGY3E2SY6ZZ9Ru5PndnXdcd?=
 =?iso-8859-1?Q?KlAQNN88O5RvOTwE6ZdUQjhVlFBeDXGalXmpX9bQzhqW7AhngQkJier7aS?=
 =?iso-8859-1?Q?LT8oiHgb/drh2BmaaWQEyzROZJZMyqDbenFMjzYxItTvfYu6HVe2X4LW2I?=
 =?iso-8859-1?Q?3QT7pIsry0Pn+BEMcLPgZhBjpGq8yPHcpXkIRfMeKfgSRFemu6rNQUVP17?=
 =?iso-8859-1?Q?FvzzASB0DmD60R4FWhjaYL9vnQ9u3gWeKBxeoco5pknZwCwBoFJGQJ0oLv?=
 =?iso-8859-1?Q?A2qmun159wr+x3U+AJncgICUcSrCdWwKgkRIX1h88MLpS+Hzuhbjy+iJZJ?=
 =?iso-8859-1?Q?v3qFL1MtqnyVsANm/iOeIJFUdraePaM82CcdcrjKYdSYlIX9+xsA0sG3Ya?=
 =?iso-8859-1?Q?UdwAwiRjjqdFuFX21kqxLlRF2Zxmc3j1ODi8h3IVnUXgpGl9IchhvEmizr?=
 =?iso-8859-1?Q?yXSst+vS2yA27jqyOhlZpI/j9nrpMBqqtdwucDRZr/AReF1RYa0zUW93oL?=
 =?iso-8859-1?Q?edCpz33MAv0EhaB0JJQP0Jqpe7rCMPYkimDOYMJwkkGbEsYBia5x89tuFy?=
 =?iso-8859-1?Q?PNajrfFILJpm/hKh4vl1K2TrUsa0RqAprGw34Aghi6MFmZv/Rd+RkPLZO+?=
 =?iso-8859-1?Q?G7B65wba7t1+r0Xp20baxGuKhyEcj2dJjfc6rnwp1J0uJEAfFfQyDI3/Fs?=
 =?iso-8859-1?Q?kOBccmwlAwswXQg5bdXYHma0EC7L4hLty72QUM+4GwNJS94+FlYgMNEk4s?=
 =?iso-8859-1?Q?2KJkkMnS/Rd55EvCT6n0/cu7DA2c84Nqyxd+FxyiuT80u6WMJWBfrKJJ81?=
 =?iso-8859-1?Q?/A9Cugar7iH57RXoA+i7pzOEKwIZDHHgEOC+B+X2lZmqIhVsr9yvRugQz/?=
 =?iso-8859-1?Q?es0ttAhpy0le//qwx5oCg8TFiBAB0KVLACYsnuvPN/MKUKEa4kvkl51/Ji?=
 =?iso-8859-1?Q?3qZFeztf4GxjgOGGsQ0iNeFCtQXL1ZPExHdduek9FKSb0Jfz4XOLU2oQ2f?=
 =?iso-8859-1?Q?g1wNbqUz7SGnH4IVh8ohD9l0CZ3IFM5pkz/NfpXeXQaYHcqLvra03Qh6f2?=
 =?iso-8859-1?Q?2owG0ZCLe9eK/aZ7YA5oPUnJawbFXqPZo1HwWpR5RuYASt6ThTAscuicU7?=
 =?iso-8859-1?Q?P/rM4RBq63N391VW0eQIIzr6ZYCz/bYIru/a/UpvhpIcajN6mgCWpEfMaO?=
 =?iso-8859-1?Q?EFQYqvS22IMWIo/kNkiGyMOnGu3K7JG+vNYzMH3KGR7nS6NjesoPE9qc/y?=
 =?iso-8859-1?Q?TIgVswFBwPScWrDF72NMizBEGV2kLF3V4J6c6Zk5K7BrXlIe1eBxWoPA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bce943dd-cf75-41a2-4cb1-08db9f4b1a05
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 17:55:12.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8px4bMWcI3pKc3Zs4VOq2H/QAD7b0PXqi+Xe+3oVXA+zcABU44DsGszf7uD6v0MTIGRMG+C116dJ6v4/JWoD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 03:39:40PM +0200, Christian König wrote:
> Am 11.08.23 um 04:31 schrieb Matthew Brost:
> > Rather than call free_job and run_job in same work item have a dedicated
> > work item for each. This aligns with the design and intended use of work
> > queues.
> 
> I would rather say we should get completely rid of the free_job callback.
> 

Would we still have work item? e.g. Would we still want to call
drm_sched_get_cleanup_job which removes the job from the pending list
and adjusts the TDR? Trying to figure out out what this looks like. We
probably can't do all of this from an IRQ context.

> Essentially the job is just the container which carries the information
> which are necessary before you push it to the hw. The real representation of
> the submission is actually the scheduler fence.
>

Most of the free_jobs call plus drm_sched_job_cleanup + a put on job. In
Xe this cannot be called from an IRQ context either.

I'm just confused what exactly you are suggesting here.

Matt

> All the lifetime issues we had came from ignoring this fact and I think we
> should push for fixing this design up again.
> 
> Regards,
> Christian.
> 
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
