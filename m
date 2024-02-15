Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36A856AA0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3410EA10;
	Thu, 15 Feb 2024 17:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aSTGtuGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0B210EA10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 17:11:08 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-296db7e258dso860039a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708017068; x=1708621868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HekLMrN4IhGy3pTTRw+JGzYq2fN0XC4oPQXiFTIzT+U=;
 b=aSTGtuGM27IpWu1ttfMsVx2IR9wYRUJavEPXpFMOIoEWMP3Rx0ZIpARbxRFn9z/pTZ
 F647PCmL9N3yM3mdmW2SKY9HuYDYJFMhRxb1FliG7HuA5/ST/tv2hAuqHjS+AOFJHouB
 DcMtoyyMkRRwlZ1UgMKv8kKGWPhLh0iPJrgBSI9GJ112iDgT2sTjyum8a7eexWYvA+r0
 EoE6zgaVAb8eurX4AnAc1ClyQb6Ma5jqdFOUMrhxN6BFYyFob1OP01uhNj6uEOkAa9F7
 CYf0AG17Sl+3k9QZy222xy4HsjFNp9muErGkY/bnpGJzxGAGm7Os+h07p4qJITTnDLTn
 GxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708017068; x=1708621868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HekLMrN4IhGy3pTTRw+JGzYq2fN0XC4oPQXiFTIzT+U=;
 b=kvoX2nZ9W0/3oOCsaluOiK3PVFqXgjA0xYgKTRRHs4fo5qMIHk0XwFdO7KLu576U9+
 Q5TNWFCebf+4xW8Pox8MkEAX6UJxyjeQyn+GcYSFGWus865sGsgXgo6cyrHlCOwBJTUy
 nJvmnWgab77TgNM7gcGJybQrCZwXkvQQYHCK4EXp5upT5gnSUjkdTzUTpPcFMQdwkwQE
 EFdsSoLDXdhoPRN25kt2Pf2tKvLhX80bCn7KEDgY7ex2lAnZfSERmKIelwJBcPAEaA8n
 O6xkWXk4rNy0X0E8upn79zrzaUeFs3qdapDL0EMt3H+w3jiLmXnbJoeRok5gPqCKT6s9
 VYbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8fZ9ebvyMq3qfUHrjZU0od++8cGcxnpjDIJ2XRHO4Cqdnp9KXGZNlssanQQC8eEwSj4i2/HDHXdceOOFizYjlVjWJWlXHxtXE2zZtGlbF
X-Gm-Message-State: AOJu0YyWmctXa0AK4YZMfnEI/d4FIFtCzQlEDKX7NveqVjJ2USgMRkfb
 pFADvUVZFdKQ0K2g03FTDEv8wt5KEcXa8x4WHDv/ix1szrsCBTFA5IcC7ElqeMciLURCnomdqfh
 ufkifYNZg0hLLy4aVXyhjfDJ3n68=
X-Google-Smtp-Source: AGHT+IF+AijmxPlf0oEgl3y8FZCm0Lp7Rq+Yck8Vi4VKLU1sZ5qsFq9HhSGu9Xq/nlmjtMYq5gCJtPAQVwKcSdWVWyY=
X-Received: by 2002:a17:90a:5e09:b0:298:9d78:b2c9 with SMTP id
 w9-20020a17090a5e0900b002989d78b2c9mr3444668pjf.8.1708017067884; Thu, 15 Feb
 2024 09:11:07 -0800 (PST)
MIME-Version: 1.0
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
In-Reply-To: <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 15 Feb 2024 11:10:56 -0600
Message-ID: <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <mripard@kernel.org>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sarah Walker <sarah.walker@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>,
 Marek Vasut <marek.vasut@mailbox.org>, 
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

On Thu, Feb 15, 2024 at 10:54=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Maxime,
>
> On Thu, Feb 15, 2024 at 5:18=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrote:
> > > Using the Imagination Technologies PowerVR Series 6 GPU requires a
> > > proprietary firmware image, which is currently only available for Tex=
as
> > > Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, to
> > > prevent asking the user about this driver when configuring a kernel
> > > without Texas Instruments K3 Multicore SoC support.
> >
> > This wasn't making sense the first time you sent it, and now that commi=
t
> > log is just plain wrong. We have firmwares for the G6110, GX6250,
> > GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at least)
> > Renesas, Mediatek, Rockchip, TI and StarFive, so across three
>
> I am so happy to be proven wrong!
> Yeah, GX6650 is found on e.g. R-Car H3, and GX6250 on e.g. R-Car M3-W.
>
> > architectures and 5 platforms. In two months.
>
> That sounds like great progress, thanks a lot!
>
Geert,

> Where can I find these firmwares? Linux-firmware[1] seems to lack all
> but the original K3 AM62x one.

I think PowerVR has a repo [1], but the last time I checked it, the
BVNC for the firmware didn't match what was necessary for the GX6250
on the RZ/G2M.  I can't remember what the corresponding R-Car3 model
is.  I haven't tried recently because I was told more documentation
for firmware porting would be delayed until everything was pushed into
the kernel and Mesa.  Maybe there is a better repo and/or newer
firmware somewhere else.

adam

[1] https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr=
/powervr?ref_type=3Dheads


>
> Thanks again!
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
