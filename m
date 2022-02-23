Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546E4C1B1B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C617810EA59;
	Wed, 23 Feb 2022 18:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5A910EA4C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:45:35 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id d84so5147667qke.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s6yhcp+GZiPXzdt9dwKlHoyUQc5iMei4Re0YZLcoMBw=;
 b=q9VFzVPsKMOV+Cw8hSAIk/zuD+tDrzP3bqaSckx1zcMEFr00z7fptn1JmbeYS0asW0
 g/fF7ZgfwiSfXx7DkEYebdSFDClKmcRTXopL9rIrtnmYgp8UJvOc26YbOQl7TPV5Pp0N
 dBSIaB9k7oPbrpBF7JFxCBD2HVTs3pDvqy9fxf8KifOG00V3cWlgW1FtWaCRwx8K1nwy
 OzB2tB3H9HiYLisPKbiK/RvLae/++Zeu/4dpPvs69L1kctD07jWvNxw3wQKzGf7z5/FD
 gWLeGPBePI3QcJ5K9Sj+t1JNm7M4sRhwB+FoLpCKY6rb4OHZ+nvpzaeM3tYX0OXqGTM4
 /4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s6yhcp+GZiPXzdt9dwKlHoyUQc5iMei4Re0YZLcoMBw=;
 b=Ya6dJp1w75idGoBKR5wTWdJ/XGdPE81v3ZlocpG+tPET1bDfxWvuTMfuOD3ATFj+jf
 qFZbY1s/pS3AlYwKKMofUG+s+LcAAthmV/8pLZBWOQeaRNUqMfpraXW57YJFabvCM2ir
 qt9XhKm0JOKP/UVzlRlEZPdE22SXnVAAT4TUoBHZGKT1rRAiKKAvQCVz7B2VDf+dOY/4
 2+2uLcSmqjsZ7pXEB3+EcScLrdhj/kZZbx5yPuVUX5128Iec0DPhtf5QmCSB2buycO1R
 rX09d3OC3s01IJ5zAzS/ohYEftil9oKD0v8EhXmW8P9oZpZ7juHXbV/z4ExH5crRU1U9
 AeWQ==
X-Gm-Message-State: AOAM533ZM8z/SVCr8znYmbBK/jGuqlZQW0MZ0EQ7+IgtVKI+Om+xw7lC
 jIZMEpFaPuRA45CugwsinU2Is/P4NSsPgrDyufH5Kw==
X-Google-Smtp-Source: ABdhPJwFpopC7JHoylRo7J0E0xpUMdf1qHbszWLe4lL6F3ldGUi7WPabQbZB59cVWnptTeD7HGcwUfkyXO58JeN9y+4=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr699516qko.363.1645641934844; Wed, 23 Feb
 2022 10:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
 <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
 <493749c1-6305-1a94-4e05-519c825e9d4d@linaro.org>
 <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
In-Reply-To: <a803c7a9-de4c-8fe5-d80d-56366df78611@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 23 Feb 2022 21:45:23 +0300
Message-ID: <CAA8EJpp+fPrpUkv-b19DvL-tcyKQ6jh-jLDUW6dRFNesSCVHfQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Feb 2022 at 21:27, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 2/23/2022 10:22 AM, Dmitry Baryshkov wrote:
> > On 23/02/2022 20:21, Kuogee Hsieh wrote:
> >>
> >> On 2/18/2022 6:22 PM, Dmitry Baryshkov wrote:
> >>> On Sat, 19 Feb 2022 at 03:55, Stephen Boyd <swboyd@chromium.org> wrote:
> >>>> Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
> >>>>> On 19/02/2022 00:31, Kuogee Hsieh wrote:
> >>>>>> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> >>>>>>> There is little point in having both connector and root bridge
> >>>>>>> implementation in the same driver. Move connector's
> >>>>>>> functionality to the
> >>>>>>> bridge to let next bridge in chain to override it.
> >>>>>>>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> This patch break primary (edp) display
> >>>>>>
> >>>>>> -- right half of screen garbled
> >>>>>>
> >>>>>> -- screen shift vertically
> >>>>>>
> >>>>>> below are error messages seen --
> >>>>>>
> >>>>>> [   36.679216] panel-edp soc@0:edp_panel: No display modes
> >>>>>> [   36.687272] panel-edp soc@0:edp_panel: No display modes
> >>>>>> [   40.593709] panel-edp soc@0:edp_panel: No display modes
> >>>>>> [   40.600285] panel-edp soc@0:edp_panel: No display modes
> >>>>> So, before the patch the drm core was getting modes from the
> >>>>> drm_connector (which means, modes from drm driver itself). With this
> >>>>> patch the panel-edp tries to get modes.
> >>>>>
> >>>>> Could you please check, why panel_edp_get_modes() fails? Assuming
> >>>>> that
> >>>>> you use platform panel-edp binding (rather than 'edp-panel') could
> >>>>> you
> >>>>> please check you have either of the following:
> >>>>> - ddc bus for EDID?
> >>>> I don't see anywhere where the ddc pointer is set for the dp bridge in
> >>>> msm_dp_bridge_init(). Is that required though? I'd think simple
> >>>> panel is
> >>>> still being used here so reading EDID isn't required.
> >>> I meant the 'ddc-i2c-bus' property for the corresponding eDP panel.
> >>>
> >>>>> - either num_timing or num_modes in your panel desc.
> >>> After reading the panel-edp's code I don't have another cause for
> >>> panel_edp_get_modes(). It should either have a DDC bus specified using
> >>> the mentioned device tree property, or it should have specified the
> >>> timings.
> >>>
> >>> Kuogee, which platform were you using when testing this patch? Could
> >>> you please share the dts fragment?
> >>
> >> I cherry-picked your patches on top of our internal release which is
> >> usually have some (or many) patches behind msm-next.
> >>
> >> where is "ddc-i2c-bus" located?
> >
> > In the panel device node.
> >
> > Can you please share it too?
>
>
> &soc {
>          edp_power_supply: edp_power {
>                  compatible = "regulator-fixed";
>                  regulator-name = "edp_backlight_power";
>
>                  regulator-always-on;
>                  regulator-boot-on;
>          };
>
>          edp_backlight: edp_backlight {
>                  compatible = "pwm-backlight";
>
>                  pwms = <&pm8350c_pwm 3 65535>;
>                  power-supply = <&edp_power_supply>;
>                  enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
>
>                  pinctrl-names = "default";
>                  pinctrl-0 = <&backlight_pwm_default>;
>          };
>
>          edp_panel: edp_panel {
>                  compatible = "sharp_lq140m1jw46";

I'd assume that the panel is supported by the patch
https://patchwork.kernel.org/project/linux-arm-msm/patch/1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com/
and the compatible value is just an old value.
Provided that the panel description defines modes, I'd ask for some
debug from the panel_edp_get_modes(). At least let's see why
panel_edp_get_non_edid_modes() / panel_edp_get_display_modes() returns
no modes.

Regarding the ddc bus, if you have separate i2c bus connected to this
panel, the ddc-i2c-bus = <&i2c_N>; property should go to this device
node.

>                  pinctrl-names = "default";
>                  pinctrl-0 = <&edp_hot_plug_det>,
> <&edp_panel_power_default>;
>
>                  power-supply = <&edp_power_supply>;
>                  backlight = <&edp_backlight>;
>
>                  ports {
>                          #address-cells = <1>;
>                          #size-cells = <0>;
>                          port@0 {
>                                  reg = <0>;
>                                  edp_panel_in: endpoint {
>                                          remote-endpoint = <&edp_out>;
>                                  };
>                          };
>                  };
>          };
> };
>
>
> >
> >>
> >>                          msm_edp: edp@aea0000 {
> >>                                  compatible = "qcom,sc7280-edp";
> >>
> >>                                  reg = <0 0xaea0000 0 0x200>,
> >>                                        <0 0xaea0200 0 0x200>,
> >>                                        <0 0xaea0400 0 0xc00>,
> >>                                        <0 0xaea1000 0 0x400>;
> >>
> >>                                  interrupt-parent = <&mdss>;
> >>                                  interrupts = <14>;
> >>
> >>                                  clocks = <&rpmhcc RPMH_CXO_CLK>,
> >>                                           <&gcc GCC_EDP_CLKREF_EN>,
> >>                                           <&dispcc
> >> DISP_CC_MDSS_AHB_CLK>,
> >>                                           <&dispcc
> >> DISP_CC_MDSS_EDP_AUX_CLK>,
> >>                                           <&dispcc
> >> DISP_CC_MDSS_EDP_LINK_CLK>,
> >>                                           <&dispcc
> >> DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> >>                                           <&dispcc
> >> DISP_CC_MDSS_EDP_PIXEL_CLK>;
> >>                                  clock-names = "core_xo",
> >>                                                "core_ref",
> >>                                                "core_iface",
> >>                                                "core_aux",
> >>                                                "ctrl_link",
> >> "ctrl_link_iface",
> >>                                                "stream_pixel";
> >>                                  #clock-cells = <1>;
> >>                                  assigned-clocks = <&dispcc
> >> DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> >> <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> >>                                  assigned-clock-parents = <&edp_phy
> >> 0>, <&edp_phy 1>;
> >>
> >>                                  phys = <&edp_phy>;
> >>                                  phy-names = "dp";
> >>
> >>                                  operating-points-v2 = <&edp_opp_table>;
> >>                                  power-domains = <&rpmhpd SC7280_CX>;
> >>
> >>                                  #address-cells = <1>;
> >>                                  #size-cells = <0>;
> >>
> >>                                  status = "disabled";
> >>
> >>                                  ports {
> >>                                          #address-cells = <1>;
> >>                                          #size-cells = <0>;
> >>                                          port@0 {
> >>                                                  reg = <0>;
> >>                                                  edp_in: endpoint {
> >> remote-endpoint = <&dpu_intf5_out>;
> >>                                                  };
> >>                                          };
> >>                                  };
> >>
> >>                              edp_opp_table: opp-table {
> >>                                          compatible =
> >> "operating-points-v2";
> >>
> >>                                          opp-160000000 {
> >>                                                  opp-hz = /bits/ 64
> >> <160000000>;
> >>                                                  required-opps =
> >> <&rpmhpd_opp_low_svs>;
> >>                                          };
> >>
> >>                                          opp-270000000 {
> >>                                                  opp-hz = /bits/ 64
> >> <270000000>;
> >>                                                  required-opps =
> >> <&rpmhpd_opp_svs>;
> >>                                          };
> >>
> >>                                          opp-540000000 {
> >>                                                  opp-hz = /bits/ 64
> >> <540000000>;
> >>                                                  required-opps =
> >> <&rpmhpd_opp_nom>;
> >>                                          };
> >>
> >>                                          opp-810000000 {
> >>                                                  opp-hz = /bits/ 64
> >> <810000000>;
> >>                                                  required-opps =
> >> <&rpmhpd_opp_nom>;
> >>                                          };
> >>                                  };
> >>                          };
> >>
> >
> >



-- 
With best wishes
Dmitry
