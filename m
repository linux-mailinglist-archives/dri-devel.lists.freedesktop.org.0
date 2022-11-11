Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E15625E26
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5610E195;
	Fri, 11 Nov 2022 15:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB5C10E83E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 15:19:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so13273031ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yFYxsUt8J7JFyjoGzzxtslLaD/ewaDBkERXxUBqCLSg=;
 b=VQdGlhldW/8GeoluOliWmXmwXcC+nSlOEjPM8Nvh2WMSXVa69KLhNUpGTXJn9Vk/D7
 iLHOU2H09lxRXOosRu0BkP292TglEvYi6sDCJi8rHSCJ1AlYsXyKiJ25P7jzLBWja6Ih
 D0/IGqoAvnT20Otev1EIstuGjC49PyiBC6VrhzOIAf6+tQqsJOv1Y0y/PqurhytXD4qb
 SLSP06QhwIX5jw4rFzLvvqYmrdKBITtFuvP1HwbBH5miQsGugrxa6zmrphfdAhIElli3
 TDGtySGjGHDIAEoXus/vo9HvFfCYoB0MbG/kMAZGTOXobVcwOfd5VfmkJi9tvon7LyR4
 Le5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFYxsUt8J7JFyjoGzzxtslLaD/ewaDBkERXxUBqCLSg=;
 b=C1u862n5jRZmrmnBzhUR9/MyRpW4yC0oBU/AS290jw0gUuLRRVH67+lBlL67NmvCTy
 z8AyQgFO4iVfQco8CZWS6MP/20aAKMvuT0NhikqwOhXSqR8J2XI296hds7b+6n+CvXvV
 DT2wcKTVio8SOmH+Hym9J1xyvfJpXnls4ce5EUk3RL8d0x8PWitWe91Q4OJN0OV8s2p7
 AkvAM6u/gj4BoVqJ3gAH2XmB4cDDGwguLopJEwhe7+8fmtb0C2nbDhXLbkO9noZhVcTx
 qUT9umdrKePybxMPpwekh7h1lc4ZjCeMhV3NUQsmuavaYTIR0Bo5LJnG3Vy+RigwT7YL
 9m3A==
X-Gm-Message-State: ANoB5pmeZKt/PM95FrW20TjXmPFTuFzPIRVot+H4IgYnENue9sOls5gz
 m4NOOqFDFmlno4d06X6D+ECAu59yc/jOfGHpH3JcRA==
X-Google-Smtp-Source: AA0mqf5fs7r3Q7Hcn5cGYKrcbBrTcAMt3nlR6oESsPm8IGvQ9qSyz68bnViPR0UgeDZioWu9KPrylyB19pftcoM03mo=
X-Received: by 2002:a17:906:dc1:b0:7ae:6d3e:a02e with SMTP id
 p1-20020a1709060dc100b007ae6d3ea02emr2091354eji.626.1668179945517; Fri, 11
 Nov 2022 07:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
 <20221028135718.4pmh6moee2wx2lpf@baldur>
In-Reply-To: <20221028135718.4pmh6moee2wx2lpf@baldur>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 16:18:54 +0100
Message-ID: <CAG3jFyt_Aws4_aW4ocQwtAh3XwRGFK-u7BeRszjmJ7Z715dmwA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
To: Bjorn Andersson <andersson@kernel.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022 at 15:57, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 02:08:12PM +0200, Robert Foss wrote:
> > The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> >
> > In order to toggle the board to enable the HDMI output,
> > switch #7 & #8 on the rightmost multi-switch package have
> > to be toggled to On.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 106 ++++++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index 6e07feb4b3b2..6666b38b58f8 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -20,6 +20,17 @@ chosen {
> >               stdout-path = "serial0:115200n8";
> >       };
> >
> > +     hdmi-out {
> > +             compatible = "hdmi-connector";
> > +             type = "a";
> > +
> > +             port {
> > +                     hdmi_con: endpoint {
> > +                             remote-endpoint = <&lt9611_out>;
> > +                     };
> > +             };
> > +     };
> > +
> >       vph_pwr: vph-pwr-regulator {
> >               compatible = "regulator-fixed";
> >               regulator-name = "vph_pwr";
> > @@ -29,6 +40,32 @@ vph_pwr: vph-pwr-regulator {
> >               regulator-always-on;
> >               regulator-boot-on;
> >       };
> > +
> > +     lt9611_1v2: lt9611-1v2 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "LT9611_1V2";
> > +
> > +             vin-supply = <&vph_pwr>;
> > +             regulator-min-microvolt = <1200000>;
> > +             regulator-max-microvolt = <1200000>;
> > +             gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +             regulator-always-on;
>
> Why is this always-on?

It shouldn't be. Removing this in v2.

>
> > +     };
> > +
> > +     lt9611_3v3: lt9611-3v3 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "LT9611_3V3";
> > +
> > +             vin-supply = <&vreg_bob>;
> > +             gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             enable-active-high;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +     };
> >  };
> >
> >  &adsp {
> > @@ -220,6 +257,15 @@ &dispcc {
> >  &dsi0 {
> >       status = "okay";
> >       vdda-supply = <&vreg_l6b_1p2>;
> > +
> > +     ports {
> > +             port@1 {
> > +                     endpoint {
> > +                             remote-endpoint = <&lt9611_a>;
> > +                             data-lanes = <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &dsi0_phy  {
> > @@ -231,6 +277,48 @@ &gpi_dma1 {
> >       status = "okay";
> >  };
> >
> > +&i2c15 {
> > +     status = "okay";
>
> Please keep status last. (Yes I see that it goes against the convention
> in this file, so let's update that at some point as well)

Ack.

>
> > +     clock-frequency = <400000>;
> > +
> > +     lt9611_codec: hdmi-bridge@2b {
> > +             compatible = "lontium,lt9611uxc";
> > +             reg = <0x2b>;
> > +             status = "okay";
>
> This is the default, you can omit it.

Ack.

>
> > +
> > +             interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
> > +             reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> > +
> > +             vdd-supply = <&lt9611_1v2>;
> > +             vcc-supply = <&lt9611_3v3>;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +
> > +                             lt9611_a: endpoint {
> > +                                     remote-endpoint = <&dsi0_out>;
> > +                             };
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg = <2>;
> > +
> > +                             lt9611_out: endpoint {
> > +                                     remote-endpoint = <&hdmi_con>;
> > +                             };
> > +                     };
> > +
> > +             };
> > +     };
> > +};
> > +
> >  &mdss {
> >       status = "okay";
> >  };
> > @@ -248,6 +336,10 @@ &qupv3_id_0 {
> >       status = "okay";
> >  };
> >
> > +&qupv3_id_2 {
> > +     status = "okay";
> > +};
> > +
> >  &slpi {
> >       status = "okay";
> >       firmware-name = "qcom/sm8350/slpi.mbn";
> > @@ -544,4 +636,18 @@ usb_hub_enabled_state: usb-hub-enabled-state {
> >               drive-strength = <2>;
> >               output-low;
> >       };
> > +
> > +     lt9611_rst_pin: lt9611-rst-state {
> > +             pins = "gpio48";
> > +             function = "normal";
> > +
> > +             output-high;
> > +             input-disable;
> > +     };
> > +
> > +     lt9611_irq_pin: lt9611-irq {
>
> pinctrl state nodes should be suffixed with "-state".
>
> And you can lump the two pins into a single -state, with rst-pins and
> irq-pins as subnodes, defining the two pins.
>
> Regards,
> Bjorn
>
> > +             pins = "gpio50";
> > +             function = "gpio";
> > +             bias-disable;
> > +     };
> >  };
> > --
> > 2.34.1
> >
