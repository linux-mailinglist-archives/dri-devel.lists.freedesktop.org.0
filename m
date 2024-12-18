Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60909F6439
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A7610E241;
	Wed, 18 Dec 2024 11:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB62810E241
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:00:24 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5188311e61cso1889659e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734519623; x=1735124423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/U69elco9zkiQh0yXZq7MKvg1aCO2Nz91Fs7NLtUtc=;
 b=dP72n/gYR9vNy2ME55DbqEutk2qcJOimVOI2Iq+qS5EhBh2hNtWe2BV81VyIN7JT9t
 U7buIBxfLse2H9Gt3d75ghqSTLakx3y34C/s/BOghZIyILnaMPHbR900RCVGzjEXGnQ7
 NU1vyAI7a85YdDqAFwviEOBnDghKviT/YSv3Vx/vWDABdAyjSgsjVx8i8hyEIJlpoPLg
 IvmywUs/v6KJ9868DMZe44Wi9viYZclikZlVnh2Chu+I04fENrMCC7uv8qB1eo9s16+Y
 oeFTb5oSrCPJBl8L6/OKaGgdPMhU0lav6MahJhWlhaYAYS9yngjAYtyt23W5xQFXL3MA
 /lBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4s39ydr9s8/ez+Kdi4+YQixaxMzWMjRWS/vtQ0ZTXarAqNHP+0fcKj3j3HS0T+VVliCBGc9khN8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf+CMTl8xJ3iuAKH0KLJ1uvzOGGH0LLE0/jqRZMff6u7qUsl33
 lqLEWbSSADqpgPCUOkzgX34XuRSbINVFf0MD8LeD2e04s9LRAQ465t2tack1
X-Gm-Gg: ASbGnct+hfzVKXns0rs94EP9eKo3cgy/e7HQ0ppWJGNDEGbOaujR+LKeJvW1RlXzPWH
 PMLQox1mlbSvsyESa1U4h9ogxDFdX3pyJKNLgi63ZQxRs8arJzENBrXXnr1rAynkBvv6WjLCmLk
 e9cH3BBa9omqVTwYGdUyvtT7JE/t03CSQXXcrnKTPArY/PfrukRujC00fuZklOObcViX/ss0RPT
 9PJLTpbFjEp8QVdIk+jNRM54EiWKuoIzHN8BJL+e78pZD6TlC4dguS9uvJkjyXWA0tOjyEvm4Qf
 +l2iqhJI68RhBqWq5g4=
X-Google-Smtp-Source: AGHT+IGEfyIdX6unHq/LDiz7LGjEJf+sJVzSRCt0VhAG+ZXKY4y9hw+Kj5IVB/uXfNYCj3KV7UQ8IQ==
X-Received: by 2002:a05:6122:1e05:b0:518:a261:adca with SMTP id
 71dfb90a1353d-51a36db37c0mr1753419e0c.8.1734519623082; 
 Wed, 18 Dec 2024 03:00:23 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-519eb6fc69esm1132507e0c.37.2024.12.18.03.00.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 03:00:22 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85c4e74e2baso1506828241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:00:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVYMstMbpEN1VBS75ZJgUKmkgbAf6N16P6yU1FkYbbeFdgna4Y9V8VcdKsKVnmcJzVMmoyFqiSM6U0=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32ca:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4b2ae7774demr1552774137.15.1734519622627; Wed, 18 Dec 2024
 03:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
In-Reply-To: <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 12:00:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Message-ID: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>, bluescreen_avenger@verizon.net, 
 Caleb Connolly <caleb.connolly@linaro.org>, Petr Mladek <pmladek@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
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

On Wed, Dec 18, 2024 at 11:14=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > On Tue, Dec 17, 2024 at 3:46=E2=80=AFPM Jocelyn Falempe <jfalempe@redha=
t.com> wrote:
> >> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> >>> On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redh=
at.com> wrote:
> >>>> drm_log is a simple logger that uses the drm_client API to print the=
 kmsg boot log on the screen.
> >>>> This is not a full replacement to fbcon, as it will only print the k=
msg.
> >>>> It will never handle user input, or a terminal because this is bette=
r done in userspace.
> >>>>
> >>>> If you're curious on how it looks like, I've put a small demo here:
> >>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> >>>>
> >>>> Design decisions:
> >>>>     * It uses the drm_client API, so it should work on all drm drive=
rs from the start.
> >>>>     * It doesn't scroll the message, that way it doesn't need to red=
raw the whole screen for each new message.
> >>>>       It also means it doesn't have to keep drawn messages in memory=
, to redraw them when scrolling.
> >>>>     * It uses the new non-blocking console API, so it should work we=
ll with PREEMPT_RT
> >>>
> >>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> >>> Unfortunately I don't see any kernel messages, and my monitor complai=
ns
> >>> about no signal. Does this require special support from the driver?
> >>
> >> It doesn't require a special support from the driver. But as it is the
> >> first drm client other than fbdev emulation, I'm not surprised it's
> >> broken on some driver.
> >> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus =
6
> >> (Qualcomm SDM845/freedreno), without requiring driver changes.
> >>
> >> Do you have a serial console on this device, to check if there is
> >> something in kmsg?
> >
> > Nothing interesting to see. Compared to the fbdev client:
> >
> >       rcar-du feb00000.display: [drm] Registered 2 planes with drm pani=
c
> >       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> >       rcar-du feb00000.display: [drm] Device feb00000.display probed
> >      -Console: switching to colour frame buffer device 240x67
> >      -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer de=
vice
> >
> > I did verify (by adding my own debug prints) that the code does
> > get to the success case in drm_log_register().
> > Thanks!
>
> Maybe you need to add console=3Ddrm_log to your kernel command line, so
> the kernel will actually use this console.

Thanks, that does the trick!

Note that I do not need to specify any console=3D kernel command line
parameter for the fbdev console.

With

    CONFIG_VT_CONSOLE=3Dy
    CONFIG_DRM_CLIENT_DEFAULT_FBDEV=3Dy

I see all console messages on both the emulated fbdev console and on
the serial console by default.

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
