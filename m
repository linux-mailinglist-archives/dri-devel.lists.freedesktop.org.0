Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED4365547
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD33289B96;
	Tue, 20 Apr 2021 09:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452E89B96
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:28:09 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id s184so8640158vss.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMXR5NQJZ/zyREq4gm4h4LkxWtsvke6Z9ueVpoC66Zk=;
 b=Nz6ISywRwNT6EoYMYNg4sLWzLQBuF8ZjgvdV1Nz77PKunaoWXmWWmuwoQQ4mkovK2s
 WYCC2ts8Ug2Ihn6i4VXJCBInfSOjxeupu+eHN1JyTDRD+TZViqgQJI0vVd1oCSlHoC5S
 nfO7sdE9aY++DcrkJCXlbvLi5HOFXeuUBF+ynBPSwEDLjjp/gYW6Hh6VNjvtXti63L6j
 AWrZ/KqExYgVIzUBKCU0p2Ecu3q2sFgkBrzh6IkNxE00/qveXYANrQs3vDs05ejVpXEc
 8mN7oXQcvYPA6IMIAmQQBwFMbCZH6quGicw9BEyGtGYO6kxotAE8EtH+iDyzBGgaCWnv
 z7/Q==
X-Gm-Message-State: AOAM530gRRtUUshnbIdnEyf90boCgSq1LRZzuswvJJ8a4/bT+Qx1uvBw
 mp6oe+AoS9Mi3gtDdGnj74A4jZO8I6rNxQjkHY8=
X-Google-Smtp-Source: ABdhPJxXCrtc8Ti44j0CBaEgS9Yup/jZMkfMjkpOEktA0jLylcqYZKFpMvHeIXPqlR4Qmizx3hBjdSAdP7Uy7plFlRQ=
X-Received: by 2002:a67:f503:: with SMTP id u3mr17536399vsn.3.1618910888327;
 Tue, 20 Apr 2021 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
In-Reply-To: <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Apr 2021 11:27:57 +0200
Message-ID: <CAMuHMdX=0H3LHP5Yme9tpN4JnmpJcnF=SQN8bc=4XTd-X6AVTg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Tue, Apr 20, 2021 at 11:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > >
> > > .... if support for 8-bit frame buffers would be added?
> >
> > Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> > shouldn't be a big thing, but the latter is only really supported by the
> > overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> > works, and we keep that illusion up by emulating it in kernel for hw which
> > just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> > best.
>
> Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
> (depending on display resolution).  We could pull off the same trick
> here and convert to rgb332 (assuming we can program the palette with the
> color cube needed for that).  Wouldn't look pretty, but would probably
> work better than expecting userspace know what color palettes are in
> 2021 ...

Yeah, I already had a similar idea for Amiga HAM ;-)

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
