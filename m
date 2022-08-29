Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F175A5176
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC0510E546;
	Mon, 29 Aug 2022 16:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014A10E546;
 Mon, 29 Aug 2022 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661790028; x=1693326028;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=n3MHBNQvFnoTtQFjXD69Vtst4CCYeXou5faoHTmuB6k=;
 b=QrpAqwASYzxCrpgVSnzMLqL7R9joJvEM3tkwzSFk7yQmeIj1itN4zofW
 tkY01UFcuqqu3oWnDZga8/1Yum7aX25HTua2qRTQ59PIv5QODA5vAa/1g
 ENMaDpDJDrLrE6hcf1My5VD6C/how8ziLCxDAiFEAsyDLbl1UWTgFeNSP
 QNGNFVWfUq5i+ZeOI3iXbwxDVCA6aK2YL5vPRFXzSaNYy/OdwWjdRNLJB
 7i5Yg85Qqcumyl4oCW3aEHvldfxLtHMRakzb179DOXfahjW/sWVGUy8/K
 XizcCZdO2+CxpwXn7bJKecNF4QpYzKozYK5BmVCf1ooqUysOtHUQyAn30 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="356653637"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="356653637"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 09:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="607495368"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2022 09:17:07 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 29 Aug 2022 09:17:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 29 Aug 2022 09:17:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 29 Aug 2022 09:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajvk3RCSrOXUENNDkoMjcA+wFvr7rHkzQP6QVs+/pYZS33SUkORi8UFaJRPavkHZjp81z6O2IZJu7nTnqZWKjTVfg1m93SOShMEHgPB4n7wevNadGxju1ISnUqNkPQzqWL5Tgq1MgM9ySSakbSGjk7Iw2bXJMoGuKiI0lSFYnhv1FWRoSRR4rhwHcoBkFMzfnIC8eLCcK+xpevgIkvrDSH9cpQk2+EGnEZro0nPfp+du232FhT5n7z4cTIU0k85M/+x1OfVZoyDoO8jClRsHTwFgNxo59wL4P5a4e5wkK1b2gA0sLu9bR4sgL9faSDtTlXbbmw+Oq6SchLzjOedzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CRHCNtnW8dplCOkK+uX1pLz38ndTIKAKH9danUHa00=;
 b=M+Stc5vXJ1yhj9YYA/l4NHcDdzjR87apZ0g7nVJ2CshlVpwGXvkKcHNSWLjFPFZJ25VWfFmU0ZrqIfML5qcPn7b8c+xMlg95Z2A7B6Q8wOO2mDzbhIf8YSDUxdd1W7fZfr+VT3EAKd+kaMWZrMbkScUn5gUj1tYyL5/QH7jQWYknPPR7Hwbhv3DTAM9/4XfaqkZ4DuLoIO5aKAPI7HaF/sRm7W9FT2n+YHP9odJYCIiZ4TLuHm2uD/cU1SyOIVrcS1ER2WgG9Tijv0WIt9e1I37SZd9U1/Nh1AlEpwJ3p06ZmWjvlzTmMRnPg1qMMri6/0THLzwrFXqDkt29twDB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CH2PR11MB4472.namprd11.prod.outlook.com (2603:10b6:610:49::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 16:17:04 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::6470:ee62:f519:5a9b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::6470:ee62:f519:5a9b%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 16:17:04 +0000
Date: Mon, 29 Aug 2022 09:17:00 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ats-m: Add thread execution tuning
 setting
Message-ID: <YwzmfDAB1EMJO/VO@msatwood-mobl>
References: <20220826212718.409948-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220826212718.409948-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84561952-6263-4be5-5296-08da89d9e90f
X-MS-TrafficTypeDiagnostic: CH2PR11MB4472:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DMWR+etEqVXG0dYV1VtCBP7NOKqA3VLEXj9YzMQ4anEdkJ+WMDvFkxVkj6TvgmYFY+BNebubEVfaUOKYoSIGGD1l4LifMGo1jyCF8M8jG5V69/aEXxM8w3R3OTvGpMLUK0GTiTzu7KxThAoxcXabQZiiy03k3MZ6Gy1HflmGpksWaq2N1+ZQIllrMxxQqQZNruB4jpRgLR+GNBGYt2zm6WdAWxwT3IX0f4HG945udH/uQxOzu4u6yzmQd4EqPYWX0/VhVmy4+Gbo2dfgN6nED2Z0Zna9qam3tMUPnPbhGmC2VbRkDnWn2Ug3BelSzwgkmlwhrOY9MhtSPjxkvT8ipiEfFUEoOGTZJQkT0BMdVDZhhEupUN653f4O4LYYEfk8C2w/M1/+7D1vz7duI6kRzhqjd1qaIaseDjCqbgm//Zkri4BPaM/GaeN34b2H/YP6NjcSGlRKqf5PnqbEt6HuhxeahXFv75eZNr/pmherKNqgoOn0VINSjyYOo9+GQUI4GzsTOm5qximj1VAZbboSiqcE40BiLiQUa5Q3YKAPHUr9SLUZn6sZ619sP04q+eBGBJQ5rRdFvRAK0pdvQVAwptzWPLTkNO/wW68LqyOthrSeqZzZendbiB181+Rv6ARTlRXFzKqgLztR7pq2twjogDuAtlGv1nUYGU1o0h7aHFC90O/PoB3pMHgc+UbpPJY2v1kax0y2Qgv1d5hx8AcI4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(450100002)(66946007)(66556008)(66476007)(316002)(8676002)(6486002)(86362001)(8936002)(5660300002)(478600001)(41300700001)(82960400001)(6506007)(9686003)(38100700002)(6512007)(33716001)(2906002)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME1keXMycDV3M3ZqZDdPMk1paFRjOE9HZE4xdDRlczZTZE9UcjZib0RxeDRp?=
 =?utf-8?B?OW10bjIzWXB6MTBXSlY5SEFFSk1SWXJ2YlVibk10dVdtbnpxTy8xWkg3VEtH?=
 =?utf-8?B?YlhHNDJJZzJjWkJyUzhoRCtaREdXZ2hvUFVNTmJJdzBmMWwyQ2RkVkNnTTBw?=
 =?utf-8?B?NzQxVjhBRTYrZE9DWk0yOFQ0V1BBSHQzV1NYRnJ1bndaNEVLR25UUWo2N3FE?=
 =?utf-8?B?R1Y3RVBOTTNjcE1UOXVEUVNUNmprQlVXQ01rSkdrODUvK2ZISlg1UGEybWFY?=
 =?utf-8?B?a3grRXZSMFU0MGcyTXM0MnhHcHF1TXBEZFB5QURQOC9DeS9PYjZRK2Y4blFX?=
 =?utf-8?B?VWIycFdqK1pWNzRicXUxc3hEelNGVXQranc4ZERGYUgvdXF5Vklxd29oS01v?=
 =?utf-8?B?SnRsQVgxWWRmUU4vMGxBWWVxTUZKWjBtcWJJTDlLTnVrcnFLWFhTdVM0L2hD?=
 =?utf-8?B?a2NYMnpIL0VqTlVsalZOMHpNRkpwcGtzWGFnMFFIdDRGSzN3YXdLcHdZTlZ4?=
 =?utf-8?B?Z1FZblk5TFNVdXByVEhSMzVhamJtUWIyalluajBVU01FVk56WTUzTmFSMFdI?=
 =?utf-8?B?MUlSZmZ4Rldxb0Rpd3F3MG1CMzJiM3hVVkZRNVZwN2RaMkR5VTIwZTJnd0xt?=
 =?utf-8?B?NS9IZVB5TnozbGY1OU1adFpFdzMvQjRZbWdyNWkyWHVwZkJvMUU4ZE81UnYz?=
 =?utf-8?B?RGFqUlJnUHdYb0J5c3pGVXgvN0dYQ2QvSmx1OFRuVCtVVk9uU0E4a1M1NEto?=
 =?utf-8?B?ZFFRcjJiTFAza09yUUdCbjc2cC8wM3hEeFNid1RseTQ3T2s5ajFEMFdsekNr?=
 =?utf-8?B?VjJra0t1QTNGdmNEckhFQm1QS2YzYkxLU2JOcDZPbEt5enhQdnByM09vdStE?=
 =?utf-8?B?Znd2WWg4UTFaVHlCQ1pTUjJRQUdvQjhmREIxS1Jnb015Q0JEakNqTkMyVU53?=
 =?utf-8?B?b0JFRFkwZTN2czBlMjVYamFtbGFrQk44UFBxSFZCU3VYRkErWGhpdDcvdVQ2?=
 =?utf-8?B?RGs5WDIxTlVPYnM1VGw1TjBhdkdDc2g0QVY0b09COGZqMlRGWEJRL05UR04y?=
 =?utf-8?B?YUFJYThRRkFHd2RxWURvdFQ1T3ptc1RyWW51Znk0OEhyejlielFhbHpMWE1j?=
 =?utf-8?B?S0xKS09GVlBFOVVXVjcrT2JhRTNoRkVyYUVQakU4OVhrR2YzaXhybUVMS045?=
 =?utf-8?B?dmllT1JaL2NsZktQbFJGcS9QVjdwOFMzVjZJM1ZvNGkrRVQzcXBnZ2FxcDRR?=
 =?utf-8?B?UVJrT1krcnBpcWxSYkY5dEwyZ1IzUitTVDZLTTFuUlk0NDNsT1lwd2NpV0kv?=
 =?utf-8?B?N2Q3aVZrUlF3TGcwc1d4YUhTMGtsZVdjTy81Yy9wbjZLbElFNERqMDlXcVli?=
 =?utf-8?B?UU1DRk1tY2pKWlVEMy9QYzVqTTI2eXp1ZUtaUFNWekVnOHZ3Y3FhTEVDNTJ3?=
 =?utf-8?B?c21lUUJSdEFjL05oL2pTKzZrZEFIQWlkY3o2ZUVzM2tRQ0U3V2RsaE52RlEr?=
 =?utf-8?B?U0doUytLbUdWeDNXK2NmRFU2S1czVnFybXVnWlRwQUdZODZOd3lLeWdGL1kr?=
 =?utf-8?B?ODJQMEJQNFFMbTRYZ3FQWVBBNVRicThYajNKQnZwTkE3SmdDblEzRjFLYVZk?=
 =?utf-8?B?dkxaRE9qS2VxbFNWSG1nVDgxNXVPYzE0ZmtGbzFuL0RaeWpaS21TY3J2WS9x?=
 =?utf-8?B?cXhUQW9CbkE5clV4RTBCRkkxVDF0dXdPYzlmQ28rVFg1ZGNzSkZUN3J4dmVM?=
 =?utf-8?B?NU9FZS9xU2l5S2hJZ2lQTzRUcWU4Wjl1U09UUEJKTzBpNEdaUEhaQ3R6VXRk?=
 =?utf-8?B?VERWRWRqMVlaR2dVNWdFMEZpcEpwS2phNTE4NmgzK2M5L0R4Q1p6NjZMZVJ4?=
 =?utf-8?B?S05zeDRSalpQdSsrUHliNElKdVN5WCtNNEhMUnFrMU8rWDRKMnpXNW9qWDVV?=
 =?utf-8?B?R21WZEZOTloxZ20yQzBvWVZpaHFMcFJlaDZ5blJsYjduSXJ0NEpvcUhSMVJR?=
 =?utf-8?B?OENnS2NIcWdXbEVSSGJNWEFQbXVQUUF0bWxvbk5nRXRYeHdsb2JxRHhleGk1?=
 =?utf-8?B?MVZUZ1d5UTNXT3N1QytpQitIWDlxT3B6UmNSdVJXU1ZGOWNxdnVFTndjUVZQ?=
 =?utf-8?B?ZWVyam9WL0hRZlV1ZjF4U3A4YkkxeU5zVnRjb0h1VFVQdk9QVEZ1MlM5M2pC?=
 =?utf-8?Q?9oKAidojxAe65CiqIi4h84E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84561952-6263-4be5-5296-08da89d9e90f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 16:17:04.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivv1oNWsE3koK4/BH5Ny1O0IkcN47PBaoiKWCElREEQWaqXa93qfwTiJaA9ncWTstbu0JnSRsK9kr0DJcZVd1Xe0j5oKRuk3dRHnZ66xRz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4472
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

On Fri, Aug 26, 2022 at 02:27:18PM -0700, Matt Roper wrote:
> On client DG2 platforms, optimal performance is achieved with the
> hardware's default "age based" thread execution setting.  However on
> ATS-M, switching this to "round robin after dependencies" provides
> better performance.  We'll add a new "tuning" feature flag to the ATS-M
> device info to enable/disable this setting.
> 
> Bspec: 68331
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 2 ++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++++++++
>  drivers/gpu/drm/i915/i915_pci.c             | 1 +
>  drivers/gpu/drm/i915/intel_device_info.h    | 1 +
>  4 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 94f9ddcfb3a5..d414785003cc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1110,6 +1110,8 @@
>  #define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
>  #define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
>  #define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
> +#define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
> +#define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
>  #define HSW_ROW_CHICKEN3			_MMIO(0xe49c)
>  #define   HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE	(1 << 6)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3cdb8294e13f..ff8c3735abc9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2700,6 +2700,15 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  		       0 /* write-only, so skip validation */,
>  		       true);
>  	}
> +
> +	/*
> +	 * This tuning setting proves beneficial only on ATS-M designs; the
> +	 * default "age based" setting is optimal on regular DG2 and other
> +	 * platforms.
> +	 */
> +	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
> +		wa_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
> +				    THREAD_EX_ARB_MODE_RR_AFTER_DEP);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 857e8bb6865c..26b25d9434d6 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1080,6 +1080,7 @@ static const struct intel_device_info ats_m_info = {
>  	DG2_FEATURES,
>  	.display = { 0 },
>  	.require_force_probe = 1,
> +	.tuning_thread_rr_after_dep = 1,
>  };
>  
>  #define XE_HPC_FEATURES \
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 0ccde94b225f..6904ad03ca19 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -171,6 +171,7 @@ enum intel_ppgtt_type {
>  	func(has_runtime_pm); \
>  	func(has_snoop); \
>  	func(has_coherent_ggtt); \
> +	func(tuning_thread_rr_after_dep); \
>  	func(unfenced_needs_alignment); \
>  	func(hws_needs_physical);
>  
> -- 
> 2.37.2
> 
