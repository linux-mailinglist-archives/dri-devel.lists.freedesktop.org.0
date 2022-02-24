Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51D4C3612
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D63510E18E;
	Thu, 24 Feb 2022 19:45:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D860C10E18D;
 Thu, 24 Feb 2022 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645731914; x=1677267914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nGBe1NDAp6/Br+7+MZK8rK0DpkJYQflCdIRxv8/PJJ8=;
 b=kTi+G0/h+trEQVkl/F2f8G00gRAgYOOiqUDXM0dUQ1N14M0ECw87Ijxo
 etHSXNCHoV9E3uwY6ee7ZvYBDdS/GidPbZy7yvKFr6hJonKLMZssIy2FI
 7ThjNtnv4RMXjoG+K8vHHkKOycQmMQOClH1HuIgAjjEzG7vcpWrwBZ+n5
 XQwu+1wvTwFrU4IRZRoscYQybKis4xDH7ISPSE1Y3Lhcs9uozZLUT7j6n
 wtLe95ZfE84MvXvhuCmRM9OtdFyNKrM6QUaR9TlTCAPiqy0zXwcAU2B0U
 wsmxZRdu4k/V8XdIzO7IploBXP8YcX0uakB6GRDLFTlzWmsL3g/eyKfxQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="251163558"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="251163558"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 11:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491728854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2022 11:45:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 11:45:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 24 Feb 2022 11:45:13 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 11:45:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQnshrXBxW0YkIUK8vdiwuWq1yMfOR4aXWTZIogFbH0dvwwBItBOrkh4/oHAlOipdGvUDk6l2WtHoSzftjRBA1jzxdxA8fYxNcLUBAsCAOrG6Vv6zCWUeC9bogKh5J9rQTDVRGekG748uigThV3dIvMfv/0HSpwRmqirKkjx6dAO8Mfah7mwMYJRozSXU7z3pS0OCjz+5ITcQbAWvS0Xuv1n+dc3nqingZwlnTv+ybLFmd0LAb/qArNCj8eF/ipnhBdzipn2a5QRCJaere4fyZAoGFrl8ieH3Vgw5kRdEaiKI+8hoRjlpvKfxo1VEUf6atkBRLkHJuQzr62cjTMMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI1y39w+M8DrYLrNiWzIdGoGe+33Ax0n3ARTwkQ3Ohw=;
 b=R+IuX2lB6z6CctSrtiCVlBqJGJGds8s2Sntdrlpg4BV6198vaZ07K8X9qKy8WxHkXrqeo2zY1al2+ek420u8tRY5sAE0GLeHjvIkCPG6McW3WnFpVkQ6f6pg5pkpS4QfOi3+ELIhQ3cqbT/OSpiNlxlK+gY6WlzYew4koyK/lIrWHtwnThkXmgPfys+bGvr5f6hdBTiqV+SywPCq/4sy5G75LgyIiA+OUVSuTO+5c89UQ6vokOpGWL34dvaMIhdf+SnYuoRlgjNjY0RY7VHUFsLuLT+bBaSWcJIWJqnwHLgyWcXNeG/yUA7+s+0snVtEp0H5tJ6vScluzHyg0gCzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 19:45:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 19:45:10 +0000
Message-ID: <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
Date: Thu, 24 Feb 2022 11:45:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR10CA0017.namprd10.prod.outlook.com (2603:10b6:301::27)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5729f108-f1b1-4d0e-49e8-08d9f7ce2abe
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB44938B7FF44F5424D28B42FABD3D9@MN2PR11MB4493.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zX/UzTVTFdTA58BkJOgI66EQ4cEcNjjSmW8JHLvgTwx+asibCCtEZ7v1tKCvyP7zaPunAJQrVQwekwY+H55l2kYGsU+w8ahMCBhtvXnUURNVjWbiR/iR2fPnATHF/4UjoBtSxbo+0Q37LVq6g+D5pGeKP8rOGf/ggagsAE4NTi5vQN23k8xaA35z+/apBO7metwrP1Fqwg0YUi7dbd7F2iutLtS3nq9a3Sq/xoUh6bHbGT6zAwzLLyeqAS2lAXIdJq0rcYDWoTR682hOsQmWYajF9i+vYhl/OCB53jTFNThZF4EYk63xvZOgO/kun0jozG0lm6ZTv0qQTkr7RiXA9xK9DmKpyNJr3Ee02kuS2AVdPjXvPW/iRtYhhwYff6wnSPd/szo8qg7hbIDXn3vBEIGLxw6lEg3iOv5gWwtrGmamwP3VAQZgNaGnYjHjMXoZFUX7yDsTfmonSKarkiwf/2VjouI9LTtRfEjeOajFelR4L0YxgxxitqjiAluO7Yh535UHoiHxnLXdh9gF41/bc9VqQ9/IPPiCYb3MWrWtzhGueCsTl8Jlb3RIAADbNue7I/FbwRwwwu/egvUAVAYdeJp+rsc37W2FlST84qpDkTrfizufMCK/UVlvZQ6D4BY/zwodwYmDSVtVywnpZpyAk6TyJgwg/2IXBKz+4deJrOvsSVAXxSE6UUkJp+GjRUPKckfYPBOtGgbI/ZvYclplO6ZMhdrFmxkN33ZpiAZSsUttnvEJppE8aqxue/sYc7+l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(31686004)(53546011)(2616005)(26005)(186003)(8936002)(6512007)(6506007)(6666004)(6486002)(31696002)(316002)(5660300002)(508600001)(66476007)(66556008)(66946007)(8676002)(4326008)(30864003)(38100700002)(83380400001)(2906002)(82960400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JpeUhFVWo2c2lvN1FXRkZhSCtabTJkUTVWeU1nVGdDS1V4NUlnSkpjS3lD?=
 =?utf-8?B?ZUk1aXdoeVlvdkNWeG5FS1h0ckYxbEwwRG54MlBLYkVtaDFabWYyTFlpSlNQ?=
 =?utf-8?B?QkxQNjhmNi9CeU44cmxvKzdFUlp3a3REMjNpM2EwNUs0T1RaLzhZUXNQQWtn?=
 =?utf-8?B?dnp6NXdnS3l3dFBwSXdzeW5nNW9DMlFERXRLN2dHTWxkT3hpYkREMlBPeUU1?=
 =?utf-8?B?QjJtQ2wxOWxzcmRkSDVuUkNKYmNTQ1ViZTBZWlhjUCtXczhkYmZJMllNVUNW?=
 =?utf-8?B?RzZxTEhiSjFERU5ZS1RMY1d4dkpwRkRtd2VXK3kzNWxPdG1SbHEyYThPRjJO?=
 =?utf-8?B?M3hBbGJBdGpBSWozL2lGRUVhL0NYaVRuVTJGbUYwRnlNb2diS0xoa094WGV6?=
 =?utf-8?B?QzhPS0ZQSm5XdFlUUmJoSXhxTlBsa1pXZ2tmSGdNZlVtL09TYVFCSkZBZnhG?=
 =?utf-8?B?NGdwNnJzMDBPWXYrTWlPdG5zdXdDbHVCL1I0dldiRU1sZldmSHVxUUtqTnFo?=
 =?utf-8?B?Uzc5S2tGbVFZYlpVSUVPVXhJV0xhU1hDNEZNNW03SSt3YTM5KzhIdDgzam10?=
 =?utf-8?B?ZXpjWnU4aEJ1TGh0TlpISjZ6cnZuU1IrSnB2eDF3aVJKWHgxcXVTNmRTQldM?=
 =?utf-8?B?NFB6cUpNWkQ0VWFobzNjaENtRlZSVy9FZ01PUkFJSEtNK3dCMGhXL2lnMzhq?=
 =?utf-8?B?c2ppRVRDS09PbVkyRTI1bE82ckoyR3hFeElvV3FXdEtuSDJ6dW95ejVkRysy?=
 =?utf-8?B?TTVDajAySVVtU0hna2NWU2FZd3JDM3A2cTd5a3gyRkROckVjS3BxZUdzNmFi?=
 =?utf-8?B?SnJFbWxCVTIxdTZ5blowUWdCOEJDUGJjY3NhMDRWUnl6N0NTSStNU2VlMXNs?=
 =?utf-8?B?TXdTRGY1RlpIYzV4QWVCRCtJYS9NNHJ5OFpXVXJqNUlTSXVLRjkxdUc1UlAy?=
 =?utf-8?B?ZExSd2tyTjgrUVBOVUVSTUp3RWRiR0s1a3RaT08zZEUxY0pOOUNOTFRDKzJF?=
 =?utf-8?B?WDM4TnFaMXFWcmhpblBvWmVWQ1hyMUhQUERGSVlFdkZ0VzFRbG8xc3JrdjZW?=
 =?utf-8?B?WktPRzRWaWc0azg2ZklqdVdKZVVNdVpCMFgwZkhJNkx5M3I5QnNUcEdmMDBT?=
 =?utf-8?B?d1J2SEN6THVsOVU2TnpQQWVUZzAzQVc3eTNwVlJZRVZvWEdCMHYrZXUvWmV4?=
 =?utf-8?B?MjYwTjdXa0xBVGh3QXNNdE05WmNpa0JPOFkxVjF4S0dWb1pXZWUxQi9nQ1Nv?=
 =?utf-8?B?WFZjU0tZTEt4b05EcUd5Z2U5Ti84WWRQV3l1eE1aQnBUV045UmFCTlpUWlAw?=
 =?utf-8?B?N09BaG84NjB6TkxvWFBHWXB4ZE8ycVA4aTlWemdnc0Iwc1Z5NGJnbkNrUWly?=
 =?utf-8?B?S2E1QXBGY01xeUdiRm5wSGNPaWQ0WGhZWkJJL3I5eXFFOExQN24za3F1dXd6?=
 =?utf-8?B?b2FnQWFESittdXRabk0wdkx6N1pYM0VYS05xZnlWT3d2a1VMRTM5UWQyMits?=
 =?utf-8?B?N0RSdC9MclVZMjZjdVlDZmpSQU5DRUdMRmptQWVCN2wvVTcxRk5nSzlTQ2la?=
 =?utf-8?B?N1drbjBYQ3dPenRpNkl3NEUwNHBtazMyc2pCSEducFFwUzBvK244OW1SNjF5?=
 =?utf-8?B?VllkeU8zUktwbzdtR0x6MnJUaW1NTFRzTXdtOFZjbzFtbVFHdnAvR0g5NzhD?=
 =?utf-8?B?N2RoNTdqd01iNGY1ME50RnZkclhwMEtaa0FYZFlGbnJSZ1FzKy9wbCtjaG0v?=
 =?utf-8?B?ZU9nTU9GZHZ2a1BrWUJHbmIvSXJBOFlJdFFvdzFvQlJtaGRZZXdXUWNYOU8y?=
 =?utf-8?B?WFZzK1hlOW9GdDJvbUlzRElpWmJBUkltbUtsSUdyYWtFTmtPaHh1S2RWaG80?=
 =?utf-8?B?cG53b0Exak5VYU5PNVVqYUlYb2RlY0xPTVZvRUZ6SGtVK2JmL1U4d3c2OWlP?=
 =?utf-8?B?cHdCcHhPaXp3WHBLeUU4cTJrVUdaV3pFMkxkWFcrZFdPN0tlbnRhTXFSRUxM?=
 =?utf-8?B?U05EOElHTDNvUlE1aHJ1dXVlM0F4R0V2a1hxOWpHNDkzOTFCb3lrN05kOHl6?=
 =?utf-8?B?RkVKQ3A1bTJEbC9ZLzBhRm5NbEFZYmorV014NVB1QjdOSTdTdzhYR1ByTitG?=
 =?utf-8?B?RWFLRDUvUEorSkJoVFF6UDMxUU4zaTZzdjlQMmU3d0xxNlF2TDFQQ3hhU0pC?=
 =?utf-8?B?cWNYRVhSN0V3WVhhWkZmUE5ma1pUUGs1WjhTYXRBWHk3YUdGb3pDa2NMNnJT?=
 =?utf-8?Q?SgPTABLFkgNyDTyM4+lqxDXy3d45Fz6YfzYLZCN0Gg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5729f108-f1b1-4d0e-49e8-08d9f7ce2abe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:45:10.3479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/sOQMooYqsomDhUg9JO7d7h1bZ67vTcdn5aOhEBtqADLSJ4hyYGFlgaqy1fAeIyTGBgsjAyIwc6KTBqYfnjsIAwSeZbZUjE3A5TCaNPi0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/2022 03:41, Tvrtko Ursulin wrote:
> On 23/02/2022 20:00, John Harrison wrote:
>> On 2/23/2022 05:58, Tvrtko Ursulin wrote:
>>> On 23/02/2022 02:45, John Harrison wrote:
>>>> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Compute workloads are inherantly not pre-emptible for long 
>>>>>> periods on
>>>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>>>> for compute capable engines was disabled. This is undesirable 
>>>>>> with GuC
>>>>>> submission as it prevents per engine reset of hung contexts. 
>>>>>> Hence the
>>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>>> magnititude.
>>>>>
>>>>> (Some typos above.)
>>>> I'm spotting 'inherently' but not anything else.
>>>
>>> Magnititude! O;)
>> Doh!
>>
>> [snip]
>>
>>>> Whereas, bumping all heartbeat periods to be greater than the 
>>>> pre-emption timeout is wasteful and unnecessary. That leads to a 
>>>> total heartbeat time of about a minute. Which is a very long time 
>>>> to wait for a hang to be detected and recovered. Especially when 
>>>> the official limit on a context responding to an 'are you dead' 
>>>> query is only 7.5 seconds.
>>>
>>> Not sure how did you get one minute?
>> 7.5 * 2 (to be safe) = 15. 15 * 5 (number of heartbeat periods) = 75 
>> => 1 minute 15 seconds
>>
>> Even ignoring any safety factor and just going with 7.5 * 5 still 
>> gets you to 37.5 seconds which is over a half a minute and likely to 
>> race.
>
> Ah because my starting point is there should be no preempt timeout = 
> heartbeat * 3, I just think that's too ugly.
Then complain at the hardware designers to give us mid-thread 
pre-emption back. The heartbeat is only one source of pre-emption 
events. For example, a user can be running multiple contexts in parallel 
and expecting them to time slice on a single engine. Or maybe a user is 
just running one compute task in the background but is doing render work 
in the foreground. Etc.

There was a reason the original hack was to disable pre-emption rather 
than increase the heartbeat. This is simply a slightly less ugly version 
of the same hack. And unfortunately, the basic idea of the hack is 
non-negotiable.

As per other comments, 'tP(RCS) = tH *3' or 'tP(RCS) = tP(default) * 12' 
or 'tP(RCS) = 7500' are the available options. Given that the heartbeat 
is the ever present hard limit, it seems most plausible to base the hack 
on that. Any of the others works, though. Although I think a explicit 
hardcoded value is the most ugly. I guess the other option is to add 
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE and default that to 7500.

Take your pick. But 640ms is not allowed.

>
>>> Regardless, crux of argument was to avoid GuC engine reset and 
>>> heartbeat reset racing with each other, and to do that by 
>>> considering the preempt timeout with the heartbeat interval. I was 
>>> thinking about this scenario in this series:
>>>
>>> [Please use fixed width font and no line wrap to view.]
>>>
>>> A)
>>>
>>> tP = preempt timeout
>>> tH = hearbeat interval
>>>
>>> tP = 3 * tH
>>>
>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>
>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 
>>> * tH] ----> FULL RESET
>>>                                                        |
>>>                                                        \- preemption 
>>> triggered, tP = 3 * tH ------\
>>> \-> preempt timeout would hit here
>>>
>>> Here we have collateral damage due full reset, since we can't tell 
>>> GuC to reset just one engine and we fudged tP just to "account" for 
>>> heartbeats.
>> You are missing the whole point of the patch series which is that the 
>> last heartbeat period is '2 * tP' not '2 * tH'.
>> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
>>
>> By making the last period double the pre-emption timeout, it is 
>> guaranteed that the FULL RESET stage cannot be hit before the 
>> hardware has attempted and timed-out on at least one pre-emption.
>
> Oh well :) that probably means the overall scheme is too odd for me. 
> tp = 3tH and last pulse after 2tP I mean.
To be accurate, it is 'tP(RCS) = 3 * tH(default); tH(final) = 
tP(current) * 2;'. Seems fairly straight forward to me. It's not a 
recursive definition or anything like that. It gives us a total 
heartbeat timeout that is close to the original version but still allows 
at least one pre-emption event.

>
>> [snip]
>>
>>
>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 
>>> * tH] ----> full reset would be here
>>>                |
>>>                \- preemption triggered, tP = 3 * tH ----------------\
>>> \-> Preempt timeout reset
>>>
>>> Here is is kind of least worse, but question is why we fudged tP 
>>> when it gives us nothing good in this case.
>>>
>> The point of fudging tP(RCS) is to give compute workloads longer to 
>> reach a pre-emptible point (given that EU walkers are basically not 
>> pre-emptible). The reason for doing the fudge is not connected to the 
>> heartbeat at all. The fact that it causes problems for the heartbeat 
>> is an undesired side effect.
>>
>> Note that the use of 'tP(RCS) = tH * 3' was just an arbitrary 
>> calculation that gave us something that all interested parties were 
>> vaguely happy with. It could just as easily be a fixed, hard coded 
>> value of 7.5s but having it based on something configurable seemed 
>> more sensible. The other option was 'tP(RCS) = tP * 12' but that felt 
>> more arbitrary than basing it on the average heartbeat timeout. As 
>> in, three heartbeat periods is about what a normal prio task gets 
>> before it gets pre-empted by the heartbeat. So using that for general 
>> purpose pre-emptions (e.g. time slicing between multiple user apps) 
>> seems reasonable.
>
> I think the fact you say tP fudge is not related to heartbeats and 
> then go to mention heartbeat even in the "formula" which uses no tH is 
> saying something (at least that's how I read the 7.5s option). :)
I said the tP fudge is not because of the heartbeat. It is obviously 
related.

As per comment above, the fudge factor is based on the heartbeat because 
the heartbeat is the ultimate limit. But the *reason* for the fudge fact 
has nothing to do with the heartbeat. It is required even if heartbeats 
are disabled.

>
>>> B)
>>>
>>> Instead, my idea to account for preempt timeout when calculating 
>>> when to schedule next hearbeat would look like this:
>>>
>>> First of all tP can be left at a large value unrelated to tH. Lets 
>>> say tP = 640ms. tH stays 2.5s.
>> 640ms is not 'large'. The requirement is either zero (disabled) or 
>> region of 7.5s. The 640ms figure is the default for non-compute 
>> engines. Anything that can run EUs needs to be 'huge'.
>>
>>
>>>
>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>
>>> <-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> 
>>> Pulse3 <-- [tH + tP] --> full reset would be here
>> Sure, this works but each period is now 2.5 + 7.5 = 10s. The full 
>> five periods is therefore 50s, which is practically a minute.
>
> No, in my proposal it is 3 * (2.5s + 640ms) =~ 9.3s.
Not good enough. After 2.5s, we send a pulse. After a further 640ms we 
perform an engine reset. That means your compute workload had only 640ms 
after being told to pre-empt to reach a pre-emption point. That won't 
work. It needs to be multiple seconds.

>
>> [snip]
>>
>>> Am I missing some requirement or you see another problem with this 
>>> idea?
>>>
>>>>> On a related topic, if GuC engine resets stop working when preempt 
>>>>> timeout is set to zero - I think we need to somehow let the user 
>>>>> know if they try to tweak it via sysfs. Perhaps go as far as 
>>>>> -EINVAL in GuC mode, if i915.reset has not explicitly disabled 
>>>>> engine resets.
>>>> Define 'stops working'. The definition of the sysfs interface is 
>>>> that a value of zero disables pre-emption. If you don't have 
>>>> pre-emption and your hang detection mechanism relies on pre-emption 
>>>> then you don't have a hang detection mechanism either. If the user 
>>>> really wants to allow 
>>>
>>> By stops working I meant that it stops working. :)
>>>
>>> With execlist one can disable preempt timeout and "stopped 
>>> heartbeat" can still reset the stuck engine and so avoid collateral 
>>> damage. With GuC it appears this is not possible. So I was thinking 
>>> this is something worthy a log notice.
>>>
>>>> their context to run forever and never be pre-empted then that 
>>>> means they also don't want it to be reset arbitrarily. Which means 
>>>> they would also be disabling the heartbeat timer as well. Indeed, 
>>>> this is what we 
>>>
>>> I don't think so. Preempt timeout is disabled already on TGL/RCS 
>>> upstream but hearbeat is not and so hangcheck still works.
>> The pre-emption disable in upstream is not a valid solution for 
>> compute customers. It is a worst-of-all-worlds hack for general 
>> usage. As noted already, any actual compute specific customer is 
>> advised to disable all forms of reset and do their hang detection 
>> manually. A slightly less worse hack for customers that are not 
>> actually running long compute workloads (i.e. the vast majority of 
>> end users) is to just use a long pre-emption timeout.
>
> If disabled preemption timeout is worst of all words and compute needs 
> to disable heartbeat as well then why did we put it in? Perhaps it was 
> not know at the time it would not be good enough. But anyway, do I 
> read you correct that current thinking is it would be better to leave 
> it at default 640ms?
No. We cannot have the RCS default to 640ms.

Note that there is a difference between 'general end user who might run 
some compute' and 'compute focused customer'. The driver defaults 
(disabled or 7500ms) are for the general user who gets the 
out-of-the-box experience and expects to be able to run 'normal' 
workloads without hitting problems. I.e. they expect hung tasks to get 
reset in a timely manner and while they might run some AI or other 
compute workloads, they are not a HPC datacenter. Whereas the compute 
datacenter customer expects their workloads to run for arbitrarily long 
times (minutes, hours, maybe even days) without being arbitrarily 
killed. Those customers will be explicitly configuring their datacenter 
server for that scenario and thus don't care what the defaults are.


>
> If so, if we went with my proposal, would everyone be happy? If yes, 
> isn't it a simpler scheme? No special casing when setting the preempt 
> timeout, no special casing of the last heartbeat pulse. Works 
> predictably regardless of the priority of the hypothetical 
> non-preemptible workload.
No, we have to have the increased pre-emption timeout. And that has 
ripple effects of making very long heartbeats or risking races with the 
heartbeat beating the per engine reset.


>
>>>> advise compute customers to do. It is then up to the user 
>>>> themselves to spot a hang and to manually kill (Ctrl+C, kill ###, 
>>>> etc.) their task. Killing the CPU task will automatically clear up 
>>>> any GPU resources allocated to that task (excepting context 
>>>> persistence, which is a) broken and b) something we also tell 
>>>> compute customers to disable).
>>>
>>> What is broken with context persistence? I noticed one patch 
>>> claiming to be fixing something in that area which looked suspect. 
>>> Has it been established no userspace relies on it?
>> One major issue is that it has hooks into the execlist scheduler 
>> backend. I forget the exact details right now. The implementation as 
>> a whole is incredibly complex and convoluted :(. But there's stuff 
>> about what happens when you disable the heartbeat after having closed 
>> a persistence context's handle (and thus made it persisting). There's 
>> also things like it sends a super high priority heartbeat pulse at 
>> the point of becoming persisting. That plays havoc for platforms with 
>> dependent engines and/or compute workloads. A context becomes 
>> persisting on RCS and results in your unrealted CCS work being reset. 
>> It's a mess.
>>
>> The comment from Daniel Vetter is that persistence should have no 
>> connection to the heartbeat at all. All of that dynamic behaviour and 
>> complexity should just be removed.
>
> Dependent engines is definitely a topic on it's own, outside 
> hearbeats, persistence and all.
Except that it has implications for persistence which the current driver 
does not take into account.

>
> Otherwise there is definitely complexity in the execlists backend but 
> I am not sure if logic persistence and heartbeats are so very 
> connected. It does send a pulse when heartbeat interval is changed, 
> which if going to zero, it will kick of closed contexts if it can:
>
> static struct intel_engine_cs *
> __execlists_schedule_in(struct i915_request *rq)
> {
>     struct intel_engine_cs * const engine = rq->engine;
>     struct intel_context * const ce = rq->context;
>
>     intel_context_get(ce);
>
>     if (unlikely(intel_context_is_closed(ce) &&
>              !intel_engine_has_heartbeat(engine)))
>         intel_context_set_banned(ce);
>
>     if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>         reset_active(rq, engine);
>
> Is this what you mean? The point of this is to make sure persistent 
> context does not hog the engine forever if hangcheck has been disabled.
>
> Reminds me of my improvement to customer experience which never got in 
> (https://patchwork.freedesktop.org/patch/451491/?series=93420&rev=2). 
> Point of that one was to avoid engine reset (or worse) after user 
> presses "Ctrl-C" if something takes just over 1ms to cleanly complete.
The plan is that the persistent contexts would still get the default 
grace period (pre-emption timeout at least) to finish but Ctrl+C will 
kill it within a timely manner if it does not finish.

>
>> Persistence itself can stay. There are valid UMD use cases. It is 
>> just massively over complicated and doesn't work in all corner cases 
>> when not using execlist submission or on newer platforms. The 
>> simplification that is planned is to allow contexts to persist until 
>> the associated DRM master handle is closed. At that point, all 
>> contexts associated with that DRM handle are killed. That is what AMD 
>> and others apparently implement.
>
> Okay, that goes against one recent IGT patch which appeared to work 
> around something by moving the position of _context_ close.
No it does not. The context close is not the trigger. The trigger is 
closing the top level DRM handle. If your context has persistence 
enabled (the default) then closing the context handle will have no 
effect. No pulse, no pre-emption, no kill, nothing. But when the top 
level handle is closed (application exit through whatever mechanism) 
then all GPU resources will be cleaned up. As above, with at least a 
pre-emption timeout grace period, but after that it is termination time.

The media use cases for persistence are all happy with this scheme. I 
don't actually recall if we got a reply back from the OGL people. They 
were definitely on the email thread/Jira task and did not complain. OCL 
obviously don't care as their first action is to explicitly disable 
persistence.

John.

>
> Regards,
>
> Tvrtko

