Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D814811ED25
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753516EDDD;
	Fri, 13 Dec 2019 21:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2E96EDDD;
 Fri, 13 Dec 2019 21:47:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v140so1995742oie.0;
 Fri, 13 Dec 2019 13:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w5xdh98E7mr6+86lSxAaIdccaOQtAOZWUmlaUNXldZU=;
 b=deFL1iVI2o9gCOxSo8Vphfa3h+jBdmtScYiRqglSuJahDQeyfAfWmD4MxPJvOnn/sd
 zraCsuN6ZxSwC1c94LJh8XQ79bSY7+3zcpK4EiAaKaGiSxP34/GMbVIETaEqkgUzQaDp
 84830/weRDbyYOx7YaHA3Mwx7V0GpxuzrXSfpQWF29AdrZ5I/bL9HCGBaAh+DpcWRpYi
 zqGwhPw20sPtwUsdIVNtiwfZ40JhuR32ObqzVyXnIh/+Mtzpv3T1bMEJ6++I9OpIQwvD
 rZa481cSWcn9YtP5LOnSh8c4IUvQ5wFrrr+K6qHCyFI36uE3QMKqTWBodP8FGbZHmy93
 MGRw==
X-Gm-Message-State: APjAAAU4ZkyIyj3U6WEdoDPKKQoIojek19jc5K81/NTLa7PWvyaaO9+O
 RP+nUb3aDADcFdc8RrNbTeIEmvY=
X-Google-Smtp-Source: APXvYqzm62Y9qN5g4QrstJ8YOMO5rKtfDZ1qoaPCIsVdFH1v/4Bxp+t6KiBbsCr+3sooAIymdRKrSg==
X-Received: by 2002:aca:4a41:: with SMTP id x62mr7648394oia.148.1576273641167; 
 Fri, 13 Dec 2019 13:47:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p83sm1913240oia.51.2019.12.13.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 13:47:20 -0800 (PST)
Date: Fri, 13 Dec 2019 15:47:19 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20191213214719.GA11149@bogus>
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
 <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 29, 2019 at 12:25:44PM +0530, Harigovindan P wrote:
> Add a compatible string to support sc7180 panel version.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/visionox,rm69299.txt

Source files should not have execute permission.

New bindings should be in DT schema format.

checkpatch.pl will tell you both of these things.

> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> new file mode 100755
> index 0000000..4622191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> @@ -0,0 +1,68 @@
> +Visionox model RM69299 DSI display driver
> +
> +The Visionox RM69299 is a generic display driver, currently only configured
> +for use in the 1080p display on the Qualcomm SC7180 MTP board.
> +
> +Required properties:
> +- compatible: should be "visionox,rm69299-1080p-display"

RM69299 may be generic, but 1080p sounds like a specific panel.

Is there anything besides a 'display'? If not, '-display' is redundant.

> +- vdda-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- vdd3p3-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  (active low)
> +- mode-gpios: phandle of the gpio for choosing the mode of the display
> +  for single DSI

The modes are what?

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
> +			display-timings {
> +				timing0: timing-0 {
> +					/* originally
> +					 * 268316160 Mhz,
> +					 * but value below fits
> +					 * better w/ downstream
> +					 */
> +					clock-frequency = <158695680>;
> +					hactive = <1080>;
> +					vactive = <2248>;
> +					hfront-porch = <26>;
> +					hback-porch = <36>;
> +					hsync-len = <2>;
> +					vfront-porch = <56>;
> +					vback-porch = <4>;
> +					vsync-len = <4>;
> +				};
> +			};
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
