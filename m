Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498967B9A30
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF210E070;
	Thu,  5 Oct 2023 03:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4DA10E070;
 Thu,  5 Oct 2023 03:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696476199; x=1728012199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Yq6COqp/ld+iOVIyXgYGpsoYvsybBZyrdjqsEPSNtc=;
 b=jPakepTxzMrJ9bewxLRD438gOUXNoxJ8BTRPg/LYvWK4DSf3iFE5C9lA
 Nt7NDezNyFNiEi4tqBFoN7M5rCz7DOH++swyq8ZWtDxROZBtnz9lrYoVp
 vOYdZHF9dZKrOH8LeDVDFBjqXl+KCXjIv+6TtqNnfVR/Y9mK8Xq+Sni+g
 qFY9OPnuvkXlskHFFa+AaHWpMFHB3DgKj5qo/BQoDHs9++vqwcimCyL5w
 6WAOvuUH5erZkU+F5FqnmmFDW9zZalf+0hxR3U4qxYuJgIqRseop8bqZJ
 q1C/TEH00JNa2DbHe0GrhAtV6AsJ1wMK6VHjHiZAaK+ZxQ771H2AlROUr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386214765"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="386214765"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842200770"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="842200770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 20:23:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 20:23:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 20:23:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 20:23:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 20:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqeXJzCOVlX/ByB9J/euDP7muWmvbPOtUamRj6R8jQcMDYk8Es48yiDbV576+QpOFz2RSu30mr9OEJebNyXkGhF3si+AJM6BHNpxndYGwI2Th0R+SgZ89yr+si+mnyrGEnVsliZHBHGNL54zpoAHvvyVJxoKxTGZq1Hfj37MNYExDId9lr2Tp2HMsJ/+I0bwD5OpmxY4bgmUddApwzNH82D9Umpi4MYZiWrAUEzvUEqGV7WNWonn0w1QFgWPv7QCrTlAnkw02bdlmtSBfK3OSOCM3lazxtrIRvhwKTVhHqhCOC3o+IU5UMtLn3mVuMeGx0Jgb5VYY4qrmj+X6cGWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ja583AyRJygbAV3MA6ihPsH5mzGnGcyE6tsE5ZbebM=;
 b=eCq24+fUv9gkUWTsD+tu8pxV+Bk3sQIUw8vkDN9FgxBclFXw8vWwcwx/zzA5I29l8MWnAfZ2NqRFHWQc2uWMpMBGFC4nCTULijYzewA63x5V2t4AhitVJiFGr/MizUa19TTYFsyA/9XFGOkL09C24wctYIZGJFdg/O4jZ0ayTHfff8VR/2uSeSroJ1o9B46k3AhgPc0GfbDR6/7hK+0zyNrO+LFyhrHo8T0haRuhU/0+oi2XiIODr9DxDal922f2caCg25/NoOAthTCQCpG/+NmfVFmzt5T5Z+cOdPyEfpVke342hRvoQRCD3XC1uK+WudNnqVYsejolEyfieJfUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 5 Oct
 2023 03:23:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:23:14 +0000
Date: Thu, 5 Oct 2023 03:22:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 09/10] drm/sched: Add helper to queue TDR immediately
 for current and future jobs
Message-ID: <ZR4r2RpI0njKy0Q/@DUT025-TGLU.fm.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-10-matthew.brost@intel.com>
 <53828798-3c37-46cb-a280-cb7c3efa1c24@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <53828798-3c37-46cb-a280-cb7c3efa1c24@amd.com>
X-ClientProxiedBy: MW3PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:303:2a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d48b2d-b4e2-4ba9-6701-08dbc5526896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCaRvVSqLZ4bamfV0gKeG8a8MCHJ36e+14S2EEEMVb1elgaefKXmNq4LRf4R8q4KRWXRe/FZDXN2q70o+RJTb5DXP30OBXnjb56rx3wBSlKKm8/NVUO1U2VDTnzZ/Eoj5FctPTeFztaCOB7fM7FJzLJTI4BYmuIyxkJmKpj+0RxarSx8CyRGZoVQLq+7Po1m2c6JGr1Z7EFhoUeH/Dpp0X8PwaSy2/hvN4kKU/Rvvw8Mx9A8SURYUQPe97Ad4dnv3gL9m4TFB1V1wJrOjeU7M2pVwi3ownxjMDA+ExmYl+Zx9U+0xy2VDxl3kpDfIwhrb9cq17qQYFihmxpozBgLZZ1wlu0RZGsupZ0MZ7EcrTNnHfLpEmG6cinP6NK+3DXzaM9ina70Fs8dLbreq1fKKIULs5s0POjdSHLR8uWBzaCgJSNL3K9wdgKnWchzzjlFFV7AVjoSdfKSJ3oNlipR8YvCsXr80gMk4wg8Rx98QZCoO3BvcsJkEvcjJdcdAK50jaF6qSOS8KAoIk711yQ2k6G5boWXicSeHJGcPG7VokT5n1LxkB1Hs4gz78bgCczjnFzEVvknOpVrNnwnT1iOb/RsMr2kZMIhJewRMN+Y1gM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(6506007)(6512007)(478600001)(6486002)(6666004)(83380400001)(26005)(7416002)(2906002)(44832011)(5660300002)(66946007)(6916009)(66476007)(66556008)(4326008)(8676002)(8936002)(316002)(41300700001)(82960400001)(14773004)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTL7Kd8AqpzaCohJg6potiDKHer2b/Tx5cZL5MpZGjFFaoYm7WafXPP4YLUl?=
 =?us-ascii?Q?llfsjlzzbCN1X5Rf0ATfAMAbiekU2SPOufqlywVK5tTV2ryHUq2r/u2zNz0Q?=
 =?us-ascii?Q?+j78FWsH0rbgKOvOwj7J4nJRdSda12+nEZ8/niUsg5O+F7VnJv36VQu3Y7X1?=
 =?us-ascii?Q?P1v9704PfLceeVUqBLaZtv4AWnz0iDu1AMgG/WVy76UvABoRTJK38pbLd7Bl?=
 =?us-ascii?Q?p+aj+KyvjBJDdGBAGkbbrVYuZsiIFlXXVUpakQ+d1rJEgfsE7Sv1Dla5H8R1?=
 =?us-ascii?Q?bNmpOi+9xjVO8FSqynNf7h8mze+9HEbfutSC77C/pGgK8gjyH9xpQXfRNyvi?=
 =?us-ascii?Q?8GrwuWXCBNO1oHh7ZDkmMUiwwoMsXT0PB7mZy7fEWnl4WzMF3dkHngoXDcKo?=
 =?us-ascii?Q?l1CQiyNqDZREIp/AY8RdifADJ0BAunlZ4grtcAxDk1AhXUHf5Furgq2sRkKu?=
 =?us-ascii?Q?OM1Vkw/429wH6O1KEdxfjYZwpsLLzLJ4vQ1nmld4TbDnlGrwwkKj95X8Evna?=
 =?us-ascii?Q?Ku7yx2MoWK0CTnG7bJbDOpJmnqa+rbDqJpTLmM2YOxZncHNWOLjrI+9JUgiU?=
 =?us-ascii?Q?wOmn0yQFhd1MogWHDY8n/UwWEaB6pUB7x06WiSOmKO7Zo2URMq01uyKcIMwW?=
 =?us-ascii?Q?Bb1kvup7fKSssPoTvPVKPe9PovKXw3TihjD8uuuoWjIczrBGXhk2nigLyF/9?=
 =?us-ascii?Q?7wONJkBUrg7SUhE0k0EVTVo7bwKlQsdJcBDLC6Aygz7NuBy+lO+W+wyFyziy?=
 =?us-ascii?Q?9PAso54oECpucQG7z8M20WtMzTNQ3OW0Ss3DYWyLYZHY70fbQsazSHuvAQI3?=
 =?us-ascii?Q?k5hLbT4hnrCc2XpExdDuzLh6cJEAjlz3GKxPRvgqnl2yH6uyXLvkb0hVmwwG?=
 =?us-ascii?Q?H4DLNkxE4PR2K585vsFMt1+B8TM2e75RstTCVlF6iUNJyBzQ3+Yrj7BBE0cz?=
 =?us-ascii?Q?1GhKd+UMWCqOm2gET9BjQTb/d17bBJ7mJR+rvLQf/OjpkcE9Jq2bUOj2Nwsu?=
 =?us-ascii?Q?rfumcIoF878wgFhfB/t03GCtThhExHzAOhw/4xDg+nsOOCgQ3rL+l81lifth?=
 =?us-ascii?Q?FjRGfalrgmLHe48Nbv9RSNr+eFi5t9bPAEVGzqB7DM545q+JOjNKzL9ToVdC?=
 =?us-ascii?Q?j4nEFtKkpSKyR/qONuMZv2g2efRbblbpjxmqVMgQ2pnafbrbtpnD3erYEh7V?=
 =?us-ascii?Q?Q6R4T6rGnwROpLBmxPdwT2F+4pN9LjnbncMu68BejpvH5WjwO3OL6pAntvPM?=
 =?us-ascii?Q?C02jj4X3L2RS/4HhNKOnJz4eyJlzMey29hlh62HY5RLWV7AT5sjbrnMvcbsp?=
 =?us-ascii?Q?UUU33oFAUlmUI/KTo8PnTEDczDa+ZBl0dNPD8ZsszgnrKTRBOcx8J0EaGSQA?=
 =?us-ascii?Q?U9JCv0aiLXTsiPOxAgVzKjZ7EjJ+ityrU5YzZzyWG8Fsj9/NW3WCGbtb1nDC?=
 =?us-ascii?Q?FlijLIcA8sGQthKtXDUmjJyT17MyuHoUhidJYFrkRfx08MIJUCfO1NQ+DdxV?=
 =?us-ascii?Q?oc/jjN9m76iLW7kJOqONTwVvY/AWndXeAI5WrOb0t1bLfji0qb+3Msm8Wb2k?=
 =?us-ascii?Q?JyZybobf58vlT4Fr/ulfOkcD+CtHqj2dNJO7aCTTfRDnav9nJH29cYvWS3ya?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d48b2d-b4e2-4ba9-6701-08dbc5526896
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:23:13.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ9qthknzMVM+AVSItWM6s6syKzikJ00tCO8DGqnVTfBH5PsyOloUyCD6pufcUbVJf28/C2ZvNnxrHmMWDxolQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

On Fri, Sep 29, 2023 at 06:44:53PM -0400, Luben Tuikov wrote:
> On 2023-09-19 01:01, Matthew Brost wrote:
> > Add helper to queue TDR immediately for current and future jobs. This
> > will be used in XE, new Intel GPU driver, to trigger the TDR to cleanup
> 
> Please use present tense, "is", in code, comments, commits, etc.
> 
> Is it "XE" or is it "Xe"? I always thought it was "Xe".
> 

Yea should be 'Xe'.

> 	This is used in Xe, a new Intel GPU driver, to trigger a TDR to clean up
> 

Will fix.

> Code, comments, commits, etc., immediately become history, and it's a bit
> ambitious to use future tense in something which immediately becomes
> history. It's much better to describe what is happening now, including the patch
> in question (any patch, ftm) is considered "now"/"current state" as well.
>

Got it.

> > a drm_scheduler that encounter error[.]> 
> > v2:
> >  - Drop timeout args, rename function, use mod delayed work (Luben)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
> >  include/drm/gpu_scheduler.h            |  1 +
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index e8a3e6033f66..88ef8be2d3c7 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -435,7 +435,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> >  
> >  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> >  	    !list_empty(&sched->pending_list))
> > -		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> > +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> >  }
> >  
> >  static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > @@ -445,6 +445,23 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> >  	spin_unlock(&sched->job_list_lock);
> >  }
> >  
> > +/**
> > + * drm_sched_tdr_queue_imm: - immediately start timeout handler including future
> > + * jobs
> 
> Let's not mention "including future jobs", since we don't know the future.
> But we can sneak "jobs" into the description like this:
> 
>  * drm_sched_tdr_queue_imm - immediately start job timeout handler
> 
> :-)
>

Will change.
 
> > + *
> > + * @sched: scheduler where the timeout handling should be started.
> 
> "where" --> "for which"
> The former denotes a location, like in space-time, and the latter
> denotes an object, like a scheduler, a spaceship, a bicycle, etc.
>

+1
 
> > + *
> > + * Start timeout handling immediately for current and future jobs
> 
>  * Start timeout handling immediately for the named scheduler.
>

+1

> > + */
> > +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> > +{
> > +	spin_lock(&sched->job_list_lock);
> > +	sched->timeout = 0;
> > +	drm_sched_start_timeout(sched);
> > +	spin_unlock(&sched->job_list_lock);
> > +}
> > +EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> > +
> >  /**
> >   * drm_sched_fault - immediately start timeout handler
> >   *
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 7e6c121003ca..27f5778bbd6d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list);
> >  
> > +void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> >  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
> 
> Looks good!
> 
> Fix the above, for an immediate R-B. :-)

Thanks for the review, will fix all of this.

Matt

> -- 
> Regards,
> Luben
> 
