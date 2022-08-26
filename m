Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FE5A294D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36BD10E927;
	Fri, 26 Aug 2022 14:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C33F10E927
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 14:25:13 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d8so2253144lfq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=06T9wTlCHBAEXY2GEb3qtwxCsT7B2RAGjEVPlOQCqks=;
 b=ZwE10iRG6CbbaA/6sykl/gq+h+IcnIMa5gJPDRkX0gHTE4GrnN6lsCgA/VqoB9fauZ
 EVxr4jMb3a+Jl9Q9Na57YjR0rlWC7QVjC7PncqtYGqV1ZeVkTuOTPQdmqezjHE4qh1hE
 aIy8iWkcPMJQBcnzQaoAFVj1WS0IrjBHinOo5jD0HnMIZA4TUMu1nCCtBNHqNIZKiMCT
 Cy+fwM/H00QTIFa2yIRv+zxStjTIYyDJ5lRLb9z7qGhaS6b5zE2uc0PUP18MLzKtgeTt
 pbGu88qICKMttQjFO1MXEX7nK740RIpeymtSzVUwJngqAgkhrYGFdBnh01LsMvq15vWD
 l4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=06T9wTlCHBAEXY2GEb3qtwxCsT7B2RAGjEVPlOQCqks=;
 b=xuIUgvcYLQZa8Yi2RTa7zUdNccZVgtiGbKMUF6VVobogyMBAWmnm+yE6je1nxTS93K
 rvQ0ViC86esHdJLw+qb0cGIIVWSKjOwFl5TYzPi527PcR+MFyFgUEQ7VRD78OokHWKNL
 Qsddbr0vNIcJyXVjQmhw2E/ee+gJ8iJZJC4TeW1pzIQhCcYPH5Bs3WeacQm8QiiMmvGr
 eJxQt+jXzikqlfOX7D0SIrL0+lHKaL9yZYL91Hqdss15qUuOJZ0iE0g3FBuiPcrPgqVm
 bfFAAtTDrpyZo7OT2sd+sck1tKBRyxV0wKSG9Qjefwq0eTEMbhI4tP/Jux/+zu0cQkQy
 4okQ==
X-Gm-Message-State: ACgBeo21FGqepsRP/GY7NrUSZbYQc404kVqG7WgXslEkx5WjhVPDucZ4
 o6EueJdtuRfcktBl9wK0goW2+w==
X-Google-Smtp-Source: AA6agR5dy+Gw8ohowBYNiJa6W/b7Gi3/F4l2mDhs2M3US0iGXtl48LOKo978070UI5a03H4IhoIFMQ==
X-Received: by 2002:a05:6512:1096:b0:492:ca89:a38d with SMTP id
 j22-20020a056512109600b00492ca89a38dmr2868202lfg.152.1661523911767; 
 Fri, 26 Aug 2022 07:25:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac246ee000000b0048ad80a6d07sm391894lfo.170.2022.08.26.07.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:25:11 -0700 (PDT)
Message-ID: <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
Date: Fri, 26 Aug 2022 17:25:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/07/2022 19:11, Dmitry Baryshkov wrote:
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock. While we are at it, also add the XO clock to
> the device node.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Bjorn, I'm picking the patches 1,2 into msm-next. Could you please pick 
this patch into your dts-for-6.1?

> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 25d6b26fab60..b72385ffecc6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
>   					    "hdmi_phy";
>   
>   				clocks = <&mmcc MDSS_AHB_CLK>,
> -					 <&gcc GCC_HDMI_CLKREF_CLK>;
> +					 <&gcc GCC_HDMI_CLKREF_CLK>,
> +					 <&xo_board>;
>   				clock-names = "iface",
> -					      "ref";
> +					      "ref",
> +					      "xo";
> +
> +				#clock-cells = <0>;
>   
>   				status = "disabled";
>   			};

-- 
With best wishes
Dmitry

