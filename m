Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A961065A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 01:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCA010E736;
	Thu, 27 Oct 2022 23:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E16210E733;
 Thu, 27 Oct 2022 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666913128; x=1698449128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8h+h1aX4yNqH1I/tbOJB6x+jvic6lSyk86fSGZMXx/E=;
 b=Om/wsfGx2Sqdjrl9NEh1TlZ1CyL0Wd1Frw3/nD0fFlLr94whzF6hQ9nJ
 rYIYP1wJpupzoUE/GX/4prX7NnRLQDGqbAF+D/nbvp53mcifvzNCgUN6d
 l7B5+dnqJ8IqQNyq5YeNZHjjGGnb6RsegnDjlJpgufSAJbh5gythW2vJ3
 YDmkcacow8+V0SBChBxjBp7oV2HHQp7lbs1XUToyseDSM1RxZNgQjNFBx
 snV2sJryVERH45FijXwzqhpfPf+dCcfWGkXrSyUOerDwtbFH+YzyTNaKc
 lJx2VCXQSrrF/U47ql1vPbCKeUH+GFXd57D7NSJxcyTVD3rL/WWTUv52d A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="307092454"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="307092454"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 16:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="737886494"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="737886494"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2022 16:25:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 16:25:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 16:25:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 16:25:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 16:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmgVR+cgv+kmMenIVePnWgFxMpKv4kbtBo2P2PDadPmj3Q5aco6NjpmaeTTMpxltS2Em64S3Vzf0HVFIkDnUd0IM83B24dP9A9PHk95bVLDe2+evNT9d4pHT7siKx3MzftcQsmXQehLGbcNCBTmv9xn22Gbz0zaRno8u3Uy9IUxZWupkdtIYSwTPtHtUderMIXCUiU02/CvZPUf+f1pE8vxL1QQiw6LTLSZLM0oTOQONtUHi5IZlZ7ApuEkT+WuU/OOp32/TUIdLqGWTUT2C3nZT96+4CkvFqYGDizPcApoiguTivMZGrrGytUm0R5H9d2V8XsN4LvUvXPYreyB1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj+8jI2FpEmu6XLgDCroMwHYx61UleOzzka411rYWtY=;
 b=J1DBQpvO+AEKAKdVPWFsiWRZqGzj9XKZ96MGe2gZPpP7jEru17gQG7zLFjCccS2CNlxG8OfKf80iXypAi/bMd7h6fdCut+cfkCsZYaBmPp7JbCQtL+r58ERYNrBZFWe9NLVl6eIoujamUzM9OZt5OIW5V43yCkkoDI113C+dU8C6rI9UnJqfb1kiJ/W36VXdK1tofd0wipkhK+M8cSbwa5s9hnl95E4Ey1bftrPIOsO4XzWm8omEoBDOQRqdTXuTzqjZHgKD7DdzG4fUlsKTdRIkhbm9TLSPt3Zye1IvRfsyY9PwUc1CGtU9hz2BT3Hbl5RQ5r8yP1uMv8rD2wopsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 23:25:18 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 23:25:18 +0000
Date: Thu, 27 Oct 2022 16:25:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/mtl: add initial definitions for GSC CS
Message-ID: <Y1sTW3uBg39fwEGk@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: ca29f093-9852-4786-590d-08dab872829a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYG8oEzqzgJbM2glfNiWwq1INXM3fcExXajEIGXsJkh6KW75CkaubAWZcxi25KZqbaphJr2dL197onQS+QyOScOlm7ocMhREJOnWG0Rz5pgX5suX2K+O3MbMW9dDkePou/Je75kuTQoEDUAn9LPs6cAyDUOHaqb39dgkEWK/6mkIM5kPOfRjmXOnDe4K8IfuzTLuQrWhg7sdShOv1aE5RZL8hHfOdoQfCrGqBI0uHu5gdgBU10kFTPx1TN3RaB0gPnSrnedtTJN2Hktvr3pTL6+1tTWl9UsZ2iMKJSjMud0/nvefTVUDSsU37XvBoW1QjEB2QBx8BBHZ10XPEUOFKK22G4URVIe10D9oJXj4gPIRvu2c30y1C1cIG/JZGwKrirsRgnzvf37oCEsZI5ML6w0d/adYKGHtD8bvm64rxFFwoNXloRgUNunSQcc5QkDEolSAj4P/nEO+uElGYOkt+u6+VbSPlY2RYLS82SR1wURcRA1UoN0ZUm1SUcFELuQy6IxK9CREmgnPh8yUM4DPsjZYMurBqJIFZHHCWm3iPw6EQn9fYvBY8P3D7JssPJWCybtP9h1xZCCAWab+UHrf4VlT/KyqIISh8Averdn83oUJaGnc6TufxzFCJ9CrDCWpXNNJst7IJajm06f1/VIPRg7YWHiEODKsA/ihbXeTay60MvgEE37dwoAbIcJzfvVZoPdedcDhSAUv0+GdeJynLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(5660300002)(186003)(38100700002)(8676002)(6636002)(6486002)(82960400001)(86362001)(83380400001)(41300700001)(2906002)(26005)(6506007)(6512007)(6862004)(8936002)(450100002)(478600001)(66556008)(6666004)(4326008)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fhTf/X5Ocz9GBJ4xr3A2kSxvIIKqEWW59k3cltNQ/rtvNDCFr6eCp+8AKjOQ?=
 =?us-ascii?Q?klOJxx6N3N6BxuMGkOcsv9NqbfzIgmLYPdjFxwyyYx0a6hmXhT014eKg+EuP?=
 =?us-ascii?Q?RHZ+joxPRUDGxYmD2hhykfcjOE+UogSpPKbr3npwSa9udemklbLon3fgg4AT?=
 =?us-ascii?Q?wBT4BfLqPJJ0DEsxXySB4mu0H3SVScv1/a9+rFq8/DkO9RKCE5XJVthoxXMz?=
 =?us-ascii?Q?BL1my85frSCA7lkhQjHcXFq07veUS+c2OOnuczo8gikAKyeYViHRk9q0zJ4P?=
 =?us-ascii?Q?wOU3QiPKocUisvMDNvHg9vOje8OKQkUliGSNxDannmCL2eMkY+5MWoYdyKW/?=
 =?us-ascii?Q?VBnbEggDqmDgnstpqVqAtCYEa/lTgHtBPykCpU4zg0nY2YbTLpUEvge3516I?=
 =?us-ascii?Q?2N9L/L9qBKPrOrD1mHYMciviryt7FRBOzVaJtvxVXRoYG51m15yYxzeWTN+Y?=
 =?us-ascii?Q?pxkd/95Gnj8jw8xOWw3j57d80bi+JC7Jb2CizrqPugclR9zAx8ONMkUdQJ7z?=
 =?us-ascii?Q?RtvONn9q3Ts71zIR6wftV/a04oIel9aXEyMoiZBbqwVbq9QkVhFIL1X7aBLA?=
 =?us-ascii?Q?qJxFmBS0WseYL0BJZkhwR9oDg8YIHoaCDqVKbgEnNZQ7P/OGcvgmXoSveDH5?=
 =?us-ascii?Q?hjF4FSuFA4U/UePTufvASx6+D8ixzbt9Ek3u8EQKzyAo9VWELpoHhslja0Qg?=
 =?us-ascii?Q?gs1e6e2MtNl3N7eXPzu1p9LRfJsCaMl21XbyRHXPbcI2gqbFYjrgJH09vdpE?=
 =?us-ascii?Q?wqq3NOASE3yZRubjUvH7lYSFiYYVjB6kcUWGXYpCIES6Byg2KqXkemXdTH3X?=
 =?us-ascii?Q?c3urEyUd1yKg645GALYiCS4Rgo+k4qw7J4Cz6+EMXwJH52EPsvjEjKXGtTdP?=
 =?us-ascii?Q?4nJX/DPuzonkL4Yqt0rWlytNI3wufcafdF4bXtHrqEItc96/URgYBInXX5dZ?=
 =?us-ascii?Q?aILMgasPYHbzeodOLoC+uCx6+n4o34IL6Wj0LnEr5zm6Q4dxNLIbkIIcemD6?=
 =?us-ascii?Q?BIt+OwyiRf1K0OVXoOmD1l58FJpGG2GgFPf53zf9n3STG6W6STYJwoOfm4UW?=
 =?us-ascii?Q?RhtufY2557Fop5R1yHi4cbMxW+Z0DRmsFOrCk38eCTDnG24HE91UIshmUsMd?=
 =?us-ascii?Q?lQV2FGwoJ+ZatM1iVSrJI8a8EuT0s5CDrqskrlBYEjuazgrIIjxpIh661uon?=
 =?us-ascii?Q?SCWQ31ZMhH1aWIqHu9Veb14qiSkA9489C8IHaFgnsLEWzR1Ts5TqEBv69FX1?=
 =?us-ascii?Q?vyjRNbh1a+gH1hOfKq3aPKEuYNrk+U7odC6nP7B+gwhxweTlgBbe0d0QpfVL?=
 =?us-ascii?Q?hnnXM6LK0bC0IeIxUEHLTAq+CXzBNxk4wB3ExLJjrxmpjBG/KjtQM0B6nqnd?=
 =?us-ascii?Q?bpXYgpKnpbXf53xYrEuQ6rtlOqw9q47/ncpHhEMJtpcy9B6DoUTzEuGeYd3R?=
 =?us-ascii?Q?MtUjESQVmCs4XQbMW8xHiFMnS77jKi5IpL5ekPxVw/eIjvK9jQu82MzJo73t?=
 =?us-ascii?Q?uFXDf95Fxp3GwxrppohVdS+9HS+gGU0R8P10/QIwLFyITpM2Msac0vSUnnZG?=
 =?us-ascii?Q?AINC0VgzTUbSlh478GqwFGXP6f8NlDoT6Sh7HdoFyr/xmEUZuB4BRox5Lf9l?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca29f093-9852-4786-590d-08dab872829a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 23:25:18.6250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzYuLwX8+mvLNEfV4FUr32jILuykccfzEHvmw3Fb3nRU2OZ741XVA/z+qhppgiRLHfH4CdRqeoDn/xoTFLa5jF0/7zTUPKH1A02MH1lzkJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

On Thu, Oct 27, 2022 at 03:15:50PM -0700, Daniele Ceraolo Spurio wrote:
> Starting on MTL, the GSC is no longer managed with direct MMIO access,
> but we instead have a dedicated command streamer for it. As a first step
> for adding support for this CS, add the required definitions.
> Note that, although it is now a CS, the GSC retains its old
> class:instance value (OTHER_CLASS instance 6)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Maybe add "Bspec: 65308, 45605" as a reference?

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 8 ++++++++
>  drivers/gpu/drm/i915/gt/intel_engine_types.h | 1 +
>  drivers/gpu/drm/i915/gt/intel_engine_user.c  | 1 +
>  drivers/gpu/drm/i915/i915_reg.h              | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 3b7d750ad054..e0fbfac03979 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -244,6 +244,13 @@ static const struct engine_info intel_engines[] = {
>  			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
>  		}
>  	},
> +	[GSC0] = {
> +		.class = OTHER_CLASS,
> +		.instance = OTHER_GSC_INSTANCE,
> +		.mmio_bases = {
> +			{ .graphics_ver = 12, .base = MTL_GSC_RING_BASE }
> +		}
> +	},
>  };
>  
>  /**
> @@ -324,6 +331,7 @@ u32 intel_engine_context_size(struct intel_gt *gt, u8 class)
>  	case VIDEO_DECODE_CLASS:
>  	case VIDEO_ENHANCEMENT_CLASS:
>  	case COPY_ENGINE_CLASS:
> +	case OTHER_CLASS:
>  		if (GRAPHICS_VER(gt->i915) < 8)
>  			return 0;
>  		return GEN8_LR_CONTEXT_OTHER_SIZE;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 6b5d4ea22b67..4fd54fb8810f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -136,6 +136,7 @@ enum intel_engine_id {
>  	CCS2,
>  	CCS3,
>  #define _CCS(n) (CCS0 + (n))
> +	GSC0,
>  	I915_NUM_ENGINES
>  #define INVALID_ENGINE ((enum intel_engine_id)-1)
>  };
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 46a174f8aa00..79312b734690 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -140,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
>  		[COPY_ENGINE_CLASS] = "bcs",
>  		[VIDEO_DECODE_CLASS] = "vcs",
>  		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
> +		[OTHER_CLASS] = "other",
>  		[COMPUTE_CLASS] = "ccs",
>  	};
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1c0da50c0dc7..d056c3117ef2 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -970,6 +970,7 @@
>  #define GEN11_VEBOX2_RING_BASE		0x1d8000
>  #define XEHP_VEBOX3_RING_BASE		0x1e8000
>  #define XEHP_VEBOX4_RING_BASE		0x1f8000
> +#define MTL_GSC_RING_BASE		0x11a000
>  #define GEN12_COMPUTE0_RING_BASE	0x1a000
>  #define GEN12_COMPUTE1_RING_BASE	0x1c000
>  #define GEN12_COMPUTE2_RING_BASE	0x1e000
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
