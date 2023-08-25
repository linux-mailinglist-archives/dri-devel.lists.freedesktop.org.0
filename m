Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816847888C7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1510E157;
	Fri, 25 Aug 2023 13:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3D010E157;
 Fri, 25 Aug 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692970675; x=1724506675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oFeRVZfoR9ZoymrgGesOcoeY0Nv4CsTxIB2uCuuYgp8=;
 b=AS/aKy4UAfgUtOyyeZeqg/j8kQaJ/Ixkg/IczLQ8qaOxfx9K0FOcwytI
 NNNvx1ct/wE0SvGNYgrJOp/hsU2dIr8zfKQLL6O2hg5QHjzbJPwdnGMe2
 DM5ejpubTP+UtFjxbKEEb9fYxIuzk7gIN/AuOdCIMoQFXeOKxjiOTAw1o
 FhFcx+HjMPgmiog8frtR3TCXCizjpY7iIv4W+RChsiOTBl4b4fIfnBLqM
 p94I15/o+6QdpxDVV0yTaXFNZcuRgcumX0Jie5rq2bPS+Pay6D6QUYYP7
 d+Dzqcwzt4YNrwNgglMOd6F8GJyMl4ic04+1XlVm9HlOFidpB2Gq50Djx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355042814"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="355042814"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772478066"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="772478066"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 06:37:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 06:37:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 06:37:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 06:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqKaqleGsJDT0cLrCAerp+ZXeFapEv+beYyTCy/pKunxnMa4Gb0/uFF5YkrKBjXFd1W3iRkgPCY+rBlyNnRj4skJ4hO2bjO8Srdg0F3EBOi4IAhSZ7zVibfmMo/+acYpQaLkMT554t2GVFNZE3qTGPxpzgmj7ss5hSxqjK7gNH5F/6zD4d8X5LxUdf54grQ9MfDICaBv2KpyriDZ0xK6YGf+sFH/NFuMpa627ftX5C9CEuZZIyhi9eHnmcqvaKz2wjm9DlwwAmf2a2+KJUay+vSqkMh4vQ+f+fDCaZUC9LVd5hH3l+7mdhFPejLTwQwjy0KxgAzuZ0RKpVhvw0tWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQSoRk2wRhWnQkT7HUiPMym9nkXuQJaDBggtFa/GeN0=;
 b=Zf4g6hTisiCO4Xj7Gk9TLILuKypgR1jGRBWCpz9dGXj6O71P1W3EZz+dLKlkc+8f//JBYPgnRgDkFphi0KJUvzecYCtwRI0y/tiA5dtsd2vu8HasHpPBMijoe513vKHLOgWE8uSBqxtloPG1QG/xkDX0yz3VlNARK8OxZvCkQc19MVmskF0ON7NXi7S08MIGMChNOwG4M4Pu4lDA2lInEh0QMkNaGL/A+x0vnEfNDC89Co79jml0h0PwoFZ24kaWa58/leeofJKfp/gx471mPtMC9CtAgK3WpH9SKd8RFIEEtiZxYtTjLG1YmhMAYKxUnugWhvF4HTp/7sCgxTTlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.27; Fri, 25 Aug 2023 13:37:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 13:37:50 +0000
Date: Fri, 25 Aug 2023 13:36:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ae84066-b690-1562-0598-4694b022c960@amd.com>
X-ClientProxiedBy: BY5PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f7e5f5-56f1-47c3-2213-08dba5707a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqPyoSa8Quvtfs8PssedIJxVROd9D6O6C1+U/arHHIEPDfR0i7dXz3H3n5aeF3TB+2x+d4OexZat8grOGbX1PZr4QFxZsc6qK1wORe+WNH315MlvzcfWSecGSDS1Cruo2VNb5j3VaAsSIEGI47t/LQXPhqlewUorII2Enxn5bNIVYkxKfKgN1O7EuiVj+nmfL3Kd+x5gV04liOZDIviAqz77RuJUQukee+a0YeJIlA5KilQ5rjREAByVMU5bYp5fzKTqzWHN5U8NcQVqtB2mX1jz0KggY+4itKJ9vU5TC2CmtF92FnTCcUafhfBYGUFPd3swDESmmiRReF+NXNOXVdPfyAg0Z8YLmOUp0+3RUyjalGakiNU3ZIpGsn4rAPVdJWJezEjAAtU6IdFCNDhtxLi/pgxnyMuai3r90UKOcH32JC56rM9oIBCzcdYwGcTVBsstjRI2i4OzrQgKMUdrPshzNsEDd2Le1U1TK4Ylsd+bewx4A5MxlD0RveoIn2Yq+RSe9WAC3T8dklus/g5f4zv8gPCYCJLNor7qcPhoSpMh8a9N9ifVl1m6De+aS4ev
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199024)(186009)(1800799009)(66946007)(6916009)(66476007)(66556008)(316002)(82960400001)(478600001)(26005)(44832011)(6666004)(38100700002)(41300700001)(86362001)(6486002)(6512007)(6506007)(2906002)(8676002)(4326008)(8936002)(5660300002)(7416002)(66574015)(83380400001)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wJzqYW3ZGF9ZaFwESaP33sSavd9ZuhPRi97EMuz86Njf60sBKfSKVG/mMj?=
 =?iso-8859-1?Q?EHn9Pcm9GtbmVnVNpALUWKOoW4QcLcaBmfamyx/Pb69mOyaxXnlEL9vbw7?=
 =?iso-8859-1?Q?tHq4vcnMCegKsVwUe0T/czRQjxTQBnX1swkDOSqW/WnzeoIlj2AT2As9Xj?=
 =?iso-8859-1?Q?DoMT1dkIMDg8sgWeZ7U24pb/zTXU9VZlypsqWCzR5BmMlPVf3pVOtMWfj9?=
 =?iso-8859-1?Q?X9FBP09cj5mAjc8WxnvutMCijVrkdssw8kGyWnf1JzxQZ7hHvjnPmmVKtK?=
 =?iso-8859-1?Q?N1EAG1O/1iy7ClxbkW8350CTnKUVSJzY0aCR6yXpHlHarkluGcCPuRttQb?=
 =?iso-8859-1?Q?tFM6l+ckMxen2C6gXLCKHCPX5LGeFnr8s2yaN2aE5jC45m0MfSvFWH0eP8?=
 =?iso-8859-1?Q?YsO2Wgn+PCsp0srOUCMHLgN3eHLE5TKhtShBYRN40KXIiRlQ3LwopkoD+l?=
 =?iso-8859-1?Q?aTw/5VsiRA0ERqDb/9HvZVWcbG3yU2JJOrgfeUO6zi/Oeo4DRfnTVjUfgo?=
 =?iso-8859-1?Q?c2ehYJpO1oJ3EOwwUmaaOoi+7Gc2ITD8+IdNEQh8nDPaAE2CtizuW5fOaW?=
 =?iso-8859-1?Q?nDi8rc+EzOXOvh5c27AbDY8ChlEXZQ27AgBzrcUV/6e/8QFAoreKmjoxue?=
 =?iso-8859-1?Q?bccm/QM2kcjpe8BXkdvMhDupjcxWD64eC0kPqJri5FIoyK9DpJ+j5d1g7E?=
 =?iso-8859-1?Q?ukMqVYp2llBq/0RloxbL0xghhiHTv8mrsNQr9Lqo45XUt/Ei0dvejq6i9h?=
 =?iso-8859-1?Q?T9hNp/Lp/Qdbk8DNA8zsvAEJc9UWTMI5HEZPTkqR6GPMDD+Uw80IjLzidL?=
 =?iso-8859-1?Q?MUEo+PocMsKuiaMX5F0iKiURAWhzPOF51uPbeaaBm+BNkuCdJb6KTFV/qc?=
 =?iso-8859-1?Q?txteZSZ5RHAOYzDu74hQbaaBfD5BK4jgemQSDM3vGCXj3D2IVgsxWxcIgQ?=
 =?iso-8859-1?Q?4TjkW164XcRex5KpeauUQ2YUpybhuhBqk3mBExtwj7NT7KsovrWlx7CuJ9?=
 =?iso-8859-1?Q?DD2F82nRaLLBoDGwdnSCLtq5lwNS10t/Py8oewleBMyAgt80989NUxx4q4?=
 =?iso-8859-1?Q?ry/bCGSC0fH8q4+FaPpUNZWeXR5WehhWeQToiXiXfITtW4GaxEzO5cv9FF?=
 =?iso-8859-1?Q?wpQ/VNHkO95p33VVCImFAKgTLZWwVrIqZtyOSrJfCnnJxaH0+1636rF6M8?=
 =?iso-8859-1?Q?oP6LYt3iw3Nt9U3gpMVlLfws0c6KYu3kBVkFNE52enveUuthV0hx6ODGA9?=
 =?iso-8859-1?Q?Zjgv+VbMZF6dwovTe9iLPiS7cBiiDE+IyDJa4FM0OZHTc8tlL+hVKXxSr4?=
 =?iso-8859-1?Q?GNry0KWIYOLOLYrpI2ofxtWA/pJaXGydk455tD83Q64zsYGIJHquwjrF9c?=
 =?iso-8859-1?Q?5SjfQAWQ86EXyXXCnjHRPezQCtXDpsAzIWZhZctZlhX3TnDNJHYLbkSEhP?=
 =?iso-8859-1?Q?K5x9AlY87INw1ew/OxwNECUevBvJWP+qsJlRVXuead97N4xc0P2OmrQ9JH?=
 =?iso-8859-1?Q?A9cEoeyuaTvNty0Fo3WH9YHmsDGfCdBIytWY6+YWba/H9AlkKb+Q8044jS?=
 =?iso-8859-1?Q?Myrl2hgTRz0MWO4li8w6rdnFqmZSTgjP4BX17INvu6KxLiMYap5+/p3iQ4?=
 =?iso-8859-1?Q?bQ/praQYIZzCqJ/hQglozzaDjPOytf1X0tOxR+w4lHyaadW/OySpLsXA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f7e5f5-56f1-47c3-2213-08dba5707a00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 13:37:50.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWsSnN0V44/VCVqbQteRv535X6occOpMOMqSvDmX48hWITdRBaTWhjr7UZcLaAyHZXouCWL3faKS8BcyIEmNNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 10:02:32AM +0200, Christian König wrote:
> Am 25.08.23 um 04:58 schrieb Matthew Brost:
> > On Fri, Aug 25, 2023 at 01:04:10AM +0200, Danilo Krummrich wrote:
> > > On Thu, Aug 10, 2023 at 07:31:32PM -0700, Matthew Brost wrote:
> > > > Rather than call free_job and run_job in same work item have a dedicated
> > > > work item for each. This aligns with the design and intended use of work
> > > > queues.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
> > > >   include/drm/gpu_scheduler.h            |   8 +-
> > > >   2 files changed, 106 insertions(+), 39 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index cede47afc800..b67469eac179 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > >    * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
> > > >    *
> > > >    * @rq: scheduler run queue to check.
> > > > + * @dequeue: dequeue selected entity
> > > >    *
> > > >    * Try to find a ready entity, returns NULL if none found.
> > > >    */
> > > >   static struct drm_sched_entity *
> > > > -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > > +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
> > > >   {
> > > >   	struct drm_sched_entity *entity;
> > > > @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >   	if (entity) {
> > > >   		list_for_each_entry_continue(entity, &rq->entities, list) {
> > > >   			if (drm_sched_entity_is_ready(entity)) {
> > > > -				rq->current_entity = entity;
> > > > -				reinit_completion(&entity->entity_idle);
> > > > +				if (dequeue) {
> > > > +					rq->current_entity = entity;
> > > > +					reinit_completion(&entity->entity_idle);
> > > > +				}
> > > >   				spin_unlock(&rq->lock);
> > > >   				return entity;
> > > >   			}
> > > > @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >   	list_for_each_entry(entity, &rq->entities, list) {
> > > >   		if (drm_sched_entity_is_ready(entity)) {
> > > > -			rq->current_entity = entity;
> > > > -			reinit_completion(&entity->entity_idle);
> > > > +			if (dequeue) {
> > > > +				rq->current_entity = entity;
> > > > +				reinit_completion(&entity->entity_idle);
> > > > +			}
> > > >   			spin_unlock(&rq->lock);
> > > >   			return entity;
> > > >   		}
> > > > @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
> > > >    * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> > > >    *
> > > >    * @rq: scheduler run queue to check.
> > > > + * @dequeue: dequeue selected entity
> > > >    *
> > > >    * Find oldest waiting ready entity, returns NULL if none found.
> > > >    */
> > > >   static struct drm_sched_entity *
> > > > -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > > +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
> > > >   {
> > > >   	struct rb_node *rb;
> > > > @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > >   		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> > > >   		if (drm_sched_entity_is_ready(entity)) {
> > > > -			rq->current_entity = entity;
> > > > -			reinit_completion(&entity->entity_idle);
> > > > +			if (dequeue) {
> > > > +				rq->current_entity = entity;
> > > > +				reinit_completion(&entity->entity_idle);
> > > > +			}
> > > >   			break;
> > > >   		}
> > > >   	}
> > > > @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> > > >   }
> > > >   /**
> > > > - * drm_sched_submit_queue - scheduler queue submission
> > > > + * drm_sched_run_job_queue - queue job submission
> > > >    * @sched: scheduler instance
> > > >    */
> > > > -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
> > > > +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > > >   {
> > > >   	if (!READ_ONCE(sched->pause_submit))
> > > > -		queue_work(sched->submit_wq, &sched->work_submit);
> > > > +		queue_work(sched->submit_wq, &sched->work_run_job);
> > > > +}
> > > > +
> > > > +static struct drm_sched_entity *
> > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
> > > > +
> > > > +/**
> > > > + * drm_sched_run_job_queue_if_ready - queue job submission if ready
> > > > + * @sched: scheduler instance
> > > > + */
> > > > +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	if (drm_sched_select_entity(sched, false))
> > > > +		drm_sched_run_job_queue(sched);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_sched_free_job_queue - queue free job
> > > > + *
> > > > + * @sched: scheduler instance to queue free job
> > > > + */
> > > > +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	if (!READ_ONCE(sched->pause_submit))
> > > > +		queue_work(sched->submit_wq, &sched->work_free_job);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_sched_free_job_queue_if_ready - queue free job if ready
> > > > + *
> > > > + * @sched: scheduler instance to queue free job
> > > > + */
> > > > +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> > > > +{
> > > > +	struct drm_sched_job *job;
> > > > +
> > > > +	spin_lock(&sched->job_list_lock);
> > > > +	job = list_first_entry_or_null(&sched->pending_list,
> > > > +				       struct drm_sched_job, list);
> > > > +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> > > > +		drm_sched_free_job_queue(sched);
> > > > +	spin_unlock(&sched->job_list_lock);
> > > >   }
> > > >   /**
> > > > @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
> > > >   	dma_fence_get(&s_fence->finished);
> > > >   	drm_sched_fence_finished(s_fence, result);
> > > >   	dma_fence_put(&s_fence->finished);
> > > > -	drm_sched_submit_queue(sched);
> > > > +	drm_sched_free_job_queue(sched);
> > > >   }
> > > >   /**
> > > > @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
> > > >   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > > >   {
> > > >   	if (drm_sched_can_queue(sched))
> > > > -		drm_sched_submit_queue(sched);
> > > > +		drm_sched_run_job_queue(sched);
> > > >   }
> > > >   /**
> > > >    * drm_sched_select_entity - Select next entity to process
> > > >    *
> > > >    * @sched: scheduler instance
> > > > + * @dequeue: dequeue selected entity
> > > >    *
> > > >    * Returns the entity to process or NULL if none are found.
> > > >    */
> > > >   static struct drm_sched_entity *
> > > > -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > > +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
> > > >   {
> > > >   	struct drm_sched_entity *entity;
> > > >   	int i;
> > > > @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> > > >   	/* Kernel run queue has higher priority than normal run queue*/
> > > >   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> > > >   		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> > > > -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
> > > > -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
> > > > +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
> > > > +							dequeue) :
> > > > +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
> > > > +						      dequeue);
> > > >   		if (entity)
> > > >   			break;
> > > >   	}
> > > > @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
> > > >   EXPORT_SYMBOL(drm_sched_pick_best);
> > > >   /**
> > > > - * drm_sched_main - main scheduler thread
> > > > + * drm_sched_free_job_work - worker to call free_job
> > > >    *
> > > > - * @param: scheduler instance
> > > > + * @w: free job work
> > > >    */
> > > > -static void drm_sched_main(struct work_struct *w)
> > > > +static void drm_sched_free_job_work(struct work_struct *w)
> > > >   {
> > > >   	struct drm_gpu_scheduler *sched =
> > > > -		container_of(w, struct drm_gpu_scheduler, work_submit);
> > > > -	struct drm_sched_entity *entity;
> > > > +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> > > >   	struct drm_sched_job *cleanup_job;
> > > > -	int r;
> > > >   	if (READ_ONCE(sched->pause_submit))
> > > >   		return;
> > > >   	cleanup_job = drm_sched_get_cleanup_job(sched);
> > > I tried this patch with Nouveau and found a race condition:
> > > 
> > > In drm_sched_run_job_work() the job is added to the pending_list via
> > > drm_sched_job_begin(), then the run_job() callback is called and the scheduled
> > > fence is signaled.
> > > 
> > > However, in parallel drm_sched_get_cleanup_job() might be called from
> > > drm_sched_free_job_work(), which picks the first job from the pending_list and
> > > for the next job on the pending_list sets the scheduled fence' timestamp field.
> 
> Well why can this happen in parallel? Either the work items are scheduled to
> a single threaded work queue or you have protected the pending list with
> some locks.
> 

Xe uses a single-threaded work queue, Nouveau does not (desired
behavior).

The list of pending jobs is protected by a lock (safe), the race is:

add job to pending list
run_job
signal scheduled fence

dequeue from pending list
free_job
update timestamp

Once a job is on the pending list its timestamp can be accessed which
can blow up if scheduled fence isn't signaled or more specifically unless
DMA_FENCE_FLAG_TIMESTAMP_BIT is set. Logically it makes sense for the
job to be in the pending list before run_job and signal the scheduled
fence after run_job so I think we need to live with this race.

> Just moving the free_job into a separate work item without such precautions
> won't work because of quite a bunch of other reasons as well.
>

Yes, free_job might not be safe to run in parallel with run_job
depending on the driver vfuncs. Mention this in the cover letter.

Certainly this should be safe in the scheduler code though and I think
it will be after fixing this.

Matt

> > > 
> > > The job can be on the pending_list, but the scheduled fence might not yet be
> > > signaled. The call to actually signal the fence will subsequently fault because
> > > it will try to dereference the timestamp.
> > > 
> > > I'm not sure what's the best way to fix this, maybe it's enough to re-order
> > > signalling the scheduled fence and adding the job to the pending_list. Not sure
> > > if this has other implications though.
> > > 
> > We really want the job on the pending list before calling run_job.
> > 
> > I'm thinking we just delete the updating of the timestamp, not sure why
> > this is useful.
> 
> This is used for calculating how long each job has spend on the hw, so big
> NAK to deleting this.
>

Ah, I see that AMDGPU uses this. Previously just checked the scheduler
code.

The below patch should work just fine then.

Matt

> Regards,
> Christian.
> 
> > 
> > Or we could do something like this where we try to update the timestamp,
> > if we can't update the timestamp run_job worker will do it anyways.
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 67e0fb6e7d18..54bd3e88f139 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1074,8 +1074,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> >                                                  typeof(*next), list);
> > 
> >                  if (next) {
> > -                       next->s_fence->scheduled.timestamp =
> > -                               job->s_fence->finished.timestamp;
> > +                       if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > +                                    &next->s_fence->scheduled.flags))
> > +                               next->s_fence->scheduled.timestamp =
> > +                                       job->s_fence->finished.timestamp;
> >                          /* start TO timer for next job */
> >                          drm_sched_start_timeout(sched);
> >                  }
> > 
> > I guess I'm leaning towards the latter option.
> > 
> > Matt
> > 
> > > - Danilo
> > > 
> > > > -	entity = drm_sched_select_entity(sched);
> > > > +	if (cleanup_job) {
> > > > +		sched->ops->free_job(cleanup_job);
> > > > +
> > > > +		drm_sched_free_job_queue_if_ready(sched);
> > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > > +	}
> > > > +}
> > > > -	if (!entity && !cleanup_job)
> > > > -		return;	/* No more work */
> > > > +/**
> > > > + * drm_sched_run_job_work - worker to call run_job
> > > > + *
> > > > + * @w: run job work
> > > > + */
> > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > +{
> > > > +	struct drm_gpu_scheduler *sched =
> > > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > +	struct drm_sched_entity *entity;
> > > > +	int r;
> > > > -	if (cleanup_job)
> > > > -		sched->ops->free_job(cleanup_job);
> > > > +	if (READ_ONCE(sched->pause_submit))
> > > > +		return;
> > > > +	entity = drm_sched_select_entity(sched, true);
> > > >   	if (entity) {
> > > >   		struct dma_fence *fence;
> > > >   		struct drm_sched_fence *s_fence;
> > > > @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
> > > >   		sched_job = drm_sched_entity_pop_job(entity);
> > > >   		if (!sched_job) {
> > > >   			complete_all(&entity->entity_idle);
> > > > -			if (!cleanup_job)
> > > > -				return;	/* No more work */
> > > > -			goto again;
> > > > +			return;	/* No more work */
> > > >   		}
> > > >   		s_fence = sched_job->s_fence;
> > > > @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
> > > >   		}
> > > >   		wake_up(&sched->job_scheduled);
> > > > +		drm_sched_run_job_queue_if_ready(sched);
> > > >   	}
> > > > -
> > > > -again:
> > > > -	drm_sched_submit_queue(sched);
> > > >   }
> > > >   /**
> > > > @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > >   	spin_lock_init(&sched->job_list_lock);
> > > >   	atomic_set(&sched->hw_rq_count, 0);
> > > >   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > -	INIT_WORK(&sched->work_submit, drm_sched_main);
> > > > +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > > +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > >   	atomic_set(&sched->_score, 0);
> > > >   	atomic64_set(&sched->job_id_count, 0);
> > > >   	sched->pause_submit = false;
> > > > @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
> > > >   void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> > > >   {
> > > >   	WRITE_ONCE(sched->pause_submit, true);
> > > > -	cancel_work_sync(&sched->work_submit);
> > > > +	cancel_work_sync(&sched->work_run_job);
> > > > +	cancel_work_sync(&sched->work_free_job);
> > > >   }
> > > >   EXPORT_SYMBOL(drm_sched_submit_stop);
> > > > @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
> > > >   void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> > > >   {
> > > >   	WRITE_ONCE(sched->pause_submit, false);
> > > > -	queue_work(sched->submit_wq, &sched->work_submit);
> > > > +	queue_work(sched->submit_wq, &sched->work_run_job);
> > > > +	queue_work(sched->submit_wq, &sched->work_free_job);
> > > >   }
> > > >   EXPORT_SYMBOL(drm_sched_submit_start);
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > index 04eec2d7635f..fbc083a92757 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
> > > >    *                 finished.
> > > >    * @hw_rq_count: the number of jobs currently in the hardware queue.
> > > >    * @job_id_count: used to assign unique id to the each job.
> > > > - * @submit_wq: workqueue used to queue @work_submit
> > > > + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > >    * @timeout_wq: workqueue used to queue @work_tdr
> > > > - * @work_submit: schedules jobs and cleans up entities
> > > > + * @work_run_job: schedules jobs
> > > > + * @work_free_job: cleans up jobs
> > > >    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > >    *            timeout interval is over.
> > > >    * @pending_list: the list of jobs which are currently in the job queue.
> > > > @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
> > > >   	atomic64_t			job_id_count;
> > > >   	struct workqueue_struct		*submit_wq;
> > > >   	struct workqueue_struct		*timeout_wq;
> > > > -	struct work_struct		work_submit;
> > > > +	struct work_struct		work_run_job;
> > > > +	struct work_struct		work_free_job;
> > > >   	struct delayed_work		work_tdr;
> > > >   	struct list_head		pending_list;
> > > >   	spinlock_t			job_list_lock;
> > > > -- 
> > > > 2.34.1
> > > > 
> 
