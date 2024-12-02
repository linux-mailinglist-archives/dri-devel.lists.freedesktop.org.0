Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01789DFF40
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205C410E6C4;
	Mon,  2 Dec 2024 10:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dh9oDKVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AB710E6C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 10:46:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53de6b7da14so4065684e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 02:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733136375; x=1733741175; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sW5g5zNCxuwuA9CkgMzqa+U4e2iYbFVfy38zh54cXVg=;
 b=dh9oDKVDUQJo40Us2JnD4UykEZdFf0vFoDceWnnjeiMOqJXGF75piy+Lc9es6g/k4n
 1A54aH+zpmfUlAOMUAMT+qM55xrFo7Idwc8f87RaRPxpOe/JudeVGDO7va0bN8nfCNQl
 DheYhRTa33CJihAukZX8FaHHzwiiuXNnC+Z4mrc6EnRMurv1h6hVlvgEO4v0dEEa7soQ
 p2xIFU9Q3po1eA3ZGIS91ZbIQuQ6RnFmVGE9sjxEmt0kkyqkZT7AjbDAv2t6hTxpoaxN
 nUtHuidoiBM1sZqLlJYjQfHjy0HYhLpVww+/vGubB+Yl0/spu/Dh334d+YvNqIlUEL6P
 Qntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733136375; x=1733741175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sW5g5zNCxuwuA9CkgMzqa+U4e2iYbFVfy38zh54cXVg=;
 b=A25gGKHX8Cl/zuYADZZGPTJBCGeL0T7y/W+GnYuB+Hw9FhoKNkS8m0gK5xSESbb0Ib
 Bq8shpyS1DMuzcT3y+B7H5Mbclesj+RecHUyImO5eorne0xPLpJoIfE+/yF4MaHtOSbZ
 VZBqX1Lf8RsofjgEE7+fJsMXbpqxDIqP01sSRsBmQuTX6rHp0Rm0u9enx246St9lBzF0
 sR5zq9kJn7KNAGMG7QnG2lwZRnOm+YJ0BzMJ+ieNmWdJ0UnuFVy16phbGtPNFT5oN13o
 iThktLnpU0DFirJzaR3pIq22mMUp/k8LvioxH83xA6GjhDX4fRQ4uvMXfKJxBITaeeOP
 i8rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUraELmqhtfWTsG/XSy/kfsJxREHVfcBvfvGRl9YTn6ZNPNEwXuXrILKSjRY312k09LuykRGdBD9xQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl2T7QW/uuwk+WNHdTiOBX8QvgCWoTNUXDfh9x+feUddZgOAzy
 aIk4mu6h+fgd9sxe+B/JBokYi64jRjmHWoz0Z8iyqm3OQXE4BQiJclkdlX8UxYA=
X-Gm-Gg: ASbGncubk8MIayX1tj85ijl4A1g/4pjpniQRml0TnS0jZi42QPF8YdvRS2rWULxlyr0
 xiaLJk+SvYVBkwH/OI+/BwjZta1iEo4o+hFsdbSSUc4DyGSl9w1GV0A/AVh/vcYQNuJsp74sVGb
 Lk2dbvx4/vRqLQAx6rrpJY66S5ZNzLrv+JlefTEwDdDmDEx48A0K5cDjBV/6YqfCXdLMku8QMCm
 jqum0Q54rcWW6svzvPpGxMbfHfjEzV6ay5JSKnS3cFs7x0W7z6kfTGr6hom+QuhAhZj0cZ2mGo8
 +rr8zUumYB5YH+/DonDhZJSU7r8yYA==
X-Google-Smtp-Source: AGHT+IHSCZMOjWupesy5/0HxHZeda2UBmkbWGoOoF1ozJXCQtPgXFWsr4uPvfC7x0xE42+mBQm6WWA==
X-Received: by 2002:a05:6512:124e:b0:53d:d3bc:cc11 with SMTP id
 2adb3069b0e04-53df0112095mr7509493e87.48.1733136374959; 
 Mon, 02 Dec 2024 02:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df644341bsm1424070e87.99.2024.12.02.02.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:46:14 -0800 (PST)
Date: Mon, 2 Dec 2024 12:46:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
Message-ID: <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >> Add the ability to configure lane mapping for the DP controller. This is
> >> required when the platform's lane mapping does not follow the default
> >> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >> `data-lane` property in the devicetree. This property defines the
> >> logical-to-physical lane mapping sequence, ensuring correct lane
> >> assignment for non-default configurations.
> >>
> >> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>

> >> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>         struct msm_dp_panel_private *panel;
> >>         struct device_node *of_node;
> >>         int cnt;
> >> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
> >>
> >>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> >>         of_node = panel->dev->of_node;
> >> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> >>         }
> >>
> >> -       if (cnt > 0)
> >> +       if (cnt > 0) {
> >> +               struct device_node *endpoint;
> >> +
> >>                 msm_dp_panel->max_dp_lanes = cnt;
> >> -       else
> >> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> >> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> >> +       } else {
> >>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> >> +       }
> > 
> > Why? This sounds more like dp_catalog or (after the refactoring at
> > [1]) dp_ctrl. But not the dp_panel.
> > 
> > [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
> > 
> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?

msm_dp_catalog_get() is going to be removed. Since the functions that
are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
the best place. A better option might be to move max_dp_lanes and
max_dp_link_rate to dp_link.c as those are link params. Then
lane_mapping also logically becomes a part of dp_link module.

But now I have a more important question (triggered by Krishna's email
about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
platform? Or is it being demoted to USB 2 with nobody noticing that?

If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
PHY, where we handle lanes and orientation switching?

> >> +
> >> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
> >>
> >>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
> >>         if (!msm_dp_panel->max_dp_link_rate)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> @@ -11,6 +11,8 @@
> >>  #include "dp_aux.h"
> >>  #include "dp_link.h"
> >>
> >> +#define DP_MAX_NUM_DP_LANES    4
> >> +
> >>  struct edid;
> >>
> >>  struct msm_dp_display_mode {
> >> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>         bool video_test;
> >>         bool vsc_sdp_supported;
> >>
> >> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>         u32 max_dp_lanes;
> >>         u32 max_dp_link_rate;
> >>
> >>
> >> --
> >> 2.25.1
> >>
> > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
