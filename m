Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF979DE80E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92510E2A7;
	Fri, 29 Nov 2024 13:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Be684X0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9193C10E2A9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:53:07 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so2071344a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888386; x=1733493186; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y/6PyCBkY1vrkX+kqfrrIcFxpzFnIRWJUtmo58vJb+0=;
 b=Be684X0j1aj92flsT8//Xc5NiwdwFAOX0/HOaGYJiIVTx7sWsvMXHrjp7amTtaROBZ
 llJA9ODmngVX3miaoDIYAJ1qICk2XDeIJooSNvwFSzFixgWsi28PQE1H/CRv9G+wvh1C
 vKn3vxjFySqVjSi81uFs6ggkrExaj2OWJQdTa7kOllxxXcAB3hECnfUSA0mVPM8L+nt6
 M0W8f2oBzu1/YCkejEFv6WSlIdroV9rF4WVqKmGRjBfN5Fcdz0sWgVqYoAZmubKyvkK7
 EAw6x7A66jf8qL92yT1mPUV4WtCMYUaX/uZ+sTVFQum3BcDjR31UvvnHTsncDOi+cUHc
 skUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888386; x=1733493186;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/6PyCBkY1vrkX+kqfrrIcFxpzFnIRWJUtmo58vJb+0=;
 b=GUmcgZJ4KW4cKrB4E6cZt3COpE5IcA11kDV81oDlY+RRznR44yZldcMB6LyLURhxdV
 lT7gLBImGZAQjEgbbBrwr/zguA5M5R3L8yqWTF//7j/Ar9DCOD+0hgYXYCV4f7QgPRGQ
 T7tWU9DX5t/KkX3FctFKaIfSpyKl2wjzibAsfKPm6v29u1VyPPA/TPkIYBP4Tzv31Yyg
 nj9c28YWGoUhK8t6iFV24bfK3ivydvamKgQtRrWEXrb/aSzo3K79U7ilKNrWLR9tROPb
 /IIrqByYWZMiJQ33joBC79N+OyqQCkmzUz9Fww9m/dynt3ucX5nLubIVFU5zjmkdwlkD
 CwLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNcAnrOjbwWeIReM7eWjQ+xDNBLETI8vfdmWLtL7uhlckPLF1DpBnZo0SSXJODVgLBiCM7jSBiP8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnsxwf5uhnFW+uN8BUduTRUiCl78hZRr5LXr/MOtQFnzhSD/gR
 LnxQZmbDt9Yus7mpEkmhbZsUWYOrQ+qjwN9HU+N7L9sglq9IlCwzDGnMW7z46kaXYCZK8puHjVw
 pT8v6oF/guM9DmgsxfZUj9/EWYgYbvHkhu/jczg==
X-Gm-Gg: ASbGnctgyeY6U9vMtphb6F+6l84ybhoNWdCED4JwKv84N9Pxf4tSZ2Kc0yfJAU1oSUV
 jjFd6xrEgGvncst9qrUEvxWB9Ex5DO/Q=
X-Google-Smtp-Source: AGHT+IEXbo3g37x6S9nud/YDl8MMhJ+axeHFVYybn/OHHchZEd90wPzaHJLOrky8M8F0K8J+KDpTyQqUYKWH/+5/E5M=
X-Received: by 2002:a05:6402:4409:b0:5cf:ead2:2a8f with SMTP id
 4fb4d7f45d1cf-5d080c6c4admr11268097a12.33.1732888385859; Fri, 29 Nov 2024
 05:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:52:59 +0200
Message-ID: <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> Introduce a maximum width constraint for modes during validation. This
> ensures that the modes are filtered based on hardware capabilities,
> specifically addressing the line buffer limitations of individual pipes.

This doesn't describe, why this is necessary. What does "buffer
limitations of individual pipes" mean?
If the platforms have hw capabilities like being unable to support 8k
or 10k, it should go to platform data

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  4 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4c83402fc7e0d41cb7621fa2efda043269d0a608..eb6fb76c68e505fafbec563440e9784f51e1894b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -944,6 +944,9 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>         msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>         link_info = &msm_dp_display->panel->link_info;
>
> +       if (mode->hdisplay > msm_dp_display->panel->max_dp_width)
> +               return MODE_BAD;
> +
>         if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
>             msm_dp_display->panel->vsc_sdp_supported)
>                 mode_pclk_khz /= 2;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index ecbc2d92f546a346ee53adcf1b060933e4f54317..7a11f7eeb691976f06afc7aff67650397d7deb90 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -11,6 +11,7 @@
>  #include "disp/msm_disp_snapshot.h"
>
>  #define DP_MAX_PIXEL_CLK_KHZ   675000
> +#define DP_MAX_WIDTH   7680
>
>  struct msm_dp {
>         struct drm_device *drm_dev;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 8654180aa259234bbd41f4f88c13c485f9791b1d..10501e301c5e073d8d34093b86a15d72e646a01f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include "dp_panel.h"
> +#include "dp_display.h"
>  #include "dp_utils.h"
>
>  #include <drm/drm_connector.h>
> @@ -455,6 +456,16 @@ static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
>         return frequency;
>  }
>
> +static u32 msm_dp_panel_max_width(struct device_node *of_node)
> +{
> +       u32 max_width = 0;
> +
> +       if (of_property_read_u32(of_node, "max-width", &max_width))
> +               max_width = DP_MAX_WIDTH;
> +
> +       return max_width;

msm_dp_panel->max_dp_width = DP_MAX_WIDTH;
of_property_read_u32(of_node, "max-width", &msm_dp_panel->max_dp_width);

> +}
> +
>  static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>  {
>         struct msm_dp_panel_private *panel;
> @@ -490,6 +501,8 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>         if (!msm_dp_panel->max_dp_link_rate)
>                 msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
>
> +       msm_dp_panel->max_dp_width = msm_dp_panel_max_width(of_node);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 7603b92c32902bd3d4485539bd6308537ff75a2c..61513644161209c243bbb623ee4ded951b2a0597 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -51,6 +51,7 @@ struct msm_dp_panel {
>         u32 lane_map[DP_MAX_NUM_DP_LANES];
>         u32 max_dp_lanes;
>         u32 max_dp_link_rate;
> +       u32 max_dp_width;
>
>         u32 max_bw_code;
>  };
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
