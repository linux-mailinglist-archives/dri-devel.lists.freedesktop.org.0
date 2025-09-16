Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5AB5A1B4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 21:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A8A10E77D;
	Tue, 16 Sep 2025 19:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqsX2Y64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC810E178;
 Tue, 16 Sep 2025 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758052740; x=1789588740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+a0PCkoG1Pz1r2iAczWz/Dq5y7Q/ph60ilJGPV7L2dY=;
 b=aqsX2Y64JD45UOta0QAankwmZcd4J30M0dHzYZbi8TcjKeOv6HxTrSDi
 KmgresKYmNFA8k5BNZM5buOtStvrTSY962a2UmGRnVAZs71yuJ/6WrlOI
 KEDsrQL6EyrUpefZe0ToutgTPnn5kZxo68ptxsf7DFFYOD7FToKm3H2pj
 85+rCBZdJv/aIIzLk1YM2u39PHZlANR8u8IqRqUqiYoEK4nyAGJh6FI3E
 Z9iwyHPoFGs59/gstLxZPwjkGPg4pbxY15EdkH9eSYzEeVCLbyLPoc3w0
 91MpedgMVY47HqeCHuttRnpx20Rcd9/VIQwDJBwM0ypi70LrQTnpvXoYY A==;
X-CSE-ConnectionGUID: 5Fk3jzHjT3Wso9rp+3GBWA==
X-CSE-MsgGUID: wcm3TwFZQ/2OhCz1D33jsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60262912"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60262912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:59:00 -0700
X-CSE-ConnectionGUID: X+hPdpQJSjGN1LwQAqJbuw==
X-CSE-MsgGUID: yfZre4G/TKOI/Y9j+ZBaCA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 12:58:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:58:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 12:58:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 12:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjacrROq4sIV6TqYgkhA2RcU+TVltyU3jidd7OEzRp33YtwgDrel/rTcPhgVvqZ9la0QwYQs0GEHfFeZvcZE0UII/h188fEx5qhfTBLQryIvdegj2Hg4RyOlsTGKkMR04rDrRkX4V7o0RUVlJeGdzBKvp3jWqUQ04m9L8nwfO/2Pg4Qzz919DW2Q2aUd8udCb8QTD/NbdVH9GxaO+A6i2Pl68QGeF3Zb3MmnTSfRxoFEgNg0aefBGOh/9aq5DWnYEDRuf7U5eK5v5HCg0YOvlW1Q5iOXAQhb8c4wdW/L/ZvJmNLSyRRHLiTFGDalC+9wEESBQjCeHIFKNjoQoJTU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r66tU6AcD2Aj8ehV34YIlAJFR59ElYfV7gldMWGgDn8=;
 b=gNQdVXB/eCo9BjoVfN/axDqC2+ql27sKSrsq/Undf9NYDlBcqlz6RbTlsnoIa0IIupBy2yLU+Ma9vNAGPvx5dfMIuWJLHz9bd7iqACflv2D59v0AlAowd8rDIabrhsfSZDNtekioZ2wauM4iKowDFfw3/PTmcY2H+waWpb25dZP1RnrsXR4mtxh74/QGKirOtnsTBTMNRpqQAaw/N5BwI12rOlG5deHED2aE9fQT5YgGoGYX6C4QiQAAtFsP4Su9o4XzxR9XTy2hav5KD4vsZU1gpA/P6W7gU16oDjBX8tNGEEKyY48NJPOwdtPC18HjJcdzbhUlOmE1jpiyiXVRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 19:58:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 19:58:53 +0000
Date: Tue, 16 Sep 2025 12:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/5] drm/xe/pf: Add a helper function to get a VF's
 backing object in LMEM
Message-ID: <aMnBemEYKBvGpnkY@lstrano-desk.jf.intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-4-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250915072428.1712837-4-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d44faf-7db3-4a37-2a61-08ddf55b761d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rF8P9M0WLZycd+Eyb1l2ALexRj4255tbN0T+ekXLovDtmkVkq2bgJxeYhQqq?=
 =?us-ascii?Q?KC6ogTjOL1bmavW9rmyjzug/K3hEizncbWZv/7ukuvU70rpHDxBoWgO2Y32G?=
 =?us-ascii?Q?/f7nlWhLngFS8LV0sHNhuukdsgX4FiUF9mHHK7h/wBsr3ztc59EJOh14p1kZ?=
 =?us-ascii?Q?hhwRb4+2yQf+0QqUbieMxTcPO6TsRhvfK91tjswhI6dja1UG3+6DzgPfOHQ8?=
 =?us-ascii?Q?d3DYw6O233ffQcFs387A7+47f6jysXCksQoyBm8WeRUBgmgma308K7INVQob?=
 =?us-ascii?Q?N6A43fAtCNi2Mx8tnCKkVlPTh3XqtVwJJC123sNTUBxK7HQ8nWvJvWJOxh1u?=
 =?us-ascii?Q?CWkRQh+/eYW3NWuufh/ffpwL3JUcfDqjL2yWABt7QzLBP47LefPpiZWLN4wv?=
 =?us-ascii?Q?+O3j0eh0Tlj0jnDf4uCWtqIJo2FmSEU4p5WtgmNnI+cXTDvWAtFbFX2OIsbV?=
 =?us-ascii?Q?ymcO+EJ80EQMQwFrifpjLRgrAo/PrRl5L6nh/V7RzPiZWRGNCoE1dg0xnxFj?=
 =?us-ascii?Q?g9FhB8lea5P+1UdW64gCOOetRWLRt1af2rM6ZTv0EcfHvDcZWTEsg89DEqHG?=
 =?us-ascii?Q?brNF3yLIUIwqUSYi1roST1XtuyJKeg1XHI3aUD/g2s2p08E7CZtXHSfRsgXX?=
 =?us-ascii?Q?o1kZxAVvoX5K4UVJhDj9TXxqzh5HRMTC99aTmyHHSVfjxqeGtT6wnIQNjC4W?=
 =?us-ascii?Q?CqJsriPzb6BiRlkg55AYGPS/tjwBYPSaXtfGJ4s3nvGOjIwhlouypqyCcSgf?=
 =?us-ascii?Q?9Z12FRaZ02S5r3Y1qbA/s7tu3icuPO2XSXyTLALLn6SgAUvgL23FHho1dGNY?=
 =?us-ascii?Q?XihpRAblHxMyXFDgDXX5TG8Szm3HMYBHV+UTPXlAq/jWref9A7fEKnwA+2gh?=
 =?us-ascii?Q?ympa6YVLlO4Ii4c7VAgm8Z5uGCJZKWTIOBxJnXs7tdafEHrhPj6T4cfxYtK3?=
 =?us-ascii?Q?8fM2eLNq45dwpSXKx5QXXltD4UysNn8ipQSeqdBQWPeqSY+qv4lYATWgMnIA?=
 =?us-ascii?Q?ZCD7zftuep64FTRUBA579En4h7OKg3odRjBxT0LHqu9L+OHS/Foh+6nLpCJl?=
 =?us-ascii?Q?0PuWEYbunGV3T37UEtmlqf7ZbP6/Kh5fWq0HDRs+TjPuQ8TP+TFqoGOLdHCK?=
 =?us-ascii?Q?9Ia/kXSAqvTVuvzY4J6jyZhvZ0CJA/tMfao5MZ4CDj7DSntPP6jGMpyTa3PS?=
 =?us-ascii?Q?nRjAC0z+HmdUPUgSZmpfKBppXkseMO3U1smyNScPHzPfB1JPYk2IkCMCbNr4?=
 =?us-ascii?Q?8qhIvnIc36UTKgcQP6eJwz33E25/evNGXzsb5UDc/FPNQo7pxm14NENiU2QG?=
 =?us-ascii?Q?MJTxuKwjhYAekpyr1pzQIUJQ8xI14zS2E5URg2t919nMV3kBNn2VZMHFThWC?=
 =?us-ascii?Q?wsu09jwI/9B86iBAuqTEThGNWSF+zcKUKMcVOihljd1+TA9PgOesvNaDffwV?=
 =?us-ascii?Q?BJvHIwJFGJU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wa+K+z0RP+MXwhDCGBg+RdkC438Nh0m3joFYwPODwz/NSC4a4O4Q2lLDnalj?=
 =?us-ascii?Q?V236908Q34Zg5hgW51+bhB8cthGuSoO8tAw1sDRrvrQ1Vwg7aJgMWQQIkII8?=
 =?us-ascii?Q?uBTld1DDkW7Z9nVyOq6Epkyl66fUOrFvteBwOCjva0KagQjD0Yg6EbWo+WDy?=
 =?us-ascii?Q?A0LGak4iMMnHy53eijiudoL6LrkoXO3z6hCrIrEAT1qbnJYjB6yWUBcAgtG6?=
 =?us-ascii?Q?kZXAM6qyIL4vZbYzcP4Sv80E9Cr5FJcxUZ9n5s012ikWnLE08U7RJPD28Jeu?=
 =?us-ascii?Q?tSGAIS0d8ETHry+XZvCP8i2ZASbqSbl39Sk3z0uTYe/md1DdJjrjeU5OQcAX?=
 =?us-ascii?Q?++3tviHduYf2nnwaSKBCQt3wM0eHXT5RhdNs4BdPHyp1w0ZfEn9pkFIG8Bv8?=
 =?us-ascii?Q?Jq5cPpZLExi3sqYfIPBHQUx1nIT42V7P9/E0MrPpdfWDJbOI+vukhydbl9za?=
 =?us-ascii?Q?mdVTK8frO6sUNyri4ieQ8ZneCWqoJND5kr2IhQZwbx1Yem+a8NlQ3ezEBFyk?=
 =?us-ascii?Q?WudmCPJuqWEvrFOQmqEo6b4EMHDXraBUc267zDvNqPgpgmBa2OEQv04DypLr?=
 =?us-ascii?Q?GF1RziY8IKGSCCpPWK2YfOSbBPBq6/SGd2ham0Fx3k/3IMFGCmYrsAfnmelR?=
 =?us-ascii?Q?nN089cMS+MHGAIkIi6EevFRDZH+O6hcTrPFmQx1tVocA8wBbTYjdoEF3MZe6?=
 =?us-ascii?Q?TUT2x0i7HWqOY2UU6etrwicFHdYNxDKX+p6t3VviAHv7TM+w35NiC51OztS4?=
 =?us-ascii?Q?kJP5dr8SB1UaA4RfPYUNYwAMY7rpeAZ3BJQbcR8374ujP9fDNwz7if0ddpZP?=
 =?us-ascii?Q?zEybAujTllkdxepQSH2PkFtql2wiPEJNjxYJuYH6CU1AiHdj0iwfyvm6LFbw?=
 =?us-ascii?Q?r3SUcNLGGBT3+9JiZ56Zu0MdnZk2pv7lOJ276lNR9frJt747PqQ6Ro3+BBR4?=
 =?us-ascii?Q?IbDLpZTZ/V4z87Qj24bhWFDhXFt6bjtISDs2vf3OYgQ9t/U74jM6hNHutl8z?=
 =?us-ascii?Q?L7MNZpD1SAgZ0hevM8KFw5yAb7xenJ+QhpfJmwkiuWmEOiJIbsbb/VKo5P5M?=
 =?us-ascii?Q?uKFqmdidFcXRgAXf0egUHjgo74q/pl7UzySgcqDGH8hjNtntg6438ZqBheZy?=
 =?us-ascii?Q?MKOO2txZ2uy8frzUejDEL8307+w7P0G3zgAn8foRB3nLD/PzK9TjLC7GheNi?=
 =?us-ascii?Q?4HAzsmGyN9EwUemFVgf34MslvadVtwfZ+ptaQQWxQgkck4chu8y1akItdX7W?=
 =?us-ascii?Q?bpsQaBEYiPCpHFqMDhZoeVNtxnhSpMPt/5QzhBMgnOLl8fEKzeuCnn4vYMuZ?=
 =?us-ascii?Q?dvem1HG5KyEAWVVErN19CNJ1hNv8FtbG/4DtgS95qKcDJBR4191E+uCGmUPW?=
 =?us-ascii?Q?IjqKR802USWOGBN12BVU87H518trbc7CO/VTUT7RaVixlgfJEPeT3laO4+bo?=
 =?us-ascii?Q?1fMQO+XyTtHLHORh97GeC3P3S9eShZigYpq1DQ0lgIWUqRhKJWAB4+8RKSFt?=
 =?us-ascii?Q?YsgAB3SfePmnBK3nMVVr/TcoN9f8ynLlPLpCAI3kjBqrJMdx/Jdd981G1Z9Z?=
 =?us-ascii?Q?PNqNZYbxOpmniwX7AI50o+n7x1zvCVUhdsNw349Ozp7vM+RWNjtuALKJJx5b?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d44faf-7db3-4a37-2a61-08ddf55b761d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 19:58:53.0717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DswWH2OFmwvXag4SBnz7C/MD6M07mUblEEaHBlJsAA7SRcjiWPDxtHwXzjJeom9GdzOtn0nr2lbKw25T3RhAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 15, 2025 at 12:21:07AM -0700, Vivek Kasireddy wrote:
> To properly import a dmabuf that is associated with a VF (or that
> originates in a Guest VM that includes a VF), we need to know where
> in LMEM the VF's allocated regions exist. Therefore, introduce a
> new helper to return the object that backs the VF's regions in LMEM.
> 
> v2:
> - Make the helper return the LMEM object instead of the start address
> 
> v3:
> - Move the declaration of the helper under other lmem helpers (Michal)
> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6344b5205c08..1bfcd35cc8ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1535,6 +1535,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
>  	return size;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_get_lmem_obj - Get VF's LMEM BO.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: BO that is backing VF's quota in LMEM.
> + */
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
> +						 unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config;
> +	struct xe_bo *lmem_obj;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	config = pf_pick_vf_config(gt, vfid);
> +	lmem_obj = config->lmem_obj;

As noted in the following patch, I'd take the reference to lmem_obj
under the xe_gt_sriov_pf_master_mutex.

Matt

> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return lmem_obj;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
>   * @gt: the &xe_gt (can't be media)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575..bbc5c238cbf6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>  					u64 size);
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
>  
>  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
> -- 
> 2.50.1
> 
