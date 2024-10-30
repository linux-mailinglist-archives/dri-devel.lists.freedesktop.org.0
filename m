Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF09B6009
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 11:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9B10E772;
	Wed, 30 Oct 2024 10:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B9610E772
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:25:54 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6e35bf59cf6so7309427b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730283953; x=1730888753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zTVtYSQqbvyHjwx/lkmZrqb0a0XoJO0seA6apsOTsAU=;
 b=dNgpabfvswzPSb4nohLP7H1T+MRXMvGI0yZOe8Xfm+mMsiTKKag/KYw+edixj2L5tk
 6XGo1U0KFXva7kQWYhnqrIMhYDn4XhjW7RcPg9rf+CHhNIQC27Qlu21jyzbkSdi3yEAm
 fo6RX3WAbHyaSJGkraTrcP/5gPBdPWN8+1ep8lRPbK2DCjtyu4jS5QGSEfWJtquRal+z
 QTJQjGM7t6ttpEwlsLBNjDYMiZG8Qux4C0JDKJzPLSZOIjVlSgoxg1ko1Xv6tz7M31Ii
 t8euRslzee6hxcqKxrZJxOnuFAzQ41/wTE4jTAdU6B2nlUvy9ybA2PF+U/htWDnJJ9M0
 cGww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtG6porT1WaMbknsopsUevK3+IkmB2uhVEZS5vRqmrUBmyH0BiGanYc3cs5RSi7C/T+Hr/0TCL6QM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww6hDu2uWiQWFa/OUZ24UogoMLDlJwmt9KnXOEEyYmSRa6bXWn
 /rpNuotXGq746ulM40x5Ezsi1ir6sl1rHWFL4an/CTh2ghvkyS99wENXVaEV
X-Google-Smtp-Source: AGHT+IETx4FqXwCXXbBQIsJQdloiI6bjQW7hpri/2S0gsyH/4gHij83Z8oW2Gj+wYOcM7K93RIYl+Q==
X-Received: by 2002:a05:690c:4a07:b0:6d4:72b7:177e with SMTP id
 00721157ae682-6ea3e7527e1mr11766667b3.5.1730283953119; 
 Wed, 30 Oct 2024 03:25:53 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6e9c6bde218sm23574267b3.53.2024.10.30.03.25.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:25:52 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6e39bf12830so6411577b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3O3vPfW5tCtGutCC1cvD4j3eIuhlnowwuDQLC5vw8m7RczsAridxpXL45gtKeG5plasjoqNJLx7M=@lists.freedesktop.org
X-Received: by 2002:a05:690c:c84:b0:6e2:611:7abd with SMTP id
 00721157ae682-6ea2c218013mr45054217b3.20.1730283952632; Wed, 30 Oct 2024
 03:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
 <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
In-Reply-To: <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 11:25:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
Message-ID: <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
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

Hi Dmitry,

On Mon, Oct 28, 2024 at 2:34=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > On Tue, Oct 22, 2024 at 12:12=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc=
()
> > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > >
> > > > > > > Great!
> > > > >
> > > > > > With the I2C adapter numbers, that becomes:
> > > > > >
> > > > > >     /sys/bus/auxiliary/devices
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
> > > > > >     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
> > > > > >     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
> > > > > >
> > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > >
> > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > >
> > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > chip is always at bus address 0x2d so you can't have more than one =
on
> > > > the same bus. Unless you added something funky atop it (like a mux =
of
> > > > some sort) you might be OK.
> > >
> > > It's 0x2c on mine ;-)
> > >
> > >     8.5.1 Local I2C Interface Overview
> > >     The 7-bit device address for SN65DSI86 is factory preset to 01011=
0X
> > >     with the least significant bit being determined by the ADDR contr=
ol
> > >     input.
> >
> > Doh! I missed that in my search of the doc. I guess because they
> > decided to specify the address in binary in that part so my searching
> > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> >
> > > > > Changing the auxiliary bus to use the parent's name instead of th=
e
> > > > > module name, as suggested by Laurent, would fix that.
> > > >
> > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d".=
 If
> > > > we had a second on i2c bus 4, we'd have:
> > > >
> > > >     /sys/bus/auxiliary/devices
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.gpio.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.pwm.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.aux.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 2-002d.bridge.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.gpio.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.pwm.0
> > > >     =E2=94=9C=E2=94=80=E2=94=80 4-002d.aux.0
> > > >     =E2=94=94=E2=94=80=E2=94=80 4-002d.bridge.0
> > > >
> > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > devices are flat in "/sys/bus/i2c/devices".
> > >
> > > Correct.
> >
> > So given everything, using the dev_name() of the "parent" sounds
> > pretty good and seems like it addresses everyone's concerns. Was there
> > a part of the conversation where someone pointed out problems with it
> > that I missed? Is the next step to post a patch implementing that?
> > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > presumably that's OK?
>
> It also requires changing in the way the auxiliary_match_id() works.
> Currently matching is done using modname + ID.

Right, so just using the parent's name instead of modname won't work,
as the former is not a fixed string.

> So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> match_id function, but they won't be that intrusive (one just has to
> skip two parts of the name instead of skipping just one).

IMHO this is becoming too complex. What if the parent's name contains
a period?

So just using ida_alloc() in the caller seems like the most
straight-forward solution.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
