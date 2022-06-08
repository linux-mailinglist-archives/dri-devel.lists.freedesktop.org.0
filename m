Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924395429CB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10AA10E9AF;
	Wed,  8 Jun 2022 08:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC6910E9AF;
 Wed,  8 Jun 2022 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654677997; x=1686213997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kTcwhxVAg72P3eKoTUf0k1rEbppB6GpLmGU+22HNoGs=;
 b=OgOdBo09LnD9ckocYPbdBTVh/60TI9t7RStYDGJcCqP/w4M5fxTmn7HF
 TbKb83i53hdO/I4apsRZ66vDro0wl6GY2XTbOpRd6XyGxCm7Kuu76mSWm
 Th939I0XBN0MFg3Eh+vC2hYYWVnEWBGm2wvN5R/s8lebxlFR/br5mJg2p
 /ZgBO8qHx8OlGymMcu5uZ/TTK3jfAmn5YcHKCktS6TiRxMaDVQjIH2w9F
 v4FU7HHd5/ezEV6vRP6ZfdNnu2AuGzhtzmnQYFEZQ1SHwp5qY8GTdbYcF
 +79fl5gJLMFRLgXPaKbMTdyFwH15kBfHLUGMqxW8VUC5Lr5zOQCwuAS0a g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363151708"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="363151708"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 01:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="670431736"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2022 01:46:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 01:46:36 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 01:46:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 01:46:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 01:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fz3uJoJcmKZ20oFQ0BEEeovslab+hLN3cCyfZjJ/jaUSWFsSkZxjz1NurcpCjTLH8mALpBkDhE2tGtDJE7SLH6ny3bU7bfsi7cYlH+PNsBuataumI0WRhqC19uzEJVpgQ3RrwGronXdKGm3QIk9+fNBAihR5sHYDUjFEL3ytko3BjidnF10IibaHYsDxZJL6WscHXPlwav4io7XBQ9iTGLstt1x0tbFG+/hx12mN7wEl+IKkxUtDDb5NGDMSKLi6Wf8i8wa5yiq57S5swyngDTHQJytQiYO/W7fNc4Z6LnTHh6u/pJczsymcyR+2PZ3taOhdU7C/38oWKy4ocOS+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXPRQbWyMMcPflAHnQgI0/cSCKZo1O5k3gOsxF2dEYQ=;
 b=oajcPTRPb+KtKlmSClg+kn+5pHg31VPHzP2pMDHi8tVYt+sEUJ8cEctLaYFDuoY5hKECPXp3neW0PwHhqKKNlBsj5bDcGQAmR3DyLRp9oruY7iTaLfwEgUN5QxZ6LyeLACTRcJW65m+xbUJBRQMIaycT75/ZY74csRwvaTr5o+7UX8z3ml220EU3bVI1aaVOByLd17sgaoC6cRQDBCSC+NKrneJwVDt20RA8U9keg+vaQ/4HOIP2mSSRYa2Ys3+SchBLuYNYIoU6ukcMdMVVKlWEnuNu6tbLLu7Ey+yA+jpf6kbldW8fz7m0iA0ger4PF+CnRok3l7ypzLc6qF35eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 BN7PR11MB2564.namprd11.prod.outlook.com (2603:10b6:406:b1::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Wed, 8 Jun 2022 08:46:34 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13%8]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:46:34 +0000
Date: Wed, 8 Jun 2022 14:16:24 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/xehp: Correct steering initialization
Message-ID: <YqBh4JCNorWAdJBB@bvivekan-mobl.gar.corp.intel.com>
References: <20220607175716.3338661-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220607175716.3338661-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BMXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::23) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2083ca-a8bf-4710-29eb-08da492b6467
X-MS-TrafficTypeDiagnostic: BN7PR11MB2564:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB2564145A21C92C6CCD1347E79FA49@BN7PR11MB2564.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwP1s6QPvJpwFHH6f+waxXu+x3wV7Gf01sj3ru96PCf6Q6iBa3afCa+5fOlvvXD/nOgRMCZfRDUwCWxPkNuxw71Ma65HwEDS1BLzsczpiuV9NvrkukMbCI9alQ/zBssnVRPYe1gMMIEjkqg9Ct6WrFsIKWlAZJinyT6otmY4l1y2xNI3Xx8lHo23vILAHozzE38CQRcXrbP+gocKjYdIIu40n40MtIFJR7DvjEf7zII1baji2qqiit979KCmmCUDJrVN8LPghsJ1I1UuMLDRCBRJ+RZJzQhfJq9+73DSjZIuvMo/pe291O7yFiCZcMgJyR9dtoUm0VswnxZeBHO/qC6f9ZAfk+LQ2cdaYvGN07yYLhr7daB/lb9whWqgNk45DgnBV2Jr6JfIZOW0xc3yo+Hl6lugax4EMKhOPDkdUrfI5YaupVhM8Ugz11mnW0yVoz5JnAK5FK/LCZuDiVM6HNUIfCsh4cjVNcNuIiz5AsL8YkqP/8ughjIZQiNaAEDiMb9YFIkS2JkmT8vCaIUZs0SJqgXeynrkyqUDTyubzCMWQpLGHNlWSzPKa8FP00Kf1w0zrP0H3A+5OOW8PHTn6tE1ZVS3AimDpwbs3zZgI1Uf0jXJG07tqM7BYtCZ9IJvyWRrDggKSuJLub6PO5LcCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(186003)(44832011)(38100700002)(5660300002)(8936002)(66556008)(2906002)(86362001)(83380400001)(66476007)(4326008)(66946007)(450100002)(6486002)(6506007)(53546011)(6666004)(508600001)(26005)(6512007)(8676002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtmMkpYcDFpUW1iRnYrV1U5TUlFVmx5ck8valdZMGxLcllTWURIVVAyOEll?=
 =?utf-8?B?dDhuZmVseE5xWEEvVFdTeWFnbkcvVHJBNzFaMGh5K1BkQ3ZLN055NWdRUE1L?=
 =?utf-8?B?ZXArZVZVMUV4MysrSWo2RGE2ZDdnd3pjSHlIbFFmd2hUOXhEc0hNc3VVMWU2?=
 =?utf-8?B?bTYrWDl2KzdOQWp5RVREVitVeXNyZlh4dHB5N0xjTHJXU2d6VFVPZFNaNEIy?=
 =?utf-8?B?eHVXdmovSmExWUtMUHRzYm4vSFFkeVplUld1YWJqV1NlamhnWkJuQ1AwL2Uz?=
 =?utf-8?B?dTZCVzFZZkNGU0pMbE1MVVVaL2FYWE9hbUJrdG80K2dyUXNaclAwclI0SzZk?=
 =?utf-8?B?T2EwNC9zbVp2ZHhneXV4SXB6WkZRZTQrR0d3S3FnaG10ZGoxd21USTJPR0c3?=
 =?utf-8?B?RzRoLzlDN0dIMENWVTAvaFp1aEtFQVphdVVxdjVxdU9sVlpWZyt0MTNsNTJn?=
 =?utf-8?B?c3NxMXFnQVBkMjBsSnpQcnlBazhoR3REeXFTK2pXbitJekJTeGtuOVFCeHl1?=
 =?utf-8?B?R1VSMDBzY2xSUXFleWc4VHdCRXhpNVVKbWI4SnlxMzUyWE1qRU1CU09VVzlr?=
 =?utf-8?B?UXcyRmNXODlSTmJMNlZyai8yNDFOYUtadmk1VE05amZaNVlQNVlvM2lyRzly?=
 =?utf-8?B?QkpnRnhDckJLeDFsZVVaNVVKY2hxZFBIcVMrQm1Nbm1JYk9ncHMzSEVrTmFk?=
 =?utf-8?B?TVlZTzJzVFovK0NvSS82NEZrYjdnWjFoUkFpNEtIcnlBL1hUZVRVVk4yeG9B?=
 =?utf-8?B?dUdKWDNkRUNxNE01TWx2aDJPN0cxL3cwdFNLOWVrRUMvbE9pLyt0bHloemVZ?=
 =?utf-8?B?ckhVUGNtM0VoQ2ZWSm5aWHZvMEZSR216NjB0aG5PWVlLOC81SmFoQy9tNUtH?=
 =?utf-8?B?QTNDQ1dNRkRUTUdLZTlpWndsMkFNb0ZkZ0lKbjBuT0NCNjBFck51NEZIV2hm?=
 =?utf-8?B?OGdxYi9GazFDSnhxZlJET3FqSFpDRmFUZ0xKUmdoazZQY29iUmcxRWNBWnRP?=
 =?utf-8?B?dmdKT3lDWlA3K0gvcG9yMk81ZVBVTFhPRi9NakhmOUcxSDMwZkNGbk5QakZw?=
 =?utf-8?B?MXpyakFkazRlQnZpRHdUNXhaOW1rb21GcHFaRmwwbzZFRWtsb2p4TDVMeFB4?=
 =?utf-8?B?dllmZW9QTjVhV1hrOUlLNlNCdE9LL1MxN2VqRWR2VWdnOXQ2MG1DNUZkc3d1?=
 =?utf-8?B?bDRTdGc4MFRIM1cxUk0zQTBjUExpQ0N5eEVjRTlVdS9hMXVVdFlIN21TcDdP?=
 =?utf-8?B?MnhPWEpmRkdmNElGN05pZ1RGL0xXeUlhNGFOZFNURU14a2RLUTI0QzgxN3RO?=
 =?utf-8?B?M0I0S09qZWJEU2xjNUd5NEk5dkt3Rmk0blArQkNJS1FXTGdEK1RwRmdZSU5Q?=
 =?utf-8?B?dG1NaE5ZK2Fxc1R3NDRheE55YWhGNlNVRzdLRldhelFqOWJ3Wko5ZjBxRlRs?=
 =?utf-8?B?dFdUTGY4c3Vlc1BEWTcvTVQrMEVQL0dtVThPem16enFBVUExZDl6Vkp4aHlZ?=
 =?utf-8?B?akJYRVNuSTUreE5VUFNpWUIyU3Y2aWhxc09FbGxORVJXRGdVanl1RmdQeTNz?=
 =?utf-8?B?bjhGZGlzN2NOQlhubDBDeTRIOEg4UFZIY1RTdm9BcDh5VnZxOFpvMml3TlNi?=
 =?utf-8?B?Tk5zNlNLYkNtWUlSNDIxRndoazh3RDRtZkNQdFNwSTlWUXh0T281NHY4T3cx?=
 =?utf-8?B?M0lIWThmRjFrMmNDRUw1WFpVZ0tpdnVIWC9kaThKczFpZGhUTk1rS2RpQksv?=
 =?utf-8?B?Wnp1RVQ0U3FPR2FjNmZ3SEEzYldQVFhEODJ2QSt0MU9BNmUwN3NYQkhYKy81?=
 =?utf-8?B?SnRZZDJwWXBkazUrVHVUelZIWnVvdm5RR1B1SW1qZU1MUlVMd0crbDhkd3FC?=
 =?utf-8?B?VEh2OEFzeWQ3RU9wMmdHczJocTRpaW8yK3VrcmVNMWxubzE3RXdHRHdIY3Uy?=
 =?utf-8?B?ZjBpU3JFL2hYbWltNmFPblBneHBEM0lRQnU2cW1YdHNPcmtLOVI2Z3lNMStN?=
 =?utf-8?B?cTJRaUxYR1lOK1ZBbU1teDBEcHdEd0RkbEFIcHI3Y0hHT0FCZTdoaExLUkZD?=
 =?utf-8?B?VnUzZlFmcE93dW54UnJDTG9yRkplSzFWU09BRGU0UG42M2EwMTBpSDFrUDNa?=
 =?utf-8?B?eCtQaGVicEJlYW9QMjU2cVIyeDRQblVsWTY1TnFkZDdTa2dOLzlTS0NTQ0Jl?=
 =?utf-8?B?UDd4ZDkrSThvY1VkN2VxdkJDMVU1TllHZHRnbkZSdWZKM3BFQUxXd2FkNmlH?=
 =?utf-8?B?VTVaY2MvZHhIaGE4K2dSWlJxN0tzek1CZUczQzVqZXZQNStiYzhxaEJtL2xJ?=
 =?utf-8?B?NGlEUzBGLzZBTnN4aVVSWGprQjdVSHdEWkxKOUo5bDNzUlpocmtKcllidUlp?=
 =?utf-8?Q?+Bk5XIwZ6us9LazvGt+KocW48TQ6Y7BZTuHX4zlqAXgZf?=
X-MS-Exchange-AntiSpam-MessageData-1: 5fonKtSa/rrfZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2083ca-a8bf-4710-29eb-08da492b6467
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 08:46:34.4500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqo9xvyf4ROnmahUM1kBoDZgDZvmPqXby9Rmd9nWw4qgwReuVbmwUIufcKoDGwByrx2eOCCtLoHSzlgwVCnboWnsWUjToWjGwBciWwZ+PNTnWFGLUKVHtfI78C9L5lva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2564
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.06.2022 10:57, Matt Roper wrote:
> Another mistake during the conversion to DSS bitmaps:  after retrieving
> the DSS ID intel_sseu_find_first_xehp_dss() we forgot to modulo it down
> to obtain which ID within the current gslice it is.
> 
> Fixes: b87d39019651 ("drm/i915/sseu: Disassociate internal subslice mask representation from uapi")
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index b7421f109c13..a5c0508c5b63 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1177,8 +1177,8 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
>  	}
>  
>  	slice = __ffs(slice_mask);
> -	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice);
> -	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
> +	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
> +		GEN_DSS_PER_GSLICE;

Acked-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>  
>  	__add_mcr_wa(gt, wal, slice, subslice);
>  
> -- 
> 2.35.3
> 
