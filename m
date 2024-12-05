Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6319E5425
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 12:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B9C10E3B5;
	Thu,  5 Dec 2024 11:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D4Ydmjuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5984E10E5C4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 11:40:49 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6efc58fae20so6008527b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733398848; x=1734003648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVlR8SfhnG5cey0ump1Xp1q6+3VfWCJyhprNP3dwbtc=;
 b=D4YdmjuoTPQXTfhorexTZR9JRycfzXX/4B7+j4zPSHm2D62FP8RNLGS0Z0zx/Ph0WF
 RGqSyjQqkmR7izfay1qYXXoaGqr1PlR8KBaeXTyTCC3JHaWlA7vjnrEevNiVK0Ojj3TP
 Yo56dC0sMOOEIbBcfBERseqjth8igPher/75s91i5VOFaju0JGoSWP3uSYYmbdvxNu0m
 j+8fJ26TyDZ58sQLrh9Y3irc1R9x4jju/y93nHr+LlPnEFAJYK222c772KJ+0xFa1HTP
 yde+scxQI0zO+O/pS4YO2DFZnFnmV5pNKp5PX2CVE9lMxvxzIPOR9kiUJTt5PLIf/fkt
 7syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733398848; x=1734003648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVlR8SfhnG5cey0ump1Xp1q6+3VfWCJyhprNP3dwbtc=;
 b=GmwCvauKP+QHyE0cRJ2yf0DlKuoGAlJj5LThHIUnSAaK6/eZTXWFYV/8Em5dySOBXo
 tW1iwJbsYXxYAzn3LQL/p5n7PgmrotWtHlPVtYiv9pHSR/wFuiC6pTVtafVNLt5SsLDs
 RInrn8/wx4nySMCJ5cOgyPKng4gAiQOMQZ+li8vZDsCNzWTDR+YDGS3kXMl9aBNBPjpf
 acokIWaAmNEaVCjy3QUyR+VUx1+DapYim4bz/UlawElAl/8e0Ng5anwS3NmJOkELX+Uj
 nBSM3qGozINWV2r4UcT4Wcx5Mt05GK+1qOxCb70qt6W+FBpVm8rohVmtzm9eAApCKMPw
 XERw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx18pizLaAXUA6jFqI+clQ23o8DJvA3A0P2MB1sFklnvPamdn9q1S1EfbjN+24vPMqUhlMv7CbV/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5BGQ0tqWCYDNB8K6pIswjKCwx14HSoF8wpSI6tUf7uxo2gfdX
 fs7kAlSilMWBIG3X5gK0CIHJGdYUIIINCEWNYpUd08UQH95larT36G0g332gm61yuvL3haNY1Me
 1P6BuduBQr+KQGnGTahVzlYLPASCUfSs2jQX+ZA==
X-Gm-Gg: ASbGncvPuIibbxjFVCifbxo+PyLo0DdvwH/dnklyTnVcL+Jehljve06ZcMbJKg8lB/K
 Ra+5b+VammyTksFuqLUUCneLvnQhZL9ivXfl3fHQ90u991Q==
X-Google-Smtp-Source: AGHT+IE7HGuIvq1u8h8I8rkPJdzS+9WwLlvVg6WJaLoZvVrKFT+XlrLuu0kqLNSwgkmrfDwW/eoD4F5p5LcplIqXWkE=
X-Received: by 2002:a05:6902:cc5:b0:e39:b0de:fed8 with SMTP id
 3f1490d57ef6-e39d3a293cdmr10638085276.17.1733398848266; Thu, 05 Dec 2024
 03:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
In-Reply-To: <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Dec 2024 13:40:37 +0200
Message-ID: <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
>
>
> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> >>
> >>
> >> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com>=
 wrote:
> >>>>
> >>>> Add the ability to configure lane mapping for the DP controller. Thi=
s is
> >>>> required when the platform's lane mapping does not follow the defaul=
t
> >>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >>>> `data-lane` property in the devicetree. This property defines the
> >>>> logical-to-physical lane mapping sequence, ensuring correct lane
> >>>> assignment for non-default configurations.
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>>>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>>>
> >
> >>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_p=
anel *msm_dp_panel)
> >>>>         struct msm_dp_panel_private *panel;
> >>>>         struct device_node *of_node;
> >>>>         int cnt;
> >>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] =3D {0, 1, 2, 3};
> >>>>
> >>>>         panel =3D container_of(msm_dp_panel, struct msm_dp_panel_pri=
vate, msm_dp_panel);
> >>>>         of_node =3D panel->dev->of_node;
> >>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp=
_panel *msm_dp_panel)
> >>>>                 cnt =3D drm_of_get_data_lanes_count(of_node, 1, DP_M=
AX_NUM_DP_LANES);
> >>>>         }
> >>>>
> >>>> -       if (cnt > 0)
> >>>> +       if (cnt > 0) {
> >>>> +               struct device_node *endpoint;
> >>>> +
> >>>>                 msm_dp_panel->max_dp_lanes =3D cnt;
> >>>> -       else
> >>>> +               endpoint =3D of_graph_get_endpoint_by_regs(of_node, =
1, -1);
> >>>> +               of_property_read_u32_array(endpoint, "data-lanes", l=
ane_map, cnt);
> >>>> +       } else {
> >>>>                 msm_dp_panel->max_dp_lanes =3D DP_MAX_NUM_DP_LANES; =
/* 4 lanes */
> >>>> +       }
> >>>
> >>> Why? This sounds more like dp_catalog or (after the refactoring at
> >>> [1]) dp_ctrl. But not the dp_panel.
> >>>
> >>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?order=
ing=3D-last_updated
> >>>
> >> We are used the same prop 'data-lanes =3D <3 2 0 1>' in mdss_dp_out to=
 keep similar behaviour with dsi_host_parse_lane_data.
> >> From the modules used, catalog seems more appropriate, but since the m=
ax_dp_lanes is parsed at dp_panel, it has been placed here.
> >> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes p=
arsing at the dp_panel?
> >
> > msm_dp_catalog_get() is going to be removed. Since the functions that
> > are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
> > the best place. A better option might be to move max_dp_lanes and
> > max_dp_link_rate to dp_link.c as those are link params. Then
> > lane_mapping also logically becomes a part of dp_link module.
> >
> > But now I have a more important question (triggered by Krishna's email
> > about SAR2130P's USB): if the lanes are swapped, does USB 3 work on tha=
t
> > platform? Or is it being demoted to USB 2 with nobody noticing that?
> >
> > If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
> > PHY, where we handle lanes and orientation switching?
> >
> I have checked the DP hardware programming guide and also discussed it wi=
th Krishna.
>
> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swa=
p for mainlink and AUX, but it doesn't support lane swap feature.'
>
> The lane swap mainly refers to the logical to physical mapping between th=
e DP controller and the DP PHY. The PHY handles polarity inversion, and the=
 lane map does not affect USB behavior.
>
> On the QCS615 platform, we have also tested when DP works with lane swap,=
 other USB 3.0 ports can works normally at super speed.

"Other USB 3.0 ports"? What does that mean? Please correct me if I'm
wrong, you should have a USB+DP combo port that is being managed with
combo PHY. Does USB 3 work on that port?

In other words, where the order of lanes is actually inverted? Between
DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
Granted that SM6150 was supported in msm-4.14 could you possibly point
out a corresponding commit or a set of commits from that kernel?

>
> Additionally, if it were placed on the PHY side, the PHY would need acces=
s to dp_link=E2=80=99s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE=
_MAPPING.

I was thinking about inverting the SW_PORTSEL_VAL bit.

> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_ma=
p move to dp_link side is better.
>
> >>>> +
> >>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_d=
p_lanes * sizeof(u32));
> >>>>
> >>>>         msm_dp_panel->max_dp_link_rate =3D msm_dp_panel_link_frequen=
cies(of_node);
> >>>>         if (!msm_dp_panel->max_dp_link_rate)
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm=
/dp/dp_panel.h
> >>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d448=
5539bd6308537ff75a2c 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> @@ -11,6 +11,8 @@
> >>>>  #include "dp_aux.h"
> >>>>  #include "dp_link.h"
> >>>>
> >>>> +#define DP_MAX_NUM_DP_LANES    4
> >>>> +
> >>>>  struct edid;
> >>>>
> >>>>  struct msm_dp_display_mode {
> >>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>>>         bool video_test;
> >>>>         bool vsc_sdp_supported;
> >>>>
> >>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>>>         u32 max_dp_lanes;
> >>>>         u32 max_dp_link_rate;
> >>>>
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>
> >>>
> >>
> >>
> >> --
> >> linux-phy mailing list
> >> linux-phy@lists.infradead.org
> >> https://lists.infradead.org/mailman/listinfo/linux-phy
> >
>


--=20
With best wishes
Dmitry
