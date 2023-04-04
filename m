Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7C6D6387
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5A10E335;
	Tue,  4 Apr 2023 13:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64610E335;
 Tue,  4 Apr 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680615809; x=1712151809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ve28C+06qgYAdWDAdYGXk5zdXFSy9dK50k3KsDe/TDc=;
 b=N7Pbf6cUr82BADqZjHzphoKqV52yfG0RaJATJJpKiijJ1h3Li3h6zh/n
 75c/YR7b6droryoAp+YTfxQtV0J8/fHMYw66s8ayG1OcOObrnPxWIFndD
 APmPDiRSfdyy+ArZHjW+dW4wyTqQ55dDmT5t6gWdAaho9PlhKZpfOB91n
 91i7FzYs06pJkaJ0BXcdNW4JCkTvC7vwFVtA3x4vj9OK6b8Cc4ZrcbEIn
 f+ZGydSBJq5ANakK/csnUgsWyAsN2Kbn/7itN6OHqcXEoY07Ohh6nrhXB
 ZnPgRCph+buUBacmIoJRYl/h5F3Buf7gpQYTHR7BrIkZ6+mPebD7/VHkh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="340913427"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="340913427"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="718947614"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="718947614"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 04 Apr 2023 06:43:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 06:43:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 06:43:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 06:43:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 06:43:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjKgi1aNpGKu5lDYKsnFN8uUnDrmTLZTXgOi6BmJKRzxYTmd6MhxoKxwcXp+JPthdUGOeo+qRJChUsox2G6T787MakRzNmSQDHONT2i/9VZbvOQtPDHrVHCNpt8K3Vu6j/qqQHdR9M3xWFuBM4HJc5D7dyOiZzp+CIUm16nGiqm8Cn6wl4hQmr5YNHvH8Yr3FdnKVe56y3TBj61MwieCDxYhUQWS8UWVt8Cjovlba6GlNbbS/KXL8NhK92u/yHw6Ghue42Odtu3610opNQ7HudfEO+TDhtylLtusC8ZwuOmzkAj5fVpNsDp6a0wtqlBmtTe2XTvOe203Q9uNnxSWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUdZVZCJaNYwUr9z5YZIVlp0fZn2WjaAqW0RrkU4GqU=;
 b=CrK7/95hLuHm6kZYnZYsDpAGhjygA+GUcI2q1NxxWEnxhzkNALfwjUAUNDg6kwe1A/2Bm1MOEXJAn5PCc/elQAb2HhCdyKkH0cwOotIkG9vweCTQef63llOeyXIdosQmdxnrzj49WAMB441SQFm4uViPWEICbiQ6XdV3GKkKB+4Dfb8t/7sfnavWvoow/iCW1dSWrMiHITgUDcOGwxNoN6T/0hX1CnhKyW/dWOrijtouIT1lqYQo1zAmFiKAxncr9kSfrC/eI7IJ8h0f3hhxf5g+xdl/yK1iMCkPtnvdCZ0pvoprOrMBIGwnOjaKS3zHvaPgljZZ+ktw9qsSju8Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6900.namprd11.prod.outlook.com (2603:10b6:806:2a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Tue, 4 Apr
 2023 13:43:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 13:43:24 +0000
Date: Tue, 4 Apr 2023 13:43:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCwpdzbxG1AhE6NT@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
 <20d1816f-9b0f-6caa-43df-ddc7ac40d5e7@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20d1816f-9b0f-6caa-43df-ddc7ac40d5e7@amd.com>
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: a40fd6ce-3b29-4ead-dc3a-08db35128ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QT9P/kIbO+Iph5FA5ufg/Ob4ek+82BzFg7fYZDEgJ9BEYVPcEQ1l7v+sx0n6E4SLYMVfT5+7VunfzZcajWICkID6uWSldIgdNAkF5WLS7V2XajpP2j5XunZddZ2dVn8xeonG+m9Cw0FdwC8YajFtVXRlLg6s3aa4ykcrga5unKhebP/CZgC5Qc+42MJvm/6HuC6hApguAAvQd8l+dJlMO4OaobTOwgF566QJiKzJoHK4yA1WYsj9lJp+i0Pk8vrJw3/uoFpQMeuOuJynQPDkBOJuMrj9LuZ05qZrlBCA0bHsfc05Ju01rZrC4ibn3iIoGAC0GpWktiFGkPsiR8FkgcH5CNBNcHlYC1K6crQWo1Ffsn5Xx8spYeI7shsqFdpdzi4zKDPAofwaDRCAZAeQpPx0+WzAXTiD6sHRHQnF1n4yd8zoVZh6oAynZLnfsxIaRHqtIOH5AAyMnQKQ/WhLlcyvi+P9afrPvsU33niccoJlufbFGy8Y8MlYdN+Tkz41K7RZcMK4+nL0/VV4wGs7jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(6916009)(38100700002)(186003)(82960400001)(7416002)(26005)(53546011)(6512007)(966005)(6506007)(66574015)(6486002)(83380400001)(5660300002)(2906002)(66476007)(86362001)(316002)(6666004)(41300700001)(8936002)(478600001)(4326008)(8676002)(66946007)(66556008)(44832011)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WS9G8WVZcaD+dnj+BA08lw1brTfg7Ff6+BdUemnmsGzSiIn9IKIzsWYqyF?=
 =?iso-8859-1?Q?7cbovr2qCh/wzNKdNP8nRNmprLlomQy29SDKOMkEgq0ZBPPX6NJVffbVCb?=
 =?iso-8859-1?Q?NU71SmDU3w+iyT8IKIgmRInPo8fqk6cOcM77I+8obmTb1HPUQ8/5mTfZLB?=
 =?iso-8859-1?Q?2ELOfArH4V8A/2HyHginmbX7yP8cvlK1afTcJBu3oeZqA26KvoDzpViGRQ?=
 =?iso-8859-1?Q?dYPt+uKPNXfeQsIe04tN2md9xifg/utWqsk0iNpYFdNBLhAcfzTl8JTaC+?=
 =?iso-8859-1?Q?IIgJfuPnUgLJST49JM9fyGcjqOdxeSfbYosRrnSB2goOfkbnOJpXMl1Trx?=
 =?iso-8859-1?Q?EjbCttAtdWeKmycHJPKQDKVPI3XO+aCRNJpd626aJWYFLJ4qJuBMApiVpK?=
 =?iso-8859-1?Q?LkUSZdDVzfmQKhn9CrNBVZoWl6aSbwQPuKY6yWPvuxGyZIT4gh0/qHUXeW?=
 =?iso-8859-1?Q?z17FKzuxj58JqwczrPttiYaTcqA4I3ZYYEzPOEYXRjqvNs9Aqx27TXk36b?=
 =?iso-8859-1?Q?z5f0qq/Vm91dKfjbWikm36ed9XKdZO/6mwGxHxhF+BRYsK5M2/VfQUANkN?=
 =?iso-8859-1?Q?ED4CBIGQthrlgvaITkCBXXpTHUZhlkU1ruYRFeof9cqtAkjy+v5vUm1w6e?=
 =?iso-8859-1?Q?ftH2Zld1jLVLxZevFkyY6uy/R99xYRU81gFDQF0j/b6BFK0pea7ttQMymN?=
 =?iso-8859-1?Q?bhhyCqDxCdH/2HCuTT4x2jFqF7Vo0skKyIMz2VxzjaaBo3pHn7AEOHtz4v?=
 =?iso-8859-1?Q?NXUqlLEktt9YmkMJe01N9/cPTTIMQWj768xYJnaZuCe5IQxBW12t5uMfdv?=
 =?iso-8859-1?Q?A6xFkbkW0AHBTA76ShHf7WlincXvESccQ1Ozxl2Q/eSk3cASy8iC7DCv4P?=
 =?iso-8859-1?Q?UEDyc46wxUT69axjMnLWJMG0UFKpE24vYhNdl0w2izdqTtHr/2iBfG/pne?=
 =?iso-8859-1?Q?eDYVJ50fGAfzKTrj/ES0/NlR017q9QCqzu2Hzlmph5fQPUWNBbxceZm9G8?=
 =?iso-8859-1?Q?vwnhUNJqBQ5qwoujCeZHrZLdIKM5PeEwExI8GKz5CyDjInHLiym19AaWLZ?=
 =?iso-8859-1?Q?TEjGqUNiXrxAr35kq1fOaH5KOCa8FturLXmghoE4tKNgMyhicja7hHfFHA?=
 =?iso-8859-1?Q?1GNfA7sP0lCPhhPNcutJuwjwLro/Lf4SEwhEL4HnTK1o9Jj87fVRI/gulX?=
 =?iso-8859-1?Q?HdUcn7CVStIuRtY/bZ7+fQRnyO8AwFr9m+7slIWWjseoabHf2XXxh6X4q5?=
 =?iso-8859-1?Q?GQxo9pFX/2bmt4M+gJXpWlkTa6eDC83HY6NbRH5Yu7yW6aP0ONpDy20DVR?=
 =?iso-8859-1?Q?7ksh6g9AuhMu9IrY68IjpXc9lulYuQ127reh3WzkwZzKVwUzOWBefQGR90?=
 =?iso-8859-1?Q?XofHAfUYSuWP0KSPpCK47Zve3IK74El6oew9M3XAEQ9JXVtqXeLpTOIxFR?=
 =?iso-8859-1?Q?NrjPPbh6yxH5NuC9Zud4+wlqzcNaBNYes1YINkFxrdWXbDhLHT10YJrYaK?=
 =?iso-8859-1?Q?xxi+kJPW8ghZ1JvYc/5cc0sTFC/Wg32/sJcfA7zxSpuIzMV/l4ndUezDcV?=
 =?iso-8859-1?Q?7MDh3m9glEqdXaLI5RDPn6J5G7tgK/omeCUalfieb2mLfLCbj1ltaV0Wua?=
 =?iso-8859-1?Q?aJYUlAnJ2cJ4XoZHas/kAqShbrQ19UC9SpeXgY6ssBRkM5wJsO1yn+yQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a40fd6ce-3b29-4ead-dc3a-08db35128ffe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:43:24.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6K13klcdm9FFYANZxtKDX+c5rCshJcJclDldiqR1dxLGYnoEgeu6myCGfVgAPUWOr1J4oA5RqZGA6NGmNXV0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6900
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
Cc: robdclark@chromium.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 11:48:36AM +0200, Christian König wrote:
> Am 04.04.23 um 11:43 schrieb Tvrtko Ursulin:
> > 
> > On 04/04/2023 01:22, Matthew Brost wrote:
> > > Hello,
> > > 
> > > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > > have been asked to merge our common DRM scheduler patches first as well
> > > as develop a common solution for long running workloads with the DRM
> > > scheduler. This RFC series is our first attempt at doing this. We
> > > welcome any and all feedback.
> > > 
> > > This can we thought of as 4 parts detailed below.
> > > 
> > > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > > entity (patches 1-3)
> > > 
> > > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > > severals problems as the DRM was originally designed to schedule jobs on
> > > hardware queues. The main problem being that DRM scheduler expects the
> > > submission order of jobs to be the completion order of jobs even across
> > > multiple entities. This assumption falls apart with a firmware scheduler
> > > as a firmware scheduler has no concept of jobs and jobs can complete out
> > > of order. A novel solution for was originally thought of by Faith during
> > > the initial prototype of Xe, create a 1 to 1 relationship between
> > > scheduler
> > > and entity. I believe the AGX driver [3] is using this approach and
> > > Boris may use approach as well for the Mali driver [4].
> > > 
> > > To support a 1 to 1 relationship we move the main execution function
> > > from a kthread to a work queue and add a new scheduling mode which
> > > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > > The new scheduling mode should unify all drivers usage with a 1 to 1
> > > relationship and can be thought of as using scheduler as a dependency /
> > > infligt job tracker rather than a true scheduler.
> > 
> > Once you add capability for a more proper 1:1 via
> > DRM_SCHED_POLICY_SINGLE_ENTITY, do you still have further need to
> > replace kthreads with a wq?
> 
> Yeah, I fail to see the need for that as well. On the other hand it would be
> really nice to get rid of the rq/priority design in general.
> 

wrt to replacing kthread with a worker I think the idea is you don't
want to tie a kthread creation directly to a uAPI as a user then could
create 1000s of kthreads.

fwiw in a private email about a year yoy actually suggest using a work
queue Christian.

> > 
> > Or in other words, what purpose does the offloading of a job picking
> > code to a separate execution context serve? Could it be done directly in
> > the 1:1 mode and leave kthread setup for N:M?
> 
> Well moving from kthread to work item is beneficial on it's own since the
> later usually follows the the source of it's queue. E.g. when this is
> triggered by an interrupt we run on the CPU of the interrupt and not have
> inter CPU signaling.
> 
> > 
> > Apart from those design level questions, low level open IMO still is
> > that default fallback of using the system_wq has the potential to affect
> > latency for other drivers. But that's for those driver owners to
> > approve.
> 
> Oh, yeah that's a good point as well. This needs some high priority queue.
>

system_highpri_wq?

Matt

> Christian.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > - Generic messaging interface for DRM scheduler
> > > 
> > > Idea is to be able to communicate to the submission backend with in band
> > > (relative to main execution function) messages. Messages are backend
> > > defined and flexable enough for any use case. In Xe we use these
> > > messages to clean up entites, set properties for entites, and suspend /
> > > resume execution of an entity [5]. I suspect other driver can leverage
> > > this messaging concept too as it a convenient way to avoid races in the
> > > backend.
> > > 
> > > - Support for using TDR for all error paths of a scheduler / entity
> > > 
> > > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > > 
> > > - Annotate dma-fences for long running workloads.
> > > 
> > > The idea here is to use dma-fences only as sync points within the
> > > scheduler and never export them for long running workloads. By
> > > annotating these fences as long running we ensure that these dma-fences
> > > are never used in a way that breaks the dma-fence rules. A benefit of
> > > thus approach is the scheduler can still safely flow control the
> > > execution ring buffer via the job limit without breaking the dma-fence
> > > rules.
> > > 
> > > Again this a first draft and looking forward to feedback.
> > > 
> > > Enjoy - Matt
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > > [2] https://patchwork.freedesktop.org/series/112188/
> > > [3] https://patchwork.freedesktop.org/series/114772/
> > > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > > 
> > > Matthew Brost (8):
> > >    drm/sched: Convert drm scheduler to use a work queue rather than
> > >      kthread
> > >    drm/sched: Move schedule policy to scheduler / entity
> > >    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> > >    drm/sched: Add generic scheduler message interface
> > >    drm/sched: Start run wq before TDR in drm_sched_start
> > >    drm/sched: Submit job before starting TDR
> > >    drm/sched: Add helper to set TDR timeout
> > >    drm/syncobj: Warn on long running dma-fences
> > > 
> > > Thomas Hellström (2):
> > >    dma-buf/dma-fence: Introduce long-running completion fences
> > >    drm/sched: Support long-running sched entities
> > > 
> > >   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> > >   drivers/dma-buf/dma-resv.c                  |   5 +
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> > >   drivers/gpu/drm/drm_syncobj.c               |   5 +-
> > >   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> > >   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> > >   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> > >   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> > >   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> > >   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> > >   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> > >   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> > >   include/drm/gpu_scheduler.h                 | 130 +++++++--
> > >   include/linux/dma-fence.h                   |  60 ++++-
> > >   16 files changed, 649 insertions(+), 184 deletions(-)
> > > 
> 
