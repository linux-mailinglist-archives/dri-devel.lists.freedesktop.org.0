Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD917FD378
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70C910E41C;
	Wed, 29 Nov 2023 10:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E546410E41C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:03:29 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5cd81e76164so57793767b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701252209; x=1701857009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dObiGvWh8P2CqEpKI7yz0tGXt/3B108CIDPRJbpF7+s=;
 b=UmCS2XE0Ltc1OygVWwS06zSMEJ/cbs4/SfsRUa1ey+zgxA8ExDLpnLGAOnuRTKngto
 uzP6n4B2f/a2uRutr/D/1DUDxuQy3x9DEnKk8kFGIRQl9v69J/bBfb81UKsJLg1WnxX0
 DZfuBRA7wHAI/1XT8Mg/n3otXfE8MexuuvP+GQcGG4uFfRKV2CyjSYD4oNLP02HJ+hpC
 1SnRGwxeYCPoWqL8XgA0vSeai2crBJ38Qi07vvncSPiA8G04/CczAfqPqqTI3x3QtzGo
 DeOWV5+FXlQfQ27iYgfBkVkKZMZUcJVHSsIcNiktU8/CXGc9nbvuwNQLCwUTdj4vu4rP
 sPnw==
X-Gm-Message-State: AOJu0YzF77ag5s7pW6C6StxLQN5/0bu0PYBFwt5td0NLApLn8qLWSxhm
 0XRvWPF1QhvPdp9o0jIIkSg/bWgJS+bdvg==
X-Google-Smtp-Source: AGHT+IFZJP4R6I0214hbau0WDknP9VAPY2kVW3Ozb/anCmyvpulf05YUOeVuQGDnFPUJIAZc8xWhUA==
X-Received: by 2002:a81:83c9:0:b0:5cc:d0bc:fc2b with SMTP id
 t192-20020a8183c9000000b005ccd0bcfc2bmr18358798ywf.17.1701252208940; 
 Wed, 29 Nov 2023 02:03:28 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 z127-20020a0dd785000000b005af5bb5e840sm4471475ywd.34.2023.11.29.02.03.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 02:03:28 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5d226f51f71so9002837b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:03:28 -0800 (PST)
X-Received: by 2002:a05:690c:c09:b0:5ce:7ac9:d10c with SMTP id
 cl9-20020a05690c0c0900b005ce7ac9d10cmr17048170ywb.32.1701252207822; Wed, 29
 Nov 2023 02:03:27 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
 <87cyvsc46y.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cyvsc46y.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 11:03:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUODXACTmrtTuKZPZT8xFVn611kDU+DTTjRE7Hn2zS0Zg@mail.gmail.com>
Message-ID: <CAMuHMdUODXACTmrtTuKZPZT8xFVn611kDU+DTTjRE7Hn2zS0Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Wed, Nov 29, 2023 at 10:13=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> >> On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
> >> > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> >> > <javierm@redhat.com> wrote:
> >> > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> >> > > > The Imagination Technologies PowerVR Series 6 GPU is currently o=
nly
> >> > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a depen=
dency on
> >> > > > ARCH_K3, to prevent asking the user about this driver when confi=
guring a
> >> > > > kernel without Texas Instruments K3 Multicore SoC support.
> >> > > >
> >> > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR =
driver")
> >> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> >> > > In any case, I agree with you that restricting to only K3 makes se=
nse.
> >> >
> >> > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
> >> > eventually ;-)
> >>
> >> I disagree. This is to handle a generic IP, just like panfrost, lima, =
or
> >> etnaviv, and we certaintly don't want to maintain the Kconfig list of
> >> every possible architecture and SoC family it might or might not be
> >> found.
> >
> > While PowerVR is a generic IP, I believe it needs a non-generic
> > firmware, which is currently only available for AM62x SoCs.
> > Once it becomes truly generic, I'm happy to drop all platform
> > dependencies.  Until then, there is no point in asking everyone who
> > configures an arm64 kernel about this driver, unless they also enabled
> > K3 support.
>
> That's true but it will require a Kconfig patch every time that there is =
a
> design with a different SoC using this generic IP.

It also requires a DT bindings patch, to add a new compatible value,
plus whatever missing properties for SoC integration (e.g. resets).
And a DTS integration patch.
And patches for various on-SoC resources (e.g. clocks).
And perhaps a DRM driver update.

> So when should be added? Once there's an upstream DTS that has a GPU devi=
ce?
> Once there's a firmware for it in linux-firmware?

It can be added when handling the above.  As all patches should be
tested, the firmware must be available first.

When critical mass is reached, platform dependencies can be dropped.
I do hope that will happen rather sooner than later!

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
