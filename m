Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F46323BDA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 13:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5F6EA88;
	Wed, 24 Feb 2021 12:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678F96EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 12:24:51 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f20so1759673ioo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lEheRsNzM6A5FEWZatOgOB06QRFT+dQp09C3//0tehA=;
 b=K9gUQlO70bOvYAFnPmmIzKwJHE9HGNz+lWqbfQIlQWkzlGyzkx7MbH3/LFlirAIr/X
 bpG20WropIRA8MpivD+QF/avfmwtisGDteD02UJS2MzfMZfRxAOSmJ5d85g3g3lcc2DI
 lTRl3R/CfKUm8OgtY2NSlGLYGds6Qu3110gfGsnrwdZP4D/dpwF2foK1/9vGs6/vDdPy
 uKfLjvJPUNxFU8rSREBxjw+D+hmqExmky5mWO9qp1woaR3TUU+pWzINCPzo3IqRhqzqC
 LI4bNUUAPtNF14cAvcHoBVsc+uJu8NTHu43jGeR1f2W2QVLJUK7pQ7Z8DIrJtiTy5pwu
 fnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEheRsNzM6A5FEWZatOgOB06QRFT+dQp09C3//0tehA=;
 b=OPIwW/94TVAoG3z3lJ/x7c17eBW+3tCcJszb+nwtIiR7tCJdGkrvAof8NVsTpflo38
 QSB5B136TvjMqmBdpBYGIoZoR3V/yGA8ZzZH+uT+q8rE2t0Um+4pu3T6ySNQMNsgJqze
 taO1UmWC7LAaylJXwuUeSANE3wmx3TyM5HBFHV29grgs3OYRmn6B7VARAkiYjvJXQUDE
 BoAwxAoHl4GbCm/o7rwCgDWQF5XL10Q5pQO8e+I0zSUvN4xK5hPOCbTrcRnMTdvnEo5X
 HivgVGPV6ctw6rEX3oHa/VawUIm3fkwY0/3hCvvaAp4Z6OmNGbN098niT4O5zu0N33SY
 Fngw==
X-Gm-Message-State: AOAM532OSXIeb3dTZgxvoNAprzflIjCswC84q25Ae4i5PRIaXU/97/9d
 bEsaOexh2d6NfuGKzI0SpaI4jAdPyJNAk3bcsYk=
X-Google-Smtp-Source: ABdhPJw1YoO4n1Zvk2QmR2jR1rnYahYdNc8+KYgpVxIiue3tnwfavAneBeKh7jJvbI//p38rQ99AqrfKhDFd8tvLPg0=
X-Received: by 2002:a6b:5818:: with SMTP id m24mr2267566iob.144.1614169490732; 
 Wed, 24 Feb 2021 04:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20210220230248.320870-1-ztong0001@gmail.com>
 <ea1c5ff3-0b24-71c9-7a44-08b184c4854d@infradead.org>
 <CAA5qM4D0y9-gL7AAMQvtwrfJC_UvSTB5_S5PX3qkYSxHRUS-Qw@mail.gmail.com>
 <CAMuHMdWM5z-vKRwhCgJHjU-S_L0WR=avmDN-b8dN87b=rgi08w@mail.gmail.com>
In-Reply-To: <CAMuHMdWM5z-vKRwhCgJHjU-S_L0WR=avmDN-b8dN87b=rgi08w@mail.gmail.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Wed, 24 Feb 2021 07:24:40 -0500
Message-ID: <CAA5qM4B1R4cA6=sDhWaVo59A=0WWR_wv5Ckp1O8giv7+pUuqRQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: pm2fb: avoid stall on fb_sync
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,
IMHO - QEMU is irrelevant here. since I can do passthrough --
in fact -- many drivers do use timeout in .fb_sync
e.g. i810fb_sync(), nouveau_fbcon_sync(), sm501fb_sync() etc..
I believe the correct behaviour should be a timeout wait instead of
waiting indefinitely.
- Tong

On Wed, Feb 24, 2021 at 6:35 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Tong,
>
> On Sun, Feb 21, 2021 at 1:05 AM Tong Zhang <ztong0001@gmail.com> wrote:
> > On Sat, Feb 20, 2021 at 6:33 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > On 2/20/21 3:02 PM, Tong Zhang wrote:
> > > > pm2fb_sync is called when doing /dev/fb read or write.
> > > > The original pm2fb_sync wait indefinitely on hardware flags which can
> > > > possibly stall kernel and make everything unresponsive.
> > > > Instead of waiting indefinitely, we can timeout to give user a chance to
> > > > get back control.
> > >
> > > Is this a real problem or theoretical?
> > > Does someone still use this driver?
> >
> > I currently have this problem on my machine.
> > I have submitted a revised patch -- which includes the console log.
>
> Your machine is "QEMU Standard"?
> Can this happen on real hardware, too, or is this a deficiency in QEMU,
> which should be fixed there?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
