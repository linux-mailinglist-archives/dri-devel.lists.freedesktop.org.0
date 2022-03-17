Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2134DD022
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75810E7D9;
	Thu, 17 Mar 2022 21:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043510E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:23:19 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso8063701ooi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OSDPwmZWTp87KAIy56WntFqaaFxosNFz2qqqMdiQW6w=;
 b=PJSF+SEnFIXKdHu3Posg9gntmUOehMEVLlRwTbnF1+4F7G+er1T969Y9ngviAXdzSN
 WMR2zF5dWsm+M1j1KuCH6P5qEmzm7jrw7rSRKE9YLViPhsImpNxr5Qr6j9QcfSHAzYoK
 ViP0HOoRbn6P9jB+5NFGJm65SroZFBoGUteSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OSDPwmZWTp87KAIy56WntFqaaFxosNFz2qqqMdiQW6w=;
 b=EEG24Oz2/rNV2d9kQeCo8+9A6aAYJKnu9dL+0rYmcynLfZgCm1tIBSRrN7GK7tjYx8
 Lp1m0OENg/BMAeyDLb1Q3CLFOkN5DLNmeU6dl+YE+15PEWniUjgkeQZ0/aswyVL7DrnF
 sTiQgolyU4rt1GSD5Z+vDxWjAZQUCFMS6fUdpzHmiSbF0Dm9gis6IKh0BoJij4oJ5JWv
 dyA7fFOgiv6eoVee6BJrtft8VoFQ0Jgs1ZZ01tgWRSkU30TnUH0PBru22kkJ/2+19RQD
 jNrS02qgBS4atDd4y9VBPLs+ox2gu3Gbj4IoZdA18Bixyoz3j7QKCHBitrBSj1pS2RgS
 d7rA==
X-Gm-Message-State: AOAM5304nU1vV16WOh/r/curjahUfAMegehRfYXS6t/TXLugkcFAG9FT
 1fFJpz7IfUyZZfgmTLf4GcmLTy++PPugkvaXrOyHHw==
X-Google-Smtp-Source: ABdhPJw06bFhb833+vINYAHpOMiySRBg+3pJhhdSUg3v/t91YQ4C0lwpA5ljXOcGX9capHP3ozNx73UBjrV0d5X78P0=
X-Received: by 2002:a05:6870:c0cb:b0:da:2bcc:aa09 with SMTP id
 e11-20020a056870c0cb00b000da2bccaa09mr2695488oad.63.1647552198396; Thu, 17
 Mar 2022 14:23:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:23:17 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:23:17 -0400
Message-ID: <CAE-0n52Uzo47N5QzoKOwny3XTrArA4nM-KPqAVxAPewSAyNOWw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, agross@kernel.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, thierry.reding@gmail.com,
 krzk+dt@kernel.org, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:47)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index e2efbdd..2df654e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include "sc7280-idp.dtsi"
>  #include "sc7280-idp-ec-h1.dtsi"
>
> @@ -21,6 +22,27 @@
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       edp_3v3_regulator: edp-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "edp_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_panel_power>;
> +       };
> +
> +       vreg_edp_bp: vreg-edp-bp-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vreg_edp_bp";
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
>  };
>
>  &apps_rsc {
> @@ -76,6 +98,58 @@ ap_ts_pen_1v8: &i2c13 {
>         };
>  };
>
> +&mdss {
> +       status = "okay";
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
> +&mdss_edp {
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;

Is this property necessary? It looks like the default.

> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       aux-bus {

Can this move to sc7280.dtsi and get a phandle?

> +               edp_panel: edp-panel {

I'd prefer

	edp_panel: panel {

because there's only one panel node at this level.

> +                       compatible = "edp-panel";
> +
> +                       power-supply = <&edp_3v3_regulator>;

This is board specific, but I thought it was on the qcard so we should
move this to sc7280-qcard.dtsi?

> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               port@0 {
> +                                       reg = <0>;
> +                                       edp_panel_in: endpoint {

This can be shortened to

			port {
				edp_panel_in: endpoint {

according to panel-edp.yaml

> +                                               remote-endpoint = <&mdss_edp_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_edp_out {
> +       remote-endpoint = <&edp_panel_in>;
> +};
> +
> +&mdss_edp_phy {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};
> +
>  &nvme_3v3_regulator {
>         gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>  };
> @@ -84,7 +158,26 @@ ap_ts_pen_1v8: &i2c13 {
>         pins = "gpio51";
>  };
>
> +&pm8350c_gpios {
> +       edp_bl_power: edp-bl-power {

Is this used in a later patch?

> +               pins = "gpio7";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +
> +       edp_bl_pwm: edp-bl-pwm {

Is this used in a later patch? Can it be moved to the patch that uses
it?

> +               pins = "gpio8";
> +               function = "func1";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +       };
> +};
> +
>  &tlmm {
> +       edp_panel_power: edp-panel-power {
> +               pins = "gpio80";
> +               function = "gpio";

function of gpio is unnecessary. Where is the bias and drive-strength
settings?

> +       };
> +
>         tp_int_odl: tp-int-odl {
>                 pins = "gpio7";
>                 function = "gpio";
> --
> 2.7.4
>
