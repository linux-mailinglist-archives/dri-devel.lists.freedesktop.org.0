Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DC6F770F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D468A10E525;
	Thu,  4 May 2023 20:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1BF10E1C0;
 Thu,  4 May 2023 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683232386; x=1714768386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Vp8RQT/87eJa3Bv1K7jlpYCC+DxgE3r4fA/PDMspyc=;
 b=cs6N6Pt4kpqlQIsighgb4mEWARpes1RIVQQYYaSPILm80UsQRAaETrts
 QDUz08RAcc/Tq83m1R9MXUXyXTAD9dFwWtz/Hz/qmNUz1+6Be+O/k/2Nu
 PeotA1x2h7UmtQb84nqKibBsYUYEiovDDQWxuYqSTjDhRzuHZa8fYnn/t
 nqLwvmTlLvuckpcbVTH7SHFfy6NhPHb4cpLL6oEcbDbLjHlIO+eVuDY4q
 8eRcw8Obed9klQK0pnWVzMaMtfYXXMxHm5Q82g8BL7bOThWAu/lEgZk1B
 WxrZusgv2W0g/sStp9dKs0xXqMZdsP1E2qxAn8wDpiMlIecX5h5R+G4/q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333463905"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="333463905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="1027119708"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="1027119708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 13:33:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 13:33:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 13:33:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 13:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZWJ1sP4CrWbefcph4MPfJR8eESZYaBgSUq2VpMMg5P/kGUxMXPkiC/ncuqjMgKKrPr1IYl8qyxUkVuxxUs9FeLYVQ+7hJr9ZnNaPAJLNYg3u3vbTi7+MvPMZ5rEM0lpKRJHnOCsZnVrmMghMdFbGNls8+TzzVjhSP93GwIEIyRdLa8VCwsVuPylZJT8pqpsSi/0nDnvW60VGJufLffF1bzxIqOsZh8iHXyzIWDjj4Px0qUNhuX1EgFYEtjI9pkgNYFk7AsM6qHBZX+tIclzBJYHRe0U6glhCwUASNddCYbszOm1KW69UVIRDUkVhd0+AEypSecubP4IhoSCwi6Hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS+t4kZRh6eCLa/HIuedTxRTrrWvMDTkw3hnZbUXXsU=;
 b=RfXVlRNgAu96y5CA4tYTvauBJiFigtsJ3cy5VVhGvX8qneCENZC6xO9KXgLrhfxf1b2h20+eeeJaMJi/WineSL3uDwT1DqbtAb8pZJJFmdaiOUxuU/c+80qsczUjUOsY6/OSxNcVsu5Ncj8ZQ7mzwfGBq03fk6vuM9qUD87y0lXwvz/o9CW3fPtkmyOa3IrXP/jyLKraoO6bthXK4Pf+o+993eZuwf1x/WqQW3k9fl4h9W4hXOwNwTV295t1wFwHZ5UTL5DmcaiZVk5wNPY6Lyw+i1VtK8tR2FHhodoAxHVrubn1VFaB/jPoEb6eQQRFViVJwer40b8770CVNyi6OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 20:33:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 20:33:01 +0000
Date: Thu, 4 May 2023 13:32:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH v5 3/3] drm/i915: make sure correct pte encode is used
Message-ID: <20230504203258.GR10045@mdroper-desk1.amr.corp.intel.com>
References: <20230503225100.2834222-1-fei.yang@intel.com>
 <20230503225100.2834222-4-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230503225100.2834222-4-fei.yang@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: da3ea8ca-8548-4200-11d6-08db4cdec12c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RdHbSwsHzB9HRMhbtt7fGBCKJC2SLz4TXmoPfyiC2hX8V4pUWQMIcaHIoYx2H+aAf35AqqAkJcC1K/6EKS7k2mxtpJ8HhdojQAOPVn3+iBlVknszLQWBD9cpalRJDR/ZKm53QrLIj6O+DAhXmetUgBooRCM0vUZlaoG7ueaqM7kI0RRvv51Tt9k1A2jX8JiqTCDqUbyplTcZD7ReusAOTpkvur3y4KZv3OxJ0Qcn1mkJvHvOgKwiGp09s+DpudYPvLidynghAO/G1cGrXCVeGwLzTrJs4C3v0AWnIi6qyew7YBDwDAUQGTwEvVFLJAw9AfcorFjq+xokWfbAjq38Xa6jXj3iEfKOPHuLDkdkpejO3m/tNv5tc9e5Ut809uc5YpByULCth002UBfjbUmXAqJ2DCTWMEgs9THK2apJeG7mdfvYso1E4sJbjhJWhn0//fHbcXLSqik/z/j5s+girbWTa+y4uoYSK9BJJ+2/35ygNQpTVamGYhmi9tKXX+2uczGwAETqb7X+wHRBPvoKmsbQsa/HGaYWxIzKviQAEuQpaLWlwcL4mUUYRVV66lP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(8936002)(6512007)(8676002)(6506007)(1076003)(26005)(83380400001)(2906002)(186003)(5660300002)(6636002)(41300700001)(6486002)(34206002)(478600001)(4326008)(66476007)(316002)(66946007)(66556008)(54906003)(86362001)(33656002)(6666004)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FgUlYK9lRHxQ8pCY0ZuNPSYtgw3vNikhBMge708sQIJ5Zcca3owvo12wwteB?=
 =?us-ascii?Q?DZSDuQFMqJ4hoYSwIRRYOcwlRv/bdjIG8BKbgWPM5FYuhKoj7mPDAMcylcYQ?=
 =?us-ascii?Q?3htlCyn+5jTIX9V2z7BP2e4gyx58AkKehelPJpB+UbsRxLFiHfFcNwjt0dOS?=
 =?us-ascii?Q?xQycGvxwphWhojz8rqoWRJg6rSKkidFoZtNQ8ievyxyiLJl7lYo//A+Rm3nb?=
 =?us-ascii?Q?kXA24OLIIzPFtv9YzYBtFdUfowkPApY+/2t0P1he8jLwYOTr1WxZaZyOdyUM?=
 =?us-ascii?Q?3c6zI5mOuh26RJ0VNY44T4zeuqU8swoiJaIHKRJu5nBzibQLWYYP6jI9p5QV?=
 =?us-ascii?Q?B0dzUE4tjiJ9gQq6N1LbKmXyHtx87S4xsitSbDOfzMfchE+I5G3vQyFFb4J1?=
 =?us-ascii?Q?S2JfMiyrPdObWY1YPIXR+VO4ZFIFjU6uKZRX8/S5kyc2yxl1U4No6WmqfOzO?=
 =?us-ascii?Q?dHNoAImYQHLQWBfZzo+3u/NsS2AfBaHj1AOodVrIjkgsw62VVChsrOlu4VeL?=
 =?us-ascii?Q?alUWT887afbYGETTKO8x96/7rgfqi6/YMhuf3l20J/4jF0hBo28SdoqANg5Z?=
 =?us-ascii?Q?mN6wVfArKb3MvtWp7Ev8iDRY8qALowR8fSxTP1MCKRHLP1NPoWbj9G06WtXd?=
 =?us-ascii?Q?VfL/NQ23v+NB+m0zK4CPJupmG5ltYoBCt0CBhW7IhXs1Ol0FyByOP/+4HRjs?=
 =?us-ascii?Q?OlvvVVppvQE5QoQ4/MBqOZpVqYiMrsqJZ/myFvbui7M5tg7Bn+7sJwVGvKUo?=
 =?us-ascii?Q?wbX4WSV7fcLFhGDNYqS25cWeFbeBhguouEm2BwoJl5aNdRf7+H3gfa0aGcky?=
 =?us-ascii?Q?DhlEQaO+QQpBVJ2oZUSdthDwWCi9xtfbBQ3FI2p6ftU0xKwPUr7GlwUghdrM?=
 =?us-ascii?Q?RWb80sa+NsBvjGHnlLHsmjVO4mHxJOgOqL7VKQNDC1TJLo+xraoQI0ZRI5HQ?=
 =?us-ascii?Q?7vQzSYWBKw5AWs0G/X8OAAws9zTXHmfcHj6LbvWwqMsNyXgTlP04wsfu34ue?=
 =?us-ascii?Q?kfQSdf/RIL7y1VlsdgYZFeVB6AL6P05SqUOzpasBb3MRx3r/Uw5lTFkCqW/z?=
 =?us-ascii?Q?YDHMg7oQ2xUZLWn0IRsi7Q6RixOuobJZqu3aFilWZ33tjdXnu1f/KCs1f5BR?=
 =?us-ascii?Q?HhDWuJk0Q+w91vsOMHOqy+FTjmPx82sss+caB3grzM3KKlGmEBl9UGZzfhYL?=
 =?us-ascii?Q?t9tMDtPxyB9EhhRA6cCnyJY3k09GAR37vgIIiGGbnzcbxYbS0yTFWUv/tbvP?=
 =?us-ascii?Q?cvcCEizM7c9+8hboiq09VQjVW4mUWrKlI3+vGQ1G4n3iRKVLVWAAoNEad4JA?=
 =?us-ascii?Q?d/hl3jKDIRuQzsXZBENGMtBJ/9DywZi1Qi8OPQxmcae/uEAaMgGOI9imqoW5?=
 =?us-ascii?Q?UEN3wSLR0eTqzBDFdIeYzKodvCvQKYOumZq0iE6loVooYUusyg7arHwKkkFW?=
 =?us-ascii?Q?WX+ln+Ymr9+GyM1ncOvwFRg2i+NJegIkU4jDNKqqidv30pnW/Amn84MXOEsu?=
 =?us-ascii?Q?1EHs6uX7EtDpyHMLVY0KBmq1b8eUYH0T7SzrzfNsdsn1tSuHV0XeJVBJwtjp?=
 =?us-ascii?Q?u8/st70NzSnvtXY0xsNNvAem+4VVZhVTQtsLbbXnKSNViHvpiMxrLTOQoWIj?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da3ea8ca-8548-4200-11d6-08db4cdec12c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 20:33:01.1672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opn+0ki+XqsLiIEKaIFQN+lAcvHvc2A9nLHLjYmigzwZT9dpveVNzWAypXlG+nwKmLQ4E9qXb1RANcvwc7Gxh2Sn2bymEdFde+epVbkiglw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 03:51:00PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> PTE encode is platform dependent. After replacing cache_level with
> pat_index, the newly introduced mtl_pte_encode is actually generic
> for all gen12 platforms, thus rename it to gen12_pte_encode and
> apply it to all gen12 platforms.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Bspec: 63019
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I think it's important to include the bspec reference here since we have
so much trouble finding proper documentation on PTE formats (other pages
like 45030, 45040, etc. never got updated in a sensible way).


Matt

> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index f2334a713c4e..d1e3d3b90e95 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -55,9 +55,9 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>  	return pte;
>  }
>  
> -static u64 mtl_pte_encode(dma_addr_t addr,
> -			  unsigned int pat_index,
> -			  u32 flags)
> +static u64 gen12_pte_encode(dma_addr_t addr,
> +			    unsigned int pat_index,
> +			    u32 flags)
>  {
>  	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
>  
> @@ -995,8 +995,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
>  	 */
>  	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
>  
> -	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> -		ppgtt->vm.pte_encode = mtl_pte_encode;
> +	if (GRAPHICS_VER(gt->i915) >= 12)
> +		ppgtt->vm.pte_encode = gen12_pte_encode;
>  	else
>  		ppgtt->vm.pte_encode = gen8_pte_encode;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
