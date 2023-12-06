Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2788063AD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 01:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0699E10E078;
	Wed,  6 Dec 2023 00:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2D10E078;
 Wed,  6 Dec 2023 00:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701823979; x=1733359979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fp5IGUsCc801shDX4Z7j5Sku3SZ/psVAd8UTHCNujmQ=;
 b=lAwn0S1mN/eCpz/C6WJMJHuwrmKjOGSRz49IKDbzBDMTIjmc1nN0NWC6
 b4o4zE5O2bMAaN1GoDn7xJC+8aREWOFNDZ14eOeDCDtybTHFoIMWYjaYf
 AVdT+zDbLpuKxs2By2rIIhxsNRusy1P0JqDp+6eL4b4562yW3crRlagWx
 KmbCyPHotDicPQLfHYfy3B1FuXmjd0hJ4FyzgmhkvByd4pshy+qygzdVg
 QOz4pYZWL7l85cKWJMsFRttmwty7wgMaF++8YkT4tRDacRMoF8bfAiCbL
 6N5pPJ0vEit8Xlo6lgNRkf4T8D8USZQ5iWA1vQ0AjfieIhG7JrjN2S1/1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480180805"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="480180805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="19152422"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 16:52:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 16:52:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 16:52:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 16:52:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 16:52:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izBeQbkwVNpgpdqv8cW6QrOTeqX4qv/e4OurnCGw/Hi+H+p0ZoJyVRLA2QNWX9NNVLbMblq9ZWDTzPeCf50nJwLq6RFebLRiD55eWMgc1gM/zauqqJ9y80CWCrfKIGb7yfchCVte8HgJdt2H5bZjAGXGreqaq/dpZQCWZDojPhmRhKMhOfdR7DKiKJe45N8vj94cN8p0kNy4lUf9sLXlgFCrPdkRi95yl1bhKTljSHtv7/jqvLEjCuK9OsLJhhT8wdk2btvoF2fnfPduA+nwjtnOzilQ5F3U8emPnovPURlIz6HkqWUHJy5YLL9VchajqLjg+/QMOcujwCsthTpuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuAwlCqZACRi7snOoow6a47b50B0eGxjTxq5GLc8Y3s=;
 b=ALsc82pJ+WxGCVqZnivjDpRW7sJmB3ApYv9ZJvZmAM5i8Wpii4gmN4OeT+WLRmX/R2dEbDS13osQ3nXXfUaiF65GprwReySqiDg5YQlRLKSqClq7T1AiphpiQmjxD8oHmjj8ObXwxIWMtRi2T4gMM9KgGl0PeY8UYLZMtxJPrvvGZz+o4KJUU8R5YCZqgMUbSLAE1gzMb3X0UTX9OZCTJfMukqrwYYe4L/uIAmPnSimiuGjv/wn73M3K9XR8G1dSnzzg0Mp7JyQw6YKeVdGElkyOOB17l0PgvniTNYerXm6CjxV6WTGPa05XuTTCPFHCb+suVJwATqTvApRDTxgG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL1PR11MB5556.namprd11.prod.outlook.com (2603:10b6:208:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 00:52:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 00:52:46 +0000
Message-ID: <f97b550a-b61b-4964-960c-2671fc6e44cf@intel.com>
Date: Tue, 5 Dec 2023 16:52:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915: Use internal class when counting engine
 resets
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
 <20231201122109.729006-2-tvrtko.ursulin@linux.intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231201122109.729006-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL1PR11MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: eb680e50-2a04-4dbe-d84d-08dbf5f5a984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfHhy3/7v/Iu81Pp01HTpGvjZ6AbGvUqR+EqmoMCLRRGnIRpzOwgtWH6vE7WUv/SNnq0VaxaThQRyhgPhCZsSqhFiCRGQt9x5oC1QC4zDib2P+iyz49t9DPErTxJP3Jw/lJ9dK9uRhUSrilTpX4DzWAslDZ8ut6NIA8BaD8gO2NlIZzOHH+3aFW7J/QpkNq22uvv+lrGoh+D4iPjHdwM7V2+xv5x7R+GIi4UQTUJRYgtL/jAyueflZvXP1OSOqRDvoukOQsuuGV8XLNjOyLga2HxSpHE0dU/DGmjiLnomI5HS/EaAZdL8fyYa1kQxt8cqfkku1iYcg8Kv6BWoXJmcQQKoA3jNK/xI0G7pMczaF8FTDICVPd38MQ5R5blhv8GjtJQcTlt47p8KFMvQHe2AxvMYo8AtX+gKUHwEJ1mXSXbKWjM5wxwS4cURtnL6cE6jzob1Yft3wAF5aIh8+ZmGGzdoJE4flF4YnMhpKUoXC6rOoA5C5NVrKBepLGm2aVjiUeY5vD+4qpN9anOxAM2Ux5bhg5rl31j7uo+MvFOICJ7Dby/ypMy3BK4JqfD0m72RM/FprFyFCiOOrWOFw4Al5+LvXevNA/Evz9EPfs2Q095YI/i7OoGTa6xiECPWzt475d9I4Y5dgMZgeIsDj6jAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(66556008)(54906003)(316002)(86362001)(31696002)(8676002)(8936002)(4326008)(66946007)(6486002)(478600001)(41300700001)(36756003)(2906002)(5660300002)(38100700002)(2616005)(6506007)(26005)(6666004)(6512007)(53546011)(83380400001)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTQxYldUSURDZlZTZzNXVWNVTm02b1NOSHZUS1NFQXFLTTRmM0RXcS9jUzZX?=
 =?utf-8?B?d2dTUVhWZUpqL0RGNTN1YkpOQkhiU2Rid1NlK1dqbW1qdmRiYy8ydUJZZEtY?=
 =?utf-8?B?SGFpY0dsVHI5bE1KTFRzZ0lZR2o2Mi9URjdyK0YvK1JCZzNGa2ZEYUhrL3Vh?=
 =?utf-8?B?MWlETVR6WDFmNDROcm9yeWhPRWRuQVZvVlhtRUxhVWJuU3Y5a253V0ZpMFoz?=
 =?utf-8?B?NE4zaHFFR2pRbHJsRllUNERtcjJNLzFRN3hvQW5jc09wRWkxUDQ3WDRiS3RF?=
 =?utf-8?B?L0lvUlQ2NDZrT3lXakt3VXF2Nkkzenllb3RscWg0emRTSkFBV0ZWdzEwRUJF?=
 =?utf-8?B?azZLWmpCT3g5eitTY0hlS0U1UjBNdEdJcjBiZlQ2U2oyb3NGMnpzUFA5ZThE?=
 =?utf-8?B?V0Zlc1JRSlZwSkhTbnNQeS9IWDBIQXE5YVA5SDRzU3pjNmJTV3czOEFzaU5N?=
 =?utf-8?B?eHpFaWcxcTA0UHFrODk0Qk03Wm04bGg2R3VodG1FQTlFcW8rSXl3REtoaWFI?=
 =?utf-8?B?RXFha1pma3NMdStnaWFtYXA1T1ZlYnAvbkVnTzZwNy9zY0NzWGlNTllUWE9O?=
 =?utf-8?B?WUIrYlJ0RjZJOG5YTGV0NnMrOXJwUVlLRzEvUU1nNVJJT1d6UTdjbU5tUmEv?=
 =?utf-8?B?bjVaQmt1Y0tYdU5BZFo5N1dPSFpCUnRQZ1pUNlA3bDd2Q0YzSkRpQmxUdThv?=
 =?utf-8?B?cGdmY3lOdlUwRGY5MGNTVlpKcWYyK2NWaGRSK2NGendEOTIrN3dsQXQ1Z28r?=
 =?utf-8?B?Si9ZOG1lcWhRTVcxUXZqaytSSTVjL3NXZGpwM25MTVJaRHRqbnpIcWhlT2tV?=
 =?utf-8?B?OS9WTTIwMmRlMFpvdXNFTE96a3lSNkZva3M2OTVKclJtcG1OUmZoa2VqVE9k?=
 =?utf-8?B?djB4YTU1QUEwY0EvOUdCQThaeHhZZHNnSnZqb1c0WmY5dnQzeUZneW9tSjlU?=
 =?utf-8?B?NURRL0JoQ1RHRnFVQ0sxY2gvdVJHeXJHT3NkVnFMdGhHUDl3VkZFYUVjcUlN?=
 =?utf-8?B?ck1UMlhZN2M1cFhQM2IyN3gvTXFoU2lJUjJldHRHUWp5d0F0R0Zsc2pqdXVl?=
 =?utf-8?B?QmRsMTRtY2tpalh5WmJXVjl1S2JSYU5GUmtSbFFxdG93SEQwOU5Ic0dZak5S?=
 =?utf-8?B?NENZbC94aTJlSXlDb1c4clFETHgwVFVlcXUzOW9VMzF6Smd5R1pHRVMyVGVN?=
 =?utf-8?B?V0FWTERQVC8yOWtJdWMwRjdROWtlR1JZWjUrU2swTG9RYWs5YVpPNnRrTmxp?=
 =?utf-8?B?ZzI5VjhXTlNDSVRWY2lpQWlzRTdTOEk5bFJNMk43ZzJUbnhPN01jYU1seHMy?=
 =?utf-8?B?MUdNS3AxOStDLzMrZGIzODAyVjkvbnhjVlhiNmhMNGg4dk9FMmlyUExwL1Zx?=
 =?utf-8?B?QUw5dEZVMGZwbjJpdEM1WSt6Mldaa2U3cWJLcDZEOCtyekNnaTFDNklmZjQx?=
 =?utf-8?B?VnhkcENGRi9FL0Uzc3V4UFBiOWJSNTJScWRSSkZBUGxYY0QxSjlxbzVYbnN3?=
 =?utf-8?B?bkZ1TzBHNnQ4aTU2bWZ1YjR4ckdpM0JabzZvK2M5RDBHMDV6aktJbUluSFVk?=
 =?utf-8?B?N2Y2TDMrUWZnVGQ1cXVoN3dHRmxXcnd0bFY4eUl5S2Y1dzgzdHg0a0FWU1U0?=
 =?utf-8?B?clZUQXJRRk1TbEx0RkZGd3R1QXNvRjh3VlROREllaGgzcHQyNlp5ckcxZDJR?=
 =?utf-8?B?RWNjZWd5M2RTMlF5d1FzOGNoUXIvTk5yNGxCT0ZpbTM2blFDSUJURnpDdG1p?=
 =?utf-8?B?TDdEYkFFeHNGcTROOGxzYkdrakNSOGZETy8wd2h5NkpiT2hKT0dzRUdRZ2M1?=
 =?utf-8?B?d3ZoS3B3RTZTS3dEN04rSjJFRkZ1SmxpYXVUTmR0YkV4Um9nWlNrUE8xcG9u?=
 =?utf-8?B?S3l5RzZnbi9wY1RTVVpUWDRKQjBhNzFPZFhlbzBkME55STNNam0xekV6eTl1?=
 =?utf-8?B?d25HWUJWL0dKMHlRSHR2SjdYT0l6U3ZsOUw2SHJhMk90Mk0yNy9ZWTUxVjlq?=
 =?utf-8?B?cWQxNkxYSTh3MCthUnZhS2pMSCtWYkZ3bHY1RW9DWE1OT2ZhZTl1MnIrcXBn?=
 =?utf-8?B?akh3VnA0TytMWUlpOEpkc1U1Qk8ySThEV1hCZE1JOWM5azQ1eUQ1TGc2dFFM?=
 =?utf-8?B?VzVKOHZPVTU2UVBlUlNjN00yRmJWdWJmUXFOM2RmOHIxU0MrVWRYTmRrYmZI?=
 =?utf-8?Q?HTBSJLC0U9Yrw64jiHZCA58=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb680e50-2a04-4dbe-d84d-08dbf5f5a984
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 00:52:46.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bO5w132/v+tssBh9c8VcGV45mLcSgrtHYdU4fqeQhslIo6BQJ7QVHPATlxLLeGvWDL06spM7Mp82OHfsCnXp2VTAIwuwJOuN+KAPemU85VU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5556
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
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2023 4:21 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Commit 503579448db9 ("drm/i915/gsc: Mark internal GSC engine with reserved uabi class")
> made the GSC0 engine not have a valid uabi class and so broke the engine
> reset counting, which in turn was made class based in cb823ed9915b ("drm/i915/gt: Use intel_gt as the primary object for handling resets").
>
> Despite the title and commit text of the latter is not mentioning it (and
> has left the storage array incorrectly sized), tracking by class, despite
> it adding aliasing in hypthotetical multi-tile systems, is handy for
> virtual engines which for instance do not have a valid engine->id.
>
> Therefore we keep that but just change it to use the internal class which
> is always valid. We also add a helper to increment the count, which
> aligns with the existing getter.
>
> What was broken without this fix were out of bounds reads every time a
> reset would happen on the GSC0 engine, or during selftests when storing
> and cross-checking the counts in igt_live_test_begin and
> igt_live_test_end.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 503579448db9 ("drm/i915/gsc: Mark internal GSC engine with reserved uabi class")
> Reported-by: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c             |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 +++--
>   drivers/gpu/drm/i915/i915_gpu_error.h             | 12 ++++++++++--
>   3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index d5ed904f355d..6801f8b95c53 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1293,7 +1293,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>   	if (msg)
>   		drm_notice(&engine->i915->drm,
>   			   "Resetting %s for %s\n", engine->name, msg);
> -	atomic_inc(&engine->i915->gpu_error.reset_engine_count[engine->uabi_class]);
> +	i915_increase_reset_engine_count(&engine->i915->gpu_error, engine);
>   
>   	ret = intel_gt_reset_engine(engine);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 04f8377fd7a3..58ea285c51d4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5003,7 +5003,8 @@ static void capture_error_state(struct intel_guc *guc,
>   			if (match) {
>   				intel_engine_set_hung_context(e, ce);
>   				engine_mask |= e->mask;
> -				atomic_inc(&i915->gpu_error.reset_engine_count[e->uabi_class]);
> +				i915_increase_reset_engine_count(&i915->gpu_error,
> +								 e);
>   			}
>   		}
>   
> @@ -5015,7 +5016,7 @@ static void capture_error_state(struct intel_guc *guc,
>   	} else {
>   		intel_engine_set_hung_context(ce->engine, ce);
>   		engine_mask = ce->engine->mask;
> -		atomic_inc(&i915->gpu_error.reset_engine_count[ce->engine->uabi_class]);
> +		i915_increase_reset_engine_count(&i915->gpu_error, ce->engine);
>   	}
>   
>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
> index fa886620d3f8..7c255bb1c319 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
> @@ -17,6 +17,7 @@
>   #include "display/intel_display_device.h"
>   #include "display/intel_display_params.h"
>   #include "gt/intel_engine.h"
> +#include "gt/intel_engine_types.h"
>   #include "gt/intel_gt_types.h"
>   #include "gt/uc/intel_uc_fw.h"
>   
> @@ -234,7 +235,7 @@ struct i915_gpu_error {
>   	atomic_t reset_count;
>   
>   	/** Number of times an engine has been reset */
> -	atomic_t reset_engine_count[I915_NUM_ENGINES];
> +	atomic_t reset_engine_count[MAX_ENGINE_CLASS];
>   };
>   
>   struct drm_i915_error_state_buf {
> @@ -257,7 +258,14 @@ static inline u32 i915_reset_count(struct i915_gpu_error *error)
>   static inline u32 i915_reset_engine_count(struct i915_gpu_error *error,
>   					  const struct intel_engine_cs *engine)
>   {
> -	return atomic_read(&error->reset_engine_count[engine->uabi_class]);
> +	return atomic_read(&error->reset_engine_count[engine->class]);
> +}
> +
> +static inline void
> +i915_increase_reset_engine_count(struct i915_gpu_error *error,
> +				 const struct intel_engine_cs *engine)
> +{
> +	atomic_inc(&error->reset_engine_count[engine->class]);
>   }
>   
>   #define CORE_DUMP_FLAG_NONE           0x0

