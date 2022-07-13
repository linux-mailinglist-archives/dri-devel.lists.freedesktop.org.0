Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C86573F72
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EAE14BC3A;
	Wed, 13 Jul 2022 22:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBD014A633;
 Wed, 13 Jul 2022 22:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657750160; x=1689286160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TODmDBaedZy/FgdSAKosxZOedLqGyfGgRKMj55HypEY=;
 b=bBrY0pm91kaBBesc2M2S1tWsntwuZwMQ9G7EXDqqBOKRCTZ8nqM0fAun
 FtgZ7PN2dEMtEk7hcgE8E7cuEgfmSiS+b+qKrehXT+nW7R69dS4Wo1zEH
 D0XaB3iAYX+N/CVa4m1D99q6SJtw6lJhVUCaIX+4Ud+VVfz+3eUuLnG6O
 jwXx0V1ueLJMvlj7SRYIwuz27BaOFcS/8ufccD+QTAnObwjDvUD6e1fFu
 5NKRsk/LAqVFw65i4AJSQBagPWpes2GNuFe0njkruGF/Ttqlxg6oF1cO2
 cDsfbbAMI6PGNWWq8Z8Kr569DlKAO8pyzmbBZVa/2dY8FcmbezdE7QG82 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="371669459"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="371669459"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="546022989"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 13 Jul 2022 15:09:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:09:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:09:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fndd7x42T2k7skk73Rdjg4zExhikaR7YiSisAvQokUJEQ/tY0DLffc9plQV5EuW4kkEZB8GlaTyDRB0QG7FTwWSAfcZjIYRl/HlDmVseSVIol+XnhZSW1khaCCMhVt8ztlzNbN5sFyneU2yiwmbJarJrHdDrbO/WTtSlJyZSj+wNZ9Ky9U9BZ/LIZf5cgfB7Dr4BFXHuwmFCYwch7IiYV4TRMHw4drflhdNPoxDJsIgAFXimV3MaGSUJ01g+H4V6AfQskr/Ki+KPKgfTdZvzdh8WZ2mCa7CQqtq3OxIFUKTmMPrjK+HKPkDh73rPgUCXTLtsf7PHYx5wJA2mFpt7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I24kGcj3f3VFHTt3MKbk28/KrU/ujm0dQ73uiuaaRNM=;
 b=dwFBYPW3u1imafXhfYQrwgzTZyWe7XRRwmV6utCmudgbLVYJ30T4OSsWbmkO/L//+FbnCurcE++vD6dvdF8ogy41os2iNJEReq47WhyvipupLyjpElR6afqTEKWpZFGtg8sefV307CjDF0+9/20tnHWcyygcSd5YARbiuMcwZ3hpKwgvgDCr4f4uG2Dj1bjgueDLz2EZIn32/6ga4ORtHpYPayjABocVT+BZzPI3YPmFU57qY6Kz2Nq0uBlSOGn0nwXzAazzFIW8p7uPS3797KZ3UCvNRy0BjlQ+cp3CApNKUBtz4imphSwv/2hihAE9Q1rWm8vC9X/AbJx+Rcdg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 22:09:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:09:17 +0000
Date: Wed, 13 Jul 2022 18:09:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 09/39] drm/i915: intel_wakeref.h: fix some
 kernel-doc markups
Message-ID: <Ys9CiKZg6FZJtoGl@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <781e207ffe403a21f67a3f8c3bd39725d229cf0e.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <781e207ffe403a21f67a3f8c3bd39725d229cf0e.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8474b5da-6afd-49e9-9940-08da651c537f
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBxSmzxpYZeTkphEepmOalMRb3Y8K9vjS2GPChmSYWvu8zVBCwYzwLZEQ406LlI5ZUimj/OLMCGwFoMeoP4+mS0+8L4XAimLh6c2h7QTmCKq5n5g0svV2RnkJ577sSBGYPsttzQPx/3+i5dygplCg91flvtw+3KcW06HbpK1R5uYIcMoPTvc2OMp9YSpDYNKlpeWhsPdyYaJ9PxCfAygfLiNkC0c9XK4kCTZVJ9xvJTHO3bwh22tu3ELAajOSp2GHDdJ0mWf+HjPgf9nXlMHBBvE1qgwJxBIDPbbc+QWgHIz3FovDNpvVR1VjmLQVMhPT7g9elFw2ll11iC52LZjVzGZ02JuN/cOGqX1TX1ZfSNtM2YwK58RLGCnUcZmNi5H8kHGWci4I8gNPXeCc40O4U9leeKY76N749l7acECAR4RQ0gJzXXuu7sNBhQITTkTP3af9vZt5KBFq5C5KgVdoI1om4MugrIZ21fNIm6+PpztsEHi/fD6/r4wfj9bcTKQYfraf7QLdA9a9jZiSSd4cIUuujNZtn9NB1kobmkl2rh4gFKnnKM7kDWOCBzfp6yIM60zxrTv2oMUpkLPlOzr7WdPyfaO6Sd5v0JBX7wOXMKyh4Z5iHALOJYF1HKc+rui8nL7FwZn5U0w4tP8hb8GiULZGnDpmP1Ge1MF2nOvdPVkXCZL/6m1OgW47Y8LRBQwt6rlrhYojVIv4GokBulhKmc6EbumSLil4njDJ3Ea+N/Li42QXmXMVtrBTo21l4b9d6rWZsRgFGF4o9hGt2Kal4pdIrXSYxFnxg6XxAAcDeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(39860400002)(346002)(136003)(66556008)(38100700002)(6486002)(2616005)(66476007)(2906002)(478600001)(966005)(41300700001)(5660300002)(6666004)(66946007)(44832011)(186003)(8676002)(36756003)(8936002)(6506007)(6512007)(83380400001)(26005)(82960400001)(316002)(4326008)(86362001)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L/W5nHK1RNqZRQuSrCKFMPECuIbTFXhqDJjNtB0SAaFDrrrAoA2zPdEO5pP8?=
 =?us-ascii?Q?NMYO8z+tGCLT2je9MSrvE3rhlML1WZxT9+ytoTg485paJKfRNQNbwinw4nV6?=
 =?us-ascii?Q?835sM22WXoKlfZ8RTB+gmd+AL9HJyEWl95BiMQVcMZJsxqPMkwQUHqcMJ+UE?=
 =?us-ascii?Q?4WVvLzEoEQyjyNYjyWfY67B/IQNT15iecn9v1MkCTuO1H3nQmwlR0Z3fgJoJ?=
 =?us-ascii?Q?otIY3NyKu3bvtKFuPx2x/dofVG7c6KCy8VyIjcXAX2ITqmId809j/KEZkwnA?=
 =?us-ascii?Q?daVa2f7pQPgSk3zNJ077z8VzEUa7b8QXEjkLc2QBx1yX2BrJr9SorI4q/kjU?=
 =?us-ascii?Q?/nZO6vyKTmUjN5A/7e+Xpb/1gWDNeZFgwGXxqSC+jehaLp+5OL9Vf9SRFYXF?=
 =?us-ascii?Q?gS2mbKbPdPiS8TeuBcZehdlVbrI/3vhxb/dTDt1Usm6LsSnpPbZGdlpxaTyt?=
 =?us-ascii?Q?GUYQLpz+YLXr7P13mxHZAhm/1bfu8BPb2UkuNQwHk0UgfdxygUAnq1P/ebfa?=
 =?us-ascii?Q?GjEIRfIl5bjs+yILwgN0UYRXSf+PDAUs+Ylwjw3nAiHRruFy5s61jnNnvmXJ?=
 =?us-ascii?Q?YFO8cjAjkvB0jS+KSQUBiDUY8V5Kp21g1a0Bari6UYmqZ0VHHXJw0ppYO9cP?=
 =?us-ascii?Q?i+IczU4ORXF50naUIojCz81PZNsCB/R9JnXnzhDBWBebXQODObD9p8YFRtXM?=
 =?us-ascii?Q?zueVL2neRBE8gnh/7HODuHAATJwb7Neq5lzNNhnIf++LnxRkAg16WloPDbnX?=
 =?us-ascii?Q?E90w4XGpZEyMDy36jhlVZ0hpHM5+O11X9mUX+jqrc6Gu1XLI3OkIBbHISUHv?=
 =?us-ascii?Q?egqPK7h1z3+e5mV47sNi7vs7YGvPX8lIztzVPp4+Hc/PB4gEyjso8VZRKPM6?=
 =?us-ascii?Q?06EQjedM0ucSGnfP7Hfal+/beoOGMa8NiI1Pt3KwU3fp0xKxNFqY/LJ/cP6B?=
 =?us-ascii?Q?BtOUEo8AWW+G/W7P8qyu/FjBaV3RDpLxvnXQzIG6XKe1T7fE72bcZVriVohG?=
 =?us-ascii?Q?5oABRv4pojd18yn09403KCixrpmREnDSiA3WH4mLejdEoXRIlMGGRXdJO3Im?=
 =?us-ascii?Q?26mDWUrdCPXB2fQZdjEiwonliV4xxrbpViTPOQENcspYIs1nkmmC92DA0v70?=
 =?us-ascii?Q?ee6Z4V2DNErWY25SuA98kO8g40fPYkxkQiInIBpr+aKtP/P+r+v7GYjWlR7i?=
 =?us-ascii?Q?kZ38bM43VTL7CCat8WcpdmeYAKKGE2zB/Mx7c5AZ27CsftxvNLN2tnvylwgA?=
 =?us-ascii?Q?3auSi3y5YIlwHOhxXe5QAsx874ja0LRAJO2+tqIJXJItLy+iPYd6n+oEHkBp?=
 =?us-ascii?Q?0PkAOUg5kH+ZUfNjtqhoFdDBUKOMuIjQd5XFf6i0sTwtKxgmRCWwvl1O+L/z?=
 =?us-ascii?Q?b+FbCHDODPOK17rIQP0F9KR9vEQqyP1l8wAdHRJBaRxui0JgMXgBaiO2QoWB?=
 =?us-ascii?Q?IqckK6rZ2BtSgJEda0OufAs/s5A+eHQFWJEEDGaYrdZY+ap3CRsJietFip4d?=
 =?us-ascii?Q?LVABlV5dMJO44t2e3TPVlokrAq4Gu926e6rWRtmxUoB7EBi6ZfUyV1vYsfUF?=
 =?us-ascii?Q?Czzp/0pJtLU+gAD9lfJ9bGIRZDsUbjcHUJhJmoB/num9R/R8kDfIS9N6hS10?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8474b5da-6afd-49e9-9940-08da651c537f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:09:16.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siUTGSBmAkXl/cauZfkXfhN4HFf0Y79kUEv/ZkPqOHBvI+9eOSwmlEASAQWJrpZRwkYjDXKogXcZPDQJBtgKwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6211
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:57AM +0100, Mauro Carvalho Chehab wrote:
> Two documented functions don't match the kernel-doc comments,
> as reported by kernel-doc:
> 
> 	drivers/gpu/drm/i915/intel_wakeref.h:117: warning: expecting prototype for intel_wakeref_get_if_in_use(). Prototype was for intel_wakeref_get_if_active() instead
> 	drivers/gpu/drm/i915/intel_wakeref.h:149: warning: expecting prototype for intel_wakeref_put_flags(). Prototype was for __intel_wakeref_put() instead
> 
> Fix them.
> 
> Additionally, improve title for intel_wakeref_get_if_active().
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/intel_wakeref.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index 4f4c2e15e736..63e539c9b1f3 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -104,7 +104,7 @@ __intel_wakeref_get(struct intel_wakeref *wf)
>  }
>  
>  /**
> - * intel_wakeref_get_if_in_use: Acquire the wakeref
> + * intel_wakeref_get_if_active: Acquire the wakeref if active
>   * @wf: the wakeref
>   *
>   * Acquire a hold on the wakeref, but only if the wakeref is already
> @@ -130,7 +130,7 @@ intel_wakeref_might_get(struct intel_wakeref *wf)
>  }
>  
>  /**
> - * intel_wakeref_put_flags: Release the wakeref
> + * __intel_wakeref_put: Release the wakeref
>   * @wf: the wakeref
>   * @flags: control flags
>   *
> -- 
> 2.36.1
> 
