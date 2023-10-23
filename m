Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBA7D388C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 15:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B410E1EA;
	Mon, 23 Oct 2023 13:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2A510E0AB;
 Mon, 23 Oct 2023 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698069372; x=1729605372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W+tQ44yxzLiqzgXLJt+lnE+qQgGuc0eQrb7v0Jopah4=;
 b=j1kzDmMcrJhfwaXO0N5yknJ+GIgnljbo4Er+odWnzxRLTa3CxVbuLcU+
 f+NUFSuZfnLbVpL95/QHKfrmK+JjUQ1BZWXXAAcgbqivQDCWWCNtKRB5D
 8VrCbia4sXylR077+vdkbxKLyn0f3ziUO/j62qD9tj01JyBPd7Y5x6BgQ
 l0tZJE4CFId5fBQdCoC3IedzSlRcaLLTD7ONN8S9/IfUFukBSkbdUsm1G
 7hpKQwG/CVWfSm3hkWW1hCqlf3IWwto8xROUz52yYWQETUPCSTMM9pWqn
 ZOMPrRJkrCjijqdz/uzft+jcWYml9PnPs/JJ/E6fySWvgywqPDbnV/SI7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377223335"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="377223335"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 06:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="874709437"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="874709437"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 06:56:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 06:56:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 06:56:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 06:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKBYa0G6SDrA5cUUyYfYFcLmNIttm8U79UerVDAJ+OUlg132jmEo7os2NlOXQjy7N70Q26SCDi9Hk90Y+HUS25pCGxiN1rFD4zx+yIuxmuHmHMVyn1VvFt3zDTk+bGP5cP5jN4SbtTOlryCH2gkotoi9jsYpbCESepe0nx5EeCPRv8soIJ4vaH8hJxO/7eafRi22jjVeMmzA7TRHQkcz2VQinxz4T1TIAtLc7uo6G7kgZFMJDPy01zqvaZ0ZL0lhJ6V71suWEYTI0rIlAPYIZD6XBD4zd+CMX163UxoQPnka0r06zmhEtijRffgI6xXlto9IoU+ZA/Imti8X+HQnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEYUmtRaKHtS28SKBGq3n6fz3S+QM6cnwTcobmtAqZ0=;
 b=bOBYlb8Xfgt2Br9LybUPJ1uEgxu//bD8/x1tMweJsiKlUFg85bqtUi1/4ny5U96f9qBHGpLYozz8R1YjV3WwrU/7S7g0YgdcsH9TE17aWaQ93gnAcAe2GDHSZpObIft36gSxT1pBQRQ8s9d24RJeHUVCnP0R8WWzl3elB6dkHgWIqmvlQB/rODaB1wRpUBEOKdVfXmJW2QTawdjiNl8pg1WIwkh+HOxg8Gwal/NmvTRXg6F6lmp9P3F9ptwZOo4tv2aOHGBzL93gMo7/jII93433udVKW0BEq2tLitinps7zeacpWzYZOGjJ3L7f0dja4GA2FcgPZ13jsJwZws1cSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 13:55:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Mon, 23 Oct 2023
 13:55:43 +0000
Date: Mon, 23 Oct 2023 13:54:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Message-ID: <ZTZ7BR5/QDbgnNwi@DUT025-TGLU.fm.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
 <20231023141606.3dd53c39@collabora.com>
 <20231023143937.66f31eee@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023143937.66f31eee@collabora.com>
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: b4be4325-1d49-445a-465c-08dbd3cfbf5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9x3MRQfccp9gwHvlcT93IFeDDcNQlBveo0R9BgZ4rkrZSHZlQ+M8r2E6ET9if5I38Fi68kEql5ONZgIsW0cEbzScglTxnvqNwYF97ZfTWMkzT3gRujO0S6sGi9lQFR2U6L0/+w8fsBDXyZ6RhvURaR39bc4HXuMKSXBLGG9mHUoXrpG1oM5XnR/YiBS8pb4crRAnSjujXVQ5pZcwwIg5ujhnbkm97fzNnPTLUGZ6IXUyUoSFykvWg7C3bKJDQnddGUvSYwPhYpKZZY3ESxdw320mSesjME0WDanZNAn1EJ4S8HxPv5nHUhoX3MNoaZ8TDelk6+EQVo2/U2P4r4svM7kMwQ0JVdWbIvOph/PH/noDl81uDBDsVDlVHr2z7totXUazVWjlQ2lrF6a+J4EA1AyCmS6ZcYriJuwT9f8fNr9ijrBAcezLPGNdnAaAW/loRGYGMKTMFSjm/MIxIt+rGBCPuEGJuIABwEvDNKTwSRbGsyiXYV8qukU6KL6J+wPruBDHf2P0Nv1wL7DlPfi7ArQr628y/UOnto+noum+xC+knFteLLpfR7PrCrRaGiqB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(38100700002)(41300700001)(316002)(66556008)(6916009)(66946007)(82960400001)(66476007)(6506007)(6666004)(478600001)(6486002)(6512007)(83380400001)(44832011)(7416002)(86362001)(5660300002)(4326008)(8936002)(8676002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFLRMdODQmGSJ6zFMu3Gh2V4L+Quh/92hbAhOXFyfAZOvxsr+GBVpJNBQkYZ?=
 =?us-ascii?Q?DVXaMqrL8tFK9+4oShWaMWSnO4G44Z9cZHV7/NDvDa+m+YMe1GGn4W+s+C/g?=
 =?us-ascii?Q?mFLI4mXsm30lEZ2dAh3xqowbZmYdTn6XhS6VW16loCgpJmt3dHO8ElID/ggj?=
 =?us-ascii?Q?kRtx5FexQfVWuWIHVPj5IhjC3+aKV5hfd20dcqX0nOE75VJIfhc35XesU4aM?=
 =?us-ascii?Q?v91MOU968PG/ikFu7odWVfjwLj6YuX7qaFVYcAysLVmZb+o+h0he4UX2BFMy?=
 =?us-ascii?Q?NXbOzbx91ktm5z0kJa3rMAS7nuJbuk4m1D8ygl3rRC8F8X9e3HjC2wgx1uNC?=
 =?us-ascii?Q?mDIq4cVadyv3ROKqBKiVdSs7zssa8pYE42rYKzhycS1SnNCuPt1c7PwaGs83?=
 =?us-ascii?Q?B4Sau7pvYxOUeDt4oqOz8fDco/6FcJx1sKsMwVLq5JIwOGqhT/39BsTviFFx?=
 =?us-ascii?Q?xBaCaftKr1YBjfke0McMku2g/s6JroIc85EoCgs36Fwi2xL3TWKbMugEXx1C?=
 =?us-ascii?Q?M3pmef0X6XWKHaLCABZg3UI8fiREb82mjm7ZSYYtbpZmNfVc2d2x64InAavL?=
 =?us-ascii?Q?FFja5UrXGLik0Bv1PIHiMoqnrxu1AOsmidNCIYNhRGRZ6Z3nX8BlOETQgVgO?=
 =?us-ascii?Q?HWHjczG2bgdsAvRNFYSIM4MH1hmlT6C8ngoNsAsrD8WuBIvGVCRlXCD14oG+?=
 =?us-ascii?Q?OpZdHH6IXento0N6hj1En1hgK33EGa+6mI0UdaZttXxVmhXWGJJuAlAWOv74?=
 =?us-ascii?Q?tQX3i7BORwstYl7c+f8y5mFC/vBaa+mIEEa5RTH7IvbnVIRYimaDz0QEHM0n?=
 =?us-ascii?Q?AOrN/MqkgYeSRXLq3uDzOIs4h8fhOYCvsltKSr6szwwaT9gjJGLfxaONFmXT?=
 =?us-ascii?Q?Cz9UMHEivVmzPEFddri3C+2EcFyflBLsHkldetTTbmMfhdcv8Z76pmpPaROE?=
 =?us-ascii?Q?eT2x4P6XS8KCuU2Ihj2BXa9YO33Vmh9zIsPUAira4+/6wITXpuNDK84QfZb+?=
 =?us-ascii?Q?iezw2+bno1vXCJOrF5/HbJziwO5cA44iCl/zzuydO4j0H/RE7O0lDo/fzXxv?=
 =?us-ascii?Q?y+BonQyhjQu/Wc5auziDUtM+qN2A84X2bfxhJLR1D1aWoZ6q+RYTlB64GCg1?=
 =?us-ascii?Q?9aNFJ9VjJuiCae6v/FkgFuf8MAHpRVB9HCGCRAXEG53PgsvBLhqetz8GZnOS?=
 =?us-ascii?Q?7Fd1asVLr4qSMyDr7KeoQ60P+RtlQ62hQsNeeTrdeuR2AFofI8K4lnkqQXks?=
 =?us-ascii?Q?auiejqvolPO3imSaUNoNHsqhYDaL5RDjzkutKkFqhfjfNiupk0z6prUnV/Vm?=
 =?us-ascii?Q?7RPEaA4Y4/MnzUCCA5u+xKncS//jBcw3GQ5XNtzW4NnYHMY+4tm4KHS+7gx7?=
 =?us-ascii?Q?4Okrshx0kVoayYKtS1aQzJ9qyzTpyclD8G95gYVPsInq1uduwnb9OIbHGCnM?=
 =?us-ascii?Q?beyAuZ7zUTb7qDdAisemcM8i6K4bEFkpw8d0rB+6SWfLEiv7dLcynCHmPVJP?=
 =?us-ascii?Q?qfTGqQBWVRs8UpvnEV7REqPvwSjkgUiJ6K9hXl6K2cezkJWUM8pp92lRGTkC?=
 =?us-ascii?Q?QpdtxmUgcqSOcTSGdzTo6QVKNH9ph7wpKIlC6Xm68QLVZruFxkzTa4nrv1Ka?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4be4325-1d49-445a-465c-08dbd3cfbf5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 13:55:42.8356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6aIQvEbU8tlGBaobVhOx5MIdkmIxsnW3qUSazFwZkvCwxSJsY8Hi9pF5systdQrly5WCPWwdxPcEJ75hRR44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 02:39:37PM +0200, Boris Brezillon wrote:
> On Mon, 23 Oct 2023 14:16:06 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Hi,
> > 
> > On Tue, 17 Oct 2023 08:09:56 -0700
> > Matthew Brost <matthew.brost@intel.com> wrote:
> > 
> > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > +{
> > > +	struct drm_gpu_scheduler *sched =
> > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > +	struct drm_sched_entity *entity;
> > > +	struct dma_fence *fence;
> > > +	struct drm_sched_fence *s_fence;
> > > +	struct drm_sched_job *sched_job;
> > > +	int r;
> > >  
> > > -		atomic_inc(&sched->hw_rq_count);
> > > -		drm_sched_job_begin(sched_job);
> > > +	if (READ_ONCE(sched->pause_submit))
> > > +		return;
> > > +
> > > +	entity = drm_sched_select_entity(sched, true);
> > > +	if (!entity)
> > > +		return;
> > >  
> > > -		trace_drm_run_job(sched_job, entity);
> > > -		fence = sched->ops->run_job(sched_job);
> > > +	sched_job = drm_sched_entity_pop_job(entity);
> > > +	if (!sched_job) {
> > >  		complete_all(&entity->entity_idle);
> > > -		drm_sched_fence_scheduled(s_fence, fence);
> > > +		return;	/* No more work */
> > > +	}
> > >  
> > > -		if (!IS_ERR_OR_NULL(fence)) {
> > > -			/* Drop for original kref_init of the fence */
> > > -			dma_fence_put(fence);
> > > +	s_fence = sched_job->s_fence;
> > >  
> > > -			r = dma_fence_add_callback(fence, &sched_job->cb,
> > > -						   drm_sched_job_done_cb);
> > > -			if (r == -ENOENT)
> > > -				drm_sched_job_done(sched_job, fence->error);
> > > -			else if (r)
> > > -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > > -					  r);
> > > -		} else {
> > > -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > -					   PTR_ERR(fence) : 0);
> > > -		}
> > > +	atomic_inc(&sched->hw_rq_count);
> > > +	drm_sched_job_begin(sched_job);
> > >  
> > > -		wake_up(&sched->job_scheduled);
> > > +	trace_drm_run_job(sched_job, entity);
> > > +	fence = sched->ops->run_job(sched_job);
> > > +	complete_all(&entity->entity_idle);
> > > +	drm_sched_fence_scheduled(s_fence, fence);
> > > +
> > > +	if (!IS_ERR_OR_NULL(fence)) {
> > > +		/* Drop for original kref_init of the fence */
> > > +		dma_fence_put(fence);
> > > +
> > > +		r = dma_fence_add_callback(fence, &sched_job->cb,
> > > +					   drm_sched_job_done_cb);
> > > +		if (r == -ENOENT)
> > > +			drm_sched_job_done(sched_job, fence->error);
> > > +		else if (r)
> > > +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > > +	} else {
> > > +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > +				   PTR_ERR(fence) : 0);
> > >  	}  
> > 
> > Just ran into a race condition when using a non-ordered workqueue
> > for drm_sched:
> > 
> > thread A							thread B
> > 
> > drm_sched_run_job_work()			
> >   drm_sched_job_begin()
> >     // inserts jobA in pending_list
> > 
> > 								drm_sched_free_job_work()
> > 								  drm_sched_get_cleanup_job()
> > 								    // check first job in pending list
> > 								    // if s_fence->parent == NULL, consider
> > 								    // for cleanup
> > 								  ->free_job(jobA)  
> > 								    drm_sched_job_cleanup()
> > 								      // set sched_job->s_fence = NULL
> > 
> >     ->run_job()  
> >     drm_sched_fence_scheduled()
> 
> Correction: the NULL pointer deref happens in drm_sched_job_done()
> (when the driver returns an error directly) not in
> drm_sched_fence_scheduled(), but the problem remains the same.
> 
> 

Trying to understand this. I don't see how drm_sched_get_cleanup_job can
return a job until dma_fence_is_signaled(&job->s_fence->finished) is
true. That fence is no signaled until drm_sched_fence_finished(s_fence,
result); called in drm_sched_job_done().

What am I missing here?

Matt

> >       // sched_job->s_fence->parent = parent_fence
> >       // BOOM => NULL pointer deref
> > 
> > For now, I'll just use a dedicated ordered wq, but if we claim
> > multi-threaded workqueues are supported, this is probably worth fixing.
> > I know there's been some discussions about when the timeout should be
> > started, and the job insertion in the pending_list is kinda related.
> > If we want this insertion to happen before ->run_job() is called, we
> > need a way to flag when a job is inserted, but not fully submitted yet.
> > 
> > Regards,
> > 
> > Boris
> 
