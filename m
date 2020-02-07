Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E0155C6D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDA76FD33;
	Fri,  7 Feb 2020 17:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCD506E4CA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 00:10:26 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 01A8327E6B;
 Thu,  6 Feb 2020 19:10:21 -0500 (EST)
Date: Fri, 7 Feb 2020 11:10:21 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
In-Reply-To: <CAAdtpL5Cz5YGKZVfbA=X8qMtP7jDc0G7igSj3EB=PfazM5JoDg@mail.gmail.com>
Message-ID: <alpine.LNX.2.22.394.2002071054180.13@nippy.intranet>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
 <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
 <alpine.LNX.2.22.394.2002060829410.8@nippy.intranet>
 <CAAdtpL5Cz5YGKZVfbA=X8qMtP7jDc0G7igSj3EB=PfazM5JoDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-1984420675-1581033946=:13"
Content-ID: <alpine.LNX.2.22.394.2002071105540.13@nippy.intranet>
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 James Hogan <jhogan@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>, dri-devel@lists.freedesktop.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1984420675-1581033946=:13
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.LNX.2.22.394.2002071105541.13@nippy.intranet>

On Fri, 7 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:

> On Wed, Feb 5, 2020 at 11:18 PM Finn Thain <fthain@telegraphics.com.au>  =
wrote:
> > On Wed, 5 Feb 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On Sun, Feb 2, 2020 at 3:41 AM Finn Thain  <fthain@telegraphics.com.a=
u> wrote:
> > > >
> > > > This patch resolves these compiler errors and warnings --
> > > >
> > > >   CC      drivers/video/fbdev/g364fb.o
> > > > drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
> > > > drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first us=
e in this function)
> > > > drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifie=
r is reported only once for each function it appears in
> > > > drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of =
function 'fontwidth' [-Werror=3Dimplicit-function-declaration]
> > > > drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first u=
se in this function)
> > > > drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first u=
se in this function)
> > > > drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of =
function 'fontheight' [-Werror=3Dimplicit-function-declaration]
> > > > drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
> > > > drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (fir=
st use in this function)
> > > > drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (firs=
t use in this function)
> > >
> > > 18 years unnoticed...
> > >
> >
> > More likely, it was noticed by those without the skills or time to get=
=20
> > it fixed upstream.
> >
> > Those with the hardware skills and platform knowledge to be affected=20
> > by an obscure bug aren't necessarily also capable of fixing a kernel=20
> > bug, sending a patch upstream and getting it past code review.
> >
> > Getting a patch into the Linux kernel is itself a lot of work, unless=
=20
> > you've had years of experience with that constantly changing process=20
> > (which varies significantly between subsystems).
>=20
> I see, I'm not custom to kernel workflow.
>=20
> > Kernel developers are only human and do accidentally introduce=20
> > breakage in their work (as contributors) while ironically (as=20
> > reviewers) they raise the bar for random fixes from users not versed=20
> > in the 10000+ lines of Documentation/process/*.rst
> >
> > Broken code does not mean zero potential users or zero frustrated=20
> > users yet I often hear kernel developers disingenuously claim that it=
=20
> > does. They have an incentive to make that claim and often there's=20
> > no-one reading the mailing lists to push back.
>=20
> But broken code is also bad example of code. The removed code is still=20
> buried in the git tree.
>=20

Some bugs may never be noticed and yet everyone assumes that they are=20
present (hence "defence in depth" and all of the complexity that entails).

My complaint was really about broken code being used as a rationale to=20
remove additional code (whatever its quality).

For example, some maintainers would say, "18 years unnoticed... don't stop=
=20
at g364fb_cursor(), remove the entire driver".
---1463811774-1984420675-1581033946=:13
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

---1463811774-1984420675-1581033946=:13--
