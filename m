Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B624B8357
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E0510EC62;
	Wed, 16 Feb 2022 08:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C450910EC62;
 Wed, 16 Feb 2022 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001463; x=1676537463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4Xcvqy1ldi5NNFMv9GupDGd6EfBItncs/XrVanQtQpU=;
 b=XDtmjmmEMtHpBYZ7dwAUqSMZhsqKE0Z79plHItT38SFYs6om5YOP70/7
 p3ieNw3HxqVRu/DxlNOPkXMt/lvqbE/AkfyIv0tsX3tGkOhVpKMRXZRq9
 4o7stwX9Jmm+OvqVnfzttlTd4+VvUxwP+fanMsTFctMREfhZl2/FISZHT
 MVXHDQNELWuNFQummhgrRoMd4zahZqPJ9BvyNk0Sc4t2p/VWFeapINEl3
 h66OeYYVeoAHOqIKS6BlIIxqcz1025ol1/5CRlf46lpQq0paFR9t0dW/k
 0VWU3bJ18lA3BjJsLNeaAXiEuBJYkAlID0avujoGV/JCI0/zb63MLs9Dq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275135320"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="275135320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="502931388"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 16 Feb 2022 00:51:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 10:50:59 +0200
Date: Wed, 16 Feb 2022 10:50:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <Ygy68/f1ERpTKJJW@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215055154.15363-4-ramalingam.c@intel.com>
X-Patchwork-Hint: comment
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
Cc: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shankar Uma <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
> From: Jouni Högander <jouni.hogander@intel.com>
> 
> Currently ICL_PHY_MISC macro is returning offset 0x64C10 for PHY_E
> port. Correct offset is 0x64C14.

Why is it PHY_E and not PHY_F?

> 
> Fix this by handling PHY_E port seprately.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_snps_phy.c | 2 +-
>  drivers/gpu/drm/i915/i915_reg.h               | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> index c60575cb5368..f08061c748b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
> @@ -32,7 +32,7 @@ void intel_snps_phy_wait_for_calibration(struct drm_i915_private *i915)
>  		if (!intel_phy_is_snps(i915, phy))
>  			continue;
>  
> -		if (intel_de_wait_for_clear(i915, ICL_PHY_MISC(phy),
> +		if (intel_de_wait_for_clear(i915, DG2_PHY_MISC(phy),
>  					    DG2_PHY_DP_TX_ACK_MASK, 25))
>  			drm_err(&i915->drm, "SNPS PHY %c failed to calibrate after 25ms.\n",
>  				phy);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 4d12abb2d7ff..354c25f483cb 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9559,8 +9559,10 @@ enum skl_power_gate {
>  
>  #define _ICL_PHY_MISC_A		0x64C00
>  #define _ICL_PHY_MISC_B		0x64C04
> -#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A, \
> -						 _ICL_PHY_MISC_B)
> +#define _DG2_PHY_MISC_TC1	0x64C14 /* TC1="PHY E" but offset as if "PHY F" */
> +#define ICL_PHY_MISC(port)	_MMIO_PORT(port, _ICL_PHY_MISC_A, _ICL_PHY_MISC_B)
> +#define DG2_PHY_MISC(port)	((port) == PHY_E ? _MMIO(_DG2_PHY_MISC_TC1) : \
> +				 ICL_PHY_MISC(port))
>  #define  ICL_PHY_MISC_MUX_DDID			(1 << 28)
>  #define  ICL_PHY_MISC_DE_IO_COMP_PWR_DOWN	(1 << 23)
>  #define  DG2_PHY_DP_TX_ACK_MASK			REG_GENMASK(23, 20)
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
