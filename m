Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10CA23758
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 23:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993110E9E8;
	Thu, 30 Jan 2025 22:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYSuKfes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C46310E9E8;
 Thu, 30 Jan 2025 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738277020; x=1769813020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WREFHJ86O5rYe2wUhnC5G4t9QVvdeG0whB7F2RwbbhI=;
 b=lYSuKfesMm/fdTGzcAi1VypPTdozffKDnPy9mo4bPwRcTCBQsGmvCRaz
 bfSOXiZi82l1f+ielf0wWiqBbPN2NFdIKqBrNRxqxoC9Y94FLmxkvA4eE
 vRfBIOfqlQmyzcJBapnerGLiPCAjsoKdWJFbNsrz9Va1PaH1f8PqDQt7C
 IzGgpK0LIWmwM6CddYjTavy+mmGJC+Z3bmpzHts0x2dPJJ6hzCVM1Iher
 +Y1DQxK8pRLMzG1ol9NUJf4ctFZhgEiZpfuqEhPSUWu/5nSgsvw1bpxKX
 NM0gwFCTxDJYEo0K90KMgEmhjlwWFgmuxdgI+TK4SfVV2ChfmzTCXe4ET A==;
X-CSE-ConnectionGUID: s7Beh22FSQix4LR1OJ1m8A==
X-CSE-MsgGUID: H3mAAMepR16fBwg8EJcc3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38739151"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38739151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:43:39 -0800
X-CSE-ConnectionGUID: mb3k74blTmueT+RytSxavw==
X-CSE-MsgGUID: 39SpETlqTCmCd57ASG0eIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113491294"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 14:43:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 14:43:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 14:43:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 14:43:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrRd4e7RGliuv2oX5tSJkRjuLi0YNtfziovp8KWpUvcwm+EBIWHRQg9qTU31cNSydgv0ffJNvgtcUllpjoU6k1cNtIR0Sjh/QxpjgToaadx5NE1ZtrFNLlh3+U0UOYNjBWqq4o8CwfHJDn+l6ybn7x6Bs3uWd6duyux6rw8/Qk2yaX+c3EbEPGbfgCXlEpf3jabIEkQ36K1rUTvGpdRv/djmu52VW6Sk7Y5wZ7nKQkMPOEH/nvwM1ftDs3PkfvdIaEKtkLbCc90esCfB2LPs/sRLVbD3R2B41WbsITnqdg92i6duHqBkSNjtlEVrOL/Is6Rx6zXlYXrr8BlFO+r+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrYoTpTyIbtM+k9/IzqC3ws16tFbGOIzrTJkA4lNuo4=;
 b=QrYXPoVfEocdEOrrhcu/wpc871AtZJhno/sEwbHcq6rauULEsSZKwbaHArmbh6Dt9fafGyMKLjNJcKbsASA6RCES/f41j/sDgx4vquggVN9ZeU9nP2f/bsKPYICiCqLy+wwrGzHyGVtkMSiqcqswhW6MzrEzzXgUieBv8mP9k2gJ/Eqd10494nPIiRRAOqeZmEGWXibsLvCOsucmoVkPsiPom9k55Aji0dvRv+zIO0Wl84j9fzx93+Y1xeAbwg8WCMjI7aSqoqXew3euqQrpZYCcnvJKdNkQDffNp+nufJz7MwO+WjUG2js8AWLzha/GUO27qNkYcYnrpQHIA6QuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 22:42:54 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 22:42:54 +0000
Date: Thu, 30 Jan 2025 17:42:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Zhanjun Dong" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 3/6] drm/xe/guc: Split engine state print between
 xe_hw_engine vs xe_guc_capture
Message-ID: <Z5wAagl1DmBIVRG5@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-4-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128183653.4027915-4-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: MW2PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:302:1::25) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW5PR11MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aad6a0e-3017-41be-95a7-08dd417f6f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lq0J0kkiloCPxzHYuQ3ojNhj1bFqv76vBQGTd+bEX9MbEBOHrhJHiDObX3hd?=
 =?us-ascii?Q?Ob6xF/ndCNenSOvj/yv/U6FJDEtzVcIUi7wOFM4B9hlasPwf1AuxqME0Lrxg?=
 =?us-ascii?Q?SeiJYAlzVZzmaWGBp9EdMMcI5VkCEaf7Pi5wayqs9Y0bNmSqS6X8XERbfB6e?=
 =?us-ascii?Q?69ZKgA8c+dV72rq3AJq8hiSMPYHojnDYXUv0rNyTW5Oz95eSNqu/IfEA/rBf?=
 =?us-ascii?Q?ZNMNY+dp2rZvG32z+0fbyYOMIzNmAviEqMeoxSsjZeZqcqzF14UaQ88zn7SZ?=
 =?us-ascii?Q?Pbi+7maxuXpNXy9xmynoIXnTNmzthyrcXTG3JZjRv4hgCrCD/i1mtG0SIWiM?=
 =?us-ascii?Q?j8OOodJqxqF2eCuplWbTZvhsq0igE6NY7mxtZXW1EKBEH4njQ1g40lgL4WV8?=
 =?us-ascii?Q?pXxuh+cLkpJ2VjeDzIORMjLJuklVh0V2gwtMMF2lwFC18hxDu9i4103Ii6mu?=
 =?us-ascii?Q?KhZ1D+KOC+JzY4AdTR5KH93fcjx4r9EIiYmuvXelnNIoPrHzBnj2uslqM/bJ?=
 =?us-ascii?Q?UnFf3NVWhsDqzzLgEX34QmcxYbJ+IW9zOuDnwASocsVes7cO5sS1Af4Iz1nk?=
 =?us-ascii?Q?WSubkL82uwVR1DE1eNIbOcym7rxbEGMhQvqet19n+xqUDNvWLHTVAuALtVYD?=
 =?us-ascii?Q?1LSv9Zv1f1E4R/GhGemRl+r7mk8W5A7Ia73ZIuTPkroyBGzkL95X2EllbqR2?=
 =?us-ascii?Q?KS25JW7UKVIbJKjrMLLBEwwMWvBYrAa5LCeYfNf2zUcm+htCbcpPadnWNBzp?=
 =?us-ascii?Q?464libUqX5cTpcijpMO06d70xOUmR2Bvzi10bGyAuOpl+2pOmkRJq6sfHRwc?=
 =?us-ascii?Q?JPYALxLvzW9jNMpToPVbidY1uWMEBkwnVJIRrFxusOzFJwI/TBNh5LUVdR3q?=
 =?us-ascii?Q?wLKykLPLj/4sTp7fj+13RY2ULCvyscBwYLpWoV60QhxRkW1f2krbHdTtbOYD?=
 =?us-ascii?Q?NCMu6qLlHdCA+frPXRjQpX6u4s+hK63gtkdpEIYW6wo3orZY7LZTP0ePD5eS?=
 =?us-ascii?Q?OOnjoObGjkpgqKijrU8Xr7dtqUyqpXvnEF+vzdEaUSdRNHaOqFo9HNwWW8OL?=
 =?us-ascii?Q?xoRPK8Bf6eZQK8YP6CwFVADplzqCsnZhlCoB6m+SgW/qP023SRfEShG08kq4?=
 =?us-ascii?Q?xPmpUaMcz3hL9TJCZ1mmB78unWz492K5P3DRoLcUJShDCxM+LwGaNjy/lL6M?=
 =?us-ascii?Q?Q7yj0yeDx6zU/rJtwJEbkxXzXGpNWwQFeGEgEl3+rGyrkURA4efGZ5QIL4nt?=
 =?us-ascii?Q?ml0h4Ogs27P8ur/hX4OGpI8M7joLNKaCZKH2U59uBiYQAcnvWjyJ9ZHiPq2Z?=
 =?us-ascii?Q?qKbfTMdXYNRVwuv2FSPiMAJZegtluyOZlkm+IcZIHmUV0azKk5EK/RoTx9F5?=
 =?us-ascii?Q?8oZ8HOGzTYzCsiwvChgw8221SowB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9eAfJkBkVScrjW5dPAI10Egw/NSJgGEjjbwzpc88x662UBgoGqo70cUsWZIL?=
 =?us-ascii?Q?n0shjRflpurPI3VKgAKDnPosKvsXiv5JMLFRveP7T9M/S/9i9W+pWB6TH1MO?=
 =?us-ascii?Q?chC6zQ3XTA3QTXpBIhjCNAY7t+Xk8zytSGkX3QOXbb67XaU0autyOGHqzmjS?=
 =?us-ascii?Q?7BBsKZDG5Mv+cbIFJn+CrvwZ24jcv51YI1GIE0Za9wyHwrjAN6WmTCOsnWl9?=
 =?us-ascii?Q?qAT3Mex/1a3aB5D9B0L/ALhtXPrboRxz13pmJ8ge85/40eNeXX1jtb1pnHof?=
 =?us-ascii?Q?W6chN7tOggNX+Fu8NbqrSYoBHiSltWy4QMIX6wBLQ/V/LdReBPeySUQzwFih?=
 =?us-ascii?Q?dvJnB/MxRGG+0Qbiaw/Ib1jjJspz6mXw/+mOPMEdvxjiyT1SI7i/PM85vQwB?=
 =?us-ascii?Q?b3ZJZ+VWAzsJ5wYvPTer/T1UpcIa0HQKelfE+EanQUbC/GAcdsW2YxGM+gJ8?=
 =?us-ascii?Q?UPvvurRFVP42fLHTW0/DfnuqKs6xqaYySczD+LSaoNiUFgPR2cXkOjyfTFym?=
 =?us-ascii?Q?hAgt7QWDGnfFbcfFJOxnoJURU9fTMFdTqC6B57/erm7OV9wnUdtTdEpfbc34?=
 =?us-ascii?Q?+JFi6tGZNicmbCrrX+OCWFBesezK5TgnO973gmStWYusMS7sWAYIqzJz3pio?=
 =?us-ascii?Q?/4l8Jp8/Ff99PJ2APS6IyGVFDuFQO7r62B114lcALCVpXeJrXX6EKgbq6wpU?=
 =?us-ascii?Q?0rTvzAeEPiJVTzDTDIeA+Zkm8lfP+wXxjqXf2OAeHnhf/EMBdc1X9rjL4ZSV?=
 =?us-ascii?Q?camY5BvFS2t08fwHE6IqeRh77VxNZk4WSt0t+wNVBxpG0CeORnJYJz2lhsSH?=
 =?us-ascii?Q?xOCx2hZB/jLYLQAe55+WNZBMTZ1uDFr/MQ9zszYLOohBgpX5/sSgW2UfKuFY?=
 =?us-ascii?Q?gYx03WVVmNpWNO8Wn0gEdV2HQKmCHqFRn8jO/1cwSR3VofsSQRiDYL1tycUm?=
 =?us-ascii?Q?P+m6TQz3uyrOjf3oCVlry0OuWNvizVb1XxxRmfbF4Z8TqOUbJg5aWFoZCFVx?=
 =?us-ascii?Q?9ZGMe4wPdIccBPmxiGO6eI5TYfx8QTE9ipK5jCzU0mAfypOqds1XCzhjEOxn?=
 =?us-ascii?Q?2QLx17JKdsy54WrHp9V3CnP8FXvzfn2j6V24E2DR5LnVB/2qaKkkSWz/y5r3?=
 =?us-ascii?Q?qVYwB+s1gUg+pRqy8Q+vfJEPAopbIvGiq2PmzmzXrPwMCxI/5WXiEkwNVHGV?=
 =?us-ascii?Q?Wv/HnqoKVvAzs63XZayrwT0sbLgE1Ptj7e+pkgoe3p3iRywDBahjClznaX7n?=
 =?us-ascii?Q?9cQf38pUyRFf2U2s0ADURwlLHj8Eh5hyccmtmnwwL5iRv7S0yAgGM5r7GDjJ?=
 =?us-ascii?Q?bY9dYriw4j+/rjGv/PXBxrAJ5q3QminLuIsuh33eFKngnMVxi+EuCApp6yoJ?=
 =?us-ascii?Q?pNCrfy4ToC5ve7rai45uG5AiIJ6y6VrJRI/Fpc7nzhKhy9msGqPvxEMwJDKm?=
 =?us-ascii?Q?uoziEr+UqFNV0iY1F3xN3b7YBxJgI6PrWrMbAFdaX1UjwwqBr45gzglsyEQi?=
 =?us-ascii?Q?MuCAXPpowQOL0WXHmuZUSc372gbS7+0A7ufk0+tZWlQPQ6GGMOVG82vOxx7j?=
 =?us-ascii?Q?TWxdI0nvJlxAU33kYjWK3SHKDdg0zMWmeycWVmntZwPZO1FSkL0DrYHj9s59?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aad6a0e-3017-41be-95a7-08dd417f6f3f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:42:54.2094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snFC5vytWE21W+GNYi+73QlgZsnlWitT/V3MQSK01qufL+I9ZtHFaAx4CxbECwkr+ajtbUxBwaHwxoxfw8MOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
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

On Tue, Jan 28, 2025 at 10:36:49AM -0800, Alan Previn wrote:
> Relocate the xe_engine_snapshot_print function from xe_guc_capture.c
> into xe_hw_engine.c but split out the GuC-Err-Capture register printing
> portion out into a separate helper inside xe_guc_capture.c so that
> we can have a clear separation between printing the general engine info
> vs GuC-Err-Capture node's register list.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 72 +++++++++++++----------------
>  drivers/gpu/drm/xe/xe_guc_capture.h |  4 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c   | 28 +++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h   |  1 +
>  4 files changed, 62 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f118e8dd0ecb..a7278a01f586 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1655,22 +1655,16 @@ guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
>  }
>  
>  static void
> -snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
> -			     u32 type, const struct __guc_mmio_reg_descr_group *list)
> +print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
> +			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
>  {
> -	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct gcap_reg_list_info *reginfo = NULL;
> -	u32 i, last_value = 0;
> +	u32 last_value, i;
>  	bool is_ext, low32_ready = false;
>  
>  	if (!list || !list->list || list->num_regs == 0)
>  		return;
>  
> -	XE_WARN_ON(!snapshot->matched_node);
> -
>  	is_ext = list == guc->capture->extlists;
> -	reginfo = &snapshot->matched_node->reginfo[type];
>  
>  	/*
>  	 * loop through descriptor first and find the register in the node
> @@ -1740,8 +1734,8 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  
>  				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>  				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> -
> +				dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group,
> +									instance);
>  				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>  			} else {
>  				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> @@ -1760,13 +1754,18 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  }
>  
>  /**
> - * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> - * @snapshot: Xe HW Engine snapshot object.
> + * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
> + * @guc : Target GuC for operation.
> + * @node: GuC Error Capture register dump node.
>   * @p: drm_printer where it will be printed out.
>   *
> - * This function prints out a given Xe HW Engine snapshot object.
> + * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
> + * earlier either by GuC-FW reporting or by manual capture depending on how the
> + * caller (typically xe_hw_engine_snapshot) was invoked and used.
>   */
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p)
>  {
>  	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
>  		"full-capture",
> @@ -1774,45 +1773,36 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>  	};
>  	int type;
>  	const struct __guc_mmio_reg_descr_group *list;
> -	enum guc_capture_list_class_type capture_class;
>  	struct xe_gt *gt;
>  
> -	if (!snapshot)
> +	if (!guc)
>  		return;
> -
> -	gt = snapshot->hwe->gt;
> -
> -	if (!snapshot->matched_node)
> +	gt = guc_to_gt(guc);
> +	if (!node) {
> +		xe_gt_warn(gt, "GuC Capture printing without node!\n");
>  		return;
> +	}
> +	if (!p) {
> +		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
> +		return;
> +	}
>  
> -	xe_gt_assert(gt, snapshot->hwe);
> -
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> -
> -	drm_printf(p, "%s (physical), logical instance=%d\n",
> -		   snapshot->name ? snapshot->name : "",
> -		   snapshot->logical_instance);
>  	drm_printf(p, "\tCapture_source: %s\n",
> -		   snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>  		   "GuC" : "Manual");

This looks like it is changing the order of the prints. So, please ensure that this
is not breaking the decode user space tools.

> -	drm_printf(p, "\tCoverage: %s\n", grptype[snapshot->matched_node->is_partial]);
> -	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> -	drm_printf(p, "\tReserved: %s\n",
> -		   str_yes_no(snapshot->kernel_reserved));
> +	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
>  
>  	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> -							capture_class, false);
> -		snapshot_print_by_list_order(snapshot, p, type, list);
> +							node->eng_class, false);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>  	}
>  
> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
>  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -							capture_class, true);
> -		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -					     list);
> +							type, node->eng_class, true);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>  	}
>  
>  	drm_puts(p, "\n");
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 8ac893c92f19..e67589ab4342 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -15,7 +15,6 @@
>  struct xe_exec_queue;
>  struct xe_guc;
>  struct xe_hw_engine;
> -struct xe_hw_engine_snapshot;
>  
>  static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>  {
> @@ -55,7 +54,8 @@ struct xe_guc_capture_snapshot *
>  xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q,
>  				     enum xe_guc_capture_snapshot_source srctype);
>  void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p);
>  void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>  void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>  void xe_guc_capture_put_matched_nodes(struct xe_guc *guc, struct xe_guc_capture_snapshot *n);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 26006d72904f..d615ebab6e42 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -905,6 +905,34 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>  	kfree(snapshot);
>  }
>  
> +/**
> + * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt;
> +
> +	if (!snapshot)
> +		return;
> +
> +	gt = snapshot->hwe->gt;
> +
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
> +	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tReserved: %s\n",
> +		   str_yes_no(snapshot->kernel_reserved));
> +	drm_puts(p, "\n");
> +
> +	xe_guc_capture_snapshot_print(&gt->uc.guc, snapshot->matched_node, p);
> +}
> +
>  /**
>   * xe_hw_engine_print - Xe HW Engine Print.
>   * @hwe: Hardware Engine.
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..fac2e9a421d9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -58,6 +58,7 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
>  void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);

please respect the component namespace here

>  void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
> -- 
> 2.34.1
> 
