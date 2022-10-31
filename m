Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D7613B4E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 17:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE9B10E31F;
	Mon, 31 Oct 2022 16:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD710E30F;
 Mon, 31 Oct 2022 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667233607; x=1698769607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fFy2xy4VUUpXUxvYGqfCzme7yJNnsg4KgW7GYT3+y24=;
 b=oELm3tsn1zq57RI0lo64hpVU6ncHKuIz9JGZ8GQN5lt2N4LLbOEbiJ5x
 d7EMhbHHsDvjidDsALJSKxZ8+MIXlFfyZLeVn/1BqyvvKuvZjfKUdp8xC
 Fme5RvWx1s7CEe9xK7SeXw/bqiIsrooTctzzJK926D5u+04mCYPFk89bD
 HwkxIzfluffljUhQ3VbVb81LEoHtM8QXcVYf6gaYrYA7dUfSULzxqkErJ
 to+ClJPR8xX1sW0Aa2vBNIaNRJChar8VpbUNmYwdQ1MNIlkAQVE08kTQr
 gACJSMqE2hT6FVYmp1za6UUVMPtL6r+/GL80gsR/b2NDXG0wxNmDCxuU8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="289332365"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="289332365"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 09:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="878791139"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="878791139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 31 Oct 2022 09:26:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 09:26:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 09:26:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 09:26:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 09:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVIpu7lz8sqOsjztQom7WgX2h3IPIrh3KoHJnolqe7njjW5T/Y45DqFBs/3brnoOL2BsDLeL9Su+toxPAGwpLEyPECJlWY4nvZK9cF+1KMJbYHsVTxhMLOFB2eoQ3Es80Rv3ySbmP5b3AObjspJZEAaPe6BMgPuQUVQo3oPpZay6gKMytjezPTDdQ3CJvGr3AkNsMFi6sxVCFZbJ5+VsDrnalKYv2AKxZyTUKPRmHdvR7/K9lR3z2RjUnTQ9Y9KwJYZn5SeT0AzomO19hsW8NxeJXAoWBO13Rm3TaC4DVAOpfAiubt/49JpXF9B6lDgWOMp6D4h7FfYTTQYszCeFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trEBdoh5EXMrrDcDVlC0wFXFL0OkhKj8dbH7nI9gDV8=;
 b=oFEKjamNXr/a+GQN/av8NMLhg7Van4rCQVc608cy2hYOa1xY8wyQSEiqKm8AiDlxFM4DN/TNJAiUkT3p9bNq5uVjRyZgTv6w8+fdX+KDUluYhBH4sMxb53+UrdShCWFai6OB1v7lcNZs+fWakOnqeuO07Xwsjqac+Glpf4nDbpps+JMlTUa2xVQ3NOChDq++Pr4wh/9d6Zg/Vd2UZ9jJEjBKRmBlb3SKXflNFlBt9cw0GY5orZXRfNiun1+DkR4uNjNtVQSoV4NcfHB2ANtG9urBtYUIal5HsM8a3chEL7N29UZNLaJwV6N3WegfQcL4OyMlI3U1RgOCgMR9eZxKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ2PR11MB7545.namprd11.prod.outlook.com (2603:10b6:a03:4cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 16:26:44 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%5]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 16:26:44 +0000
Date: Mon, 31 Oct 2022 09:26:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/mtl: add initial definitions for GSC CS
Message-ID: <Y1/3QfxBQt5Hs0m0@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ2PR11MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9c53ef-0f27-41dc-b263-08dabb5cb2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ot/UiZbGXLdjAUdPUguRDzJX8iRTrlzqs2CV+/mRYjVAbRYL/YfD9H0R3VhUOygAgBiNyCNITJ4XuJy8dAyox/kKgrA8WG271WpIgmQPe+qXyy5nYlL2zNpSaMYixY+Vhu8NnylokRPylQN2FStcQ8/65i6drGTIWgnvBxlXr/ZPB1/EU1DwaK4F9udizxWq8qmKUhA2RqvVP8m+Nh97Ank1qcmIFVz5m6cySryin9xrEG7hQHNkT/JM2ZiPS+PC/xLasoFCNgsPfAsqqFJ/fHy4lGkf1NvvN4eJDny7W2e11TiOqMoKR5OD6AAYSgdEBcH5qtFV6ALbrrkb6ESXsvcA9mNeB1MS7f7o/SbB5MHRyYbCl4HQIznd+E2BzkJc3ef+b5QHW5hE12dzFENpq1yUmxy49HwJ0TpUhHA4SYd/hinESbRg5swrZleR6ivu75fyBGteJi2MKR3P904+qVBU5B/Z/jk4iJMZP/L8ED24h47TSmhNlHL/lCPjxWnu3Jw2Cjgdnd7FlWwatGiTo4eITpQ8VYlwAc4XQEVWy5flVbpkqwNCd3CL/53+WKLncGLvHFU6UonEuOb+N/YIHYtzVfOe+G8/MAKN1TjdafpKhYuuYSJu5tOvDaG0uHUQKxTvoluJD7GiX+xuZWPwzdgBLoLQh7+9oh+ovzPSP3t42z66l9otoAMVSlD2Fnzd8xcvf8X8KyJyEKUVcyYPFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(82960400001)(6506007)(6666004)(38100700002)(478600001)(8936002)(6486002)(66476007)(41300700001)(26005)(6512007)(316002)(66946007)(6636002)(450100002)(4326008)(8676002)(66556008)(6862004)(83380400001)(66899015)(2906002)(186003)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V5HKdOyJ009li8utJwxViCDsB71ZXzPCxVJ4Dn+12WJUJ9hmzLn2jVeGjeKP?=
 =?us-ascii?Q?bwBli89eVfHYLViNJ54HVVByU0wVlMG7p0KHbWxRNTS++4mdXJ1IZW2mYjG8?=
 =?us-ascii?Q?/1tQjQAxXK0Pr8Hec1gslrc9Q/wne0sdLwCwtVfEbqwyz0IPZjWkQxNQ6fv1?=
 =?us-ascii?Q?jp/ghyDj2DraY2+1H5DGbhsJCPjfxNQ+krKFpbq6LD7zlwO89sgQuKoZuxbS?=
 =?us-ascii?Q?favvNzvo8n32Q3KkJGxgqNEs2OSF6Qk3+plwuvoValmezLvn6qyvlNjrRB/8?=
 =?us-ascii?Q?8d6XZW9IXeHYDKQ231h56DbMKYWVnJwTeE6IV14Wxlb0uIljqXWiQca1nioH?=
 =?us-ascii?Q?XqqH1te677ZLdYCfgJa0B178oZQ6q6oWHApdCySafp+TfEl71U91iZkMV9bS?=
 =?us-ascii?Q?3GkkA2kNU+VlWiKFJOzRwIQkpnjYVsxg84rZ2DH6+ZwAKVUGY1fhUGZVcZ6a?=
 =?us-ascii?Q?VhWIWqkEiV/DQuX1lTutwBjihvAtMRXYL7rbC20amE1gZXUTG8+R9sxcTuPh?=
 =?us-ascii?Q?ObN6OTkons/M6NE8L1UXTFjX+Sg5ckS3LHdYETP5uXHdG/uCnCghiu5UNU0a?=
 =?us-ascii?Q?e8W/PsuMUJ1xcpgdzB2Bu/IinY0qR4iJ7E1ou/IE6kBfWaGg7pMQDQDTnTPH?=
 =?us-ascii?Q?NR91c959M2cAgMWMvLKRXPAUSByznf/XLrPm4JZeBZNsQcaIMBFcK/y+EFLf?=
 =?us-ascii?Q?bxPprcAvqvT2KG2obYbcyDERI8aqsEW6OPvNb9TJMErXXqsKw+/s49dSVHIM?=
 =?us-ascii?Q?OW8z9ON9AnCqI/flsCHjz9twtKNudplUWk3HF8kN5zslBj/actuWyiz3QsvA?=
 =?us-ascii?Q?8kMPF9v3LRBp3Gf7nhg+cgRfRGOun2yshG0hBnnXz1/qEYawZzh/9mbe/Deb?=
 =?us-ascii?Q?GxYCnFYjoD5kNGW5RbrduvEsJ6dp6QwVJwdndZm3vJHiMC0DAjwPpIe71cxE?=
 =?us-ascii?Q?3Dah5rXTLGI/E/x9pRUhidFYE5z15HSfYj2yGlPNbi/KqGkLGRdwfUlEUZDQ?=
 =?us-ascii?Q?MDOl4MMXJVuDE3Ccq9EkafjZSYAOAg62ovHg/rsEaYaPckgaVylOKFKag5Jm?=
 =?us-ascii?Q?Q+waebJeGF00FbPULXwfGbFPVTKZkDSNst5tZPXIqHhI7/4MYqz5zyDmEpRA?=
 =?us-ascii?Q?kGSo4sptIuz69qefoC4jyuEW91wQZymXAzBGpZ2fdTnUBO+qFx9zAW6TdL2f?=
 =?us-ascii?Q?ot8PHheSMxavOF3iJZNhpldqjBGQzqD1rPCJEIWG36IUbxqwhHuDGxm6XwhD?=
 =?us-ascii?Q?uYa94YE+xbvL0HBV2MQLdOjgqdfGG9cw11u3jztYmErqLdDacS8TAtNYwPQL?=
 =?us-ascii?Q?pN4uz0UX/NspzevGpI+In6JQABBkppp++CVAuHl71/eaYcg0+MaHH9KLkK1Y?=
 =?us-ascii?Q?Sl/PQVBngewd1dUereQSrgmi+6dweT4kEa9JQrl4a3E9hLlp3iAsHwA4MGGG?=
 =?us-ascii?Q?LWvU5HxmGyeK0sHQrcL+SV/95rsJKgUSLyix5EU+etqPm3wBouVSg/mTWRHW?=
 =?us-ascii?Q?+M66mkEfgnv+qQHl4zYE+i/vHzGj2eByM6zTICdd4QGSeLE1fCx7l/ZNyqMA?=
 =?us-ascii?Q?+tbKvhXxH02lMbWgcL1JcZc7IV5lUpfMEtexjj2xN++B9G1WnyrXuy2+v/Mo?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c53ef-0f27-41dc-b263-08dabb5cb2fd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 16:26:44.2264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HctZHFWE6fXPwOAzwE+64MjVKc0FqLoiu8o/J1pvOVxgjpfwPtXluZNfvy3w/BGLXWlGpAbmSz8dAfcIByUC7YAwxxMIhXMXcd+dyD4OIQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7545
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

Now that we have an OTHER_CLASS engine, I think we also need to deal
with the class -> reg mapping table in mmio_invalidate_full().  I think
the register we want is 0xCF04?

Matt

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
