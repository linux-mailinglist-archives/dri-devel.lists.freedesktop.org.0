Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA7831071
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 01:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E82010E0C3;
	Thu, 18 Jan 2024 00:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A1E10E042;
 Thu, 18 Jan 2024 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705537207; x=1737073207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QICfs3rmSUx75LyhWCt13GXgST8JGTy3OetgRTwXgBA=;
 b=kGnZ7z9mFna4FyKscfTbnTQjY8WF0XNxqAqSdcNWaGXu4vVMfsmfBJ8Z
 5Nn19euty2JspXYhSxzBbwgRF9GJ/vf0ilvWen656B6rhCcJhct1RB9fP
 rcv+KWpfpbdsV5MoUjStb8qZqWVKGo1OWQRQaZsPuXUWCtGDh9ElQ0xhH
 rTmmud8AtqzuiYJsSmt4n0IW09aNXBD90Dgh6nVfmnIXkTv9BJBpCAFmw
 Oe8Ue3A8+AmI/BaXNfEPoU0t0uMChYm2n1bJkKxogq9bMNkeZhSYtS6lc
 5CNK3wAHF7W8f8F1TxyGBRJ9H6k3+qyuH+PIczkFDxEdFQPRYKVUZI+Zb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="390758623"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="390758623"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 16:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903651517"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="903651517"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 16:20:06 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 16:20:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 16:20:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 16:20:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKd+Cpadc+ND2gj7Nj/ZZPPBxTViy9mQwIg5KUqsyZNTsB0oqvB6d325T4sMTE6mzcPzmDLSuusv3Co+2uzbrylE6KkQ6wVCCzGbWKGQJQMSATLf6et42oURJbX1Wg0RP68AYuO5oKtNPBXmf+eAfY20KJEhgOzEiSKAXsApJ3wE4uaXQiVQ4Asfn9SQnCiTlPXZyanQueSh5vmcJw8qPSqZ4o9H2UvBT3+MoE/GGE3YTneoYByauH5T1h3E6KbO5n/vjr+aT86uo5Jmj/u5Bah2ETLdRxhxKPe8sioelZWmuX8LJqA4gYZ1yB1ZEC8R9EpTPEcSWDVT3VbggxRENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCybxmCkaJb18Y9OU1h3CipX3L4gIeQYA2nO26I4JmA=;
 b=OvbAkTheS1+Hdt+F8IS3zd+tK7zQU+LxnOcwE6/tCzXifPGjo9OpyhD749/UCWYqvNwzRpyksPZE5DOozqF7/l2b3icqzVTmcrB4CUBBQuJz3QRzLSpIAT195zTg8CuDOUC0iK6U4TFJJwPsxB39YthRfOJDZ4+FNHiYiV3oh06uQUPxCiw6WAgsaXYIHF3oqFaZEGKLjG+rkOUYSz+TpN4pTkOmN+qFw/QaCD/YTG5CzrjLgoVu3wYkS+GcEH4JSeE6yVTZwfkMktwghhEcEeT6esm6TPGmZ/ygbdMibT02gijFbEcqxDMiTZefPpF4gEIZOzMXyPXKo98uBcL72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Thu, 18 Jan
 2024 00:20:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 00:20:03 +0000
Date: Wed, 17 Jan 2024 16:20:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Fix cast on trace variable
Message-ID: <20240118002001.GS45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
 <20240116174050.2435923-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116174050.2435923-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5dbf03-5c3b-4fab-db19-08dc17bb377d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90abS7ghdE1vwzVoYYgjKOIBSrX7p99NXZ0kcN+sc2fqYCi9NGe209XLpOYBFyGZ+uDn8hU2+z+cKYLXUF4i0P86D6V5rdDwwWPf/CjmQ4MlZN+lmubQN6KFfKCXWejsGyeL0JNzbE8+FqjjCJWom0b/+FiCYn28wLpE1rhNxRsQaefUlHYHHzf6IO/8B1pRoLX9TCDRuBzps2aWba7k9PKhLZdqxF9tDXo8CiRpoY3IDOp4VIiAmUrzZ59IWeSEHIJNDGurDTXzfqMfjyh3303fPQA7c4i6PzqT4DXT3BP/S/gjUzN3l9wZ081VxtPIW33fzNSQ2x6BCW9qetvO5IJ8FinUsG8S+vVPy/CaE5w0bzcPcTKgzqJsq1kMPJRfuZWscnOUcZ1b1iJCDBexvXucUio2ivby1nMco6HiT1jxILKcKeGLRnrL561TNDx6RPZy3hdNMSLoOQ/KAFzhl6lWPnow0mvDmIdcvRVeGkXJBYfD+Hj1a7B7TMMddtjsJqoFvfBQ4ybZQfCyqGXJBNvUM0coMhLM46g1FnYu55Jo4oFAEvqeX+gfAalmKV3M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6512007)(6506007)(107886003)(26005)(1076003)(38100700002)(33656002)(86362001)(82960400001)(2906002)(6862004)(4326008)(6486002)(5660300002)(83380400001)(450100002)(66946007)(316002)(478600001)(6636002)(66476007)(41300700001)(66556008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+NNOJYQQy+2jC7Xqe5NQ42rCDahjPcRLMv42CDyXIQEDCSHfsmnjR1QeRcZ?=
 =?us-ascii?Q?BoA+Tl2msfjTZ+d1rG2gOT9UN7KKtaJDPW1A6utJcaBRaF1j00gGw69s8iuq?=
 =?us-ascii?Q?H4VdqopaMn7gVKA1aG4tQRS70vrZeRRygMTiej18LvvavskbZU3LniM8nn+/?=
 =?us-ascii?Q?kqg8cBmFDLqvwHaGaYbT5oKDWAOJejplT59ymLXxNHursVpY1JX2Q1qZdLc0?=
 =?us-ascii?Q?xfJgQLHTA0LB85F7aP1CgD4wxQewn9vSOMGCwbEGCaVUHI8+p3SuNfWZRRwe?=
 =?us-ascii?Q?Y7IbYPpat3shQYSL19ILuNiZoGUVGEhX+xw3XPwoBI5Fk87vcVEBGD2TCUEZ?=
 =?us-ascii?Q?a0NNStK+3yJ2N3H+yms3FOq4nGrZsF58GOS09/diGp3nXqrQ/6Q21ePlp2+R?=
 =?us-ascii?Q?P9AiN6EGlGLvx+AcUuIqFGGzRchr2ZI/G2oc5SRi/t8zIseNjM/fcdi2vg8s?=
 =?us-ascii?Q?q1NWJojr36Qucg3XFJitYTtvnIQq9yaV/ZhIlQvvpW1Y/deC8j4O0X/n2CAF?=
 =?us-ascii?Q?Ug6Sr+uogdRN1+wI1KxsuFV0YavWddeg0+y+fgAMkQkk0Ja/DXy372B1T4rd?=
 =?us-ascii?Q?9k1CAHfUwohXvBHe+uHTzBmeh4P3OuYBsGm0YzqBuptVcj+gwxZ3Q9Dccq9Z?=
 =?us-ascii?Q?c7Ivqtc7SswLXcjvEQFsokE13lYgfvtqfu3yrEX3tdgHTVXKwAlGuxN9QhKk?=
 =?us-ascii?Q?mTGIRI3FyRnVG+0UE1D31c2bZnLyius+vV9nbcoE/65MR0TawnfvVJFXW7Ne?=
 =?us-ascii?Q?gCQk6F9H41TkAt4sW1JpQA/B/8SvIlMsieNLlZpmQ+CVImycFoSbVoPEvDx8?=
 =?us-ascii?Q?HeN74Zef48XqvKnj602HrlCfAnLvUpOzkXCrqUoYqH7y7c1ggn/yr7Cl1n+G?=
 =?us-ascii?Q?IOvE5pCZArqcp7MdD1fiappKYYSFrEOkJEYbwqw1WnSz8A+b3ICuaSEYH178?=
 =?us-ascii?Q?g4936TnVlQUjJMZ6frXrRIBVs2ZoHjilY8VHiyZlVIJeUM50v7FOGFTeqzHJ?=
 =?us-ascii?Q?RcFVT1UPI1Zbq+M00N35/r8uWzbRRePdZQXyVXuJaSyA53FfMCDb3sp5OKN7?=
 =?us-ascii?Q?wwFO0oP0V4jcLstIRWNpWs4D8PtnbEhmgrDpCmWTdqFdRNlKa5V/1fHQe6yr?=
 =?us-ascii?Q?297mZmBlKhexyAxiDWQOoixK8NGh83IfTxBhSYbTApm1YbTVnX/Esu/dyPEI?=
 =?us-ascii?Q?HHt4p99+kMvu+BYZ+o2/1yTWvAetxBeSpwQTr7jrAAVkY37Is24fYfQjPAqK?=
 =?us-ascii?Q?iv9K8MUcMAJFipDFKTEKQqggoi/nrcuiX1z0DGyruJ/CQqqzlo9roLpamrqJ?=
 =?us-ascii?Q?uZHhHIt7qXM83Y1i2eehp0XLx7oI0E4BG7kEiqQtrRI5rNdb8KjFjnes0DvO?=
 =?us-ascii?Q?6ghThPQFFbnBP52QAF8jcdPCpTUOmWN1vDrAy0peMzL3VfaW0MjzrhPz3jcW?=
 =?us-ascii?Q?ND1l5hOxnXN3NfbH6drxsNQ4Jecw6oO6QqI6Q/pnoiJacUsMvaWFcWmqEt9I?=
 =?us-ascii?Q?BtdzTeLozcv57BPeiR8SU+Hoxu0wE3i0ylmDoL0IAriJT041nzQw28kBvJDq?=
 =?us-ascii?Q?ftm8XCGrNeXD9s0dygRO/ynWPkUQ/eHhJwCKQh5xj/h27n28MB/8Ho4WzzNp?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5dbf03-5c3b-4fab-db19-08dc17bb377d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 00:20:03.8089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gGVDWsDSmxyj+nCADRh72V3SKO+EOlU8OzoSd5e4QnwzMlEHCb/jHUU/zFEbBIySdYwrWeIS4geq+FaZijg39uQJWGJdiUSJw3Jps/fYpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 09:40:49AM -0800, Lucas De Marchi wrote:
> Cast the pointer to unsigned long and let it be implicitly extended to
> u64. This fixes the build on 32bits arch.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 95163c303f3e..e4e7262191ad 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -31,7 +31,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>  			     ),
>  
>  		    TP_fast_assign(
> -			   __entry->fence = (u64)fence;
> +			   __entry->fence = (unsigned long)fence;
>  			   __entry->seqno = fence->seqno;
>  			   ),
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
