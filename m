Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAF88C2A9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 13:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DC410E8CB;
	Tue, 26 Mar 2024 12:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibzu2hvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA210E8CB;
 Tue, 26 Mar 2024 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711457648; x=1742993648;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ugSdAhJ0jrXCPM6h4sqAFCSIVtdsU113SzJLqXqdaGc=;
 b=ibzu2hvKUi1PJwDr/dRV/23JIkJLMQpeMch4yWvMXlBBEY5Ln4XYRDCI
 sCPwlQcTxfi9pyoC9SumvZGFrGZ4E3Yln7ezmL2zYMz55rTv+a1PJk05d
 XR2woiJcZr65AqS0vprAx62l1o9CT6DBi13Ujr1oteSmWQRONU2MttraS
 EK3h5S3pIjDaVmFYXFO4sHw7kvhYU8QIXeeDA/AGX1iPjoGOBQu2rOUjg
 UEtvsqhTb1q77SFrdQMod+YKu7LjoQZC/nywJUjYsrolGB/FejizNGaoV
 ZmPDpfoh5EuYZGdZYs8Wkv1MyXkl2LtBFPguwUAiylW/alzVtfS2RiqE+ w==;
X-CSE-ConnectionGUID: zg7FlWazTQ+d4BhLBHMmSA==
X-CSE-MsgGUID: bJDrdUEhSQm6lLRcFuBCIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6635229"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6635229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15816859"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 05:54:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 05:54:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 05:54:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 05:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3/pwwBM1ynJOE72rMiplK2FqQrdPHFhstIC4BPhH8sGLJnLAS5K4ZqEFf2EqkFNhxgzxjIILHh9YO1Dlhc+bqalWDJWtPx48rvNTQOem/uwIVY8SMv3Bvy4BIdZqJikKHfAl6hd8k9ZqEDNnNrW3t9cDM44sak4oOUDMwuFRcAwAQ/KKyrsf2R7qnamipf5hWsP9n6NGNWqKY51OPOSFhghVUXndw19poFyh98B23FKTlIQCAcQQ+CXsmKoFLL5pn28z5ojzisJUtiWATX04CPDjtoHw9fRN1gxpOoEAH+RlX6kvTtTXZGEr8OKH5TAWOBh5eT07doZm3KKes4saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTWpHsO7G2yxsqqaz+Hk1ctPmCMdQqay7W3SbhaCgyw=;
 b=Ig3DBLeiOoAWmfT/yMKF0PeqPnSHhYbdOyQ06/bUOpIEmr3U4xGTtsejtvyrr33kE681ZcPH2wYm/+X1XvF8zMdkCOnrA8CkVObFf+xuw5GjbWYqOt5zwbr8AL2IuI1lP5Xk1N5hsta8WgIaNQED1xE5JISaaWefgS8Co9KqOpQrhtaXA84r66on29O45Lkktd9LLF+Yp3KU/r+y9Nln/y+zgCSaG2+CQDjR5sybXFs5aQj5AJKZ8ij4YqB5icJd2YagIwaXNeoNxsT0vz8LO+m90vudfpKYfH//Czl4IfKsPZSD+nbODpVW80GlTat+PybhHuFKcJynHcCRy9+0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 12:54:02 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 12:54:02 +0000
Message-ID: <8d6ff583-aa7f-4279-8200-cd5a79b85534@intel.com>
Date: Tue, 26 Mar 2024 18:23:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/dp: Add drm_dp_uhbr_channel_coding_supported()
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-8-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240320201152.3487892-8-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB6325:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WM3AxbTU+ipF3Pu5PJutZ8FX5IsvVa5pvPOAJKutXIffL3ft1HRpbtAFusyRzPVXKqHQhhTpJPnWTaUHKVrwqDJjiPs+U3haRqgLrx6UzckLH+TX3ZO8+M1WIVIOPnytSzrBJNd77Ptdgo35pHtbEbnzciWKI7VZRIkVl3zq4d4cWOmsbZysfpGE8Q/rgg7cV+O4FUbKpdmWvN4Jks49xLYGQOyTsV20MqrTNX5nUa9KWY3NLQGcJMp/8CKWkXJQftboDLR3E/xhzMrKUB1g+TWz4xkl4eS113Au01ndxNq6CBn0Hpz/o1K5KXxCRsqZJuaBxTgkX2Zdr8vk/QrlA2fuosPz3YO3Gcm8ytum2KQsTBzFKJPVUYSoXd876K2WbpQxdcza5JL1zVwZp1ddh031PBnHbLWDP+bFAo9Dp7B8wBS6bsd/4kDjqDpVcG2mL+MHsiUdXcR6j7HpOgzYlmM3hncpi4WFrOUR+WyUWzVhLxYmeSSN0sN+XYTfauWcvMfAgNGcyncVT1yp9EQ8ArMnwgC8C+lip3VUNZWfGI07xUWT0IJderiW9aA5l0hAg6mZ5aCnE4heJcXGsm1GMGK97KHR8cravs5nd4KWj3+Q3sil0XX+lEkcrQCFRswbD8FFeePd6REXKR9D3v908w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnBSd0g2VCtoN0Z1R2dSM3VkL2FxTFFFKzZsMkwrb2p6eUI1V0hVV3B1RVJr?=
 =?utf-8?B?Z3lsOHVaTC9Kb2hhcVpTNUlGNTdIcC9rRnZRWTZjclEybTVWaHNXNm5tN3ZL?=
 =?utf-8?B?STZON2JCNzV4WHZDamFLSVh6MndnakxmeGFqd3FERVpWa0I5VTZld3dENytr?=
 =?utf-8?B?ZVU5YnZBWnhUcXhlWXp1MHBZN0FnU1dJeWhIVytVVE9DcFFkdm9YQldRK2N2?=
 =?utf-8?B?OEtIL09XSUZYSk9BYlVPRWhXSnNMYlNTL081TWMydXRhL2p3dW5KNlRlb1Jz?=
 =?utf-8?B?Z2ZIWFg4WU56d2N0d1dHTEpoU0Z1VnNKMFJtdU5rWUszSGw5a3NBamNkYlhx?=
 =?utf-8?B?YUtnZkY1djZaM2NJNEtLcHZkNXd0V0FDbW5rdG0xOVBYanlRTlV4N2U5TDlI?=
 =?utf-8?B?N08vbG1xVGhQcmI0N29MbEptVXFHcFl3L29jbUpqN1MyL2hxSm5LUk1IaEQ5?=
 =?utf-8?B?YkttNkJPckszZFNGdThkV0NWM1NqajJUcnVOVWQ1bVNKa1RBVFJuZkZseFl1?=
 =?utf-8?B?bWliNVlibktRcUVWSXhxRHR1SmZ2NHI0YVpjS3VpdWJFOC9JOUxsV2FwM2tw?=
 =?utf-8?B?dGpvRHREZXAwUXA0c2tCZU9Oem8vWUFMTDZSb0tpK0EzYkxoc21XZzlXQ1hr?=
 =?utf-8?B?MDU1RjJpcmZTYmZrYjJBWFVqY3RkcjY0NW5UV0E4VEdKWVR3OWdKUFhLMEI2?=
 =?utf-8?B?ejNnTFlycDBTZ1YwT1RBdTBOdmxheGJ4dXdhVG5WWWF3eWFmZXMwOXFRY1Jz?=
 =?utf-8?B?Zi9GQldEL3lNNUYzTWRMdG4yaFpIY0NobDFTK3hsVFpUZHhiaFliNmFYU0NS?=
 =?utf-8?B?Z0pxTlJxVmlnNm9QNFEyWXVJL3ZUNWRibUhGMDUrd1FuL2xNbUt1dnJ2SEcy?=
 =?utf-8?B?REtDMnlwU1I4cGI1QTV4bUZYZ1FiZ3pqMEFNd2J4aWZtQ3BoTDBQbDB0eml4?=
 =?utf-8?B?SnhNL3ZWTFg2RjlUaTVJVW5vV0p0VUFqVVRsaHYrTElEbnh4Ull6TEdWSktC?=
 =?utf-8?B?MDdSdU9ZaVB6bjJoVUFxRUdLLzcyd0xNZlNjZGRadytIOHltLytQVGdFd0g5?=
 =?utf-8?B?TmVxeFJ3VlZKM2szV3RjZXpjVzJtU2NGcFFDMlE0cjFYMFpPV2ErN2lZT0Ur?=
 =?utf-8?B?amdsTExlVVU5dEpZOGpEWk1yMTFLdnFvSkp0VXM2VkNLNUVLR1RHeHJud2ls?=
 =?utf-8?B?bTdDbkJhUmZFUk5oZFl0eFg1bHBTazRjZzUvRnVpQSsva1ZzYlpBZTNDVEhV?=
 =?utf-8?B?ejk1bnRpdWpNaXIyNE1SR25yMTZYaE5aczRLNXp4U2FyL2ZPQTZlRXB5Nkhp?=
 =?utf-8?B?TzV0cXUxRzVqeUNnSkdqd04wdy9TWnI4L2JhMVRLbFYzZURZREczeDVndVRv?=
 =?utf-8?B?T1MyNGkvK0s3eXBNb2g5SlB3WmJUQk9FRXlCVDB6aWhrQVZMMUNkUGV5dytm?=
 =?utf-8?B?Nlg4TFRPaERnZElRcXJxRmhjSEhEMlF3L1pUUExaMWNiSWgzeSs0YVQvZ2Rz?=
 =?utf-8?B?R0FFYWdybDNJZEM1SFRrcnlwUTRrYm1UbW1oY2dSdEJibm1PWC9tb2RKUW9S?=
 =?utf-8?B?MVlleXZGNHpQMFNLcEtHT2FHR0h4akJscWJTU0xpTU9hR3FCdDJSTFordk1a?=
 =?utf-8?B?WnlIZUs1eVpVODlwcnZQazZFY0loMmxKMnd0SVlFVEswNjJiWTFZWVRPcTVX?=
 =?utf-8?B?RGpNR2hkMzBqektVUks5TTBweFdES2JHVnJmZWRkR3BiVzJWTDRvbXB2R1ow?=
 =?utf-8?B?c1l4WHU0czM4ZGxQQTdhczA2NE1wY1dsVmtNaW02bHpJODkwd2lXQ3ZzaXJn?=
 =?utf-8?B?RC9xTVBwWHN5WnRtVVB1ejBGRWc1M3lIaHNZVk5WQXhsSDZLWVp5NG9PY01E?=
 =?utf-8?B?ckx3aXNJbzNhWGxVdnhzaTRSN05BbnFjZzlzQnBGREo4ZVI1cEZLUU5Hd3ls?=
 =?utf-8?B?MTNrWUIyQUtnTjBnSjV6QVFXRDJZaGlTN240T1BKbHRBV3lvd3lMU0ZXMXpB?=
 =?utf-8?B?cm55Q3RHS2JIYlNtK2haTjFjOGNySDNGdVhjS05SV0RjRkdEaGNVWFRnQ3VT?=
 =?utf-8?B?dHZKaU90R1ZDeVJJdXRuMWlpWGF2NlIwUUtnemkxSmRDTC9rRzE5bnVNNlMw?=
 =?utf-8?B?Q085RnpPcnZ3cmRoR1ZNcVJpTUgydllqOThDTzNsSk9tb1cwOHNTZTYwWGFr?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b84617e5-ae3f-4167-fbca-08dc4d93cff7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 12:54:02.7682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYdfZ4VhoLZdzLVqyt5AeLF6a+BxWovcxTMwLsFp0OVNVld3oOt19CoGjBRENs/LDu4dqyiOIOrQucvtbCF9M5wyP56JlbIBE066HIJ5FkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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


On 3/21/2024 1:41 AM, Imre Deak wrote:
> Factor out a function to check for UHBR channel coding support used by a
> follow-up patch in the patchset.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>   include/drm/display/drm_dp_helper.h     | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index dbe65651bf277..1d13a1ba2b97d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -217,7 +217,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
>   	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
>   	 * rates and 10 Gbps.
>   	 */
> -	if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B) {
> +	if (drm_dp_uhbr_channel_coding_supported(intel_dp->dpcd)) {
>   		u8 uhbr_rates = 0;
>   
>   		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index a62fcd051d4d4..150c37a99a16f 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -221,6 +221,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>   	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
>   }
>   
> +static inline bool
> +drm_dp_uhbr_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
> +}
> +
>   static inline bool
>   drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>   {
