Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182ED73478C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 20:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD97110E0DF;
	Sun, 18 Jun 2023 18:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098C10E0DF;
 Sun, 18 Jun 2023 18:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687111880; x=1718647880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xqV/iUbRiFrycllg8J07B/DjmjrRyp2L9bWjdCAWp7Y=;
 b=IA+vGrhBYuXfwQKud22Zipe9I3BnhTQVfn+4Wsla4Kr49XOcc9bNwCvb
 x72QKzGu8k3UYx90XawD+RXTWE+Xg/jnXwxCoPb+MWolsykh2bgqzuD4a
 mm+EaHDRF9RYSEsJr6rBtisxLjE5EQbP8OLMGW5xDslT9QuTiL7CKOMe8
 ADk18m2akVAdULlvXerLT1x8jd2nnwaRzzaMvkusNH4cWsrSjOSIFFq75
 lv0k2d0pacGqQsfKHgP1+C3hmVrtz2T6eFmweBahr8UBJwaZ7ZC7vhsR0
 76OVrdqfIOGl52VHWxIBIg7UWz7b7+k7IR9ai8lS2tHjBxBXoN69m+WgY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339834199"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="339834199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 11:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="837640827"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="837640827"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 18 Jun 2023 11:11:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 11:11:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 11:11:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 18 Jun 2023 11:11:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 18 Jun 2023 11:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF2+vfhImdz03VfuAUr08JFB5eRadP5inldapbRp8jjvy4eUdSC1lQODB9YzXL5D73PBAMpVEpvd/Shspc532CEta8puwR0aENGfIR114VJahCu+Y1WPH5ZMyeggiSUGUcxiXBGcgikNJ9KYGguRlGxPEvEfQcMgyscqH+2aNsLRCB0rx6fO3oCiYQqIXPcn3U4cCUKaNIyBKW7Fn3I/Zd8fRh3IxiRxim2rhLz3add/AvuXKTW7ocld8R38frw5l8aV12Z/S1m5Qa9W0aQH/0pPUaG2v8bl2C4gQLeB91bDAHbOpYX1LKk3UX0hm/zMZ0+zbxfQkmF9ebz2aZpRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVVSXzlLtQdGMUAdH4wZXZ/pdgYiGaS1oeTRmCjz4Ww=;
 b=NwHXREZW84C2RAZqInh3lt6aTnRPwE3g7eEUA/jIJR3Lg2tMbOwYRTMsqXC2GUB9n32quN/YG/kv0ydWFX9sLBjTJFxP3g1MCFiGvMiTdAZO+P9wd928GRRgNPCIKDo0hrjjDptMyMnE098DNzaOEcXSByD7ArQLzO72gbKLGsIHGOC2DMLLskXL81DGuveLyHkXn5nh1Nfq8dpxFMulMthX2XHkgsOAIi6E/8Wss8cApAUOtjKELk/y/E5t2MlCho3OB8OVxP7vSNilgnV53NLBlOdW06WOqQy6EczZws4xODWbqSUQaukk80T7NLT5VZK6dFJXlVklnqaTjWcFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Sun, 18 Jun
 2023 18:11:16 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::7237:cab8:f7f:52a5]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::7237:cab8:f7f:52a5%7]) with mapi id 15.20.6500.031; Sun, 18 Jun 2023
 18:11:15 +0000
Date: Sun, 18 Jun 2023 11:11:08 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <648f48bc3d3c2_1de3f9294a3@iweiny-mobl.notmuch>
References: <20230617180420.GA410966@sumitra.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230617180420.GA410966@sumitra.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b1cb24-f28e-4bbd-6f51-08db702767ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjRWiYd+1HnEfQd3lZWdQhZG9UxceONL8+adwN5aeZ3Nh3B2swAFAjWc9Yw4HVI51Dij5F3iSnv+qzznTvqm+ccJTw5JclM1S+U4ahJJe8lZXxWEb16+6dAbySUK3hpxPE31wpfAHW2LRCqVTx2WXJJeNBquhbmhRM4vBZBWRZGIh9U4e3GSVkoIYOK+hwMZ9/fMk7rx5th+jVo6sXF7fYqmVnsa7poAL/q6XH0v+Ig9xaSh+iQ6RNkjQZq5WFPpDzI6PtGdGP4ze/2QzGpoq/8zSdQR55wA+o4l5YbthSf5j779B0aizTzruUgnP+mmmPFCbJ9K+d6WcFYrn75xpod6ua3ggQtkT3lp0PDkw2H4lwrS0Wh74tbxMUFg5sAEXuPV3bHTfstGngRaee8qEa39SLmoAJinC5yvZTgQwFwHiLoD4jNDMF6MrTd+wB8m7uoxTHeA+DWWltWCVIAxKEEK1OcUZ8jYuufMNRvllQAfPS0qkdTXJP9/AQFWZGYqxu2rSyM0riWMFxULQu4sResim2t73h5SFIKXKsyNn9UeAY53Xb1YGN/UapnL1b7TH42moTQv8hvFrwrEnB5o0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(66556008)(9686003)(8936002)(6486002)(8676002)(26005)(41300700001)(6512007)(82960400001)(478600001)(921005)(66946007)(38100700002)(86362001)(66476007)(4326008)(316002)(110136005)(54906003)(6666004)(44832011)(5660300002)(186003)(7416002)(966005)(83380400001)(6506007)(66899021)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTQ4WkMxUnlEOUFpb29jeHlrVDh0WExFZkRSLzA5aytOVHAvdHQzWXZuTUR0?=
 =?utf-8?B?MFNVNXpKQ1dhcGxsT05WcWY2eURES2hqL2EvZTJqbjUwMjY3bjBpWGJoQ2l6?=
 =?utf-8?B?SU04OE9YSWhjUkNmU0pVNGtjWjZxNXFudzJzRFpidENUZjAvamk1SC8rQmNp?=
 =?utf-8?B?OGxuYzMvVVFuZUl1QmpUR0dIWlh3MkZONEdwWEVQOXE0WEV3VS9SSERjUnA4?=
 =?utf-8?B?L3REL095RGU2OVJtNHEvSGtVSE5QWTdSSjJiQy9yU3pvaXlvNlBtcERGWld2?=
 =?utf-8?B?UkpOM2RkQkFlN2p2WjZjRFZwWEE0aTRYeXNIOHBSU0JqK2lQVXFrOXF6Y2NN?=
 =?utf-8?B?anVudTFhdm1hWU9UbHJpL0VaYjUzNVNpQ1VWUkJ0TGd6TW94d3ltWk93eVFn?=
 =?utf-8?B?dVRFUWpNblNqNVl5M2NhTUJCZkRsS0RMcm5CRmliTWVYTC9TeWdvSSswREhK?=
 =?utf-8?B?ZmJCbFg1SnBrN0x3clBRcUNxWVVKcXV1elRGa3RURzdpdFgzM0FKZ2FMQzJW?=
 =?utf-8?B?RDd0UDh4ajNsYjh4WHhVeGNyMmRET3UxTDZyemNjbWdVSHFIRTdVd2Joa256?=
 =?utf-8?B?M0hsMVFMYnZFYlg1WFF1NHJhenZmbkdlR0M5djZNcVlBOTg4TEJIWDFqNVNE?=
 =?utf-8?B?UlhPS0Z1Tkhrd3diQUNuNUt6L3FGQUd1OGg1QlQ3ZmsvM1FrbEpWZEF5Skhw?=
 =?utf-8?B?bHNmSldhbkw0LzUwd1F3NkpQWUt4U3c0U2c3S0tOWVJ6OGxhblpVL3BoRkZj?=
 =?utf-8?B?aEtMaHdQMUZCZm5BZUJHNSt3SFlVM20veGRrN3M4dDRDZ3c2SlVPdFZQQkdQ?=
 =?utf-8?B?UFFZZGdCeFI5MXlFSW05d24rbG1ZSkdjd1FFTm83ZVAvNTJtYjBwaXBMVUxH?=
 =?utf-8?B?MisraHJId0psS01sUStTUTMxNmRLYmZ0WjJ0OVpXaWFLSFpDellhUVRwaHh4?=
 =?utf-8?B?ZksvYXk1R0VnM1o0c0o2RXFscDRhTUpXSEl0WUhNQm9peUI1KzJncDZyV2tL?=
 =?utf-8?B?OUNFOUpBZjdQbDQ4SldXWWVnNDNrSEY0NDRQRHlVc1BZRzFxSzhjOVlSNTdy?=
 =?utf-8?B?VzNvbU9sTkwxL1lzVUlhZTJxWjVEMDhwWUp0TlczYUxQRkNUdjVxSE9ZaWho?=
 =?utf-8?B?aGFSOWRrVkduMmxrcEh1K1E0Zlh0Mk9SQ2d5aWJvbXYydkc2SWt0bTViL2hR?=
 =?utf-8?B?Vy9XTEJHMXFrQ2l3U3JoQ2drZHZQQy9hT1BVU0ZDY083SzlOLzd2dTRqeWxO?=
 =?utf-8?B?TUdzV2JyaVFGWjhOMXZBVng4VEVXYkt6SWYwRVhrOWtKdStsb2h1dmFteWl4?=
 =?utf-8?B?OHRQbFhYTGZ0QmJON3Vocy8yWm90WmxyNjFKS2l3VWJMV05EajREeHJXdmlj?=
 =?utf-8?B?dWFFOHpzSUJWZHpzWndLc0NLMmo3WUtzTmJweGZmNS9odlVaekNCMDFnTmx2?=
 =?utf-8?B?S2hxWEpOUmFoRUlqQURWTGVidlBYMXNSNWRpYlJlKzBPdWorL1RDL0dPQkhx?=
 =?utf-8?B?bTJnU1hiUVh3Qi9xbE1tekYwc2Vmc1RiTE9HdGNLVFBmOEg5ZGtTWW04bkcv?=
 =?utf-8?B?b0lDdnJJeUErR2srbUJqWWNWeFd4TzFRVkU2WWRoYXdRNVRiVXpWdmhqSVpM?=
 =?utf-8?B?aGZ2QzRzTSsvSDdIVEVrbURzYWlxQ2ZoQ2JHeFNkenVuWUUwUFlCN205Z0d3?=
 =?utf-8?B?Y2FhbjVnYlR3V0JmNE9FbDMrNFNXQTVJc3REcTZHR1ZaYnJacTZBNFBVSzZW?=
 =?utf-8?B?amJuZDlnN0JQNXpQQ014TWluZmZNWTBDOHpCU2N1eElTTWtad2thTjBWWWpw?=
 =?utf-8?B?eE9iSjFuLzJJd0JwR0ZqNHQ1SHlrNUVGVlIxQTVaMkpBamhxZzFQQkZCQlBY?=
 =?utf-8?B?MUYrSGRZZUV6eXN6cUEyL2JHREZGQldJOXdtU0tnQnZOS0V1YUV3Sm0wOEV0?=
 =?utf-8?B?STRMalFKZmNqMEFCTlV0Nm81QWZ2aW5Ga0kvWXN0RVMxRmtONHF1eEpWKy9q?=
 =?utf-8?B?ay9TMTRLVlU0MWkybVJDMXJZUlJyU0dacE9LK2RoR3NNT1lMQkR1OWlCcy9G?=
 =?utf-8?B?MlRDR1ozckNKVGZMSk9Sd3ZXenhPaWhteHVVSmEwMW1KajNzNU5MS0xtTmhq?=
 =?utf-8?Q?NZ+AuDGB8q9qjdUErnG6rr0xZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b1cb24-f28e-4bbd-6f51-08db702767ab
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 18:11:15.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtj5Dzb99TbtFiVzRlZrcKZICE0fc2xRKQldOhcZq4LkUcevWBgnFCEAPD/2Sx/4Jg0XABBHR+9SldOIfn7b1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sumitra Sharma wrote:
> kmap() has been deprecated in favor of the kmap_local_page()
> due to high cost, restricted mapping space, the overhead of a
> global lock for synchronization, and making the process sleep
> in the absence of free slots.
> 
> kmap_local_page() is faster than kmap() and offers thread-local
> and CPU-local mappings, take pagefaults in a local kmap region
> and preserves preemption by saving the mappings of outgoing tasks
> and restoring those of the incoming one during a context switch.
> 
> The mapping is kept thread local in the function
> “i915_vma_coredump_create” in i915_gpu_error.c
> 
> Therefore, replace kmap() with kmap_local_page().
> 
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> 

NIT: No need for the line break between Suggested-by and your signed off line.

> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
> 
> Changes in v2:
> 	- Replace kmap() with kmap_local_page().

Generally it is customary to attribute a change like this to those who
suggested it in a V1 review.

For example:

 	- Tvrtko/Thomas: Use kmap_local_page() instead of page_address()

Also I don't see Thomas on the new email list.  Since he took the time to
review V1 he might want to check this version out.  I've added him to the
'To:' list.

Also a link to V1 is nice.  B4 formats it like this:

- Link to v1: https://lore.kernel.org/all/20230614123556.GA381200@sumitra.com/

All that said the code looks good to me.  So with the above changes.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 	- Change commit subject and message.
> 
>  drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f020c0086fbc..bc41500eedf5 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1164,9 +1164,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  
>  			drm_clflush_pages(&page, 1);
>  
> -			s = kmap(page);
> +			s = kmap_local_page(page);
>  			ret = compress_page(compress, s, dst, false);
> -			kunmap(page);
> +			kunmap_local(s);
>  
>  			drm_clflush_pages(&page, 1);
>  
> -- 
> 2.25.1
> 


