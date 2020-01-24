Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1EF14965B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871F26E87B;
	Sat, 25 Jan 2020 15:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A876E416
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 17:32:12 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i6so1462942pfc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
 b=uAQTbihJp9Y377xep7kVEyC+tfqQ1RNOMgHCu+FmUGNTld/PKnP5PmFCvPZfXYtMb+
 ujFDt5FsY2Su1FkuDyta3kmF08yhl6zQ3U1Cenpy7YkzAKaXGmP3idWcYd4JDxr6/Gh+
 aZsV1pyVwEBaDAjUOzQSlMRawIPJEDasbggi4218ieg1f/MvrxWgGrRDnLcc1kM1Vxz+
 ma2FUf0Nn6jga+b3Jr6v8Jw0z9JLIJFCjU5dex7gP1+xG4WrEJb2K8ZkPGTKarCVKMEq
 928fsSwlHio6XGBCtu8zSV9k/W7e+lYeZKi3z0j5TrE2dE2dNYZoo6tOllJf2qbOu+Ft
 KSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CxnFfi1OVtcvBCqSwcv0ZRctexZ9zrixK0G0Fd+YL9M=;
 b=FrgaoVZhGAVNG8DJ3FtpjnYZev7nmSKmUvVFJSBNpzqRa6Akk+CTy84Q+nV4pSvUWA
 S5zvdF3gPr1aobRYniDcBG75iLWC5MZlENG5IRgaU+J8aNHFvdkQFMqFFByQXTL8rSbD
 AUkY+FeGkfYbY/d6aS+EyD64LDb6k2UC04ztBdprA3XBnnz8GjkjB5S5DRfVHKlyGyzU
 mXVJ2Q3BAxxTvkQld4ifPOuSC7PYuYBgbAEdDtxd//XNwo36ZHiATaU/svny5oUmB7Ec
 wUsC/XxAP1CTkKGfIeUkrBaYHzRolYF+VkoDALpuhxCzgBzF0Tj9AGmSQgMYgsvWIjV+
 c51w==
X-Gm-Message-State: APjAAAXt7ozuKwVJblDJTvnWv4NBSJLSWtZWXVHvpnrB2zPdIl6f0PKl
 hQeFXnDgEj+x5JUnk7d0AhoGbw==
X-Google-Smtp-Source: APXvYqwDf89NqtAzeKmdxMJBFd8Gev2DtVh0Oryoa24PJycUxhDvWQcSvp/ck/kZ74zux/rtOiZz+A==
X-Received: by 2002:a62:b418:: with SMTP id h24mr4455754pfn.192.1579887131841; 
 Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id d2sm7245833pjv.18.2020.01.24.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 09:32:11 -0800 (PST)
Date: Fri, 24 Jan 2020 09:32:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [v3] arm64: dts: sc7180: add display dt nodes
Message-ID: <20200124173208.GZ1511@yoga>
References: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579867572-17188-1-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 24 Jan 04:06 PST 2020, Harigovindan P wrote:

> Add display, DSI hardware DT nodes for sc7180.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Thanks for respinning this Harigovindan, just a few more small things
below.

Are the drivers ready for me to merge this?

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
[..]
> +&pm6150l_gpio {
> +	disp_pins {

You can omit this subnode level, i.e. just put disp_pins_default
directly in &pm6150l_gpio.

> +		disp_pins_default: disp_pins_default{
> +			pins = "gpio3";
> +			function = "func1";
> +			qcom,drive-strength = <2>;
> +			power-source = <0>;
> +			bias-disable;
> +			output-low;
> +		};
> +	};
> +};
> +
>  &qspi_clk {
>  	pinconf {
>  		pins = "gpio63";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3bc3f64..3ebc45b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1184,6 +1184,130 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		mdss: display_subsystem@ae00000 {

Whenever possible, use - and not _ in node names.

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
