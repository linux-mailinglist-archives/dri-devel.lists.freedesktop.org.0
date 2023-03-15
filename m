Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3816BAC19
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE810E975;
	Wed, 15 Mar 2023 09:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CC910E975
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:26:35 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id n125so4746428ybg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678872395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ah3hCHxRKLhXbUb0/zDpGbrf+oZe//U+DP3mMWw+T8c=;
 b=d5zFDRwPxETDMQPbed+EfhECDqFpfx8TgxdVjJLVO33pllTKXnCeZ6Hk9QAQn7Dw4+
 oWwetYLyd4CtHpCifM8AroVKcjrw/2ujfEkNx21G9ysAvCmRlxgPsHRPxWKrE2hdexcp
 2idemqhli6FqtgkUkuZRShsSSKCkHav0hjtzcnLS7vLs5njq0I3+r1M58wEZWZSRe/5w
 MCX69ZCeDYaPs4V+n656TCYSZm7Bait5OLJkSVV06dPD39msVSlk9Vj+T+JqXAaZEp+K
 GA8c9VFqG4DPd1462qMWj+Lsk0Zv64cNfsfFiHVdem5Z+73jTMqu/Y35+PZOiQVe4uUq
 AS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678872395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ah3hCHxRKLhXbUb0/zDpGbrf+oZe//U+DP3mMWw+T8c=;
 b=JkCh/C3ibs/ph+re1WbdAoZv/dm7tdGP+J+To6DLAqqo+Afp50Pr/b7v4WEN7zT6sm
 Dk2j+jDQO35ra5uacbJLiny+1zd/lyC8EUEoMZ5yQppSYCh6x9aOlhyoQrPokvv4aRxP
 v6p52XMhdneEhOaq7uaLBiu34VjLUNl6Ck3SAFxSekM4KCPMqZb6cx8qQ+z9Y34wzWJQ
 UL/sDVwFxPSPoyt0xbVhWBlJJF7LkgCGTViNqbFHY51giFto1gyqtxvSFrmiUrBpPTMs
 mJTMOGKy56gFQ9LhiZrrrd4tsrcefXgc1PnIyCBKsXBbx2eMRDHdZpGlp2N/qn8/uYmD
 7LeQ==
X-Gm-Message-State: AO0yUKXe0GCjds0YaCQuRmkjUFG91/TvWZObra4zWfMy0dKKXGSuQhZg
 d891mxhlcNsJMC+LsBihG0Y0Oxp5kvefNvGhLddmBQ==
X-Google-Smtp-Source: AK7set85Tksbs5R01RThGTgUkuOcBof0bxceE3ivDeTB4gA3qDm/+jVks8dAQC4UN3fTwJGP5ML+MUn6x7iNEe2KU4g=
X-Received: by 2002:a05:6902:10e:b0:98e:6280:74ca with SMTP id
 o14-20020a056902010e00b0098e628074camr23209983ybh.1.1678872394826; Wed, 15
 Mar 2023 02:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-7-45cbc68e188b@baylibre.com>
 <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
In-Reply-To: <CAAOTY_819JuuidLgTOm+Ps=WnueW0Quos+abEDjrx8q8GifGKA@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 10:26:23 +0100
Message-ID: <CAFGrd9qVhJb--COXJmGHuW6NxDnXZGdQnxbHGRvaA5Jqhx-yNg@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding
 for MT8365
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pwm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Le lun. 13 mars 2023 =C3=A0 16:17, Chun-Kuang Hu <chunkuang.hu@kernel.org> =
a =C3=A9crit :
>
> Hi, Alexandre:
>
> Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=
=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > DPI for MT8365 is compatible with MT8192 but requires an additional
> > clock. Modify the documentation to requires this clock only on MT8365 S=
oCs.
>
> If MT8365 DPI has additional clock, why it is compatible with MT8192 DPI?
> I think some part of MT8165 DPI works under the speed control by the
> DPI clock and this is different with MT8192 DPI, how could these two
> are compatible?

AFAII, The mtk_dpi driver manage the 4th clock as optional
dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
And all configuration variables for mt8192 are the same for mt8365.
These configuration clock variables (like cal_factor) aren't
correlated with the 4th clock.
The clock number doesn't impact the configuration variable because the
4th clock is simply retrieved from DTS, saved in the driver structure
and prepare/unprepare/enable/disable, like other clocks.

Regards,
Alex
