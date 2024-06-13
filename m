Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF9906578
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7AA10E01F;
	Thu, 13 Jun 2024 07:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiVj8TVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2F10E01F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718264690; x=1749800690;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mat0Nl8hN7qH3WjxnG07lG+6tt73H7DJ4ySt3rVMcH4=;
 b=GiVj8TVDTPG1sS08U8n22e9hRSIxFDl90ayriznePkZjwFIwts/YBE9c
 HbM82PTZF5P6DasxO81fdRo8NTlNNyyytigXL4elorytXfrv/Ey8UJ1t8
 OsioGUzNnH4nrraVG2qbSNYqcIaQFBY+LDT5uSueJj/Ad/O4hgQe/KnQI
 t/A8SVXzXSHKxd0ZKOaQPeR4DLwKirkZ6SqBimqPCWQBO6M1XFY+/7wRS
 g/YAFUQCmfwH1oNcJScG5AoWH9L/0BzXFpZX99HkFwEp4mAW+fth9S5A0
 VKom3oQWLNy9jwd1TBaz3lwQs9c2Xr8PlyvdWHevs67uvcbW5fNJufWwS A==;
X-CSE-ConnectionGUID: g/kq3FhLQXmWztLSpeyE8A==
X-CSE-MsgGUID: akEeRwlhTVSIE2/edq2sYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14904567"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14904567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:44:49 -0700
X-CSE-ConnectionGUID: pry0s0CGSfaCQVaSS0q+ZA==
X-CSE-MsgGUID: xhFqHMHQQ12enTQfjMbgGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40757305"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.112])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 00:44:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Javier Martinez
 Canillas <javierm@redhat.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] drm/todo: Create a TODO item for additional HDMI work
In-Reply-To: <20240612143553.915966-1-mripard@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240612143553.915966-1-mripard@kernel.org>
Date: Thu, 13 Jun 2024 10:44:42 +0300
Message-ID: <87tthxi8wl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jun 2024, Maxime Ripard <mripard@kernel.org> wrote:
> We recently added some infrastructure to deal with HDMI but we're still
> lacking a couple of things. Add a TODO entry with the remaining items.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/todo.rst | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 2ea6ffc9b22b..52fd8672fb6d 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -633,10 +633,39 @@ long as that supports DMA. Otherwise importing can still needlessly fail.
>  
>  Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
>  
>  Level: Advanced
>  
> +Improve HDMI Infrastructure
> +---------------------------
> +
> +We have a bunch of helpers to handle HDMI and reduce the boilerplate in
> +drivers. Support so far includes HDMI 1.4 support, but we need to extend
> +it with:
> +
> +  - CEC handling support. CEC requires a bit of integration into every
> +    HDMI driver to set the device physical address according to the EDID
> +    in `.get_modes`, and to clear/reset it in the hotplug detection
> +    path. We should create the ``drm_atomic_helper_connector_hdmi_get_modes()``
> +    and ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helpers to handle
> +    this properly, and convert drivers to use them.

Furthermore, we should stop passing EDID to the CEC functions, and
instead use the source physical address we've parsed ourselves and
stored to connector->display_info.source_physical_address.

I.e. stop using

- drm_dp_cec_set_edid()
- cec_s_phys_addr_from_edid()
- cec_get_edid_phys_addr()

And instead use .source_physical_address and

- drm_dp_cec_attach()
- cec_s_phys_addr()

The main rationale is to avoid using a separate EDID parser that's
outside of the drm subsystem and unaware of struct drm_edid and frankly
cdoes not look very robust.


BR,
Jani.


> +
> +  - In order to support HDMI 2.0 properly, the scrambler parameters need
> +    to be moved into the state. This includes figuring out in
> +    drm_atomic_helper_connector_hdmi_check() if the scrambler and TMDS ratio
> +    need to be changed, and make the
> +    ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helper reset the
> +    scrambler status when the device is plugged and unplugged.
> +
> +  - We need to support YUV420 too.
> +
> +The `vc4` driver is a good example for all this.
> +
> +Contact: Maxime Ripard <mripard@kernel.org>
> +
> +Level: Intermediate
> +
>  
>  Better Testing
>  ==============
>  
>  Add unit tests using the Kernel Unit Testing (KUnit) framework

-- 
Jani Nikula, Intel
