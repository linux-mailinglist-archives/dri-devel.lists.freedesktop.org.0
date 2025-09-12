Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B0B544AD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F9E10E195;
	Fri, 12 Sep 2025 08:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gXgOQREs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F416510E195
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757664711;
 bh=kKySdmyq8BtUt3OFBv4W2sJ2yZXPWJes/wHl4ZaGpHY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gXgOQREsUXRRqGKV6nkUhci2scDj9KibBxcUTEBcSCvukuLFJ0SnJIO0zY9jxx17f
 9JC9Y2mhGAyJEAHf/fyhOhqk62NBip/2xsc3IyPiTM2IgXbpI9LwaOkbozp6krdeFa
 7u/HCIeQuUB0gAyWEUljz//29ustZ/2dk+2I8GhXbyTLyXn+/V2tqAjaQO37Lt5rA7
 CQ9q7XKNZkBXla4p8WeJpnBHWWWS0PR5sxQcE9sy5e1aO9NuhAyw9sspLzuNcIa3Ay
 2ljvb0hSPN5HKOtv6MT9ztRqeMFmmZXA8MjP45Qxbj0Z+Ccuvg3Oy93j92PeP9U55D
 WOoNQtoN3Ni/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BD3F817E1315;
 Fri, 12 Sep 2025 10:11:49 +0200 (CEST)
Message-ID: <4f428009-b585-4667-a308-fe733e39b6d1@collabora.com>
Date: Fri, 12 Sep 2025 10:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] dt-bindings: soc: mediatek: pwrap: Add
 power-domains property
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-12-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-12-ariel.dalessandro@collabora.com>
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

Il 11/09/25 17:10, Ariel D'Alessandro ha scritto:
> Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
> power-domains property, which is used in the MT8173 E1 evaluation board as
> it needs USB power domain.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index 4737e5f45d541..54c0cd64d3094 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -98,6 +98,9 @@ properties:
>         - const: pwrap
>         - const: pwrap-bridge
>   
> +  power-domains:
> +    maxItems: 1
> +
>     pmic:
>       type: object
>   
> @@ -126,6 +129,18 @@ allOf:
>           clock-names:
>             minItems: 4
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-pwrap
> +    then:
> +      properties:
> +        power-domains: true
> +    else:
> +      properties:
> +        power-domains: false
> +
>   additionalProperties: false
>   
>   examples:



