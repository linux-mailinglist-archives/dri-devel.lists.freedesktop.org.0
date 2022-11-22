Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E26348BF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9B910E474;
	Tue, 22 Nov 2022 20:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F062610E470;
 Tue, 22 Nov 2022 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669150353; x=1700686353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VnOyMug0bIQO8XhTNACA+aH98ZYCSDmRnO7ZqsKVraA=;
 b=NaZjF4A4SAqjadrP/3e723XJzs4HP9VecGNhGBwm8yVLSzpchuVE2zlG
 hcogbJv3jEjyp2zyD8lZF1DUjgNeXcjScUJHt874Ks+tz9ZngdxZQ00r3
 e2AqG+63P2mSeT9QZiF8pxWjvs8Vt6S4qfw5wiZA1rIKGfS6POkPOhU8S
 RSOdFOqiaTjbjbDCeHBTMtoo54wI3ZUhxrY0a+WGFZ1q7ddkR/hr8kZbX
 IfxccJ3XNK0Me5zwCGJKDp2qvHWcfwqmrJW+LU+V7+HxiSt0l26eaRqW/
 pEGmI6qsmdQKMtnNmeWc4BBjmnbovT+1Ncv5wLVndGuobEc23loZZapG3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="297270811"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="297270811"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="730539935"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="730539935"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2022 12:52:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 12:52:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 12:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nX1+mzl0tvHdlfm4lXxfMWuEdxViDap1KLv2Rj3WgqUeWFKITgfpFygUPW3PXhipoAPEUgFhm3bCx6G3PG4PDk9+JrUJozJEajwXCkOfP3ceHBnkY6pQ5Ou4cU8LGAOVoDDazY3CpiUDKRb3a3/4SHuEgJ6DfoSopLgSOKZwznH1jXfRQt9hKfKksmvct+PJ2aU90d4xP/aMPIq8uA2IppbP3DSni7rsxMzTSFukfBAzG9a9RyT/9qGMGnRnVvKYAQybKD8Gw+ejzytlxdC2rYdvMbCbI7E7rgAqjJO1zGIRAp7tCPE+sjNTFYUKYbO359m1sIw0qiGlwO/T5Im74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG/xbqruF314CMMblVsalnd7FFan9YuKtUfS7jfZfVY=;
 b=dWURPvOdq1KrgpbhBKIUGBI0OgjzxfL7znyZvqL3FPTtcdhaF/2KwTjK4LsDkNiHgsBwixAQaSA0iBs0w9V0sSO2x/TTCDS2mQg4xPzn9T8lj0CEQMELMwrFpaFSASkE3fJ/1cwLsqOEr1ucOqWSZAVc+7DKa0egO6JLNWgIxJTj4kz8E+BH/e+/U1riBA3hBNLcJUDInxL+5hH0zEZlaUkC4fWCafgn06+42s0RKKSRnxDrb0zLkdqZNFZHXy7yZ9d+U4LLQgyXsEfGBRUOPJoHD8IFIxcbo4le3k7px8kvryf8l+WBwi7EcNzU4rNS+IiS4/gfKv3rm5g0VCmb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 22 Nov
 2022 20:52:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 20:52:26 +0000
Date: Tue, 22 Nov 2022 15:52:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915/gsc: Disable GSC engine and
 power well if FW is not selected
Message-ID: <Y302hgNHNFN0oElo@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221121231617.1110329-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc043cd-a269-49f4-ee33-08dacccb7684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0OthkUBBW+Aw/N5lFDshHCvMsVNnSIfSaMWXjgFQRNbBEGlDFsqUNZyVDpRLmggv0x9ZVt5DoYNgIH60r79VMUl3bL9Z9VHT0EMbzlebNJHNEwai4PVhR3pY9ypT9vzgSOZKvy2/ZjDvBs5FD/cg8ICjB51SbOgJJZD/inqJ06lt3gnbcyl5yKE2cXjb+s72jW7cKAFEELWdEBtqmPyPdPexk+aIjk3vCRFd9JfEByVBq6AlxwH9yza9Jyhc5rxLKx6I/YgPIuLfKDyQFAgnarDLf7co0W7YbO66f9DQ+Q0Gp/UxC1aMHJuJftCSPZycgmwLg0sssZOla81wZAuTAFKuv7IWxkMUdR89Pj3DMw4OH3/tJbxq7/U2gB6UuTa8L0sepzTvv9we8bYFcTQnU9C6P1VFFhdG1k+OFUn4mq12I1mVPTZFNhj3BWTEfRCTK6K1Nt4Ja7hWrz02zBtr36zZEIjWakT4T/WfetX6ZcHlBq7OkWuw/YYwNhm4ynHI7qm5oudaP+Se7f7bPjjPRlZJiNDqyVZzebKhyddcafFQmVqYLiEYBoT3S1DEWlYFcJZVqJD74VmH7rUH4wKT/5pKKH0il/gD+0m/CgKTQ5QGad+ZPJgp9mtXQrEBOrDta8/XR6+sbqiouCl8rYaeUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(44832011)(450100002)(41300700001)(5660300002)(6862004)(8936002)(66556008)(8676002)(82960400001)(4326008)(186003)(38100700002)(66946007)(2906002)(6666004)(66476007)(478600001)(6506007)(86362001)(83380400001)(37006003)(6486002)(316002)(36756003)(26005)(6512007)(6636002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvVCDOzSmNzTEom0UEmpcSANeeIbVkPDA7vqa7Wuws6NqxK88vNsljz4LDW1?=
 =?us-ascii?Q?9p5TiC6tGzpg5ui/gNh6z6QnFF6Lc7zQoxQx5KrJvg/mXZHDYRs2+DxU0N4p?=
 =?us-ascii?Q?ZlTyAR/+p4Hieg292RzzsIQprK1hUebcu+eyLFTKKhSPUggHc+j+ObxEKWp/?=
 =?us-ascii?Q?ZygQ55uyuMzDGbTbrWkDS6N3yacCenP7ta9F4GNjjNoy07NcTWJhqSVoL3vd?=
 =?us-ascii?Q?KSYByICIWlfAFgpMcWu8t3IgybQot5HQxb7vLWZOSh51G8zCXae25/XUYVEC?=
 =?us-ascii?Q?gUIDUjzRWsReg0QEOqZCGt4/h1ellc+K3ResDWyhthOuTqhLNevu0hWuSpHl?=
 =?us-ascii?Q?iybnK4+8HhskQ+CElq9bE0lzqTeaZlTR0624jx/7DKlfR5TgE/9xrAjL5+At?=
 =?us-ascii?Q?9OgfdDdKG6oo/ijyxvlaYfBP8ZeUs8sa80GLXRp6sDrxc5rPAnVXjJIby4Qs?=
 =?us-ascii?Q?QjQVG2v9l7/IuZ5AC9/7j+tkhgmg5aM5IoEpJnF7/r8OERQ1qWyVvDtOSnxL?=
 =?us-ascii?Q?SQG4ClUbHr7WGPxDRhs7NVzTxXZkhy/1h52vG1NbtgUb1NR/mabTK5B6x2xp?=
 =?us-ascii?Q?OhKcJo+chTw8gpLluVearzC7oFbPNO+hQZZ+hY6NSZ4GSqMwr/mthKIrTqSL?=
 =?us-ascii?Q?xz90oocG2pcEpvse7Of3Ly/S8qoAlfElwtg3SRtOppcq4KguBY+0TstNi4hD?=
 =?us-ascii?Q?ZISGvVpW8MZNuRYcXqI7AEWsXlwhZigKE0ku4d3GQB+KwijwPg8Mq5MbGDY9?=
 =?us-ascii?Q?L68sgTOlzRV4Vg/gnt30QfzPDpNdBNxAdYecMxC+yLiGqEljV+my8nV6iLUV?=
 =?us-ascii?Q?5+iIYar9k5cpaP/Rc4wXSTM3teow7ZZt1PdtagdLWi5o5XGO2pi+SafIMbuz?=
 =?us-ascii?Q?qJpEqvjaBCreTAQu4Wx4G6Iqb2zv58RsulmYyj0tE2bGe7tx2KVN+p5VlmhE?=
 =?us-ascii?Q?DB0NYZDx6/WZPh2pLK/VTniyvLLOsip19T9oMnYUA1osC+GfVwBaaIcbUpLS?=
 =?us-ascii?Q?yfnEnoXWaaaHnXUMCkEi+PoUR7RC5RH/wg8FrEIS4gz4PK+OzRijyVnHe644?=
 =?us-ascii?Q?b5z0D5YRm5PA4N0sTnVmf4TnZNRMqFqS8aac3sTagKUlPycMxGPSvO+T3GBu?=
 =?us-ascii?Q?0c7EelOUth/1BTw0/OUohbyXg/pSqI8pXlCuWUzVIcZRc5bacGpUaw7vDWpa?=
 =?us-ascii?Q?McNz1deWROXxd9mRFUOD2wQXtth1VhnuIfWJnN1E62CHEMcHRu/0M0lRr4ZZ?=
 =?us-ascii?Q?WrXGJ23+X6pIzwN6aHKwzLyh5vLkxR5joLO5WhgDH/8H8DUKe36Qp1oceQKh?=
 =?us-ascii?Q?vLdAELG5Lpi4/y92mRrC4NTN2YjIcdg6ij0Vpt1ztU1PzeQJR1v7F9TPQzr3?=
 =?us-ascii?Q?mpRnXA3ujOgSNgP6V+rw9bm08de2KGcQK5DWVBmKltkaCOJ6yaZRA3/K6/BQ?=
 =?us-ascii?Q?B8ljUqo8B07IrPKhQeaqSDnhn1Zd8tMbrMnOpa6z4Mk8ZK0z4niyARgjPBjv?=
 =?us-ascii?Q?Ev4su4O6yZRec0rNOLiEjAsH4ePYVLl0FXJ3DMEBxqPs7hNVqMp8BMJxF+bN?=
 =?us-ascii?Q?nyEPuTABM7GASpJhqUd50iIoJ8rNpVRSKmYgQk5p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc043cd-a269-49f4-ee33-08dacccb7684
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 20:52:26.7384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Xarfv11TkwHi51n0ByjX/xekLM+PEFN3u26yNFUwPrBgrLYPuf1s5OfOqtDyfalcRU1yCcffVoSP4m9ujN2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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
Cc: intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 03:16:16PM -0800, Daniele Ceraolo Spurio wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> The GSC CS is only used for communicating with the GSC FW, so no need to
> initialize it if we're not going to use the FW. If we're not using
> neither the engine nor the microcontoller, then we can also disable the
> power well.
> 
> IMPORTANT: lack of GSC FW breaks media C6 due to opposing requirements
> between CS setup and forcewake idleness. See in-code comment for detail.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: John C Harrison <John.C.Harrison@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/intel_uncore.c       |  3 +++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index c33e0d72d670..99c4b866addd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -894,6 +894,24 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  	engine_mask_apply_compute_fuses(gt);
>  	engine_mask_apply_copy_fuses(gt);
>  
> +	/*
> +	 * The only use of the GSC CS is to load and communicate with the GSC
> +	 * FW, so we have no use for it if we don't have the FW.
> +	 *
> +	 * IMPORTANT: in cases where we don't have the GSC FW, we have a
> +	 * catch-22 situation that breaks media C6 due to 2 requirements:
> +	 * 1) once turned on, the GSC power well will not go to sleep unless the
> +	 *    GSC FW is loaded.
> +	 * 2) to enable idling (which is required for media C6) we need to
> +	 *    initialize the IDLE_MSG register for the GSC CS and do at least 1
> +	 *    submission, which will wake up the GSC power well.
> +	 */
> +	if (__HAS_ENGINE(info->engine_mask, GSC0) && !intel_uc_wants_gsc_uc(&gt->uc)) {
> +		drm_notice(&gt->i915->drm,
> +			   "No GSC FW selected, disabling GSC CS and media C6\n");
> +		info->engine_mask &= ~BIT(GSC0);
> +	}
> +
>  	return info->engine_mask;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index c1befa33ff59..e63d957b59eb 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2701,6 +2701,9 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>  		if (fw_domains & BIT(domain_id))
>  			fw_domain_fini(uncore, domain_id);
>  	}
> +
> +	if ((fw_domains & BIT(FW_DOMAIN_ID_GSC)) && !HAS_ENGINE(gt, GSC0))
> +		fw_domain_fini(uncore, FW_DOMAIN_ID_GSC);

On a quick glace I was asking "why do you need this since it doesn't have the gsc0?
Then I remember that fw_domain got initialized and it will be skipped, right?
Then I though about at least have a comment here, but finally I got myself wondering
why we don't do this already in the if above, while we are cleaning the engine mask?

>  }
>  
>  static void driver_flr(struct intel_uncore *uncore)
> -- 
> 2.37.3
> 
