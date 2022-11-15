Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35872629D64
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603CA10E421;
	Tue, 15 Nov 2022 15:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217010E413;
 Tue, 15 Nov 2022 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668526094; x=1700062094;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QyVi8xwimHr/SBGDnhpw7L6AZK+eBVpkUqCWoyo7LzM=;
 b=I6yldLIRXJKlaD8Qyu1bVxRJ0QOc93dB7qUeqWLAbAXad3uYM6XCmfZE
 pKqMSKOzMuEjXKxTaQBR8898k4l5+ZyMl87Mz1RuQl0xlI95cE3kCbMtd
 iFQ4lVp73kuMJaUU3YzQuFd2jNfYOjXBHTJ5a4JKMIkkN+BOS46z+lwfW
 HUgMYBl+FNq2xMzVs0SlFr5CPeL+cDikDH89IsnesHlE6x8+XBOjXAIOv
 6VmMpeYSSiWG7r6yA1X/GuVpm2PCTUuFhSK8bIJ0stTXK/4A/HZI+jCIY
 /0pGnYS3pTKDdx9VuY0IfzqolX61EHjSB1PwlNqp45myyjTLqxM9Twuv/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="376545386"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="376545386"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:28:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763949981"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="763949981"
Received: from golubevv-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.58.73])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:28:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: Re: [PATCH v2] drm/i915: remove circ_buf.h includes
In-Reply-To: <20221115070302.4064-1-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221115070302.4064-1-jirislaby@kernel.org>
Date: Tue, 15 Nov 2022 17:28:07 +0200
Message-ID: <87o7t82q60.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> The last user of macros from that include was removed in 2018 by the
> commit below.
>
> Fixes: 6cc42152b02b ("drm/i915: Remove support for legacy debugfs crc interface")
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Pushed to drm-intel-next, thanks for the patch!

BR,
Jani.

> ---
>
> Notes:
>     [v2] fixed e-mail setup
>
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c | 1 -
>  drivers/gpu/drm/i915/i915_irq.c               | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index 673454fbf784..e9774670e3f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -24,7 +24,6 @@
>   *
>   */
>  
> -#include <linux/circ_buf.h>
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index b0180ea38de0..a815a45a6e6b 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -28,7 +28,6 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> -#include <linux/circ_buf.h>
>  #include <linux/slab.h>
>  #include <linux/sysrq.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
