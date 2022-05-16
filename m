Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4FD52B327
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D691C113E51;
	Wed, 18 May 2022 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342110FAED;
 Mon, 16 May 2022 13:02:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bx33so17993939ljb.12;
 Mon, 16 May 2022 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=60C5EQyO2T48GTlpM/XypyB68W2P/VEkAPHolHclkJg=;
 b=S//lOK7f5zpU11etE8XQk50xBn7GIZdGYfhkBt+zGE5pXvHO2qcIbo9+Th67AlO3lw
 H5eG/RsTNGTqSDg8HWKsMoMO1rm2KUP7VZcM9bmNTKxduDZqXpSMRN3+bbsNq+M74NUn
 fDWBAkT4m/FiZ7LwexcImrRyezNE7uD842z6KRuffOIXV0nqT6vRPSlzi3eponbYytNM
 WfTUJb2WqgpyrgNJxeOFH6MGy5NrwBr1rmXI+UoL41TrLjWJeE/3BcPjf+ZIkS8JVqcy
 G9q9jHx0YCfcYc/Ibk/UNdZxHhFV5sGko4SrUbgoqfkTvi6KaK+iz2l97oh9oRQoqVmp
 jKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=60C5EQyO2T48GTlpM/XypyB68W2P/VEkAPHolHclkJg=;
 b=h6YZhiRNVIKnq4X8jwYx81jWxCuz+pUddS8n3E5XAKhNpBxCt6bQVyg/JVzPpzWjl6
 JjqZZv/8/hgpXVXp6vn5TNyFIoH8waI39eyd+lLFUi/jgWY7UcPOhAhuOrgIULEEJedm
 HbBW54jW3ZMl1O6kaeNHgg1ECOf4xd019P0hp4qAvITOTU6Pp9lD/bZF7JX9UERYvu+6
 OX57r6S2nqdHOKn9a214Y1cjg7l5C+ElmiGfWTjLAueGi8b84gZua+UCgCXgFiSmQUVc
 bdOR9qAQEGP3fl/iWgOz46FCqOvQXfngu9j2j4TRBy4BzEd1x6F+l10OU6fA8XfoRmWc
 mvzw==
X-Gm-Message-State: AOAM5321Ljegi7JXKJC6jXbel7YWeAzo9h7d7tVXfsVOEXYyDEbTnQ92
 YUNPv7W/4fZbfVJAwdQFdg==
X-Google-Smtp-Source: ABdhPJwggDyQhFVR6ey4FrdTpHtsnAyMJmTacQVypvuLOQfHzXMOAbzh2yth9FspqO+qFDsL3e6eng==
X-Received: by 2002:a05:651c:b12:b0:250:6417:5415 with SMTP id
 b18-20020a05651c0b1200b0025064175415mr10942076ljr.478.1652706118864; 
 Mon, 16 May 2022 06:01:58 -0700 (PDT)
Received: from sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a19f00d000000b0047255d211c1sm1294561lfc.240.2022.05.16.06.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:01:57 -0700 (PDT)
Date: Mon, 16 May 2022 16:01:58 +0300
From: Mikhail Krylov <sqarert@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
Message-ID: <YoJLRq69Kg1ljXUj@sqrt.uni.cx>
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oruiwsc5TIw6jg2D"
Content-Disposition: inline
In-Reply-To: <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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


--oruiwsc5TIw6jg2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 01:22:04PM -0400, Alex Deucher wrote:
> + dri-devel
>=20
> On Mon, Apr 25, 2022 at 3:33 AM Krylov Michael <sqarert@gmail.com> wrote:
> >
> > Hello!
> >
> > After updating my Linux kernel from version 4.19 (Debian 10 version) to
> > 5.10 (packaged with Debian 11), I've noticed that the image
> > displayed on my older computer, 32-bit Pentium 4 using ATI Radeon X1950
> > AGP video card is severely corrupted in the graphical (Xorg and Wayland)
> > mode: all kinds of black and white stripes across the screen, some
> > letters missing, etc.
> >
> > I've checked several options (Xorg drivers, Wayland instead of
> > Xorg, radeon.agpmode=3D-1 in kernel command line and so on), but the
> > problem persisted. I've managed to find that the problem was in the
> > kernel, as everything worked well with 4.19 kernel with everything
> > else being from Debian 11.
> >
> > I have managed to find the culprit of that corruption, that is the
> > commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713 on the linux kernel.
> > Reverting this commit and building the kernel with that commit reverted
> > fixes the problem. Disabling HIMEM also gets rid of that problem. But it
> > also leaves the system with less that 1G of RAM, which is, of course,
> > undesirable.
> >
> > Apparently this problem is somewhat known, as I can tell after googling
> > for the commit id, see this link for example:
> > https://lkml.org/lkml/2020/1/9/518
> >
> > Mageia distro, for example, reverted this commit in the kernel they are
> > building:
> >
> > http://sophie.zarb.org/distrib/Mageia/7/i586/by-pkgid/b9193a4f85192bc57=
f4d770fb9bb399c/files/32
> >
> > I've reported this bug to Debian bugtracker, checked the recent verion
> > of the kernel (5.17), bug still persists. Here's a link to the Debian
> > bug page:
> >
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D993670
> >
> > I'm not sure if reverting this commit is the correct way to go, so if
> > you need to check any changes/patches that I could apply and test on
> > the real hardware, I'll be glad to do that (but please keep in mind
> > that testing could take some time, I don't have access to this computer
> > 24/7, but I'll do my best to respond ASAP).
>=20
> I would be happy to revert that commit.  I attempted to revert it a
> year or so ago, but Christoph didn't want to.  He was going to look
> further into it.  I was not able to repro the issue.  It seemed to be
> related to highmem support.  You might try disabling that.  Here is
> the previous thread for reference:
> https://lists.freedesktop.org/archives/amd-gfx/2020-September/053922.html
>=20
> Alex

Yeah, I tried to disable HIMEM, and that indeed fixes the problem, but
it leaves me with less than 1G of available memory which is undesirable.

--oruiwsc5TIw6jg2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmKCS0UACgkQzNfc0dbm
rQCE+wf+Nk/njJF/rmMJNqtBZ0OyIs5LhN6Z3A22x9DBRRPSNnA2rf8b28krBObd
gZnuvtSZHHZR/x2f8NH24YYv8tjGoZMa+GYjx+Kmr9tRTMBjY/LHEnaHbdLgO9/i
668oeJvD2zXpjVZpH4rPv1PenzYqRSWMtjyYpCFLqBgRlxLiQ6zO9jrPKwtm63ya
F+pWkFRTnFAOS7d3QAPlOtX9MYwpeQaRYluTWuqp48MpaI/pVUJfIDna/tc6HcNQ
WpT2L9S26FjGosfmXUfolY5EVHJKI34JFp9zScFdpeL5dzlI9NQ5jKxKqjGepW2B
sOVD3hNUBtslhyPsxS77yD7bae9AoA==
=beJX
-----END PGP SIGNATURE-----

--oruiwsc5TIw6jg2D--
