Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6133D478A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 14:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881DE6E082;
	Sat, 24 Jul 2021 12:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653F06E082
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627128667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6AcUZFHd8G5i76Vd2O5qx5HOAivGVNtt24z6TdHQF1o=;
 b=epNu0UjSa2Naa7AER7Zbs1JPjnA77O/hYw5Lf1a0C22rm/SOvU+fW9HVdjm7MfmS4a9FTJ
 zNGvewInVYrtc/M8ZpMSI8FOEbvlFuMYzDCHRbAqSAP3zwVkLhudCzSBEfe6RNWLOtHQS7
 b94DBLfx7hig+5M9VJiHMYyWwrVyhBM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-InE13HqaOA69gxB4DZPTjw-1; Sat, 24 Jul 2021 08:11:06 -0400
X-MC-Unique: InE13HqaOA69gxB4DZPTjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so1510516wrg.23
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 05:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6AcUZFHd8G5i76Vd2O5qx5HOAivGVNtt24z6TdHQF1o=;
 b=EVTV8/w0LpSuayLdNVLIk0k3iAxaKorUnMSci8aj7zqljmg9vxWk3WXnfXKQViWj+e
 tO8w4e4GINPSL8Y3ZpAENawW1jGRXoG6H7uXzRLpZ5YY/gZ83B/P0rMvPrgSXyObQekr
 S9A+9cofmc3hfNJiZBgnQgX3hyti4HH9+ExPjjcVZH5dFotasP7AqStWeEQebisRhpkD
 vAXMXjiZjjLftVP8RhA/n48xlltJJGAxCK9sBlR6wFTkssaN0l+xpPNxhiTlnKv/IHDT
 SL7v3rcjUu/IQCmazxuk6LIC0faQz3ifH4OKq2fKQE4Ui7u07UGQ4Yj3YO/HtmZv0J5O
 hTFQ==
X-Gm-Message-State: AOAM531RWQzNSXd25lzondS6FE9G/d+ZVLZAN/bt7lHPgttt71FJsK3f
 WwJfiU0Ev8b7jZ4BiqGbMUt/0mDMaRgkk4H9qmZAmVKBnJQgUcNxyiKF1bDlLzK62Mq//CT4P8X
 Tgq4yZATCXE5b/eDdO4cb4jbcOR2VZnSQlqopmugvwpBD
X-Received: by 2002:a5d:6644:: with SMTP id f4mr9516235wrw.177.1627128665146; 
 Sat, 24 Jul 2021 05:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1U/Pv5yVb884gxpjWlzIwo4rESJ/20Yl1+UEyfV86RbeZzOoyylb1wUn4yvDX+I0fEFDwDPAH06HqLqn5dkc=
X-Received: by 2002:a5d:6644:: with SMTP id f4mr9516213wrw.177.1627128664906; 
 Sat, 24 Jul 2021 05:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
In-Reply-To: <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 14:10:53 +0200
Message-ID: <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
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

On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > In the past this only led to compilation issues. Also the small amount of
> > > > extra .text shouldn't really matter compared to the entire nouveau driver
> > > > anyway.
> > > >
> > >
> > > >         select DRM_TTM_HELPER
> > > > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > > > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > > > +       select BACKLIGHT_CLASS_DEVICE
> > > > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> > > >         select X86_PLATFORM_DEVICES if ACPI && X86
> > > >         select ACPI_WMI if ACPI && X86
> > >
> > > I think the logic needs to be the reverse: instead of 'select
> > > BACKLIGHT_CLASS_DEVICE',
> > > this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
> > >
> > > We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> > > process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
> > >
> >
> > I think the problem with
> > "depends" is that the user needs to enable backlight support first
> > before even seeing nouveau and I don't know if that makes sense. But
> > maybe "default" is indeed helping here in this case.
>
> In general, no driver should ever 'select' a subsystem. Otherwise you end up
> with two problems:
>
> - enabling this one driver suddenly makes all other drivers that have
> a dependency
>   on this visible, and some of those might have a 'default y', so you
> end up with
>   a ton of stuff in the kernel that would otherwise not be there.
>
> - It becomes impossible to turn it off as long as some driver has that 'select'.
>   This is the pretty much the same problem as the one you describe, just
>    the other side of it.
>
> - You run into dependency loops that prevent a successful build when some
>    other driver has a 'depends on'. Preventing these loops was the main
>    reason I said we should do this change.
>
> In theory we could change the other 85 drivers that use 'depends on' today,
> and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> selected by the drivers that need it. This would avoid the third problem but
> not the other one.
>
>       Arnd
>

I see. Yeah, I guess we can do it this way then. I just wasn't aware
of the bigger picture here. Thanks for explaining.

