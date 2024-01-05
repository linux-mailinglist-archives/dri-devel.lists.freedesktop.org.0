Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CF825796
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC110E645;
	Fri,  5 Jan 2024 16:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A617A10E634;
 Fri,  5 Jan 2024 16:04:27 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-20400d5b54eso928683fac.1; 
 Fri, 05 Jan 2024 08:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704470667; x=1705075467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whv4GannslDB5rLdYo9kigOWmeo7QZDRfIfNrJXqKEw=;
 b=fpzkmB6uCP3FqUw8dsOFTj46wIu+teFmGCtbMxWIp8yg0DKUoRGyQrke+CulbvEUXf
 jLeD+G3BUUY8MHbSL3ejEz7t0AUmwXZUVBn/ExifwmiyaxVBNFTC57u6B+C3X7wWPq7h
 OLXNVN/ABd8vbQV1oKZnpzazX1CcTgVZ28hQFK3YQPwkev9fLP8hrOdrg60hFlgSPH6g
 b/fWXKOk2OJz4JT06fzLmw3NjQQ3uKVsdbS62d6y4GALoCBjsBvB3EP8Yyl7Y9p1HJd+
 SI8ryy3ZB7oSN+UnnKOfI1mLdQEDT2niM+SFfIe/EBQPpfENXUf2E4LEMdFB6mqnsZ1L
 xpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704470667; x=1705075467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whv4GannslDB5rLdYo9kigOWmeo7QZDRfIfNrJXqKEw=;
 b=mjKyIbHRikwIK+Hi+Q6gICnjKACD9zlScQk8EJSP/1GTrBdnxirrBmf9dyEvdr6zkD
 yA8pLyzDE/FFN/wfstd/5Na6YeiSsS5FBEdQgLVw1uwjVo3HhAXHcdJcCf3Kp3OtqPwz
 iWd4PNAkhGmzx/nP/CuZk/Y7WNs85mC0eZ93UI8FPpwu+u/SE2mfIA64yFSX5rIZ0miG
 WdfE3aOvJT+cdAshIO8wvyItXKCKUYfv23EQhg+zr7R863ASVjcjxXm1sFY2uPCkU/Az
 oj4dwuW0Y/HnpvjRM6y/gEUdyOfVQRCLPlIihboUaomxKZLVDQjSvZrFQJM+n/z5hV0a
 vPRA==
X-Gm-Message-State: AOJu0YyG4m/0wvibm4BChV/Eyb9F+YZ/FKoqkgeCqIc3OK1Kn9VL+oTR
 5ipcwNF8H0xIdG6m2dzbHn7aC4tRPGQx12CIQxk=
X-Google-Smtp-Source: AGHT+IEyWFcej5XGL9+gHh+h2IKOiy8VOKFo3RMc9yjKxFm8wxHp0Hv+8oSB86SBuzomapKqFUADrLdZsYPC/g2EVRs=
X-Received: by 2002:a05:6870:a118:b0:205:c4d3:ef8d with SMTP id
 m24-20020a056870a11800b00205c4d3ef8dmr2376611oae.104.1704470666931; Fri, 05
 Jan 2024 08:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <20240104201632.1100753-3-jani.nikula@intel.com>
In-Reply-To: <20240104201632.1100753-3-jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jan 2024 11:04:15 -0500
Message-ID: <CADnq5_OBNc8TOErS+sXMB2OuaqT0PdOU7O0+MHGU2pEKF10GTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: hdmi-codec: drop drm/drm_edid.h include
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 4, 2024 at 3:17=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> hdmi-codec.h does not appear to directly need drm/drm_edid.h for
> anything. Remove it.
>
> There are some files that get drm/drm_edid.h by proxy; include it where
> needed.
>
> v2-v4: Fix build (kernel test robot <lkp@intel.com>)
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
>  drivers/gpu/drm/tegra/hdmi.c               | 1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c             | 1 +
>  include/sound/hdmi-codec.h                 | 1 -
>  7 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
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
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
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
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
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
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index d37d599aec27..c8e1bbebdffe 100644
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
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 417fb884240a..09987e372e3e 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -24,6 +24,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
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
> --
> 2.39.2
>
