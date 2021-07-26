Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67AA3D583E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 13:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7616F573;
	Mon, 26 Jul 2021 11:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA966F573;
 Mon, 26 Jul 2021 11:06:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="276006735"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="276006735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:06:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="416512174"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 04:06:52 -0700
Date: Mon, 26 Jul 2021 07:06:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 09/30] drm/i915/display: remove explicit CNL
 handling from intel_display_debugfs.c
Message-ID: <YP6XS4SBog7Icdw6@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-10-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-10-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:53PM -0700, Lucas De Marchi wrote:
> Only one reference to CNL that is not needed, but code is the same for
> DISPLAY_VER >= 11, so leave the code around and just remove the special
> case for CNL.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 2cf742a0b957..8fdacb252bb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2500,7 +2500,7 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
>  				    connector, &i915_hdcp_sink_capability_fops);
>  	}
>  
> -	if ((DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) &&
> +	if (DISPLAY_VER(dev_priv) >= 11 &&
>  	    ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
>  	    !to_intel_connector(connector)->mst_port) ||
>  	    connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
