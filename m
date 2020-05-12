Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324191CEDBB
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69D36E851;
	Tue, 12 May 2020 07:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4676E087
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 01:22:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id f7so5567625pfa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rvNxntDeexCd7VZSGnVRoemTH38Jc+aBjHlUNupdABc=;
 b=atSBublTcto3epYtRg/c05QtyAez9kHSmO/iI2vtHSUL852U5XYG6lL9rI91Sczfm9
 hHwAb1SFlPi0hAdtbcwA1eW0j5JB6cb8JDfo7qB10p5i2XJzOBUS+e1SxSs1qoBlbnXv
 /ihzDqNEJOFRSR4cE4JSeJQq+dbzFO51Zj3DYji0TapflR6qrRdRiUTXTGcbufd34olp
 50dJVZamCy+Hd1GVFUYKJO32EnOKXBvZb29fprkErsxg0byPS4L6Mc1pD4mkbzriYUzd
 ci/XuL+CfsDz/bcY4jThdLN0w2hIFdgtUoRfEHNws76lzJf0vzwm+t0Ho+bV1OWeZh3s
 HhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvNxntDeexCd7VZSGnVRoemTH38Jc+aBjHlUNupdABc=;
 b=kwSi7BjpGSZ7tCPBPZdLgzwWODZ+K0mKDEHmWgb7+auZdkg+uRhmmWHDAISPPm4hMw
 oYTtQCFW0Q1zM8J0AoI2YEfAGnWayNaXsYZDcGf29lui00Z0y7C0oSxRUECloriCqL7X
 4cTfSzL9cAC/6tfAm21iOoJanWZq8LqRdNLKAB4F/dga0gEfB0s1mCMEfqyD9ueakqwS
 QHp5lgvhGtQd4+0UasQydke8YB9nRtKi3G1CWoaiUO1kKgjAp1jHeL/r3YIheTHGS9K0
 cZDFurqChJ5KWJUf+ZOOAihvKD8Ok9jK4FO5WzuDGgB1uEA7SVKMCHEIW3gfMIG0l91D
 Mnbg==
X-Gm-Message-State: AGi0PuZneZCqji3WRPnS+3ZplHqac9I7O3+v9ljKHWIX250fBp1JIeUA
 tBLjPOHj8bMdmyYu+areGRbjgw==
X-Google-Smtp-Source: APiQypLn6g4IZcdlvBjSJuJuDl2/3qY5ewye8c0iiWpzkOBNDc6PtG12DjCtqf0G3JBWZY21cS/tsg==
X-Received: by 2002:a62:3644:: with SMTP id d65mr18205186pfa.186.1589246578672; 
 Mon, 11 May 2020 18:22:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w11sm10245851pfq.100.2020.05.11.18.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 18:22:57 -0700 (PDT)
Date: Mon, 11 May 2020 18:21:23 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on
 cheza
Message-ID: <20200512012123.GC57962@builder.lan>
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jonas@kwiboo.se, jeffrey.l.hugo@gmail.com, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, a.hajda@samsung.com,
 bgolaszewski@baylibre.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 07 May 14:35 PDT 2020, Douglas Anderson wrote:

> We don't have the HPD line hooked up to the bridge chip.  Add it as
> suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
> Document no-hpd").
> 
> NOTE: this patch isn't expected to have any effect but just keeps us
> cleaner for the future.  Currently the driver in Linux just assumes
> that nobody has HPD hooked up.  This change allows us to later
> implement HPD support in the driver without messing up sdm845-cheza.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Applied this patch for 5.8 in the Qualcomm SoC tree.

Regards,
Bjorn

> ---
> 
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.
> 
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9070be43a309..5938f8b2aa2f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
>  		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
>  		clock-names = "refclk";
>  
> +		no-hpd;
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
