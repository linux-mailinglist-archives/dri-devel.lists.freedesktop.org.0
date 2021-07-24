Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABAA3D4809
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 16:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052106E086;
	Sat, 24 Jul 2021 14:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936266E079;
 Sat, 24 Jul 2021 14:05:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DF8F60E97;
 Sat, 24 Jul 2021 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627135501;
 bh=2O1ur3A24Hv4gqCkdm20xC6QD3E7j9yg0tu1vwjXVsw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bkRatRZpHOtR+aE3DhgBHrrhv1VXncOzBGwj3UsYTh+Co0fiWI8iZq7dYQIdRjI/k
 qHoeHwDdhMS+11XN1H2hCIjraTG9bMwivtXTg5L6iyAPZq9y7c9bm8fbiVE00yKJbT
 YwB7A/mNM9+9H8jBpojDeRWhnc/EnUFU1li7FhCdU/dx8dnm+wOCbP2p4RNIoBxKrV
 I4Dpwidq96afczxPMjUblawZHlbMZ43SAo5x55oJsiN97aX8c9M/xjR0m4cr59lKul
 wgqX+309KeSzv18jStZYat6uIMtUt9SAkLq9wrsBiL4vwWizEVBnN/LITyBuDUI9zl
 Od4LdFYTyYuww==
Received: by mail-wr1-f42.google.com with SMTP id b9so4550028wrx.12;
 Sat, 24 Jul 2021 07:05:01 -0700 (PDT)
X-Gm-Message-State: AOAM532WzvHgKz/zRFENzZ/+2P2WdnCE5/iwyRTrlgKyT7RIbYNzXx4t
 MQZOJlVqAaPGhfDg/qjCyBd9bpsLnk5mJcj6HNQ=
X-Google-Smtp-Source: ABdhPJyKC4hlIYKQZNSTphY0smp/aRHoZeyrOis8ju5E0a4bjJB5Up9oudDm99dXbMvpGnDd4mDyBtueOrC8gp/BxgI=
X-Received: by 2002:adf:b318:: with SMTP id j24mr10476011wrd.361.1627135499960; 
 Sat, 24 Jul 2021 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
 <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
In-Reply-To: <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 24 Jul 2021 16:04:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
Message-ID: <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
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

On Sat, Jul 24, 2021 at 2:52 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sat, Jul 24, 2021 at 2:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > - You run into dependency loops that prevent a successful build when some
> > >    other driver has a 'depends on'. Preventing these loops was the main
> > >    reason I said we should do this change.
> > >
> > > In theory we could change the other 85 drivers that use 'depends on' today,
> > > and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> > > selected by the drivers that need it. This would avoid the third problem but
> > > not the other one.
> > >
> > I see. Yeah, I guess we can do it this way then. I just wasn't aware
> > of the bigger picture here. Thanks for explaining.
>
> yeah... that doesn't work. So the issue is, that X86_PLATFORM_DEVICES
> is a little bit in the way. If I remove the select
> X86_PLATFORM_DEVICES then I guess problems once ACPI is enabled, but
> if I keep it, I get cyclic dep errors :/

Right, this is the exact problem I explained: since all other drivers use
'depends on X86_PLATFORM_DEVICES' instead of 'select', you get a
loop again. Prior to changing the BACKLIGHT_CLASS_DEVICE dependency,
nouveau was pretty much on top of everything else in the hierarchy,
changing part of it can result in a loop.

I see that there are about ten more 'select' statements that look like
they should not be there, and almost all of them were added in order
to be able to 'select MXM_WMI'.

I think we can go as far as the patch below, which I've put in my
randconfig build machine, on top of your patch. I'm not entirely
sure how strong the dependency on MXM_WMI is: does it cause
a build failure when that is not enabled, or was this select just
added for convenience so users don't get surprised when it's missing?

       Arnd

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 9c2108b48524..f2585416507e 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -3,21 +3,14 @@ config DRM_NOUVEAU
        tristate "Nouveau (NVIDIA) cards"
        depends on DRM && PCI && MMU
        depends on AGP || !AGP
+       depends on ACPI_VIDEO || !ACPI
+       depends on BACKLIGHT_CLASS_DEVICE
+       depends on MXM_WMI || !X86 || !ACPI
        select IOMMU_API
        select FW_LOADER
        select DRM_KMS_HELPER
        select DRM_TTM
        select DRM_TTM_HELPER
-       select BACKLIGHT_CLASS_DEVICE
-       select ACPI_VIDEO if ACPI && X86 && INPUT
-       select X86_PLATFORM_DEVICES if ACPI && X86
-       select ACPI_WMI if ACPI && X86
-       select MXM_WMI if ACPI && X86
-       select POWER_SUPPLY
-       # Similar to i915, we need to select ACPI_VIDEO and it's dependencies
-       select INPUT if ACPI && X86
-       select THERMAL if ACPI && X86
-       select ACPI_VIDEO if ACPI && X86
        select SND_HDA_COMPONENT if SND_HDA_CORE
        help
          Choose this option for open-source NVIDIA support.
