Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8285886DF9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826B71124D0;
	Fri, 22 Mar 2024 14:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O2QyX7mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3D31124CF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:07:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76711CE182A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAB6C43399
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711116426;
 bh=eKO658AL3F5DOuhQKhr7cAlTjMtwXpXxxurCkZB2FNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O2QyX7mfGzvKMsUK79O6ySdQELV7SBpgJg+yHLLWmwVs2yTqW6Vr9izyhGyob7i39
 OvU4hNxWEKgRIjDp0WAqcT15Iyix3D9LBB18XexXvbxqbeIb23JLW4UYsmd05r1efQ
 y9OZsFSm4g8I+vO4M8cy2XjncdqT++UiFdOVxf2QsRvV9wQf+5K6HyGHuRUhhfrsX/
 jXlKdbMwTRIGYOzoXHbX71QBT6vpPPi38xFJA8Jk/Kh5SffVJY7J+qLQtxXONLW0hP
 mPYZjsfwgKCm6jyce9QUKvibf76i3q3aS9qNvTd04lAvb/eNsbpey6lChfBQmNb4O8
 vVyjBuJ0tc2fg==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so2644674e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 07:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpileUbtnrpWmqx4Rvv/tbjYraO1nUGt5x2vEJTWVwsJGQe9580gZeDHKyJ4dAtIGWf3ASovqnQSBj3W8NPeTAzxb7X0kmKGAUd05EsoT+
X-Gm-Message-State: AOJu0Yz7JRTVLyfO5iz1L6LGlMyL4FnGiaSapnhZlJsx3oCOzbGiLzUZ
 uSuV8/9IL9B3ZXsXsq0JQg/WOV0TBj/NwJkdnIykKwE0txYB0DWgRqszJOPHlYB1aLF3R4B6B8Q
 o1o8GfZpl+BTw6Ggox0FBYxfZKfo=
X-Google-Smtp-Source: AGHT+IF+D8NauJA8vbP2Y23lOXX3Rf/WSVqqUwrqAKBwoaOFJM2RYF2pRjf4c9CmtYqTG43X2+X4qH+7w3OWWu/WZKU=
X-Received: by 2002:ac2:5bc6:0:b0:513:df00:8ab5 with SMTP id
 u6-20020ac25bc6000000b00513df008ab5mr1685938lfn.27.1711116424389; Fri, 22 Mar
 2024 07:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H5gFqd3z4Etzuz_q3Hs6A4BP0yzJ69GgMcJzJBRdOwGSA@mail.gmail.com>
 <5f52d611-6ec9-429c-aabf-956d23a8c74d@ristioja.ee>
 <CAAhV-H4MKRXb=STOneivyHsU6o2vU=P9cQMwjRo+PKnPpJ67Rw@mail.gmail.com>
 <9608358d-14c6-4ab3-b3e4-89e166d5e17c@ristioja.ee>
In-Reply-To: <9608358d-14c6-4ab3-b3e4-89e166d5e17c@ristioja.ee>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 22 Mar 2024 22:06:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7FtWqM0LQ8fkH9ABuFRxkR2rGtGHEfx3R487hpEZoQxQ@mail.gmail.com>
Message-ID: <CAAhV-H7FtWqM0LQ8fkH9ABuFRxkR2rGtGHEfx3R487hpEZoQxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
To: Jaak Ristioja <jaak@ristioja.ee>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
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

On Thu, Mar 21, 2024 at 4:55=E2=80=AFAM Jaak Ristioja <jaak@ristioja.ee> wr=
ote:
>
> Hi Huacai,
>
> On 19.03.24 16:16, Huacai Chen wrote:
> > Hi, Jaak,
> >
> > On Mon, Mar 18, 2024 at 11:42=E2=80=AFPM Jaak Ristioja <jaak@ristioja.e=
e> wrote:
> >>
> >> Hi Huacai,
> >>
> >> Uh, no, sorry, I did not get to test such changes. From what Thomas
> >> wrote I presumed that this got fixed and no further action would be
> >> required.
> >>
> >> To speed things up I would appreciate it if you provided a patch. As I
> >> worked around the problem for the end user by changing the kernel
> >> configuration, I have long forgotten the exact details. It would
> >> otherwise probably take me a while to understand what and where you
> >> propose to change exactly.
> >>
> >> Also, do you want me to test it on some newer kernel or should I
> >> re-download the 6.5.# version sources?
> > Yes, it is better to use 6.5, you can simply change the last line of
> > drivers/firmware/sysfb.c to fs_initcall(sysfb_init), So no patch
> > needed.
> >
> > And to Thomas,
> >
> > I'm sorry that reverting 60aebc95594 solve Jaak's problem, but my
> > original problem exist (at least in 6.5), and I want to know the
> > result of the above experiment to understand what happens.
>
> Using the sources for 6.5.9 and fs_initcall(sysfb_init) instead of
> subsys_initcall_sync(sysfb_init) in drivers/firmware/sysfb.c did not
> help. The screen still went black during the boot and stayed black until
> SDDM started.
OK, then can you try rootfs_initcall(sysfb_init)?

Huacai

>
> Jaak
