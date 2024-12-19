Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CA59F8744
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7810EDCD;
	Thu, 19 Dec 2024 21:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="anhNowBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6A710E4B9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:45:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so1097581e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 13:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734644724; x=1735249524; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZJTcfRutqlaUTKnzrx55J7msIGx8wo0YdU8Xm5ECNAo=;
 b=anhNowBLM6yEx1MuD9cxdCbsd+bJ+ydNBg6ahPlciioVuQhgVD94BMw9bU1Z+6K0fH
 AgG4mIDkBCViQ6bGYpgZ6Vb0BHiC/ooMZqvR2+sh13BJFXTSpLs5YU16mIKq886l85ZU
 zz8fsuFJ3U5IMZrznYNpGcfA1MGKWD9mFFclvxfqvi8AOPzcTeIECCLRv5avevfeSVeP
 szhznTeyXCVIJpVwkyIxfLl+xpnTLRNVUkElkB5a9a5WQfJ6gNd5LXkqLk0/TsC3tKjC
 1hqCBTLSyFvqflTlMhMeaP7ZdWzdSngYU2ZSuN64k7UrHTgQlaSPuOpgjNM31L9EDW2C
 uWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734644724; x=1735249524;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJTcfRutqlaUTKnzrx55J7msIGx8wo0YdU8Xm5ECNAo=;
 b=M5t1YW36TV8mjA6cwgk91rQzqAgwaOLnfDO6Rn0Q5i56I+yGszfvlLhIzHUuwQhOSE
 Oe/1KVCjpcqTEVLNKWzoVDAWpiXS5dDYLQibpG8Hq0RW2jTUfjHTsLDaF407shTR/hfc
 ojNVKpOXrW5r1QryipvZOjQ5dnZjgOSGIdFMJRr7XTn0mDwLnAF1vFrSp+/2zIv9xHoo
 5xEeEudV7b2RsqDd3mRspPaYl48Hn5SHlkP8a+5Du+WPLa3LoASESltA4nmpyft7cEsG
 /IePBuon08UMMsDhnlXUEk3/XglYbkU7kCe7lOuD+wlTstq99G87joly9oVj8FXjqpUf
 IcxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO5CfbzDC+lBRbIKyQcJyLRpUZKoX+n/dHkFVfY7JosGXjv6h+047pJ6QZkEGuby7vsldDlBYWhKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGXhwoShJbmd33KNCjgYe1O7/NmGTs9lCqTt0qDCBdcpBLiQwp
 mKebEoPHVMDTcvHlI4Yyft23KP+sfuRDsWEOPGFLlWBAFpbTRRJI4klzagxrgsg=
X-Gm-Gg: ASbGncuVeX7WYDCmb9XNcOvU3N6n+LzYqVrLtEA/IMqb0fdT8Id+zFW4H1kD2ZHSL1s
 T4CvY3gb7ytb6vvtPEoWDecSVjue9HOfBJm4F9rW0Lj6MNQQWXZTc7a7JSnUPPpjz49TMlK92R5
 OGYfjRvK9EmeoSF6x+mnJOS3g/gkaPMLFGqr3igMhD7oYtMsxnL9PwRzAy/pFg9B+YgYCUgwipz
 ZYCl1SUblrkTeUMhA8H9m1qrHJy3MstSCT2evI4+AAjCTSGGO1GriMp7G2M+4eF2xRQH016YEEI
 nkfiSXcNukW3zlOTddAIMOERWs4UJc3LuKxd
X-Google-Smtp-Source: AGHT+IECfZo34PvNSYVVnPtNNgkO9WLPh5KUcWRTUkNqE3h3aVJ7oEoB32W+HgdGLQFgl5lIcwqKzA==
X-Received: by 2002:a05:6512:2807:b0:53e:38fd:7514 with SMTP id
 2adb3069b0e04-5422956bdaamr71293e87.51.1734644724413; 
 Thu, 19 Dec 2024 13:45:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832b84sm285319e87.269.2024.12.19.13.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 13:45:23 -0800 (PST)
Date: Thu, 19 Dec 2024 23:45:20 +0200
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
Message-ID: <h6tmbuv26tdv633udphttsydpbvnwownulvglcxktdaxqdhtvw@ereftfs5hiso>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
 <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
 <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
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

On Thu, Dec 19, 2024 at 06:36:38PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/5/2024 7:40 PM, Dmitry Baryshkov wrote:
> > On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> >>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>
> >>>>>> Add the ability to configure lane mapping for the DP controller. This is
> >>>>>> required when the platform's lane mapping does not follow the default
> >>>>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >>>>>> `data-lane` property in the devicetree. This property defines the
> >>>>>> logical-to-physical lane mapping sequence, ensuring correct lane
> >>>>>> assignment for non-default configurations.
> >>>>>>
> >>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>>>>>
> >>>
> >>>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>         struct msm_dp_panel_private *panel;
> >>>>>>         struct device_node *of_node;
> >>>>>>         int cnt;
> >>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
> >>>>>>
> >>>>>>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> >>>>>>         of_node = panel->dev->of_node;
> >>>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> >>>>>>         }
> >>>>>>
> >>>>>> -       if (cnt > 0)
> >>>>>> +       if (cnt > 0) {
> >>>>>> +               struct device_node *endpoint;
> >>>>>> +
> >>>>>>                 msm_dp_panel->max_dp_lanes = cnt;
> >>>>>> -       else
> >>>>>> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> >>>>>> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> >>>>>> +       } else {
> >>>>>>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> >>>>>> +       }
> >>>>>
> >>>>> Why? This sounds more like dp_catalog or (after the refactoring at
> >>>>> [1]) dp_ctrl. But not the dp_panel.
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
> >>>>>
> >>>> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
> >>>> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
> >>>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?
> >>>
> >>> msm_dp_catalog_get() is going to be removed. Since the functions that
> >>> are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
> >>> the best place. A better option might be to move max_dp_lanes and
> >>> max_dp_link_rate to dp_link.c as those are link params. Then
> >>> lane_mapping also logically becomes a part of dp_link module.
> >>>
> >>> But now I have a more important question (triggered by Krishna's email
> >>> about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
> >>> platform? Or is it being demoted to USB 2 with nobody noticing that?
> >>>
> >>> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
> >>> PHY, where we handle lanes and orientation switching?
> >>>
> >> I have checked the DP hardware programming guide and also discussed it with Krishna.
> >>
> >> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swap for mainlink and AUX, but it doesn't support lane swap feature.'
> >>
> >> The lane swap mainly refers to the logical to physical mapping between the DP controller and the DP PHY. The PHY handles polarity inversion, and the lane map does not affect USB behavior.
> >>
> >> On the QCS615 platform, we have also tested when DP works with lane swap, other USB 3.0 ports can works normally at super speed.
> > 
> > "Other USB 3.0 ports"? What does that mean? Please correct me if I'm
> > wrong, you should have a USB+DP combo port that is being managed with
> > combo PHY. Does USB 3 work on that port?
> > 
> > In other words, where the order of lanes is actually inverted? Between
> > DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
> > Granted that SM6150 was supported in msm-4.14 could you possibly point
> > out a corresponding commit or a set of commits from that kernel?
> > 
> For "Other USB 3.0 ports", as replied in USBC driver, USB3 primary phy works for other four USB type-A port.

So if that's the USB3 primary, then why do you mention here at all? We
are taling about the secondary USB3 + DP.

> The REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING mapping determines how logical lanes (0, 1, 2, 3) map to physical lanes sent to the PHY.
> This ensures alignment with hardware requirements.
> The PHY’s polarity inversion only adjusts signal polarity and doesn’t affect lane mapping.
> Both DP ctrl and PHY lane related config will not affect USB phy.

Probably we misundersand each other. The DP PHY should have orientation
switch register, which controls whether 2-lane DP uses lanes 0/1 or 2/3.
Can you use that register?

Also, could you _please_ answer the question that I have asked? Is the
order of lanes inverted between the DP controller and DP PHY? Or between
DP PHY and the DP connector? If one uses USB3 signals coming from this
port (yes, on the other board, not on the Ride), would they also need to
switch the order of USB3 lanes? If one uses a DP-over-USB-C, are DP
lanes are swapped?

> Without extra Type-C mapping, the DP controller’s mapping indirectly decides how signals are transmitted through Type-C.
> Mapping ensures proper data transmission and compatibility across interfaces.
> 
> We only found sm6150 need this lane mapping config, 
> For msm 4.14, please refer these links,
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/arch/arm64/boot/dts/qcom/sm6150-sde.dtsi (qcom,logical2physical-lane-map)
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_parser.c (dp_parser_misc)
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c (dp_catalog_ctrl_lane_mapping_v200)
> 
> If need process orientation info like dp_catalog_ctrl_lane_mapping_v200, 
> then 
> if implement in DP phy, then we need config dp_link register in PHY,
> if implement in DP link, then we need pass orientation info to DP driver, perhaps we could add a new attribute to the phy_configure_opts_dp structure to pass this.
> Do you have any suggestions?

Does SW_PORTSEL_VAL affect the DP lanes on this platform?

> 
> >>
> >> Additionally, if it were placed on the PHY side, the PHY would need access to dp_link’s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
> > 
> > I was thinking about inverting the SW_PORTSEL_VAL bit.
> > 
> >> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_map move to dp_link side is better.
> >>
> >>>>>> +
> >>>>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
> >>>>>>
> >>>>>>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
> >>>>>>         if (!msm_dp_panel->max_dp_link_rate)
> >>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> @@ -11,6 +11,8 @@
> >>>>>>  #include "dp_aux.h"
> >>>>>>  #include "dp_link.h"
> >>>>>>
> >>>>>> +#define DP_MAX_NUM_DP_LANES    4
> >>>>>> +
> >>>>>>  struct edid;
> >>>>>>
> >>>>>>  struct msm_dp_display_mode {
> >>>>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>>>>>         bool video_test;
> >>>>>>         bool vsc_sdp_supported;
> >>>>>>
> >>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>>>>>         u32 max_dp_lanes;
> >>>>>>         u32 max_dp_link_rate;
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> linux-phy mailing list
> >>>> linux-phy@lists.infradead.org
> >>>> https://lists.infradead.org/mailman/listinfo/linux-phy
> >>>
> >>
> > 
> > 
> 

-- 
With best wishes
Dmitry
