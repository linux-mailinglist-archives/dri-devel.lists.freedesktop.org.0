Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF359A679
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3911E10E832;
	Fri, 19 Aug 2022 19:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2C710E832;
 Fri, 19 Aug 2022 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660937493; x=1692473493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CeHfslmriAOcp7HVUTGG+UrlSrqDYir18Tl70FzbOxg=;
 b=cyda269BRYYyndrKUMYw786dtJ//ZLHCMZMrDg7iKsin2sqvP2KHRI1T
 +MV8ti7JmbvEKt3s7SQj38f5n37oGO8UBXEyNQkm2JTGeCdI4WEGUJy0l
 IHnmlqUoK9PTiChyNQxuOZvFTuA0HPkE6ATJehlbQ/YHpaNuD5woZBlJv
 5ritVg2SRHzgCE5WMOCkUBgoUb11vlj67gXVGF+YLiFuwY1n7aVmXun69
 bpo7wHEr7N4unT0MCZdagi4PYH3GsyhzCJk3Eu3Ldk0Xxf1m4stTki+O2
 gI5XSz8CjNEzhHlzSd/3EwSwIehGq/HF2Whi52Mq+fhsI03PwDj9uBilJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="294359281"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="294359281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 12:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="608311029"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2022 12:31:33 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:31:32 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:31:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 12:31:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 12:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+RHmAzJr3dbXV45rP4mNGKDfNe0MW5L6/M/vIl8ww0s4DRSMy9+B3HysnExfPGoCXHzFD6na/6rD01lkuoFal6qLsoKqxOgiMEScjklCPmCImG3h3Rr2R9Gj5CVicp5/TW3XiqPj55kQuZ8MJDa9p6SMY8vCIw4w8xRZsechz6IxxeImcx5cCtdH+kJdwd3/FSckFAqVdOT/EuLsLWqoVnc7m9vgPLJxJSH9sypiYBoy+80BUX+wCaF/RRcZGmZlsMkoQMVzvrVr9M6cjwNwBa/czNj3Fm9D+ND3+uxQ5swBiPJWEPh04HDXkLWzTs1RNzqSR8IyIL9v2IRq76k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDn7OLgzjkhIP2kCGuTF54xKcX+p79U6JqOLT1ii1Lw=;
 b=C690PYu3CrVbqjGmRtwXJkVq7BQ67Zi0t3zpnzmato94zxSGzaYY/K2FYO1LLlsfU+64y3WdYuqUV0Hu2FG5CJqRHVb1Vrl0YVQCep6ZpoBCLPxXSzBonS9CwblrdCiBE+Drhgj65/U7TZzBr8Xx5NizfWUTZ93KphXt7VphTVUDOxCCIx2epi4SpBUHTgkQuPgWScebQDIHFDca9+/yNfl/XeDpJZeMRSCycR5iOIlOMElRz+uUz/5wOWhqQ3lvKr/K8LDiQFR9bWY40XQiNGPaigSvhj2ATUN/f1JKcRLXzkaofn6SrftFZRKlkdaBeN8R8UhKNG+W9ayBw4qtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SN6PR11MB2926.namprd11.prod.outlook.com (2603:10b6:805:ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 19:31:30 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5525.019; Fri, 19 Aug
 2022 19:31:29 +0000
Date: Fri, 19 Aug 2022 12:31:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 14/21] drm/i915/mtl: memory latency data from
 LATENCY_LPX_LPY for WM
Message-ID: <Yv/lDjlubx2K8qjO@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-15-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-15-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::26) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318c8bf3-6d2c-494f-1f62-08da82196a29
X-MS-TrafficTypeDiagnostic: SN6PR11MB2926:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvbDdzq/7J2BErPMJcEjkoYuS9zMTauWBUDc0orKGt3t70A7U6df/MY1j+3UKBvTwnN4BvuE48FqAQxRr4hWEWMPVznvbML9NTBsa7Jl4HfUgW7mVnyEy79aEg6Dib/VTYhF0xtnEK9USoJLt1zwiGQur29i6zhIcV/BV5wiK5QZqzizYS/O5Byx11WAaGGG03TzSI1buQinZtzqwmEdLenWRrYsD9vzwS+v23GJVhEA5cuR6BhxhLpS8MPKyg6Kq/9jqYEJJM4JjkU1zZUP/mYIQKj536UGsJz2y+5e21mpLAvfxvZI/JNlGasFAz5spK+XIfq2bBgJIAtDp2PLDjVvdeHS6NbVfxsARzm1Nlcu5AkdP0rEwXQcmwIVIDXWajLZkk/419ad81UIlaf10kTloZTj/guMYIW5L2tetDWE4BQZyvuOGYZc7hMmN4J2RRWnSvrmmOVIBGOIGw/kuAnXj5e/0HiAFBzKVk6jYKgEhZTEgoBKN5cpONAjIeS7NRaPuRKt9Cjtev6188ktqJMNznRHyMhTy7NPIFypCQGilWMiUW6niuzJjxZsttH0oSKK3PFVeFprZKASo4DW0wTvqWJfxqu+UgzhuiRRb45JLT/ZMvZwZMelwlq0oFn0gVGH6fAHFr73ARh3+g9EgpuRbdffcBzxowen/oDWphCu+HVTgTWjeTj3PmO1TNaRH/ub4LHTSlCRfFMK7hNOKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(136003)(366004)(396003)(346002)(6512007)(186003)(83380400001)(4326008)(5660300002)(8676002)(2906002)(41300700001)(478600001)(6486002)(26005)(6666004)(6506007)(82960400001)(86362001)(8936002)(66556008)(66476007)(6862004)(316002)(66946007)(6636002)(38100700002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KzR9N5ENzVnImCyyKLb0yLzjgFzP/ay4iLBGkbvmWNEFH3cPKT7Ae/oLD6OH?=
 =?us-ascii?Q?z1N+ppkfRrK0GwLZVpJblHSwFkgk5dZURt49YYe00cnbK0We8YEi/csT7wWD?=
 =?us-ascii?Q?rhzYeclTsFMlgQomBXDWotPh9iIU0Sr8SRmi+Wa5YxbyJUo+XA720AEcqEB+?=
 =?us-ascii?Q?+zfJS6Ct+vMloAaCeU5BjX7lYJ5oSKwC5jqmahKXJrlX3IfizLvfmobAynmU?=
 =?us-ascii?Q?KqMbzNMOfyAzJi0YzA07LtEbtzHZS8HJc8pOuJEzAWf8tL7EgigTlRfGFfSp?=
 =?us-ascii?Q?QKPGXUghQH22jZEh+ynWJmKJe5136rsfIn+RV5PFBxyHdMdGwBCZqN3s8prN?=
 =?us-ascii?Q?K2BJt6x/2enU0hLPSLjF+rfqhyxEG0HWyvSh6lGQ9jUfOLrkK7ED3Izy8ktg?=
 =?us-ascii?Q?RRmgOL4pbEwE+/xKxOs0VK/tO7mS89mwnZ9KpssUzih4+idmEfzjIyMJLEZ8?=
 =?us-ascii?Q?rOL8qQGM3MouJ6V2rY37XuyCtoY9DRqFOA9hD1QRxsAukC0FhzMFItE+/3s8?=
 =?us-ascii?Q?5Y08QhqqZE5JQSqIwhmICAjtPxxHKwDSK6OHfiRf+wFqLwCm/ZqLeiJDCkIa?=
 =?us-ascii?Q?qQWGp5zK0235ab1Uj0YBGxR2WMf3BmMk/qZhJowcjrGRmR+7HSiOL6vSrzEm?=
 =?us-ascii?Q?WPOrSNQgEUyZwLUEirgCejXcCNdb5GdCsz+t2llM2fosOrOeM/EkqYht0wlS?=
 =?us-ascii?Q?MMHmlV3JdjHdH7QG9OledcgNuMXDB5LzKgCT3afB8BpNw1cPR2f8f5ScHct9?=
 =?us-ascii?Q?0Ygj9bCe8RwhwFimXUB0sEm5TcxQpXYNnyM65w4XGnBtq4XG0y/MgDtNW6Lq?=
 =?us-ascii?Q?rnw5Go1AVjESEpQj69L1jyRq1sORKa+O6yAL30F8j6AlGgIjyUdiSWcxl7j0?=
 =?us-ascii?Q?F2Z3X1Z6e7BFQmLRu63UI6//hDci+vElikzwCgwQACy6hTkofh4Nlim+k0yS?=
 =?us-ascii?Q?AANJWr3g6WvzQ3OKn2BNfqzFi9DZ1Gp1WWiGNC8cIGCqdypzYl35tHexEOhy?=
 =?us-ascii?Q?7czGdJNvmojL5l95hGp8if+LO0MCdNsl+S0tGCq33VmdW1opysjqgGV4QzmO?=
 =?us-ascii?Q?VzMZoayQlyoynE3DO+QwMslmFLLv6EGrhe4vwCD0s6sebZQP8qoCr89wAKc0?=
 =?us-ascii?Q?CZbYgUVaPgWSQEbkAnT0Rqk1kcIf6u4peOanG3bBXDU3K7d2/icqZ/Gmg/Dh?=
 =?us-ascii?Q?Oe6NGLK01O4lNw00LRveq0SJrT2RHYuY57dImT+ftLDx8bZPeSymRgDNxsTD?=
 =?us-ascii?Q?FvRNRr5sybCFbbCJwvjIiqUVLVlRUhWKo6ojLOlYJqGol9cZTDvhbwaC6qrW?=
 =?us-ascii?Q?bDhOMoHvqjpUy7B4ITdgSfDxVxPWIPf2bFy0rOGXS/Bl5PC85VBFPLRPJaDK?=
 =?us-ascii?Q?WjKXSi6r2j8RFnny81g6/tPpkH8In5cPlmdbPVAQ5I8D6FOmb1tKFJileV0W?=
 =?us-ascii?Q?XPFP/PC/RHeiViGGPs6WKJ9dkYojIn8Fwtq5z/PX0f/VKPTYRu7Hv3/uS6JI?=
 =?us-ascii?Q?jP+kOJ7Zva0lxJxPIzSTbFQYVCach5UC1pXIZwj4Qukz91r7201MGUj93+fd?=
 =?us-ascii?Q?/b7U2srJg4sHMQyAZT26P8VDmjdTgi+4rL41PCwnua2MJ69LbeCmCg0vsybk?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 318c8bf3-6d2c-494f-1f62-08da82196a29
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 19:31:29.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ucrg66nLg80WbQa5AEU03eBQeUFQ9kQFJUM9zNiZGl3BAlNsrpxLJkHrPZys3+UQAzbBM6MuCh4949J0QYYRHWfQBmVgWhgSbxKzOafG260=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2926
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 04:41:55PM -0700, Radhakrishna Sripada wrote:
> Since Xe LPD+, Memory latency data are in LATENCY_LPX_LPY registers
> instead of GT driver mailbox.
> 
> v2: Use the extracted wm latency adjustment function(Matt)
> 
> Bspec: 64608
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h |  7 +++++++
>  drivers/gpu/drm/i915/intel_pm.c | 21 ++++++++++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 04a269fa8717..b2d5e1230c25 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8390,4 +8390,11 @@ enum skl_power_gate {
>  #define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
>  
>  #define MTL_MEDIA_GSI_BASE		0x380000
> +
> +#define MTL_LATENCY_LP0_LP1		_MMIO(0x45780)
> +#define MTL_LATENCY_LP2_LP3		_MMIO(0x45784)
> +#define MTL_LATENCY_LP4_LP5		_MMIO(0x45788)
> +#define  MTL_LATENCY_LEVEL0_2_4_MASK	REG_GENMASK(12, 0)
> +#define  MTL_LATENCY_LEVEL1_3_5_MASK	REG_GENMASK(28, 16)

You might consider "_{EVEN,ODD}_LEVEL_MASK" naming here, just in case
future IP versions add additional levels beyond LP5.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +
>  #endif /* _I915_REG_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index 898e56d2eaf7..fac565d23d57 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -2908,13 +2908,28 @@ static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
>  				  u16 wm[])
>  {
>  	struct intel_uncore *uncore = &dev_priv->uncore;
> +	int max_level = ilk_wm_max_level(dev_priv);
>  
> -	if (DISPLAY_VER(dev_priv) >= 9) {
> +	if (DISPLAY_VER(dev_priv) >= 14) {
> +		u32 val;
> +
> +		val = intel_uncore_read(uncore, MTL_LATENCY_LP0_LP1);
> +		wm[0] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
> +		wm[1] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
> +		val = intel_uncore_read(uncore, MTL_LATENCY_LP2_LP3);
> +		wm[2] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
> +		wm[3] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
> +		val = intel_uncore_read(uncore, MTL_LATENCY_LP4_LP5);
> +		wm[4] = REG_FIELD_GET(MTL_LATENCY_LEVEL0_2_4_MASK, val);
> +		wm[5] = REG_FIELD_GET(MTL_LATENCY_LEVEL1_3_5_MASK, val);
> +
> +		adjust_wm_latency(wm, max_level, 6,
> +				  dev_priv->dram_info.wm_lv_0_adjust_needed);
> +	} else if (DISPLAY_VER(dev_priv) >= 9) {
>  		int read_latency = DISPLAY_VER(dev_priv) >= 12 ? 3 : 2;
> +		int mult = IS_DG2(dev_priv) ? 2 : 1;
>  		u32 val;
>  		int ret;
> -		int max_level = ilk_wm_max_level(dev_priv);
> -		int mult = IS_DG2(dev_priv) ? 2 : 1;
>  
>  		/* read the first set of memory latencies[0:3] */
>  		val = 0; /* data0 to be programmed to 0 for first set */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
