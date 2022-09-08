Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C45B2764
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7D10E052;
	Thu,  8 Sep 2022 20:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B44E10E052;
 Thu,  8 Sep 2022 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662667400; x=1694203400;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=efun89sMoiOD7Co7crNGspMxyatIC1G/NSgsncAeJ6U=;
 b=SLBnJiqQmVPgs/xq7syuyniHag7xf9tClkEAVoL+iJ4KpkD3kAY2M6ny
 25+5GvZkzdlbFW+PgLWbh1nfFvKBgdZOkVt0c84C2YsOSndsC98krMOF/
 XMuuF6+OdLGKAafkl7bQr4N1lRGT1jzDO3E1uwHphanRvGEbVAlBgNp7y
 GKy6uUL7ZaenFjBlaoRQllGE1RcDAnaPHDAQYltehc6IrpDSKh+jbTQWv
 CoyndmUcdj7OHKNVcFs7pdCHOdyXjtAvaGyfPCvfeHWFjQ6xrUWunyhOk
 PlObHfNeyyRE5zKnuf3xlrz2xiqsdwomXGcTFJeyyFKfeYO59Fk0wDpgZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359040894"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="359040894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="566085222"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 13:02:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:02:40 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:02:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:02:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5qmOi3cWJs6ocsRmQLLC9Kl52Do5Y0cc6Aj2orLpshhgod7C1vUc29taoecW6w0wYMfXsDHEDDCHVrgtj+P3J2NQzg58UCZQ9aJGgU5ZhFLL7t7KwZF54WAFzE5uyPxqA/6BMoFB6DaBWwgrtdmNI8U1vu5Nq2kC1SJSyGzaX6dahCvcnlasJxL8Ro2i8JTNjxSgf/mHr08Tm1wspxVgHn6ap0/y5UbJZXIoEhPYmP3LXmUFyfWPy7D+RL3DK/LVLSV6oJrqjpjKPes6BzUxDYwXdFlZfVSC3zwK+HwVr6XGYBErbS7z0UcfKlU21OQhSpa2GnN1VcHdOPXKsl9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1Z162HRmMHBWtz47k7csnzd5if2PzFSnupnXcANx/8=;
 b=XHampEYmAI8gcyqdQ+7lawhA+rYTTmHZyk3pFwYrufiugr0W0uMtsmnJCRVh+0ZfMuSsgzKtg34XSTIqQIepbjmR/3tJUFu+cTDCiE4qxIlSNZKDCGekc7mUr9usAwn2+jgfXfC1xkgEiBOAsV/5RsPJCjQBxu16pPQtjj4IfkwXYeKr2ixcHBgXD4wCHTq0RDJ7bSfhVXkNgyqs1x0XWVPs+U1QlqZDnBD/S1Aqy/BW8J1sX0E1Txnh1z9c9PYDOTq5kCGKTi1++wNw73v2QV8+PT7211AAtZ4H4ARPCbdcoLh2yzrsZMLE5PFVsIYSnZEdPC29D1TnPh/YNL/17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB5584.namprd11.prod.outlook.com (2603:10b6:a03:3ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 20:02:37 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 20:02:37 +0000
Date: Thu, 8 Sep 2022 13:02:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v4 09/11] drm/i915/mtl: Update MBUS_DBOX credits
Message-ID: <YxpKWw+EqKgj3i1f@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-10-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902060342.151824-10-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb58860-a05f-4d12-7b5e-08da91d513bc
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5584:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNBNld+vzw/CHh9RZK3mpWqqWJnlKZIliDggt0tC0tj8mtsOvv6JP6auN8fYRCziKzj4WunCBvomRW3k+nJSW3GUvGi1+IxrDxFercYQSLOgwpdhrQ9zOCbKLrN656kYEM9o3Go8S92/iPnQ6xc3K5L7fQK2osKjx2AHSKpG7GjKEL26UzY+bZjhlMZA68rUkNU9oUJEi8oLQf/hFRvzH1MkipRsiujVFniWunzvRHJqAvo23ouO/RAlC2VeIPTmCFY+Jhil9goz6iewNH8vbNSdoPOhK6PwmnL/JdxvTtl3/LtYQLSrzn6gdRZyu4XWZxXaMKmVpVXZa15m9cLbQaQo8SNPpdfdhztiocIdcp6NnWCE1sxSMjf7tdl16ut3ecdzAp5kwhOA+mpwgOj93E1lx+MbOTQB3X1x7vIhrFl/qRZdNobsiGSnxUgOdz96s6H5kA7hl2oYspunKQKcdYNWXQcgUnAJZazoV8UTGRsmiC89qZTvUqu9jsheWPumON6TcQHdMLwp7yYbmTKJFvPGpVNaC73j11XoCgNhSofG0e6+eniyF7jAO8zUb/SIB5psBDdI4M5XNWBLNQHjVD+FaVLkXxBTYDGwrgp5l9Nn/qV5m74y1U7j9Gqfv73FPNrT9Y7kdZ46vG49S6bNcCyvjnyQHdPBAecVZo3D6jFQbW6khuaRLwjidYsLFe9VxzCAOftms0Ex9UdNsFOQPfGV5zLUMJbAklOJk7y9EFdXX1W9u4xHtTfgPEX1ip3C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(366004)(396003)(39860400002)(136003)(5660300002)(15650500001)(4326008)(8676002)(2906002)(66476007)(66556008)(450100002)(6862004)(8936002)(66946007)(6512007)(6506007)(26005)(86362001)(41300700001)(478600001)(6486002)(186003)(83380400001)(38100700002)(82960400001)(316002)(6636002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sSfQvRdyV32g9gxBLXOa+k6FvbeXnuSRaWeOaf0PFdj26S9MNwGoULDz2O?=
 =?iso-8859-1?Q?HbLaJQC9R1T9AdFIkgRaveIlWKHFpOlo4dVP8B+0y6Gg2G0Y+CwKP3zt8D?=
 =?iso-8859-1?Q?i5OHaC+0c18Nlx/4oDi0u+RBrHBXXC3X/S3Z6PcbE9vR8E/2AxSP8MOXEY?=
 =?iso-8859-1?Q?bDBwLjMWpZL3iGRrNLQcWHkldLpP95DMyqgUdSbibICxeXU4JYhPqpDn7w?=
 =?iso-8859-1?Q?B0DiSJQexXSsyDaLMyUVENhLFFbC6qA4HZTFlqV6L0/aXURN/y5PpBhhfV?=
 =?iso-8859-1?Q?gI+tYNqWgXPAcN40u2aAIs8H6lZm5vER0DbC+AVtNcbiV4PDRQFuKmZ/m2?=
 =?iso-8859-1?Q?a3WZzCtDri/utKAihV9DX+aN8QydOOX7vJ60VbHNIRKaZ3fTBX76oXEPhQ?=
 =?iso-8859-1?Q?kZYsYf/Ww8ehYjqcPa8wNRBiunh3q9kzRPLM58neK3E2Ro2SysEFHrwxMT?=
 =?iso-8859-1?Q?H/RghYTkOdYGBqW2oTsui34OpIR+TBe+PVSEwAEyedonjNSZ6RTlTg9s96?=
 =?iso-8859-1?Q?6mrMRT/rpADfnkkyXak2Fnr2QoQtbSpEawAfXH5+lzypdjH0V8y19pkCNc?=
 =?iso-8859-1?Q?jwCQBqKcxr34cNabc42AYOf86m5Ek4Dx6qiR8K5l3/hOTL+bHXF+OIpBeT?=
 =?iso-8859-1?Q?Oa+7hOnuw81UhEe+89WnP//XawbMZsPm9W7PAMWRC4lPmEDejm4sPsPP35?=
 =?iso-8859-1?Q?9np8igdEv2/98IQY/aJEtrXYU1DNOs3yIk2LPhrDQLqxyb4rE5ZOZMt2+4?=
 =?iso-8859-1?Q?LdPmd7DMIXPn1LfNNAT9Q8BJ3Oh8TGD+//8IsScn3yqgO5U3O9cuy2Ee42?=
 =?iso-8859-1?Q?XVzzESe2Gyh3PlY55QQrSrGFTojpDDkM8H3pwpRmtjZFATIWzWcSWqDUeN?=
 =?iso-8859-1?Q?TS9D9Wfz4c25SoUDfCjZa2/hUer38qAtInxr5l0JxLUnq3q2xbGI+VNmV3?=
 =?iso-8859-1?Q?2nTorizMpmZq1ITDwK3MxevkchXViVCm7s2MoctjgAdfvx62NyE6P2RkkT?=
 =?iso-8859-1?Q?N4yMI/fhokJ2gVuWmJTage3/9b/J3zEx1vHMNdlpsGqGzl0pCd71FUrVZ6?=
 =?iso-8859-1?Q?hLN9a3Lz8h6Ue4BFuBrC6rSly8PS8b5Dab9dODeudfiUu5iNHU+tZA4UOs?=
 =?iso-8859-1?Q?MO4ujtu0UNR0atZi2mycwSuGptMX3rWQeBKEFlq9as2KGEn4qCrdAWluYE?=
 =?iso-8859-1?Q?reKwhKwtprDRw5mHOuipu7IZQERqhrjVuBuSwrPnwWQeNTramfyupe3D1b?=
 =?iso-8859-1?Q?BMMBDGdGGLzfUYItqNH19g5YeXE6lLskmfGh2oWvSEUv5eQwzjC/gw2+ej?=
 =?iso-8859-1?Q?bS9gO9AutQe9pqX91Q+fLVVMF24XDyRM7aoEiQRLnBdhAkZIXXPcdZMF/S?=
 =?iso-8859-1?Q?lyk46dTUjKPud0oGvsY61i9TzvjNmpnBwCFsXbX/mof9d6AalhwAq8NPqo?=
 =?iso-8859-1?Q?chnmMrSFuYMK+0NjY9odtpgH1g2ZVj0y89cYcEH/OCSC7Te0LfDXvQjjM2?=
 =?iso-8859-1?Q?8sz1pPwtwnGatOVG/DhG5HuPNTOPjXdOZDdyPoOXwGnSCxzOdOXZMZ2Mlx?=
 =?iso-8859-1?Q?LSktPRqoDyGbPgMXHd4Ozn38kXmUKGPhn4XHcSsRiGrGUd0Evx5rkBy2fi?=
 =?iso-8859-1?Q?5j7dHfhTV62g2w8GJUZC3TCNp7bh/Nt4iH6JiUom+oUl8jSmtQcG7qEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb58860-a05f-4d12-7b5e-08da91d513bc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:02:37.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyKsc58KGKTWfprgWpXsRX3zEd7Typ2WyYaf7O+sK6GlV4DRoIlulI1JZTgy5/1KBXeEi640IRhCfhDEjwJ/h6iTSFDy437AJWS2tF2WxN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5584
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

On Thu, Sep 01, 2022 at 11:03:40PM -0700, Radhakrishna Sripada wrote:
> Display version 14 platforms have different credits values
> compared to ADL-P. Update the credits based on pipe usage.
> 
> v2: Simplify DBOX BW Credit definition(MattR)
> 
> Bspec: 49213
> 
> Cc: Jose Roberto de Souza <jose.souza@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h |  4 +++
>  drivers/gpu/drm/i915/intel_pm.c | 47 ++++++++++++++++++++++++++++++---
>  2 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index d22fabe35a0c..f9237586ab4f 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1125,8 +1125,12 @@
>  #define MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN	REG_BIT(16) /* tgl+ */
>  #define MBUS_DBOX_BW_CREDIT_MASK		REG_GENMASK(15, 14)
>  #define MBUS_DBOX_BW_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, x)
> +#define MBUS_DBOX_BW_4CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x2)
> +#define MBUS_DBOX_BW_8CREDITS_MTL		REG_FIELD_PREP(MBUS_DBOX_BW_CREDIT_MASK, 0x3)
>  #define MBUS_DBOX_B_CREDIT_MASK			REG_GENMASK(12, 8)
>  #define MBUS_DBOX_B_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_B_CREDIT_MASK, x)
> +#define MBUS_DBOX_I_CREDIT_MASK			REG_GENMASK(7, 5)
> +#define MBUS_DBOX_I_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_I_CREDIT_MASK, x)
>  #define MBUS_DBOX_A_CREDIT_MASK			REG_GENMASK(3, 0)
>  #define MBUS_DBOX_A_CREDIT(x)			REG_FIELD_PREP(MBUS_DBOX_A_CREDIT_MASK, x)
>  
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index ebce6171ccef..b19a1ecb010e 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -8448,6 +8448,27 @@ void intel_dbuf_post_plane_update(struct intel_atomic_state *state)
>  				new_dbuf_state->enabled_slices);
>  }
>  
> +static bool xelpdp_is_one_pipe_per_dbuf_bank(enum pipe pipe, u8 active_pipes)

Bikeshed:  s/one/only/ might be slightly more clear?

> +{
> +	switch (pipe) {
> +	case PIPE_A:
> +	case PIPE_D:
> +		if (is_power_of_2(active_pipes & (BIT(PIPE_A) | BIT(PIPE_D))))

Bikeshed:  writing this with hweight might be more intuitive than
power_of_2?  Or even just a direct check of the other pipe like

        case PIPE_A:
                return !(active_pipes & BIT(PIPE_D))
        case PIPE_D:
                return !(active_pipes & BIT(PIPE_A))
        ...

> +			return true;
> +		break;
> +	case PIPE_B:
> +	case PIPE_C:
> +		if (is_power_of_2(active_pipes & (BIT(PIPE_B) | BIT(PIPE_C))))
> +			return true;
> +		break;
> +	default: /* to suppress compiler warning */
> +		MISSING_CASE(pipe);
> +		break;
> +	}
> +
> +	return false;
> +}
> +
>  void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
> @@ -8467,20 +8488,28 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  	     new_dbuf_state->active_pipes == old_dbuf_state->active_pipes))
>  		return;
>  
> +	if (DISPLAY_VER(i915) >= 14)
> +		val |= MBUS_DBOX_I_CREDIT(2);
> +
>  	if (DISPLAY_VER(i915) >= 12) {
>  		val |= MBUS_DBOX_B2B_TRANSACTIONS_MAX(16);
>  		val |= MBUS_DBOX_B2B_TRANSACTIONS_DELAY(1);
>  		val |= MBUS_DBOX_REGULATE_B2B_TRANSACTIONS_EN;
>  	}
>  
> -	/* Wa_22010947358:adl-p */
> -	if (IS_ALDERLAKE_P(i915))
> +	if (DISPLAY_VER(i915) >= 14)
> +		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(12) :
> +						     MBUS_DBOX_A_CREDIT(8);
> +	else if (IS_ALDERLAKE_P(i915))
> +		/* Wa_22010947358:adl-p */
>  		val |= new_dbuf_state->joined_mbus ? MBUS_DBOX_A_CREDIT(6) :
>  						     MBUS_DBOX_A_CREDIT(4);
>  	else
>  		val |= MBUS_DBOX_A_CREDIT(2);
>  
> -	if (IS_ALDERLAKE_P(i915)) {
> +	if (DISPLAY_VER(i915) >= 14) {
> +		val |= MBUS_DBOX_B_CREDIT(0xA);
> +	} else if (IS_ALDERLAKE_P(i915)) {
>  		val |= MBUS_DBOX_BW_CREDIT(2);
>  		val |= MBUS_DBOX_B_CREDIT(8);
>  	} else if (DISPLAY_VER(i915) >= 12) {
> @@ -8492,10 +8521,20 @@ void intel_mbus_dbox_update(struct intel_atomic_state *state)
>  	}
>  
>  	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		u32 pipe_val = val;
> +
>  		if (!new_crtc_state->hw.active ||
>  		    !intel_crtc_needs_modeset(new_crtc_state))
>  			continue;

What if the number of BW credits for a pipe changes when this pipe
itself isn't undergoing a modeset?  E.g., what if you initially had pipe
A active as the only pipe and thus programmed 8 BW credits.  Then you
turn on pipe D; since we're not touching pipe A directly we skip any
programming here (leaving it at 8 credits) and only program the 4
credits for pipe D's instance of the register.  Am I missing something
here?


Matt

>  
> -		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), val);
> +		if (DISPLAY_VER(i915) >= 14) {
> +			if (xelpdp_is_one_pipe_per_dbuf_bank(crtc->pipe,
> +							     new_dbuf_state->active_pipes))
> +				pipe_val |= MBUS_DBOX_BW_8CREDITS_MTL;
> +			else
> +				pipe_val |= MBUS_DBOX_BW_4CREDITS_MTL;
> +		}
> +
> +		intel_de_write(i915, PIPE_MBUS_DBOX_CTL(crtc->pipe), pipe_val);
>  	}
>  }
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
