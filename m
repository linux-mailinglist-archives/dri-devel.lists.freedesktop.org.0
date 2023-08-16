Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917677E3CA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908C10E376;
	Wed, 16 Aug 2023 14:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C8610E371;
 Wed, 16 Aug 2023 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692196805; x=1723732805;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ySzy0eqFaTUPMzW8lE0PlKahVQJhU1EaZ5UjXhr7bQg=;
 b=Jz6LQnPgwQ8NlWJEpy5JYl0kc60e9xQZ59RKV8fwueWOfpdEH1/e0EZ8
 W1KguUy6BLbcINiwMBmyhsUEGEq5Y9q2zfAMbrPc+lLyAZW5VrdXkU5gm
 g2TaEjIkTurNekPMg80U//O5RRiBxb9qs0JbkjOKzrUBTvQL9aLbSt6gt
 5UF1M1kbu7mb2FnXx79tZ406FLmOJxp/EwDI7yeqwAp+pd6cK4mJ5tflG
 q3BO+++TT7Rhf0LPDfdHMcVEpmSTJtZpLKdS6uDbk0LcphhLRXBTACGQp
 BsXuWjpoK1gyc4I4Siwc0CdEkv8wbHnP4Di1x/+bnInR17HDaSuCdm064 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352139590"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="352139590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 07:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799632517"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="799632517"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2023 07:40:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 07:40:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 07:39:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 07:39:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 07:39:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLdTDizwypAoJwc6qvroRN2gFv8O/bGwrL/cZBW0pKVzADUGlHxqyuxJxXnihQhEp7JA4YdXxXhpsTxANjhXLQCooRcrVLDqC96lrpOERWd0wU2RQKjZlrIJj25uX0RFi6xEnPpcrPw62zlQwSD1XQAN4dNFWLmX83tGs1eoIZTkM1A0zCvj/mSL9EaY0paQ4Px/4M07A9rIuEVt9LrVZVYT/jUpv1/4StllPRFghpJXTtPwuXj0ZRdDmKL92VWaoaHfoS1S9R1HvjBgqqYzDs1n8AJEHeJoUlU/AiQ5QkNsJ5FzQ1v2MnPd4a5iMp020KJlzZq7bc4TfYRsaMHItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDXGPqPUx6IfA8DIDMiWQho39u4Y23fdPtkmXXLdatY=;
 b=CZ6OYX6VyBgy1Ef2JheAs1eEev6cdG9YLBeByvgPMzpfZofoBvFp/hGCqE9q9YUhXX62IRwme1QHa5k8GzFiSlNO2Kh4qu7ORzSlk3rIuQcEGp9x+H2nO6yyYWlbV6Mim/RHSubyrHPJoiq8J3VfA7qkBrEDko4IzNeVHnW0COuViO7CIr5aY+CgQ0UHxSmaiqDVwkWL6c+C4Us83GokHFd/No28MfqtgN1QHxWcqzNuLb30wjKaAlQpMEwkk/ip4yn2uUODBt/rjLt5OTyRhSK1+MWiROhfqlATDbqFZ/24l80J4MioduBh5etnvnPp0GTBYL7bGCVkgyNFzKQlhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 14:39:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 14:39:58 +0000
Date: Wed, 16 Aug 2023 14:38:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <ZNzfgNFmR/tevvh6@DUT025-TGLU.fm.intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: c570be26-513c-44dc-5ce5-08db9e66a9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmjE2x3/nYvraj5y8juNz8qcMCPwvrkMQrwb4a2V7Evu4uGOk5+3GlVBU4dT6k/e10ixeNV5uzxPtpMrVVI8luG7875paXnt0kUq5wBQPfsxPY3NIyjwFUiweub+upvOm6lpy0AuPMcZOr2dFOgvfJ1iAoZmmDp+30HDFq2YKoh3kqwwYctABoecfxWZzthHzKqetz0WzzxsAtIrpH37LPW0NGQy8yWCzU1No5WUaJ/5DJIRax2v0Ww1nS3ogA99/ev662VT4XwNHkD+E19fBbvxHxl4jEtmxYqYbnWS1cfPZ0VkwJ59rLglQ8qcNoGVeujK3VuLptY5wAlsLYIN3y0ArSGvBd1PjLfEXvl3W35T0jHuZ5ZCqOl/QUEWbLjrQgX/qE1j1tRbF5IhIbIpinPVidTfPYP8OAS5oe2fXutVW/zO9lJqr4RvJilug1Q22jlCEhByxgfMC3TtRzzI9PZck4zo8rx6vwuNO+xSFM7ad/+cGUehEb3gC8z3m8x2g7msQI3+s374xQsAHWweRgNi0AkM3GtvEk5LJ6P3oSNqNNn5wuumo2CqXeVWTnd4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(44832011)(66574015)(38100700002)(8676002)(4326008)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(6512007)(53546011)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7ShZ+6gm/MBYQ6hJ3Q+6KejCtk/uYFLgI9YSs3H3zWPgxIjMktJphlA+fu?=
 =?iso-8859-1?Q?/fHu2C3en7xAEAS8OtEAbJUMCJBzklTN85zKrr++TNHAcjKAlY238VktAd?=
 =?iso-8859-1?Q?Mtmjry549hzDka5GpnTWZeVIzjkdmkDdueCDIL/5OnCzDvYdsNq5SDaoW5?=
 =?iso-8859-1?Q?Ym61CVQ2F2kXZlKBol+v7nH9HiflSCXOBZi+jcT/nXZiEzRHu41LUvu1ox?=
 =?iso-8859-1?Q?cJ4l1LkGnTvqYXIvYrKM0/f+xbcxFJ/hlLhg/X0zfyyubxm9Y+IHocDtxA?=
 =?iso-8859-1?Q?5uc/D3wdKSo+7v50EbN5kL+Z1qfw0YkSi2zL1HOQV+BJ4DUCElzPtRhY6g?=
 =?iso-8859-1?Q?G9bc2dgRHaCMk6Nd0b3cqkeXPKp4LoQXl1TfpZcDKrl6xP0VkwpZW1NkeS?=
 =?iso-8859-1?Q?uY1uIW81qTLeaC/D2vZ6pI7RN/QqwIx+3Qj+QM/8TIvXhZnrTZOUcKSwUf?=
 =?iso-8859-1?Q?RAqHkQ9Kzd2No5dOqKU283eFFTqU+bz6Mzjg/tL/Lu2Sn7vBu3ChYY0Qry?=
 =?iso-8859-1?Q?p6B+UxsT8C8zktgzaSiAAOFw4azwKQ4arpKAIadbU+p3NQPgicUzQ+nmQT?=
 =?iso-8859-1?Q?GutlpbLWChs2zpi8rLkMqKocy/iJmSHDXo0opbxRFSbfLElbdn7kBFd5H1?=
 =?iso-8859-1?Q?geoKQ2ZY6mOSWovK+ZjJvqtRvvhH+IcSre4Q8wPyqcSOEdpuWanL7bFRUn?=
 =?iso-8859-1?Q?AXce2ls4oTsQcWBWBch8fCJKOIaMUTEsHPlICHeyPO/UKQQC39K4CS6Ytf?=
 =?iso-8859-1?Q?SnITdGglrxq7pqGbPFHjrnKr+895/a4kVdD/kjWHL1eiiiwZ49VvbYrq9e?=
 =?iso-8859-1?Q?VkvBnajNX6dbMKa8UNqYfyff0hX6/tleSGXQnkUXdLvWkf6sVRAu9mrG/L?=
 =?iso-8859-1?Q?tjWjzKdunSv5CbyvysDLm2+3KXwWkXaxnWOSQm8tE3T/e5cdmoZ+2ErpB+?=
 =?iso-8859-1?Q?z7vEKA8tDTotG7rNts16oxjca6JrY0dShB0hym88F8hDgqQGmxE3h2zm2f?=
 =?iso-8859-1?Q?jjoeWNdI133TWGd1qwAd7NNNOaQtMkKFQZVPiA8v5Xy2V/2nl90Uc210vk?=
 =?iso-8859-1?Q?QdlL5INe9ZgNXS9QFuie3oYy6Nx9XMq1ip8Ia2lq3q+4ICb+tyNAGwGVlM?=
 =?iso-8859-1?Q?/dB/cAxPPuJSyAwL4bM461nlZWZw75bpAQTpxM57Xycflug5pRsoB3NxtL?=
 =?iso-8859-1?Q?wwNbiMcTOpAE82wYtkHn3LFsV3s/KNC8sZBbxt8zcvxHZSTYjkSOvk5uvu?=
 =?iso-8859-1?Q?zlGl3qMZkhQ9GoYi5eeO3NF8QGN/LKpAyssJWoTLzJRkYon5oL+nAs4YJf?=
 =?iso-8859-1?Q?3bCQOET0bIWKugGIWnmymcDHyM2gNE3BmhsEZCusiGo6HuXUDnJ2yk53AU?=
 =?iso-8859-1?Q?s6t+wSGU7/bbVmsvvxtpTToHYNMi5oj0jZzRjsQ2KSzryNu7tDMCAb8kE2?=
 =?iso-8859-1?Q?t7YQYFuPjW+usZRnC8vD0o75ZBT1ZWgLDR4ksEOUez/zldZVJ3ZCfYI0/A?=
 =?iso-8859-1?Q?VBnf3OytN5umpeLOwgXwSIutKU6esPgG/siSrlyZN5m6LovHwHJItN5cgZ?=
 =?iso-8859-1?Q?CgLj82ez9xNUWpS/TZ1jd55Vpva8GYZaUvTD/P9IG2dlXxltAx4HRuOcO/?=
 =?iso-8859-1?Q?8Hw3odw0vSKL0Wy6gZBnx1Zj9qnFPLuiVHjIn/6wehONzV51JKg8K2Ew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c570be26-513c-44dc-5ce5-08db9e66a9f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 14:39:58.0101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/12Vf4KpE9d1HXctY/FwNz+MjcPjj/KCjnF2MqEsyxGN4LAEBVJYLmmIwRnsJ8Z4Cd21Vs6bWIcgO4IQzMJQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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
 boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 02:30:38PM +0200, Danilo Krummrich wrote:
> On 8/16/23 16:05, Christian König wrote:
> > Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
> > > Hi Matt,
> > > 
> > > On 8/11/23 04:31, Matthew Brost wrote:
> > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
> > > > seems a bit odd but let us explain the reasoning below.
> > > > 
> > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > guaranteed to be the same completion even if targeting the same hardware
> > > > engine. This is because in XE we have a firmware scheduler, the GuC,
> > > > which allowed to reorder, timeslice, and preempt submissions. If a using
> > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
> > > > apart as the TDR expects submission order == completion order. Using a
> > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
> > > > 
> > > > 2. In XE submissions are done via programming a ring buffer (circular
> > > > buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
> > > > limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
> > > > control on the ring for free.
> > > 
> > > In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
> > > 

In Xe the job submission is series of ring instructions done by the KMD.
The instructions are cache flushes, seqno writes, jump to user BB,
etc... The exact instructions for each job vary based on hw engine type,
platform, etc... We dervive MAX_SIZE_PER_JOB from the largest set of
instructions to submit a job and have a define in the driver for this. I
believe it is currently set to 192 bytes (the actual define is
MAX_JOB_SIZE_BYTES). So a 16k ring lets Xe have 85 jobs inflight at
once.

> > > In Nouveau we currently do have such a limitation as well, but it is
> > > derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would
> > > always be 1. However, I think most jobs won't actually utilize the
> > > whole ring.
> > 
> > Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB =
> > hw_submission_limit (or even hw_submission_limit - 1 when the hw can't

Yes, hw_submission_limit = RING_SIZE / MAX_SIZE_PER_JOB in Xe.


> > distinct full vs empty ring buffer).
> 
> Not sure if I get you right, let me try to clarify what I was trying to say:
> I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really limited by
> anything other than the RING_SIZE and hence we'd never allow more than 1
> active job.

I'm confused how there isn't a limit on the size of the job in Nouveau?
Based on what you have said, a job could be larger than the ring then?

> 
> However, it seems to be more efficient to base ring flow control on the
> actual size of each incoming job rather than the worst case, namely the
> maximum size of a job.
>

If this doesn't work for Nouveau, feel free flow control the ring
differently but this works rather well (and simple) for Xe.

Matt

> > 
> > Otherwise your scheduler might just overwrite the ring buffer by pushing
> > things to fast.
> > 
> > Christian.
> > 
> > > 
> > > Given that, it seems like it would be better to let the scheduler
> > > keep track of empty ring "slots" instead, such that the scheduler
> > > can deceide whether a subsequent job will still fit on the ring and
> > > if not re-evaluate once a previous job finished. Of course each
> > > submitted job would be required to carry the number of slots it
> > > requires on the ring.
> > > 
> > > What to you think of implementing this as alternative flow control
> > > mechanism? Implementation wise this could be a union with the
> > > existing hw_submission_limit.
> > > 
> > > - Danilo
> > > 
> > > > 
> > > > A problem with this design is currently a drm_gpu_scheduler uses a
> > > > kthread for submission / job cleanup. This doesn't scale if a large
> > > > number of drm_gpu_scheduler are used. To work around the scaling issue,
> > > > use a worker rather than kthread for submission / job cleanup.
> > > > 
> > > > v2:
> > > >    - (Rob Clark) Fix msm build
> > > >    - Pass in run work queue
> > > > v3:
> > > >    - (Boris) don't have loop in worker
> > > > v4:
> > > >    - (Tvrtko) break out submit ready, stop, start helpers into own patch
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > 
> 
