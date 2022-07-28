Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF9E58372B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04810F3A7;
	Thu, 28 Jul 2022 02:46:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7B10E8D8;
 Thu, 28 Jul 2022 02:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976378; x=1690512378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XHFIpKW0uRm6lzznTHg7Xc50KHoRJ7mgTkGYvAViU8U=;
 b=S7rSfvuaWIrvXJIaTMyJxHqkdnGpQBUIPqCFcNHKyBfMziCghc/KIFpt
 Q9UXfEFlv5qhHtdMvWwqQ7Opvkd+9l1uSRjhwK6ASR1X8aBK0zSzbCmJh
 Lw2frZfUCAAe/qIwP+Rl/dZBvCv2775rjO55i/1ZtOIwDNTOhi2QNezrd
 dCiuAoc7ZhtRQjvhW0u92Mr25/BC4pv7IIsNhZkO3O0oqrSVAmOo7WJlw
 P/Lm22mfiVD3oUc4kUBu3xU90NWA14jAhEsVUNwiiJWnDLa+S5nmvKHvo
 2VtdOvqKw9zIzOqvM81inXgaR8N9Ec+zg2Cw2iHaodgKU8nRZj1kK/Nb3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285950834"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285950834"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="633448173"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2022 19:46:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 19:46:17 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 19:46:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 19:46:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 19:46:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PD/jRGpIem4WkKPsqamvMP+yISGCSEvGLYzeX5hYE/LxXc8+D7PIXfhvZSOHUG/9Ebu5xdGFgggSfmLpWl9Anc/Bb7ajGH+QIGL/6r7YVLMjiMQAmgrCnvGNUn+YX6DhC9QaTw26e6MEZk1dQwQkLo0FbdlMnID566wOi+aylPxWyKuGLlCo4JjxpcZL6ldvdIcHus+VD6CNJpS7RuAkDIsZeJgr3ZOtcbuKwexYfy3HYv15PfKK0mjuzKfZjgnMod6Mlk6pFypZUvRjWbW4jNQOkHo28YZLUffS8F440GkJQ1jC6eqWRMz8ZYmtzag2x5m0A+/l9G9opIxFrCL9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEiO4iExs17D41e/qUnahO4yy7PbT6yRxFfC1Ca6p6Y=;
 b=N4tefubXQO9lk3sWB3ShTVoam2PpdMltSw8wR+R/j05zqURpbchQS9Gr1OIpVPw04Yc5tFuDtQY2L73OYq234QZKPrUM94AwYhjgE15bJ4pOQQNHgKBCmHOj3a0hDdDe9Do/uDeo8h9q7Tbre1+csFqtem/J/bMxhh9tWlxS8bj/wvkQnM8J0Ew86NyoJCJM9/fVt2jdFjysMSNEw0OVAaWdvHc812p1A0d6UEw9KXvhWtP664cyeajt9k7oHoaY4XFQUpjdjkhj+UBLswMooqlDoLi+1eSzH0FjrO0rFEnbu97qFTHu6R9y7Ual0F8aHByJCg+b1EwZB/8C2Ack5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY4PR11MB1959.namprd11.prod.outlook.com (2603:10b6:903:122::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.21; Thu, 28 Jul
 2022 02:46:07 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 02:46:07 +0000
Message-ID: <aa5e66b3-c919-d454-6e93-26f9a9e535e4@intel.com>
Date: Wed, 27 Jul 2022 19:46:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] drm/i915/guc: Support larger contexts on newer
 hardware
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
 <20220728024225.2363663-6-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220728024225.2363663-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23ab76c0-4e62-4fc4-a172-08da70435240
X-MS-TrafficTypeDiagnostic: CY4PR11MB1959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAEb2aDQs/KwG7SKqUYvmuok9NNzkz6ZQjTLmTcfvfZKun9BGq+OeA9PyEyJdVYXghuo83zD/pdEvS2m+zLw9xi0mFbDn8ZYczYRIx+AZgriwt0H0WeOpQbS70kdT+nUDk926KeSiBwTw15TGwFAXuLc0+pr/mt2WCxuFTud5LswZsK4sJMhLGM2n/fATQuqKDHTOUW0KPE0IJdYIZpUICQkFwPlkQ3yftp3NyNR9PP+T5W525RuNpOd26M5XLMhhFPOmgTYvak1y05PoCobfKZBrZq1SzbQIxaV0FTQTl+hORUUmLnGVD+As9foA+NtTi6b/l0FWGPH6Rp7IiGJSw/NWqcpysgnR5G2E201o/O2UIOeTnzt+ZkwDcF828+UexlJXkog14dXedkgLV7L54L9lyY5MgePLY7zBs2R86yB6FTvxrpcEvREQ6q+1MzHL3PF6KC4pP6zQZNqXDNa/vYEcPuVXRXsZxB4S6O46QdHTp65jmj+D9qs6ewkzKHYwSoJFMTRZkOeJudcASgzHl1bsM67waTKQ5n+SLjSGokL9MBR/OFQY+chOrglhE9CRyc7hjPzanN59aO/Kv2gFNC5O6tGJVPWFtsOyuWIjizsA3cZHjev9uavaPuPP2BTUMHkeW/IexT0SU1nEPw9Ahd6MiE4LV9SX0uHZ4i8fpkODRJjJrfpzcj7OxMXgOpOUQYT0FfO/PNxXXK0tU+40MPGTn9jYDyxSTQ9bdGzjQvb+c5THbE1l55q0nEV5X+QBJACypAH+b6he/hQQGNq/01Z/JdJYE7y07+hhNnNStKAqmCI5zB8lmxtzQTuyV4+XzrkoaqcOQtBqI2BFNKymQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(39860400002)(366004)(396003)(82960400001)(6506007)(8936002)(41300700001)(38100700002)(86362001)(5660300002)(31686004)(83380400001)(31696002)(36756003)(186003)(478600001)(107886003)(53546011)(4326008)(66476007)(8676002)(6916009)(6486002)(66946007)(66556008)(26005)(2616005)(450100002)(316002)(2906002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtZd09hZ2J2dW5HUXhpMkRRZHlGdmNQeUdUMmJ5c3IzeHk5dkluRSsvVk1E?=
 =?utf-8?B?VkdPTVRKYW9QU1RDeTZSQ0NQWCtEY0xKMkVtblRwTnNnbW1oOUo5L05RVzhu?=
 =?utf-8?B?MkJlZVBZTEFlMHpkRVMwY3IweThycndZRzAxSmVlNFNRQmNwdlh5dGh5NmRj?=
 =?utf-8?B?MmlEZ0tqTnRRUVYzbHpJSC9mcEgzZ2xHaUhzTyttZEc5dFcwbnRFaUJZWmlv?=
 =?utf-8?B?MTR0YmtvdjE1Z3dEUFNHbXNUYTB6alpsRHlPREd2SUhsL1VDSWxiR3psL3FP?=
 =?utf-8?B?MmpUVlhBWGFOeUR3MndSUjJIMUh2aTkvdGxIUFQxVU1XVVhGZW5ySiswVEcz?=
 =?utf-8?B?MXlrV2hUUXZBaTJXczNyOGRsczFRVmRCWFlONVdpV2srMENOUDlXakNSeHRq?=
 =?utf-8?B?ZnVyeHJhY29Hc3dWRXFaQjcvdUs4OUJaWWVvU1d4ZE9IdWYxSmNKN2lkN2FL?=
 =?utf-8?B?MFdaTC9WUVFYYW5xTGZ2QjBkbGdzempWRW1HQ1JhMmZiVzNBNjl5RHZPSEZX?=
 =?utf-8?B?WG5NSkVoSFFsdkd6NHJZS21CeG1DeTd2Zno3R1JJVmR6N3Y4ZzhDdzQxT2hS?=
 =?utf-8?B?cUJ5RlYvekxTelZaNU10Z21MU1lLa0YvRjBETTZMZkVvdERvOENxOWVqZEhK?=
 =?utf-8?B?Nm9RV1FwYkV6a0V6dm12RjdVQklEdzZ4czUvNkM2bXZDT0xROVlXNXhMdDJC?=
 =?utf-8?B?Y2NadGl1Q1hhYkdLTXpScXhHalc4bGdWdXo3TDVCbVU0SEU4QXh5RWozUjBi?=
 =?utf-8?B?elNBalV3NHlQeGhFM2tHbytLU28wQkdlcENXNHZ2Ny9Vejdub1RML09hcWNw?=
 =?utf-8?B?SWlxcDJkTHFTM0Qyd01oblNwNkl4NDN1M040RWQxRDVJcUVXbU1NN3g4Tlli?=
 =?utf-8?B?aEtuRzNGNjFKMDZJSG9yOVRocGNOZ245TGtNVzh3N0FISkQzQ2R6QldWU3NW?=
 =?utf-8?B?OGdTY1VKYSt4MEJGMjhUakUrVGlDQjVta3dPcC85S2dCbDdWZjJtMGZHU1hF?=
 =?utf-8?B?c1RXY0NtL20yYlRrSnRyRVhjM2QvN081OVdHNS9yOE8zTWExYXJWYmc3TWZE?=
 =?utf-8?B?VzNnY3ZteFFXczJiNGp1N3BhNTloaDNwL21hL1lMbnJBTDhpdjd3SHdSQWU5?=
 =?utf-8?B?VWpYaksrOW1FOE1yREJ3bnRqeEMvNTFLektYL2ZMazhYc3h5RkVaRTdPQXBZ?=
 =?utf-8?B?SU1IQ0ttVS9uS2JFQk9OSzVyVERjdlBnY0tGakdWRjdwVmxXSVloMkRFbWE1?=
 =?utf-8?B?ME4yelQrMXV5YkpsNnBmZjFJT1dkWTh0bXV6RmVxZ2Q3OWEyeWNrVTRESkhs?=
 =?utf-8?B?SWJPVEtSZkpmcFE5SVN5bFZUa0JxL3lkYktoYnI3N1lZZWFybkJIME1Cbm9K?=
 =?utf-8?B?SHk1Vkk5QzJRR1Y2VS8rREc0WExvL3FEWWF4M05SNDJsaTJsR1RnNmlKLzZD?=
 =?utf-8?B?WENUbk9EM0d6N25IMHA2VmVEbkZkY0NqcEc2eHNlemhuVmI3Vjh2T3hIdDdS?=
 =?utf-8?B?T2tvRW0wakJEaHgrUjZYOE00S2hTU1l5NytuMGM1akI4eFpxS0hsNU1BVk00?=
 =?utf-8?B?WER2ajZtcDZrRk43dUVpb0k5a09wTUpXTWdnNnlTNWFxbW1XMkMxU0ROamlK?=
 =?utf-8?B?elpZWVpVSHFHd1hKQVhWVVJIYi9qR3BSd0xueVh5d01ocFhrUjJvR1JmQWph?=
 =?utf-8?B?SGUwK3lxRTZ4MEwyVENoMzBUWDdrWXVqMmV4c25wU0kwcERIOVRKMHJXa3NJ?=
 =?utf-8?B?U09xYlZVd3dQdmtMa2pUdzZGNHlJRWh2L2JaOUNxS2VSTFA5V2Z0OXNlUTBq?=
 =?utf-8?B?Wk5yTUl1bFZUeWxaTUFkRjJkeEc0WjZaYmkrZnZMMUFiMkRVcXBEU0Ivd1RJ?=
 =?utf-8?B?L0V5SzZiUWlRVUd4ekFpTWlkRnlMOGZBeEVSWUhkbTU1bG12SG00bG9jV3hP?=
 =?utf-8?B?VVFkZ2pzMjczQXMyb0I2SWJWWUZSN0lkUHZpZTZMbXBPZ2FnNEcxeUFqcGJG?=
 =?utf-8?B?Z0R3Q3FQS2lMclVsUFhkdVhMald1ZGtpUUhGU0ZvOFEyQ01CM3hDcGlOeENH?=
 =?utf-8?B?R1lHWFVrVnd2d0Q3TjBwK2xmM2cvUzdQTThNVjJMZzB5dU5FV0dDRGs2MlIw?=
 =?utf-8?B?REt2akZjRXRpT2xETHc1QUlrMk0wUFdONmxEMXZjRUtkQWYvY3RtSVAzV1JR?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ab76c0-4e62-4fc4-a172-08da70435240
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 02:46:07.2371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMj4w4rDLYvsg/En0kJSrhCGvlXfTuGPc8Vug5xEaszeSd2sR1xo2PUdIYdlrVwI7m9/QW7HJBEwEtUsaooE9Hy62u9IieVOnCrgXEZkGHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1959
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
Cc: Matthew Brost <matthew.brost@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/2022 19:42, John.C.Harrison@Intel.com wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> The GuC needs a copy of a golden context for implementing watchdog
> resets (aka media resets). This context is larger on newer platforms.
> So adjust the size being allocated/copied accordingly.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index ba7541f3ca610..74cbe8eaf5318 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -464,7 +464,11 @@ static void fill_engine_enable_masks(struct intel_gt *gt,
>   }
>   
>   #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
> -#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
> +#define XEHP_LR_HW_CONTEXT_SIZE (96 * sizeof(u32))
> +#define LR_HW_CONTEXT_SZ(i915) (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) ? \
> +				    XEHP_LR_HW_CONTEXT_SIZE : \
> +				    LR_HW_CONTEXT_SIZE)
> +#define LRC_SKIP_SIZE(i915) (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SZ(i915))
>   static int guc_prep_golden_context(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -525,7 +529,7 @@ static int guc_prep_golden_context(struct intel_guc *guc)
>   		 * on all engines).
>   		 */
>   		ads_blob_write(guc, ads.eng_state_size[guc_class],
> -			       real_size - LRC_SKIP_SIZE);
> +			       real_size - LRC_SKIP_SIZE(gt->i915));
>   		ads_blob_write(guc, ads.golden_context_lrca[guc_class],
>   			       addr_ggtt);
>   
> @@ -599,7 +603,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
>   		}
>   
>   		GEM_BUG_ON(ads_blob_read(guc, ads.eng_state_size[guc_class]) !=
> -			   real_size - LRC_SKIP_SIZE);
> +			   real_size - LRC_SKIP_SIZE(gt->i915));
>   		GEM_BUG_ON(ads_blob_read(guc, ads.golden_context_lrca[guc_class]) != addr_ggtt);
>   
>   		addr_ggtt += alloc_size;

