Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AF2C3A97
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3800F6E850;
	Wed, 25 Nov 2020 08:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C05A6E7D7;
 Wed, 25 Nov 2020 01:06:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n132so1550177qke.1;
 Tue, 24 Nov 2020 17:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=44pFzPZOXy9WMyxuVZ4PJwmHwfPvC91GWhNSdpkVBXk=;
 b=PLHqMkuVQ6uE1aGa3jPkk7oL0rd2+0aQGjbXwXCM1BqpOEf5R6gUmrb1tTrj75nDjD
 aG6VHTDP2JdODJ/e29C1vfEMjWhTPlycM3mNfL2JW5BhFtstP0di/Kwb3XYGnsRoKRp5
 7FVJzAE2cPEDrpLIYX3jwoIfPno8H9ArdOwpkc9HelZA+M7Eq52S4RmPBHauFrK9tfW3
 8wrBLWN/Mq7Fl9GTodmgwwudDuqrVUSiSILvkeQCl7qFs3/IjbI7/AG3m5iLRdEEw+2H
 RzsA5+EdKfz0DIt5iJKomdRqiV67cH8ZcnWPF2PnARf/ANxCrT7QZJCkY0VU2DrQ9d/L
 oW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44pFzPZOXy9WMyxuVZ4PJwmHwfPvC91GWhNSdpkVBXk=;
 b=qTrX6VNxko+W8fOmAWKwicYaYontSNxZdASRHqaKX7rJ9CpVUzERvFtA42K9l7cM14
 ya9w+Dg+wgjfId1XnPUVGIAJ+VHDCudhwUdfh/4GQzv238W29WS7rVdN0bErOG4LxBWM
 cco3IDBQiurZwCGzB0QzqX4C+YgQA3laeb3ZHcqrbwPax48LKpjvNWV/vgjPCaPzyRRW
 dkKNQoH3g6jL9vQbBR/swrJA9gF8W2nh7+AHjaqkp7zSx8j2DWLknjdneP1+DOjQHfkU
 Hb4JlD2P5B8PlIvhIL2EZQFx8uxMHrxRjbvZN6yOYmfpuQbHAkWHfwUe6WCsPibkcFtS
 CDzQ==
X-Gm-Message-State: AOAM532PuXLzydXiiisiMW7NLxS7dlQp/TbdsJwJS5RH1IGmFa2ik4sS
 M0DzKUwKkudHWSR5/P/0wO7CPzauSvKGDWzcJJ8=
X-Google-Smtp-Source: ABdhPJxG2tW9FM1fAqThCcvqKAPI/OeE1R4V2//A8ePZuSketjr0yKUxoxj6t2hcKlYt9sKRSewQcSyhG/w+5cGdzqU=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr1046305ybi.22.1606266360499; 
 Tue, 24 Nov 2020 17:06:00 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook>
 <alpine.LNX.2.23.453.2011250859290.15@nippy.intranet>
 <CANiq72nUt57u5DG9rH=DB0DzQH7U6-QbG-2Ou+PyCY=p=_Ggag@mail.gmail.com>
 <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011251022550.14@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 02:05:49 +0100
Message-ID: <CANiq72m2kGxSy2E9jgYE4_xRV6h9rFqiJP25KXs_5ObYnH_nmA@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
To: Finn Thain <fthain@telegraphics.com.au>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
 target-devel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mmc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
 linux-atm-general@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-watchdog@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, Linux-MM <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 12:53 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> I'm saying that supporting the official language spec makes more sense
> than attempting to support a multitude of divergent interpretations of the
> spec (i.e. gcc, clang, coverity etc.)

Making the kernel strictly conforming is a ship that sailed long ago,
for several reasons. Anyway, supporting several compilers and other
tools, regardless of extensions, is valuable.

> I'm also saying that the reason why we use -std=gnu89 is that existing
> code was written in that language, not in ad hoc languages comprised of
> collections of extensions that change with every release.

No, we aren't particularly tied to `gnu89` or anything like that. We
could actually go for `gnu11` already, since the minimum GCC and Clang
support it. Even if a bit of code needs fixing, that shouldn't be a
problem if someone puts the work.

In other words, the kernel code is not frozen, nor are the features it
uses from compilers. They do, in fact, change from time to time.

> Thank you for checking. I found a free version that's only 6 weeks old:

You're welcome! There are quite a few new attributes coming, mostly
following C++ ones.

> It will be interesting to see whether 6.7.11.5 changes once the various
> implementations reach agreement.

Not sure what you mean. The standard does not evolve through
implementations' agreement (although standardizing existing practice
is one of the best arguments to back a change).

Cheers,
Miguel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
