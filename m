Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AD707399
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0710E492;
	Wed, 17 May 2023 21:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914310E492
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:11:56 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-559de1d36a9so14618087b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684357915; x=1686949915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ESbY04o8nMiMylkhFsmBCHORahVNqly1l+b0KOa640=;
 b=v5SexcE/rX2IDDr2Q+Jg71qCnOgAEyqh82pmkfwBGRhxmmH1TRMWr90nRSxjjoCF1r
 hGYuFJu1daRVqli8IXLNSBOXNnNwKzOdeANaee76IbW06Pf/BTOfIUH2zHOWfF/wUeLr
 c9kW4YK0gfMM5I4x7QJZ47n0t+18qK5ugWD6CJ4BotPw8/dhlvZv24u9ZNAgwO59exXX
 MWvs3Bh2AC8sMAG2Hx/UD7eVqmCETIqXr/Ve9A2Pb9L+Cr7EBH415lQBjobg5AAXwpbz
 Sd7PazZFNAZ/ItAcx6G3TlD/PshhlglA0pY56ts9Lx8xkxwMk/sofpb/+T6wZqAd4tS0
 oXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684357915; x=1686949915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ESbY04o8nMiMylkhFsmBCHORahVNqly1l+b0KOa640=;
 b=WQOIlGZpRykk4H9OSvVAcqzcNPAkWO2Ye3hyfaGovy+T56PoYxnAg68cgnxhH0zQ6C
 Crvkq2VsTK/Vogf/h76JM4IAiqZuQU86nJdauYxgqBeN66lb27XOX8a3LvFBOVZOgKRC
 9SoPpjzQ27yRDtLv6DfM9xtDlDY1acu8ZFjLZtoVGGiRaL35UM43fgKdwIXgkcc3FX1C
 DzznVBv0w9NJgfUnThc5LvX3t9Bk3oi+w8HWmncAxXaDfS+Y70sK9zUrP08r5bOfRDbN
 maHzQp3x/C3y8774b8rmOJPyHlHjgkjgauwsS0yPoGS5S6qdtpnmXqg03ivxg5bfJtV1
 AQ9Q==
X-Gm-Message-State: AC+VfDyCxGuHSZs0x7QvMgCFZfBdDNt/jJ2Vu8wzBBPvkucntstYdGlf
 +KFQxhNenGF3hFG+9UpDnrSPl/zJB5Hk+UCyQ/kFWw==
X-Google-Smtp-Source: ACHHUZ4WiU/7XNv5tV812IdEVaHBoQ+14tMHeWf4rv+lcocaQlv66/13I8fR3QBFOtF5w7UHYni2NBlJ2CKlqIUUMBE=
X-Received: by 2002:a0d:e84f:0:b0:55a:679f:1d90 with SMTP id
 r76-20020a0de84f000000b0055a679f1d90mr43201104ywe.2.1684357915574; Wed, 17
 May 2023 14:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-1-9b6dc5536b17@linaro.org>
 <20230517195911.GG271152@darkstar.musicnaut.iki.fi>
In-Reply-To: <20230517195911.GG271152@darkstar.musicnaut.iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 May 2023 23:11:43 +0200
Message-ID: <CACRpkdaxQQ3fJeYRs+M29MYA4=f+ha26m5Xa2+uV_MejtEdwUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Input: ads7846 - Convert to use software nodes
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

On Wed, May 17, 2023 at 9:59=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:

> This does not compile as nokia770_ads7846_props is declared twice,
> and nokia770_cbus_props and nokia770_mpuio_gpiochip_swnode are missing.

Hmmmm I think we should probably update omap1_defconfig to enable
all the OMAP1 drivers so we have good compile coverage. It's the
ifdefs that fool me into believeing the code actually compiles ...

> On Mon, May 08, 2023 at 11:20:06PM +0200, Linus Walleij wrote:
> > +static const struct software_node_ref_args nokia770_cbus_gpio_refs[] =
=3D {
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 9, 0),
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 10, 0),
> > +     SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_swnode, 11, 0),
> > +};
>
> These should be nokia770_mpuio_gpiochip_node.

Fixed it.

> > +static const struct property_entry nokia770_ads7846_props[] =3D {
> > +     PROPERTY_ENTRY_REF_ARRAY("gpios", nokia770_cbus_gpio_refs),
> > +     { }
> >  };
>
> This should be nokia770_cbus_props.

Fixed it.

Also enabled CONFIG_I2C_CBUS_GPIO and recompiled.

Yours,
Linus Walleij

Yours,
Linus Walleij
