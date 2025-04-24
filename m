Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C658A9BA1F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 23:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D358810E872;
	Thu, 24 Apr 2025 21:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp8duKek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319510E86E;
 Thu, 24 Apr 2025 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745531215; x=1777067215;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=elOwmrssCfaozpE+jm5KJfyyEK9lPvGeH1VNZz+/gAo=;
 b=Sp8duKek75Ig8wkWz9I7N3HUivo/dl28UXpvTwy4ernZERLc/BxqOj6Y
 2dbpHX2dwgn+TPJMwz35NbjJOr6l73MYBFM9qArfXfaFcsO7e7Q+T8354
 h3CF8+OHTBntqpPPZThznewCaRSkqxzZzBMYBl8ebzrx3XevbapqPxA05
 ik24Cbjw2gWCjFbth4G+QxYFa36cg7AXAuAes0rKvm0zSmAtWXvvyY4V5
 Ag+Qm/rVx5Aud3l1FXjO4FUbSvnhzMQUrx+b6JXSemS91cV0rE/9J7Cc9
 3D2Y69HjFkCwfbIEiPREHCMi4nNzg5qn9HKosBZj3SRndWYq43Rt3OtS7 A==;
X-CSE-ConnectionGUID: FswtBlpcTqSoCKJ/UkWwiQ==
X-CSE-MsgGUID: E1virHDTS/O9iQDzYRfbeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46418049"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="46418049"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:46:53 -0700
X-CSE-ConnectionGUID: r+R7TRYIQGeP2FjG81bMBg==
X-CSE-MsgGUID: 3MVIQu1USmiT5fyn3+ZPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132616279"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:46:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 14:46:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 14:46:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 14:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF1PIGVcJHv1fggRhzCCi+FNDGM9ATT+jayqEl/9k0pNYr+CqaTBhO+9qAoAAkXEQiiGs0zxZ8Fz/KDcN8ONCVxHAwO3fFKXcIaoVpyAmyb6f02Q6rtwQYpn76xzSZOZ5T/ZpZzuHfWINhVM2wryykPJsNTIiFDVM5KOEu7Uv4pTxKAlxGmCrvE4C5u5XYEVk6A5eMV8F2yLylsCaWR0pzlEsrelyjJ+n5g0gNzhJPxFI66dxjm56eQ98rav9m/HZBsfx/crgPGxjFrsXLEKiH1iVyWg/tzaGZ9NLsBsRXfTVMWgg9R/Pa9I/UVd4WrMXCQe/Q/EbfUr3J6oAiO99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+kvKQxV+5gRhsbTBwzhPxzQbNa+tmGwCwWskv5LYP8=;
 b=KQMQ/KZwlikzOo7j4uOl8UegDZSg/JAzdX0wqjWt7KwDBeRplhbj7E89P3NvQfhM4p75vuFPl3WbHcA2/lODXeM4jcdk1oGoq20KLB1UcT4eWkgIZj637JtOT7GAPp/ZljO2mQBQ8blSnArHOaKj7Bb92OZVXdn7Sb6f0ecbsXuICayu/AqaFqhetjVq8aRIQWVOd8OHyr3xIc1IuTJp33vOaMHqSE16Lcl/CfQ6e7VxeVpG8PzuFpvlFkQSwNX/CHBOLBMJKgV/+muH7pFUc1F3QjVs2AiZvQvhOknU2MdgCGvmaWIJkTbQaeVnZEorpbrM2B/XccxOHl70H36Rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 21:46:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 21:46:35 +0000
Date: Thu, 24 Apr 2025 14:47:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 4/7] drm/gpusvm: refactor core API to use pages struct
Message-ID: <aAqxjKrHdj+37yw6@lstrano-desk.jf.intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
 <20250424121827.862729-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424121827.862729-13-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0329.namprd03.prod.outlook.com
 (2603:10b6:303:dd::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e831f9-aa67-4a36-1e64-08dd83797c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?F34gABNta9K7dE/RMP2DFCw2ecmwIWxEutB10uamP9/s8M864MQNsnDnTp?=
 =?iso-8859-1?Q?SM4Y6jV9cRk6veWxPDmCiyHIOxiL6GvPxz1UZMaVoE7JgV7NWZ+mW6vFss?=
 =?iso-8859-1?Q?CAesl5LfXA8HhNNcsvQUKWtH2XGRKpTL5n3TeEizK4l/h+nPjh1K0dhPDj?=
 =?iso-8859-1?Q?ldAQAqbzPKuPEqWU4/NXIeOXvljoYnN6YetqeDGUbQ8gzhqoTQoLPIY9o8?=
 =?iso-8859-1?Q?57j5IxU12ol8fJpQypVJ9GzSrokakRD7erjicoqAg3FGdaGo3cQ9/IJ/BN?=
 =?iso-8859-1?Q?dozWKIKQkz2dUjX5FLRuJizpV/QzZM+7pPmb6i/jfajj8V6ZPfZxxvEp9N?=
 =?iso-8859-1?Q?nZRScRVDbhDv3oyV00zAdCyflpidwJjooK5hJgUqT+yZEEu1y2ADEoM7Ej?=
 =?iso-8859-1?Q?+jtmo7cvno0DUoXDu+7o6SnV2z5k6x98ITUdCgXys3u6oSy+E49iz2cDqm?=
 =?iso-8859-1?Q?bN+BdUIAimuzCtIBnE22sxdfXZimjRU/L2vGQnvZr3bgg76k6JTpp0AVZT?=
 =?iso-8859-1?Q?dzjfLO4upcrh9FqrVS61nUwdGASXWu7xVD1/X29RQl+mWfNOGm0txWtfor?=
 =?iso-8859-1?Q?XfS70x5jtrM+VR+0LyjVUfRzGCsyod7ICFBhIINdyLSRS0Npzg1KdAfdzE?=
 =?iso-8859-1?Q?jMd0fJR5q2xHNh+lbT2q9oYmptcz21kw1BJxgpSOOwBJnXEMO6W4ScrbT1?=
 =?iso-8859-1?Q?FPypvtZvo4mgO9grVF1jyK7nOf0YXyEDld6sucR+WAmFgxaf8caLVK2QV8?=
 =?iso-8859-1?Q?5DzhEe9yzB7gJ34DFeIYe68yPx71WCG4Uw1/EB7ZS1CfFl0D6V0vsW51W1?=
 =?iso-8859-1?Q?/HjoY/9A0D+eilGTgECa3+s6n1GkEnchQLeVphqWaobFOaCzEuPDF0RxNX?=
 =?iso-8859-1?Q?N02tb9R7AqFceyP6imkTKEGE4kaq3/QeK7HkYc1Wiz2u773ElTqcoOF/mR?=
 =?iso-8859-1?Q?kdPZNP+iWz6w7bYeOapB1xO9ffdvGPf7LBkEbKiqyr1hJ1mngi2OoDVYxC?=
 =?iso-8859-1?Q?PrPbRZw98CWLC1Ox0lE3HbjdGWwSEMmj/BDd5Xz0mAckmbfYQxGar9uNvm?=
 =?iso-8859-1?Q?q4YRpjBeuyb3iD0APE0SK0M0bTcRnClWPUfmDcFoSMYGheL819dsUakcrS?=
 =?iso-8859-1?Q?Shl4Z6FzCkow4198V+75SJ7gkjt9L56bn9XyQgCXYaXbIy2GuCuaq9CJpL?=
 =?iso-8859-1?Q?SGIIQ3cYAKl9ppofomC1uCa6p1CJ01aWZcMzRTxHzWI12Pk0yO4kV8fHZV?=
 =?iso-8859-1?Q?x38Jo4zi96b/0LDGGUd3YGWbL3bP5oFVz9Q/+Tsx587F3YhOo6jGTG5R6/?=
 =?iso-8859-1?Q?xu6xJq6+8F5Xyet/bDmn87ykdXbABnF2ldOcN7u8fU54Mny2U/MBNPYt5Y?=
 =?iso-8859-1?Q?wW9ZRLd1KnKJzll7NKyfpX80LiRKfOHIeFQ0HkGvEdlsNAijVf6is7weBH?=
 =?iso-8859-1?Q?Rk3mD9UxBxbpN1oBJ2SR7cm2QgNfxzcRvbjgsrs6IwAtsYDdsaXYVisrFk?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?n65E0L0VNbdfwHRdZ7VHSrsGOv+ZJOTEbm4a/Xu+ozb7IlIrkT1L5+SwPZ?=
 =?iso-8859-1?Q?lZ4hdcO28vWjQRqQcOfvIgwSppKW5X72ddD/KrLCkmszYO3fLOvRmikh3A?=
 =?iso-8859-1?Q?CJio5X+uPp/jQzn5a6TonRs04b6zNzC/Jaq6OTrPRPcQqJqBpbhBew5jyz?=
 =?iso-8859-1?Q?r7FmvOpZw2Nc4puWJFkplx0jMHxhpj5dvhGhF+IAPy5N1CdcvO1NjGpRf2?=
 =?iso-8859-1?Q?dJ4GqtR0ymf8vcNcCZEp053E6UMJFMUamCnPV6NBle8Mnjps16c0OTEiuo?=
 =?iso-8859-1?Q?fy85a/tz6p+ZjBvdLlDCPPDfptDEkiRmCz2zdyTKw/nMEd1r1VEEEwfBTe?=
 =?iso-8859-1?Q?ThejXENa/UWkgMKtybhnHq6luP77R+tIZmN2NahDAb3wRPKWMJi+nwpINf?=
 =?iso-8859-1?Q?AGzRn58pvQRFSDNfC7MryUmbBYXblLm1kK+bb8nhUK1YUJkH2LMJVm2vCN?=
 =?iso-8859-1?Q?7aAjv4216sBPubnRi36nzB7eCt+TrOUIuauP/vS4TQesLnsHeDzcwfHixD?=
 =?iso-8859-1?Q?wV30B2yNq8r4gIyF0neYjRIARsTG1+2FETEjEtMUBhcnH9KYkg++3q1iWC?=
 =?iso-8859-1?Q?+kpzH1JK6DTJxIRYDThoT7KkcHKM/dPl8JtHq3IMZIW2sHynwC3kWSD+H8?=
 =?iso-8859-1?Q?PBFbC6wIMNA7PDyGPAA7jJoV4r2INwZAFRAQg6DVt5+PtK+z3xWDFtOCDq?=
 =?iso-8859-1?Q?JyGPT5aNPdL1S7+CWEUGM2yw3XKD0UlbpSOrJsjmh6xd9Sr6/3htRbWFtK?=
 =?iso-8859-1?Q?Elg+4DapOP+JuqyTv8Fh8v4a0HJ8s3HyzU591w5NhjAasMZIMrdCzd8dmc?=
 =?iso-8859-1?Q?6Y4jOoB4Y0inRrw3ZFR8N2qNGmPZGrl00Z3f7lzwe/4wPIDtRcXCzsorBS?=
 =?iso-8859-1?Q?5amee5ITsbheuNKhoJ+DzR1/09smP0qzCnhJnCrTv3oOwlsqeQjts56/EA?=
 =?iso-8859-1?Q?y/oQMVEOz78yRtySIbodWxrwpfY4cJEoOcn9d4oRXpySddBaumUGmnzsJt?=
 =?iso-8859-1?Q?SyOhzKkbB8VKQITiVmwTbPDSQSw9vJcv7N+LZlNSG+gaHO+u/q/rpK4jKf?=
 =?iso-8859-1?Q?fFfkFkgt+pTS1+9khmBlyxCWINt10nq4jSDo9MOIInSi3UzmdIryodCjDj?=
 =?iso-8859-1?Q?bpX5XxTgQW53gHe+VibhiE5MDk4GTD/tTyRde0wVUBTLL+BfvFovl3nTrW?=
 =?iso-8859-1?Q?psZtbJlzxaZXUGG3y6YQmblrp6ghVBzVyDHKamA0au9Sxrv0xmNP3rZO3T?=
 =?iso-8859-1?Q?zpTS1ApXsCrQOT3QuUX2v4YNYXfqSJKTIAbu3hp075G73+biFCoKGHvOmz?=
 =?iso-8859-1?Q?ZQ8zc3diuIGtKzfXDCnNM7ssinFrQrwHaZsS93sIkRgXp9nS5FFZ+1cej+?=
 =?iso-8859-1?Q?6v2evgmq6SRgqHIq56HYGJrjB8DGOvnW6CxvGRC7p9NqQVbArpmT0557x3?=
 =?iso-8859-1?Q?LUg2PJH39n51ojVuiaXlDqRxTBax9YocOkojJLs/VUsf+T4q9jSwADF7cn?=
 =?iso-8859-1?Q?L0Eo3byTYjcLuDQYbr54u0e1zDh0ZRcM8Wiu1CRJbQO7o1n4Oc27gDml7R?=
 =?iso-8859-1?Q?kFZox5SvAP7uwnwniiD4C0vBnwTvtM0tRIVULqg+oHHynazg6SlqGIBzqC?=
 =?iso-8859-1?Q?mx7D8LKZv8WWmVoUR0H4Nl8ue/XRJoaywLf8xHDETHlMOsL7LoDzdOvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e831f9-aa67-4a36-1e64-08dd83797c2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:46:35.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWkln8RRMD2nh7gjzt8mVeaD9pBbZiFjrwA94jHGqzoAZLBfiPI/mCXBbrKX4kaOec6Q5cwlUOLOdy4B8Nvnng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

On Thu, Apr 24, 2025 at 01:18:32PM +0100, Matthew Auld wrote:
> Refactor the core API of get/unmap/free pages to all operate on
> drm_gpusvm_pages. In the next patch we want to export a simplified core
> API without needing fully blown svm range etc.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 161 ++++++++++++++++++++++++-----------
>  1 file changed, 110 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index ef38017d2159..fbe0d70ef163 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1128,19 +1128,19 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
>  
>  /**
> - * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
> + * __drm_gpusvm_unmap_pages() - Unmap pages associated with GPU SVM pages
> + * (internal)
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @pages: Pointer to the GPU SVM pages structure
>   * @npages: Number of pages to unmap
>   *
> - * This function unmap pages associated with a GPU SVM range. Assumes and
> + * This function unmap pages associated with a GPU SVM pages struct. Assumes and
>   * asserts correct locking is in place when called.
>   */
> -static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> -					   struct drm_gpusvm_range *range,
> -					   unsigned long npages)
> +static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +				     struct drm_gpusvm_pages *svm_pages,
> +				     unsigned long npages)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
>  	struct device *dev = gpusvm->drm->dev;
>  	unsigned long i, j;
> @@ -1168,17 +1168,15 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  }
>  
>  /**
> - * drm_gpusvm_range_free_pages() - Free pages associated with a GPU SVM range
> + * __drm_gpusvm_free_pages() - Free dma array associated with GPU SVM pages
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
>   *
>   * This function frees the dma address array associated with a GPU SVM range.
>   */
> -static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> -					struct drm_gpusvm_range *range)
> +static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> +				    struct drm_gpusvm_pages *svm_pages)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
> -
>  	lockdep_assert_held(&gpusvm->notifier_lock);
>  
>  	if (svm_pages->dma_addr) {
> @@ -1211,8 +1209,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
>  		return;
>  
>  	drm_gpusvm_notifier_lock(gpusvm);
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> -	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages);
> +	__drm_gpusvm_free_pages(gpusvm, &range->pages);
>  	__drm_gpusvm_range_remove(notifier, range);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  
> @@ -1277,6 +1275,28 @@ void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>  
> +/**
> + * drm_gpusvm_pages_valid() - GPU SVM range pages valid
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected be
> + * called holding gpusvm->notifier_lock and as the last step before committing a
> + * GPU binding. This is akin to a notifier seqno check in the HMM documentation
> + * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
> + * function is required for finer grained checking (i.e., per range) if pages
> + * are valid.
> + *
> + * Return: True if GPU SVM range has valid pages, False otherwise
> + */
> +static bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_pages *svm_pages)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
> +}
> +
>  /**
>   * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1294,11 +1314,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
>  bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>  				  struct drm_gpusvm_range *range)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
> -
> -	lockdep_assert_held(&gpusvm->notifier_lock);
> -
> -	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
> +	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>  
> @@ -1312,57 +1328,59 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
>   *
>   * Return: True if GPU SVM range has valid pages, False otherwise
>   */
> -static bool
> -drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> -				      struct drm_gpusvm_range *range)

I think the kernel doc needs to be updated here.

Other that this nit, patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>


> +static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> +					    struct drm_gpusvm_pages *svm_pages)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
>  	bool pages_valid;
>  
>  	if (!svm_pages->dma_addr)
>  		return false;
>  
>  	drm_gpusvm_notifier_lock(gpusvm);
> -	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
> +	pages_valid = drm_gpusvm_pages_valid(gpusvm, svm_pages);
>  	if (!pages_valid)
> -		drm_gpusvm_range_free_pages(gpusvm, range);
> +		__drm_gpusvm_free_pages(gpusvm, svm_pages);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  
>  	return pages_valid;
>  }
>  
>  /**
> - * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> + * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
>   * @gpusvm: Pointer to the GPU SVM structure
> - * @range: Pointer to the GPU SVM range structure
> + * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
> + * @mm: The mm corresponding to the CPU range
> + * @notifier: The corresponding notifier for the given CPU range
> + * @pages_start: Start CPU address for the pages
> + * @pages_end: End CPU address for the pages (exclusive)
>   * @ctx: GPU SVM context
>   *
> - * This function gets pages for a GPU SVM range and ensures they are mapped for
> - * DMA access.
> + * This function gets and maps pages for CPU range and ensures they are
> + * mapped for DMA access.
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> -int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> -			       struct drm_gpusvm_range *range,
> -			       const struct drm_gpusvm_ctx *ctx)
> +static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> +				struct drm_gpusvm_pages *svm_pages,
> +				struct mm_struct *mm,
> +				struct mmu_interval_notifier *notifier,
> +				unsigned long pages_start,
> +				unsigned long pages_end,
> +				const struct drm_gpusvm_ctx *ctx)
>  {
> -	struct drm_gpusvm_pages *svm_pages = &range->pages;
> -	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
>  	struct hmm_range hmm_range = {
>  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
>  			HMM_PFN_REQ_WRITE),
>  		.notifier = notifier,
> -		.start = drm_gpusvm_range_start(range),
> -		.end = drm_gpusvm_range_end(range),
> +		.start = pages_start,
> +		.end = pages_end,
>  		.dev_private_owner = gpusvm->device_private_page_owner,
>  	};
> -	struct mm_struct *mm = gpusvm->mm;
>  	struct drm_gpusvm_zdd *zdd;
>  	unsigned long timeout =
>  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	unsigned long i, j;
> -	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
> -					       drm_gpusvm_range_end(range));
> +	unsigned long npages = npages_in_range(pages_start, pages_end);
>  	unsigned long num_dma_mapped;
>  	unsigned int order = 0;
>  	unsigned long *pfns;
> @@ -1375,7 +1393,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  
>  retry:
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> -	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
>  		goto set_seqno;
>  
>  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> @@ -1522,7 +1540,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	return 0;
>  
>  err_unmap:
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
>  	drm_gpusvm_notifier_unlock(gpusvm);
>  err_free:
>  	kvfree(pfns);
> @@ -1530,8 +1548,57 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	return err;
>  }
> +
> +/**
> + * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are mapped for
> + * DMA access.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	return drm_gpusvm_get_pages(gpusvm, &range->pages, gpusvm->mm,
> +				    &range->notifier->notifier,
> +				    drm_gpusvm_range_start(range),
> +				    drm_gpusvm_range_end(range), ctx);
> +}
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>  
> +/**
> + * drm_gpusvm_unmap_pages() - Unmap GPU svm pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @pages: Pointer to the GPU SVM pages structure
> + * @ctx: GPU SVM context
> + *
> + * This function unmaps pages associated with a GPU SVM pages struct. If
> + * @in_notifier is set, it is assumed that gpusvm->notifier_lock is held in
> + * write mode; if it is clear, it acquires gpusvm->notifier_lock in read mode.
> + * Must be called in the invalidate() callback of the corresponding notifier for
> + * IOMMU security model.
> + */
> +static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_pages *svm_pages,
> +				   unsigned long npages,
> +				   const struct drm_gpusvm_ctx *ctx)
> +{
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +
>  /**
>   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1551,15 +1618,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
>  					       drm_gpusvm_range_end(range));
>  
> -	if (ctx->in_notifier)
> -		lockdep_assert_held_write(&gpusvm->notifier_lock);
> -	else
> -		drm_gpusvm_notifier_lock(gpusvm);
> -
> -	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> -
> -	if (!ctx->in_notifier)
> -		drm_gpusvm_notifier_unlock(gpusvm);
> +	return drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages, ctx);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
>  
> -- 
> 2.49.0
> 
