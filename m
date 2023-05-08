Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E86FB8FB
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DF210E02D;
	Mon,  8 May 2023 20:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8AA10E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 20:54:58 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-55a829411b5so45952747b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683579297; x=1686171297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebgkfCiodiKcun60kKBUwZij72grfP4UOmjlc+G6i8I=;
 b=k0YYa/u76d7Ieqtnsvy/Saa1HPB4iaH1dWzUdUuvpcLGfYYlTzbXgK21e8GZZqfZ7i
 YE+F+MB9zyXtiARKsPNIiY9f3Yvt1HVWAVLTf6t6yhR5GOODuvZu3luqlcRMbLYDDKCC
 QpsnZEqepGgE18Mu6mcHcKTrkO/b+Iy6POYKLn7fB3mza3FUb79uQ3OyDUmYLPLGyrU9
 yFfOpdYmElLihnmMJxGsSFbxtufg1vlUdp39zLnUMxZA1zevF+Nwgewq67DDlHNDL6rq
 W1tR4tE5bhj81NA+/5pweLJQAC6rL4aL5pDyC8sWhOEqEyQUW98xARAg6p4xXnZCWIp9
 mDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683579297; x=1686171297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebgkfCiodiKcun60kKBUwZij72grfP4UOmjlc+G6i8I=;
 b=jhnjikZifEr5J6RHxjs6+yPN+mce20aI/Wuf8Q8kvuz+/38bYIwmTvYUSrhxOR1kNL
 TKFTbugyNEPvy2mluTo30AymLDtOmmALmGUOCRUi2EmFigrabYkX1xxRVLiR6Ng6GbT8
 xbciXfnlxwYYdcieZSW1B5LUGnfHMELMZVEf1VRF+xdWHB4BNPkkQq1cRAPGF9cusXAI
 bbG+Q+pXjdQeGuwov3X8YzfYb07UzZjRj9xJTJI9qcqWHiv5+IHMEcKMx8fiGrnkIi1Q
 ymUjmi6nMP3qWUCbiZuIlkAD30KAR1w5jUdqjqJiBPS0/YuQwMrYi5MswsU4Tzp/RLs8
 UWcA==
X-Gm-Message-State: AC+VfDxlcLFYpE4drqs9JEq5ZrePMUgwXjMfp44ThD+H1EqoRJRYclbG
 hHcT5MfMcrp4KMYU8/Q1WdfxZovVv3mLJLdNR29Evg==
X-Google-Smtp-Source: ACHHUZ61Co9c2vfFGtG+tpLFRQ4UHj1QYb0g4ygOt03JqCB/lCRGyKCa19BWVLj8Nu27zbXZko10yxza9yB0luPTCMc=
X-Received: by 2002:a25:54b:0:b0:b99:f279:10dc with SMTP id
 72-20020a25054b000000b00b99f27910dcmr12394809ybf.28.1683579297026; Mon, 08
 May 2023 13:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v3-0-a6d0a89ffa8b@linaro.org>
 <20230430-nokia770-regression-v3-1-a6d0a89ffa8b@linaro.org>
 <ZFkSMBhw5UaWdpsM@surfacebook>
In-Reply-To: <ZFkSMBhw5UaWdpsM@surfacebook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 22:54:45 +0200
Message-ID: <CACRpkda8zbR3CnRp5w=NvRder1rYTs+DYZN0QyhneDwR1E_qUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Input: ads7846 - Convert to use software nodes
To: andy.shevchenko@gmail.com
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 8, 2023 at 5:16=E2=80=AFPM <andy.shevchenko@gmail.com> wrote:
> Fri, May 05, 2023 at 01:16:55PM +0200, Linus Walleij kirjoitti:

> > The Nokia 770 is using GPIOs from the global numberspace on the
> > CBUS node to pass down to the LCD controller. This regresses when we
> > let the OMAP GPIO driver use dynamic GPIO base.
(...)

> >  #include <linux/gpio.h>
>
> Do we need it after this patch?

Yes, but it is finally removed in patch 3/3!

Fixed the rest, thanks!

Yours,
Linus Walleij
