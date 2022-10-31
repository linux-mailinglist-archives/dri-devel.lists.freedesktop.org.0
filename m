Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDC61386C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861E010E2A7;
	Mon, 31 Oct 2022 13:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8CF10E090;
 Mon, 31 Oct 2022 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667224355; x=1698760355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YZkTB95a4AJiCQKw5H1SWqB2tJQXELOQFrae+9agPMY=;
 b=E+1riESdwbG7CJz4WUOinYoCU3g34jjhJ5hY9j1/0aQ4Nu1l5vyHZVQW
 +cDF6uAyxJB+g0+iSChBusAN/0aPo6sZATmheJBxmGk0EVNu3CxRlu9qn
 bt012fTyJwJMXPXw1c3Z6Z+z5rKWSVS+0yMxk6XCXUTbnS8LgwPKSs13o
 HUIcQJb0QvopJiKc2A9UxXxFAhP6wOfVR78gfeqbX3A+cgAlUUJAo+QLX
 xGCVghKHGzGsix7sjEQth6JynemduU1WlSYzc2oXGBa8iUxZkBSbqaNxQ
 MXXt5AK/K6fe5k7Wb320VQcnL19EU9PHdQX/7ht5IK5iAJqhuXGGfZNcQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="370974761"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="370974761"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 06:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="628244731"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="628244731"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 31 Oct 2022 06:52:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 06:52:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 06:52:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 06:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imQSrWicalYUKLXFIxriLsDi5luNrQAfQLEZQJAK5EpNA/pMpTzmrCLUOMUPolTfCvrzpYx1DIy7Izk2qufIqBscvAbhuFDnSxmDqdwWWk4qAJj1dAjTUJQkCgg6BEWFo1MlxtyDZFvadfri4vN9IlDLZ/ylBIgDiVwKZRdSsEd1bkUcaIjkCYQOtKmv1TFvxtLytdgfKwMTqB2ayKjUdKk5GGLcojWyYBYaqqkk3paZgfJXPcF3ledeTxNOsbZC0j7p+MYf3KK9Bp2JgSxTiWKjQqrRIcBynH8A2qref9fd401CVuWThj1SixE9zkI7eHE9ULO8o699+D3jI3a+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onQIgFuN5KrOWW8rzcJ8q78pXn2o6MxwTI8n3BrJEcc=;
 b=EORSRskErygM2aUgXq2ALxm9Qk9EI3znhs2qBCQdBLbPGvbUlr8asLWcUEfOufknVr77DaUX30lS6QOnJVyp9P1nSH/rwoEpc5z/Ekl1h/PeUF3LDM4lN6HKRB0wHmnwtdmi3o+AAdSOwx4d15RrYGQG9zKusnNznl/Tb5wkyE1U+UOHOgqV4aO6O7dFhk9uePMySUhs0U1hRi763BeLq+jZ6AhxFp+du06eptpoaLTeCB1qZT9cZ08fyes+/HE/6olUdjUczChKfxJra6XDi+X7/97mX1cD3XnYvywSYqvFYds8KvBn+nIwk/bukKllZlZ5GOYRU+jUb679rNAxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BN9PR11MB5499.namprd11.prod.outlook.com (2603:10b6:408:104::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 13:52:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf%8]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 13:52:31 +0000
Message-ID: <e8259add-d91e-c620-d6c7-b89cad5a63f7@intel.com>
Date: Mon, 31 Oct 2022 19:22:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/i915/mtl: Add MC6 Wa_14017210380 for SAMedia
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20221028192935.1458271-1-badal.nilawar@intel.com>
 <Y1+aKo29GfuJ/8PS@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Y1+aKo29GfuJ/8PS@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BN9PR11MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c03d4c-fe6a-46ce-21e4-08dabb4727f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xtym3VoDQMyXNKG7+rguazCupvjB9LQ09AlkZEWdTfhb09/e8GRF+zRWtwCvL6KfidfZM9W62vJkx1GCayC+L5sKz0yAHvQ08gYhJVfwhxOI82s/M30qUz6STNAbzognk5Nxp0bJpZAjJlzCoZz7bqd+g1on72+vXsgltHlAfHJl8uBdrQV0JySVf0CEbcSKC/MoUeklCOpPcnFgZYQaIdPqTTNUW39ZOl7HZuq8GqXGumLoGZPHNBlXuXqzA5NTKVzSpOaaO9Fzb87YiBrip3AHBLzTLkma65PLL+WL+dvz9TA2hTFBr5QvRtAmeSL4qcfGwiq/8wnT6rTKmen4kWlgGNn4z3xTz4uSUpIB6dSNuX4KzT8ishfKCdADNaS0Ca7e5RP4+/P8VLNL4xVkUk763V1y1ka2+DEDGpk6wEujOHLuixnEi8nVr7p/37NAXLL+RyKI15pDD8MZGjsGBgMOyTbAWUfl/18QIrRoSKc6bpsVc48j3RoYsJAdpe/FPsKWOUCqcuCrTN4pbAj6hAqJAUx1W/N5DnkinlK/Uo8nyo5Yi1v+K8A+V53Ji/TxxhAhK/WZOVkZIN4r/bJy8uURblnoG7ylSEswmnqqTSMieMa33AREktKf+K9MH8NKyCHJVHk5JxlcwIBjoQrpNVjDQ/UJ76G1zx8xwPCZZ9DgO5hE0MvAyCtDKt2FRFk2O9znthjhjqfv7nvb5NZLvZ2TpNAU4jZWTDTtcpEzGoLJrcvXzvkMgrYqCnLkAXlTfJX6rokZRUHc3/JjvHr6rWwWwJDcQx+YsYeBarWo4tI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(82960400001)(38100700002)(36756003)(86362001)(31696002)(2906002)(6486002)(6666004)(107886003)(478600001)(450100002)(66476007)(8676002)(66556008)(316002)(66946007)(4326008)(8936002)(6636002)(5660300002)(6506007)(41300700001)(186003)(2616005)(26005)(53546011)(6512007)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVUxUm1vbUV0WnpZbVNlVk04N1BEU21PbW1zcGNQbkRtR3J3ZjE1cXdXcFZQ?=
 =?utf-8?B?SVdsMG1pcTVkcmt6OVJmRGlIQ1V5R0lnVStzY3hsdkRNd1VqRjNXeEtRb25R?=
 =?utf-8?B?T0dzZmozTEJ2S3RvVXVHdXU4MG01M2hsS1J4RGZoNGNWeXpyTW8zck1hUXBT?=
 =?utf-8?B?akI5Y1hINmZaY29RQnJ2N3ZJRmtpcHdpMmZmbS9JYTF4ME8zVmFsNVYwU3lo?=
 =?utf-8?B?T0dkL2pZeGdxQkIzQTAvWkYvM0xyQVRxZTFMRzVMRTZrOU4xTTY4NDRCL3JN?=
 =?utf-8?B?bkFlbE40S1hZTTloK3ZKZDdWVzBlbXQ0MWs5NHRsSnZvVmtMNlBzQXZPWkdh?=
 =?utf-8?B?cHM5TGRuMEhkTVJFZUthcExBc3RmVnNCMnBiNXdpT1NucVEwN0s4aEwySVJR?=
 =?utf-8?B?Q2EzVkZ0UnpZVCtaSHBkVlpobUM2akpXQU1rYWFhRy9hVi9GQ0hva2diajdO?=
 =?utf-8?B?MjM2bXV3ZHVCZlBJRCtzclE5U0MrL0FXSUFSSS9BRmJOcHZ4VEh4ZnpLMG0y?=
 =?utf-8?B?bGpaVWFsMGtyWWVoaDFwQ1d4SEc5TU50cUduYjNsbFk5b3J6UDJobXExdDBw?=
 =?utf-8?B?ZTZOYS9NTEhlL0NhT2RFcjhFT0NYRVRMUXNFemtxRnNIVUFyZDRDK0UzNFJB?=
 =?utf-8?B?RFpiSWl2VTFWZm1xWGJ3N3VaMHlpbWs1aEtkS1lPM3A1WS9mYlJiN2M5aWx0?=
 =?utf-8?B?YXI3L1FZR25DMk1tbjA4ZUpoOVprTzh0N0VEL0g3bFJWZ0tYdlB0Z05NeHN2?=
 =?utf-8?B?NGRTVVRodVZjb0dpL3c2cS9qb0cvNHhLQTRvZ3pSK0FXbVBNWmIzUThIcTFr?=
 =?utf-8?B?S3VUUFFpcTEyMjVNVUpic3dhVEVmakhrZnByY0Z3Wk94ZEFLc3c5Y3RYWDVB?=
 =?utf-8?B?RHBNSjA5MFlEOGpoVXhYQkVJYkZ3NkNRakVLZFovbW1XeUpueSttdHJlSm9v?=
 =?utf-8?B?NHpQZTBVSk9XVzFlMjQvT3VMTkVCeUZpdmt6SVRmeUJpWUwxYWxCdTBCSzJ4?=
 =?utf-8?B?VDFoTlcraFpxbzBPdmIvTFZjUldHQ3prblovaWtZdU5ER2dxRkpudXZpQmVw?=
 =?utf-8?B?Ty9TWlhPV0Zhd3NGVjFCaUJ1RDFyRm1QdnNHSHI1R3JtTnIyNjQ0dGxmMkRj?=
 =?utf-8?B?L0hoWFpYSlNwNW5zS2p3ZDRqRW02Vi9Tb01OYzV0MGFQMUJpUUtNeFpUSERj?=
 =?utf-8?B?NFhoRjRCdWJKNVBndXZPN0ZVcUNoRGJpQWtQdXhTd3VXVSt1Q2s0dGxaY0po?=
 =?utf-8?B?dk5BejR3ZXQ2d24wdTNKUHkyYm8yd3Y2THVSY0FRVDBlNEtLaHBBUWQ4amlU?=
 =?utf-8?B?bHlhVjZUbDRSWjhTV01IME9ITEgzMUljcDRBL3dFYkxhc29MbEo0ZHhCOHFH?=
 =?utf-8?B?dGIrNjczOGxBcXNBZENxY25BdkFscjhKcjZpTlIyTkowdzBVVlc5ZHVFcG96?=
 =?utf-8?B?ZEx6aWw2NkpKK2tzQU14VDZqM0pRbVpQMmh5cjRBNm1TQjVDWnJGcFpZRDhG?=
 =?utf-8?B?VnNXL3N1eFJ3Z1JsUitldDhSWE4wZ3hpZEJRVE85VVl2OTltYmhZZHgrWDd0?=
 =?utf-8?B?dkpxdnVrNXk0VkxHczNzMHlEZUpGV1ZQVWdMZGdXOG9jOFZSSFBMQXBrQXdK?=
 =?utf-8?B?WGE0b0tEd0tQMlB1Nm9ZSnFiWFY0TWg1UHM2alM0QjVFRTY0TmJGOFNlT2Qz?=
 =?utf-8?B?dGVXYmE3VW9SMWtWK3FUV0dFVzVnbGc4ZGtUbE1PVUNiSEt2d1VkRFhKTFlM?=
 =?utf-8?B?UGRaZG9md0FMdmJMZWVTcENmak1Ia0RvZ1k4VGlLa08vV2M4eU5ZRlcwaldT?=
 =?utf-8?B?aFNPVG5pVWlkR1BHdDVxRzhlSFJBZjdrR2o1VDNXZXp6Y211dy9TLzNnekZM?=
 =?utf-8?B?ZU9WUHJSdEJRNlpFamZ1dG9RaFVmOEtaZ1VxcndDY2FnNFFUUG1UYVUrMDZx?=
 =?utf-8?B?Y2piWkVtaFBWLzVNbTg3WFpXcERVR0h5a0VZQmhSNTdZK1dhUnMwMENGQ1lp?=
 =?utf-8?B?TFVtTm9LZHAvZkdRZTdEVHBGVjJLdUV1a0IwRERIb1JsWDcwa2crck0rcUwr?=
 =?utf-8?B?dWZSTFVMNmJESDZsazF1bVJxRzdoZTViYXg1WDI2UFB0Y1RqbUdPRnBsLzdl?=
 =?utf-8?B?TFN3OGdjM3dwWnVETWd0QWFKT1IwVXNXWk9McFRzNGNVOW4zaVI4VHhJQXpJ?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c03d4c-fe6a-46ce-21e4-08dabb4727f5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 13:52:31.7856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzYbI1JPf/Iiy1bcCGawGtLhwG1b52mjuq3nD0rVg+2i1i1UGjY9PoHyRdyolJJ4VFuQLKMpOOgA9uPYnO6+jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5499
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
Cc: anshuman.gupta@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 31-10-2022 15:19, Rodrigo Vivi wrote:
> On Sat, Oct 29, 2022 at 12:59:35AM +0530, Badal Nilawar wrote:
>> This workaround is added for Media Tile of MTL A step. It is to help
>> pcode workaround which handles the hardware bug seen on CXL splitter
>> during package C2/C3 transitins due to MC6 entry/exit. As a part of
>> workaround pcode expect kmd to send mailbox message "media busy" when
>> components of Media tile is in use and "media not busy" when not in use.
>> As per workaround description gucrc need to be disabled so enabled
>> host based RC for Media tile.
>>
>> HSD: 14017210380
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 33 +++++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++-
>>   drivers/gpu/drm/i915/i915_drv.h           |  4 +++
>>   drivers/gpu/drm/i915/i915_reg.h           |  9 +++++++
>>   4 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index f553e2173bda..398dbeb298ca 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -19,10 +19,37 @@
>>   #include "intel_rc6.h"
>>   #include "intel_rps.h"
>>   #include "intel_wakeref.h"
>> +#include "intel_pcode.h"
>>   #include "pxp/intel_pxp_pm.h"
>>   
>>   #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
>>   
>> +/*
>> + * Wa_14017210380: mtl
>> + */
>> +
>> +static bool mtl_needs_media_mc6_wa(struct intel_gt *gt)
> 
> +Ashutosh since we recently discussed about the term "MC6".
> 
> in that discussion we have concluded to not introduce a new term
> since it is not used in any kind of spec and might only bring
> more doubts then answers, although "Render" in the media gt
> makes no sense as well.
> 
> In the end, most of the code is common and is called as rc6.
> so we should maybe s/mc6/media_rc6 here?
Sure I will make above change and resend the patch.
> 
> The rest of the patch looks good to me. But we need to check the IGT
> failure on a pm related test that failed... just to be sure.
Failures reported in IGT so far are not related to this change.

Regards,
Badal
> 
>> +{
>> +	return (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>> +		gt->type == GT_MEDIA);
>> +}
>> +
>> +static void mtl_mc6_wa_media_busy(struct intel_gt *gt)
>> +{
>> +	if (mtl_needs_media_mc6_wa(gt))
>> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>> +				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
>> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
>> +}
>> +
>> +static void mtl_mc6_wa_media_not_busy(struct intel_gt *gt)
>> +{
>> +	if (mtl_needs_media_mc6_wa(gt))
>> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>> +				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
>> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
>> +}
>> +
>>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>>   {
>>   	int count = atomic_read(&gt->user_wakeref);
>> @@ -70,6 +97,9 @@ static int __gt_unpark(struct intel_wakeref *wf)
>>   
>>   	GT_TRACE(gt, "\n");
>>   
>> +	/* Wa_14017210380: mtl */
>> +	mtl_mc6_wa_media_busy(gt);
>> +
>>   	/*
>>   	 * It seems that the DMC likes to transition between the DC states a lot
>>   	 * when there are no connected displays (no active power domains) during
>> @@ -119,6 +149,9 @@ static int __gt_park(struct intel_wakeref *wf)
>>   	GEM_BUG_ON(!wakeref);
>>   	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
>>   
>> +	/* Wa_14017210380: mtl */
>> +	mtl_mc6_wa_media_not_busy(gt);
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> index 8f8dd05835c5..cc6356ff84a5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -11,9 +11,20 @@
>>   
>>   static bool __guc_rc_supported(struct intel_guc *guc)
>>   {
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +
>> +	/*
>> +	 * Wa_14017210380: mtl
>> +	 * Do not enable gucrc to avoid additional interrupts which
>> +	 * may disrupt pcode wa.
>> +	 */
>> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
>> +	    gt->type == GT_MEDIA)
>> +		return false;
>> +
>>   	/* GuC RC is unavailable for pre-Gen12 */
>>   	return guc->submission_supported &&
>> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +		GRAPHICS_VER(gt->i915) >= 12;
>>   }
>>   
>>   static bool __guc_rc_selected(struct intel_guc *guc)
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 05b3300cc4ed..659b92382ff2 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>   #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>>   	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
>>   
>> +#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
>> +	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_##variant) && \
>> +	 IS_GRAPHICS_STEP(__i915, since, until))
>> +
>>   /*
>>    * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
>>    * create three variants (G10, G11, and G12) which each have distinct
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 1c0da50c0dc7..abe62cea083d 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -6678,6 +6678,15 @@
>>   /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>   #define     PCODE_MBOX_DOMAIN_NONE		0x0
>>   #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
>> +
>> +/* Wa_14017210380: mtl */
>> +#define   PCODE_MBOX_GT_STATE			0x50
>> +/* sub-commands (param1) */
>> +#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
>> +#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
>> +/* param2 */
>> +#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
>> +
>>   #define GEN6_PCODE_DATA				_MMIO(0x138128)
>>   #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
>>   #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
>> -- 
>> 2.25.1
>>
