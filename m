Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B787CFF5E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49710E52A;
	Thu, 19 Oct 2023 16:21:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33510E52A;
 Thu, 19 Oct 2023 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697732509; x=1729268509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Ce5WjtGDcWrcAwCYU4TWrP1dPc52AY0LgZCEjG2YsM=;
 b=DDWYbQfBQEXKguqPWQCJM9+K/NmGuXfsKgM0cOJvn344eUV4SC4faF+8
 sZWFvhZRZ8BtpbM60/lUqHCrz42nGplEUr+OnGPkiN1L5yG7mkJLv1136
 IeDj5f2a2mcqd8KVD36vOddmEak5hu4Q49hxPsMdY1y9d4Yw9TLGooNj6
 Uh/HNzihOZcUv9BWsI1IpHsup04+Hiv82M6nR9pGjIb6WFlca/NRW7OcH
 0Ry/JQFMNfwELYX0BE4TogVtGiF6G4M5Nu40aetPu9Lm1Qdf0yZtBElNS
 IEVj8elifNbUJYK8j1DGeIqaT+rtwjiD+Jdz+MlXHtDx3Itn8Qcd8rm2d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452774834"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="452774834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 09:21:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847748456"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="847748456"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 09:21:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 09:21:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 09:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMzPifbgNIKp6QfVUqGtvYVxz3VglTEI38YiuEhXMIUmRCjicgogCeP5TSNC4fQI96GFf3h25a0mc0eHdtk2dI29EuuG3gKRSyI3MhpQA9D5qbs7SXmZIIpqZMwBEPjgrX7e6H3I/3cyxXdfyrUttKdVGwCjzRUC0tfBMJr8PCUuF0WwE7BJEHGddcKePAAcMuRjM8IqiQ2Oc6MYKjWrqIwZH/QFXl5etQRISkY00saqGgI0hr0YFJZfp2bEgptGXWb2TSnZ924htx4foQM2X0G9O9WrkPOt1OtNWU8hz5mudVMv+w5rcMj2Rux8OU2M6JA4FpdWFiRC1GxCtKMjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4o3e99fSVptVDX7tpGDjv7rZLUSemWTMtVnWBFppGI=;
 b=idCKaZpDUgabjvext/UPRUhXSdS6z7XKn0UpdVTiL6BvHGXmtz4eSCfWMr0Oqh8y6meFOKleOVyoBO0mq6qN+e/LwVjLvpzby4L8rFJ/sPnKM2LTwrvHnxBljLX10w99A45BdVGdG85uSPgTRquJ1VJ+OT1VbI+ynBGrRi4Tv74vBm8+yVOr08hsnXhGO1PHn/C2qoZRm7LuXsUpZ6b5ykEMfgFqr8BE370c0HYbsnCZY2MMqP4yM2NAP22T9JjOsOAb7homgGtd+ulzrXcNt5kbUgu6Vn0UNrrwJ4Aq9QQSPFUVTqnLsCvwFsadRG3WkNo+NGiInbPluMncADgHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 16:21:42 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ce40:de54:5d18:7880]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ce40:de54:5d18:7880%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:21:42 +0000
Message-ID: <7da1b636-770f-5b1a-e4f2-b2026aebc8ef@intel.com>
Date: Thu, 19 Oct 2023 12:21:38 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/mtl: Add counters for engine
 busyness ticks
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
 <20230922222510.2235213-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20230922222510.2235213-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 200e5a62-2fa0-4ecc-d314-08dbd0bf7aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvBpZmPrsjgCp1Cz0PTN5hM5HWAWCvALuezjpVah+Y3J/cfaE7ZsPIgwtI/jw3NQOhr0ih3pE6LjodNl77lrkS0fjKRjnIsBFCZAowU+F/6Thhpmnp8USH7hqNXJ6dLODHCHPY+SffKQPZSdXOLGtWMV4FDvY1SMkGkVe+l3Ta+Bq7fJbD2ZjUkXAShu4HQvfxQXbIDFI47Cu0uSiIQrJNhK4ckTVochWR3pWe4koxsIPsoqebziRGlS4NCqkfuCJruS7upqXXEGRW1nuk8IlvpJvW9chp2Je5K5xJ2VTzF+LlQsXrbR7PpvN0Z611BB6DsGF4dSTpnvsrFEk+TxVWVLNYJiZ9F5GqwMHM5tTZ7Ny7GB2ufx8IgCehw5rZ7ItruPnvtKH90zN0soirbj8YqEcfRSpiX+s14xyZmUs8KrKODgnjtyZJhl2VmWtlbTo7tS1LCNxr5Fu+NJCG7D+WYcwQx4rvFU3fObWefV32tToBYBlfFhLDmmc48unHc8gYGJ/4FIRjrQv/JNy7Ngs1X7BSipKke98C61IaH2lFxvIXaOm7jDvpmyf9EVEokd+HbVZ6Or3vu6e4a9UqAAVn/EiQlZV+grZzj+Q+4Azf+YUcbLP19xjHULRLahuptMnvjkF/JtGdiqvhdM7I6Gig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(36756003)(450100002)(66556008)(66476007)(66946007)(86362001)(31696002)(316002)(82960400001)(38100700002)(53546011)(83380400001)(26005)(2616005)(6506007)(6512007)(6666004)(2906002)(30864003)(6486002)(478600001)(41300700001)(8676002)(4326008)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RzQ0E0YytFL3V5cWs4dEJCb0pBT1l1U1dKRjltNGJ3T05pUURJM2VMRGdl?=
 =?utf-8?B?SnVSWE95QWVTKzQxKzBHNThVclJzTkYvNTNBc3ZBajFMMi9rRktpNUlPdHNv?=
 =?utf-8?B?SDZxU3ZvQWFhVXZsOVpCYktwMXl4WENHMEtUOFYvWjJadHhTV2VnWWlDUmxq?=
 =?utf-8?B?Nmd1TnM1eTM5K3BMN0F3STltYm5reUR6YmJXQ3FpaVoydG1aWDRsb3M2dGtH?=
 =?utf-8?B?a1MyaXBMa1hNeCtaTWJzR2NJVWNlWGZZWXNlRE5YcTlyY2xUNDhqeldGaVdG?=
 =?utf-8?B?bXJ6SG1DbnJPbjUwcWNCU3lBUHJ0akpkV0sxSVF2aEQwc29yYmRKN3JEZEsy?=
 =?utf-8?B?QVZON3M2OUFCcmpsSlNSUEQreXpKamhMYmIzRWIvd0E4aERsb0htL0NzMVlz?=
 =?utf-8?B?aEozdVpKcmtHaTZueC9aVEgrUmx6UlNjRjF3ZXYyY3dQeWV0emVBZ0Y2TlF3?=
 =?utf-8?B?Vi9WcjMyN0pIeXdJZTJHdkhrcmE5bGVsS1g0bStTMlppYlV2cHMyREVGT2Nk?=
 =?utf-8?B?cDFZeFR1emFPc0M5TDM3dWN1TjNJaXM3NlJaa1VyV3FRNGlSSXQydkFNNVFC?=
 =?utf-8?B?YXBhNVZOVTNmakR1TUs4OUlyWnkzNHJoL3F2OGNJaFJEdDFHQktMK3FqczVQ?=
 =?utf-8?B?MUt0TVlwQjBMYVRQT3VibkZJUzRuYnNiRm9GVzFQbHljZ0dEUDFmbzJjU0xa?=
 =?utf-8?B?b0duUlZEMmxMWXVSVVVsRlJSd0kvcFJlYmVOUTJDc3R4WmZNOGZJM0FJKzVa?=
 =?utf-8?B?L3VocXpFeDFVaGF1Z2VQR1Y4WklmcFpmaGRjRDFiRnZKZFd0VitzWmc5ck1E?=
 =?utf-8?B?S1VnR2Qrak9TYXJ6YnJYMkxUVjRMcmRvY2xwdnJkSUtiR0Z3ZGpYbVhpWTFZ?=
 =?utf-8?B?VzMwaUZLc253RytrR09JWCtmdEtwdmN1QU5ZbWVETXVlOGIvM21ycitOVk5U?=
 =?utf-8?B?QkNNdVNiV05Ba2xMNU5pSzUzdzZXN3haZklYaFQ3R3JVa0ppZ2JyK1dNdzFO?=
 =?utf-8?B?MXhrWnpDazVRTDFWNkVQQlhWUDJqeFZCYzRNUWRpeVBTblUvU2dlZzhnYXdE?=
 =?utf-8?B?YkJ5ZEZIaXpnVG0zTEpKdXoyYjVtNkZ1UWNCeXh4UDFUZ3NKK3Vja1RQOVlo?=
 =?utf-8?B?L2Jia01DWXo0YjVHRVZpWFBrNFVrV0VFUjZiWFc1NDh3cjVYVWlRNVlPTkJW?=
 =?utf-8?B?Sml2cEtHQlFhTjMremFFem9WK3l1N2NmVmlvVXgyZlM0bXIyWGNLblZ0THRq?=
 =?utf-8?B?SExnZHhqK0h3VGhhRm5Da1pDaXhQQXE5RVdrNlc3REJYWU5sQmhlVGhDckts?=
 =?utf-8?B?QllxLzQ3QzFyZnNCVkdWS055aVQ1QUplSGpwOHZmdFM1NHQ0N29FeHczcHNa?=
 =?utf-8?B?T0V4RTB6aC8xMzhVT2wwSUhPeG9xR3lkU0JTNnpPNklHWXdVSlFUd0c0Yk1M?=
 =?utf-8?B?YzYxT3F4UldiblpVRmhQbFV4U0tmY0d3ZUxhUzQ4VC9oT3VSSEdnblp2Y3Zz?=
 =?utf-8?B?N2krU2o4Y2Q1eVRlblZpSWhKK1h3YUEwOXRBZjUrZ1lKMXhCUEpzcEd2Z2hR?=
 =?utf-8?B?ZGFLTDd4OFNHQ0NERXFEbG05ZFAralVPdUZQQ2YxMlg3YnNpRWV4b2ZjWTFV?=
 =?utf-8?B?M2w0SVF3SnhrelRSQk80UHNMRW1hMmxucEYrSk85aC9yNWt5WmVNeEdINHJ0?=
 =?utf-8?B?NXArVHQwNCtFLzhpc2xWZG8zSGtlZldTcWxOSUZxZUliL0JsV1lnU05rL0gr?=
 =?utf-8?B?YVlPVkxmSWhSMWlZN2dwOFM1N1JjN3VKdDJYbWlXVVJJSnd5U2NjYkJRdUY1?=
 =?utf-8?B?RVQwNS9EWmYxNmVzMGNXMW5zSTlHdXB6ekQyTzdGVDUvcHczSUYva2M1aGZS?=
 =?utf-8?B?N095WjBJM1ZmMExSVGdHZ1JJUmI5My9rRmx2aXRJREtmOC9zZ1ExMmNyclFI?=
 =?utf-8?B?NUdkUjQ1RTIvajJoS2NrZERyMWlPam85L3k3MGt3Z01LMXlVL2pHZ2JKOWRo?=
 =?utf-8?B?ancwV1BvYisza3d6S2lxYmlLcUlJVDZwdjZKS2dLU3FlVzJZekVPaUNxck1O?=
 =?utf-8?B?U3VtTTZaTnhxT1BWWUpyVkYwdkVNbE81UlpnQzFLRENrT3l4cFRFeTMydHpE?=
 =?utf-8?Q?K51zd/4TowNPssB8IM1NEATeh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 200e5a62-2fa0-4ecc-d314-08dbd0bf7aec
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:21:42.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjOavmg+MCAtwm0EZJmPcqoy8dwYq/lt4iUr8eTgos5JE5G+o2k5RrqIbo8zj4PWa3voIZlVVWzfQOxXWo0+ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

See comments inline below.

Zhanjun

On 2023-09-22 6:25 p.m., John.C.Harrison@Intel.com wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> In new version of GuC engine busyness, GuC provides engine busyness
> ticks as a 64 bit counter. Add a new counter to relay this value to the
> user as is.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine.h        |  1 +
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 16 +++++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  | 12 ++++
>   drivers/gpu/drm/i915/gt/intel_engine_user.c   |  1 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 67 ++++++++++++++-----
>   drivers/gpu/drm/i915/i915_pmu.c               | 25 ++++++-
>   drivers/gpu/drm/i915/i915_pmu.h               |  2 +-
>   include/uapi/drm/i915_drm.h                   | 13 +++-
>   8 files changed, 116 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index b58c30ac8ef02..57af7ec8ecd82 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -249,6 +249,7 @@ void intel_engine_dump_active_requests(struct list_head *requests,
>   
>   ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>   				   ktime_t *now);
> +u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine);
>   
>   void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>   				  struct intel_context **ce, struct i915_request **rq);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 84a75c95f3f7d..1c9ffb1ae9889 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -2426,6 +2426,22 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>   	return engine->busyness(engine, now);
>   }
>   
> +/**
> + * intel_engine_get_busy_ticks() - Return current accumulated engine busyness
> + * ticks
> + * @engine: engine to report on
> + *
> + * Returns accumulated ticks @engine was busy since engine stats were enabled.
> + */
> +u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine)
> +{
> +	if (!engine->busyness_ticks ||
> +	    !(engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS))
> +		return 0;
> +
> +	return engine->busyness_ticks(engine);
> +}
> +
>   struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
>   			    unsigned int count, unsigned long flags)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 40fd8f984d64b..a88d40c74d604 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -548,6 +548,11 @@ struct intel_engine_cs {
>   	ktime_t		(*busyness)(struct intel_engine_cs *engine,
>   				    ktime_t *now);
>   
> +	/*
> +	 * Get engine busyness ticks
> +	 */
> +	u64		(*busyness_ticks)(struct intel_engine_cs *engine);
> +
>   	struct intel_engine_execlists execlists;
>   
>   	/*
> @@ -574,6 +579,7 @@ struct intel_engine_cs {
>   #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>   #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
>   #define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
> +#define I915_ENGINE_SUPPORTS_TICKS_STATS   BIT(13)
>   	unsigned int flags;
>   
>   	/*
> @@ -649,6 +655,12 @@ intel_engine_supports_stats(const struct intel_engine_cs *engine)
>   	return engine->flags & I915_ENGINE_SUPPORTS_STATS;
>   }
>   
> +static inline bool
> +intel_engine_supports_tick_stats(const struct intel_engine_cs *engine)
> +{
> +	return engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS;
> +}
> +
>   static inline bool
>   intel_engine_has_preemption(const struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index dcedff41a825f..69eb610b5ab0a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -100,6 +100,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
>   		MAP(HAS_PREEMPTION, PREEMPTION),
>   		MAP(HAS_SEMAPHORES, SEMAPHORES),
>   		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
> +		MAP(SUPPORTS_TICKS_STATS, ENGINE_BUSY_TICKS_STATS),
>   #undef MAP
>   	};
>   	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0c1fee5360777..71749fb9ad35b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1289,12 +1289,7 @@ static void busy_v1_guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
>   	guc->busy.v1.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_lo;
>   }
>   
> -/*
> - * Unlike the execlist mode of submission total and active times are in terms of
> - * gt clocks. The *now parameter is retained to return the cpu time at which the
> - * busyness was sampled.
> - */
> -static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
> +static u64 __busy_v1_guc_engine_busyness_ticks(struct intel_engine_cs *engine, ktime_t *now_out)
>   {
>   	struct intel_engine_guc_stats_v1 stats_saved, *stats = &engine->stats.guc_v1;
>   	struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
> @@ -1304,6 +1299,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>   	unsigned long flags;
>   	u32 reset_count;
>   	bool in_reset;
> +	ktime_t now;
>   
>   	spin_lock_irqsave(&guc->busy.v1.lock, flags);
>   
> @@ -1318,7 +1314,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>   	reset_count = i915_reset_count(gpu_error);
>   	in_reset = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
>   
> -	*now = ktime_get();
> +	now = ktime_get();
>   
>   	/*
>   	 * The active busyness depends on start_gt_clk and gt_stamp.
> @@ -1334,7 +1330,7 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>   		 * start_gt_clk' calculation below for active engines.
>   		 */
>   		busy_v1_guc_update_engine_gt_clks(engine);
> -		busy_v1_guc_update_pm_timestamp(guc, now);
> +		busy_v1_guc_update_pm_timestamp(guc, &now);
>   		intel_gt_pm_put_async(gt);
>   		if (i915_reset_count(gpu_error) != reset_count) {
>   			*stats = stats_saved;
> @@ -1342,16 +1338,37 @@ static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>   		}
>   	}
>   
> -	total = intel_gt_clock_interval_to_ns(gt, stats->total_gt_clks);
> +	total = stats->total_gt_clks;
>   	if (stats->running) {
>   		u64 clk = guc->busy.v1.gt_stamp - stats->start_gt_clk;
>   
> -		total += intel_gt_clock_interval_to_ns(gt, clk);
> +		total += clk;
>   	}
>   
>   	spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
>   
> -	return ns_to_ktime(total);
> +	if (now_out)
> +		*now_out = now;
> +
> +	return total;
> +}
> +
> +/*
> + * Unlike the execlist mode of submission total and active times are in terms of
> + * gt clocks. The *now parameter is retained to return the cpu time at which the
> + * busyness was sampled.
> + */
> +static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
> +{
> +	u64 ticks = __busy_v1_guc_engine_busyness_ticks(engine, now);
> +	u64 ns = intel_gt_clock_interval_to_ns(engine->gt, ticks);
> +
> +	return ns_to_ktime(ns);
> +}
> +
> +static u64 busy_v1_guc_engine_busyness_ticks(struct intel_engine_cs *engine)
> +{
> +	return __busy_v1_guc_engine_busyness_ticks(engine, NULL);
>   }
>   
>   static void busy_v1_guc_enable_worker(struct intel_guc *guc)
> @@ -1607,6 +1624,16 @@ static ktime_t busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>   	return ns_to_ktime(total);
>   }
>   
> +static u64 busy_v2_guc_engine_busyness_ticks(struct intel_engine_cs *engine)
> +{
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	u64 ticks_engine;
> +
> +	__busy_v2_get_engine_usage_record(guc, engine, &ticks_engine, NULL, NULL);
> +
> +	return ticks_engine;
> +}
> +
>   static u64 busy_v1_intel_guc_total_active_ticks(struct intel_guc *guc)
>   {
>   	return guc->busy.v1.gt_stamp;
> @@ -4480,12 +4507,20 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   		engine->emit_flush = gen12_emit_flush_xcs;
>   	}
>   	engine->set_default_submission = guc_set_default_submission;
> -	if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1))
> -		engine->busyness = busy_v1_guc_engine_busyness;
> -	else
> -		engine->busyness = busy_v2_guc_engine_busyness;
> +	if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1)) {
> +		if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
> +			engine->busyness = busy_v1_guc_engine_busyness;
> +		engine->busyness_ticks = busy_v1_guc_engine_busyness_ticks;
> +	} else {
> +		if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
> +			engine->busyness = busy_v2_guc_engine_busyness;

Do we leave engine->busyness not initialized when >= IP_VER(12, 70)?

> +		engine->busyness_ticks = busy_v2_guc_engine_busyness_ticks;
> +	}
> +
> +	if (engine->busyness)
> +		engine->flags |= I915_ENGINE_SUPPORTS_STATS;
>   
> -	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
> +	engine->flags |= I915_ENGINE_SUPPORTS_TICKS_STATS;
>   	engine->flags |= I915_ENGINE_HAS_PREEMPTION;
>   	engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>   
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 4f52636eb4a80..1b859556644f6 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -26,7 +26,8 @@
>   #define ENGINE_SAMPLE_MASK \
>   	(BIT(I915_SAMPLE_BUSY) | \
>   	 BIT(I915_SAMPLE_WAIT) | \
> -	 BIT(I915_SAMPLE_SEMA))
> +	 BIT(I915_SAMPLE_SEMA) | \
> +	 BIT(I915_SAMPLE_BUSY_TICKS))
>   
>   static cpumask_t i915_pmu_cpumask;
>   static unsigned int i915_pmu_target_cpu = -1;
> @@ -161,8 +162,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu)
>   	 * Also there is software busyness tracking available we do not
>   	 * need the timer for I915_SAMPLE_BUSY counter.
>   	 */
> -	if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
> +	if ((i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS) ||
> +	    (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS)) {
>   		enable &= ~BIT(I915_SAMPLE_BUSY);
> +		enable &= ~BIT(I915_SAMPLE_BUSY_TICKS);
> +	}
>   
>   	/*
>   	 * If some bits remain it means we need the sampling timer running.
> @@ -362,7 +366,8 @@ static void engine_sample(struct intel_engine_cs *engine, unsigned int period_ns
>   		add_sample(&pmu->sample[I915_SAMPLE_SEMA], period_ns);
>   
>   	/* No need to sample when busy stats are supported. */
> -	if (intel_engine_supports_stats(engine))
> +	if (intel_engine_supports_stats(engine) ||
> +	    intel_engine_supports_tick_stats(engine))
>   		return;
>   
>   	/*
> @@ -519,6 +524,13 @@ engine_event_status(struct intel_engine_cs *engine,
>   {
>   	switch (sample) {
>   	case I915_SAMPLE_BUSY:
> +		if (!intel_engine_supports_stats(engine))
> +			return -ENODEV;
> +		break;
> +	case I915_SAMPLE_BUSY_TICKS:
> +		if (!intel_engine_supports_tick_stats(engine))
> +			return -ENODEV;
> +		break;
>   	case I915_SAMPLE_WAIT:
>   		break;
>   	case I915_SAMPLE_SEMA:
> @@ -651,6 +663,9 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
>   
>   			val = ktime_to_ns(intel_engine_get_busy_time(engine,
>   								     &unused));
> +		} else if (sample == I915_SAMPLE_BUSY_TICKS &&
> +			   intel_engine_supports_tick_stats(engine)) {
> +			val = intel_engine_get_busy_ticks(engine);
>   		} else {
>   			val = engine->pmu.sample[sample].cur;
>   		}
> @@ -1000,6 +1015,7 @@ create_event_attributes(struct i915_pmu *pmu)
>   		__engine_event(I915_SAMPLE_BUSY, "busy"),
>   		__engine_event(I915_SAMPLE_SEMA, "sema"),
>   		__engine_event(I915_SAMPLE_WAIT, "wait"),
> +		__engine_event(I915_SAMPLE_BUSY_TICKS, "busy-ticks"),
>   	};
>   	unsigned int count = 0;
>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -1103,6 +1119,9 @@ create_event_attributes(struct i915_pmu *pmu)
>   								engine->uabi_instance,
>   								engine_events[i].sample));
>   
> +			if (engine_events[i].sample == I915_SAMPLE_BUSY_TICKS)
> +				continue;
> +
>   			str = kasprintf(GFP_KERNEL, "%s-%s.unit",
>   					engine->name, engine_events[i].name);
>   			if (!str)
> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
> index 41af038c37388..72a9c71944f8d 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -49,7 +49,7 @@ enum {
>   	(I915_ENGINE_SAMPLE_COUNT + \
>   	 I915_PMU_MAX_GT * __I915_PMU_TRACKED_EVENT_COUNT)
>   
> -#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_SEMA + 1)
> +#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_BUSY_TICKS + 1)
>   
>   struct i915_pmu_sample {
>   	u64 cur;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index e26dd27ff4a5f..8ae98c1bda0ea 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -257,7 +257,8 @@ struct i915_engine_class_instance {
>   enum drm_i915_pmu_engine_sample {
>   	I915_SAMPLE_BUSY = 0,
>   	I915_SAMPLE_WAIT = 1,
> -	I915_SAMPLE_SEMA = 2
> +	I915_SAMPLE_SEMA = 2,
> +	I915_SAMPLE_BUSY_TICKS = 3,
>   };
>   
>   #define I915_PMU_SAMPLE_BITS (4)
> @@ -274,6 +275,9 @@ enum drm_i915_pmu_engine_sample {
>   #define I915_PMU_ENGINE_BUSY(class, instance) \
>   	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY)
>   
> +#define I915_PMU_ENGINE_BUSY_TICKS(class, instance) \
> +	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY_TICKS)
> +
>   #define I915_PMU_ENGINE_WAIT(class, instance) \
>   	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_WAIT)
>   
> @@ -651,7 +655,14 @@ typedef struct drm_i915_irq_wait {
>   #define   I915_SCHEDULER_CAP_PRIORITY	(1ul << 1)
>   #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
>   #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
> +/*
> + * BUSY_STATS is deprecated on platforms with GuC based submission and will nt
> + * be available at all on newer platforms. It has accuracy issues due to the
> + * conversions from tick counts to wall time.
> + * BUSY_TICKS_STATS should be used instead.
> + */
>   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> +#define   I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS	(1ul << 5)
>   /*
>    * Indicates the 2k user priority levels are statically mapped into 3 buckets as
>    * follows:
