Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE63678BDF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C7410E203;
	Mon, 23 Jan 2023 23:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3695810E062;
 Mon, 23 Jan 2023 23:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674515513; x=1706051513;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wxFPgtxGpe53GL6/Jq+Ife9fIpNpKMepNwmnDxZJJLs=;
 b=Qg1Q9s62BycOQqk2IU4Uh246d2Iqy+IssxDg79LUXH6Xm+h6DYhqKbbK
 ckRUf5LiZywPWBJsBNeNrX2CVkuf96wfKTXiSLSgadewMxNJHDcShVXq/
 gOJnoBoyCeH61HfjAJdq2uV9WaOGCsXUzS/+Q8BmeGm4YrXWPrFAgd9e/
 Gu+ZbA1q2MGgkz7afpEtiK940C3VHTIGhI/ZoPvhSZ69EOCtjHaBdVDRm
 w0YNvDeSNGVcMh/iPBb0QHglIbl0ew2M7gP7D2bMqxvcPoeQ5k3+F1AVD
 kFQlWNsZzy68x5k+FuB6sa0UXnkKsm7nBBUpUqp/I6LwNytbir7WUo2QR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309759131"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="309759131"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750619074"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="750619074"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 15:11:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:11:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 15:11:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 15:11:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWuNY7uPx+oitYUeO6r6ejYR2hIOuW97vueMPEOJ9z1IFhnHMeupIoraeirUtaP3O7RbrnR8HCkcEI0HaOUbSwa6VFO2rUurdSNr1G13vokaJMAockt1597t2mBr/YkNkAkw7e3471dvKbb6ykNP3U/invMhjfADhrSqcweQkMsKQm1QGF5VITctudhAuklzDzWBVseJeqt8QICkCwuheioiOnHg1jq6pPVvs1JKTFGR0rh0vaEfGl0fzcosFkJKPc42hZ9pNuXH1AD9Xw+f7OTpcfR0SwJv9Uc8zeJVX1FOIEQG6q/KndPgkjkLhl2AvXJOqx3JEW61eSiAZ4/Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WWpoqG85xcIhy5EBvU47NS+SfRfSPm9uDTTr2zXjLM=;
 b=n9Lor8iv9Y+ys7KlChy/SgPWhb+Q9Vm9un5jxyN5bgRTnGZRgqvcdgBHBMJi1BTlEve9jqHBhL0A6VvqOOQXDfts6l918Sjgx1y3tUbMyPtv8cL98ufIzJU1kQYijM0FqueLeBeUcJKVUucGTNoOEjxei/MTW+l3BJLfczuJyw4rB+05FPh9h3ABp3hAqeAOWyd+GCU73ROaQeBoKsON9Jr9SJD1SZodx3kgUzh4twnfwNSYBXc3h5mT4FIKolGVSaOj1UVBItwSnxrfd1SDWaJP7RXSknaFmWr+XXhIC+yH9yN4DjDikQgIQf0dPA67eyEFqdjMu5pLB0ALhsYFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:11:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:11:41 +0000
Message-ID: <198a4041-5a0d-b18b-4a6d-a5feea612861@intel.com>
Date: Mon, 23 Jan 2023 15:11:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 7/8] drm/i915/guc: Update GuC messages in
 intel_guc_submission.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-8-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8634c79f-342e-411e-b55f-08dafd973014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIN7zUo/33voJXVbH0QQSnygfU+CRgGPtB87e/YCZkzOpHCAYjRt29xZvonG/Xe7Nh0MlELhA6MyAteLX7iTYNPPh9QiKAWqCNU19BVD0sE8n2EOKa9c5YmRlyiYXciAWdFOZkMqxFPgxegmkc3e1I7OMSyEUD3ATo5U2kfJV6fwWFxPxi30cfVTVY/XMuWIZzWAkJpC/kbSapVVc6j9KBWRQJUX1lpoojKEFQJlASkEyvr+yl7iFzmqNJDbEHFWHaB8RupX0rQUR3y8V2qkK6kfpiDPR3adiemc5dVttLIPgAr52iYhs64tN54WZaRLawSmlGVGCyLDbJMPWTdLwjNlGsY8pBf5wF6huxphq34k+YDYYOglQ+QFOT8l0tsvsqpr5k63v41KKFRgPd/Cwoni1Ky3HnugLj3Xi5+6Ou3YcSrmj1l983DIehRnnuPMb4o0CUdLOceDN/xYZVT6ktahClDp58/CQSQ8Dm3CqkmPBRJBR7FxZmVAtgqgu0D8mzhLvF+4+/CoUpsgrB/Tjkg6KXgR4qeXoaSEysZwzBVpzwqDC9ah0c5fXV93iJ8K/I2Ii5bBPSAtb31cMCc5KEphZFLOXnfe5iBmfU8QABTTH5Qf0Blz8/TdAIIUJbZjVtIcUd1MpFhBBrRKnDYN5ovKVgwnpmKEka02aSvSW2g820iHo9DM9T1Yad8N8khh+BHkdlbsUiL/4C2nH33G4T0QeY1FSZCen/c4yBLCeiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(83380400001)(41300700001)(31696002)(38100700002)(82960400001)(2906002)(86362001)(5660300002)(15650500001)(8936002)(186003)(53546011)(8676002)(6512007)(6506007)(26005)(66946007)(316002)(2616005)(66556008)(6486002)(450100002)(478600001)(66476007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1U5eWFIS1hFeFR6MDdMQVNMbkhqSStpejg2TWFSMFcvaWhnQ0dSS0hBb2Z5?=
 =?utf-8?B?azgrYmF5NHVNa3V5aUlWWURPZGZMMTUzVEFocVFDR0lvN2xNODdvbnppKzF6?=
 =?utf-8?B?dUU0R1Ura0tKL21sUzZBNU1RczRJOHBGTGpsN0U0WkdtcFd1ZXlEN2hwdkV6?=
 =?utf-8?B?Z3BXTjcxT1p2WTNNVlJyZVFlT0ZBRkNhTHZVQmM1VGtmZi9EZS9yNGdQaDla?=
 =?utf-8?B?MGVYZTNUYTd6V1RUWTVJc2FuT1lKUmVPUFJlK1FCMktCb1FHc05IL2FTYnM1?=
 =?utf-8?B?NU5jU1pRQ2ZSTGplMjcreGJVTGQyTHdFRG9pbFFpRkllWndMREE4TUdVVEJJ?=
 =?utf-8?B?MXVDYWhkRG9KSS9lY0hBRkVFb0ZhbTNZOWZEdUVub05ISzZubEZKdFBvYXB1?=
 =?utf-8?B?WHlGa1psSTFaTmtPU1NQUDVCTTBkOXo4WWNtTzBhZVV3UXJkc0k5WGRqNTBh?=
 =?utf-8?B?eFEwc2tURUQrOHFGcUoxaEdrQUVxWGVQVlRvMUt5Mm1jRklQWW9WZTZ4dDdZ?=
 =?utf-8?B?cnZOcVlCeXB3VmNMeGpydGRPNGpCVnpJQW9FalFMUnArN3NRZWw5bkppSkNi?=
 =?utf-8?B?SDhjTEhxaEwyeHhDeHJWZ1R2eU5JMEVSak10NlRrdDNqV3BSRlFIMTNQY012?=
 =?utf-8?B?OGNEL284Y09aZ3Vkbk12MXhWb3d2MUM4YkFUSlVlbXA4R256Q3BRZ3JMRU5L?=
 =?utf-8?B?dW5PN2Fwb2tHbm54ZHgzYVRBZVNxd1BzRE83d3kwY0RWenlYZWIrUmRHVDBn?=
 =?utf-8?B?Mk5xVzN5ZytpcFFxdldieTkweHJ1K0lLaER6cGtGNXlzRjN3bE0ySGhXbU5E?=
 =?utf-8?B?TG9TNTl5dVpFMCtyRFBVQzVrUWxUWHgyaFRGdTNWNzJMa1hSUXA1U3czd1JG?=
 =?utf-8?B?VGdYeHVYNDNFc2xzWVlyYm9RalExT1ZXZnJjMVZuM1ZGaUxxQ1ZndHNPUDNm?=
 =?utf-8?B?REg4R1Nxd3V2ZlNUSVVmL2ZrbzlaM0Y0R3RPdkZvY0IzKzdyanVuak9vMGlL?=
 =?utf-8?B?a2REZWE4d2VDemVTUTcrT21GNE9YY3Z3R25ZZUZmUE4rcGJDYmFkeFBrbDZm?=
 =?utf-8?B?WjNkQU03TUNkRWFCL3EwMTN4SksrVlI1SW9UT1FQeUxFc2c4SGY2YXdEbWFZ?=
 =?utf-8?B?NkFiNjA4Nm8xaEZncy81Y2VHMmk2ZWFoTGxGZHZ2a000RXY4bElSVmU3OWlV?=
 =?utf-8?B?aytpUUpOSzBGKzVIcGlidTJxdVl5QzZRb3YxKzBHVHpCOHlodW5KaXkrRkdU?=
 =?utf-8?B?M3Vkb1NUZVlXeU5wUHRreFJqMGY1ME5xQ2pIMTNkR1dobUZ4dTBSd1djZzVs?=
 =?utf-8?B?QlJnNGk1UzNWazQ5RHJ0YlRpYUpxbFJNV2VCNnlIUlZjWmNSK0thMkZZSDFi?=
 =?utf-8?B?V2EzcEY5TGlrc0ZrSDFOZnAvcForRTBOZnRBbGN3QnRoczdsWGRDSnVsbWIy?=
 =?utf-8?B?NWNFY2NvblgxWTNuTW51T0JNS0xkdU9UdXB0M1NPZVJOcGUvbXZOdC96YkRB?=
 =?utf-8?B?M3kyUGJ0VmE3WUtMMzVmTmtqbTJ3UjRNS3ZPNGRiU0kyWjFrVzRGZTVycXFJ?=
 =?utf-8?B?Smk1N01vaTRKTWVUeUlZQjdsNzBjRmhKazFvNElvTVZRRTY4TVZnRmlxbnNK?=
 =?utf-8?B?VVdLeFJ0UHN3aGZOYmJwaHRDVGVQMm1DeUNpK0dPWDNYWW5oMWtkbzNUa29I?=
 =?utf-8?B?b3NISzVhcEdKR3pTeGdwM1ZYaVRtbENpaDd1Z0ZpNC94V2I3ejhHWDVPOHhy?=
 =?utf-8?B?MlBvSHdsUlNaZG9ZNDMyMnFadHVaUjhMK296MFJ3eEVacmtOZElicFFPa25D?=
 =?utf-8?B?N1FhZGRXQlZEQ2NLMDNoTXV1NHRjV1hXbUwzNEJDZWpnRHZ0NEZ5UXR6blZB?=
 =?utf-8?B?L2FQWmtXenhoeU5JalVzQzB4Q09QYUFjZDlQUFZiZmJMNThjUXZuOHVYMjVR?=
 =?utf-8?B?UUtqYmZ2TzdMWFFMWlJDM0wwNTlhUUNYQmUvNkdWUlBOOVFiYmRvOWc4Zm90?=
 =?utf-8?B?VkQvSGZGZUlUZkJnQ1dnTGNFWCtvYWtvSGh2b0w2dHFOSm9NVUhYRU1INDdy?=
 =?utf-8?B?VEp0a3NzeEd4ZjA3c1JUOWpPanRTbnZPcnNrQU5Bamd3ZHV3VUxMdEV0VTRa?=
 =?utf-8?B?MUtNZEs2M3VqQWFOaUhreUR4THdmdE9HUFdWRStUeTVFaStvWGN6L09pbGJ5?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8634c79f-342e-411e-b55f-08dafd973014
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 23:11:41.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOgAE6d8GgWGbhqR7GZYmiyjnWNqwgD6tGFSJ9XBCJGHCacLPnfRu5Ygkzi8OWPIz+Dc26MMrJkgd7s/YmanVZlhhkrYETa5yVnWyZHbTRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 60 ++++++++-----------
>   1 file changed, 26 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e4..bb98206304ee 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -27,6 +27,7 @@
>   
>   #include "intel_guc_ads.h"
>   #include "intel_guc_capture.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_submission.h"
>   
>   #include "i915_drv.h"
> @@ -1443,8 +1444,7 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   		int ret = guc_action_enable_usage_stats(guc);
>   
>   		if (ret)
> -			drm_err(&gt->i915->drm,
> -				"Failed to enable usage stats: %d!\n", ret);
> +			guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
>   	}
>   }
>   
> @@ -3585,8 +3585,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   		intel_context_sched_disable_unpin(ce);
>   	else if (intel_context_is_closed(ce))
>   		if (wait_for(context_close_done(ce), 1500))
> -			drm_warn(&guc_to_gt(guc)->i915->drm,
> -				 "timed out waiting on context sched close before realloc\n");
> +			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
>   	/*
>   	 * Call pin_guc_id here rather than in the pinning step as with
>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> @@ -4349,11 +4348,14 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
>   
>   	ret = intel_guc_send(guc, (u32 *)&policy->h2g,
>   			     __guc_scheduling_policy_action_size(policy));
> -	if (ret < 0)
> +	if (ret < 0) {
> +		guc_probe_error(guc, "Failed to configure global scheduling policies: %pe!\n",
> +				ERR_PTR(ret));
>   		return ret;
> +	}
>   
>   	if (ret != policy->count) {
> -		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
> +		guc_warn(guc, "global scheduler policy processed %d of %d KLVs!",
>   			 ret, policy->count);
>   		if (ret > policy->count)
>   			return -EPROTO;
> @@ -4367,7 +4369,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	struct scheduling_policy policy;
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> -	int ret = 0;
> +	int ret;
>   
>   	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
>   		return 0;
> @@ -4385,10 +4387,6 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   						yield, ARRAY_SIZE(yield));
>   
>   		ret = __guc_action_set_scheduling_policies(guc, &policy);
> -		if (ret)
> -			i915_probe_error(gt->i915,
> -					 "Failed to configure global scheduling policies: %pe!\n",
> -					 ERR_PTR(ret));
>   	}
>   
>   	return ret;
> @@ -4487,21 +4485,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
>   	struct intel_context *ce;
>   
>   	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Invalid ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
>   	ce = __get_context(guc, ctx_id);
>   	if (unlikely(!ce)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is NULL, ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Context is NULL, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
>   	if (unlikely(intel_context_is_child(ce))) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is child, ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Context is child, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
> @@ -4516,7 +4511,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	u32 ctx_id;
>   
>   	if (unlikely(len < 1)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
> +		guc_err(guc, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   	ctx_id = msg[0];
> @@ -4568,7 +4563,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	u32 ctx_id;
>   
>   	if (unlikely(len < 2)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
> +		guc_err(guc, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   	ctx_id = msg[0];
> @@ -4580,8 +4575,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	if (unlikely(context_destroyed(ce) ||
>   		     (!context_pending_enable(ce) &&
>   		     !context_pending_disable(ce)))) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Bad context sched_state 0x%x, ctx_id %u\n",
> +		guc_err(guc, "Bad context sched_state 0x%x, ctx_id %u\n",
>   			ce->guc_state.sched_state, ctx_id);
>   		return -EPROTO;
>   	}
> @@ -4669,7 +4663,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {
> -		drm_info(&guc_to_gt(guc)->i915->drm,
> +		guc_info(guc,
>   			 "Ignoring context reset notification of exiting context 0x%04X on %s",
Could unwrap this line now.

>   			 ce->guc_id.id, ce->engine->name);
>   	}
> @@ -4683,7 +4677,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>   	int ctx_id;
>   
>   	if (unlikely(len != 1)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		guc_err(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> @@ -4716,13 +4710,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
>   	u32 status;
>   
>   	if (unlikely(len != 1)) {
> -		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		guc_dbg(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
>   	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
>   	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
> -		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
> +		guc_warn(guc, "G2H-Error capture no space");
Maybe improve the English on this one? "Received 'no space for error 
capture' notification"? Or maybe just "No space for error capture"? I 
don't think you can get a similar error from anywhere on the i915 side.

>   
>   	intel_guc_capture_process(guc);
>   
> @@ -4765,13 +4759,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
>   	struct intel_engine_cs *engine;
> -	struct intel_gt *gt = guc_to_gt(guc);
>   	u8 guc_class, instance;
>   	u32 reason;
>   	unsigned long flags;
>   
>   	if (unlikely(len != 3)) {
> -		drm_err(&gt->i915->drm, "Invalid length %u", len);
> +		guc_err(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> @@ -4781,8 +4774,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   
>   	engine = intel_guc_lookup_engine(guc, guc_class, instance);
>   	if (unlikely(!engine)) {
> -		drm_err(&gt->i915->drm,
> -			"Invalid engine %d:%d", guc_class, instance);
> +		guc_err(guc, "Invalid engine %d:%d", guc_class, instance);
>   		return -EPROTO;
>   	}
>   
> @@ -4790,7 +4782,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	 * This is an unexpected failure of a hardware feature. So, log a real
>   	 * error message not just the informational that comes with the reset.
>   	 */
> -	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
> +	guc_err(guc, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>   		guc_class, instance, engine->name, reason);
Again, redundant 'GuC' string. Also, maybe drop the 'request' given that 
this is a GuC generated reset not a reset request from i915. This 
message has resulted in confused bug reports in the past. So, maybe go 
with just "Engine reset failed on ...".

John.

>   
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> @@ -5342,8 +5334,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   
>   		GEM_BUG_ON(!is_power_of_2(sibling->mask));
>   		if (sibling->mask & ve->base.mask) {
> -			DRM_DEBUG("duplicate %s entry in load balancer\n",
> -				  sibling->name);
> +			guc_dbg(guc, "duplicate %s entry in load balancer\n",
> +				sibling->name);
>   			err = -EINVAL;
>   			goto err_put;
>   		}
> @@ -5352,8 +5344,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   		ve->base.logical_mask |= sibling->logical_mask;
>   
>   		if (n != 0 && ve->base.class != sibling->class) {
> -			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> -				  sibling->class, ve->base.class);
> +			guc_dbg(guc, "invalid mixing of engine class, sibling %d, already %d\n",
> +				sibling->class, ve->base.class);
>   			err = -EINVAL;
>   			goto err_put;
>   		} else if (n == 0) {

