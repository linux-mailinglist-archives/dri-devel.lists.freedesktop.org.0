Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7C498A7F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295C310E927;
	Mon, 24 Jan 2022 19:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6C410E927
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:04:17 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id o10so14803627ilh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTiZ8sEgSQ0Acx4U7fIroiVQ52FJWGRyWnzr9lBr6vQ=;
 b=CvVf5UuSzlaRr1Tb9GU6821HGAi6l+KgJh8pOw5NzySgkQvHkKUof1RPVkUPF4Ku6e
 h4zo/zJbL/yHrCIdvs4HylasfPtsJKAo4HNZUI4zJsZpVBZ1Uw/B6A7JJNTgvtv4/jIz
 XBMk3jk6NfkDYa0C38hFQ8obLn58ciZ6gJkZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTiZ8sEgSQ0Acx4U7fIroiVQ52FJWGRyWnzr9lBr6vQ=;
 b=poXjeZg/Gq1sALMl6PBta6aZNy/Q0oDm5TLcWF5Yxd0EIr3+bMfeewWc7kcOzHCJHM
 SHoBexvWxREJMOZ2vN3jdd6UM9tZ2HgnKyxwMQkhvxKotp3z3ZRolmY9YCGBNbutc/QS
 +dFrGZlquTMnpn/0lqzubB6/ZMv6IMIBNXBDWFeNSr0ZHtmPDYvBbXlZJPHLWVRMVDhf
 iwURrX6VaqIDoQSDMZqA7K0Qy4wV5VdpVAir/q8NDdV7z5HVcnHVDCWLnKKD4lSdDa08
 7CmTXs72HRL7RT4e1lBJ0pVxtezkmZgCIN3wcsYdm3Vj1WhgFG3+IVmdjFNlehb9GO9Z
 WAQQ==
X-Gm-Message-State: AOAM532rW9f+GP0rC2WaDAjENQyIsxOn08v53Nn27TAh5Mx9U2pYiLRk
 V0pFXRMA3f+YCeyA1oZHoYCySH44AwHgdg==
X-Google-Smtp-Source: ABdhPJwpPB1k3h4+prHa9b/TuSq1YHDa1G7cXVAl7/K7W0JYvu3p3g4BX2RfLCbTIZjBLlny307RIg==
X-Received: by 2002:a05:6e02:1749:: with SMTP id
 y9mr8882016ill.252.1643051056937; 
 Mon, 24 Jan 2022 11:04:16 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id a10sm8412105ilv.44.2022.01.24.11.04.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 11:04:15 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id a12so20772572iod.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:04:15 -0800 (PST)
X-Received: by 2002:a5e:9b07:: with SMTP id j7mr8634583iok.136.1643051055347; 
 Mon, 24 Jan 2022 11:04:15 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jan 2022 11:04:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
Message-ID: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel support for
 sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_khsieh@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 quic_mkrishn@quicinc.com, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 24, 2022 at 10:15 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Enable the eDP display panel support with backlight on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 127 ++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index cd2755c..fde6f75 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -64,6 +64,47 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};

"mdss_mdp" sorts after "mdss_edp",


> +&mdss_edp {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       edp_out: endpoint {
> +                               remote-endpoint = <&edp_panel_in>;
> +                       };
> +               };
> +       };

I think part of the above should be in sc7280.dtsi. Basically in
sc7820.dtsi I think you should have:

ports {
  #address-cells = <1>;
  #size-cells = <0>;
  port@0 {
    reg = <0>;
    edp_in: endpoint {
      remote-endpoint = <&dpu_intf5_out>;
    };
  };
  port@1 {
    reg = <1>;
    edp_out: endpoint {
    };
  };
};

...and then the crd dts file just needs:

&edp_out {
  remote-endpoint = <&edp_panel_in>;
};

Right?


> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +};
> +
> +&mdss_dp {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&dp_hot_plug_det>;
> +       data-lanes = <0 1>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> +
>  &nvme_3v3_regulator {
>         gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -72,7 +113,93 @@ ap_ts_pen_1v8: &i2c13 {
>         pins = "gpio51";
>  };
>
> +&pm8350c_pwm{

nit: space after "pwm" and before "{"


> +       status = "okay";

Don't you need:

pinctrl-names = "default";
pinctrl-0 = <&backlight_pwm_default>;


> +};
> +
> +&pm8350c_gpios {
> +       backlight_pwm_default: backlight_pwm_default {

nit: node name should have dashes, not underscores. Also, don't
include the word "default".


> +               pinconf {
> +                       pins = "gpio8";
> +                       function = "func1";
> +                       output-low;
> +                       bias-disable;
> +                       power-source = <0>;
> +                       qcom,drive-strength = <3>;


Instead of 3, should be PMIC_GPIO_STRENGTH_LOW

> +               };

Don't need the "pinconf" subnode.


> +       };
> +};
> +
> +&soc {

Don't need to put the regulators under &soc. They can be top level, right?


> +       backlight_power: backlight_power {

nit: node names should have "-", not "_"


> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_power";
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       edp_power: edp_power {

nit: node names should have "-", not "_"


> +               compatible = "regulator-fixed";
> +               regulator-name = "edp_power";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_panel_power_default>;
> +       };
> +
> +       edp_backlight: edp_backlight {

nit: node names should have a "-", not an "_".


> +               compatible = "pwm-backlight";
> +
> +               pwms = <&pm8350c_pwm 3 65535>;
> +               power-supply = <&backlight_power>;
> +               enable-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;

So wait. Why do you have a "bogus" backlight_power regulator and then
a separate enable-gpio? Why

> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&backlight_pwm_default>;

This pinctrl belongs as part of the PWM, not as part of the backlight.

...but where's the pinctrl for pm8350c_gpios #7? That _should_ be here
since that's the backlight enable.


> +       };
> +
> +       edp_panel: edp_panel {
> +               compatible = "sharp_lq140m1jw46";

Device tree compatible strings separate the manufacturer from the
model with ",", not "_".


> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_hot_plug_det>;

I think for eDP we probably want the pinctrl to be in the sc7280.dtsi
file. It seems highly likely that people will hook up the eDP HPD pin
to the standard place. If they don't then boards can override it.


> +               power-supply = <&edp_power>;
> +               backlight = <&edp_backlight>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint = <&edp_out>;
> +                               };
> +                       };

Like for DP, much of this "ports" stuff should be in sc7280.dtsi.


> +               };
> +       };
> +};
> +
>  &tlmm {
> +       edp_hot_plug_det: edp-hot-plug-det {
> +               pins = "gpio60";
> +               function = "edp_hot";

The "pins" and "function" belong in sc7280.dtsi.


> +               bias-pull-down;

This part belongs in the CRD file.


> +               input-enable;

You don't need "input-enable".


> +       };


> +       edp_panel_power_default: edp_panel_power_default {

Nit: node name shouldn't have underscores.
...and remove the word "default".
