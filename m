Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49F359557F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4DA3D96;
	Tue, 16 Aug 2022 08:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32718A2DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:42:58 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id h27so3200655qkk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=M8+zN5n51GohpbStdjKXmJWXHgqhXr7wmE0QoYJl1Tg=;
 b=qLuGJVydbZapmuhh/ri/mPvYA5bm4nMtIaG76TKtA3Mvo/gBhkJK17beJcQl4lBkM0
 iPBdZSSrCNgcezsRIABTJwp7UtgOhSIzqLsuYw6uKZIdWj2+EzGX4Ynvo2pcygJ3ES0H
 rNv2bDiwY+8yFgEBX8y3Q+RZ0w+7z61uHWS67T1C+ZdmOf9xIz3+Ss494E0LnAKj62KJ
 uuV7tjhnSgJ133uq7dK9dc8YkqzpGgSLl11+J0G8NNyLbKRknzb7wyR2X4f7YRD/3396
 ChRcoJ8Z8tpfDVeQs7eHQAwLSDOEU4j8m9CRydpoEnGFQI0rjqmOED+9BOVCNq8moS5U
 UQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=M8+zN5n51GohpbStdjKXmJWXHgqhXr7wmE0QoYJl1Tg=;
 b=Js1gY+0W6K+yxxAiSA75Nz53KnQ3FqnEwGQLL/KGkXKoyE7H1j4zJN61KS0HeuqbUP
 quxkSYjT/eaBC7BqoRPlxbioihWkDFqscxZqFhV5OCOrwqkAy0TJ0zxudtyKDQjAcBd5
 Oi74UnlSpmL2GMCn6scsuVRn1yypHJwBizViTJPllL1rKcgJHbGewCq6s5qV0r1wck6p
 hbwosVPFghBDvXQnlmrXsETzMGwHkLnVoMkq0v6DoEAUp2KK59tnccpkTnWF4YYU9VG0
 +8uev0qFxJv1YxtEAggaKdGcGVO29frbSUqoJqGhCecyYxcHAq6RMq4oTN/kW4KOFvZe
 0KQQ==
X-Gm-Message-State: ACgBeo1ZzUfsaJCrsxRqoHb34ay7CuDRhjqM7SWiltAMCpf0uIuS/S5E
 Ar8JKN7D3lawxX5NuXoH24FxmY0yyVlA2Q7FFcg=
X-Google-Smtp-Source: AA6agR4R4lk0CDBQHZmGfGnS3MaEvTJE6k0Sqbe/jCHB+ee624GaEK+KH/pS5yDyRz1iFyVysOe/Lnz9Oes4idkTrfs=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr11131735qkf.320.1660639377250; Tue, 16
 Aug 2022 01:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
In-Reply-To: <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Aug 2022 11:42:20 +0300
Message-ID: <CAHp75VefRphjAhSmrUVC8aaAhrwMD+9Jr=OROFU-0JuNhuFYDw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Miaoqian Lin <linmq006@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Turq uette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-clk <linux-clk@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-iio <linux-iio@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-hwmon@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 8:37 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
> > Quoting Laurent Pinchart (2022-08-15 11:52:36)
> > > On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:

...

> > > we'll run into trouble. Supplying active high input signals
> > > to a device that is not powered can lead to latch-up, which tends to
> > > only manifest after a statistically significant number of occurrences of
> > > the condition, and can slowly damage the hardware over time. This is a
> > > real concern as it will typically not be caught during early
> > > development. I think we would still be better off with requiring drivers
> > > to manually handle powering off the device until we provide a mechanism
> > > that can do so safely in an automated way.
> >
> > Can you describe the error scenario further? I think it's driver author
> > error that would lead to getting and enabling the regulator after
> > getting and enabling a clk that drives out a clock signal on some pins
> > that aren't powered yet. I'm not sure that's all that much easier to do
> > with these sorts of devm APIs, but if it is then I'm concerned.
>
> You will very quickly see drivers doing this (either directly or
> indirectly):
>
> probe()
> {
>         devm_clk_get_enabled();
>         devm_regulator_get_enable();
> }

And how is it devm specific? If the author puts the same without devm
the ordering would be wrong, correct? devm allows us to focus on
ordering in a *single* place, which is a win. You seem to be proposing
to make a high burden on a driver's author to focus on ordering in the
*three* places. I disagree with that. Yet the driver author has to
understand many issues with any tool they use. So the root cause of
your whining is rather on the edge of documentation and education.
(Yes, I have heard about issues with object lifetime in v4l2
subdevices regarding to devm, but it seems irrelevant to devm
mechanism itself.)

> Without a devres-based get+enable API drivers can get the resources they
> need in any order, possibly moving some of those resource acquisition
> operations to different functions, and then have a clear block of code
> that enables the resources in the right order. These devres helpers give
> a false sense of security to driver authors and they will end up
> introducing problems, the same way that devm_kzalloc() makes it
> outrageously easy to crash the kernel by disconnecting a device that is
> in use.



-- 
With Best Regards,
Andy Shevchenko
