Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5D7CACB3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 16:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C1610E1F6;
	Mon, 16 Oct 2023 14:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1A10E1F0;
 Mon, 16 Oct 2023 14:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697468335; x=1729004335;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/tGEAdbU2TWxS7Lfc2UO/7gDyMkTkgEFPzSLwh6rc5s=;
 b=bstWd/1anNaor5GF1HjXTLoFkswqzdmx7JthpgDzWu221/5agRh5GiNG
 8iiByWWkuIV5/ypzEKoEWpu7rL7naEDM6VW7/xb3NzmtjBAShJ6GGjziY
 QqgeMsFDDLa7crcCsmBVm/s1dvDzgqKoYEGfalWqbkH+k6uKEdQXMkK12
 SpAMV2Cxr/Sbw+NunIwVgGpdbtR6ovhJTf1UL4Jmu5kNmDwqNuoOMbJm4
 X4TBBnqPeVObVZ3JoHgcLViZ2mmvYWsyYXBO6Zn+5FEMMpePPu358UVBh
 YkF2GRsGQmj0XTh7EHZrQwGeHFojXFHmS+R+CbjiE4n/danqZRKnRg4pd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389406798"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="389406798"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 07:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3654067"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 07:58:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 07:58:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 07:58:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 07:58:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 07:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCR3j25FJrk2HDFaANfJFzlxdx87KOIT/fr9aauwYDCDcbtTUYGf4Md2JID3OkGvDwF57nQcWUiVN+hPwF567PdU4kSqYAIm0Tx70OpAwH73Wc8b5Gcn+PevQeQdf3LHep5/DlJNkxH77KG471lnKLxGeYzdliGHv7yTvLotOX4g3sYX23aFkvnik8BD3ZLbjbVY1u1LysFH6UDqXKIQrNCeBP3u0dNWvzvFSiFk4ut26Gzt8nleFb7nk4sXANItcieIaKGcC+B1EikV/bA5vmjwNqCqwWZjHEeoBc4emn45d/w/bnn7c51be2TQhSRc3rctnlUB+zJeafZlM60Fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/DWzAzeIc+7I9x3DdGteCYow5afVlsj2KMWNz5xAKs=;
 b=RhLRVTXeK2j4w/7BlnkbqArUrZGVM/YMQWrdj8tjoNrimmjZmEV3E9t/9a9EgOr/O8Nq5ljKWSsYospYZYqklv+UJ4oINxY0BfewMzKCdJPz06BzOtI9erRZVuQZL6Z0Gm9ucvytlPx0Sbda2WbxoYkafNbQ0YVkT2SoR83f+kl22KVEtQCMQb/ojjk5vIA2W65qTBGHeQmriXpEBZuypiB2uzIsxAKab8rPmtYtlcKaEQUMCHN8jFFf8SsgLeEq2L87sB2JobWrtO3edbHQMTezCiN1zcdFoWYz+bbuv7eYvEF70a0uRj4ovdTWSaSuDXVauL2gv4Z8HBBxua4Ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 14:58:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:58:43 +0000
Date: Mon, 16 Oct 2023 14:57:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v5 6/7] drm/sched: Add drm_sched_start_timeout_unlocked
 helper
Message-ID: <ZS1PTWsvr8DFNnLj@DUT025-TGLU.fm.intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-7-matthew.brost@intel.com>
 <89fe70c0-5fc1-4023-ba41-32ad130b72e4@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <89fe70c0-5fc1-4023-ba41-32ad130b72e4@amd.com>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5c0910-f945-48e7-d243-08dbce5863d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dlPh1RHO55FeMx6pMVCwtS/u/5NyPAz8ZW62Aex+f2GedrBZBm6xWk/W1Ollo3srhYL8fIDMy0KB6BPtJ49PeDAnQ8+diEgSLg9V3u/YQ2Zh+rhtsAvByDmBiPczOFlvyUWd2ebwUIUA4RI6UQT+04WG0yyWnAQZxaj+/oGGwUrUbwetbZaLVQQu8+aUruNqjXTom+FrYkgpcGhl4NNG9RULqVgS0QwWBlh6FJIBnOSp3SNf6lODAn15AjXBIwR86MtK5XGJZSODx+vWA+LwwxNrlZ1A0lIGJuDGIZtKOaE/ftyC+adc4jvBeQkiLrkiv8oi0Mp14RBSdcvnD8QORZ5rLBpIEfEmzWMKVvt95Uhq+IVxJZ2bPx9b/mAtsyjY9MDvVU399iZ6sOmPev7o/Qyzi1TmvXWFtrHIzqF9LUF0bQgPpej3+vVkaYEjc/aV9z/cfZyM0WJucvca7tMxpi3dhvOD33jxBffZcsOavbE0JR1pGNpcd46R0LuriDihniyA0YAbqQ/TjnGv6M867QOwqihIRgZLP3w58koyxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(478600001)(6486002)(966005)(66476007)(66556008)(66946007)(6666004)(6916009)(26005)(53546011)(6506007)(6512007)(8936002)(7416002)(4326008)(8676002)(2906002)(4001150100001)(44832011)(5660300002)(41300700001)(86362001)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+T0ytM2VqF6HarvxWQ5tkUl92yJ1/qMbSSOtYS/YNoWtQzGWa9HiS7Oq+iK?=
 =?us-ascii?Q?TLIlTnh/g3wtp0k0mmVLjcY5Zoj7Y2S8S6ObFHyNOQmVj8f5HTtlM/IeY5IQ?=
 =?us-ascii?Q?4ld7n4t/06l9yE1s+YyP5jEv6GbSu+4FivXj5+/I9GzW4oJgU9/FJCK/ogKK?=
 =?us-ascii?Q?05Yd+7iEg0xipuT3sIihB+jwjNpTNcop6juBvdQ+T6Kuc4G8RwSuGk4TQMH+?=
 =?us-ascii?Q?Ss64UxrzzHPHOq6+HE+2nGxlQxVukfrFmDexMLM084C3Speq8ZYzlLX2PczJ?=
 =?us-ascii?Q?6H4YFIM5JiNN/458GsqZeoUA+NEbz26p8Ef+hkIU005aKEl+GChX12NtuUR7?=
 =?us-ascii?Q?3QKZK/mibMB30/H2eMAIKOK7qa3FF4V++Uxiedq6gVDKxjwlerP3VZrlpZ9T?=
 =?us-ascii?Q?mNILE6FggA8n/tR6qpXwByfHF327y4/alwi3XnHcl/LdU1SSheb/E4N0NCRc?=
 =?us-ascii?Q?jrlySE38hCYsl9+9+e+cRAPLmylBhZBq1PRXMAgSDblmYXzaAg3+6EF0hKrY?=
 =?us-ascii?Q?TCc/w5wPcQd0qLsxUSp5yM4Wr50REbNecnM8iVT4yEYlKmZGhO/kR9B19qwk?=
 =?us-ascii?Q?ky3mg0QwTDFPVwdKyiLKAnWLHRqnUcAEp14rImeenYMEto32SqC/uJQ8Lq1t?=
 =?us-ascii?Q?0TIcynInlJxBjEL6YVFCfE1+acZLeIe67sfeKLm7B2wxLYoY4ThCuvyw2YBw?=
 =?us-ascii?Q?he2Ie5q2HGSGb+5BAym1fKGrOZPBOUml0RDpkDNZ3uaBeeZQr3GLkPHSGg58?=
 =?us-ascii?Q?gHMAG6QuqACx1jHYxwFaLX505DossM9WlZKmIcD+27IyvkZt/Dy1/cMM20ES?=
 =?us-ascii?Q?ChgJvYpPmDRaw8S37VdCW1SKN5yw32tsW/ZZEjUO8mvh7kllO2rX7bZPlSNf?=
 =?us-ascii?Q?Njg4epUFLwiJAtHcMq3VdXq7BQlF5fm/zyg1ONJ+ST4kDqeem+Uy0GeQLSVy?=
 =?us-ascii?Q?duhHx1WjwDFCLDj16g6BjtX3RcNtuzYQEPIWyGKV5GGIFwPK0ihKkoKzDOCd?=
 =?us-ascii?Q?56wlC2mdG2j1sdOZwIfeP1DZnep1u7yzItBI3Q/ma4jp7cMlheblYIM67oIv?=
 =?us-ascii?Q?tXwAb7NhOZwk0xY1o4FmnnD3aBOIsqVyZJS0D76WuRlzMvRlLs21Z4PrQcAj?=
 =?us-ascii?Q?KhFJYKvoaMUoKo8McF+lWXWz1wJFdg8QPdn9eLFvWi/Hcugp0kpPDsLX7iyA?=
 =?us-ascii?Q?JSypt8TVkkyD6q/ngiPAr251FRuYQp27D2QVZIo+lcrBxV8CCJSF8Fz0uyHc?=
 =?us-ascii?Q?b2EnCOmM6yPRPRTdvR18t94ZRGwuy23TOt0Qg2Yb6KuBfV0s2QEvN+66VdJU?=
 =?us-ascii?Q?bERqdPXKmN4t9qWiFyKGcsh7PrvUHbaEz9nhzewecEPHTKk9Z50v4SwIlpbb?=
 =?us-ascii?Q?ii/jZpiYKFSirw2ps4YBRkoqt9qde2JV9BKno4PUOhPZwGpTfQDJJ5MEPma2?=
 =?us-ascii?Q?z0+i5Y8T5bN7Lv0Q5FW4nM/Rg++wEnXrct5ea41e40E9PH/2iZQEr9d/tYo4?=
 =?us-ascii?Q?O1hMfwLb/06BR65F5TD1GTnuOnyba4i3a0cyEdms43RI+n+oAAGjtI3M5y7O?=
 =?us-ascii?Q?xBOZpMUnxU+jQTdgjH9V0Yihg/QrhrvbL8dO7GRGPTTGU6RwFBl/Jwz9cL2b?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5c0910-f945-48e7-d243-08dbce5863d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:58:43.2047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnbD2u0pVdsIWap7QzF0t3t+QI+qe6dN7+VT2UGGEH5Usey3inoq0PEjzHlMyjReUMYijC9P8OYVTa9C3jGw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
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
 christian.koenig@amd.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 10:52:22PM -0400, Luben Tuikov wrote:
> On 2023-10-11 19:58, Matthew Brost wrote:
> > Also add a lockdep assert to drm_sched_start_timeout.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> I don't remember sending a Reviewed-by email to this patch.
> 

I believe you did send a RB:
https://patchwork.freedesktop.org/patch/558222/?series=121745&rev=6

> I'll add the R-V to the commit when I apply and push this patch,
> after replying with a R-V email.
>

Is manually adding a RB ok if it is in the correct place like it is in this patch?

Matt

> Regards,
> Luben
> 
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index cf4c23db7547..c4d5c3d265a8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -427,11 +427,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
> >   */
> >  static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> >  {
> > +	lockdep_assert_held(&sched->job_list_lock);
> > +
> >  	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> >  	    !list_empty(&sched->pending_list))
> >  		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> >  }
> >  
> > +static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > +{
> > +	spin_lock(&sched->job_list_lock);
> > +	drm_sched_start_timeout(sched);
> > +	spin_unlock(&sched->job_list_lock);
> > +}
> > +
> >  /**
> >   * drm_sched_fault - immediately start timeout handler
> >   *
> > @@ -544,11 +553,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >  		spin_unlock(&sched->job_list_lock);
> >  	}
> >  
> > -	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
> > -		spin_lock(&sched->job_list_lock);
> > -		drm_sched_start_timeout(sched);
> > -		spin_unlock(&sched->job_list_lock);
> > -	}
> > +	if (status != DRM_GPU_SCHED_STAT_ENODEV)
> > +		drm_sched_start_timeout_unlocked(sched);
> >  }
> >  
> >  /**
> > @@ -674,11 +680,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> >  			drm_sched_job_done(s_job, -ECANCELED);
> >  	}
> >  
> > -	if (full_recovery) {
> > -		spin_lock(&sched->job_list_lock);
> > -		drm_sched_start_timeout(sched);
> > -		spin_unlock(&sched->job_list_lock);
> > -	}
> > +	if (full_recovery)
> > +		drm_sched_start_timeout_unlocked(sched);
> >  
> >  	drm_sched_wqueue_start(sched);
> >  }
> 
