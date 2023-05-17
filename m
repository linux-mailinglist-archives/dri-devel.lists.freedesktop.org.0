Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC570746B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0D10E49E;
	Wed, 17 May 2023 21:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47B210E49E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:36:39 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-561b50c1856so15823367b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684359398; x=1686951398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cY/eQ57fs7dlsVatS+jhyTGHg7yG2gHeDPH1M03tXUo=;
 b=irhJRAZwAa+Gz1ebjP8wNR2BRjZ5Zj07hEtQe4UvjcUFgzjGovspvZeA/w3QdqXsS+
 lJJbkj+3CaoQ+fAEvdkw4718cc3C3dx6NYhWfOJ1i8oYKYlkR9TPkLuiYZLgdW8hsG8t
 XWe9WwmmeT20MQwLbZ6Q3D3vHXl93BrmscrfPN0tDA1Tx+CkAI/aN+Ci8Ak6Rl0iS9Pn
 idxE4AUkf+FVu7lfpHsVt+wtoFI81duKbgfNn3xHbH5V+Me84d6ISJVf37U5UU+1m4AU
 ieEV8WtukMZAEkzoJzomR6uwI8vYg8OVdyOorRQU3YNGZ11A8/p8eTt9YQEojj4/AEWh
 F5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684359398; x=1686951398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cY/eQ57fs7dlsVatS+jhyTGHg7yG2gHeDPH1M03tXUo=;
 b=c8Ozu37ATL+4pmMDi0CvA5PDMb9cT7hux8vN/wC7ZgfHzc7L9UwP7spYfONV7xVUTi
 R0yiOSEclk2vdwxGKlOqjxy64UI1+tpRjn44yHCp/9Az+tjyQeNSNLs/ReWuceNU+325
 aRiwkAiHRJ7qM4KpcjDPR3gskkYT1Vzy9WMRDYZXMmHu5Rp2mgWJfmLJch0v5K05sHE8
 6Rnc8fFlt4ehBeq3+QogjOg4/P440rBc2NdVz48g0rYQ3NaEfSxvwCg5YghslGsX1vg5
 N8fTZRl8Pn5VTf/yAYkm6qJSmSma6DUmn47Ng55z/sqBza71d0vK2lAs0NDI7zqnZYKl
 E2JA==
X-Gm-Message-State: AC+VfDw4T6HXhxRTcJseA9gSpN0umc3snZ8boa9XasDL9PS5+p/nt5ED
 FgV53v7CNIcEIDsGrQSiM8UM7vnm70rHCjxIhlbUng==
X-Google-Smtp-Source: ACHHUZ4pIBn19+BLD6UElqlgO1dKdZPd0Ga1Aky4aWI+i3dEfXBJQZ1abYF5itannmQlr0DCkYCOVvzdFktxBrZVq/A=
X-Received: by 2002:a0d:cc56:0:b0:561:e7bb:1b20 with SMTP id
 o83-20020a0dcc56000000b00561e7bb1b20mr1351592ywd.34.1684359398379; Wed, 17
 May 2023 14:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
 <20230517203011.GH271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517203011.GH271152@darkstar.musicnaut.iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 May 2023 23:36:26 +0200
Message-ID: <CACRpkdb0uSkfQZxZ_mpesGSjvf0gZzaZyw5iV1haAovH8cfngA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To: Aaro Koskinen <aaro.koskinen@iki.fi>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 10:30=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.f=
i> wrote:

> This one has some issue as mmci-omap is unable to find the GPIOs on 770.
>
> On Mon, May 08, 2023 at 11:20:07PM +0200, Linus Walleij wrote:
> > +static struct gpiod_lookup_table nokia770_mmc_gpio_table =3D {
> > +     .dev_id =3D "mmci-omap",
>
> Changing this to "mmci-omap.1" helped, not sure if that is a correct way.
> Most likely N800 and N810 are broken as well.

Yep looked over it, OMAP1 has mmci-omap.1 and OMAP2 has
mmci-omap.0.

Yours,
Linus Walleij
