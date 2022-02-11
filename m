Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62A4B247E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA5D10EA88;
	Fri, 11 Feb 2022 11:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C48B10EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579351; x=1676115351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oKU+556CH19q9JkpqQw/lSP+Woo1fSuxfhrkttxrgN8=;
 b=jCxdonz7YaTXfPLUBhNlWJSpZz8U2RjRxgz4aHGHMYhaNbX1E6M2R0D9
 bgzkFWE7ACSLOcDPbYux7Gnd6skCPqmCWAJWhbNxA0B2HqMM8CdFNGmSH
 j52DblNzLE6IccRQVoBoP2uVK+LUJE0N4OzTtzDq/jAiZFmgRZRtsnQg4
 f6Hmi1w5FeVfNgUjS13nRYSXHzRz+CJuF15fxWZfkz9JYALN3+/FHH9oN
 JO5EU4cvqQyAF9BDl158TekaTg4EhHrRJ+Crp3r9LK4nRlWkqUnOKMJaS
 uc8fC4dJfIKSgT6cl+MO3DKZPnQjkItX6ymywblLQGEH2/60IW+P8MT9G Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="312998286"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="312998286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="542052949"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIUCQ-003QO6-FQ; Fri, 11 Feb 2022 13:34:50 +0200
Date: Fri, 11 Feb 2022 13:34:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 5/6] MAINTAINERS: Add entry for Solomon SSD130x OLED
 displays DRM driver
Message-ID: <YgZJ2sV956zg9IXO@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211092157.2988713-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211092157.2988713-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 10:21:57AM +0100, Javier Martinez Canillas wrote:
> To make sure that tools like the get_maintainer.pl script will suggest
> to Cc me if patches are posted for this driver.
> 
> Also include the Device Tree binding for the old ssd1307fb fbdev driver
> since the new DRM driver was made compatible with the existing binding.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Adapt MAINTAINERS entry to point to the new drivers/gpu/drm/solomon directory.
> 
> Changes in v2:
> - Add Sam Ravnborg's acked-by to patch adding a MAINTAINERS entry (Sam Ravnborg)
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d03ad8da1f36..05c306986ab0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6102,6 +6102,13 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/repaper.txt
>  F:	drivers/gpu/drm/tiny/repaper.c
>  
> +DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +F:	drivers/gpu/drm/solomon/ssd130x*
> +
>  DRM DRIVER FOR QEMU'S CIRRUS DEVICE
>  M:	Dave Airlie <airlied@redhat.com>
>  M:	Gerd Hoffmann <kraxel@redhat.com>
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


