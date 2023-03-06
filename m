Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8C6AD2CA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 00:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D7310E24F;
	Mon,  6 Mar 2023 23:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E638910E012;
 Mon,  6 Mar 2023 23:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678144693; x=1709680693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+3pBIWTgieivAC9WaRB7GSIWcRRNH7FQN0hlNLkN/yU=;
 b=a6TJJjtOZGSaQzvhoN12XzFjeZgy6RU97tn+LZeXx27gCi9fJbT0Omxv
 QxA4wORO2HHWEoKPjuYg6iJBUhsfkrk+DuVy7eb2U4VnxIePSjGZQd4dy
 rp+LQFXFPojVtLbyx3Fw+1SnQdTbhshw678Ypd/3c6FBbaz5bcE+A/sGB
 X1WsGHFw/q7E9qpXQ7cZRrD1ksotcgsZbOEyLXgU3uZzMoU4sex2mkO3A
 5BepG7nM2lBbFcRLebi5Nqk7QRwHUTc0U1M/HsArRJrFWiyU7l/PlLr79
 /yUU+dPvfOaTZsaaB1qiT+AA2NzpiZmbu+KgmZwGcbLbnPduODr1cJYBC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316106088"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316106088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 15:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653755647"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="653755647"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 15:18:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:18:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:18:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 15:18:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 15:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LECEplJepZu1xIZZhYvc9Kmiq3x0YW9ZMRDkL0A7fdj8qBu0qMoOqlRR4VlsFEYqtmGmAMHOZhzzaqnrCpJhVjEMViseTHIYfzqwzlz0HWniSneHQpXOi3PzxpWJlvInq3Z3LekvPupVhatJWHs8NPk95MIAcfGbefegAfETn0/OckDwvOAs2/eVFlhi20Lrxi3HVaAyEpxDS6plUGNzFsXaQxFDYKEMlSA6j3xBLX9fjBcPGVpEYdYdr0BYCR5mxHcivj79kgI88CskhIIOWI//Xpf+Y6Mh2Sm5utMvTxTqPIc2lv8T6zfNTORs2qDIjq4KGf3SwczJBU3275s12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o24xEirprQ58FBlg5wo4CNYRvzSXkg7gIJ4RHbglLVU=;
 b=Qx0lRG8FVBkmpgMrpq0JbJX6w1q8S5np+OOtS49MmwbVgyqVVoMMcglXOipIiIWPYXVV2EEbHsFEcTurgd+IsFG9wTKBzop4LHhOGZNPIt6WfQ+ss7ALNa0yZRFWd/m0NrlMhfBJCfagmglCFg0QuzsiGb0g7lzkq+/skkmeUOUBAtzC5Rnik0rlhd7/l194fCM5TwTWN2T31Nozlq2VOfZxOyfhvbrLUrejslJ/kxX5TzcsM8bSbRQNoGjCEPfaNUgpsJeNiYyO8VVX+H36g/Yg6zP2HerrW34icne09j2V6EVzTlVQxI1vVwc/UUBpKumcHvcVtcQ8b36B2WaagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 23:17:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:17:53 +0000
Date: Mon, 6 Mar 2023 15:17:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/dg1: Move Wa_1806527549 to the
 right function
Message-ID: <20230306231750.GK1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
 <20230306204954.753739-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306204954.753739-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: c3750858-1e77-4492-a4cf-08db1e990316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMk+EClvUOL1acPl50GeZidp+pxX4eutqtvZDwbel/ouRncHlRgam2xZiucVd3VQNMAyGQvJRx3F9/UQbAfRGtlLjXS3uMLpBUy8K5PPcZeCnf8P+UNfwqgLMrgRu0Rav3wls2X3PGth8s0a8647WVBOxn5NbUXO1W0qy+k5nzmGvd1Mmcf8HJKCrEmYDQ3sL1Vu5p/e5U0ONcapkRCG+Usao4qgsXh78lVyhCnGN1Jm8DyNyxKKNdUfZZHPzRyXkeW1/8oLiUrvfxVtBtQg+ZJv3ruDIiTLsZL2YQMF5tQNW9Qcw6E6B/oeG8wI/Wr0Mq8ZgTdO/mrvG//GRcDjahzXeoJgdJrWujz/jugQCMzzpBBGtJCJr6dvW4Riq89QUD3Ll/96CAnf9nVanj+MDRtpbSmCoQ3TazPlrSCRVAEd59l/g3zs96gcQ0dNvmb22NmTbifXEL2Q/aGu9XXThKFGfNvjBUMlWn3sVIOnGoXPKeIdaSAL6GsKz+3DjNq7xwpPOU6HfDGlUr4Qh9msETolz/qzep47s/fNIeKIvxvzVHiXZlJi4yoorSVbP0bXzQQMTEz5khaS/wwR9DqWdNkvYvnZltqSFrDtc1TrznCpXrgrONIx5z7OH3eDgWY3HQuPaB/INKKbxHz0KKFlRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(450100002)(66946007)(66556008)(8676002)(6506007)(6512007)(1076003)(186003)(26005)(316002)(4326008)(66476007)(82960400001)(86362001)(38100700002)(33656002)(5660300002)(83380400001)(41300700001)(8936002)(6862004)(6636002)(6486002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMzpVXzr7rXTHF2giOMufeLq+CWzUY7TE1VzoVflOIgNild20k8X43kUhbuc?=
 =?us-ascii?Q?kFhxx12rHsAcWPhBv2zeIuJMBDWAcnxzo9r52zg0vfEg4wHGrwie39m394ZR?=
 =?us-ascii?Q?kPUTqTHOOxDXSyb7FXnHw9FuSyO26K15ESCoMemjG2F2Jm74GRP2tBizRhvn?=
 =?us-ascii?Q?f60AL/gxVFy7IO/jJpQYGKI2rFFOmw7Pz/hsH7yMEtGawS7/77gYDdgcTHYF?=
 =?us-ascii?Q?w+4Ptl7sjOSz5QbiZsw2QVgWtn704RItqSmESTtpEgw61KN3ywpkr+e1Zvcm?=
 =?us-ascii?Q?lQbPE32I5hxrK8nr5Ul5OSYGomqkAGnLGrs7Ap1HFzP3Ui30/DH4um8Mf6xK?=
 =?us-ascii?Q?eMj+tbkzDyq4tl3F/y818EG8czAIRNwH49SvUnSs1egQC3bbxKESaEb6zuIF?=
 =?us-ascii?Q?0Cml1bQLOU/iCoLs9BWfJGhg8GdeAJnwNqMLyzCfpgrYw+gZS7fAsTeGndyK?=
 =?us-ascii?Q?LcTL/8w+c8eKNU5hFWlRfiSRkQjh/rYLtdo8e16t8psP5HDw4DMrDTXjvsZ5?=
 =?us-ascii?Q?ChzibFP03nwf7xG1aliu8yJuS5SewpEdv+MJvjlA46oAQp9xiQUG2VVtgzQ6?=
 =?us-ascii?Q?/ohGYJnW7hmb4lkzjErmP8YeA6Z8gIDsBKA1qkGMA88rtzwa/II6RW2/UxbS?=
 =?us-ascii?Q?HVBWKJUOEvS+i9E7DBKP15ZZqT5p+stLyMSXTS+DDjvB/07f0P0GFH9wHWRv?=
 =?us-ascii?Q?gfsMz8bBzIJ6H05ZX6zrsyZPFOx9PCjC1bcqjW8L3VQAzxHuI4nU9aoQawIo?=
 =?us-ascii?Q?0xGXowjKRaeERxT58d6k32EUJYoSwdBRTZDwo4TTPhm/djR29UBUyP8swnwS?=
 =?us-ascii?Q?r8AxFnUAU0yATVoia9ej+Uulj57l+EtSuSJiFFUEBwhXH6DsFOu35O3BCL/p?=
 =?us-ascii?Q?N+Nxf2gC6YGjW0I0XOerLH6xjpMVVedrROBc0nN1rHkHTjEWWg2BWBtVHIuo?=
 =?us-ascii?Q?cXGCQcCrkjnW75YQz6CDI63gk14nB+AEVZpEUuJ9gzip26hsO+rUN5ZE0Xnx?=
 =?us-ascii?Q?/3z1I1xe1Sr1VyGsJI+msJuFFix+tAG97HbxFHNBcpH3MXK7IdMHJXXytmSr?=
 =?us-ascii?Q?I65WnDfihX0tYECgxvAz80jdakDtshgDKW3Iie1MWCNVc6LkTs9+GbAIq/tl?=
 =?us-ascii?Q?+G/Gwfi8W32isIIbcvMrd+IdzH8PFBlYGv9cNuQggJ7aLq57dQHm6jyCpRu8?=
 =?us-ascii?Q?r53tYLl8We05l5sh73BUK+3m/8pKoqzb6P5ZLpn0zlTD5G99oLgbDTXeIu7S?=
 =?us-ascii?Q?YeZUvP/xIWknZKPwfwMmyrWwBGDgFzgW4mDZfauAgmEBIKJp54AgIvqV9R3P?=
 =?us-ascii?Q?hDr232W9+ljqsH6nNm538bARnAWeO0wHAKjb5qhlZ7OJMlM1VYVKMIBUVaED?=
 =?us-ascii?Q?PZS7fcjNM+wP/YHpSqmeu9x5otQf3tpKrBpcJ95xtQUgBMU+9xKth70p7SFi?=
 =?us-ascii?Q?fJkQaUP99RuQr7oKHK3WoIlDbaCFYC2ogZbNY20BAgD+rhLyZ97XY825ev+0?=
 =?us-ascii?Q?qJ8J5x3NXAdSLKBzmp+SvN1/L4ZM+WG8k+67qL/RyxuAcgwX3pyn3owdOiJB?=
 =?us-ascii?Q?yIAHE/zP09itI9dQYBtxZGZBznq7IEnz1eyB2vzoMnUUHkAh75yMzuF8TjRq?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3750858-1e77-4492-a4cf-08db1e990316
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:17:53.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXwSjZZGJGY04hqSLkAgWS/Tbr2eqGBoQ8hKK5aTiNdsPF42gsuw+jzX5KSp7CE0ddTIcsGR4ss2nL4h4h76MTP3SDUd46tuwAmmnv7+/fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 12:49:54PM -0800, Lucas De Marchi wrote:
> dg1_ctx_workarounds_init() is DG1-only, while
> gen12_ctx_workarounds_init() is shared with other platforms. Move the
> workaround to the former so there is no additional platform check
> needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 389bfcd299af..f68fe64f63a6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -707,8 +707,6 @@ static void gen12_ctx_gt_tuning_init(struct intel_engine_cs *engine,
>  static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>  				       struct i915_wa_list *wal)
>  {
> -	struct drm_i915_private *i915 = engine->i915;
> -
>  	gen12_ctx_gt_tuning_init(engine, wal);
>  
>  	/*
> @@ -742,10 +740,6 @@ static void gen12_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	       FF_MODE2_GS_TIMER_MASK,
>  	       FF_MODE2_GS_TIMER_224,
>  	       0, false);
> -
> -	if (!IS_DG1(i915))

I think you missed the "!" here.  I.e., this workaround applies to all
the "gen12" platforms *except* DG1.


Matt

> -		/* Wa_1806527549 */
> -		wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
>  }
>  
>  static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
> @@ -760,6 +754,9 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	/* Wa_22010493298 */
>  	wa_masked_en(wal, HIZ_CHICKEN,
>  		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
> +
> +	/* Wa_1806527549 */
> +	wa_masked_en(wal, HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE);
>  }
>  
>  static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
