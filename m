Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4E6B7B5C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2831A10E039;
	Mon, 13 Mar 2023 15:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1D710E039
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:00:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68BC96132A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443E8C433AC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719652;
 bh=/mxq7bx0e9p7jd2Kj0W+O7Zc4664zzC5vmbERGlg66g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iFwjua8OGVggM4sfpQ9KgxLSLt4uBF1MOtTfLhvNRBTbNOMJCwXEoE7e7M91SfpES
 FSrLneeE9XgQisUwS9BO5PqmND8Cb8OmxiC2cjhQ4+IOdsuNSic0WJYb64Nsns4d+d
 NeJoAxRdplQnOTB0/h2pXDwTrc5rgNGu/SE6rMWTsAv6swP1E8IMWY0mNApQgZT9x7
 8sKmNbhAxRlJhu53RY5FxiaPsBsjBuRKvXLKH1vNZoeWmr09S4eCZCUVp7M3YwpfjD
 OTw2sTYjq0OO/LIioiMTrAxvteeFya8nJFSCmgf64FjyhD44XFfvNPQYjYfX9JdXgc
 AjT215WTKtCaA==
Received: by mail-lf1-f47.google.com with SMTP id n2so16044619lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:00:52 -0700 (PDT)
X-Gm-Message-State: AO0yUKU+C41KRlYrnWTDVcVrnsTIySr+nv66+58O0OP0n/vPWNfEBgZ+
 AFzTYLsUiEKIvl7IYcFzrwSSFYX6FcqcxX8piA==
X-Google-Smtp-Source: AK7set8zrrbbtS8sEEbPCUPfJ/BEkN2kiXEVCuZmMkm1nZIYMFYYfy8iRGqjSuNJSp0syMyV5E7eVcRe57T2GHwh+EE=
X-Received: by 2002:ac2:54b9:0:b0:4d8:62e5:4f66 with SMTP id
 w25-20020ac254b9000000b004d862e54f66mr10694845lfk.7.1678719650288; Mon, 13
 Mar 2023 08:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-5-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-5-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:00:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-FDv1uDy8CNRKT5qeecmc9UDTwSLaB1KtAeBzM_JXjqA@mail.gmail.com>
Message-ID: <CAAOTY_-FDv1uDy8CNRKT5qeecmc9UDTwSLaB1KtAeBzM_JXjqA@mail.gmail.com>
Subject: Re: [PATCH 05/21] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
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
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dsi.yaml       | 19 ++++++++++++-=
------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.=
yaml
> index 4707b60238b0..b6579d3effc5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> @@ -22,13 +22,18 @@ allOf:
>
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dsi
> -      - mediatek,mt7623-dsi
> -      - mediatek,mt8167-dsi
> -      - mediatek,mt8173-dsi
> -      - mediatek,mt8183-dsi
> -      - mediatek,mt8186-dsi
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dsi
> +          - mediatek,mt7623-dsi
> +          - mediatek,mt8167-dsi
> +          - mediatek,mt8173-dsi
> +          - mediatek,mt8183-dsi
> +          - mediatek,mt8186-dsi
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dsi
> +          - const: mediatek,mt8183-dsi
>
>    reg:
>      maxItems: 1
>
> --
> b4 0.10.1
