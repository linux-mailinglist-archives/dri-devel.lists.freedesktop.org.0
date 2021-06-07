Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C82739DC07
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 14:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957466E1E8;
	Mon,  7 Jun 2021 12:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152CC6E1E8;
 Mon,  7 Jun 2021 12:14:31 +0000 (UTC)
IronPort-SDR: p6y4pkaz0Jn4NjmTcKPNAO3iY5PJYN/1WMX7y98dZxO+pQPGTX3CkwQ+iSsJlrpMqqJkO5E9mP
 Z+iJMTPBEwUw==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="184978833"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="184978833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 05:14:30 -0700
IronPort-SDR: 6YUEijo5gp57lt5Wt+3kLuXFJqA6hXtBsVkUnYyZhnmxNcGteF8UHyL9pRBjGi/ebyYyFJwU3j
 rLumhES3Cgfw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="449064384"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 05:14:26 -0700
Date: Mon, 7 Jun 2021 15:14:23 +0300
From: Imre Deak <imre.deak@intel.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/i915/display: remove duplicated argument
Message-ID: <20210607121423.GB3787465@ideak-desk.fi.intel.com>
References: <20210605032209.16111-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605032209.16111-1-wanjiabing@vivo.com>
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 05, 2021 at 11:22:07AM +0800, Wan Jiabing wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/gpu/drm/i915/display/intel_display_power.c:3081:1-28:
>  duplicated argument to & or |
> 
> This commit fixes duplicate argument. It might be a typo.
> But what I can do is to remove it now.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Thanks, pushed to drm-intel-next.

> ---
>  drivers/gpu/drm/i915/display/intel_display_power.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 3e1f6ec61514..4298ae684d7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -3078,7 +3078,6 @@ intel_display_power_put_mask_in_set(struct drm_i915_private *i915,
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_C_LANES) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_D_XELPD) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_E_XELPD) |	\
> -	BIT_ULL(POWER_DOMAIN_AUX_C) |			\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC1) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC2) |	\
>  	BIT_ULL(POWER_DOMAIN_PORT_DDI_LANES_TC3) |	\
> -- 
> 2.20.1
> 
