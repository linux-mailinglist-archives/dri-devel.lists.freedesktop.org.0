Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BC6218BA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6658B10E4A2;
	Tue,  8 Nov 2022 15:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615D710E49A;
 Tue,  8 Nov 2022 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667922413; x=1699458413;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p3Iv8Pdgu3lcCuVM8nq4m/7C5ijx0cSWTjf6clvfO1c=;
 b=PvlIR2I8fGO9rUQDcQWK0H8iOwfIik1a14+zeacEUUHkjhKz8Z7M+G6H
 9rPx3r6hH0e6AcNR9KYQwCkuM1FO9uAh+bOsYJ+f2Ybr4NcggtZ3EJm/s
 nJV9hnk45SncVHi2YQaQpqUB+2Cstw/+JS6zsiB1VM/SJ+za3WqEdpRmO
 DJ9kKIGZW+tYFSGMbejW1d8I9SFDWhZdSWhOG6Ap++h1o2lYgG6FSW/37
 LhMLjY0WdVDgwMGAPEQv95RZDNwspLySbMZOac8LdCi+TEwQ1/hT5sOH/
 bdvmKOi38IUg4W8t81CjIdU4as5lzjReAmC9fjhkjP+tpDiHj2DlIy3J3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="309437172"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="309437172"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 07:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="669593549"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="669593549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 08 Nov 2022 07:46:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 07:46:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 07:46:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 07:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCs94nrKnQt5Iq4fBIBvdhqZTjDO0KrLATbKy+7/Vy455wJhEc7HFiYn3jtZcH3c4GMOJelJ2jYCcVIxLtvoqJGGYV1UifRWQertyL9KOAkDIEq+TurvnZ6LmvYFpMt/v8eNG0tRyjZaOwQ1ef0njHk2OwrNtLQd0dm9U7GmYeM4txyfGviEtCXhjg3uxPGfPSAE9TdMcHctxVT3s8YBaUvkGu09qV54rpb0IAnBC4fw0H0RWIwfLMHn9FDqLXy4BFTlJb4at7Diispk6uja8TdZTUjJJlEpbY2DldPRM2d2t4Z/lW2JAzTZwqvPSl4GorHk87TifhU4SbTRQaxF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa+Hs+nsAOdOB/zkr5er7nT4DUkSafn7E/wzjaUnK+8=;
 b=hS/duCdMJM09ZGq+zbSIimHBDXGyaboZ0AnZg4Br5rtMOnmLh7mXJ5YK/aM44eSKCjKwIKSTIxH/JHKHtOuUMqb2IOrQFJzE3tjPu/3sRuh5LiXKJAJinfdHLY2nloyI15QdiA9LBP/aqxUQTAe3X7zqZx1PdvbZXpQyL7jXI+Cr1q6ppWz7rRsab9gq6han7F2H0My3IYnfAgK5Oho7FCh16qAizEAXP9lsp4HtXGq5u97JqdG/UmYk+4lRlKHV0ctK8YzddBXaHj3ibSLSaApwn9geM8tIsVkRSpLGAx160mGdUgOHFCbTdnuL5jMuLGKUeX6w7awggbDSn0Da+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 15:46:49 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e55e:c08c:4749:1c68%3]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 15:46:48 +0000
Date: Tue, 8 Nov 2022 07:46:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Message-ID: <Y2p54QvFyQJ846AJ@nvishwa1-DESK>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
 <9b2538aa6ba2421e603c820af94c5d90df760501.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b2538aa6ba2421e603c820af94c5d90df760501.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: a69cd516-6409-42f5-a2b4-08dac1a07276
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DgsXfzewnrGCIhgPgGYJjEKLqAGsiasRq/+q2eWL644TzKxOHe4Bxwiv5jrH+Izi7zI1VGionPJ3c18Fe6rhyAZVU28JJ61RoFcgWrL2P9L5vzQxxQ1Yz7AvV9iI7zzb8alaA5YOVwOKbV7oyqddLLLDC4wu9pgEEroEDB4NGIWBAAUaxVYzfeFhQ6b5adx867+dwEduV1jBzuNSXaGX5T37NV+436Z7g6y6zZrz20BfIlT3jJ1Wek/YQnOAHtRdptQ/8QQBrvKg3vOgB+ahnP5c2wActQgAQYtpV6ulrBZprKSRaCnUwobKEWfFPwBx+dDGEAxtp65PbGq91JDRPBpR9+LxQT9QxAwWGKXYRnj7EcpPIDU12Dcu00JJzsPJcNTJ0nvPTAGr4Izge8Cw6WICjMkkhgXsDFk2gDijZy0uAaHYzw6/NTD+ICxMneLZOOCivOfRHStDozSr19mdHZzhDbU2dNmJ/8nCsPc7+1ovUUualY8m5c3Rdm5ymzbrsndwsTSjV/egctBWtafLAMFKyvZTAP8RuZlj16UiiGL7Xh1RKkRLxvD57t56q7ZXr5afyD1n88FfYmJLd8H4Ca0FlBcfuOWlZBAJCg/HhmbHwAks4t+AHcJ+JEBMzfWaQvMEUMtZyKsllmhQ2/ET7q+LhhkX9JLjaablKfpDIoN+Kon4lNbI3LU2LeWY5PIiAh+BeJbX+vWz3YdQ1dWwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(2906002)(6666004)(26005)(9686003)(44832011)(6512007)(8936002)(6862004)(6506007)(186003)(5660300002)(6486002)(86362001)(33716001)(38100700002)(478600001)(83380400001)(4326008)(8676002)(66946007)(66556008)(66476007)(41300700001)(82960400001)(54906003)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3f3Xi5ceDJs7NWlCyQ9eF03tu1mZQH2pryAHB5vM3y+rKGV3BqCH8VEBlX?=
 =?iso-8859-1?Q?hFn9jcgsoJb6kKI6lMHQDL/g5IhEDnU8yRwMdHdkYAO1dJTQAQ6oqqhKm9?=
 =?iso-8859-1?Q?BC8Z9CPNEkJx7G8MuhJwOZUegtc5i9cDd9EyD6Ir4pLsGRBsTl2AWOTlzD?=
 =?iso-8859-1?Q?qTWwcVk73/3/R4Tyzgddgb419JHt40NBHS4EQPXZ8yL+5H/ctoe8XBqRvD?=
 =?iso-8859-1?Q?hfCLnHdDkjNObRRtB76xNeJzAKHeKzbXJbvWc1tsJO3jO712djp1qWi428?=
 =?iso-8859-1?Q?tW78mK1yT7FvOV4oHJq0luZPuYwM1NXIoPNapYOuiEGiiyv1y3+jg2G3HG?=
 =?iso-8859-1?Q?RpIzIYM09/A47DEA5+20Uv7K/W3Na9w1qUaFK0wyIBiWRRbU9SMrgdT1d9?=
 =?iso-8859-1?Q?cWTmE0QY2FGI80H1UlUrftTxPaWkOzpbQeAb1M49WU8aJRQd8mhub3KF0O?=
 =?iso-8859-1?Q?HUiHbSF4e5A8hQRel3gX0cMw/FgV2ZCqxfFBUekcw5QnIJIdz3SlU0j8CW?=
 =?iso-8859-1?Q?K2Ui5aL9Ciwg4Xo7IUzyi1hFfh2Pp5RHjv8YCiHJhety/TrPhHlp9Ky52m?=
 =?iso-8859-1?Q?XopdW6vWMPk6BOZh0Q7oS7A4xX0iBw5cjGcYlJmtIKySjl2ScLJ8O7lBTe?=
 =?iso-8859-1?Q?exdw/7mLgfa7TtPI2RMoGHTTF3saLvYqDc5XCG+1CU2ZBCa3OEAENXcfEB?=
 =?iso-8859-1?Q?9D7AICup334VGSrP8UCBX5gZujPjd1c1wlnjSKiHPq1IA5D0dukWSCY5o4?=
 =?iso-8859-1?Q?9XHUvY7YuBYWhpMfqYqiU7zW3m/+CvtqHWCawge5axKZabn7eADSbnwHIG?=
 =?iso-8859-1?Q?gA4n9O+0F9/4t0gJquRxCorL+r/cTWnuwyfJZp+I17amwOHjyp+EakAfe/?=
 =?iso-8859-1?Q?RNNZmDH2hD+00u5r+km+FQn8RAMwFKJ797pDnjPzizSCLqjEGbEA/0Us3W?=
 =?iso-8859-1?Q?fBiIlfLZt09atpiIb8hdDdk5VEtYLiFCMwzjMEGpk1+rC9J5FBIeDRzDWh?=
 =?iso-8859-1?Q?yqRj1KW11WI6I2Rh5f+TQ2fxxqY0k5FQiq0+Gy6pT1wKpHIe27O/QdY5Vx?=
 =?iso-8859-1?Q?o8bDftJhcrIkx+/ZSXjbDY0TuDe/WYahV42Wi1pN3+L37x5ZLkedfpNAVg?=
 =?iso-8859-1?Q?tWtDCFzippr2g+uZoZp8TsR7z2NkMPPoCeG/Vj+6btwSjnN0tzSEOXZP1q?=
 =?iso-8859-1?Q?0vGAObb83RJltI8/rCX8zPJbUxE6f88gXr6zlJ4PDZUYYYtDUFUVs7B4uq?=
 =?iso-8859-1?Q?EqYAdN3vC/y8OkIoJXfEMb0s+2xC5O+a6evTP0u2QZbYEU8HgBbD1l/yZP?=
 =?iso-8859-1?Q?RVrlIU/CGlFgqTOH/45Ve5xFsqFDpi6mRAI0QnzlF4qsshc7Rn/ARq7aDH?=
 =?iso-8859-1?Q?euhIif/vYLNJkHxRkxZKVxCZ0dIUA0bAynT6p6CQ+AxNXDlWzKU3GG0ywX?=
 =?iso-8859-1?Q?pFPr77WcfyhnwRwAnWYThJV/hQMhxdxW/tGz0OojKbFOXHtnXoNKsnAwzg?=
 =?iso-8859-1?Q?2natBuPqTtLchzExOfembKNNcGfHn1WUJdJ87xnwjq4JPdMBv8uz5fqwm5?=
 =?iso-8859-1?Q?cGmeIMhqjPuCaq8Pr2CMjQDEueyDLEZr1aHqW4rpSsALDp3Oxfk918ZJ1b?=
 =?iso-8859-1?Q?18wCXC+2aPNGQ4jMosUyg5EsAoJpYYD3qbF7JHRMilFjUovv214+iZqGyo?=
 =?iso-8859-1?Q?onQAQpbte2iHy8Z8+aU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a69cd516-6409-42f5-a2b4-08dac1a07276
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 15:46:48.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vcb2PhlI55xcRoXU+vmzUfD7i+rD5zMWpGwlhWavaElYdSXIy9fw0xBttaXQlP9rz1P7+3KHo6NPL2gNX/GbJhhEwMUh7By0YqnZel2po75U3fLlf3PSobRb+nmuN20J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:39:34PM -0800, Zanoni, Paulo R wrote:
>On Mon, 2022-11-07 at 00:52 -0800, Niranjana Vishwanathapura wrote:
>> Asynchronously unbind the vma upon vm_unbind call.
>> Fall back to synchronous unbind if backend doesn't support
>> async unbind or if async unbind fails.
>>
>> No need for vm_unbind out fence support as i915 will internally
>> handle all sequencing and user need not try to sequence any
>> operation with the unbind completion.
>
>Can you please provide some more details on how this works from the
>user space point of view? I want to be able to know with 100% certainty
>if an unbind has already happened, so I can reuse that vma or whatever
>else I may decide to do. I see the interface does not provide any sort
>of drm_syncobjs for me to wait on the async unbind. So, when does the
>unbind really happen? When can I be sure it's past so I can do stuff
>with it? Why would you provide an async ioctl and provide no means for
>user space to wait on it?
>

Paulo,
The async vm_unbind here is not transparent to user space. From user space
point of view, it is like synchronous and they can reuse the assigned virtual
address immediately after vm_unbind ioctl returns. The i915 driver will
ensure that the unbind completes before there is a rebind at that virtual
address. So, unless there is error from user programming where GPU tries to
access the buffer even after user doing the vm_unbind, it should be fine.

Regards,
Niranjana

>Thanks,
>Paulo
>
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_vma.c | 51 ++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/i915/i915_vma.h |  1 +
>>  2 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 08218e3a2f12..03c966fad87b 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -42,6 +42,8 @@
>>  #include "i915_vma.h"
>>  #include "i915_vma_resource.h"
>>  
>>
>>
>>
>> +static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
>> +
>>  static inline void assert_vma_held_evict(const struct i915_vma *vma)
>>  {
>>  	/*
>> @@ -1711,7 +1713,7 @@ void i915_vma_reopen(struct i915_vma *vma)
>>  	spin_unlock_irq(&gt->closed_lock);
>>  }
>>  
>>
>>
>>
>> -static void force_unbind(struct i915_vma *vma)
>> +static void force_unbind(struct i915_vma *vma, bool async)
>>  {
>>  	if (!drm_mm_node_allocated(&vma->node))
>>  		return;
>> @@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
>>  		i915_vma_set_purged(vma);
>>  
>>
>>
>>
>>  	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
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
>>  	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
>>  }
>>  
>>
>>
>>
>> @@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
>>  {
>>  	lockdep_assert_held(&vma->vm->mutex);
>>  
>>
>>
>>
>> -	force_unbind(vma);
>> +	force_unbind(vma, false);
>>  	list_del_init(&vma->vm_link);
>>  	release_references(vma, vma->vm->gt, false);
>>  }
>> @@ -1796,7 +1812,34 @@ void i915_vma_destroy(struct i915_vma *vma)
>>  	bool vm_ddestroy;
>>  
>>
>>
>>
>>  	mutex_lock(&vma->vm->mutex);
>> -	force_unbind(vma);
>> +	force_unbind(vma, false);
>> +	list_del_init(&vma->vm_link);
>> +	vm_ddestroy = vma->vm_ddestroy;
>> +	vma->vm_ddestroy = false;
>> +
>> +	/* vma->vm may be freed when releasing vma->vm->mutex. */
>> +	gt = vma->vm->gt;
>> +	mutex_unlock(&vma->vm->mutex);
>> +	release_references(vma, gt, vm_ddestroy);
>> +}
>> +
>> +void i915_vma_destroy_async(struct i915_vma *vma)
>> +{
>> +	bool vm_ddestroy, async = vma->obj->mm.rsgt;
>> +	struct intel_gt *gt;
>> +
>> +	if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
>> +		async = false;
>> +
>> +	mutex_lock(&vma->vm->mutex);
>> +	/*
>> +	 * Ensure any asynchronous binding is complete while using
>> +	 * async unbind as we will be releasing the vma here.
>> +	 */
>> +	if (async && i915_active_wait(&vma->active))
>> +		async = false;
>> +
>> +	force_unbind(vma, async);
>>  	list_del_init(&vma->vm_link);
>>  	vm_ddestroy = vma->vm_ddestroy;
>>  	vma->vm_ddestroy = false;
>> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
>> index 737ef310d046..25f15965dab8 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.h
>> +++ b/drivers/gpu/drm/i915/i915_vma.h
>> @@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
>>  
>>
>>
>>
>>  void i915_vma_destroy_locked(struct i915_vma *vma);
>>  void i915_vma_destroy(struct i915_vma *vma);
>> +void i915_vma_destroy_async(struct i915_vma *vma);
>>  
>>
>>
>>
>>  #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
>>  
>>
>>
>>
>
