Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28963AB94
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 15:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A9110E1ED;
	Mon, 28 Nov 2022 14:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113610E1EB;
 Mon, 28 Nov 2022 14:51:02 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id v81so11791197oie.5;
 Mon, 28 Nov 2022 06:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BAhpgkWtb27JDtIM4e/PkuR3x636EOTJL8nQoLk+Uhk=;
 b=aigTvy3KjmwUBIq0FoMsCdBItS1XdrRKOAbMxw7ewkc2VCZfNFguHxQKiTuxzWu2OQ
 AQxLCqlxs0omEV1wNs8UfkdONjhXlKt50noagFx9LowJa4e1Xr/cyN7vwq0thqduIpLm
 Up98KjvAMe2th89U0lQW5b15akHC6vrVbkxnLsazr6vT0AiGOeVJ/fENaLv7FdRk3VrE
 47cy4IqLT5aGNyrXsZNZNEyNERAfRWionWXldyvsQYbp0aVVIxWSClr5hhDJpsVJr/wb
 uKURK246AMNyXiEQWpH9yWy+OM/C6qIkBfDxggLAHzgs31ZWGefd1uBpox04/mfQ8yPY
 HZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BAhpgkWtb27JDtIM4e/PkuR3x636EOTJL8nQoLk+Uhk=;
 b=0vUj/Ccn2usnaQ+bVUp7xbHD1zEp/Wh7MsGjP+mG/cYpVGfNID+WmIYwiqYY58g4wB
 7NsVCRw/lq2fmDS2KZk3xRWbsOhMNo7CzccIjLxgDfKM9YxlqwHEpTf086tjmv171+I/
 AMVoFKS7jTIBAMJ2RhY1CF/mrb2uDUhtnivEslzLhh5OACAPZQ5cPHDMQ1RQd8klix/P
 gpylazf18KQ4Ss4XEqGaP9N/Tf9VisUfJT9yWpO+VyaInvGSRjSZBR49vuwlI2uALkay
 J08pqF/22JX2MkTw9dHpULOZK2K1RMdV89k+rY1Zos7dtZa9/xWqQ6Ia5URlOSq4XWqZ
 DEfw==
X-Gm-Message-State: ANoB5pnrkbIMUUg6cJtg6NmoPst9seeMlk/ELxV/XQfIOhsD2bdKv2Ae
 XeL0orH4zdfowdXbh5VxoC1IYX3zgvXrCzKsIKwJbOnc
X-Google-Smtp-Source: AA0mqf48AL1I4hFx/jyrt29KGiP2osdLGUitNy8F+Ahyzm5aat9b+ux3F5Il1tvN4v12K94/a0sulMbnkSB7dnCRdfU=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr14834951oig.96.1669647061772; Mon, 28
 Nov 2022 06:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
In-Reply-To: <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Nov 2022 09:50:50 -0500
Message-ID: <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
To: Mikhail Krylov <sqarert@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>
> On Mon, Apr 25, 2022 at 01:22:04PM -0400, Alex Deucher wrote:
> > + dri-devel
> >
> > On Mon, Apr 25, 2022 at 3:33 AM Krylov Michael <sqarert@gmail.com> wrote:
> > >
> > > Hello!
> > >
> > > After updating my Linux kernel from version 4.19 (Debian 10 version) to
> > > 5.10 (packaged with Debian 11), I've noticed that the image
> > > displayed on my older computer, 32-bit Pentium 4 using ATI Radeon X1950
> > > AGP video card is severely corrupted in the graphical (Xorg and Wayland)
> > > mode: all kinds of black and white stripes across the screen, some
> > > letters missing, etc.
> > >
> > > I've checked several options (Xorg drivers, Wayland instead of
> > > Xorg, radeon.agpmode=-1 in kernel command line and so on), but the
> > > problem persisted. I've managed to find that the problem was in the
> > > kernel, as everything worked well with 4.19 kernel with everything
> > > else being from Debian 11.
> > >
> > > I have managed to find the culprit of that corruption, that is the
> > > commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713 on the linux kernel.
> > > Reverting this commit and building the kernel with that commit reverted
> > > fixes the problem. Disabling HIMEM also gets rid of that problem. But it
> > > also leaves the system with less that 1G of RAM, which is, of course,
> > > undesirable.
> > >
> > > Apparently this problem is somewhat known, as I can tell after googling
> > > for the commit id, see this link for example:
> > > https://lkml.org/lkml/2020/1/9/518
> > >
> > > Mageia distro, for example, reverted this commit in the kernel they are
> > > building:
> > >
> > > http://sophie.zarb.org/distrib/Mageia/7/i586/by-pkgid/b9193a4f85192bc57f4d770fb9bb399c/files/32
> > >
> > > I've reported this bug to Debian bugtracker, checked the recent verion
> > > of the kernel (5.17), bug still persists. Here's a link to the Debian
> > > bug page:
> > >
> > > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=993670
> > >
> > > I'm not sure if reverting this commit is the correct way to go, so if
> > > you need to check any changes/patches that I could apply and test on
> > > the real hardware, I'll be glad to do that (but please keep in mind
> > > that testing could take some time, I don't have access to this computer
> > > 24/7, but I'll do my best to respond ASAP).
> >
> > I would be happy to revert that commit.  I attempted to revert it a
> > year or so ago, but Christoph didn't want to.  He was going to look
> > further into it.  I was not able to repro the issue.  It seemed to be
> > related to highmem support.  You might try disabling that.  Here is
> > the previous thread for reference:
> > https://lists.freedesktop.org/archives/amd-gfx/2020-September/053922.html
> >
> > Alex
>
> So, is there any progress on this issue? I do understand it's not a high
> priority one, and today I've checked it on 6.0 kernel, and
> unfortunately, it still persists...
>
> I'm considering writing a patch that will allow user to override
> need_dma32/dma_bits setting with a module parameter. I'll have some time
> after the New Year for that.
>
> Is it at all possible that such a patch will be merged into kernel?

Unless someone familiar with HIMEM can figure out what is going wrong
we should just revert the patch.

Alex
