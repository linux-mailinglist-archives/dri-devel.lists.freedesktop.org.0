Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AF572D595
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF7F10E2DA;
	Tue, 13 Jun 2023 00:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F810E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:12:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20EF26303B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828B9C43444
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686615156;
 bh=fgQezU9Uhtd/cvT8fMXHuHFSkNX/SBX6F17ynk+Li7c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qpA4jI42/zyo7xTLzS4PdiFvs6Shs4bsvDP7FZ95DpUGkl5Mjs6Z7Qg28S75n5pS6
 RR6Me5RUfUoCZTeWuhzve2bSQiYsVRHO35Oim0DLaEalBT9u71eJ+fPNkYqcn4uBeM
 SE/Y+sgyd/s3KddBGvibVr9EPqrMspPYGWom/RzVYoQEauETXMjb6JWUu2rFVwdpg4
 XjssPWBFj+pFXbXSB11GOincfTGTzmma7Rb5hnii5wg0JtTyHZBdrGY+wZRiGpSchj
 FHTYgcWt7T0DGpx+svuZ+z9y1s+A8cef1LzLrzyC3cC4CMvW+RYRVep3SScEUodCym
 48ZVwvYB5SHWA==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so5035837e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:12:36 -0700 (PDT)
X-Gm-Message-State: AC+VfDwmd3M3fSHM4X+2l1moWPffXqZsjbzhI7NjL9QHW8CX50BbkJ7X
 2vksJ8C1/ixzi6UI0ruodu+MsGVsZNCS8e87pQ==
X-Google-Smtp-Source: ACHHUZ5DoNUKSvAIXqJyVR/dJqHjMXAJmhqi/nRReR8o6lChwcUCm3nF+VoA8dUPGUnBoXAPQ8cGXyQokNL17p9GqwE=
X-Received: by 2002:a2e:9012:0:b0:2af:30d8:527f with SMTP id
 h18-20020a2e9012000000b002af30d8527fmr3553372ljg.19.1686615154438; Mon, 12
 Jun 2023 17:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
 <02a588ca-680f-ab45-1005-768d5b5db252@gmail.com>
In-Reply-To: <02a588ca-680f-ab45-1005-768d5b5db252@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Jun 2023 08:12:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Heu3yzwbJgEpOwqabwpyTXMByFgcpoBojaM7MaRTUnQ@mail.gmail.com>
Message-ID: <CAAOTY_9Heu3yzwbJgEpOwqabwpyTXMByFgcpoBojaM7MaRTUnQ@mail.gmail.com>
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Matthias:

Matthias Brugger <matthias.bgg@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=88=
29=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi Chun-Kuang Hu,
>
> Can you help to merge the missing DT-binding patches in this series?

Apply display binding of this series to  mediatek-drm-next [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Thanks a lot,
> Matthias
>
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> > Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> > the same parameters as MT8183.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++-------=
-
> >   1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.yaml
> > index d976380801e3..803c00f26206 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y=
aml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.y=
aml
> > @@ -17,15 +17,20 @@ description: |
> >
> >   properties:
> >     compatible:
> > -    enum:
> > -      - mediatek,mt2701-dpi
> > -      - mediatek,mt7623-dpi
> > -      - mediatek,mt8173-dpi
> > -      - mediatek,mt8183-dpi
> > -      - mediatek,mt8186-dpi
> > -      - mediatek,mt8188-dp-intf
> > -      - mediatek,mt8192-dpi
> > -      - mediatek,mt8195-dp-intf
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt2701-dpi
> > +          - mediatek,mt7623-dpi
> > +          - mediatek,mt8173-dpi
> > +          - mediatek,mt8183-dpi
> > +          - mediatek,mt8186-dpi
> > +          - mediatek,mt8188-dp-intf
> > +          - mediatek,mt8192-dpi
> > +          - mediatek,mt8195-dp-intf
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt6795-dpi
> > +          - const: mediatek,mt8183-dpi
> >
> >     reg:
> >       maxItems: 1
