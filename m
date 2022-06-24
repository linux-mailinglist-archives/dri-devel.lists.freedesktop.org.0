Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F003155A3AA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED2910F11F;
	Fri, 24 Jun 2022 21:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8BD10F11F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:36:18 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-318889e6a2cso36542687b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cGTylEOWtLkcLIsxYVoGzfL+q0nSap9+8NoSlXBuXe4=;
 b=cmDy8lsyV2rPNiNRuYkEb5rHWD8XZVHKqJZAeKf3TnWZFLlj+/DTdLUMbXEmtTuv9s
 4KLbNJHfJqFtWZDtoSIB0jA5BkjqsNets6Rbr/qrINRnJTlQirI2k20GLR/Ql3zSe9Wq
 Pb5aXUq1NZ5lDKQQMD7a39HTujZM62LjFsQtIqhJoX7pGAoQGMqpg1+inV2FswApITO2
 CmT3BH618Yqgt62CZsqxQ5e1jZosKUxMbd0fExcTgjLrAxPBxkG7CVcmjw/O8dvTmdbG
 l6UouC6UHf0T16KEM/mMUtmMtJOh0vyJl540PkTEmkGnFr3Ic8OHzXavkS9AsevSsxDH
 c7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cGTylEOWtLkcLIsxYVoGzfL+q0nSap9+8NoSlXBuXe4=;
 b=xvFhzBeMdt8Rd0Nj5dXv3+YhOyHY94b4y8af++enTpUE1vMEXnUsNv6X1V1Cu/LzIo
 5SaeD+WPr0bgfaKk2KFeEFdtyUyjR8GRZJZnbDLyAQ3wBsjT0hW4Fzt6iNeu2StSXjDn
 CbqdpdydkGfGFlA7AqzjnWgQlWSpwjA9fen/UxOkm0tbXrMtU8qZGvsDCD6gNsRaJgji
 hY5CdxkFB24Aay3F7kfoiuH9lbOTawrX8ntqHvTUG1FjHMVwTBrAIzVrJ/0fYFOoHQS7
 ctGEY5gCQSSQH90r/RpWn3SKEhLCXmG8mDjNpHoTKf1dkXG/xbc2IQER0y5A5L38zzAg
 WS7g==
X-Gm-Message-State: AJIora/a6hsYswcZqMagT+CL9H3ooYJk4wp7rrT/OgNzG+Q6GswMEZXd
 eZhsDLZ/tkFOxkUyzLS3XXNBKxM8IYzJx6qn2Y6GKQ==
X-Google-Smtp-Source: AGRyM1v7bTPADut4sgzebmriq1YeKB4PBfCCubvcMefuaUSK78eOKMtZqJdaXmsewcrgPAHhOp3HhKhV310/qVQEQyc=
X-Received: by 2002:a0d:cc54:0:b0:317:752c:bcf3 with SMTP id
 o81-20020a0dcc54000000b00317752cbcf3mr1068283ywd.437.1656106577632; Fri, 24
 Jun 2022 14:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
 <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
 <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
In-Reply-To: <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Jun 2022 23:36:06 +0200
Message-ID: <CACRpkdYoR9SGQdxJQmUReP7SLk_BxG0yuTWAL__o90PuO8sCqA@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: szuni chen <szunichen@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 chiaen_wu@richtek.com, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 24, 2022 at 9:20 AM szuni chen <szunichen@gmail.com> wrote:

> > I meant this one. Move that into drivers/leds/flash
> >  drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++
>
> In next version, I'll use "leds: flash: ......" instead of "leds:
> flashlight: ......" in subject.
> May I confirm that the driver has already in the drivers/leds/flash,
> so I don=E2=80=99t have to move it in next version?

Yeah you're right, I am just writing wrong comments today, it is already
correct. Sorry!

Yours,
Linus Walleij
