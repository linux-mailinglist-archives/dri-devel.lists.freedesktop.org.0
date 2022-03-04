Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41A4CD3F5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 13:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3AD10EF08;
	Fri,  4 Mar 2022 12:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5818310EF08
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 12:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 67F321F4666B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395462;
 bh=Q7gqF6Cr/GfghIpATxHp62aU28rhDa7RTV/PXqHXx1g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OH+AKTlb6ek3omIf2o2SuQ0A7kyXWy4tEYaLR6xn9umGY6Q0VpSPFzHzlq1u5jrFk
 W9YMMDOQidgnxTZPTG89TQpit2yZMMNCRsfsWkaymt+8df0JCJeVS6Go+LUVsy0C9v
 z9jqVJioKacNPGFpuYJ4nF3XfSEsGcKQerKX5VDhuJav08f/CPKvoMeE+B6KUZFGuD
 saPDTDtGH3F2BFBDktlJGrgpkYKPylzgTmxz1yEj1EQw+Agp/4GAfHqb5JBTI+scN/
 yhfic8sgTXbYfjFZ/WHPFYj4lgihbIvY+yg8midrgZlDIKGFK9wn049Q9tXRg6/1Ym
 q2wZztZzB9Udw==
Message-ID: <01950f1f-6f13-9dcc-a2fb-c9617c06d5d1@collabora.com>
Date: Fri, 4 Mar 2022 13:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2, 2/3] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 552a013786fe..cdacb2d0d11c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -17,6 +17,7 @@ properties:
>         - mediatek,mt2701-dsi
>         - mediatek,mt8173-dsi
>         - mediatek,mt8183-dsi
> +      - mediatek,mt8186-dsi
>   
>     reg:
>       maxItems: 1


