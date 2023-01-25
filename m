Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38967A7EF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 01:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF2F10E28A;
	Wed, 25 Jan 2023 00:45:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E003310E0BB;
 Wed, 25 Jan 2023 00:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674607502; x=1706143502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UGVwgambCEnw1CVhn2g5/LQbs4jONekVKiaiOM1INRA=;
 b=EPx8ysrBvD2KDDRuAIMi6dcWbBNjLFNxot4vzAdjWbHt+qU5RwbkJNyg
 NY6Vy74tD+rA9vrPI9NmUlW8AY0MHwhFjINtDefqj/53IZF24wc3XAIr4
 945ALX1RevIuLx0vozYA3YXwBfIOzx8nP8kdd7jpvRaU9oVlqJFurAB1x
 +m4sz12DZCNXZKAmtw0OlFoXzbicD5WxVQArVddV8m6LwblC9X9GALsm2
 v/e5GYV7pqxIjiOW9PLubwjkE8dRciNafkecyEC8cnCQbUIcdj0DS5iJp
 haImHDlfd7p08JmTGq1newMdrbcGg2pnXRGYDEijBNmw5frez0aN+xcv7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412684755"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="412684755"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 16:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655622371"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; d="scan'208";a="655622371"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 24 Jan 2023 16:45:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:45:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 16:45:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 16:45:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 16:45:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcpTWHrUGidKPxhXCdyPygoE2iQ0YgCrca5M4G/n7E0AOkEw1YjdWOnv44RucV6VaKhSZdR09oELdoc4arJpcH6jTCrGvAyCoH/kT482z6gsSw1h1m82HAsOz2gHiNkPzyqmo+/S4oaH+Gc9uijauobKITG0FsYeeWT9Y7i8l/FdH+5cdOrBLhuLGDv3YaPFqF5fZh1Vxdx6aNOWUoW/pw/V9J0jNWjSR/I8kV61R4h+V7wbZHm1rCxos3OE3iv09CCggMSZpIhd1MKNHuwhxnJyE8CHjJGT8aMbDprm6t4TvjVzNjLQRn6RDYtgvyMLJ6vwi/uuIB4EQS///4Q8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85qRThdmUA3X4CMRbIDYoFExISKfWRrcNj0MZIn6a/4=;
 b=d7hCNQd8n38AF/rEzL4Wif1B4d+jSwJ9EahB3tdxHgTY7IN9o2XeRpm3UfHCGKZgXtApfj6rFvOV1O7SdX4m1hF5/PYP+1bpcpB4pe+bTBO1YMr0tQST2UaMbSjq38QvwTLH9KRztsWexGozM/itn++41mxPZODUcwCIeaiaRuz1tvrtTFhefLklKU0KlygmPhz2iwHFvzpNaX7psjtobdqTkz3V3du8rPa2/MgdjMdEVZh+dmd4phpsJYm73hu+I9io+OowTganvP18VExNu0ACQKZZCbYWTFDYgyk4Wzj/Zv1Wwzy5R6rCPDx+pxVWaf63P1iunxgiRFdmM/NmLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:44:54 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%8]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 00:44:53 +0000
Message-ID: <8b79c878-7982-4dba-4399-dc93e5cfae07@intel.com>
Date: Tue, 24 Jan 2023 16:44:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v4 7/7] drm/i915/guc: Rename GuC register
 state capture node to be more obvious
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
 <20230120232831.28177-8-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230120232831.28177-8-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afaa01b-4c56-4b08-2d6f-08dafe6d5f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fIzobKRIK5/B8yB58ANiVbuwaBTsFFUyOW1Nal7QzxeYCVxxxPp9Iur9fkI60KOHlmcR9NX4h43qdoOJJpr+D+HTqAjvauROJMG03BUF0A4gGSj98YpDANxeqM4h8h69L23EKXa5qH7XJ5b3ka0ffdIvJ/JSqK/r0hqDWfm0bGZGY1V8TQlgiTgoRaQvJ+WSrN0QmtKGQCskbyiVBwk+2RctMdbPRgxPI/grV1NYT/ZtZD6djdQ2DvvG2nt5WzXvEODrlJDCuNPeyAm5BIlqfOJ8zqiU9ZAyqvLSn6V40COpgqUaZxMVGu/8gV51FRSH8k0Pwpf9O4L+eREkSTT0ywgvVL8HRob9a/xihZxDhhaMuJfwkp+hdIl4hydt+Wdtcdmov1yTGev48Na9ilglcMAtBkNPyp7Tzjm9YOKMzQ6f9uZKv4BeAh07/4io7KAiwIs40MEU5iPyr3yDhZtJj6JxegIGH4d9pSlaqhAGkEh8eVyzzDxDmEafzwEAWdhG8SvM43UU/DW1vTWb91l7VFgn/f/cZE7KxcEABl3tC1AsTpwJchhG0F3KsEnrTmRqT8ESMxylhAhWyy/TN7q56Fo4y+PEwycUe4F4GrqajxTaetvmRWKMU0ph30SvxRD1p26BLXMy0ay0Kb8dUq0zz4R+8r3u5LnTKq60wTat60k8iNPNCTG6tzaxFkalRuW6Cmq6bu6x8gsaSdS9GH5ZixczTibcVHnQ/XWLT9Bl264=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199018)(316002)(86362001)(36756003)(31696002)(31686004)(82960400001)(66556008)(26005)(2616005)(6512007)(450100002)(478600001)(8676002)(83380400001)(6486002)(66946007)(186003)(53546011)(6506007)(66476007)(38100700002)(5660300002)(2906002)(41300700001)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjZjMlNIeGdINWNzbHorU2lFOVBzNEdEUlFIZWV5aWd6TjNocHFZanNTOUJs?=
 =?utf-8?B?MnhZUXlTVlVDcG4yMzFkb2xBTGFWL3lsOHdqOGtvVkJ1SE0rajF2dUMvZkMx?=
 =?utf-8?B?WXVVYkZlVzNyZDZUekZ4dmZhVUtaRFBkQTNHOUErc1V5R0x3bk40cGd2Sm1x?=
 =?utf-8?B?U3lhd2tsMzQ3dlhudVVhalVyVWtBUGthTnZ2QjZXOUd3a2hEK0E0WXdVZmtr?=
 =?utf-8?B?RDF2cHdIVjZyVSt2eWoxamJTRXFsY2Jsa002VlBqV1BaVXc1dnlCaHdseUxq?=
 =?utf-8?B?ZEt2ZVpsWlRSVXJjcEhZaDNJT2FxbGVaNjlValpMaU1LRklDWVk4QitBMllD?=
 =?utf-8?B?L3p3emg0VzNHQnpLMUtiL3ZNUjdIam4zSCtOL3dUN1NnMFF0YU5uNlFpK0tw?=
 =?utf-8?B?dUd5cklkZTBWdjRiSFgzeFhUNWxJV29kUHBtVWdTZzRaTUJyWGdDLzZCODF2?=
 =?utf-8?B?VHVpZnMwdjQ4cm9YTGx2c0dLeDJ5RjhGMFcva2x3SlJGTEkwbkQ4NGFvYWxU?=
 =?utf-8?B?NUJxUkdPN2Ziem9mdlpIUm4vWGZBRi9FL3ZHZ0xuRnQrZ2pWZTV5MlZ6YlE4?=
 =?utf-8?B?a1JnYVVUS2tER3l0a0wvZlBCTmxGVVZ5cXNtdHNRV1A0MzVFRXJobkZQeDhr?=
 =?utf-8?B?SGlKdzNNWUxSUUxvRXE3cUNLdXpMTlA0Q2E1cXVxMUxFUExZTGVySGVRQWJH?=
 =?utf-8?B?dURsbXhWck9YazBRZzdsZXBpZ0pRRjdIRTZEcXdTTm9ZNUZDRnBmSURtZjRB?=
 =?utf-8?B?OEhJeFJUMTZHanNMdWFkZUp5MmNxMnd5MjQ1U29ESHVHa2lyU2JtQkNybyt3?=
 =?utf-8?B?YU9lZ2MzZnd3MkNhaGQyZ2N6VXpmZUpZSVNrdVZRM2p4SngxTXRSUnNRbHR1?=
 =?utf-8?B?aVIxS0EvL2haV1hoUUcxaDdGYkM3ekorWmNIL0gzMkdidUNvK1U0ZXdHMUJk?=
 =?utf-8?B?eTlBUEU0UzBMNGIxV3B1cUJFUWREZGI2TUVUMC9vaXlmZjVSNkloSnRIL3p0?=
 =?utf-8?B?K3pZZTJFOFdUcWwzbjc3ZHdwcFlnOG1sQzVlMzBQcS9tL3IxNklxRzh2MmxF?=
 =?utf-8?B?ZDltS0ZVdGl6RmVqTmY0Q2NDOUVrc2d0c2drYlp2eFFDbktMMjhMYkdKcnVJ?=
 =?utf-8?B?c0xkQkI3UzRRMVBlNkQxQnJYRFdEdk5XTWVFdHVZM0E0MFJMZDhRczlBLzMr?=
 =?utf-8?B?cEhFNURhN3kzMU1QeUMyalNoS2gvbVBDR2JobmV6T3J3eUd4WUFHNXFJeUg5?=
 =?utf-8?B?clo4b2RnWS94NWRGb3JvUlNCeGtlTWVBVkc4RFRsZG14TnBJVVRkQUpmVkdl?=
 =?utf-8?B?di9KMjlYNnNYckFIMFJnUExkbWRoM0ltZksxT3ViWmluVUtQTmNIeFVOY1Er?=
 =?utf-8?B?TDBUaHQ2NVJJcHdGMUtoTDRKb3BkUFY1aU1SNUZIeCtjVHErVjFWSkIyZEFa?=
 =?utf-8?B?UVgrbUdkNDgwY0RIRVUxNVU3RmtJcGZxNUdoZFc4N3MrK3IxWmx0ZGErb2Vh?=
 =?utf-8?B?QzVOWS9GV3dVaEUyV253TnV1dSt1RWI5bkpBM09BcmkwVE5Ua2cxWTRpODJ4?=
 =?utf-8?B?K21lOFJjU3diQ28xQmJzRXJwbnIrNHhhMzBzd0FhN01lc25zMGNwb3JScm5p?=
 =?utf-8?B?WHREK2NraERTQXZya2ZpWklEQ085ZjJsY1BmbytTWlQ2QjVTV2owMW91VDZW?=
 =?utf-8?B?STIyS25VbnVNU2xIKy8vMzRCZGZOVjZibEhkUENEamFFRXJnQWxYdXVqdGV1?=
 =?utf-8?B?UmdqMXJvRkRMUzNjUXF4dUd1c2d0aEZ2V1BHa2g4OW5vK0ZtZHN3eGRTZURH?=
 =?utf-8?B?bmV2dmd1Nno3emkrMnVKUHE2MDhMdnNnNjhSKytxMU1KcUI5ZHYvdzZtWXJy?=
 =?utf-8?B?aXhabnVLNE5FTWh3V1VuRlpFa1Iwb3AyZXpubWdiZVExRDkwMDE5Z1RLU005?=
 =?utf-8?B?SWgzS3I2aVhOMU1NTVJCMmlOMnpzY2hFTUdYYUh6aU5CbENkQ2JhTUxoTnlv?=
 =?utf-8?B?MFVrY29yUFVZcnBJUmpBN2ZFYWhMdFRPcms1Sk4vK2JXcHJzUDVKbTkrRmdn?=
 =?utf-8?B?cVltVm5OY0NDTytSOUhFRmNueWdkY1JRK1dhdHBFVXZTTzBxdVB4aWg4Q3Ay?=
 =?utf-8?B?N3RQQzRld0h1ZGF2N3JMcVZiZ1dCc0VsczRVUFprOXhpMjkzOXh1bnFzUjNX?=
 =?utf-8?Q?OcLEkBg7yMwBZrBa3d4BAao=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afaa01b-4c56-4b08-2d6f-08dafe6d5f98
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 00:44:53.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3xfE50J1Qr45EFtkMpeXKklxvQ2R6zpwZ30QbL6ysSSulMi0HtD3maHb4VXYSvysBfZoFiQNIP0frROIbi7BkDfpZ0/0pIIhCr/WDLRP6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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



On 1/20/2023 3:28 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The GuC specific register state entry in the error capture object was
> just called 'capture'. Although the companion 'node' entry was called
> 'guc_capture_node'. Rename the base entry to be 'guc_capture' instead
> so that it is a) more consistent and b) more obvious what it is.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 8 ++++----
>   drivers/gpu/drm/i915/i915_gpu_error.h          | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index 1c1b85073b4bd..fc3b994626a4f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -1506,7 +1506,7 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
>   
>   	if (!ebuf || !ee)
>   		return -EINVAL;
> -	cap = ee->capture;
> +	cap = ee->guc_capture;
>   	if (!cap || !ee->engine)
>   		return -ENODEV;
>   
> @@ -1576,8 +1576,8 @@ void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
>   	if (!ee || !ee->guc_capture_node)
>   		return;
>   
> -	guc_capture_add_node_to_cachelist(ee->capture, ee->guc_capture_node);
> -	ee->capture = NULL;
> +	guc_capture_add_node_to_cachelist(ee->guc_capture, ee->guc_capture_node);
> +	ee->guc_capture = NULL;
>   	ee->guc_capture_node = NULL;
>   }
>   
> @@ -1611,7 +1611,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
>   		    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
>   			list_del(&n->link);
>   			ee->guc_capture_node = n;
> -			ee->capture = guc->capture;
> +			ee->guc_capture = guc->capture;
>   			return;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index efc75cc2ffdb9..56027ffbce51f 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -94,7 +94,7 @@ struct intel_engine_coredump {
>   	struct intel_instdone instdone;
>   
>   	/* GuC matched capture-lists info */
> -	struct intel_guc_state_capture *capture;
> +	struct intel_guc_state_capture *guc_capture;
>   	struct __guc_capture_parsed_output *guc_capture_node;
>   
>   	struct i915_gem_context_coredump {

