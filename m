Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AA660A68
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 00:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050FE10E90D;
	Fri,  6 Jan 2023 23:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A4E10E2D3;
 Fri,  6 Jan 2023 23:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673049146; x=1704585146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p80XEVc+zImWkL4SHwttYFkSNcJ/aSl2NiT7oGrdxcU=;
 b=XAu26kXXhHftNM2PkKf5Gm2RIgPbqCUtOotaObzeR+5TMKlNgnutq5FH
 NdCAVh6hpUTvNSTpa+UWb4CjcgXjGI9A+m1tvmhZTWgtd54Fc1xf32Fcf
 NPAcxC1xG9pqzMHJoC/lZ1LHY+hMQZ8CGFt+Zlsxzwv8n38Zv9x7jJBBF
 7MHfHGFlyy2YR3bA073atF4w4hxbs6p/IA9p15UgwcXcl3BQfH/Wtn/jL
 JjGEW8AceTQhpecewoct7+e6CNSyYgJr8N5G3JThX/yhsWyHKA+yVyFO4
 L1yzMJacAJTcemKmjRCIfvsUOXyJrJgWbmZL7b3BejMUJyn7jtyI/ti6B Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="408836444"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="408836444"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 15:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="719355432"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="719355432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jan 2023 15:52:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 15:52:25 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 15:52:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 15:52:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 15:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuWkLaXEhCy4XBjDI1ENFFnECGNQKma9TpldL4XM0MVQsTXaDSryBV8/PlRYZasDoPmrru0ZpBWUiqjXvF417r2BC850tJFrMIUc/71n33GA9XSYrZ3GwnNo6IEpimfkdwswtlzr3Ki54vt7ZOZsaVrXJrbezqFDSKxa4xSS9taeFeMw+nJ15Vgh5TjK+kBIlV9L3WhG8UmO1B4lVgs36H2EbMX6EA/KR3I2PazZ3xHT0sWF8AFwfvmkg9TD3Y2V+btP5lwfgeQELVSHdCgl6c+Z5GqLw3nCaEY67kqf1GX4aKp9WBj5sa+/tVIjpSD55janA4w+uyHB8hlSq9ZWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybcSQ/zfNJ1qni9i3Bjr5sQJG5K+NZIzQs/OKaiFacw=;
 b=Lt8/l37iozMbnpps+VuJLzXtvL+a9ECWeqiLfWsapIMxf3AI6nrob1K7G7Z2fEV1dZ7Gp/zfjdLqtwqR8QRP1Z7cRqCrlLJ4gG0BmiUUzpB8vOoHKHJ2bBytUoPG4bu2EGw9PpnLZqMhVxt8S/07GEF8SZEnEaeAgdw3LKLVZ8Vwhicb/4XnlXwny76o22KAHVV1wQnaiDtJEQ2mwl93D5b3KJfXuFfWRNCaKNGb/tvKji4zlg0cDVtKS272NEc1oiJHBYH+dMldaDUPVvREuDwbLD+K151V3bTHRZZO8Ts9FnRYMJ3vJb7rnl1ei88kDqVz4Bmpoepbeiupa1t7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 23:52:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%5]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 23:52:22 +0000
Date: Fri, 6 Jan 2023 23:52:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b67524-7ef2-4118-ffca-08daf0410dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8nFbNBR4Yjk1lLNz+EUJDUUkO6zSo1FgDzkRoG/ygqkF2vR3IF1abbSGI0y5+sqK3gHiJby24kUgd9YrWWLlV+zRNwag/s1o0NjDbWOPd5fKWl9Z4+CtHz/hTJRWylzE62F8rwXuGlxPX7ZzN7F5KV4IO0eWdGZxrDyTqvFETBMD317O0/obGe5w0B9FCzIxR8206VhDeezoikwpfYrT4XNFBsJW6qEwSFFySL6XeCf2LiwBfm84WYIKWO2CxL+i0p0qbPG1vaQmhNkuid5GMWohjZ2HNXvPuikuAfArRsb5FdI+A1gCZOEGjqJRzW6pA2Np2+3mYSC1hGzmugUyvszU3lqqPrt8Oo33nCJYuwzYCK4sWh1/Tx4T4pTQlrPlGxOOhoebmjWrywln5uf0hRoi/7q0Iiyk0XFU9vIl3yv1V9zMwwVxpLGj1pYZeJ6R2xtAjTEVNAj8sF/AHXf/+sQY1H5iHEUd3v2QZOP2t1LQPlFFKI+QKGBkJHDP5kwP2rWnBOwcGr+BNqodWvADvIRsOLtqO9a395UXId12tqUGWBkzvTucsJ/QheGso89fXXqyl7msndnL+eyLDeHDOehuJZWxu0wJgP+MGxzE04e+xLZvK2PCS8C1h5OIdyn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199015)(5660300002)(2906002)(8676002)(44832011)(41300700001)(4326008)(66899015)(8936002)(66556008)(66476007)(66946007)(6916009)(966005)(6486002)(478600001)(316002)(26005)(30864003)(6666004)(186003)(6506007)(6512007)(83380400001)(53546011)(82960400001)(38100700002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5YEnw22naz1SrYk0ySWhLCVxtHq2cJ3L52v/UYI4wogLeuQjKXsp2Egbt8/?=
 =?us-ascii?Q?dmIRIMiZHP9pJUsCc/LubrDRwWDKSRpSIM+x8WrWy6gSAOwmdDGmmfhE5dBv?=
 =?us-ascii?Q?MFn4rSw2S2EdIqhO59p8AxNnroDM8JxKZTPNxPi5jfse9b+4cscv57XPLSVs?=
 =?us-ascii?Q?FqSOWnkz6a7hZ8yNGguesv7EYAMCwnrkg3qG2a45hW1nghrkMHkTyJWwPG/H?=
 =?us-ascii?Q?dVcXmIv6IBj1mZwBnVghfJJ020llr7y+GL9Oyi3YAmobd67Nm94nJVco3X0A?=
 =?us-ascii?Q?SagQdc8eBML8V6ZVkBFXD0nK2/wb1z900cdE2T18T6WkMmVRaHmPLuJ9lyZ+?=
 =?us-ascii?Q?AshNmeQIhswscxIq8WzGfKwxSXQermsJVJMThWX+bDF15TuLz2tYqnxuX6Ix?=
 =?us-ascii?Q?AIwu+ozVcuP/FeBtenaSYHvTl7Zl/5eA9I93GZmthl9Av3fyH+F6tvb3tBO3?=
 =?us-ascii?Q?kfPvPxZqiZw3W+6j1mBF7B5hDbhJRyfGzqLARKHGOV7C+GUkwT4OzvQe0UGJ?=
 =?us-ascii?Q?Wj5ih6WmIJzY3Bz+Iu/syd9dnZkOXiJouO8jGArsTJ32BmIIZ2w5wP8aUBSR?=
 =?us-ascii?Q?do1LfRn/aNO1XTLKjtfN3ZlU8M15mAOUjdg3F/0PbRnSYeCONOxKeUVfFbfZ?=
 =?us-ascii?Q?6Esd6KKtQJAfRqk03sKPuKJHUJtg/sERWNH2CKTa94WLlfR/2NNaCxR/ekU7?=
 =?us-ascii?Q?GqYsRpYYQeo8bZDRI6Aw1ffz38jiByNPllZI3uoLVxi4hHTb0PJWhr8Hc+Ju?=
 =?us-ascii?Q?lIogXub8NlGXb4G33dB1rL6t8nburRoAhjzqglhosCCHBMEbjA1EyZacnHJh?=
 =?us-ascii?Q?6cV/QJ8i2pUw/1gAd1DcA6O2Jjg4tQeUprdnpok0PpakRukn1+aOoP16wM9M?=
 =?us-ascii?Q?Ogd0awKDYiuf41GUuwzR354IPWi8hMFPfuQU+TN8EUQo68qLOmWxwX5waRJ9?=
 =?us-ascii?Q?/82tdtcl4UJBrRqzPUaqFPclxQ0ULaS/uUtNde08i/MBnkRXeRyFJ+9VRBCc?=
 =?us-ascii?Q?zH6rDqqBPGrUpdKwn6dliaOBK1h3gH575lTYbyTX2V+b29UUCAVVBS1x+X5h?=
 =?us-ascii?Q?NuDfvC5AK2qaPqT4UGJ9Tzsa4kS15c0gdEyBCR2r5jxCmSl5rXoNxJI/MKkQ?=
 =?us-ascii?Q?PRvn6Zz39mGymYPMKNxccLL4ltyFBN5U70noxCJhqJZJ904/YTFHLxAUUIh3?=
 =?us-ascii?Q?gWtJUcoRZsnA37+Z/AFq65LI9T2Pf7BsH1WqekuHd6kfEZKGdk6xrTnisgQ0?=
 =?us-ascii?Q?yJPcDiFsj7QnSIiL6P5HAhiRLVDyKC+jpB1zmy3e10kveRHygFOgro/T6q60?=
 =?us-ascii?Q?Dzr8MbVwGRbCEA21pJNtB/MqSHGBlhmRj5eayx/zbdMjpnCX0IdFbtbrfBvB?=
 =?us-ascii?Q?aAntkZv3w47HUN2TDpWyAWsDrGpeGsgSam1ng9sMYCY2fce73QL/ooLuHcFS?=
 =?us-ascii?Q?KpIEPUhymrCo9sV6/3uwuHQL7BHDdlL52S0dP8WFuD+EtXCYAFf78Od4COBu?=
 =?us-ascii?Q?ulKYVH8BPsZ+m32nzkvM+W7rdkb1dIMspdP29gbbEQhSkua5MmZb8tcGbSCh?=
 =?us-ascii?Q?MAmKAejhI5QFmM2whUPTFB4piMkGA+U38dbdAQgZEtptGLEUm5A42A3aJy99?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b67524-7ef2-4118-ffca-08daf0410dfe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 23:52:22.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf48Y8QbL2zfLdNXJ0RsL3y0yMS3KsXRPAoTRKq65YTZIQR0msUq7wk636LA2Bzn7G8GXc59vDzmM7AUnn8FmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 09:43:41PM +0000, Matthew Brost wrote:
> On Tue, Jan 03, 2023 at 01:02:15PM +0000, Tvrtko Ursulin wrote:
> > 
> > On 02/01/2023 07:30, Boris Brezillon wrote:
> > > On Fri, 30 Dec 2022 12:55:08 +0100
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > 
> > > > On Fri, 30 Dec 2022 11:20:42 +0100
> > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > 
> > > > > Hello Matthew,
> > > > > 
> > > > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > 
> > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > guaranteed to be the same completion even if targeting the same hardware
> > > > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > > > > apart as the TDR expects submission order == completion order. Using a
> > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > > 
> > > > > Oh, that's interesting. I've been trying to solve the same sort of
> > > > > issues to support Arm's new Mali GPU which is relying on a FW-assisted
> > > > > scheduling scheme (you give the FW N streams to execute, and it does
> > > > > the scheduling between those N command streams, the kernel driver
> > > > > does timeslice scheduling to update the command streams passed to the
> > > > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > > > because the integration with drm_sched was painful, but also because I
> > > > > felt trying to bend drm_sched to make it interact with a
> > > > > timeslice-oriented scheduling model wasn't really future proof. Giving
> > > > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably might
> > > > > help for a few things (didn't think it through yet), but I feel it's
> > > > > coming short on other aspects we have to deal with on Arm GPUs.
> > > > 
> > > > Ok, so I just had a quick look at the Xe driver and how it
> > > > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > > > have a better understanding of how you get away with using drm_sched
> > > > while still controlling how scheduling is really done. Here
> > > > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > > > drm_sched job queuing/dep/tracking mechanism. The whole run-queue
> > > > selection is dumb because there's only one entity ever bound to the
> > > > scheduler (the one that's part of the xe_guc_engine object which also
> > > > contains the drm_gpu_scheduler instance). I guess the main issue we'd
> > > > have on Arm is the fact that the stream doesn't necessarily get
> > > > scheduled when ->run_job() is called, it can be placed in the runnable
> > > > queue and be picked later by the kernel-side scheduler when a FW slot
> > > > gets released. That can probably be sorted out by manually disabling the
> > > > job timer and re-enabling it when the stream gets picked by the
> > > > scheduler. But my main concern remains, we're basically abusing
> > > > drm_sched here.
> > > > 
> > > > For the Arm driver, that means turning the following sequence
> > > > 
> > > > 1. wait for job deps
> > > > 2. queue job to ringbuf and push the stream to the runnable
> > > >     queue (if it wasn't queued already). Wakeup the timeslice scheduler
> > > >     to re-evaluate (if the stream is not on a FW slot already)
> > > > 3. stream gets picked by the timeslice scheduler and sent to the FW for
> > > >     execution
> > > > 
> > > > into
> > > > 
> > > > 1. queue job to entity which takes care of waiting for job deps for
> > > >     us
> > > > 2. schedule a drm_sched_main iteration
> > > > 3. the only available entity is picked, and the first job from this
> > > >     entity is dequeued. ->run_job() is called: the job is queued to the
> > > >     ringbuf and the stream is pushed to the runnable queue (if it wasn't
> > > >     queued already). Wakeup the timeslice scheduler to re-evaluate (if
> > > >     the stream is not on a FW slot already)
> > > > 4. stream gets picked by the timeslice scheduler and sent to the FW for
> > > >     execution
> > > > 
> > > > That's one extra step we don't really need. To sum-up, yes, all the
> > > > job/entity tracking might be interesting to share/re-use, but I wonder
> > > > if we couldn't have that without pulling out the scheduling part of
> > > > drm_sched, or maybe I'm missing something, and there's something in
> > > > drm_gpu_scheduler you really need.
> > > 
> > > On second thought, that's probably an acceptable overhead (not even
> > > sure the extra step I was mentioning exists in practice, because dep
> > > fence signaled state is checked as part of the drm_sched_main
> > > iteration, so that's basically replacing the worker I schedule to
> > > check job deps), and I like the idea of being able to re-use drm_sched
> > > dep-tracking without resorting to invasive changes to the existing
> > > logic, so I'll probably give it a try.
> > 
> > I agree with the concerns and think that how Xe proposes to integrate with
> > drm_sched is a problem, or at least significantly inelegant.
> >
> 
> Inelegant is a matter of opinion, I actually rather like this solution.
> 
> BTW this isn't my design rather this was Jason's idea.
>  
> > AFAICT it proposes to have 1:1 between *userspace* created contexts (per
> > context _and_ engine) and drm_sched. I am not sure avoiding invasive changes
> > to the shared code is in the spirit of the overall idea and instead
> > opportunity should be used to look at way to refactor/improve drm_sched.
> >
> 
> Yes, it is 1:1 *userspace* engines and drm_sched.
> 
> I'm not really prepared to make large changes to DRM scheduler at the
> moment for Xe as they are not really required nor does Boris seem they
> will be required for his work either. I am interested to see what Boris
> comes up with.
> 
> > Even on the low level, the idea to replace drm_sched threads with workers
> > has a few problems.
> > 
> > To start with, the pattern of:
> > 
> >   while (not_stopped) {
> > 	keep picking jobs
> >   }
> > 
> > Feels fundamentally in disagreement with workers (while obviously fits
> > perfectly with the current kthread design).
> >
> 
> The while loop breaks and worker exists if no jobs are ready.
> 
> > Secondly, it probably demands separate workers (not optional), otherwise
> > behaviour of shared workqueues has either the potential to explode number
> > kernel threads anyway, or add latency.
> > 
> 
> Right now the system_unbound_wq is used which does have a limit on the
> number of threads, right? I do have a FIXME to allow a worker to be
> passed in similar to TDR.
> 
> WRT to latency, the 1:1 ratio could actually have lower latency as 2 GPU
> schedulers can be pushing jobs into the backend / cleaning up jobs in
> parallel.
> 

Thought of one more point here where why in Xe we absolutely want a 1 to
1 ratio between entity and scheduler - the way we implement timeslicing
for preempt fences.

Let me try to explain.

Preempt fences are implemented via the generic messaging interface [1]
with suspend / resume messages. If a suspend messages is received to
soon after calling resume (this is per entity) we simply sleep in the
suspend call thus giving the entity a timeslice. This completely falls
apart with a many to 1 relationship as now a entity waiting for a
timeslice blocks the other entities. Could we work aroudn this, sure but
just another bunch of code we'd have to add in Xe. Being to freely sleep
in backend without affecting other entities is really, really nice IMO
and I bet Xe isn't the only driver that is going to feel this way.

Last thing I'll say regardless of how anyone feels about Xe using a 1 to
1 relationship this patch IMO makes sense as I hope we can all agree a
workqueue scales better than kthreads.

Matt

[1] https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1 

> > What would be interesting to learn is whether the option of refactoring
> > drm_sched to deal with out of order completion was considered and what were
> > the conclusions.
> >
> 
> I coded this up a while back when trying to convert the i915 to the DRM
> scheduler it isn't all that hard either. The free flow control on the
> ring (e.g. set job limit == SIZE OF RING / MAX JOB SIZE) is really what
> sold me on the this design.
> 
> > Second option perhaps to split out the drm_sched code into parts which would
> > lend themselves more to "pick and choose" of its functionalities.
> > Specifically, Xe wants frontend dependency tracking, but not any scheduling
> > really (neither least busy drm_sched, neither FIFO/RQ entity picking), so
> > even having all these data structures in memory is a waste.
> > 
> 
> I don't think that we are wasting memory is a very good argument for
> making intrusive changes to the DRM scheduler.
> 
> > With the first option then the end result could be drm_sched per engine
> > class (hardware view), which I think fits with the GuC model. Give all
> > schedulable contexts (entities) to the GuC and then mostly forget about
> > them. Timeslicing and re-ordering and all happens transparently to the
> > kernel from that point until completion.
> > 
> 
> Out-of-order problem still exists here.
> 
> > Or with the second option you would build on some smaller refactored
> > sub-components of drm_sched, by maybe splitting the dependency tracking from
> > scheduling (RR/FIFO entity picking code).
> > 
> > Second option is especially a bit vague and I haven't thought about the
> > required mechanics, but it just appeared too obvious the proposed design has
> > a bit too much impedance mismatch.
> >
> 
> IMO ROI on this is low and again lets see what Boris comes up with.
> 
> Matt
> 
> > Oh and as a side note, when I went into the drm_sched code base to remind
> > myself how things worked, it is quite easy to find some FIXME comments which
> > suggest people working on it are unsure of locking desing there and such. So
> > perhaps that all needs cleanup too, I mean would benefit from
> > refactoring/improving work as brainstormed above anyway.
> > 
> > Regards,
> > 
> > Tvrtko
