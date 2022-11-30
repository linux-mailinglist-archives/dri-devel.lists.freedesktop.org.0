Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A763D1C1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5C10E43F;
	Wed, 30 Nov 2022 09:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193D310E43F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:23:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DB6D660036C;
 Wed, 30 Nov 2022 09:23:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669800234;
 bh=b/rlfin9Tu9Zg934405VE93p9gBOHlJBLcSBvPpyPXY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TU92YAgRkOWnyIP3bvJqgwHT2x7OsuuBfGtxWnADsoddRRL8dVNwSOLIIq9iXGClu
 ZDyOpAR+4FH4w9JKcC44yCrAf4ixqxqnVDX5y+K75zqEWqfKgMip80ugRc6dDiETe/
 9zWuM7Na3x2jr/eQrOfmVK2+5Thg9HnFJ3w8hjUdULKHkDeHnNCs4Az1H4oJ0WlWNV
 UqX5DNxYmvAdcMmXYji0csNn9FYeBB0kM0zF4/9R/meuF9UXgo41Z+kOdQciVMRs4q
 yRajDFgWP2KaE6U/ctk5oMmNuB6ojJs5YGZigiTQW8HaZtO0YFNUeeqAjuRxQ/FBV2
 DBUYJpgsDmQEg==
Message-ID: <a1c556de-a9a4-5f90-1c46-a9e54daf463b@collabora.com>
Date: Wed, 30 Nov 2022 10:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-3-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-3-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/22 15:34, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..3e7fb33201c5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -47,6 +47,10 @@ properties:
>             - const: mediatek,mt2701-mmsys
>             - const: syscon
>   
> +      - items:
> +          - const: mediatek,mt8188-vdosys0

The devicetree node will be like:
	something: something@somewhere {
		compatible = "mediatek,mt8188-vdosys0", "syscon";
		....
	};

....and will never get any additional compatible string, as when you'll add
vdosys1 support, we'll get a similar node like:

	something_else: something_else@somewhere_else {
		comaptible = "mediatek,mt8188-vdosys1", "syscon";
		....
	};

...so this should go upper in the enum that's listing all of the
mediatek,mtXXXX-mmsys compatibles, specifically after `mediatek,mt8186-mmsys`.

Please fix.

Regards,
Angelo

