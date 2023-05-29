Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65938714B26
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF8910E0BB;
	Mon, 29 May 2023 13:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB29410E0BB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:55:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30959c0dfd6so3240233f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368499; x=1687960499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UxF01hOJFWwqeJ5mF+InyarZkjvnXX1icR3jLwM6pIw=;
 b=Bt0Aszg9Rqb5zOu1MN8HeJXrz6mEjVF+eCPfGBuXKTcwLER/vanVda1+RWQ03bASjl
 x07VUdprCygZ0Y0p38AO4EYof/LD/2Joa5jTCigjXwMxxh+tOZoZnUu9zhcdEE3G2/sO
 fas84MgaOBG+QFPwRz3QV/4hAgjXh6Vk9p2K9FSOZw4yRaT8ROD1tKp9kk+XndaYV0xS
 j8ipOOESrDlLQsFFQYt7NrkW7dlByEZKuhIQ/TjsstzmRV/KZQSDKQV5YEXpIxJbObVE
 +7hndZ6H1iTJY9CtuKRgoO4AaHp/nTkKvoehx0s54IiNZN8HtctFeCz5v8cx/xx6tAOJ
 fTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368499; x=1687960499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UxF01hOJFWwqeJ5mF+InyarZkjvnXX1icR3jLwM6pIw=;
 b=K48rw2+z01PnrbkW9kfAFQFvgLBG3WNwqg7jQhUZK62Kbk0GIVkFgtPDtBxYTRFh+6
 eRslWillJsz8crMEV99Yius8vIiJDiYJ1oUvo4XmT0MlQJj0M23VQgBSjsJJ4wrBXBmf
 hPk/MdS7wJ0JkEUxpsc+Fdc/K6ohlDgCQ4n5FJXQQpOQ/XbATPCw/jHSQ8ans/jLW4x/
 qs5cto+kU0nvqyY+q7rrIEPzQoW1HQpcBXQKyrTzTaFl2wryMPr6rUQtm9HkAgVKP2Eq
 EK5NtlN86CtgzukJWY0WwO1HBdLPZkFRVZfBFC7YqJtdWxQfcNIFj87RLuk0Ua1pW0Kv
 kolg==
X-Gm-Message-State: AC+VfDx/6Fo+h+maCqt5c7bo6m/VnL4YfowHOm2XTGLxSsxsxFyt9xAp
 5ublEm43OXsc5d6nf2U5WgE=
X-Google-Smtp-Source: ACHHUZ7m92JhOoSuT58IidM7J4/3EF7ZTdc7SnG4vzmODXGWQHCnYiTNtNtfeLeAW4fOuzUIVItl2g==
X-Received: by 2002:adf:d086:0:b0:30a:e7b6:52d6 with SMTP id
 y6-20020adfd086000000b0030ae7b652d6mr4346165wrh.52.1685368499381; 
 Mon, 29 May 2023 06:54:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff0c2000000b0030af20aaa3fsm26184wro.71.2023.05.29.06.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:54:58 -0700 (PDT)
Message-ID: <bdbc4e15-3cd9-ae93-fff7-6e323035c1d2@gmail.com>
Date: Mon, 29 May 2023 15:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/27] arm64: dts: mediatek: mt6795: Add support for the
 CMDQ/GCE mailbox
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-17-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-17-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> In preparation for adding multimedia blocks, add the CMDQ/GCE mailbox.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 090400d7fd61..99cc4918e6ba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/mediatek,mt6795-clk.h>
> +#include <dt-bindings/gce/mediatek,mt6795-gce.h>
>   #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
>   #include <dt-bindings/power/mt6795-power.h>
>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
> @@ -401,6 +402,15 @@ fhctl: clock-controller@10209f00 {
>   			status = "disabled";
>   		};
>   
> +		gce: mailbox@10212000 {
> +			compatible = "mediatek,mt6795-gce", "mediatek,mt8173-gce";
> +			reg = <0 0x10212000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +			#mbox-cells = <2>;
> +		};
> +
>   		gic: interrupt-controller@10221000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;
