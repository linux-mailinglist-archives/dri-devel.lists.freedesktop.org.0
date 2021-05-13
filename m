Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66B37F03E
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B16E5A3;
	Thu, 13 May 2021 00:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB80D6E5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:07:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CB0C61406
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620864426;
 bh=v2Nqrzk8IMsTBDnwOsCTq2LatPsRSKHVbANck2rKQ8o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QITqSl9VhSZwPCtmR6nhxI1fDkmIBopcdtEI0C2u5AFCsqvKozQIeO1AfTOKvm73I
 JHxXVjs6V1Fkl+tgfvxkv9HRu1FPEq7ZK+MGeQGN4WIqDP/hWBwP+hI953RjlgO26r
 3ofNU3OLpGJNDSbemkAQsCStml7pzuMgN1bplo2yrzaXQydqd1pijrdwUEK0JtzEK1
 Qf9xiQT8Gt/ftUr39L7fWm/G31VcT2/zDKGDjxnd6MCWtBiW+HCjrHuzSaESKpbS2f
 QdP1Hhqo4bdqGPPFzE2Us/Ha/udH91kWHfNPUe+CBdlx3qH8II1PVmhSnF0Lej6muD
 5DKHY63tzl3Jg==
Received: by mail-ej1-f54.google.com with SMTP id c22so9386150ejd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 17:07:06 -0700 (PDT)
X-Gm-Message-State: AOAM531NMC/TtU6ssuiC/jQxXoi+lAqTVeQRRt5HwQqbimgIf6JlAB/8
 PKkw+KSTvBOhK4rgOalNBS67NQzIPI7iIb7n+Q==
X-Google-Smtp-Source: ABdhPJyfh9opbiHkboCndggh2+uLHJvaZkDGaqHLCtZT/4YagZu6vDBz+VrubRjLiXkTfTnqyKa2x9kZeO9mRpM4LKo=
X-Received: by 2002:a17:906:b755:: with SMTP id
 fx21mr941485ejb.267.1620864424849; 
 Wed, 12 May 2021 17:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 May 2021 08:06:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-amQXXF2Opi6vddosnx94TMPw5xDQy5peHpsrXSp0h4g@mail.gmail.com>
Message-ID: <CAAOTY_-amQXXF2Opi6vddosnx94TMPw5xDQy5peHpsrXSp0h4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] mediatek: hdmi: add MT8167 configuration
To: Neil Armstrong <narmstrong@baylibre.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Neil:

Neil Armstrong <narmstrong@baylibre.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=881=
9=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:33=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock=
,
> and is not validated and supported for HDMI modes out of HDMI CEA modes.

For this series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> To achieve this:
> - switch the mediatek HDMI bindings to YAML
> - add the MT8167 compatible
> - add a boolean to discard the non-CEA modes
> - add a value to specify mac TMDS supported clock
> - add a conf entry for the MT8167 compatible
>
> Changes since v4:
> - fixed bindings
>
> Neil Armstrong (5):
>   dt-bindings: display: mediatek,hdmi: Convert to use graph schema
>   dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
>   gpu/drm: mediatek: hdmi: add check for CEA modes only
>   gpu/drm: mediatek: hdmi: add optional limit on maximal HDMI mode clock
>   gpu/drm: mediatek: hdmi: add MT8167 configuration
>
>  .../display/mediatek/mediatek,cec.yaml        |  52 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  58 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 133 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  17 +++
>  5 files changed, 260 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,hdmi.yaml
>
> --
> 2.25.1
>
