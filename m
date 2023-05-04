Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D56F6CA6
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 15:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8E710E4EC;
	Thu,  4 May 2023 13:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60E10E4EC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683205940; x=1714741940;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/BAQCkqmjUCr1M1rQcr852pqC6+hXvrQWD/F/2vxTiY=;
 b=BQTwpqxMv3Su2/sybyVC4yfwuEF1YAoQ/xDoyaAzSHNED3tKazJ5X2HF
 tyQCYXvPB3Z/LYnoeem2CPLlxaJaBGbILFyL7w/etwM/URpV6o2AM61VL
 zEWIu7AwF1WSugCbeoW1G2rydT13+D+QDBdEZTDdKDV58calFuemNNL1c
 mq9lLWQkDcHPCrjMShPuCleSIspdPHaAFPgDPXkvkPuWZ5U9g3NBya1vH
 H3kJFZF5PKEUsxsqviqOxtYBfxKItH+k6GO7HtdhbWYFoXc9vKAk6Vo1P
 WvYL8OEKijRCe9bEmIMosrhiLZL5rlj+THFaOSY8xgdvwsR5UdnBDvBGi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="351923413"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351923413"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727574382"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="727574382"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 04 May 2023 06:07:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 06:07:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 06:07:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 06:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzVbF5P0nyjWiMAonZ3SMKu6CiWXQRUncm2bbxqNFy2veyXdCEubHgo8nYVIrHtG6Ng1fEpc9qulT6MYeOzo57zshKsYIquyX0uaw0niMAatiRzgyGOQV8a+liA/6wZf27F7YXAemk+7gaHowO97mmr40QkMxQnZ2jvVoWvELEgsjtvQ8G3tsNiPn9x4b9WVfIPM7cQPq7baaDXhsLO1l4h00q4HjcaE3BnWSu3nuqw1BkpQo9VnHQZp+/6NUo6/Y+gYz+IG+Isn732Y4siusQS66pvU6udBY+eAZiJ/SFYM7Mo4OBG+fGyny0qd1XTT2fKlUSbQPMzCBDzwLcnLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdrZTv9jizN00E9/3Y8Si31fy9PMV8swX0Fwod5cNl0=;
 b=O3ZxFIYBRKazLYvvIFbM6W1XvE+sPKZWN1z0jMi69KVdSgckW/njZji4U3rGqLtnipUByTKtvk8N5Lst3c8ARaGJvWGrtuDFyUujASxnlXpqjR2fRw0xMfYfmsdmKVC2y0g1qY+Oq+yUN+Z1m1/WB5OycUN4YRycl6388knfwOWDuzZSToMbtqytEDGiAYojqYKvt2ymMqN8hXxzOchfEVYuEn3lGBVQOjURsKyeHCyHvWyxxr71q1VREbSRg/hInDhACe8FZGMRVq24/Daa9dgDcACcqrivQO4yaaTnRPFv1HdaxTaArkq66a56Cxlq+ynPH3e/iA40kIpOAHlECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7064.namprd11.prod.outlook.com (2603:10b6:806:2b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 13:07:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 13:07:23 +0000
Date: Thu, 4 May 2023 13:07:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <ZFOt9j43zJ8mBGpR@DUT025-TGLU.fm.intel.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
 <ZFM6hElmnFsBwyOi@DUT025-TGLU.fm.intel.com>
 <032b90ad-e198-5d7f-2880-2e8ae20dc7d3@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <032b90ad-e198-5d7f-2880-2e8ae20dc7d3@amd.com>
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: c357e12b-db09-44e9-590e-08db4ca08012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwOxHqIkZR1uuJwQEIdm9FyAEeqmqVh72AMkXHO91GzqPUMTd4cLZHZLXEHsgfs1s4AjtLNGO3MOX2IOYoLbMgzVziKGbxf93ZnjY83L0FXu1Kffc9kBzRPwMxQuppl8Im/NTW+B0/YxKJ5vONJBIveSAmxt2/XcSndeUzagAgWnWnWBZyw5Nv7zYbDU0MPIfZb8DSvux1o0BlzCvSitOWPyBlyIDdXfkrfqb42Iwxt1UtNvecRTEuexwgISJ2ILgM9MYBX4CeQK1bwKVO5iRMqaWVulLS9MTbbCala6rH2de8nKgYWXDXVNvZce6+ZPT6o4o70C6hWL+u2B6I6qhK+uuiwEpj4B481c0HYrHL2OEbqv6ao/0QFefmPFmYCoBIwzu8syutqw51bCpopSBRz7DehSKi/++yya7dHtF7wL/MndlteZSAHQ5Dm37GPG8hItbG34ax7Hyt5dDIrJNlK1sPUNa1dzbBCo+fINi6VE4mqqyM3fAsQZOViiCO/D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(186003)(26005)(6512007)(6506007)(2906002)(66946007)(4326008)(6916009)(54906003)(83380400001)(66574015)(86362001)(8936002)(82960400001)(6486002)(966005)(478600001)(44832011)(41300700001)(8676002)(5660300002)(316002)(66556008)(66476007)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Raaka9hvxuCNWRKyxrgnTrCS9tMDL+9Oe3q5kJ54S2ZA85P+TEO93wHe9Q?=
 =?iso-8859-1?Q?bqVC3yi3UJ64AJiBJbaY/HUP1NZOWEtQjCe2lhWDiz+2lqvQt2WteHKs68?=
 =?iso-8859-1?Q?P6R58t+dJ4CtqdrFqGkPKf2eePxIsHZQH0defZIaZpl7w9WjbmDII3V/WG?=
 =?iso-8859-1?Q?zd8dygv9XRU8lTgk7dCsB03kg0fy7UB6YUjoSUv5t7QmoCtm3MW10W/w3g?=
 =?iso-8859-1?Q?dP5+VdiwdZMxiDsf3oFdv0QCPFgl+qiYemSYryEMZsC9k1hr/zDKH5mNao?=
 =?iso-8859-1?Q?FUYzO2AB/pwxVD1/G/MiBgrhhfNymIL9+iK1eDQLjPA2WIAgqpEbwia+mL?=
 =?iso-8859-1?Q?MZtMOUQOv12ufautyQHXNCSMRu2hyPI3oCt8i8lOYV9TNBuNMkcqMX8SdY?=
 =?iso-8859-1?Q?M26G5i8+OVd9HFiBsxzWlaa9clziH59t98nPrrAN4hbUue87bKPA+XbwcU?=
 =?iso-8859-1?Q?uS/Xw71p2Kb6Kov6MsWjgh734iFsqejT7ywO6TjrxDeSc+7QHCCDMM/XKH?=
 =?iso-8859-1?Q?ayazFZlH8IT511gC9FwlPy1y7iKr0AQm/VATi8Y/XLpnFiWalCPCB9K8/o?=
 =?iso-8859-1?Q?TTjJ0aCWjVPk861ymo7WPQsZkPVF8rnWtIlngkJ7Bm7K6xscfOHNz4ynj1?=
 =?iso-8859-1?Q?z92lTg6Nckqb8hgQ0g1UFxcRYokP3ulDl9M/wi0QJ/ldk6Y3TANzwd3Q1i?=
 =?iso-8859-1?Q?svYOKI88mJy1bAi+95nmvs4on9IYDSOjXXgac1NV8R+ERNJjP0t22PSK79?=
 =?iso-8859-1?Q?uHuJl5QYuQimhnFHjLOTdLoZvutlJfrjKUclmv2pErS7Mcjw2sUHTA4i0i?=
 =?iso-8859-1?Q?PBaWUhr3ATq8QSW2dM6OhXJPB4CMpB40GdGhYhLoLK05/PaH/+1krmqVly?=
 =?iso-8859-1?Q?gS8IKUufVFQP0DN+5uhU82ay34oDwL4sG5SzjDbupq0O4QLbLhXTWQMZJr?=
 =?iso-8859-1?Q?EuoGEchHYHApsl9S5dk9g8HRpVThA6VUM6aHBIvGDmSjsZYU8nizSsMJG4?=
 =?iso-8859-1?Q?YsoOquYnnvc0TRCAgmA0Ld04L7Mw7cmaf1DIibQJoGy7o++9IAmxLfAoZI?=
 =?iso-8859-1?Q?YextYmyXiqQcoLwYA5IExcNM3y5enXPPEVq/G4HqRLp9PxZ0gETPCeAEAF?=
 =?iso-8859-1?Q?96nc7cEQQlC29VQyYz5SkKyuB3edDxoLEXxUTI5b+AH77YQ2e0J0zO5ozt?=
 =?iso-8859-1?Q?5/93E8o/Nz1v418kNkbGQE/Y2gEGLwln6XNVmRr9lTJ6BISS6yNlUE6fbj?=
 =?iso-8859-1?Q?8UbV+JJ9p9VVvp9niC32UYLEto9oxVFg/hKFalaZMRvzjnliEWMSnqhgv1?=
 =?iso-8859-1?Q?DXjGJLOA24TrKvDSEc22+JJ1oZLWfDSz36tBrcnEXS57VUAiv3+IJmljDr?=
 =?iso-8859-1?Q?TUwpjNhjbZKhOyg46odGGbXUrV/uDSEHTQ6zoJXk5D92uvFFEgxhHI/p9m?=
 =?iso-8859-1?Q?IjZEkMGOxu0xh0PhxuJaIJ/i+IuYC3euXtVjGuawthyS0WiGLmE2YjZSvr?=
 =?iso-8859-1?Q?ukhTWBgSCVi03aueEeyd6RR2SmExyrO7OzfZ37KUxam39XUkotQiqw5k0Z?=
 =?iso-8859-1?Q?bkHEPxW++PWphChZDt3FT9oI1BC4+hrdofIaDDaZEv6BFNGwBS9J2xOtrW?=
 =?iso-8859-1?Q?wEYaQ6lcIVXEwZNmwFqR9DRIi90jBM6MtG0xrqAN2ic4xJrAZroIXaJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c357e12b-db09-44e9-590e-08db4ca08012
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:07:23.1989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moqEzsZzJuN3uED/RFpkY7pdGr46fwMmyg4ipXuMEndIVNdev9eWkbSr5pAWjlotqRz214yEGo1LpuLsuqmaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7064
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Sarah
 Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 01:07:29PM +0200, Christian König wrote:
> Am 04.05.23 um 06:54 schrieb Matthew Brost:
> > On Wed, May 03, 2023 at 10:47:43AM +0200, Christian König wrote:
> > > Adding Luben as well.
> > > 
> > > Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> > > > [SNIP]
> > > > > To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
> > > > After the discussion I had with Matthew yesterday on IRC, I
> > > > realized there was no clear agreement on this. Matthew uses those 3
> > > > helpers in the Xe driver right now, and given he intends to use a
> > > > multi-threaded wq for its 1:1 schedulers run queue, there's no way he
> > > > can get away without calling drm_sched_{start,stop}().
> > > > drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
> > > > wondering if it wouldn't be preferable to add a ::resubmit_job() method
> > > > or extend the ::run_job() one to support the resubmit semantics, which,
> > > > AFAIU, is just about enforcing the job done fence (the one returned by
> > > > ::run_job()) doesn't transition from a signaled to an unsignaled state.
> > > > 
> > > > But probably more important than providing a generic helper, we should
> > > > document the resubmit semantics (AKA, what should and/or shouldn't be
> > > > done with pending jobs when a recovery happens). Because forbidding
> > > > people to use a generic helper function doesn't give any guarantee that
> > > > they'll do the right thing when coding their own logic, unless we give
> > > > clues about what's considered right/wrong, and the current state of the
> > > > doc is pretty unclear in this regard.
> > > I should probably talk about the history of the re-submit feature a bit
> > > more.
> > > 
> > > Basically AMD came up with re-submission as a cheap way of increasing the
> > > reliability of GPU resets. Problem is that it turned into an absolutely
> > > nightmare. We tried for the last 5 years or so to get that stable and it's
> > > still crashing.
> > > 
> > > The first and most major problem is that the kernel doesn't even has the
> > > information if re-submitting jobs is possible or not. For example a job
> > > which has already been pushed to the hw could have grabbed a binary
> > > semaphore and re-submitting it will just wait forever for the semaphore to
> > > be released.
> > > 
> > > The second problem is that the dma_fence semantics don't allow to ever
> > > transit the state of a fence from signaled back to unsignaled. This means
> > > that you can't re-use the hw fence and need to allocate a new one, but since
> > > memory allocation is forbidden inside a reset handler as well (YES we need
> > > to better document that part) you actually need to keep a bunch of hw fences
> > > pre-allocated around to make this work. Amdgpu choose to illegally re-use
> > > the hw fence instead which only works with quite extreme hacks.
> > > 
> > > The third problem is that the lifetime of the job object was actually
> > > defined very well before we tried to use re-submission. Basically it's just
> > > an intermediate state used between the IOCTL and pushing things to the hw,
> > > introducing this re-submit feature completely messed that up and cause quite
> > > a number of use after free errors in the past which are again only solved by
> > > quite some hacks.
> > > 
> > > What we should do in the GPU scheduler instead is the follow:
> > > 
> > > 1. Don't support re-submission at all!
> > >      Instead we can provide help to drivers to query which fences (scheduler
> > > or hw) are still not signaled yet.
> > >      This can then be used to re-create hw state if (and only if!) the driver
> > > knows what it's doing and can actually guarantee that this will work.
> > >      E.g. the case for XE where the kernel driver knows the contexts which
> > > were not running at the time and can re-create their queues.
> > > 
> > > 2. We can provide both a wq to use for single threaded application as well
> > > as start/stop semantics.
> > >      It's just that the start/stop semantics should never touch what was
> > > already submitted, but rather just make sure that we don't get any new
> > > submissions.
> > > 
> > I pretty much agree with everything Christian has said here and Xe
> > aligns with this. Let me explain what Xe does.
> > 
> > 1. Entity hang (TDR timeout of job on a entity, firmware notifies Xe that a
> > entity hung, entity IOMMU CAT error, etc...):
> > 	- No re-submission at all
> > 	- ban the entity
> > 	- notify the UMD
> > 	- cleanup all pending jobs / fences
> > 2. Entire GPU hang (worth mentioning with good HW + KMD this *should*
> > never happen):
> > 	- stop all schedulers (same as a entity in Xe because 1 to 1)
> > 	- cleanup odd entity state related to communication with the
> > 	  firmware
> > 	- check if an entity has a job that started but not finished, if
> > 	  so ban it (same mechanism as above)
> > 	- resubmit all jobs from good entities
> 
> As long as you can do this without creating new dma_fence objects for the hw
> submissions everything should be fine.
> 

Yep, same fence.

> > 	- start all schedulers (same as a entity in Xe because 1 to 1)
> > 
> > The implementation for this in the following file [1]. Search for the
> > drm scheduler functions and you should be able to find implementation
> > easily.
> > 
> > If you want to use an ordered work queue to avoid the stop / start dance
> > great do that, in Xe the stop / start dance works. I have extensively
> > tested this and the flow is rock solid and please trust me when I say
> > this as I worked on reset flows in the i915 and fought bugs for years, I
> > still don't think it is in the i915 because we try to do resubmission +
> > crazy races. Because of that I was incredibly paranoid when I
> > implemented this + tested it extensively.
> > 
> > I'll post an updated version of my DRM scheduler series [2] on the list
> > soon for the WQ changes, plus whatever else is required for Xe.
> > 
> > So my take from this discussion is maybe with a little documentation, we
> > are good. Thoughts?
> 
> For XE what you describe above basically sounds perfectly fine to me.
> 
> I strongly assume when you re-submit things you just tell your hw scheduler
> to pick up at the place it left of? E.g. set a read pointer and write
> pointer of a ring buffer appropriately?
>

Yep.

Matt
 
> Christian.
> 
> > 
> > Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c
> > [2] https://patchwork.freedesktop.org/series/116055/
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Regards,
> > > > 
> > > > Boris
> 
