Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A1859A63D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90B010E610;
	Fri, 19 Aug 2022 19:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73F010E445;
 Fri, 19 Aug 2022 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660937212; x=1692473212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tNLuN7ECnrpzncBbor9odeACPlaZqNbx1uSme/BcT3w=;
 b=aawY36cjNOjyVHaj6/J1uQqyFdCU/kedQNpK1iyIeZfpGq9/dL/CZ9s8
 coZAluNB7fUNir2giw62iPk6H79KsbChf1f6RdGRq3J2lPmFn7lJ9vOuq
 PIRUqWu2Si1EjhXZQe74q5yA75SNZu0bzq5nsooxja5YRA7zxThTsfg3v
 1BJn8PsXW7GKD3ZqtO6TJYmG+UbQBbu6Cldk/NgvBwkWvHx96hOhrb5ak
 BA/0TBHH8GxvOrkd8LcP3NFVmiehvMLGgBpfFRmcTWnysdtoJ9rQ1vyM4
 NTMhcl4YY6YbZB4AQV9KaTtkhMGgxjWCtHI6HSeRO7OPmVwDzl8uadfbU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="276122769"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="276122769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 12:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="641362032"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 19 Aug 2022 12:26:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:26:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:26:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 12:26:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 12:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX46BHjUB901lVwwxuedlzcPtGVvFkr9ofDfyUSAkl6+n968yi92gBxRtPPumvcR+ju98WfHoAyxXrfeS68GafVIIuSuLHkKkhDUkM+jFRBJadRPiU1IGBJHuughMe+g31MW2A9g8h1P0vBMtEZGL04Dq/C4KFi1Sap2sFG26Zd9b2GkqifllQHhVZqo0EMjU3LW9G6TTAWij1nL+Vgc9jhQyfiePMB3YDpoRUnxbC06j+8cTL3NmYNCKfWxqPxwGprfCK9BQ8eOhRbaeivM2ixty35Fr90vJdDR/NAMO9osZjftSapOyreXZqBH4N65813DOp3GzMOIjJaWjnBKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnG83ofFH9MMtQY9U2tawL1nkw9n0jQ9sXxIhKZV9EQ=;
 b=JjKGagV0QJYvHT1ayZ0oGXPhaXre5WzE1ZhErMUbXc2FyRAfpHc3lL4Gde9sTa4qc089R3qckFbobs1hZw/IuEMUvPt4u3I15CBnqb/IMrV/rOGO0+ECV6lraYbI7NDdxjhMhDNa0nSmue3VCjBCO98o70qSDkRxlp7+OZ9hTraXnTsMlGwWecLqd7NiPr3xP6InB6KQwLEbRvCDT0bz9R5GaWhGwu9c6766YhxXGZTLyXVZRjxPvb0QY3HVkZF4swMOEp2CX6PdPPmBfoo1szwnJdff1XR6yPhSqkfghUnTXO/PxjpJqGlA2DrpUlvqUkOjvx8Sxb5WZZ2EhFU9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by BY5PR11MB4244.namprd11.prod.outlook.com (2603:10b6:a03:1bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Fri, 19 Aug
 2022 19:26:47 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5525.019; Fri, 19 Aug
 2022 19:26:47 +0000
Date: Fri, 19 Aug 2022 12:26:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 13/21] drm/i915: Extract wm latency adjustment to its
 own function
Message-ID: <Yv/j9PSHHEf7PKtu@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-14-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-14-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b67a7e42-4418-452e-d17d-08da8218c1b9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4244:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: occUM2XZmzXr8Jv0DYqLWC5MiXdWOsODYnnlPW9k1HmYZC8MgDqOkxVXsHbR7JpIrAAFn7+BIDJ9ygQ675SITMOD3UF/gLdjz0dU8kHShUCT9kfr1ViQxqR6t9w3vqjjDlUtHzmI7y65moIZBlfwNcPzLNdYfEjg0cgHiY0CATZKj6RQ2Ile0g0bvRt9feqXw0DpGV3oTK5tkRMWzz+b1Awlec0mOCbA7xkEa2cnUh/Tav92QONmc3uoSdVXBe8nQimF17hnKkZIned+JSEUWXM5MRhIOkEW4+GmX9Hn/5K4jbsiwx1SMcKefweljZwckmgkaXCQgxd2bNY5tn0rHw8PbwDHIqWWn62qix9jfZLnS1cUt4+dapoGyBqa/b2hyVvdmErgutBwGeSnVdV5Nnc83m/7kuWfza5Cm/vJ4N1sfFfqF/fFBQwY8RDajsLeR2RmSw6bBGsLnEQ/esenZW5i4zd2hFN00u/krjC/k4TkPrXPJKZ0wOTsp3kGJc/k6J6F+TZfzxQ9J3bDwLZHdnAUayGnVqNZ9jPHEG5zIHpezWqromLvUy9PpuUJbRE2meCuGUeP8OwdnGRs95Y4+JUKq7RctefdFn7yhX2L6LeO6ijLlhvlSjWAsRnUbbLOSB3KGZSfaQQ15ZklVAVOtKIoY1ViZLOeldaQKhVESidVzpZD1NIaujnj2CsokesXhUPlnpKAcjvZ9D+erkC5OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(346002)(136003)(366004)(396003)(82960400001)(83380400001)(38100700002)(186003)(2906002)(6636002)(316002)(66476007)(8936002)(6862004)(4326008)(450100002)(66946007)(66556008)(8676002)(6506007)(6666004)(41300700001)(86362001)(26005)(6486002)(6512007)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tf3Ks34fbC72Z7gW444gqf+5s+wplC9rkB/KwnGjQl2IhupXbyHLi2zVC/5?=
 =?us-ascii?Q?yOYuEB+kY604dFtQLliw64Im8jDDHhEiWv9vQrc85HHLClLOdpI3W/Bstdf/?=
 =?us-ascii?Q?fXeZ9rbQX1zcpuboNYHF6rD/Rx6y8XBAY8sO4WEF1LT0ztvEnBOBFgROtdQ4?=
 =?us-ascii?Q?TBC0h57GxOrMdpb5/0TCQItUprvlKBhlrsIW8ygUZ0WkI6FEff1GDX5R5NZM?=
 =?us-ascii?Q?jDmgyKspsi5910VZdAV529BECNM6XIyeGfWAJ+NnQ2IPdpnaFdWZ8es4JnYq?=
 =?us-ascii?Q?ainqa03engy1hRlRnmzdVhu0pH9Eir6q+fxt7thmOYdHi9gOunUlQ5xjuPnU?=
 =?us-ascii?Q?cB/0u+FT2dS13Eh7iCxDpjSpFINtkDDgPgnlcRXmLMZYEEvmm5M957ZrIABG?=
 =?us-ascii?Q?gazlKDl9z/Sp2Xj62UvBiKlWQzXeKWaQte2OsZ8c4tfCoKxtMofY58zcoFgG?=
 =?us-ascii?Q?XdjeWzxtf0iaMHMVw6z3kD78Ba+RQWSSQEsGn05ukkLziWil63JlzE18PhIp?=
 =?us-ascii?Q?0hBJq0HYoqcskfua+ZQ2ZbmgjPkZF5dUjXim3Hm5MspyQ6cfrh92NisKftyp?=
 =?us-ascii?Q?MLyvpenJmFSSAJ23Wnd/Jd/iKWma97dvNLmFHAn+AcWnMEDPjQUhxLRxWrwi?=
 =?us-ascii?Q?Tyfzyh78QvR+7LzSVVCpLuektUoGpDH6aIRzvCwUJaCyYNnE9ftDyr0lN5Zl?=
 =?us-ascii?Q?z27uFYMBNS+nnIVHDu01rSUh3w5OKNSEfjrsYW6pt+NeJ2v4Rd7vwjLeE+En?=
 =?us-ascii?Q?izKtmKayFY0Vr60FG2j9Rv6V7jYJiaZotyqLKEVCbciMUNFk4RJPyR000XvJ?=
 =?us-ascii?Q?gkcl4KteVDEf0FXh9wMKy9AHzd+7Z7fFdqbgj1tT1HnXGgD23xTDDzFgq1ne?=
 =?us-ascii?Q?M/aMGog8HdCI2AOUq7pwEoOckX/gjywTvMD1BwVF6ZIFmTtj7zles9dQtyy/?=
 =?us-ascii?Q?/XVmspcuSmb4Xow5pbheWnyFU8c1vBEdSUvNe2CmqPHAWa2lzfdqO/FTwlve?=
 =?us-ascii?Q?2bMKJkJqFNzzEL/Wvk8u6xAm6OqP/TZHCaVuBmXO1dmfhN7L20p2fTC+64OM?=
 =?us-ascii?Q?3DiNxHVJmJ08/k0/C3xpbEAhhFaHmzfvuhojowVP/uQsyvQFQ0nskg2gFb39?=
 =?us-ascii?Q?oj5yJyVcLCzhoRApekxyvpijrg7PAmcPgexzUS/GYPja9z1ETAdQrJM/fcq9?=
 =?us-ascii?Q?y6QW1CyRUZ7CBqiJAWzX72JzuEol53SusIUcnWX+QhngNx4rb7yCNUEi9gQh?=
 =?us-ascii?Q?8dVuqfAQorWG179ZEApebG1igAhaYWo0h4x7F+uckH9R3zxzxfopTMvSXIy4?=
 =?us-ascii?Q?rkabfFwQARqPJho+ECybwqlbcD9WR10jQ/nLnT1gr697EahP8+Tym1OMvC5m?=
 =?us-ascii?Q?i5VH4FxLn3yLNq7dRj/XZsXmnHpawFV4/C7TRVxqUpY5TYYPjjsFu8Y3me/d?=
 =?us-ascii?Q?p3bLoXcP8bZxfSka5cv5+eZkdK+ND2b4l+Tb7Wt17r0DyQXECsRoAtY56FZn?=
 =?us-ascii?Q?RU+Y40mu6qYwq5Anf0GFpQ256C9tEtud2KpOSYAoEUaMgAO/VSKuGy8BGrNk?=
 =?us-ascii?Q?YPRuffgQCkHWNpS0LIzdIFz1JJFQjlK9nesrAfD5jVoChBgrtcg1FbNBL80e?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67a7e42-4418-452e-d17d-08da8218c1b9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 19:26:46.9384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPM/rpDkd9jMeZ2EWXvaHwu52wO6+qAJJFfvhRZ3yJoAXi5sQUUGqrnCrosGkQSKZ30/+o4kXgS3ee0Bb+S4hjRnlQBgetpOcVa5WlpUw0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4244
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

On Thu, Aug 18, 2022 at 04:41:54PM -0700, Radhakrishna Sripada wrote:
> Watermark latency is adjusted in cases when latency is 0us for level
> greater than 1, the subsequent levels are disabled. Extract this logic
> into its own function.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 88 ++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index ef7553b494ea..898e56d2eaf7 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -2861,15 +2861,59 @@ static void ilk_compute_wm_level(const struct drm_i915_private *dev_priv,
>  	result->enable = true;
>  }
>  
> +static void
> +adjust_wm_latency(u16 wm[], int max_level, int read_latency,
> +		  bool wm_lv_0_adjust_needed)
> +{
> +	int i, level;
> +
> +	/*
> +	 * If a level n (n > 1) has a 0us latency, all levels m (m >= n)
> +	 * need to be disabled. We make sure to sanitize the values out
> +	 * of the punit to satisfy this requirement.
> +	 */
> +	for (level = 1; level <= max_level; level++) {
> +		if (wm[level] == 0) {
> +			for (i = level + 1; i <= max_level; i++)
> +				wm[i] = 0;
> +
> +			max_level = level - 1;
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * WaWmMemoryReadLatency
> +	 *
> +	 * punit doesn't take into account the read latency so we need
> +	 * to add proper adjustement to each valid level we retrieve
> +	 * from the punit when level 0 response data is 0us.
> +	 */
> +	if (wm[0] == 0) {
> +		for (level = 0; level <= max_level; level++)
> +			wm[level] += read_latency;
> +	}
> +
> +	/*
> +	 * WA Level-0 adjustment for 16GB DIMMs: SKL+
> +	 * If we could not get dimm info enable this WA to prevent from
> +	 * any underrun. If not able to get Dimm info assume 16GB dimm
> +	 * to avoid any underrun.
> +	 */
> +	if (wm_lv_0_adjust_needed)
> +		wm[0] += 1;
> +}
> +
>  static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
>  				  u16 wm[])
>  {
>  	struct intel_uncore *uncore = &dev_priv->uncore;
>  
>  	if (DISPLAY_VER(dev_priv) >= 9) {
> +		int read_latency = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
>  		u32 val;
> -		int ret, i;
> -		int level, max_level = ilk_wm_max_level(dev_priv);
> +		int ret;
> +		int max_level = ilk_wm_max_level(dev_priv);
>  		int mult = IS_DG2(dev_priv) ? 2 : 1;
>  
>  		/* read the first set of memory latencies[0:3] */
> @@ -2909,44 +2953,8 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
>  		wm[7] = ((val >> GEN9_MEM_LATENCY_LEVEL_3_7_SHIFT) &
>  				GEN9_MEM_LATENCY_LEVEL_MASK) * mult;
>  
> -		/*
> -		 * If a level n (n > 1) has a 0us latency, all levels m (m >= n)
> -		 * need to be disabled. We make sure to sanitize the values out
> -		 * of the punit to satisfy this requirement.
> -		 */
> -		for (level = 1; level <= max_level; level++) {
> -			if (wm[level] == 0) {
> -				for (i = level + 1; i <= max_level; i++)
> -					wm[i] = 0;
> -
> -				max_level = level - 1;
> -
> -				break;
> -			}
> -		}
> -
> -		/*
> -		 * WaWmMemoryReadLatency
> -		 *
> -		 * punit doesn't take into account the read latency so we need
> -		 * to add proper adjustement to each valid level we retrieve
> -		 * from the punit when level 0 response data is 0us.
> -		 */
> -		if (wm[0] == 0) {
> -			u8 adjust = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
> -
> -			for (level = 0; level <= max_level; level++)
> -				wm[level] += adjust;
> -		}
> -
> -		/*
> -		 * WA Level-0 adjustment for 16GB DIMMs: SKL+
> -		 * If we could not get dimm info enable this WA to prevent from
> -		 * any underrun. If not able to get Dimm info assume 16GB dimm
> -		 * to avoid any underrun.
> -		 */
> -		if (dev_priv->dram_info.wm_lv_0_adjust_needed)
> -			wm[0] += 1;
> +		adjust_wm_latency(wm, max_level, read_latency,
> +				  dev_priv->dram_info.wm_lv_0_adjust_needed);

Would it be cleaner to just pass the dev_priv as a parameter to the
function and have it extract the structure field?  As far as I can tell,
we're never going to pass anything except exactly this field to this
function.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	} else if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
>  		u64 sskpd = intel_uncore_read64(uncore, MCH_SSKPD);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
