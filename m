Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A880678B0D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CF10E028;
	Mon, 23 Jan 2023 22:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77710E5C7;
 Mon, 23 Jan 2023 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674514270; x=1706050270;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ULbUkvb9TU1lABqFPFjlLZ8QMGupKMGB6xVvB5P+rYw=;
 b=dRk/iY51SVJucvCgmb7cTE8THlJYL4myP1Er491DajBYUAmb+nawJwDI
 Y4YqKKa8zBgiQFnMLlI0ofbTr/7hJi+zMGKTvV2Ol3w2yl2CJaSVQc/TA
 y5ea1hRBUXcWyUxE62p0PTBo7OphINYH2WqAx9+Ys4YV0gTH7eZ7noWCP
 1iYxz79ha7xqZy5g2p+UPlvgQkKmcafcD/tIWrIsUODZbPdSQ3PDcdOZe
 lWERlcEL+GWGL9OlS2tLMRwa2nK3QIeB1E/sYKNtYfaCDocn+KhUKerLc
 whTnkceZhbyZo5Pl1BceuCLKcOhuhJsn0x5FaoP6boEGBcqyfNIcXOe/i A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324852000"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="324852000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 14:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770091455"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="770091455"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 14:51:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:51:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 14:51:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 14:51:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 14:51:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQQzYJ6q2V0CQ6XDY1M+AuhX+vIttbXbJpeVZwRUi/fRZhZBisbZCI4g5GwUAeHCCSlg2LHrkxStbYXMov91aSCgw7R4fQcmPRvMcArZPV03ACe7R3y0dcKfxn89vpHHpGPtxveKlTblLMYqef2ulmhaF4t7o/jPgTWnobYWYEQxmdlvNAyn6k9CZCT9iHBp9hG8OE3xB4OOQuCbAK7v2i4WfSIOrUBqb9zezb9zTfoHWeLEnYffqLRezheeRSPdnxROrAoczUkhtZQP5vycV4h8RDkrs4mDj8W68blQBTOGK0QPIs6Afx0ckNyZkx8k3G9XWE2kLhDZa/8Gbw7fOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMegcHOQLWd6ZXfMuSr7BVzc3KM00KHvqbGGqoc3zSo=;
 b=ZRRCB2+FH/a9iQKDKZp+fi+uGAXUC2kNpIfnI8lC7Kaxx1wISeWbqsvuffFZj6BnwjJcKt76zJF9c5ygqJHzAZ8UBoK9bhvtlzMi87UfWKA8KtyGpFFuBwXOEFp3NfPmtC/Zib3e/oc+xHSWu8Y8P2utyKagM8KE7kEofyktDNbw6z0AtaKzO7gUCqOntr6M74nwcG7h5WxBSewqSkBDelWXmzxa186dZWabnNSuTbAPxw8XTwRnZUZtieo+JJPrbbuHlUugCVWIA/YOAM26uQ7N1CSswsSAFUK/sKcayua8Q2CysvwOzjUuZwBvPPfGAeEYBnaWct2YoPdIC+bXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 22:51:02 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 22:51:01 +0000
Message-ID: <91842c23-e950-faa4-cb3c-eb5a71686731@intel.com>
Date: Mon, 23 Jan 2023 14:50:59 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 3/8] drm/i915/guc: Update GuC messages in intel_guc_ads.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-4-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c7556d-aa60-4e61-9098-08dafd944d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3dc1ba431vSMtTc/R1ly/2qx/GFREdxSTKwEtkDxyav4eOL5T+lq4y0uzwBXGGsgVQeEoL2LQJ2NyCU+y3WPbO1dzgYbrx5aNV6zw+ANLS9SOXgAy96Hag3RsWgUmLUFuAlK+hKB3AA+GfgN6PkbL21VI1XapXKRUMqyIV9awnxTOCzX7uyvxWsq/ClXzGBfgf72jwBFyusRpQMgdE9zTpZmZRdJ8l69cSNdSrWn/YAgU2+3St8mTIIynOY/ORr16Im803I0FICApspOZg5oyntYGmFg09fphGSus5WBCdlA7akB5tknAmgrnqYRiRINejMArDoC4oYwiMU87PYEgq8sdb8axnoqcZk4as5ofSMw0N16zUhKIM1LdemgPQjcGXGxJiCdXPEOvRHakCI6k46TyrzGTo1zpnhEtgx1ypZfoIMolonEEf377YRJl/j0d8un70OSJlZwxG8F+pvFx4BuqNTDkRYf2HST9eLFj7dJweIybuO33C5cKA2trnatfTCeaQGhRbCRR3g8Ay70wh8dFHo78XaFh/h4jRdIHNbaKv63/O3JgppX1F2keY2QERyR4iF4UVzX+IbUgxJsrzL0yjtmbhIwVJOXP6R9epxIEPPyghKXGrs99fjatwbYRdxaoxzTceNbMDzsgHjGqf1QiNA/vJ3cIPJsbQPs8AJxa4tlAnGi3n/b1LPaX9FHDo6DjFOa0c2Y1xfWyqo53w0A8wDSBjAwhzsmGIg2dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(82960400001)(316002)(2616005)(2906002)(36756003)(83380400001)(41300700001)(8936002)(5660300002)(38100700002)(66946007)(66556008)(450100002)(8676002)(66476007)(26005)(6486002)(6506007)(6512007)(186003)(478600001)(31696002)(86362001)(31686004)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEk0ajNLZi9TRWJpRjlDLzVtK3p1NTZNZ3NtNTYydFo1Y1Z0SWRBRnRLZ2h4?=
 =?utf-8?B?TWR1NFA0YWs3b0V4Q2J4NmdPTHZER0JmL2V2dnY4bnNsVVYxcFY4Z1h2KzZ0?=
 =?utf-8?B?VDNRS0VVNzE3MFpZQ0VvUGxTbVBMeTkwZ2JZVnhPN0dud3BPNGNDNkNaMTJs?=
 =?utf-8?B?OUtLbldlaldrdUwySGxWcHVvc0M5dWNFRWJlR2IrK3Q4bXV3dnY5ejUwdS9k?=
 =?utf-8?B?dG1aSEthaGZHSlZ6bWxaUUNTL1RLNVlpZWNrTXRrTkVjQUlQeHEvai9DQm56?=
 =?utf-8?B?cENiUWxyUmpRTENNeXpwNG1uL1BlVnJSczVzdGtrcFFzcitjNUM0dDN6dFJj?=
 =?utf-8?B?MUcrZmxIR3p5b3JHU1BQQ05CeWR6SDkrN0JVWUo0ZzFZVDBWZ0p2R0NnWVBx?=
 =?utf-8?B?cWhWTHlBR3hBeTluUjRqTTBiZW81bmtYWnBDOXJJaWZ3THRkUzdFazJqbkx0?=
 =?utf-8?B?aHhlR1E2VWZXZzltQ0F5bVF3dXg5aFMxWkp3eXpteWNndXJITmZxOEZydlpY?=
 =?utf-8?B?UEthVEFUbFJTdCtsakQxbVhhNVhrSXo5K0E4blhlTXUwMzRybGI2L1BIbDZt?=
 =?utf-8?B?cFllSk41Y2JKcHQ2OXRHc08yT1c4QTYwL0JUNnVMWDhibGg2MmdscngxRTlV?=
 =?utf-8?B?Ulh0eGNwMC90bGNXSFl6SjhNcU5TQXBLTzhOSDJqZjd4M3ZYZGRJUWVWb1lF?=
 =?utf-8?B?NjJVclpQWE1PWHh6WkRGbDkxbmxaQWdSWkVIRDJvZHJrc0djbkJUcGVId2Jr?=
 =?utf-8?B?clhmc0MzMVlTdGg5dTlIQlY2Rjh2ZHBrdk5JdFZuUmZVeUI5MjkzZlhCTVJI?=
 =?utf-8?B?N0lpNmsvVEp0MmNZVldMeXVSL3ZseVFlUVZJYUJUWkVCaWZ0d2xXbTVncStj?=
 =?utf-8?B?NldpU0pRYUtCZGxhVFFRT3dXVE1hTlpKNktrVUVaMTc1LytwWWRzeVdXZG9J?=
 =?utf-8?B?b1BiVXpOWlhaZUFsbE00M09WSGhEMW0zODNrdXBqUThTK0xmYVhqM0E0bHdY?=
 =?utf-8?B?aVVKZUNHWCtjSnlTNi9NRzczRk9iWkRWa0RuOWdMRVZTMldVU255UDlIVW9U?=
 =?utf-8?B?Zm4yYUFLdlkxb2poL3ZvZTdvYW9uOUVFNzk0UnVNb0krbC9BdHpMNHUwUzlj?=
 =?utf-8?B?eFpoY2UyN1EzZHdUcWpYZVkrL2RVbmNsSFU3bTkwcWFacDZybktOWnNGK3Bp?=
 =?utf-8?B?MzZydm5JUEtNdVlyQTR1VmhWOWVYUFkwT014STNkWEFSY291WmJRVU1lODR0?=
 =?utf-8?B?M2h1Z293aCtOWVNuRG5JSkdudDVwQWlZbmZmUlJ4ajdwdTc2ZFFKY0JLSk1t?=
 =?utf-8?B?eGJJMXJDQTBvTklaNjRqM2hGb3RjVkxpNTVUejk5YlNicER3UTBuZ1ErNTJY?=
 =?utf-8?B?VEw5eURzVWFrNllwSk9LQ252b1hpNXJPVzh5SWFBZU96U0gvd3MyZ2VnQ2pQ?=
 =?utf-8?B?OWRJdVgxS1FzN3RVMkM1OXFNMmJxRiszU21kM2kwamViUGJJdEhCZk1BOFBM?=
 =?utf-8?B?NEM3N1R1NUFndmltVTV6SlVhSmR4b3o0ckxCNkFLNEdPSTBvRUZiUW1BM2Fw?=
 =?utf-8?B?WTZvRStxMFdHbEQvSU4vaU9yMW9EL3JJNmdoeDYwa0RrVCtRb3VCMU1MWWxy?=
 =?utf-8?B?M2ZOdmNXcGFqQ1BTaDJPS2JNSE5KeTJFOGlRcTVNK0g1SUtmQkhFY1pQdFBK?=
 =?utf-8?B?SDRxaTAzV21YL2hsV2ZhSGQvdTBUV2VLeXJmK0txYjhNWWk1bnlPa2JjTmtK?=
 =?utf-8?B?aXhLTnIvYWpLa2FmMUxjM2dBbVowbm9aTi8wL2s3djJpMkQ3R1NnbEdPcG5M?=
 =?utf-8?B?V25SeitRU1JhVVZXSkxMblNsQUJMaFZjZnJjSWpJSXYxQ1EzN01uMXNlWTBV?=
 =?utf-8?B?TU9WTmJqWnJWYm8xS0k3KzBCdGYvOXhhMDNxM3F5elpTOEo1aWFFbG15T2k2?=
 =?utf-8?B?UytwTklpd29aQUh0a29zT0h5N3UrdUFsUzlGNG83UnhlV2VuaTd5aXV5K3dV?=
 =?utf-8?B?TWl0dTVYUGZ2WHYvYXlOYmFoU0lhRTlnbyt0Rm9ZRysyVFVrNFRkOWNteDhJ?=
 =?utf-8?B?dElYVmR0c2lHREo0a1RQakhjWDRSU2dYeTJWUE52b0hueUJsSDhRMXQ3OWVl?=
 =?utf-8?B?b3l2dU1PeFhOM2kzaGxrVGF0WUdKemFEU0V0SEpiZXFzR2dNUkxDcmsvMVRO?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c7556d-aa60-4e61-9098-08dafd944d0f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 22:51:01.8386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQPm7b3QVyO4bbOBVQYaIYfZJ/Xi65Vot3JeBxvXUltthEipg04n/2lq8KT06lXJV86ALU088HekudXzRy3ds+LYPBcBPHBg4CiER2D3Qh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index a7f737c4792e..69ce06faf8cd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -15,6 +15,7 @@
>   #include "intel_guc_ads.h"
>   #include "intel_guc_capture.h"
>   #include "intel_guc_fwif.h"
> +#include "intel_guc_print.h"
>   #include "intel_uc.h"
>   #include "i915_drv.h"
>   
> @@ -427,7 +428,7 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
>   
>   	guc->ads_regset = temp_set.storage;
>   
> -	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %zu KB for temporary ADS regset\n",
> +	guc_dbg(guc, "Used %zu KB for temporary ADS regset\n",
>   		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
>   
>   	return total * sizeof(struct guc_mmio_reg);
> @@ -621,7 +622,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   
>   		engine = find_engine_state(gt, engine_class);
>   		if (!engine) {
> -			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
> +			guc_err(guc, "No engine state recorded for class %d!\n",
>   				engine_class);
>   			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
>   			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
> @@ -646,7 +647,6 @@ static int
>   guc_capture_prep_lists(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>   	struct guc_gt_system_info local_info;
>   	struct iosys_map info_map;
> @@ -751,7 +751,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	}
>   
>   	if (guc->ads_capture_size && guc->ads_capture_size != PAGE_ALIGN(total_size))
> -		drm_warn(&i915->drm, "GuC->ADS->Capture alloc size changed from %d to %d\n",
> +		guc_warn(guc, "ADS capture alloc size changed from %d to %d\n",
>   			 guc->ads_capture_size, PAGE_ALIGN(total_size));
>   
>   	return PAGE_ALIGN(total_size);

