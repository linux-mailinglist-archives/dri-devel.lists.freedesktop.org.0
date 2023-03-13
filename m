Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D66B7B8E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FC10E568;
	Mon, 13 Mar 2023 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D83F10E568
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:09:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3461B81189
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168E9C433A1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678720164;
 bh=ABGxWlMLqbyavyMKxfAJ8Yv5/bIE4zdXAaxBqDMvysU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UOK8+pPJnG1oG72RthJEFWUXiwBteXj9z7goUmZjJyuoFCrla1DIG+1l38K+v+H2C
 ZLWLbIx+PyRlzubEWGyr9Ebmo8yjjbnNRL0RvToc+qH/zjQvesaeLam1r3juwHdYR6
 thokqpK3Sk9e43sXmeOi3zbKTNwz5CxQ4guel8dojAC+6PmvpihPTqSSSmrsu0Bu/+
 bhu7gsGexK949o6DN5v4cWzQZWE7mEndUFGWjgesPyhLS7GfpETnNBfQs1Ucv2tZft
 aYUaFPdHLdT8xWfI2Ex2YSTxIUbmt3BTjvonCoM+omnx87EyJSGKZUCIcDLrE8di4N
 xGNeS1cDCcv3w==
Received: by mail-lj1-f175.google.com with SMTP id z5so12947572ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:09:23 -0700 (PDT)
X-Gm-Message-State: AO0yUKXm6FWS9duvrMNzXdq+1zTPg9gfVrzy+PLMbyUPV7NbPWfrCUUr
 KOKCw1pbn1TUc/t75YUpYOXb6z8MvVUbbsnQnw==
X-Google-Smtp-Source: AK7set87aBjxPKP90yGcSHiuYgmixt1jWtk6mNAEmALcrl1Kxtk5Rvp1SIvV36Rvbv2XbdaMPVz/gU4SP9I5l+DwFNU=
X-Received: by 2002:a2e:aa1c:0:b0:298:7998:4e36 with SMTP id
 bf28-20020a2eaa1c000000b0029879984e36mr4244033ljb.10.1678720162162; Mon, 13
 Mar 2023 08:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-10-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-10-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:09:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oYGD4KwK8enhy4WGiyJ_aoAPm2yTVY4vZodkAkaVdDQ@mail.gmail.com>
Message-ID: <CAAOTY__oYGD4KwK8enhy4WGiyJ_aoAPm2yTVY4vZodkAkaVdDQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] dt-bindings: display: mediatek: rdma: add binding
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
> Display Data Path Read DMA for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdm=
a.yaml
> index 0882ae86e6c4..3bc914785976 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.ya=
ml
> @@ -40,6 +40,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-rdma
>                - mediatek,mt8192-disp-rdma
> +              - mediatek,mt8365-disp-rdma
>            - const: mediatek,mt8183-disp-rdma
>
>    reg:
>
> --
> b4 0.10.1
