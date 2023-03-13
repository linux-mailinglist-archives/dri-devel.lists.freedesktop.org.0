Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E946B7BBA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1001D10E57C;
	Mon, 13 Mar 2023 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BFF10E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:17:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6403B6132A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BD6C433A0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678720673;
 bh=awclzWjo3ZjrHCTZJMdtn2p6ahLIZ4FFTLYy9k9B69A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S3wcXWOLOwilJsnCncZ78ULfc4hA1xwTN5IJ9hr7lL7NnE6DEKzchyTvZPJBrNjXA
 UtT7HhZUg05Bi5C/oBwQJsx02WiV5UOXIEaEu4VpxStdj7ASx2zLnGul905VqKEOa2
 wuaUlWd/H0VwiDoG9kYSh+kX9Y9ZiBt0Tu254KPE3EHXA0QJs8Hj8+9w11AURSOh1j
 pInAJsLVdXj1B72/xJVde1Z3rTEkamgYV12XCytUnt4DqZNye8FSCCcTxWTNSCB68D
 Lg5MIYJF75lsvE0WfDM5pJDiHyryB9anbjHgfc7kN4loB//RjLIZwhtfv63NT2j1ff
 fVFwEBWSi7jEQ==
Received: by mail-lf1-f42.google.com with SMTP id d36so16150188lfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:17:53 -0700 (PDT)
X-Gm-Message-State: AO0yUKUI2FjMNU9WvWtCAUNeO428aUVbbEO+z+Qy/hoPaqCNyi1u1qOa
 rk/pBKUbVM1tCE4RF3y+2bPhuCQG4ku94hRE2A==
X-Google-Smtp-Source: AK7set86mnj3FsQgbZ6mpvlfRcHIoiad+NxerOC3kDGXfs3UJQWEeEVwmPmVf5iLCvah5HaDTyfK7Hn2bZ3DkcHy+Fo=
X-Received: by 2002:ac2:54b9:0:b0:4d8:62e5:4f66 with SMTP id
 w25-20020ac254b9000000b004d862e54f66mr10714755lfk.7.1678720671801; Mon, 13
 Mar 2023 08:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-7-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-7-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:17:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
Message-ID: <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding
 for MT8365
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
Cc: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alexandre:

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Fabien Parent <fparent@baylibre.com>
>
> DPI for MT8365 is compatible with MT8192 but requires an additional
> clock. Modify the documentation to requires this clock only on MT8365 SoC=
s.

If MT8365 DPI has additional clock, why it is compatible with MT8192 DPI?
I think some part of MT8165 DPI works under the speed control by the
DPI clock and this is different with MT8192 DPI, how could these two
are compatible?

Regards,
Chun-Kuang.

>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 48 ++++++++++++++++=
++----
>  1 file changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 56511c4d4b9b..3f6cca81340c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -17,15 +17,20 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dpi
> +          - const: mediatek,mt8192-dpi
>
>    reg:
>      maxItems: 1
> @@ -34,16 +39,20 @@ properties:
>      maxItems: 1
>
>    clocks:
> +    minItems: 3
>      items:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: DPI Clock
>
>    clock-names:
> +    minItems: 3
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: dpi
>
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -72,6 +81,27 @@ required:
>
>  additionalProperties: false
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-dpi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +        clock-names:
> +          maxItems: 3
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> --
> b4 0.10.1
