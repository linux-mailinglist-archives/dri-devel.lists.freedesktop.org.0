Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F074A6468
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 20:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF1310E516;
	Tue,  1 Feb 2022 19:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3443110E4D9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643741996;
 bh=iKQpfY0iiqXhVwAZkTe76JPy7b6ddREFdPI70aFnkn8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kUklo/phq3/MEuPK9fvPzj82eaOLOpkhvN/EK01C/3qjVk/6Jh9B7ogz2xtfpKf3n
 lF4hH8XK84p5eYZXxAHNETzJeDaWvNPsbO39plH2QH12LjnxdGj7J4hgV1hzjHQkyi
 tf2QuwkuyVr99S1JQXHjEd/Q+3B1Mt05N5lOWHmk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1msmhZ27of-00MK1o; Tue, 01
 Feb 2022 19:59:56 +0100
From: Helge Deller <deller@gmx.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 2/3] Revert "fbcon: Disable accelerated scrolling"
Date: Tue,  1 Feb 2022 19:59:53 +0100
Message-Id: <20220201185954.169768-3-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201185954.169768-1-deller@gmx.de>
References: <20220201185954.169768-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SngR8C/yAe5qJUN53Q2aZl0sXR+vpSa42wuhZCutYBSJjjlrvBD
 CVlqfbvIT1+riom+OUhk80WRpnh35LLIv4Znf1s46ro65AQdXNsPnBxIM4s+cBpEU/7t4Ya
 ukbNiIuF6sGSUNgyO3oC0EZiw5kkpyLd9S4/QwHcC+yM7zZW2iR/iQ+RG34J7mEMT8SzewB
 HbI07POyxdxz4FCaeJmOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/nYAwUtlg0k=:2fh7xWMmbXiEe0qUTQNVn6
 BOmtQJm4MU7ivCBFUKQbLR8cCK+l0SOlOFtgzZ11qrqnUDjtiqPSAZHhSKBRA1rTy4xqSofHq
 6GDa48N6QRN6fSt+qG6xXRmX2JJDT8GuHTOpy+CuzIt/hzYAihn0UxYKechkoAIckoiYUGdNI
 fTaKvzdh0wa4rp1/yKUQPLdNJ0DoHHhi9CP3UCVdjIPdCEXdd5679Wnx5WLRr0OC9T38r0stQ
 BG49yZlZC1dBTes8F8kuqgmzy44AA1FYZxRwhvD/kjANnyZggxFYsAkhli0/83/CZa2BP/D3K
 a/YGQJBYG3o516rXvRqhZefyx99zjo7wTtekEwx0MAa7fn3GsoO5ENVGL7jMa/98tAOcQEhrS
 YK8+7NM2Qk/DJVJ2fAqjMM5cRphLyj4mz++2Esm8SyJ0dwW0yXPgBDbGOn9401VJAfXMYGn6j
 CHBZmb+k8m4DbjwpwJXXT26JK2Lhmtr51quIHImk7+vWpfBqrcZJKZKnwwGjUhVU6EqiqV4Fr
 1gLic97yWDPzI6KlF8MsTAwwVS/vOXylzAWQO1dAJk+/m+42WFjpXekwPbYv2d7jQSixQsYk5
 S+p9rq6J/q76jSv3JXI7IGymdoFNowYGxT6zm4arzAeaik176GeEfdGp7r9ROeEOlX7P3Vlvp
 cBLisI3lzzzzPh+tBl5C74LCdQArSiR/oJf1bXJLFHiH/K+Cq3dIb7wMIjtFTaVjqltu1bW/u
 ZSBHqqIghZ7uWfIVvaifnZ1hhNj3sd/5vHwcLgGUK9gKMJBGc+hpIplf19kvIju/JAsm6wkN7
 cvCIbW2DG15NopjlgXkaUBnSXausiq4xs6VnhoMfJF4AbOqgbBo5ZtS7SX4B+sCZ3kuXPTFtw
 6P6V5cW8aMZslN2xx7UIz89cvwJ+mKi/7ajU0VRx3FcZg/+moSvmsgvdRhRegVmwtmZS37Gg5
 LNTTRyxHvoDQ1SP7aY56hNaz50oDhk7V1aJY9J1WGuI0MQ6CfPkO79gcobDRxwZJfXIQ1Zpks
 KWayS5Tnl0G6d/kQEZozJ0FLK3oyy5e8TqX4DzEwVEnEiBlqUptCx/lrQww4Tv8r/UCkI+vUN
 5jAb3vOSI5cI1Y=
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
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave.anglin@bell.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.

Revert the first (of 2) commits which disabled scrolling acceleration in
fbcon/fbdev.  It introduced a regression for fbdev-supported graphic cards
because of the performance penalty by doing screen scrolling by software
instead of using the existing graphic card 2D hardware acceleration.

Console scrolling acceleration was disabled by dropping code which
checked at runtime the driver hardware capabilities for the
BINFO_HWACCEL_COPYAREA or FBINFO_HWACCEL_FILLRECT flags and if set, it
enabled scrollmode SCROLL_MOVE which uses hardware acceleration to move
screen contents.  After dropping those checks scrollmode was hard-wired
to SCROLL_REDRAW instead, which forces all graphic cards to redraw every
character at the new screen position when scrolling.

This change effectively disabled all hardware-based scrolling acceleration=
 for
ALL drivers, because now all kind of 2D hardware acceleration (bitblt,
fillrect) in the drivers isn't used any longer.

The original commit message mentions that only 3 DRM drivers (nouveau, oma=
pdrm
and gma500) used hardware acceleration in the past and thus code for check=
ing
and using scrolling acceleration is obsolete.

This statement is NOT TRUE, because beside the DRM drivers there are aroun=
d 35
other fbdev drivers which depend on fbdev/fbcon and still provide hardware
acceleration for fbdev/fbcon.

The original commit message also states that syzbot found lots of bugs in =
fbcon
and thus it's "often the solution to just delete code and remove features"=
.
This is true, and the bugs - which actually affected all users of fbcon,
including DRM - were fixed, or code was dropped like e.g. the support for
software scrollback in vgacon (commit 973c096f6a85).

So to further analyze which bugs were found by syzbot, I've looked through=
 all
patches in drivers/video which were tagged with syzbot or syzkaller back t=
o
year 2005. The vast majority fixed the reported issues on a higher level, =
e.g.
when screen is to be resized, or when font size is to be changed. The few =
ones
which touched driver code fixed a real driver bug, e.g. by adding a check.

But NONE of those patches touched code of either the SCROLL_MOVE or the
SCROLL_REDRAW case.

That means, there was no real reason why SCROLL_MOVE had to be ripped-out =
and
just SCROLL_REDRAW had to be used instead. The only reason I can imagine s=
o far
was that SCROLL_MOVE wasn't used by DRM and as such it was assumed that it
could go away. That argument completely missed the fact that SCROLL_MOVE i=
s
still heavily used by fbdev (non-DRM) drivers.

Some people mention that using memcpy() instead of the hardware accelerati=
on is
pretty much the same speed. But that's not true, at least not for older gr=
aphic
cards and machines where we see speed decreases by factor 10 and more and =
thus
this change leads to console responsiveness way worse than before.

That's why the original commit is to be reverted. By reverting we
reintroduce hardware-based scrolling acceleration and fix the
performance regression for fbdev drivers.

There isn't any impact on DRM when reverting those patches.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sven Schnelle <svens@stackframe.org>
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 Documentation/gpu/todo.rst       | 21 ---------------
 drivers/video/fbdev/core/fbcon.c | 45 ++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 29506815d24a..a1212b5b3026 100644
=2D-- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -300,27 +300,6 @@ Contact: Daniel Vetter, Noralf Tronnes

 Level: Advanced

-Garbage collect fbdev scrolling acceleration
=2D--------------------------------------------
-
-Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =3D
-SCROLL_REDRAW. There's a ton of code this will allow us to remove:
-
=2D- lots of code in fbcon.c
-
=2D- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be=
 called
-  directly instead of the function table (with a switch on p->rotate)
-
=2D- fb_copyarea is unused after this, and can be deleted from all drivers
-
-Note that not all acceleration code can be deleted, since clearing and cu=
rsor
-support is still accelerated, which might be good candidates for further
-deletion projects.
-
-Contact: Daniel Vetter
-
-Level: Intermediate
-
 idr_init_base()
 ---------------

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 22bb3892f6bd..b813985f1403 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1025,7 +1025,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	struct vc_data *svc =3D *default_mode;
 	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
 	int logo =3D 1, new_rows, new_cols, rows, cols;
-	int ret;
+	int cap, ret;

 	if (WARN_ON(info_idx =3D=3D -1))
 	    return;
@@ -1034,6 +1034,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 		con2fb_map[vc->vc_num] =3D info_idx;

 	info =3D registered_fb[con2fb_map[vc->vc_num]];
+	cap =3D info->flags;

 	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLEVEL_QUIET)
 		logo_shown =3D FBCON_LOGO_DONTSHOW;
@@ -1135,13 +1136,11 @@ static void fbcon_init(struct vc_data *vc, int ini=
t)

 	ops->graphics =3D 0;

-	/*
-	 * No more hw acceleration for fbcon.
-	 *
-	 * FIXME: Garbage collect all the now dead code after sufficient time
-	 * has passed.
-	 */
-	p->scrollmode =3D SCROLL_REDRAW;
+	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
+	    !(cap & FBINFO_HWACCEL_DISABLED))
+		p->scrollmode =3D SCROLL_MOVE;
+	else /* default to something safe */
+		p->scrollmode =3D SCROLL_REDRAW;

 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1953,15 +1952,45 @@ static void updatescrollmode(struct fbcon_display =
*p,
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	int fh =3D vc->vc_font.height;
+	int cap =3D info->flags;
+	u16 t =3D 0;
+	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
+				  info->fix.xpanstep);
+	int ywrap =3D FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
 	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);
+	int good_pan =3D (cap & FBINFO_HWACCEL_YPAN) &&
+		divides(ypan, vc->vc_font.height) && vyres > yres;
+	int good_wrap =3D (cap & FBINFO_HWACCEL_YWRAP) &&
+		divides(ywrap, vc->vc_font.height) &&
+		divides(vc->vc_font.height, vyres) &&
+		divides(vc->vc_font.height, yres);
+	int reading_fast =3D cap & FBINFO_READS_FAST;
+	int fast_copyarea =3D (cap & FBINFO_HWACCEL_COPYAREA) &&
+		!(cap & FBINFO_HWACCEL_DISABLED);
+	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
+		!(cap & FBINFO_HWACCEL_DISABLED);

 	p->vrows =3D vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
 		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
 	if ((yres % fh) && (vyres % fh < yres % fh))
 		p->vrows--;
+
+	if (good_wrap || good_pan) {
+		if (reading_fast || fast_copyarea)
+			p->scrollmode =3D good_wrap ?
+				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
+		else
+			p->scrollmode =3D good_wrap ? SCROLL_REDRAW :
+				SCROLL_PAN_REDRAW;
+	} else {
+		if (reading_fast || (fast_copyarea && !fast_imageblit))
+			p->scrollmode =3D SCROLL_MOVE;
+		else
+			p->scrollmode =3D SCROLL_REDRAW;
+	}
 }

 #define PITCH(w) (((w) + 7) >> 3)
=2D-
2.34.1

