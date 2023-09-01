Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5579024B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83D10E1E0;
	Fri,  1 Sep 2023 18:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EB410E1D2;
 Fri,  1 Sep 2023 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693594636; x=1725130636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kkfrLYm6tXBNJjwsL+26tpPF7SRnhvOSazeHBMH3low=;
 b=UpXEvFd9Cd8bhme9U2YduxnnNSlbF7Y8GNmPp5pEF63cnLYA+RdB0gMi
 cHnR4LAkdECoQtJzoFkjnbRIfHBEOZld4Vm699EBeUZW463fW6UmbqVMD
 3XHKEAO9DoGfrq21yCDQXIJMjvg/af8ExGY0tzq9n99yXyZL81MbfuA/a
 VNkeL/zCGR2OOJROqOfnplKEnhW2GqMAZ2uaNgBzTU7qA4efP+2SeTHaK
 G8HddUtEwAmJJydpcJcmdSaKDOOO19TTLwNn268movQTUng2CPIRZkgUk
 4732YxJYB+XoXJERi3eobn8SNap9y8vS4WEO9rS3ubxWqPMuKvbx/poAd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356593613"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="356593613"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 11:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="743212185"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="743212185"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 11:57:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 11:57:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 11:57:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 11:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBJJNBGvzbHOd/mcZMcEr39+mMq6OqrpNywr3jMVrEIk4J6E1SuzzneC4XhjthNI1DXSa4USTOn9ytlcOrrbY+eVFXkK0AGksHnSx8tXPItxIPFA21SHpobscRxUnFYqEb5A8hXLNpy+8sdFG7mL0wtuCyNN5yjFUbmIzHAL3XCxZYGAEl/GEwINkjBYihqMrasp2kuMZI19sbeeQUnv2geE2dBekD+eZAvL8YpCvoxwYrR1l7FpGwmP6SGZeq9GgbMkjd5ldWjLTiZ63M4GCfJTEtl7m1w8/zHLyxKTJXL38APrROIsJJOkGQWka04avHK1O2ENKt0SQacxeWeaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjVZ1cQhNlwshSV4WikJpZvRf+g94do+BN46ju2EqXU=;
 b=kdCleJGuH3v+X8YjzuQHx9c3ZsLf0VjocsJB+1mUZsQ7eON7q2dnKg9J806jFhYRuI2HkqGf+XneMcMy1zYKN/x732YqtKGfASR4cMKWhmVC88Frd8npdiSm0AjBnkhHdpEkKlhjUm2reYMS97X1PtFJw+eJlBIbq5RqtzQCgkhE4OGJ1Y2oKBx1gSJn5N03CDDwCrWo9/4joGRdoCus0oBQIxCBhAyhiiqf/up5szxk2/lwlLccPIbpMJQAS38cdNzvqhIZiQsQtbSA+1Rl2nHiXx+4e5IWYuFw8C1bHz/rNyfnfnmtOrtVoluK3/x68QJiQ3lIcGXRbA7BQSRkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 18:57:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 18:57:13 +0000
Date: Fri, 1 Sep 2023 14:57:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gil Dekel <gildekel@chromium.org>
Subject: Re: [Intel-gfx] [PATCH v4 1/6] drm/i915/dp_link_training: Add a
 final failing state to link training fallback
Message-ID: <ZPI0BX6KyIIKMaKP@intel.com>
References: <20230824205335.500163-1-gildekel@chromium.org>
 <20230824205335.500163-2-gildekel@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824205335.500163-2-gildekel@chromium.org>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb9d323-0289-4275-ce6b-08dbab1d409c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXDJdQ6eMgptFEgDb/cv4OjtQ1CMrtah1AuJX0QDNtIrcdLNpeqnCHPwQbKEuMsVH0wfywNmkF+PkAth6+zYPd42kv8vfUQXoxI3si68ORPmknAvjSuu/xj+7+v+poo0Cqw8+wAp427X9y7vhvS13e5n0usgLlvHCsvaoZBY+WiH2dTRVUWIfnViYqOqpuVetjhkBOAn/XVHWy/+CajJrSedrIC0LS2b2w/wma30uMigSUea+MGXCiHg//oxMkOD1LKaJOJxjNOIrBUvZFhuRl0RlQoD48Aan/WedmQBVY8dwGYsiYTtcNAa34MyNW3e+3Rr3W2K38SyltkPWwTyqEwaUMw59U1oLkBBbtaIivkGpaPws8iheUmnv62TEp2HbAsk7qKz/q6hu4jgb6mfD7mBQ4WSqXLLaFOC2ZruuTC5Rudg1w0NQ5cahcjtzPgem7dtcJGZReUjrjaeGuyZZRrkSqQOZKDk8yTTWPY5GTMxyWgYwejs9uojiFm6pXNkWYt63Pembs2FKUXcDyEfJKFDFns44lgY8mZE2rjjDG3q6YQfW8f8TdakSgSbKAzl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(6512007)(6666004)(83380400001)(86362001)(38100700002)(82960400001)(36756003)(26005)(2616005)(2906002)(41300700001)(66946007)(66556008)(66476007)(8936002)(8676002)(6916009)(4326008)(316002)(44832011)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YAW9EiXo27HmDssjpwedt4AvTP9Kdyy5ITTrjwtgoPC1Ogv/K2fpcnEVUpT/?=
 =?us-ascii?Q?GUKQpGOw+1S1d8yC51DNjMWXfVrPwcq5E9FYo/fmWq/v9rVj/b6H+JSPHjv7?=
 =?us-ascii?Q?FdEykNFdX0NeaD4d5cjysSeDlWS+NMS+HKXCSz2Q/WsRY7lpD9vkvNGlvIfI?=
 =?us-ascii?Q?4KaypLd6zZAx8+npSJ/ucGkGDB1lyxzbTe+tb14xjZxZRK3YxqJnK21M35tU?=
 =?us-ascii?Q?EJ6ev0uvkJEAlsXXUmYbqm58vbHFTmksvIHZfmSI7gvRKjJaShdrSf1vNh4B?=
 =?us-ascii?Q?/qD2oDPE7vpR8a5yiKyMissGd38Sx1f1w8q7pB/AAj8Eaq9Ln6Ue/2BZCulg?=
 =?us-ascii?Q?a0JHItjwjgqqfpTUNvpqcyINDClF9SWFvcZ01A4j3cP/aZkq60U/qn0NpvEF?=
 =?us-ascii?Q?W9Q4azd/lZG5puS7zZrZudYTpB3lTXOxiQZlrxLaxfAvTVpRatCO1/EdYRqe?=
 =?us-ascii?Q?kA0bzRg6kganwZZSN5MEo1jdva4eSseTlaXEgFJGbH1gse7Gq6H8EJm8pobl?=
 =?us-ascii?Q?nk794rlkWMCdmYvAfN+AFgNr0t7yUDRPBwIhKE9b+ozAUL99WA4m/taMz+Rs?=
 =?us-ascii?Q?DQlv9vbqd/FSIOpl+l0RRlqSD151cv7577mtgc3DlsOa8cqQm6eUlNB/qKAW?=
 =?us-ascii?Q?dkxPAqSnZLcMd0Voq9TeMko5DnXK4A9NiALSmpRNRgMFhq7YDRO7ACvGOkef?=
 =?us-ascii?Q?NrMxFwHFmIovWWXFJDwHygoJ0MrRVaEAaBy4pRPz8cOpSuPY8SyfjJi3l2/n?=
 =?us-ascii?Q?w5dodf+LKzCIgM1PMH3+i0mN3cN4F/qFclwkUDCQQAQXoVg+HVL13lgvj9lP?=
 =?us-ascii?Q?q5EvjT2TusL7+Tl56m5CnK8v5xKyqHBM7JTH6pfqPdXKYIKZdf8MJYCFQXmp?=
 =?us-ascii?Q?BGpp2gKvHO4bcbiVq0jjC+GM2peuZ3XdIN25bfIRZqbQC6wxE6MXtaQk/NQH?=
 =?us-ascii?Q?OQJefXaHopii5SgndIQrgKO143CkkT9cfmOkh/R5QPtgAv3TMyTkv/6IBA0D?=
 =?us-ascii?Q?pCXkOayQla3Qr9z5YRSirK3xjrqY/H6Hi84sM6/o1FPulpRnB39zskmLbrdw?=
 =?us-ascii?Q?DlHpp9Tfz+9EQsm1anDP742Zf8NUd1Os3T1UXxOQZBZ1USPDftpzyuCXN6/b?=
 =?us-ascii?Q?JShuFCepZXi3xILbJ2Q6AXlpvd/ggWInEbm09GOE4kp/sKujlpnJWfWO3u6n?=
 =?us-ascii?Q?eSvSngnr6OCdG5x5qCa/NuykxxzNTmKdNxmCVayYi01iGyugdK3wR6K77wIH?=
 =?us-ascii?Q?bw62ef6jv5YOCx85+V08jYOy/sth23LU/pXnCZXIFrWMKdC8362gP9cEhdPz?=
 =?us-ascii?Q?jFDtS+HWx1qv5rhaZCsHA9rWTmuyS/jUyhBQ7U55zSbPwlW7/AIrF0+eJ9i2?=
 =?us-ascii?Q?SkEBAoCNZLtswnQLwa4T7ZV/Rl20i0vXGu78wzGVWbFwfpWNRe2cjTIsHbWJ?=
 =?us-ascii?Q?4CFFg6ItR8ofdDJp1v/YQpoqodzw66L0w4kUh0txqUMNOR/BgC8WvoGVaHEK?=
 =?us-ascii?Q?UxoO+VReEGWF+XacjibTK9a5NWqY4fdAifaeNrDFhz1VixY5RmRc4dsccLui?=
 =?us-ascii?Q?fdPqUER3jZLuFCMHBYMd22mvhpAPllV08kvCw3jhU5NJw+4TkWoXW+op5w0y?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb9d323-0289-4275-ce6b-08dbab1d409c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 18:57:13.3178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GuIcF/K/b/ZEDZEDZYQpjJG5Zkp6Ue7Tl42T5EuvX4ow66y9Cbaynr2WsdKRtR8luUoE95UO6XLEPXfQ3+rKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 04:50:16PM -0400, Gil Dekel wrote:
> Instead of silently giving up when all link-training fallback values are
> exhausted, this patch modifies the fallback's failure branch to reduces
> both max_link_lane_count and max_link_rate to zero (0) and continues to
> emit uevents until userspace stops attempting to modeset.
> 
> By doing so, we ensure the failing connector, which is in
> link-status=Bad, has all its modes pruned (due to effectively having a
> bandwidth of 0Gbps).
> 
> It is then the userspace's responsibility to ignore connectors with no
> modes, even if they are marked as connected.
> 
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7067ee3a4bd3..2152ddbab557 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -276,8 +276,12 @@ static int intel_dp_common_len_rate_limit(const struct intel_dp *intel_dp,
> 
>  static int intel_dp_common_rate(struct intel_dp *intel_dp, int index)
>  {
> +	/* This occurs when max link rate drops to 0 via link training fallback*/
> +	if (index < 0)
> +		return 0;

I'm not comfortable with handling negative input as normal here
and no warning or msg.
Maybe I'm missing the cases in which this will get to negative and
it would be acceptable? In this case probably better to improve the
commit message.

> +
>  	if (drm_WARN_ON(&dp_to_i915(intel_dp)->drm,
> -			index < 0 || index >= intel_dp->num_common_rates))
> +			index >= intel_dp->num_common_rates))
>  		return 162000;
> 
>  	return intel_dp->common_rates[index];
> @@ -318,6 +322,9 @@ static int intel_dp_max_common_lane_count(struct intel_dp *intel_dp)
>  int intel_dp_max_lane_count(struct intel_dp *intel_dp)
>  {
>  	switch (intel_dp->max_link_lane_count) {
> +	/* This occurs when max link lane count drops to 0 via link training fallback*/
> +	case 0:
> +		return 0;
>  	case 1:
>  	case 2:
>  	case 4:
> @@ -672,7 +679,14 @@ int intel_dp_get_link_train_fallback_values(struct intel_dp *intel_dp,
>  		intel_dp->max_link_lane_count = lane_count >> 1;
>  	} else {
>  		drm_err(&i915->drm, "Link Training Unsuccessful\n");
> -		return -1;
> +		/*
> +		 * Ensure all of the connector's modes are pruned in the next
> +		 * probe by effectively reducing its bandwidth to 0 so userspace
> +		 * can ignore it within the next modeset attempt.
> +		 */
> +		intel_dp->max_link_rate = 0;
> +		intel_dp->max_link_lane_count = 0;
> +		return 0;
>  	}
> 
>  	return 0;
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
