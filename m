Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11523D47B4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 14:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE46E131;
	Sat, 24 Jul 2021 12:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09C6E125
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627131123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqP8PeLUX+bkAijbG1F91uxgBzPDOmlyO/TzLjQPs+k=;
 b=CrSSreZshwzQdPuBJyUJ6ngbhoaUb0FPIcJQ6ubUfHp6k8aoRVFFcsN8jF6EFP4ONjpmOl
 So74cngrSC9eUcfCHz/jpF+zBeYHZnuCNwKRlmNzARcBeqsgr+il9/5y7LO5yDTh0hrioC
 XRpgmrj5pH7VlqFsVWl3wbYn4YbVDfc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-OmctVk_jMcO2IzIHH5GkQQ-1; Sat, 24 Jul 2021 08:51:59 -0400
X-MC-Unique: OmctVk_jMcO2IzIHH5GkQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a05600c3b87b029024e59a633baso1508810wms.5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 05:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqP8PeLUX+bkAijbG1F91uxgBzPDOmlyO/TzLjQPs+k=;
 b=EzIOXUI7ysFbVzwVeyv64xbBPPpc326EGEfxDqMQofBuLT5DDmJWZGHXW5oYNrcrDa
 YcV7JzZ0wHWl9TkXDHNO3P7u3q18FPP5u1aM3rFxPyJeKfnYb8EAw1APOreXabGXSaVh
 KhFo3ui2goJstz3sDsFvJJEDB4lvag8sH2cOflpYs2O0CRqeHCtzd6AYXzGR6M2mK2/B
 oBqzP8xUKuDZBOcKYFj4e+f89BWR2dGnUPrXt+l7KaHmJbTdxaQMUcOoBf+gMK1J9GVr
 o4fZI380gHGxBthlxBHcj90G04+aOJeMm43x36F/kCEB63P6q8/cg4E2XZyvYNO5kQvd
 GwaQ==
X-Gm-Message-State: AOAM532yZz9gPMT9evBh9FDbClACxppL4vh2y64tH9BS2EXppE+EXUXV
 1EZUiQH/5YqigL6zShllryDKYDH65YC3FFbhVPjGHgWfPd26ojkFCKJgNQZAnp4/Gh9KSBCgvfQ
 GkMT7QWBYMg9PSVIhvcJaQY8kL4l9ENJwXfs02NzGZ/0H
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1809640wmq.171.1627131118704; 
 Sat, 24 Jul 2021 05:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkscYT672ybkBRK9AVIA/U5x33XrDVYao8PYSEV9N4uRmE4HwCi033ERdfHRxKag3E+wklUBG0a0zMSGLw8pg=
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1809620wmq.171.1627131118511; 
 Sat, 24 Jul 2021 05:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
In-Reply-To: <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 14:51:47 +0200
Message-ID: <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
To: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 2:10 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >
> > > > On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > In the past this only led to compilation issues. Also the small amount of
> > > > > extra .text shouldn't really matter compared to the entire nouveau driver
> > > > > anyway.
> > > > >
> > > >
> > > > >         select DRM_TTM_HELPER
> > > > > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > > > > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > > > > +       select BACKLIGHT_CLASS_DEVICE
> > > > > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> > > > >         select X86_PLATFORM_DEVICES if ACPI && X86
> > > > >         select ACPI_WMI if ACPI && X86
> > > >
> > > > I think the logic needs to be the reverse: instead of 'select
> > > > BACKLIGHT_CLASS_DEVICE',
> > > > this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
> > > >
> > > > We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> > > > process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
> > > >
> > >
> > > I think the problem with
> > > "depends" is that the user needs to enable backlight support first
> > > before even seeing nouveau and I don't know if that makes sense. But
> > > maybe "default" is indeed helping here in this case.
> >
> > In general, no driver should ever 'select' a subsystem. Otherwise you end up
> > with two problems:
> >
> > - enabling this one driver suddenly makes all other drivers that have
> > a dependency
> >   on this visible, and some of those might have a 'default y', so you
> > end up with
> >   a ton of stuff in the kernel that would otherwise not be there.
> >
> > - It becomes impossible to turn it off as long as some driver has that 'select'.
> >   This is the pretty much the same problem as the one you describe, just
> >    the other side of it.
> >
> > - You run into dependency loops that prevent a successful build when some
> >    other driver has a 'depends on'. Preventing these loops was the main
> >    reason I said we should do this change.
> >
> > In theory we could change the other 85 drivers that use 'depends on' today,
> > and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> > selected by the drivers that need it. This would avoid the third problem but
> > not the other one.
> >
> >       Arnd
> >
>
> I see. Yeah, I guess we can do it this way then. I just wasn't aware
> of the bigger picture here. Thanks for explaining.

yeah... that doesn't work. So the issue is, that X86_PLATFORM_DEVICES
is a little bit in the way. If I remove the select
X86_PLATFORM_DEVICES then I guess problems once ACPI is enabled, but
if I keep it, I get cyclic dep errors :/

