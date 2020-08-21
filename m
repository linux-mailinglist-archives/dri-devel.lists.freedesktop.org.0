Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22624D622
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 15:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774926E9A0;
	Fri, 21 Aug 2020 13:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A21E6E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:32:59 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i26so1427982edv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 06:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVAJruVtlIIPLpuA3hbccuJr1vYSLyUwXIfdQpDJjsc=;
 b=aCOw+Z+AiJKdUel3SS6htw0ZWssV3iWDvWCa1spy5j6qITuXk/g0JqN8MnXHg7sJNK
 8116yGHatl/JS7VztkywOGfjrMRQe3u2hggrU2EIIpG7LkuZFtG6QoGSzWE7BaXm0d8q
 lCqabD2k+JGHOZPhE3sW+4abRNq1M/XeVmyKZJN0eXaAt+FCiveGT+zUvbmdk0TacOgK
 gUDyXg8hNrpABaEIw11/cECkL9jdW/ZRPZD0X4ee6eWF09JfrBFXPWmBBrugXCucmAQd
 3ADV88i+gh6bDfOVQIu2Oeb2j6yGta6LkRZbhI4X1Yqnp6KAzDYlMyfBnw8MvKoecZfY
 T8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVAJruVtlIIPLpuA3hbccuJr1vYSLyUwXIfdQpDJjsc=;
 b=Q/vs/rReyPOStXY08IaUnEopiw3uKtixxRvb6jNlBx39PTd7FTNXJ8J64wTGignMdM
 vH41mrb//FMoxRBffl3/tVIT3oH7r4p0XIlx1yTTGKTiB1Q+2MvxUl8iXlprUpyPuSZ9
 PpwQcH/QsWTCF99nSLGg3uATnhH7FnifeibBIwvsom1mdCFysd29Pg9ZXp4OIIAPAhes
 Qj6rVyutoPOOBjklTWiZqle0DKvQalk3PwB2H5WwDn2hDpxMcZJq5xX/c2SlqHW8jmMy
 7eY5ZGMgAaGYXR4X4+k9iJkYP0kA6PjQGs03H7e8x02pGGB8WsxvCAHeqEbUdvlOG5D6
 AcJg==
X-Gm-Message-State: AOAM533g4uXpjJO1I7FZm2w40tuk59+imxp3HgSJPM24jpuVK9vekLje
 TmbgH1+CxQ5vJCPTIQC63+fK9kbzbqO6dI6q/sTCVQ==
X-Google-Smtp-Source: ABdhPJwVZCnvu3sdGEmOqT1+7uCoiKqOYJUUsILF1DXq9koCeq4Zib7iy1KeJbFDrACiBGBpr69v3ieicEgSogOOP+8=
X-Received: by 2002:aa7:c251:: with SMTP id y17mr2891000edo.13.1598016777851; 
 Fri, 21 Aug 2020 06:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <1940005.XIBaf5lNV5@jeremy>
 <CAAEAJfBxJLyS-EaE82c4Oq3-EFongDmAtYnPtfMLKLL3KAiFxA@mail.gmail.com>
 <DABBE9E8-E94F-4F13-BB33-5DD67CAD9DFA@goldelico.com>
 <1857880.I5TKlsx52r@jason>
In-Reply-To: <1857880.I5TKlsx52r@jason>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 21 Aug 2020 10:32:46 -0300
Message-ID: <CAAEAJfDU=rvQ4aEAbBrveLigUjoYFGhLZJ7PsE_WpoOYxaDqdg@mail.gmail.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: Paul Boddie <paul@boddie.org.uk>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Aug 2020 at 19:49, Paul Boddie <paul@boddie.org.uk> wrote:
>
> On Thursday, 20 August 2020 10:19:45 CEST H. Nikolaus Schaller wrote:
> >
> > Yes, it works!!!
>
> It still doesn't work for me. I still get "Input not supported" from my
> monitor. It is a DVI monitor connected via a HDMI adapter, but EDID probing
> works and, as I noted previously, the HDMI/LCDC can be made to work (and
> obviously did work in the 3.18 kernel).
>

This means the dw_hdmi encoder driver is still not good enough
to support your adapter. I haven't yet compared v3.18 vendor
with our version, but I'm afraid that the dw_hdmi stack has
probably changed quite a bit, so a comparison will be difficult.

The natural debug path for me would be to checkout v3.18,
connect your DVI monitor and make a dump of all the
dw_hdmi registers, then make the same dump for our
mainline kernel -- making sure we are comparing the same
mode.

> I used my usual recipe for kernel compilation:
>
> ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make ci20_defconfig
> ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make menuconfig
> ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 uImage
> ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 modules
> ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- make -j8 dtbs
> sudo sh -c 'INSTALL_MOD_PATH=nn ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- \
>             make modules_install'
> sudo sh -c 'INSTALL_PATH=nn/boot ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- \
>             make dtbs_install'
> sudo cp arch/mips/boot/uImage nn/boot/
>
> This was with a snapshot archive made from the following changeset:
>
> b911b4883bfe4f7fa753ac2ff42b25fa6b3055e2
>
> I downloaded it from here:
>
> https://gitlab.collabora.com/linux/0day/-/tree/jz4780-drm-hdmi-v5.9-rc1
>
> (I was going to clone the repository late last night, but it was taking a long
> time and I also didn't want to clone everything yet again.)
>

If you want to avoid cloning the same things over and over
you can use git-clone --reference. And if you want to checkout
just a single branch, git now has --single-branch.

For instance, (assuming a torvalds/ local repo):

git clone -b letux/jz4780-hdmi-v4 --single-branch
git://git.goldelico.com/letux-kernel.git --reference torvalds/ letux

> > There are some unexpected things related to CONFIG settings on my setup
> > (maybe missing modules) but for the first time I can see the boot log on the
> > panel.
> > > This needs some more investigation, but seems at least a good start.
> >
> > Yes it is!
> >
> > I can now git diff the code and the CONFIG.
> >
> > So it seems we have indeed a breakthrough.
> >
> > Thanks to all who did contribute (even behind the scenes in the DRM
> > subsystem), Nikolaus
>
> Before trying this new branch, I did try and tidy up the branch I had been
> working on. I didn't notice all the changes and the new ingenic-drm-drv.c
> file, having assumed that not much would have changed in the DRM driver.
>
> Nevertheless, my attempts at integrating the different branches can be found
> in the paulb-jz4780-ci20-hdmi-5.9-rc1 branch, mentioned earlier.
>
> It would be nice to reconcile the JZ4780 support with the evolving upstream
> support, accommodating the extended descriptors and the extra register usage.
>

I think that's already done in the patches I've cleaned up.
The only thing left to check is plane offset and overlay enablement.

> Paul
>
> P.S. I noticed a few problems with the 5.9-rc1 branches such as powering down
> not actually removing the power and, in my own branch, networking not working
> reliably (or maybe even at all), with the tedious progress indicator never
> terminating in the boot sequence. So, once again, it is another case of half a
> step forwards and about three steps back.
>

Life (and kernel) is like this: sometimes you need to take three steps
back to make a jump forward :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
