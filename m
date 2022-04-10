Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0BF4FAFD6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 21:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD97B10F69D;
	Sun, 10 Apr 2022 19:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A25D10F69D
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 19:40:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 c24-20020a9d6c98000000b005e6b7c0a8a8so6485602otr.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FUl8Qd04XCFc9FE72bNsCtMOh/C1JcO2xYzOigY3DOQ=;
 b=Fs8J9GIrPrs0yfIjawm/mukc4LqbyZydY837wCeZzQMbyYw+qUDHoOB4d4Dnf5BCqn
 GUoWZYgF2SzH9ngNhAo5FBXK+x28VGcmjgeDbXEiKismueXnZ98WF1olWpE4hTCpAuEI
 qCPGER4oR27g8qXzEegktq8aKzNsmo7ic1QFf+Fay2R9P9L0wJ4Izc7fp4NtUlfVRgzk
 LqsWFpcTBiMOGuLDxJqkYGcXhkWzcKa5YiS7cpTTpS457B8+Dsa62BD3AtRnNP0A5x+m
 xdJ/ZDJ2gWuA+xs0rIzU3eypS35hhU5wOSEkq4euPEtkvBDwKcbI1tdugX3ZHTdH86Ko
 6IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FUl8Qd04XCFc9FE72bNsCtMOh/C1JcO2xYzOigY3DOQ=;
 b=8KCQO/hKtMPTOJeXRTjh2wwJ86jE359V/Ny3RGuUbM739IR3N9hvZ4jkpKm9hJH4/P
 mULEKEBwKuwfQkJffdqLcwe6crLiAmrHxEc+yok/Wlhc7LfJ4MEeZYkxW7P/4Nca5wrO
 AvsyZnaASwHef9CecTYcqZMaHTJMSA+/lV9QmLFAfiuDl7/6Q7Q2Xc7WqPtZpG39XLVw
 jBENVS6LhXrxtJ8o43rnB4oGE8JJTMICutE3qLJdsxO/RHSZqLFJopFJA0lsqi2wLuoi
 N1bQrCw8JixtnFuVz4RP/GJrzzbTZzr2/AIPzHoiRdNrhCcIttG2VYnYCsPdghirwbUK
 kh6g==
X-Gm-Message-State: AOAM53128aBCFU4E4l6mtiUihf0x6iD++xJMFxRhWYtjMshQpkPoKXhV
 pV9O/3g2t90F/HOFzh/jhFzdt2dSx2Qx7b8QV2k=
X-Google-Smtp-Source: ABdhPJyYr3ENb63/2H2lblSxQ8S9ju20aVO7Z+CEMkVpE7y12Suji93mEHkrGh9UDB/WuPnf43Uh7+G/gqpgpiDV1qk=
X-Received: by 2002:a05:6830:4d3:b0:5cb:73f0:2f1a with SMTP id
 s19-20020a05683004d300b005cb73f02f1amr9833533otd.30.1649619652273; Sun, 10
 Apr 2022 12:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
In-Reply-To: <CAMeQTsanEow=zq=MuZLjMqpzybdS=5S0=JrkxuCdT7d5MxpEWQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 10 Apr 2022 13:40:40 -0600
Message-ID: <CADvTj4rBKzGFch8iVzHu1s+6=P0PcLEwoFi74xd_ormEX+2rMA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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

On Sun, Apr 10, 2022 at 1:36 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Sat, Apr 9, 2022 at 6:23 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > Select the efi framebuffer if efi is enabled.
> >
> > This appears to be needed for video output to function correctly.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Hi James,
> EFI_FB is its own driver and not needed by gma500 to drive its
> hardware. What makes you think it's required?

I wasn't getting any HDMI video output without it enabled for some reason,
I assume it is doing some sort of initialization needed by gma500
during startup.

>
> -Patrik
>
> > ---
> > Changes v2 -> v3:
> >   - select EFI_FB instead of depending on it
> > Changes v1 -> v2:
> >   - use depends instead of select
> > ---
> >  drivers/gpu/drm/gma500/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> > index 0cff20265f97..a422fa84d53b 100644
> > --- a/drivers/gpu/drm/gma500/Kconfig
> > +++ b/drivers/gpu/drm/gma500/Kconfig
> > @@ -2,11 +2,13 @@
> >  config DRM_GMA500
> >         tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> >         depends on DRM && PCI && X86 && MMU
> > +       depends on FB
> >         select DRM_KMS_HELPER
> >         # GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
> >         select ACPI_VIDEO if ACPI
> >         select BACKLIGHT_CLASS_DEVICE if ACPI
> >         select INPUT if ACPI
> > +       select FB_EFI if EFI
> >         help
> >           Say yes for an experimental 2D KMS framebuffer driver for the
> >           Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
> > --
> > 2.25.1
> >
