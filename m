Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAD6A198F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1025610E812;
	Fri, 24 Feb 2023 10:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189F510E812
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:08:23 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id f31so20741906vsv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QLgAm+20NHdcq3TTMKIQSFC8qlmxumh/Xz94/sWg1sg=;
 b=TqCzL9tTwUn2D8BgnS/XinTdipALTG+K4pHG117dB2icMNDC9IdP54M4WXROap6tix
 ZYIoJjvpocY5eufWjfnHvTbh6ZI4sBOPFS3xT3Mg9n9Z8wuNkDv/dAsUp2HNF+yMZqjO
 WrJDRa9clAKnn56oMSnovkTkOQsgEr9s3AQzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLgAm+20NHdcq3TTMKIQSFC8qlmxumh/Xz94/sWg1sg=;
 b=rh2C9IlfCD2zKXiooiKBHiwEElE1Lvq7697f494AU9NsuAwdGKCC/SLJE27hOytrJ2
 A+Nj6lpSi5x3tYnyaE9eKRjBven8hXbYmbtTSoC+3nDgyAtULVlv+C/I6BhcFsxzw1vk
 /C2SbtzSZtFtyp/f9kbR0ec5xsY7y8AYjV/FLs4PSKVG4RsVdAGTYq34aV2XeHweHU6N
 2NPZT05YBhkOVhtpuqMIfnxAp1g/csE9ckxaRKUKwZrcoFU3Kn3daOOqjT+nAn2AMbs1
 E/Chgk6l6yLL6Tff/6bmW1OO97IjLgZEunoaE2cwYibPrtJIhGcvxa7s3No+zlplk8v5
 iKrQ==
X-Gm-Message-State: AO0yUKVnZeFE+pw7ujRyWIpJ0KgImHvKg8cmSTVz3lDwqJ8tq7p+pPUs
 zZwSjsIu8cnrfwuOh6i9DldyjLGCUXeGFVeZq6oFIA==
X-Google-Smtp-Source: AK7set9+CsoqKt5EF2uez7Y+7kBPrW2rCoZh1NWDNAuNiIsn/Yo/mXxmNcqE0NmxlOQD8opEMKzbfzkayObs+QwkzPg=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr4377179uaa.1.1677233302208; Fri, 24 Feb
 2023 02:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:11 +0800
Message-ID: <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 65fe139ceb83..4d9ab4702582 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -25,6 +25,11 @@ properties:
>                - rockchip,px30-mali
>                - rockchip,rk3568-mali
>            - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-mali

This could be squashed into "- const: mediatek,mt8195-mali" like the
following lines?

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +          - const: mediatek,mt8192-mali
> +          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>        - items:
>            - enum:
>                - mediatek,mt8192-mali
> --
> 2.39.2
>
