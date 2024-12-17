Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4909F4D75
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B66810E987;
	Tue, 17 Dec 2024 14:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745F610E987
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:20:07 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85bc5d0509bso1035908241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734445205; x=1735050005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXPkplgvFfsbNTNn42otx4BMRNpKHlQWJuCfcyWJJJc=;
 b=L+MRBPs/9dNCQCleAv0vKvfpd6EcBriZ9de9fHTakKmA2YGHnqlgfghFeZ+43z2AOL
 OgRDVvVyOnUF4vLjx4rQtOzjQco3EqgdvYXU1bTYQ/R3Ggqjpmg9ASfZIrIJh4n1GwVA
 eg9ZtDIC4mtuGr1ln/O/ycRtrTcYjTsZ8tw8w8iOvmg2mfcVxJrEal0SAvTOaHb+KAhJ
 QrRLPNOsWMHu+H+Y4mhzeR53vzKvcgu9rXyd87E4kGChBcfb7QvO4cIR0uUPmIdqCXpE
 kf12WGapoa95iWJ9f9ABNRZLcu4I4rgxBy4+d7r77fQcqrNxk3u0ZBaH9WTtllGec3dI
 A7gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfmNRfg7w/zRVhgp5F/5WP6l53+xlyOXo9H2BTGmBuULbqZfN3muqf6rik4ITx3BcU6Lv7ITU9J74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbe2i8qj4uQ6JvzhDWQiJHPHM2gXVce9ww+qinBbOh6r6ZNSrW
 e7YcDmZblMshlszsvD/qRO9pKiujYmy6cRoJVchu1gaZVyyNxdCS4CUkV/qy
X-Gm-Gg: ASbGncvFCmKBRIb6qqcUvHRwmEBT1NShIU0ZIdlN8j6v0qEFshfp57W/6L4s2Ao6Mhf
 neWRHPOEofA9FbHSMI2Qdo3ICNgJKkBIimbBNIxs+26mXjd6biOxghxQ5Y14cafsRKzzkLh57TQ
 rlvPUgrsneIl/d8G0E/7+xaWty+i0qKR/Pn3OyWdzZELOEkPXEv5RFV0w4nEW7V6Vo6EQs0VFD7
 nA+m/ImWQWWGK2sljDY4PIS/Ks7nuFvr72y67B34plonguswyWjBNJi513shKxJykP5Ge83Ql3v
 Uj32JWYsS7Vh6U26TcY=
X-Google-Smtp-Source: AGHT+IE15eiD37MOmF90tQEaI0GpRLfdQDGn2o1rf4ND5b0Ju+M4CV2YYwE+ETM8dcEzrwiXRIIRFw==
X-Received: by 2002:a05:6122:906:b0:518:859e:87ae with SMTP id
 71dfb90a1353d-518ca463e04mr14960421e0c.7.1734445205269; 
 Tue, 17 Dec 2024 06:20:05 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-519eb72a077sm891185e0c.43.2024.12.17.06.20.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 06:20:04 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-4afde39e360so1376343137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/3MtpTvG2N4fC20WI07Vn8atLRbMfS1IDHqYvS9tgjusCMJAlUdcPYzbgBD1vHBU+a5E889kd26E=@lists.freedesktop.org
X-Received: by 2002:a05:6102:c0d:b0:4af:de38:dff7 with SMTP id
 ada2fe7eead31-4b25d6d83a1mr19193213137.0.1734445204670; Tue, 17 Dec 2024
 06:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20241204160014.1171469-1-jfalempe@redhat.com>
In-Reply-To: <20241204160014.1171469-1-jfalempe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 15:19:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
Message-ID: <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
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

On Wed, Dec 4, 2024 at 6:41=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:
> drm_log is a simple logger that uses the drm_client API to print the kmsg=
 boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better don=
e in userspace.
>
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>
> Design decisions:
>   * It uses the drm_client API, so it should work on all drm drivers from=
 the start.
>   * It doesn't scroll the message, that way it doesn't need to redraw the=
 whole screen for each new message.
>     It also means it doesn't have to keep drawn messages in memory, to re=
draw them when scrolling.
>   * It uses the new non-blocking console API, so it should work well with=
 PREEMPT_RT

I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
Unfortunately I don't see any kernel messages, and my monitor complains
about no signal. Does this require special support from the driver?

    CONFIG_DRM_CLIENT=3Dy
    CONFIG_DRM_CLIENT_LIB=3Dy
    CONFIG_DRM_CLIENT_SELECTION=3Dy
    CONFIG_DRM_CLIENT_SETUP=3Dy
    CONFIG_DRM_CLIENT_LOG=3Dy
    # CONFIG_DRM_CLIENT_DEFAULT_FBDEV is not set
    CONFIG_DRM_CLIENT_DEFAULT_LOG=3Dy
    CONFIG_DRM_CLIENT_DEFAULT=3D"log"

Switching to fbdev gives a working display, as before:

    CONFIG_DRM_CLIENT_DEFAULT_FBDEV=3Dy
    # CONFIG_DRM_CLIENT_DEFAULT_LOG is not set
    CONFIG_DRM_CLIENT_DEFAULT=3D"fbdev"

Thanks!

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
