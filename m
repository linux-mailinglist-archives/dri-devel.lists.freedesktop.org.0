Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3A6BE8D5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3256710EEE6;
	Fri, 17 Mar 2023 12:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675AB10EEE6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:08:43 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id j7so5341651ybg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679054922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjGy87pNKsb6y2cBmiWPHVqOZpmYwx0L2pBm6FPlioo=;
 b=7xIEFhptaAK8MOSW/KceXs42/aS/R0TPdFaNQBFbHxeQNT2G2qEOR4ut2cSERK9jRZ
 a31SiWJWCrHhbWBSFreq5X1iFizZEjZIcOJN+YYW1HNqxhVoxWc3Oq3GN9JU+fYgnddF
 qnfVMZqZAv4hbcZMsDyxVdUrqqBBGy70R3UjRhmOvH4+slSl21MUEjenmsaa5U61vRxF
 Zv2O4FMnSrfyIQa/juBUsKyNJolMwS3SKIThkxNHc4NYapqXToXNBT1I6nI6uo8OZ2zv
 ePcBmKUaLc8odWHqfX9mEGfcoYyPxySm3bow7Jz4wqAKGl/pzkvwNRednOiExEgaW0Yd
 Mmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjGy87pNKsb6y2cBmiWPHVqOZpmYwx0L2pBm6FPlioo=;
 b=pCVVXSsebfJ3Jra0kTCig+FOl5NRa4u3vvhhM7kMAiFa4+WA8sVYR3oxakz3Xz7L6/
 c27Xa43vRMuXK3/AThphebbUZde0rdlChHgUrsVNwxjwRuXg5EIG7KEXcu8lc6JTujvS
 ahFoazreZNeqIoTCFWzPXaiBPenR85gfxbqg6/cUZlZ1Ed9FUO7GMyLt2SKCaEUWc1Oj
 2JAumv9O9b3Hx4e/iBa+meZxvbarbHjKUdH29MIbFOdcjpzeq0heB8f6YIaz0jU18HGu
 sI/QTyd9Piobvl5d4dBbhLHDEv4WjL3mNKt0kLgKv1FsLH8P5ov6UCLCgL7tk1ppKDx6
 ySMg==
X-Gm-Message-State: AO0yUKXFX0sHgHOAapv/we8vCwXj3nWZB2b3BKfNDXgEK34l0YB0gnsB
 Xf3ubNjVKyi9WnpfNLaJcZVRoDET6vFG0+dJkpNCRA==
X-Google-Smtp-Source: AK7set/61F0QRhWRgg7+EjPAdnt8sqw4F2reO2/4CNJsbOeWAawezoBi8JybRiyvSSaD/Go45y0C6kZXjlKT4HS18yY=
X-Received: by 2002:a5b:bc7:0:b0:b3b:6452:6a0d with SMTP id
 c7-20020a5b0bc7000000b00b3b64526a0dmr10618375ybr.1.1679054922495; Fri, 17 Mar
 2023 05:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com>
 <008996c3-074c-b443-73f2-c14f0fdf8e4e@gmail.com>
In-Reply-To: <008996c3-074c-b443-73f2-c14f0fdf8e4e@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 17 Mar 2023 13:08:31 +0100
Message-ID: <CAFGrd9rAH4LmuZ915+sNbUcriOWU8hNXZWr94_BEjzey5YbBRw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Fix the duplicated
 fallback
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

This version is outdated.
Here the last one:
https://lore.kernel.org/all/20230306-ccorr-binding-fix-v5-0-6c56aaecc3b1@ba=
ylibre.com/

Regards,
Alex

Le ven. 17 mars 2023 =C3=A0 12:25, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
>
>
>
> On 06/03/2023 17:15, Alexandre Mergnat wrote:
> > The item which have the mediatek,mt8192-disp-ccorr const compatible alr=
eady
> > exist above. Remove duplicated fallback.
> >
> > Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback =
for mediatek,mt8186-disp-ccorr")
>
> We can argue if dt-binding patches should have a fixes tag at all. Given =
the
> fact that there are so many warnings still around, I don't see any value =
add to
> backport these to stable kernel.
>
> That said, this is defenitely no fix, as it's only a code clean-up. No wa=
rning,
> no bug, no functional error fixed here :)
>
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
> > Changes in v2:
> > - Fix commit title.
> > - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0=
-177d81d60c69@baylibre.com
> > ---
> >   Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yam=
l | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ccorr.yaml
> > index b04820c95b22..3aaf44719786 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr=
.yaml
> > @@ -29,9 +29,6 @@ properties:
> >             - enum:
> >                 - mediatek,mt8188-disp-ccorr
> >                 - mediatek,mt8195-disp-ccorr
> > -          - const: mediatek,mt8192-disp-ccorr
> > -      - items:
> > -          - enum:
> >                 - mediatek,mt8186-disp-ccorr
>
> Please sort compatibles, that will allow for easier reading once we add m=
ore to
> the file.
>
> Regards,
> Matthias
>
> >             - const: mediatek,mt8192-disp-ccorr
> >
> >
> > ---
> > base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> > change-id: 20230306-ccorr-binding-fix-718c6d725088
> >
> > Best regards,
