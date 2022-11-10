Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D1623824
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 01:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1716210E63A;
	Thu, 10 Nov 2022 00:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF1E10E639;
 Thu, 10 Nov 2022 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668040144; x=1699576144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F0crElwT4T9OYKSmKZbPHsccET0iTSNM8OtfrwUzXk4=;
 b=UibDFV12y1lDgp9fnn1vAzak6KFGJcMj+WdtYY/PhPh1YjDYyqYK+z25
 uhcYGNbNcZpe1nr7Qc3E6qt3702Kd6A2SFgd28kNPLRKuR/iD3e5WsdKl
 1H0Bm1amzMUY+AIMNcsm9RqNyXnDRLplucwvNrEA3L88+w0boGO41EVaS
 iwFBkA2ZEjPjwdIpm5tAdnj73OLALz4v+loyT0nLb054xHfYXr+6zphCM
 uKvPHBCkzxBSsenNy9vDGVrCxOd+/tFYbb575OXIpHec3tKHm9fMcKRGQ
 nRnRCWU2yUH2o7e78Y9H2+SVeHHDst7MYoVC6WUlbuEe0xIgmRfwAFAL4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="397459447"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="397459447"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 16:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="587966926"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="587966926"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 16:29:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:29:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 16:29:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 16:28:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zlz8TYTyjyUfHiTvbGV/j7+DXOyoDIQi8d81SJtB40w4ReKGSEN1ygE3ci8PA1Q/z2IlHsqDR1DGIMaNJUAEgeWdWdI52v1TSnHzATEL0gDGvyDpw9GPO+pMyt61FiQBKDH6Ju/nErZmwje0h54ZT82edpd/9841L6f25aB+wlI3+T+OwMTUSGmGQQnZ9UBvDLH1yMEFTDQc0dCoAQEgrGcCyv2uWa0Rz8BtMqNjMpL8X79QNZQXGMOBVTs7IrZe/JUQZdZgtq5hgn94enhr5kwtyuVcxrr+FQEHx+qOr1KBsGuaR6f5ygUotKCRxjvWuiOxvQhPqYGgzU3ROH3r1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnD5SKwUKifXGpXwSBB2pCaFK310R/2oCqThCkqlPU4=;
 b=gz9T5tH8PlQ/hxTdzP2kfRMMYYaUQdw6PzFzaOF2oeySMSjb6PwNs1ABECiGdnQg51aeMXgunft/YKQLWznmYxouTOBcUABivHj1tibuAabZ0sRzUyO1dCBd2liMeR0XuE0OsZf0oaEq8KJDHEDbcIiLe0Qs0Sas7Y+Udi/Vl8MHwPzCJfuY+Ggr2mthkUuEBMCNvL4d1MTh/O6Hzl3yRLyexRtCpdew4EuNZMtavEJNDpJYYxKjh8SVG4bjZFf4QmwrDz4fr5DeFpUiR3a1V1zrukTqtUWVt8eQes0JGutg++UtX5Wu89PcZEhQshOXvAoXiwStrLbvRkqX0Djk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 10 Nov
 2022 00:28:55 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68%3]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 00:28:55 +0000
Date: Wed, 9 Nov 2022 16:28:52 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y2xFxKS1oSG5kN0A@nvishwa1-DESK>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
 <Y2wYAPW5hIQImDU4@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2wYAPW5hIQImDU4@ashyti-mobl2.lan>
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 384cbde9-290b-4c9f-c782-08dac2b28cfd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2on3//Qox7TgPWIeOFyqDkgGCgRsWp4ULgdrWS6dxlJB9wn0z0w4w/fl5aSRSGVYhZo7acGDImJptT5QIGpvRN2oGHi5PD03pW7m6Hd80puMpk4z5aZi6gjiR3GbqLn64y1V3T2ZHjjyfOkAwp0autH7+kNNv3BHR+TbMmd8cviacBWrASddHUy6T05OMIi8NgzJsqAPNwKGefODUDw/qHsEZ/xaLhrZCtqdq+FFtCj2m0mFPfPMPuQZLr/Pa2wFiAYy/XTKXoz85kSQLEzua3yOwkZ1Dp4/v7zJD9RHpm8OulOOa7mIkepaMeLPtNbgjYOJL1ynGPaNj53S03W0atb8Ie5ZG2M5FblSTd2B7EtmZ5hZ/KS6xK4XTsRobNwKo8Gr333xOR0jsJ5I3innirJCU4TzrmQUwFMLKf8Cu4fmjgKIic9Q5cU71uM8qBZeFJ25N3zZqJPbiznZVquwYSm1cCBKb1075f4lyRUIZhzXfGo39RC8gOjfcz1L3sIjKkK86k+52C32VWe5+vP+PqGw6VLZhqCA2CcVBZzDLsdcOQ9P4A+jbztC5cKlyVFmtKbNCwG0Ck5LExUt0TcMFjM57umXreIqBhFlgY1ItGZqmQJgoXl2fK1+VW/iAY2MKhTUUm0gNQKKVUW1mYPVgWQGBkceKlzRjg4AUQF9X1GvcPj/pGnfSo6MBEEQC4tzfYV5pvTkMv0wwt9QohWmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(86362001)(82960400001)(186003)(26005)(6512007)(83380400001)(9686003)(44832011)(2906002)(6666004)(6506007)(316002)(4326008)(66946007)(8676002)(66476007)(66556008)(33716001)(6916009)(478600001)(5660300002)(8936002)(38100700002)(41300700001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oEHz5bbU7YnUzz6T2C4ukMPijAU8B1cHFvb+JVG7keYuj74EpQzA1/v3tEh3?=
 =?us-ascii?Q?k2C4SSsRRFLFPQ8nj68ooC/MvEs27RaskCUunSwcuxgfaSHx8qpKa8pnHtH9?=
 =?us-ascii?Q?SLJ4ACOAfyMJQyaw3ik5bNQofx7V32EqwA+39KhLPXwoezoTrwyA7pirYLXF?=
 =?us-ascii?Q?ixYuCejiKMXanByNjUibmCeMrlOT7zwMLU3rzdIu0uawbiQiUQKIC8ZZylFT?=
 =?us-ascii?Q?z91nN+FEMwrKX8Y0mIC3ksE2Dv60gydtusAzyC9PSYYt3bEEnERVEO5O8s6Q?=
 =?us-ascii?Q?tm/26pu60m2x+EkxoEALdZl9C3kMGPyN2mbg+bS77/O2AMCgOjDiCPHacuP+?=
 =?us-ascii?Q?fbq8xZdTvRIj4Zdx7N8tL9OBg2Zg9quUHOb9gujpK2xofysrDdS5WrX0Sb/2?=
 =?us-ascii?Q?WOGCv508XWKxCCJnFBNamvKfWoAPk8MybBJpKLRXnnBi3bGOVSwERsqV+z9u?=
 =?us-ascii?Q?tm/LW2h9BRz0es89nIWu8IIdKf169krQPDs+T3Dz7y1GjKYwzS+3+Z1bV+vi?=
 =?us-ascii?Q?tcSeHLI6SJhU1JQMMbwfhNpCmVRdAhzAKfBjtKPpjlfmzcbFW+bjeTvzI+BI?=
 =?us-ascii?Q?3ZZKH40Ym+6AFhxx8yOdUjG48Hld6MvQKPtWtNrEmxtG62bpZsqGxSgNsyDf?=
 =?us-ascii?Q?v6TZp7E12R5FxHlLrSmgTowqC0NpTcJ5vkfUeGsl9/8EX89G+DrZIrAC08Uw?=
 =?us-ascii?Q?wwEGYHtki0977SnFLonopdmOtuUDGrAQNjlyFRoxXYGj1p0Gfv05sDavFDiE?=
 =?us-ascii?Q?WglsEmfnTE9gpQS6b6dKhrFGVkUk6gpj5j3yaJgE/8W3z+/MxaJeMXHJJYne?=
 =?us-ascii?Q?3fupqR4Ca4TUBsE9sOTQR2cn9TpUdUNk2uTcEEz910atUPXq9vYFaGHMZp3D?=
 =?us-ascii?Q?rhR3RCgYqt55iIdhEj8QalNDkxq0wMpAjAMO6BfFEvxzgxXZ2QyWk+0OIGh1?=
 =?us-ascii?Q?NJ4qXVFyLmF363jxd9cL/1EIpw0xBloLTjMd4Yko71aA0pmPWsNeqWZpjG0G?=
 =?us-ascii?Q?rZmffOtW4JYt2NOsyAtFMD79dzOT8hy2fCcqulsujEzwznz7oGvRC1fgAfNP?=
 =?us-ascii?Q?rsj1VBlC/1QqfFg77TWSj+LFhvlFKPRp71wCuh2Ske+UMRLzuGnkhkuGIzRY?=
 =?us-ascii?Q?vsQ42kbmGBuvlz0IGLrjSLt3iyJ3cbDiV4ipAP5hwis4M7iW7G4P3XPOsQQL?=
 =?us-ascii?Q?9cB+Nsvsjz1tVpYW3h63KcrVnDlEvRFkHtWyifBEL4a8LKoz4lNoGyl6lDTc?=
 =?us-ascii?Q?eaRiCR4tC6cP0j9T1HnSl67g4YHTHBsajjsHW15pfsBYHxl/Cnn0lAuGTnAm?=
 =?us-ascii?Q?eM9jr+fMVH+24rWL5iL2hsCsUxw6N2pNiFS/7fP4RkpZ/6kWga1rMcZVdgTH?=
 =?us-ascii?Q?6FX2GNZ+kPYGKr+V07FHb9n5bWDJPyCDoDpUkMndON3NwXPQGCUja4CV0hLz?=
 =?us-ascii?Q?6ZZoLr/7t3Zj7O6FKc0u9oGy92ll17nD9XkGaZtcN0Ni8lwPCqN1aM2x9r3y?=
 =?us-ascii?Q?MLYUoVeqVV8t2RCI+htg4qW+KcGFOYMk4g12DuW5KVVgAPeuW4+5JyziFMcR?=
 =?us-ascii?Q?kC5eF810HXsKkY8rrQwRCnlpCdRqiY1ivFdcAragDt+S9uqIqnij1RyxIPV7?=
 =?us-ascii?Q?x8RaALtzE2OE+zB74Q8UyvI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 384cbde9-290b-4c9f-c782-08dac2b28cfd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 00:28:55.3630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCfAr5LdHoc93Ul/E4NTxaJXkHmAdtZbu8Wm548npzPq2lFSWNJj9ZvQidrshicHd4v9XR99MGuKMeYvdwTBKYcGtGfbR9xWqxpuzvUww1kxtUb2CHEXpUVmJpj68Df+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 10:13:36PM +0100, Andi Shyti wrote:
>Hi Niranjana,
>
>...
>
>> -static void force_unbind(struct i915_vma *vma)
>> +static void force_unbind(struct i915_vma *vma, bool async)
>>  {
>>  	if (!drm_mm_node_allocated(&vma->node))
>>  		return;
>> @@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
>>  		i915_vma_set_purged(vma);
>>
>>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>> -	WARN_ON(__i915_vma_unbind(vma));
>> +	if (async) {
>> +		struct dma_fence *fence;
>> +
>> +		fence = __i915_vma_unbind_async(vma);
>> +		if (IS_ERR_OR_NULL(fence)) {
>> +			async = false;
>> +		} else {
>> +			dma_resv_add_fence(vma->obj->base.resv, fence,
>> +					   DMA_RESV_USAGE_READ);
>> +			dma_fence_put(fence);
>> +		}
>> +	}
>> +
>> +	if (!async)
>> +		WARN_ON(__i915_vma_unbind(vma));
>>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>  }
>>
>> @@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>  {
>>  	lockdep_assert_held(&vma->vm->mutex);
>>
>> -	force_unbind(vma);
>> +	force_unbind(vma, false);
>
>How about:
>
>#define force_unbind(v)		__force_unbind(v, false)
>#define force_unbind_async(v)	__force_unbind(v, true)
>
>The true/false parameters in a function is not immediately
>understandable.
>
>or
>
>#define force_unbind_sync(v)	force_unbind(v, false)
>#define force_unbind_async(v)	force_unbind(v, true)
>
>but I prefer the first version.

Andi, I get the point. But currently, force_unbind() is staic
function with only couple of invocations. These defines seems
an overkill (would be good to define these in header files
if the function is not static). Hope we can keep it as is for now.

Niranjana

>
>Andi
