Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F9209A92
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5620E6E525;
	Thu, 25 Jun 2020 07:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D356E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 01:07:20 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x8so1099122plm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=DQNqb/XiJnv5S5KAYc7VnMgjA/JQZWT3OBZtTbZloYs=;
 b=H0UbnxIw9yihnQXV7n5Vs/S+wHPE+4oI5wiVf1L0FkydepByp7tukHVSsmBjKzLtYX
 yAcpeRrcRzj/Azf+tWW5QrIcwBLUlca1JeCMlp5VQ7O8QXhFKfAz6YcmO5rVSxdRxFr1
 wb59f68RnJCNYPRZVH9RkF3A//MIGZ1RhhQZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=DQNqb/XiJnv5S5KAYc7VnMgjA/JQZWT3OBZtTbZloYs=;
 b=bbWXBRegJH7iLXN7b1sc+vP1yoFH/N4bG+cgH8zevNGm79dR8qZMIjSBcXBv5ApJdh
 Qjvwi3cWdt5snEINxX9XqyheTtM9Yk5bjfPY2z2ZluLcqMAOSOHm5JHJlXcM4AflIU0w
 l+tiYYyvvJAbSflTJtlyCn2uQ2iBRgAoQ6AanDD8SAtO6Rt1LwOXWgkM/loZ/4YTyDS9
 CQSdynr4cLmaEDfDo3OEJQPd2U21JTvrCT0gJYsFIoJhLYB7EqmY8Yj5HWn1t0Xxerq1
 JvLTd4vjvvjmHQqu+5/O2FZDEyS7D3tA3luxPKTYTuT5P6hTEg0uJLQiW5gIgBxOxuyY
 /ewA==
X-Gm-Message-State: AOAM531NfG15ioUvUzJ5z/Gosp5HY0PtvgbHUjYUYFzFSgvdr+txo3Q3
 bmjdejuIS06q+km5sNsVedypfQ==
X-Google-Smtp-Source: ABdhPJwwcQxMpk75imsoh0sM8lNh+D5onW70er8+RgLQLUV8Zlj+nifCh0lPXsEWgtHbcZypSU21dQ==
X-Received: by 2002:a17:90a:22ab:: with SMTP id
 s40mr501452pjc.27.1593047240035; 
 Wed, 24 Jun 2020 18:07:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id u8sm20760732pfh.215.2020.06.24.18.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 18:07:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200217085842.28333-1-harigovi@codeaurora.org>
References: <20200217085842.28333-1-harigovi@codeaurora.org>
Subject: Re: [v3] arm64: dts: sc7180: add nodes for idp display
From: Stephen Boyd <swboyd@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Wed, 24 Jun 2020 18:07:18 -0700
Message-ID: <159304723830.62212.5069780400830519255@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Harigovindan P (2020-02-17 00:58:42)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50ad4fde..349db8fe78a5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -232,6 +233,57 @@ vreg_bob: bob {
>         };
>  };
>  
> +&dsi0 {
> +       status = "okay";
> +
> +       vdda-supply = <&vreg_l3c_1p2>;
> +
> +       panel@0 {
> +               compatible = "visionox,rm69299-1080p-display";
> +               reg = <0>;
> +
> +               vdda-supply = <&vreg_l8c_1p8>;
> +               vdd3p3-supply = <&vreg_l18a_2p8>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&disp_pins>;
> +
> +               reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               panel0_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&panel0_in>;
> +                               data-lanes = <0 1 2 3>;

Is this property needed? If it's the default assumption it would be nice
to omit it so that we don't have to think about it.

> +                       };
> +               };
> +       };
> +};
> +
> +&dsi_phy {
> +       status = "okay";
> +};
> +
> +&mdp {
> +       status = "okay";
> +};
> +
> +&mdss {
> +       status = "okay";
> +};
> +
>  &qspi {
>         status = "okay";
>         pinctrl-names = "default";
> @@ -289,6 +341,17 @@ &usb_1_qmpphy {
>  
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
> +&pm6150l_gpio {
> +       disp_pins: disp-pins {

Curious how this works. It looks like PMIC GPIOS are expecting the node
to look like:

	disp_pins: disp-pins {
		pinconf {
			pins = "gpio3";
			function = PMIC_GPIO_FUNC_FUNC1;
			qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
			power-source = <PM6150_GPIO_VPH>;
			bias-disable;
			output-low;
		};

but this doesn't use the macros or the subnode for pinconf. Why? Also,
the PM6150_GPIO_VPH macro doesn't exist.

> +               pins = "gpio3";
> +               function = "func1";
> +               qcom,drive-strength = <2>;
> +               power-source = <0>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
