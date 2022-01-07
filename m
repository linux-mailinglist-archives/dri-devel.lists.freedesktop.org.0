Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6F486EE9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82FF10E939;
	Fri,  7 Jan 2022 00:36:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683C10E939;
 Fri,  7 Jan 2022 00:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641515764; x=1673051764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=10Yv+crt9n1uReq5vm8ZjtfJa/vOdQof/3NJDrHJZPs=;
 b=nXdAHftmodITJwXUJMKyw/zvB0R9ygXMJXLfVX5IEL9WDLRnMJOFi5k/
 WCqD6DArB0IiFoapJKohV3hVXwZs30RGfbzrYjqgNNbVXHCztEuWRK0j3
 OTvqJqEVDO8EXLdb4oCWeP+Uv6yN5T4hdO79nv8Gx3ATbUnB3AO5wmAR7
 g4qStbhUr2c0h44nqKhcbZfe7zoE/1uZrkb7+KqBYfSXQV4qZKcZtTHrJ
 l1HGPNe633qFCWyeLnmCuLrX3gdL/bnXN0lbtLDkeYf3cuG5LUyDOZZfw
 DrGABaUiAaNII05Rcu8g1b6rWIWX9PXD8glWwuSQUInSZ8krvG4MmfJlV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="267063586"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="267063586"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 16:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="621710749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 06 Jan 2022 16:36:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 16:36:02 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 16:36:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 16:36:02 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 16:36:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcY0UUXq1TyY/XHXhV9dpR9Q6alq0pF4hmD0KOsfkv6poO7bTGDU8+8G3olgP4Mw5q/NxlJpYWB10yabHsigdWpm2+cQ4CXimZcYb+1vH4UUv0iIZ0paY8oY75dFdwL2n6jbGuKHO841YowO5oJWoHENjZpBYt8g4yG8c+QflfI0RUt1baWjkLngdqse4W1/7wlXTyhZ6tq8iTUWHdr9JB0NTSy/GE13FQEskSiE2plmojiXp8AjHlajqJIR8wev4pctAR9w3nEwJZ84/0jG1u5xaIHhcJfdgQ/ndvR4bz0z8eaCV0TauD9HOTFPyW0iTLairYJ6eI6bSIhLOOAudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv78qL+cfEBn128Wtj22qFW3l23JAt7692rmkJtVUGU=;
 b=ALr7UdOcqzldzgZzH8IuHeDw5b/8zHucgKY2PDbwliAPPjgQfLXia4UhgxP4xxZXSDNNth4N4tojDX1VeCIlJhl3l0qLm5XmAY9mbXGxTCDw3hR3vVx8Ssz8vty8zLybbRl4693bv2X6FbdOvqXhN9HUQBa2WoEcCSGZpMy+Y+Vy3U5Iu4qjbjJDmiC5Ipm1SWFU1HYVKs4MHnTUlKU1qruttDHzIeY4tit6WqCrcDfvMRFtAz70pf22Ghpu41OLDNutX/VdPgwOb01ZFtWvREm4ZycrAHL+VjHFJgM8oDHrbbO1eM5T4I3X0z3792azTRlDebCOuzpsJo5c+ONSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 00:36:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 00:36:00 +0000
Message-ID: <723f6f51-8fb3-4042-2291-78a8537e96ac@intel.com>
Date: Thu, 6 Jan 2022 16:35:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/i915/guc: Don't error on reset of banned context
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220107003143.326046-1-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220107003143.326046-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:300:69::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35cd2ea3-f98c-4f26-3cf6-08d9d175ad8b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4960:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB496040241239AE0EBD2B8A92BD4D9@SJ0PR11MB4960.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ToBe6ryxhWdgF4XXEVebL5NDAr/xTj62IJkPeRCj+HXhbSOBAXdkAeNXyQgzmH24M1RFCkNSKPyXcBYDgZECCI/r0gYH9dDYL/rtrRxQMA7gAnY7p6LGDgxtykO0jX4OjaiPvWMG7yLKiQm1UYUxAFy9/8uEc62yCcY/4aA9UzHG9ZJ9FzEFiACpI+UnCR+zNdAxbo3/0bdGpsLX0kvspglYI5btCTx47ESuwiW+1vtCEoafuwjKLEtmHeIiE5hQvT+xtZpyJZy414fYUbbY8BnbHfwVhGOtcEaKiUw5WVA+2VvwVOVQz1Or9oZpGG3rGbY8APOm9FkhSBfcTVsryBbPUOl5SSULz+5GTU3G3DjVv6ZSx/VnWnJTaxvatin2Hb4lk4xyHrQjMbFVVAaVlP633t2r5FojSS4zkXnhU2/VRCFV+dSGDvFMUKaUkD6Bo8XrEJShnseR2V4GLP3/XhFRIiTM87E7hIXQbcR17fdkW/TbFDWOwOgLkQ44ODp3M+gA7MltE7xJVEo+BfEwGb0p2lwFWpGNwSUZlKFLC1cv5k4T3/QOxY+bPghE4K/RBpLD/057sk9wZ8TJ9Mz0oXOG+81ZygSiPoq3gJa8U2Kb7X7VGmJNRq/Zeq6/JYfMibbBZ5F9rvFHZy9ggoYZLDbEgDRIssMg8hBJKTp7gwwgWUJ3gt66WPIsAhe2QxqZhdjJlf0LBvCj7l32o0EMHWdwqUnsfe6EnxtfpAMU59CNXPl6FeoekTiBNc0cdoYq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(36756003)(31686004)(8676002)(6486002)(2906002)(82960400001)(6916009)(450100002)(508600001)(6666004)(83380400001)(26005)(2616005)(53546011)(6506007)(316002)(38100700002)(8936002)(6512007)(186003)(4326008)(66556008)(5660300002)(86362001)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlSR2tEUWkvOWJRRFVWVGFtUzRTdFRJbUkxc2IwOFhaNy93SXRzVUdwOWNU?=
 =?utf-8?B?MEdGcnRndG1SbnJtZkVkUjNzQlFxT0o4Q3QvRm82ZU9SaXhCZ0h4K21vLzV5?=
 =?utf-8?B?VGJjUnJ5UjkvSkhab0VoRHg5Y1pyMGZ3Ny9ZQld3TGRyWGo2UzNVUFp6QjVx?=
 =?utf-8?B?UjZuTy9tWmpEcWhlQWJFaXcrRXQzU0RmVE01Q080Snh3SHlTQnVpcmVwaXdF?=
 =?utf-8?B?NjJHMUt0VUpnTjdnWjZwdTNmNjZ1RWk5THRTWTFXR1Q3RG1aY0kzaUhnNTd5?=
 =?utf-8?B?cVVFK2wyVkdtQ0xEQm9KcXR4Smx1Wm50djM0MmFjczY3ZVEvTVlxYUVsZWp0?=
 =?utf-8?B?L0FsU3JwS3lqVm1zc0x5UlplN3dxL1pzaDlQU0gxZXdvUUM1ak5UOXYvWTdS?=
 =?utf-8?B?K1YrOEJOY1Z2S3l2bkhSVnhodXdZSmJNbE91UCtYU3hXUWxnNXE2QXNxYTJP?=
 =?utf-8?B?Q21ZSE9QMlhJcUlCR2NNK0xxcE9MYWZkNndKK0tweis3cGJidzE3UHErenMx?=
 =?utf-8?B?YWNxeDZwMGovTnFYN2Z6OFI4SVA2RDZoK0ZGSVBZa2tqMVNOUmpyd05oV3Nx?=
 =?utf-8?B?VXRTVTk2UDgrMUc5bkw5VDVzYzdHdWlRUmQxemRTQkNaTXI4Yzc3bkNjR1l6?=
 =?utf-8?B?QU1TVVRQSGJtVzVTYXd5LzlBbzhyQ3htZzgrais1Q09sbDZoTEVYV3ZiNmY3?=
 =?utf-8?B?dkVpTEZ0eTZPblpXblZGZEo4NVA1Vk91aVN6aWpMSzlzQXlsZGplblhzWk94?=
 =?utf-8?B?Uk1oaVpnYk1CT2N1ZmxKWG5wVGkyWEZkSldPM1NMckdoRXBoaGVZb1dJZmFJ?=
 =?utf-8?B?QVZ1cVZkWTRMeVJNODdGcWt3THJhNFhwZUZmNmluL1lZQjZxTXd0enJ0NzR4?=
 =?utf-8?B?QnJrREg2K2p3TGRXM3BnYktyRXdjVjM4SVNLQitSYkhFWmNjMC9wQmlkMnQ1?=
 =?utf-8?B?NmhWRHg5UWtPeXFBSng5WWdIQys0ZEdob01nQVZ0MXd3MFRJS3ZJc3k1Tys1?=
 =?utf-8?B?Vmd4dWNMTGhrOWJBd2JLajNDbElRNTM3Z2VsWFRCWWNpaGVDeU11MHhQU25W?=
 =?utf-8?B?REtnWlB5dkdmdllWWktnZHp6ZERsRFBRZS9LKzlrYVplSTVUOWtXemlHNCtw?=
 =?utf-8?B?ZFdMQlI3K2M1elZSSklINTUrTmtndDdVbHNkdnZ4Tk1kVDFoTDI1c29sTmVR?=
 =?utf-8?B?ZExuS3Z0REp5alJIUEZXWEpVTUE0K0o5bWlDUzJHQVNDWW95MkVuTHNpVldH?=
 =?utf-8?B?R2RXT2tMMHlGbUVlejJ1aGFuZ1V4YzVQbkl6eExwc1pWQS95QUFXTXhiQWNn?=
 =?utf-8?B?L0w4NUFWODNNNXM1dS9ETklFbXdxaFJ1TkZOZFpiL0VvZ3VhVnZLaW9yemYw?=
 =?utf-8?B?TXB4dWFPTkpkTCthWllOS2p0VzFOb2tIMisyVFhVZS81MXFHdEdjb1VSamkz?=
 =?utf-8?B?cW5CUmpDOUQwYTU3bVBOSlhKeGlBa2FjYUZwV2hIQmJJSi9wUmM3b2FvRVk0?=
 =?utf-8?B?RmJIdTJQL0Y5ZzRwRWN2MTIxRGlWT1EwbXBCTWZDME16L1dEMFFqb0UvM08x?=
 =?utf-8?B?emZTVGVrbXJPR2crMlc3RVZSQmsrUDc1OFNTTjBUOE52aFFIVUhHcWVvbUdY?=
 =?utf-8?B?RHVoam5QMTV6WC85d3EwemtZVG90ZXhhUkFHUFh4UEl5MW1BbGVVSkJiVkx1?=
 =?utf-8?B?N1MyWkl0OXFld1lDZDhmeHdQd2trV2lHL1NndkRpVFJrVTRWWk9MY0o4NFpo?=
 =?utf-8?B?YzF2OW5uR2tHM3JoQ2hKM1FsdUM3ME9mUWNocHB3cHIrZ0RrSE9Yd2cwbU96?=
 =?utf-8?B?Y3doTHY1NUFmc3k3RzZacW5waHJFS2xPUzFSNG1sUWFwR0RWZGxHUUk3ejBR?=
 =?utf-8?B?WERuWEM0RUd0VmhIQTU0QVZKSGdYc1VwKzBFd3lXa01VODFHMzBOUGhBRVQy?=
 =?utf-8?B?RFFFeEZBTGw5SlZ6amRXOTZ1T2tHdVg0dk0rYWVLdFdUQ1JUemY5aXk5UzRF?=
 =?utf-8?B?YmRQL25UVmszNWpOSGhvMkl5TGE1cFBwNnN6ZmxmT2U4Z1JqTnhOQk5FM0ZJ?=
 =?utf-8?B?Mjgvdy9WUGVvVXZqSjFsTk9nK0NsdkhDMXNhUnJ0b1VaNi9oTndkeFgrM0Nt?=
 =?utf-8?B?bzZJUkVGZHp1a3ZhQ0k4ZGtMUUdWd3lSdG9Xd3BEY000bXkxWmZ3Z0I5UGpK?=
 =?utf-8?B?dFhrMXhFc0piMm9zd3VvR1dTTlVuWXErMmFLTTJTTkkrcDF2WmJSc0dnMWd0?=
 =?utf-8?Q?95BxyeHS7cCBFDNZZocP67NQcIxsRm+xmwcAqxlf7U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cd2ea3-f98c-4f26-3cf6-08d9d175ad8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 00:36:00.4941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqpJ7qVXKDuHWYoCwo0+OM/nrEDioQyKhlMVs+shr+WN+cA88qYgIG/nWUJbjWi2lvKnjLh9yUKDX0UpcRUD6cZsgVPwRn0rPau4vrqhnLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On 1/6/2022 16:31, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There is a race (already documented in the code) whereby a context can
> be (re-)queued for submission at the same time as it is being banned
> due to a hang and reset. That leads to a hang/reset report from GuC
> for a context which i915 thinks is already banned.
>
> While the race is indented to be fixed in a future GuC update, there
> is no actual harm beyond the wasted execution time of that new hang
> detection period. The context has already been banned for bad
> behaviour so a fresh hang is hardly surprising and certainly isn't
> going to be losing any work that wouldn't already have been lost if
> there was no race.
>
> So don't treat this situation as an error. The error message is seen
> by the CI system as something fatal and causes test failures. Instead,
> just print an informational so the user at least knows a context reset
> occurred (given that the error capture is being skipped).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
PS: Meant to add:

Fixes: 249af7242af72 ("drm/i915/guc: Report error on invalid reset 
notification")

