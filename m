Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89619F0941
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BD010EF97;
	Fri, 13 Dec 2024 10:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mgTFjeMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B4610EF97
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:19:18 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6eff4f0d627so14916117b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734085157; x=1734689957; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JzubTKIrCCyJH0pfnEBHBmZCTtcP1wgY3Y2naNN0eVk=;
 b=mgTFjeMV2Fl0CUdFiTOISyCUZlsLkO3iGyR5TgZ8QcTtzdcf9Db2AP9oB0MjhUASxB
 Kyf55NaXjo4/skwyfF6zAjx1uK0I3AC06Hwppoc/UayG+wvi0ToL8YryZf8UzzujFMw9
 o8w7LAHWy83iJwqOqIwStJC9CXfAhGOghqGy1Gbd8tA6GACcyjcBUViX4lnu65PTdATZ
 sqSvGhVkqIpbaKTavlvyMQqOWiOW1X7eV5d/oL2iiDJfl+o2lu1XETfr11Cq/Zon6mSk
 hYaNYNUkk+EOtD/Kcvrd98GxdbnQ7wELt9ooi6hbm8knpn6/rmauU0uw3nRl1qebQGHA
 5c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734085157; x=1734689957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JzubTKIrCCyJH0pfnEBHBmZCTtcP1wgY3Y2naNN0eVk=;
 b=jBNTF78FnZ5nw9RsdBYrQHMEPo6Fd9UVuz0Eszb2nCccrbKUAj6+jLNbBvxjJS0qr9
 cG1+WP3MdOyDha+7722xpuZeQ4Te8k6wLGJaHm7Pb9VecUcmrXi1Kv6plIEiWMmKez7u
 +/kx6vZ2peWPoEya8Hjt8qJpRI1cjx3/eFKxSNSA9NTFpcCpvWcSH0UnOBOdNHo9ejCy
 gT1QQOwAc/M/+tecLqMW7tDPFe40QiQTJIS25qf82Siqk9mtOmNemTtZH6TyZhsfnV+0
 TNEl1Y5t4ezhAocci/Msfw8+eBikaeDRJXeivHB4lPw5DzE5aK7tNr1A18ECU5PysSAf
 KRyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXylOHtfKFMo8yRoDVcxK7gE/Epoy48Jqx6JA+N0HneRfA7KB7PXfNmM0l06/kurbIlHwJomqwMWNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqPO7U+WuRXsyozSJqjypSy0y2+2t8XrbykDYndzNAyJPAmPUa
 SNXMnAB8W3nqITyPdJGwxGuJH0sVswkUAfQAD3dxhTXNhzrpNa2lvNkohSXEYtqUK2IKMKQg2xo
 wCb8jPM8PUrI/8je9aZKTcB6a/i42KwhfRoH1eg==
X-Gm-Gg: ASbGncvvW+tv2KSc4vUy/6e2lwMjs4WSa+xMp6q4X6iuQo/8fUZ1tkIlXoYfxH/bIVi
 iDMrybHk7sFqb97mFhmG7izccsNuCtAwO5IsHDQ==
X-Google-Smtp-Source: AGHT+IE+V0UDCOAU5QBdFhu4vGa18K/4xyOW5PpbJKOBiXTh72LOzIvfBG+05zrZNP3V7nBvigfrJ7wDyZaG9B3yK7Y=
X-Received: by 2002:a05:6902:2484:b0:e3a:3a3d:40c9 with SMTP id
 3f1490d57ef6-e4352f57b49mr1567063276.39.1734085157123; Fri, 13 Dec 2024
 02:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
 <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
In-Reply-To: <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 12:19:05 +0200
Message-ID: <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/12/10 19:02, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add display MDSS and DSI configuration for QCS615 RIDE board.
> >> QCS615 has a DP port, and DP support will be added in a later patch.
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 89 ++++++++++++++++++++++++++++++++
> >>   1 file changed, 89 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> index a25928933e2b66241258e418c6e5bc36c306101e..694719a09ac46bfa2fe34f1883c0970b9d0902be 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> @@ -32,6 +32,18 @@ xo_board_clk: xo-board-clk {
> >>                      #clock-cells = <0>;
> >>              };
> >>      };
> >> +
> >> +    dp-connector {
> >> +            compatible = "dp-connector";
> >> +            label = "DP";
> >> +            type = "mini";
> >> +
> >> +            port {
> >> +                    dp_connector_out: endpoint {
> >> +                            remote-endpoint = <&anx_7625_out>;
> >> +                    };
> >> +            };
> >> +    };
> >>   };
> >>
> >>   &apps_rsc {
> >> @@ -202,6 +214,83 @@ &gcc {
> >>               <&sleep_clk>;
> >>   };
> >>
> >> +&i2c2 {
> >> +    clock-frequency = <400000>;
> >> +    status = "okay";
> >> +
> >> +    ioexp: gpio@3e {
> >> +            compatible = "semtech,sx1509q";
> >> +            reg = <0x3e>;
> >> +            interrupt-parent = <&tlmm>;
> >> +            interrupts = <58 0>;
> >
> > Use IRQ flags instead of just 0 (here and further on). Also it might be
> > better to use interrupts-extended instead.
> Got it, will use interrupts-extended instead
> -               interrupt-parent = <&tlmm>;
> -               interrupts = <58 0>;
> +               interrupts-extended = <&tlmm 58 IRQ_TYPE_NONE>;
> >
> >> +            gpio-controller;
> >> +            #gpio-cells = <2>;
> >> +            interrupt-controller;
> >> +            #interrupt-cells = <2>;
> >> +            semtech,probe-reset;
> >> +    };
> >> +
> >> +    i2c-mux@77 {
> >> +            compatible = "nxp,pca9542";
> >> +            reg = <0x77>;
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >
> > Add empty line before device nodes (here and furher on).
> Sorry, will add it in next patch.
> >
> >> +            i2c@0 {
> >> +                    reg = <0>;
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <0>;
> >> +
> >> +                    anx7625@58 {
> >> +                            compatible = "analogix,anx7625";
> >> +                            reg = <0x58>;
> >> +                            interrupt-parent = <&ioexp>;
> >> +                            interrupts = <0 0>;
> will change it to interrupts-extended in next patch
> -               interrupt-parent = <&ioexp>;
> -               interrupts = <0 0>;
> +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;

Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?

> >> +                            enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> >> +                            reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> >> +                            wakeup-source;
> >> +
> >> +                            ports {
> >> +                                    #address-cells = <1>;
> >> +                                    #size-cells = <0>;
> >> +
> >> +                                    port@0 {
> >> +                                            reg = <0>;
> >> +                                            anx_7625_in: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_out>;
> >> +                                            };
> >> +                                    };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            anx_7625_out: endpoint {
> >> +                                                    remote-endpoint = <&dp_connector_out>;
> >> +                                            };
> >> +                                    };
> >> +                            };
> >> +                    };
> >> +            };
> >> +    };
> >> +};
> >> +
> >> +&mdss {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +    vdda-supply = <&vreg_l11a>;
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +    remote-endpoint = <&anx_7625_in>;
> >> +    data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&mdss_dsi0_phy {
> >> +    vdds-supply = <&vreg_l5a>;
> >> +    status = "okay";
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>      status = "okay";
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry
