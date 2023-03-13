Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D26B7B68
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7767610E566;
	Mon, 13 Mar 2023 15:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0DE10E566
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:02:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9911B80E40
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801C0C4339E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678719775;
 bh=Z5znNWOfz9QcECdz2pyI19EXcS+etix/ZEegaGLxO/s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GCkXHXa5ZKHke+hYl06fprq1jgHis0zI9UkY8KvkihZZuZ4DXWeWgG2UTbzYVxO+W
 xT1j6Q8ppM7cyhKvrcyTroloVWP5NA59aTqYRNCnm8Mj9NTFlErGTvnNFrWNqdIIP2
 0dLlokWtQqibw71g9NL17rXpvdbKIbXt1NVyY1wRjP6JTmcK1Z4TElLv1SLXr/B4/Q
 gIm6YoLZg61Zs2Q/dvqrCHgzDMzOq06arwZ5IXs7ehh6cGbg7GJ3JmrAMkgsNu0PxT
 VvuQtNQ8v10zOXwOPL6Txnu5gnn6PtGMvT2OzW1voC/nWZWe15MoaWPC2mb0aIx4cW
 p7Wg2czcujlRw==
Received: by mail-lj1-f178.google.com with SMTP id t14so12937274ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 08:02:55 -0700 (PDT)
X-Gm-Message-State: AO0yUKXSxQANDtaBA2KhY8Vq6Q/c7Q4qIwLe6indHoF2BKyYFuHyDKjN
 DwzxiB07pFo/I/bMp2w+SPowhqzMaLgN2un4Zg==
X-Google-Smtp-Source: AK7set/VTut/UwHcfw9/fA57ZQYGQwJ2L0OKLYLC706tyPmz6YQz8WSLG1lrwLiVF9nQJyuV4z9wvKMs1GNUBnZGWW0=
X-Received: by 2002:a2e:aa1c:0:b0:295:95a8:c6a3 with SMTP id
 bf28-20020a2eaa1c000000b0029595a8c6a3mr10956538ljb.10.1678719773554; Mon, 13
 Mar 2023 08:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-1-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Mar 2023 23:02:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
Message-ID: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
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
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index d4d585485e7b..d47bc72f09c0 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yam=
l
> @@ -33,6 +33,7 @@ properties:
>                - mediatek,mt8186-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
>
>    reg:
>
> --
> b4 0.10.1
