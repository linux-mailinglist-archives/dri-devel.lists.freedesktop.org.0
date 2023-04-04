Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849456D6B3E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AD310E19E;
	Tue,  4 Apr 2023 18:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CE110E03C;
 Tue,  4 Apr 2023 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680631768; x=1712167768;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a7SGhh5EV9AbfMLH2vci4gBEZRqRx0TDGqjJcpnzY2U=;
 b=cZa3BvNaXWoEJk5o7viJ122FYGevcQKANY2FZVQRV+G1ouJL/vIBdAMk
 AB6DoBhFJba/z7GLxUNM0lb6YSofjKtGaQY3qtLb37av9P8Sfx6SCdbt/
 wu8iATC8UFC3AwrIaD7e12XCBkxeM1yPe7hZKHJ7cjCn0ts7y4Qn4wFiF
 2dDotx6BJ6EFoN6M5TnRIXyCJxF5+hEGVRSpCC0l+NkipQLmBrEOMF4Pp
 fit+smT9b4NkJ1sEI1fKdeoMi6xAGHhY1AURptHRfXWRaM2Ck99jS6l09
 JU0e2deqOvbpRxZybMZvc/Snviq6VX4icaFz5prM9rcjylWly+1X1XrSU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339755413"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="339755413"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688989362"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688989362"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 04 Apr 2023 11:09:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:09:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 11:09:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 11:09:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 11:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbxH3eQywXCUQhBLTsHV3DOiQtx+d6UinOfZmGOK18+16+nXBS3El94rverd3a050EAviT0uA3FaAJtAyEv9gVDCGMVEjOiHV6EBGI/AfBxG67XaAFFqN9RfIAWBu3eoOvk9HsGpJMqit+9ERs3H7f91AQJnM50LwJVT20NweeZj9QGOPMISahXO9ILN7Gyqfg2ELicSc4efeYMqAp9Bd12t6c+rcwrorOYmVMBiC2GBbxEmG6b4dOzkTZbkXuE6bC4R7LuIpGvNSYWuP/EkwrAD0BBRFWKbUJkKL4MEOpoY3jCvkPXRdtCC+aNWlwAWjKggQquDE4eAGu5TTUiJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuGXeMCIH32u/kxta++LsVw4KHTbK2mWFVSz7GxCvRU=;
 b=MOWUkcyxoyLeX3rnwe3FaztKXpGi0i6eDp9ykbaHgK0IVNy97JI5Z6cPBkZ0+5wsUtOI607UchTxyyYpZFdwDk1jf0XrUGJzUTd0ab7jCbfSza7JNKzlMNzIG2MMeIBeYqSXglHa1YkYcshrR/4jIXL+n0tSQOrRBgDbaOtXv3k1aapIliWfEQKg/+VgL8BJ2xgg0lHSYyHt/sIwi1muvho9KV7rRYWsyOI4p0veH4iRGfahn6twQUlOyCh9aFSTNoT19Es3T91Cx0GAbjMv4XBZy2W65n8gaOyFYaFmIdGUmlnkmkBPIlK2tDlpgcQM66Lss3feyMvUi7MJBdqqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:09:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 18:09:00 +0000
Date: Tue, 4 Apr 2023 18:08:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: a32f5964-6fcd-4144-ea5a-08db3537aab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+CBzr+LcIJa2/IUvqoM2H/SArzl41PWmz/KPwt5RGcMHxlBHXaFj7bJKAXdvL5KM+zfsuDGE/ZZs4BviTQeyMDLquLGGyNZ/3XQJItfT4vhbA0GkcukPeIl2tIeYIss9QnrkqfjmGScrSMPwlu4QbLP9oOXMkWkEFbHivZ9pFf44kwtMTLbMVtxjW5RaTVZNbV1WYddFrdfcN2WrXVXUcVjHUTN509E9L5Zq8Xh3pTg6XM3eFS7j/aY4+xQyiYxlpJACVvbAZg/hqHiJfqLmWGj/Ln+NSev+Usyq3nNTF882zLJYL+cwctuFSroUjIxN3S+P/Uon1ff8prwzLa+Zm3EXQ5IdwPnGwtN3nmd8WRFGlacqHtcidUlcBtKKalH8VF/kUDgfCb+tz6IoJCSxteXRZyBzCaUhzlnwWvgqakCy4mdMczCApKMdRpHluvINpVujaAd8x/QNoQXG0jFOoh1bkuP3fpIJA+7Rp8kGOAJ4HPHxJ1eke0m26AD0dWUdOJLkChOsemWVooLpGMRRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199021)(6666004)(6486002)(966005)(83380400001)(66574015)(86362001)(38100700002)(82960400001)(53546011)(6506007)(26005)(6512007)(186003)(6636002)(54906003)(316002)(2906002)(66556008)(44832011)(4326008)(8676002)(66946007)(66476007)(6862004)(8936002)(66899021)(5660300002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?amjUayOG9CvFmo5E3lWfDwlkTbgf7lIEJOvXsr+wH46i3qj2e6n/HnAZDH?=
 =?iso-8859-1?Q?Q5QsppPMe1I/Vk6AC4xiUooPIhCttNQ/42DxvMmhprgDVEJp8qarZKmM1L?=
 =?iso-8859-1?Q?4Rf5Z0jrsAnzviwBdx5Odd/15TaWrJnyBBS1FVYM3GVs4u655IU4nXwKQj?=
 =?iso-8859-1?Q?Inx3hibRYYUSmyNWWfUjKpQJCzwlCL0OKRZlusFzurvXyi6yHWpXy2+YcY?=
 =?iso-8859-1?Q?K5XODumd0tONxqofVeCTKPbHpEqaQSvNew3ySJvBt75S3h1V1pII8c+6d3?=
 =?iso-8859-1?Q?bfFeEZEYO0PNG2X/okdBQ3WHJWjQk7yrbFBui5PSN1zdf5osXL4pBR7BGa?=
 =?iso-8859-1?Q?aWn/8MlUNfyp1/Lc79XSS65eJaLlOcs5jc6C7Itbk6P3PL9A6A6tjvhOQl?=
 =?iso-8859-1?Q?jwWFDzbvwSSuQum3qzeYDJj9O3VkT18b0Gc7I4XYijMehEHxK/QWSZq33/?=
 =?iso-8859-1?Q?dAumbHRubAAQP0zehREflGSbB6S/lNR6hB/eNf7dA4H1HTEt5M+ex4wqxu?=
 =?iso-8859-1?Q?nd5MT1BTLaufcwxr9aG7erA5ZrV+qXok6AqXQ5ObspfwCWUEui+Z9ICTl8?=
 =?iso-8859-1?Q?FJQFR/f4d6gc5jrYY+kUBlqI4a4f7CFJ+NB2ZnmmSX6BIyLBOv1A0R/PSm?=
 =?iso-8859-1?Q?N8xi4Tgde5RS/53znI/BA+2rVDsWicYFkTApzpgUEbXL0IZn6JxlNQplix?=
 =?iso-8859-1?Q?ycLTipxOhDGgHUO37vls0trCnAPs5RL8lk2U4ltRUvwdUgLZvdHiHn3Frt?=
 =?iso-8859-1?Q?dKD80JKbs+8CWj1VKljo+sK2N0+uUK8whsoYTuoSGQ65RFRQvAhpTKOqaN?=
 =?iso-8859-1?Q?esSNDZQohcuPMieOdocn6q23EDESciNBaLFT86G3y49qSCJHswWHAkaIVj?=
 =?iso-8859-1?Q?tXrivaufUjDVMznte6aXa8+w9oGcj+fXvwWtOUN3xUGZduaEBS2Q6eAEGl?=
 =?iso-8859-1?Q?uP/ukjXNynXaN+4isQclKMDhY51catSSA3bvXqa8SL5mucj6I9mYbQTuCp?=
 =?iso-8859-1?Q?bLU5FK3caSJpJ4yd1GISD3ZHpd5cPnIPIpDm87O0NFuB2YgghMYzPh1HVy?=
 =?iso-8859-1?Q?rzWerL6aKhpaDPDGVl34qFGpA8owWdYM6rR42h1KUZRxNHAbzWFCK9dHSa?=
 =?iso-8859-1?Q?p550JffLzlCi1NNyxZL24wpKCENWLwbDEZXF0CYxDDrSkkrlbHzDg/vvzJ?=
 =?iso-8859-1?Q?T2C2zBo0dhW5ArrOcCo4lG7+KciiQUY0LiFAHc4A5OD0zhqNTLCxYJaC37?=
 =?iso-8859-1?Q?mFLcdx9KMv2NMcuv2iV2ff/xGfzfNPizbl0YhFLtV3QOPb4CQ56n1dLXts?=
 =?iso-8859-1?Q?KzfJZ474dVef9y2IBZCZEOBjak0rA7BtF6NsdSQSByC54Xjt475rArMyJh?=
 =?iso-8859-1?Q?a5MDTsbdaHSjIKFQfcqyiZtIY6864FxFBkxWo36VDJP8m3CTZjLE3MeRy1?=
 =?iso-8859-1?Q?EmscYZecaxc9gf8kl/+eNjnAz6qHIxpoc9fvTl3usMTj/kSLjq1O8tFcDW?=
 =?iso-8859-1?Q?3Vj4aKgmxy0YmuK8xHh9LAhdObsdujPHjBxSy0Gozup3CFiMJ/Nva1CK52?=
 =?iso-8859-1?Q?Yv0OdqRkuDyB/824WaU+K1UCH8prYGsfcgEEnqturVpEC2P+iYsirXUvuM?=
 =?iso-8859-1?Q?ZzfpE81ve7mkMuIRspKvCWhZjz5wjoJwRt44ODZfOPF3nQhSzMtF8EGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a32f5964-6fcd-4144-ea5a-08db3537aab1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:09:00.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+8d9cJKUTM6GPltoRsEEggt/RpZyGyvTtofnuz/f/dbUl9g3VnCL3zhHCD+7eVVvUWRuSyDJaBrJ9rTO5/vFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
> Hi Matt, Thomas,
> 
> Some very bold out of box thinking in this area:
> 
> 1. so you want to use drm scheduler and dma-fence for long running workload. Why you want to do this in the first place? What is the benefit? Drm scheduler is pretty much a software scheduler. Modern gpu has scheduler built at fw/hw level, as you said below for intel this is Guc. Can xe driver just directly submit job to Guc, bypassing drm scheduler? 
>

If we did that now we have 2 paths for dependency track, flow controling
the ring, resets / error handling / backend submission implementations.
We don't want this.
 
> 2. using dma-fence for long run workload: I am well aware that page fault (and the consequent memory allocation/lock acquiring to fix the fault) can cause deadlock for a dma-fence wait. But I am not convinced that dma-fence can't be used purely because the nature of the workload that it runs very long (indefinite). I did a math: the dma_fence_wait_timeout function's third param is the timeout which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not long enough, can we just change the timeout parameter to signed 64 bits so it is much longer than our life time... 
> 
> So I mainly argue we can't use dma-fence for long-run workload is not because the workload runs very long, rather because of the fact that we use page fault for long-run workload. If we enable page fault for short-run workload, we can't use dma-fence either. Page fault is the key thing here.
> 
> Now since we use page fault which is *fundamentally* controversial with dma-fence design, why now just introduce a independent concept such as user-fence instead of extending existing dma-fence? 
> 
> I like unified design. If drm scheduler, dma-fence can be extended to work for everything, it is beautiful. But seems we have some fundamental problem here.
>

Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
the signal / CB infrastructure) and enforce we don't use use these
dma-fences from the scheduler in memory reclaim paths or export these to
user space or other drivers. Think of this mode as SW only fence.

Matt
 
> Thanks,
> Oak
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: April 3, 2023 8:22 PM
> > To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com; airlied@linux.ie;
> > lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
> > <matthew.brost@intel.com>; christian.koenig@amd.com;
> > faith.ekstrand@collabora.com
> > Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
> > 
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
> > 
> > - Generic messaging interface for DRM scheduler
> > 
> > Idea is to be able to communicate to the submission backend with in band
> > (relative to main execution function) messages. Messages are backend
> > defined and flexable enough for any use case. In Xe we use these
> > messages to clean up entites, set properties for entites, and suspend /
> > resume execution of an entity [5]. I suspect other driver can leverage
> > this messaging concept too as it a convenient way to avoid races in the
> > backend.
> > 
> > - Support for using TDR for all error paths of a scheduler / entity
> > 
> > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > 
> > - Annotate dma-fences for long running workloads.
> > 
> > The idea here is to use dma-fences only as sync points within the
> > scheduler and never export them for long running workloads. By
> > annotating these fences as long running we ensure that these dma-fences
> > are never used in a way that breaks the dma-fence rules. A benefit of
> > thus approach is the scheduler can still safely flow control the
> > execution ring buffer via the job limit without breaking the dma-fence
> > rules.
> > 
> > Again this a first draft and looking forward to feedback.
> > 
> > Enjoy - Matt
> > 
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > [2] https://patchwork.freedesktop.org/series/112188/
> > [3] https://patchwork.freedesktop.org/series/114772/
> > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
> > next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > 
> > Matthew Brost (8):
> >   drm/sched: Convert drm scheduler to use a work queue rather than
> >     kthread
> >   drm/sched: Move schedule policy to scheduler / entity
> >   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >   drm/sched: Add generic scheduler message interface
> >   drm/sched: Start run wq before TDR in drm_sched_start
> >   drm/sched: Submit job before starting TDR
> >   drm/sched: Add helper to set TDR timeout
> >   drm/syncobj: Warn on long running dma-fences
> > 
> > Thomas Hellström (2):
> >   dma-buf/dma-fence: Introduce long-running completion fences
> >   drm/sched: Support long-running sched entities
> > 
> >  drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> >  drivers/dma-buf/dma-resv.c                  |   5 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> >  drivers/gpu/drm/drm_syncobj.c               |   5 +-
> >  drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> >  drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> >  drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> >  drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> >  drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> >  drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> >  drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> >  include/drm/gpu_scheduler.h                 | 130 +++++++--
> >  include/linux/dma-fence.h                   |  60 ++++-
> >  16 files changed, 649 insertions(+), 184 deletions(-)
> > 
> > --
> > 2.34.1
> 
