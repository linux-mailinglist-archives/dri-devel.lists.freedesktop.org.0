Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6314B3A197A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152746E0F6;
	Wed,  9 Jun 2021 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F32A6E0F6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 15:27:08 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id u11so25466891oiv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CgJuBx+Pz7LVmI0PFBi6kdiCkymNrSp5mHVaaKI3av4=;
 b=qp/JEUr4X5TDvBZmnLsMFOCFzx+kDAgnp0yl0wdmEKLnFnb51Gt3TOzzNP4ckU5597
 Bloq+oNivWX3ewJOfClJeIlniSuEH0gtIyoq7b5hL4AfyXlJTJ7G0f0nFnro+SODHaP7
 VOCVnNXyku3hnlkXr2eWqBpG6o+wJOwnZUigE1hKQTJulQhqbELy/kPxYwke8TZH3qUr
 DRR79HcTgJBTIL9ZZ+9rbz8YKLzRlgNGbOzknothmu2l5mT4jPbqIPC5gmR8qttCNwx5
 dsO/iw2064VVew1oZ6UC0iCcKmwsrCj61lQFiJzzv1+nuEFALUNdQESnI1DGbWuScuwP
 N5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CgJuBx+Pz7LVmI0PFBi6kdiCkymNrSp5mHVaaKI3av4=;
 b=X7TGN/QGq3L851pG4rdJSAOaBRqz3aM15Q48cHqfh2RtL76FFdrCg4MGzPDUzOPLO1
 PhQh3h4RWSoSJvS+BGcC2y2pvmSEuBZuzMaKd3peU/5I9+MOpCCn2q6W+5ymXr4IAvQZ
 ck9lIas+MIf3yjsvPIEZgQ3N4yjI0NNdd2yJIxIWZmyCkhbM4CmEGETWxTKQ4emRhLbh
 0h7DXXra760Ugp3d7h4Chq/QNzxjB4iX88QE2vCw4J7/TWC0TJdMUkenY/rSlbK5+JKi
 quRMPdP1Igm3KZnHca8NsQmsOzipGanNl1jOx1UkeOPXuOtYpMHEEl848zC9O+1sv6Wq
 CQ7Q==
X-Gm-Message-State: AOAM533OnGps0LVvE+XTesQXY9P3yI9gsCC7pMuRdHdQAnVJogk6cpDP
 dDAoFplyYaE7S0W1JO9ZSobhlw==
X-Google-Smtp-Source: ABdhPJyolhMXyfsnX4dd8qid83wHXAc8WqbuNrQQd9y6dWJSSJ8cdN7AVqfoCd9puEeQt9C6524BxA==
X-Received: by 2002:aca:38c1:: with SMTP id f184mr122667oia.101.1623252427729; 
 Wed, 09 Jun 2021 08:27:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u26sm49756ote.53.2021.06.09.08.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:27:07 -0700 (PDT)
Date: Wed, 9 Jun 2021 10:27:04 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v9 11/11] arm64: dts: qcom: sc7180-trogdor: Move panel
 under the bridge chip
Message-ID: <YMDdyEzCpdttQyNu@builder.lan>
References: <20210607170555.4006050-1-dianders@chromium.org>
 <20210607100234.v9.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607100234.v9.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Andy Gross <agross@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 07 Jun 12:05 CDT 2021, Douglas Anderson wrote:

> Putting the panel under the bridge chip (under the aux-bus node)
> allows the panel driver to get access to the DP AUX bus, enabling all
> sorts of fabulous new features.
> 
> While we're at this, get rid of a level of hierarchy for the panel
> node. It doesn't need "ports / port" and can just have a "port" child.
> 
> For Linux, this patch has a hard requirement on the patches adding DP
> AUX bus support to the ti-sn65dsi86 bridge chip driver. See the patch
> ("drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

In case you want to merge this together with the driver changes
(even though there's no direct need for them to go together):

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Panel now under bridge chip instead of getting a link to ddc-i2c
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 30 ++++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293ef56d7..c76afd857b54 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -260,21 +260,6 @@ max98357a: audio-codec-0 {
>  		#sound-dai-cells = <0>;
>  	};
>  
> -	panel: panel {
> -		/* Compatible will be filled in per-board */
> -		power-supply = <&pp3300_dx_edp>;
> -		backlight = <&backlight>;
> -		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> -
> -		ports {
> -			port {
> -				panel_in_edp: endpoint {
> -					remote-endpoint = <&sn65dsi86_out>;
> -				};
> -			};
> -		};
> -	};
> -
>  	pwmleds {
>  		compatible = "pwm-leds";
>  		keyboard_backlight: keyboard-backlight {
> @@ -674,6 +659,21 @@ sn65dsi86_out: endpoint {
>  				};
>  			};
>  		};
> +
> +		aux-bus {
> +			panel: panel {
> +				/* Compatible will be filled in per-board */
> +				power-supply = <&pp3300_dx_edp>;
> +				backlight = <&backlight>;
> +				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> +
> +				port {
> +					panel_in_edp: endpoint {
> +						remote-endpoint = <&sn65dsi86_out>;
> +					};
> +				};
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.32.0.rc1.229.g3e70b5a671-goog
> 
