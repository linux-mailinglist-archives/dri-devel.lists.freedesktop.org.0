Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F036FA50D2B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642B010E825;
	Wed,  5 Mar 2025 21:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qOYZtnq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9B410E827
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 21:14:06 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54955222959so6061242e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741209245; x=1741814045; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4jAKYbTUJpewVNmKScs/KV5h9MR6DBwgVHxpvatN8NY=;
 b=qOYZtnq6W4hBlrN2VVbHSY/dYggqKUjnKD+Iihz7QXsRIEk0GINtYacJFAzhfMqvi0
 DEmsC5fQf2G6Ra8UtmfPQFwCjN/OPAYJEHvrPd2LoIpsiaLtlt+h+GV7RiiA1rDEWQDh
 L0LUV5Bi67gcjl0uM5uv7mPxjrJbGalEM43TBwkbZhfi/9/+0Uhv0pwXG2FVQ8V928OB
 Jvt8PWxdkUfkQNHg9zTTuS7b64mRzzFQRSK2rcD6p0sANdEHposFBrVkB816sIEnHAK6
 6svcFCurnavresgX9ONB4CwOkruIejGIsFJu95P98vh3eCpY0KVj5ajWv1UiuwhIvG3h
 T9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741209245; x=1741814045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4jAKYbTUJpewVNmKScs/KV5h9MR6DBwgVHxpvatN8NY=;
 b=i9fW/5EzUndpPPUJc49/zGuDu9W+Ubcs1fH7ltCEOttxUF0uRgXqGSZFLQemq33iDW
 Xa8DQ/nPr9sNatnLO2Ejhx7sFccKBFvc6D1r/W0mXsQFxfzr/K4SHmx4OvNts9/mTF/y
 mivblrFs3gTGlEOKacfF/TggzuvCp0RdOb1AFeOGzkIxjE3ACHEHQV6KxhjdeBqncPnU
 DMmomHgv4z1R1NWwW04Kr3zooWjZZXbHRqodjRpO/VwaXKAacPp/G/HEa+jx0ylYd86h
 7qDV5xQt/+3KvuUCz9saF8uv++kB/luEx7CIdv44vpJaJdftHVY4nVRQQ9kX5tPjqsQT
 QmSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUi25DWnKVUbn9vWW51XhQqCoYLRVd/Wz7Su/EWpVAf1rzU7kxVT3ErekIsUz2bVloIgabYvImPXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq16zK2if3QwoHI46uIRt6h4r8nI/FZpUgC2w5dOgJsb5DGHZO
 hlIDPoGg9ZwRGyzlm4uxFQPUkUXs/JJ+O8/79BvDd9wdsgc3OJxE/qzWBzP/adg=
X-Gm-Gg: ASbGncuERFdAEkpaLtbsjVtChQp49tojfoUv3co6rcKYNW9f8HGgST2GVzFyNm/yfNC
 gl/AV2WG/1bAQGcqJGaNaig4DWnhgj6SdLGO69ol6dvUnOFR74nYzyj+DUa1ZQoR7DGjGz9vnSy
 2jldanxg0uIy69H1+eKLRf2sL8V1D8khf1suL4l9J4u/DQR+bzl2f8SygzmH9aFeXHPahTTS0+o
 3c6iXQnNIdhsCAbq7h+eITiCVM28+CbAU6x7XUOiJuehMGI6f8Vbr1bkEJu2X44h0MP8M5jdrJC
 QA99KLiTrODeglIshRj2cYPVMbjElbwsi6dTVmjnidKT+1Yka8rjBuAsfVTW1QAzeFgLP50fgSw
 hfWhxy2UhsgfAkS0BKXWY7SzK
X-Google-Smtp-Source: AGHT+IHASTT0I2RZzxvHW6GJOilteC+6lJrj4HK7/2n8Ey2P5/4CP44E+Gzu2m+8VSksWNVCFKgRdQ==
X-Received: by 2002:a05:6512:b8f:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-5497d37704fmr1656131e87.40.1741209244983; 
 Wed, 05 Mar 2025 13:14:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54986c730e2sm24619e87.18.2025.03.05.13.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:14:03 -0800 (PST)
Date: Wed, 5 Mar 2025 23:14:01 +0200
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
Message-ID: <td4dkb6qoxfa7lfmfszlowov6qxdukqq5qnwnhmajnskr5mu2u@todczb6inttv>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
 <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
 <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
 <h6tmbuv26tdv633udphttsydpbvnwownulvglcxktdaxqdhtvw@ereftfs5hiso>
 <9fb34496-d823-414a-b7dc-54b4677829e5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fb34496-d823-414a-b7dc-54b4677829e5@quicinc.com>
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

On Wed, Mar 05, 2025 at 06:16:45PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/20/2024 5:45 AM, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 06:36:38PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 12/5/2024 7:40 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> Add the ability to configure lane mapping for the DP controller. This is
> >>>>>>>> required when the platform's lane mapping does not follow the default
> >>>>>>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >>>>>>>> `data-lane` property in the devicetree. This property defines the
> >>>>>>>> logical-to-physical lane mapping sequence, ensuring correct lane
> >>>>>>>> assignment for non-default configurations.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>>>>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>>>>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>>>>>>>
> >>>>>
> >>>>>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>>>         struct msm_dp_panel_private *panel;
> >>>>>>>>         struct device_node *of_node;
> >>>>>>>>         int cnt;
> >>>>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
> >>>>>>>>
> >>>>>>>>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> >>>>>>>>         of_node = panel->dev->of_node;
> >>>>>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>>>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> >>>>>>>>         }
> >>>>>>>>
> >>>>>>>> -       if (cnt > 0)
> >>>>>>>> +       if (cnt > 0) {
> >>>>>>>> +               struct device_node *endpoint;
> >>>>>>>> +
> >>>>>>>>                 msm_dp_panel->max_dp_lanes = cnt;
> >>>>>>>> -       else
> >>>>>>>> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> >>>>>>>> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> >>>>>>>> +       } else {
> >>>>>>>>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> >>>>>>>> +       }
> >>>>>>>
> >>>>>>> Why? This sounds more like dp_catalog or (after the refactoring at
> >>>>>>> [1]) dp_ctrl. But not the dp_panel.
> >>>>>>>
> >>>>>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
> >>>>>>>
> >>>>>> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
> >>>>>> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
> >>>>>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?
> >>>>>
> >>>>> msm_dp_catalog_get() is going to be removed. Since the functions that
> >>>>> are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
> >>>>> the best place. A better option might be to move max_dp_lanes and
> >>>>> max_dp_link_rate to dp_link.c as those are link params. Then
> >>>>> lane_mapping also logically becomes a part of dp_link module.
> >>>>>
> >>>>> But now I have a more important question (triggered by Krishna's email
> >>>>> about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
> >>>>> platform? Or is it being demoted to USB 2 with nobody noticing that?
> >>>>>
> >>>>> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
> >>>>> PHY, where we handle lanes and orientation switching?
> >>>>>
> >>>> I have checked the DP hardware programming guide and also discussed it with Krishna.
> >>>>
> >>>> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swap for mainlink and AUX, but it doesn't support lane swap feature.'
> >>>>
> >>>> The lane swap mainly refers to the logical to physical mapping between the DP controller and the DP PHY. The PHY handles polarity inversion, and the lane map does not affect USB behavior.
> >>>>
> >>>> On the QCS615 platform, we have also tested when DP works with lane swap, other USB 3.0 ports can works normally at super speed.
> >>>
> >>> "Other USB 3.0 ports"? What does that mean? Please correct me if I'm
> >>> wrong, you should have a USB+DP combo port that is being managed with
> >>> combo PHY. Does USB 3 work on that port?
> >>>
> >>> In other words, where the order of lanes is actually inverted? Between
> >>> DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
> >>> Granted that SM6150 was supported in msm-4.14 could you possibly point
> >>> out a corresponding commit or a set of commits from that kernel?
> >>>
> >> For "Other USB 3.0 ports", as replied in USBC driver, USB3 primary phy works for other four USB type-A port.
> > 
> > So if that's the USB3 primary, then why do you mention here at all? We
> > are taling about the secondary USB3 + DP.
> > 
> OK, sorry for confusing you.
> >> The REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING mapping determines how logical lanes (0, 1, 2, 3) map to physical lanes sent to the PHY.
> >> This ensures alignment with hardware requirements.
> >> The PHY’s polarity inversion only adjusts signal polarity and doesn’t affect lane mapping.
> >> Both DP ctrl and PHY lane related config will not affect USB phy.
> > 
> > Probably we misundersand each other. The DP PHY should have orientation
> > switch register, which controls whether 2-lane DP uses lanes 0/1 or 2/3.
> > Can you use that register?
> > 
> Yes, DP PHY have orientation register as below.
> DP_PHY_DP_PHY_CFG_1(0x88e9014) bit(7) SW_PORTSELECT
> > Also, could you _please_ answer the question that I have asked? Is the
> > order of lanes inverted between the DP controller and DP PHY? Or between
> > DP PHY and the DP connector? If one uses USB3 signals coming from this
> > port (yes, on the other board, not on the Ride), would they also need to
> > switch the order of USB3 lanes? If one uses a DP-over-USB-C, are DP
> > lanes are swapped?
> > 
> It's inverted between the DP controller and DP PHY.
> If other use USB3 on the other board, will not need switch order of USB3 lanes,
> If one use DP-over-USB-C, then need DP lanes swap.

Thanks!

> >> Without extra Type-C mapping, the DP controller’s mapping indirectly decides how signals are transmitted through Type-C.
> >> Mapping ensures proper data transmission and compatibility across interfaces.
> >>
> >> We only found sm6150 need this lane mapping config, 
> >> For msm 4.14, please refer these links,
> >> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/arch/arm64/boot/dts/qcom/sm6150-sde.dtsi (qcom,logical2physical-lane-map)
> >> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_parser.c (dp_parser_misc)
> >> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c (dp_catalog_ctrl_lane_mapping_v200)
> >>
> >> If need process orientation info like dp_catalog_ctrl_lane_mapping_v200, 
> >> then 
> >> if implement in DP phy, then we need config dp_link register in PHY,
> >> if implement in DP link, then we need pass orientation info to DP driver, perhaps we could add a new attribute to the phy_configure_opts_dp structure to pass this.
> >> Do you have any suggestions?
> > 
> > Does SW_PORTSEL_VAL affect the DP lanes on this platform?
> > 
> SW_PORTSEL_VAL for USB3PHY_PCS_MISC_TYPEC_CTRL will not affect DP lanes in this DP or USB3 chip series.
> USB3 will use USB3PHY_PCS_MISC_TYPEC_CTRL(SW_PORTSEL_VAL BIT_0) and DP will use DP_PHY_DP_PHY_CFG_1(SW_PORTSELECT BIT_7)

Is it possible to set this bit from the PHY driver rather than remapping
the lanes in the DP driver?

> >>
> >>>>
> >>>> Additionally, if it were placed on the PHY side, the PHY would need access to dp_link’s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
> >>>
> >>> I was thinking about inverting the SW_PORTSEL_VAL bit.
> >>>
> >>>> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_map move to dp_link side is better.
> >>>>
> >>>>>>>> +
> >>>>>>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
> >>>>>>>>
> >>>>>>>>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
> >>>>>>>>         if (!msm_dp_panel->max_dp_link_rate)
> >>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> >>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>>>> @@ -11,6 +11,8 @@
> >>>>>>>>  #include "dp_aux.h"
> >>>>>>>>  #include "dp_link.h"
> >>>>>>>>
> >>>>>>>> +#define DP_MAX_NUM_DP_LANES    4
> >>>>>>>> +
> >>>>>>>>  struct edid;
> >>>>>>>>
> >>>>>>>>  struct msm_dp_display_mode {
> >>>>>>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>>>>>>>         bool video_test;
> >>>>>>>>         bool vsc_sdp_supported;
> >>>>>>>>
> >>>>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>>>>>>>         u32 max_dp_lanes;
> >>>>>>>>         u32 max_dp_link_rate;
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>> 2.25.1
> >>>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> linux-phy mailing list
> >>>>>> linux-phy@lists.infradead.org
> >>>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
> >>>>>
> >>>>
> >>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry
