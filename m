Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED1493944
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305F610E669;
	Wed, 19 Jan 2022 11:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAD910E9D4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642590586;
 bh=03ODW03j8YJfxEci8KnMyw4Mt/JjljIu8pLQIEO4aj0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=ED7v8mlJwz/aUHJFcbJIKUCN+roP4i0vr/Wrjj/YL+6T+QsIo46E2H2Vf81urzIE9
 KpS51FfQKNAfwA9WkwG5y/YwqwX7Ov+ffjEkbo+lVB33I7qZxRgEMqEbjSkty+u7pB
 wXGHKIQqKKxH/ITKLgMXqIOGBawmrmKp4kYnuCA0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.183.52]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1mdGnd1wRj-00fhXJ; Wed, 19
 Jan 2022 12:09:46 +0100
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Sven Schnelle <svens@stackframe.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
Date: Wed, 19 Jan 2022 12:08:37 +0100
Message-Id: <20220119110839.33187-1-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qTmYAWli9L6TudjwN284cLCRYhReB55axJIO2pVzY3b+UC4RW6t
 tnVdB2RrR5++3EZ8ZyPl9/F0oBmB2NjY9IFOawMo3lqoSpcFMLbHqCDdfg7JjEgXU6sCEb2
 E+IXcJIvoQETmXnWfhWy2ID1ZcrtV3d1M6C+S1QFjKnTC86iXCONsc4nURwo9nWMnHpka0D
 vloc84ERRzz85GQj+dbeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P/sA5GOmAxk=:Fx5fyN3Mc8+FOsPWITIPWM
 H36ut17iHqkiPDl3YdxGmi+uhyKjt1A/+iEwY1Ya+0rOXyUb40323j5XAO1VC/+sP5wBUjaKC
 iapmzojahcNlNsLBKr0YYU+iKSlp1aibERjzjbIDoJBsa+1EjI47NN3rnw8DL7OUSfOqzXu1p
 x38f7bClH92GbMbaxHh338j/LeUKH05xAwjYqjZgkvQXDcTU5tmePY4PFEfrkVJhYDIxcxVAT
 W2LcvMbMYku3/T0glVUB+aDQl9/rEk7mCWkhvUyKyVSyBFtwCdVuwxovEoPSJCkj72WZZ+naM
 JeRvTRJO/4YhCMBybM+HfAM9+foINyveEwxQl5sLFmGrWdilkC7ZZ507LPgBFquLVWjNd1TGh
 cha5y1NIXk4zOpLHK5TRR354yRv3UajE+BD+zJXT+6DIBQoCICEu41FQZoDEg5tZUhGoJTHXV
 Ntz/4U9j2NDIMFbdHFciYMzdBiIMj/TmOi5oXiWPoK5+sS6Pc6O8D28y4nnPPPhzEB8juD0Gx
 0j2ir5BCaElpe3NJMc1nRo+95OWavGLfYmOV8yiXjDvUBNRaoVwb0iGx53C2L7UELAJw/xIcL
 3LiA9CfJ60JoMPWF6x0UwoEG9i+HlUQTxdhST5yR4afHGf2jWfGQKSmTYSONE3psgwOCcTQ7s
 A0Tbyf295rZRyvpgMHIh7PdEhVTSwarEaxn3S9RwJerEjyi4lSaNpjAhMF9qKZL74pNiUmUvA
 t0ZqbsVO4EvH+GSc/vwUmIXsr8oW8oeGaNC27kNuFLbPimsTKe9vFoOHFbTwpoFPTpKDJtqQQ
 LivRBIYYCNSY1XgyLtIOWVMUax3IJPOZ9eGcI3oeLAg9r6ddVEUBQIUjWZO0sNuxd+ATV+Cf+
 bKgEKImiLC49o4yq6WM36V0kwzPU+GIwE1JPk23Emy/k0H2vuns/DvtymKATeBEJHLs/zXu9a
 1Vuffuppgf2bV60Lkj7RvxFR/d9+o3I7tltzVihUU6AFJdn6PMfJsh43wESBZKybmLrD+SEDI
 dxWRh4qYv5T+31j5lqbuZiLRmh3wk2TU/wZ5oUfF1OQgA6nKR5HUAbvxfd3Ca1UlGaGVOTuzT
 +bTK5iFf2DZk3U=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series reverts two patches which disabled scrolling acceleration in=0D
fbcon/fbdev. Those patches introduced a regression for fbdev-supported grap=
hic=0D
cards because of the performance penalty by doing screen scrolling by softw=
are=0D
instead of using hardware acceleration.=0D
=0D
Console scrolling acceleration was disabled by dropping code which checked =
at=0D
runtime the driver hardware possibilities for the BINFO_HWACCEL_COPYAREA or=
=0D
FBINFO_HWACCEL_FILLRECT flags and if set, it enabled scrollmode SCROLL_MOVE=
=0D
which uses hardware acceleration to move screen contents.  After dropping t=
hose=0D
checks scrollmode was hard-wired to SCROLL_REDRAW instead, which forces all=
=0D
graphic cards to redraw every character at the new screen position when=0D
scrolling.=0D
=0D
This change effectively disabled all hardware-based scrolling acceleration =
for=0D
ALL drivers, because now all kind of 2D hardware acceleration (bitblt,=0D
fillrect) in the drivers isn't used any longer.=0D
=0D
The original commit message mentions that only 3 DRM drivers (nouveau, omap=
drm=0D
and gma500) used hardware acceleration in the past and thus code for checki=
ng=0D
and using scrolling acceleration is obsolete.=0D
=0D
This statement is NOT TRUE, because beside the DRM drivers there are around=
 35=0D
other fbdev drivers which depend on fbdev/fbcon and still provide hardware=
=0D
acceleration for fbdev/fbcon.=0D
=0D
The original commit message also states that syzbot found lots of bugs in f=
bcon=0D
and thus it's "often the solution to just delete code and remove features".=
=0D
This is true, and the bugs - which actually affected all users of fbcon,=0D
including DRM - were fixed, or code was dropped like e.g. the support for=0D
software scrollback in vgacon (commit 973c096f6a85).=0D
=0D
So to further analyze which bugs were found by syzbot, I've looked through =
all=0D
patches in drivers/video which were tagged with syzbot or syzkaller back to=
=0D
year 2005. The vast majority fixed the reported issues on a higher level, e=
.g.=0D
when screen is to be resized, or when font size is to be changed. The few o=
nes=0D
which touched driver code fixed a real driver bug, e.g. by adding a check.=
=0D
=0D
But NONE of those patches touched code of either the SCROLL_MOVE or the=0D
SCROLL_REDRAW case.=0D
=0D
That means, there was no real reason why SCROLL_MOVE had to be ripped-out a=
nd=0D
just SCROLL_REDRAW had to be used instead. The only reason I can imagine so=
 far=0D
was that SCROLL_MOVE wasn't used by DRM and as such it was assumed that it=
=0D
could go away. That argument completely missed the fact that SCROLL_MOVE is=
=0D
still heavily used by fbdev (non-DRM) drivers.=0D
=0D
Some people mention that using memcpy() instead of the hardware acceleratio=
n is=0D
pretty much the same speed. But that's not true, at least not for older gra=
phic=0D
cards and machines where we see speed decreases by factor 10 and more and t=
hus=0D
this change leads to console responsiveness way worse than before.=0D
=0D
That's why I propose to revert those patches, re-introduce hardware-based=0D
scrolling acceleration and fix the performance-regression for fbdev drivers=
.=0D
There isn't any impact on DRM when reverting those patches.=0D
=0D
Helge Deller (2):=0D
  Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1=0D
    (from TODO list)"=0D
  Revert "fbcon: Disable accelerated scrolling"=0D
=0D
 Documentation/gpu/todo.rst              |  24 --=0D
 drivers/video/fbdev/core/bitblit.c      |  16 +=0D
 drivers/video/fbdev/core/fbcon.c        | 540 +++++++++++++++++++++++-=0D
 drivers/video/fbdev/core/fbcon.h        |  59 +++=0D
 drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-=0D
 drivers/video/fbdev/core/fbcon_cw.c     |  28 +-=0D
 drivers/video/fbdev/core/fbcon_rotate.h |   9 +=0D
 drivers/video/fbdev/core/fbcon_ud.c     |  37 +-=0D
 drivers/video/fbdev/core/tileblit.c     |  16 +=0D
 drivers/video/fbdev/skeletonfb.c        |  12 +-=0D
 include/linux/fb.h                      |   2 +-=0D
 11 files changed, 703 insertions(+), 68 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
