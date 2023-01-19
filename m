Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D0E673F01
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA27C10E9B8;
	Thu, 19 Jan 2023 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A110E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:38:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e3so2401348wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQl7qUGxsdoKFrCBv66aUl3ctKwMQI8qh2LAJ26Qshs=;
 b=XSLEULwtL1hfc0ehGCkOo/d8/WdNcR/Ld/stT0tCp64bOhVWhM2UelHbCVpKCI+Pke
 5ADmmJB+wxQEtBkGa0n9l4yHXw3+POItWwRLe/ctscm15xN3fIczmH5Xm/CWQ6r6Wm+Q
 tbLxMd+Xvwd75WTdxb6mKorM4fVKjA30BrjMPyCl0WM7410KQ6aP6RKAkzRr2n3V2O/Y
 /yOE2+G+Nh1Kc/jYSd3ZUhsuf1oFFTLQ/D/QrpLOIQO20Ig6a3ZqnPz3SmxP2ixaDPTU
 g+gq52AnXwnO7JcGGSLoxj+R4CBc1MOqJ1FWwltb7C0HlR17u4gFcwVNRo4wMDXe/uyf
 YQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQl7qUGxsdoKFrCBv66aUl3ctKwMQI8qh2LAJ26Qshs=;
 b=kudQFVEhvdMDXoC79R9oP3DJnk08/5iPx018BYayd+yVkNxgf+Eo4opGlqnzwsXcMI
 bcoVppzYycsipJ5q0n4/9vuskrOr6USQ+MO6+OeIHAM1zRAKAWhPSR3QP7RECdXFXWKE
 Q4Cag4AaNaxyx7uBIAPqezWf9djbb8BG8P/pthToj89Ow9KG2MtXt3SOmBmSz95k8yig
 jmF1a0NiHmj2b9SSebdooCNmo9SGxrcNS7GgBSChGX1J0o7FxM+wF1GCPwlGUB2k4e4w
 e1ArzqZTYH/FrG+WXMO8eBa8v2ZzOuVyYwrNxrWOpk+2XNsAVG2rsJbk1VAwVKsSoqKo
 Pn1Q==
X-Gm-Message-State: AFqh2kp3VCnZZnaZBAjhCsaTVxmDuDD5LvYjhLMAzsm4i6ve5p2gjs7m
 9urria3n564xgHkvUL//wrM=
X-Google-Smtp-Source: AMrXdXt8fakZIEKWCsTm2c2xaq1MMWkP19AbenzPjcXfucpcdAoh9oJ2/Tedi7D7HHxw+dMNzUWA6w==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id
 x2-20020a5d6b42000000b002bc7e6c7cd8mr10363922wrw.26.1674146303319; 
 Thu, 19 Jan 2023 08:38:23 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d64e2000000b002be063f6820sm14948613wri.81.2023.01.19.08.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 08:38:22 -0800 (PST)
Message-ID: <344b14cf-7b87-34ac-5588-58388399357c@gmail.com>
Date: Thu, 19 Jan 2023 17:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/9] arm64: dts: mediatek: mt8186: Add ADSP mailbox
 nodes
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
 <20230118091829.755-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-5-allen-kh.cheng@mediatek.com>
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
> Add ADSP mailbox node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index a8ff984f1192..a0b7dacc10cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -640,6 +640,20 @@
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>   		};
>   
> +		adsp_mailbox0: mailbox@10686000 {
> +			compatible = "mediatek,mt8186-adsp-mbox";
> +			#mbox-cells = <0>;
> +			reg = <0 0x10686100 0 0x1000>;
> +			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		adsp_mailbox1: mailbox@10687000 {
> +			compatible = "mediatek,mt8186-adsp-mbox";
> +			#mbox-cells = <0>;
> +			reg = <0 0x10687100 0 0x1000>;
> +			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
>   		nor_flash: spi@11000000 {
>   			compatible = "mediatek,mt8186-nor";
>   			reg = <0 0x11000000 0 0x1000>;
