Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 424556F4776
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D60210E587;
	Tue,  2 May 2023 15:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E6610E39D;
 Tue,  2 May 2023 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683041938; x=1714577938;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Y1gtJFVIB+bU7/c16C2+Z1x63yUAh/soptUPZPmuXE=;
 b=kEOJJ/LkXf7jHb6WZQfW9CEysEsVLA+nCEJJti915tlMRbXyd3AT6Ezv
 d5apwBzUTuejmGxMcorSTKDyy0RNCTl0X2mS6CwZKRP3ElLEo9fayS2rw
 bmR1n1OAWJ4chFRP7ho/s8ueDap8djr1QzJWAS/fvrVvQVzfH2kOoxORa
 waWmAK5PKfV9J2oR8kRrDVVCEMMnvgRPiEDLtdk2wpox7wDdeg+DlbcXQ
 YYMVZz+xnIICThigTL3ctoxtHFWquIPrG71JZwhYBJTweZb02KQNJdIMx
 xShAb9FYWKMFfKd+A5PNjOI7vy2urN2FK82esbRrOWsFn4cze+GdowyXU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337554253"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="337554253"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="942471129"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="942471129"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 02 May 2023 08:38:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:38:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:38:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3ba3bDNyEVpJFQLK8YX/U5EN7dhKuTJ3NQ9hAgqjuA/l5mQoj/Ysq96rUdohL0NgekkMB4PFTCQQDmK7jMu+Ls2WbQSgn7c6Gqpc46aVXb9YicvVrt6128xU/XRKlOYGHCcRZZrclkhzg6RQnn9t6dsItGOOR8WGz0AiZ7S0/3GVN9XZpSXNJyp0d2YmCovOa2O/2qux84r7oXJ6RcftrKMEvy0t+AUyDKGyyubvJ2SgMdWxtxk7tBniXN6ppLI1hWnXKOPv8lI/e8JxFmA1Ps1NAa2Rfa0PE/8PUesdXnLjdoEUxl3FfamtHRrP1F51ywuNlFUgqAnOCOzi1fWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0lktBtEBkHsuBIKrzVzbmv8/9ih4y0bAC+/dW1kWZs=;
 b=AITpGeGKOBjCeFTvJwyZRV9BLuhaKOBQiiHJNEOut682rbN1yAP0rCXRjZyO01kA99xXDIg1Yqh4HkGyH0gL4zq6dg/B1cityWXuCAbAEYP9aBq42/WlHiF445Zr3RZvAXDXYLmvsfbvxsBq04nxmTJ3z02BgYd8grjtaVrEbXe5BCYdQjQCVVOwiyk1GrIzKY88OUclVYjEW6pdwAN2BR9noUgaelDe3tfMvtH2FRFfbjSnVfaTLinLu+dY9V8sDD/2Ee9/PFKv9AZ13ff+3iLYeKXZht5/8pC0cGJYMILpc+fIcUQJ7q0LpuBVdr8zcJUl+OE9yG103YvJ0JV4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7282.namprd11.prod.outlook.com (2603:10b6:208:43a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 15:38:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:38:53 +0000
Date: Tue, 2 May 2023 15:38:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 14/14] drm/xe: Add VM snapshot to
 xe_devcoredump.
Message-ID: <ZFEufZG+YLYj6rZw@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-15-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-15-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa7219e-62cd-4e91-c386-08db4b23553a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kVYBAaptuGajiJxjp5wBCRBZLwzNYTAA+YZ3Ls0GvzzYLZ3drEVHt88nryJ0E+6LlE2tjvDdkMzqU0PFHRSap4qwGBmu7WpayJccHQZAzqbE3NxgPwj1FdcHsu3AfxpnTmOla55yX0Lz2MrvYKUjAZiQxrTakb2R2A2XW1lYFXnVGeNcOX1O9Ma81Puic2HdVvqDn2+Q8WLyqKNNFENuNFiGb9GUFk0mU6NexbYFTaJX19ZqNE8vYrEpK40X8XqqOU47ej+mCcDFo3t87l/SmPVUeZJtthuBQrEcAopuJs7Y2SB3r9rukxhqMS7amqwsVSBAj2Xc+HH3/Aa8peKqOftLLsjnHcGJsk3bPpbkV2f+3Fz6zqxq2QVIM8aGBzaMZLUVO+jHhjHBfz9y2xuRtTEEIZsQkXlEZs/6jInoUO2r8s1BmIxviVeZtTh9HjwMipxWPl63/+Vt/doDqdoffJzg+Wh/lLUACnihA4kcTptM/UWysBe0IggqY+jqe3fvugeIqBXMm1BG/nmv3jK++CcCq2d5gAGIO7qwjixHPVRZhPQin4ZwOWEt82N6BYgFh3MzYlx+h55c0VNdaRymPAq9IC0y3b4z8zTIz4+H8sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(66476007)(66556008)(66946007)(2906002)(44832011)(86362001)(6862004)(5660300002)(8936002)(8676002)(41300700001)(316002)(6666004)(4326008)(6636002)(450100002)(478600001)(6486002)(186003)(82960400001)(6512007)(26005)(83380400001)(6506007)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zIUCfduTTBVCbWOHWwmcgGLqMYzc9b3unGQhEyRDDBo2JrU9ljUaTrUzd+fk?=
 =?us-ascii?Q?KZtrgSx+Hzykn5c7tu9wuxSgNVR3nou9El1itGfSAXN9gW6oaS2oZaLB94jO?=
 =?us-ascii?Q?fiFwCWjSPFvAfiXk9drNgBGvUKbGS8DfsYidKseIr8U455+XwLJRGK7kcOSk?=
 =?us-ascii?Q?F3OefQUv72jutGVSP0ZAvQ/AEvWPHZJJog3cWT82W3r/jQOEd/+7Bps7qVPr?=
 =?us-ascii?Q?802Cx6YGEvT0ObcC0hKMZkZJEdauEzpc4X4eZNXQ0uNxaz9s+wvWETsPlGGU?=
 =?us-ascii?Q?Xy7UrCbu1q1botDUEhXldXjLrDz30GER4hDAmn6WP4EgSyCH+IwWOPmK4L+4?=
 =?us-ascii?Q?HRbssA9AmZxDJunXa8G8SSYhUNf3ZEHtsOnqmpsBVA4yFYGS432AzSqL/AV5?=
 =?us-ascii?Q?7SpYazr1n7CLL2iNYzTYxW86otm1f+I/enuXJqfzepbBnpBqQvVaAzWi9lVW?=
 =?us-ascii?Q?z1zanuG+dAP8uTnTxLEixx/HnU/uKC4nYQ7vZLDw7wG8ikdM6/yaERyYM21A?=
 =?us-ascii?Q?KZHHA2aBX1lz2zzEficdI63AqKGc6mzT7RoOuIE3mGMqHh73IUTmth0+bBFK?=
 =?us-ascii?Q?IY+92BmIlOs/bN3Hd65guozJguyYyYOp0Ds1Tq5rTi4v7eGC5BpFp0xkvgu6?=
 =?us-ascii?Q?TBdIiGHswNg2Sq5aZjWxgKS9MP34aaQDqkR6MtQ38aTg0ygTt++m7lfjzvis?=
 =?us-ascii?Q?dPEpKLcqwdFWEnP4j+s/dq3p9NhXF9lijL7DyuGoTMIpFrkGnloCmzkcK4sQ?=
 =?us-ascii?Q?eXzAFSTik777ZN5UXk+BkBkwpxbk5vkPPrpSDj+2Y3+3VAe6L9C1Mhzr1jAu?=
 =?us-ascii?Q?0l7wFgsTj1ZCp97ArB8S2wFnIieors8tIXLQw5HT1/R/AiDRFJxYHFzUTsdB?=
 =?us-ascii?Q?J3RIhlVhNU6A3KV1/pLN9jgUBQ2tF+PM5sDfRPcqdKbzkF5xixL07S8iB79P?=
 =?us-ascii?Q?qFva4cFpWi5/3rtBN1NvAhzbBDzSOX/UcWJ89R44s/gKrUAk3fA8SQV7Iqpq?=
 =?us-ascii?Q?wbRLhrAGNF9pYHgKGyqzCJKZ3kAa9utFJArB3nCHJV/JaOEz1H/vjwOctr9l?=
 =?us-ascii?Q?Qywqf8yXOsq9msF/wUvshr5GGZImTbEV7mQ+12dLyb/PN796FmbqIVqVRQBL?=
 =?us-ascii?Q?yh2CiZB7Jm7l7pQUXHU0FYvxn8jP2yqXtVU8b1MrbPLFE84YNcRJxprfKfEx?=
 =?us-ascii?Q?mzFPzvXkpJSPJrXNaa3vNobijOpn41A9Q0Uk//NcDqNyDPu6+dMIOUQuG0nV?=
 =?us-ascii?Q?tTqrg6K2n+1RZ4Fa8Xgg1jsBx5azAnaWkzv6D6AOH+cox3j0T/l6qh2yQzMS?=
 =?us-ascii?Q?vyKQDgk491o46Q4tvDsQU0YFa3CQyp9yOW5VIf3rfZRMcn27cEG0UbFtR6fs?=
 =?us-ascii?Q?9cbagI7Qq9YXeXZmCiRb+NPjSNddTsBjpjNC0nI/cFZk/kJuHYT61cnohB/6?=
 =?us-ascii?Q?Cr2OzUvykxFMkrX7OuAQ+zduuI7F5ZqMSOGaKJrEoqqAPQ1y07ruoEzEyAVE?=
 =?us-ascii?Q?LlOWpTFJiAaH8uor6rY5v8OMcZw5xBwuxI347nKwUKgg6+HxMIWKQ1qvaEIL?=
 =?us-ascii?Q?57EVCN9a13y3n4YhfooH2ZEMP7gNzoYfugrVg3hMrm09XPSE5ZbYSiT+4rxd?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa7219e-62cd-4e91-c386-08db4b23553a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:38:53.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7PQZuxSwbymMmoQ48yT5Q2d+ZI8D2Qfxe3IWub3HXQtT1+mk7IeEHbljP5AcgwabpRaJDsIk+tSmgtCJi9snA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7282
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:13PM -0400, Rodrigo Vivi wrote:
> With this patch, we now have some parity between xe_devcoredump
> and the simple_error_capture. The only difference is that
> xe_devcoredump will only stash the 'first' hang, which is the one
> that we care most and should analyze first, while
> simple_error_capture will dump them all the kernel log.
> 
> But this is just a start point to start building a useful and
> organized crash dump, using standard infrastructure. Later this
> will be changed to have output that can be parsed by tools and
> used for error replay.
> 
> Also, it is important to highlight that the goal is not to replace
> the simple_error_capture which is still useful for some cases.
> But simple_error_capture should be protected under DEBUG and
> EXPERT flags, while the devcoredump has its own production config
> and will be useful for bug reporting and for error replay.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Again maybe hold this off after GPUVA but LGTM. Also 1 nit below.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 6 ++++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 1ffd12646a99..9dbafd586fbd 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -16,6 +16,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> +#include "xe_vm.h"
>  
>  /**
>   * DOC: Xe device coredump
> @@ -103,6 +104,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	for_each_hw_engine(hwe, e->gt, id)
>  		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
>  
> +	drm_printf(&p, "\n**** VM ****\n");
> +	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> +
>  	mutex_unlock(&coredump->lock);
>  
>  	return count - iter.remain;
> @@ -124,6 +128,7 @@ static void xe_devcoredump_free(void *data)
>  	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
>  	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
>  		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
> +	xe_vm_snapshot_free(coredump->snapshot.vm);
>  
>  	coredump->faulty_engine = NULL;
>  	drm_info(&coredump_to_xe(coredump)->drm,
> @@ -172,6 +177,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
>  		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
>  	}
>  
> +	coredump->snapshot.vm = xe_vm_snapshot_capture(e->vm, e->gt->info.id);
>  	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
>  	dma_fence_end_signalling(cookie);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 8b17ecf1b6e6..f508eca292f7 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -31,8 +31,11 @@ struct xe_devcoredump_snapshot {
>  	struct xe_guc_ct_snapshot *ct;
>  	/** @ge: Guc Engine snapshot */
>  	struct xe_guc_submit_engine_snapshot *ge;
> +

Nit extra newline.

>  	/** @hwe: HW Engine snapshot array */
>  	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
> +	/** @vm: VM snapshot */
> +	struct xe_vm_snapshot *vm;
>  };
>  
>  /**
> -- 
> 2.39.2
> 
