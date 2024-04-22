Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74708AD2D8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09048112C7B;
	Mon, 22 Apr 2024 16:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23730112C78
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 16:58:37 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-61587aa9f4cso51789637b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713805115; x=1714409915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXJbCXLErVWaJBLn0gFAgxou+WnOajhqe1V1IAmICA4=;
 b=Jw9m/s1sQVrx//aL8JhKBN99JtYQ3m5gaAMFg/TEy2NKRjp2UcXufL9tey2hh74yYF
 ULyI/uMbWagYzGcNLYDo+VrOYF/6K5//RLZD5TtW8qSSEotNeM4XpuVh3/w15v4jnNmN
 +h/ikhW6PGZq+YlFSP07Md1yK7tTfqmBR4x4nVEWFbGIM+uWWfQB04NAgzP2bkHnpQYq
 eAjutu27cvJNKNm0xfSJW72RtqNEsYE9U52x4AWulDpjNVqpI5XTySL9P3dt7SaJByZS
 OKUN6zmNYZsUW63mAVnQHbmb4tCOgrAmYiNWyFKCBF2rCMhXxNsBPJH0PF5ci9bJVo3w
 KbUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Xj5YVBz4fz8gpwahBK3jPWwWY4SjWJ5RvSXulm143uKuKIpV93b7z5f2ICnDAyjHo4EBPLUonF4MEqoh3JROgmHxUAJaNzYKgM72JGrk
X-Gm-Message-State: AOJu0YyML2fa302eTmu4kFz1Ja8SpzoF/HpbP4IE8op4//nrjSstCcSu
 BMw1johlDn0j0k3m2vQTOLmhVy0HAY+xhnXwzj07wsg2Mr4QRpe3bMMkW7Id
X-Google-Smtp-Source: AGHT+IGRTvc7wSfQH12rwWd4fxgMOkNXLCV+vhV3hI5pz+56ewTi3t3ujFRjdn9DtS+mxGa+9Z4lKA==
X-Received: by 2002:a05:690c:6910:b0:617:d365:dc17 with SMTP id
 if16-20020a05690c691000b00617d365dc17mr11202393ywb.26.1713805114917; 
 Mon, 22 Apr 2024 09:58:34 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 k15-20020a81ed0f000000b006167f45edf9sm2014166ywm.89.2024.04.22.09.58.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 09:58:34 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-de45e5c3c68so5000488276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:58:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaoXEnVEIieMPinojILKt98gkSgnSR0hndYILvoqgOBMsrKiagHfJlQJnv3bIo/M95tmkJfL+AAJJD/j8/tIl0F7mrV159W2VZCHwuNoR1
X-Received: by 2002:a25:292:0:b0:de3:cce6:5dce with SMTP id
 140-20020a250292000000b00de3cce65dcemr11262187ybc.36.1713805113975; Mon, 22
 Apr 2024 09:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
 <ff4f9e8f-0825-4421-adf9-e3914b108da7@app.fastmail.com>
 <875xw9ttl6.fsf@intel.com>
 <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
In-Reply-To: <af6e26d1-1402-4ed2-a650-b58eae77273e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Apr 2024 18:58:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
Message-ID: <CAMuHMdXCL-gbKr6mUBPWONtRjz=X0vZQgiS=02WXXSFf67yBww@mail.gmail.com>
Subject: Re: [PATCH 00/11] drm: Restore helper usability
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kbuild <linux-kbuild@vger.kernel.org>
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

Hi Arnd,

CC kbuild

On Mon, Apr 22, 2024 at 3:55=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Mon, Apr 22, 2024, at 15:28, Jani Nikula wrote:
> > On Mon, 22 Apr 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> 2. Using "select" on user visible symbols that have dependencies
> >>    is a common source for bugs, and this is is a problem in
> >>    drivers/gpu/drm more than elsewhere in the kernel, as these
> >>    drivers traditionally select entire subsystems or drivers
> >>    (I2C, VIRTIO, INPUT, ACPI_WMI, BACKLIGHT_CLASS_DEVICE,
> >>    POWER_SUPPLY, SND_PCM, INTERCONNECT, ...). This regularly
> >>    leads to circular dependencies and we should fix all of them.
> >
> > What annoys me is that the fixes tend to fall in two categories:
> >
> > - Play catch with selecting the dependencies of the selected
> >   symbols. "depends on" handles this recursively, while select does
> >   not.
>
> I'm not sure where this misunderstanding comes from, as you
> seem to be repeating the same incorrect assumption about
> how select works that Maxime wrote in his changelog. To clarify,
> this works exactly as one would expect:
>
> config HELPER_A
>        tristate
>
> config HELPER_B
>        tristate
>        select HELPER_A
>
> config DRIVER
>        tristate "Turn on the driver and the helpers it uses"
>        select HELPER_B # this recursively selects HELPER_A
>
> Whereas this one is broken:
>
> config FEATURE_A
>        tristate "user visible if I2C is enabled"
>        depends on I2C
>
> config HELPER_B
>        tristate # hidden
>        select FEATURE_A
>
> config DRIVER
>        tristate "This driver is broken if I2C is disabled"
>        select HELPER_B

So the DRIVER section should gain a "depends on I2C" statement.

Yamada-san: would it be difficult to modify Kconfig to ignore symbols
like DRIVER that select other symbols with unmet dependencies?
Currently it already warns about that.

Handling this implicitly (instead of the current explict "depends
on") would have the disadvantage though: a user who is not aware of
the implicit dependency may wonder why DRIVER is invisible in his
config interface.

>
> >   There is no end to this, it just goes on and on, as the
> >   dependencies of the selected symbols change over time. Often the
> >   selects require unintuitive if patterns that are about the
> >   implementation details of the symbol being selected.
>
> Agreed, that is the problem I frequently face with drivers/gpu/drm,
> and most of the time it can only be solved by rewriting the whole
> system to not select user-visible symbol at all.

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
