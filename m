Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00855625E39
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EE910E85C;
	Fri, 11 Nov 2022 15:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6021D10E849
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 15:20:53 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ft34so13172948ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8E9Cs3yaXWgz5mOChIlIQoUDfwsWjoZPtNVw+9K0m3M=;
 b=mmcX345GCDy3+LQ6q+Pzy0ZCoNRRPkcF3ifoBsQAl68YLYZ10/NiQVgutItk1xYMaL
 7IpvVyhFokDN+fcDLMgYYQQvESiT1V94tZbiKwBnIwhS5k7dciPLhbow33wC0dcD1Hse
 g1yCT9x2epWf+2mHnesm6kOmE5FS0XjWFyzeqBNezQPZijMZLOh5LBRB2mr5qzqMyKkT
 Zc7VZjiPmDYc60LEcsLoRmTX71rq7dzSQziWDaMazdAaLxHE8bm0EvGaiARlfQnCs+sG
 TLD2wzWUqo4dnNQ2byCnVQEndzseTqwfeKlho10WOkqYgpJ0hHVFAdrwaABZFsnrm2ON
 qbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8E9Cs3yaXWgz5mOChIlIQoUDfwsWjoZPtNVw+9K0m3M=;
 b=3VZs3hj8A3xVbzc/Md1Sr8zqfoVKGYlXyBBLQ+S4ilF+wXdajBTCf82PIdnMdzgFDb
 cawbc3zwXAZSS3HHrkwRykFW9JKSZIJIX2qT0oaJ1q6PCRgixkApSycIuEyzrHP07Q4A
 O/hHidoP8FC49TKOs5lBB9N+0n4/64J5oOttggMectk+x/bQMi4HYLcVmTcuoujuKLQh
 n70AD8UC4nT+7GzJpQW+9SOnqWLSaMLRupzw/bODFG8VJAbv8yDnoP7UxnE7tRs/Fpcl
 bM2zdLwNUDBn+2h/QHBbYXclwL/tjafTBq5qWB9XSfxZv2LeZ3lV514e0XWmtPz/hO/N
 lX7w==
X-Gm-Message-State: ANoB5pnH3S/iVvORh9snB+AcGTVV0nt3TOvhJbUm1vFS/Nu43b9x6IR6
 yIdNjxxdxrGoWILvHvVLaXTd4dT1GxD2pt2Be2bwcQ==
X-Google-Smtp-Source: AA0mqf5F1dF3oI4lEMZel6lUNLdl92gcf9qtQZbBA0ZEZW8n4zJvZRo9IKm7wRimlZusvKqtya6WCuvYLzPh4/aStTM=
X-Received: by 2002:a17:906:2ecf:b0:778:f9b6:6fc with SMTP id
 s15-20020a1709062ecf00b00778f9b606fcmr2245177eji.580.1668180051848; Fri, 11
 Nov 2022 07:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
 <408b7b0c-ce30-134e-9b1f-f77c1f03f5c9@linaro.org>
In-Reply-To: <408b7b0c-ce30-134e-9b1f-f77c1f03f5c9@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 16:20:40 +0100
Message-ID: <CAG3jFytHzSNohr85R_uOHqn6eeour37c4=MXkaS=0JzKK4-z9Q@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Sat, 29 Oct 2022 at 00:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2022 08:08, Robert Foss wrote:
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
>
> Generic node names, so hdmi-connector or just connector.

Ack.

>
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
>
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Ack.

>
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
> > +     };
> > +
> > +     lt9611_3v3: lt9611-3v3 {
>
> Ditto

Ack.

>
>
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
> status is the last property

Ack.

>
> > +     clock-frequency = <400000>;
> > +
> > +     lt9611_codec: hdmi-bridge@2b {
> > +             compatible = "lontium,lt9611uxc";
> > +             reg = <0x2b>;
> > +             status = "okay";
>
> Why status?

It should be removed. Fixing in v2.

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
>
> No need for blank line

Ack

>
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
> Missing suffix 'state'.

Ack.

>
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions).

v1 was missing the bindings, v2 will include bindings for there parts.

>
> Rebase your changes on last linux-next.

Ack.

>
> Best regards,
> Krzysztof
>
