Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4232824999
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9879B10E511;
	Thu,  4 Jan 2024 20:35:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B061510E52B;
 Thu,  4 Jan 2024 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704400503; x=1735936503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yNVG7fgK0+ujGy4T6vPg8bMYJqnbcHZX1W8p+XPyGoU=;
 b=h+vddZZ0gP3H9Cat3VHfJ5E/WUU2kXdaZTrFx16yheYmBIJE3koam8Yt
 eUVRAITwYxQFni2tj4+7gFuxwxWj9is3LgQOvmNoZj6rARFspzI3wnIPK
 Zt7oWNsQ3RP51WDCgs/5K+7YGwzczogtB7/uSc4FqdTfgaZxRcWkiJPF0
 RMh32CdKSmjGQlWuTic9mB07ytjmGqJjUD0pnBRq8CfQS1Rh5N/xzXigP
 RW+B0PeDa2PUC2dhbDKdNYFijdppCCWxZXGFnZJ+DdSCpdyzDDXtYi/qq
 vBPQZM8bUax+4g3zRRoKfDORogKHA1IshGpy8jRr1gdftoo3cCNvl9rVY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="15979870"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="15979870"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 12:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871041731"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="871041731"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 12:35:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 12:35:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 12:35:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 12:35:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 12:35:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX1DP3tVnrT3RfXz4zczj6wYBAV043AQO6zMz7TEmfVF7aLHnOidZze1wYZXUhVPIUSbitoCwguZhifLASm13A/x7v70zowgScGeML7Q2gc118Dv8wFCSktJouN816g9ojZsb4Ru9JREErqqJTN0gU+oe5HvwJMxECpNn7G6IneuswwAuCajJbNrs06kRQBdhd6igjMC57gzQO152mNelkrPQApYwXb/IVu/miDXdW5vvCYKwxMGzy3/04pZOhiZdF8BwXgl3AzUc8PjW7+uffMgbCXJ+rcUDkGR4CpZi9oWstowKt+epX8gld3Hd9X+1cdky/qn6YWxmN77c6rAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkX3135EcBaDDBYxbWt0kU/WlELJdGxlrhUmSHDrMkA=;
 b=hizXUSWKkiRw2DvXU3rDVgYipo3m0hDm2JTKh8x58Ug4rtlWuPztLDM2lcFmiX2F+7VTOfKs2khBez/jb2dV86cKQLZsnuWhN53WJf4M/gIejCiOqP9clyJ+stW9Lkn3EFITfnKE2ALj4Y4jfS2AkJIfzBSrrmAYYtFIieB+aJdUSTzlBjxl/30xoODR7SyhvpRp/H2ZTR15ulWbqhRCerZGTsc9oI/9ho3bEK3dYwphrS+/x3Z7PeOZE4Vm5Dgd8Q4mti/OsWc8Q/X66o0GsfIDAJEfs/hNM+cr6plAXgf0EKBbVBWnqh+6t4qN9+HI+mjQ61X7Xwe56XDBeeLBHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 20:34:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 20:34:59 +0000
Message-ID: <2b20c2a7-5f1b-4615-aa97-bc20cf8cf787@intel.com>
Date: Thu, 4 Jan 2024 12:34:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/huc: Allow for very slow HuC loading
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20240102222202.310495-1-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240102222202.310495-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 101c0b92-3a12-4a0a-2830-08dc0d649ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtdRsLBad3ZXuvMY+l4yumY9wjkjtxCTc8XbjOd+Tq8ZU+ptvCE8SCpGFOdv6IpcSzK5Iy4PJCPGCKZoZfnPqgBbESHXpTGdkKTIfdSYpEWwO/osmCnWA4GXavQYtZZdrnzjezZUNxzXSqtTFqHOn1NNFfvr9VPkgdCpOcpv/rI0L6AnudBw3u/ufVZGd5jwGwWCvacOtjnKM5kv+Az58YKhRylmPWXtayjxYyF5f+HNOg0Bm7NUx68HH5geRevALPYb6zNh8e2FcvMAxT1wA9PjK69f/KOHrPYNerKyNAIYt+9hgQH3LLnK3jxxxKZTiQBj0TzQ1vkEJWus8m9QHVftVobXZqHck9V50ObKvM/HfQYPuyvrsxw6mmMMvQlscZY6xWXRSH+uFGiFOOKbvuQbnFflfgEOhhboSH2u0AoY8HBge1sUT2iq/MAyUznDHpRGXlBxkpHkmsylj6wW6iuXdLatE4H0ip6sUALULaS8QvkR7RLsN0lOGFMrtGCQPQhNXdfpom/Mi2hddCat0df0bk0yX22PnvtMH0gCd9d67zSldq3YD0EEq9pn8iMnO105mEWx0DNb+XcX+5Xfc4GrQb/cQHfuB1OPlum5RRXtLQ7WxCpYEwxWiKOKPIN7UFMInRJKtwyDnLQnGQOcjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(83380400001)(26005)(6512007)(31696002)(86362001)(38100700002)(36756003)(82960400001)(450100002)(5660300002)(66556008)(53546011)(316002)(6506007)(2616005)(8676002)(66476007)(8936002)(4326008)(66946007)(2906002)(478600001)(6486002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0dETFJOTnZORTlwN1UwbUhyQVFNeStidTFQVUIrSnM2YjBGOWNqQ0dKZ0V6?=
 =?utf-8?B?NDlEYTQza29xTE8xZXlDM3pERk5ieG9pS2Jmb2VkV2hMY3B3dXN5K1grQVVu?=
 =?utf-8?B?MnRKdmoyTVB6d1VKcG1sSW8rNy8ySnEvanVCeEJoVXJMUVVPalltZWcyTmhu?=
 =?utf-8?B?S1FwTUN3QzlxQkdQdUtXZStUazdWekZ3TFR0TGdtaGVmbnIyTVNXQjhGN3dm?=
 =?utf-8?B?Nk9YVlhxK1BFcVRCVnlsYVJENktKcmJaaUF4NUtpcnkwSUdpV3g3eDVaV2xB?=
 =?utf-8?B?K0dGejI2b09iQnRMejFaaG16c0FvN2pOK0txNzhFZGRHZGhjdVFsWGliS0Yr?=
 =?utf-8?B?QTF0NkkveE1DUVlldWNHNm5scmswQkp4d2ZOeW9uU3ozK3g0S0ZzNkRPaU5q?=
 =?utf-8?B?dmRUYmNJOFRJL1JwZzBBMDhPQ0tLcld0THlSclV2eC9DeXNUOTVhT0pyTnRX?=
 =?utf-8?B?d3BRTjdaUzN0K3JEdDBTa3BkTTBOVFBIMVBmUGJoakpvR3ZVZkRLZFRwdVM2?=
 =?utf-8?B?YzBPZGhVOG5SakNLZlA0ZWZLN3lZKy9BQ3d3SW9YOHVhdHVqMDBEeE90UTU3?=
 =?utf-8?B?NmlJbG5Ub2wweDVHUjhQVXdWcEx6WXV0ejk5bkViOXc2em9LVno0aldGR2xt?=
 =?utf-8?B?VlQ3dWJYYWIvTnRLUk5wMWhVTi9jTnZucTdrT0JUR0JsZU9PNEo4QUVGcldl?=
 =?utf-8?B?MTU3K3dIdG5ZMGh0UjY1YlAyeWw2M3pzWVhYSjNnVTNxZmhSK3pjeU9vdUt4?=
 =?utf-8?B?ZnpSRGhOS1R5aTRNbXpLTUsxYnc3ZlZyRS9vQ1dNZGVCcm5XdkFQeGh2VGhy?=
 =?utf-8?B?UE5JeWlKQlcwSVNkOGs1WTVIYWthdW0zeGREaGJXdmIwOGVpbXMxbWI1aTlV?=
 =?utf-8?B?NnBiWEdPanRaV3BBQUtFUitjWXF4bDBiUjQ1amtFYnMrd3pDTFd2Y25zTGcy?=
 =?utf-8?B?SjdDSmk3ZUNvVGxsaTBQaE84akZDV2pTV08vVFVPT3plc3N4dXNYQklZUFRH?=
 =?utf-8?B?dy94bWlBMkNIbGJsMjVBZzdjbU5xV0FVQVRML3JSL1pOYm5PbzE3ODNJZzM0?=
 =?utf-8?B?YmFJN3FpYU9RWnB6amxVUVg1eER6Ynp5U1A3UUk5MnJ0bUNBbXRydXNncFJP?=
 =?utf-8?B?ZXROaWo0UHk4MUx0c0ttczF3dm5Db2xxR0w5NmhTMlZ0N3pvR2JRbnRVd2ZN?=
 =?utf-8?B?ekdNcThPcGpyNjBZUWhmMmYyZks5UE1UaFdkTVJrOXROYTJFa3lmZlliR1Z0?=
 =?utf-8?B?c09rRldjWGpPLzhsNGV3L2F2YlJQYlNYcXQzZlo5L2o0VVBFdUVVR28yZ2hj?=
 =?utf-8?B?U1YvRHB3SnRITDVZbDdTTDBjdld4emVuMlp2Z0xweGZQeWJ2R1E2MENzeFZG?=
 =?utf-8?B?THg3WVVqR1NraFJoUzk1OEppRjY4dzhLaHBUZDRkU0ExZWp3MS96eGtGeXB0?=
 =?utf-8?B?K0FqQStQMkhqblFnUzNQMW0xOWYxSzIrUjRBV1VFTTJJbWdtNXNYclhuTEk1?=
 =?utf-8?B?RnBRamNMeDJBWGJzdTVWRENKYmx5R0hrYU9McXNNQlZXWG04ajVSQzNSenpI?=
 =?utf-8?B?MFhCM04zUXprOHpHaUFXZkRNR210ckVSZEI5QUxtbzRkM1dOaUVnV0FoWkRR?=
 =?utf-8?B?VHJPekJPTjBVMTRPUjQ1Q2txdDdEWjNPektzRllKNTYvbEJVcXl6SFNkQ1Fo?=
 =?utf-8?B?cVFDNXV4YUlxbDNIR0hJMnovRGdlOE1uaWtoODJKRzFDWlZqdlowZHBxOFI2?=
 =?utf-8?B?Y3JUQXB2YlpCQ25OcWplWTR5TE96TitORE81WFRoUGVHSEg3Yk5aaStWSzdI?=
 =?utf-8?B?K3FvckRuT1dKeElFa0hyNFhvUEE4b1RyREM2c1p0NlRXMVhFM0RkS09DVE9k?=
 =?utf-8?B?Si95d1BwZy9qQnJJa2NCcDI3UDBXZnpBQWxOZXl5SGZIMVdYTDl4UmI5WnBY?=
 =?utf-8?B?aWZ5akh1bGV5WEpyWHcwMjN3cVUrUFVPdUMydDNBc01wanZ5U2pvSFlvRzNm?=
 =?utf-8?B?QTFvYVFIdml2SEY1V01PYkVFKzcvczBOdDVhSzJ6bzNHZFd5S0MyYVozQkFF?=
 =?utf-8?B?QjRuSEM2VlYzQWJQR2U3UXc5MExESHpSZUJRQ0JXbjFzMWQ2V1hrYjZ0aDMx?=
 =?utf-8?B?ZHUvTVk3a3JpSW44MStpZWhVN2FXaUFpcFd3amw2OThJakVvcWxURDdGM3Yy?=
 =?utf-8?Q?L/UPpU/EuMocAwsj8VOYySU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 101c0b92-3a12-4a0a-2830-08dc0d649ed0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 20:34:59.3368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOpU/cf7fEAHQq+dh8gzB9osE5Ozv5loqy/VS6ecMJFOW46+Pg4z6e7pgWL3oZl2UD8KDKfOCuNN+3EfL3RT2S7zFia4UZtilRKKcN7w49c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
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



On 1/2/2024 2:22 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A failure to load the HuC is occasionally observed where the cause is
> believed to be a low GT frequency leading to very long load times.
>
> So a) increase the timeout so that the user still gets a working
> system even in the case of slow load. And b) report the frequency
> during the load to see if that is the cause of the slow down.
>
> Also update the similar code on the GuC load to not use uncore->gt
> when there is a local gt available. The two should match, but no need
> for unnecessary de-referencing.

Since the code is identical in almost identical in both places, I'm 
wondering if it is worth using a common waiter function and pass in a 
function pointer with the waiting logic. The cons of that is that we'd 
have to move to gt-level logging and pass in a tag, so not sure if it is 
worth it overall given that it isn't a lot of code. Maybe we should 
consider it when we implement this on the Xe-driver side?

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 10 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 64 ++++++++++++++++++++---
>   2 files changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 0f79cb6585182..52332bb143395 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -184,7 +184,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   	 * in the seconds range. However, there is a limit on how long an
>   	 * individual wait_for() can wait. So wrap it in a loop.
>   	 */
> -	before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
> +	before_freq = intel_rps_read_actual_frequency(&gt->rps);
>   	before = ktime_get();
>   	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>   		ret = wait_for(guc_load_done(uncore, &status, &success), 1000);
> @@ -192,7 +192,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   			break;
>   
>   		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz, status = 0x%08X [0x%02X/%02X]\n",
> -			count, intel_rps_read_actual_frequency(&uncore->gt->rps), status,
> +			count, intel_rps_read_actual_frequency(&gt->rps), status,
>   			REG_FIELD_GET(GS_BOOTROM_MASK, status),
>   			REG_FIELD_GET(GS_UKERNEL_MASK, status));
>   	}
> @@ -204,7 +204,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>   
>   		guc_info(guc, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz, ret = %d\n",
> -			 status, delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
> +			 status, delta_ms, intel_rps_read_actual_frequency(&gt->rps), ret);
>   		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>   			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>   			 bootrom, ukernel,
> @@ -254,11 +254,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>   			 delta_ms, status, count, ret);
>   		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			 intel_rps_read_actual_frequency(&uncore->gt->rps), before_freq,
> +			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
>   			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>   	} else {
>   		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> -			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
> +			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
>   			before_freq, status, count, ret);
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index ba9e07fc2b577..9ccec7de9628a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -6,6 +6,7 @@
>   #include <linux/types.h>
>   
>   #include "gt/intel_gt.h"
> +#include "gt/intel_rps.h"
>   #include "intel_guc_reg.h"
>   #include "intel_huc.h"
>   #include "intel_huc_print.h"
> @@ -447,17 +448,68 @@ static const char *auth_mode_string(struct intel_huc *huc,
>   	return partial ? "clear media" : "all workloads";
>   }
>   
> +/*
> + * Use a longer timeout for debug builds so that problems can be detected
> + * and analysed. But a shorter timeout for releases so that user's don't
> + * wait forever to find out there is a problem. Note that the only reason
> + * an end user should hit the timeout is in case of extreme thermal throttling.
> + * And a system that is that hot during boot is probably dead anyway!
> + */
> +#if defined(CONFIG_DRM_I915_DEBUG_GEM)
> +#define HUC_LOAD_RETRY_LIMIT   20
> +#else
> +#define HUC_LOAD_RETRY_LIMIT   3
> +#endif
> +
>   int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
>   				     enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
> -	int ret;
> +	struct intel_uncore *uncore = gt->uncore;
> +	ktime_t before, after, delta;
> +	int ret, count;
> +	u64 delta_ms;
> +	u32 before_freq;
>   
> -	ret = __intel_wait_for_register(gt->uncore,
> -					huc->status[type].reg,
> -					huc->status[type].mask,
> -					huc->status[type].value,
> -					2, 50, NULL);
> +	/*
> +	 * The KMD requests maximum frequency during driver load, however thermal
> +	 * throttling can force the frequency down to minimum (although the board
> +	 * really should never get that hot in real life!). IFWI  issues have been
> +	 * seen to cause sporadic failures to grant the higher frequency. And at
> +	 * minimum frequency, the load time can be in the seconds range. Note that

this is not load time but auth time. With this fixed (when applying is 
fine):

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	 * there is a limit on how long an individual wait_for() can wait. So wrap
> +	 * it in a loop.
> +	 */
> +	before_freq = intel_rps_read_actual_frequency(&gt->rps);
> +	before = ktime_get();
> +	for (count = 0; count < HUC_LOAD_RETRY_LIMIT; count++) {
> +		ret = __intel_wait_for_register(gt->uncore,
> +						huc->status[type].reg,
> +						huc->status[type].mask,
> +						huc->status[type].value,
> +						2, 1000, NULL);
> +		if (!ret)
> +			break;
> +
> +		huc_dbg(huc, "auth still in progress, count = %d, freq = %dMHz, status = 0x%08X\n",
> +			count, intel_rps_read_actual_frequency(&gt->rps),
> +			huc->status[type].reg.reg);
> +	}
> +	after = ktime_get();
> +	delta = ktime_sub(after, before);
> +	delta_ms = ktime_to_ms(delta);
> +
> +	if (delta_ms > 50) {
> +		huc_warn(huc, "excessive auth time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
> +			 delta_ms, huc->status[type].reg.reg, count, ret);
> +		huc_warn(huc, "excessive auth time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
> +			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
> +	} else {
> +		huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
> +			before_freq, huc->status[type].reg.reg, count, ret);
> +	}
>   
>   	/* mark the load process as complete even if the wait failed */
>   	delayed_huc_load_complete(huc);

