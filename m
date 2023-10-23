Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC17D428B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 00:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5D10E280;
	Mon, 23 Oct 2023 22:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7459F10E059;
 Mon, 23 Oct 2023 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698098724; x=1729634724;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BFW3ciKvfeoCvqqFse3A5NKIcr3CH055ArX7R7gW2PY=;
 b=aack7ZPrG2L+FqRP/s6d5KwFNit1t6uI7hvsOS1KMSBjTA5enokLgKvr
 UHobMcxfTamah/qwiGGqlj7MeVowwUbMdROH+OV8mDpISuS7tfjcWEL92
 S4HN6wjc9N9s00RNivkWE4sfYe0Xi7giGtvu6F5tBFrjAV3TqFjn/dSS7
 amu0DbM4Uk7hLcebNJS7jYFHGouThN7/nlL9raLofTs0bLQw6QEedcDKS
 K7MC3j+3UcHAljjCbK7LHb73lfrMDowXY1cqteBNZp5IHf13guQ4TO03e
 2fF64kVlJ+tqfyanJ94vVHcHUvDhHwwT0qHQq6NlP3PPayHS8DKiCee0y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367167013"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="367167013"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 15:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708065718"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; d="scan'208";a="708065718"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 15:05:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 15:05:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 15:05:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 15:05:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 15:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWq9QNt7D9rsFRPaAvApRj2+BVnfc5fy6Fge4hStZ9O7AZost7NSZfcoUH7rvZ+3lXshfgt70Sb612rZNXwjiYvNePCBuZc6qhuNBdZleFFxyqjLCeUpZMDb2v2d/Mth1BvlQi8AIDkPSE539h1A5Eg840ji6/FeXb8EaMgTCVgMdZ5Oo35AXtCoodquTcbnQJ2vNtylDMieKEHlx8GA6jWLXqwlrWFVsrt16d5l7n/n3hws3hKIGGOnIdVtLGVdKPNy2/njSkk3QSVdVXGa6SyvNBFI14iuaOGfUQWqbgtOeNQp9FjC8AlTH8evjd+lO4HBsm3F/eBJiZOsCcztQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8voL4xNvyxBqcmN3wPgK/McFqFDq6qzSJEnI3IyzgQ=;
 b=XOsVUYPN8M+7m1F7y+AEdgny/Y2E+uCY35EQ0xaf3YzfibzUoOVC+YCOpH0q5WDvZxKCmJ1lLr8j38WDlvoDzeyc0Z7ff/0si/GvY9mKEvVmkmrDtKtRFRrPfSGdwibsGu4CwnWHL+c4LaODpf53SO8MPYTvyDDU2gS4/kQvFfgW1l6PAKMx9vzOqNTE2eHDgqJpIsUwKHKSDMzCkn7KWDhaskKhLas17lQXme1ycQGaxKD6itpY9RfGV8uLi2bFPrY5nNcqVSCDCCNlopXHtKcLeLzSpntD3n1gdFI4Z8FQAozVZRNAQpcM0Muh9hTIE1qHkz3rhA5nmWEZGN5nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Mon, 23 Oct
 2023 22:05:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Mon, 23 Oct 2023
 22:05:14 +0000
Date: Mon, 23 Oct 2023 22:03:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 5/7] drm/sched: Split free_job into own work item
Message-ID: <ZTbtv5boM8Dmx9Vk@DUT025-TGLU.fm.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
 <20231017150958.838613-6-matthew.brost@intel.com>
 <20231023141606.3dd53c39@collabora.com>
 <20231023143937.66f31eee@collabora.com>
 <ZTZ7BR5/QDbgnNwi@DUT025-TGLU.fm.intel.com>
 <20231023162216.132adc58@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023162216.132adc58@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4608:EE_
X-MS-Office365-Filtering-Correlation-Id: bccd0a50-5c43-44ce-73d9-08dbd41421f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+V+5vy8k/+1YnlzsFM74z9zKFNSlGyIE6Cv+hTK272AxgmxW+kM9MylWL5y/s8AHHXRWkpu6Oaro1BMsJch0gfN8vYADZeNehGPJQOF5BoTt3vpP/MgHtaYrHofCxGK8RmVaZa/yvyVYGJhPEfgwmXnF5Pv5Ju92Ax2OvU3+L/Jddso6+hQUAJChLB1Vl/F9RnXOx37SZ0wcmtRL0nzqMECnifVlPs34aEU1/SxtSCss+ddjueWvcVGAMD4cXULJNpCYVlCzi6QAQ7ahOJpA6uiD8ot7RK4CUwc0q2/vKIdnfTnSRM4cz5mY+JOW4F1FXpB0LMihHdRqAML+Qpx5/Dmc8zYWDgiRoqBS+dXoyV+gB9nBPrP5y7/wULmGjI+8g3Q8G4rFlcFDD73Eb7in/179UAsLkgxMbkzpGXRzZTNacMja5zvgZjYtKNAaJyNqPPIQBhHJ+uOjwQmofPAsOlvv4MSpoKMKy2W8cMDehpGybA6Vks62qRk3YFc3kB/Ruo3ZtNCf8RNioK0OyfWdHmDULfIV69LZNbluTOtfPScoZpuh8wf25Cl+ruNuwgx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(38100700002)(6916009)(66556008)(66946007)(316002)(82960400001)(66476007)(6506007)(6666004)(478600001)(6512007)(83380400001)(6486002)(4326008)(44832011)(41300700001)(86362001)(7416002)(5660300002)(8936002)(8676002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Avs21xazpK734XRTzy7qIx5nPruNZsNoAGq3xS2NRSX0omNXV0Vvso0EQ0Bt?=
 =?us-ascii?Q?RS5GAoYkvndP3y5QCUWkjqLgbFAsPoFtrners9p7RicMRbXWlUMbFKrangF8?=
 =?us-ascii?Q?PUQ8CKkdBgFuDg6WiD+0Zov6+iaRdIHnnMQbD2e/pCI9xb9vZBWKrXFM2tvi?=
 =?us-ascii?Q?U27bbUia4R9/iNAiF2y6lxUDVztV1CPdDBWhoDJnFDPrgpYErAuhOngfx3r5?=
 =?us-ascii?Q?EQPlGJYYH1aEH5is4oP42KR+PRhlPDCLB21nunCWnv3pwmAkW8biT+AEZ5sF?=
 =?us-ascii?Q?Z5ecFlQx96Vdlu8CR4NShQtUUP0TJ5nRj4HgTxAa9WuFuHfw1QoSuwoMXLNh?=
 =?us-ascii?Q?Dj91wP2I3t1h01qItjTVoMYWZXhcLzRczlbLxnpdQy9KyUoVS3Kb+Itdl3Dx?=
 =?us-ascii?Q?8+5HGUZblO3iVrSEMD53L9y3NTeOY7P296VIAWcXTKUyMmCIAotZOsBJ373B?=
 =?us-ascii?Q?dORuSXzaCOLQDVBRBjQV4Q5wLv2+46FCnB4SmZrScSleqewrkhpK140ydz29?=
 =?us-ascii?Q?2RATNHQAqwjNP2MjzDaCw0UyZakEDegCG4yFuIP4FBDflFOigh1TskhjOIQ+?=
 =?us-ascii?Q?nwwTwbMQHB5VJlmC9z2Y3JNN23TaGZUANvxXhhTO0BsWtY0b66GijHBp9VME?=
 =?us-ascii?Q?SeSgVt7TTIlAjOUSPFnFsmPr3rcqIl0YTeBT03rx0DExuJZCx0/0xp+Wo8YF?=
 =?us-ascii?Q?1PVpHFHbUjfjUfN5ABFh6VroAfI4e1aX0K/wbS5IdVSh995M8BCeJuHPLODp?=
 =?us-ascii?Q?3fCjyVrDYSRZz/0rjAIbFSBW2WXWqzcGjeCFInxv1zmhSEQ5fOsv4iiGHNZ4?=
 =?us-ascii?Q?xTf1uA9F7eRMq5wW/PgeDF0hVNisnrQiOP8xPgMo3oLP/DExotRXyHz8NXpD?=
 =?us-ascii?Q?2z6I3K87zSsg8D3ok8gmwmR3lBx4wYYSgoUhlspu3URurtb8MLYgiKBkSy0V?=
 =?us-ascii?Q?/KYnaYztVZZE4EQ21viKGk8fKRuFdg1214XNUlHOjNgWW4YKhBopbbzgyJ/F?=
 =?us-ascii?Q?YE4DpY2KMxOXlJ+L7Ekt6kUGdlrqeuFIVEWIq4EpZQmcMg30azhnjhHbWqZl?=
 =?us-ascii?Q?rLCOEkHMd0fFLIIA0k4sXcHeQfyAjrHcYE9iPATkFq9gBKqRFWwphoGb87lZ?=
 =?us-ascii?Q?1fJI53xt/ioteOhoRUJ2VOxkV/uYlNNYMm8Wit4ly3WaNfcMAKn8DmXWJBJk?=
 =?us-ascii?Q?dXujbTDlanLo5ofIqqqUx4Ct0z3bk2Tf0MKox9c/wFrIMSnTBVz6EkM6z8+h?=
 =?us-ascii?Q?/AXWNVpN+yKk74iycA+64PbPVAALvOt/Bf96oBYsQvyU/kck9OcRnJQ25y/I?=
 =?us-ascii?Q?rzMMCKFlsqDSB/scR/n2IMfkXbCtlULk8ygkxg3G53EPEYn6X9SlFkXlfpVk?=
 =?us-ascii?Q?IGmZtzVoZ9AAFdkTbEdwo3Pho6R2rNS81e+xTtf8Y0Ub+FyGY+0ct9Lw9RJU?=
 =?us-ascii?Q?MXjiZ8c77AuhTf2kdSRV5+Tqt7kc8FK6VQloF69134JRVpaHHQQ/C8brgMVY?=
 =?us-ascii?Q?y0sL2/iLUjnh4jprU5ppvgRTf5rUWzCYLMqqJOgPEfB5s728a6obzc5oaraH?=
 =?us-ascii?Q?TNSCMFeZQ15hm5rhzJvqqNzTwU/ABC5LvJ3lMJ4UohEQVunUG9tbQXpLJxxE?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bccd0a50-5c43-44ce-73d9-08dbd41421f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 22:05:14.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiG8Qrdxthk5WjUy1tU0imNDIn16NmMsyCZXaoJrlM5PDW2eu6RzEvS2oRCYg7M8auH5hyBihThwoOTrZ2yikA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
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

On Mon, Oct 23, 2023 at 04:22:16PM +0200, Boris Brezillon wrote:
> On Mon, 23 Oct 2023 13:54:13 +0000
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Mon, Oct 23, 2023 at 02:39:37PM +0200, Boris Brezillon wrote:
> > > On Mon, 23 Oct 2023 14:16:06 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >   
> > > > Hi,
> > > > 
> > > > On Tue, 17 Oct 2023 08:09:56 -0700
> > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > >   
> > > > > +static void drm_sched_run_job_work(struct work_struct *w)
> > > > > +{
> > > > > +	struct drm_gpu_scheduler *sched =
> > > > > +		container_of(w, struct drm_gpu_scheduler, work_run_job);
> > > > > +	struct drm_sched_entity *entity;
> > > > > +	struct dma_fence *fence;
> > > > > +	struct drm_sched_fence *s_fence;
> > > > > +	struct drm_sched_job *sched_job;
> > > > > +	int r;
> > > > >  
> > > > > -		atomic_inc(&sched->hw_rq_count);
> > > > > -		drm_sched_job_begin(sched_job);
> > > > > +	if (READ_ONCE(sched->pause_submit))
> > > > > +		return;
> > > > > +
> > > > > +	entity = drm_sched_select_entity(sched, true);
> > > > > +	if (!entity)
> > > > > +		return;
> > > > >  
> > > > > -		trace_drm_run_job(sched_job, entity);
> > > > > -		fence = sched->ops->run_job(sched_job);
> > > > > +	sched_job = drm_sched_entity_pop_job(entity);
> > > > > +	if (!sched_job) {
> > > > >  		complete_all(&entity->entity_idle);
> > > > > -		drm_sched_fence_scheduled(s_fence, fence);
> > > > > +		return;	/* No more work */
> > > > > +	}
> > > > >  
> > > > > -		if (!IS_ERR_OR_NULL(fence)) {
> > > > > -			/* Drop for original kref_init of the fence */
> > > > > -			dma_fence_put(fence);
> > > > > +	s_fence = sched_job->s_fence;
> > > > >  
> > > > > -			r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > > -						   drm_sched_job_done_cb);
> > > > > -			if (r == -ENOENT)
> > > > > -				drm_sched_job_done(sched_job, fence->error);
> > > > > -			else if (r)
> > > > > -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> > > > > -					  r);
> > > > > -		} else {
> > > > > -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > > -					   PTR_ERR(fence) : 0);
> > > > > -		}
> > > > > +	atomic_inc(&sched->hw_rq_count);
> > > > > +	drm_sched_job_begin(sched_job);
> > > > >  
> > > > > -		wake_up(&sched->job_scheduled);
> > > > > +	trace_drm_run_job(sched_job, entity);
> > > > > +	fence = sched->ops->run_job(sched_job);
> > > > > +	complete_all(&entity->entity_idle);
> > > > > +	drm_sched_fence_scheduled(s_fence, fence);
> > > > > +
> > > > > +	if (!IS_ERR_OR_NULL(fence)) {
> > > > > +		/* Drop for original kref_init of the fence */
> > > > > +		dma_fence_put(fence);
> > > > > +
> > > > > +		r = dma_fence_add_callback(fence, &sched_job->cb,
> > > > > +					   drm_sched_job_done_cb);
> > > > > +		if (r == -ENOENT)
> > > > > +			drm_sched_job_done(sched_job, fence->error);
> > > > > +		else if (r)
> > > > > +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> > > > > +	} else {
> > > > > +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > > > +				   PTR_ERR(fence) : 0);
> > > > >  	}    
> > > > 
> > > > Just ran into a race condition when using a non-ordered workqueue
> > > > for drm_sched:
> > > > 
> > > > thread A							thread B
> > > > 
> > > > drm_sched_run_job_work()			
> > > >   drm_sched_job_begin()
> > > >     // inserts jobA in pending_list
> > > > 
> > > > 								drm_sched_free_job_work()
> > > > 								  drm_sched_get_cleanup_job()
> > > > 								    // check first job in pending list
> > > > 								    // if s_fence->parent == NULL, consider
> > > > 								    // for cleanup  
> > > > 								  ->free_job(jobA)    
> > > > 								    drm_sched_job_cleanup()
> > > > 								      // set sched_job->s_fence = NULL
> > > >   
> > > >     ->run_job()    
> > > >     drm_sched_fence_scheduled()  
> > > 
> > > Correction: the NULL pointer deref happens in drm_sched_job_done()
> > > (when the driver returns an error directly) not in
> > > drm_sched_fence_scheduled(), but the problem remains the same.
> > > 
> > >   
> > 
> > Trying to understand this. I don't see how drm_sched_get_cleanup_job can
> > return a job until dma_fence_is_signaled(&job->s_fence->finished) is
> > true. That fence is no signaled until drm_sched_fence_finished(s_fence,
> > result); called in drm_sched_job_done().
> > 
> > What am I missing here?
> 
> Uh, my bad. I was trying to backport panthor (and all its deps) to a 6.1
> kernel, and the condition in drm_sched_get_cleanup_job() is different
> there:
> 
>         if (job && (!job->s_fence->parent ||
>                     dma_fence_is_signaled(job->s_fence->parent))) {
> 		// pick this job for cleanup
> 	}
> 
> Sorry for the noise.

No problem, glad this is resolved.

Matt
