Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FE1CE507
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE896E550;
	Mon, 11 May 2020 20:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D346E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:05:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y24so20828918wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XztYQXBixp5s82L0WWC6qp9IZ4Y06Rf5uIeF2PBjKIo=;
 b=oGHsySRnHWX8KDym2HiydtBmWd3ug4cExOmkeDGQvpRVVZIhzGMUjzHN0PXJRk93L3
 RIrrgTwq2JX1+q1iBZEdwDi6j2sj+clK15zHnqWZ+KY017JxEbRUQ18WfjzM1m/4h6Oj
 ncCf7DykeRJL1GQ52P69MEw6EGS7lOwsScF6/sb1ybv6lmL1t/RoZpP0vpo3/D965g9H
 veiZrAnfvCXtC8hGysAlobnetvySoalAuQfRh+3PTUNFClDyT8kE6N+DKkNPnb6sLjvK
 ecI+TyQCy9rK+OGSsMkY/iCc9XOsULeYUP7jIZJnTH2Y8hLitxDrE2/UyaC0gTceUS2c
 e0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XztYQXBixp5s82L0WWC6qp9IZ4Y06Rf5uIeF2PBjKIo=;
 b=toFMC7IPSCUQxmd00BolGY13xodTZr967uo4xn4FrksZwk4+nSWA4tYGn71HYcPun4
 v9iWlkIdiU01knBKj1hSptUHCRFVr1o0xv/IKhyaTjwB/TT1kxqtmNHK2OsYJUVM29yU
 n/ny5eEOZY/3/xkbMqSHgoCE4QvotXLEGZjF1omIZfKBDY0FWMjI7wpk4MalA3pFWn4V
 dvfqVZvYwJ6ABx60XQXhzPUgiyFqaSqxgat4pUcLCWB/Yz+S88CuIi71D/H4fLAlAyrB
 hk132NrjBF0qZ6M3DgsA2gwsPVFH8Ac7kQeFohIZ/l22DqGbwZqCY9hvygHeuCW8Vggt
 NArA==
X-Gm-Message-State: AGi0PuZVh0oXLXwGAAciW7eaoTcC52jUqlkSyTIuj4mjBv+/4RwTExyI
 Y3Jl4MpmiKRCiVDpDYW3SrwTVVlxanBY0I/sq83jCw==
X-Google-Smtp-Source: APiQypIpmmn7lkPwz0YOrFjLIUkzWDHl5pg/endEdcdl8vTVkayfTrCcC1z0sR9jUSxe7upvJvfSkteGpRjSB9KoRBg=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr33461651wmh.39.1589227550836; 
 Mon, 11 May 2020 13:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
In-Reply-To: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 May 2020 16:05:39 -0400
Message-ID: <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:02 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Christian!
>
> > Well let's face it AGP is a total headache to maintain and dead for at least 10+ years.
> >
> > We have a lot of x86 specific stuff in the architecture independent graphics memory management
> > to get the caching right, abusing the DMA API on multiple occasions, need to distinct between
> > AGP and driver specific page tables etc etc...
>
> AGP isn't exclusively used on x86 but there are also a lot of PowerPC desktop machines (Apple
> PowerMac, Pegasos etc) that employ AGP graphics.
>
> > So the idea here is to just go ahead and remove the support from Radeon and Nouveau and
> > then drop the necessary code from TTM.
> > For Radeon this means that we just switch over to the driver specific page tables and
> > everything should more or less continue to work.
> >
> > For Nouveau I'm not 100% sure, but from the code it of hand looks like we can do it similar to Radeon.
> >
> > Please comment what you think about this.
>
> I would be against such a move as AGP graphics is still used by people running the powerpc
> and ppc64 Debian ports on their vintage hardware [1].
>
> I have also CC'ed the debian-powerpc mailing list so that other users can voice their
> opinion.

Note there is no loss of functionality here, at least on radeon
hardware.  It just comes down to which MMU gets used for access to
system memory, the AGP MMU on the chipset or the MMU built into the
GPU.  On powerpc hardware, AGP has been particularly unstable, and
IIRC, AGP has been disabled by default on radeon on powerpc for a
while.

Alex

>
> Thanks,
> Adrian
>
> > [1] https://cdimage.debian.org/cdimage/ports/2020-04-19/
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
