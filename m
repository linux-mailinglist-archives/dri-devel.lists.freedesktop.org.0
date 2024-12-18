Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEF9F6952
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2965B10EBD6;
	Wed, 18 Dec 2024 15:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674D10EBD6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 15:03:20 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e3a1cfeb711so4347778276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 07:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734534198; x=1735138998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41Dg+d3rpM/D/LUeai2lXI5h2a/eE7RImpqgvXwmFNk=;
 b=epyQF2EzfHmU59HPCTwYyirxzU4rg8dCSHUp+quJ2aK2c83rOOyoKeJnHjbWjIwamh
 DDEReeIrhV57qzdh6sgcrbV19UpG1omAMYB1TbJRxmf8Y1f40EDz6rZQ2hb+EknTjkWS
 Z39r6z33RJmQ+geP6T7aMHBirray/D96P+W5JfBLqdQICvx8uYfb1VBnFu9vozWjvq6N
 YucZP7znDy8px+CH2LM3m/iiAytAiDKj7CJIkcjzF+SffWWoBxQSCFXn5a80lu0iGLxw
 jyvvXzwyhjczdmiI/GGNIR12fbGA8pMNJzsIr7x/eqFw22lVMA7QJTJj1nYyD0/AFjOh
 4AYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX60Lb6vgS94DVM4DyeCm6SYQld1ygKXbwnRKzpBF2RiXAc1Tn9ZfFWagvkTP0umt21Ox07B5ycVRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJev6jOiHh4aY11WjTKD97CNU8TucgGvkbIOhd6M/4I/kmPwsu
 2RvcuT+EfpfzDPZ9SlIVe75UXpXPl+Wx9VEPnjfpm9+57tyUndR5uvkFzX5u
X-Gm-Gg: ASbGncvfAeHYJAm+quC2ozfR4oc8imidGz8y5za5rBMhiT2LiyNDeS9/SJJOvw0XXY3
 hM8VaQwxrC2hRJUxoDlPahMNfDPKvSxHO7UqkQ1gd7wxWkUQsiw+3dF8DZXfTmQJwVPnWeDnXz3
 x/o0dqLjGf1khM6wtruaw4CoEZ2hvaUS5r+Clbzk1JVXakymHjeEQAowCzu5ZUdBSgvZT8yDeVf
 XBh3B47XIq+MYPz8oETHJEG/2fPFyn/FIM1CizMNfofJ19UCQr3vYE49q8RNodcHAKfCt1ZnANw
 MuBO61pYK0hniCOtYr/PPZg=
X-Google-Smtp-Source: AGHT+IHFBUHfjXrFaZlMuEv+209vkelW61dadF2zdUHmrYB6gzNHp43VJ/mYk4a37PoEDWl6oNG/Bg==
X-Received: by 2002:a05:690c:3501:b0:6ef:522a:1c41 with SMTP id
 00721157ae682-6f3ccc38847mr26196117b3.13.1734534198122; 
 Wed, 18 Dec 2024 07:03:18 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6f288ff2e9esm24125617b3.41.2024.12.18.07.03.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:03:17 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6efeb120f4dso48974327b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 07:03:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFTYjRecDhUY30Fd97djYx38PAInXSyNaBs2muVlPw8VjtmAzhvaHvu+2rQ5x3a07MoTdgQ9LWPVU=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6304:b0:6ef:7372:1131 with SMTP id
 00721157ae682-6f3d26a0a22mr25108847b3.41.1734534196588; Wed, 18 Dec 2024
 07:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
 <Z2LZozgxxQuusHVS@pathway.suse.cz>
 <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
In-Reply-To: <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 16:03:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ1N2N5WBfG3KeC1fPz+ez+fzDriKm8omHxfhe6m_Pfg@mail.gmail.com>
Message-ID: <CAMuHMdXQ1N2N5WBfG3KeC1fPz+ez+fzDriKm8omHxfhe6m_Pfg@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Petr Mladek <pmladek@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Jocelyn,

On Wed, Dec 18, 2024 at 3:58=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
> On 18/12/2024 15:18, Petr Mladek wrote:
> > On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> >> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> >>> On Wed, Dec 18, 2024 at 11:14=E2=80=AFAM Jocelyn Falempe <jfalempe@re=
dhat.com> wrote:
> >>>> Maybe you need to add console=3Ddrm_log to your kernel command line,=
 so
> >>>> the kernel will actually use this console.
> >>>
> >>> Thanks, that does the trick!
> >>>
> >>> Note that I do not need to specify any console=3D kernel command line
> >>> parameter for the fbdev console.
> >>
> >> Yes, the fbcon console is tty0, which is hardcoded for historical reas=
on.
> >> Some architectures use add_preferred_console() to enable specific cons=
oles,
> >> I'm not sure it's allowed to use that from the drm_log_register() code=
.
> >
> > add_preferred_console() is used when the console should get enabled
> > intentionally. I would split the intentions into two categories:
> >
> >    + requested by the end-user on the command line, see
> >         __add_preferred_console(..., true) in console_setup()
> >
> >    + enabled by default by a hardware definition (manufacture), see
> >         add_preferred_console() in:
> >
> >       + of_console_check(): generic solution via device tree
> >       + acpi_parse_spcr(): generic solution via SPCR table
> >       + *: hardcoded in few more HW-specific drivers
> >
> > add_preferred_console() causes the console will always get enabled
> > when it is successfully initialized.
> >
> > So, should the "drm_log" console get always enabled?
>
> drm_log is a replacement for fbcon, which is always enabled, so I think
> it should also be always enabled. Otherwise you won't get any console as
> fbcon is no more available.
> drm_log doesn't really fit in the architecture/hardware model, because
> drm drivers are available for a wide range of architecture, and a GPU
> can do either fbdev/fbcon or drm_log.
>
> >> I will still send a patch to add update the Kconfig help for drm_log, =
as
> >> this command line argument is required to have it working.
> >
> > I guess that the drm_log consoles should get enabled only when
> > requested by the user =3D> documenting the command line parameter
> > is the right solution here.
>
> Most embedded linux specify the console on the command line, but for
> laptop/desktop distributions, it's not the case as fbcon is the default
> since the beginning.

Note that on embedded systems with DT, the console is auto-selected
via chosen/stdout-path. No explicit console=3D needed.

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
