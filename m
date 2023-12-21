Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6481B27D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689E10E684;
	Thu, 21 Dec 2023 09:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F80010E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703151352; x=1734687352;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nefW0/r+izKmFBlTuYxpkBcVSV/ZlT5aXEglOcLLB4U=;
 b=ddKNL9/QByxkMy1tygv/VU2v8pgqbQpCUFq5L46Gcb6d2CiRiFlTHzWZ
 qVKIfIghrwzAMrMNJOYtChW0aMi1XrfDu57YjqIZT2EOlHqggquL3vNOQ
 UdsLkaQv0GWhVHXuPGeegn1ZYTob4S6ykL9fmjQFI8xVRrr5+Td5DMnu8
 PMHxaiUHk2IkhYE4IHLm642Hn7dTKQz2GJIhTNFMjUy93hQTfvJrDvvcN
 X3vSIlFVUvMYU+Yv8pfk6hSmcdaGGCZngwU3vFt1Ng0KY2u7ZTKrJ8e8y
 U173eKM4ym1KtX35wGkRov93vKgyqk3MmW4APWaTZLLNo33MYKb5PD4/r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="3188867"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="3188867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:35:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810918661"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="810918661"
Received: from sshurhav-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.227])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:35:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] ASoC: hdmi-codec: drop drm/drm_edid.h include
In-Reply-To: <20231219121210.1076152-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231214092856.4019251-1-jani.nikula@intel.com>
 <20231219121210.1076152-1-jani.nikula@intel.com>
Date: Thu, 21 Dec 2023 11:35:42 +0200
Message-ID: <8734vvuccx.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.
>
> There are some files that get drm/edid.h by proxy; include it where
> needed.
>
> v2-v4: Fix build (kernel test robot <lkp@intel.com>)
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> I'm pretty sure I haven't compiled everything that might implicitly
> depend on the include. However, the right thing to do is to include
> drm_edid.h where needed, not from somewhat random intermediate
> headers. I hope this uncovers anything I missed.

The kernel test robot came back with clean results.

Added a bunch more Cc's here. Ack to merge this via drm-misc-next,
please?

BR,
Jani.


> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c             | 1 +
>  include/sound/hdmi-codec.h                 | 1 -
>  6 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 9663601ce098..b9205d14d943 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -18,6 +18,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index e971b75e90ad..f3f130c1ef0a 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -21,6 +21,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 52d91a0df85e..fa63a21bdd1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1b88fb52726f..766c8d01e6b3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
>  #include <drm/display/drm_dp_aux_bus.h>
> +#include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f05e2c95a60d..34f807ed1c31 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -35,6 +35,7 @@
>  #include <drm/display/drm_scdc_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <linux/clk.h>
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 9b162ac1e08e..5e1a9eafd10f 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -12,7 +12,6 @@
>  
>  #include <linux/of_graph.h>
>  #include <linux/hdmi.h>
> -#include <drm/drm_edid.h>
>  #include <sound/asoundef.h>
>  #include <sound/soc.h>
>  #include <uapi/sound/asound.h>

-- 
Jani Nikula, Intel
