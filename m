Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86F058D75A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF430CE4A0;
	Tue,  9 Aug 2022 10:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37B7CE45D;
 Tue,  9 Aug 2022 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660040468; x=1691576468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q43WmjiFyII029kG1JDy6iQ0V3jBAnC81yUJ/95b6Ew=;
 b=W9jjeICJvG2ReU0+R6iwBb6hOWsncT/Ci7IAAC5B+tvcKq1QaWu/VshQ
 zx9Hg6OkVhqaPDbMwN84H+Y4ozXwEyQK+lBi2l2MsPbzr24Efx72FxJDh
 6ydPH5QLkVmmxGvGNBR4Zjm91pZDbeX5jAHfPzsMhdvq8B5Sk79kznPsA
 b611B0nAhsyHh6JIycZ43Rv92cNf65OlOdXfC/jsKXGOIHmwZ/X5N/hez
 2NLFV5C81B9xoRRxW+hFs9uT5eMMQhMP2tqhJv/EYqHc+TIMoQu6WO5in
 BlVKFhksPYVm7lRoiX4Dsm9d0uM8ZjggRYBMzLphaVD3n2kBAUzt7GO11 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="271187784"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="271187784"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="580743215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 03:21:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:21:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:21:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:21:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:21:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfeOQ5C/Fy1Zo9HDjWWFZGtNj+FSPz5ygodmrLqXuXhAXvcT9Pgc0+1Dx7ikUEBjPeQypE/Pnhb2SYQ1m1YTbDUrUbLNyo0bnuDy5YiBakxQNJYbNwaxOKOhB/1iYaqte9Pb66VQmUsSIUq53chIZWvmQWQLrRKxPMo90FEMBaTrxDS7/+c8+kvOHNS4DV5VWcIY1PYMP4Nf3DgFQepNnXHOUixMADQ0J+65Ae5ZKGxD3uU06gxU4JeHczUi/JRyuvbvJfQEwTv/C3ep3Jtj5jJ0F3cSEgkZW7yvbuayImuzQoc30Tuc8YTD1slMVppHze03hAP3DzNKrMMsuOd1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4/JEXKkDLHNn8iiW7aXTjBzBOCz/InhtebdTYB9LSA=;
 b=JVXI7ikaMMge5tv1lOIBLDIIAlq/fmnUCGRrgewQbqyeVKOPXLi7lpxLSK4ElouqMr4kNBoaSc6IQh87Fae0GelVN3c93yoFNss4+BI3AGtLAZG6K2VM9ndLO+C6Unxc/iMAvxzzDN60ovtnb67vwnKguUOAvbHvHZZfc3KTyhHU3gzpCvPZDt/J7jU8se9L38pcebms8blq4dDjFnuerFHtE31fru7ZJy/J+aFNPtCkJxlGYsvB6t9Ukna76+x/ZJHo1e9OGhQjpvgkfUYPyWF615hylgM5SEVA+8chb82qm2cCXdJOAj1m4rHFsxzJD5D/vPHQuRY91CpdNPd7gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR1101MB2199.namprd11.prod.outlook.com (2603:10b6:910:1a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:21:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:21:02 +0000
Date: Tue, 9 Aug 2022 06:20:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 35/39] docs: gpu: i915.rst: add the
 remaining kernel-doc markup files
Message-ID: <YvI1CbsIZIG7FVBP@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <5630ff7f2d5a99fc78b4fc2fa7e63649d23f226c.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5630ff7f2d5a99fc78b4fc2fa7e63649d23f226c.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bae470aa-735e-4136-5f4e-08da79f0dc8a
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6SV82ZOX5pbVaIZ2k3aUC3ukzfET/vJ0BVg3tFq3IrLfspoS6wJsRpxah1NXgFJOIWv40aHFGukycaA8QUmhKu1qr1X2rmf9Gr71gGwLfCt5enTkZ8L6K9CpFa6RdS29FIcjrKh8ZQrO99J/ic7MZN2cP6QOvA7oNRWPg7JHTaFk2OFpco7JeL21/JA6JgrtVmWMXmlFstWevM0IKOV8vo0amidAMJmUngc+W2F+XQlou67NxWS02uYiur9kBW52bJAPgdrxiydulXH1tsnY7Tu+acfWK9pEyAx7MjUYClNgY6nWzYiVPRcfMS/EUO/uyQF2eofdM5w1Sx401fw7hhVJDlyDinT3KKcUAb1lYFz4/fsjBxXbKlGMAFDnn43dNQCJtWu4lSTk6qD2HT6dDUAcMlOVDmnZNvoQdWc5rnDgexK0t0DBxk4eB/qbf/MsvgrVWPPQP4TTF/NQON+e+c94OGPL3go+kvvryBS7XgMCS0gddVgNaJuxgb6GRK5to68IoLYe5ni2OhvTI7sGL/f2XTOutqwdPfwBLgXYAufhMIeO01AmEhBQIJvppsiDCldmSAFc/7TmF3PrYk37HVaZ1jpRnXvfVv4QyeujAHq/h1qAcX2z+K0wOh/jMxjhOT/3SFWr8GyAep4T9sZKjPtiHGmXvPNIV9RdhItFTlMzd5LifqBvNk8MpHTwZW71eSopLY23cPT8OXMgV+uclkTCN0V1YRKuIX7AnQvGBs8M0OWIMkyphhkzMAprfTWb1rr5EZGCvAKca/Bw0+NLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(39860400002)(376002)(136003)(38100700002)(966005)(4326008)(6916009)(54906003)(6486002)(8676002)(66476007)(5660300002)(66946007)(66556008)(186003)(44832011)(316002)(36756003)(8936002)(478600001)(86362001)(2906002)(26005)(6512007)(41300700001)(6506007)(6666004)(2616005)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPtIpBpeaF5FYMCCroE2241OwuS/vLj6PqiGlzNEOXPwZ+f8powIWeDToZRu?=
 =?us-ascii?Q?dmeJS4P2A1Fb0slnMMUlObPkKjLOky33yxdmeqFT37WWD8rjnyAgPM4AmsHG?=
 =?us-ascii?Q?FuDrviPymDyc+S2Qpn9aPfEiLMSTyP9uAqxs7lAd2r3cVkpD0JrP7jZXelUi?=
 =?us-ascii?Q?yP0+GvP6+HK4t10Wbog7xYTIj+O2XHI9OYlYhqS0DQnOiYWKVUfpA8uOHw6h?=
 =?us-ascii?Q?yQ80xxKl/DUcxJcVTtLdAi0m7NUT2gNcllkH0vBggBqFmKUSa+X8RFvFhPRd?=
 =?us-ascii?Q?vWiX2vDmSaLR7wpzA71qB1oXQ+XCesdvBAwtOeFd1ooe/BgbmZGxd4H3UTre?=
 =?us-ascii?Q?/gjFOwMOEX7KK8aRU+WQTUt0Mqm4aktSbrX6kZsWvfLMECk/FLZgHLf3Uzzm?=
 =?us-ascii?Q?SPOyEO4VQQQPaAVdVeNKzvS3bHHYYAY5O/s2U7dXY5g0qk2kS+ueaSAeANvm?=
 =?us-ascii?Q?ecXy4FZbl05f0xNJ/mKA0jO/nJr5bLxu+3AvRHMhlal+eTLxpLvl5kKuI6rf?=
 =?us-ascii?Q?KNLVDXT8ndlQ8Jsfi3lWoLPDJM0B7TJBJo6+/mWFP95CXa/m3RIC82hcjZxm?=
 =?us-ascii?Q?lAwXjGrfDelsv9Rba9fWdev34C1hI8JQ8wIFnQ3UyB+5yXxxIxKA35+xVhiE?=
 =?us-ascii?Q?q/3JrMxs+r8phx8XDrAhlg3IJFViZoqlLab5TYXqvm8Q7CCqj6dDR/Jn0NCt?=
 =?us-ascii?Q?MP5vMS8CQwqTDzaSeC/dyxwlvkMRYA2qt9wksSH0+VcKtGE4ZgR/KqfZ9LmU?=
 =?us-ascii?Q?QIhbxSWHlOhBbzdfJ1ImfBCQb+Dyncz4I0CwQHt3cR7p3oTLsgvP8+j30Y53?=
 =?us-ascii?Q?qlJUq0YtXIejIGI1yvaL66uGO+5DA+aPM5RyGDroz1sLeNd3K+1Rc4j5gb7W?=
 =?us-ascii?Q?wgzqhq+Ru5QtVwv7je81oZMg5QarUJAYiNBm8dGeFDS6cWTLK/7flJkPOSu3?=
 =?us-ascii?Q?ewasSHkCZlDL7xFqCHisLZG1EZz398AJnraOJLklVpAJCkuyuEywR0uNT5r8?=
 =?us-ascii?Q?WbU72ZfN+2CIswR1H+ke9GsWt/uiIbeImtL0TE/9d3LqkZWrZ8WJUkW2bSp6?=
 =?us-ascii?Q?Zp/RjHvTQ7lMOezOjLN8B6reeU0DhJblcVE2PFfTpv5Xy7h2QonPjTQm1MuT?=
 =?us-ascii?Q?LDu+h4UPCmkCHrqpvzRGa9oqWo47Jp69Uix7F5FdHQrY1TZQBrqTWHrsAWXz?=
 =?us-ascii?Q?ys3TytERR41EACWhGFuz0goqAGiG2ujFY/0ZvWAp90+shEArxQfOlFlD1on+?=
 =?us-ascii?Q?kOKy5R4dKxhX7O62I065X+qTz1FHSeaKZHdvn/GBu4i4DQQu0j9b6pM8Ba1x?=
 =?us-ascii?Q?LVkIvBaI4TH4AaFyG8o8hBwfsWQeUQhxgDfBkESod+jYF/X1oyFVhfSI2F11?=
 =?us-ascii?Q?B/FFgv7lyX+BeWQSXeNFP0pjg7TyEa/jfRMskeF7adNSbEMvgH2MMray772L?=
 =?us-ascii?Q?w6P3wXUyVk9sHuVjpkpelsehbWP9hGH6QncXj3wXF04pceT+aJipVqr7eGHC?=
 =?us-ascii?Q?xJKpLMfBQATMOrhpWsFNwaZ76lme4i1PtsX0mKv6hoEdZBnNKlI6XAm/gSsJ?=
 =?us-ascii?Q?rSgHxqs2aav9+i/XddbJ36NjJFle5rhvUFJkBEkSERfSyiROHrmjG9AJC2vk?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bae470aa-735e-4136-5f4e-08da79f0dc8a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:21:02.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdAT3piaBYHUJp37T9fXrQGHRrL4ecyp1XEALDQaZvZQxuPLMKzWKlJYQ+/Qd+QiUguivfcUlPKRFpzbGXSJiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2199
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:23AM +0100, Mauro Carvalho Chehab wrote:
> There are other files with kernel-doc markups:
> 
> 	$ git grep -l "/\*\*" $(git ls-files|grep drivers/gpu/drm/i915/) >kernel-doc-files
> 	$ for i in $(cat kernel-doc-files); do if [ "$(git grep $i Documentation/)" == "" ]; then echo "$i"; fi; done >aaa
> 
> Add them to i915.rst as well.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 87 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 974754586be8..6bb50edc6d79 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -13,6 +13,11 @@ Core Driver Infrastructure
>  This section covers core driver infrastructure used by both the display
>  and the GEM parts of the driver.
>  
> +Core driver
> +-----------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_driver.c
> +
>  Runtime Power Management
>  ------------------------
>  
> @@ -29,6 +34,10 @@ Runtime Power Management
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_wakeref.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_active.h

not sure if this belongs to this group...

> +
>  Interrupt Handling
>  ------------------
>  
> @@ -44,6 +53,28 @@ Interrupt Handling
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_irq.c
>     :functions: intel_runtime_pm_enable_interrupts
>  
> +Error handling
> +--------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_gpu_error.c

not sure if this gt hang stuff deserves a separated section
alone and if the name is the best one....

> +
> +Memory Handling
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma_resource.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_vma.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_mm.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_memory_region.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_memcpy.c
> +
>  Intel GVT-g Guest Support(vGPU)

                            ^ missing space

>  -------------------------------
>  
> @@ -109,6 +140,54 @@ Workarounds
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_workarounds.c
>     :doc: Hardware workarounds
>  
> +32-bits compatible ioctl Logic
> +------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ioc32.c
> +
> +Scatterlist handling
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_scatterlist.c
> +
> +i915 request
> +------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_request.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_request.c
> +
> +Ancillary routines

maybe simply have an "Others" section and put everything
that has only one item like the gpu hang one?

> +------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_deps.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_device_info.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_params.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_sw_fence_work.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_syncmap.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_pcode.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_reg_defs.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.h
> +
> +
> +PXP

Protected Xe Path (PXP)


> +---
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +
>  Display Hardware Handling
>  =========================
>  
> @@ -618,6 +697,12 @@ Protected Objects
>  Table Manager (TTM)
>  -------------------
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/intel_region_ttm.c
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm.h
> @@ -627,6 +712,8 @@ Table Manager (TTM)
>  Graphics Execution Manager (GEM)
>  --------------------------------
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/i915_gem.c
> +
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_create.c
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_domain.c

in many cases I see only the .h or only the .c... why is that?
wouldn't be better already put both in all the cases?

> -- 
> 2.36.1
> 
