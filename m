Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21D66013DE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98710E716;
	Mon, 17 Oct 2022 16:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EBF10EDAC;
 Mon, 17 Oct 2022 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025399; x=1697561399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CU/68+MOkcC9s1xCuNGIj2JgaJjlof0mivoJzmwh33U=;
 b=XxFg84Gen5XlpxUezJilU9BbWtu8+mU+wZ+H6EsCc6vEbf+lv5WW2pjh
 MsbSvd4QJEuUaWmA1CJvJxUP6k5jYNpQC6XaKFmvT3yEwY1xegMU3C6n5
 Vyn4QQDOxsEBtpNAKx0nCOKvK1t+1RWx5CN9PEkGiWCefLYQi4EtRPPEZ
 abkK8NKZviL58IRKb5rMNNzHjE4JToP9PBv0CgWLL/P7Jm1RRfKFMfhdx
 1aluFlu4cODOK9T7bAANNh3Z/WX+bZIb1xwyfEHlFdgkTx5xYvoSQyytl
 s4Wd+8gzmCeXFUqHb8FCQRKAboQ6gPsorF8EIRV6Podckx/b64L/MW9FW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304595030"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="304595030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="630758632"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="630758632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2022 09:49:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:49:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:49:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXLCvGPOzu5E6GbY1BnhGPgZhLqzyP/2eu9k/GVllThVmFEGN9QE+tduY2G8SPxQ4meiov86I097p/pJdv6pyAvIWVxeL194dZRZmHSinccZuiKUEwkMSTzQAt/74FImCwL4BkckPgkhN25pD/qBR3881BZO1HyfMwT9IREcamN6KBwnig9ahIKX5QWkT1uWIpTOKE0PcQndTxndLdxDof+J8LWrSRSWz54+gRHiYL/bWE6eWwNhQGlWrejtbYghidPjPd7/8ezNAIkbGtO4BOILV11tZZrkOT7hU1BT8Acu0ZWBqDX3malgdnNv5LYHAPPnK1ixZOdnATCT3xokkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgkmexW0XFRrn7VmC/3uqxmhT5pKzvUAEVR2TkO42Eo=;
 b=k1pyNVPZj6vWOu6Zp/v20KsjN1f3svWE1YiYEFxU9qZo37Cy/IRp0rh4+X/oXbqpYJOgbyDt+NJJjLr5XAA8ZJnK980UV6h4yFybBSVkEhUwKVSYZPC/fWIiWcinfLD50FkLjLswqngFbo6M9GHvrZUvoqQDgREiMt1OgowwX4pGRUsbXOX0cHFDBjaoKWWPARtqCtVAU/QG0dFcCEUofrV9601+FTYly0BX92Zv/xlO6PEvKeMO9muJ/E5AfxQ1OMn9otFHTV/i4LA5sAGPr7T5B0WKMr+r+gdseCPhA6wZKKdRUzTYgQdBHB7jm1bX0FMyroPpp1FPricA8ZrkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Mon, 17 Oct 2022 16:49:54 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:49:54 +0000
Date: Mon, 17 Oct 2022 22:19:45 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/14] drm/i915/xehp: Create separate reg definitions
 for new MCR registers
Message-ID: <Y02HqcnTRESLHL26@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BM1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a786e6-7904-468f-a404-08dab05f9da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFH+6xyWkRcPysl+nzRe6pvGckQ+GD0+EgedW7D2A542CHISAgftMBTV2wBUnkcDDGhuHL11WH1zT3BBookIZ29apT+DPSIg1iTiKpiX6GTE5BnHJxl+FBvQXGfldgk7DGS3ESccRaJkmzciTGQNdgqcYlLnk3RwIYZBOryEiAycxccZTnHUDCycOmiUFg17zpXIN22oVGSz4H8qUD712p0iCU5f/iGkHRBF1aiuWP5iYKPSaSHsHUp6HQWZEy5zDgMCslTLbue/QGOuTY9F/sa32TGEfwUapE5D0kri3itNqYOADEYTh+m5zxcOAWF7Z/od3B73epvS2WU2TgjSAzy41qnGOK8BwbNz+1lF2HQL+Cy+S5iY69elWiqy+sSuQi1Mrj8FUYk/XZKNYcu610ACLh4o4GMBD0c7ZlgKQWgpnWGZraNvg12Usxj2P1omMqzoRAw8b02FWtCRJ4UPlM5W48EG/HKNH9/p8ZRAieCVHuiilTJNfCNabTSIR7nVL2lPLsWwSkpqHm9vic2vjK1UD1qvLx0MoxjqldOW8F7ycSZW7NEm9zarePVu2+Rbpx/YMsNIgPUWVZbTB/opCxR9t8P5W5jubUdS6wedY7Q/fFytckBBKNNIEXvwK95HrZGz1juPhaBREqHwgYPHjFTAG0wjZb3uWouk3CIjRW4aEnn+egPzNVSNJMet9U69MN80vESeB+1txhog65L68Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(9686003)(6666004)(6512007)(26005)(53546011)(6506007)(186003)(83380400001)(5660300002)(44832011)(2906002)(478600001)(41300700001)(66556008)(66476007)(4326008)(450100002)(66946007)(8936002)(33716001)(8676002)(6486002)(316002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJFMjNReER0c0wvZ0o3QXdzUkY2YklmRzNiTFZqNkk1WXJGSXpRY2pKNWYz?=
 =?utf-8?B?bzVrRTBiSUVOQnVDaFdRSEJsajVub3lMU3ZDcHV6T0ZVdXlsRzZ0WXBLbElK?=
 =?utf-8?B?aFhmWlQ0cHFOZTRHcFBmamthWWNjTmhScGFwUCtkT1Jlb2RwZk0xZDYxZzI4?=
 =?utf-8?B?OUJqcElXM1YwdFJrbzk1dTJUdWpZM0JCS1lQQW5zWm9mUEZoSGQzMENGMEo4?=
 =?utf-8?B?Q2w3Y3NaMHpaZzNzY1dxZlhwVjlPL1RyMEJWZS9EMXpPWFdlNCs3UWpjbTFo?=
 =?utf-8?B?MGdPSkZvbnVxSHpBMEVQZUlwWUtTcGw5b1BRL3BtclNVVUxxMTJrUXcxbEYw?=
 =?utf-8?B?Mk02NFdRRmRnUmg5OWowNVk5S3paZDgzVVB0TmdSV2VYVkNaLzA0NWZnQ2dD?=
 =?utf-8?B?c0RCZnQ5dHZYU3QyMkg2elV3aDBEWTM4UlhZM0NIZmszd3VUY3Z5TzkzcnFh?=
 =?utf-8?B?K0ptUnEwaVptcGcvYkYrZVBFOFR3R1o3YjBPVXpGejdpckZuZUw2TUpINXpZ?=
 =?utf-8?B?OHJkZGl6Z2k0UDA0WjU0TDNxK21CVlJQUFZnSUhlY09FbCtoV3lQRFdLcHJh?=
 =?utf-8?B?QlMzWEdrTEVPeGFSVWwyZmF3MkltV29vdnQrQmFnS3U0Mis2aTVCdU1nOHBj?=
 =?utf-8?B?czNyUzZZa1VTL3BMaVJpNzc3TGZpZDNIcFNPaDUyRFlVK3BlaXZYN1J4cjF2?=
 =?utf-8?B?cStpNlNGSFhCWGdwclhieTIyTkN3MHJ4SUNVWG9nVWd6NzNxaVdxTU5sR0xP?=
 =?utf-8?B?Y0lqN2dSN0NRTE9LcHIyc3FHbnRadERCbktYMjBGTlRKa3k0a1RUZmhMYm5P?=
 =?utf-8?B?MWlJQzJ6RGZBSWwwY3VNMmxmMFdreXlDbElFWmZVQmJzYks2L1FGU1NqalhZ?=
 =?utf-8?B?bFhqOUNsTWI4am1tZ0Nuc2JYSTBaRkFkR2JBWXlYM3IvREl5VnQ4dS9oRUtR?=
 =?utf-8?B?dmUrT2xKYXZNVlNJTFZEVndpT1A4U1FzeG5zNVFKLzZHR0pSelFHd0x0Vlc3?=
 =?utf-8?B?aWNBUlNGTEJGc1dsZmxJVkZORnpwUWN2Y1RoNlY4bFdTNHpHbnV2Y01RNGJi?=
 =?utf-8?B?MEYvNmVNUWV1NXdiVHY2M0pXWnZ0TTVmdy8zTWxUck16WmxwWk1PS1JYT0Fw?=
 =?utf-8?B?a2RVM05KMFYyRGRWaCtQNnFpb01mRkRPU3FQOFFuakdac2l5UTllU2RaVUR2?=
 =?utf-8?B?RXZOdlRoQVNEbVVBN2M0MTBxbks5akx0d2Jmak11VnZ6TmhZd1NBYk41RDhK?=
 =?utf-8?B?cTVQRFI1d3pvR0drMFVSSGgwaWUrUzlnb1NMQmtjb2RwM2FEWE5LS2hSUFhO?=
 =?utf-8?B?Sm14NkdCL3pMSlF1Y0VWYjZmYXFRcDJINENjYzdraTk4bTFEWE5MK1pjWFJX?=
 =?utf-8?B?QlQ0RlpGelNuUHVsR3N3VmtINmhFdlhGTFE3ZGVhZVhmbWdzNnVqc0hqcmpl?=
 =?utf-8?B?V1ZHcTVENzREMks1K0RzRmxjUERoUzVydWhJbUYyN3VBR1pFem1sR0MrMjFG?=
 =?utf-8?B?SHUxRS9qSjd3MTVsN2xGTjVPSVVTTURQZE44bmJSNFZHcGtiRGdaV2tHOGQ4?=
 =?utf-8?B?MXJKWUdxZ21XNHFJOElUYmhaN3d6K3kwdStBZUtLSWNhNEMzRW5rc1VlMzZo?=
 =?utf-8?B?MDRqeFJZOVdXVi9sMitsdktsUkxkMlpWTmNOTWRsaS9USmlVVXlrL0M2Q0U2?=
 =?utf-8?B?YjNSSm9qQVE1SWtXWE01MnNleFpPZDJWejR0Ly9Ta2tUUENOQTRwaElyaHFa?=
 =?utf-8?B?MjN6TTEwMzAwdGsyUjFVN3kyQTd6NlU3RklBK3h3a0tocTFRUHQ5VXhWdU9O?=
 =?utf-8?B?OTZhS2R4Q2V2eXlDOHkzcmVyN2FOYWhMcnpzbERIbVNMYWt2ZTllcFRZRTRa?=
 =?utf-8?B?ZndaSGtCMFZENWdYa25pYTBXbkY1NlVzSzFLQUw5R3NpWkZHRnpsWVFGWnhY?=
 =?utf-8?B?V0tKUTQ5Q2w3L0p1MnpJZW83Rko2ZkFhemRDL05lOTYvVW5WTytXK0c0TXl2?=
 =?utf-8?B?amRaakVjN3lRWHdwNmcrbnF5S2VKeW1jbkpNdTFkbis0TXNEczFjVHNxNkdy?=
 =?utf-8?B?OThNMHNLc0lzV2F5YjE0QisxeEpHV1BBWGxqL0RtcnFmQVhOOVk5WHNWMXNF?=
 =?utf-8?B?K2V1K2l6NEErMTdTTDdlY1ZyejNYdEFNUW1SWHlOcWUwcC9vUVRiS3hPUmds?=
 =?utf-8?Q?wd1q9l44ZXXN7CaPySzCZ08=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a786e6-7904-468f-a404-08dab05f9da4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:49:54.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCQAz9dtaJ75eRFOHwjUmPYzKmX0Yol57SMh9O3WfCBM4N7kBT7Jd8HlohxY4XCpWMSIaN1FK1+eGBXwYxfhuU/nCc567MBmbnzqJj6If6FTwqMIma/k6nwuBcJHthPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

On 14.10.2022 16:02, Matt Roper wrote:
> Starting in Xe_HP, several registers our driver works with have been
> converted from singleton registers into replicated registers with
> multicast behavior.  Although the registers are still located at the
> same MMIO offsets as on previous platforms, let's duplicate the register
> definitions in preparation for upcoming patches that will handle
> multicast registers in a special manner.
> 
> The registers that are now replicated on Xe_HP are:
>  * PAT_INDEX (mslice replication)
>  * FF_MODE2 (gslice replication)
>  * COMMON_SLICE_CHICKEN3 (gslice replication)
>  * SLICE_COMMON_ECO_CHICKEN1 (gslice replication)
>  * SLICE_UNIT_LEVEL_CLKGATE (gslice replication)
>  * LNCFCMOCS (lncf replication)
> 
> Note that there are a couple places in selftest_mocs.c where the
> gen9 version of LNCFCMOCS is still used without regards for which
> platform we're on.  Those cases are just doing an offset lookup and not
> issuing any CPU reads/writes of the register, so the potentially
> multicast nature of the register doesn't come into play.
> 
> v2:
>  - Add commit message note about the unconditional GEN9_LNCFCMOCS usage
>    in selftest_mocs.  (Bala)
>  - Include some additional TLB registers.
> 
> Bspec: 66534
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c        |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 18 ++++++++++++--
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 26 +++++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gtt.c         | 22 ++++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_gtt.h         |  2 +-
>  drivers/gpu/drm/i915/gt/intel_mocs.c        |  5 +++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 24 +++++++++----------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |  7 ++++--
>  8 files changed, 78 insertions(+), 30 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
