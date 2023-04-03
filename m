Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CE6D3C1A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 05:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC2610E10A;
	Mon,  3 Apr 2023 03:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C9410E10A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:26:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0992461354
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49988C433EF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680492373;
 bh=hrX4wjuNXtUa4it9dS1gD+x/opOelCsgKzVa5rmkya8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lNZ2cNh5LZpMSXs0x/GvA01FLXnCCZrRUi8x0zt9XdLbswQFhwKt1GrMX6DdqCKrV
 +XIeXxupFEE3HyaVh2Uv9dqBn2fEooSbgytsHRqpxQ557IYsvYpAc1vqR8whoL6iDY
 179fpo8Q1SlLLItRyriF6rwe+bFJ6BgokR/EvdNeDhMDCoLuunJ5CyTN8xdCDBjIpI
 fWyn4lUm9XJWSYwnn0eowVtdsr2Nm9CKQ7k+Mosa301wJSbOG3hNwEjAnZXkPfbyDy
 5YmtOs6xWfmvr5qr50umrnSvWNJ9LnmeowmgVHghW+7yKc55frTA+kLUhP3AJWty7i
 dXMuJIQC5TbVA==
Received: by mail-lf1-f45.google.com with SMTP id c9so25811448lfb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 20:26:13 -0700 (PDT)
X-Gm-Message-State: AAQBX9fM79NLeQqylep0pKrFzQp+j0i3TDb8tZOToRvLFEtJGyiHNdJn
 2ddjfIdVNRoLTIXl53FQlT8V2sHXPemk0G9u0A==
X-Google-Smtp-Source: AKy350YF5//fW3gKfi6NnVQPdCCMScWgB0PgA7jqaFFkilLrWcB2n9ijboh/wvLC2SKCsSxOdK5aX4P6/95BuMo1yus=
X-Received: by 2002:ac2:596a:0:b0:4e8:6261:58c2 with SMTP id
 h10-20020ac2596a000000b004e8626158c2mr9881249lfp.7.1680492371303; Sun, 02 Apr
 2023 20:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
 <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
 <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
In-Reply-To: <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 11:25:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-2eba2JYZdLPutCkLEWgEgOBrXQ4pqpasxu=d1QMWvUg@mail.gmail.com>
Message-ID: <CAAOTY_-2eba2JYZdLPutCkLEWgEgOBrXQ4pqpasxu=d1QMWvUg@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
To: Matthias Brugger <matthias.bgg@gmail.com>
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
 Xinlei Lee <xinlei.lee@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
31=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:55=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Chun-Kuang Hu,
>
> On 13/03/2023 16:02, Chun-Kuang Hu wrote:
> > Hi, Alexandre:
> >
> > Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >>
> >> Display Adaptive Ambient Light for MT8365 is compatible with another S=
oC.
> >> Then, add MT8365 binding along with MT8183 SoC.
> >
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >
>
> I'm a bit puzzled that you give your reviewed by while I would have expec=
ted
> that you will take the display binding patches. Will you take these or do=
 you
> want someone else to take them?

I usually apply whole series together, and I've question about
"[07/21] dt-bindings: display: mediatek: dpi: add binding for MT8365"
in this series. This is just the first version, so maybe I would apply
partial patches in later version.

Regards,
Chun-Kuang.


>
> Regards,
> Matthias
>
> >>
> >> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> ---
> >>   Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml=
 | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,a=
al.yaml
> >> index d4d585485e7b..d47bc72f09c0 100644
> >> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> >> @@ -33,6 +33,7 @@ properties:
> >>                 - mediatek,mt8186-disp-aal
> >>                 - mediatek,mt8192-disp-aal
> >>                 - mediatek,mt8195-disp-aal
> >> +              - mediatek,mt8365-disp-aal
> >>             - const: mediatek,mt8183-disp-aal
> >>
> >>     reg:
> >>
> >> --
> >> b4 0.10.1
