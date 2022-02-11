Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D54B247F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7061210E9A5;
	Fri, 11 Feb 2022 11:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188BF10E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579363; x=1676115363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bTdjHFPr4nUGXu4pkdc+I1g9MpzgJ+mPYB+7OmSpI0M=;
 b=MMP5QmckpdYpIRE/HiLT2Z7/e6znx9IH91hnajBKHkWJik7XRR3OG39p
 392nFhOOJkmYq9QvWgDO92xloY1np7aeXWQVViwGPZT34BKCNQlYQ7D07
 lTTZIH9Jyn9bg3v2thLOUrNYsFxVdngqYAZKIkpnOg+nPLJb4lllnHxWr
 bwULEo2Gf6hqv5WR/5Ooq5SMofm7+fYLnNngYCMyBWJzHKflePPVMg9au
 l0i8n6N5VpYDgmiomGZwHeMfDpf5V8QkuMWYOq1EPgQ9NYmZniOJD1dxQ
 4bRwZokrpmQBOvJAFbRS3Qz7ifCYMl3E5a8RAV9sri1P8weOFrYFeEuWs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="336138309"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="336138309"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:36:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="500756801"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:36:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIUCc-003QOI-Io; Fri, 11 Feb 2022 13:35:02 +0200
Date: Fri, 11 Feb 2022 13:35:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 6/6] dt-bindings: display: ssd1307fb: Add myself as
 binding co-maintainer
Message-ID: <YgZJ5jX9BUZ4/0Ed@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211092253.2988843-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211092253.2988843-1-javierm@redhat.com>
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

On Fri, Feb 11, 2022 at 10:22:53AM +0100, Javier Martinez Canillas wrote:
> The ssd130x DRM driver also makes use of this Device Tree binding to allow
> existing users of the fbdev driver to migrate without the need to change
> their Device Trees.
> 
> Add myself as another maintainer of the binding, to make sure that I will
> be on Cc when patches are proposed for it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v4:
> - Add Rob Herring Acked-by tag to patch adding as DT binding co-maintainer.
> 
> Changes in v2:
> - Add myself as co-maintainer of the ssd1370fb DT binding (Sam Ravnborg).
> 
>  Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 2ed2a7d0ca2f..9baafd0c42dd 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -8,6 +8,7 @@ title: Solomon SSD1307 OLED Controller Framebuffer
>  
>  maintainers:
>    - Maxime Ripard <mripard@kernel.org>
> +  - Javier Martinez Canillas <javierm@redhat.com>
>  
>  properties:
>    compatible:
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


