Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB37E4FAFEA
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 21:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2910F83B;
	Sun, 10 Apr 2022 19:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21E310F83B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 19:52:45 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id h19so12839103pfv.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXW0wU6sL+xTUffIXy2C7Ev5QLBh8RLDYuS2RioYZVw=;
 b=FA9BfN7WVP72n6YbEgBrcwEbcdcbxrPgQ49kuHo1RUOXKHWgqEiwV1TbvWccxvIPQ2
 yaaPFBH/SrkGDRJmYkugiD11gY6pWLVQIt9FiDNv98WX6iaEmW7vEePNnVCvMpQkDF7+
 BH8RqmRZK4HIcxhnaticcFapCzIAoSg98PLugFXkyXdg+SCBcNZCkxnN4tvj/mZKldtr
 70jONUbyUQdT/d6kxvbGaK6ARNE5gZsfsZeK7cncnxXRRLH9M6UCDeJN28ytfigcKpIx
 4oNVWBP/i3RC1wZ58Kzh9RHsz9qFJnm+Nl5qbSVD4lf9SM+IJzjtX7axrhcs+s6q2Z5p
 LUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXW0wU6sL+xTUffIXy2C7Ev5QLBh8RLDYuS2RioYZVw=;
 b=jZ6HmebLUqDGd9r0Wl5lZAYzP5dpHlmWHgX2wptyWnM9PVSISKO3Zci6d5QSb7XnA8
 Wm9QXsxhubbA0jEfTNWm47HlvNzDQgixe6YwZoM6CVe+ouIxGdVavw+bNYGqvSDeR1Mm
 A+jPeK9D31R4nRBkJK+zlhCAp4cc8DeKkIelgIelLB538BWxZg1n1R/1lUN8RjBxZhtO
 Wsk+OAcG9MIOeg34x0M3JADkHAanOilTK+3OeG9y3KPJRrY8WniUfeSovP/8RiaYOnhW
 C+qMQ79rwsAEyZsOKO07GN+MDZLMyOvR8dzKS8T/bRFDgjlruQS2ms64vf2xIo+TOC7K
 bA+w==
X-Gm-Message-State: AOAM5304ymZyFToeK9RTaTTEAFM7HZ7yvelYNigzDpoX53185tl/sObh
 2bgStcI9+oDUv2LfZb+il9vkyBJ0ZglDil8U8So=
X-Google-Smtp-Source: ABdhPJzBEeA12N7T+usRtAyQktRWwo1cbNQ6FobBLbugkem4fWgOJf7iPkSK2Grrf1UVniEG+fFlKVPzXcT9+OTGzNI=
X-Received: by 2002:a63:4f46:0:b0:382:56b2:f8 with SMTP id
 p6-20020a634f46000000b0038256b200f8mr23829251pgl.90.1649620365218; 
 Sun, 10 Apr 2022 12:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
 <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
In-Reply-To: <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 10 Apr 2022 21:52:33 +0200
Message-ID: <CAMeQTsaM363n5F=--xhSTayFqOMNvjTQjqz_aEhby6i-KRVBKQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: James Hilliard <james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 10, 2022 at 9:40 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > Select the efi framebuffer if efi is enabled.
> > >
> > > This appears to be needed for video output to function correctly.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > Hi James,
> > EFI_FB is its own driver and not needed by gma500 to drive its
> > hardware. What makes you think it's required?
>
> I wasn't getting any HDMI video output without it enabled for some reason,
> I assume it is doing some sort of initialization needed by gma500
> during startup.

Then it sounds like you might just be using EFI_FB and not gma500. Can
you provide the kernel log with drm.debug=0x1f set on kernel
command-line.

What machine is this? I've seen very few gma500 devices with UEFI.

>
> >
> > -Patrik
> >
> > > ---
> > > Changes v2 -> v3:
> > >   - select EFI_FB instead of depending on it
> > > Changes v1 -> v2:
> > >   - use depends instead of select
> > > ---
> > >  drivers/gpu/drm/gma500/Kconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> > > index 0cff20265f97..a422fa84d53b 100644
> > > --- a/drivers/gpu/drm/gma500/Kconfig
> > > +++ b/drivers/gpu/drm/gma500/Kconfig
> > > @@ -2,11 +2,13 @@
> > >  config DRM_GMA500
> > >         tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> > >         depends on DRM && PCI && X86 && MMU
> > > +       depends on FB
> > >         select DRM_KMS_HELPER
> > >         # GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
> > >         select ACPI_VIDEO if ACPI
> > >         select BACKLIGHT_CLASS_DEVICE if ACPI
> > >         select INPUT if ACPI
> > > +       select FB_EFI if EFI
> > >         help
> > >           Say yes for an experimental 2D KMS framebuffer driver for the
> > >           Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
> > > --
> > > 2.25.1
> > >
