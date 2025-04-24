Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CBA9A38E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868110E74A;
	Thu, 24 Apr 2025 07:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fFwo/qrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA17010E74A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745479562;
 bh=L3sPTbyHOQBsE9r1lkpVZmPXCDuy0OrlWFtecvsFdxU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fFwo/qrPuvk7TruqJfD20DxBUmV9hj3nAQJhWySZiBK4aHo7shziI/PulmpJ+jzj8
 rb8YT/bZ/t3vxxI55sKFmXpFR+Kvd6hJg8Lz6s0epgHulQb++7c5eCFGDvSqgt1nW0
 Zr9gVVijGzt2uUqxPOTCsezOCEEm+wTvAhvcKioIjc+2VcHq03oYlSJtDnUKzvs3UQ
 XV6U92MuzQjbEavpJ/8HfTu5CGER/dq6hMv32Vs2/BUMhlTuDSX50po48HKb91gH11
 O6L6GP3XBLMmKgxztAhWlFuQ08ziFCRJG+XbZtUPyOzTT0WOgNvyh08ty4Tjbax2Oh
 wZcYDItkfASlg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C745117E065E;
 Thu, 24 Apr 2025 09:26:01 +0200 (CEST)
Message-ID: <32b3ebcd-a015-4866-9529-25abbe1c9f2d@collabora.com>
Date: Thu, 24 Apr 2025 09:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
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

Il 24/04/25 03:08, Jianeng Ceng ha scritto:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v11:
> - PATCH 1/2: Remove redundant items.
> - Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v10:
> - PATCH 1/2: Add enum for ponyta sku.
> - Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage in V9:
> - No change.
> 
> Changes in v8:
> - PATCH 1/2: Remove custom label.
> - Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/
> 
> Chage since V6:
> - No change.
> 
> Changes in v5:
> - PATCH 1/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> - No change.
> 
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..fa1646bc0bac 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -285,6 +285,13 @@ properties:
>             - const: google,steelix-sku393218
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Ponyta
> +        items:
> +          - enum:
> +              - google,ponyta-sku0
> +              - google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>         - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>           items:
>             - const: google,steelix-sku196609


