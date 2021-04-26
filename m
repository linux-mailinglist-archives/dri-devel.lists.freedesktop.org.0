Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F7536B9A1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2826E1D7;
	Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE3D6E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id h18so2170605vsp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 12:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Z9q2q+by+XoICx7O5bq4s0qjl0Ui3wq+DFED5QpgnI=;
 b=hXBr1kVTJMXFkKuzfzhfndDGW3lXBiOnV7XdRrsPbh1iDPz06p4h7+6pY2rXreofzx
 zt9kCg2vMuD9+7yYDm2VjY7vtk4+XOZe5JFyUC3VwBasfX2jKLiFMxz+ywD4pr7lzjnz
 0xMaVSCe59sSsAtr6tS6d3eojpCjxeWkwxF9WCGsF3HDUtElVDsOjeT2XdoK8+haw5ri
 SwUE/mn0Gf3eIRAqaIqne43aUdY6c8Ctu7TQGq/c4HELSrcJGwrpOhEyhriiX23zixk9
 O+YR3J0q7kdHCOyGe+4n8KN6aheN9jwot47U20quxm4SgkMscJyw/MY9XK04aQsdGmb7
 NtVA==
X-Gm-Message-State: AOAM532hpvueLuMsCEMUldM8YAd0cPAvYjTDew7VfhPTwyjWgIs4mz6r
 AmGGc5F6SuB926ctVlS43tBIyse856JS/BdqvxM=
X-Google-Smtp-Source: ABdhPJzFyKjW1O90Y0MBq25L4BoxSoh1eregzeBg4Y17kP7i6270tN+MexYhXLWOJPYKWPcRKKJuueNLlzEA80hUIcA=
X-Received: by 2002:a67:8745:: with SMTP id j66mr14878201vsd.18.1619463940025; 
 Mon, 26 Apr 2021 12:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
 <CAMuHMdX=0H3LHP5Yme9tpN4JnmpJcnF=SQN8bc=4XTd-X6AVTg@mail.gmail.com>
 <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
In-Reply-To: <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Apr 2021 21:05:28 +0200
Message-ID: <CAMuHMdW6HQCZYXS3N+xh4xPQqdKix9dP3vcMU49NJ95179BR9g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: bluescreen_avenger@verizon.net,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Emil Velikov <emil.l.velikov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Apr 26, 2021 at 2:22 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.04.21 um 11:27 schrieb Geert Uytterhoeven:
> > On Tue, Apr 20, 2021 at 11:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>>>> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> >>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >>>>
> >>>> .... if support for 8-bit frame buffers would be added?
> >>>
> >>> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> >>> shouldn't be a big thing, but the latter is only really supported by the
> >>> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> >>> works, and we keep that illusion up by emulating it in kernel for hw which
> >>> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> >>> best.
> >>
> >> Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
> >> (depending on display resolution).  We could pull off the same trick
> >> here and convert to rgb332 (assuming we can program the palette with the
> >> color cube needed for that).  Wouldn't look pretty, but would probably
> >> work better than expecting userspace know what color palettes are in
> >> 2021 ...
> >
> > Yeah, I already had a similar idea for Amiga HAM ;-)
>
> I vaguely remember that HAM mode uses some crazy format where pixel
> colors depend in the values of their neighbors. (?) How complicated is
> it to write a conversion from RGB to HAM?

Not that complicated, unless you want to do it Good & Fast ;-)

https://en.wikipedia.org/wiki/Hold-And-Modify

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
