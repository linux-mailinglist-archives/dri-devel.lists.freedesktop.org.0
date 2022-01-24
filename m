Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F66498852
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 19:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D6010E841;
	Mon, 24 Jan 2022 18:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5851510E84E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 18:27:44 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id u6so32795095uaq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SqmZ9f0RWasCXhWlrSx2cD/L8oAGqPWnnkFJLcnjm4=;
 b=S9hvyZ8NCBacpXnik+ugQ2eZET5ChLOI/yoIStxwFIYW/Dv97uS+HhBFul4ymbSrm4
 THSO8eL35NgmnGbwc6I1zDbMe5kpmjjTpRv2ygYevyyq1a6uwNxpZ85FmVlNrlykCjlR
 4OBloGA9Td/SithXkXONlCSZkhk4NLzSZ7fq9TkJZBNhebejEuOOxNvIXyve59wN4m58
 anT1o0cL7UmAMeQVJsjIhdNAvqj3p8OFOAZcQTA70t7uCubjPxde5cynspn7t8wF/z7h
 gfYl7pz36Vsbx4rX1bDPPamDInff4846asEisCh9ILKbnPP5tO6eJ1Am+Wnm5xh5XtbZ
 euzg==
X-Gm-Message-State: AOAM531KKJefiHLG0JvncmD/hE83Yo0Jmo/gi39k4T1qGNOxbey82A1T
 Jg1sc7CA+iiYDHf8bsL7NGF1Y8ls5WFTiA==
X-Google-Smtp-Source: ABdhPJyVwkBKBIQCe8PODWkymglho90xeXLz4WRuDKLS1LGM5MqqZptVxDC7zLhcYyg1BQhkPMYmUw==
X-Received: by 2002:ab0:2014:: with SMTP id v20mr5823780uak.96.1643048863042; 
 Mon, 24 Jan 2022 10:27:43 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id e17sm285625vsl.21.2022.01.24.10.27.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:27:42 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id v192so10748836vkv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:27:42 -0800 (PST)
X-Received: by 2002:a1f:1b46:: with SMTP id b67mr3291125vkb.20.1643048862175; 
 Mon, 24 Jan 2022 10:27:42 -0800 (PST)
MIME-Version: 1.0
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
 <87zgnz71ic.fsf@x1.stackframe.org>
 <Yegwl/rwRhjROxcy@phenom.ffwll.local>
In-Reply-To: <Yegwl/rwRhjROxcy@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 19:27:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBFgo6ryq=h8e6mZZmnxnChZVP924yeX+C-KwghKx3tA@mail.gmail.com>
Message-ID: <CAMuHMdVBFgo6ryq=h8e6mZZmnxnChZVP924yeX+C-KwghKx3tA@mail.gmail.com>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
 Hamza Mahfooz <someguy@effective-light.com>, Helge Deller <deller@gmx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel et al,

On Wed, Jan 19, 2022 at 4:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jan 13, 2022 at 10:46:03PM +0100, Sven Schnelle wrote:
> > Helge Deller <deller@gmx.de> writes:
> > > I may have missed some discussions, but I'm objecting against this patch:
> > >
> > >     b3ec8cdf457e5 ("fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)")
> > >
> > > Can we please (partly) revert it and restore the scrolling behaviour,
> > > where fbcon uses fb_copyarea() to copy the screen contents instead of
> > > redrawing the whole screen?
> > >
> > > I'm fine with dropping the ypan-functionality.
> > >
> > > Maybe on fast new x86 boxes the performance difference isn't huge,
> > > but for all old systems, or when emulated in qemu, this makes
> > > a big difference.
> > >
> > > Helge
> >
> > I second that. For most people, the framebuffer isn't important as
> > they're mostly interested in getting to X11/wayland as fast as possible.
> > But for systems like servers without X11 it's nice to have a fast
> > console.
>
> Fast console howto:
> - shadow buffer in cached memory
> - timer based upload of changed areas to the real framebuffer
>
> This one is actually fast, instead of trying to use hw bltcopy and having
> the most terrible fallback path if that's gone. Yes drm fbdev helpers has
> this (but not enabled on most drivers because very, very few people care).

That depends on the hardware, and the balance between CPU-to-RAM,
CPU-to-VRAM, and GPU-to-VRAM bandwidths, and CPU and GPU performance.

When scrolling, the fastest copy is the copy that doesn't need to copy
much.  So that's why fbcon supports (or supported :-( many strategies:
scrolling by wrapping, panning, copying (either by CPU or by (simple)
GPU), re-rendering (useful for a GPU with bitmap expansion).  So forcing
everybody to render into a fully cached shadow buffer and upload changed
areas is not the silver bullet.

Whether text output is rendered immediately or not is completely
orthogonal to this.  While timer-based updates would speed up printing
of large hunks of text (where no one actually reads what was printed at
the top), that would have almost no impact on actual interactive console
work: it may still take 0.5s to scroll the screen if you press "enter"
when your cursor is positioned on the last line.
BTW, implementing timer-based updates would make measuring real-world
performance more difficult, as we would have to use a different
benchmark than "time dmesg" ;-)

Both Daniel and Thomas said: fbdev is not suitable for modern hardware.
Fine, we do not debate that, and do not want to prevent you from using
DRM for modern hardware.  Then please accept us saying that DRM (in its
current form) is not suitable for other types of graphics hardware.
Still, even modern (embedded) hardware may have small low-color
displays.

For the last +5 years, we've been pointed to the tinydrm drivers, to
serve as examples for converting existing fbdev drivers to drm drivers.
All but one of them are drivers for hi-color or better hardware, thus
surpassing the capabilities of lots of hardware driven by fbdev drivers.
The other one is an e-ink driver that exposes an XRGB8888 shadow frame
buffer, and converts that in a two-step process, first to 8-bit
grayscale, second to 1-bit monochrome.  If that is considered a good
example, should I be impressed?
Compare that to other subsystems boasting about zero-copy...

Furthermore, for a contemporary e-ink device like[1], the shadow buffer
would consume 10 MiB.  Of course this device has 4 GiB of RAM, and quad
Cortex-A55 CPU cores, but not all systems have 10 MiB to spare...

[1] https://linuxgizmos.com/rk3566-based-pinenote-e-ink-tablet-ships-at-399/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
