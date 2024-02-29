Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C586C40F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDC510E293;
	Thu, 29 Feb 2024 08:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gacFkhRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2252010E293
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709196461;
 bh=5A1bXwY5sWGlMJX7d22/wAa19nNdvkcM+C+b89+RYZo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gacFkhRm+t8GFM5Unr3otzDdtzlpIOZ1t00Cot/CZXsDAWh1L+cghJgTdPv7Gty9y
 GQnKfr8Ebcor7ZeMCz2CWw1oSLF0VFvf+UQ1PBI99HMdupej3erNB4ZFu811sfW7xN
 cFvzr8OlrlRxgjqDC/Og1qvmtL7DFW9m8fB8HVPQndLTD/oktFTnPy568Y80pE/gH9
 tyiuDmipXR/oAEBq8XvVFgHhcehH0gJBo08kNzksCYO7bZv0HTKQemKdrE0uMJinPD
 n+B4UqY8eymDs9QKksCK3G8qFH6YIzxRPl46/OajmkKGT8PCEZ4SyN1uAbnzMYFrlt
 CwUujzEqRPJ7Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B54237810EF;
 Thu, 29 Feb 2024 08:47:39 +0000 (UTC)
Message-ID: <a717b209-ec31-4a43-a93c-47d65a464c80@collabora.com>
Date: Thu, 29 Feb 2024 09:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: gamma: Change MT8195
 to single enum group
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
 <20240229023522.15870-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229023522.15870-2-jason-jh.lin@mediatek.com>
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

Il 29/02/24 03:35, Jason-JH.Lin ha scritto:
> Since MT8195 gamma has multiple bank for 12 bits LUT and it is
> different from any other SoC LUT setting.
> 
> So we move MT8195 compatible from the one of items to the
> single enum group.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> index c6641acd75d6..3e6cb8f48bcc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
> @@ -24,6 +24,7 @@ properties:
>         - enum:
>             - mediatek,mt8173-disp-gamma
>             - mediatek,mt8183-disp-gamma
> +          - mediatek,mt8195-disp-gamma
>         - items:
>             - enum:
>                 - mediatek,mt6795-disp-gamma
> @@ -33,7 +34,6 @@ properties:
>                 - mediatek,mt8186-disp-gamma
>                 - mediatek,mt8188-disp-gamma
>                 - mediatek,mt8192-disp-gamma
> -              - mediatek,mt8195-disp-gamma

While I agree on allowing mt8195-disp-gamma to have its own separated compatible
as the IP is actually different from the one in MT8183, you can't do it like that,
or dtbs_check will fail validation for the mt8195 devicetree.

That one declares...

gamma0: gamma@1c006000 {
	compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";

...Please always run dtbs_check when performing bindings modifications.

Cheers,
Angelo

>             - const: mediatek,mt8183-disp-gamma
>   
>     reg:


