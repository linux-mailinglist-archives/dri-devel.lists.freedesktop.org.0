Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8D832263
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 00:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6410E92B;
	Thu, 18 Jan 2024 23:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A294E10E922;
 Thu, 18 Jan 2024 23:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705621836; x=1737157836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Da4ZSDpSYT8gS49RqKeTLwuIcbSDR6cjkMfSjkAte0s=;
 b=TLkrH3VP5kEfLi1TMNY9aFVrTJdyhQrteB1Ndd4d8gHngZRkwJMu4voY
 q7AhA9wpcOYWiP33Yklki/5NvEHP6EYRbcEKP2NGhmZ2kxux1iT3gz5bZ
 zfQyYMdy0lpz1to5VWye3Gcq5pJYQwdCPCBwMXAOj9KFvaO6GJBXTXSQ5
 Bu2lS3Fb+xK8CoxwUKbtgoOEfA71l9KrvfR51W7g+p1K+sIjD9ne80Yy/
 SedSNubLMiZFp5yYPTa8oe/j1rGWklUqHzeByACyK1FwUeiCJ9+XsWrgN
 u8TGnw2TGDQnPK5YDKp8pNbdvDXu/kEetxotXBml5ajiTktXwghGTiaSN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="508053"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="508053"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 15:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1116096275"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="1116096275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 15:50:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 15:50:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 15:50:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 15:50:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxktTQTCArjkDrnSsfS47qjecFnJnl2DTy1/3VXcngmg3Mo16horNrvV0HuLrd9Ddn4MnZZaK5ulr9ll4+UnwqxJTss+ITXiNlukVnkCkfTPKkocO2wAULfliecmm+NfRB6gbhNvK5e7OfXZH9Gjl7uSX443XRAU+LNeO1COEaHTWfZVRzDDdDrIcMqlez/cK/vTosKqkKMBljMG6tAczTLfdrbDvsSwtrtx0iVI6DfLUGah6EpL+u1p7e5mOwky0xGXOLC2bNQAEwnLnLPFO4e8RPU1WgOpkRSVQMz85PfDLCzXOIRKBrIqVz5SaFBN2U/VZ/fIC0d32KxSa9vgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hpo2lHZ5YfuUcoFu4baSF2a1jo9hn0zszlg5lqbz5M=;
 b=F6LJd7+5cnnmtNSyqXtqrj8qfwe3WzzzfgqVzcrenA+Z27PlkG5w5MhM8dd4chTSx3rh2kZhd2FOe8wzuSbQXYZCDW18SkzMZsOkv/6mh7eAG0OiLo4DU0xSmn0544LaRQSalQtKXGoojxk4UZY6oZ53b+6q3PBGVeuZSZeMo6TgDrlTHb/xDPA1nvwIG7e85MFWg9VQNHsF6xAWbaEy98MYhz+OsgHIakpDRpTMzu/ZQovctdqRk7qIRFTfPXg/Cv7cgJCAi7hPPCNhpufiuUv0fS5LioPoY4TVuMGlG4ioQ4ZPj7E0M0csyUf6+L8WXOSER1BRAmjK9Gavxq+f5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 23:50:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 23:50:24 +0000
Date: Thu, 18 Jan 2024 15:50:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Wake GT before sending H2G message
Message-ID: <20240118235022.GX45138@mdroper-desk1.amr.corp.intel.com>
References: <20240118231728.3817168-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240118231728.3817168-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6393ef-0a81-4dff-b77a-08dc18803d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydg7M0z3pQ0KKr9wpBru8vumzkkpPUwCUNRqKbowbjq28k4mUzRwr3Dd5xQdcIy+/WoiD9alAsJb3U6rRG5JjF2A3yRsqNllJDbbG5O5NE+p4Gv0lajjKtMRtQGsALNiouTmnh7mQLZcecmkpSsIFCST5m2RxLq5pXWJ8ef61isfZW18Z10j7E/Ua4fMujTG6L8VbjYTJYUKW828rgUmUpwhvgwYojlm9yFQtZxF3QPefbpTKOa51YWBmxww7k9BNe8X3gUm1pz/RGNV6L5gCaVUsY7m29fb5zl+DvTNhuOmumNeeKrQzMmP/9WquIjxb/5ni63ARgWnIzL1xRDm9i0HL4VRtJ7wzgL6PZMK2be42FYe3ksPfw5MRYIiut1ppju/1u93TTtp00bK5zQZs0vrTWAoUrWMbncsRd6d+TkQSlWJbi51LWNwf/vglCTA8hE0Usc6RVkq7OhBSTi6cNdUiurepDiqTXLUwuqRi9eXIm8DeHeR5C9BtxTIc/Sm2/6iFomUZod7hjOCVmNS9N+xkVXKlLWNIfxHV4X9BdKxAV8mPDbVA7QorGkai2F2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(15650500001)(5660300002)(8676002)(450100002)(66476007)(4326008)(8936002)(6862004)(316002)(6636002)(66946007)(66556008)(478600001)(6512007)(6506007)(6486002)(1076003)(83380400001)(26005)(41300700001)(82960400001)(33656002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9NC9hsXifLi2qexC1z+rjp2q0ADmE8SAanr+Tf/h1zeQORelBs9DjHF619Y?=
 =?us-ascii?Q?wWct5d68lIeMvtOxg17j3ObeeIZmNM6D8sS9z3gJhTJmWQTAmGdxvGPwViw1?=
 =?us-ascii?Q?y9eMpD+KosrwXJSgGD0EHHhlUL8qFcZpyicACx0Uv4rVLjnnjbD9026CHepf?=
 =?us-ascii?Q?e0XahIreK0u1Tp+B+mWOHNpJrCOD2YFU8ypgPEl/aJ3OHd80qXZrHmXIdSyA?=
 =?us-ascii?Q?5juqomR/Ms7fhQYGHX/GLp4sxSvkrFByABPjBj4Yj8jaZ3YNJbo1kIKOIgz1?=
 =?us-ascii?Q?/V6ep+xxcHPyPofHXpLkc4/infC1OUPPXImCaXag109JJ0fpD7IhcV9QNml5?=
 =?us-ascii?Q?tpobn8VtRDfsyVIpe78KKu/xkUpzw8ACJiEgU4c/6VaR0fY2ILQKTVrSlH+0?=
 =?us-ascii?Q?3Dop1tuCwcYu155Syf7cF4A6VgemyeKFlsABZQe27ipOz2X10hWyG8Xn/r2d?=
 =?us-ascii?Q?Ji78qzmrXP4EHmFsULgxVcstmtusxYkDOYb8kYLz6Jqi2y/aFYp0gj7F2qSQ?=
 =?us-ascii?Q?s/hL6TSTxDmNrpHMKjWr5I6u2D5BRPoJ8CJOH8+uekvYFOQ+yU6hMNQBnPyr?=
 =?us-ascii?Q?7VPCLIR6/SdBKlNmTduRUFUXkINKAzAY9H3f07Zbo5z2bMXJWjN8D2Eeik+P?=
 =?us-ascii?Q?1XTLtyJlcqA+/IcQaY2soBH0ofx3KkNangctqe1dD/l7cIIK0L0KLZW2BZ5S?=
 =?us-ascii?Q?Y1qENXOb9zcCiuyfD9mENYp731WnJFiRJ5VxphvqAA+AcicfSyArXhSWIe+N?=
 =?us-ascii?Q?K1ZY14gRdw8STkbPhYyMyaCB6fZvIq0dMY8GJzy9DJ+YaBJF/0XYg6wJ0J54?=
 =?us-ascii?Q?QymAKjhQ509oMa2b0u0hnUNxUsFd5qnRDg1uf2V/3IVIH+TM768AwkVlFtAr?=
 =?us-ascii?Q?2xEabZBuHnRFi1TqjQBUz9rKOEXCHU6FN8T6d1BU/nHUiIvk+lk+Iy85nEkc?=
 =?us-ascii?Q?pBNz1+jqQEFRK+/uLph6kFHAmy8lbaolL7t5G9rtx8zkWEm7fuMQaQYCL4nx?=
 =?us-ascii?Q?K35p7I3q+6f+gOg2ngLXAJV97IGE9uGkYJ3iTfPf36wQaJIcz4FXMMvgCYus?=
 =?us-ascii?Q?/uDwMVasFWzMfdjDradyGXGQTyRP9S2YR48BXkMcXX5I+iflXM9+8cwHRhO/?=
 =?us-ascii?Q?plMKwmDdF0cfRWnY+siF4e0EzvpzZVwVbFYMON42ES2iprYOWGcpPibW/x7X?=
 =?us-ascii?Q?kmCurs6v/qdshMZb2je6+SC9Bfmoxl6g7g1yDwApTEuCbNJCdZmc674Z9iX9?=
 =?us-ascii?Q?3IbW/4Odt7XyM9ESyIxofjGNLMq4ZxVe7O9Iv0tuCe5lPu0HszX5s8v7Bqyf?=
 =?us-ascii?Q?jpfjaMlAAgr2rsCoj9cq5BYzhC1FcAI8ddgMbJFqHLhS0xdwuTFh+SQuqhkI?=
 =?us-ascii?Q?e8rKxQs6d2QsXZULxmKJRR6cXrHdGchJryRM4P07xghivrbvrDuEBpZ7JwM4?=
 =?us-ascii?Q?3cVtE2Io1gauH+/IjgKDQVDdD577Cm1ZXu4ShqFupqLgP6MglonTnUVbq+cD?=
 =?us-ascii?Q?QMj9mTVNGpXWuiUd/Ky/p8L0OIHtlQIoGUe3mqZVZCxMm6letGU78ONNkwCN?=
 =?us-ascii?Q?fiAfaKdOL6eyEYSZXXfVAQHvpKh1TtLbOpvyrxw3Uu0D6MV9Oo3yAggt3EGu?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6393ef-0a81-4dff-b77a-08dc18803d65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 23:50:24.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAC+PylIx3z+okjTphvBqiL/JA9GDsfY296CaD83JvqCGstGurwNL7GiMcEMrHBgMz2CdlIL2H8e6arPSj3BrMNnXw8WoyGLQJPnbKvRV7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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

On Thu, Jan 18, 2024 at 03:17:28PM -0800, Vinay Belgaumkar wrote:
> Instead of waiting until the interrupt reaches GuC, we can grab a
> forcewake while triggering the H2G interrupt. GEN11_GUC_HOST_INTERRUPT
> is inside an "always on" domain with respect to RC6. However, there

A bit of a nitpick, but technically "always on" is a description of GT
register ranges that never get powered down.  GEN11_GUC_HOST_INTERRUPT
isn't inside the GT at all, but rather is an sgunit register and thus
isn't affected by forcewake.  This is just a special case where the
sgunit register forwards a message back to the GT's GuC, and the
workaround wants us to make sure the GT is awake before that message
gets there.

> could be some delays when platform is entering/exiting some higher
> level platform sleep states and a H2G is triggered. A forcewake
> ensures those sleep states have been fully exited and further
> processing occurs as expected.

Based on this description, is adding implicit forcewake to this register
really enough?  Implicit forcewake powers up before a read/write, but
also allows it to power back down as soon as the MMIO operation is
complete.  If the GuC is a bit slow to notice the interrupt, then we
could wind up with a sequence like

 - Driver grabs forcewake and GT powers up
 - Driver writes 0x1901f0 to trigger GuC interrupt
 - Driver releases forcewake and GT powers down
 - GuC notices interrupt (or maybe fails to notice it because the GT
   powered down before it had a chance to process it?)

which I'm guessing isn't actually going to satisfy this workaround.  Do
we actually need to keep the GT awake not just through the register
operation, but also through the GuC's processing of the interrupt?  If
so, then we probably want to do an explicit forcewake get/put to ensure
the hardware stays powered up long enough.


Matt

> 
> This will have an official WA soon so adding a FIXME in the comments.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_uncore.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index dfefad5a5fec..121458a31886 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1800,7 +1800,10 @@ static const struct intel_forcewake_range __mtl_fw_ranges[] = {
>  	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
>  		0x24000 - 0x2407f: always on
>  		0x24080 - 0x2ffff: reserved */
> -	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT)
> +	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
> +	GEN_FW_RANGE(0x40000, 0x1901ec, 0),
> +	GEN_FW_RANGE(0x1901f0, 0x1901f0, FORCEWAKE_GT)
> +		/* FIXME: WA to wake GT while triggering H2G */
>  };
>  
>  /*
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
