Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96C178BD0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10C6EAEA;
	Wed,  4 Mar 2020 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274E76EA9C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 01:26:16 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id r18so113761vso.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 17:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9pD7eTKayKhsYYKw3enP3Cpnqb80umNsGJzDDGsAM4=;
 b=hDossmiPT5ZsYw2/No/UnWGjFk7tvNCv2mxERrWzKJ2udcQ1LHSUgCZqbpDPpatSe9
 CsS5IBrOxI5WqEGk50OMnXk1qi7Cx2xaGwn8Y4MCD7gDL88s5hhhs0bmJEcU8zvNhcp0
 N26ZpQs0UrOayJeWh70iaWxvSBb0pAwI9eYzx4CmScF4n2uJqX0vbIzcCyLA2eQ/JPH7
 f3F0f/pr3vlw+oZU9kDCRH5y3Xe9HE6a5Cce2mMuDa5Wj0KbxrLs3aLSgXR2ju2HpGJa
 +duer7EVx2x02EhR1KTZpXzldgOj/IJzlYFsZ/83uEtuv68D4/4xX99ZyNwvmDf+U9zb
 Q76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9pD7eTKayKhsYYKw3enP3Cpnqb80umNsGJzDDGsAM4=;
 b=g1Ndo7HbSOo++mXegXfHQncdwmNAcs01AmA5eMyCNCdZsSSr/MhzFeNx0mPH4P4siG
 8+O3uNLr2tMUKI+BEnsB9cqcjLhSyJEpI+y7xgBchPuXInrfbyIMsIVkG67UntHqsbOt
 xMe2Wq7idHaxeKKfG6y6VY3Y9Aw+vhd4bqVD0FqxBoua8u2+hb8Zxn71Ob17NB5S0lzc
 HCsqD/G3+g8CoR6bN0zW778UAAB2fSCHOoO1X3K9JW6hQtQE59cEkhLJRGfBUVmH5V/c
 W1hgEKMlgG8VbsvzvJwPjhaZIe8Z7DOzESdBfnyF4gbOxSZVyCaFaR8hMMBtrEHY8rdW
 9ngw==
X-Gm-Message-State: ANhLgQ38aEQQCD8dNeYBhyNIXLhZuJNG+qBcA+wIMIclmRKpuwuaUdDJ
 Mst0yVvBcCmO+yiYFVXFbL/w1mTMZSHp49s4jx8=
X-Google-Smtp-Source: ADFU+vvZ3G3hJoK+Tptnc6CvVgnHyEoMJ1j7yGPugaq8jQK47/UHTWvcE0MhTcvOFbyI14sWscWpUpwzm4wI4D7mpZQ=
X-Received: by 2002:a67:f1ca:: with SMTP id v10mr471335vsm.180.1583285175252; 
 Tue, 03 Mar 2020 17:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
 <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
 <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
In-Reply-To: <20200303062437.tjoje5huts6oldrv@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 3 Mar 2020 17:18:34 -0800
Message-ID: <CAKmqyKPEtbDr1kmnyz6FtfU567xxgmxn+F=zH_h8k_m1EN9b5A@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 10:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Mar 02, 2020 at 02:14:02PM -0800, Alistair Francis wrote:
> > On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > > > The QEMU model for the Bochs display has no VGA memory section at offset
> > > > 0x400 [1]. By writing to this register Linux can create a write to
> > > > unassigned memory which depending on machine and architecture can result
> > > > in a store fault.
> > > >
> > > > I don't see any reference to this address at OSDev [2] or in the Bochs
> > > > source code.
> > > >
> > > > Removing this write still allows graphics to work inside QEMU with
> > > > the bochs-display.
> > >
> > > It's not that simple.  The driver also handles the qemu stdvga (-device
> > > VGA, -device secondary-vga) which *does* need the vga port write.
> > > There is no way for the guest to figure whenever the device is
> > > secondary-vga or bochs-display.
> > >
> > > So how about fixing things on the host side?  Does qemu patch below
> > > help?
> >
> > That patch looks like it will fix the problem, but it doesn't seem
> > like the correct fix. I would rather avoid adding a large chunk of
> > dummy I/O to handle the two devices.
>
> It's just a single handler for the parent mmio region, so we have a
> defined default action instead of undefined behavior.
>
> Patch just posted to qemu-devel, lets see what others think ...

Thanks, let's wait and see what happens.

>
> > > Maybe another possible approach is to enable/disable vga access per
> > > arch.  On x86 this doesn't cause any problems.  I guess you are on
> > > risc-v?
> >
> > I would prefer this option. I do see this on RISC-V, but I suspect the
> > issue will appear on other architectures (although how they handle I/O
> > failures in QEMU is a different story).
> >
> > Can I just do the VGA write if x86?
>
> I know ppc needs it too.  Not sure about other architectures.  I'd
> suggest to do it the other way around: blacklist known-problematic
> archs.

Argh, that is a little uglier. Let's circle back after receiving
feedback on the QEMU patch.

Alistair

>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
