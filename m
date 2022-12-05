Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF16642D7A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017A110E25B;
	Mon,  5 Dec 2022 16:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F7F10E25B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:47:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x6so14198156lji.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yfNcDnQIXBHvzHnGf+xJsMK1hqs+Kpeg/edf77EtziQ=;
 b=UIGQUtI/FGywg/wlQU+zKDxWrRAkK023sHkOnS7/ALTtpFIWWf19eQdLPoWuPIdKyq
 8J/cW6tgPj2s0u0bwV6IGCWpvypx6U38/vETtt9Fd19GYmMBip0+n4+YePyRdPdUel1E
 e8sBp1kt6Zhsl69Mf8pPEhDj8OV4ZLS0G01O4rehEr7c+CHFoxsFObn2RBf+Rcm3HaRz
 oobM2WUo0XNw+8LmuuTAQLP4VyGULFVDvoO/dX0ZTfC54TFkYdzUdZXgWQIlVdE21jO7
 ULXoF7vi5lA3qA/nF9vbgvb7UU5cwCrlgbJzKmsvyU7GK0PXazGKQ5dETXqvgHhAawC5
 9b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfNcDnQIXBHvzHnGf+xJsMK1hqs+Kpeg/edf77EtziQ=;
 b=aFl/88LjNzQXbMYgGLsxtTpTlYPka8YGvxWat9+9jeICcNG3G3Vd4mTxEeKIi/JjEX
 QoLq8X/ITId2J4J048hu/Vovn2L2dpEOop28Diudlf0RqlDfLa5w/7v0IhEHfV07K9fR
 I7FeFkTmerXh09THhiizxjsAPZl2S9f3bbQzuJqCwgMjyDsRrUN0EQVLdD5I8/gO36A6
 5rbAynBvvAHLCk4zr37AdN1dUc0SEEyCVh3BYQXHOOqOPwt1V1E8GNGMP/gAg6DWwYCt
 ljy0zYKtEex7OFN8WCSEWJF7XOvQ1nlboST9UY2dIvUg+GwtB6DbnETzHPTUJDkM2Mfm
 VtBg==
X-Gm-Message-State: ANoB5pmpHgQ+aX334NL0TTHmCepnhtY76Gy5Lhwwy1rVRi91PiaIjvLL
 J5jHwTgoigTdN4geV18Pdc+vQA==
X-Google-Smtp-Source: AA0mqf7iCfiosfAZqR500ANFZIqlekk62mqbnXBK8wPLMhjHsxiCQZZ6tfr5879JzOo6Wsi50/R4+Q==
X-Received: by 2002:a2e:bd81:0:b0:26f:9736:bd5f with SMTP id
 o1-20020a2ebd81000000b0026f9736bd5fmr25412078ljq.285.1670258865301; 
 Mon, 05 Dec 2022 08:47:45 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05651236c100b004b56bebdc4esm711999lfs.14.2022.12.05.08.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 08:47:44 -0800 (PST)
Message-ID: <ed8c6ca2-e4e1-52f5-0858-8c774819dd73@linaro.org>
Date: Mon, 5 Dec 2022 17:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-12-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205163754.221139-12-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2022 17:37, Robert Foss wrote:
> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
> 
> In order to toggle the board to enable the HDMI output,
> switch #7 & #8 on the rightmost multi-switch package have
> to be toggled to On.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +
>  &slpi {
>  	status = "okay";
>  	firmware-name = "qcom/sm8350/slpi.mbn";
> @@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
>  		drive-strength = <2>;
>  		output-low;
>  	};
> +
> +	lt9611_state: lt9611-state {
> +		lt9611_rst_pin {

No underscores in node names.

> +			pins = "gpio48";
> +			function = "normal";
> +
> +			output-high;
> +			input-disable;
> +		};
> +
> +		lt9611_irq_pin {

Ditto

> +			pins = "gpio50";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +	};
>  };

Best regards,
Krzysztof

