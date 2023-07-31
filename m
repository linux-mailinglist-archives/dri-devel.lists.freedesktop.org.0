Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DB768979
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 03:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B58410E0A0;
	Mon, 31 Jul 2023 01:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7139410E0A0;
 Mon, 31 Jul 2023 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690765809; x=1722301809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Ox8ZpBkCxMZOwN81ttWMEM6Q0E2I5kFZvvbqGynO9Y=;
 b=C3fCMHB5AHNZ1Mh5Ib4pxTzLMuDNvAHJf/omfHEPqS1ABhfTq3PTV3/L
 vG2+pnsEApdzxlh2XLZo4MdpWd/mnUN15v/3VzstmO8QsIzcYGxy73Nqz
 qmR5d0dLX02Yee8+oZBIqMW1ot0kE7ORTVAN3bG3XG40NqTjRUu+w7oZF
 o1QZpvi5Ed5V/mngDOK5EZLYCXZMMwt7rXbirlxHWeB53xZhi5D/id0ca
 1pEiyFdEVF4r60Gbe0WGHAe5AybAQ13NQ6/GZemnE07eHHY93/myXnT0L
 bx58lCe3vRPhcAesYI4+ivjaTSrju7JdiG48H6e4lW/bLmMElOwVVw0MV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="399841415"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="399841415"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 18:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678142295"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="678142295"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 18:10:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 18:10:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 18:10:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 18:10:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 18:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feUxL/ZdJtXTPUP0AkKy2emL5Kem1+e28KpoeeWoWUm0Sm3h8lp1lVVMZ4q8OPz2FnQXdUq7b8k1Bw6mp6rIY7npTSQEFqYqyB7jXK7QqFR3eUdMcOsVoVAd49z1h5kxbQCMzzmgQe976i/X/7CW+7RvCxzAzRJZeuO/TK8m60MEza6DXdY7hA2HMj2mOp6xv34OoCZ5XP/SuY6yZdjUu6Uz95tiYFs1RWrii2yuHpOjIttpQaSbeWj+Ja7dZLa7tRj6mzyHVl4OrHdH+++K6oktYpPAFz+hxmCIzpGOibCNI7XNY9pCa6cmqv/fnYqAJlvtc+SwdAsmj55QEbCOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/Bu4sUlQxnu5MIhqgN7eL3qyVLqTYEKxVuArst/Iig=;
 b=LzyTpkxRdA4LG53IoD8Y3dUxZgG/NvQixR0anPtEtjBTdSZAK/GFIZFWjEq36zOuwRp9ka4J+1816jM6gyxnf0kEbg9TF7gFY0/QRKC+i4MI5604Eryf5X0D5gRogGCaSiIj7x1b3jb7NfF1A6iPupF742R3tCBlRxP+rrV85btyUqD3baSn0A3HgFOO+CdzKCkmfOi95BMHiPQTeUw0gi5JRVycTNPwUxdlkqSiiRiiG0G05lLGad3ZtR3bzi3Qqhw1IuFTQ+BsjCjmk0qVHdpXT30+PnbwTXa4wI1puz4TkFbQiWc9ULY3JZKUobMoLXfoA+7ZSLnXTngyF0TvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7774.namprd11.prod.outlook.com (2603:10b6:208:3f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 01:10:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 01:10:02 +0000
Date: Mon, 31 Jul 2023 01:09:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 07/10] drm/sched: Add helper to set TDR timeout
Message-ID: <ZMcJuvz/z38snXjr@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-8-matthew.brost@intel.com>
 <4b35059a-4a98-13e3-29f7-83d309b721e5@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4b35059a-4a98-13e3-29f7-83d309b721e5@amd.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: e5db5fad-d57e-406a-5f58-08db9162ddf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APNc68zGcn1Z0Dy3iBS8vxGNi+ttExrjJ1U9zAegEVjyiZ8FCO6o5XzWgt0bQdRsKxMRS5hG/irE9Sj1pGk2ZKLvj3icWQMIz7wlP8GwyMwWvh+Ww5MqOFX1UXgeMT+qifveTRxqGeDso7JUVVKDi0+hknFcO6WNubz55yn3nR5Ug2VLKk+DskLPDJuEQXzFcs3oK9EG1U/eJSjpVBqUoMUmo4fPEYJUfecEGZ91Q+4Nd2nuslVIfUc99PJjH2dtjTjIWj+zqlCXfIS2YdC8ZknzufVxu3JfvmrM9lG9AWLQ4i5I8hoKlKvc84PCfgAgSWbJyoeLW3h1VW+aMDixYjhaj+f3UY/JNoT4yAUWQDns2q1wOrfD0NPwmgzX/9eh5nkPF1YIY7ZjhO7LWmtBi99VreT7SQyKKvLWmIKwNn8KOycR3LPPSjs4EsQ5a7j2Xbs1Fes4d2Jw88H9lZsVo9V5+wt/rMN0RRf0rcKm8pOomYdPnXtbOB5d0LMkd/nzHEnrWtCxEpqYCdyNlW6kSC1HQ36li2uSfs2nNVfV0eGT8N/bZPRGE7vJVrHHXTkn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(2906002)(316002)(8936002)(8676002)(7416002)(5660300002)(44832011)(41300700001)(86362001)(6512007)(6486002)(6666004)(26005)(478600001)(82960400001)(6506007)(53546011)(186003)(83380400001)(66946007)(38100700002)(66556008)(66476007)(6916009)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uTRal8LbR44Ajt83J8PpDtWLZ5ilU38CURwGXMBL3RVTpR5XHSApoZ2rV1h+?=
 =?us-ascii?Q?nQulMGS1nQVfdGqLUJeiWYiK77rQC+N8vyiuSDgGTYkHCDfJyM7UIohm0wSC?=
 =?us-ascii?Q?X8TfjyKeHXWcxQ7jFJJijNYuHgbYvkHuj01MpCT+9NDzTr3Rel6P6dUUKG0x?=
 =?us-ascii?Q?fuT/qgqClwQbwju88rWfWwWgO5N0AWhhvCVkmpEd6U/m8fgpaXBTmXy3BdZ0?=
 =?us-ascii?Q?w7n4oT4Hxkt+99Nk/hZJ8FUjnTr4RyeBl0X2AfSDypSo6t84wfM9rDkTyFrH?=
 =?us-ascii?Q?VKp6MX1VJ/f3oDXA6XrkC2wjI7JQfoGAJDpbkZJ+QPVGNhb/HGBG7gIjvOTE?=
 =?us-ascii?Q?HYroxH9fP1sbPBJ3JSxyO08j1abQXdmIy1PFdi+74lmRW+JoXhfBji2oGYeb?=
 =?us-ascii?Q?bhyhX2Y2znMXaDDwmqhyB8Yn1A1+l+m7METBBWnulshekoKMUfQlj5QE1pr9?=
 =?us-ascii?Q?H03JRAPFhhVvd+xNxkNZf+SvwGuqBP8MHCMZMz9kf9TLsYhnzkroruiJc0Hm?=
 =?us-ascii?Q?e3kG9P3mXW5KE7D9ywzfcE3jUiOR5F6jCRZTVH+IkhyM+/L+8HSQ8Lr9hhjQ?=
 =?us-ascii?Q?rp98svqUGyyiLP7fPiSjHotYQuChq/T4INos1glErNzUOcmXEmeKvWwRGchv?=
 =?us-ascii?Q?13jWRpuAH0fedObKv5g4CR84fk/UUy1BoTSeUpiw/xgsMaybOqyzEKysIO2t?=
 =?us-ascii?Q?rB+s9MKrETpW/cepYPrLN6kM/xsbKLoc5FAKvTQccEbx0JGCixvlCMr4sEbM?=
 =?us-ascii?Q?cSqz+1DN/lPnIk4BUVKLai4aE8IDkn4AP+CvnfleavEYx2mpLI0VRweBsdUb?=
 =?us-ascii?Q?Lrmz/JEfI76KK0zcHF8IbZ/i8kliuAu8LgvGGOuqH+MKrzzw5U+XeQlBtz8Q?=
 =?us-ascii?Q?+NacTBqlBQxmFvkbtJkPpyvOdCl4c5w7z31YZVr8GCgAgzjSgIutO1pCTp9O?=
 =?us-ascii?Q?cM1/av7VEpUtyjBiZWoxAhj1yjjDlNQ3Hj4mSjl8cuhntO49nHVeXRHdsXsW?=
 =?us-ascii?Q?v130ddxxkV0XTJY/ZuD38FbexWUsHxLicFhCtZOwG0+F/UjiEMrY3fKt8UgL?=
 =?us-ascii?Q?ksq2Du8lVjZVLevMXrb5UkLw+2d1dwEDhxZoSCMZgiieuSTlK+z+U9RzFWTX?=
 =?us-ascii?Q?f0qxupWMProBYfpB7iEkGIRGHSpo5FIbjWfqQQiqidakx4tN/1ByTI+MFo9F?=
 =?us-ascii?Q?IW8yiNiGqfM3chJ+ictTiniD+aSMadGyS2mOk1pzEO5gj3e1jJz5PhDJSIGK?=
 =?us-ascii?Q?2ca0nWhCicFEB61CylrkQrBEbw6hVY/xqbvetGnLGFcXZaaw4qQrOmQHCFj5?=
 =?us-ascii?Q?LlxHE9vGkYVGtcqiW05TJE+5fX4HxW43plX+gPHKd4fuln6tHjHDN64JNhZH?=
 =?us-ascii?Q?dhDF0/mX+rtHZDXwtNE/cCAtt0emwxIHrBTVTTBx/xFHN0CcvBebogmf7pKB?=
 =?us-ascii?Q?PTOhMtKZMAieBuGAWltXJ1sxJVB7vH3KF2AsQ29WtBTZMyuYfoX6cPHWxlq9?=
 =?us-ascii?Q?G+i1S7JkTDMIaf+HK9jpbjNTHXlvFVPkewUq65DA59/ODSmrQqHAS6Bbt7Ed?=
 =?us-ascii?Q?VHryHaIlYUZ3sSEn1IUHfSIkFzPJ6NbbMZQ1RQnPosIcjPZ9pSGNRFjaSLlY?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5db5fad-d57e-406a-5f58-08db9162ddf4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 01:10:02.0775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEVYdnmCIpl3yI4UbrcjJjyMvabXSnUy8NZ06JAXw/sWzSlmI5g8lo1sSJUXsnardfzgxaAVzPm9asxjc0XizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7774
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 01:28:12AM -0400, Luben Tuikov wrote:
> On 2023-04-03 20:22, Matthew Brost wrote:
> > Add helper to set TDR timeout and restart the TDR with new timeout
> > value. This will be used in XE, new Intel GPU driver, to trigger the TDR
> > to cleanup drm_sched_entity that encounter errors.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
> >  include/drm/gpu_scheduler.h            |  1 +
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 4eac02d212c1..d61880315d8d 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -370,6 +370,24 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> >  		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> >  }
> >  
> > +/**
> > + * drm_sched_set_timeout - set timeout for reset worker
> > + *
> > + * @sched: scheduler instance to set and (re)-start the worker for
> > + * @timeout: timeout period
> > + *
> > + * Set and (re)-start the timeout for the given scheduler.
> > + */
> > +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
> > +{
> > +	spin_lock(&sched->job_list_lock);
> > +	sched->timeout = timeout;
> > +	cancel_delayed_work(&sched->work_tdr);
> 
> I see that the comment says "(re-)start"(sic). Is the rest of the logic
> stable in that we don't need to use _sync() version, and/or at least
> inspect the return value of the one currently used?
> 

Sorry for the delayed response, just reviving this series now and seeing
this comment.

We don't care if the TDR is currently executing (at least in Xe which
makes use of this function), that is totally fine we only care to change
the future timeout values. I believe we actually call this from the TDR
in Xe to set the timeout value to zero so using a sync version would
deadlock. We do this as a mechanism to kill the drm_gpu_scheduler and
immediately timeout all remaining jobs. We also call this in a few other
places too with a value of zero for the same reason (kill the
drm_gpu_scheduler).

Matt

> Regards,
> Luben
> 
> > +	drm_sched_start_timeout(sched);
> > +	spin_unlock(&sched->job_list_lock);
> > +}
> > +EXPORT_SYMBOL(drm_sched_set_timeout);
> > +
> >  /**
> >   * drm_sched_fault - immediately start timeout handler
> >   *
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 18172ae63ab7..6258e324bd7c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -593,6 +593,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >  				    struct drm_gpu_scheduler **sched_list,
> >                                     unsigned int num_sched_list);
> >  
> > +void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
> >  void drm_sched_job_cleanup(struct drm_sched_job *job);
> >  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> >  void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> 
