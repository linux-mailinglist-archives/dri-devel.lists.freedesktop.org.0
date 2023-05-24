Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0768170F349
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5410E5E7;
	Wed, 24 May 2023 09:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C739510E5E7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:45:34 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 82C6866021E6;
 Wed, 24 May 2023 10:45:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684921533;
 bh=gnyIrp2NNSRQPz2LUIGtdI9gWB+xhLZRVzKNi1Mfmz0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ajMypXEfpgCDo9i3QTk3N7jns/KFaeEfe6BICsgwzlRyG0F6rAVQQNWBoitvA5mfb
 Nlopld6omkSMKi/deYelf6NsxLHS8C09xTk4FdUOp9brM2ggV1WNvsH9shK1Q7Sht6
 A3xgFnmix9Dxa9MJPwCKG6iebdIZFOhqEWyU7nNTHEDlnPph/C9IY1ubPYMT11fpAZ
 yFeC5r8EFx6leNcUFFfft6DQ0ly8btochdeWAyrT28YBoSojyLjknLjB8+UaMyk3Ws
 kseGEU59hBJHN4jY1zYGtT+tEeZ7/0gCvgw+5uBmZLQn6wHgTE2qKu2yoPOTvvWhL3
 IK/LOvX4S5YrQ==
Message-ID: <f92c39c8-177a-e18d-c3b0-79e7349ea4db@collabora.com>
Date: Wed, 24 May 2023 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module
 v0.5
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-3-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524083033.486490-3-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, khilman@baylibre.com, mkorpershoek@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/05/23 10:30, Julien Stephan ha scritto:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
> some Mediatek soc, such as the mt8365
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
>   MAINTAINERS                                   |  6 ++
>   2 files changed, 73 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> new file mode 100644
> index 000000000000..a1bd96a98051
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2023 MediaTek, BayLibre
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface MIPI CSI CD-PHY
> +
> +maintainers:
> +  - Julien Stephan <jstephan@baylibre.com>
> +  - Andy Hsieh <andy.hsieh@mediatek.com>
> +
> +description:
> +  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
> +  receivers. The number of PHYs depends on the SoC model.
> +  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
> +  capable.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8365-csi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  mediatek,phy-type:

Instead of declaring a phy-type here like this, can't we instead declare that in
the phy cells, like we're doing with MTK TPHY and like other non-MediaTek PHYs are
already doing?

device {
	...
	phys = <&csi0_rx PHY_TYPE_CDPHY>;
	...
}

Regards,
Angelo


