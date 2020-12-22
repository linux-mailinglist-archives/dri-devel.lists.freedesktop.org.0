Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F12E0352
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 01:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A206E030;
	Tue, 22 Dec 2020 00:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CC76E030
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:15:01 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id d8so10461897otq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 16:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CZCTVp7dSrXEn5R6AF0sfezyGRuCo+PRxp9JIcTZ/OQ=;
 b=hBDgGfSPqy0GkbyAnbBmeaiuRZsHomBzN67L3j1Ht8wcO0rbvkexiYq4Sso0XchgcJ
 3QG437oMlE+Q1Y/fS8tRPZnxxQB+LExRe/Kf2pRir3VWdG5HX4ZGHnfykYzcdjtrwmH0
 LloEEVh3H7gIoeJmEd+UysNDBlEHZDC1IDNj/OVyV03gw/rX87wnekZpNfK+BpdTKLMD
 uK/79dJgrTNHOukYoSQa2Iq/+6HZmuA5vQ199KR/vHTJtgJxEABzFphFlyljfsplMkWh
 LLBXzRm6TjzjtaWtQA45QR3XO/jCI1Y9olGHTxk0065N4daJRoShdEZkdxfcrFzAhmy6
 RXTQ==
X-Gm-Message-State: AOAM533IiKv1YCV+h8+lk1sqHKRG1XxsBjPbhtggNc1iXjeqNejx61Nb
 c57o2/QjyJQSisZnCRDAPg==
X-Google-Smtp-Source: ABdhPJzwI6oFeOVHPaze1aIeGaY36Y4EuT1YpNmyFUot22+xHR7ZIZmRzD/T0REyCMYip94Hk4WIlw==
X-Received: by 2002:a9d:63c6:: with SMTP id e6mr13808424otl.326.1608596100596; 
 Mon, 21 Dec 2020 16:15:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m7sm971797ool.29.2020.12.21.16.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 16:14:59 -0800 (PST)
Received: (nullmailer pid 901351 invoked by uid 1000);
 Tue, 22 Dec 2020 00:14:57 -0000
Date: Mon, 21 Dec 2020 17:14:57 -0700
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 06/48] dt-bindings: clock: tegra: Document clocks
 sub-node
Message-ID: <20201222001457.GA891962@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-7-digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:05:56PM +0300, Dmitry Osipenko wrote:
> Document "clocks" sub-node which describes Tegra SoC clocks that require
> a higher voltage of the core power domain in order to operate properly on
> a higher rates.

Seems like an odd reason to have a bunch of child nodes. It very much 
seems like a problem you'd need to solve after you design the binding 
which should be fixed within the kernel.

This is also above my threshold for 'convert to schema' first...

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra20-car.txt     | 26 +++++++++++++++++++
>  .../bindings/clock/nvidia,tegra30-car.txt     | 26 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> index 6c5901b503d0..353354477785 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> @@ -19,6 +19,16 @@ Required properties :
>    In clock consumers, this cell represents the bit number in the CAR's
>    array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>  
> +Optional child sub-node "clocks" should contain nodes matching the clocks
> +on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
> +
> +Required properties :
> +- compatible : Should be "nvidia,tegra20-clock".
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- clocks : Should contain clock which corresponds to the node.
> +- power-domains: Phandle to a power domain node as described by generic
> +                 PM domain bindings.
> +
>  Example SoC include file:
>  
>  / {
> @@ -27,6 +37,22 @@ Example SoC include file:
>  		reg = <0x60006000 0x1000>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> +
> +		clocks {
> +			hdmi {
> +				compatible = "nvidia,tegra20-clock";
> +				operating-points-v2 = <&hdmi_opp_table>;
> +				clocks = <&tegra_car TEGRA20_CLK_HDMI>;
> +				power-domains = <&domain>;
> +			};
> +
> +			pll_m {
> +				compatible = "nvidia,tegra20-clock";
> +				operating-points-v2 = <&pll_m_opp_table>;
> +				clocks = <&tegra_car TEGRA20_CLK_PLL_M>;
> +				power-domains = <&domain>;
> +			};
> +		};
>  	};
>  
>  	usb@c5004000 {
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> index 63618cde12df..bc7bbdaa9d3f 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> @@ -19,6 +19,16 @@ Required properties :
>    In clock consumers, this cell represents the bit number in the CAR's
>    array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
>  
> +Optional child sub-node "clocks" should contain nodes matching the clocks
> +on the Tegra SoC. Refer to Tegra TRM for mode details on the clock nodes.
> +
> +Required properties :
> +- compatible : Should be "nvidia,tegra30-clock".
> +- operating-points-v2: See ../bindings/opp/opp.txt for details.
> +- clocks : Should contain clock which corresponds to the node.
> +- power-domains: Phandle to a power domain node as described by generic
> +                 PM domain bindings.
> +
>  Example SoC include file:
>  
>  / {
> @@ -31,6 +41,22 @@ Example SoC include file:
>  
>  	usb@c5004000 {
>  		clocks = <&tegra_car TEGRA30_CLK_USB2>;
> +
> +		clocks {
> +			hdmi {
> +				compatible = "nvidia,tegra30-clock";
> +				operating-points-v2 = <&hdmi_opp_table>;
> +				clocks = <&tegra_car TEGRA30_CLK_HDMI>;
> +				power-domains = <&domain>;
> +			};
> +
> +			pll_m {
> +				compatible = "nvidia,tegra30-clock";
> +				operating-points-v2 = <&pll_m_opp_table>;
> +				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
> +				power-domains = <&domain>;
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
