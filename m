Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873046BB5C4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 15:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2A10E1E1;
	Wed, 15 Mar 2023 14:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2AA10E1E1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:17:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E37E5B81E3B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00D9C4339B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678889847;
 bh=CQun5NYvCzgck8mLcoHCcDks/YPrwVLykREvoC7nBKI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XJWjqUEkahmrvngFt9oyfNfcK+J2smZ7aM21uO/o+ojEQjxERR7bgSDu+m5Op9YpW
 NN2ALZolAGYGgCSxDzmSIGcMjp2YOMPSAr/LAvddBCtAFBM4utuK9P9Lu1EYR5pNtM
 4pKKHg43gq+2vs4C/p39gOAsAwzHharXQa76ru1K9aBMMfwrl+I3uQ2nE9oKtUm3QL
 JHpqRrlE1rjCWcgwgnTrnCI8vZIjTEcdovAAZXp0v/dswlba3bEcxe1d+qjAzz7kXh
 wJ1SCB6MwupEKZGO9r+yQmqxysPGV6POLcLMF9It+ojiQydZfDwSdhYGT3hM4dMieZ
 Y4/5Adbg3tk8g==
Received: by mail-lf1-f42.google.com with SMTP id o8so4534637lfo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:17:27 -0700 (PDT)
X-Gm-Message-State: AO0yUKU9jpJRVjWyMWDjQa/T2Bu0ZW9kN5HyxSfg8E/EDm3d/AsUib+H
 MOvIYpyx6M8Y3SWoIN2cNH7sWbCMKz6wxfwpjQ==
X-Google-Smtp-Source: AK7set8Vnq294J+j4qqKSVvr2jzh7ZWYNwCdOd39eacfnl/Ca01w31d255eKrfrDZr8PTwI+xUi8SrZq75uayJmH64s=
X-Received: by 2002:ac2:484f:0:b0:4dd:af74:fe17 with SMTP id
 15-20020ac2484f000000b004ddaf74fe17mr2074084lfy.7.1678889845688; Wed, 15 Mar
 2023 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-19-45cbc68e188b@baylibre.com>
 <CAAOTY_-wEzu6JavEAyRo8njOLRMq3i3wEcemNsuMaK00W9QqpQ@mail.gmail.com>
 <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
In-Reply-To: <CAFGrd9pa3c3eZcuGg7AmHL8kOAkyx96hwjwnMuO-G9BR1ORJ_w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 15 Mar 2023 22:17:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-TfXBpVbWw54yORqQ9Ubft-6PKofS2VznMi4-jfbA7Mg@mail.gmail.com>
Message-ID: <CAAOTY_-TfXBpVbWw54yORqQ9Ubft-6PKofS2VznMi4-jfbA7Mg@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
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
15=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Le lun. 13 mars 2023 =C3=A0 16:21, Chun-Kuang Hu <chunkuang.hu@kernel.org=
> a =C3=A9crit :
> >
> > >
> > > +       dpi->dpi_clk =3D devm_clk_get_optional(dev, "dpi");
> >
> > For MT8365, DPI clock is not optional, so make sure that MT8365 DPI
> > should have this clock.
>
> This should be check and notified at build time thanks to the
> device-tree binding. Do you prefer this?:
> #IF MT8365_SOC
>     dpi->dpi_clk =3D devm_clk_get(dev, "dpi");

Add one member in struct mtk_dpi_conf for dpi_clk. In
mtk_dpi_of_ids[], add one item for mt8365

{ .compatible =3D "mediatek,mt8365-dpi",
 .data =3D &mt8365_conf,
},

Regards,
Chun-Kuang.

>
> Regards,
> Alex
