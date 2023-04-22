Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470396EB94A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207310E29E;
	Sat, 22 Apr 2023 13:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130C710E29E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 13:16:55 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so2813328e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682169414; x=1684761414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7jncnPx2grC6G7RQ2ee63CUWNqLMx/tnK4MbO+O2gC8=;
 b=WznNI5log6OLCbjQlAgJDM6uaGoe5+ZWNN90yr1TwLrATj5HxPWoXA0nJvRAECdubD
 eYt7BXA9lilWzB+oSXeCec55lmW/W57h4s3Fso8BB1x3oCCetwbfGNNKDMvW3j88LF8d
 lGvdx44Oz4IsNBaNJrcu0adxD5m0vTQORqBq13Ng8B4YIJYGbVOYqQpBaw1KWOjNnqUp
 2P3DBAw91/qdvfmsDL8U8OVUY4qSwG5ZTlzyjCjMBLZddXbUI7f+ipOjOqTA24AJD7OP
 akcZNObRY7dzggSxnw06sJz1fjVr+occq0Q8apN6DZmKb0pIBbdMrw8lyARHGId0lCXW
 ou6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682169414; x=1684761414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7jncnPx2grC6G7RQ2ee63CUWNqLMx/tnK4MbO+O2gC8=;
 b=D9m50UIOX4dAr4jCHjCa72Xtae5GR0q41Icw636Hj8HUzH734FWB/V9Xt+9X1FtplN
 O6gZCHau4MpKIIHSCvq+ZHsL88lwSzVzSjT6GKKs7Fa44/1pwphc+qbnO3/epUjLitb9
 q8Ul9aDtWSnJSah50W0YG4N4gADfPjZBdKlI6d5Ag1FMzZmw6Xat+m60R+DJFi0fzRKQ
 m585p+Y+dlEUvatM3uIa2+ClDsVTdUVyXajBQrNhJfut/rka48eZv66eUB/QbKnfIamC
 9ucbfm8brk3TBVa0ZxE8UwapHpYsXY9ld2GjT1vGcsUHJ+cTPmh+pZLia6t8Q/8knJiO
 dcsQ==
X-Gm-Message-State: AAQBX9ee+Caisju62kX+hIgzapz1syVIHWFa7MyP+D1JMquas0MnJo/J
 GrL6uBdKYHxsAenHRXhIWd1njg==
X-Google-Smtp-Source: AKy350YnsIfKVhADdDt9MtMQHuIgPc/rStDXoyg0rQ3Pw7Ei3do+mb9dXvAAn9bNaoB5X+pr7sQSVQ==
X-Received: by 2002:ac2:52af:0:b0:4b4:8f01:f8b1 with SMTP id
 r15-20020ac252af000000b004b48f01f8b1mr1982021lfm.31.1682169413906; 
 Sat, 22 Apr 2023 06:16:53 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 y3-20020ac24e63000000b004eca2b8b6bdsm898504lfs.4.2023.04.22.06.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 06:16:53 -0700 (PDT)
Message-ID: <dac3b12e-8160-2566-5835-996d0b37a52a@linaro.org>
Date: Sat, 22 Apr 2023 15:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419154321.1993419-1-markyacoub@google.com>
 <20230419154321.1993419-10-markyacoub@google.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419154321.1993419-10-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, suraj.kandpal@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.04.2023 17:43, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> 
> ---
Looks like only patch 9 and 10 ever made it to linux-arm-msm and
only patch 9 ever made it to me, even though I'm R: in MAINTAINERS?

Please fix your cc scripts.

Konrad
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 423630c4d02c7..89d913fa6e3eb 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -822,6 +822,14 @@ &mdss_dp {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
> +
> +	reg = <0 0x0ae90000 0 0x200>,
> +	      <0 0x0ae90200 0 0x200>,
> +	      <0 0x0ae90400 0 0xc00>,
> +	      <0 0x0ae91000 0 0x400>,
> +	      <0 0x0ae91400 0 0x400>,
> +	      <0 0x0aed1000 0 0x174>,
> +	      <0 0x0aee1000 0 0x2c>;
>  };
>  
>  &mdss_dp_out {
