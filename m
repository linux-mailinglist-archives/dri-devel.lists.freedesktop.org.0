Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D56B7AAD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 15:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A510E552;
	Mon, 13 Mar 2023 14:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04E910E552
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:43:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A436B81012
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A2EC4339C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678718586;
 bh=rgCmLbjy/I6lPHkIRTEjEK67QV2uGbEfPOrfNv0km3E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XooPvkoQZNq+yZgUzeVpHw+g6yS256JCCota+rkalhXprbU+E1rwSh9QbpKt2FqSc
 5dBG4TIo1ebzN8CPDRkCYXblQWfWZ07gyWAQdShOGesWRJCNd7mR727Cf/vtnL1Aa/
 +J2+2M75U84rGhHASOoPiXnrr4rvSFrLP/ms6SaSjUmj97F70m4EVjU86r0wFIUBjG
 IpON3yeP7gXrKfcaZ+dzg5GP/A6CaCTrDa8qSKxyRUoXQl4cecsEltWSvIgmHXDwKB
 gxTnA03D9PkUYjZYmPsIEe2fBXB42dFenWtoUZb4TphfTsFxuFitvufcDRJGBm2j3n
 pQKT3v00tYlLg==
Received: by mail-lj1-f175.google.com with SMTP id z5so12855975ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:43:06 -0700 (PDT)
X-Gm-Message-State: AO0yUKUeHiKI6kNBYSmDaugNV+Wz9PhPxFbPT6JfjRRFkeRM9bVhHUV3
 CME69a2xaMsDG+wR/+ANWuUQSzUH/uqRJYBiKQ==
X-Google-Smtp-Source: AK7set+Pgt4VV7yf7ocGK4RBixaIbDvbY9bbI+DYJyzWV/HGNMEg3GuKKinvRhCgws4A/g645UWL8+33qGZwFE8ux4c=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr10832555ljn.10.1678718584447; Mon, 13
 Mar 2023 07:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v3-0-7877613a35cb@baylibre.com>
 <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
In-Reply-To: <CAAOTY__dkDOpyzRXWeevj_agPdZZ60-=-6Vt-HbBTKy8ai20Yg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 22:42:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY__YX_LUBpF3QPp6ps769BdyDS39z5fDtpUk6ZFFc=3vwg@mail.gmail.com>
Message-ID: <CAAOTY__YX_LUBpF3QPp6ps769BdyDS39z5fDtpUk6ZFFc=3vwg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: display: mediatek: Fix the duplicated
 fallback
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: devicetree@vger.kernel.org, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Alexandre:

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8813=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:36=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi, Alexandre:
>
> Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:20=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > The item which have the mediatek,mt8192-disp-ccorr const compatible alr=
eady
> > exist above. Remove duplicated fallback.
>
> Applied to mediatek-drm-next [1], thanks.

It seems that Krzysztof has some comment, so I remove this patch from
mediatek-drm-next [1].

Regards,
Chun-Kuang.

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t/log/?h=3Dmediatek-drm-next
>
> Regards,
> Chun-Kuang.
>
> >
> > Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback =
for mediatek,mt8186-disp-ccorr")
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> > Fix MTK color correction binding
> >
> > The fallback compatible has been duplicated in the 137272ef1b0f commit.
> >
> > To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > To: David Airlie <airlied@gmail.com>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Rob Herring <robh+dt@kernel.org>
> > To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > To: Matthias Brugger <matthias.bgg@gmail.com>
> > To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
> > To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-mediatek@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> > Changes in v3:
> > - Re-order compatible.
> > - Link to v2: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v2-0=
-4822939a837d@baylibre.com
> >
> > Changes in v2:
> > - Fix commit title.
> > - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0=
-177d81d60c69@baylibre.com
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml         |=
 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml
> > index b04820c95b22..bda86e6857f5 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > @@ -27,13 +27,10 @@ properties:
> >            - const: mediatek,mt8192-disp-ccorr
> >        - items:
> >            - enum:
> > +              - mediatek,mt8186-disp-ccorr
> >                - mediatek,mt8188-disp-ccorr
> >                - mediatek,mt8195-disp-ccorr
> >            - const: mediatek,mt8192-disp-ccorr
> > -      - items:
> > -          - enum:
> > -              - mediatek,mt8186-disp-ccorr
> > -          - const: mediatek,mt8192-disp-ccorr
> >
> >    reg:
> >      maxItems: 1
> >
> > ---
> > base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> > change-id: 20230306-ccorr-binding-fix-718c6d725088
> >
> > Best regards,
> > --
> > Alexandre Mergnat <amergnat@baylibre.com>
