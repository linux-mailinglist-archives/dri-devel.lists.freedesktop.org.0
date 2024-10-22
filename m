Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73729AB0FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 16:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131CC10E036;
	Tue, 22 Oct 2024 14:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LEIBIR1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FB510E036
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 14:37:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso88778791fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729607840; x=1730212640;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/t/LGFahIImpW2uX5IAKpkFKUskZ7g86BAvsJJ7sGR4=;
 b=LEIBIR1AGSARf8XClNi3K3A/V7oe2aAGjtQNApyZ+HJOJ0yYFWecFCRZO5MPrFKiKt
 dDZYvPrGcim+8xplr6Wa4VYV+SdwGd7m18tIAl540nv/ZKW1QGIMjJCgPzGiEnLkSxza
 xf6RpCCdOlCqnFqMbmlgwBQYbyMZw10LIbOAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729607840; x=1730212640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/t/LGFahIImpW2uX5IAKpkFKUskZ7g86BAvsJJ7sGR4=;
 b=GRNer90VjWotRyoSRwMYvskIZCSpXmqOnXpfVtW6dXpRMb6hPKrIER2n8E4ID83zcd
 EKTT+YyWLn1XCkuk2JoiCUDd0BX/1cLHQAtG5bhJQ9spH519JYuAS8Ua4NcnXdNpkD2O
 vXdrERnN1W//OE6EqWKKPVzXCSgj7B3SFfJekis6hNGg/LWcfdgcE3LpPumlFp0n8PE6
 91Bj0i2TkE1XsG6mZYa6ZFHzLUwnlNWmhikRcMAG7nea5T1tUt9jtPaUXLqqgRgjJfOF
 anbdkI92PS6U6rvkzRirf64PAuT/lbXiWKFE+jzYbdk5Cf6YUNq/AD2ww71Il99J2ziE
 zHpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF/LRg2UxjUbfDxgYNs17AOMQe6vebAsFuQQOksNaFKz1NNO/X9peYwyMsDgdUYU7GhyViRiMCSfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIrlqTJ7nsvPF5YHPVr8tqerTbYwJ3Ln8ZQFg7oAdiT4ANFG0C
 yYF7Cy5KP1LLs7JvAh5mKIaJCq+zGzv0oankjZAQQIYZRHDKi3zylnrb3uPrrFdmU4C7LaNx19J
 +9mHX
X-Google-Smtp-Source: AGHT+IHJRNHETQYG4uKzt1IuVqISGHMJIHkOe7ysflPF9rX9RuuUIcWv7I5QOsjh+nuf4SkTR9+jiQ==
X-Received: by 2002:a2e:8ecd:0:b0:2fb:4f8e:efd with SMTP id
 38308e7fff4ca-2fb831ef969mr97595921fa.32.1729607839695; 
 Tue, 22 Oct 2024 07:37:19 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ad4b7eesm8263071fa.14.2024.10.22.07.37.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 07:37:19 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f58c68c5so8724009e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvyJUhTRPOoF3VqPpvPTlQtp3JodOUsXaoxZZYTPXdKrOtA8vaWb+6BW5fETVCTozwliycAEAzT1g=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3a8d:b0:539:9720:99dc with SMTP id
 2adb3069b0e04-53a154c9f51mr11729196e87.46.1729607837496; Tue, 22 Oct 2024
 07:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Oct 2024 07:37:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
Message-ID: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 22, 2024 at 12:12=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > in the TI driver does sound like a good idea to me...
> > > > >
> > > > > Great!
> > >
> > > > With the I2C adapter numbers, that becomes:
> > > >
> > > >     /sys/bus/auxiliary/devices
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> > > >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> > > >
> > > > > adapter->nr instead like other aux subsystems already do.
> > >
> > > Unfortunately the devil is in the details, as usual: there can be
> > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > so adapter->nr is not guaranteed to generate a unique name.
> >
> > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > chip is always at bus address 0x2d so you can't have more than one on
> > the same bus. Unless you added something funky atop it (like a mux of
> > some sort) you might be OK.
>
> It's 0x2c on mine ;-)
>
>     8.5.1 Local I2C Interface Overview
>     The 7-bit device address for SN65DSI86 is factory preset to 010110X
>     with the least significant bit being determined by the ADDR control
>     input.

Doh! I missed that in my search of the doc. I guess because they
decided to specify the address in binary in that part so my searching
for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.


> > > Changing the auxiliary bus to use the parent's name instead of the
> > > module name, as suggested by Laurent, would fix that.
> >
> > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > we had a second on i2c bus 4, we'd have:
> >
> >     /sys/bus/auxiliary/devices
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
> >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
> >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
> >     =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0
> >
> > ...and I think that's guaranteed to be unique because all the i2c
> > devices are flat in "/sys/bus/i2c/devices".
>
> Correct.

So given everything, using the dev_name() of the "parent" sounds
pretty good and seems like it addresses everyone's concerns. Was there
a part of the conversation where someone pointed out problems with it
that I missed? Is the next step to post a patch implementing that?
It'll change sysfs paths and dev names for everyone using AUX bus, but
presumably that's OK?

-Doug
