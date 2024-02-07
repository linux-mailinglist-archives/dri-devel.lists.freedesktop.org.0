Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531E84D0E3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD4210E796;
	Wed,  7 Feb 2024 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N50SeaN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2110E5C1;
 Wed,  7 Feb 2024 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707329577; x=1738865577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0WHYNlG1Sa3U8tpisSNlANmmpdw/2lHkO2pEXBDE4Sc=;
 b=N50SeaN2j+rrJ+DVliVaCofUcKMUvzbKUQqfdUnWyoesqBwm7IIStD84
 G5Eeeg+RyFdT1OSRWJmKshPR8GvSfSv/SGTMxUIgivTPkDRIBrdqc75B4
 e8dG65/oji/DyTeYd8Sr8aOHz7FstIaU9QzhemU87GGxMG8XiDnz2xpgq
 NEzQvMpdmu776oMgXr8KmujJsoOreuNMFrVHMmmThVCTlNWzQ9dP07kK5
 AHICUZE8RriMKtk84Kh9UovThg2sXosdPyXUaryITkAWJsr6hYtnQZQcz
 bhMUrYSek/PK3OA+dGgJW22q+uxfVUYgqQtlfN7nAeXu7N9mVPxkorNqK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12407020"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="12407020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6041240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 10:12:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 10:12:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 10:12:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 10:12:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 10:12:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDrXTcZjtnEVlNqw76YMcMouWvj84TMnHju0JqmU1i0PgM5OBfzBLPQysJkq7YFDFEbeq9qCy5HfucFOa5y5Gj0bONlugST5fc/SPeHxbh8WACuFXPXXsJnWYXENS1dN1eCOjo5pDcv5GRFhnDX5hA/NO/HpClivVDiz9PRZiTrNVyJq5pII7lXcgVZaNKqKejvjKCh1vaB8bWHPfVVdtkqtv/pwufoQ40H+vF9uPOvj6sd96VdTEo465UxUkfx5avDdH3FiVEtLgj8Gur5/h9OoUMyPGOuqoFgG+LIBYbRTYlDEHNSGUbW5YTHf2ggS3LaaV8p3JmhBX5zhAm/ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKnFJM1HPSX3kTZQF9Yb8TERzJoc5JZ6iTunCUPiAZI=;
 b=h/6Bn6mgdZkFIQt0t3DHJ9wcrITZgt14e4FJsCg7etZlHXoClILOqVcIZPVBQYyKd+xmBiIONjmjALMnbMtQw9khS2aZdIInNdhDK4SWj8upPxL1ntdkhIWOWMQRlTYBUJut+DJBcB4lKsdXw6Bwr7bWXxmYihXzJBeFH4A29A17XnuOTAdI7ut0dNOL2HWFBn5a1lREaPaSwuBbnv8ApOCIp0L1u9cNJAd0mqkkirDiEzEqOo25aRHnFVGqDZxrXPCKxsw1F8l0N2DbRyC9fcNHRpyhd+WdhPEL2g9/xkpKAd19uIYpje67TfmDRQ0I/BNJQf0hrXElywK3WOf93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 18:12:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Wed, 7 Feb 2024
 18:12:50 +0000
Message-ID: <32d9d60b-1cfc-4201-8817-d293abe1b39d@intel.com>
Date: Wed, 7 Feb 2024 10:12:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Kenneth Graunke
 <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>, Sagar Ghuge
 <sagar.ghuge@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vivaik
 Balasubrawmanian" <vivaik.balasubrawmanian@intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcb5904-0c4a-40f7-eb31-08dc2808652b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6XZ0ZAk2vh9IpVFLf0oDQmkFyRkyO+03HRnBADoZ823SosiyOyXyLs/2O3KbCglB1SOB8A6XI6ldSzxeG6Z26zF2LbKyHwgI3gNPeU8XNRwNoexb72aaGj45Gj1p+Y8eItt6GI8qHYPpZ/QjqNGaOCMlOGdD1+0ALck635X7yiVxRvTFjPsF+OGIGXtqK8LhzXgNzJNLyHTffcXsO6Zr77jAzHbR873PmxHdMGLlalGF81YxqFO/ahBC5lpMqDFR5BR5VO5gMWHVw1GVHe0ZM3CIDtEsYGrKzWvRWmBNWa8//ezIKigRwWolZ5dMvhIGVok+yEK6dgZQvTE2KGPIPy7K66R+cWVhYs5aE8L0ItxWjYhevv0JX/mQ+oD6IuyWIps71Jt2uoo8ova/6gzicrs+Wbxw9r1A3m1rqK3rB45Mj0Gh7Uzw3aDSKO9mZQ1DY5G5ccyn/MbjpNO3XpQMIralayhaI0o+4WXJkdilHVDDzhqAOzp1+HaM0Xj7BuAKwNJbx3SFRtIIsreivp6prPj6+YgU4PpcwIjlrnUG0K9WlS5wsXq+LM2C6Cqxt4bF6krOG4KaFxYhqEUfCmdXuupyoFXnykZ+gy1sRackBGrKdNZFVGHZ9/7iCjrtBXhj3ILvwXRVykV/PFXdN0BHSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(478600001)(36756003)(6486002)(66946007)(66556008)(53546011)(6512007)(6506007)(66476007)(6666004)(54906003)(8936002)(8676002)(4326008)(316002)(82960400001)(38100700002)(26005)(86362001)(31696002)(83380400001)(2616005)(5660300002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a00wUWFaZmJkMVNsOXlHVjNLT2ZHUVJKTUw5eGduY0xrYkR4eW1OMEFUTzRC?=
 =?utf-8?B?d3g4Zkl0clMvajREMmhyQmhYNDZnSVpKQmluRXY4eWp3aWhyR0hzeG4zNHMw?=
 =?utf-8?B?WTcvaEZpblZMQ2srRFdRQ2N4ZGpENnNMT1FEV1dHWjI4M2laZlpMZXhtTG91?=
 =?utf-8?B?UUt6bGhKNC92MVFUZWF0TFJQMjN0Y2UrVDRXanp2bGMzZVNEZG1OT1h4dFph?=
 =?utf-8?B?ZFBMZEw5NFFXUFlid1MwaitEYUJJT1daRWF2MEtTUkZrZDBNaFJWNyt4dHNL?=
 =?utf-8?B?TUwwazZLbExOeU5qYkE4WndpYmk0TjNRRUYvcU9va0pmNHVTdTZkSTY3bkJP?=
 =?utf-8?B?cHlkZUg1S0dmZmFpTmdiZURmc3NBOVY4MXR0ckxwNmh6ckk4UFFYZThDTVZy?=
 =?utf-8?B?K2pTMnRHTGdLbDY1cXlyLzcvYU13eTJWRWcyR2hwdUtmOVcxS2djSmNLaE03?=
 =?utf-8?B?NXlRaDBqcmJDaWhPdnNiMzMvZDUxMWJZS2FrQ2M4WWN2aVIya1NHUHlySDlV?=
 =?utf-8?B?ZHczN2xIcHN0eG9HYWVCdEwzUHNzYkxGNndDeGVnTWhBaWlLZ3NHdHNoR3I5?=
 =?utf-8?B?US9GRGdEVTlXWS9OLzhsSjA1S3VySDc5NEV5MEphNGxybnRBYTI4K2piN1B3?=
 =?utf-8?B?eDBDamVnVTFhaUxDMGtLd0h6QTQwMU51L2JBYTJhNk9iSEFkT25qbXNXS2Y3?=
 =?utf-8?B?Z0dtRTdoSVM4SG9PTE8zSW1oL3BFdHpzaElzZFRqeXErVGhpYlpvVXVWUHFF?=
 =?utf-8?B?UmtxUGdlclhWWUQwc2lCRGtybitrK1RUTm1DNnBCR1JhZHJESG15VENibU1G?=
 =?utf-8?B?eHpCbVRRLzhPcC9EaUVuSnBWTU10R2JvNnhra3JTdEFuSDdvNVBURHpOb1hC?=
 =?utf-8?B?ZHU0SUV1SWM4MW5PdnM1N25DUnpFSUJuL1VmMy9LYUlCckowbDRVc20rSXRl?=
 =?utf-8?B?TkE3VkUzQ2FYeE81d2MwUVNUZk1PYlFvc2lyaXRPYSszK0UyRmhEdWhpRTJx?=
 =?utf-8?B?aGZZK0ZNNUFyUEhKQkY2c012YTM3c0ZKd0hHemY3UmhDU1NoZXJzQ0czQkJs?=
 =?utf-8?B?RHFwTllBK2tUV0o0ZlZCc1BrWncwTkVQZWtVQlo1elhucDhEYnNxbi9UNS9n?=
 =?utf-8?B?RUE3a3VnbXZobHVNVVlubHpLa212ekxkZUE4dzE3eFl0TzBnWVJrTkZ1S25L?=
 =?utf-8?B?aFM2YzNiODdnODZ2UnE3a1hyNXYvZy9ZYjJpd0RmU1QrS0VxT0oxMHBPUTJv?=
 =?utf-8?B?MWpmNU9zcHdyTnNxaCs3YVc3L2phT3RkY3pwK0J5MXAvSGJ3ZnVESzVoRjNk?=
 =?utf-8?B?QitOdGU3N1AxZ0NBUE4yOHlVT0ZtWTJJeGg4TkY5VTgwRlFONXY3alB4U2Z5?=
 =?utf-8?B?MTNEZXJvN3FTQUx0MVRZQ0VxRFUvMDJzam01amo3UUZnZkxsU0VMcXVnbGdX?=
 =?utf-8?B?bCs3OWlENEF5VkFFUjI3a0dXZHpOcUJVaHEzai9PSXV3c2ZnTzltOWpJamVS?=
 =?utf-8?B?SEFGQUg0N2YwU1hDS0xSWmlSSm53Vm1kOGFFWHUwOVptcTNYYlhQcnpmWmVn?=
 =?utf-8?B?MDllempwVjNLOEEyNHh1RTUwVWZ1bDJnRThGRzBhbUN6NWFhbC8vZzdZVFd3?=
 =?utf-8?B?R3pPUHllWFVRaWI3amtnYWNoaUN3UXBYdlEvZmZJeCtRNWE1OHpKUmNBbkN5?=
 =?utf-8?B?b2tpUjJWMyticFYyRVJxN0Z3ekRVNm10OVY3YyszdHAwVXJ1akNoTEtsMmF5?=
 =?utf-8?B?aS9iai9FNkFOc21DY1EvTGg5WW8vT09QYzBlZzBYS2QvekpTSFZOTHd5WGc0?=
 =?utf-8?B?VXNzYks3cFpNeUk2RnFvV3c5VkY5WGxCSEl0SzdlSG1oSGxxcm1JUGlJY0hM?=
 =?utf-8?B?amNtMUc2UGlEMzRaMkIwNEt4NWxNMGtVOUk5K3E5amloRWthaDBBdTN5Zita?=
 =?utf-8?B?b1hKckM2QkdsOC9pZ1RNaWVGdTh3SVZ1TWdSZ21pU0JhSGxiTUVaZm5Fbk5v?=
 =?utf-8?B?Q01oK3pRQnhXK2FZN3ROS2kwR2Z0d0xWWWw3bkh2L3EvemJqcy9XbDVSSFU1?=
 =?utf-8?B?YTZsUHF4SjVzd0Q2Z1V6SWxWZGFBVnVWVWs4RDg5VEtCS0I3Y1dOdnBNMG5P?=
 =?utf-8?B?aS9PVm01MTFad001TzdlZFplTmxVeENRbmFlRW1ZL0xJRjBVRGJ1dTJzRnpJ?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcb5904-0c4a-40f7-eb31-08dc2808652b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 18:12:50.3540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uk/XqEgwutkEZTDQoE3Hu91dc8P6LAN04AMFVTJeOUDf3RCQcexQ/Wc+Plh4XRMz9DuWxVWY8zXU/qa8pCGi2U0ask8Psq8OSN4gEJCc0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5491
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

On 2/7/2024 03:56, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Add a new query to the GuC submission interface version.
>
> Mesa intends to use this information to check for old firmware versions
> with a known bug where using the render and compute command streamers
> simultaneously can cause GPU hangs due issues in firmware scheduling.
>
> Based on patches from Vivaik and Joonas.
>
> There is a little bit of an open around the width required for versions.
> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>
>   #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>   #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>   #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
> ...
>   struct intel_uc_fw_ver {
>           u32 major;
>           u32 minor;
>           u32 patch;
>           u32 build;
>   };
This is copied from generic code which supports firmwares other than 
GuC. Only GuC promises to use 8-bit version components. Other firmwares 
very definitely do not. There is no open.

>
> So we could make the query u8, and refactor the struct intel_uc_fw_ver
> to use u8, or not. To avoid any doubts on why are we assigning u32 to
> u8 I simply opted to use u64. Which avoids the need to add any padding
> too.
I don't follow how potential 8 vs 32 confusion means jump to 64?!

>
> Compile tested only.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_query.c | 32 +++++++++++++++++++++++++++++++
>   include/uapi/drm/i915_drm.h       | 11 +++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 00871ef99792..999687f6a3d4 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct drm_i915_private *i915,
>   	return hwconfig->size;
>   }
>   
> +static int
> +query_guc_submission_version(struct drm_i915_private *i915,
> +			     struct drm_i915_query_item *query)
> +{
> +	struct drm_i915_query_guc_submission_version __user *query_ptr =
> +					    u64_to_user_ptr(query->data_ptr);
> +	struct drm_i915_query_guc_submission_version ver;
> +	struct intel_guc *guc = &to_gt(i915)->uc.guc;
> +	const size_t size = sizeof(ver);
> +	int ret;
> +
> +	if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> +		return -ENODEV;
> +
> +	ret = copy_query_item(&ver, size, size, query);
> +	if (ret != 0)
> +		return ret;
> +
> +	if (ver.major || ver.minor || ver.patch)
> +		return -EINVAL;
> +
> +	ver.major = guc->submission_version.major;
> +	ver.minor = guc->submission_version.minor;
> +	ver.patch = guc->submission_version.patch;
This needs to include the branch version (currently set to zero) in the 
definition. And the UMD needs to barf if branch comes back as non-zero. 
I.e. there is no guarantee that a branched version will have the w/a + 
fix that they are wanting.

John.


> +
> +	if (copy_to_user(query_ptr, &ver, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>   					struct drm_i915_query_item *query_item) = {
>   	query_topology_info,
> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>   	query_memregion_info,
>   	query_hwconfig_blob,
>   	query_geometry_subslices,
> +	query_guc_submission_version,
>   };
>   
>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 550c496ce76d..d80d9b5e1eda 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>   	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
>   	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>   	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
> +	 *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915_query_guc_submission_version)
>   	 */
>   	__u64 query_id;
>   #define DRM_I915_QUERY_TOPOLOGY_INFO		1
> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>   #define DRM_I915_QUERY_MEMORY_REGIONS		4
>   #define DRM_I915_QUERY_HWCONFIG_BLOB		5
>   #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION	7
>   /* Must be kept compact -- no holes and well documented */
>   
>   	/**
> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>   	struct drm_i915_memory_region_info regions[];
>   };
>   
> +/**
> +* struct drm_i915_query_guc_submission_version - query GuC submission interface version
> +*/
> +struct drm_i915_query_guc_submission_version {
> +	__u64 major;
> +	__u64 minor;
> +	__u64 patch;
> +};
> +
>   /**
>    * DOC: GuC HWCONFIG blob uAPI
>    *

