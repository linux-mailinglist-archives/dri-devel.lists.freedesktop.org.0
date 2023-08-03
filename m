Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4376DF9B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 07:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112710E0AD;
	Thu,  3 Aug 2023 05:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926CC10E09F;
 Thu,  3 Aug 2023 05:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691039753; x=1722575753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bbn1kkbuuMwUqkNc/mwIbz2OnCM4cPe5j3FOr7fVJek=;
 b=iLqRvnuDhfSLGWEoqZDJSTTw/MsuoEHS1/Egdxvc9H1BZUZSQq/oy9KW
 1KwUmaWFcH7UAfx4FbiWqFx9AhoPRRCNzp2YiEwUQEUUxHgR9C7P/0ttq
 690KmQF+nsBc8f7XEacfcq0BtBxd3L+XpMAfKZlitY16nKxCwG64EG376
 Z9SuhBGyiNoiBgwA7WS1TeeMzJcYk4FPfSuUCh/dX/+lB4Xs7Fl+wwTeb
 sX6QgnqzHjbIovptKWXUxfLug0RUU32gmowMSntX1IyhyDnKaalrKyYYX
 +6TAFpNMa2ZqVMOOj+ODQtOXyDogl0uMf3nuF6FBMtRCBsfuzb0qsRYGY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372505162"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="372505162"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 22:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732612958"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="732612958"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 02 Aug 2023 22:15:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 22:15:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 22:15:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 22:15:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 22:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqJAteE3ekVJ6rRhfWISjIq2GkjWpZnT2HZ7BDWn4ws+VbpTPGmtLSbOQj1WdU6TRM9FHSqSMOfb65eVlTtMqTf006I9KLM8KSKz8zxRfpm/Tl4l44I32InJzzOVKGRdI+JqDCMUrDczEGHyBMaH86Xshb9pBmtjlMwib8gknuUkx3d+pT20XJy8+1rG9f6xcEo3z1FyDVlgobfFkWWPy0b3M3GUqAkGixbYOdIAB3fokjDG9tgg5Iqn53fAtg/NZeiKthWADUs5i0L4fXJskhC7ZPgWYRknUycsf8KifbUwCxWuRhbhldD0kpgRrlkZvIIjlKjPL2WjZt9hgwwjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXjTdchtuZJqay6zPMM76XwsFTu1AawYyUEW36mTwTw=;
 b=UqEnz9dc8zP/aVGlf1O9mjdKCBEfdgQJcb/IMotnRn22D69qMQercK4P1ZCLf+dOmoYtfRZt81qgGABFnQ9WL2BEhyI40Ml1HCsc/isOnmU49PKuqxOW24dEsMvPSfwjm2Ft7hBrM04alH+8Tlc3NcbEENUd3Jmz3p7CU8B2kyTi/fiWqgqRfaSmtuF6XWJxjlhW0sckDfq8I5wUfLCx8rW28uupMLd01UsW4YzzgX0ML+zwj5xvW6Iba5AfkRGsKSAYLZPjpn2hb3jVacouL9IbgGImPb5ftKuwkmh2ENuElDyLDLm3gWcYPDJMWqYtOfsIpVbfRQbevBbwBZqfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 05:15:49 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 05:15:49 +0000
Message-ID: <fffae148-a609-4f1d-eae4-dbe253f43650@intel.com>
Date: Thu, 3 Aug 2023 10:45:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] drm/i915: Implement fdinfo memory stats printing
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230727101352.1899466-1-tvrtko.ursulin@linux.intel.com>
 <20230727101352.1899466-6-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230727101352.1899466-6-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::19) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH7PR11MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 21934ce5-5875-42c5-aee1-08db93e0b301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtqNmcqHEDwc+gdMyFKlqWFWJ/xBT3BBMayfDXSVvWDWu3eTxov+oAG7xta/Q7ed/sxbd1OfUg6U8MYR7Qocz0VaYgvNZRWwian+GCD2lJBv/NaDYygsDpj9dztwbIAypx8ZSxmrtzvuBmCCzUJY1bw63ftRL2OgEHmZdbtljlXd7NNxombDFjjw1R4HzZ3r/w2imtvC0R8Erwyw+Ylfif61t6yN7rkyHdvKR7G6W17RgBHVQrKXOv9g/48+0WUqYO1l7K8+2wBIxOcA697BlWBqB+zwPcx32scgAY4QrUQOmT/zvH9fvjoqdA6JFyZ3DddBqpo4PhEngCDiRw/wLwQpsp0hgeJLyydkCcR0SHfKgyEwNPoL06gIlhOh8/vVjwV6c5P0nhkdYoftuoxu8FetvpJkpyprRelSj/FurIA9nxIRv56oQpZs+c1rtdsXgVq6VbQZ3CZlSRorGyiB3Dw5SdvzOmR0eivP0Ju4WKwAY39C+Txge7SVc6QgdIAmjO7wrwLJRmFtUPA8Sd0aKcoLGjN0p2AToBJTxDNYWzjBoQn7HcDnlYEJy+vwwY6AvFWZhWWemG7WQjHbjyInNamdTg/I+SCqTTAyHtks187Sxy4gRYYnVxv8Fnze07tOt4uNfk2OK2xbm+eWOWa4eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(83380400001)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(6666004)(6486002)(6512007)(478600001)(54906003)(38100700002)(82960400001)(36756003)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzNLdEdJVW9sMUxlbDF2T2sxSncraTNoYk9yYXNyNEtQS1Y0eFppVzB5MHRN?=
 =?utf-8?B?WXFVRjkrbWdIYkw5MXhBRXRZMHdmdDlPK3RwVnhwOTkzRXNZaUpIc2ZTZEUv?=
 =?utf-8?B?YXFJSU8zdDdaMENnbzRxRmtML0VhcXZaT1BVQzg0YVUvaktDMXdoaWNTVTlr?=
 =?utf-8?B?NEVzT1RETjNwL0h3VjU2ak5TSWw0Qko4VEtKOFNDV2ROZk90YzdRaVZOeml3?=
 =?utf-8?B?cjZSSnNhNnBGK0xLY1QwSDE2L3p4clV2eG1JOHI2Uml3U1dtVlJ5UUh0bUNG?=
 =?utf-8?B?eXhQaHI2YWszaVlIdnNrcG5WcmQ3R1NZSnpFczFodm5ZTDJTTDllWWs3ckZt?=
 =?utf-8?B?U09GNW1ydGN2Y1h6MXZVQmdRY1BMU0s3SmxhTERsNndLOVgrMG84ZnA5eW9y?=
 =?utf-8?B?dzFWbkxjSGN3cVNXb2tUUWppOTY5eW5UVWJNTVZqTm9KcmV3cGVuL2luQkUw?=
 =?utf-8?B?a3ZlamZhYnhUcHF6Nm1TdjB2ZC96aG9jTXdUZzZZV0dYWjJPOHJ4dmRmcDRh?=
 =?utf-8?B?bWJocFdwSEJpS1g5cmtyU3hWcE0vUy8zdUJRQkxpMk5wNm5ya2YzY0kxMHE2?=
 =?utf-8?B?UmE2QzBvRWs1N2hrMHIweGlqcmhjdVFlaDgvY3RuR0VpNmJNNSs0UlN5SzVz?=
 =?utf-8?B?VkpOelFOM2RkNUh2ZEcyQVpjS3NKRFhNUTZlMisvWHVMUmhzUmxBeDBHYlZY?=
 =?utf-8?B?VlJSTW9McXVYY21kQndaa3dreU50ZFIzWDNwaEJTOFRIOUdLVzh2Y2U3S0t5?=
 =?utf-8?B?QXhoVjlMK0tKY3BZdHdzQno2V0NVQjZHNmZwWDM0QUlCT21lN1phb0gyd0FF?=
 =?utf-8?B?bURrT1BFd09JdDZEL3MxcG5WNXZHV003U0xsc2JVQ203NXZiTVN2WFFvVFBo?=
 =?utf-8?B?Z1pDeldpbHdleGNWTGRLaDRtR01SM2psNnRuVVhtcTlGcVJ3ZlNhRXZDQlVI?=
 =?utf-8?B?ejY4bC9rWlBIa2FIZnliRkFJc3c3amoxdEJDa0ZKVVdoOE1TNndBTlg2ZkFT?=
 =?utf-8?B?dUlOK0lOR3JWWHVidDBZbnNPMkpjUXhuckw4ZVlVSzhFdDZDN01GV3pXWjNG?=
 =?utf-8?B?OXd5c3BUdlk4MkVrRGdYbXo1ZjdTVnM1NVdxeGFEdnkweXU0Sm5ZYTVLekVs?=
 =?utf-8?B?UFZrcmsrVTBLVnZQNW1mZDlIVTZlTkxwa2pkazVqUTJ2YU1uUUlMSlc2ajZN?=
 =?utf-8?B?UjVEeHB4TFpvcnM2TmNQSUZhRk9tN2RLY0R5K00zUU5sWmNidTBuRFRDdEpM?=
 =?utf-8?B?L1ZDRkw1aWMvSlVNS05SNlZxTjFEZnQybk9tM3BHRFVIYm5KRG16NUtmMTZj?=
 =?utf-8?B?L25TZlludGtRM0hTVVg5MEJCbUpSN1lGamdvMUJkNUJ3YTgrbnY0Z0J4UnRO?=
 =?utf-8?B?U3FaaDJ6RzBBMzM5T0lZSlV1cWRzc1FncmJ5VFc4VUY1cDJwT0cyMXFxcWln?=
 =?utf-8?B?RnozRERRN2dsSXZrOUxQcEtmYTZ5azl5WGZ0T1V3Y1NJaEx5emQzWTNEeTRT?=
 =?utf-8?B?aFZyU0FGTzQ2Z3dRVkpqSXpMdktUNXhlN1RDTGd6QWI2VHUrRE1vQzJxelZV?=
 =?utf-8?B?b1hDZXNSYVZGdTZNWDFTclVyblhUY0w2WUl0V0Jyd2xReGFBSVFxZSt6VTJS?=
 =?utf-8?B?bmE4eW93Y3EvMCtYMEw4a3RoN3pPU0F6OXhWWmlHSlVXTVpGamtyL0VVZno3?=
 =?utf-8?B?dlV3dC83SkZndXJ4QjNLUW5xZ1p4RTNaMU1VUFE1UExmZGV0SWdtY1lNUTlt?=
 =?utf-8?B?K3NqMmlBQ0x1RGZrcXlEVTUxTGQ4a1FTTlo4bDBmanZJUXFLbTJiWFZ4bVR2?=
 =?utf-8?B?RDRheGRhTWROeU9DUFI5ays0Ui9USFcwK1F4eTAwK3d5TWtwVjNsWWtPMU4x?=
 =?utf-8?B?VDZ2NUhWYTF3WjJjZVRTc2xVOU9yY242MEorZm9HMDYvcVFCakpmTUZhWHdH?=
 =?utf-8?B?NStEU1VPS0YzYmRWYkVUbjF5OU80YWZCUFQzTDMxTWFRUlpJdnRlR2YzMkdK?=
 =?utf-8?B?ejAyUTA5ZXJQM2FkdkM4bkRqUWZWWXJiMlRoZWI4MkRXQWNwRFZFRFFhcmxt?=
 =?utf-8?B?RGRGYnRtaVEyQ2tFRFJPb29yUlAvVEhPMjZkMmF6R0oxOVdMMG9tV0NlRmQ2?=
 =?utf-8?B?YTlIeVNBNlFzMnhTN09IcmhaTDRzOGJNalpUWEkvc0Y2elhnRUZaS2cyOGZm?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21934ce5-5875-42c5-aee1-08db93e0b301
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 05:15:49.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhSuJ6fXrKl16ikKGJJhKLeHkEGNjEbwmL2z8bkSfTXv/kUKXt5liD5qxQRLCQzRnJ3ei1VguSxE0sNaWR1B0siNBH/yNXSKBozgvIZhrEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27-07-2023 15:43, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
> 
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
> 
> Objects with multiple possible placements are reported in multiple
> regions for total and shared sizes, while other categories are
> counted only for the currently active region.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 85 ++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index a61356012df8..9e7a6075ee25 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -45,6 +45,89 @@ void __i915_drm_client_free(struct kref *kref)
>  }
>  
>  #ifdef CONFIG_PROC_FS
> +static void
> +obj_meminfo(struct drm_i915_gem_object *obj,
> +	    struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
> +{
> +	struct intel_memory_region *mr;
> +	u64 sz = obj->base.size;
> +	enum intel_region_id id;
> +	unsigned int i;
> +
> +	/* Attribute size and shared to all possible memory regions. */
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		mr = obj->mm.placements[i];
> +		id = mr->id;
> +
> +		if (obj->base.handle_count > 1)
> +			stats[id].shared += sz;
> +		else
> +			stats[id].private += sz;
> +	}
> +
> +	/* Attribute other categories to only the current region. */
> +	mr = obj->mm.region;
> +	if (mr)
> +		id = mr->id;
> +	else
> +		id = INTEL_REGION_SMEM;
> +
> +	if (!obj->mm.n_placements) {

I guess we do not expect to have n_placements set to public objects, is
that right?

Thanks,
Aravind.
> +		if (obj->base.handle_count > 1)
> +			stats[id].shared += sz;
> +		else
> +			stats[id].private += sz;
> +	}
> +
> +	if (i915_gem_object_has_pages(obj)) {
> +		stats[id].resident += sz;
> +
> +		if (!dma_resv_test_signaled(obj->base.resv,
> +					    dma_resv_usage_rw(true)))
> +			stats[id].active += sz;
> +		else if (i915_gem_object_is_shrinkable(obj) &&
> +			 obj->mm.madv == I915_MADV_DONTNEED)
> +			stats[id].purgeable += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
> +	struct drm_i915_file_private *fpriv = file->driver_priv;
> +	struct i915_drm_client *client = fpriv->client;
> +	struct drm_i915_private *i915 = fpriv->i915;
> +	struct drm_i915_gem_object *obj;
> +	struct intel_memory_region *mr;
> +	struct list_head *pos;
> +	unsigned int id;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, obj, id)
> +		obj_meminfo(obj, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->objects_list) {
> +		obj = i915_gem_object_get_rcu(list_entry(pos, typeof(*obj),
> +							 client_link));
> +		if (!obj)
> +			continue;
> +		obj_meminfo(obj, stats);
> +		i915_gem_object_put(obj);
> +	}
> +	rcu_read_unlock();
> +
> +	for_each_memory_region(mr, i915, id)
> +		drm_print_memory_stats(p,
> +				       &stats[id],
> +				       DRM_GEM_OBJECT_RESIDENT |
> +				       DRM_GEM_OBJECT_PURGEABLE,
> +				       mr->name);
> +}
> +
>  static const char * const uabi_class_names[] = {
>  	[I915_ENGINE_CLASS_RENDER] = "render",
>  	[I915_ENGINE_CLASS_COPY] = "copy",
> @@ -106,6 +189,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	 * ******************************************************************
>  	 */
>  
> +	show_meminfo(p, file);
> +
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>



