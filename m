Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8082B550D6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1DB10EC5B;
	Fri, 12 Sep 2025 14:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GAYsh41c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F72010EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:20:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45df09c7128so16337205e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757686813; x=1758291613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Zo6qWVc0jZZmv8jDaeRnPGtja64w2ge7orZf47CFJn8=;
 b=GAYsh41cptJYxF8HuPfQqRp9Nwt7rC44xKpKBgiAImjt9CfAU5OMJvm2WIWKnaqNFk
 KZM5/sMcZ87vYhFQ3bLlX1hQXUnkm1F1KGxKbXzKXUHodFbvevm1tFjnszkB9DXkUyYP
 rD7H1KmO4K+Ygp1iSadAjWIKicWYtWQPMt/KQLBChblrdG3TIx6B55iZUTmmN5VnOgRq
 VwAe0Gvp19ujLegrAJlJLS9kJ/RWN1BNeCfMTsMoQn0AE5tkkx/yx/T4UxnvC3CY8Q0r
 tZzzS0U9whEBhrI/K4sgRk1C+nTWYnPEdxAeUMkntvni36UCTw6erDApLahvs0aFDnLp
 MJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757686813; x=1758291613;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zo6qWVc0jZZmv8jDaeRnPGtja64w2ge7orZf47CFJn8=;
 b=FRN9z+FrRrTCpa2K04Ps4HRRgLxk8BpI4srTO0xWp2gD4e8bLGE90X6QV5PoUWiS0m
 mfbiuO3iPVSjdgFwl/g53AFKrAwn9G8OM6YK3OcJco6+kn3oZ/W/cfrFYJn46B2F0XT4
 KzEJEywPG+bXBgu57Z1gMqIIe6mmDhcS5vAjHnuokrv9pFFUwvazE4JMJv7IjwgsYj7K
 VWpEZELO5gbD5CWNwmPQQ+mnmZtDJExbLFW07wu9XRcZ68/7gVTMf+iKv4K8gI+2SfBo
 gcfTwAD1C/NfJtidwWEO67dK+kaBdW1UuRDdLg8ecI27Z3IJeNJ1xNhLy76p7RZxgHs+
 N6AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVypxmw5Iryb0Q2UIObWtY+Y6NPN1JpOQ1HmlIjOnfQ547qtV2SHmdxUrOYf1BB15qsYI7kSd7PtCw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdrvJj3KLBP61c1FkP0QP4muiuHJOGlFdf2wYEORjJfUXosP1f
 aP5KgJUkCJt27ZsepfmdpciJbyZye/lzMmd/BA3BNx6Dvdbje/uRCVb5
X-Gm-Gg: ASbGnctq5PM2ybp77PSB/0U05SshkZYcruLPq1uaSseNOZA9yMyqeghoIZGOrOjcurz
 Okax1Es34IIZSu3Y9RILaKNUTZcyVMKbUaxNeUep6Yj1CpVuaOa3MR0SQL7mSiJxS/GCl1pv15w
 hLHZAZdAFmfr58n5Uog/kA3N+IrkKKsb2vLLlktpnspiWv+FVY9r6l5fdec0mQ3G4Iq2SxY1D1B
 NGis8UGwthKmj6NV0nPziYiiZlusIEw1k0mAHsTsBntBl35wVLeAFbFZK9dYlPMMUNEl/z1AW7S
 oLJa0rujQ7v+kuIOl6MhSJCdxpnIuWwk6tlYmYtXyTay5Whgr09HAe/XPbko9MFEwrN6s1Z2cp5
 424PHl8lVygoraKgz4PXLsGOCjGm/LGc=
X-Google-Smtp-Source: AGHT+IEYiPOKWB+0nvhix6TOxrJpFoMyLdNoRjDPkAz1Qots2CwSj1hz+7mDLBhL/v2fign1H2JEQQ==
X-Received: by 2002:a05:600c:6610:b0:45d:cfa4:ce10 with SMTP id
 5b1f17b1804b1-45f2128d4c1mr29424165e9.10.1757686813242; 
 Fri, 12 Sep 2025 07:20:13 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0372b983sm63475385e9.9.2025.09.12.07.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 07:20:12 -0700 (PDT)
Message-ID: <bde30144-0c57-4d34-b6cd-2a53dc099bdf@gmail.com>
Date: Fri, 12 Sep 2025 16:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add
 pinctrl for mmc1/mmc2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-22-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-22-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> Add pinctrl nodes for the MicroSD slot on mmc1 and SDIO Controller
> on mmc2 and assign those to the respective controller nodes.
> This makes sure that all of the pins are muxed in the right state
> and with the right pullup/down(s) before trying to use the mmc
> controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 03cc48321a3f..fccb948cfa45 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -227,6 +227,8 @@ &mmc0 {
>   
>   &mmc1 {
>   	/* MicroSD card slot */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins_default>;
>   	vmmc-supply = <&mt6331_vmc_reg>;
>   	vqmmc-supply = <&mt6331_vmch_reg>;
>   	status = "okay";
> @@ -234,6 +236,8 @@ &mmc1 {
>   
>   &mmc2 {
>   	/* SDIO WiFi on MMC2 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc2_pins_default>;
>   	vmmc-supply = <&mt6331_vmc_reg>;
>   	vqmmc-supply = <&mt6331_vmch_reg>;
>   	status = "okay";
> @@ -311,6 +315,40 @@ pins-ds {
>   		};
>   	};
>   
> +	mmc1_pins_default: microsd-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO171__FUNC_MSDC1_DAT0>,
> +				 <PINMUX_GPIO172__FUNC_MSDC1_DAT1>,
> +				 <PINMUX_GPIO173__FUNC_MSDC1_DAT2>,
> +				 <PINMUX_GPIO174__FUNC_MSDC1_DAT3>,
> +				 <PINMUX_GPIO170__FUNC_MSDC1_CMD>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO175__FUNC_MSDC1_CLK>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +	};
> +
> +	mmc2_pins_default: sdio-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO100__FUNC_MSDC2_DAT0>,
> +				 <PINMUX_GPIO101__FUNC_MSDC2_DAT1>,
> +				 <PINMUX_GPIO102__FUNC_MSDC2_DAT2>,
> +				 <PINMUX_GPIO103__FUNC_MSDC2_DAT3>,
> +				 <PINMUX_GPIO105__FUNC_MSDC2_CMD>;
> +			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO104__FUNC_MSDC2_CLK>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +	};
> +
>   	nfc_pins: nfc-pins {
>   		pins-irq {
>   			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;

