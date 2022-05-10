Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A3520E4D
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 09:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6847A10F527;
	Tue, 10 May 2022 07:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD6B10F527;
 Tue, 10 May 2022 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652166909; x=1683702909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nhb0ZONwf3ddSWUv0HCL/NO//cMyvtjrZJRle81rQ9E=;
 b=DLx6R8WKXCOtCv1t0OTCHp+/q7FrOyR1nJS2FPe0Hz9XZ4B5v8BmyaF/
 ktptlfqmaHNnPZRNJL/+bbdeYat9A+bvdl9v3Ov7/3qBDy4/WSzOjoM7J
 pXEvJ69ndYx0j5ZANoltiskCRAiXKADJB4zT88NEsLKqsdP+sl0G3vi5h
 lr2kZsD9rWC3HWmviHqDR7X1nr9NNX5R+L2N0xrX7z3MmJltFEV2aFJDh
 bmXqCL75DiIdQJJABg+yli/ij38ZzPgxjVtqFaMcCVLdn+JfmaOCMVKKd
 qabE+Mtwf64e0R4aYLmn+rce/l7IhDXXYKPLzM3qyTIc5QPF+3otPVeGa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266875253"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="266875253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 00:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="593352337"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2022 00:15:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 00:15:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 00:15:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 00:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5Yhmc0WB46oB8r6pTK4eOddHh1NPfTWC+h6n36FwNWKeipvSMQMFEfy+iu13hdqfE+p4yyEkgyFJue6BnhL/V7g5AklWs8fBfVY9c26xDvhtrnCWuHlyFfXrMlIPglIMmCDmvC74EB75r9AeY0Wf3bOkjVBiVgxB5z9MTkax2NyCziz8rxD2GgGIl9l7A7A3/FyRsm7jlLzxViUiwQH1EsRxcBo/SLYFVslqU/dWfCeURrnsXKtC6W3v/8BTMsFgnyJrp/J1Uxbw+m0R1I1dN20CdxyM4U3GvjsLOo/KDza5gkzKfzwNNqq/9PHb7nXZ0H66ELQoFYOX62pQQiw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/OcKNf3xzMR0yUXh0N5nkhYya9n2lQxwKzHawdKMos=;
 b=ScByaQPMDOFmScriisA17iwgoTkqgvRBLy3CWCORoRodaXvczCLr6nl5frvyf//iFmcW3HsmiUg1I5pxXirCBWL/I4fPhx2l+QxUpPKzQ8bUt1eXxz+KuxBGbXMAiGM2VWLIscS3W3ki0xSwpkafaZoxz7I2fVsqOHLSgO7aJ4xMi+J535JLJezdxnlb75TPaAt1DH7kabqPWvGjI7og1XBfH2aisK2kWYUCKUn/JmUinnjQC55wbhuhZULj1tgkxus+qz9CRO7cjdfFsR9NiQJ0tsQW7EOfWKxxiFBzWxObrR00fbqXNKoc1V/YHl3koVM3WlcCFz0FB4t+pQVV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MWHPR11MB2015.namprd11.prod.outlook.com (2603:10b6:300:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 07:14:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 07:14:56 +0000
Message-ID: <28c45fab-918d-b917-47c6-4551d9165413@intel.com>
Date: Tue, 10 May 2022 12:44:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/25] drm/edid: convert struct detailed_mode_closure
 to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <da4c927cd973766568a79ef044254fff20317e7f.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <da4c927cd973766568a79ef044254fff20317e7f.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1a12c31-b651-4f6a-715b-08da3254c92f
X-MS-TrafficTypeDiagnostic: MWHPR11MB2015:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR11MB20159F03EBA0B09D1D0BD448CEC99@MWHPR11MB2015.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mpDNRxhm7gYs214hAOrU0f1KGe40qVH3uKGKcjMY0ha5y+BUBD7DIr/SoDGGe9pSGbha5DbXOBbLDUi/0TiWEDxT8U5PqX2enQxQyBBFhPtmnpwY9TKR0lSUPlBjdaBER48DWZ5hBc0Ze2l4Qwz32NU7Dl/vfTB/6w/Yk8ghKitpY4Bpa1p3idcy0fk9tDK32UHJoYSkjSwwTbKyA9NY25H9TGBjE5a5LXoMl+tIYztyZu2P7Xp+ZU8d/obvcPkqLVM4QlGXtKX/qDs2sltQHC5g2hfWbco2PA3rVRpJoMEokHTs+xZxEnowvdtDmdnXdL5DGZfeFwxMlEoKZvfGHhuuQE12dpYJPlveDzS2eNAwBu3WriSEDK18VBqvnwA7C6iXRpAQIN/pU84MPo94ZAMp3nR1Ww4uOTmKD4w4ZPyRwnKjMyXwXAppDGW+CwO2gS+Mc4Js/dMOwbcmCe0mLp5MM7+xrtXNlditdvnRjMYF9hFTxq82CKCai1RfRZRRuIYb49BjwC27Xzp3YpSedv6+YgIwIygx7gkLHfix9Qk9WuRA6do9+v+U8b/RVW6VyNeaokOO19UlSSH0DeLfJHNQpvGsnlrvYVdOzv7SRS8qcp79uFWyvzzTdk3nO/HYAvm8vlnYjQVsgnOgGNJ3+ptDULNAGbRxW3xb7Xx4adf2n6fH+yvBAZwaVvBeyM9cl37Q/54ebVJ4sLtk+XstbnpEHMdYSgs59tGk99lDNYqMlTHye83UjOG5LsU7V43GBuyEMuRGU5RoTypvIyreEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(450100002)(66556008)(8676002)(83380400001)(4326008)(316002)(8936002)(6486002)(36756003)(5660300002)(2906002)(31686004)(66946007)(6506007)(26005)(186003)(2616005)(6512007)(53546011)(55236004)(6666004)(508600001)(82960400001)(86362001)(31696002)(38100700002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmd3dVdVOGF6WVVOb29oLy9HU3dBdWpaNmFLbkVlLzVxVVp3NG9TREpXUm1r?=
 =?utf-8?B?OHg0UnZ1VnNPQUk5TE5LZHUyRjdTZ2N6K0YzaGJlYkNqamdxUlZNcWp2Mndo?=
 =?utf-8?B?NGsxc2xzU2hDbEhiaEY1djFZZmlLMnFCczJFQnEyUGVyMksxZUJLNHhDR1FG?=
 =?utf-8?B?L2RrUmw0YjgwekhOZ2pabWJYMHZPUFFPcDBQNXd2b29xR3pGTjB5Q2xnOXQy?=
 =?utf-8?B?VlFJMS9ERWNBQW1OWUFCaUxFRGEwZlp4d0RIQ0M4ejlOd254eElvSGUzYWtY?=
 =?utf-8?B?TEF4c05JQUZCN2NLMkJEMEYvcXRWbXBBMWlEYndUUHI5WkpTZ09KNzd1WXFa?=
 =?utf-8?B?bVp1VlZhVUVUMHVURlE2MW5xRE8vZHlXL2tKOWQyM3QxL3dzZnBZMmdRRFhz?=
 =?utf-8?B?ZHN2a1VTT1VlWWRHN1pNN2d2Wjg2ZXZKM2M4VHVCQVRvdUVuOERCakNTYVhC?=
 =?utf-8?B?WWoxTjJCVkF2Y29RQ2ZWY29JQnJ5RGkrTmsvaDI1UVlXUFF2dGFzR3o1aTBM?=
 =?utf-8?B?VXRBeHEvQWwybHpiczlrMDRNTUNjdUU4M3Q2anBNMlFEbGpwallaNUhwc2Y3?=
 =?utf-8?B?ci93cUhBbDd1MDhrN2krbmp2N1pjd0RuWlJHT2JjcFBRbW50K21wK29hL0pO?=
 =?utf-8?B?cC83eWZXcEtpV2JsdUtTcm0yTWhuK0hiY0lkOXlBWnp0R002S041Vmh0aXBW?=
 =?utf-8?B?WmJKNXhOM3U4U1RoWXNQY2J6YkV1dVpMYnpaa1pZaE9IdGN4RTBDRG9EeUZi?=
 =?utf-8?B?Ny9qQnRVRXZtQVR0Wnh6cUdUWHBTRHhreGpUUmcrem5STVMvYitlcmQwYjRj?=
 =?utf-8?B?VnU5WndqZURIa0xsZ25JYnZKQ01YNWFXNmd0amFzQzZFZW4yTkkrczVsU0Rz?=
 =?utf-8?B?RWEzck5PekRjbFBOR3VmYlRPZVJ4WTd4blRHUFJQamFEOE9HeVVHRTlvOGJa?=
 =?utf-8?B?b0hyZG5QN0ROQmNncDBTRm0rU3dlTHRrNWc5ajZWRnhRMk0vNy8vR1plQ3h3?=
 =?utf-8?B?Y2ZFVzBHRmU1RjRFN2JGV25GYjcyMTVDTjBuVk0xMlVaR3JLcEhZaDVKc3Zl?=
 =?utf-8?B?SWtkcFZBQks2bVlUL2wzbi9kSHZ1VGUvbW9mQ1ZaNjFyZ0pDWVFNQVlrc3d2?=
 =?utf-8?B?L3ZFUzZhSzFtTkZhRnhML1Fzc2tLWDdrNWc1Q2Y5bVBWZ3ZIcEJiY29IeHlC?=
 =?utf-8?B?aVRaN285NjhtOVV5RWpBcHVPZllNb2R2djdQZTByVnB0NFRUb3RtU00zT3Nq?=
 =?utf-8?B?T0RnRHIvMm1Qdm4xWXNtd1N2eXQ1YmIxeGdiODliZWRsSndMZE9uWDBpN2tv?=
 =?utf-8?B?L2lZcHVzazROWVR4cHRNQWhFeGRRSk5BNStPU1djS1RudXRXc0EzNS8vT0Zy?=
 =?utf-8?B?U1NJS0pwTnZ4REhGajRNMmpweFlTendvV1ZsbGxkallwTWY5amRIN1VSTm9a?=
 =?utf-8?B?K29PM0J1TEFCdHYvRm8rcmJVR2NLRnRUWG9WajlVL1NCRzhYUnRva2RHREhx?=
 =?utf-8?B?YzllTGNFWmp3MnJxVkI4NHFRN29nOFl4cXg1c29rR3hWZVlFMmZtVUtGWmtO?=
 =?utf-8?B?NlhhQnVidXFnbWFjdWlBZyt5QUZCelVqL25zQWlyVkdCcThYNW94eWUyOFN0?=
 =?utf-8?B?SDRaN0RZOHBYZnNxcHR2SERuR0JhOEQ4RDVWaUg2Z2Zqd2tLZkc4UkhZVWo0?=
 =?utf-8?B?WnFCeXR5b2llOTBweW1iNWg0RGZFOEVxQ09Ed2hYZGNReXJ5bERiKytZWXpo?=
 =?utf-8?B?YTdTU1RxRFlUeEorNVBjS2xFQko2aFVNZGF5QjhKWEM2Mkt2QVRoT3J5eURJ?=
 =?utf-8?B?QzhBeitPcHgxNHVZUFYrTmhybFpjY0lHVnNWQ2NsT1EvVzlKMnk1L0dYMkdv?=
 =?utf-8?B?MDdGc2JJcFo4c0RZM2RXdGdiQWVYY2h1RkEwSXhsRTh5K3VZSlJ6d3E4blVp?=
 =?utf-8?B?NUMrNTY1ZEc0SmgxTjVTSlFNOVlhbnhhaWZGMFBGZHVJL1FrdW5PdVFud3cz?=
 =?utf-8?B?TnEzc2xrM2VPdFRDT0d1YWUrNU1Wek5SNFk0amtkZ0Y2N3FhSjVjTFBubHA5?=
 =?utf-8?B?VWZicEtsQnZpa3pTeDU5UXBIVDFEY3FYazZBc1cxdSs2cUVZR1ZOaGppbjRE?=
 =?utf-8?B?b2tHbTdKRXNMSDhZQkxjWUxSRzBLaVNHWEpwMjZ2QnBhdXZJSGI4R3RUYWl3?=
 =?utf-8?B?V0VVRUNSbHBWWlZEb3c1WTd1MUFmYW5ocGNuajlVeTFxN3p2Ri8zbEtZa21G?=
 =?utf-8?B?cS9RMEwzYWRvQzF4djIweTVneHdFaTlqdUllcG8rbXg1WE4wTDNqOGJGWk8x?=
 =?utf-8?B?NjJRcVE5MjRsZHZ0SnBPbGd2T3YwM0FneXVkU2h5ODFRRnpCZW9GbTduSkRR?=
 =?utf-8?Q?CZfFFu3m86TirC58=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a12c31-b651-4f6a-715b-08da3254c92f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:14:56.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlFZiJl7Q14ZW17e3MxD8XU9vTYFvEwLTg894ykttBPUQ+9ozBLRMHqou7ARkrGNly1MVNAVSlj/VgUpcfegr83NWN80k/KAFeM4nhQCebc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2015
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LGTM, The subject perhaps can be modified to suggest drm_edid being 
added to detailed_mode_closure.

In any case:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f54699422bca..c2887012add0 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -96,7 +96,7 @@ static int oui(u8 first, u8 second, u8 third)
>   
>   struct detailed_mode_closure {
>   	struct drm_connector *connector;
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   	bool preferred;
>   	u32 quirks;
>   	int modes;
> @@ -3226,25 +3226,25 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
>   		return;
>   
>   	closure->modes += drm_dmt_modes_for_range(closure->connector,
> -						  closure->edid,
> +						  closure->drm_edid->edid,
>   						  timing);
>   
> -	if (!version_greater(closure->edid, 1, 1))
> +	if (!version_greater(closure->drm_edid->edid, 1, 1))
>   		return; /* GTF not defined yet */
>   
>   	switch (range->flags) {
>   	case 0x02: /* secondary gtf, XXX could do more */
>   	case 0x00: /* default gtf */
>   		closure->modes += drm_gtf_modes_for_range(closure->connector,
> -							  closure->edid,
> +							  closure->drm_edid->edid,
>   							  timing);
>   		break;
>   	case 0x04: /* cvt, only in 1.4+ */
> -		if (!version_greater(closure->edid, 1, 3))
> +		if (!version_greater(closure->drm_edid->edid, 1, 3))
>   			break;
>   
>   		closure->modes += drm_cvt_modes_for_range(closure->connector,
> -							  closure->edid,
> +							  closure->drm_edid->edid,
>   							  timing);
>   		break;
>   	case 0x01: /* just the ranges, no formula */
> @@ -3258,7 +3258,7 @@ static int add_inferred_modes(struct drm_connector *connector,
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = drm_edid->edid,
> +		.drm_edid = drm_edid,
>   	};
>   
>   	if (version_greater(drm_edid->edid, 1, 0))
> @@ -3323,7 +3323,7 @@ static int add_established_modes(struct drm_connector *connector,
>   	int i, modes = 0;
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = edid,
> +		.drm_edid = drm_edid,
>   	};
>   
>   	for (i = 0; i <= EDID_EST_TIMINGS; i++) {
> @@ -3351,7 +3351,6 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>   	struct detailed_mode_closure *closure = c;
>   	const struct detailed_non_pixel *data = &timing->data.other_data;
>   	struct drm_connector *connector = closure->connector;
> -	const struct edid *edid = closure->edid;
>   	int i;
>   
>   	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
> @@ -3361,7 +3360,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
>   		const struct std_timing *std = &data->data.timings[i];
>   		struct drm_display_mode *newmode;
>   
> -		newmode = drm_mode_std(connector, edid, std);
> +		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
>   		if (newmode) {
>   			drm_mode_probed_add(connector, newmode);
>   			closure->modes++;
> @@ -3380,7 +3379,7 @@ static int add_standard_modes(struct drm_connector *connector,
>   	int i, modes = 0;
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = drm_edid->edid,
> +		.drm_edid = drm_edid,
>   	};
>   
>   	for (i = 0; i < EDID_STD_TIMINGS; i++) {
> @@ -3471,7 +3470,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = drm_edid->edid,
> +		.drm_edid = drm_edid,
>   	};
>   
>   	if (version_greater(drm_edid->edid, 1, 2))
> @@ -3494,7 +3493,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
>   		return;
>   
>   	newmode = drm_mode_detailed(closure->connector->dev,
> -				    closure->edid, timing,
> +				    closure->drm_edid->edid, timing,
>   				    closure->quirks);
>   	if (!newmode)
>   		return;
> @@ -3525,7 +3524,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>   {
>   	struct detailed_mode_closure closure = {
>   		.connector = connector,
> -		.edid = drm_edid->edid,
> +		.drm_edid = drm_edid,
>   		.preferred = true,
>   		.quirks = quirks,
>   	};
