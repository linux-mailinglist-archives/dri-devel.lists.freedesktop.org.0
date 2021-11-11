Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7B44DB9E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 19:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60B66EB08;
	Thu, 11 Nov 2021 18:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048C6E1FB;
 Thu, 11 Nov 2021 18:29:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319189370"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="319189370"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 10:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="583495538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2021 10:29:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 10:29:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 10:29:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 10:29:43 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 11 Nov 2021 10:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enoBoHIDbYgavTu8vQvVm6izSDviiguiWivuEbzuFAnTs4MMrxQQpataUVlycHwDYRLu9LESWYb5JdrdOjqHPPn3D4sqkrmnCI7wznLOdUjB1VXe9KRCWimToLYgZ/VmTYNNCt3bzfCDUeQpD+o4gyimJZtdM+fE0Jo885m/Y4K4/2j3BkJgW6zOn6DoLUWkeFniCXkchv+9XztIENRqjRrWDNE7Y+fC0AZhniSjcaGJj3+YevL52BBSNZ4494G8awWI6wb5YF3tDQkmWIGcVziAQ4MV5KeBZlgbdZG72aiXgOFgJz1RemmwuNZgx2pN2u5PMvGFcWd4PvOOQIQjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O2Uq/HeNjZyGsTFlrlMyC8dfm1owrJzmhMAEjX12to=;
 b=QZoMsNJK5T+yaguc1MrJhLpcBKruCjVBwopwo/t4UzrV5/zgu1OPPL3zMaaQsFK+lMbaeikBXKgEpuVX5koEzdFtj9cUjgtbYOceEtMXjtNCqR734yIY27DuX6lxzkHoYbpYRpDKvmBMxk+QrOkAxaEhXhg/GcP4foxt+Yqo5mpN2ntGGVKhjEc5Xz2jer/ZdkpRmYGD+Xxfxm7p9BtPH8sudMKNRG5jLsqn/K+Ooo/CePICYum6vNb3kgfHu9kjAAoWHNvTffv0Zd28xLS5iaWexRocfXRhYCqY9OGLAMYAkyfukBsIJgwRGSPc3214fzBoipcyrV1K8JsKb0WViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O2Uq/HeNjZyGsTFlrlMyC8dfm1owrJzmhMAEjX12to=;
 b=Kbbr9JYpBeQNRTwdizhKUBRR1NriK+BVmFmuGnjc5Peda9Dq3FBeagXMy6y1lY2HKe+Ow9ukwXYiZpBemY56K7/nBxswkFwUUHqoiwH027LMifrdxUi4G50i1VjljMr21pBl4TqlRd/DCtl/wBQCXHiSMFR1DaO8WMcyv2oR0es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN8PR11MB3841.namprd11.prod.outlook.com (2603:10b6:408:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 11 Nov
 2021 18:28:56 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::a928:c569:3d52:cb2]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::a928:c569:3d52:cb2%4]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 18:28:56 +0000
Subject: Re: [PATCH 3/3] drm/i915/dg2: Program recommended HW settings
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20211102222511.534310-1-matthew.d.roper@intel.com>
 <20211102222511.534310-4-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <b6ac755f-bf0b-5f60-6200-62dc821b1dec@intel.com>
Date: Thu, 11 Nov 2021 10:28:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211102222511.534310-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.254.19.152] (192.55.52.200) by
 SJ0PR03CA0160.namprd03.prod.outlook.com (2603:10b6:a03:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 18:28:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc8bc76d-c8bd-4c35-c4a5-08d9a5411eb9
X-MS-TrafficTypeDiagnostic: BN8PR11MB3841:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR11MB3841B9097D2D7B39DA1F1B64CE949@BN8PR11MB3841.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3p45xGuYEbIZ00/VcPHLwmfJCf4KZvmObeYJMsEr8DdIeAjqh2q74h51hZxi+kqLWX49oOlkIS7PnDZ1XDGp2qhCNYPWSfZo5EiIrIBL+sPnFVB7S5WbgC+bO3GhqNuppRjrEq1UB9+Y0w2+Scf8gkzoEUp1pyDp4OKUAZAGJM9XWBYotnHagfTKRZlFjPbBKNtzJMi4OQ2cikIzi7SWqwAF4643yfJzBVoxiGEHRU0aHWH53/Gi6L2WfT8+ToevjBJ/P4dCrX1hDSWTJvGE/zjqSP/n9dXECeWDRSrhKKTu0n1w+i1px7cMrWTw28p3FBO5SPk7IOUSVJ038ODsgFV9HZVgEmGhDDMdx5iZnfQsnG9/lEBSLJHj6uE5Ael5tjkWFgcU8LNXODHZVaDXn3khxWKVwJLDw82gGZxSj+ily/xq7C0YG8BUXNpXHLWrHELwpgvFYSHSjII1fWFEgylc8zDgoGBDoHilKJoX8doNNlitlaQFCA+5sRVRo9nFNDPkvAqYUb8te4WtbB2LwvaRFo1A0JFjL3r0Sn8IKm3B1mowYX2/svxttsw6/Wf/aCnhcf2l7K8BIhkcj7A+Kk1zdc58pQ+vf97FmOFn2XG8A6sG/6uRmEJpn+Q3No6WQWE/x23zFY2L6F7XysYmShpTY/vy1A8ijuD+T8tr0G8svYMRJwZ18sNKUSleytsfT1YqoNsOdHJghWlGlTo3EcnBohyANZeQsMc3cgeoes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(31686004)(4326008)(2906002)(5660300002)(16576012)(8676002)(36756003)(38100700002)(66556008)(31696002)(66476007)(53546011)(508600001)(316002)(26005)(83380400001)(6486002)(66946007)(450100002)(8936002)(82960400001)(186003)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3AwT0hHYWtCckJNMVpNVjlxVE9JTFlDMElCTXp6clYzeWs1RWFxZjVxZk1m?=
 =?utf-8?B?c1I4aWlFako4dHBUOVNaT3MwM1ZrZ2VOY2lxUzVOa0EwSktqUittcUkxMmgv?=
 =?utf-8?B?V2NCRlp5cHpPczVuaUxNWVpXMjM1Nlh4azgvTkM0cWE1dHFZU1N6UExlSm4w?=
 =?utf-8?B?elVST2NGTHVtSzJXNm91bTFESUdUanowZThEdnNPcWFoZnBQdVRrYXd2YXcy?=
 =?utf-8?B?ZXBxRmZJdFlpWXFleUpOVmMrTS8xbVVyWXE5T0lmYjI3Nlp5cXZmeGFNV1pq?=
 =?utf-8?B?KzU4VXhKN2JlZWdrK1BYMFZDWlFyLzRjN2hQaktjRi9tNWZ2bithWEhab2tr?=
 =?utf-8?B?ZGtzajJJcHUzamJQMDk2QjkrdktPUTNNSDNieXZ3azlQVFQ1TlJCaWF0S0Jv?=
 =?utf-8?B?TFFUcS9sSjdrc0YvTzNRTGRYZEhRR1piYVN4MXZIVExrZzMzS1B6QVNPYi9L?=
 =?utf-8?B?QUZCZ0Qzd2ZFM1dvcEF6WnNNMU4vWFVqNUlsNWRVYlJNOE1reWZjVWEwdkFk?=
 =?utf-8?B?WENBcW5PVEhuam8vYnI3VUUvbGljUHNyRUNWalBBbEVHeGFQQ1BjTlpHc3g2?=
 =?utf-8?B?TjJ5YUN1WTZhUmxyUVVlcUtpU00yd1lhaUhSRjNYaldNanJ2WUN1R1FVSm1U?=
 =?utf-8?B?QUZjeG1aY0ZKQTArekJyb2NQOVFsWVZldzZpMGhNREN3Qm90ZnpDOFNHVm9j?=
 =?utf-8?B?RDlTQWE5R0p4c0E5RElWcWpLbWhPbWp0VldlbkMxdXk0T0pBSXQzRzNBdmk1?=
 =?utf-8?B?UldUVHdYclo5M095YlJTNE5Rcm0yLzM3TlN1eld4c1hub0xQVGJYVThSUkNn?=
 =?utf-8?B?TXZyWUhBNEdxZGgzRFlJZVM2SlkybkZKT0lWLzdPMmF3VkNVR3NaUWxnYzE5?=
 =?utf-8?B?NG9vRm1sTXFiK0pDMWcyQW9zRkF1cTJXZXFrZ1BnY1hZbDNOczNuRnFINyta?=
 =?utf-8?B?TjZBK0pjcmJIQmFvSHBUaVp2K01sTHFKcjlmTGs2bnRoU2Yrbzk0aWkvU2dE?=
 =?utf-8?B?dFk0WWNIbWFOM0ZpSDQwV3hxNHY5V09kN0FMZmZwSERLZlk1SEk5TEt2ZTUz?=
 =?utf-8?B?dHNOVXJ3T1Bra2p1R1RxbzhFN3FrQ1l4NXVwYXdjLzJ1aWt2YmdBSDhQNEps?=
 =?utf-8?B?ZC9KQXRsVG5IUStuYnNUSUEvMGhCbHhJbHBEcklhR2hHQjFtc0tkUGtjV05o?=
 =?utf-8?B?RWxIU2FNOXJFNzRkTnpBVkM2Y3ordGFUMFFjdXErR1d4dUNidXRSN3M0bHIx?=
 =?utf-8?B?Y1lpenlNQUpTUXM0ZXdiWFArN2NzUmNEc1JwSXJ1M2VrUU1nSmVJYWlFOEZX?=
 =?utf-8?B?aXVqeEN4bzZPTTVZTXdOYXpWWTJYT21xTEwrMVgvb0ZOZEN2MGI4Nys3SEVW?=
 =?utf-8?B?NlhVaDcra1Z0UVArZDVBREpYVzF2NFUyMHp2R29CY2ZJK0Y4cDI5a1JGdGNY?=
 =?utf-8?B?TFJUbUNNZXhDMkpLQi9tZDFKa3FkT3p3Y0EzZnZMbEJKYkJHZHl4cDRscVZ6?=
 =?utf-8?B?WWsydS9BWlYzdzN4eDJNNG9uZG9vWTBWdnBDTVU4MHVIcTR2NUlnbzJ4ZmtB?=
 =?utf-8?B?TlRBSkM2dzM0WUVVNGRkQ2lqTGRCVFRDcS9YL0haTVZ2WDRiUXROSHl0b3Y1?=
 =?utf-8?B?TkV5d1hza1V0RTJUTjFDVm55YWlJSlh0SFBZS2ZScTBSUS9iV1prbWlxS3ph?=
 =?utf-8?B?L2lZS0piWXdCcDdKRENhekYwSmdzS1UzTitIVWxpOWIwam1PdkJVSDUrOWtH?=
 =?utf-8?B?UTVRRmFvTzZ5YTMvOTFwcHRkRENmdEhENHVzc3FQdmVYSGxhcVpOOHE4czVR?=
 =?utf-8?B?Wmh1bzZPb1J3emhhS20vbkcvS2xab0VIckVWMWhQSnEwS2NEL0R4WXFkUHFy?=
 =?utf-8?B?VTE3RW5qQ0NBc3lhck14a0wxYU9ZcjAxaGw1TkxDYnlqanNPeHpGUzF0NmZZ?=
 =?utf-8?B?blB3M1FDbFpNYjczV0lDSC8wMzFPbTFRNGxsU3krWm9iMDhEeEF4QU0zeHF4?=
 =?utf-8?B?MEVpQnRuVS9XVk5WR0JTSzlTaVI5Yzd2NEVUc3NnOFNGY0x4aVZNTWx4NnVv?=
 =?utf-8?B?NjJLUG4ySjJDb1ZObEI2U1hwVEdQaU5QbDZnbnhpTERjVXpiMlQwaVhuemE4?=
 =?utf-8?B?dkUzbHJkUVJkOUFXdzRLcDVsUVZLbDdpSE45anlib1BXQzE4NENXWXFodERQ?=
 =?utf-8?B?dHh2UXBvUjROSVp0cGVmcldNbWJuSkRYdFR5bnc5QVBQSUxxUWppQTBjU1k3?=
 =?utf-8?B?c1gxMWlBQVl5alVMalNHaUluZ3RRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8bc76d-c8bd-4c35-c4a5-08d9a5411eb9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 18:28:56.1353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeVgzOC4Wc0XBE0tFpzdpzSSwkGAcVuTcIgnTiePadBBI2088HNQrefZDXrD4Fi9PQxxH/XtP25u7bWO+9LLo9OTCR+wZfNxRIHv76Nzx30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3841
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint


On 11/2/21 3:25 PM, Matt Roper wrote:
> The bspec's performance guide suggests programming specific values into
> a few registers for optimal performance.  Although these aren't
> workarounds, it's easiest to handle them inside the GT workaround
> functions (which will also ensure that the values set here are properly
> melded with other bits in the same registers that _are_ set by
> workarounds).
>
> Bspec: 68331, 45395
>
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Siddiqui Ayaz A <ayaz.siddiqui@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 ++++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h             |  9 +++++++
>   2 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 37fd541a9719..51591119da15 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -558,6 +558,22 @@ static void icl_ctx_workarounds_init(struct intel_engine_cs *engine,
>   	wa_masked_en(wal, GEN9_ROW_CHICKEN4, GEN11_DIS_PICK_2ND_EU);
>   }
>   
> +/*
> + * These settings aren't actually workarounds, but general tuning settings that
> + * need to be programmed on dg2 platform.
> + */
> +static void dg2_ctx_gt_tuning_init(struct intel_engine_cs *engine,
> +				   struct i915_wa_list *wal)
> +{
> +	wa_write_clr_set(wal, GEN11_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
> +			 REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f));
> +	wa_add(wal,
> +	       FF_MODE2,
> +	       FF_MODE2_TDS_TIMER_MASK,
> +	       FF_MODE2_TDS_TIMER_128,
> +	       0, false);
> +}
> +
>   /*
>    * These settings aren't actually workarounds, but general tuning settings that
>    * need to be programmed on several platforms.
> @@ -647,7 +663,7 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>   static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
>   				     struct i915_wa_list *wal)
>   {
> -	gen12_ctx_gt_tuning_init(engine, wal);
> +	dg2_ctx_gt_tuning_init(engine, wal);
>   
>   	/* Wa_16011186671:dg2_g11 */
>   	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> @@ -1482,6 +1498,14 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   
>   	/* Wa_14014830051:dg2 */
>   	wa_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
> +
> +	/*
> +	 * The following are not actually "workarounds" but rather
> +	 * recommended tuning settings documented in the bspec's
> +	 * performance guide section.
> +	 */
> +	wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> +	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
>   }
>   
>   static void
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index ee39d6bd0f3c..ef3b5732faad 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -731,6 +731,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>   
>   #define GEN12_OA_TLB_INV_CR _MMIO(0xceec)
>   
> +#define GEN12_SQCM		_MMIO(0x8724)
> +#define   EN_32B_ACCESS		REG_BIT(30)
> +
>   /* Gen12 OAR unit */
>   #define GEN12_OAR_OACONTROL _MMIO(0x2960)
>   #define  GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT 1
> @@ -8506,6 +8509,12 @@ enum {
>   #define  GEN8_LQSC_FLUSH_COHERENT_LINES		(1 << 21)
>   #define  GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE REG_BIT(22)
>   
> +#define GEN11_L3SQCREG5				_MMIO(0xb158)
> +#define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
> +
> +#define XEHP_L3SCQREG7				_MMIO(0xb188)
> +#define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
> +
>   /* GEN8 chicken */
>   #define HDC_CHICKEN0				_MMIO(0x7300)
>   #define ICL_HDC_MODE				_MMIO(0xE5F4)
