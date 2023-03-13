Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98B6B7B52
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72A10E562;
	Mon, 13 Mar 2023 14:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA24210E562
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:59:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57A53B8111F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91510C433A7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719577;
 bh=aor2P1UgUGdPxdi86bjLDcwfFhylwJzACimW7kInbvY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ohdN82SqGXRPJX3cyxSWQf7frIUq0JfGIXjdIMSBt+ODshEooBncUrzBJMWUejGvQ
 TVqEgCw1SAcdZhShx4HKRmVC6L/jo1TumrNmv9IYzJ6uGQqseaqe+WDQkSiz1X6EAA
 /v2Uuj4zRaNcWKEeeQdjMhl7OasG/jyZN5TFKVR4cik9TUFUl2im4NPDP/nvqosyZ9
 OnKo0gCMIuvWcubKsDfYYfBa4CNZXMhXxEVIByMn1gEzK3ALcplzpXbjE6JbtKl2Ak
 5PhETfpa+eNm/MkD9yBHkR6T8DYaHd2I9LoPQzTIzri9QWBAOSnJEhPGQ4ysBPrxma
 8TkJR2PgPrcUA==
Received: by mail-lj1-f173.google.com with SMTP id t14so12924684ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:59:37 -0700 (PDT)
X-Gm-Message-State: AO0yUKVWIe5w33IjsnuX82vTvDQRUYNOOg11fTaIvBpEPfAZxThg+iAx
 0ba4oc2xaJ87+zn4jj/X1MEJ5xkgK9Y6le2ylg==
X-Google-Smtp-Source: AK7set9FaEtus4V62k/yFd+Xl5REF0wUiIoL+llixgQGs2HHbtV1FOqc3QoH58tm6Az3ceEjZOG27aSTKnhUcRUDXCY=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10851484ljn.10.1678719575627; Mon, 13
 Mar 2023 07:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-4-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-4-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:59:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9zsX1CF6xf3TRm6+ZWkMNuXijYC_ErOHdgUi=O2kVVzA@mail.gmail.com>
Message-ID: <CAAOTY_9zsX1CF6xf3TRm6+ZWkMNuXijYC_ErOHdgUi=O2kVVzA@mail.gmail.com>
Subject: Re: [PATCH 04/21] dt-bindings: display: mediatek: dither: add binding
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
> Display Dither for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,d=
ither.yaml
> index 8ad8187c02d1..a7706cd65675 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.=
yaml
> @@ -29,6 +29,7 @@ properties:
>                - mediatek,mt8186-disp-dither
>                - mediatek,mt8192-disp-dither
>                - mediatek,mt8195-disp-dither
> +              - mediatek,mt8365-disp-dither
>            - const: mediatek,mt8183-disp-dither
>
>    reg:
>
> --
> b4 0.10.1
