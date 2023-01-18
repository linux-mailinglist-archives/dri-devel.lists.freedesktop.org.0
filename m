Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5D671C4F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5040110E72F;
	Wed, 18 Jan 2023 12:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C9010E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 12:40:52 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D6E4B6602DFF;
 Wed, 18 Jan 2023 12:40:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674045651;
 bh=d1VJaoCiBYN9H4WMqdtd45SqyAGkM54Qn323yEvTnfo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bSCQNxvwq+RnF5fjdoYlS+3/XzYavSvIw+jkPUHqNToe2FCgqXlX+T2ZY2wnVpmb6
 0FGsQUDRJbctYXqWSsshfl6ZXR/WpSn6yVDIq4yUwLnC0G/tXdnHnj7UA18/NQ2LBQ
 0jlG11pESs19ATpy/y9qNX/tnjgcSisnSwVnOH9jDjkgjDR49bHEVvhPpRrKDopuBx
 mRloBrRvx6cZSVZzMz9RG9ivtEXJscQ5fdsNOgQyuoCyuRIJpkj+v9hdOfva6fxsMl
 0gKWq9MDrQ37vJ6FRFJrtJcwwxfViJIDV7VO5wkS6khHN6GAxOAd56LI5typyqmu8J
 LdHz+csEE+Q9Q==
Message-ID: <5fe09a71-7d86-ed55-fdd1-c5608a333f5a@collabora.com>
Date: Wed, 18 Jan 2023 13:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/9] arm64: dts: mediatek: mt8186: Add ADSP node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-6-allen-kh.cheng@mediatek.com>
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add ADSP node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index a0b7dacc10cd..2700c830316f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -640,6 +640,26 @@
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>   		};
>   
> +		adsp: adsp@10680000 {
> +			compatible = "mediatek,mt8186-dsp";
> +			reg = <0 0x10680000 0 0x2000>,
> +			      <0 0x10800000 0 0x100000>,
> +			      <0 0x1068b000 0 0x100>,
> +			      <0 0x1068f000 0 0x1000>;

reg = <0 0x10680000 0 0x2000>, <0 0x10800000 0 0x100000>,
       <0 0x1068b000 0 0x100>, <0 0x1068f000 0 0x1000>;

reaching 82 columns, which is fine.

Regards,
Angelo
