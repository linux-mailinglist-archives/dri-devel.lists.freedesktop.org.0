Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5864D7F85
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 11:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0505F10E298;
	Mon, 14 Mar 2022 10:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8437410E298
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 10:11:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D0BC1F43E0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647252665;
 bh=xaKt11+Jh3lRBkYJKVviC3jVdM9j4DlhR4zdg8VlwXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CfjiweefgYw0riOaABekr61feqDVxSYi+oqEIYBB/+WUtoLjla4juYb8vBNbz4xh1
 rwHifyROH2LELgaGXoq5xBuYjplngDPJpTQgAmHVJJ+jDPQlwHmyXAy1+Kn1qyWsIJ
 3fKo4c4oSTmeSJD/OfK8EZ8zcV/cf+/cM4/nESEBGdtvD4ECcCWvmelUfGvZU8l8SB
 Q8b7/1AQ6e+XzJCRjLGmX8In51/MDtTSIaCwCKQkRdB0Q2opLP2WjAflsaVO0IMqZP
 vHa8yNLECCkNtGdJ9gHYVfOBPEFzfMprhgPUC/75spgLGgivyBxPA1MdTQZAS2GRUn
 hw0/hq4q6MSeg==
Message-ID: <2ff86f11-a85f-b089-7338-558dcc0c8c6d@collabora.com>
Date: Mon, 14 Mar 2022 11:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V7 3/5] dt-bindings: display: mediatek: change to use enum
 for mutex
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220314090033.25773-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/03/22 10:00, Rex-BC Chen ha scritto:
> All single entry cases in mutex can be merged as a single enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> index 00e6a1041a9b..b470fbb1b40a 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
> @@ -23,21 +23,15 @@ description: |
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-mutex
> -      - items:
> -          - const: mediatek,mt2712-disp-mutex
> -      - items:
> -          - const: mediatek,mt8167-disp-mutex
> -      - items:
> -          - const: mediatek,mt8173-disp-mutex
> -      - items:
> -          - const: mediatek,mt8183-disp-mutex
> -      - items:
> -          - const: mediatek,mt8192-disp-mutex
> -      - items:
> -          - const: mediatek,mt8195-disp-mutex
> +    enum:
> +      - mediatek,mt2701-disp-mutex
> +      - mediatek,mt2712-disp-mutex
> +      - mediatek,mt8167-disp-mutex
> +      - mediatek,mt8173-disp-mutex
> +      - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8192-disp-mutex
> +      - mediatek,mt8195-disp-mutex
> +
>     reg:
>       maxItems: 1
>   
