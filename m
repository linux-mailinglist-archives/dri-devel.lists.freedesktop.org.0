Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861C6D4145
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 11:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA53110E088;
	Mon,  3 Apr 2023 09:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562FD10E088
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 09:51:54 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w9so114905142edc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680515512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9nr+uA+ZP2tbdI/0kq6sL0Hql+LVt1wSnJCPSdLceG0=;
 b=Cht9Y2vM9TnL6su8oK8fsrE+NlCl07kvCeH1Ss3sQEfVIz+3oASpya8J2AUWrJpxgM
 SCco5IOUvSki5XMqFCC4gafwpE/N2km04ZRJsINqM4MoK61Z0KdpyV7ITRhLu65xJutg
 BktbY7DuUBSmVmAV1DiTyvagSErGI7E1jJkNyHch88mu8hG5+LmfWFS7W0wDU6iX8Xd7
 jjoiZ2Mz9fTYaT4UfPLDTG2x0ZfE6p3iZJzIkx9/oqavMrZ21qiPc7GkYID+SHdq81lL
 jm0UAAvOfhbRjfUD/kgK0iiBMMKWc2qEJw7CNQuj2S4JYsZ6z0aZ69ArQqmr274p3o54
 lcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680515512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9nr+uA+ZP2tbdI/0kq6sL0Hql+LVt1wSnJCPSdLceG0=;
 b=084JH4fFJNSGzucHnep3GKG3o4EA0/9se8stZrwJd18suzD4vJLYz8aI4iu4ovik6i
 BF706Hpoh7JF7GSuajLs5cfgKvNGhYAFbGLYm+0kBEkE7+Mn7Y7V4DR5MrZh7dgqddRn
 dp2UrALkRxrJgduCCoRerWJsDOdKwlkpzv3wHuiLFfi7aofloxdPyDb4uI2IMrfXGRVg
 OOvqOC5fwUGb7DXUi3ImLlAtrM4faG1FVc4ufECb4SUP3VRqYlpajWQZbTkpSegjOFiA
 aB66DnxTwmZe9Q46zxzhkZM5pr994ZcuW6AjbmIPgtLlHWDr4r1o/p0dn5GO4wrBD/lX
 R6aQ==
X-Gm-Message-State: AAQBX9cmraR8oO6NSsTiUcLyT4+ZGwRfOaCiv0U1Zs/cAiI7lA6NFYuQ
 PfAJfjsDQbezHemLpOJOI6PTOQ==
X-Google-Smtp-Source: AKy350Z7S5nIBg15xObBEMjnFcgoXpWwPfgC871POYyYAMKORNyzeGXP8WOT94M+1eeV1eh2TBj2wA==
X-Received: by 2002:aa7:c587:0:b0:502:9296:a456 with SMTP id
 g7-20020aa7c587000000b005029296a456mr6634276edq.4.1680515512470; 
 Mon, 03 Apr 2023 02:51:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a50c281000000b00502b0b0d75csm314317edf.46.2023.04.03.02.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 02:51:51 -0700 (PDT)
Message-ID: <6c9c74ee-b9ed-815f-dd92-37eb4c8f802a@linaro.org>
Date: Mon, 3 Apr 2023 11:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-3-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 09:19, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> mt8365 soc
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use regmap]
> [Julien Stephan: use GENMASK]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
>  MAINTAINERS                                   |   1 +
>  drivers/phy/mediatek/Kconfig                  |   8 +
>  drivers/phy/mediatek/Makefile                 |   2 +
>  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
>  6 files changed, 845 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> index c026e43f35fd..ad4ba1d93a68 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml

NAK, bindings are always separate patches. It also does not make any
sense - you just added it.

> @@ -33,9 +33,14 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    phy@10011800 {
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      phy@11c10000 {
>          compatible = "mediatek,mt8365-mipi-csi";
> -        reg = <0 0x10011800 0 0x60>;
> +        reg = <0 0x11c10000 0 0x4000>;
>          #phy-cells = <1>;
> +      };
>      };



k_mipi_dphy_of_match[] = {
> +	{.compatible = "mediatek,mt8365-mipi-csi"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> +
> +static struct platform_driver mipi_dphy_pdrv = {
> +	.probe = mtk_mipi_dphy_probe,
> +	.remove = mtk_mipi_dphy_remove,
> +	.driver	= {
> +		.name	= "mtk-mipi-csi",
> +		.of_match_table = of_match_ptr(mtk_mipi_dphy_of_match),

Drop of_match_ptr(). You should see W=1 warnings when compile testing.


Best regards,
Krzysztof

