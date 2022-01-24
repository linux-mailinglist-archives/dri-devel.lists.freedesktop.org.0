Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62674994C1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 22:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F95610E6BB;
	Mon, 24 Jan 2022 21:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE410EB29
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643058269;
 bh=y8W53HbX8zo4tTJPMYE3pR07lw05/ZiDuzAYu2oE4Co=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b42Z2B6cmz3CzknU07+RxAFvFjsS76gT/6QCzZYiCnBQ/R9eTJ0pCPHA19I4ecLcr
 vhVJVPmgi5tArLmkrqJrIiQv8GJ/EeSD1/vGoBsoO1vKBpsv0ydEKVvWBqk4dTYHyQ
 LEyUQnPPfPVz/PPd7teEhck+Mqb3bkSdvNNsysE4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.165.96]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1mHfdb1Yoo-00utKb; Mon, 24
 Jan 2022 22:04:29 +0100
From: Helge Deller <deller@gmx.de>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 1/2] Revert "fbdev: Garbage collect fbdev scrolling
 acceleration, part 1 (from TODO list)"
Date: Mon, 24 Jan 2022 22:03:18 +0100
Message-Id: <20220124210319.325512-2-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124210319.325512-1-deller@gmx.de>
References: <20220124210319.325512-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yc34N3VKBuxDD3p+L0Auad+Nbfa64w7B+wuECuACDfRFcvZaU1l
 OgRjrxwM0PlGbt5LgC0426HWz1Yvdjp06E+xTG57kRoASStprskPD+oknjanuF+BQHRsc4q
 vgglblEY9PCg6cfZ/wUqsvdKqmUzB5YAYTYwIswBifQltmrlT0kCbqc2ke1aSsvIBcDHUae
 RLqkp96AlFFkr6waOLz7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5K5lN+QjZx0=:krrLKeVXZddt3VVR1C1yZ2
 fwoU3BdW14YTeESB1woh2JgebMExx1lkisHkqVB/Kfd/vA3YSh/WLBQ5lR39BxDLWXyFKOvFB
 13llxs7GOa11rUuyo3m75pINw+LMfP8IrESN47yli319Ns/EE3XEbD0M9kW6KK1sECWiUSDYL
 KRW/JyWnxxETNw8cbD/VmoDH8YaIzlgOr4zbSoMjE4DowdrQnMhRAh6PwmYD0itvPx9Bhj0Nr
 7DoFVEOdaZ9ukA5QX0qdiO+qA9/O9MefxSqz3ZbRyWKXo5WPZw4sZz+7lDyHlt43myQEs7WH4
 ggc4ByF7VdgQDxS0mzvg2enGF0Vr0CSDhH/cEFmhghdZzubSE87YcZUwR89yIfKFXycqFy1pc
 lJ3CGfPVd4rzjXACmUP1k9ifkbAwuWmqOAv/0seUga6XdELHOVGvcetYWtQNDo5JsmRlOXokC
 GO7iiHFJiq5FZNtoMWddKnEXXGjkQh33gia9XP+DaWjn9BmnKMVYBnceqkNDrCLeepvfLNApp
 HL8N+X4LiHn4N0JB+C8WZUKCTjV2aK3mtkA6Lp1KMk7Om47pKiJpa3ujQAcfIUET+/64+KnO6
 zPBYx/xgg5rct+7ZOFWPHSg5019ah0uzTFzOJthS2WPzgJRcJuXy9Fzjsw0zRmfZ324jOnCeu
 g7NnWEIfTqScEI7UxXUA8br15b+LLfWdHO5Jo5kwf6IFLrC2wQBJLtkbVn6IAMn9bBl6PuGau
 aQhqMgXXzbfoXvJBDQTI/qOPZdaIeemzg0rm4amZHdeAuFBYMDyz4O1CQmb5QAhT6Zwm7+f35
 vOHFrVVVF0m6HSlgsa/5YW6GNb1w7kTDECkxwHsEzELq6UPUbAd6cE4r38Lyouixp5sSRHHnK
 GwhqV3avclruGLRcG33eiwaBLiHanpO77ExLUhuHDfJXFkJ5wJAh4yVFSgZSZQGKBHGI2Lru5
 ZH7qIm+UodBhKn8Z07WeWka9Hi68IIP6v9H2QBMC4zIX+0tdv5rOi3g+VhTNf/r6szyHsreou
 J4mgRlI8b7ZkaYYEEmVA6lEsiOvIE4Yme2MvyyJVNFbcxNvdyazMGVqGK4Lwx+7KvyE8YM3tC
 Z98IAbTAkazzTI=
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
Cc: Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b3ec8cdf457e5e63d396fe1346cc788cf7c1b578.

Revert the second (of 2) commits which disabled scrolling acceleration
in fbcon/fbdev.  It introduced a regression for fbdev-supported graphic
cards because of the performance penalty by doing screen scrolling by
software instead of using the existing graphic card 2D hardware
acceleration.

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
Cc: stable@vger.kernel.org # v5.16+
=2D--
 Documentation/gpu/todo.rst              |  13 +-
 drivers/video/fbdev/core/bitblit.c      |  16 +
 drivers/video/fbdev/core/fbcon.c        | 509 +++++++++++++++++++++++-
 drivers/video/fbdev/core/fbcon.h        |  59 +++
 drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-
 drivers/video/fbdev/core/fbcon_cw.c     |  28 +-
 drivers/video/fbdev/core/fbcon_rotate.h |   9 +
 drivers/video/fbdev/core/fbcon_ud.c     |  37 +-
 drivers/video/fbdev/core/tileblit.c     |  16 +
 drivers/video/fbdev/skeletonfb.c        |  12 +-
 include/linux/fb.h                      |   2 +-
 11 files changed, 678 insertions(+), 51 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index da138dd39883..29506815d24a 100644
=2D-- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -303,19 +303,16 @@ Level: Advanced
 Garbage collect fbdev scrolling acceleration
 --------------------------------------------

-Scroll acceleration has been disabled in fbcon. Now it works as the old
-SCROLL_REDRAW mode. A ton of code was removed in fbcon.c and the hook bmo=
ve was
-removed from fbcon_ops.
-Remaining tasks:
+Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =3D
+SCROLL_REDRAW. There's a ton of code this will allow us to remove:

=2D- a bunch of the hooks in fbcon_ops could be removed or simplified by c=
alling
+- lots of code in fbcon.c
+
+- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be c=
alled
   directly instead of the function table (with a switch on p->rotate)

 - fb_copyarea is unused after this, and can be deleted from all drivers

=2D- after that, fb_copyarea can be deleted from fb_ops in include/linux/f=
b.h as
-  well as cfb_copyarea
-
 Note that not all acceleration code can be deleted, since clearing and cu=
rsor
 support is still accelerated, which might be good candidates for further
 deletion projects.
diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core=
/bitblit.c
index 01fae2c96965..f98e8f298bc1 100644
=2D-- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -43,6 +43,21 @@ static void update_attr(u8 *dst, u8 *src, int attribute=
,
 	}
 }

+static void bit_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+		      int sx, int dy, int dx, int height, int width)
+{
+	struct fb_copyarea area;
+
+	area.sx =3D sx * vc->vc_font.width;
+	area.sy =3D sy * vc->vc_font.height;
+	area.dx =3D dx * vc->vc_font.width;
+	area.dy =3D dy * vc->vc_font.height;
+	area.height =3D height * vc->vc_font.height;
+	area.width =3D width * vc->vc_font.width;
+
+	info->fbops->fb_copyarea(info, &area);
+}
+
 static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int height, int width)
 {
@@ -378,6 +393,7 @@ static int bit_update_start(struct fb_info *info)

 void fbcon_set_bitops(struct fbcon_ops *ops)
 {
+	ops->bmove =3D bit_bmove;
 	ops->clear =3D bit_clear;
 	ops->putcs =3D bit_putcs;
 	ops->clear_margins =3D bit_clear_margins;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index 99ecd9a6d844..22bb3892f6bd 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -173,6 +173,8 @@ static void fbcon_putcs(struct vc_data *vc, const unsi=
gned short *s,
 			int count, int ypos, int xpos);
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only);
 static void fbcon_cursor(struct vc_data *vc, int mode);
+static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int d=
x,
+			int height, int width);
 static int fbcon_switch(struct vc_data *vc);
 static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch);
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *ta=
ble);
@@ -180,8 +182,16 @@ static void fbcon_set_palette(struct vc_data *vc, con=
st unsigned char *table);
 /*
  *  Internal routines
  */
+static __inline__ void ywrap_up(struct vc_data *vc, int count);
+static __inline__ void ywrap_down(struct vc_data *vc, int count);
+static __inline__ void ypan_up(struct vc_data *vc, int count);
+static __inline__ void ypan_down(struct vc_data *vc, int count);
+static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, =
int sy, int sx,
+			    int dy, int dx, int height, int width, u_int y_break);
 static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo=
 *var,
 			   int unit);
+static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p=
,
+			      int line, int count, int dy);
 static void fbcon_modechanged(struct fb_info *info);
 static void fbcon_set_all_vcs(struct fb_info *info);
 static void fbcon_start(void);
@@ -1125,6 +1135,14 @@ static void fbcon_init(struct vc_data *vc, int init=
)

 	ops->graphics =3D 0;

+	/*
+	 * No more hw acceleration for fbcon.
+	 *
+	 * FIXME: Garbage collect all the now dead code after sufficient time
+	 * has passed.
+	 */
+	p->scrollmode =3D SCROLL_REDRAW;
+
 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
 	 *  vc_{cols,rows}, but we must not set those if we are only
@@ -1211,13 +1229,14 @@ static void fbcon_deinit(struct vc_data *vc)
  *  This system is now divided into two levels because of complications
  *  caused by hardware scrolling. Top level functions:
  *
- *	fbcon_clear(), fbcon_putc(), fbcon_clear_margins()
+ *	fbcon_bmove(), fbcon_clear(), fbcon_putc(), fbcon_clear_margins()
  *
  *  handles y values in range [0, scr_height-1] that correspond to real
  *  screen positions. y_wrap shift means that first line of bitmap may be
  *  anywhere on this display. These functions convert lineoffsets to
  *  bitmap offsets and deal with the wrap-around case by splitting blits.
  *
+ *	fbcon_bmove_physical_8()    -- These functions fast implementations
  *	fbcon_clear_physical_8()    -- of original fbcon_XXX fns.
  *	fbcon_putc_physical_8()	    -- (font width !=3D 8) may be added later
  *
@@ -1390,6 +1409,224 @@ static void fbcon_set_disp(struct fb_info *info, s=
truct fb_var_screeninfo *var,
 	}
 }

+static __inline__ void ywrap_up(struct vc_data *vc, int count)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+
+	p->yscroll +=3D count;
+	if (p->yscroll >=3D p->vrows)	/* Deal with wrap */
+		p->yscroll -=3D p->vrows;
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode |=3D FB_VMODE_YWRAP;
+	ops->update_start(info);
+	scrollback_max +=3D count;
+	if (scrollback_max > scrollback_phys_max)
+		scrollback_max =3D scrollback_phys_max;
+	scrollback_current =3D 0;
+}
+
+static __inline__ void ywrap_down(struct vc_data *vc, int count)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+
+	p->yscroll -=3D count;
+	if (p->yscroll < 0)	/* Deal with wrap */
+		p->yscroll +=3D p->vrows;
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode |=3D FB_VMODE_YWRAP;
+	ops->update_start(info);
+	scrollback_max -=3D count;
+	if (scrollback_max < 0)
+		scrollback_max =3D 0;
+	scrollback_current =3D 0;
+}
+
+static __inline__ void ypan_up(struct vc_data *vc, int count)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+
+	p->yscroll +=3D count;
+	if (p->yscroll > p->vrows - vc->vc_rows) {
+		ops->bmove(vc, info, p->vrows - vc->vc_rows,
+			    0, 0, 0, vc->vc_rows, vc->vc_cols);
+		p->yscroll -=3D p->vrows - vc->vc_rows;
+	}
+
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode &=3D ~FB_VMODE_YWRAP;
+	ops->update_start(info);
+	fbcon_clear_margins(vc, 1);
+	scrollback_max +=3D count;
+	if (scrollback_max > scrollback_phys_max)
+		scrollback_max =3D scrollback_phys_max;
+	scrollback_current =3D 0;
+}
+
+static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int coun=
t)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+
+	p->yscroll +=3D count;
+
+	if (p->yscroll > p->vrows - vc->vc_rows) {
+		p->yscroll -=3D p->vrows - vc->vc_rows;
+		fbcon_redraw_move(vc, p, t + count, vc->vc_rows - count, t);
+	}
+
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode &=3D ~FB_VMODE_YWRAP;
+	ops->update_start(info);
+	fbcon_clear_margins(vc, 1);
+	scrollback_max +=3D count;
+	if (scrollback_max > scrollback_phys_max)
+		scrollback_max =3D scrollback_phys_max;
+	scrollback_current =3D 0;
+}
+
+static __inline__ void ypan_down(struct vc_data *vc, int count)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+
+	p->yscroll -=3D count;
+	if (p->yscroll < 0) {
+		ops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
+			    0, vc->vc_rows, vc->vc_cols);
+		p->yscroll +=3D p->vrows - vc->vc_rows;
+	}
+
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode &=3D ~FB_VMODE_YWRAP;
+	ops->update_start(info);
+	fbcon_clear_margins(vc, 1);
+	scrollback_max -=3D count;
+	if (scrollback_max < 0)
+		scrollback_max =3D 0;
+	scrollback_current =3D 0;
+}
+
+static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int co=
unt)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+
+	p->yscroll -=3D count;
+
+	if (p->yscroll < 0) {
+		p->yscroll +=3D p->vrows - vc->vc_rows;
+		fbcon_redraw_move(vc, p, t, vc->vc_rows - count, t + count);
+	}
+
+	ops->var.xoffset =3D 0;
+	ops->var.yoffset =3D p->yscroll * vc->vc_font.height;
+	ops->var.vmode &=3D ~FB_VMODE_YWRAP;
+	ops->update_start(info);
+	fbcon_clear_margins(vc, 1);
+	scrollback_max -=3D count;
+	if (scrollback_max < 0)
+		scrollback_max =3D 0;
+	scrollback_current =3D 0;
+}
+
+static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p=
,
+			      int line, int count, int dy)
+{
+	unsigned short *s =3D (unsigned short *)
+		(vc->vc_origin + vc->vc_size_row * line);
+
+	while (count--) {
+		unsigned short *start =3D s;
+		unsigned short *le =3D advance_row(s, 1);
+		unsigned short c;
+		int x =3D 0;
+		unsigned short attr =3D 1;
+
+		do {
+			c =3D scr_readw(s);
+			if (attr !=3D (c & 0xff00)) {
+				attr =3D c & 0xff00;
+				if (s > start) {
+					fbcon_putcs(vc, start, s - start,
+						    dy, x);
+					x +=3D s - start;
+					start =3D s;
+				}
+			}
+			console_conditional_schedule();
+			s++;
+		} while (s < le);
+		if (s > start)
+			fbcon_putcs(vc, start, s - start, dy, x);
+		console_conditional_schedule();
+		dy++;
+	}
+}
+
+static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
+			struct fbcon_display *p, int line, int count, int ycount)
+{
+	int offset =3D ycount * vc->vc_cols;
+	unsigned short *d =3D (unsigned short *)
+	    (vc->vc_origin + vc->vc_size_row * line);
+	unsigned short *s =3D d + offset;
+	struct fbcon_ops *ops =3D info->fbcon_par;
+
+	while (count--) {
+		unsigned short *start =3D s;
+		unsigned short *le =3D advance_row(s, 1);
+		unsigned short c;
+		int x =3D 0;
+
+		do {
+			c =3D scr_readw(s);
+
+			if (c =3D=3D scr_readw(d)) {
+				if (s > start) {
+					ops->bmove(vc, info, line + ycount, x,
+						   line, x, 1, s-start);
+					x +=3D s - start + 1;
+					start =3D s + 1;
+				} else {
+					x++;
+					start++;
+				}
+			}
+
+			scr_writew(c, d);
+			console_conditional_schedule();
+			s++;
+			d++;
+		} while (s < le);
+		if (s > start)
+			ops->bmove(vc, info, line + ycount, x, line, x, 1,
+				   s-start);
+		console_conditional_schedule();
+		if (ycount > 0)
+			line++;
+		else {
+			line--;
+			/* NOTE: We subtract two lines from these pointers */
+			s -=3D vc->vc_size_row;
+			d -=3D vc->vc_size_row;
+		}
+	}
+}
+
 static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
 			 int line, int count, int offset)
 {
@@ -1450,6 +1687,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigne=
d int t, unsigned int b,
 {
 	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
 	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+	int scroll_partial =3D info->flags & FBINFO_PARTIAL_PAN_OK;

 	if (fbcon_is_inactive(vc, info))
 		return true;
@@ -1466,32 +1704,249 @@ static bool fbcon_scroll(struct vc_data *vc, unsi=
gned int t, unsigned int b,
 	case SM_UP:
 		if (count > vc->vc_rows)	/* Maximum realistic size */
 			count =3D vc->vc_rows;
-		fbcon_redraw(vc, p, t, b - t - count,
-			     count * vc->vc_cols);
-		fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
-		scr_memsetw((unsigned short *) (vc->vc_origin +
-						vc->vc_size_row *
-						(b - count)),
-			    vc->vc_video_erase_char,
-			    vc->vc_size_row * count);
-		return true;
+		if (logo_shown >=3D 0)
+			goto redraw_up;
+		switch (p->scrollmode) {
+		case SCROLL_MOVE:
+			fbcon_redraw_blit(vc, info, p, t, b - t - count,
+				     count);
+			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			scr_memsetw((unsigned short *) (vc->vc_origin +
+							vc->vc_size_row *
+							(b - count)),
+				    vc->vc_video_erase_char,
+				    vc->vc_size_row * count);
+			return true;
+
+		case SCROLL_WRAP_MOVE:
+			if (b - t - count > 3 * vc->vc_rows >> 2) {
+				if (t > 0)
+					fbcon_bmove(vc, 0, 0, count, 0, t,
+						    vc->vc_cols);
+				ywrap_up(vc, count);
+				if (vc->vc_rows - b > 0)
+					fbcon_bmove(vc, b - count, 0, b, 0,
+						    vc->vc_rows - b,
+						    vc->vc_cols);
+			} else if (info->flags & FBINFO_READS_FAST)
+				fbcon_bmove(vc, t + count, 0, t, 0,
+					    b - t - count, vc->vc_cols);
+			else
+				goto redraw_up;
+			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_PAN_REDRAW:
+			if ((p->yscroll + count <=3D
+			     2 * (p->vrows - vc->vc_rows))
+			    && ((!scroll_partial && (b - t =3D=3D vc->vc_rows))
+				|| (scroll_partial
+				    && (b - t - count >
+					3 * vc->vc_rows >> 2)))) {
+				if (t > 0)
+					fbcon_redraw_move(vc, p, 0, t, count);
+				ypan_up_redraw(vc, t, count);
+				if (vc->vc_rows - b > 0)
+					fbcon_redraw_move(vc, p, b,
+							  vc->vc_rows - b, b);
+			} else
+				fbcon_redraw_move(vc, p, t + count, b - t - count, t);
+			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_PAN_MOVE:
+			if ((p->yscroll + count <=3D
+			     2 * (p->vrows - vc->vc_rows))
+			    && ((!scroll_partial && (b - t =3D=3D vc->vc_rows))
+				|| (scroll_partial
+				    && (b - t - count >
+					3 * vc->vc_rows >> 2)))) {
+				if (t > 0)
+					fbcon_bmove(vc, 0, 0, count, 0, t,
+						    vc->vc_cols);
+				ypan_up(vc, count);
+				if (vc->vc_rows - b > 0)
+					fbcon_bmove(vc, b - count, 0, b, 0,
+						    vc->vc_rows - b,
+						    vc->vc_cols);
+			} else if (info->flags & FBINFO_READS_FAST)
+				fbcon_bmove(vc, t + count, 0, t, 0,
+					    b - t - count, vc->vc_cols);
+			else
+				goto redraw_up;
+			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_REDRAW:
+		      redraw_up:
+			fbcon_redraw(vc, p, t, b - t - count,
+				     count * vc->vc_cols);
+			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
+			scr_memsetw((unsigned short *) (vc->vc_origin +
+							vc->vc_size_row *
+							(b - count)),
+				    vc->vc_video_erase_char,
+				    vc->vc_size_row * count);
+			return true;
+		}
+		break;

 	case SM_DOWN:
 		if (count > vc->vc_rows)	/* Maximum realistic size */
 			count =3D vc->vc_rows;
-		fbcon_redraw(vc, p, b - 1, b - t - count,
-			     -count * vc->vc_cols);
-		fbcon_clear(vc, t, 0, count, vc->vc_cols);
-		scr_memsetw((unsigned short *) (vc->vc_origin +
-						vc->vc_size_row *
-						t),
-			    vc->vc_video_erase_char,
-			    vc->vc_size_row * count);
-		return true;
+		if (logo_shown >=3D 0)
+			goto redraw_down;
+		switch (p->scrollmode) {
+		case SCROLL_MOVE:
+			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
+				     -count);
+			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			scr_memsetw((unsigned short *) (vc->vc_origin +
+							vc->vc_size_row *
+							t),
+				    vc->vc_video_erase_char,
+				    vc->vc_size_row * count);
+			return true;
+
+		case SCROLL_WRAP_MOVE:
+			if (b - t - count > 3 * vc->vc_rows >> 2) {
+				if (vc->vc_rows - b > 0)
+					fbcon_bmove(vc, b, 0, b - count, 0,
+						    vc->vc_rows - b,
+						    vc->vc_cols);
+				ywrap_down(vc, count);
+				if (t > 0)
+					fbcon_bmove(vc, count, 0, 0, 0, t,
+						    vc->vc_cols);
+			} else if (info->flags & FBINFO_READS_FAST)
+				fbcon_bmove(vc, t, 0, t + count, 0,
+					    b - t - count, vc->vc_cols);
+			else
+				goto redraw_down;
+			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_PAN_MOVE:
+			if ((count - p->yscroll <=3D p->vrows - vc->vc_rows)
+			    && ((!scroll_partial && (b - t =3D=3D vc->vc_rows))
+				|| (scroll_partial
+				    && (b - t - count >
+					3 * vc->vc_rows >> 2)))) {
+				if (vc->vc_rows - b > 0)
+					fbcon_bmove(vc, b, 0, b - count, 0,
+						    vc->vc_rows - b,
+						    vc->vc_cols);
+				ypan_down(vc, count);
+				if (t > 0)
+					fbcon_bmove(vc, count, 0, 0, 0, t,
+						    vc->vc_cols);
+			} else if (info->flags & FBINFO_READS_FAST)
+				fbcon_bmove(vc, t, 0, t + count, 0,
+					    b - t - count, vc->vc_cols);
+			else
+				goto redraw_down;
+			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_PAN_REDRAW:
+			if ((count - p->yscroll <=3D p->vrows - vc->vc_rows)
+			    && ((!scroll_partial && (b - t =3D=3D vc->vc_rows))
+				|| (scroll_partial
+				    && (b - t - count >
+					3 * vc->vc_rows >> 2)))) {
+				if (vc->vc_rows - b > 0)
+					fbcon_redraw_move(vc, p, b, vc->vc_rows - b,
+							  b - count);
+				ypan_down_redraw(vc, t, count);
+				if (t > 0)
+					fbcon_redraw_move(vc, p, count, t, 0);
+			} else
+				fbcon_redraw_move(vc, p, t, b - t - count, t + count);
+			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			break;
+
+		case SCROLL_REDRAW:
+		      redraw_down:
+			fbcon_redraw(vc, p, b - 1, b - t - count,
+				     -count * vc->vc_cols);
+			fbcon_clear(vc, t, 0, count, vc->vc_cols);
+			scr_memsetw((unsigned short *) (vc->vc_origin +
+							vc->vc_size_row *
+							t),
+				    vc->vc_video_erase_char,
+				    vc->vc_size_row * count);
+			return true;
+		}
 	}
 	return false;
 }

+
+static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int d=
x,
+			int height, int width)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_display *p =3D &fb_display[vc->vc_num];
+
+	if (fbcon_is_inactive(vc, info))
+		return;
+
+	if (!width || !height)
+		return;
+
+	/*  Split blits that cross physical y_wrap case.
+	 *  Pathological case involves 4 blits, better to use recursive
+	 *  code rather than unrolled case
+	 *
+	 *  Recursive invocations don't need to erase the cursor over and
+	 *  over again, so we use fbcon_bmove_rec()
+	 */
+	fbcon_bmove_rec(vc, p, sy, sx, dy, dx, height, width,
+			p->vrows - p->yscroll);
+}
+
+static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, =
int sy, int sx,
+			    int dy, int dx, int height, int width, u_int y_break)
+{
+	struct fb_info *info =3D registered_fb[con2fb_map[vc->vc_num]];
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	u_int b;
+
+	if (sy < y_break && sy + height > y_break) {
+		b =3D y_break - sy;
+		if (dy < sy) {	/* Avoid trashing self */
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+		} else {
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+		}
+		return;
+	}
+
+	if (dy < y_break && dy + height > y_break) {
+		b =3D y_break - dy;
+		if (dy < sy) {	/* Avoid trashing self */
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+		} else {
+			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
+					height - b, width, y_break);
+			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
+					y_break);
+		}
+		return;
+	}
+	ops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
+		   height, width);
+}
+
 static void updatescrollmode(struct fbcon_display *p,
 					struct fb_info *info,
 					struct vc_data *vc)
@@ -1664,7 +2119,21 @@ static int fbcon_switch(struct vc_data *vc)

 	updatescrollmode(p, info, vc);

-	scrollback_phys_max =3D 0;
+	switch (p->scrollmode) {
+	case SCROLL_WRAP_MOVE:
+		scrollback_phys_max =3D p->vrows - vc->vc_rows;
+		break;
+	case SCROLL_PAN_MOVE:
+	case SCROLL_PAN_REDRAW:
+		scrollback_phys_max =3D p->vrows - 2 * vc->vc_rows;
+		if (scrollback_phys_max < 0)
+			scrollback_phys_max =3D 0;
+		break;
+	default:
+		scrollback_phys_max =3D 0;
+		break;
+	}
+
 	scrollback_max =3D 0;
 	scrollback_current =3D 0;

diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/f=
bcon.h
index a00603b4451a..9315b360c898 100644
=2D-- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -29,6 +29,7 @@ struct fbcon_display {
     /* Filled in by the low-level console driver */
     const u_char *fontdata;
     int userfont;                   /* !=3D 0 if fontdata kmalloc()ed */
+    u_short scrollmode;             /* Scroll Method */
     u_short inverse;                /* !=3D 0 text black on white as defa=
ult */
     short yscroll;                  /* Hardware scrolling */
     int vrows;                      /* number of virtual rows */
@@ -51,6 +52,8 @@ struct fbcon_display {
 };

 struct fbcon_ops {
+	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
+		      int sx, int dy, int dx, int height, int width);
 	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
 		      int sx, int height, int width);
 	void (*putcs)(struct vc_data *vc, struct fb_info *info,
@@ -149,6 +152,62 @@ static inline int attr_col_ec(int shift, struct vc_da=
ta *vc,
 #define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info, 0=
)
 #define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info, 1=
)

+    /*
+     *  Scroll Method
+     */
+
+/* There are several methods fbcon can use to move text around the screen=
:
+ *
+ *                     Operation   Pan    Wrap
+ *---------------------------------------------
+ * SCROLL_MOVE         copyarea    No     No
+ * SCROLL_PAN_MOVE     copyarea    Yes    No
+ * SCROLL_WRAP_MOVE    copyarea    No     Yes
+ * SCROLL_REDRAW       imageblit   No     No
+ * SCROLL_PAN_REDRAW   imageblit   Yes    No
+ * SCROLL_WRAP_REDRAW  imageblit   No     Yes
+ *
+ * (SCROLL_WRAP_REDRAW is not implemented yet)
+ *
+ * In general, fbcon will choose the best scrolling
+ * method based on the rule below:
+ *
+ * Pan/Wrap > accel imageblit > accel copyarea >
+ * soft imageblit > (soft copyarea)
+ *
+ * Exception to the rule: Pan + accel copyarea is
+ * preferred over Pan + accel imageblit.
+ *
+ * The above is typical for PCI/AGP cards. Unless
+ * overridden, fbcon will never use soft copyarea.
+ *
+ * If you need to override the above rule, set the
+ * appropriate flags in fb_info->flags.  For example,
+ * to prefer copyarea over imageblit, set
+ * FBINFO_READS_FAST.
+ *
+ * Other notes:
+ * + use the hardware engine to move the text
+ *    (hw-accelerated copyarea() and fillrect())
+ * + use hardware-supported panning on a large virtual screen
+ * + amifb can not only pan, but also wrap the display by N lines
+ *    (i.e. visible line i =3D physical line (i+N) % yres).
+ * + read what's already rendered on the screen and
+ *     write it in a different place (this is cfb_copyarea())
+ * + re-render the text to the screen
+ *
+ * Whether to use wrapping or panning can only be figured out at
+ * runtime (when we know whether our font height is a multiple
+ * of the pan/wrap step)
+ *
+ */
+
+#define SCROLL_MOVE	   0x001
+#define SCROLL_PAN_MOVE	   0x002
+#define SCROLL_WRAP_MOVE   0x003
+#define SCROLL_REDRAW	   0x004
+#define SCROLL_PAN_REDRAW  0x005
+
 #ifdef CONFIG_FB_TILEBLITTING
 extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
 #endif
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/co=
re/fbcon_ccw.c
index ffa78936eaab..9cd2c4b05c32 100644
=2D-- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -59,12 +59,31 @@ static void ccw_update_attr(u8 *dst, u8 *src, int attr=
ibute,
 	}
 }

+
+static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+		     int sx, int dy, int dx, int height, int width)
+{
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fb_copyarea area;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+
+	area.sx =3D sy * vc->vc_font.height;
+	area.sy =3D vyres - ((sx + width) * vc->vc_font.width);
+	area.dx =3D dy * vc->vc_font.height;
+	area.dy =3D vyres - ((dx + width) * vc->vc_font.width);
+	area.width =3D height * vc->vc_font.height;
+	area.height  =3D width * vc->vc_font.width;
+
+	info->fbops->fb_copyarea(info, &area);
+}
+
 static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width)
 {
+	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vyres =3D info->var.yres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dx =3D sy * vc->vc_font.height;
@@ -121,7 +140,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_in=
fo *info,
 	u32 cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vyres =3D info->var.yres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -210,7 +229,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_i=
nfo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vyres =3D info->var.yres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -368,7 +387,7 @@ static int ccw_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	u32 yoffset;
-	u32 vyres =3D info->var.yres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
 	int err;

 	yoffset =3D (vyres - info->var.yres) - ops->var.xoffset;
@@ -383,6 +402,7 @@ static int ccw_update_start(struct fb_info *info)

 void fbcon_rotate_ccw(struct fbcon_ops *ops)
 {
+	ops->bmove =3D ccw_bmove;
 	ops->clear =3D ccw_clear;
 	ops->putcs =3D ccw_putcs;
 	ops->clear_margins =3D ccw_clear_margins;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/cor=
e/fbcon_cw.c
index 92e5b7fb51ee..88d89fad3f05 100644
=2D-- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -44,12 +44,31 @@ static void cw_update_attr(u8 *dst, u8 *src, int attri=
bute,
 	}
 }

+
+static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+		     int sx, int dy, int dx, int height, int width)
+{
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fb_copyarea area;
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+
+	area.sx =3D vxres - ((sy + height) * vc->vc_font.height);
+	area.sy =3D sx * vc->vc_font.width;
+	area.dx =3D vxres - ((dy + height) * vc->vc_font.height);
+	area.dy =3D dx * vc->vc_font.width;
+	area.width =3D height * vc->vc_font.height;
+	area.height  =3D width * vc->vc_font.width;
+
+	info->fbops->fb_copyarea(info, &area);
+}
+
 static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width)
 {
+	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vxres =3D info->var.xres;
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dx =3D vxres - ((sy + height) * vc->vc_font.height);
@@ -106,7 +125,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_inf=
o *info,
 	u32 cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vxres =3D info->var.xres;
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -193,7 +212,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vxres =3D info->var.xres;
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -350,7 +369,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 static int cw_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
-	u32 vxres =3D info->var.xres;
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
 	u32 xoffset;
 	int err;

@@ -366,6 +385,7 @@ static int cw_update_start(struct fb_info *info)

 void fbcon_rotate_cw(struct fbcon_ops *ops)
 {
+	ops->bmove =3D cw_bmove;
 	ops->clear =3D cw_clear;
 	ops->putcs =3D cw_putcs;
 	ops->clear_margins =3D cw_clear_margins;
diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev=
/core/fbcon_rotate.h
index b528b2e54283..e233444cda66 100644
=2D-- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -11,6 +11,15 @@
 #ifndef _FBCON_ROTATE_H
 #define _FBCON_ROTATE_H

+#define GETVYRES(s,i) ({                           \
+        (s =3D=3D SCROLL_REDRAW || s =3D=3D SCROLL_MOVE) ? \
+        (i)->var.yres : (i)->var.yres_virtual; })
+
+#define GETVXRES(s,i) ({                           \
+        (s =3D=3D SCROLL_REDRAW || s =3D=3D SCROLL_MOVE || !(i)->fix.xpan=
step) ? \
+        (i)->var.xres : (i)->var.xres_virtual; })
+
+
 static inline int pattern_test_bit(u32 x, u32 y, u32 pitch, const char *p=
at)
 {
 	u32 tmp =3D (y * pitch) + x, index =3D tmp / 8,  bit =3D tmp % 8;
diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/cor=
e/fbcon_ud.c
index 09619bd8e021..8d5e66b1bdfb 100644
=2D-- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -44,13 +44,33 @@ static void ud_update_attr(u8 *dst, u8 *src, int attri=
bute,
 	}
 }

+
+static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+		     int sx, int dy, int dx, int height, int width)
+{
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	struct fb_copyarea area;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+
+	area.sy =3D vyres - ((sy + height) * vc->vc_font.height);
+	area.sx =3D vxres - ((sx + width) * vc->vc_font.width);
+	area.dy =3D vyres - ((dy + height) * vc->vc_font.height);
+	area.dx =3D vxres - ((dx + width) * vc->vc_font.width);
+	area.height =3D height * vc->vc_font.height;
+	area.width  =3D width * vc->vc_font.width;
+
+	info->fbops->fb_copyarea(info, &area);
+}
+
 static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		     int sx, int height, int width)
 {
+	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vyres =3D info->var.yres;
-	u32 vxres =3D info->var.xres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dy =3D vyres - ((sy + height) * vc->vc_font.height);
@@ -142,8 +162,8 @@ static void ud_putcs(struct vc_data *vc, struct fb_inf=
o *info,
 	u32 mod =3D vc->vc_font.width % 8, cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vyres =3D info->var.yres;
-	u32 vxres =3D info->var.xres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -239,8 +259,8 @@ static void ud_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vyres =3D info->var.yres;
-	u32 vxres =3D info->var.xres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);

 	if (!ops->fontbuffer)
 		return;
@@ -390,8 +410,8 @@ static int ud_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	int xoffset, yoffset;
-	u32 vyres =3D info->var.yres;
-	u32 vxres =3D info->var.xres;
+	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
 	int err;

 	xoffset =3D vxres - info->var.xres - ops->var.xoffset;
@@ -409,6 +429,7 @@ static int ud_update_start(struct fb_info *info)

 void fbcon_rotate_ud(struct fbcon_ops *ops)
 {
+	ops->bmove =3D ud_bmove;
 	ops->clear =3D ud_clear;
 	ops->putcs =3D ud_putcs;
 	ops->clear_margins =3D ud_clear_margins;
diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/cor=
e/tileblit.c
index 72af95053bcb..2768eff247ba 100644
=2D-- a/drivers/video/fbdev/core/tileblit.c
+++ b/drivers/video/fbdev/core/tileblit.c
@@ -16,6 +16,21 @@
 #include <asm/types.h>
 #include "fbcon.h"

+static void tile_bmove(struct vc_data *vc, struct fb_info *info, int sy,
+		       int sx, int dy, int dx, int height, int width)
+{
+	struct fb_tilearea area;
+
+	area.sx =3D sx;
+	area.sy =3D sy;
+	area.dx =3D dx;
+	area.dy =3D dy;
+	area.height =3D height;
+	area.width =3D width;
+
+	info->tileops->fb_tilecopy(info, &area);
+}
+
 static void tile_clear(struct vc_data *vc, struct fb_info *info, int sy,
 		       int sx, int height, int width)
 {
@@ -118,6 +133,7 @@ void fbcon_set_tileops(struct vc_data *vc, struct fb_i=
nfo *info)
 	struct fb_tilemap map;
 	struct fbcon_ops *ops =3D info->fbcon_par;

+	ops->bmove =3D tile_bmove;
 	ops->clear =3D tile_clear;
 	ops->putcs =3D tile_putcs;
 	ops->clear_margins =3D tile_clear_margins;
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skelet=
onfb.c
index 0fe922f726e9..bcacfb6934fa 100644
=2D-- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -505,15 +505,15 @@ void xxxfb_fillrect(struct fb_info *p, const struct =
fb_fillrect *region)
 }

 /**
- *      xxxfb_copyarea - OBSOLETE function.
+ *      xxxfb_copyarea - REQUIRED function. Can use generic routines if
+ *                       non acclerated hardware and packed pixel based.
  *                       Copies one area of the screen to another area.
- *                       Will be deleted in a future version
  *
  *      @info: frame buffer structure that represents a single frame buff=
er
  *      @area: Structure providing the data to copy the framebuffer conte=
nts
  *	       from one region to another.
  *
- *      This drawing operation copied a rectangular area from one area of=
 the
+ *      This drawing operation copies a rectangular area from one area of=
 the
  *	screen to another area.
  */
 void xxxfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
@@ -645,9 +645,9 @@ static const struct fb_ops xxxfb_ops =3D {
 	.fb_setcolreg	=3D xxxfb_setcolreg,
 	.fb_blank	=3D xxxfb_blank,
 	.fb_pan_display	=3D xxxfb_pan_display,
-	.fb_fillrect	=3D xxxfb_fillrect,	/* Needed !!!   */
-	.fb_copyarea	=3D xxxfb_copyarea,	/* Obsolete     */
-	.fb_imageblit	=3D xxxfb_imageblit,	/* Needed !!!   */
+	.fb_fillrect	=3D xxxfb_fillrect, 	/* Needed !!! */
+	.fb_copyarea	=3D xxxfb_copyarea,	/* Needed !!! */
+	.fb_imageblit	=3D xxxfb_imageblit,	/* Needed !!! */
 	.fb_cursor	=3D xxxfb_cursor,		/* Optional !!! */
 	.fb_sync	=3D xxxfb_sync,
 	.fb_ioctl	=3D xxxfb_ioctl,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3da95842b207..02f362c661c8 100644
=2D-- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -262,7 +262,7 @@ struct fb_ops {

 	/* Draws a rectangle */
 	void (*fb_fillrect) (struct fb_info *info, const struct fb_fillrect *rec=
t);
-	/* Copy data from area to another. Obsolete. */
+	/* Copy data from area to another */
 	void (*fb_copyarea) (struct fb_info *info, const struct fb_copyarea *reg=
ion);
 	/* Draws a image to the display */
 	void (*fb_imageblit) (struct fb_info *info, const struct fb_image *image=
);
=2D-
2.31.1

