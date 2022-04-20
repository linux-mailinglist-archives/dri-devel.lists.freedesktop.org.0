Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD8507F76
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 05:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCD810F0BC;
	Wed, 20 Apr 2022 03:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710AE10F0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 03:08:56 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e8523fcbso635266fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 20:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VpSTKYqkqFR3j3gpp3u9MmNz741BTZjDYJR17V6fB/A=;
 b=xJuAHaSlEn5vduy6+6UiMf+Ch+7wvMjCuqJK3wIuq1uxbWMpDmLpJCm/yY7P/ueEFT
 hLSAs/rpsGPsDzub6xJfh1F93XUcC4dodZQGWoot4zl5Nyhn/z3YZ/lPX3DVgheIUDh+
 SNJx5y9DK8U97Rkxb9LapzpDttKURUpWDxfiOatqUUzdvfLQVW8GvEPvhb1v7u9IEo+Y
 hlvRfs6bOqf2ssM3oMsJvSvF4bXc6dPkdndG3p6uW6o5rYmW8x7yMxCBe/Ell1wkWRBX
 Pc4X0dD1aUqGOawFzf1c5CR9MOaHz9CmtLyPsY1rCQhCrE3SIQa4DQv3Qgc8+6XBRPmQ
 6sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VpSTKYqkqFR3j3gpp3u9MmNz741BTZjDYJR17V6fB/A=;
 b=JnCJ9qWcbsJcrcKYvUUNIMeyMLFl6sgvaPW3ttAZ0m6nFmqC5HD5BsX2Ad1aJIRSr+
 Sfr6mREVXIa1wk/esUv3XQebkVrxMj26FGCUxRA17zWEwRm99hjG0GOunh3vrQuqatZ7
 Q55+DMxzOCwk6SOEVU8NrboXMs582YEn2MnEof8jrCYIxqlsWSdZNGz9RFpVMh89lGqN
 6h/eN6gM4v4su6P5XrYERJkuv3r8UxkJODM3lGDk3ZcGpgetM0ubZQCdwKDRSLQqvOEK
 nZ3dn24PkZlRBFKZKXN8ffVyhC4OvBEMuCbislvVws6yJtKzp5toxHHF5lG+/2T80Zrf
 Ifxw==
X-Gm-Message-State: AOAM532MeirJj/H2Nvk0d0GF3hYw5e6WGN8rmJE/iTX57+Aml/o0Kce5
 i3ZYQK0qAMt2Hab+nFgGqXK/mg==
X-Google-Smtp-Source: ABdhPJwuE3e8JdHNSkztSiMB3bw3lhXHpJVcsaIYnlal5WfMSUFBo5oORhTrVxVy1YSdDqi1luoqDw==
X-Received: by 2002:a05:6870:34e:b0:d7:17d7:bb94 with SMTP id
 n14-20020a056870034e00b000d717d7bb94mr758617oaf.52.1650424135693; 
 Tue, 19 Apr 2022 20:08:55 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 pv14-20020a0568709d8e00b000e2c2f0dbbesm5647519oab.54.2022.04.19.20.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 20:08:54 -0700 (PDT)
Date: Tue, 19 Apr 2022 20:10:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Message-ID: <Yl95w2xG73z6uFlT@ripper>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-10-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-10-sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, jani.nikula@intel.com, markyacoub@chromium.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, rodrigo.vivi@intel.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 11 Apr 13:47 PDT 2022, Sean Paul wrote:

> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.

Can you please mention why this is only done for trogdor and not sc7180
as a whole?

> Now that these are supported, change the compatible string to
> "dp-hdcp".
> 

I don't see this change in the patch.

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> 
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 6 +++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 732e1181af48..c3559253aefc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -815,6 +815,14 @@ &mdss_dp {
>  	data-lanes = <0 1>;
>  	vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
>  	vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
> +
> +	reg = <0 0x0ae90000 0 0x200>,
> +	      <0 0x0ae90200 0 0x200>,
> +	      <0 0x0ae90400 0 0xc00>,
> +	      <0 0x0ae91000 0 0x400>,
> +	      <0 0x0ae91400 0 0x400>,
> +	      <0 0x0aed1000 0 0x175>,
> +	      <0 0x0aee1000 0 0x2c>;
>  };
>  
>  &pm6150_adc {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index e1c46b80f14a..3c3eef7a7d52 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3089,7 +3089,11 @@ mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7180-dp";
>  				status = "disabled";
>  
> -				reg = <0 0x0ae90000 0 0x1400>;
> +				reg = <0 0x0ae90000 0 0x200>,
> +				      <0 0x0ae90200 0 0x200>,
> +				      <0 0x0ae90400 0 0xc00>,
> +				      <0 0x0ae91000 0 0x400>,
> +				      <0 0x0ae91400 0 0x400>;

This hunk stands on its own, following the DT binding changes I did
earlier. Would you mind spinning it off so I can merge it separately?

Thanks,
Bjorn

>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <12>;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
