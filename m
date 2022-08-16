Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45059550E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974398BDB0;
	Tue, 16 Aug 2022 08:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5BE11AEB2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:24:06 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id e28so7616338qts.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=URNWhoG6Jht3PNpZTFjRMq9C2xuK/GPJGs5c4/qP8Qo=;
 b=WMTSsJZCsuR2GWexgektS/N4A4uFwS5j+U4U9bXLj9a3L47qI380JV+vKz4DRgUo7m
 JQ0ZPw6GRXuu40crI4HPnyfuU8Mwuj1qNeEIP4TcZGai2JWBghl1MLZHSVb55P06F6bx
 B1nlcqlENsza+hf4Ohd1X2ICgnXG9gNZC7PGiYkFdA7ZFjkUfcc87MSd36YKblkLzxGa
 2BnwA9oruaCFleVvpGTBbHY4dKpfAmqqekOjjv8m9YDssWVu8bRB/z5KMz8EGrrjZ7Sy
 Eu4fOB4U87dlJ/FQykdL1H5XL0UdE1RlRY7jmsZJ10A3yVUtG2esLd0xOaEnLq9ua0pr
 3xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=URNWhoG6Jht3PNpZTFjRMq9C2xuK/GPJGs5c4/qP8Qo=;
 b=kGlTJdfycEGMMVpPsaQXaIaGqHkzN6Bt/Lc+hxksPXEC4IUZ8cvSTSpt0gVkpSrvGd
 yaBGnr/ZQ7t/zgVgBBqnQi1oRQVdkybADhuVV57BuiQrvjfvjmeIDIAdHdH23amwb1KD
 aD0t+4A1azlk8B9OFQ42FlyjHukBSNIzjV5R7YH9HLjznl+XNoEC+d3hw5cUm+WTNplw
 9rjX/KEvcUXUOCHUxaL+ywKDvz97LU0Lvefjlkx/06Q+NnLGtsWV1V/LtAaleDaKf/2k
 ZBwE9LW+EMAKLjKt0o5pQFqaHf2ZkYRPm9ackiVRTTOSq77I8TIhXxMX8hW7quWwQlhO
 ePhQ==
X-Gm-Message-State: ACgBeo0s2TMzU9Yh7hYazGMTP9ni4RQKzFHTNxs/tQNEtVxiL+E9sVQe
 ptCpC5HzfimWG7HFJ4Am7q52I+YC8a4xhZ9XTds=
X-Google-Smtp-Source: AA6agR5pnQGi7oingWiXnnixDq3edlax9wsTNuhcRBi9pIKjuflZ8obEieyrcjYpsw/u/5tbgjY0kZ/rOVvlBmyXAN8=
X-Received: by 2002:a05:622a:14cf:b0:343:5b6:68ca with SMTP id
 u15-20020a05622a14cf00b0034305b668camr16705479qtx.195.1660638245828; Tue, 16
 Aug 2022 01:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
In-Reply-To: <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Aug 2022 11:23:29 +0300
Message-ID: <CAHp75VcAS2Km_aWOV-XhMe9JkLER-1DYbJbkM9pa-i9yhHqsFQ@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
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

On Mon, Aug 15, 2022 at 11:20 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:

...

> However, should a devm_clk_get_enable() or similar function be
> implemented, we'll run into trouble.

And in 5.19 we have devm_clk_get_enable(), are we already in trouble?

-- 
With Best Regards,
Andy Shevchenko
