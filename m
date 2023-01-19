Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE0674337
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905210E23E;
	Thu, 19 Jan 2023 19:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEBB10E23E;
 Thu, 19 Jan 2023 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674158289; x=1705694289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wt75wH82D7vQfs9wHHzwRIdbtwAEnWkd+I1TBHEVyH4=;
 b=OWxGQN3geuE6+OeFVLali2PY8RLlDPXKM0Z4YY6Q8h0hbtmhAxlIboN1
 7KLHI1EdoxBV/mFYCQQimYHL5zOP1i6Bnb+subgIgEVl4YISisH4WB0dD
 rmOCYQ+Cacty/OJmgTOo3BMoCbGar5HrTC+kF3V0BhwealjwmTs4opsFu
 fCY1yCJFvHGPZxCdjjmPQfr8RkTFNBz1TUQQa6/5x9GnOX0uolJUCAQnR
 M03GoxdKAA/ZNoqzeYLSXFmH97F70mpscjmPRBlY7btlQFV2XPhF6CzpI
 rYlU+84nGhJxTPskmbru8tkNmM+E1NQjMf1tJcgWoZ8FzlH9MjIucaMKc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411638955"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="411638955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784192402"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="784192402"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 11:58:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:58:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:58:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:58:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:58:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ/+m09SSBckw778l8j530BEPhRzVLRAG8sZVX0NJt2B3/Re+H5E0bw929RmEuDDABC2IO8Q1dGhYfM5Sw5D/EItpxgLdC4rNMGpykrl712UkJS5xK9Pe3XJgtXcZ0LUaZhbG9T9V44dA6v61cLRlXoI7nvMhrYbxNpUPjf9QdvsnX03qyutHF1e4XdSV6ElRpijSI+DgZufliUAWyiMs58atujfVoFHzQKl/kuMCoQP8oXPbDmjM4Fv8i907GALMdbcXQs4Cx0rAV6AenJE34deKbeufDhazuJsbDR2kntg0jkCOJKeBhJhho2ppPPypFjQ1xf2wX4H4oEEARbCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1U+kHwyG6B1X7Fk2fgiDyw32wCuC1R3HcO8QGhbqoY=;
 b=dxFoA/DttSmlxWofAE1lQcCNRv3DfFjKrA7LuGMilEHM6htBRTxzBYxe0G6OLC7CGnQtprXzQXAuJsEO71PhI/ZjaTY36GtZhT84xeZqy6ZnrTNYkA1uAXnb9nBC62JesbPaw1EVrrntx+hTNiKNYTna+pakTIAlT9UU0vu26NwEomXh4kRWTNClFmBSKQ+F9GId7Tr31DuPM5QJj8eQJfArpf6b1h1jaSkjAPWDEg4ZJxxq8s5YUJh9oH3A/ozxT922jTup8F27zItzybkGxcQUxTTg2mlPl3iUb1LYo6N+kX2Ye0JN+3vzDDBRPziHdgwyDbh5K6d1XF9+H7ytiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 19:58:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:58:03 +0000
Date: Thu, 19 Jan 2023 14:57:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 1/1] drm/i915/gsc: Fix the Driver-FLR completion
Message-ID: <Y8mgx1uank7lzPDL@intel.com>
References: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230119194955.2426167-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5306eb-36b6-48b7-9876-08dafa577981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n22JQgSLQLkbjLgaSrkp4tz3OuU0d74gmHYc7sWd3HM54ln0ezfgJu0eL1c9FYKkhJM6rBuZH7ihxcKhtYEUouTi3kEXJCXfl136sYUzeTWq87n59XQ4dP1p8kZufuBBRmGtpQ3iCedWCHlmJy/tSIb6L9UsUJUNTvPA4fausT7VeHwmwfYtvrWMxI/ma3uFxZI9eQqq9KAGjuPej6we9yJ0s2MJVMhCrUGP3sjX6ZhEReTRfVMCTSN3G3jC/5qPq8AeJGHnfuAXvn7TYzv/ON14CyPhcdBRiX8aeMPx2hZxDNYW1W/dPnHEhcqGurOX3+EGj/HNWq8pO6+ynfNzAgKn+4xyXzLzTiiMqCSJJw3sq/kzVhBBpA1NyFIq1BAeivYr/q462jkr7tO8sUx5ufbppjOslduHgtPHIJf95j9Xw5KNt8liSsR3TUkeDoM6dyzhDDjn161N2Ldkdd5mHzUszd291FXKjKKMH/rm8kG8Rd8IAevnZMSAz8Fi/0lO5ALTTjETvxF+C82q88NvwxMJst0w6LyaxtMKTFxZG0qFZGJZaYSIrCThaR/yNshyEDp/2BN58B8vH33tP6hlVbjFekCa7PALQdtHhguKd+fHfeBwCpzMML6V2E9/d4Y3UuznRC6m+8E5bk+b2LRzrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199015)(86362001)(66556008)(44832011)(2906002)(66946007)(6862004)(8936002)(5660300002)(66476007)(82960400001)(38100700002)(478600001)(316002)(6636002)(37006003)(6666004)(6506007)(6486002)(36756003)(26005)(8676002)(4326008)(41300700001)(2616005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ye5ItqOdGwaaa/ZyHCCzO7R0A5BFrSj7iCYBZ2ADIb7c/ldoezEk8y/GvjE0?=
 =?us-ascii?Q?WkwSUUFqQXVCtiE1Cd/EVCnOfIcD60TrcN36aWBf7csIb1bX/Y4H8VHHlYcN?=
 =?us-ascii?Q?BvB1xJOgtjf7hx8zjO+lw/8lRwH4oZoyWZXfwUaHDJ1gWvlHb6rYGVgs6Dyy?=
 =?us-ascii?Q?bVXkP1bETVR+uL27azQOevJC9WQLSj6MBLjo0j+7ClIXl2Nq46oTRD5rgXLo?=
 =?us-ascii?Q?O9ZDy+0mOuq+CDzXrvk4J71zKuw6550rK1TS6hmlU9iAgo5SluDQY93BKAL2?=
 =?us-ascii?Q?8NcLP8Qxand40Sh05gAabJ3r3IuEGHGCpefDqLHYDEfkVukHEynaFIFMaQv1?=
 =?us-ascii?Q?f03b3YCWozNFmwqSOcRsRY4bHUUtOrGO1PlMuGhY5RihSaYF+OKVZApJkslj?=
 =?us-ascii?Q?bbO8FXb4HDyGBOenon8AJ1zWtiM8lk0LguJ3ieRaC09ACIWOnkeDCIvQenJO?=
 =?us-ascii?Q?9Efwn/BfiphI/52HNCAmjPJegoD1FAjGCduol1g98eudIjkB06FpemfCCp/4?=
 =?us-ascii?Q?7Vb2dabB4xt/NY3HyC16LAaqd1pK5VY/Xojp+EJhaKdx+yBZfSy1GutfTKnE?=
 =?us-ascii?Q?/J5TBH76geZ1hTrJrV5MvTZQYKKa2SM0CISScJ5utTNhML0MMHfHK2VNWD+A?=
 =?us-ascii?Q?ieRuQ7nIj+DIzZuleYfcm8zSdiITSsxT6w4SMh4CIwDCLp5biOwk0aVGqj6p?=
 =?us-ascii?Q?KAVlwl5BmNn5cQOteeLn3Ml5RePC+eaGuQ7FI9QRY/4b11Tfgg/5p7omrF5P?=
 =?us-ascii?Q?7F124eR/Cb6OFJYKWIxAtKoxlE8sxjaq0IBlUNJJu358WR8nQXwhneYOCUVY?=
 =?us-ascii?Q?aVSGsoijlpz672dPCeeDqCGBSqGb/4wEVDheBzWchmtZ82tcIAZxVIjHDjVk?=
 =?us-ascii?Q?XXcwmYixdCmeEgmY6yMBEEhrRtgkaBrzPD4OzQDD+nC67EjfklfcMB7vRkM3?=
 =?us-ascii?Q?mQgzzMUFZtZspqWPXkTrAt4RFUCARqpKnP89DkmOVYF9LZfVdY5nojo30n1C?=
 =?us-ascii?Q?oJ0A5hHOT05hRtFEDBC5/OI43xTU/Np2KwOnZ7mt7+uG/0Vb3/ERaPxDTghz?=
 =?us-ascii?Q?n9tyXyukXFtOp7OflrHJ2SSswlfTiW02wCPd6O1CbzJwBwm12CfjvLzOBTrH?=
 =?us-ascii?Q?isUHDDJqMwugMxMIIE2hT416n995sp04Bbgh1nwOmGJTBW6wT4VwkFFLhRnO?=
 =?us-ascii?Q?b2g+IMdxxE9oXpA+OMcfUhFB/oGmAFqYCkntbyuHPh3cx9BxL5ZSd8lf1Cev?=
 =?us-ascii?Q?+uazobM9GIBaXVGKrsMJeLj9gIUZys7WWQ3LpFI5B1D+yGrwNu/XAACTG9Hm?=
 =?us-ascii?Q?KdrTDuu+lzcSHYHlNjcn4Zk5kbJAZXhsLiptARaKilwMklOBGOVqw/W4tCjP?=
 =?us-ascii?Q?hxICf8rdt9JsD+i9TWZ0RcdiVJx5TMkpD28MSlFiBKo/ZDXhU4GfMRyu4ju/?=
 =?us-ascii?Q?UjO/NqRVIne2xCxLrMBfr/T7U0qO7bKwRgVl23cei3KRothZMrOtG665ISOA?=
 =?us-ascii?Q?L69QpfE2bdm7m6X21Kt+ylP6TYXxq7Ikjl+bWTxYBZUb+e9n7WhOdv11mW9v?=
 =?us-ascii?Q?dpfrANUGQcjPeswFRMmXBqX+M7L3WN4ni6RBBT2x8PKbPpKsa2oX1XKpw32E?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5306eb-36b6-48b7-9876-08dafa577981
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:58:03.6168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t93nmzLkzGGtM/qnvkD4zjOM8myNoT8ScUmNw2eU7+3CdOF635Fy1ODzovaVQtuAwhkO7ov7+Qr/g36q5sbLVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
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
Cc: intel-gfx@lists.freedesktop.org, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Vivi@freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 11:49:55AM -0800, Alan Previn wrote:
> The Driver-FLR flow may inadvertently exit early before the full
> completion of the re-init of the internal HW state if we only poll
> GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
> we need a two-step completion wait-for-completion flow that also
> involves GU_CNTL. See the patch and new code comments for detail.
> This is new direction from HW architecture folks.

Do we have this documented anywhere?

but the patch looks good to me...

> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8dee9e62a73e..959869e2ff05 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2748,6 +2748,12 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>  	/* Trigger the actual Driver-FLR */
>  	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>  
> +	/* Completion Step 1 - poll for 'CNTL-BIT31 = 0' wait for hw teardown to complete */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,
> +					 flr_timeout_ms);
> +
> +	/* Completion: Step 2 - poll for 'DEBUG-BIT31 = 1' for hw/fw re-init to complete */
>  	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>  					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>  					 flr_timeout_ms);
> @@ -2756,6 +2762,7 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>  		return;
>  	}
>  
> +	/* Write 1 to clear GU_DEBUG's sticky completion status bit */
>  	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>  }
>  
> 
> base-commit: 0a0ee61784df01ac098a92bd43673ee30c629f13
> -- 
> 2.39.0
> 
