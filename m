Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30C7D0019
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D125410E531;
	Thu, 19 Oct 2023 16:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E7610E531;
 Thu, 19 Oct 2023 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697734678; x=1729270678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eZ3qj9poN62CR0GmwKTzuy09/WZqsOY/wNTCLy0JM2Y=;
 b=Sdwzh8/TeXrKdBcCfHuJpTGf4MhC0zQCrEeDqlMjFor57b8Zen1K3D68
 PffqRaRVSM/0BB9n+C640ktk2/yjuxGDnzsjfZLvjI3mo3Xpk0kFN7xFU
 L+qENJ4GvkN1BfYsIOBgHRDEqk4fj0T70p3eWW2IXzc5mJUfr88+U4PdI
 IdoIY5z2ttbwH/peCYnJM0F6XOEsG+NVibexA//bPb/dRD1FhuToiKhWX
 yzF0975BzS1VjiNROONzP789H27h7XddQW6E4ZmUpkpHjxpPMRxr64DHN
 HtYmUSVVHGpIVOp/1WVad+TDiJk6P/0PZVQxxKLIp/MzZKZUtbkLV6L1V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4910727"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4910727"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 09:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880744072"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="880744072"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 09:57:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:57:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 09:57:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 09:57:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDmVKvZqCQ7cjNeEtMPErVarvjqwcmWRLg1Jgqy5F5Qyc6Ie7flcIwRcVRvK1u5Sntura2cthV+mWIqILGpvB0y9PuDPtXxyw4o+CkHSKqF6Q3nMhPnyAatUHvDoz9QFZUgGP3xNahFx6yB4jSH48dsoC3M6mWKERPmOBEp1cx46filKv3wepXD+olsHFcrgddaF0WxkIznt+k2XiEl/kWGrTuOhkiaE1boT7qveXFxcd2EKWYLgR05u9jzmiINNUNHIPsXbwHQuaxm1e8UpoAGG/pCfBs5N0eJz/ppqyiWqnMIBDMvpvVUkkSpMX5ENbXM9o4PZJg33IFwPnNA2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVUifexOXnbj9/Y6uqeonSMu8IWv/ChG0sDbw64MAw0=;
 b=hQddf1aA6bNSN8we0ysgLu/IHQ6UqI1KCIFdmbu04uVZlVjy7DKbCeH+mAbTrYVAZPob9LuMU454oYtKpRzMPraa85i/wc2cOVOCFdd53TzaWlfpcu3USVJnGJbNC8tLqgwgKMh/y6P8fbvAG14W6CMymj+zKmCZVN9DNuAK1a89qbyHe/daIOEzvkwomjn4EhQDPxRZi3dVkMsnGGKpBOqo8VV9Z+TXEyQ2rvKYxjd9arG8PGTDPJ4MEBSq5V2fXBgOwUwCHTvsIU9yDA++Z4+gpxa62+q6gviHjK/m/7xG+DMxIjBYuCCL0rJtKt21tcFKfH+1cQDWMEv9h0jCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 16:57:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 16:57:14 +0000
Date: Thu, 19 Oct 2023 16:55:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Message-ID: <ZTFfn53k3FIq2z49@DUT025-TGLU.fm.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
 <88acf859-a1a7-433e-bfd0-b1b83b2cda05@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <88acf859-a1a7-433e-bfd0-b1b83b2cda05@amd.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: addbc018-c7d7-449b-f152-08dbd0c47195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udVEH5qXF4qMQsxa9Q3pnXnGhsryMY2RzRxn/3nCLKpuXyJto8hPdxtN1lOw2RqyUV4oDCzX5Vmsikh2faAYKT4YsdqxCSz1lwwdYOZ4M8tJ7NZHTo6Oib1wO6YMHuOgqygNSeYgrkbkZmGFxHJsfPBHHDwhvzEDbWR6Xp481e6QdVnIh3fE6lKZWHTELZXHyhWPhVbUpyzOd8OmzS9GzsCulvSJ/SnF/EcbyPV/fkUEJiLx5QHTFE5DlZ43TzxvgMaQrUsqjCocPpSJC4qlDDnqtxJFFCT8/M8QswNsTtaGV4UZr6oJZFgUP4KmE/lsicGBG8XahBWXXutWVWZNp3mjgrTXAS1/QiLK5ULnuVJC3W2NFikPiKKKS5VLNgQpWikvKyd0oUH/HlmV0TrWd0P6hxbachGKbwQ6U9HW9wDNNhkpU234AmyALyURvdq4bQcUTQqoYY3BWh4kcgjW1Hzefwykt4H0271zqIQnJmbS7wVIarBbcUXWzIJVPLi3c7GI8cuFRHmD6t7Oi4YY1dC2ypIT+TkVxaSkiYv2iET6zrqzOdOUHm0xTtL0YRnK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(30864003)(4001150100001)(2906002)(7416002)(38100700002)(5660300002)(44832011)(4326008)(8676002)(8936002)(41300700001)(66946007)(66556008)(316002)(66476007)(86362001)(6916009)(478600001)(6486002)(6666004)(53546011)(6512007)(6506007)(82960400001)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SRdPh6JPa2ufxFXcOJMjCFoZyPCeTP5tcJV/FS3tuZvNS49y9kbun60H70hT?=
 =?us-ascii?Q?ZSo0DFwPsq5COYV5Sf40at9Kh1V3XQvhod8Q5ucxKQCqO2LErliWTcghztKc?=
 =?us-ascii?Q?29aXRz82k8AEsjaWuyvjZZPEbMR/drAqo1tjkfovaTRjNBAWlZMiuV8RJB4G?=
 =?us-ascii?Q?/VKA3pA/UNf3qtd8/33N4ifMmAyMOozSFtOTZphm3vq9tHs1l4386mGlNPuG?=
 =?us-ascii?Q?E3fOXGp9WaluKHGXZMn15ofnun0GYhyRSpuwrSWD5S92vUr8iICc76xS8l2F?=
 =?us-ascii?Q?unvDDNI+Buok/R3zmVWoynaMwOrynTju171YIcFMFXzXX4h8lgAhSLhBw8mU?=
 =?us-ascii?Q?8dNrrl7sSDwHtM6yD3NBBzHZ4wO7XFyZwF5GB/gTfuyMGAAE7xKNHHz2Ij8m?=
 =?us-ascii?Q?NlmSJ09uoAMev02b5Qfd+BCpNdM15k5Db6Fy5z0VL3NAvzCihRdDNQsIopl+?=
 =?us-ascii?Q?eL0ZdkP6TdDIVmTAqLCEWxBLS/gm+/2x5KLQjoDyYucC8U2XBIz1PhosbiiP?=
 =?us-ascii?Q?SPRf98ma6CQZsaydtOHqFnbvSaGt0VQd9nx68Z6vBeY0waqZ8tmyuMqy8GNK?=
 =?us-ascii?Q?y6LcNzHhMnvry45EEMNEfcCEF4BNxz3R7gQv56qyYJtiRBvJFhe8LvrQp+Ms?=
 =?us-ascii?Q?pzA6AW4CdRrCqovawEsiKq1ObvGunKPmnsnQRe6FvVQ/NxBzjv7V1eX20N7h?=
 =?us-ascii?Q?d9XXCX4u73tSbAxR/Lhdq9NeP9Fa5tpNVpCganoJhzSNm3G6dCRcwrnn3Dju?=
 =?us-ascii?Q?GnOf6Vx3wA/djBDDVcB+936wPsIQ0WvSkvGVF5/95Qkoyc0BFpTX5tXqLe+B?=
 =?us-ascii?Q?3C6Wx0NbHXkrkVuteVrQE9jCR9ty3o9JVxLqap7mK7y7APDtaiQi/fJ1G/c1?=
 =?us-ascii?Q?TvwblYOvFvxQvUc0qNOZs938jQIEpM8XHccurWsK78Tu1BD986p3Tdi3hhL5?=
 =?us-ascii?Q?UHbWFPAQQuJh/HpGqphGJfuqD573erhzazsP/Xzmz0Gj8nGeKaKVYdPW7Z5e?=
 =?us-ascii?Q?Gd6dtVbcBWeCfmkO/JVq9jVISFF0MwgokGHOKIe3/O/f9BWEcx59jbOezEVo?=
 =?us-ascii?Q?WJBc/HLu1sPNfWLYlwy120btvezwySyEKuQOm2FBa48lJrGn0+8AMSy9g6VX?=
 =?us-ascii?Q?NfSeEvU7LMqLwVqNVtM/ke/If3h45Fo2OTcmr+TWoKJMptUDlaBNOpeVPrnO?=
 =?us-ascii?Q?Tgs8K8lg3MLvtJccFlficY7zijlhOLgN7F0IPnGGcGv/wBVcU1bp/yEokYaR?=
 =?us-ascii?Q?7o6Ru88mYNe5ASfVod/kpn2aBIDLQNWcFTGlrCNukNsMRU5PTi6DDOrQ61cq?=
 =?us-ascii?Q?77KS2h62d2wB8hkM4J46DnXlyaUsgh3XjcCJAL9A3sT/xzR/LD/AQYS+FdLZ?=
 =?us-ascii?Q?NZHCusnPCAgA86mR48Ng/aBxN/ZojRx2MooTZrILfW/Qz6IHrmf8AlkHXrLL?=
 =?us-ascii?Q?QSsdVuzrcQ9/c0E75JTAL2nd+hSealEBpd8QR+m3aTLkj8iaZ8wtR3zTbqsK?=
 =?us-ascii?Q?UyO8GLJb7rqzNvLUow/Pr+AoP9hW/Oq62DfLK8GrPY++1fcfKk5ov8+1umt5?=
 =?us-ascii?Q?0c49x52X3rpV/VSjI3IxNx3oImb5gCPWZ9ejwz35yljCk60P94X6EmrtwClV?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: addbc018-c7d7-449b-f152-08dbd0c47195
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:57:14.2218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkUNhsTfrhizdx4PK9DbflmHn5dmSnRWhhAvWkQNENSam8DbHbu8SQHn5PWqkT55clBuuaZ5gqjSJndjQndCyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

On Wed, Oct 18, 2023 at 09:25:36PM -0400, Luben Tuikov wrote:
> Hi,
> 
> On 2023-10-17 11:09, Matthew Brost wrote:
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
> > v4:
> >   - Replace dequeue with peek and invert logic (Luben)
> >   - Wrap to 100 lines (Luben)
> >   - Update comments for *_queue / *_queue_if_ready functions (Luben)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 287 +++++++++++++++----------
> >  include/drm/gpu_scheduler.h            |   8 +-
> >  2 files changed, 178 insertions(+), 117 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 273e0fbc4eab..b1b8d9f96da5 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> >   *
> >   * @rq: scheduler run queue to check.
> > + * @peek: Just find, don't set to current.
> 
> The "peek" rename is good--thanks!
> 
> >   *
> >   * Try to find a ready entity, returns NULL if none found.
> >   */
> >  static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool peek)
> >  {
> >  	struct drm_sched_entity *entity;
> >  
> > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> >  	if (entity) {
> >  		list_for_each_entry_continue(entity, &rq->entities, list) {
> >  			if (drm_sched_entity_is_ready(entity)) {
> > -				rq->current_entity = entity;
> > -				reinit_completion(&entity->entity_idle);
> > +				if (!peek) {
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
> > +			if (!peek) {
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
> > + * @peek: Just find, don't set to current.
> >   *
> >   * Find oldest waiting ready entity, returns NULL if none found.
> >   */
> >  static struct drm_sched_entity *
> > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool peek)
> >  {
> >  	struct rb_node *rb;
> >  
> > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  
> >  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> >  		if (drm_sched_entity_is_ready(entity)) {
> > -			rq->current_entity = entity;
> > -			reinit_completion(&entity->entity_idle);
> > +			if (!peek) {
> > +				rq->current_entity = entity;
> > +				reinit_completion(&entity->entity_idle);
> > +			}
> >  			break;
> >  		}
> >  	}
> > @@ -282,13 +290,98 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> >  }
> >  
> >  /**
> > - * drm_sched_wqueue_enqueue - enqueue scheduler submission
> > + * drm_sched_run_job_queue - enqueue run-job work
> 
> Hmm... so this removes the change from patch 1 in this series, and as such
> obviates patch 1.
> 
> Do you want to go with "run_job_queue" and the names introduced here?
> 

Yes, I like the run_job_queue name here.

> In this case, we can have that in patch 1 instead, and this patch
> would only split the "free job" into its own work item.
>

Sure, so s/drm_sched_wqueue_enqueue/drm_sched_run_job_queue in patch #1?
 
> > + * @sched: scheduler instance
> > + */
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
> > + * @peek: Just find, don't set to current.
> > + *
> > + * Returns the entity to process or NULL if none are found.
> > + */
> > +static struct drm_sched_entity *
> > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool peek)
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
> > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i], peek) :
> > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i], peek);
> > +		if (entity)
> > +			break;
> > +	}
> > +
> > +	return entity;
> > +}
> 
> Can you shed some light on why you need the "peek" capability, i.e. to just
> see the entity without actually arming it?
> 
> In a single-entity scheduling, surely peeking at the single entity of
> a scheduler, can be done easier.
> 
> I'm asking as none of these functions were intended as a peek-only/-capable
> solution, and if you need it, this shows that the infrastructure lacks
> something which you need.
> 
> It's not designed for "peek", as you can see above: it gets passed-through
> the function stack until it reaches core functionality to be used in logic.
> 
> (It just makes the code too complicated with too many special cases, "if's"
> and if we keep doing this, it would become very hard to understand,
> maintain, and contribute to in a few years.)
>

This question made me realize that the callers of this function inverted
the peek arguments. Will fix in next rev.

The peek is need for drm_sched_run_job_queue_if_ready which checks if a
job is ready before queuing the job run worker. This is called from the
free job worker (hw submission count decrement makes a new job ready) or
from the run job worker (another job in queue).

If we want to blindly queue the job in these cases then this can be
removed.

Or alternatively we could remove the peek argument and blindly reinit
the idle when selecting entity. I think this fine if I am reading the
code correctly. If you agree, I'd lean towards this option.
 
> > +
> > +/**
> > + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> > + * @sched: scheduler instance
> > + */
> 
> "if ready" here makes perfect sense, but in the "free job" case,
> it should be "if done". See below.
> 

Yes, agree that if done for job makes more sense.

> > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > +{
> > +	if (drm_sched_select_entity(sched, false))
> > +		drm_sched_run_job_queue(sched);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue - enqueue free-job work
> >   * @sched: scheduler instance
> >   */
> > -static void drm_sched_wqueue_enqueue(struct drm_gpu_scheduler *sched)
> > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (!READ_ONCE(sched->pause_submit))
> > -		queue_work(sched->submit_wq, &sched->work_submit);
> > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > +}
> > +
> > +/**
> > + * drm_sched_free_job_queue_if_ready - enqueue free-job work if ready
> 
> This should be "if done". Please change this to "if done".
> 
> > + * @sched: scheduler instance
> > + */
> > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> 
> This should be "if_done". Please change this to "if_done".
> 
> A "job" is _done_ when it's on the pending list and its fence has been signalled,
> and we free a job only when it's done, not "ready".
> 

Agree on all of this.

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
> > @@ -310,7 +403,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> >  	dma_fence_get(&s_fence->finished);
> >  	drm_sched_fence_finished(s_fence, result);
> >  	dma_fence_put(&s_fence->finished);
> > -	drm_sched_wqueue_enqueue(sched);
> > +	drm_sched_free_job_queue(sched);
> >  }
> >  
> >  /**
> > @@ -576,7 +669,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >  				drm_sched_job_done(s_job, fence->error);
> >  			else if (r)
> >  				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > -					  r);
> > +					      r);
> >  		} else
> >  			drm_sched_job_done(s_job, -ECANCELED);
> >  	}
> > @@ -885,18 +978,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
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
> > @@ -906,43 +987,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> >  {
> >  	if (drm_sched_can_queue(sched))
> > -		drm_sched_wqueue_enqueue(sched);
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
> > @@ -974,8 +1019,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >  						typeof(*next), list);
> >  
> >  		if (next) {
> > -			next->s_fence->scheduled.timestamp =
> > -				dma_fence_timestamp(&job->s_fence->finished);
> > +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > +				     &next->s_fence->scheduled.flags))
> > +				next->s_fence->scheduled.timestamp =
> > +					dma_fence_timestamp(&job->s_fence->finished);
> >  			/* start TO timer for next job */
> >  			drm_sched_start_timeout(sched);
> >  		}
> > @@ -1025,74 +1072,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
> >  
> > -		s_fence = sched_job->s_fence;
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
> > -		atomic_inc(&sched->hw_rq_count);
> > -		drm_sched_job_begin(sched_job);
> > +	if (READ_ONCE(sched->pause_submit))
> > +		return;
> > +
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
> >  
> > -		wake_up(&sched->job_scheduled);
> > +	trace_drm_run_job(sched_job, entity);
> > +	fence = sched->ops->run_job(sched_job);
> > +	complete_all(&entity->entity_idle);
> > +	drm_sched_fence_scheduled(s_fence, fence);
> > +
> > +	if (!IS_ERR_OR_NULL(fence)) {
> > +		/* Drop for original kref_init of the fence */
> > +		dma_fence_put(fence);
> > +
> > +		r = dma_fence_add_callback(fence, &sched_job->cb,
> > +					   drm_sched_job_done_cb);
> > +		if (r == -ENOENT)
> > +			drm_sched_job_done(sched_job, fence->error);
> > +		else if (r)
> > +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > +	} else {
> > +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > +				   PTR_ERR(fence) : 0);
> >  	}
> >  
> > -again:
> > -	drm_sched_wqueue_enqueue(sched);
> > +	wake_up(&sched->job_scheduled);
> > +	drm_sched_run_job_queue_if_ready(sched);
> >  }
> >  
> >  /**
> > @@ -1159,7 +1215,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> >  	spin_lock_init(&sched->job_list_lock);
> >  	atomic_set(&sched->hw_rq_count, 0);
> >  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> >  	atomic_set(&sched->_score, 0);
> >  	atomic64_set(&sched->job_id_count, 0);
> >  	sched->pause_submit = false;
> > @@ -1282,7 +1339,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> >  void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, true);
> > -	cancel_work_sync(&sched->work_submit);
> > +	cancel_work_sync(&sched->work_run_job);
> > +	cancel_work_sync(&sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_wqueue_stop);
> >  
> > @@ -1294,6 +1352,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> >  void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> >  {
> >  	WRITE_ONCE(sched->pause_submit, false);
> > -	queue_work(sched->submit_wq, &sched->work_submit);
> > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > +	queue_work(sched->submit_wq, &sched->work_free_job);
> >  }
> >  EXPORT_SYMBOL(drm_sched_wqueue_start);
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index e67b53c3546b..625ffe040de3 100644
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
> 
> Perhaps a more descriptive explanation could be had,
> 
> 	@work_run_job: work which calls run_job op of each scheduler.
>

Got it.
 
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
> -- 

Thanks for the review.

Matt

> Regards,
> Luben
> 
