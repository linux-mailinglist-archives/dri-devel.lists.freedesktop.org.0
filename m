Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A744B1A19
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 01:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33D610E995;
	Fri, 11 Feb 2022 00:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4410E994
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 00:08:42 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v6-20020a05683024a600b005ac1754342fso1276879ots.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 16:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fcC0SEpVltFRTxoXkp53F9HT6U0x1VaT4hIpMkDokFA=;
 b=ugzulgstXhccLImdFMnJdEshlBhA4kJzeZIOEEsVkSKwCmvbAEVmq9bssZqIMdw/7t
 bTWC6ml41kJn1oCAn6eBY97CZ0QuM5fnjIPwluI94Hx65W+4UaM6WIigKUTtyuNkxqQK
 g5nmVhkg0RZTXJXFPstX5Z4veqfI3PCJYQDOeLaac3BmdHdimTQbZNkGDx0+X+WtkTjo
 Ez5wHKFG+FgMekmSFNCcYi9uFr6rfJCiD+RY86Fh/qrPO3rFLBVU8M1TLPpJmH765buY
 UdBIZeLbWu4RdJo4dxTbFyRTQmlPIOiIIFZ71VobbhcBb8MJQ3JRsww/J/IDZLppRQ71
 c6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fcC0SEpVltFRTxoXkp53F9HT6U0x1VaT4hIpMkDokFA=;
 b=huZu+IEcxoiwEQtxeSc5ge4K2nD42Pj2GtB1Rp5CJgOn7JS+/9OsIqKoN1wYpERCXz
 /HzHJu9c579TpKDRrK3EOq1ifj4ta0P6lQJqTWXwSSOqp4Vg8KnGo/V3pWd1ktPrElRK
 HGCvBUUI2N8HyuUxuiHsk6dyWno9fPQfJAMvy3X+uZ8eWeW32qMDbw5xbAc3EsrrhMRQ
 //e64j2A4EuR/ppQo2GoVukWhvilpjXaMwUOtqh9hpGBZvCfJH9IidMxjkE/USUWQ4LG
 hS9GmFr+Ds5oyZXGCMFvCmqpCVeGoRb9Bx4vJBnZVFJOynJK8WAoXx7rsRx8H8E0CMUi
 Ehxw==
X-Gm-Message-State: AOAM532cN8nGg3CKM8p70w5uksK2liCLMEr0BuQjXemPKvqC1R+Yfkd1
 899usbc9y+dkunl+mjHQ6xTp0Q==
X-Google-Smtp-Source: ABdhPJzHWAm1wwa3ofVjl2ssMnyXrqm4FEc3LXrZHVFMkRd2t4i2qVF3LIT3WQAJ/lod7ClR9v4NOQ==
X-Received: by 2002:a05:6830:19f7:: with SMTP id
 t23mr2021359ott.256.1644538122230; 
 Thu, 10 Feb 2022 16:08:42 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id bg34sm9133324oob.14.2022.02.10.16.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:08:41 -0800 (PST)
Date: Thu, 10 Feb 2022 18:08:39 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sc7280: rename edp_out label to
 mdss_edp_out
Message-ID: <YgWpB6dwDP0XeLaj@builder.lan>
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-4-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644494255-6632-4-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 sam@ravnborg.org, krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 agross@kernel.org, seanpaul@chromium.org, thierry.reding@gmail.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 10 Feb 05:57 CST 2022, Sankeerth Billakanti wrote:

> Rename the edp_out label in the sc7280 platform to mdss_edp_out.

Next week, or in the next product, it might not be obvious why we did
this change. So please continue this sentence with something like "so
that the nodes are grouped together when sorted in the dts".

> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 10 +++++-----
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> index 6dba5ac..af40e14 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
> @@ -69,7 +69,7 @@
>  			port@0 {
>  				reg = <0>;
>  				edp_panel_in: endpoint {
> -					remote-endpoint = <&edp_out>;
> +					remote-endpoint = <&mdss_edp_out>;
>  				};
>  			};
>  		};
> @@ -129,10 +129,6 @@ ap_ts_pen_1v8: &i2c13 {
>  	};
>  };
>  
> -&edp_out {

You just added this node in patch 2 and now you change it immediately.
If you reorder the two patches the history will be cleaner.

Thanks,
Bjorn

> -	remote-endpoint = <&edp_panel_in>;
> -};
> -
>  &mdss {
>  	status = "okay";
>  };
> @@ -156,6 +152,10 @@ ap_ts_pen_1v8: &i2c13 {
>  	/delete-property/ pinctrl-0;
>  };
>  
> +&mdss_edp_out {
> +	remote-endpoint = <&edp_panel_in>;
> +};
> +
>  &mdss_edp_phy {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3572399..eca403a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3066,7 +3066,7 @@
>  
>  					port@1 {
>  						reg = <1>;
> -						edp_out: endpoint { };
> +						mdss_edp_out: endpoint { };
>  					};
>  				};
>  
> -- 
> 2.7.4
> 
