Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A340170F34B
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB7D10E5EC;
	Wed, 24 May 2023 09:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D5010E5EC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:45:38 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C396C6602B7B;
 Wed, 24 May 2023 10:45:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684921536;
 bh=NgFF9iqT6kPQvm3wY+PBo4aRBr+03YgdIiWeIRgjHvg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GSrile/9avxzPu7s2ZVGls7W4GSonWmKTja3br+cV7b+vsPa6KjfPvwMlUrbY61X9
 2VPgBLMrffDz9sLs3qX+S9qBd2Aj9Y31n3pMWvFBYQjM6bwW13iVYdaOzOm84dAIAS
 E6OmyJ2NOF2RzWqddsyPxQR5NM8oKf4+55Q+zydG6P3XAnLwErSCBLr8Z1Xcv6lobg
 MU65apKhhv4hAkYYw5p+lvr0hdVmcc0SJLW8ykiu3EsT2Fu/MsQee0F2hpeEPMlKD1
 SYqOZSabLBN4LbX8BVZ7ps4V9XhmjAyKHRkIvd4VlxSLUK3OYx6OSWa4RFKLVZDMlc
 5+ijNFud02dCA==
Message-ID: <2b5e0d60-7084-2039-e6aa-747517eb1977@collabora.com>
Date: Wed, 24 May 2023 11:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-2-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524083033.486490-2-jstephan@baylibre.com>
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
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/05/23 10:30, Julien Stephan ha scritto:
> Add definition for CDPHY phy type that can be configured in either D-PHY
> mode or C-PHY mode
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/dt-bindings/phy/phy.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 6b901b342348..a19d85dbbf16 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -23,5 +23,6 @@
>   #define PHY_TYPE_DPHY		10
>   #define PHY_TYPE_CPHY		11
>   #define PHY_TYPE_USXGMII	12
> +#define PHY_TYPE_CDPHY		13
>   
>   #endif /* _DT_BINDINGS_PHY */

