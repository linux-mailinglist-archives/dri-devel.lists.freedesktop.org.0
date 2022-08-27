Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A745A32DB
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 02:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966310EAA1;
	Sat, 27 Aug 2022 00:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D69F10EAA1;
 Sat, 27 Aug 2022 00:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661558618; x=1693094618;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z15o52W9AfR9B+MpIqipaWH6p0v5yfWWX0HcLiWpr6Q=;
 b=CGT0EcM5TH8g1DKUOBv4vfTvBy2bBNh8SzoR6BFrN+HZKiceHeHNibgY
 UcVGpx6MOpEHZS04ZsPQkyYeG//vUdlRlFrDb+wOaqlXamt5QMNmbmmTZ
 RUBUwBTDz9RpO0770s1yuIPfEDHiQ9VzwCrNJ+RSDbmeDJZYXbz4Xkj6J
 DkiiTxWc8dcY+X0yQX90j8X2kMOMNR4SOEUhX0W0b7RPCLATigx+p+ojN
 sdagPaObqEa9aUERBh5cnW+M1YFdFtaTSfW2aJn2BkQUpB9hdQEAemX+w
 UBKtxPnthA2K1T17kztAcQb+aDyFvAfZq7i/BdzmSt1JeN/DNBneIUOzW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="293361567"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="293361567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 17:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="938929483"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2022 17:03:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 17:03:37 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 17:03:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 17:03:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 17:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGR4DiM7Tv1fB9bPibqBg/uZjjKJ/zIHUez3vfT0dIizV0TgiONLy3DOENtNY2JTnS7C+CcYoy7KLagplAiN8FvI+aKRG2ymJIkL6pLxzyqd/bpnvR86CinlNGQeLQQ30cNE2eLV///4RXXe1fkDVcmiArBbDWJCBb7FAN1kZZ+fK18n18gQRQ5Eo/StmGy2o2p/JJnnO0eXp4RzIty+X9WDdOztlZxGOolYYHEx/FaA9X1IH/LSLqKkTWwJwOwNgPDwZLeTq1xXYofQSBLTtr/LKq7OzVec8u7F68JJovMlO6EpHcRgPf7zIWuQ7Dspdjiu4Et5OSHDMdYK5MNyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asQ8NQS89JQJR4nuA8uaNgTVjPqf7by2d4GkOvVHd48=;
 b=PNn75Z6Kxfx59Duvw2BN4k1/MsluzlwyAqow/hCdvtelUlIO+kKU7Nsb+CuPPDYmm5fqKRkxKwbzyNMKSe7vNSiuk0jlo+nNjuQELFVrM6ot5PfLAt5vppbBWUh9YC/pSmPi+8/yrpmzNifrh4ptzKHEgtekFwq50i8PVU3fNlfCpZvj0ZxTlwOvfnVgRuYYZjhBm/SHDZksud2WD3/Zk3iVGN7J2VbiiXXIcgj/qUWyUwXRRz8Aju9WDKY8b+qA7ulBIwuq2+2C8plKjvkiHHESvVxI7MoIg/GnXmqi9StbBq4Q1q96uBztXTAIG0gfLataRV5MlDKCk+f56u3DEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY4PR1101MB2118.namprd11.prod.outlook.com (2603:10b6:910:1f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 00:03:34 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5546.025; Sat, 27 Aug
 2022 00:03:34 +0000
Date: Fri, 26 Aug 2022 17:03:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 15/21] drm/i915/mtl: Obtain SAGV values from MMIO
 instead of GT pcode mailbox
Message-ID: <YwldVzkKpq5thCXk@mdroper-desk1.amr.corp.intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-16-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818234202.451742-16-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee0946dc-f1cf-4051-e69e-08da87bf953c
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2118:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubGX9EkqJCXB95WgqVZXPaF9q0HSDmZ0V8jYh+goefjZwaeb6cUrXjP3BSsM91vmz4++OGTLp0h/wtYfeJF7mwcfrAAhq+ZC2B4ADBJk2olulMgOX7fbchzgz0jykBxnkDBqOSgHwj/B81SsRMc3nLeh1GKa2Qe6w6+pn8IFcZoullVZPd1Zet0VWWeE3F6/XKNR9o7Ar3EcWwWMDrsLPx25OyjTgBAwj6a69KN5L80dXN0emeJdtTgaN72UlDfw6MVkhIDIBZBAwbpqSFIIX0kFwkOharBuYYALeTVEi/QqhrkdIVNdDN7ayVgghzlKKKwvDKL12WXGx7wQ2S9bM4smVa5ezHH8ZvJdB0iXcfRrO+5lqpBlLNlzjYY7hbFwvYe4Ckzz54RLnYx0rn9s80zGWsLJ8q9uHq2tbNZ9n5PRcj2kGM9bm0TFhewZGQglKBUYKZf5fDq2D+rVTDnqOWaAfwhx6yB2KMn/tGwezM69YPjmqf9DIjsaoJt4bcdzD1UvR9ajJsx7KfiZHcoQCEs4RTfVM1jLpX7bCkE8g3Z1uKfWoTX8tOoVrZCGM3BRCmf/3oy0f0dnNdRR/oi/68EdATxhsliJ+zrJrDZOAA3rKv86frB59Sw4v/eDwFpIS8sdzXT2grzRQclvg8aVbikVuT+PYsIVwGx8dhqCz3RETCDEoFCju86QE9kt/13OiKzQZ2WG2fS744BkUyfpnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(396003)(39860400002)(136003)(346002)(8936002)(5660300002)(6486002)(6862004)(38100700002)(86362001)(66556008)(82960400001)(8676002)(450100002)(6636002)(66946007)(4326008)(66476007)(316002)(83380400001)(186003)(41300700001)(6666004)(15650500001)(478600001)(6512007)(26005)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RhgjxUHOnL1NjkTR8I9k6ssNcL8UtoCnH39bXw5X6Gpqi0ZUHB/O97ZCyt?=
 =?iso-8859-1?Q?iUCQDbx9xhVENS2tULY2PYfL39BrsRB92z8oJxvGHrFEz5MI5MyQ4ry4wm?=
 =?iso-8859-1?Q?dRKjCNI5oCQSOY+Imm1rOZA3kruA9gfR89ix8wlOXfSeAAxr3ABQaBTv92?=
 =?iso-8859-1?Q?oueIN2+GIhbsJUXrpFQV0XaMUQkrt+RVsydn1hKCjZHG1JR9+YibuZmGZK?=
 =?iso-8859-1?Q?zEfIJaPlEOlMtQrAq99bsZHJEtuJvhGfXhPAzMwvKA4rjngVRbre9GwmUi?=
 =?iso-8859-1?Q?V1ttS5U8XeqCsFP09vq3SUMplfw6obPGR1Z0NOh0r80YPpoUXDQON2Ky0w?=
 =?iso-8859-1?Q?PjOiJenyzOSkQK/Bqx+MoAJkABwMhS8pVL0qvgC1mvYini1H0kGSvPCVsl?=
 =?iso-8859-1?Q?eTQPYzscyyGfI7B+7724N8LSYErbVRFalpRrVFNDPon0/e8PP2TqQnzuQS?=
 =?iso-8859-1?Q?SUi0//5dv4eHYhz5x74KpKxh6sMAZ/m3xZ0lXJYpcrGIT32bFJgcQ+2y3o?=
 =?iso-8859-1?Q?QXxtJuAAlxHU/a2GT0hMrfSZCN4/SVrXXvOEMuPg6pN+e/o9jGzmpkp/yc?=
 =?iso-8859-1?Q?1QhZPKeEhnWvALU3EPK7wrN3yphAL7FPpMS8JUhd/x7pyLKEiVc70ivgmr?=
 =?iso-8859-1?Q?BFBkG/JkASW86K2idvA8nulnyWc+ywu8qMNBZx8VXpFOvvft9QMnZ4HYwS?=
 =?iso-8859-1?Q?gjiGDA4VLs+1iVkoNZp7/fc8QCS/vYH/ynsxcugeqOiVxR37XcHAQtS/DD?=
 =?iso-8859-1?Q?pjJ8wu05ln9gskPKc4VGHFrRn9zM4aYJFTb72SCtOfoa70gBCduyI+G9uf?=
 =?iso-8859-1?Q?0aWKPh3Wf3YD1F/7VGJYJceNuUhGjwnRiY1KlibAlSNI4cEx22kqkej1hK?=
 =?iso-8859-1?Q?+8HoYik5VSmNvIVSQrPEnDQOnNvOWTR1rbbXHxUtaspx5iwJ/rGOa8BmtS?=
 =?iso-8859-1?Q?3rYXTJqMS5WXFOYePhv+sWRfRfNvvwDUiyXWzh3CbsRlq+Wh8JSEOChxCQ?=
 =?iso-8859-1?Q?SbunpFRy63mJl8b33qATvLxhfaF8Ea98JCNf8PzjG+SGc2EZo9FI0PLj1N?=
 =?iso-8859-1?Q?AFklbj7gken3/0s65C+qWFkOJcpX3IZvJWl7/NLAffpBYIZOMKxbIMXujM?=
 =?iso-8859-1?Q?4pEZTUtEFdYLV6H8Zh1QWiIKZsXBQLMTxEqPYI8m5Aj30bxPyS6VJ+BH9R?=
 =?iso-8859-1?Q?G92d0+q9JSf0pmDAPiLVdnAjdgCfS8+13uOuRgiR7NUA1VlIsdM2q2WZd6?=
 =?iso-8859-1?Q?DNio5G2zMR+GOVeaxmYJoB3kWEIflSay2BnmhhV1eCrUoH6GL0UsjuNg/A?=
 =?iso-8859-1?Q?WGG9FW0uGkR3qHSxIHRCOUvy7pcHxMXhLW57BXx2KSEcKOIj3A8twCMXd4?=
 =?iso-8859-1?Q?ov+2b1TLydXtT9+F3JFkjsMtSKF1jP4mjf9QX3UEU1PrvxxELKwERJYuVI?=
 =?iso-8859-1?Q?e53FVx2IqZ6h1ZUCC+81X2GgLXo6WPkoZrsYTywTEPzCerV9bV6T/Ha1YF?=
 =?iso-8859-1?Q?jOURy231WnJPX3mttQdCkHGoLvu9jQrO+q9q+yAYnmuDzzZGh9CHOEF4+S?=
 =?iso-8859-1?Q?Q33POA1QFy3l6Adk8kwT4Svl6qvMeehrt8SpHTnF4H/HTm18Pa85O/ebPT?=
 =?iso-8859-1?Q?7xt6fq8SQmp08u10nprstzCuufkrO0yqcxy1nspwF97JW+7y558/vzhg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0946dc-f1cf-4051-e69e-08da87bf953c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 00:03:34.3333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5spvbWaV837sqXQwJWwWk63xiMRBB50T8Ep2FxySgPgT62t4f8N7lcWIJWBZvFkJtlvvXhO1ErVzpycKcR+jRSLK+NPGLQTcEbduR4uMDhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2118
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

On Thu, Aug 18, 2022 at 04:41:56PM -0700, Radhakrishna Sripada wrote:
> From Meteorlake, Latency Level, SAGV bloack time are read from
> LATENCY_SAGV register instead of the GT driver pcode mailbox. DDR type
> and QGV information are also to be read from Mem SS registers.
> 
> v2:
>  - Simplify MTL_MEM_SS_INFO_QGV_POINT macro(MattR)
>  - Nit: Rearrange the bit def's from higher to lower(MattR)
>  - Restore platform definition for ADL-P(MattR)
>  - Move back intel_qgv_point def to intel_bw.c(Jani)
> Bspec: 64636, 64608
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bw.c | 42 ++++++++++++++++++++++---
>  drivers/gpu/drm/i915/i915_reg.h         | 16 ++++++++++
>  drivers/gpu/drm/i915/intel_dram.c       | 41 +++++++++++++++++++++++-
>  drivers/gpu/drm/i915/intel_pm.c         |  8 ++++-
>  4 files changed, 100 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index 79269d2c476b..46b63afd536a 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -137,6 +137,42 @@ int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
>  	return 0;
>  }
>  
> +static int mtl_read_qgv_point_info(struct drm_i915_private *dev_priv,
> +				   struct intel_qgv_point *sp, int point)
> +{
> +	u32 val, val2;
> +	u16 dclk;
> +
> +	val = intel_uncore_read(&dev_priv->uncore,
> +				MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
> +	val2 = intel_uncore_read(&dev_priv->uncore,
> +				 MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
> +	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
> +	sp->dclk = DIV_ROUND_UP((16667 * dclk), 1000);
> +	sp->t_rp = REG_FIELD_GET(MTL_TRP_MASK, val);
> +	sp->t_rcd = REG_FIELD_GET(MTL_TRCD_MASK, val);
> +
> +	sp->t_rdpre = REG_FIELD_GET(MTL_TRDPRE_MASK, val2);
> +	sp->t_ras = REG_FIELD_GET(MTL_TRAS_MASK, val2);
> +
> +	sp->t_rc = sp->t_rp + sp->t_ras;
> +
> +	return 0;
> +}
> +
> +static int
> +intel_read_qgv_point_info(struct drm_i915_private *dev_priv,
> +			  struct intel_qgv_point *sp,
> +			  int point)
> +{
> +	if (DISPLAY_VER(dev_priv) >= 14)
> +		return mtl_read_qgv_point_info(dev_priv, sp, point);
> +	else if (IS_DG1(dev_priv))
> +		return dg1_mchbar_read_qgv_point_info(dev_priv, sp, point);
> +	else
> +		return icl_pcode_read_qgv_point_info(dev_priv, sp, point);
> +}
> +
>  static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
>  			      struct intel_qgv_info *qi,
>  			      bool is_y_tile)
> @@ -193,11 +229,7 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
>  	for (i = 0; i < qi->num_points; i++) {
>  		struct intel_qgv_point *sp = &qi->points[i];
>  
> -		if (IS_DG1(dev_priv))
> -			ret = dg1_mchbar_read_qgv_point_info(dev_priv, sp, i);
> -		else
> -			ret = icl_pcode_read_qgv_point_info(dev_priv, sp, i);
> -
> +		ret = intel_read_qgv_point_info(dev_priv, sp, i);
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index b2d5e1230c25..5245af8d0ea8 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8397,4 +8397,20 @@ enum skl_power_gate {
>  #define  MTL_LATENCY_LEVEL0_2_4_MASK	REG_GENMASK(12, 0)
>  #define  MTL_LATENCY_LEVEL1_3_5_MASK	REG_GENMASK(28, 16)
>  
> +#define MTL_LATENCY_SAGV		_MMIO(0x4578c)
> +#define  MTL_LATENCY_QCLK_SAGV		REG_GENMASK(12, 0)

Minor nitpick:  we usually have two additional spaces (for a total of
three) between the 'define' and the field name.

> +
> +#define MTL_MEM_SS_INFO_GLOBAL			_MMIO(0x45700)
> +#define  MTL_DDR_TYPE_MASK			REG_GENMASK(3, 0)
> +#define  MTL_N_OF_POPULATED_CH_MASK		REG_GENMASK(7, 4)
> +#define  MTL_N_OF_ENABLED_QGV_POINTS_MASK	REG_GENMASK(11, 8)

Another nitpick:  we usually order fields from low to high (which is
also usually how the spec orders them).

> +
> +#define MTL_MEM_SS_INFO_QGV_POINT_LOW(point)	 _MMIO(0x45710 + (point) * 2)
> +#define MTL_MEM_SS_INFO_QGV_POINT_HIGH(point)	 _MMIO(0x45714 + (point) * 2)
> +#define  MTL_TRCD_MASK			REG_GENMASK(31, 24)
> +#define  MTL_TRP_MASK			REG_GENMASK(23, 16)
> +#define  MTL_TRAS_MASK			REG_GENMASK(16, 8)
> +#define  MTL_DCLK_MASK			REG_GENMASK(15, 0)
> +#define  MTL_TRDPRE_MASK		REG_GENMASK(7, 0)

It would be a bit cleaner to put the fields that are in the lower dword
register under that register's definition instead of combining them all
under the upper dword definition.


Aside from the formatting tweaks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> +
>  #endif /* _I915_REG_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_dram.c b/drivers/gpu/drm/i915/intel_dram.c
> index 437447119770..2403ccd52c74 100644
> --- a/drivers/gpu/drm/i915/intel_dram.c
> +++ b/drivers/gpu/drm/i915/intel_dram.c
> @@ -466,6 +466,43 @@ static int gen12_get_dram_info(struct drm_i915_private *i915)
>  	return icl_pcode_read_mem_global_info(i915);
>  }
>  
> +static int xelpdp_get_dram_info(struct drm_i915_private *i915)
> +{
> +	u32 val = intel_uncore_read(&i915->uncore, MTL_MEM_SS_INFO_GLOBAL);
> +	struct dram_info *dram_info = &i915->dram_info;
> +
> +	val = REG_FIELD_GET(MTL_DDR_TYPE_MASK, val);
> +	switch (val) {
> +	case 0:
> +		dram_info->type = INTEL_DRAM_DDR4;
> +		break;
> +	case 1:
> +		dram_info->type = INTEL_DRAM_DDR5;
> +		break;
> +	case 2:
> +		dram_info->type = INTEL_DRAM_LPDDR5;
> +		break;
> +	case 3:
> +		dram_info->type = INTEL_DRAM_LPDDR4;
> +		break;
> +	case 4:
> +		dram_info->type = INTEL_DRAM_DDR3;
> +		break;
> +	case 5:
> +		dram_info->type = INTEL_DRAM_LPDDR3;
> +		break;
> +	default:
> +		MISSING_CASE(val);
> +		return -EINVAL;
> +	}
> +
> +	dram_info->num_channels = REG_FIELD_GET(MTL_N_OF_POPULATED_CH_MASK, val);
> +	dram_info->num_qgv_points = REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
> +	/* PSF GV points not supported in D14+ */
> +
> +	return 0;
> +}
> +
>  void intel_dram_detect(struct drm_i915_private *i915)
>  {
>  	struct dram_info *dram_info = &i915->dram_info;
> @@ -480,7 +517,9 @@ void intel_dram_detect(struct drm_i915_private *i915)
>  	 */
>  	dram_info->wm_lv_0_adjust_needed = !IS_GEN9_LP(i915);
>  
> -	if (GRAPHICS_VER(i915) >= 12)
> +	if (DISPLAY_VER(i915) >= 14)
> +		ret = xelpdp_get_dram_info(i915);
> +	else if (GRAPHICS_VER(i915) >= 12)
>  		ret = gen12_get_dram_info(i915);
>  	else if (GRAPHICS_VER(i915) >= 11)
>  		ret = gen11_get_dram_info(i915);
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index fac565d23d57..f71b3b8b590c 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3698,7 +3698,13 @@ intel_has_sagv(struct drm_i915_private *dev_priv)
>  static u32
>  intel_sagv_block_time(struct drm_i915_private *dev_priv)
>  {
> -	if (DISPLAY_VER(dev_priv) >= 12) {
> +	if (DISPLAY_VER(dev_priv) >= 14) {
> +		u32 val;
> +
> +		val = intel_uncore_read(&dev_priv->uncore, MTL_LATENCY_SAGV);
> +
> +		return REG_FIELD_GET(MTL_LATENCY_QCLK_SAGV, val);
> +	} else if (DISPLAY_VER(dev_priv) >= 12) {
>  		u32 val = 0;
>  		int ret;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
