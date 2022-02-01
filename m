Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2054A681F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 23:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41B10E223;
	Tue,  1 Feb 2022 22:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7AD10E223;
 Tue,  1 Feb 2022 22:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643755347; x=1675291347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MEkaHAn6tBfNBb5pmN8D9jtI+Q7bGdog/mut0OkTfLA=;
 b=lAyUfQvuXjjC6VVAfn5x4BzISCpcY3mEJVgpMpym4yZfU83Wq58hhOS4
 2eDqxuIpocvxzQ46KL1PCABoB2VbRGUuQBoCrL8wucIAbMqTSMvCMesjL
 eYLMXsTZNkvkAvND1eV6ggYqvZDFNzFFqTbkkUz0wVr45wh4IPF48m9D6
 S8680j5c9qDa1uQpfXTEjdQqfZCKvfrwA5E0REG1/5MrZu7eyBJGevNcq
 vOULOhXYnhkoW32xt4V+3f1hyWULhStxNuoKcqCQ9l/EVMzsARV3ZWQkL
 iNGLmdG0fsrxCL4uIjvO3ojhrLsCkaxxk7QP5BrGRoXIP+cDyJShjPFIz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="231380764"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="231380764"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 14:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="771269341"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2022 14:42:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 14:42:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 14:42:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 1 Feb 2022 14:42:25 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Feb 2022 14:42:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9fKtVYf+1A3E/l16KU0CQbBKe1C53XLhJh+nm4u2KkW4zAFiaCLAywaZjeu1dQB1/aIA81vvnMRs+7jDIuEI0auA5V+H11F0Kvn6+3Vw/0+pGmb27nxOXviBmB8ofdgwBjGKA816JDix6LsomfArCd/vDhTVvpXJk5A75o/AfSGZilOVEm48aJt478c5OtQjErkb74VXt7kkOYPxAMEe9nwLpkl3fo+4AZrrQcW16F1wFch7sWQTYjz4P6ZK8eyON4WCzRBSVp31CibgwK3PcaCfjKgSwQu5eibb0OhTnNuIDpaw6mY8B+8AoQKBFNuEBYp6c8giMEp5CsdJ9uS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3nvhwHcsItsdIcXdBhvkHoTd3LY7fa6d1+JiNUDqVU=;
 b=Woeb2LP4CDwrkjEE8xW1bwGNygoZOHNscqH40ckKoHFFuSsK5TVh3maRd7GchlofekUhiCIKpxDaqquFdUiSVaKs7LadQ8osoIYd4wY6Pxq7MvLEcVN0xIpiCQSX7PUkcq+mIDRXI0BGVKXPSBdJGtAg/Z6s92uOdT0cQnYNG5/dhsWHyLN6RECBuqpeze19zWCL4muZ4adMoS7vLW9NHc7/S0S46euZ36WoPLieE+BR4FRgPwdK7qEcvMR1qeFB6lYxa/rt/J7AYlCDNrnraCQqYEQQQvoim70b1WOekr2mSM5ZM2v13Jje1RgVdqc4zaARKJS1SiuQZsr7HYsXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Tue, 1 Feb 2022 22:42:23 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501%7]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 22:42:23 +0000
Message-ID: <6a5c4a0f-2e71-7dd4-7f15-4e076cbdbe62@intel.com>
Date: Tue, 1 Feb 2022 14:42:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 16/19] drm/i915/guc: Use a single pass to calculate regset
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-17-lucas.demarchi@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220126203702.1784589-17-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d081adb-de46-47dd-083f-08d9e5d41cd2
X-MS-TrafficTypeDiagnostic: PH0PR11MB5642:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB564250510BD9C4B97192A831F4269@PH0PR11MB5642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIsQuCqDZ9Tponld9wr9aZW9MiM7gCD/BfC7Zqbf3TpvZZRtNuwXc7blV5RZtaij66pPlPXYJLVl2vchNSqfkrwcMR+e+ENHXddl0buDtgYVyyzxyjBnB77SQr1nR0JJXn4EWWw6R0HJ9HokSOnggOmZ+/4EQQaEXLb37LueSeMabfM+rTJJNYVkNcyOtbog/aGp38jajxr0S/hyW001jPxP/vXnYV/6Nq65wuzG6WvwLmQxz9KlRe+qO8wFELBEUWDqFDPuAOfo7UUzy5OXgPRwhAZXUNPjp6tMDSoTrB1eWYLQt7+Hk8BelRIGUR+ps4cKiAYBh6NJHr0SPniUgKkPeBh9gKAYZH2yysbghO9RthJzEAL1Mbf44/lNuYXEu4mhLGx4Eekfuo6btnk3ZdBeFe9k2a+TIsgiJVszXodkfrAC4AEdmIAOvqyg+e1ASXr5ldpV1EWW0JPQC0ApWktIJXzZvcjo4junMohV0rN4FlRH4WpTJbRwXsDdXs3fVq0WXm/X9z089K5Wiow151La8hwA3Xhg9qJWCevbQXCx7oDn0XIo1wnMhBIZsgceGHMXt4iM6PzCYYDLijhYxSW5+t6GAQM84DU1SXk3aoJ/U720zmjqJ4ddwvYm+bfhGiPkOqZVPfIEfOK5H+b67T1z/cEO3wZhVe14j5Zf6twKNQsm1MlBzJpsAxgv0Jq3fHQ2EwkQpsV0UWeis0P5LxIlYoCwSC+jyotT+ztslP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(66574015)(6486002)(508600001)(38100700002)(26005)(186003)(66946007)(2616005)(83380400001)(4326008)(5660300002)(66476007)(36756003)(8676002)(54906003)(86362001)(53546011)(31696002)(6506007)(316002)(30864003)(31686004)(6512007)(8936002)(66556008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFnOS9PNWlEaTRVNTRMUDNkejZGVHRhelBmSFozeXlFVUVhMS9ORGxZMXNo?=
 =?utf-8?B?dFV5ZjZrR0JrMW5jUVNmSEMwT3BSbnUyQjVwRDdqaWtPODVUMGExd3ExY2Jx?=
 =?utf-8?B?cjNXMWc4SzJlVVYvaU5JZkc5Y3QveTdSQTYzai9EcVQ1OStNRVVMcjlieDBB?=
 =?utf-8?B?MHNXWXUweTlRQWxPOEhKaXUxdnNRc0t4bnR1QlhKOUxyQWN5dGNjR3AycDFm?=
 =?utf-8?B?cmxLRStsTVdUNHBJd2NCek5HaUI1VmVHOGxQVE5Wd3lNdlVBNjhWY3dsZHVL?=
 =?utf-8?B?NHQzbXBVbUNIMGJRRnA0RktYZitQeUMrTnVjVERBV2M1cjRqU04ybmMxSXlU?=
 =?utf-8?B?M1p1ZGQ1UUh3Y1lDZDlTOTcrTzVPbWpFZTZQL1B4VDRPT3dQTXRma2ZqNVBJ?=
 =?utf-8?B?UHE1UFlYdVB0WjN0RWRLZnE0Mm4ydElhZWpUOXBuaGVlMlZTZ3lhRUR4Vy9C?=
 =?utf-8?B?SXM2bDJKa2lRei9jR0JoRkREbjY3NWVkRitNbGFhWlhSOC9mZ0Z2TGdjbkFB?=
 =?utf-8?B?Syt4YUVHajNWU2p1a0JNRFBXMVpKQlNuNzhlajVqOXdGVkhXMWlzKzVIV2Rq?=
 =?utf-8?B?WlhpT3pHcG9VM0twcXJ1ZHArZEZOUjVJVW9ZTGh2OTJTSzV1eTdVTVZCQ2hE?=
 =?utf-8?B?SWlNZGt4TTQ2MUxOb0dkN3lLVzlEOG9meUc3eVhqT2tUS1VQdGsyR0RrMG8v?=
 =?utf-8?B?aENpQUg1RjR6QktKeG85QXEwRy80LzF4MmdZL3kwQ2F4cDJWektBdytqeWNU?=
 =?utf-8?B?VWlpMGozMS9mL1FwMnBzY2ZrVUNSeEJNVlArb3NtKzVpVUI1QktEbTkrLy9R?=
 =?utf-8?B?Q09kaUhoTk9Fd2gvVWRVUXNHc25xLzh2cE5yNWtaOXg5SExPYWErTFBUc3NM?=
 =?utf-8?B?YlJRQ3pRZ0FkNEZZR3l5TDJOalFNQmlwWUo3NlZUaDZyWVpUMkszTGxRWG5Z?=
 =?utf-8?B?dGVYVVRRZ3J2d2hDWFNLV3IwTE4yMHgzdlkzOTFKUkRjVSs5T21lZEZYVEMv?=
 =?utf-8?B?SUhGQU9KSHpyZU1mNEtlY1d4aWordUhrNWVqZXkvbHp6Y3d0NlFNc1FpUXND?=
 =?utf-8?B?V2pUb2xYKzl2T3MwRFJPbjRlamZYQnFhT3NVZ3dyR2NyTi9OV1lid1FMNkFU?=
 =?utf-8?B?a2NyZmIxMjQvbllRdTU0M3UycGpWVlAxb3RSYnZtT0w0d0VNYUVCS05IRTc3?=
 =?utf-8?B?b2ZuRTRPaVd0cE5Hd1pRV2JLc1ZaamJrS2VpeWhCbVdyd1hDTjBPN1VXS0Rh?=
 =?utf-8?B?ZmpDdThSQ3MxR3QzMkpNbkNMTEROZFAvTHlVajErV2VpTWJURjVVR2FSZnU4?=
 =?utf-8?B?QTVUclRaTTEzVDY4QzFKcDlRYUltcG91STBtYUl1Yk5hNmQ0SlhKaFFrOWdm?=
 =?utf-8?B?VUE4VlZ1TEVYNTF5aXNiSTNncFFQNis3RElVa2RQWHJMbTJ3dVdKQ2RzNUhr?=
 =?utf-8?B?ckdBL3FETFlOVWc4NktCY1lxOTZWNFhnTndxVXhlMTl4OHlVbGpYaXhsSjNQ?=
 =?utf-8?B?Mk9sdjZUWXJ3ckVGL3I3UEFyV0c5YUZRNndPSEFxNWJNeUlBaWtwb1liWmQ0?=
 =?utf-8?B?RW9qb3dUNTdzdjRpU0kxbFBvcFVrM1RiM0R2cG03SWJ3RnZSc0w1Yk90YnZn?=
 =?utf-8?B?Sk9rY2Q4anZ3SVZJN0QwSEQ2ZFdYSWlvc2s0RkpPWFlKckQxc1N5TEhVeTZG?=
 =?utf-8?B?ei9XZnVXakpWTjBOVHk3dDhEVVhWWFBRRWhXZDZlUEhmN2FrSGk4UkhzWlZJ?=
 =?utf-8?B?U0Y5UU42SUIzWGN1bk5SUnMrQUYzWUlzY0Nub3JzMXhwQ3RLSU9qSXFjOWR1?=
 =?utf-8?B?NHZMUEkrNEtLQW9FMC82V25GMzBBWm9sTE8rUkhaZ1JGZFd3TU1hbUc2RW9Y?=
 =?utf-8?B?SjhhN1VwR0Z0d3lNc0NJSU9lMjlFV21TbERPYXVTb0xxa3JSR0tEMzc3ODI4?=
 =?utf-8?B?MlBXS01hNUFlT1RhN1ZpMzUrWDRQcnVXWUNQMU9PTTFObGkvY3poNEltUmt0?=
 =?utf-8?B?UnFjcDVJUGg0c1FnM0VDbkcwaXRycG5HVnhVZlk2Wm5UMXh6R1RQVUx1bjIx?=
 =?utf-8?B?dFVvb29TNG1UU1RMb2F2b3pmOG1mUkZwRVcxdXh6QTQvckprVXJlNG9ndWND?=
 =?utf-8?B?RWhtYzVVUXFnY2x3R0VvczRBV2VUTkJuQTFQNCt2bWQ4MzNMMW5PZTJaRkQ0?=
 =?utf-8?B?N2I5YXkwWXo1UTdkYmxHKzRCdStPbWRjMUw3TGdhQjFaM2dNaXBULzBlTW84?=
 =?utf-8?B?MHZZaUlvTGFmbGJ1UDVPLy8vOFVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d081adb-de46-47dd-083f-08d9e5d41cd2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 22:42:23.1479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9Qqm7qdcBHLzPKWmBL+zYEiiWfjEwebsxniKB+YddIxlqW31D5muhlbQNmuxn46mC3sLBs7pNAjG7xy7q+srHFk/Q/nv5yzO12DdMcSTTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2022 12:36 PM, Lucas De Marchi wrote:
> The ADS initialitazion was using 2 passes to calculate the regset sent
> to GuC to initialize each engine: the first pass to just have the final
> object size and the second to set each register in place in the final
> gem object.
>
> However in order to maintain an ordered set of registers to pass to guc,
> each register needs to be added and moved in the final array. The second
> phase may actually happen in IO memory rather than system memory and
> accessing IO memory by simply dereferencing the pointer doesn't work on
> all architectures. Other places of the ADS initializaition were
> converted to use the dma_buf_map API, but here there may be a lot more
> accesses to IO memory. So, instead of following that same approach,
> convert the regset initialization to calculate the final array in 1
> pass and in the second pass that array is just copied to its final
> location, updating the pointers for each engine written to the ADS blob.
>
> One important thing is that struct temp_regset now have
> different semantics: `registers` continues to track the registers of a
> single engine, however the other fields are updated together, according
> to the newly added `storage`, which tracks the memory allocated for
> all the registers. So rename some of these fields and add a
> __mmio_reg_add(): this function (possibly) allocates memory and operates
> on the storage pointer while guc_mmio_reg_add() continues to manage the
> registers pointer.
>
> On a Tiger Lake system using enable_guc=3, the following log message is
> now seen:
>
> 	[  187.334310] i915 0000:00:02.0: [drm:intel_guc_ads_create [i915]] Used 4 KB for temporary ADS regset
>
> This change has also been tested on an ARM64 host with DG2 and other
> discrete graphics cards.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h     |   7 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 117 +++++++++++++--------
>   2 files changed, 79 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index e2e0df1c3d91..4c852eee3ad8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -152,6 +152,13 @@ struct intel_guc {
>   	struct dma_buf_map ads_map;
>   	/** @ads_regset_size: size of the save/restore regsets in the ADS */
>   	u32 ads_regset_size;
> +	/**
> +	 * @ads_regset_count: number of save/restore registers in the ADS for
> +	 * each engine
> +	 */
> +	u32 ads_regset_count[I915_NUM_ENGINES];
> +	/** @ads_regset: save/restore regsets in the ADS */
> +	struct guc_mmio_reg *ads_regset;
>   	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>   	u32 ads_golden_ctxt_size;
>   	/** @ads_engine_usage_size: size of engine usage in the ADS */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 73ca34de44f7..390101ee3661 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -226,14 +226,13 @@ static void guc_mapping_table_init(struct intel_gt *gt,
>   
>   /*
>    * The save/restore register list must be pre-calculated to a temporary
> - * buffer of driver defined size before it can be generated in place
> - * inside the ADS.
> + * buffer before it can be copied inside the ADS.
>    */
> -#define MAX_MMIO_REGS	128	/* Arbitrary size, increase as needed */
>   struct temp_regset {
>   	struct guc_mmio_reg *registers;
> -	u32 used;
> -	u32 size;
> +	struct guc_mmio_reg *storage;

I think this could use a comment to distinguish between registers and 
storage. Something like.:

/* ptr to the base of the allocated storage for all engines */
struct guc_mmio_reg *storage;

/* ptr to the section of the storage for the engine currently being 
worked on */
struct guc_mmio_reg *registers;


> +	u32 storage_used;
> +	u32 storage_max;
>   };
>   
>   static int guc_mmio_reg_cmp(const void *a, const void *b)
> @@ -244,18 +243,44 @@ static int guc_mmio_reg_cmp(const void *a, const void *b)
>   	return (int)ra->offset - (int)rb->offset;
>   }
>   
> +static struct guc_mmio_reg * __must_check
> +__mmio_reg_add(struct temp_regset *regset, struct guc_mmio_reg *reg)
> +{
> +	u32 pos = regset->storage_used;
> +	struct guc_mmio_reg *slot;
> +
> +	if (pos >= regset->storage_max) {
> +		size_t size = ALIGN((pos + 1) * sizeof(*slot), PAGE_SIZE);
> +		struct guc_mmio_reg *r = krealloc(regset->storage,
> +						  size, GFP_KERNEL);
> +		if (!r) {
> +			WARN_ONCE(1, "Incomplete regset list: can't add register (%d)\n",
> +				  -ENOMEM);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
> +		regset->registers = r + (regset->registers - regset->storage);
> +		regset->storage = r;
> +		regset->storage_max = size / sizeof(*slot);
> +	}
> +
> +	slot = &regset->storage[pos];
> +	regset->storage_used++;
> +	*slot = *reg;
> +
> +	return slot;
> +}
> +
>   static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
>   					  u32 offset, u32 flags)
>   {
> -	u32 count = regset->used;
> +	u32 count = regset->storage_used - (regset->registers - regset->storage);
>   	struct guc_mmio_reg reg = {
>   		.offset = offset,
>   		.flags = flags,
>   	};
>   	struct guc_mmio_reg *slot;
>   
> -	GEM_BUG_ON(count >= regset->size);
> -
>   	/*
>   	 * The mmio list is built using separate lists within the driver.
>   	 * It's possible that at some point we may attempt to add the same
> @@ -266,9 +291,9 @@ static long __must_check guc_mmio_reg_add(struct temp_regset *regset,
>   		    sizeof(reg), guc_mmio_reg_cmp))
>   		return 0;
>   
> -	slot = &regset->registers[count];
> -	regset->used++;
> -	*slot = reg;
> +	slot = __mmio_reg_add(regset, &reg);
> +	if (IS_ERR(slot))
> +		return PTR_ERR(slot);
>   
>   	while (slot-- > regset->registers) {
>   		GEM_BUG_ON(slot[0].offset == slot[1].offset);
> @@ -295,7 +320,11 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>   	unsigned int i;
>   	int ret = 0;
>   
> -	regset->used = 0;
> +	/*
> +	 * Each engine's registers point to a new start relative to
> +	 * storage
> +	 */
> +	regset->registers = regset->storage + regset->storage_used;
>   
>   	ret |= GUC_MMIO_REG_ADD(regset, RING_MODE_GEN7(base), true);
>   	ret |= GUC_MMIO_REG_ADD(regset, RING_HWS_PGA(base), false);
> @@ -317,32 +346,28 @@ static int guc_mmio_regset_init(struct temp_regset *regset,
>   	return ret ? -1 : 0;
>   }
>   
> -static int guc_mmio_reg_state_query(struct intel_guc *guc)
> +static long guc_mmio_reg_state_create(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_engine_cs *engine;
>   	enum intel_engine_id id;
> -	struct temp_regset temp_set;
> -	u32 total;
> +	struct temp_regset temp_set = {};
> +	long total = 0;
>   
> -	/*
> -	 * Need to actually build the list in order to filter out
> -	 * duplicates and other such data dependent constructions.
> -	 */
> -	temp_set.size = MAX_MMIO_REGS;
> -	temp_set.registers = kmalloc_array(temp_set.size,
> -					   sizeof(*temp_set.registers),
> -					   GFP_KERNEL);
> -	if (!temp_set.registers)
> -		return -ENOMEM;
> -
> -	total = 0;
>   	for_each_engine(engine, gt, id) {
> -		guc_mmio_regset_init(&temp_set, engine);
> -		total += temp_set.used;
> +		u32 used = temp_set.storage_used;
> +
> +		if (guc_mmio_regset_init(&temp_set, engine) < 0)
> +			return -1;

If you fail here you're leaking temp_set.storage.
Also, any reason not to just return the return code from 
guc_mmio_regset_init?

Apart from these minor comments, the change LGTM. IMO we could also 
merge this patch on its own ahead of the rest of the dma_buf code, 
because not having to recreate the regset on every reset/resume is still 
helpful.

Daniele

> +
> +		guc->ads_regset_count[id] = temp_set.storage_used - used;
> +		total += guc->ads_regset_count[id];
>   	}
>   
> -	kfree(temp_set.registers);
> +	guc->ads_regset = temp_set.storage;
> +
> +	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %lu KB for temporary ADS regset\n",
> +		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
>   
>   	return total * sizeof(struct guc_mmio_reg);
>   }
> @@ -352,40 +377,38 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc,
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	struct intel_engine_cs *engine;
> +	struct guc_mmio_reg *ads_registers;
>   	enum intel_engine_id id;
> -	struct temp_regset temp_set;
> -	struct guc_mmio_reg_set *ads_reg_set;
>   	u32 addr_ggtt, offset;
> -	u8 guc_class;
>   
>   	offset = guc_ads_regset_offset(guc);
>   	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
> -	temp_set.registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
> -	temp_set.size = guc->ads_regset_size / sizeof(temp_set.registers[0]);
> +	ads_registers = (struct guc_mmio_reg *)(((u8 *)blob) + offset);
> +
> +	memcpy(ads_registers, guc->ads_regset, guc->ads_regset_size);
>   
>   	for_each_engine(engine, gt, id) {
> +		u32 count = guc->ads_regset_count[id];
> +		struct guc_mmio_reg_set *ads_reg_set;
> +		u8 guc_class;
> +
>   		/* Class index is checked in class converter */
>   		GEM_BUG_ON(engine->instance >= GUC_MAX_INSTANCES_PER_CLASS);
>   
>   		guc_class = engine_class_to_guc_class(engine->class);
>   		ads_reg_set = &blob->ads.reg_state_list[guc_class][engine->instance];
>   
> -		guc_mmio_regset_init(&temp_set, engine);
> -		if (!temp_set.used) {
> +		if (!count) {
>   			ads_reg_set->address = 0;
>   			ads_reg_set->count = 0;
>   			continue;
>   		}
>   
>   		ads_reg_set->address = addr_ggtt;
> -		ads_reg_set->count = temp_set.used;
> +		ads_reg_set->count = count;
>   
> -		temp_set.size -= temp_set.used;
> -		temp_set.registers += temp_set.used;
> -		addr_ggtt += temp_set.used * sizeof(struct guc_mmio_reg);
> +		addr_ggtt += count * sizeof(struct guc_mmio_reg);
>   	}
> -
> -	GEM_BUG_ON(temp_set.size);
>   }
>   
>   static void fill_engine_enable_masks(struct intel_gt *gt,
> @@ -634,8 +657,11 @@ int intel_guc_ads_create(struct intel_guc *guc)
>   
>   	GEM_BUG_ON(guc->ads_vma);
>   
> -	/* Need to calculate the reg state size dynamically: */
> -	ret = guc_mmio_reg_state_query(guc);
> +	/*
> +	 * Create reg state size dynamically on system memory to be copied to
> +	 * the final ads blob on gt init/reset
> +	 */
> +	ret = guc_mmio_reg_state_create(guc);
>   	if (ret < 0)
>   		return ret;
>   	guc->ads_regset_size = ret;
> @@ -681,6 +707,7 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
>   	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
>   	guc->ads_blob = NULL;
>   	dma_buf_map_clear(&guc->ads_map);
> +	kfree(guc->ads_regset);
>   }
>   
>   static void guc_ads_private_data_reset(struct intel_guc *guc)

