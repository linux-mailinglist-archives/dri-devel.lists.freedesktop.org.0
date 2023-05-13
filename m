Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE38701458
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 06:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522A10E028;
	Sat, 13 May 2023 04:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B010E028
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 04:26:11 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaf2ede38fso103046375ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683951970; x=1686543970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7izujv/OASzpQI3cb0P6LLzhvUseZlQhTs3+10fnQcE=;
 b=gOuMfs9XFHS52bzXmCu1e4dPL5BIJG3/wmyuEAoeeRsGQ0tatDTiVfqABa2YYrRfP4
 tNfrwtipHYsBOmSzTccyyzzmceCCu9hwjnHMRnQsxB1T8Atjy7qJqZ3bQEIDsDD2woDr
 pPcnApN9xHpQj6JJNDYCACLMXXJtCLpACzPx+mN1JT1be7r8+u5DtJ0izZRnJzly1dio
 S7T5ctk43xh7N9MH7OA5RLFOwgGfqOdgaCcxlqobN8SfhXVX2ppDS48Dw2IMPIe1utys
 CMRZxQGQ1B/Jg7O6heCraWD9I9dlxvaToF9GvYy0NZ/2yUPT+0H4LdxfGuog4x7Ca/XX
 RmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683951970; x=1686543970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7izujv/OASzpQI3cb0P6LLzhvUseZlQhTs3+10fnQcE=;
 b=Snq+hFBuWxeikHMxtr8t2LWMSZ0JyUCUSv3ZaO3PKgscRrbtiP9WB/yUddC0gYbKtF
 2vO22jCRfpagY8EwOKrJhdV8AzzFu20Bwi+4DyXJrlRhkWGqsheUxldJoqHLcPxTxX17
 CO3TxnLzjufVIMfeumo+tMxKoXRk3v8xuXgK3AafT+2DXfTU03pUzpPKfTtRUbSmXCyB
 LnpdWywiOpHhSvBmZmWicnTo/l8yChkg+0kgJ5y5qgcnWmEB0pBtvdTP0lA3B7WdXbT0
 7Zc3KCRnQZvOVX/gFShgOsJEwSxT8O4BM7cMalCQPq5ZGwZvWgUf9NuO6rZGhC9QebHp
 FyyQ==
X-Gm-Message-State: AC+VfDyhARZ5Ab4EOZHyxxIP3QspC1VXsYRYyOErXCfWHfJI8NfR+ARd
 m42h9kWHVeyC9O19TItDME2rNVwmvjpEezCK83w=
X-Google-Smtp-Source: ACHHUZ6WD21cjxL0KoJtKQ6N/2J3QROhG3Ur+9wu2q0RLzdBfV86BB/taKgwnGg1JDWZQ2SjSW5mBzJx6p71kGs3KmM=
X-Received: by 2002:a17:902:bb8d:b0:1ad:e2b6:d29c with SMTP id
 m13-20020a170902bb8d00b001ade2b6d29cmr4465906pls.26.1683951970227; Fri, 12
 May 2023 21:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-6-aford173@gmail.com>
 <275064c0e6c814d8e8fda6bcf70d6e8c3bdc3011.camel@pengutronix.de>
 <CGME20230512200115eucas1p180198d430c17b044e34d66b7246d4a7b@eucas1p1.samsung.com>
 <CAHCN7xKq_hZXWZVMG0xFK_zGfm18ag48a83BtL5OyE6VJ3FMTA@mail.gmail.com>
 <7a83b8c1-88ff-0ae6-9c3b-d49fc08c7ac0@samsung.com>
In-Reply-To: <7a83b8c1-88ff-0ae6-9c3b-d49fc08c7ac0@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 12 May 2023 23:25:58 -0500
Message-ID: <CAHCN7xLZNvMx=U9=Fp=qrG9xaMhU1PS_nQO5FfC2S+XLO8YLXQ@mail.gmail.com>
Subject: Re: [PATCH V5 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 4:02=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 12.05.2023 22:00, Adam Ford wrote:
> > On Fri, May 12, 2023 at 2:37=E2=80=AFPM Lucas Stach <l.stach@pengutroni=
x.de> wrote:
> >> Am Samstag, dem 06.05.2023 um 14:24 -0500 schrieb Adam Ford:
> >>> The DPHY timings are currently hard coded. Since the input
> >>> clock can be variable, the phy timings need to be variable
> >>> too.  Add an additional variable to the driver data to enable
> >>> this feature to prevent breaking boards that don't support it.
> >>>
> >>> The phy_mipi_dphy_get_default_config function configures the
> >>> DPHY timings in pico-seconds, and a small macro converts those
> >>> timings into clock cycles based on the pixel clock rate.
> >>>
> >> This week I finally had some time to take a deeper look at this series
> >> and test it on some of my systems.
> > Thanks for testing this!
> >> This patch causes issues when the burst clock rate is fixed by
> >> supplying the DT entry. Instead of describing the issue below, I'm
> >> attaching the patch that makes things work on my system.
> > Oops, sorry about that.
> >
> >> I would appreciate if you could test this one on your side. Feel free
> >> to squash it into yours if you find it working properly.
> > I reviewed your patch, and it looks like it makes a lot of sense.
> > If it works, I'll squash them together and add your name to the sign-of=
f.

That worked really well, I'll add it to my WIP directory since Marek S
said he'd test the other proposal of dropping the dynamic phy flag and
corresponding check in favor of pushing everyone to the same code.

> >
> >> Also I would almost bet that dynamic_dphy is working on the Exynos
> >> boards with that fix added. So if anyone with access to those boards
> >> would like to give it a shot, we may be able to get rid of the
> >> hardcoded PHY parameters altogether, which would be a nice cleanup.
> > I wondered the same thing, but I didn't want to create more work for
> > Marek S and since there was so much churn getting the original driver
> > ported, I thought it would be the safest thing to try to give the
> > imx8m m/n/p the features without breaking the Exynos.
> >
> > Marek S - Do you want me to post this file without the extra checks to
> > see if it still works with Exynos?
>
> Feel free to send me patches to test or just point to your
> work-in-progress git repo.

Thanks for testing this, Marek S.  My work-in-progress branch is:

https://github.com/aford173/linux/tree/dsim-updates-wip

Depending on what you find will determine how I modify the next
revision of the code I push, so I very much appreciate your feedback.
Hopefully the suggestion from Lucas will work for your applications
and we can reduce some of the code complexity.

adam
>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
