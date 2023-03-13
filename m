Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79D6B7A78
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721CB10E05D;
	Mon, 13 Mar 2023 14:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176D610E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:36:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CADC61306
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1074C4339C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678718181;
 bh=yHmE3CK4PUjMZSs461uAsslkr23vQXpACGQ1NBY42hs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B8iz5g5WCveFOEXQqlPaoTjL1SmG08N4own9rMBVqtwLNVbyMloglGRtWK/nm/IY8
 aVuyS0lwoAVQKESQPaakANgwDTdb3ulyqUKJyJSZEuAaGFh7DDncsF9gT1C1ozpWXJ
 m9bYZhE4Naj6XYCJY2dHCR1uofheFiPM9IXwDzqTt5RV3ujuGi0X1+SY+P6upkY98i
 79f6AzFhfoS/5ssuhr50H94mDSE9dMhrGZMgzvgfOgGZYBRg3SoujSFOYc9lp6H3TL
 IS0dbq92Auy8Wbo+Fjg8kBS9RTYIfr+X9cEMalEMismk25YEChlIOUw580WkQ/P0Gr
 dR8XNtzJ9hu6A==
Received: by mail-lj1-f171.google.com with SMTP id z42so12799647ljq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:36:21 -0700 (PDT)
X-Gm-Message-State: AO0yUKVU4OqWqEhiEh8kkiC0Sr3kU89FHGZDhwD9g+CarZgewWgC7r9Z
 B+YPRqdxqCcYxBrkcgVgXEA/syrTLhxPUB/8+g==
X-Google-Smtp-Source: AK7set/Dt6QdzPA2g5/CmVOJgocA2bwpvyNuirK/Gl06x9LG1R7kvogNrTf8a1qUunnCZkox9DzU0vUuHivXacBmt5M=
X-Received: by 2002:a2e:b55c:0:b0:295:d632:ba20 with SMTP id
 a28-20020a2eb55c000000b00295d632ba20mr10841792ljn.10.1678718179737; Mon, 13
 Mar 2023 07:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
In-Reply-To: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:36:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
Message-ID: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated
 fallback
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
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:20=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The item which have the mediatek,mt8192-disp-ccorr const compatible alrea=
dy
> exist above. Remove duplicated fallback.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback fo=
r mediatek,mt8186-disp-ccorr")
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
