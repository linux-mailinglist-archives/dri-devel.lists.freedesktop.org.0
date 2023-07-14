Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7E754317
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 21:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608EE10E2DF;
	Fri, 14 Jul 2023 19:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3A510E2DF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 19:14:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-314172bb818so2297440f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689362098; x=1691954098;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y12WgpFka58+f6g+Nl0WMIlla4WR+fOUMvVj/dW10Y8=;
 b=qB0NRgmgdTpJof+h7iqbUX75cUEkrKlGAc9n7A3C1HHaj5tV6j3CcN1wD17p1TwpTP
 eg+WYMwZqQ2cm6mwXWZmiTUSddg2NnWuAH9UkQFliGvXVRlvfm8CbgrZzyLGFjQuoF2d
 CiQap4YpOViHaT5X0i9JA7d7MKxcN3TNQUmP02fXtCmv8wW2nDcfG7TceliSnxU5xZvN
 q/fdANHKJXHd6DQF83Kypena3xqmUfr8OZOnaOqmn4yverYr4DAw/cbFT6KIM36dMSH1
 3zVXArM87g7Y1tsytpHTt0giMxmZJZBiFuPqoHuX0NSl3G+CF2qQRmMfzQ3N5Rj7XQxw
 hCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689362098; x=1691954098;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y12WgpFka58+f6g+Nl0WMIlla4WR+fOUMvVj/dW10Y8=;
 b=W33MBpWQykAgEV2ciUWf9cit4MWZdYA42z3kEfzigyJQN4UNiY6+Oye4Nr8x3o6WsT
 PKiUvoiobEr/OwZciM7klzIoK9wU1/tHFnTJd840OjIc15fZnO0Wg0mHq/UO5/7XUYYc
 /w55JX2EzP/mMpnll8aUK1EUGPkCPngYqiH3hqx53GF21vC9mppR2+DNOpvVZjGLNz0I
 DCN1nHRrN1flFV09WGdnl/IXPxgCbJG/0zdDZwMZXNoZaU3EwCKDWmAlo01zg64AL4cH
 Pkbps6jun6+ItXDLlX4TR3U8FswK/LP+IGc1ilk/OKy1S8hOwvUs/oB4iVgtMPjv3WI2
 Hkyg==
X-Gm-Message-State: ABy/qLbFwRt1jpyxfHUTxcMhhIFZcyky7l+29Z96vA8PhHJlmhwv1Yvv
 uZtxYhl9K3na8qOdloUWgIC/sQ==
X-Google-Smtp-Source: APBJJlFsdTklPzao72K+369OsrAdnINLI412JcepClB5WQXDyqbaFXbRRGvqow3gnANHVJI7a8Qsrg==
X-Received: by 2002:adf:dd88:0:b0:313:e741:1caa with SMTP id
 x8-20020adfdd88000000b00313e7411caamr5441671wrl.25.1689362098005; 
 Fri, 14 Jul 2023 12:14:58 -0700 (PDT)
Received: from [192.168.2.199] (host-92-17-99-126.as13285.net. [92.17.99.126])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a5d6a4c000000b00314329f7d8asm11596586wrw.29.2023.07.14.12.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 12:14:57 -0700 (PDT)
Message-ID: <09470a60-6f46-ec0f-9747-f64c0ba81996@linaro.org>
Date: Fri, 14 Jul 2023 20:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash
 memory region as reserved
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
 <20230713165238.2814849-2-amit.pundir@linaro.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230713165238.2814849-2-amit.pundir@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/07/2023 17:52, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> v5: Re-sending with updated dt-bindings patch in mdss-common
>     schema.
> 
> v4: Re-sending this along with a new dt-bindings patch to
>     document memory-region property in qcom,sdm845-mdss
>     schema and keep dtbs_check happy.
> 
> v3: Point this reserved region to MDSS.
> 
> v2: Updated commit message.
> 
> There was some dicussion on v1 but it didn't go anywhere,
> https://lore.kernel.org/linux-kernel/20230124182857.1524912-1-amit.pundir@linaro.org/T/#u.
> The general consensus is that this memory should be freed and be
> made resuable but that (releasing this piece of memory) has been
> tried before and it is not trivial to return the reserved memory
> node to the system RAM pool in this case.
> 
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index d6b464cb61d6..f546f6f57c1e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -101,6 +101,14 @@ hdmi_con: endpoint {
>  		};
>  	};
>  
> +	reserved-memory {
> +		/* Cont splash region set up by the bootloader */
> +		cont_splash_mem: framebuffer@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +	};
> +
>  	lt9611_1v8: lt9611-vdd18-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "LT9611_1V8";
> @@ -506,6 +514,7 @@ &i2c14 {
>  };
>  
>  &mdss {
> +	memory-region = <&cont_splash_mem>;
>  	status = "okay";
>  };
>  

-- 
// Caleb (they/them)
