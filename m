Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71459A632
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 21:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D4510ED9C;
	Fri, 19 Aug 2022 19:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED83510E96E;
 Fri, 19 Aug 2022 19:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660936637; x=1692472637;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=038WjnGvyPBVe+H5swuXyMEN3VNUCSDIrsAoTDn1Jgg=;
 b=kxGmJBrEG55Elyszg+Z9+A/EnZyFscq9Y7SxrsCrsWjShEniX7LsYJuq
 LP4qOwYV8/WV1jr+V4ObMihN+HP3MLbTXLKz5Wv3erLvdBz/nTtyv+ENQ
 4MCvL49ESbcOGlkNNCRBgnnyQcI//y5riir9Fz3iscMR+o1RrLsZpGOx5
 f4cZ0lYI/0iv5PasHqwyI6VWlQgEuf2USkMDEelN2pyKeJVeS9IKHmSzm
 MtW0kcC4/4H1C4QBgS+Zl4CA1bQRZGJzD9MRV3bb0tlraJK3h5RiMOpv/
 oap9i0q4QyK83JrjrOItpGUgG/me5p22CQwrsAzYgHBkTvvYbYNrbqANH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="354818882"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="354818882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 12:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="936326687"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2022 12:17:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 12:17:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 12:17:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 12:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBdD7uiBphfbe8PLOcN6MxTCrGUUzSbsd/D+8Fu9toqx78xOQkX73Pl7GVJN51ClmZZPEJR5X0hSBCiyWsgv32Zbs16ZeSDZTrMwQZomC770kgEmCc7W4JR8X2Kn/CCjfFnOeUZH0dGiLbHvnOP5qVdfdO5D/lvct/gt1g+vQdWgvtVDNKpuMOBkjf2JTDOc8Jg8BFne6vHoBOPhVVuRRmR7SWMmaawbDPnwFAGPX6zZ00X9e2e9yW/wCyket6gnaozkzbNhi5i3Z3WGFDgiIrWvRL+/6x+jyYvshyHAQ2sSELIb67UXCNO798XaE/Ita3/KuxrMfFYDobFWMZNhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm+Q32MjXp29STvfIoHOTgJ4xwMhrC3kMaZFfjEus34=;
 b=aX1pMd9p9C/n/lL6jsCxoV8wLjXW4fqzejEooRk6Kr4H7bTL82feluih9iY62x3MAbbF0SKTCvUsV3LZpufGWHo/rytfWWh/f/Cuqm94vT35H87c1DVxvV9kpN5y00jzXDLA1eRDTgl6NWPiVStsS1BPYdf6ZMZJBKAFxQt/2yFTzwHh9D8gHm9hvPJY0+ChI+ky533VTaPHvFQxyl8+AjaOWmwQeL9pOIZdFEXsCZk9fU4dkzNzG6LS94v8e4OY7HGdtvPTcAn9bmfvo/PyAiINWfcJKlP5QtXjlmKMIQ40N+7Ki/qOj5Ng7Qs7/3vnBRMHcS1KcSvV3rJS31QxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY4PR11MB2056.namprd11.prod.outlook.com (2603:10b6:903:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 19:17:13 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5525.019; Fri, 19 Aug
 2022 19:17:13 +0000
Date: Fri, 19 Aug 2022 12:17:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 07/21] drm/i915/mtl: Add gmbus and gpio support
Message-ID: <Yv/htqK/w+lr3vgO@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-8-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-8-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b0dd43-9dce-40a5-67bd-08da82176b9f
X-MS-TrafficTypeDiagnostic: CY4PR11MB2056:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TOrcHIpiBi97RRiD8Ry/GCxngHL22HNNj28mXxb4HSyl/Inh4KF320oNVbhkn+fGAgZgi74BougvzjXc2P7cEzgUWKPB+54RJwA6bfU29ATweqbQeFOt0YtH9qXkBwjBwOX0Pts4zUY8N7vQUkDOyuPXWSxYneho6bKbIQ4F9iCJhBgATf0d1sTp572bIlx9zeiVOwhvUOw/WWuZ/xoSGYKAxdlQk5h9pq+M6FiuylPN/oDT6vlKC1LCa8Azz5WfafDuBZhWrxUgJnrGxvLnC4TS5YXAV0aY+FNvnx1Gf0o14/9kY8aQRQijygkQF6yUoe/LtRUwZhZEi3+GNR5q0nNcojecEimRXC8o3B92T65ZpCisJvFhgOAzSahMDyq8GS6BtlKhRbtah96jt+hvLPCOXQMG6HYxeF0OUSbAaSgouBj18zjM0UYF4srNLPHsUujmU6fOsLlPsSfqF8Lnz+c39HgvK8TxpVu0gE+s0L9kqi65PqlUxKQUyQlGZFrR1EdRQPczMqgWtPYWnLK/DpaFgjrX42U5bcVDfSxkOvcGYCAt8qYInaU1j/O6dfJ1DmHZfCytOBi/vcd/CxZoH1VnsurhKMPKrCFSKQElW01eXB8TdnlLlQb6abTlhcFh3cDda7cNeev9wV5r8Fdes53TqP3yD/24sND13tVaZpOmP4iEG+iM25rY7pllALnsVvGrti+94eSqBPi3CW7L9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(376002)(39860400002)(396003)(41300700001)(2906002)(8676002)(6486002)(66556008)(66476007)(4326008)(8936002)(6862004)(5660300002)(66946007)(86362001)(186003)(478600001)(82960400001)(26005)(6512007)(450100002)(6506007)(38100700002)(83380400001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kzEAD6cCTkdUjV80e3Eu2nuno/ICM2DC20a+UdQiayjkZ6MLZ4tgBkltneVp?=
 =?us-ascii?Q?A7l7d32vtPWI4xbEatkxRdYnSJq2Wfw1eYqsXE7BcHgthn8n0ccJRCfAguHY?=
 =?us-ascii?Q?qbnbiLZTPEi4xueUz/9mAJ2tIBCiAqCjmydeJRekELojECgv/dxsulEhUl+4?=
 =?us-ascii?Q?Woz/66W+oNuoijF9ehFtXQRh8MuVQcr8p4olfBwfdq6Sf8bQ9HHbW+V62A6B?=
 =?us-ascii?Q?hS85cYTiO2P1hwBD5WiEJ2u6jc9vqzRULSUyH7tFyNguXreH5Oiw3HypBc1A?=
 =?us-ascii?Q?Ghahl3Vtx6REygWhmBDSB+oBjhNjDObvJkSbeNgP8cv4HPFS1+GVzdR+kdcB?=
 =?us-ascii?Q?ukzYYsASNjLq6Ewk47fCxuTX/teXWib/GLFpycUxVqpwjnc9XKDuCV/vEIko?=
 =?us-ascii?Q?OZQPzQbO/dGK/1xJr8y0tIRwsWZt/S1vA+HC4nSy8oWWj8wcGLTuXbvpRVqs?=
 =?us-ascii?Q?Vdhvrj3Abprbk4Q9VUl+JtsbgUIMQvC5LAZfOA4yidTTPWywmWATSr8D5Se4?=
 =?us-ascii?Q?Ixt5jGJHJ0ZU6/g6YUaNOGopBrFG9k32n9xDorFW7wFXzqK7FIhO5YEOG1Ug?=
 =?us-ascii?Q?RraY3pP9pcX6SW30M6bLoMPcUvXsSsy9iZ89XQ2uO/sFIj7XgJoGRZ7lY7ep?=
 =?us-ascii?Q?se2MEDylrJzEpYGox5AOeCa5Ea/JFu9+msv0elqcLke68HWRZ8ceA+w1Puqr?=
 =?us-ascii?Q?GALHgz/dQGb5q7blZrhgo3esZMXzmvucQFEgAvRW6Eq+rLjWMFpl5m2CleUg?=
 =?us-ascii?Q?7+lH65pAqiXMz0GGAYSnunT0G9j+m2FpWtuxJkeVopK8CJx2So+5bO7KwY6g?=
 =?us-ascii?Q?4grc2/kPa+sNVJ1T5tiO1M90l6cPUVIjY0xtLisQOfJasfNm3advo4uScJVj?=
 =?us-ascii?Q?3szUp9inHylSOyCuiC7Co568ua/90JqVV0FVFt+33bwQG0YShURah27DJnzz?=
 =?us-ascii?Q?nkpggTYUC8G03r7TsvxvBMtOz7NXgxijYhPdxv6yPZbXwcoZy8khN1sygvRj?=
 =?us-ascii?Q?Yb3koNjXL7wyfKsBsMNh5906uh6kstDqQluyenvgsXZY7YqYyIwA9AonYeVw?=
 =?us-ascii?Q?oZzy2q3yolXmn3CHi3ZjyLVQ7faAJUFepmrS+F6VRguUV5h/6rx/fdwZY5N3?=
 =?us-ascii?Q?MyXl1tlT6ysuvEvHrJh94za+LTQrnA4B0472t05lVj168ix6CYNkT+v8bD7q?=
 =?us-ascii?Q?0o5KgkFMtPTpWjUBWVJijBErTRL6MnCNvfsV+nOEGXdS06Sxy1hu2mt39+eI?=
 =?us-ascii?Q?ix6arD/8cK/ZerYu3LCEJKcVogCp2XHh0d6cwTjY8XeYpZoJDk+0w5d/197m?=
 =?us-ascii?Q?ehZT3yexyUnajwNQfuBaf1f5nmld33x/FA3EoyCQUzNEOqz5TrOw2WOtd3bb?=
 =?us-ascii?Q?zMZC7c2ovRBNh83iA9/sB3drUIjpkV8SIppvAQ06dwc10o9PxmO6ii8Rr8Lq?=
 =?us-ascii?Q?TcwVDTDmfacySXSsP8/SwOJD+BPvdjKhUXRXtecmwWdbYYYVKwmgkmLEDUMT?=
 =?us-ascii?Q?0AyRtx+qtdtFYp5jHsxK9pRCGF9mxLSAAL2xtgfa029lGNUy2vNNWRcLSg4z?=
 =?us-ascii?Q?SxLB5i8efTPpn7v6xB/Kx5HwsOD6JPxtA4KtMMMhDPC7/wBlehfq4dSVk0we?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b0dd43-9dce-40a5-67bd-08da82176b9f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 19:17:13.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSSs4VaRl8XFzjx4y0ruaEQ8JVs1LgwbQR9/VuVGHy2FNlt9aXORqBywFtxyq3XI9AuycbgbNRF/ViRjDHrcL9K03Dw19g7seOkQsNEj5ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2056
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

On Thu, Aug 18, 2022 at 04:41:48PM -0700, Radhakrishna Sripada wrote:
> Add tables to map the GMBUS pin pairs to GPIO registers and port to DDC.
> From spec we have registers GPIO_CTL[1-5] mapped to native display phys and
> GPIO_CTL[9-14] are mapped to TC ports.
> 
> BSpec: 49306
> 
> Original Author: Brian J Lovin
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_gmbus.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index a6ba7fb72339..542b8b2654be 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -116,6 +116,20 @@ static const struct gmbus_pin gmbus_pins_dg2[] = {
>  	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
>  };
>  
> +static const struct gmbus_pin gmbus_pins_mtp[] = {
> +	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
> +	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
> +	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
> +	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
> +	[GMBUS_PIN_5_MTP] = { "dpe", GPIOF },
> +	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
> +	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOK },
> +	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOL },
> +	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOM },
> +	[GMBUS_PIN_13_TC5_TGP] = { "tc5", GPION },
> +	[GMBUS_PIN_14_TC6_TGP] = { "tc6", GPIOO },

There's no GPIO_CTL registers for pin 13 or pin 14 on on MTP so these
last two entries shouldn't be here (and the commit message should be
fixed too).


Matt

> +};
> +
>  static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
>  					     unsigned int pin)
>  {
> @@ -128,6 +142,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
>  	} else if (INTEL_PCH_TYPE(i915) >= PCH_DG1) {
>  		pins = gmbus_pins_dg1;
>  		size = ARRAY_SIZE(gmbus_pins_dg1);
> +	} else if (INTEL_PCH_TYPE(i915) >= PCH_MTP) {
> +		pins = gmbus_pins_mtp;
> +		size = ARRAY_SIZE(gmbus_pins_mtp);
>  	} else if (INTEL_PCH_TYPE(i915) >= PCH_ICP) {
>  		pins = gmbus_pins_icp;
>  		size = ARRAY_SIZE(gmbus_pins_icp);
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index 8edc2e99cf53..20f704bd4e70 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -24,6 +24,7 @@ struct i2c_adapter;
>  #define GMBUS_PIN_2_BXT		2
>  #define GMBUS_PIN_3_BXT		3
>  #define GMBUS_PIN_4_CNP		4
> +#define GMBUS_PIN_5_MTP		5
>  #define GMBUS_PIN_9_TC1_ICP	9
>  #define GMBUS_PIN_10_TC2_ICP	10
>  #define GMBUS_PIN_11_TC3_ICP	11
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
