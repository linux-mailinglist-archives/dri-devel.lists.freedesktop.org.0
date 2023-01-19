Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D86730E4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 06:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D92010E8A6;
	Thu, 19 Jan 2023 05:00:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D310E8A6;
 Thu, 19 Jan 2023 05:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674104449; x=1705640449;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AYoEXKILMVSOYgJDmcL3Y9rkMM7TfgAVRAfl8qZ5KXs=;
 b=jAB8EII8/TvoHtC2w6M7g7+BtxpJMbEzqZldjIcz0kyeXbS7gzhrj+Bm
 MFnAoxrvMhR6IqPd3LqjuCiufy8eeY8yODLVz3nWnAKlkzKWUW2bZWQ4B
 aeZpg9KH9d+q4ljjYiJmXAkZH2BVQ7O80Hj045Ij+RTPrWIdWDnP0eOIY
 wqNhbcnwRmLTg4bCWhTIfDY/2jV2bLj3EBss7nI0O3F0//DjlowOly8Fh
 NVE1aO6CyXeADI4NObQRLnHHU2A+t1/Wc/dXovCQJiQIf1QagoqgSmiVi
 21tETyXGPM+to5ys23hijSAKBhmUQ6KVcrOlb4lnX0tRaexQ4usw++UAG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327269081"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="327269081"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 20:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692283163"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="692283163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 20:59:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 20:59:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 20:59:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 20:59:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJTokCwuiDfEcNgcgRYHYOQW6STSOpkmUF2jfu4zUN4Vm0BhPLRV6tvNBGCaxzPfgj6H8fkipoWlZGc5QhAYiFjcQU9ic7vNOfSJKtZZLCLzxOzxZCJWSC1HW+bm7gQgAfcYQmzVot8I+Zj1ZB0Z6BoYBRczDiQDCuPDRLUsTPeF9fv6OdTdmtF4TNkocavSkc8gqK1hK9nhtUjhczAJ5z22z6wogjWCZAzxvlgNSF0ZQIstZCEeeh6bNQ5kZszecReNCcO1Sab7PpJH87Uxfpyn1YS/hLsXT9kUHpVePFspyqg4nUe4GGKduZM7b4dHYTLiNGSQQ9Fc51KaZ/oY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uymy9nhbb7L1RdWIi2kMaVUODs+AWu2+Mts8GYrERvw=;
 b=eoGAbtgA072a51rlj3iCQkK/kta0emjl5bpXLPCAbYgZScyTDsd37YnZUyF5B1447XXNVaBG/AMQEreVXXeWxFM65V03+nyvC/CMLTKF7uqjn9weM7+bSLGWMnnZuZOgNNKhjMk3lnNP9PGEBw759+EkLlc/Dx14cMVZn0pSmFIq8K9IpfpTuzm11xudhOhTYMV+bLQG5MY3a+D51QyuXwEs7lie6PPgu60wr4b5lOA3+YK087Bge6EefLBBhJx90HaU3FhWQpQF+j7+hWm3e4vu0H6NWqRJZ/Ry3rP1fZCrm+Ac2sC+AUbNLFe7Mwab+MQqOTNaeztyQo8ZQY5r1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 04:59:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Thu, 19 Jan 2023
 04:59:04 +0000
Date: Thu, 19 Jan 2023 04:58:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 689e73d6-9c9c-4dd9-f77d-08daf9d9e351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1D5yavJeehLI9e9mkaTtfsz0RKKxlIi3tS1MyApAZ2Pc19wLuT52PG8E/WOl+4IG67PKwFTnbrCdKdzF96/2XBttUSVW/lYAvr4tD0gCIPpuJeAgklAh4IAcoxxvw3TYcI83CZ21Qwdhw2nTeBQtB0SL9cR9pjvU2bPpYR4xuTNbiGzxkSSIr4SqqQIEekz8VEzG7YNaW/wEqOiAYmZKosT+NIe76UzVwmZKfKJvbvUzlVhRwC/gy/N89i3EoJwhqceiQHoe8xAADQED38lQAtXgqm1CtHCajjqNMuaR/bRg95RDvigMhvK3SNobrI/99UldVs/UfldDdw0wsz9kfb13tmq3+jGZGtMqFXlJyS0FtaGxek5gLU+Dm8f5sI3MazSfrOwa5GP1yH4Ny2hSnHizDdGP7fsgOwVX4KZ00VPvhF8yBJ8K11gLrMiEUfA/sPfwYDtd0og0vdUhmiwKHQsb+gG+MKJ9+e6ZOCOMu9Rt1RQdBRTgosYpoFInAg/auNBf3wJn4q3KTzt63eybN0CNT4QtI8KSqHkR9bxviukVVugVBDPRLKz5MaOLXjzh6c0BcXs1HAlgY7/uaqSMoMI7CjBQb+GxMSMn1LErW4wvjd1zTQfguUpygKRhrEkRgOY4LTV7oL/OJ3gImwvdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(86362001)(44832011)(30864003)(7416002)(5660300002)(41300700001)(8936002)(38100700002)(82960400001)(6486002)(478600001)(83380400001)(6512007)(6506007)(186003)(53546011)(26005)(6666004)(8676002)(6916009)(316002)(4326008)(66556008)(66476007)(66946007)(66574015)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UeypgnVYIsT5rQ8Bsnln+pUM3ddIUEI4mm5Qfd3/KRQbONlylTeR0JDIFf?=
 =?iso-8859-1?Q?IxwmR+xaRlyo0ZCODy8VHVwDrvczLX38jISfPY4T/KsEcN1AYYnVAw251z?=
 =?iso-8859-1?Q?37GNJlXKYbY1NNpKYl6TkW+/V4T3VFk1HB/N33kmH75RqdhdX+UnfaMTtj?=
 =?iso-8859-1?Q?ffM3NFBi5Q83gfam5w8+pqGAcOaTa/QLxp4BpostZvEwC1QglVKgRVCMrj?=
 =?iso-8859-1?Q?oZLB0tsFmyopc41e6ZiWIO5kmuY/nroSJZybKTqjOlx8LGKpi3BS0qpciv?=
 =?iso-8859-1?Q?A07abB/nMhGxN/nXpUDRztYLA2FFQYb8Q2LS8dpIezE3Pi90koqvZsF6XI?=
 =?iso-8859-1?Q?ZdLBQcr5V9Nj1Dr0E8SP1aj/C4Ao7NeB2FjpP3b8n2G044y8Iyt66MvoUb?=
 =?iso-8859-1?Q?3sfjeQxOVhoBRoYBGWwQiqMSqWYJD1vFL91REFpjlWfqghwrBMRV7m69FZ?=
 =?iso-8859-1?Q?qX2dFQDMR5gwt37CVXUb+8tmPy9xA+m9D4JdNDVRdFcRNyGEK5/xC+anXc?=
 =?iso-8859-1?Q?Djw8NY58x+k+rm0/k+GV1j+9pGowbf27M5sB2f6z2OD83ozr4z2+tMCR1U?=
 =?iso-8859-1?Q?BDdZS3bV9wD9DEUm8w4CH8Wk+hVtWim/rG+8+9Y/tEXOlqXVBar+0fWA6D?=
 =?iso-8859-1?Q?UuBtiH216j+3oYC7BFpI5KcO0yyWp/ZKjBUl1uClXLWnaUgQin+dkq7j9S?=
 =?iso-8859-1?Q?ib25YDvmsgFrWdWgaZQaIFsWaAtNa/Ps8gF6210VCrGfz9VD2DTDSluV62?=
 =?iso-8859-1?Q?jvI7vagjF5TcVNMDYWwvohosBFKorU3lJMftE7EGBu7NMXGLtIyoyW2GjB?=
 =?iso-8859-1?Q?k13x+iAvA/2o0GXT9Xkp5UtnbCNCdK2Snf+kegQHivjQvPC5W231rvkvr+?=
 =?iso-8859-1?Q?WbuwV7yZebGxZi1XcEKYlwJgqITXBYpfzpPcPL8rSRalNKOyUaZ14wISTa?=
 =?iso-8859-1?Q?LlQYMY8jwC4NrYD3WRWjcFO4Mlh4RMBwOe37YTJpvFoqZ98h9h/YjjolLG?=
 =?iso-8859-1?Q?qN2nPWrrhQ1vuuAWCobvkQ2hv7+GUZ/DFJwXdBAKqgu6GpXVRsSyScLCZD?=
 =?iso-8859-1?Q?pD1MLE3EaDX/iRuJQnLYtZ9VuDJyZFcE6hQv9lzr12ANM3LpSrZsAsYibC?=
 =?iso-8859-1?Q?4gckBG5OHo2G91i1ma7hW3jJPI/hrk1eQyuwx6MgwhhEY26eTUkKrqbsgA?=
 =?iso-8859-1?Q?P9x4ci+EgaoL4i7Pqfjb+MsWvw01iFnVsly2H2AfN9a1N/7fpop4Hnui3e?=
 =?iso-8859-1?Q?To/8K+2KFw+DtXzaf5jK52BFxp12o9fgsKTblR1omKVyHO2zwWAxJ5mt2J?=
 =?iso-8859-1?Q?+pVgZEMFHgTAtKGR9aNC3fuzQtRLp4eCv7Ufk/YeL7XQnXAhejZzYpOROC?=
 =?iso-8859-1?Q?YN0cRqMKfMIvhV9roMFZUC+itIQfbGhIxRdkmlox7bovNO8JLA86Uwwa0+?=
 =?iso-8859-1?Q?wA8eNYrdXbk+jG35BEEfIcRSz13VK+lfq0NoyKOTJ7+2wWKfG5APx5D/9/?=
 =?iso-8859-1?Q?dcRAAiHYun7QrVi2jz7w+HcdqpVDkxul1AyRXSTgmfIirqFMVDM2OiIdqj?=
 =?iso-8859-1?Q?9ON3KibNuWNbk1zD5EokNGcY20gwQt42DDoIzhgxFAJWsIKOCCxoaiaL8I?=
 =?iso-8859-1?Q?uz05MKfXCV6Dj7i+bAYFDXibCyVJ3ac4N1CVXQ3s24TmHaPM4Svy6S6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 689e73d6-9c9c-4dd9-f77d-08daf9d9e351
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 04:59:04.5397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj9VcjsOo5FIGu80/GJ9tBRVsgffvhhB/yNh25mZtc1MAXzeVLAgbQ2xzSxqriMqFcB7zGddkACZiO0sAZfcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5491
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
Cc: dri-devel@lists.freedesktop.org, corbet@lwn.net, tzimmermann@suse.de,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 jason@jlekstrand.net, nouveau@lists.freedesktop.org, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote:
> On 1/18/23 21:37, Thomas Hellström (Intel) wrote:
> > 
> > On 1/18/23 07:12, Danilo Krummrich wrote:
> > > This commit provides the implementation for the new uapi motivated by the
> > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > 
> > > 1) Initialize a GPU virtual address (VA) space via the new
> > >     DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
> > >     space managed by the kernel and userspace, respectively.
> > > 
> > > 2) Allocate and free a VA space region as well as bind and unbind memory
> > >     to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> > >     UMDs can request the named operations to be processed either
> > >     synchronously or asynchronously. It supports DRM syncobjs
> > >     (incl. timelines) as synchronization mechanism. The management of the
> > >     GPU VA mappings is implemented with the DRM GPU VA manager.
> > > 
> > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
> > >     execution happens asynchronously. It supports DRM syncobj (incl.
> > >     timelines) as synchronization mechanism. DRM GEM object locking is
> > >     handled with drm_exec.
> > > 
> > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
> > > GPU scheduler for the asynchronous paths.
> > > 
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >   Documentation/gpu/driver-uapi.rst       |   3 +
> > >   drivers/gpu/drm/nouveau/Kbuild          |   2 +
> > >   drivers/gpu/drm/nouveau/Kconfig         |   2 +
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
> > >   drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
> > >   drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
> > >   drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
> > >   drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
> > >   11 files changed, 1295 insertions(+), 4 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> > >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> > >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> > >   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> > ...
> > > 
> > > +static struct dma_fence *
> > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
> > > +    struct bind_job_op *op;
> > > +    int ret = 0;
> > > +
> > 
> > I was looking at how nouveau does the async binding compared to how xe
> > does it.
> > It looks to me that this function being a scheduler run_job callback is
> > the main part of the VM_BIND dma-fence signalling critical section for
> > the job's done_fence and if so, needs to be annotated as such?
> 
> Yes, that's the case.
> 
> > 
> > For example nouveau_uvma_region_new allocates memory, which is not
> > allowed if in a dma_fence signalling critical section and the locking
> > also looks suspicious?
> 
> Thanks for pointing this out, I missed that somehow.
> 
> I will change it to pre-allocate new regions, mappings and page tables
> within the job's submit() function.
>

Yea that what we basically do in Xe, in the IOCTL step allocate all the
backing store for new page tables, populate new page tables (these are
not yet visible in the page table structure), and in last step which is
executed after all the dependencies are satified program all the leaf
entires making the new binding visible.

We screwed have this up by defering most of the IOCTL to a worker but
will fix this fix this one way or another soon - get rid of worker or
introduce a type of sync that is signaled after the worker + publish the
dma-fence in the worker. I'd like to close on this one soon.
 
> For the ops structures the drm_gpuva_manager allocates for reporting the
> split/merge steps back to the driver I have ideas to entirely avoid
> allocations, which also is a good thing in respect of Christians feedback
> regarding the huge amount of mapping requests some applications seem to
> generate.
>

It should be fine to have allocations to report the split/merge step as
this step should be before a dma-fence is published, but yea if possible
to avoid extra allocs as that is always better.

Also BTW, great work on drm_gpuva_manager too. We will almost likely
pick this up in Xe rather than open coding all of this as we currently
do. We should probably start the port to this soon so we can contribute
to the implementation and get both of our drivers upstream sooner.
 
> Regarding the locking, anything specific that makes it look suspicious to
> you?
> 

I haven't looked into this too but almost certainly Thomas is suggesting
that if you allocate memory anywhere under the nouveau_uvmm_lock then
you can't use this lock in the run_job() callback as this in the
dma-fencing path.

Matt 

> > 
> > Thanks,
> > 
> > Thomas
> > 
> > 
> > > +    nouveau_uvmm_lock(uvmm);
> > > +    list_for_each_op(op, &bind_job->ops) {
> > > +        switch (op->op) {
> > > +        case OP_ALLOC: {
> > > +            bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
> > > +
> > > +            ret = nouveau_uvma_region_new(uvmm,
> > > +                              op->va.addr,
> > > +                              op->va.range,
> > > +                              sparse);
> > > +            if (ret)
> > > +                goto out_unlock;
> > > +            break;
> > > +        }
> > > +        case OP_FREE:
> > > +            ret = nouveau_uvma_region_destroy(uvmm,
> > > +                              op->va.addr,
> > > +                              op->va.range);
> > > +            if (ret)
> > > +                goto out_unlock;
> > > +            break;
> > > +        case OP_MAP:
> > > +            ret = nouveau_uvmm_sm_map(uvmm,
> > > +                          op->va.addr, op->va.range,
> > > +                          op->gem.obj, op->gem.offset,
> > > +                          op->flags && 0xff);
> > > +            if (ret)
> > > +                goto out_unlock;
> > > +            break;
> > > +        case OP_UNMAP:
> > > +            ret = nouveau_uvmm_sm_unmap(uvmm,
> > > +                            op->va.addr,
> > > +                            op->va.range);
> > > +            if (ret)
> > > +                goto out_unlock;
> > > +            break;
> > > +        }
> > > +    }
> > > +
> > > +out_unlock:
> > > +    nouveau_uvmm_unlock(uvmm);
> > > +    if (ret)
> > > +        NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
> > > +    return ERR_PTR(ret);
> > > +}
> > > +
> > > +static void
> > > +nouveau_bind_job_free(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > +    struct bind_job_op *op, *next;
> > > +
> > > +    list_for_each_op_safe(op, next, &bind_job->ops) {
> > > +        struct drm_gem_object *obj = op->gem.obj;
> > > +
> > > +        if (obj)
> > > +            drm_gem_object_put(obj);
> > > +
> > > +        list_del(&op->entry);
> > > +        kfree(op);
> > > +    }
> > > +
> > > +    nouveau_base_job_free(job);
> > > +    kfree(bind_job);
> > > +}
> > > +
> > > +static struct nouveau_job_ops nouveau_bind_job_ops = {
> > > +    .submit = nouveau_bind_job_submit,
> > > +    .run = nouveau_bind_job_run,
> > > +    .free = nouveau_bind_job_free,
> > > +};
> > > +
> > > +static int
> > > +bind_job_op_from_uop(struct bind_job_op **pop,
> > > +             struct drm_nouveau_vm_bind_op *uop)
> > > +{
> > > +    struct bind_job_op *op;
> > > +
> > > +    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
> > > +    if (!op)
> > > +        return -ENOMEM;
> > > +
> > > +    op->op = uop->op;
> > > +    op->flags = uop->flags;
> > > +    op->va.addr = uop->addr;
> > > +    op->va.range = uop->range;
> > > +
> > > +    if (op->op == DRM_NOUVEAU_VM_BIND_OP_MAP) {
> > > +        op->gem.handle = uop->handle;
> > > +        op->gem.offset = uop->bo_offset;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static void
> > > +bind_job_ops_free(struct list_head *ops)
> > > +{
> > > +    struct bind_job_op *op, *next;
> > > +
> > > +    list_for_each_op_safe(op, next, ops) {
> > > +        list_del(&op->entry);
> > > +        kfree(op);
> > > +    }
> > > +}
> > > +
> > > +int
> > > +nouveau_bind_job_init(struct nouveau_bind_job **pjob,
> > > +              struct nouveau_exec_bind *bind)
> > > +{
> > > +    struct nouveau_bind_job *job;
> > > +    struct bind_job_op *op;
> > > +    int i, ret;
> > > +
> > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > +    if (!job)
> > > +        return -ENOMEM;
> > > +
> > > +    INIT_LIST_HEAD(&job->ops);
> > > +
> > > +    for (i = 0; i < bind->op.count; i++) {
> > > +        ret = bind_job_op_from_uop(&op, &bind->op.s[i]);
> > > +        if (ret)
> > > +            goto err_free;
> > > +
> > > +        list_add_tail(&op->entry, &job->ops);
> > > +    }
> > > +
> > > +    job->base.sync = !(bind->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
> > > +    job->base.ops = &nouveau_bind_job_ops;
> > > +
> > > +    ret = nouveau_base_job_init(&job->base, &bind->base);
> > > +    if (ret)
> > > +        goto err_free;
> > > +
> > > +    return 0;
> > > +
> > > +err_free:
> > > +    bind_job_ops_free(&job->ops);
> > > +    kfree(job);
> > > +    *pjob = NULL;
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +static int
> > > +sync_find_fence(struct nouveau_job *job,
> > > +        struct drm_nouveau_sync *sync,
> > > +        struct dma_fence **fence)
> > > +{
> > > +    u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > +    u64 point = 0;
> > > +    int ret;
> > > +
> > > +    if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > +        stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > +        return -EOPNOTSUPP;
> > > +
> > > +    if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > +        point = sync->timeline_value;
> > > +
> > > +    ret = drm_syncobj_find_fence(job->file_priv,
> > > +                     sync->handle, point,
> > > +                     sync->flags, fence);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int
> > > +exec_job_binds_wait(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > +    struct nouveau_sched_entity *bind_entity = &cli->sched_entity;
> > > +    signed long ret;
> > > +    int i;
> > > +
> > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > +        struct nouveau_job *it;
> > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > +        struct dma_fence *fence;
> > > +        bool found;
> > > +
> > > +        ret = sync_find_fence(job, sync, &fence);
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        mutex_lock(&bind_entity->job.mutex);
> > > +        found = false;
> > > +        list_for_each_entry(it, &bind_entity->job.list, head) {
> > > +            if (fence == it->done_fence) {
> > > +                found = true;
> > > +                break;
> > > +            }
> > > +        }
> > > +        mutex_unlock(&bind_entity->job.mutex);
> > > +
> > > +        /* If the fence is not from a VM_BIND job, don't wait for it. */
> > > +        if (!found)
> > > +            continue;
> > > +
> > > +        ret = dma_fence_wait_timeout(fence, true,
> > > +                         msecs_to_jiffies(500));
> > > +        if (ret < 0)
> > > +            return ret;
> > > +        else if (ret == 0)
> > > +            return -ETIMEDOUT;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +int
> > > +nouveau_exec_job_submit(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > +    struct nouveau_cli *cli = exec_job->base.cli;
> > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
> > > +    struct drm_exec *exec = &job->exec;
> > > +    struct drm_gem_object *obj;
> > > +    unsigned long index;
> > > +    int ret;
> > > +
> > > +    ret = exec_job_binds_wait(job);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    nouveau_uvmm_lock(uvmm);
> > > +    drm_exec_while_not_all_locked(exec) {
> > > +        struct drm_gpuva *va;
> > > +
> > > +        drm_gpuva_for_each_va(va, &uvmm->umgr) {
> > > +            ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
> > > +            drm_exec_break_on_contention(exec);
> > > +            if (ret)
> > > +                return ret;
> > > +        }
> > > +    }
> > > +    nouveau_uvmm_unlock(uvmm);
> > > +
> > > +    drm_exec_for_each_locked_object(exec, index, obj) {
> > > +        struct dma_resv *resv = obj->resv;
> > > +        struct nouveau_bo *nvbo = nouveau_gem_object(obj);
> > > +
> > > +        ret = nouveau_bo_validate(nvbo, true, false);
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        dma_resv_add_fence(resv, job->done_fence, DMA_RESV_USAGE_WRITE);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static struct dma_fence *
> > > +nouveau_exec_job_run(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > +    struct nouveau_fence *fence;
> > > +    int i, ret;
> > > +
> > > +    ret = nouveau_dma_wait(job->chan, exec_job->push.count + 1, 16);
> > > +    if (ret) {
> > > +        NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
> > > +        return ERR_PTR(ret);
> > > +    }
> > > +
> > > +    for (i = 0; i < exec_job->push.count; i++) {
> > > +        nv50_dma_push(job->chan, exec_job->push.s[i].va,
> > > +                  exec_job->push.s[i].va_len);
> > > +    }
> > > +
> > > +    ret = nouveau_fence_new(job->chan, false, &fence);
> > > +    if (ret) {
> > > +        NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
> > > +        WIND_RING(job->chan);
> > > +        return ERR_PTR(ret);
> > > +    }
> > > +
> > > +    return &fence->base;
> > > +}
> > > +static void
> > > +nouveau_exec_job_free(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
> > > +
> > > +    nouveau_base_job_free(job);
> > > +
> > > +    kfree(exec_job->push.s);
> > > +    kfree(exec_job);
> > > +}
> > > +
> > > +static struct nouveau_job_ops nouveau_exec_job_ops = {
> > > +    .submit = nouveau_exec_job_submit,
> > > +    .run = nouveau_exec_job_run,
> > > +    .free = nouveau_exec_job_free,
> > > +};
> > > +
> > > +int
> > > +nouveau_exec_job_init(struct nouveau_exec_job **pjob,
> > > +              struct nouveau_exec *exec)
> > > +{
> > > +    struct nouveau_exec_job *job;
> > > +    int ret;
> > > +
> > > +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
> > > +    if (!job)
> > > +        return -ENOMEM;
> > > +
> > > +    job->push.count = exec->push.count;
> > > +    job->push.s = kmemdup(exec->push.s,
> > > +                  sizeof(*exec->push.s) *
> > > +                  exec->push.count,
> > > +                  GFP_KERNEL);
> > > +    if (!job->push.s) {
> > > +        ret = -ENOMEM;
> > > +        goto err_free_job;
> > > +    }
> > > +
> > > +    job->base.ops = &nouveau_exec_job_ops;
> > > +    ret = nouveau_base_job_init(&job->base, &exec->base);
> > > +    if (ret)
> > > +        goto err_free_pushs;
> > > +
> > > +    return 0;
> > > +
> > > +err_free_pushs:
> > > +    kfree(job->push.s);
> > > +err_free_job:
> > > +    kfree(job);
> > > +    *pjob = NULL;
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +void nouveau_job_fini(struct nouveau_job *job)
> > > +{
> > > +    dma_fence_put(job->done_fence);
> > > +    drm_sched_job_cleanup(&job->base);
> > > +    job->ops->free(job);
> > > +}
> > > +
> > > +static int
> > > +nouveau_job_add_deps(struct nouveau_job *job)
> > > +{
> > > +    struct dma_fence *in_fence = NULL;
> > > +    int ret, i;
> > > +
> > > +    for (i = 0; i < job->in_sync.count; i++) {
> > > +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
> > > +
> > > +        ret = sync_find_fence(job, sync, &in_fence);
> > > +        if (ret) {
> > > +            NV_PRINTK(warn, job->cli,
> > > +                  "Failed to find syncobj (-> in): handle=%d\n",
> > > +                  sync->handle);
> > > +            return ret;
> > > +        }
> > > +
> > > +        ret = drm_sched_job_add_dependency(&job->base, in_fence);
> > > +        if (ret)
> > > +            return ret;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int
> > > +nouveau_job_fence_attach(struct nouveau_job *job, struct dma_fence
> > > *fence)
> > > +{
> > > +    struct drm_syncobj *out_sync;
> > > +    int i;
> > > +
> > > +    for (i = 0; i < job->out_sync.count; i++) {
> > > +        struct drm_nouveau_sync *sync = &job->out_sync.s[i];
> > > +        u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
> > > +
> > > +        if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
> > > +            stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
> > > +            return -EOPNOTSUPP;
> > > +
> > > +        out_sync = drm_syncobj_find(job->file_priv, sync->handle);
> > > +        if (!out_sync) {
> > > +            NV_PRINTK(warn, job->cli,
> > > +                  "Failed to find syncobj (-> out): handle=%d\n",
> > > +                  sync->handle);
> > > +            return -ENOENT;
> > > +        }
> > > +
> > > +        if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
> > > +            struct dma_fence_chain *chain;
> > > +
> > > +            chain = dma_fence_chain_alloc();
> > > +            if (!chain) {
> > > +                drm_syncobj_put(out_sync);
> > > +                return -ENOMEM;
> > > +            }
> > > +
> > > +            drm_syncobj_add_point(out_sync, chain, fence,
> > > +                          sync->timeline_value);
> > > +        } else {
> > > +            drm_syncobj_replace_fence(out_sync, fence);
> > > +        }
> > > +
> > > +        drm_syncobj_put(out_sync);
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static struct dma_fence *
> > > +nouveau_job_run(struct nouveau_job *job)
> > > +{
> > > +    return job->ops->run(job);
> > > +}
> > > +
> > > +static int
> > > +nouveau_job_run_sync(struct nouveau_job *job)
> > > +{
> > > +    struct dma_fence *fence;
> > > +    int ret;
> > > +
> > > +    fence = nouveau_job_run(job);
> > > +    if (IS_ERR(fence)) {
> > > +        return PTR_ERR(fence);
> > > +    } else if (fence) {
> > > +        ret = dma_fence_wait(fence, true);
> > > +        if (ret)
> > > +            return ret;
> > > +    }
> > > +
> > > +    dma_fence_signal(job->done_fence);
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +int
> > > +nouveau_job_submit(struct nouveau_job *job)
> > > +{
> > > +    struct nouveau_sched_entity *entity =
> > > to_nouveau_sched_entity(job->base.entity);
> > > +    int ret;
> > > +
> > > +    drm_exec_init(&job->exec, true);
> > > +
> > > +    ret = nouveau_job_add_deps(job);
> > > +    if (ret)
> > > +        goto out;
> > > +
> > > +    drm_sched_job_arm(&job->base);
> > > +    job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> > > +
> > > +    ret = nouveau_job_fence_attach(job, job->done_fence);
> > > +    if (ret)
> > > +        goto out;
> > > +
> > > +    if (job->ops->submit) {
> > > +        ret = job->ops->submit(job);
> > > +        if (ret)
> > > +            goto out;
> > > +    }
> > > +
> > > +    if (job->sync) {
> > > +        drm_exec_fini(&job->exec);
> > > +
> > > +        /* We're requested to run a synchronous job, hence don't push
> > > +         * the job, bypassing the job scheduler, and execute the jobs
> > > +         * run() function right away.
> > > +         *
> > > +         * As a consequence of bypassing the job scheduler we need to
> > > +         * handle fencing and job cleanup ourselfes.
> > > +         */
> > > +        ret = nouveau_job_run_sync(job);
> > > +
> > > +        /* If the job fails, the caller will do the cleanup for us. */
> > > +        if (!ret)
> > > +            nouveau_job_fini(job);
> > > +
> > > +        return ret;
> > > +    } else {
> > > +        mutex_lock(&entity->job.mutex);
> > > +        drm_sched_entity_push_job(&job->base);
> > > +        list_add_tail(&job->head, &entity->job.list);
> > > +        mutex_unlock(&entity->job.mutex);
> > > +    }
> > > +
> > > +out:
> > > +    drm_exec_fini(&job->exec);
> > > +    return ret;
> > > +}
> > > +
> > > +static struct dma_fence *
> > > +nouveau_sched_run_job(struct drm_sched_job *sched_job)
> > > +{
> > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > +
> > > +    return nouveau_job_run(job);
> > > +}
> > > +
> > > +static enum drm_gpu_sched_stat
> > > +nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
> > > +{
> > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > +    struct nouveau_channel *chan = job->chan;
> > > +
> > > +    if (unlikely(!atomic_read(&chan->killed)))
> > > +        nouveau_channel_kill(chan);
> > > +
> > > +    NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
> > > +          chan->chid);
> > > +
> > > +    nouveau_sched_entity_fini(job->entity);
> > > +
> > > +    return DRM_GPU_SCHED_STAT_ENODEV;
> > > +}
> > > +
> > > +static void
> > > +nouveau_sched_free_job(struct drm_sched_job *sched_job)
> > > +{
> > > +    struct nouveau_job *job = to_nouveau_job(sched_job);
> > > +    struct nouveau_sched_entity *entity = job->entity;
> > > +
> > > +    mutex_lock(&entity->job.mutex);
> > > +    list_del(&job->head);
> > > +    mutex_unlock(&entity->job.mutex);
> > > +
> > > +    nouveau_job_fini(job);
> > > +}
> > > +
> > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > +                  struct drm_gpu_scheduler *sched)
> > > +{
> > > +
> > > +    INIT_LIST_HEAD(&entity->job.list);
> > > +    mutex_init(&entity->job.mutex);
> > > +
> > > +    return drm_sched_entity_init(&entity->base,
> > > +                     DRM_SCHED_PRIORITY_NORMAL,
> > > +                     &sched, 1, NULL);
> > > +}
> > > +
> > > +void
> > > +nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
> > > +{
> > > +    drm_sched_entity_destroy(&entity->base);
> > > +}
> > > +
> > > +static const struct drm_sched_backend_ops nouveau_sched_ops = {
> > > +    .run_job = nouveau_sched_run_job,
> > > +    .timedout_job = nouveau_sched_timedout_job,
> > > +    .free_job = nouveau_sched_free_job,
> > > +};
> > > +
> > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > +               struct nouveau_drm *drm)
> > > +{
> > > +    long job_hang_limit =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +
> > > +    return drm_sched_init(sched, &nouveau_sched_ops,
> > > +                  NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> > > +                  NULL, NULL, "nouveau", drm->dev->dev);
> > > +}
> > > +
> > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched)
> > > +{
> > > +    drm_sched_fini(sched);
> > > +}
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > new file mode 100644
> > > index 000000000000..7fc5b7eea810
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> > > @@ -0,0 +1,98 @@
> > > +// SPDX-License-Identifier: MIT
> > > +
> > > +#ifndef NOUVEAU_SCHED_H
> > > +#define NOUVEAU_SCHED_H
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_exec.h>
> > > +#include <drm/gpu_scheduler.h>
> > > +
> > > +#include "nouveau_drv.h"
> > > +#include "nouveau_exec.h"
> > > +
> > > +#define to_nouveau_job(sched_job)        \
> > > +        container_of((sched_job), struct nouveau_job, base)
> > > +
> > > +#define to_nouveau_exec_job(job)        \
> > > +        container_of((job), struct nouveau_exec_job, base)
> > > +
> > > +#define to_nouveau_bind_job(job)        \
> > > +        container_of((job), struct nouveau_bind_job, base)
> > > +
> > > +struct nouveau_job {
> > > +    struct drm_sched_job base;
> > > +    struct list_head head;
> > > +
> > > +    struct nouveau_sched_entity *entity;
> > > +
> > > +    struct drm_file *file_priv;
> > > +    struct nouveau_cli *cli;
> > > +    struct nouveau_channel *chan;
> > > +
> > > +    struct drm_exec exec;
> > > +    struct dma_fence *done_fence;
> > > +
> > > +    bool sync;
> > > +
> > > +    struct {
> > > +        struct drm_nouveau_sync *s;
> > > +        u32 count;
> > > +    } in_sync;
> > > +
> > > +    struct {
> > > +        struct drm_nouveau_sync *s;
> > > +        u32 count;
> > > +    } out_sync;
> > > +
> > > +    struct nouveau_job_ops {
> > > +        int (*submit)(struct nouveau_job *);
> > > +        struct dma_fence *(*run)(struct nouveau_job *);
> > > +        void (*free)(struct nouveau_job *);
> > > +    } *ops;
> > > +};
> > > +
> > > +struct nouveau_exec_job {
> > > +    struct nouveau_job base;
> > > +
> > > +    struct {
> > > +        struct drm_nouveau_exec_push *s;
> > > +        u32 count;
> > > +    } push;
> > > +};
> > > +
> > > +struct nouveau_bind_job {
> > > +    struct nouveau_job base;
> > > +
> > > +    /* struct bind_job_op */
> > > +    struct list_head ops;
> > > +};
> > > +
> > > +int nouveau_bind_job_init(struct nouveau_bind_job **job,
> > > +              struct nouveau_exec_bind *bind);
> > > +int nouveau_exec_job_init(struct nouveau_exec_job **job,
> > > +              struct nouveau_exec *exec);
> > > +
> > > +int nouveau_job_submit(struct nouveau_job *job);
> > > +void nouveau_job_fini(struct nouveau_job *job);
> > > +
> > > +#define to_nouveau_sched_entity(entity)        \
> > > +        container_of((entity), struct nouveau_sched_entity, base)
> > > +
> > > +struct nouveau_sched_entity {
> > > +    struct drm_sched_entity base;
> > > +    struct {
> > > +        struct list_head list;
> > > +        struct mutex mutex;
> > > +    } job;
> > > +};
> > > +
> > > +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
> > > +                  struct drm_gpu_scheduler *sched);
> > > +void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
> > > +
> > > +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
> > > +               struct nouveau_drm *drm);
> > > +void nouveau_sched_fini(struct drm_gpu_scheduler *sched);
> > > +
> > > +#endif
> > 
> 
