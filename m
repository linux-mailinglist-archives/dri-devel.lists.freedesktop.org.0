Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6077865D0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DA110E4CC;
	Thu, 24 Aug 2023 03:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451C10E4CC;
 Thu, 24 Aug 2023 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692847498; x=1724383498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uWKnIa3D0RpsaXE/ykJdd770/r04p9XfLSxmYI274qw=;
 b=TpI75zgZWkgEtLZSdLsxvctkSk4bRmWucPZK89jwc+Nd/mRHOU+rhuNa
 sv5JSk/igTq7KyEDG2hEk90uzycFOZKO7F5GPuWXGExJQzZQGL3R/gl+1
 RzZqrR+SshbVfJKkjtXktNvZNOoGtzCB9FNFKlPyZ+BOpUm3wrllOuGZu
 Wevl5LurbuMhFErWxmikIPiNF9GVj9KMuLlsH/REN7dlu2txpunJXoApg
 syjYfzqoRm9CpcDFsX34cXbd/zxr/NL1ClN6UGv1pl+oP8BU/5yhWbLee
 Pj1Q2925B2M6tTWwNk2o7+lXkk/m8S1taOLIRRUAUT/0fwqAlDKILuQYI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374304078"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374304078"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 20:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910748684"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910748684"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 20:24:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 20:24:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 20:24:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 20:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiiQUhQ7XswKrW/rIYI40v6qnfNdikagZ67/hvsduGCEvQnL/m4rZXf4DMUX9MzGYSAzI2L9qPTUzuh4zo2t+eMDEW1F272SKWQtUPzGeqH7Zq3La7DG4WquyxJP6HIio8cJWyWHFWwMnQySsg9YTx5yEElcO5TIa4dI21t76qLJv8yZk+jW9Oz71PYICf6MoiJHhh6X5TX+5vChy8nhh+smNuBgSpzGEdLcmiIq8Ecuf+h6sd+hNVdv+0fCl3ffIQzRorTP+7i7rSUCIrRZ4AZANTbythhEIsHEdjleXF2k9N4/8fDsh1ZI0YnmQ9IdYIleAkae+/d9i5UabWvkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJXIiIOt9PNdttebxDr94Z61T98ZeKIW7i2KNves3Jk=;
 b=L7fi3zL80v6JemixelJt5r/rt0LERQlknVOeKWVMsimh2VL2QrrGkRXvDmk47mRy+6uFsxoDHDFPVHwX07vDWrrJdOzlpcJAVccMFOZmydCixM9ymMM3gNVO1viwEztx0u/e7d8F4Kw6fLwgNWwKLOGQH8udj78mLd77H/Zs2WW9oCfHaf49QYv+UGUS5EgVLcUmAQHqMLXmYZ6r365e7wFAyBXPDHwYX+S+XBmZEe1grIq98Xy9pkPRC2g7boOrNfXJGlqtYz4qTeYeross+Y0HLfNELD/f/Arh7rPwtFsvZd6Wcd6dbTBVR5cFXfvW8kiCnlqx3z4Ya49X/eujew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 03:24:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 03:24:54 +0000
Date: Thu, 24 Aug 2023 03:23:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 0/9] DRM scheduler changes for Xe
Message-ID: <ZObNNn8u8pf69IYh@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <748c267c-1ede-876a-1cac-c864fb37e3dc@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <748c267c-1ede-876a-1cac-c864fb37e3dc@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 11398077-2656-4336-bb08-08dba451af16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hti3xmbe7i8jhWvc1uO8Dywi+b9gAmqtmxgrC5ROzIdmkl4cMXQN+7jQZVbZDkD0vxJyh3mmP0xiHD1lAhLfDAcYGYHhWnQcj2aQV3TbX8CqlP4vdhqzhlcUMJev2ObJo/Ls84BVtHPs+TjHlaiUTrAxA9L64W0wB3iW4J5WF6EbfGJ38UfTYzQBv+FsMuFEVekPRDexecSQniXEnfOo5jrzu1l4udEg8ug6AJ6LpVszIh4rB05a5BmK4vIpXJTEWOmlPs0f8DDJOJyoNgsJtOKCtelnQqAepp0NMe45LNcGpPs9TCWqCMnm/HB9BUQK2N4Rgp3UeA2pviB/IDJzlndt0YNVgoFJXgyaEQC/7/R49QTseD29T66K43XWvBDFAGGa4Dr7j1RgrJ8QessKLMmdY55mdsTp/o+yC0zfixiMlcpzzbz9IHGEda2ng2ACYiwY/wfpcY8NYY0BIFXRyhp8ATZbS6qZBg6K3XTmVxYo8o0ErJEG3yp3Xhh/PjF3tN7KzaBMWCee4k18K32OUOX/eO1f57Kgn4pHIc02cs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(1800799009)(186009)(451199024)(5660300002)(83380400001)(2906002)(38100700002)(82960400001)(86362001)(41300700001)(6512007)(66556008)(66476007)(66946007)(6486002)(6506007)(6916009)(316002)(4326008)(8676002)(8936002)(53546011)(966005)(478600001)(6666004)(26005)(7416002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CAGLB1yAnNjrHZrHWjBVVVjBmtnxPW4qN9VLN1bVHqsl3fk7Jmjm5ABek2t5?=
 =?us-ascii?Q?irtUWdbyKlYbybfzane4L23Uk6xjKtHnq4F5xd8N5h9Z0jpf7OD3BHaLRqiz?=
 =?us-ascii?Q?XUfGJ+WgSxruJ0cNHiKxKTl2EWbzRXqysaYZbjLPpt4SAll9gUU1QIoooJjE?=
 =?us-ascii?Q?x7fs+2RQ+XIT4VnKB7TXgwo3p8Mhms5msmz9E0P4SSb/pjm9jJZTAC5ixmXe?=
 =?us-ascii?Q?UG5hC5/X5352qnAJ3SJ0kvpJlEfymrjHVcCpMrxwAwCNAX59dGny/ADNkhHg?=
 =?us-ascii?Q?wm6W0GWsb30TJPLAwIHc47Y5Z7GVBTvSSqNXzH76sNt4HRb0jH3UH0+MnuqT?=
 =?us-ascii?Q?YcTx32BgQbzHZtxIEZLLlpaiejNL65475D5TZMvUf98E+V7W3qG0BC8Pg1Bp?=
 =?us-ascii?Q?DArqwpAp4U54dFmvCTsUYKC6ytcYXJBENX3eCYQSIHRVBK2memjXd0U3mtWo?=
 =?us-ascii?Q?+q4jepCCswjSsAXDa+R4tK0POSisUWtHcwWUN3MszwhmsfLKlQBdso6TDoS8?=
 =?us-ascii?Q?OtmuXJFUeCdzir9TD3l5/HBf2hMuPEu0jxfzJAAmWeTqDCwY5lvurJliHu/D?=
 =?us-ascii?Q?epOxhRLtNgE5ajbyj6MxC2T6TUEITRTU+yIjpaC4HILCWcRrHrkW7hZNYbt2?=
 =?us-ascii?Q?+WhjmNut6thNNl9goycDw37ZTu6knMF0rsuqA9fSvR6Q5xy63nnbBRFNdrB1?=
 =?us-ascii?Q?FAX3BknpviWsh6tTqa6USp1jETx3q1HSzU1MTseOkWcCqskXBRaWB3dp9mnA?=
 =?us-ascii?Q?CTRZ7zGWLk/UJ7YhuiNo98DtTa85l8lX4YfrM376JPytWBzejnMGyTeblJFm?=
 =?us-ascii?Q?YwF6ZF5xtA8dC1+HIsQImvDL/7pduFnB6IqT6rNLXpxjU5rPquJ1FIvQAHgU?=
 =?us-ascii?Q?ULgkRxDmJ7/sJnAvbwX4v3J04yvPMaSe0X5R9Nex7tIc6A997c5h3gCBL6e8?=
 =?us-ascii?Q?pmmQ2x2LVX9u33c8AJHYOrIcnUsSEruC3b79f57j4nsdpYd+0OX7Xefzv/AO?=
 =?us-ascii?Q?+56HTKoAtWyemvjoV1ENrVUcz+LzrelkU7ijGPqP145Awv7YVtmP6vVHFUjA?=
 =?us-ascii?Q?RIBcgc0jaIlbjyJqw1QGoXBZFJ3WQ9/Fav214YNsglgo8YopH+kNhoycR5bc?=
 =?us-ascii?Q?J6beKO7kOv95EOLx2T9xDj2ehKkg7OtHHV7rPJrkUZGzxf2qW6LbA4vMocNJ?=
 =?us-ascii?Q?cAkzvzyidPBD/ocj+dz3mYdBsWYKoOyzyUBFIlBR5TFjjUrQLcSIlu+G2EMw?=
 =?us-ascii?Q?QnmCZHczHJUFAue97yxecmED+xhhVX4j0AcKp20C56bfqpCluC7RHT5gQ+a7?=
 =?us-ascii?Q?e+NpSjjrVw5z2nCxZ3dKonG8a76EkTkHpKfER+nfi/u9glO7xi+VmIj5HK25?=
 =?us-ascii?Q?0gXrSy9mPZbcWlRKxtmGpBW3hWaiiP1EYy6o0JVEcj54GKlHytPd47Ws53wA?=
 =?us-ascii?Q?UGEWQ3vB0dR26joWTHwt0wN92VtL/NxUo8f/yrP5WzfNukwoJUJJMjiXV5An?=
 =?us-ascii?Q?SougJLch4lfxaBvJCFc/oUs7+NAk88oJL18zmlZc3SEZxKMapNTIykjnqgGs?=
 =?us-ascii?Q?WGOLORfwqNrIDk/ATSypgX95G/cGXY6ZGNSzr2r512jNjCP1DxESpIU3DqVd?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11398077-2656-4336-bb08-08dba451af16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 03:24:54.1542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuVugWp8aF+1XLQE3vHLAuNXOB4N7ayeenZXbmI+N8BwJiZgCJiniJLw4+ZUxHT1O0ul8pIIuZuXDH7RpkL6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 02:08:59AM +0200, Danilo Krummrich wrote:
> Hi Matt,
> 
> On 8/11/23 04:31, Matthew Brost wrote:
> > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > have been asked to merge our common DRM scheduler patches first.
> > 
> > This a continuation of a RFC [3] with all comments addressed, ready for
> > a full review, and hopefully in state which can merged in the near
> > future. More details of this series can found in the cover letter of the
> > RFC [3].
> > 
> > These changes have been tested with the Xe driver.
> 
> Do you keep a branch with these patches somewhere?
> 

Pushed a branch for you:
https://gitlab.freedesktop.org/mbrost/nouveau-drm-scheduler/-/tree/xe-sched-changes?ref_type=heads

Matt

> - Danilo
> 
> > 
> > v2:
> >   - Break run job, free job, and process message in own work items
> >   - This might break other drivers as run job and free job now can run in
> >     parallel, can fix up if needed
> > 
> > Matt
> > 
> > Matthew Brost (9):
> >    drm/sched: Convert drm scheduler to use a work queue  rather than
> >      kthread
> >    drm/sched: Move schedule policy to scheduler / entity
> >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >    drm/sched: Split free_job into own work item
> >    drm/sched: Add generic scheduler message interface
> >    drm/sched: Add drm_sched_start_timeout_unlocked helper
> >    drm/sched: Start run wq before TDR in drm_sched_start
> >    drm/sched: Submit job before starting TDR
> >    drm/sched: Add helper to set TDR timeout
> > 
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   3 +-
> >   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   5 +-
> >   drivers/gpu/drm/lima/lima_sched.c          |   5 +-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c       |   5 +-
> >   drivers/gpu/drm/nouveau/nouveau_sched.c    |   5 +-
> >   drivers/gpu/drm/panfrost/panfrost_job.c    |   5 +-
> >   drivers/gpu/drm/scheduler/sched_entity.c   |  85 ++++-
> >   drivers/gpu/drm/scheduler/sched_fence.c    |   2 +-
> >   drivers/gpu/drm/scheduler/sched_main.c     | 408 ++++++++++++++++-----
> >   drivers/gpu/drm/v3d/v3d_sched.c            |  25 +-
> >   include/drm/gpu_scheduler.h                |  75 +++-
> >   11 files changed, 487 insertions(+), 136 deletions(-)
> > 
> 
