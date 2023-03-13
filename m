Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767586B7B12
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBE210E55F;
	Mon, 13 Mar 2023 14:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1910E55F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:52:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2C6C6132D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57754C433AF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719142;
 bh=U2MqS6kyxhQiLdwVlKalP2bSs4K0XighMTWsX41Gi/w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J3q5ehobb57atQWdCuphh5upCJ1h/1caTXcCliCoCmfhVKXa6ct2MB7NVZbRYxP9o
 02Xh/DBLUNAJ5v5qRr9Y+dZYjJtsML6vjFdde2XazSWmTke7pUtKC11MDwXOuaeaOd
 2DYvpYVOGMTVUvFetN9GwQ8CxBJT8cdcKFMKAjloW0d2BFU2gSyqFs0UjycYzg4UnW
 AgKrajr61788diT80RgcE7Vyxi1EbsVC5bMTWDTxiDOqTae9ScDf8iEWQTqS1wFYos
 YndgrcThBt6lA6lvM8kdypVifZJIO2mnXPX5px9frUTvz/ULDVLyqYlNphZRe3sXKl
 HxQexLUkZ/UyA==
Received: by mail-lf1-f41.google.com with SMTP id j11so16017286lfg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:52:22 -0700 (PDT)
X-Gm-Message-State: AO0yUKUXWz9Uan0Qtsuih8TR2SyAmMAXlbSS6GQttrUj0simWcT9xIOu
 P52D6esRD7+xwqddJbD6hV7vqlBWbQuK5oShrg==
X-Google-Smtp-Source: AK7set8X94msxVXedXhmMyx7ozcIXRIQjjj/hP3IIwwprdTSlUQCO0NlUMVovHxCkY5Sw2tXL186oPXe7fqueIj4uYE=
X-Received: by 2002:ac2:4c29:0:b0:4e8:4117:67c8 with SMTP id
 u9-20020ac24c29000000b004e8411767c8mr1600006lfq.7.1678719140352; Mon, 13 Mar
 2023 07:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@baylibre.com>
In-Reply-To: <20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:52:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_i7RCcmPKUvD5jjWL1hUB6=Xr3TxGSkZ2u9eP3gMynA@mail.gmail.com>
Message-ID: <CAAOTY_9_i7RCcmPKUvD5jjWL1hUB6=Xr3TxGSkZ2u9eP3gMynA@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: display: mediatek: clean unnecessary item
To: Alexandre Mergnat <amergnat@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:06=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The item which have the mediatek,mt8192-disp-ccorr as const compatible
> already exist above. Merge all compatibles which have the same fallback
> under the same item.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
>
> The fallback compatible has been duplicated in the 137272ef1b0f commit.
>
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> Changes in v5:
> - Add trailers.
> - Link to v4: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v4-0-1=
17daea88efb@baylibre.com
>
> Changes in v4:
> - Reword commit title and message.
> - Link to v3: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v3-0-7=
877613a35cb@baylibre.com
>
> Changes in v3:
> - Re-order compatible.
> - Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0-4=
822939a837d@baylibre.com
>
> Changes in v2:
> - Fix commit title.
> - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-1=
77d81d60c69@baylibre.com
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         | 5=
 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> index b04820c95b22..bda86e6857f5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.y=
aml
> @@ -27,13 +27,10 @@ properties:
>            - const: mediatek,mt8192-disp-ccorr
>        - items:
>            - enum:
> +              - mediatek,mt8186-disp-ccorr
>                - mediatek,mt8188-disp-ccorr
>                - mediatek,mt8195-disp-ccorr
>            - const: mediatek,mt8192-disp-ccorr
> -      - items:
> -          - enum:
> -              - mediatek,mt8186-disp-ccorr
> -          - const: mediatek,mt8192-disp-ccorr
>
>    reg:
>      maxItems: 1
>
> ---
> base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> change-id: 20230306-ccorr-binding-fix-718c6d725088
>
> Best regards,
> --
> Alexandre Mergnat <amergnat@baylibre.com>
