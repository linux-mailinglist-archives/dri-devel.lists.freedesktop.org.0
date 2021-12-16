Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D368478052
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 00:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEE710E365;
	Thu, 16 Dec 2021 23:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893EE10E365;
 Thu, 16 Dec 2021 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639696341; x=1671232341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6olF4DbVmvnKwcI5jCp1STqUV84eXfhzFTRflz6YmQA=;
 b=R8ryJaC1xlcaGCx23duJhzKODY2ukn7PpwF/BD2kN6TnPoj7gV8KVptk
 HU0Seho9Renw7sYmu5PRHQqHui0/zLJrfTJTg30klqd2EYscjkI/T9kgA
 PYaAuWWpbL8w8+GlSqegCcbh3dJnFyk6xqhXfgFFPz8jeCDtqKYCVBZFx
 EHsUBn2evbppHI8+Q+Uj3rdPbTbf12CozDxSnyAqCG1wecgPiqb9RoWVs
 3zc+k45TYbNj5ViciOb7N0JRhh4lWUo1zB/HIYaxGeFBXFGqwJTh4I8cc
 +RCHSuOghEjPmA8TmdSoBNzcFgkS1Olsub/bczuwGJo9EyrTuREUSTDbx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239849074"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="239849074"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="464891255"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 16 Dec 2021 15:12:20 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 15:12:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 15:12:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 15:12:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWZXnb3DJdicBPbqJVOD0LQOXfN5sBDxQS0eIQhm3AESqQfTlx8UPQYLo0KBzuOeVQpivsqN3uVDMJH4gAvKwi8ZhqCq7MbmYHvX3JKt9wnY3Lvf3QU4JQ74Pr1E/RG/5QoUPSEGyGxqsSYc3WWl7HB/PSfi8HkNr37HGgOGazfoJH+qGxBAprPlER/GhPZZ1KHcNZOwUnsh34aUGAWjH49aOX9PAfM1TvUaiblWFjy4ca7kK02rqalwPAgTe6koW7c1k6/M0oe74VGh7/IUIcTeL4AqAHZok0foiH+WRIrX6+0siFVQ6KqK/GE0yqip6XFTm71WOLTv7NiaodYaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW1akhpRhjEMIJ3QS7mkSmymIPjADzOctqNttgxcCDc=;
 b=einSuaR48uGNUp6sdhV1CRuRS7L1OZs9i51w2eUhGwg98QotlD8/dRstpeeTGv+kwWahlJvXUsM83HXVAM/HZba12OpPMXlVoRakRThv0+oeNCc5EOQAtnhlGq+Cb66cMY/neSKD2FwiHlQwKUx6C4YQvAbFhtFaHR6B/UD+jSBo+zzw9QKcCRZX2Aqmtc6tPTyRmyrVDoi50n5Ncx7/P5l2JQ8gmD+/4iJWwXK6Br2PdKTxluOnWcPjCRAufpzIzPbP2KxiFdufe7LfhmqSrucxhnqwOdaXDyHrGIuCJLh2fGYyx8DPylHl5r0qdv/7BcdNH2d007nuwSSSMZ0OLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 23:12:18 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4690.026; Thu, 16 Dec 2021
 23:12:18 +0000
Message-ID: <3811ae8d-2a5f-a4c2-60f5-bc05ee7fff12@intel.com>
Date: Thu, 16 Dec 2021 15:12:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v8 13/16] drm/i915/gt: Use to_gt() helper for
 GGTT accesses
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20211214193346.21231-1-andi.shyti@linux.intel.com>
 <20211214193346.21231-14-andi.shyti@linux.intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20211214193346.21231-14-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
Received: from [10.0.0.208] (67.181.129.204) by
 SJ0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:33a::10) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 23:12:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3feb3e1-5c7d-43bc-a17e-08d9c0e9818a
X-MS-TrafficTypeDiagnostic: DM8PR11MB5670:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM8PR11MB567034ABC201CD2BBDC4DDEA8C779@DM8PR11MB5670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtcdHssWuhIhFp+RStBeJWNFUP9mcZ61MPB227rLSNjGto3QRAxmJhWbBfVJH5fWN0b75RrcUY0PpnrnI7wUMfXMvh1yJTp8Rtu38CHncgAtqJ52pFBwXKIlZWii6Cquyk02c+oIdLjOPAUAxY09W9C4NqJ1875foYtU4ywa6O89jkzPAfY5O+xdhvyo0yKzYuxT96QVybTomTUQ6vjTnobL/Ipu4vAk9BfrmoxB6NXGsejnm2tjIvVlNzt4CKOssY8vrYc5J1KZnQyKSzoWmP4v2AqztQuFae2dRU4sdCtkdlr8k/JMVE6CaZCnOPAJrCRAcVTGzsZirVmbc5iOkJt4IPsduKBZH/f2/OkIPkToR9oTDPhxIUK5wEFM9St7YC8GzJVBnFxgxevKWj0c40dNG6cStRdvIhu8NNd7PSvmItuD1hQXkY8XPK9epTMfu5BpvDLdYw0642d6JF0L9UGkaKAhcvQTQxhUTCFJofk5hYwAsJRFFtjeRba/fCiD3imfrT9Zb0Tofw7h1yEVjK0vyrOIL9o3yB2Qa9yDXwhZI8Udi3e7wB0ayt9V1Wa/AxhWkuqF2owtgNP5pn3puZuxRSYb5jdjrEg5A7oQtVWk7xkqPRmyJyIw9pRQgcXUePrARb5PQNnGXyIJZgm2LHrdI+9S3nxhFXjeXmUHFMTsXoXfsSZOP3hBHxwCk9Dxd/X9zH9kF3a/3a+JVecRNRfeVKU22Buz2HYCyAESdUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(82960400001)(53546011)(8936002)(26005)(38100700002)(31696002)(6486002)(5660300002)(2906002)(316002)(86362001)(83380400001)(508600001)(2616005)(110136005)(66476007)(36756003)(66556008)(186003)(66946007)(4326008)(16576012)(31686004)(54906003)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm9Qa1RFc2c4djc2ZEhuNkRIUjZXSnBKdy9XSUdzR3ovU0dVc2dsLzFabWMz?=
 =?utf-8?B?aCttTERlWk8wbFRaQlU1bVcyc20rREdLUkF2cldsd1llb1pPWmJmUVhTYUg0?=
 =?utf-8?B?R0xwMjlxTW5VT0JmeDRmRkJzc1RlMFNydWVFU1U4c3JWY2YzK2FCdS9pNksz?=
 =?utf-8?B?RFNKamZxQWdNaWJ5NVZQcGsySXZHa2tyRlRZblc3ekJ0eHo3RXJxSHllNkR3?=
 =?utf-8?B?eWt4aUVyNC9PeXN5eUhpM0oyVGJFdGlPMkpOelprMWZFK3VQYmttSmV1TzRS?=
 =?utf-8?B?N3c5UmhheTZBa05lN0hodDFLL29yM0FKSHhTc0x4b2pnamtSZEJocnZrRlox?=
 =?utf-8?B?bFpEQ1FzMEt5QzgyQ01YZGpvcnA1eGJmd1VlRHoxNmxNWElJR291TXBGSCt3?=
 =?utf-8?B?aHFCODJ1c0JNeEZMazFDZXorZW1UUmxQV3doNmhTUTBBK3BpcE16cnNLUmtF?=
 =?utf-8?B?Qjg1Mkp1dXptUFFaZWkxYVBHWUJPb1BJY3dONWdiVFk5ejRXZDlKRGdpSE51?=
 =?utf-8?B?VjZpektJek83TFVvVXZxdWRRU1poRlovRUNsTVM3WWloY2kwZVR1RkVTa29y?=
 =?utf-8?B?WXpNNnh3cTdHcjlhS3Z4bWIwQmJsc2ZNblEyMVVJZ2ZmQVRVVU1PTTRZM3h6?=
 =?utf-8?B?eWVsL3hDeDFzcjBOOGhpckY4N2gvWWUvYm0rZ2pkRFNscFpZaVlTMUd2VVpp?=
 =?utf-8?B?MWNVM2szQWVtTFhERE8xNGhtU0c3Z3ExeFhUYTlMSWFMakozUExWa0o2YU1j?=
 =?utf-8?B?WCtHTnkyYi9xaDNMQTJVYy9iRG0rdjNPakY3MHZ0V1V5M2lOUmh2YWlZc1hi?=
 =?utf-8?B?T2RlY3h4MEtDL0hjVnpyTHNPMHdkNnFlRWhGUk90V1YxcHNDZXNqYlhGc044?=
 =?utf-8?B?WmwxUWt5cGVWWjI2amVHeDJWeEo0U0Rjbm9KYXdMdnE0YzRvWnY3bUxCZ1VN?=
 =?utf-8?B?WElDbEpqQVNDNHlaOGJOQlRCZ2wvUjBncXIzU3BueGpNdUlITkFFMHhLSklj?=
 =?utf-8?B?NXQvUVRrUlFGbVFXcXFSNnJQa1FZODRVbGtmME5DOEt0dThKM2FvSDFsTngx?=
 =?utf-8?B?Q2tTYVdYVjFhcmRocm5iRU9lVkJaeGFpNlRzUm5rNjZJdjBrVThPRkdHM2J2?=
 =?utf-8?B?TkhhUU9sSm15SHUzUnB2b2xjZGg5WFhpSnRua0F3Q3pRcGg5TURRdnlPTEx2?=
 =?utf-8?B?TkZhN290ekliZFBWZ1NhbjhZb2ROWmdwcWNLNHB2Q3lLRkVtcnhGVXVXMld0?=
 =?utf-8?B?RFJaOUNCdVB4MXV2SDdTTlBGQllnVVJoRmtRR0JaVHcvU3N1L00wMlRqN21x?=
 =?utf-8?B?Q3g2dkZUeFN1QmdFY1E4WjZBS1lpTllGb3dlaHlRUDIzWDhnVmFoZWVla3do?=
 =?utf-8?B?by9yYWpkYVdQUVFPTGVJenpyMDVqTSthUXRkSUo1Tm9UMTJoYlBrbTZMcmZm?=
 =?utf-8?B?dVp2cElnczdWTG9WREtJbU1sS0hheU8vUWJLK0lmcG5VNTlrcjZINWFIeWZQ?=
 =?utf-8?B?SkFuRGVFeXZJTW9Ja3lFVTFtM2UwdGpkV1FaTm85NGpjY2dZeFpTUFdoejA4?=
 =?utf-8?B?UmxYbnBaMW91Tm02dVRIVTRNa2Uwb1N0bXJZdUxvWDJ6TTZ1ZGxJMDF6OGRs?=
 =?utf-8?B?bmlROElxaTRSc2JaNVNNV2RQY3pOekx1ZXh5eGtZSksyWkNSSzdkWHpBU0Yw?=
 =?utf-8?B?RVlZRWlmQUoxSGVtSTRyQ3BOenFLcEhndjhla3dEeEJ5L1FKOGVkdWdLZm9j?=
 =?utf-8?B?T1FDUFczeEU1U3ZqZmJXWXhtbTRwQk1PWHptVWgySUU2N3pSTGJ3dHZ6ZXNO?=
 =?utf-8?B?eHcxWThmUUk5Skx5QVh2R1VaVmRldVR0M1lKdGVxZUN6cW5ETzJKUFVYNXRG?=
 =?utf-8?B?RmJHUmRldVV3aG53QS92bDZQTy92SmxaYUlkZVJxS2gweHJzYTVVYlBlWXBK?=
 =?utf-8?B?MENvYitsMmdFR3V2Y0RoNWZDemg3WE4zdWhmM2tQRkl5NVFKcnpqUUhSTEx6?=
 =?utf-8?B?MHQxRDlYdnFiekRrTkdjSjlJckpkTDNkVHZPbXp4Y0ZORlNmbi9iYlhWdDl5?=
 =?utf-8?B?UWoyMjRSM0pPekN3V0tnRWF6ZFh5ejVIcFJVTWc1cHR4MVZzTmNtM0ZyZzB6?=
 =?utf-8?B?Q1Rsa3Z1OEU4aWRwRVpScTBRVW1aT1FRVFRxQlk3TDRsZHRFWHExRTdsa1pk?=
 =?utf-8?B?djVkZFA3R2RlVXJOdVU5OXdjaTVmaXRyU0tFM0xBUXNDdXBicmZNcCt6TTBm?=
 =?utf-8?B?aWI1NkpLaFdxZTNvWHlrSXdKUURnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3feb3e1-5c7d-43bc-a17e-08d9c0e9818a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 23:12:18.4010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUfa19ifdu/VlwaUc/eDDgIBVFPN9aSUOnYjrWTvtBKROQKXB+ExBUmoCD/PsjN1EkUIVrRJCOaXEUK5s3JdxIwOIC0twT6Xdg0XO5D6+1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/14/2021 11:33 AM, Andi Shyti wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
>
> GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> eventually want to get rid of the i915->ggtt one.
> Use to_gt() for all i915->ggtt accesses to help with the future
> refactoring.
>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c         | 14 +++++++-------
>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c |  6 +++---
>   drivers/gpu/drm/i915/gt/intel_region_lmem.c  |  4 ++--
>   drivers/gpu/drm/i915/gt/selftest_reset.c     |  2 +-
>   4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 971e737b37b2..ec3b998392ff 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -89,7 +89,7 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
>   	 * beyond the end of the batch buffer, across the page boundary,
>   	 * and beyond the end of the GTT if we do not provide a guard.
>   	 */
> -	ret = ggtt_init_hw(&i915->ggtt);
> +	ret = ggtt_init_hw(to_gt(i915)->ggtt);
>   	if (ret)
>   		return ret;
>   
> @@ -725,14 +725,14 @@ int i915_init_ggtt(struct drm_i915_private *i915)
>   {
>   	int ret;
>   
> -	ret = init_ggtt(&i915->ggtt);
> +	ret = init_ggtt(to_gt(i915)->ggtt);
>   	if (ret)
>   		return ret;
>   
>   	if (INTEL_PPGTT(i915) == INTEL_PPGTT_ALIASING) {
> -		ret = init_aliasing_ppgtt(&i915->ggtt);
> +		ret = init_aliasing_ppgtt(to_gt(i915)->ggtt);
>   		if (ret)
> -			cleanup_init_ggtt(&i915->ggtt);
> +			cleanup_init_ggtt(to_gt(i915)->ggtt);
>   	}
>   
>   	return 0;
> @@ -775,7 +775,7 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
>    */
>   void i915_ggtt_driver_release(struct drm_i915_private *i915)
>   {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   
>   	fini_aliasing_ppgtt(ggtt);
>   
> @@ -790,7 +790,7 @@ void i915_ggtt_driver_release(struct drm_i915_private *i915)
>    */
>   void i915_ggtt_driver_late_release(struct drm_i915_private *i915)
>   {
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   
>   	GEM_WARN_ON(kref_read(&ggtt->vm.resv_ref) != 1);
>   	dma_resv_fini(&ggtt->vm._resv);
> @@ -1232,7 +1232,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
>   {
>   	int ret;
>   
> -	ret = ggtt_probe_hw(&i915->ggtt, to_gt(i915));
> +	ret = ggtt_probe_hw(to_gt(i915)->ggtt, to_gt(i915));
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> index f8948de72036..beabf3bc9b75 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
> @@ -728,8 +728,8 @@ static void detect_bit_6_swizzle(struct i915_ggtt *ggtt)
>   		swizzle_y = I915_BIT_6_SWIZZLE_NONE;
>   	}
>   
> -	i915->ggtt.bit_6_swizzle_x = swizzle_x;
> -	i915->ggtt.bit_6_swizzle_y = swizzle_y;
> +	to_gt(i915)->ggtt->bit_6_swizzle_x = swizzle_x;
> +	to_gt(i915)->ggtt->bit_6_swizzle_y = swizzle_y;
>   }
>   
>   /*
> @@ -896,7 +896,7 @@ void intel_gt_init_swizzling(struct intel_gt *gt)
>   	struct intel_uncore *uncore = gt->uncore;
>   
>   	if (GRAPHICS_VER(i915) < 5 ||
> -	    i915->ggtt.bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
> +	    to_gt(i915)->ggtt->bit_6_swizzle_x == I915_BIT_6_SWIZZLE_NONE)
>   		return;
>   
>   	intel_uncore_rmw(uncore, DISP_ARB_CTL, 0, DISP_TILE_SURFACE_SWIZZLING);
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> index fde2dcb59809..21215a080088 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -15,7 +15,7 @@
>   static int init_fake_lmem_bar(struct intel_memory_region *mem)
>   {
>   	struct drm_i915_private *i915 = mem->i915;
> -	struct i915_ggtt *ggtt = &i915->ggtt;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	unsigned long n;
>   	int ret;
>   
> @@ -131,7 +131,7 @@ intel_gt_setup_fake_lmem(struct intel_gt *gt)
>   	if (!i915->params.fake_lmem_start)
>   		return ERR_PTR(-ENODEV);
>   
> -	GEM_BUG_ON(i915_ggtt_has_aperture(&i915->ggtt));
> +	GEM_BUG_ON(i915_ggtt_has_aperture(to_gt(i915)->ggtt));
>   
>   	/* Your mappable aperture belongs to me now! */
>   	mappable_end = pci_resource_len(pdev, 2);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 8a873f6bda7f..37c38bdd5f47 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -19,7 +19,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>   		   intel_engine_mask_t mask,
>   		   const char *msg)
>   {
> -	struct i915_ggtt *ggtt = &gt->i915->ggtt;
> +	struct i915_ggtt *ggtt = gt->ggtt;
>   	const struct resource *dsm = &gt->i915->dsm;
>   	resource_size_t num_pages, page;
>   	struct intel_engine_cs *engine;
Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
