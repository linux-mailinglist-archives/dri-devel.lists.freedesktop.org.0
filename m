Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9040673F07
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDC710E9B9;
	Thu, 19 Jan 2023 16:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C0910E9B9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:38:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1688250wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0slJfIkfgwvD8lh/pis0V9NYOil7tR0HxrPnP9BoIwE=;
 b=k7UWOs+6M5ArKaJgegqKue7r+QBDKtPkGskRueABG8LL7u2ULgM2BJbuPa/hTDQvp2
 iP2/iX8F/AWIHyJTY9MZXzDjHkx10jtMjJh2HWQpsIeXTbtP9gW6QoLfTxwlpkKeD4cj
 NOSOUHtnEfOM+4SDmygniyFPREWdH5V1aex+fGv5SFNXAsOd3LOnW/7owmMsH+ejtDDM
 zevyOvlOExntk2Bnljh6oAI91zf8YZlrPiqYScFwqx0NVOwLvx6v9qJ9fpu7OId6yetO
 5RFDcR0jXXpuqACDUBFNc2oCGRb7Y4wfqEQtWafeHR0lIQ2CPab11bQGrGFZCfqz9G8X
 Qdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0slJfIkfgwvD8lh/pis0V9NYOil7tR0HxrPnP9BoIwE=;
 b=n2euLKmp24dIzz2DWeJYL8oXo2cjK5UqskeILJUgJz4S9L8EkxRK159b9P7EI61ILt
 IeccSEWOpdwVxwQqrs+MIUIsqFhVw2BpgrItB+L/o7vpCewtpZClgk/CfRvRIhFyTZ7E
 vpiVJYA1WA5CX6PlBWdmF0MwLoXAWwIx+Tyven1hg3tR0hKbNczPW+6yfgzkiDP3w501
 U1ZoA6//pQBnfcLtymrAmcQaFAQ+2M8i5yPsFOK7YGlgYBLOtdfX+5JVxCyRy0vVNleI
 PxgWGZFThh/filRqFlgdRVX/JK/Mf1otP+9folbZlfIzg4dRqFlEHpDbre8PQMNAHmqt
 QqHw==
X-Gm-Message-State: AFqh2krPwXJJ7jpkvPs880ONN96syajW9ma2V6vVvk8/zDlbD0ljFKTt
 U87l56/3VC1Q0wirtVzrF6w=
X-Google-Smtp-Source: AMrXdXu+TekjvaDZa8mjuAEjOJ3qFNlqOjS/CUEL7bKLsuC9Tp0fbOD/XAXq15Gb8Rvn8ZYgbmuB1A==
X-Received: by 2002:a05:600c:4a27:b0:3da:fae5:7e2f with SMTP id
 c39-20020a05600c4a2700b003dafae57e2fmr11095256wmp.3.1674146322150; 
 Thu, 19 Jan 2023 08:38:42 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003d9e74dd9b2sm5051560wmp.9.2023.01.19.08.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:38:41 -0800 (PST)
Message-ID: <6289067c-1a4b-cc0d-9a9c-431f0cd639bf@gmail.com>
Date: Thu, 19 Jan 2023 17:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/9] arm64: dts: mediatek: mt8186: Add audio controller
 node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-7-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-7-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> Add audio controller node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 62 ++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 2700c830316f..c52f9be1e750 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -998,6 +998,68 @@
>   			};
>   		};
>   
> +		afe: audio-controller@11210000 {
> +			compatible = "mediatek,mt8186-sound";
> +			reg = <0 0x11210000 0 0x2000>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_AUDIO>,
> +				 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_BCLK>,
> +				 <&topckgen CLK_TOP_AUDIO>,
> +				 <&topckgen CLK_TOP_AUD_INTBUS>,
> +				 <&topckgen CLK_TOP_MAINPLL_D2_D4>,
> +				 <&topckgen CLK_TOP_AUD_1>,
> +				 <&apmixedsys CLK_APMIXED_APLL1>,
> +				 <&topckgen CLK_TOP_AUD_2>,
> +				 <&apmixedsys CLK_APMIXED_APLL2>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN1>,
> +				 <&topckgen CLK_TOP_APLL1_D8>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN2>,
> +				 <&topckgen CLK_TOP_APLL2_D8>,
> +				 <&topckgen CLK_TOP_APLL_I2S0_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S1_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S2_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S4_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL_TDMOUT_MCK_SEL>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
> +				 <&topckgen CLK_TOP_APLL12_CK_DIV_TDMOUT_M>,
> +				 <&topckgen CLK_TOP_AUDIO_H>,
> +				 <&clk26m>;
> +			clock-names = "aud_infra_clk",
> +				      "mtkaif_26m_clk",
> +				      "top_mux_audio",
> +				      "top_mux_audio_int",
> +				      "top_mainpll_d2_d4",
> +				      "top_mux_aud_1",
> +				      "top_apll1_ck",
> +				      "top_mux_aud_2",
> +				      "top_apll2_ck",
> +				      "top_mux_aud_eng1",
> +				      "top_apll1_d8",
> +				      "top_mux_aud_eng2",
> +				      "top_apll2_d8",
> +				      "top_i2s0_m_sel",
> +				      "top_i2s1_m_sel",
> +				      "top_i2s2_m_sel",
> +				      "top_i2s4_m_sel",
> +				      "top_tdm_m_sel",
> +				      "top_apll12_div0",
> +				      "top_apll12_div1",
> +				      "top_apll12_div2",
> +				      "top_apll12_div4",
> +				      "top_apll12_div_tdm",
> +				      "top_mux_audio_h",
> +				      "top_clk26m_clk";
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,apmixedsys = <&apmixedsys>;
> +			mediatek,infracfg = <&infracfg_ao>;
> +			mediatek,topckgen = <&topckgen>;
> +			resets = <&watchdog MT8186_TOPRGU_AUDIO_SW_RST>;
> +			reset-names = "audiosys";
> +			status = "disabled";
> +		};
> +
>   		mmc0: mmc@11230000 {
>   			compatible = "mediatek,mt8186-mmc",
>   				     "mediatek,mt8183-mmc";
