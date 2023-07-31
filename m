Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1876896E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 03:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D1310E156;
	Mon, 31 Jul 2023 01:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912EE10E156;
 Mon, 31 Jul 2023 01:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690765313; x=1722301313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oNHWzunFdwqf0JQjYxs2S5l2Cw3IGSy6G/9sPyUmFuk=;
 b=P8cb0yXLV1NMqcxLbHp8LpeAm6zSQa5spOAyuljBcgdMlUt9ZUzbFnGz
 5+bLlSBCOlCvs8QHE/cWUDGQAD9MBhkIAaVMuQSUeXNMlowQbszfP66W1
 hYz8yBjC566bPZb2GU3nQP3gnT4EJ6J8BKhdOnQElitrbMB2VLEk8bCgq
 mb9cTNZod2ivvn8eOMmn8vMY8pn+bcx/zJC45xBrq2jF3P/s32GFnUPsd
 ALPsFlMVpevCoM8DzWw9WQgXBvlm43dbAH5yuM+aXGc5tvhCeQOzwkZoO
 L+sKnjRhQ/c+8eh8ZxpfCqyUNK1WBwcuJAm0T0cvOYWvJA0ngCVmqaQSG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="366371210"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; d="scan'208";a="366371210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 18:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="871446743"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2023 18:01:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 18:01:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 18:01:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 18:01:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 18:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsSwgJ7X/19WX0ye00XE5yAI2h5nQrfLmtjEW9GM5P/I+Kbw8Cn9zxEuAoSslBiNeZ/0rsCIIR+1mVAjWjGiMlO0eGbBscRq28mi53fVCyT7s2o6aJyY0d2N0E4UTMpjssDerQgW2FgP44ZQjwknAXBSvm2CtwDmlp4PDj3W0vb8Nd7njywu90YgeONXT3teW8u24OieXeSjOW6h3K5CThR8YAkAc1e4UBJpaACIYSw9rVwuR31iak2sAYZkAQenzfZPlZXuRH1XaG7tnGLHIZu5zDH1bFUJBPcqMp1hcKSiYtSart+i1oOxdPAC4JgPB29xS/TuD3x2gwoKpvYDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weRFIeOtFNetCcUoDPdxSZm5DV11tZB3FjV/MtqsDfY=;
 b=iMo8oCcMKVf+4qGOtha835K+77MzGtSbAN21yRx3+zrc2pmKoJU8u85Wty0uzTq5i/WAvPwiUn9wAArbKHj5ETohhkQCsMO4h6t6ammsCONZobCyWLjhNdqYjv5PFr4wjlyxwDaN0hoJo7dvldpVeqjn2zcECZw4w6nq4d1PjLLPJcPv47NKqNZsOoYXBny2MHPy0GyXWesaoPn4Te5BATBoYc+KL7sFmGyTS/17ys/751RXLWhMRlckPXl+X7V3EMCGbFsi9VGlfd/9sEdLVlLP9m6gNemyz/tW4b7rvEhZV7v8rqGlxg+gbNtEQnXueIEyz3Njd9D4aOP7Y9p8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 01:01:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 01:01:47 +0000
Date: Mon, 31 Jul 2023 01:00:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 06/10] drm/sched: Submit job before starting TDR
Message-ID: <ZMcHy4I/KNyZ2Q8k@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-7-matthew.brost@intel.com>
 <de3c70a2-1831-be00-0df3-4b8d6c593373@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <de3c70a2-1831-be00-0df3-4b8d6c593373@amd.com>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d0bc98-6b4c-4bd8-f087-08db9161b6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QrkRtaLZbclzE2TNsIP26wEgyVSvGe7vKTbXKU2oJdNx18M25GK8xsY6cjpg/JR0mhh78O1rOojwNA7IR/405SMru+2q3Yen8slqJqcP+0RxW/J7n4z/eB/UpmA5YNZ08GNLIr5vdodMYCh/PMnes6iHz34nHjFk2nVw/peo9zYZnG+simJUzXJHyyVkrRxbaLl/nvW2jPpdOvfdI3LgE8cUuMzXuz3DIvFgkpxnLK7zWu6qg5c71HRtwBLfFtpucHOFHZIfRCPawGqF5JwEwp8WDozwNRX/t0yN1GyJt5u69mKgpWIMatVkHnYIQOdjT/pntZ6FtwRIw56jfjEcGYap0ErhlrnYfRTr0PBmDvSqIJLZ6TxrCJfRD7szRITWlWKvxGRMDKYtU4+qkCIj3kNpQwDOJwloDxvGfcgrgTkIU1Om/nj8XCxCi3U+Gfp/oDtcCfInnMRc7j1EzuWHENLQnR1PvRyK2JBKDSNHiGXD5xtv4dgHyHiSIBvFTxUusqtrqkb66pPARWnbh4fpFQjnFVFkRod/hN9kWuJUt2Zlc+hxuMVrmmHjdMYpjgin
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(6506007)(316002)(26005)(53546011)(8936002)(41300700001)(8676002)(6916009)(82960400001)(6512007)(66556008)(66476007)(478600001)(4326008)(66946007)(6666004)(6486002)(38100700002)(2906002)(83380400001)(86362001)(44832011)(186003)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CyRA3RkVfWY94d/XaejpWhZDyd6myFWoKaJ7FyITpqB+qDuuDf53gxm9OYz+?=
 =?us-ascii?Q?lLdYxO0Y5Gw+HJeR9KH7CI72fZ/oaihwQZVz8AOk/+FVhJl9a2DBcKqK0aVY?=
 =?us-ascii?Q?M/Dm7yPzQr7WCAbiRH4I2WJBDAKEjDIS3l9f9FZOMd+CKesYVzykQqyVYgLj?=
 =?us-ascii?Q?GBLqkr3SD4zJKoUxbZkJyyVpQ4m6dBvhsiTCtMzd/C3Y/zh+QcJ/DJ6OnOUo?=
 =?us-ascii?Q?zBz28ypJspOWZ6ZWZCN6JY7U17oB9fgeB45k73uu7Ga47+9Y//xBp/sS1zCh?=
 =?us-ascii?Q?bb3AiCkELJ9JsQMo8DJJOQha5r7ESG05dkL5cFCG5OBzhJ7fSitPgoSO/98M?=
 =?us-ascii?Q?g3V72a3vGna7W1DGpBAqs7c4nFXSNcuP7dyoSzmwUt616+M35sPR3bTSjGrK?=
 =?us-ascii?Q?yS7AmjG4S3tEvpvj8WjxEqEnFav7pvbEpfkQSY1LZEk0l+/ZfPAFa4IFFogI?=
 =?us-ascii?Q?gO0li5iSCP5xtDAgb9eNBw97sXcV400QjA52EBFGOdniTxkMRhLU7J7XXXMU?=
 =?us-ascii?Q?16aLbXs3QYw5ItLL6eB+F5+Qd672+kPbwfLqNrrUCP9jXZRb9RrqUTPbT3b+?=
 =?us-ascii?Q?17q1ikpZ9SC73L/GOiOrYRJsnOJxr+mWszKagL+dSPR9T3OkTEfUnotrUG3x?=
 =?us-ascii?Q?6ZNTgor7aWyG1ma73Q0q/rr1jg8OdHZaoWz/pp/Zztc5nELMy/OWqTjwwQWx?=
 =?us-ascii?Q?aJ5BjAMzzMH4nbYIuoUP5hmPPjYyjrJFt+He7rIZu/7CB85bB5ce7/nQl9Fi?=
 =?us-ascii?Q?95yH2AXl8arMLIxRuNJXSQLT5CZ8wgm/F5Kg+vtKPLGzEoZO9Tk9P1nQsBPW?=
 =?us-ascii?Q?0eEeacTZHQydMYTfse3/JHUE04wpQawi0WFDyfA3tYCiypSNu6iPq7Vgzb6t?=
 =?us-ascii?Q?DY37rprqtA6I1ZmoJ4JQTs3rU/fKgK9IKajolzb5QjlWLUObrx/kivcdQQns?=
 =?us-ascii?Q?wrXc4Hel/f3h2QEBDjG6jDuh0LhzBCMrETiGdq4tt7Em2KJJogPpU2qysdYA?=
 =?us-ascii?Q?jB9YXv7SAEHYKKgXmuFuPm4wD9R/MDa/qUDESlpF/fXjwik+b1t6y7B7ziva?=
 =?us-ascii?Q?33foXpa0RfRWt5S2bSFuaNpkKfwDYJvGfS1rqehsQB3dcGEa7P8WfFyCMhHH?=
 =?us-ascii?Q?SNvqJvz0noYuvf1YtxT3nVfT/PZzDtmd+Bd9RcQU9InHzkX3eKyL0d86l8Tf?=
 =?us-ascii?Q?IbHNFAifv6pIKgXE0w366SYdccsGo3PEUp1lruRB3mb7q/Ea4Bc7MDe5AP4G?=
 =?us-ascii?Q?2BgLinMFybOo9DJ+/L8FJD1mLaCvOYxGLjUHS6QYqW8eTN4u5nFdMQh8uPAQ?=
 =?us-ascii?Q?mrbOJxwS4/H9QkO/YPoB5k3q2YacMq2mWRzZUe54vqStvhYeosgakRrv6yHH?=
 =?us-ascii?Q?QUkvQwMH0al6AyAXLh/HeVw3mdkM2IGPd/XNOVlgIejusxBR8lL+J8opk9Sz?=
 =?us-ascii?Q?xcDR8wzC23qVwZmKkshwyxRP8oAtY2lIKnh9gdxviBma0k50yVCZHKEVcdSn?=
 =?us-ascii?Q?/ixX/FrlSyKAfaZQ63CZ0AkdenfygemOa6m0rlQFl/6tLCJgcFRtxdPivjb6?=
 =?us-ascii?Q?/7hJb2WurbG4bqNRYHund9b0nZc4t+HaivYwFzSdYjXJ8HGnQNyfKPNKuTxH?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d0bc98-6b4c-4bd8-f087-08db9161b6f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 01:01:47.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5dva7T04DmrBXF4i4rE6A/MOfm6W37sihoBYhjXbwzzgB2E9dtnOGhBf80Pq3Rk4/s1L9QVO7Y7stQgpizgeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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

On Thu, May 04, 2023 at 01:23:05AM -0400, Luben Tuikov wrote:
> On 2023-04-03 20:22, Matthew Brost wrote:
> > If the TDR is set to a value, it can fire before a job is submitted in
> > drm_sched_main. The job should be always be submitted before the TDR
> > fires, fix this ordering.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 6ae710017024..4eac02d212c1 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1150,10 +1150,10 @@ static void drm_sched_main(struct work_struct *w)
> >  		s_fence = sched_job->s_fence;
> >  
> >  		atomic_inc(&sched->hw_rq_count);
> > -		drm_sched_job_begin(sched_job);
> >  
> >  		trace_drm_run_job(sched_job, entity);
> >  		fence = sched->ops->run_job(sched_job);
> > +		drm_sched_job_begin(sched_job);
> >  		complete_all(&entity->entity_idle);
> >  		drm_sched_fence_scheduled(s_fence);
> >  
> 
> Not sure if this is correct. In drm_sched_job_begin() we add the job to the "pending_list"
> (meaning it is pending execution in the hardware) and we also start a timeout timer. Both
> of those should be started before the job is given to the hardware.
> 

The correct solution is probably add to pending list before run_job()
and kick TDR after run_job().

> If the timeout is set to too small a value, then that should probably be fixed instead.
>

Disagree, a user should be able to set TDR value to anything it wants
and not break the DRM scheduler.

Matt

> Regards,
> Luben
