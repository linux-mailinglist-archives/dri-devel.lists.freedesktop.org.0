Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD853D4782
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 13:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487826E0EC;
	Sat, 24 Jul 2021 11:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CF56E0EC;
 Sat, 24 Jul 2021 11:56:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B13160E93;
 Sat, 24 Jul 2021 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627127791;
 bh=Or9WH1pvmZ4tR0pQ+qn4WAUGeesVrTpQna1KRhoMf9k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GqiUR56gRh7BGaa5fFrU9Rxl8M2TrB00nMB8yg+92gB0euS8Aed0u+aaA8CISahNN
 ldX9XAFfH7P3QVljI3NsDjd4x12IxCk6nqoWDzkr4kbJeiC3zg65f4k4eaV4mv5E0V
 EyxiSqXXJ2scBbb2lUBTTqk5xs7btW2uq4Tnk7us8K9t+ZwBCPm2Jla+ibbFk/YEJY
 L4aq6GOaM93UE2knqwhdJzGn6cwlXQdgBf3aNdaYHncu9Le3egmawIOQBo1/y9rXLf
 +qYpUUY76vRC2vWNwEke7kgu9AQ//0V0DY8LLZ9hk97B1dMS+mpKeWPbRbL97Kc9cr
 aQGpVKBa/GK4Q==
Received: by mail-wm1-f45.google.com with SMTP id
 j34-20020a05600c1c22b029024e75084404so2226621wms.1; 
 Sat, 24 Jul 2021 04:56:31 -0700 (PDT)
X-Gm-Message-State: AOAM531ymiw1fAuCBwAD6U5BdSJ3MbwIhtIDIetLTavaoOQNH+niGEh/
 OszbXHL0NUEV7MTSEVBfdNMmQOrSjvvpm4F58T0=
X-Google-Smtp-Source: ABdhPJxRsxDvG5h/w15BRF87kyh1VVVKr9ninZcoTF/7r4hhnZwOsQ2QlykYbGshv3uR73Sb2/2ucgam2jgOI9/0WVI=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr18402161wmk.84.1627127789904; 
 Sat, 24 Jul 2021 04:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
In-Reply-To: <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 24 Jul 2021 13:56:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
Message-ID: <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
To: Karol Herbst <kherbst@redhat.com>
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

On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > In the past this only led to compilation issues. Also the small amount of
> > > extra .text shouldn't really matter compared to the entire nouveau driver
> > > anyway.
> > >
> >
> > >         select DRM_TTM_HELPER
> > > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > > +       select BACKLIGHT_CLASS_DEVICE
> > > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> > >         select X86_PLATFORM_DEVICES if ACPI && X86
> > >         select ACPI_WMI if ACPI && X86
> >
> > I think the logic needs to be the reverse: instead of 'select
> > BACKLIGHT_CLASS_DEVICE',
> > this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
> >
> > We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> > process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
> >
>
> I think the problem with
> "depends" is that the user needs to enable backlight support first
> before even seeing nouveau and I don't know if that makes sense. But
> maybe "default" is indeed helping here in this case.

In general, no driver should ever 'select' a subsystem. Otherwise you end up
with two problems:

- enabling this one driver suddenly makes all other drivers that have
a dependency
  on this visible, and some of those might have a 'default y', so you
end up with
  a ton of stuff in the kernel that would otherwise not be there.

- It becomes impossible to turn it off as long as some driver has that 'select'.
  This is the pretty much the same problem as the one you describe, just
   the other side of it.

- You run into dependency loops that prevent a successful build when some
   other driver has a 'depends on'. Preventing these loops was the main
   reason I said we should do this change.

In theory we could change the other 85 drivers that use 'depends on' today,
and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
selected by the drivers that need it. This would avoid the third problem but
not the other one.

      Arnd
