Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1B56D5653
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 03:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6929310E2B7;
	Tue,  4 Apr 2023 01:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A058C10E2B7;
 Tue,  4 Apr 2023 01:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680573527; x=1712109527;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jx+NvqgnvjmiVTfaMCilV656OZnkaySXvzLXKihTedo=;
 b=OkB3+PlBBepgyBFlRbh52bDC6rwbktzdFFnYP/JzgX6pVUDJ16t6dxdo
 eMJ6JEvajqEG21LgM2ssJhUbR3WxIN5D49y+z1TNIn9nrZJn1yEOVINcK
 JISsDVxj00msKqT1X6pDi9MSlbs7KPBGID1KZAOTHHkLVJ/niJKhtA6gf
 vlvo49TfaY7kSN2YQRxok3WWb+D/Ozr9gsfcuKiCs/ZFtDKuOiVOD7fDv
 To09b8rIR6xXNwIf1mhfvjpGdEOKJcIeroYzNCWK69zTQKNOfTDG8rKQJ
 OBWiXP7gXPGrTj4rPyI/cfzmkcPap0O0i93ORzbPU8nNHXe0yoJ9YmCZa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="326083182"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="326083182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686184506"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="686184506"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 18:58:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 18:58:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 18:58:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 18:58:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 18:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz+K0B/hWffj5kugiexOyrZ4vGAoYxJeHcFc5Tch9LoXQ9NPW8ZqWHkTRmt0W6+oxBEyZ82/i3eVxoeKEDMwkggQJ7uZSRv6u2QCsYJLwBx8LPjdnLHz8wJ00WG901vuwY4wcbIkD3FrO31KLX+pcW8PUUXMWHLPiLeW3oDbi5mLUtgi5yP/GsHilE/b+4xtP4vC4pVBYYb/E/Uhx96iDmi7jQNL0zZIaFif7p2BZ/cq3GRezuQF//oidVIY4HToN6Or6t1bHxqt6Qx6lE1vk4U394MAa+AiQMDm9zKpMlLGrbaPdIoPbxaJNz7XtscSiBpn6o6SWRIdgANucUbNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Mrg70Tb/AWYFwkS9k51hPeL83bc4o8cNQqREuFLy1M=;
 b=WQ6a7Meh+aZ6EzaUqmqRPzZAzkTpeTc0/x7BlnQEGcAShH3XpDRG6CCSqexyUOf399QW9fTWDAtUSKptkszO9SVN61GwEkspaRZJfVZQYFZIbGBb+L8Csa/ENwJB86zqxCy5KeEi0ZQLEvxLqmUxFNIJWYhYxmdcTkxXlQXlyFksmdwSybeXMVfDwSCuXBgAS+7Wc/7AS8s7U82yxXSpQdHm8BH159WLvkJU+7gMMbLZV1CH12AniCHBK61iK8THyO0cGzAZJTM2AljPEUvTyJioIJhoDBDcx53ryRuEJlsZxTrT/kf5fk4Meh7EmWnX+X+jdpxm+EREhGBudFDB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Tue, 4 Apr
 2023 01:58:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 01:58:38 +0000
Date: Tue, 4 Apr 2023 01:58:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCuEP2NnOich9kuI@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50fff1d4-9982-d60d-23e0-66c2020af5bf@asahilina.net>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a992e7-90d3-40a3-da85-08db34b01b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6Yf/+Acz+4xqJVt9U2jWw3yEwCnW3TUDdeM6/29pKGYHVwT/4b1SbALYqjh747NNjumQS+cgr2CC6sJb00QPLtiDvJptJfv+xfxxe74d8BDABgPInYyNy53yfnpq1yY7kRP2h02f56Knpk7lS3rllt4/vbk/FA7lSWDGwjyscUME/GiJtN/cRSCMHZHlA0jIVzH7mFsXGgtaywMGe+abyDIMQCf//LI/FnNoegfFzZvEA1y0Y9O4KAVAICgHIUPniLMva5jhh0W+Dcgqi37nkGn4HmPoKcNxJLKilYuUD9EvWT1EIjAEBGk4/MMjRUFOo3BFZf3vUHeXObZRjwkDjaGoH3RZOV4BFCUbB3a4EdkvigdISh0Q9t8yvl9HmiQHwx87eEB3R+0ZnFZHABfLtmf2He2EO3qovkt9yevWC8V3jqak3lAiG2t+wqrr96I8f+j2up/2WjKarE3LFTx5ueFiNm/Qv2y3QVohAfDSHKzdoABmKr2+sRPdkIbXC8L4cc8SGoTc9Kb9HDznMGz0Peo2XV0VAlcBwFGuZublRuBW6TB+3v4zF5E3V0V769i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(6916009)(66476007)(66946007)(478600001)(66556008)(82960400001)(316002)(4326008)(8936002)(41300700001)(8676002)(5660300002)(7416002)(38100700002)(186003)(83380400001)(6486002)(6666004)(44832011)(26005)(6506007)(6512007)(86362001)(2906002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5RsvPsAruaBwfzJNbj6aVtsSIR6v1B7/x4BgL+1TuKpuUiYP05WQuFsPwAd?=
 =?us-ascii?Q?o2bZrxUUugHnHNoHB1LUAfQ7izen4a2x6hyrfRNMQjwuiHYlDNYEJhJAd9n6?=
 =?us-ascii?Q?+Zi9Tmr78zrVmfwimv6MYwB0dTXCROq60Y4LxReXxfd1ZBaoKWRN19Rtvp6p?=
 =?us-ascii?Q?UsRiLAZPUXRgZRI0wty3S4VRQ1BtxsvKVUayVHXtp26wD8Rdcmr47wKmIasB?=
 =?us-ascii?Q?564dq7n6EbasMpXGggZr2J8CETF5mh7T1lCNxVq2MHRkjDT/agRR8E1F9XZ/?=
 =?us-ascii?Q?GDOQzxC4LJ/6lRHCeG1jZRWPiH4IAs3fG79j+M/QlTaJdsv/WsaczguXrkRV?=
 =?us-ascii?Q?KlcGehbz3mVI2QUpm++/k94y4/nrmO4cWQMZEKsRhBXzAPsjProgzPFcj+fr?=
 =?us-ascii?Q?XfiABwiVkfVo22jVWurzmZx4HIz9cCcvtAPcbLqGZgdQEfPvwQqFBsJ16YXj?=
 =?us-ascii?Q?6e3e6hKo+gXThNoWOD5cZwEoEumKv1rjDogepJU3sAmPZxn41kUX/fkDfjdM?=
 =?us-ascii?Q?auP7/Q4Ob9/qujMzLiuWgnwAs7q8OEN9o5fJFYFaxpuQ4Epxh7KGfH+to9qe?=
 =?us-ascii?Q?X02Yg+fdaR8cBXGCKIibVTfpGI1acPEh5aL9W4Z+mpXrJi5P7rrYFpkduPVH?=
 =?us-ascii?Q?N2n+PgOaelTVpsmdnCTEDqIQ5u47lglo0+AAZpRNfnvzsBnLNGq/TUG0E5xV?=
 =?us-ascii?Q?kPCvjrxEiWYerqyxduv4k88BT/m1KOjKID8lQrRcxH6l0qtrxJevHCSgXomT?=
 =?us-ascii?Q?UvmyPYFVdFLPUfGtbcdIvuLZhey1FBcNP5wHAPaeO+GJ8cnzl1m9jm3EnlYY?=
 =?us-ascii?Q?epUYf+Q8iSQruaQMAUnu3EM299mfho+UyueP4OyrLRT9s92dqiF3VJ6MxqUH?=
 =?us-ascii?Q?7R0n+hRb/uSC1gGh8DlO5IBSF3e+jRQZRxPwdplaRL+lvqOq/MjRNp5xPH5H?=
 =?us-ascii?Q?kWwmbEIXsBFobp3QgJIXOt+m4FWvCyH8zFkWHuFMCU4X6JC2heX3IjTbhNAU?=
 =?us-ascii?Q?x1uk10JqxYZQxPcAs+YS2CPq+UOlaWD9borT0aOpIVrxcujfpyVX+QSu6QD5?=
 =?us-ascii?Q?KYo9txF9uDeJTaxTBCQGrH/So5Ajy4VfnqxnlaGYMdsp/I3XnReqIGXQGpe5?=
 =?us-ascii?Q?1kf2osuj/Q0QuDx/NyVzMhihmJPsZRAnQreq+u3bVf3KtM0mSy5TbcMYDgYp?=
 =?us-ascii?Q?3olTUofgwVjJieJswv9QSVvu7dw0neIT/wa4kLOmooECX414QAz4KOQ4l5E7?=
 =?us-ascii?Q?eTT3j+VQRJfUDpSUfRii/vBO+Mvfzf9lz2FRePmX/1za0PZWPUMUX5Vtu1AK?=
 =?us-ascii?Q?dNZgutHJYBQr4nZsPsNClY7uEzs5oGBErFYC3r21Z9BrVRO3hRZXy31/KM/V?=
 =?us-ascii?Q?2wI3hczsqst1Z34hDlmLFtrnAQqLcwuddn7evkXwGaKkRKZvkmcSU6wL2Ass?=
 =?us-ascii?Q?eUQqqqHYv86LowL2Q6GkhyDNiNUO/IQdr5Fv7DjjDppMMlwHlJoKgvhMbp+b?=
 =?us-ascii?Q?Ar0qth0DTj0uyWmT9Awyt4oQhGO8yqTBKLbLQy/wcxPuqcXtZh7pTB2PJqbH?=
 =?us-ascii?Q?L4A9T5IVwkP88HsdI/pciuJtBl3uy8Eo8LziQZJvHqMJM17cOnqBSYUjvOff?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a992e7-90d3-40a3-da85-08db34b01b1a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 01:58:38.0018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXOGp27Y9MLX1XHlG8ruIsnJoBTjQVbiy604lRkMg1jpH3v/Qp1J+pZsJlZ5lkndqE0nTSlJuc+lrLRZOIQWEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 10:07:48AM +0900, Asahi Lina wrote:
> Hi, thanks for the Cc!
> 

No problem.

> On 04/04/2023 09.22, Matthew Brost wrote:
> > Hello,
> > 
> > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > have been asked to merge our common DRM scheduler patches first as well
> > as develop a common solution for long running workloads with the DRM
> > scheduler. This RFC series is our first attempt at doing this. We
> > welcome any and all feedback.
> > 
> > This can we thought of as 4 parts detailed below.
> > 
> > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > entity (patches 1-3)
> > 
> > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > severals problems as the DRM was originally designed to schedule jobs on
> > hardware queues. The main problem being that DRM scheduler expects the
> > submission order of jobs to be the completion order of jobs even across
> > multiple entities. This assumption falls apart with a firmware scheduler
> > as a firmware scheduler has no concept of jobs and jobs can complete out
> > of order. A novel solution for was originally thought of by Faith during
> > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > and entity. I believe the AGX driver [3] is using this approach and
> > Boris may use approach as well for the Mali driver [4].
> > 
> > To support a 1 to 1 relationship we move the main execution function
> > from a kthread to a work queue and add a new scheduling mode which
> > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > The new scheduling mode should unify all drivers usage with a 1 to 1
> > relationship and can be thought of as using scheduler as a dependency /
> > infligt job tracker rather than a true scheduler.
> 
> Yup, we're in the exact same situation with drm/asahi, so this is very
> welcome! We've been using the existing scheduler as-is, but this should help
> remove some unneeded complexity in this use case.
>

That's the idea.

> Do you want me to pull in this series into our tree and make sure this all
> works out for us?
>

We tested this in Xe and it definitely works for us but the more testing
the better.

> I also have a couple bugfixes for drm/sched I need to send out, but I think
> the rebase/merge with this series should be trivial. I'll send that out this
> week.
> 
> > - Generic messaging interface for DRM scheduler
> > 
> > Idea is to be able to communicate to the submission backend with in band
> > (relative to main execution function) messages. Messages are backend
> > defined and flexable enough for any use case. In Xe we use these
> > messages to clean up entites, set properties for entites, and suspend /
> > resume execution of an entity [5]. I suspect other driver can leverage
> > this messaging concept too as it a convenient way to avoid races in the
> > backend.
> 
> We haven't needed this so far (mostly by using fine-grained locking and
> refcounting all over the place) but I can see it being useful to simplify
> some of those constructs and maybe avoid potential deadlocks in some places.
> I'm not sure yet whether we can fully get rid of the main queue
> refcounting/locking (our completion/error signaling path doesn't map well to
> DMA fences directly so we still need something there to get from the global
> GPU completion signaling thread to individual queues) but it might be a step
> in the right direction at least!
>

With this messaging interface we essentially have a lockless submission
backend which is really nice compared to what we did in the i915.

Matt

> ~~ Lina
> 
