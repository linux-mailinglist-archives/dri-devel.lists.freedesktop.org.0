Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE29601404
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F99B10EDB0;
	Mon, 17 Oct 2022 16:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4D210EDAA;
 Mon, 17 Oct 2022 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666025612; x=1697561612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=79XeS596tjuAuKtXlTPq/7t77EBQ9UqAuCwXrntAVG8=;
 b=EJNYs75JCqOZ9U4or5XXmSz83LsUogyUU9BGlqXA4h9P8zxL7GmZgLcq
 liQv0FA7KDr862SzHldI9886gQESraToN8N40bzBSPqGrVeiBEGjns+fl
 BDn3m9m0IbGMv2PCRSObqTsAKDxLLtIkN9zJNHasZtkE4RdoBT/vd7uEt
 iFLNzCBmHPaTjKQCJQEOfFpoberQ187Ic6Y9BFniPloDCDPheXanMng4h
 jBGhgF2diYsZ5PQsM/6nIuCGruleQJXJAeJfbiBTZjas4j1O4oGUEI6fi
 KiAN28uq4ULOWCs4WsZggfuISU7AJreqAA5gUlxW/wbSJE40nbNqKvY1o w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="306937742"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="306937742"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 09:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753699435"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753699435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 09:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 09:53:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 09:53:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 09:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKELq9v88aUpKc3pR8To/KNBx8EkOmla7py3YEMRUdPV+JIADFuGqXTqrCFaSFGdIubfEPLpIeALv3hN7youMP/i3plLuLRh7An77uH1GiZUM9LAdptq0hBWPNXbIJZZAnQcjVcRksVc5O6zfOq3ima2y6hQbdOYpi0tqXl5j0tXe7SSXzEEyYHWRklasVbHwrYwKwCOoSPmZEhBr6ZbhvTgxsfPyT3Ab/c1LWjJg0aoOIeiLfJ10Gptwn3ptiVwdgr59KzwZ1F7NsC75VhKJSmIXgrlQNDOkHt2CYg6Q+P/tkhsUkBkU6O384kF4Cdk4/qH8LEd7c5YmTM4eE+y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHNz6yyi7Mt776TY0kIDYl7cQY1g3R3Zp9KXMqdESJ0=;
 b=c6nkeRKF99onCQhb+WSfXARLeqUBpIdovUzSuUi3PtgKW5o23bpU+GTIy/w8QDIPAy+HI9/Sa7JXLCrCIui9v2uq6YqmQX5p+UQcAWovVTiWwhYUXT/K1i3ZxKSDT7roxtre+n8HcOI7BE1vcgEtfhxbH9uHMaX2+qapRejPrV9b+ReQ4j5ZjLsVrXft4byNaxqZKKghSeDWOnsoIvjbg06mclmK7hZNpZa4IAF+NXx+Mi4Z4jbVWfvlHB5J8gFhVJGgstKxtWBpsrRAkzh0P+C4BEPcB7cEUcUlqwV7vgr2OZGOd4cqU7WOIDyVZCmsREmEMQ8AaGBinXRMJTN0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 16:53:27 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:53:27 +0000
Date: Mon, 17 Oct 2022 22:23:19 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/14] drm/i915: Define MCR registers explicitly
Message-ID: <Y02IfxzoylD3dgbn@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::35) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 897dd940-61bd-4e55-7850-08dab0601c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/h2TaID/RTlBHfhw3eHWSdJcSxq6FgofnylosFDsm7V7yffSz2ZWYwRZgahMBmEEzPK20mTunVMtyLRIR+dYB7nXW9NpMJ8CoKURfGwPsSLh42ofR4THuiBURcY1X+5wtWp+x/yPB1QziTdrCqunYfOgy8nLUQPhhCx71Y1HFKS4lGjxrSs9+3+7JMz5menpxzIZREr5FZFI9/zGuj1GsiMvAAuv2HFyYASzx1ts+p/4NoBFbf60DnH1rvbbaYqflvNYxZ/JzCgUGKYwF4OUkXuzryzS4gSfUKJ3QZP78MiicW0K1h4h3tW6mvtuNc00uC/x0SKkQSXYEMYY6KorAxH/50vnkg7Iws75A0zk623f1dekEdgGXK2/81ZxoxuoGmgBVnptbeqqi6o61qxiksoJYV/rPSMnnR+bAEucE/nPouSQY0IeTjUfgJYj2AMolaaAczU122fYoKYQu/St/K2PmHazxNBNSyP+/20sUj9OP8FUYcik3rCEAlGZiYva4E3vfJQb073Y3BD4o/XK5kowyxIsjmZIoco8awPvzCnNbFfv0ReSAr3kWTcSXWmu8Fv6bYATFbhD3ycPKiHEJPcQF5RVh7mXcyhIDD7KCFlkO84XDLrTs6cJaw7D7WL/bpK+A77tTLRon4ZTkAwlOQ5jvG8kRI7uXmkuNzbG6H9VznNwrGI8vtI6+Egv4E6noYzIiy2H7e2i3HfvJbMEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(4326008)(5660300002)(44832011)(30864003)(66476007)(66556008)(41300700001)(66946007)(8676002)(316002)(6486002)(478600001)(6506007)(53546011)(26005)(6512007)(9686003)(186003)(2906002)(8936002)(83380400001)(82960400001)(33716001)(66574015)(38100700002)(6666004)(450100002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVDT2ppTHo0T3RERjFTWDFMV05jRXNQMTFqTjhQWVBXYnRLUHlyTHljUExy?=
 =?utf-8?B?eDF0U3djejh1MG51ZmJzbmk1dWtKeGNrTjBjNUFaSEtPd3YzRmd0bXdQRm02?=
 =?utf-8?B?bFpoYncvVGN1VTF6eEJQY2p1emRPU005dVpqWUxnYkpqNnVtL1hRUk8zSG5B?=
 =?utf-8?B?eUgvVllHQlM0UDhJYWtQNTdpd2lZOUxweVp5bzVKQjFuL2VTSnU2VWE2czd3?=
 =?utf-8?B?T0lyeWFnT3N6VXVkaDRlT05uMXZ5M0p4ck1SQ2s0YnAwTXdHV0R2Rldaa3k0?=
 =?utf-8?B?S3V2a0kvWXdOaVAwT3FtN3dqdmJmS0tvZU83blAxT3VaUzRRaURjanV6eEdL?=
 =?utf-8?B?eFgvS21TZTBLdG44Sk9NUHpGKzdNdSticUlQWE9mTkpJSlJwYWpETXEyUHda?=
 =?utf-8?B?T2FORURNTlNqQXZyTUlGQ1RDd1FpMDFmdEhmOHM1d0hWemZYeFRZYnlWcy8v?=
 =?utf-8?B?UG5uYTNCRGEwQnhSS043TmZoemhkdGI2NXVpdDdRZHRtTWNMRlB6bW94TndQ?=
 =?utf-8?B?alp1Q2w5dmxDeFBuc3hyLzFnVWptWHlJRnYxcHBWamF0MlhNcEpjZTdFQ0FV?=
 =?utf-8?B?c2RFWWxQcFdxM2VaaXBNcDBBYjhBVkJ4cHg4Z1hkUDFJT1hjWXJiRXhuUTdV?=
 =?utf-8?B?U0xINVJONmJia1pKNVFrbmQ4V0NaRmRKYlgrT2ZFU0owVmlTOHBaK1d1NHZv?=
 =?utf-8?B?aTZOUllGbEIwUTBad3JBTm1zRjRxeDJUUCtzWlBvYjB1cGttaFJnanhFTXUr?=
 =?utf-8?B?SGxXdmZYMEdDY3B2TWRkc3hMUEZ2RUkyb1I3enQzUVg2UjFYOWxKMkJCMDYr?=
 =?utf-8?B?U204VURkbGkyTmZpbnkzVSt5WThyUHRVb0VJT3k5d0F0ZnkwVExIR21jTHAx?=
 =?utf-8?B?cXl6NDNMeStPaU9oVVBZdzIzUWtUYnp4NlhWZkRXb20wN29tbmxCakZ0NmNp?=
 =?utf-8?B?VHVVTnRZYTlhVUc1aFQ5TW5rYnJyekkzUjRuSWRNMVZLbTROWUFIa2Z4L0dD?=
 =?utf-8?B?blJnSTZVSnRxOGtQa1d2SUpWSStyTXVSZlZubUVyZW1VOFZqRVJoWjJaNlhL?=
 =?utf-8?B?Q2ZlZGZ3dEVxdVFzamdSK2ZqVDl5QmQvN3BzN2JmWnNWYkhxcU1mRW5mWjdF?=
 =?utf-8?B?dnRmWTJwZjNSV3NadXdMUmx6YXlQUmpSSDN5RFdheDVSM1lKQk96ZjZDYmk0?=
 =?utf-8?B?TTh5VGlHZHA3ZG8vNUJYdEFVNk9nRXFUWk45VDRESm5XTDRuS0N5WmxjL1Vs?=
 =?utf-8?B?Z041R3B0TGRMcmVwSzRIbEk5OWVsY0hhdEhRdWxkWm5zMDZVT0VHaEhKWFlO?=
 =?utf-8?B?UVVCdmUrZlM1dEt0SXNSMVJ4d3Q0a1BvK29FdE1DZ3NsMXdWS3d0WmxNUnk3?=
 =?utf-8?B?MkovczlzbHNOTGhUR3VGU0djNnhiVWZhUldDWG9uNUVoTXNJeEVpRnBkZ29r?=
 =?utf-8?B?MGxrWCtCVVBBMU8rWksvdmlTOHpMMjI1Z2tUM3V6WmU5Qlk1ZWt6c0d6VWli?=
 =?utf-8?B?QlI3QzRzRldKeFRudUdqQzFwYlpiWDJRZnE0TGIrS09Hc1YrT0htSDF4d2lj?=
 =?utf-8?B?alNvdGkvQ29pSklFcnFWeHhoOGRoY012WWluTWsxOUwxVzBsQlJ2YlhIR2w2?=
 =?utf-8?B?anhvRmZqdWdxUVJuM2dVTHJ6cFV5Zlk4KzlkbkhGY0hBcTR1VjNlSFVJOVc2?=
 =?utf-8?B?OC9mQmtuUnRkcWd3ZHJNMlV3VlRGdlNkeTFOZ2FEcFYvNjlSK0F6dGZ5TEdO?=
 =?utf-8?B?UnNEN0ZPaTJCRUo1bWpqZkIrYi9oTW9RLzNlREdVWkRRaDhOSnVyc1VUSjlr?=
 =?utf-8?B?K1M0enNldHlPU0FIRWt1S3hEQUpmNmFQWTFIdUprdGJNZER2MHMxNkk0NHRM?=
 =?utf-8?B?RTJDMGprUWJSTlY4R0c2VkZHNU9kc3V6MFRaTFNCMGtBV0lsUW1xZlNLNkNY?=
 =?utf-8?B?Y2NhMG5XYkdEUnhnMHlDejQ2UUlXSy9OWngwYnRldVV3UUlVcjhSay8wTmFM?=
 =?utf-8?B?Wm94bjBYNlBUS2JLeEtzc1RSMTByMmdqZnF3S2VaYmtIWmJxaFcrVGdMN1dN?=
 =?utf-8?B?OEdYZEUyRXNhSm5JM0J0RmphRjFkRWJLcTlBYXlSRU9jaW5tVHRxa3FBM0p0?=
 =?utf-8?B?UDF4aWIrVTNGczdic1ZvMlhkVWhJR0Z1Mk1ZMkZTUnFBMUMxekU5UHRLSEVl?=
 =?utf-8?Q?gEj1IredR3ND6qqjGVqHRvY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 897dd940-61bd-4e55-7850-08dab0601c6e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:53:27.0603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNg4egJ5Xfe8OJs+2/U7hjkFrX45vNMIYcxoRW9e0HWa8j+LcYI1xW2mcNLdXaspMYs/hkeMGZLSkNeP9P7xGEa8nOvL+0HmdQ4+KDS2wcpgIFtc23SPAyKGoHXawrkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On 14.10.2022 16:02, Matt Roper wrote:
> Rather than using the same _MMIO() macro to define MCR registers as
> singleton registers, let's use a new MCR_REG() macro to make it clear
> that these registers are special and should be handled accordingly.  For
> now MCR_REG() will still generate an i915_reg_t with the given offset,
> but we'll change that in future patches.
> 
> Bspec: 66673, 66696, 66534, 67609
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 134 ++++++++++++------------
>  1 file changed, 68 insertions(+), 66 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 890960b56b9e..ad9985015b0e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -8,6 +8,8 @@
>  
>  #include "i915_reg_defs.h"
>  
> +#define MCR_REG(offset)	_MMIO(offset)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
>  #define   GEN9_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> @@ -333,12 +335,12 @@
>  #define GEN7_TLB_RD_ADDR			_MMIO(0x4700)
>  
>  #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> -#define XEHP_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +#define XEHP_PAT_INDEX(index)			MCR_REG(0x4800 + (index) * 4)
>  
> -#define XEHP_TILE0_ADDR_RANGE			_MMIO(0x4900)
> +#define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
>  #define   XEHP_TILE_LMEM_RANGE_SHIFT		8
>  
> -#define XEHP_FLAT_CCS_BASE_ADDR			_MMIO(0x4910)
> +#define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>  #define   XEHP_CCS_BASE_SHIFT			8
>  
>  #define GAMTARBMODE				_MMIO(0x4a08)
> @@ -388,18 +390,18 @@
>  #define CHICKEN_RASTER_2			_MMIO(0x6208)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> -#define VFLSKPD					_MMIO(0x62a8)
> +#define VFLSKPD					MCR_REG(0x62a8)
>  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
>  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
>  
>  #define GEN12_FF_MODE2				_MMIO(0x6604)
> -#define XEHP_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				MCR_REG(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> -#define XEHPG_INSTDONE_GEOM_SVG			_MMIO(0x666c)
> +#define XEHPG_INSTDONE_GEOM_SVG			MCR_REG(0x666c)
>  
>  #define CACHE_MODE_0_GEN7			_MMIO(0x7000) /* IVB+ */
>  #define   RC_OP_FLUSH_ENABLE			(1 << 0)
> @@ -448,14 +450,14 @@
>  #define GEN8_HDC_CHICKEN1			_MMIO(0x7304)
>  
>  #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> -#define XEHP_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> +#define XEHP_COMMON_SLICE_CHICKEN3		MCR_REG(0x7304)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
>  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
>  #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
>  
>  #define GEN9_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> -#define XEHP_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
> +#define XEHP_SLICE_COMMON_ECO_CHICKEN1		MCR_REG(0x731c)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
>  #define   GEN11_STATE_CACHE_REDIRECT_TO_CS	(1 << 11)
>  
> @@ -486,7 +488,7 @@
>  
>  #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
>  
> -#define XEHP_SQCM				_MMIO(0x8724)
> +#define XEHP_SQCM				MCR_REG(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
>  #define HSW_IDICR				_MMIO(0x9008)
> @@ -647,7 +649,7 @@
>  #define GEN7_MISCCPCTL				_MMIO(0x9424)
>  #define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
>  
> -#define GEN8_MISCCPCTL				_MMIO(0x9424)
> +#define GEN8_MISCCPCTL				MCR_REG(0x9424)
>  #define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
>  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
>  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
> @@ -703,7 +705,7 @@
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
>  #define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> -#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
>  #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
>  #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
>  #define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> @@ -711,27 +713,27 @@
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  
> -#define SCCGCTL94DC				_MMIO(0x94dc)
> +#define SCCGCTL94DC				MCR_REG(0x94dc)
>  #define   CG3DDISURB				REG_BIT(14)
>  
>  #define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
>  #define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
>  #define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
>  
> -#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
> +#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	MCR_REG(0x9524)
>  #define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
>  #define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
>  
> -#define SUBSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x9528)
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE2		MCR_REG(0x9528)
>  #define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
>  
> -#define SSMCGCTL9530				_MMIO(0x9530)
> +#define SSMCGCTL9530				MCR_REG(0x9530)
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>  
> -#define GEN10_DFR_RATIO_EN_AND_CHICKEN		_MMIO(0x9550)
> +#define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
>  #define   DFR_DISABLE				(1 << 9)
>  
> -#define INF_UNIT_LEVEL_CLKGATE			_MMIO(0x9560)
> +#define INF_UNIT_LEVEL_CLKGATE			MCR_REG(0x9560)
>  #define   CGPSF_CLKGATE_DIS			(1 << 3)
>  
>  #define MICRO_BP0_0				_MMIO(0x9800)
> @@ -943,7 +945,7 @@
>  
>  /* MOCS (Memory Object Control State) registers */
>  #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> -#define XEHP_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)
> +#define XEHP_LNCFCMOCS(i)			MCR_REG(0xb020 + (i) * 4)
>  #define LNCFCMOCS_REG_COUNT			32
>  
>  #define GEN7_L3CNTLREG3				_MMIO(0xb024)
> @@ -960,10 +962,10 @@
>  #define GEN7_L3LOG(slice, i)			_MMIO(0xb070 + (slice) * 0x200 + (i) * 4)
>  #define   GEN7_L3LOG_SIZE			0x80
>  
> -#define XEHP_L3NODEARBCFG			_MMIO(0xb0b4)
> +#define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> -#define GEN8_L3SQCREG1				_MMIO(0xb100)
> +#define GEN8_L3SQCREG1				MCR_REG(0xb100)
>  /*
>   * Note that on CHV the following has an off-by-one error wrt. to BSpec.
>   * Using the formula in BSpec leads to a hang, while the formula here works
> @@ -974,28 +976,28 @@
>  #define   L3_HIGH_PRIO_CREDITS(x)		(((x) >> 1) << 14)
>  #define   L3_PRIO_CREDITS_MASK			((0x1f << 19) | (0x1f << 14))
>  
> -#define GEN8_L3SQCREG4				_MMIO(0xb118)
> +#define GEN8_L3SQCREG4				MCR_REG(0xb118)
>  #define   GEN11_LQSC_CLEAN_EVICT_DISABLE	(1 << 6)
>  #define   GEN8_LQSC_RO_PERF_DIS			(1 << 27)
>  #define   GEN8_LQSC_FLUSH_COHERENT_LINES	(1 << 21)
>  #define   GEN8_LQSQ_NONIA_COHERENT_ATOMICS_ENABLE	REG_BIT(22)
>  
> -#define GEN9_SCRATCH1				_MMIO(0xb11c)
> +#define GEN9_SCRATCH1				MCR_REG(0xb11c)
>  #define   EVICTION_PERF_FIX_ENABLE		REG_BIT(8)
>  
> -#define BDW_SCRATCH1				_MMIO(0xb11c)
> +#define BDW_SCRATCH1				MCR_REG(0xb11c)
>  #define   GEN9_LBS_SLA_RETRY_TIMER_DECREMENT_ENABLE	(1 << 2)
>  
> -#define GEN11_SCRATCH2				_MMIO(0xb140)
> +#define GEN11_SCRATCH2				MCR_REG(0xb140)
>  #define   GEN11_COHERENT_PARTIAL_WRITE_MERGE_ENABLE	(1 << 19)
>  
> -#define XEHP_L3SQCREG5				_MMIO(0xb158)
> +#define XEHP_L3SQCREG5				MCR_REG(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> -#define MLTICTXCTL				_MMIO(0xb170)
> +#define MLTICTXCTL				MCR_REG(0xb170)
>  #define   TDONRENDER				REG_BIT(2)
>  
> -#define XEHP_L3SCQREG7				_MMIO(0xb188)
> +#define XEHP_L3SCQREG7				MCR_REG(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
>  #define XEHPC_L3SCRUB				_MMIO(0xb18c)
> @@ -1003,7 +1005,7 @@
>  #define   SCRUB_RATE_PER_BANK_MASK		REG_GENMASK(2, 0)
>  #define   SCRUB_RATE_4B_PER_CLK			REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
>  
> -#define L3SQCREG1_CCS0				_MMIO(0xb200)
> +#define L3SQCREG1_CCS0				MCR_REG(0xb200)
>  #define   FLUSHALLNONCOH			REG_BIT(5)
>  
>  #define GEN11_GLBLINVL				_MMIO(0xb404)
> @@ -1028,14 +1030,14 @@
>  #define GEN9_BLT_MOCS(i)			_MMIO(__GEN9_BCS0_MOCS0 + (i) * 4)
>  
>  #define GEN12_FAULT_TLB_DATA0			_MMIO(0xceb8)
> -#define XEHP_FAULT_TLB_DATA0			_MMIO(0xceb8)
> +#define XEHP_FAULT_TLB_DATA0			MCR_REG(0xceb8)
>  #define GEN12_FAULT_TLB_DATA1			_MMIO(0xcebc)
> -#define XEHP_FAULT_TLB_DATA1			_MMIO(0xcebc)
> +#define XEHP_FAULT_TLB_DATA1			MCR_REG(0xcebc)
>  #define   FAULT_VA_HIGH_BITS			(0xf << 0)
>  #define   FAULT_GTT_SEL				(1 << 4)
>  
>  #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
> -#define XEHP_RING_FAULT_REG			_MMIO(0xcec4)
> +#define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
>  #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>  #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
>  #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
> @@ -1043,21 +1045,21 @@
>  #define   RING_FAULT_VALID			(1 << 0)
>  
>  #define GEN12_GFX_TLB_INV_CR			_MMIO(0xced8)
> -#define XEHP_GFX_TLB_INV_CR			_MMIO(0xced8)
> +#define XEHP_GFX_TLB_INV_CR			MCR_REG(0xced8)
>  #define GEN12_VD_TLB_INV_CR			_MMIO(0xcedc)
> -#define XEHP_VD_TLB_INV_CR			_MMIO(0xcedc)
> +#define XEHP_VD_TLB_INV_CR			MCR_REG(0xcedc)
>  #define GEN12_VE_TLB_INV_CR			_MMIO(0xcee0)
> -#define XEHP_VE_TLB_INV_CR			_MMIO(0xcee0)
> +#define XEHP_VE_TLB_INV_CR			MCR_REG(0xcee0)
>  #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
> -#define XEHP_BLT_TLB_INV_CR			_MMIO(0xcee4)
> +#define XEHP_BLT_TLB_INV_CR			MCR_REG(0xcee4)
>  #define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
> -#define XEHP_COMPCTX_TLB_INV_CR			_MMIO(0xcf04)
> +#define XEHP_COMPCTX_TLB_INV_CR			MCR_REG(0xcf04)
>  
> -#define XEHP_MERT_MOD_CTRL			_MMIO(0xcf28)
> -#define RENDER_MOD_CTRL				_MMIO(0xcf2c)
> -#define COMP_MOD_CTRL				_MMIO(0xcf30)
> -#define VDBX_MOD_CTRL				_MMIO(0xcf34)
> -#define VEBX_MOD_CTRL				_MMIO(0xcf38)
> +#define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
> +#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> +#define COMP_MOD_CTRL				MCR_REG(0xcf30)
> +#define VDBX_MOD_CTRL				MCR_REG(0xcf34)
> +#define VEBX_MOD_CTRL				MCR_REG(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>  
>  #define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
> @@ -1072,52 +1074,52 @@
>  #define GEN12_GAM_DONE				_MMIO(0xcf68)
>  
>  #define GEN7_HALF_SLICE_CHICKEN1		_MMIO(0xe100) /* IVB GT1 + VLV */
> -#define GEN8_HALF_SLICE_CHICKEN1		_MMIO(0xe100)
> +#define GEN8_HALF_SLICE_CHICKEN1		MCR_REG(0xe100)
>  #define   GEN7_MAX_PS_THREAD_DEP		(8 << 12)
>  #define   GEN7_SINGLE_SUBSCAN_DISPATCH_ENABLE	(1 << 10)
>  #define   GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE	(1 << 4)
>  #define   GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE	(1 << 3)
>  
>  #define GEN7_SAMPLER_INSTDONE			_MMIO(0xe160)
> -#define GEN8_SAMPLER_INSTDONE			_MMIO(0xe160)
> +#define GEN8_SAMPLER_INSTDONE			MCR_REG(0xe160)
>  #define GEN7_ROW_INSTDONE			_MMIO(0xe164)
> -#define GEN8_ROW_INSTDONE			_MMIO(0xe164)
> +#define GEN8_ROW_INSTDONE			MCR_REG(0xe164)
>  
> -#define HALF_SLICE_CHICKEN2			_MMIO(0xe180)
> +#define HALF_SLICE_CHICKEN2			MCR_REG(0xe180)
>  #define   GEN8_ST_PO_DISABLE			(1 << 13)
>  
>  #define HSW_HALF_SLICE_CHICKEN3			_MMIO(0xe184)
> -#define GEN8_HALF_SLICE_CHICKEN3		_MMIO(0xe184)
> +#define GEN8_HALF_SLICE_CHICKEN3		MCR_REG(0xe184)
>  #define   HSW_SAMPLE_C_PERFORMANCE		(1 << 9)
>  #define   GEN8_CENTROID_PIXEL_OPT_DIS		(1 << 8)
>  #define   GEN9_DISABLE_OCL_OOB_SUPPRESS_LOGIC	(1 << 5)
>  #define   GEN8_SAMPLER_POWER_BYPASS_DIS		(1 << 1)
>  
> -#define GEN9_HALF_SLICE_CHICKEN5		_MMIO(0xe188)
> +#define GEN9_HALF_SLICE_CHICKEN5		MCR_REG(0xe188)
>  #define   GEN9_DG_MIRROR_FIX_ENABLE		(1 << 5)
>  #define   GEN9_CCS_TLB_PREFETCH_ENABLE		(1 << 3)
>  
> -#define GEN10_SAMPLER_MODE			_MMIO(0xe18c)
> +#define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>  
> -#define GEN9_HALF_SLICE_CHICKEN7		_MMIO(0xe194)
> +#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>  #define   GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR	REG_BIT(8)
>  #define   GEN9_ENABLE_YV12_BUGFIX		REG_BIT(4)
>  #define   GEN9_ENABLE_GPGPU_PREEMPTION		REG_BIT(2)
>  
> -#define GEN10_CACHE_MODE_SS			_MMIO(0xe420)
> +#define GEN10_CACHE_MODE_SS			MCR_REG(0xe420)
>  #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
>  #define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
>  #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
> -#define EU_PERF_CNTL0				_MMIO(0xe458)
> -#define EU_PERF_CNTL4				_MMIO(0xe45c)
> +#define EU_PERF_CNTL0				MCR_REG(0xe458)
> +#define EU_PERF_CNTL4				MCR_REG(0xe45c)
>  
> -#define GEN9_ROW_CHICKEN4			_MMIO(0xe48c)
> +#define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
>  #define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
> @@ -1129,7 +1131,7 @@
>  #define HSW_ROW_CHICKEN3			_MMIO(0xe49c)
>  #define   HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE	(1 << 6)
>  
> -#define GEN8_ROW_CHICKEN			_MMIO(0xe4f0)
> +#define GEN8_ROW_CHICKEN			MCR_REG(0xe4f0)
>  #define   FLOW_CONTROL_ENABLE			REG_BIT(15)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> @@ -1141,39 +1143,39 @@
>  
>  #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
>  
> -#define GEN8_ROW_CHICKEN2			_MMIO(0xe4f4)
> +#define GEN8_ROW_CHICKEN2			MCR_REG(0xe4f4)
>  #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
>  #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  
> -#define RT_CTRL					_MMIO(0xe530)
> +#define RT_CTRL					MCR_REG(0xe530)
>  #define   DIS_NULL_QUERY			REG_BIT(10)
>  #define   STACKID_CTRL				REG_GENMASK(6, 5)
>  #define   STACKID_CTRL_512			REG_FIELD_PREP(STACKID_CTRL, 0x2)
>  
> -#define EU_PERF_CNTL1				_MMIO(0xe558)
> -#define EU_PERF_CNTL5				_MMIO(0xe55c)
> +#define EU_PERF_CNTL1				MCR_REG(0xe558)
> +#define EU_PERF_CNTL5				MCR_REG(0xe55c)
>  
> -#define XEHP_HDC_CHICKEN0			_MMIO(0xe5f0)
> +#define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
>  #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> -#define ICL_HDC_MODE				_MMIO(0xe5f4)
> +#define ICL_HDC_MODE				MCR_REG(0xe5f4)
>  
> -#define EU_PERF_CNTL2				_MMIO(0xe658)
> -#define EU_PERF_CNTL6				_MMIO(0xe65c)
> -#define EU_PERF_CNTL3				_MMIO(0xe758)
> +#define EU_PERF_CNTL2				MCR_REG(0xe658)
> +#define EU_PERF_CNTL6				MCR_REG(0xe65c)
> +#define EU_PERF_CNTL3				MCR_REG(0xe758)
>  
> -#define LSC_CHICKEN_BIT_0			_MMIO(0xe7c8)
> +#define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> -#define LSC_CHICKEN_BIT_0_UDW			_MMIO(0xe7c8 + 4)
> +#define LSC_CHICKEN_BIT_0_UDW			MCR_REG(0xe7c8 + 4)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
>  #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
>  #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  
> -#define SARB_CHICKEN1				_MMIO(0xe90c)
> +#define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
>  #define GEN7_ROW_CHICKEN2_GT2			_MMIO(0xf4f4)
> -- 
> 2.37.3
> 
