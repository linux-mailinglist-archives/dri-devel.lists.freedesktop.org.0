Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79855B0FBA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB90D10E8EA;
	Wed,  7 Sep 2022 22:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8BE10E8E5;
 Wed,  7 Sep 2022 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662589086; x=1694125086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lvAAQK8ZsGiM6feuradLWwE2CMNlJaqG5H0dweyd/PU=;
 b=WS1a4VQCNAuGuvKY3+YO3lXjije1BjXLuaU2o+BCiDbIKqta01a9FMBE
 TpxA+fAJWEu75+lhdt3In/YhcBVNuzh4vLvJJf3Bx1xYiole+u9Pux/2C
 3ZI1mdspzfuNI5yDqoiaVPmppwncOWRNf2lMG76i2C7fQv4vg/EmrKn9y
 mR08jPWsbxrZTkE5pfRG6w4MUUMKfWnoSqDRIVPRXwbSV0hBlpyI9BPtY
 QyZS4DrbRzF4NRV1qeSpcmpogiLoqURJcq1Zu0MknY1zC36P7dsWNnR6P
 yUIHefyvWMJr8x2cZsiKPc9YSJDf6WPT6fPoVd7sk+2CwzqQkVJqXPcZa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297817394"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="297817394"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="591901448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 15:18:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:18:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:18:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:18:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7yrZ7fdPfOx3lnd8rsp5sqr6oTdhABWOyqzl+jMEQ9EcvTfsjI9muxPKUHF6KaR3WSRTXTZjRPoazy6Mgd6iQBaW8Ycx8J9MyVi8lKa/cigCPakoGuhgYpzhzR9xXMaiPddqoNSxQusHV+qTX9djxGwzpfZOX9UjsCUwQxe0aY6H4VG7hPvlnDqz1eM1iAxNLk5Om+dPfiJtzzYX/DpM6VxCF1RixV2dJSFvDzxaeAf3xCR7HH/K8VIruI0FTHvRGG0maK7SNHjKKBdVkK8RpdGYB9f1bW3ZMUF4dnlSlpq/bMlxI/bmDYcQXaS08i8dVkPEvp5Gh8J3xYYZodzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XLl/RAFAum8tdw1f4hu/r38GtgDXEksBRolZb+5/dg=;
 b=cdtLHHeZma6zqha5ts67Agyrrz4cDQRw5Ra6ZrQvGqUzNRiFPu9K0nRHiK2weooireK2b5zsMzlKNGdGNZoqQkYe+oEZuJbArUZw8/RO99laz39Uo27pfNHw3ikayXnyDc9SGOgK3tR4laH1KVhcRW8fuJVCMZQwqM3ZG0qWI7C6jQFyfWrEG5fSjQm2Yn/BC+cYw6bgOjeUNg9oZyggjBtSyQI0Ls1XGTW159ykvAfbUOBJMpEkWQaMu05iEgWfRwhxgz3M/hUsJ63Ju6vVajGYcF+kkW0jiPPrM6v67iaBqSAJO3AmFvSns9ydutCrkaLxcS285D7MUSkbTeXn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM5PR1101MB2347.namprd11.prod.outlook.com (2603:10b6:3:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 22:18:02 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 22:18:02 +0000
Date: Wed, 7 Sep 2022 15:18:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gt: Use MEDIA_VER() when handling media fuses
Message-ID: <YxkYmBbpe1/QnaVf@mdroper-desk1.amr.corp.intel.com>
References: <20220907203911.1662804-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220907203911.1662804-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d7e36d1-aff2-493f-3335-08da911ed448
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2347:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ez3aDVwvzDJ5GtRB1j2tHeIFP0DszudLSdx3dnd9ZG+IRG758wn2lPlF4W/jrmp2FAotEu1NFClF3nvf+KvRNjswSnPmF/NSoMtmJkQ8Ll3CvCFSsgsMTFk34k27tMOitgkmmh56MukkHu54qOoipH1hd5sWYjWK9kAzUGUTd8A4PoObfGBA01fgWSC0JDHTq1EFOmCUhkzD18lfbBlwTWHjMzV2Vwf2z8beTF2fZmE6g1Q9Y7w+8/Mtqi2bK7fgzTDwImUKjqh5RnSXzYUu0SUtGfHgaFHTyc6kPkEARLOXl7laPShnxAVlDN003qL3bYUfUQzICkhqagyRO3XETG6Dxusb4fqS3CZy+8N452I/AlfNZspHir/QzrIKlgd/I1HutKs33ZwWS66QvKHIUoKUl1kE0+pfWTl/fpwbZ0Tjr4fJekJ5pId3PvCpNYu1J6K3CFzjN9XOSYn8/oksavlISEqrZwC4tfi11JrqCiV4BCPKwqQYJ5fvg3vJ1KuVAWHv7YLRyLdjFXXS4+vZCOsBBUS1XcFcL0cOAIXoL7MpchtwyvUco+HXjMqrx86Cmp6rrhm06MuiiFu7zctZecVR7XpFfZ43kk0C8r6Kegdv5eObdtSmRoAP05n7GHH7xZy7/gR+MCm/GZ0QJ1S8evzeph9IkPrSTsrYjdZMhRd8rIhALfQzwu90fGycmslAgHRD0X0AnWR4VCCl8H4pMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(396003)(376002)(346002)(86362001)(8936002)(82960400001)(38100700002)(316002)(5660300002)(6862004)(6636002)(450100002)(2906002)(4326008)(186003)(66476007)(66946007)(66556008)(8676002)(83380400001)(478600001)(6506007)(6486002)(26005)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A8shCEQABcTEmI8hJI1NJLsJ/ECRRQEbbzQmdjhkpHkg2gFYJDFHk3C6ReDD?=
 =?us-ascii?Q?NJjeTBljnxMql/IYsGFCe2xtCL+MsROhl/c5Z6PfkfiG3NarIUHa/GslX6GR?=
 =?us-ascii?Q?bsLaynMK4O2wfDruMcBPk2uOCWA2jNLxX7tne+9FYByYMQCZYy4CSdfsL3bb?=
 =?us-ascii?Q?1t9uGAhSjcxWXS4IDol2oVXIyx5AREfmSz3IrFMrwC37t+Bg6ehcXAeyj/4h?=
 =?us-ascii?Q?Jwki3m/KsIQJ8DM2RDUq3lkLP8OR40wOazuD9kxaJkro5eR89nXv1Cvx80cF?=
 =?us-ascii?Q?DVKQm0yNWSa/lxV3V1YZLBD6i32rsdLLyIbBxM2cfIcaHMIA6N/wboSqmnsY?=
 =?us-ascii?Q?Y2axUAhgjkDyB51B2VTiig15qyhT89oqg1SINu9KHGuPtcedov3WRpzaf2nW?=
 =?us-ascii?Q?40ut76M7HiWCWhuPD7DmUhM8bqQJgTBhXHjNYxhGLDAlRNecxAUH8Pt0aLVQ?=
 =?us-ascii?Q?56dzy9k2AqlA0sm9nvYtVTCchPwuUuPF4EpQPScxuogcvK+WE8pljt8HS8XA?=
 =?us-ascii?Q?qX9kW+iOMcFwijhY/mffOW4dUyjp+gd7TmiHDb/ygxnwIJ8/dDXrP63D0VOR?=
 =?us-ascii?Q?cILvGH+6/4B4N4YeiVzsrG64gR1Gb6BzoEB2TLEnQLWJeNqpIFW1PMucrvvi?=
 =?us-ascii?Q?0Iz95Vd5tiaZ5N4g8kB8ISFDjn18cqh8WrOt/INAlnmakWpiWn8cEJfYiMgb?=
 =?us-ascii?Q?Kee57zebhyWc3htnCPJhazkDOv7EZvD0TX0BOmzG2w46YpY3yJwX7Qf6H89v?=
 =?us-ascii?Q?t6qyPBlXizxwBdNAUX9U/wBRgJmlrmSu67+WzofE2ay6S2tbefJVnyosgu1T?=
 =?us-ascii?Q?xJixsR5Abi9UwfPrSbTC3gEy3AHckR58UbErV2aJYnhOWsP2TQh3LolNd9qo?=
 =?us-ascii?Q?SCI/aoc3UB4jtiUR9gU3h2ee5PQMtxxtqbTt6RWlGFl+n04EcgqMy9NRCThK?=
 =?us-ascii?Q?6GwFO/924c94kVpqOPYn+JAEox0YEMCxLUDy3u7DJaF0kx0YyOeb6Ev1K3Fz?=
 =?us-ascii?Q?MmyBbLDl4BKt2HUWp0ndpr80Ps43fvS1U7ffN4H4MjA5fcg53BlxY7qijj1x?=
 =?us-ascii?Q?t8rQbangzW49mtE95SyjPbUF3LXsTvZHo9aZYdUsHHtP2jPYwiY6jjHqePCb?=
 =?us-ascii?Q?+12+ny2FkS2gwfQA8uAxV1eHnrQgx467wk7ycV069NtNcBSCWDFqYPfp0RxI?=
 =?us-ascii?Q?nvAIAX2ttwpqpWdIilf9MaMo0LPuoYYZRHSbWaZpgBy1mt7nQc0h0YjnlvYZ?=
 =?us-ascii?Q?+MpHQ/3ImJD3j+/oPOuW5u0RPeTjzr1ci6Zr5KrSnriqI7HytAVJP9dh8+tC?=
 =?us-ascii?Q?XPoitvDyDKldAz9noa30I3U2XaGF0ity3ilfp+6c3J6fTN58dma2Wx5+60df?=
 =?us-ascii?Q?R7i06bF6wP1lZGBjfnrjD2Hp5UsHXN5K9bghejmWzLGJ2cxckif9lTY1ECn1?=
 =?us-ascii?Q?qcL3E5rATI8uXqBvwLY716S3p4IEV6BCrlNKQGKU1iyv97yCoJN/8tYJ8gMT?=
 =?us-ascii?Q?0umzPp+OuhAZQO/9BrbPZ9Z3aqBDcowUcr3CK0iKUl6PAKlVvi6szUDM/AFt?=
 =?us-ascii?Q?+5TPrFxGZ06NX+rsDV+gvxzi2jjUFFc/QTeIE9HFfpKIO59JBQunBlIxIBl/?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7e36d1-aff2-493f-3335-08da911ed448
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:18:02.3675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4e89fZhGtSKFtUieHT4dhCXiVm3Or3Yh6Gi6rF0UB0O7+lHKHXUGSRYkvQ5GmQBOwKgipHLAsGR+IDaNyzrDN0KAF/BIuQIvOzT7Jj9hpdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2347
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

On Wed, Sep 07, 2022 at 01:39:10PM -0700, Lucas De Marchi wrote:
> Check for media IP version instead of graphics since this is figuring
> out the media engines' configuration. Currently the only platform with
> non-matching graphics/media version is Meteor Lake: update the check in
> gen11_vdbox_has_sfc() so it considers not only version 12, but also any
> later version which then includes that platform.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 275ad72940c1..5cddee7c2f1d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -654,13 +654,14 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>  	 */
>  	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
>  		return false;
> -	else if (GRAPHICS_VER(i915) == 12)
> +	else if (MEDIA_VER(i915) >= 12)
>  		return (physical_vdbox % 2 == 0) ||
>  			!(BIT(physical_vdbox - 1) & vdbox_mask);
> -	else if (GRAPHICS_VER(i915) == 11)
> +	else if (MEDIA_VER(i915) == 11)
>  		return logical_vdbox % 2 == 0;
>  
> -	MISSING_CASE(GRAPHICS_VER(i915));
> +	MISSING_CASE(MEDIA_VER(i915));

Do we even still need the MISSING_CASE given that we now have an
open-ended upper bound above and this is a "gen11" function that doesn't
get called at all on old platforms?

Personally I'd axe it, but up to you.  Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +
>  	return false;
>  }
>  
> @@ -747,14 +748,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  	 * and bits have disable semantices.
>  	 */
>  	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> -	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
> +	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
>  		media_fuse = ~media_fuse;
>  
>  	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
>  	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>  		      GEN11_GT_VEBOX_DISABLE_SHIFT;
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
>  		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
>  		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
>  	} else {
> -- 
> 2.37.2
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
