Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2A7DF862
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE1C10E955;
	Thu,  2 Nov 2023 17:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94C10E954;
 Thu,  2 Nov 2023 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698945035; x=1730481035;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l3DEo/2hyL2Es/18G2qmyrNiJQ7yZh7GfBi7w0KGeh8=;
 b=VlJ39CpDwyhtf1GCTOMYTB0kSzmOLDQfO4SvY9LMeoyZvvbimjwWFiPl
 xEm028MIs5gbQ1dEefFJT062D4hJSxDCbxG7AZQ+qsy1/h0/tIPJKXCj5
 TGmMFsYBg9C3u14/jvme5XK1Xvs+E5RwcbutNdfEMkdCBCZ7M+AyUbGdm
 XBsIhKIDtTVdw0mcwF7I72FQpkbFVhjIjU37dwQsapDz4LOTuq4zQ5iF9
 0oFXtleXzBhvnSGps1nkXM5efILJlrlsb65iEglhBniddd7yMo4u1qzrI
 1mps8jNuSR3cfFXlfWx4M6kkICtTcj89k3oiC2uIoIa4RKg913T4/3pWh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379158856"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="379158856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="754861339"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="754861339"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 02 Nov 2023 10:10:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 19:10:09 +0200
Date: Thu, 2 Nov 2023 19:10:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 01/15] drm/i915/dsi: assume BXT gpio works
 for non-native GPIO
Message-ID: <ZUPX8RgtrCX8B_Cg@intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
 <20231102151228.668842-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102151228.668842-2-andriy.shevchenko@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 05:12:14PM +0200, Andy Shevchenko wrote:
> From: Jani Nikula <jani.nikula@intel.com>
> 
> Purely a guess. Drop the nop function.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 24b2cbcfc1ef..b2c0cc11f8c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -372,14 +372,6 @@ static void bxt_exec_gpio(struct intel_connector *connector,
>  	gpiod_set_value(gpio_desc, value);
>  }
>  
> -static void icl_exec_gpio(struct intel_connector *connector,
> -			  u8 gpio_source, u8 gpio_index, bool value)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> -
> -	drm_dbg_kms(&dev_priv->drm, "Skipping ICL GPIO element execution\n");
> -}
> -
>  enum {
>  	MIPI_RESET_1 = 0,
>  	MIPI_AVDD_EN_1,
> @@ -491,7 +483,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
>  	if (native)
>  		icl_native_gpio_set_value(dev_priv, gpio_number, value);
>  	else if (DISPLAY_VER(dev_priv) >= 11)
> -		icl_exec_gpio(connector, gpio_source, gpio_index, value);
> +		bxt_exec_gpio(connector, gpio_source, gpio_index, value);

We could just drop this whole branch since we end up in bxt_exec_gpio()
in the end anyway. Or we drop the final else and make this one check for
DISPLAY_VER >=9.

>  	else if (IS_VALLEYVIEW(dev_priv))
>  		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
>  	else if (IS_CHERRYVIEW(dev_priv))
> -- 
> 2.40.0.1.gaa8946217a0b

-- 
Ville Syrjälä
Intel
