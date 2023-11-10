Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056327E8383
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E408610E23D;
	Fri, 10 Nov 2023 20:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A00110E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:12:27 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ce2b6cb933so1297044a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699647146; x=1700251946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aYPa4O78Tl9tcmK397HC2WttsKjZOddgN547MJ4MmL0=;
 b=Zr4SXUyP6g3tKZvWhbJR006kX7u9egfg9y30YfAk7xOvcQnGGa5eDJFrj7ntth9Toy
 sUPFEfKLIMnX4cjfKg9dTA3SZjP1naffgx7+OduLsZxJaUs7BU+6pwnseyB4HVWl5/cX
 NOlH1UFvA7LPiRMEuFj0cipcefwDVZqY3JidyzxaKMCiOMUcULkwMtqii0qz30Nr1+3i
 YS6drolczllrtJyb5Llx4gF4DyL2TJQtVNG7UFWxPn3jCGCI3tjQefhkemmRu1y6ExTq
 Ey/NHdrfBTDG4yRZ0SOXCwZYYzqc+OIVAZIyDbANm86N9yZQpKdbS1BqR1+DUcm4c53v
 xdpA==
X-Gm-Message-State: AOJu0Yw+Uk4yNh3PDp0PJMDOt3yUTriTtoFEmuByjXZKKJR20/8lf0rw
 cU++fWDj73RPyfOuAv3h3A==
X-Google-Smtp-Source: AGHT+IGGXIL2O/re8npp6ti2/LlN+F5Sn3lm88DX439xHtC4GKBD8xBJhNWXN6GHMCBpDIWH4xG5Rw==
X-Received: by 2002:a05:6870:2dc6:b0:1c8:c27f:7d9b with SMTP id
 op6-20020a0568702dc600b001c8c27f7d9bmr282410oab.27.1699647146338; 
 Fri, 10 Nov 2023 12:12:26 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y22-20020a056870725600b001ea4324364csm52458oaf.12.2023.11.10.12.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:12:25 -0800 (PST)
Received: (nullmailer pid 351692 invoked by uid 1000);
 Fri, 10 Nov 2023 20:12:23 -0000
Date: Fri, 10 Nov 2023 14:12:23 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic, meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231110201223.GA347493-robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
> importantly the phy subnode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> index 16977e4e4357..2edf4ccea845 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -158,3 +158,44 @@ examples:
>              };
>          };
>      };
> +

New example should be separate starting with a '-|'.

> +    bus@ff63c000 {
> +        compatible = "simple-bus";
> +        reg = <0xff63c000 0x1c00>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0xff63c000 0x1c00>;

Why do you need all this? 1 cell is the default for examples.

> +
> +        system-controller@0 {
> +            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
> +            reg = <0 0x400>;
> +
> +            clock-controller {
> +                compatible = "amlogic,axg-clkc";
> +                #clock-cells = <1>;
> +                clocks = <&xtal>;
> +                clock-names = "xtal";
> +            };
> +
> +            power-controller {
> +                compatible = "amlogic,meson-axg-pwrc";
> +                #power-domain-cells = <1>;
> +                amlogic,ao-sysctrl = <&sysctrl_AO>;
> +
> +                resets = <&reset_viu>,
> +                         <&reset_venc>,
> +                         <&reset_vcbus>,
> +                         <&reset_vencl>,
> +                         <&reset_vid_lock>;
> +                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
> +                clocks = <&clk_vpu>, <&clk_vapb>;
> +                clock-names = "vpu", "vapb";
> +            };
> +
> +            phy {
> +                compatible = "amlogic,axg-mipi-pcie-analog-phy";
> +                #phy-cells = <0>;
> +                status = "disabled";

Examples should not be disabled.

> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 
