Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CE847BEE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886610EB43;
	Fri,  2 Feb 2024 21:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMqsZ2lQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CB510EB43;
 Fri,  2 Feb 2024 21:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706911135; x=1738447135;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KjZSk8wuzjYm72eRhfgy9K4YhR1EbRMvlKufrvPKsEQ=;
 b=CMqsZ2lQa1bGqF4VueqkO0Vlh2mwXw8rbTAtqVEdvd34hKlIP7S+qijm
 HTy8lqIqwY96rv7rmsU0w1SC4DLG0nqr/NGJF2hbYyYB+SNMT2dMT5Gjk
 +3UtKuKfvUs26Ck92KsUNcSdoxiFPobPYJMqPT+IobwkZQeXM1BoSaMq4
 nOb14vPogqsp5oVYqND23cg7Fx3EVf0X3Yxaz2m8LTAX4C9b1idllnk6P
 kUYrg0i4jisohcgTnSBULIKxyzDi0+KJlifpsSJW5sA8uHBTYdFguPupm
 9GSGPHHqkEs2Yk9+G005vYTvuo9KOO8VPlastWq5/NiIQSBypHgRSPuWh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="403448"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="403448"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 13:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908691314"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="908691314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 13:58:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 13:58:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 13:58:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 13:58:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zin9NXhAbPdPaQ4mWtyMT6jw6kLvmqWmjWvU43BqSH1np/y3ovpJhWmCTmx3eV6idj0MRvq01ZkN+5xT8pHY2n9GCktuGxXrcRq3F5Rgcs6CMr/Ga/lege1dXTFi0KbdQWfBrqnUfAJebx87kuTprhWtpyyHKUN9WW1EYbARVaNYGtGiDyxrFZLmw4DG9SkLYduaeCBYtw7wMKzcTSGRTBIW6sRgwm/JuXk7KqLu+9lfDiShU7rapSR4BEnjx8ESbm9QhikAhhbCi6H4G4VRyOBSt1OV+8Xhs9Km0fG7jiTFvMAY/GHmZenedzAVi2+IVYOLT1iXk4fVuH4C756UmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY6EkcQ2lUERMLMF1TdRlIpHPqHZSv6xoTLsMZSJpXc=;
 b=clflxpdEB4YM1H/Kx2T7vfo6/kpwp4tdCYC96Xqdr++v+PsqO6W0N/NpFjZo9jp9VPTbeGFHAw7pnLd2Ec4+tmfikPStiyj1cU32aIrrv0S1Aik+bLDCLKEJO+Dcp8fUykbivl9wionMmEc87UDrXAmlKOZxI0Rc12ulyJ55QizNOA7coLewHctfJjUYN24FGGsRWjbJshjdkktNlEHhWs/cOt4BjkDHqDpIPGRv4OUzfc5pCw2mTUMoWZ9MH6AQ/ixJnSO0yV73LlXZ7/LlYYOcRngx747BiQACWI3sKBToK8y8Cw65G124GkOHsREY8d+JsHy79CoZLzLN6tkaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 21:58:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 21:58:52 +0000
Date: Fri, 2 Feb 2024 16:58:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Re-queue run job worker when
 drm_sched_entity_pop_job() returns NULL
Message-ID: <Zb1ll0rXlbaAaxKP@intel.com>
References: <20240130030413.2031009-1-matthew.brost@intel.com>
 <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7707834-9298-4392-a7ec-f4e5f382fa02@amd.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 3308af4f-406f-43e4-8a7a-08dc243a2462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvXDtYmjgJciEL8tbXWH/TqTJBZzKwBEVtcyvRucaKgb1WpW9TM+8/hohXHHYy50aTG/uNzfHwHVFi2I/BdnzdOdRTTdIQaQkOA/3MPp7HaoT0jxn4NtnSXIhcXMQ6SCmVCpx5amsxnaleYgg1B1XPRln8spI0xAwTFhtPK4l6cY12XnjQQe1tFKlNUoIMSxPHJEdV+D3dZp9xSf2C95lHCFWYo6v9jV9wOViFk4MiWCyBuk7U1PCY/j67WZdkcJZS1Slz6HLHGH+u/jsD/3FwUCndjq6NuiLncNQqm27mG2XQQQKB+3Ipjo4uTyZejY/xrRmibG/tKUy9Gcj8ZOwntzue5+HvOMLqWbzWoxGk+EjRs/iLEl+3nzRfBVNKZU3sRZnTpcO6c8fGmlfXKmgKEVdFL5I4BpHikJDwPuVjmtCyBjyDd7dKq5FpfC6asDI2wHmvwcbP1kSXvJxf+OGUhstHK0n0ykDOdSf91NVmTyOjJxABaAyuhpaKVQg4QIpHY6n7efnMHsO+gwAUsuRyyVp8EjZOuH4jP+h6pjgzrQ43+Sp37bT2sEJFW8N+1q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66574015)(83380400001)(66946007)(6506007)(8676002)(6666004)(478600001)(6916009)(5660300002)(26005)(2906002)(66476007)(6486002)(44832011)(6512007)(2616005)(66556008)(316002)(8936002)(36756003)(86362001)(38100700002)(4326008)(41300700001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KUgifDeACILzRWGVauR+uYZM5on20i+nd0VaH//bASTeKGZ8KM9+4KZrvY?=
 =?iso-8859-1?Q?EM5gLB4o+KtFvZ1Ci1vRtZ3nR0jiyCR7QHlvcrT6gJezRh6i5MreOnQ4ci?=
 =?iso-8859-1?Q?I/CmUxigmmYJ10SSm4hV6TYjyNyA1mq7pPSXrzQGbK8+UFsLbzqDCfSiYQ?=
 =?iso-8859-1?Q?EiNL21qqhv8fwBW8MMxjFldtO9yJiLXcFk4dZRhCFhKTqyz8tE1I+nfnAZ?=
 =?iso-8859-1?Q?a34FFSUbH+KGi8oAWWY6Eq1I32PWahUl+eDh4bK/mPbDXgcU75DeCfnwhD?=
 =?iso-8859-1?Q?Zl617zlO3vEGbx0MHtJpVWC8ZrgtIGXvFG6Xof4rGeiMvyynqAacYgjMEp?=
 =?iso-8859-1?Q?/s0Ku9Y3iBpbnsVpFMZeYbHShwSOXi/iTXdEPZg9aO4VRObJ9yIXgME33H?=
 =?iso-8859-1?Q?fOcn7hWdrdR3YgPg0O29302fsP1fM/ieSuEzhxXf8Hvc1bc4JT1/57AhkC?=
 =?iso-8859-1?Q?AIXViULVsc6rEkVmMy1cWhGv0A6jGQ521QWkMhC1tjfwfEkJX7Yt0VakyI?=
 =?iso-8859-1?Q?46+wZOZz6EJxCdyjws0FOwKGymeBiZLdJKZC7oYK+jfOM8tTimVkc4c5t3?=
 =?iso-8859-1?Q?TUw4+1wSvaYe9dkfZtZnF3LPPyOA3p/lzcEpuW1D5+1BoVR1h8OPeSUVIQ?=
 =?iso-8859-1?Q?SXqSAhTSS4pMwkkVEYiZ9wfaRMGGwwL1WTQwaKCYOwA0tJndc5dGVBj1xY?=
 =?iso-8859-1?Q?DMxy/3GAI+YUpjkH9MpwPDvIKbB93mZG0C6qPP8+P3cdWmsm974hTMsslc?=
 =?iso-8859-1?Q?xTsgx1sPygxyjdzG0SjybrUsPjmL7ykHosI6bp4oD0WtW8Kg51HktEXAvk?=
 =?iso-8859-1?Q?0vTYF3Mz9rl78xVtsRLNrpBNnLPVvt1Zu7lcZuzxXRY7mnOodxPaF9PAq2?=
 =?iso-8859-1?Q?oQIGjrNFoUzJJ7/N7atTwuaTwt0U9qi/nXl6qJcV9E4/DSFypi6HVUzBfs?=
 =?iso-8859-1?Q?A+I3ZoOgowoqUDTs2MzickKml5uauBcn2HbgOnqhI3rs5x3uF+kfFZZ/cF?=
 =?iso-8859-1?Q?USbXgvORy3WERBGHq7JBmSsgd9mYOo8jeP+9zpRQOu7Ug/4wkYKTSCAJ42?=
 =?iso-8859-1?Q?+NfHzQNCSrEo1UIkF0kxsLMDuJrF/dUyjmdSbfRcIV4U/Q0Nw2Z4E9r4FS?=
 =?iso-8859-1?Q?3NB2iJied0qN5L3QKNXeqkQAfIAFzO9pZR663+vwmQ7bx+URUFNSpUGjWA?=
 =?iso-8859-1?Q?Slvs/ztBdw4ea2Jp1sJdlm2Se9apS2nKihU0o4Iqkmoi/gF/2perq7FzEn?=
 =?iso-8859-1?Q?qx3SsrNou1jMVREgmv2srB0gtQMWqZqZtEE9gYiBHEs5om51L6idSLKvbg?=
 =?iso-8859-1?Q?MINoj8iNRsX3mDmUCqQRuMnM1UNxkIGgqDcglrOd/TBBCCvufTMMuK4K7e?=
 =?iso-8859-1?Q?mqXltIIR4YvBHcgIO3OrpELSs8tTM6NNwDx2bV4Dulzjd2O1SUb4n5JSXo?=
 =?iso-8859-1?Q?+QPaCpTOIKqFYkrm4JtYYQPMmBqh70O6nHutKSj6Lp6H4oV8jgVbUlxwk4?=
 =?iso-8859-1?Q?3TqlApUl3yUkgedMNoAJyngtJAmTigX/gWCI/LgMUPhHv+3fsKtMgCypaJ?=
 =?iso-8859-1?Q?0QeNNPrf0Gwce5rtq4MrORyaPm+wXpUioOEezmV6onPzpQ4fimx5sv3nPR?=
 =?iso-8859-1?Q?c1WBcJnhuDtwU6V+OUNokX2KsDiftk1G6V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3308af4f-406f-43e4-8a7a-08dc243a2462
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:58:52.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CtFPa/iTwyftKQUZeuc2y2KiW+J0eg86/opt5neBoZIhFcwg6BhsMzHj4yLgmmWHFuVr7/OHc4WXwoRPxY9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 08:05:29AM +0100, Christian König wrote:
> Am 30.01.24 um 04:04 schrieb Matthew Brost:
> > Rather then loop over entities until one with a ready job is found,
> > re-queue the run job worker when drm_sched_entity_pop_job() returns NULL.
> > 
> > Fixes: 6dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")

First of all there's a small typo in this Fixes tag that needs to be fixed.
The correct one is:

Fixes: 66dbd9004a55 ("drm/sched: Drain all entities in DRM sched run job worker")

But I couldn't apply this right now in any of our drm-tip trees because it
is not clear where this is coming from originally.

likely amd tree?!

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Christian, if this came from the amd, could you please apply it there and
propagate through your fixes flow?

Thanks,
Rodrigo.

> 
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++++------
> >   1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 8acbef7ae53d..7e90c9f95611 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1178,21 +1178,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
> >   	struct drm_sched_entity *entity;
> >   	struct dma_fence *fence;
> >   	struct drm_sched_fence *s_fence;
> > -	struct drm_sched_job *sched_job = NULL;
> > +	struct drm_sched_job *sched_job;
> >   	int r;
> >   	if (READ_ONCE(sched->pause_submit))
> >   		return;
> >   	/* Find entity with a ready job */
> > -	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> > -		sched_job = drm_sched_entity_pop_job(entity);
> > -		if (!sched_job)
> > -			complete_all(&entity->entity_idle);
> > -	}
> > +	entity = drm_sched_select_entity(sched);
> >   	if (!entity)
> >   		return;	/* No more work */
> > +	sched_job = drm_sched_entity_pop_job(entity);
> > +	if (!sched_job) {
> > +		complete_all(&entity->entity_idle);
> > +		drm_sched_run_job_queue(sched);
> > +		return;
> > +	}
> > +
> >   	s_fence = sched_job->s_fence;
> >   	atomic_add(sched_job->credits, &sched->credit_count);
> 
