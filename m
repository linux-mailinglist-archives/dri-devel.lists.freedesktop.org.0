Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A8A4D702C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 18:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9010E009;
	Sat, 12 Mar 2022 17:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8098710E00F
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 17:36:29 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 g5-20020a4ae885000000b003240bc9b2afso2024408ooe.10
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iRAZJoZoZh3qRV/UYKwJwKogthRoGQB0qt95Y42xJ0o=;
 b=oKm0ZN3ZKvIZN/GefFAARdns9WrE3x4XoBJ1uXZNjdXYJBaoCaTRVBtd93sMGwI+wb
 p8+Rmdi0ffArNKC5tXIP3YZaSq6/DeK62G9RbnTr32gMAG+JgcMDg+JdNv++AmYUV1Df
 O/HZTYKLa5nkt0j7LQvGtgOghhLEbfRLRX/FE9l+m8hY+tB0hxUqoUtufFnw1e6szCRd
 JAfZbCuLpYAvWUxWJlNGHYM84N582JIcLYdIYqJWPblubxZzIUmM93j3yCcHmtdVpNJX
 ZzlMrZWr4rSZLALOPDVB2B3L7jmmV2Ran9m0xNL+HRRM0xboeJumYwhCKmr7ZVJI1CyN
 gxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iRAZJoZoZh3qRV/UYKwJwKogthRoGQB0qt95Y42xJ0o=;
 b=ttuWSYYOgFxiX54YH9PRtXDYlSyzDIPHzSHtA/O9Filu40hOrp54WvMIVsdWR665TI
 O11cfIgBpv9sTbvgYtN2r7D6p9m7y27LKMtnJilRaYt0JDFJWOJy1z8YS/uaQ88+M1mC
 kIlGBWwg8Q3Xek6rMPUK+1UQcIOyR7C9vydBmscPR8WX/lRRUnxTMEVGwjwFkj+HYw/L
 QipXGclH90DZyGcY4aGkNcJPDCC9cJro2yTe56WhIgqjouefAfDYY+KiBmvt/q/M1v93
 2+WG3bkSaABYTzAj7Ftsc6n3SbA0oY8gNH0b472NMa+bQxSUZMHPGhI1nOYaifRZ4M1f
 T0hQ==
X-Gm-Message-State: AOAM533erzXblWOmbWBh81U3YTB39gyrZVVZVoAthqUaPryh+PY4cs61
 F9EFUd0U9wokMW9YEHtQwQ4MPhe7yGifLw==
X-Google-Smtp-Source: ABdhPJyn9jljunqjT976KNT5QT5bTu3YoYxtUp/Qci2+b4frJrNNW1FUWyYNGk3vpCQ8IWOrnRf9uA==
X-Received: by 2002:a4a:6b5d:0:b0:321:493c:edcb with SMTP id
 h29-20020a4a6b5d000000b00321493cedcbmr7108644oof.81.1647106588714; 
 Sat, 12 Mar 2022 09:36:28 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a9d4b10000000b005b22b93d468sm5105250otf.74.2022.03.12.09.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Mar 2022 09:36:28 -0800 (PST)
Date: Sat, 12 Mar 2022 11:36:26 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
Message-ID: <YizaGgCLxH0D9MRF@builder.lan>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 08 Mar 10:54 CST 2022, Vinod Polimera wrote:

Please run:

  git log --oneline --no-decorate -- arch/arm64/boot/dts/qcom/sc7280.dtsi

and make sure your $subject is prefixed according to all other
sc7280-specific changes.

> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
> 
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
> 
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
> 
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)

It's only in drivers/drm that the changelog goes in the commit message,
so please move this below the ---.

Thanks,
Bjorn

> 
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index baf1653..408cf6c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2856,9 +2856,6 @@
>  				      "ahb",
>  				      "core";
>  
> -			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			assigned-clock-rates = <300000000>;
> -
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-controller;
>  			#interrupt-cells = <1>;
> @@ -2892,11 +2889,9 @@
>  					      "lut",
>  					      "core",
>  					      "vsync";
> -				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
>  						<&dispcc DISP_CC_MDSS_AHB_CLK>;
> -				assigned-clock-rates = <300000000>,
> -							<19200000>,
> +				assigned-clock-rates = <19200000>,
>  							<19200000>;
>  				operating-points-v2 = <&mdp_opp_table>;
>  				power-domains = <&rpmhpd SC7280_CX>;
> -- 
> 2.7.4
> 
