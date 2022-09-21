Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D595B5BFCB1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6110E918;
	Wed, 21 Sep 2022 10:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303210E8F2;
 Wed, 21 Sep 2022 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663757976; x=1695293976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bNxsLwO94NpqLJgQ0xZCbml3e2MkxBJZXDBlQ6w+gqw=;
 b=F1SZUQtt5ud3ndxjL9k4ouZDLsKuDv6Rs5nb1osAPQYPmEooz5wpYVLr
 OpMeoig1LISZ4grGXDNEZ86/ZxiSs4JCSyocYFnBRViLivyFgwiNpaCL9
 k84yfcu2J4tjhdERGQCHBkAE+kUg2VjSc5Sb+aFUWMavXM50w3Te+Bz+x
 HqSbjU8ML7UZ2+cbhXYUwEC/ijacAtDrN0q2rycGylQg0pJW6PXvT+j30
 woC5Tcxovr5PZefZ7YV3xkTTFBEmFon5o0YGOyOUdfAqspYcs6qp2DvRB
 a+ex7vbFZ6/OabZI27CHvn9a3/xKF4I1XnLxa4/PFWqfC+dhXI1I4xeaP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="300806081"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="300806081"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 03:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="570487620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2022 03:59:35 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 03:59:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 03:59:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 03:59:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 03:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2zZ2a/f/pWlDrung1sVRp4ysKRrx+gtllIvA3tyEZyQN7M+BM0gcQqO+3SCAnzf3qp3F1vr3Ik6Zna6EGpmK1hV/gpopQx35XlmIX9LYuwmqcFnMwbJhFZMsaZ+5vkUS/QZRHUqnON4cUsvZWgwEbUya2037p7sIXfNikhyNjaC3aRow8lVZno037r9U13RiM7Hk1+OrTElzvdhxkICwvmk30w5b5kr7F63MmDCAHxwe5NRWh8UrQLFmmrTZVDB6ybPoR7wCG3tZMSBbJzQJaQa/b7+T55MWfqBKT5OqI0uQQqACMc7lOBXRAuEsxr9y0qu5fhAcjeDAmX7gGipxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e73C0P9xlVX4rTUIBqMqKIaN+ioJxjiZ9xPqYJNYVE=;
 b=QedSlkTqtovcccs7ZPwXYZajZMGY8g7opbSIXXmg3M5jAxxB7f4rRdr3TNyhLt2XQ4PzZFbBQiA8Ko5elvuWHSsV58O3ok81VvDMOoTELYQ9QNLgxZYBmgovMQHZIVBmDdY1V6AsB7etDHr4gW62TXZ8Wq254s744l0OMuqIvNB2TkBfErE/Qmt69nB1HpIBVoFXfigrZnlzT3f2w+6vv1AI0kCEzeI5Am/70CMr69Tx1Aar4O5l/dOi0cTLZoLhGj8DdlTpa/5fVn+M8i37Z1X3lCeeKCvwsSXDf4Ya1QMY/tKx0ViAUPFMl+xG7SRuItug2a2kZyBrj5zy/ExB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 10:59:28 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::c144:218:70eb:9cbe%4]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 10:59:27 +0000
Message-ID: <134d2dee-9fcc-6f02-2725-6eb054cd6349@intel.com>
Date: Wed, 21 Sep 2022 16:29:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <20220916150054.807590-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f776cb4-24fe-428e-ab7c-08da9bc05a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CwUXAnjvbId0Pz0lV/1kFDB9GvLKBiCZ4aPWUs9AA/BK9+vKhw9KxJH3WqrCpa5yW1FjvKzsjl9AoEMA88xmKazX0VjOqpsOvmU2iJYWsJqSG96ty3i82tBF3ExPx5Yk0CUS3Hwq5hCvLLIPpiUW5BCbUz7tQ9j0V1a/XFFeA7DUXwn8yhpK0PRRV1Kh2MHsAENgegbm1DS5N/On3awUo6rfOw+1YQmPejIkBKgPqLQ589XKYI53Au9Cfu1Y5KK95Oe1qWqmiLrKfGztvW6Ds/3q3jw+744NKFI2F7nokM7TxwRERXfHLBkX1XedPDcryz+QcXPwAQ3uX1dCjB6sttqtP0kIZqp462wQc1D96UyWEsn8xU9a4aJAzqe4jUEcJKkyKJdg2To50QB40nKTS7V6lqk1U9hTokYupJ4vuiqn5XSWUNoeyzGNmW4YLSE5qfFtFM2oJ58l3rjRXRbe3tc6DxN+qdS6arz+c0Bcy/9gKzPehZjgup8QkyClgWabwSY9o+7z1GRGaigZr1uziXFqLGzuoJLjxBovrkwhl6YtGtkRefCm9VqivkLz40CEzyVk5rgdsBpMUzYR72RAZZO1JYopNutN08Tpe7W9DfhhCaVWAw7d+xskSDZljFiwG6CizLSWD1ssAwClKt/1ZH2xFbsohg8QYq91ZGvRZut7YVWDs7TZs4+VbjaVHp4RWnlbmgFOHC4YlSN3S2meiZr966Wv4F1nOLRB3VJqfiZEqUZ6qHdVN/l2432uv59aqYAFkXySwNp2QeK/cQAeaXs/AsB1Ea+GoUMJ60HR6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(66476007)(6506007)(86362001)(31696002)(36756003)(38100700002)(82960400001)(478600001)(5660300002)(2906002)(6486002)(66556008)(186003)(4326008)(8676002)(8936002)(316002)(83380400001)(66946007)(41300700001)(6666004)(2616005)(55236004)(26005)(6512007)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDA2WkRobGpHSFluSmpjN0dydHlWTmd6Qk5SdHV6K0xMWXZkYzRrYkM0dkYx?=
 =?utf-8?B?RllLSnJDUlZlMGFYRWp2NENEeVR0NDhQZzBFNzNyLzlPRHQ0YS80NzRQUUtj?=
 =?utf-8?B?YXMyWlpFbVAxNUhTazZpcjJLcmdBcENwZzBWenpwdDVhSmg1V2hUVEFiZ1Qy?=
 =?utf-8?B?WFpCamhkSUhzcFl0dGQ4K1AwaUYxVTI2ejFrM0Q5cmR6eEZORVV3MysyNzZZ?=
 =?utf-8?B?ZGEyRTFYdkp2R0dmK05mMm8xZ29qcGY4ZG5zUm5ZUUZSZk9vaDhTODBieHdN?=
 =?utf-8?B?Mm1UNHZjdk02NmVqZDhYVExJTzRyQ1BtTU5Rb0lRaG5KNHRkS3BPMlhjanFY?=
 =?utf-8?B?amxvdFBBSUh2UnVlWjRHaUFPR3J5N1JoNzZaT1YxYm5wMlZ4RDFtQ0NXSDFn?=
 =?utf-8?B?YUtTQU4vckxuOWpsbGE5TEZ0eGUyMTZZcXkySDg5NE9sdDRVYk9FUjcvaGRZ?=
 =?utf-8?B?R2VKaG5xcUhMYWc2MUdsNCt0N214S0luNUt5d0ErNG9MNGEwYWR6VDJ0YUxl?=
 =?utf-8?B?b3BXOEc5OFRmNGs4SHlVRmFQRko4aXc3TEtHeUg2QldEcld2dkN3dDJjQmxD?=
 =?utf-8?B?WklsTy85VXBKSGNWUHYrV2N0K1VaSit1QmR6N2JqVmZabEpSVHFWbk1BVzNW?=
 =?utf-8?B?NklhaEp1eGRzanBDUndwMDQvcDVHTTBkNlRUWFBneUFBQjF5OWlkSnFMQ052?=
 =?utf-8?B?UUJtN0JaeUdvTzV4NWpFZjhsbS9iSzhKbEkxcnpROHQwcXV4RWJ1QzIycElM?=
 =?utf-8?B?ajJDeEQzOEVIelRJS0xiOUhWa0wybmFKZHY4Qkd5ZGdXL21PcEh4SC9ybE9s?=
 =?utf-8?B?NEZkeTcrdFNWWUZMeDRNRVJRM2h0M0x6bU54Z1huRkM1NTNLV1hmd0xTa3hW?=
 =?utf-8?B?MHJlMjV6dHNaVUhjMGcxTzBBcmdxekJSRXliWmNYeUhHclRmVzBsVXlKTjlV?=
 =?utf-8?B?K3JPcDlTZitvOHVJVWNqR2hHbVU0SkxRRFNmenpBR3o1eGlFQThabHlncWdi?=
 =?utf-8?B?N2VyTzRpQWU3TTdOdXB3ODdPbFRtVm9oVTRUNW5TZDRBeDlxTWZWUitWQlho?=
 =?utf-8?B?UHUybnoxNmprQXlIZjhGd2lWdjRSWkkvTFpaZGh1MFBtU1JKS0pOM1I0NXBz?=
 =?utf-8?B?bThaS2dYM0VreUdGVHFVUW5nS2hzcGM0RWdSUm1jWWdnOElWWWVWY2hsSUMz?=
 =?utf-8?B?VU1MalM0K3R4eTNQbmc5d2hPOVBZWVg0a2ZJRU05MDJhbEd5VmsvUFd0U1dL?=
 =?utf-8?B?VHQ4MGpVZlIvcnF4bHVLRHhUSU00aU8vZUNXT2FwQ2tyMnJpaXAxOVlhNFgz?=
 =?utf-8?B?OWxIam9BeXVsMlVWd2FkZEs1cTQ1SVlLUVUrUWpiTkZRcFlmaWhqcW0rUGZl?=
 =?utf-8?B?QkxQSVV0RUJKaGtPN214c3lsWFdTcTJQZ0Q5dStaaVp2clNwaVRiMkpXT1hw?=
 =?utf-8?B?bVRKcXRnMVNEMm4zQUxrbDRlQTFsbmtreU1zN3RlcFdVR0FabUl6eFBTWDk4?=
 =?utf-8?B?dzdWUmNUR2d4N0RCakdZZGloZFp1SDZwd3k4MmZ1Y2c3Qkg3OVRZeW9zOEI4?=
 =?utf-8?B?bk1BY29SY2xZZm1VQWtucEZKNytyVFNreEZRbWJCWFRMbm1IenNZMHhFRy9W?=
 =?utf-8?B?MFVzeUIzdlV4dkl4QmZYM0xGZmRIQm5QVFJuVUowSmlFQ09aU2RwQ04vSU9S?=
 =?utf-8?B?V1p6WXJIUm5sa2RIdTBHVGlBcFNkbitrTFZpRVB2b21FNU9zNFdrZGVQMk9B?=
 =?utf-8?B?NzI5ZU1IeHMvYzJXSUVmTnhQeHFZOVJHb05HWnJnRzJoTW1MQmVMSDNXQW5o?=
 =?utf-8?B?clpOcjM0TENQa2tvTEVGanpndVZYTzRkMFVRTnhKVFZqMjZZV0d4eEZmNXIz?=
 =?utf-8?B?djRMUGFoVEZvelhTTlBXN3NoVU5aTWRvbExUS09QQmQ1RzE0dld4Y1dKS0tB?=
 =?utf-8?B?TTBxKzc0ZkNPcXRkZjZ1MkpKWElPSEJVSC92R0hlRUdYSlRwQ09OMEUxYVlo?=
 =?utf-8?B?YmVrSHZCZFBPd0YrTkJsemV5M1Q1R1BvRlVPdk9NTmczUEloS0gyM1AyRVo5?=
 =?utf-8?B?eXpqRmhZdFFLRGt1RmQrT1Y0d3NVbVNhZlhlWGtpMXFTbDh0ZWJuMjdYZTU3?=
 =?utf-8?B?RGFYRzNVVFF2ZkFyRERHZTRUZXhyTnBuOWtFQnNHZitTK1d6bE83dDhwSytm?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f776cb4-24fe-428e-ab7c-08da9bc05a18
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:59:27.7531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI/XBPx+yqz7cuU8gxpu+hw1K4As9LrWsxOXxl6lj8aLb1F/J+Viwn74Rsw2fOtNaI6fWoEmjZ7yh8DdRUdn8mdEwPUVIgO9ItYViIk2jo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
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
Cc: ashutosh.dixit@intel.com, jon.ewins@intel.com, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/16/2022 8:30 PM, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> The i915 HWMON module will be used to expose voltage, power and energy
> values for dGfx. Here we set up i915 hwmon infrastructure including i915
> hwmon registration, basic data structures and functions.
> 
> v2:
>    - Create HWMON infra patch (Ashutosh)
>    - Fixed review comments (Jani)
>    - Remove "select HWMON" from i915/Kconfig (Jani)
> v3: Use hwm_ prefix for static functions (Ashutosh)
> v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the former
>      doesn't work if hwmon is compiled as a module (Guenter)
> v5: Fixed review comments (Jani)
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

> ---
>   drivers/gpu/drm/i915/Makefile      |   3 +
>   drivers/gpu/drm/i915/i915_driver.c |   5 ++
>   drivers/gpu/drm/i915/i915_drv.h    |   2 +
>   drivers/gpu/drm/i915/i915_hwmon.c  | 136 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_hwmon.h  |  20 +++++
>   5 files changed, 166 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a26edcdadc21..66a6023e61a6 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -209,6 +209,9 @@ i915-y += gt/uc/intel_uc.o \
>   # graphics system controller (GSC) support
>   i915-y += gt/intel_gsc.o
>   
> +# graphics hardware monitoring (HWMON) support
> +i915-$(CONFIG_HWMON) += i915_hwmon.o
> +
>   # modesetting core code
>   i915-y += \
>   	display/hsw_ips.o \
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c459eb362c47..75655adb7bd3 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -81,6 +81,7 @@
>   #include "i915_drm_client.h"
>   #include "i915_drv.h"
>   #include "i915_getparam.h"
> +#include "i915_hwmon.h"
>   #include "i915_ioc32.h"
>   #include "i915_ioctl.h"
>   #include "i915_irq.h"
> @@ -763,6 +764,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_driver_register(gt);
>   
> +	i915_hwmon_register(dev_priv);
> +
>   	intel_display_driver_register(dev_priv);
>   
>   	intel_power_domains_enable(dev_priv);
> @@ -795,6 +798,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_driver_unregister(gt);
>   
> +	i915_hwmon_unregister(dev_priv);
> +
>   	i915_perf_unregister(dev_priv);
>   	i915_pmu_unregister(dev_priv);
>   
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 9f9372931fd2..01a2caf42635 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -353,6 +353,8 @@ struct drm_i915_private {
>   
>   	struct i915_perf perf;
>   
> +	struct i915_hwmon *hwmon;
> +
>   	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
>   	struct intel_gt gt0;
>   
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> new file mode 100644
> index 000000000000..103dd543a214
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/types.h>
> +
> +#include "i915_drv.h"
> +#include "i915_hwmon.h"
> +#include "i915_reg.h"
> +#include "intel_mchbar_regs.h"
> +
> +struct hwm_reg {
> +};
> +
> +struct hwm_drvdata {
> +	struct i915_hwmon *hwmon;
> +	struct intel_uncore *uncore;
> +	struct device *hwmon_dev;
> +	char name[12];
> +};
> +
> +struct i915_hwmon {
> +	struct hwm_drvdata ddat;
> +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
> +	struct hwm_reg rg;
> +};
> +
> +static const struct hwmon_channel_info *hwm_info[] = {
> +	NULL
> +};
> +
> +static umode_t
> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +	       u32 attr, int channel)
> +{
> +	switch (type) {
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	 int channel, long *val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	  int channel, long val)
> +{
> +	switch (type) {
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops hwm_ops = {
> +	.is_visible = hwm_is_visible,
> +	.read = hwm_read,
> +	.write = hwm_write,
> +};
> +
> +static const struct hwmon_chip_info hwm_chip_info = {
> +	.ops = &hwm_ops,
> +	.info = hwm_info,
> +};
> +
> +static void
> +hwm_get_preregistration_info(struct drm_i915_private *i915)
> +{
> +}
> +
> +void i915_hwmon_register(struct drm_i915_private *i915)
> +{
> +	struct device *dev = i915->drm.dev;
> +	struct i915_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	struct hwm_drvdata *ddat;
> +
> +	/* hwmon is available only for dGfx */
> +	if (!IS_DGFX(i915))
> +		return;
> +
> +	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return;
> +
> +	i915->hwmon = hwmon;
> +	mutex_init(&hwmon->hwmon_lock);
> +	ddat = &hwmon->ddat;
> +
> +	ddat->hwmon = hwmon;
> +	ddat->uncore = &i915->uncore;
> +	snprintf(ddat->name, sizeof(ddat->name), "i915");
> +
> +	hwm_get_preregistration_info(i915);
> +
> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		mutex_destroy(&hwmon->hwmon_lock);
> +		i915->hwmon = NULL;
> +		kfree(hwmon);
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void i915_hwmon_unregister(struct drm_i915_private *i915)
> +{
> +	struct i915_hwmon *hwmon;
> +	struct hwm_drvdata *ddat;
> +
> +	hwmon = fetch_and_zero(&i915->hwmon);
> +	if (!hwmon)
> +		return;
> +
> +	ddat = &hwmon->ddat;
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
> +}
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> new file mode 100644
> index 000000000000..7ca9cf2c34c9
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef __I915_HWMON_H__
> +#define __I915_HWMON_H__
> +
> +struct drm_i915_private;
> +
> +#if IS_REACHABLE(CONFIG_HWMON)
> +void i915_hwmon_register(struct drm_i915_private *i915);
> +void i915_hwmon_unregister(struct drm_i915_private *i915);
> +#else
> +static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
> +static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
> +#endif
> +
> +#endif /* __I915_HWMON_H__ */
