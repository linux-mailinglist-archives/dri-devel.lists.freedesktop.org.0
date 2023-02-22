Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B069EFB7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 08:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665D410E422;
	Wed, 22 Feb 2023 07:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249F210E422
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:58:32 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id x40so2320559uaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 23:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G9H0xjhxYBLZPbX8nqO91E9hjJ6R+Sm3uDvahoqNPyc=;
 b=DNemaIQH3jRofAK7MbaDUIqc7f3HRn0kIhuSzD7GLxols1+ghLJzjYiSaKSC5aT2oy
 hDKSvR0/2g6fHPRaHu+gFWFCf5vOucJ41X9kBOqAGlWfYzPaU1bMP9Z6tjgosQFsU1bm
 RkZHOBGvtI8b7FGMn2SLXWnLEhVYvSNNU76gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G9H0xjhxYBLZPbX8nqO91E9hjJ6R+Sm3uDvahoqNPyc=;
 b=E2f2cJ5Njc9MkBAa+DrVyMT3ANm8ZOK0h2vV9ulPMzTOWYdw8Z0dl2laEbirIQXXZ+
 ewG9xztV2os0nz/Y3GF0g7VoAuvB+AAWuN8AbKUt2bKj4M0f7vJJ33x/Hkm0UdIOKtQV
 17ZY9DIBo7LVuZvtAUbvgzqfDSU+ZoL4hfEARnbEqv2nT1ce9kEqBJeR4Ufz6UXtwpfP
 /K7zBFdwEytdta68HofOk4Kpw4X2P825FQqTVEU5raWR9FZSozLMyQmM7xp/8yEnn5gL
 KsKjHoXTndCxzk2qiP3JC4RAEv3N+ILcqANOd/BnmyasngfeTv+wZUQrgGBp4q49rGNu
 gOBA==
X-Gm-Message-State: AO0yUKUkX5FmZo1t4p+ezptYRdBDTen7Ym5OwglTyUwOzh/k72cHLkzZ
 erVNrVGssbkYrYUjz6j63M3XFC3S446EO/Sj9G2wYQ==
X-Google-Smtp-Source: AK7set8o2S3rJyKNzdUr4xZ9nrsGuSmtC2Ccm3LZaoX+pcw8mPI/KNjgf7s21ruTldmlELA+TVaMg7TzGpythFAFdbc=
X-Received: by 2002:ab0:6ed3:0:b0:68b:716e:ed8a with SMTP id
 c19-20020ab06ed3000000b0068b716eed8amr2520250uav.0.1677052711248; Tue, 21 Feb
 2023 23:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 15:58:20 +0800
Message-ID: <CAGXv+5E17b=nT3tquBxA6KkN3XLqNcWHeioeMtDaR+8SQhk8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
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

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domain-names and power-domainsvariation from the `else` in

                                          ^ missing space

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> the current mediatek,mt8183-mali conditional.
>
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 02699d389be1..ac174c17e25f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -145,6 +145,18 @@ allOf:
>          - power-domains
>          - resets
>          - reset-names
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - mediatek,mt8183-mali
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        power-domain-names: false
>    - if:
>        properties:
>          compatible:
> @@ -166,9 +178,6 @@ allOf:
>          - power-domain-names
>      else:
>        properties:
> -        power-domains:
> -          maxItems: 1
> -        power-domain-names: false
>          sram-supply: false
>    - if:
>        properties:
> --
> 2.39.2
>
