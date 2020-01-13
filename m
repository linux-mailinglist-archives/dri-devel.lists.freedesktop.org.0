Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42967139C07
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 23:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D536E172;
	Mon, 13 Jan 2020 22:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519E46E165
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 22:00:00 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 4so5517730pfz.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 14:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FDBSCFeDWTbY58059YufZG1qGkZAqqtwHIzXdBIurps=;
 b=V41NXNx92G9QE82/gdHR924ckvA7zTp+qtJThQsSIz9mtMXQqqw6+f4jyoq1JY4idd
 WTmT6EDp+PIaUeLZT7swCYSXt+vED8KssypVQpDcsnUkUaQLW8DP8hfOYGewdCQ7XJom
 8c3LBlb80ztpXppjm8NPjK4cbCIMK1A5IbLsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FDBSCFeDWTbY58059YufZG1qGkZAqqtwHIzXdBIurps=;
 b=kreljjyvTHVHxQiuFR0KFkEjb//EoyZeErsh/mOzPizCtloU73EWFGTAgJtpA3TwVt
 AhVFPz+m7cUh1JUSKrNKlRbFtJslZzreRouj1L1u03/fHM2oo6xZBcad/eW72ycW9CHf
 kJAlkbs7Wk+hzUBSqtjrZyqp0q7TcA73CK6snBfT2br8DAXmWIFYu7h5GmeJxlCfKVKg
 6vJvbIFUE1z6iGr1Z8CnMwZ5IY4N6vRMp4afo3mlzDeKpZLpSrgNujUpUbvF6/hDygz9
 XLobSBa8gp+HM+AjFkmevT+4HFWwd3cwTsHsr3fqWLovWwD3dSCxF1WHxgL8mF1mWccZ
 xmGQ==
X-Gm-Message-State: APjAAAV+8P1IW4e2XeIM8Bcf4ythNk6GDps15OLtWwBK3teE7FQF1C4F
 A1om2Egmx59ZhHap5kHADhRFhw==
X-Google-Smtp-Source: APXvYqwBTZWU7x3UKOtRpFfBMLgYzxZkpEU97jGquP31XxAuDz7Rtm2g44M1sjVBdEr3X+k+2XymsQ==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr21459678pfm.60.1578952799897; 
 Mon, 13 Jan 2020 13:59:59 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id x11sm14772117pfn.53.2020.01.13.13.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:59:59 -0800 (PST)
Date: Mon, 13 Jan 2020 13:59:58 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20200113215958.GI89495@google.com>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 07, 2020 at 04:59:56PM +0530, Harigovindan P wrote:
> Subject: dt-bindings: display: add sc7180 panel variant
>
> Add a compatible string to support sc7180 panel version.

The sc7180 is a SoC, I suppose you are referring to the sc7180-idp, a
board based on this SoC. But even with the correct board name, this
isn't a good commit message. The board is irrelevant here, the display
could be used on dozens of other boards.

Apparently the panel is the Visionix RM69299, please use this instead
of 'sc7180'.

Thanks

Matthias

> Changes in v1:
> 	-Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	-Removed unwanted properties from description.
> 	-Creating source files without execute permissions(Rob Herring).
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> new file mode 100644
> index 0000000..d7bbd5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> @@ -0,0 +1,48 @@
> +Visionox model RM69299 DSI display driver
> +
> +The Visionox RM69299 is a generic display driver, currently only configured
> +for use in the 1080p display on the Qualcomm SC7180 MTP board.
> +
> +Required properties:
> +- compatible: should be "visionox,rm69299-1080p-display"
> +- vdda-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- vdd3p3-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  (active low)
> +- ports: This device has one video port driven by one DSI. Their connections
> +  are modeled using the OF graph bindings specified in
> +  Documentation/devicetree/bindings/graph.txt.
> +  - port@0: DSI input port driven by master DSI
> +
> +Example:
> +
> +	dsi@ae94000 {
> +		panel@0 {
> +			compatible = "visionox,rm69299-1080p-display";
> +			reg = <0>;
> +
> +			vdda-supply = <&src_pp1800_l8c>;
> +			vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +			pinctrl-names = "default", "suspend";
> +			pinctrl-0 = <&disp_pins_default>;
> +			pinctrl-1 = <&disp_pins_default>;
> +
> +			reset-gpios = <&pm6150l_gpios 3 0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					panel0_in: endpoint {
> +						remote-endpoint = <&dsi0_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
