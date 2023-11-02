Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1E7DF8ED
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C306610E96D;
	Thu,  2 Nov 2023 17:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A26F10E96C;
 Thu,  2 Nov 2023 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698946854; x=1730482854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nsYlMTWUww8YnOWzQWMLZoiChKl1M1Xnh9+qYn0rJ5Q=;
 b=M1IJDcCsYRAQYqbeNQMlw8Gjyv76DrwFYZiJ7rBPDl0/C0o6Fy8+F+5S
 bKsNGu2pesnxiHt22lmhX/l0MLkACP5ZT6vxssnQyZyEM/pFDck5rkQ/X
 vmsKYVkh7AUAp0Welhb7ssIdwC8Td5gKI3KlPt0cg4fcfCrI6Ewu6SvSH
 6yxh4No9hmG0Bv0eY5lD2Gic9G5K8HVgEhKJfgzFCxI9/BoSSj5B9aqlS
 S58QFMwFxeRCmz6II18GcnsCudFeHjUGIXIOKh5lq7N4MYrzSMDHENLCz
 OAPfGVAYJcjCLokqsuuzpZffI5G1gvc9Zjh/yshDguYdfE+s/ChOovBcz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10306072"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="10306072"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761348091"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="761348091"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:40:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qybgU-0000000AlQ2-1Eg2; Thu, 02 Nov 2023 19:40:46 +0200
Date: Thu, 2 Nov 2023 19:40:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 01/15] drm/i915/dsi: assume BXT gpio works
 for non-native GPIO
Message-ID: <ZUPfHhHOMqrBEFZZ@smile.fi.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
 <20231102151228.668842-2-andriy.shevchenko@linux.intel.com>
 <ZUPX8RgtrCX8B_Cg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUPX8RgtrCX8B_Cg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Nov 02, 2023 at 07:10:09PM +0200, Ville Syrjälä wrote:
> On Thu, Nov 02, 2023 at 05:12:14PM +0200, Andy Shevchenko wrote:

...

> >  	if (native)
> >  		icl_native_gpio_set_value(dev_priv, gpio_number, value);
> >  	else if (DISPLAY_VER(dev_priv) >= 11)
> > -		icl_exec_gpio(connector, gpio_source, gpio_index, value);
> > +		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
> 
> We could just drop this whole branch since we end up in bxt_exec_gpio()
> in the end anyway. Or we drop the final else and make this one check for
> DISPLAY_VER >=9.

Looking at the code, I'm not sure how we can get rid of it, but the second
option is feasible.

> >  	else if (IS_VALLEYVIEW(dev_priv))
> >  		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
> >  	else if (IS_CHERRYVIEW(dev_priv))

-- 
With Best Regards,
Andy Shevchenko


