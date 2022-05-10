Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4945210C0
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95410F193;
	Tue, 10 May 2022 09:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE610F193;
 Tue, 10 May 2022 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652174576; x=1683710576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uydi+TH+6DQFKej/K3AEiml/G6XT+SB5fTLZ5aez05s=;
 b=ekD2AESbvdH2NhL7m3XVOZxcDkb3EJURd4Uu0f9BpiR7KojOMAyTOVPt
 nI0uHR4pe2XO5ce2Fr9iE1o0tYLA43GsIOCSufcJl9r7oZVsmXjmrA/lB
 AccESCacQYa8QeUPctqr58rJTJzIQUXNRqL9seHr8jEZ7rSADtc/o987K
 DNFbNgTDC8BwCv3xjbSYJ8XT0SoNMuW/ueygLY11mURpL7cYdNJm5JWKE
 U8GftfK2GfYwbif8kych2NrFI00gPssxfxbYEa6/BHaQCJxvbaOomiwct
 vhoewtGC041ER2Qu23WfJ4w9L8wZSWtyPeE506teOybgFFaJ5Jls/QCCm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269252186"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="269252186"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 02:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="541691327"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2022 02:22:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 02:22:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 02:22:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 02:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dus0LlhXzvt+oOKJQjvIw9b6gEk9AECeaEVCG8S6sooLI0cajgpJhqbNUxljOYgmgiChx4MBUnfBMO0zF90gbgJHYs0uYExCZIYiFXzx4QLkPtN/xrbuxGtnv4xhO3ICOnDmqe35FL+mn2YTUXIww1RP4N0q5mwJyCAC3k6NNzYEzcC5cItLjjcZRUVBaT/Oop73B/15DPcIXqKG+Qnj2pOb5AiuZxRa69HNNZGtgO5cbKco3ZQGC+GmkGuYPMipR12/t8Xvrh9hGPQB/nxJ9Zrgiw7sjtS5X9QMATXyWuH4dvPmxWdw5tBxQS8OovJAMKEYBMx09wiUqqp7vcNl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz6EapbkteZzaEWPKARsJPj1s50gRcD2xle53JE2fb0=;
 b=CwszS8b7SCobt4S7lTHf4vzeUpZMJyitJxoJHpi/ZZzf9xdIvpzk6NALH9XVjeblon1v6ef9fx1QwxZFHIJmXeNsKjAC6RGcr6IHi68LMgzH6Nb8/ZSoDWRXglFLcgedETjWZ1MjFrlC806YzZUP0l0SS9ipCICt5kCXRwdUDmOonpgobO6kepyizZ+GMBZjLLa34eOvWDgwhCkaNXth82R03yKIALeKGbO3P5pTJqnUpWE2aQ9YbRZa8HzI8W/AyYmfWVzJEBu8hY3vVafvD3fbw8BBGpOpsL0Cgmobq+jmKIeFKbP9CLnrNa02lMEuT9dKRyHtM6dk+9UfqdeyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM5PR11MB1787.namprd11.prod.outlook.com (2603:10b6:3:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 09:22:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::5813:4cbb:7fe0:7465%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:22:53 +0000
Message-ID: <d6fa4d76-a7fd-2561-fb83-4b69a65d5b76@intel.com>
Date: Tue, 10 May 2022 14:52:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH v2 14/25] drm/edid: convert mode_in_range()
 and drm_monitor_supports_rb() to drm_edid
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
References: <cover.1652097712.git.jani.nikula@intel.com>
 <aac7dd14ce8c266491e9dfae12cad00fecdcd2e3.1652097712.git.jani.nikula@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aac7dd14ce8c266491e9dfae12cad00fecdcd2e3.1652097712.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48715067-0e7b-418e-5be8-08da3266a8ea
X-MS-TrafficTypeDiagnostic: DM5PR11MB1787:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1787CBD01040E7B8A5B17E53CEC99@DM5PR11MB1787.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CZVHym9NNSDlH9klXSb9HU3wO769V18MuHVYG0kCqdff2a4H7qMCrbrfchKyx7aqxB4de3lvNH8QgwNiJDEoQXo0Wxi6LIOUwA1drkCtuTYAQfqRpGH8m8SYFlIvrkxXfkv5qWC8teD5ydjAhWdEYHDeYfWVTEKqkVOSdjDbQX19zBHWFTZmkzEMEJwko0uvX+JkqtmB1GIFYqtLOjaSzzSuc9FitdUsjzgU+R/lfUWfjdMN2B2yJ91wYtGoN4aJi3LaDyEfdnO0fP3Ujx8poB5nXgIFgNnwjnZTqwuzgx+KSwyrKZ9NqqXFyhdtshaF+0X/nVrckZKAi1XrquaCVPeLpTbZWRUGzPcCPWg+zTcMvMIcivYPTijvC9okY9tMFfiI1SSWX+e3kXML8VANsq+m/oENx5RZ7sm9+CKVg+YuA/oaF0xo/+XuaWPF5UHpZnp+hZJK8IzC+U3nXgTrykLTTxH9R7MmrfAbA6qMc6AVmN7KgFs9FxUD61J/59UGjVV/VJhn158e3QiFyHlu5nCTk6AzwdOyqEkzWvqtDPtRRXFRqwhTiGgZr/+7Z0CNloxNoy7/GmUzSrMX/DQ/bbQKOYElNge3rN42ypX/MZeptB+s1xeBSLR0i5jqaO2dXX7XpB4+C2P7yFUw5elkL3Tlh1ep8XmPCi2rmUfVbv5SyfU8ozAPyakf5cgAbcqRIy3qtVV+HXSLR4mkPF8S8dAu7X/9qozOEnjyKm2UNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6486002)(8936002)(316002)(31696002)(508600001)(38100700002)(450100002)(8676002)(86362001)(66946007)(4326008)(66476007)(6512007)(83380400001)(26005)(55236004)(6666004)(31686004)(53546011)(6506007)(2616005)(186003)(2906002)(5660300002)(36756003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUk1WmhtYnFBNzJscGtRS3Z4ajdNRS9IN3NzajVXNlF3cmpldnUwQ1d5ZHFZ?=
 =?utf-8?B?MTM4ZWRPbVo3d3ZnbmhOV25HMmt0TTNlZkJtaFR2YUxRYTVnSi9YZ2ZUR0x5?=
 =?utf-8?B?ME8wRy9GYUg4QTRKdkwzOVdIeTRuYytQeThJcjRWT0ZoUG5sSWVpTjRHZWt3?=
 =?utf-8?B?RHBZVlNlNHhVRW1sME9qNm1McDhNTDVWeWhuc2VBNWxZS2ZvTDRSYnByZzJW?=
 =?utf-8?B?Ry9hSEs5TE1DOWdJQWdCTWRiUWZpMThZdkI4bWhCMzVRc25weVdiMFljVTN3?=
 =?utf-8?B?QXV6WDNFdlJ2MnpVSlc4SjNZbDVoQ0VicW5lVDNveTVNNCtFSGZENXM3cUZl?=
 =?utf-8?B?b3pNdUpuU254Vk1GRGFwUWFJL3FRL0ZoWmJsbGlZeko5NHVxejRPOSsvaGEx?=
 =?utf-8?B?TFR5eEhDVGZmeWpVYmlxaXJXTTVjVzAvSkRsTDFBQ0hRSUxNMWpRSThOa1FL?=
 =?utf-8?B?VWpHc2JoWUVZNUVaS25PNVpOVDl0TGhBSzJUdmphaVhhNndVYzYrb2tTWUpY?=
 =?utf-8?B?VlZSNVRHVitZYjB6b2JTMXJZUUJNTlFmS1BCd3orUEFWQ2cvNE5McE81WFBn?=
 =?utf-8?B?UjM0dW1lQ1lvNmN0MmpiajZoMlBiT0EwSFYrYm5ZQnNsL1ptaXJOWUxhMmUy?=
 =?utf-8?B?b3RiNGVVMk9GN0dHU0picC94Y0N1UVg2YzlpQzRwak5HOHRob0tRT3ZEY3Rz?=
 =?utf-8?B?dzJVbHJ3QlNRMDByNUVlaUtHRy9Wcm1rMnNqeWZRbkRRMmxTVjM0ZExDMDVQ?=
 =?utf-8?B?RWFYZnFReVVNYWt0azlvZjM3cmxNaUlZc3lDaWxQdStYR3FnZ0s1Tjlsb2ps?=
 =?utf-8?B?ajd5N0FIMVRhcjhzYkZURGVJYVJZV1BFM1YxbVE3U1dPaXdtQW5ZWXEzMzhz?=
 =?utf-8?B?YjI3SWNjN2FScEx3SDB6OEloNjRQOHFEcWMwN1MvekVpdkczdXRibEE0VjJr?=
 =?utf-8?B?ZnRZSW5Ha2RrdXkvU243QUNTbmpjRmdKYkpqaE9Seml1VU1VdEl0N1pTN0No?=
 =?utf-8?B?V0hSMmFCQzVBdTBYTVZlNXpsZFh3T0NXSnlOdFZNeXhOR0R0M3ZtVkRuU1R5?=
 =?utf-8?B?WUhHb21SOXRoTlY5a1pZdDRDZmFzZUtKKzJmS1VMTU9YbVcvMm1WaUZEM2o2?=
 =?utf-8?B?WDZWOTUzWkdPaEFYSm5udnlxcU1qNzAvNDAvWk15UlVhK2p1bnNONjVJMDBH?=
 =?utf-8?B?b2xIalhnT2VUa01yUDBuWHUzZHArcTIyeFA5S1pOTnZROXMwMmtPT0M1UEoy?=
 =?utf-8?B?ODgzQVMvU25Sa0N0SHZQMDlXWDFEODByVEt6QU9yOGt2L2dmSitqTG5DRTFn?=
 =?utf-8?B?aFdWdk9wR0ZLY2FaYU1FNElEYkNrZER1NEVmRWxlV2NmalNqSTVmVGFNYUcx?=
 =?utf-8?B?QUYvMDhmVUxzTmpVWmFtc1JlRlVzVzRVc0UxcUpmaEVPQ1hTVGRCOHNNaUI0?=
 =?utf-8?B?NWhabWZHS1JxTXFUZjVIc2ZIbFRHUVNqYTkrVUtDNnpoZkJnRkJpWnlxNHly?=
 =?utf-8?B?NUdjWkRjc2Rob3hRQWl5QVM2ME9JdEFMcFROVjJXQVdGUVkwaDlBMFI2emVW?=
 =?utf-8?B?L0RBVGJtdDBmYTJGZnJER3hIcFFTZHhWTitRTW5hZ0ZSUEwyZWxUUGNMRUhI?=
 =?utf-8?B?NmNwenpxa2x6YlNRdnNxQUt0NkthU0p1Q0ZkbG9KaEw0aE1aZTN4ejQrcm9L?=
 =?utf-8?B?UmNzWWxyczRnaGtpQzlnRE95ZWNPQzFpT0JHMWFVaExzd2xLeFFSYXhrZlg3?=
 =?utf-8?B?SHRiUWNLYTkrYndNTHdaYm1mTnBQaGlnS24yQ1p1YzdoU2poTk5hNEdhOW5z?=
 =?utf-8?B?SEU4M3hqR3FOKzg4ekdmOVBKazZ6WXNqbDRURFloY0JzalIxZE9mWGpNcnI3?=
 =?utf-8?B?RXA4VnlIdW44WjNVZWMxcm1DYkpUSFgweWpza2hEQzlMSVdXbFM0Y1NMTjcw?=
 =?utf-8?B?MXFXWFhZczNpSVRId0MrY3l2c05xYUErbkxZTHY4N2xHWXZEa0pwRld4RDE3?=
 =?utf-8?B?Y1NpRWZUWm5KYTdON1lyYTBlRjYrQW5Qa1cxZ3JmZUVtaHN0UTE0Z3paNkI1?=
 =?utf-8?B?TWZ1SjlkekhZeGUyRmU2dVUrUTF2T2JuUm5vTUN3b1p4dGNkZDU1b1hkNk5n?=
 =?utf-8?B?K04wOSswM29zNWF1ZGxWV1dRcnVaT28vQ3dVSVpMZ2E5dmwrSmQ4RGd6TDlK?=
 =?utf-8?B?R3lZZVQ5N3Z5dGRuM2I1VVBVb1JqZmRlWDNwc1VuMjlvbW1iTjlKVFJsRldr?=
 =?utf-8?B?bXlZWWN1R3BlUXd2MnlRb3NQakdEaTl6c3k2Tk11QzF1V1FqaE94VUdockVp?=
 =?utf-8?B?MWJpSDRNSTFsc0JBZklISGhzU2FMWlJ3UnowQ3VqbUJEOWE3Tm9nRldYS1M2?=
 =?utf-8?Q?pQra9ed88Cj4ZlwM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48715067-0e7b-418e-5be8-08da3266a8ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 09:22:53.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhogpbO5prNa5ICdUHGEW8UHvbgQ2X1+pRxAsWsJTo0F5pnJhmubvOamYSCTpeHiVsr2MTDgOqzgDNG2w2M3gABWiZ046FxBgMjOh6pac5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1787
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/9/2022 5:33 PM, Jani Nikula wrote:
> We'll need to propagate drm_edid everywhere.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 27 ++++++++++++++-------------
>   1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bea8f33c58ad..364949e146a9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2645,16 +2645,16 @@ is_rb(const struct detailed_timing *descriptor, void *data)
>   
>   /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
>   static bool
> -drm_monitor_supports_rb(const struct edid *edid)
> +drm_monitor_supports_rb(const struct drm_edid *drm_edid)
>   {
> -	if (edid->revision >= 4) {
> +	if (drm_edid->edid->revision >= 4) {
>   		bool ret = false;
>   
> -		drm_for_each_detailed_block(edid, is_rb, &ret);
> +		drm_for_each_detailed_block(drm_edid->edid, is_rb, &ret);
>   		return ret;
>   	}
>   
> -	return ((edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
> +	return ((drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL) != 0);
>   }
>   
>   static void
> @@ -2838,7 +2838,7 @@ static struct drm_display_mode *drm_mode_std(struct drm_connector *connector,
>   	}
>   
>   	/* check whether it can be found in default mode table */
> -	if (drm_monitor_supports_rb(drm_edid->edid)) {
> +	if (drm_monitor_supports_rb(drm_edid)) {
>   		mode = drm_mode_find_dmt(dev, hsize, vsize, vrefresh_rate,
>   					 true);
>   		if (mode)
> @@ -3077,10 +3077,11 @@ range_pixel_clock(const struct edid *edid, const u8 *t)
>   	return t[9] * 10000 + 5001;
>   }
>   
> -static bool
> -mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
> -	      const struct detailed_timing *timing)
> +static bool mode_in_range(const struct drm_display_mode *mode,
> +			  const struct drm_edid *drm_edid,
> +			  const struct detailed_timing *timing)
>   {
> +	const struct edid *edid = drm_edid->edid;
>   	u32 max_clock;
>   	const u8 *t = (const u8 *)timing;
>   
> @@ -3099,7 +3100,7 @@ mode_in_range(const struct drm_display_mode *mode, const struct edid *edid,
>   		if (t[13] && mode->hdisplay > 8 * (t[13] + (256 * (t[12]&0x3))))
>   			return false;
>   
> -	if (mode_is_rb(mode) && !drm_monitor_supports_rb(edid))
> +	if (mode_is_rb(mode) && !drm_monitor_supports_rb(drm_edid))
>   		return false;
>   
>   	return true;
> @@ -3132,7 +3133,7 @@ static int drm_dmt_modes_for_range(struct drm_connector *connector,
>   	struct drm_device *dev = connector->dev;
>   
>   	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
> -		if (mode_in_range(drm_dmt_modes + i, drm_edid->edid, timing) &&
> +		if (mode_in_range(drm_dmt_modes + i, drm_edid, timing) &&
>   		    valid_inferred_mode(connector, drm_dmt_modes + i)) {
>   			newmode = drm_mode_duplicate(dev, &drm_dmt_modes[i]);
>   			if (newmode) {
> @@ -3174,7 +3175,7 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
>   			return modes;
>   
>   		drm_mode_fixup_1366x768(newmode);
> -		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
> +		if (!mode_in_range(newmode, drm_edid, timing) ||
>   		    !valid_inferred_mode(connector, newmode)) {
>   			drm_mode_destroy(dev, newmode);
>   			continue;
> @@ -3194,7 +3195,7 @@ static int drm_cvt_modes_for_range(struct drm_connector *connector,
>   	int i, modes = 0;
>   	struct drm_display_mode *newmode;
>   	struct drm_device *dev = connector->dev;
> -	bool rb = drm_monitor_supports_rb(drm_edid->edid);
> +	bool rb = drm_monitor_supports_rb(drm_edid);
>   
>   	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
>   		const struct minimode *m = &extra_modes[i];
> @@ -3204,7 +3205,7 @@ static int drm_cvt_modes_for_range(struct drm_connector *connector,
>   			return modes;
>   
>   		drm_mode_fixup_1366x768(newmode);
> -		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
> +		if (!mode_in_range(newmode, drm_edid, timing) ||
>   		    !valid_inferred_mode(connector, newmode)) {
>   			drm_mode_destroy(dev, newmode);
>   			continue;
