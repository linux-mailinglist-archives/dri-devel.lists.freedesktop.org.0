Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DD4A646B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 20:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E53810E518;
	Tue,  1 Feb 2022 19:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512BF10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643741996;
 bh=BkvbyYJy6alTQxuQNHTKH1EJFI/+qVYGNkGSrIPMSh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Aff3a09tDr/L8a/4X6YSjJ/DoXZKaQ2AhClVN6pOQpGKQWyjw/vKPL/mKbFPuX2eJ
 8KxVNwXaDaxZ19b6fe7F+27zRCgbuTul1lcLt1mpCLUeVakOhPkkHXlO+kawMhrPq+
 M1a4tvHHPY+A0/MGMY8iyr/ILFmU7fVIEANnouOE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1n8wly2rUI-007G1L; Tue, 01
 Feb 2022 19:59:56 +0100
From: Helge Deller <deller@gmx.de>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 3/3] fbcon: Add option to enable legacy hardware
 acceleration
Date: Tue,  1 Feb 2022 19:59:54 +0100
Message-Id: <20220201185954.169768-4-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201185954.169768-1-deller@gmx.de>
References: <20220201185954.169768-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HfNqoynB6j3XkX7N9zqJR2S8mt/chPL/X/Rjst4HPjLDM4iL64Q
 z7YDCpx0cuuOwbJ3Cpuf6FGFuWOCd3lFvfzTFDbvXmJi9XOMPhvS0wX2PSittwWGf6rP42K
 /iKEPe4emVtv/eHOH6bt9WZkLr8M7pjQYm+G6FnNoMJlBchX1RJCpzc+sKXf7p+g5IrMySh
 EAiIoeNpmt6MX8rSZcapQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IvPzFt9Iw+k=:PN4r/cq8UrIyqB3FKIgFm3
 nuiE97ygGmkUDELENnSdE/v+1+aqwJXmxGxlaFgZLI36NNbo/aYX1d4x9UVFuBBFjOwRRnZdp
 TCpoxo6O2vcNviU7MiQctaheFsOH3zfmpPSUsIxLunn33ebtrWtS0+6rwNnZo9I+1We3MzFj2
 0QbVXzkRvA+JZosQVoGxeNWXK1E1Zsj4FJai67Zob3/td0Ie2EAR7PKaODrBukryKOccqGd44
 U4kjd0nGSPNHzSb/uSjGbsrSK82MYOiiwIAisBfKeu1JWHoRcPY/BZdQ9eT9vBdtve5LP+PWO
 d+TglQ1DRY2rv+1Ox9WgWGC7dOT5PXcRo0LLzTHcKql+0xq0E1H45zzRCQqHqkWI22oNLyQO/
 W5NbuJ5dNo4ajNGs6XAp591xeSdSXYIQRw+WC29HxA8qAGBmikKnwWD2scsuYlSXJNiEUz3AB
 v9GiQdD1uudBb2VqUn7Z9nHIpzznI34BNN1nQbc0UDjmdT4J7VdJ5gvHmz7RNpHcRFgRCY0/9
 Mvoai4ZDUBFptgekIMuzag1UhmGuuqO4i5Bo0nZjYIByWvAxLXlNwVtTamlXJJNQo0veAwYeP
 GeLGrDf+kdTderGwIwxqmbngqzZBoC2r8MFS3Nd+UplHX6g//5FbxatZpr75y4cGcOcblCdjY
 tCiqDWJg1P4sEPedKvOy1SvR8zh+UnZSSWhuQXn6cbRbL0K2OGihhHOJq98LQGzXgwPJtokuc
 LNs0RGcAEH/iRAvSXzjkgANPqG4tXneY7BQFmcyEpIkxcYwwETK/nXhnpAxGMtoxBHAzo6QCt
 Ljh2C0sTI3ECAIK8iJUSDoduVc2o9p+BTSw/UZT03bQpDim+PDbdPgXO1DwahjAsWcH/0QL76
 d5XRzwGG5+H26lORkXfHYNboDF6/84zEl7J71isdQqxnIKm4vvW131YGdZ89+2th57t1rSE/2
 0EwFg8/5MnzItzAsFEeuLxGy4Kn2HA8akYbJ8eQ0jLTWr+YXmISeOll0MQiknNUHIXvbNVd2N
 938il+0bXH++KC9x7yVJut6UGhwHmK2Ejf7LjJuooRSJsCj995liftForRScA1rG2jhAHZOPr
 KC9U0Kr1QfYdUo=
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

Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
enable bitblt and fillrect hardware acceleration in the framebuffer
console. If disabled, such acceleration will not be used, even if it is
supported by the graphics hardware driver.

If you plan to use DRM as your main graphics output system, you should
disable this option since it will prevent compiling in code which isn't
used later on when DRM takes over.

For all other configurations, e.g. if none of your graphic cards support
DRM (yet), DRM isn't available for your architecture, or you can't be
sure that the graphic card in the target system will support DRM, you
most likely want to enable this option.

In the non-accelerated case (e.g. when DRM is used), the inlined
fb_scrollmode() function is hardcoded to return SCROLL_REDRAW and as such =
the
compiler is able to optimize much unneccesary code away.

In this v3 patch version I additionally changed the GETVYRES() and GETVXRE=
S()
macros to take a pointer to the fbcon_display struct. This fixes the build=
 when
console rotation is enabled and helps the compiler again to optimize out c=
ode.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 drivers/video/console/Kconfig           | 11 +++++++
 drivers/video/fbdev/core/fbcon.c        | 39 ++++++++++++++++++-------
 drivers/video/fbdev/core/fbcon.h        | 15 +++++++++-
 drivers/video/fbdev/core/fbcon_ccw.c    | 10 +++----
 drivers/video/fbdev/core/fbcon_cw.c     | 10 +++----
 drivers/video/fbdev/core/fbcon_rotate.h |  4 +--
 drivers/video/fbdev/core/fbcon_ud.c     | 20 ++++++-------
 7 files changed, 75 insertions(+), 34 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 840d9813b0bc..6029fd41d7d0 100644
=2D-- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
 	help
 	  Low-level framebuffer-based console driver.

+config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
+	bool "Framebuffer Console hardware acceleration support"
+	depends on FRAMEBUFFER_CONSOLE
+	default n if DRM
+	default y
+	help
+	  If you use a system on which DRM is fully supported you usually want t=
o say N,
+	  otherwise you probably want to enable this option.
+	  If enabled the framebuffer console will utilize the hardware accelerat=
ion
+	  of your graphics card by using hardware bitblt and fillrect features.
+
 config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
        bool "Map the console to the primary display device"
        depends on FRAMEBUFFER_CONSOLE
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/f=
bcon.c
index b813985f1403..f7b7d35953e8 100644
=2D-- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int ini=
t)

 	ops->graphics =3D 0;

+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
 	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
 	    !(cap & FBINFO_HWACCEL_DISABLED))
 		p->scrollmode =3D SCROLL_MOVE;
 	else /* default to something safe */
 		p->scrollmode =3D SCROLL_REDRAW;
+#endif

 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigne=
d int t, unsigned int b,
 			count =3D vc->vc_rows;
 		if (logo_shown >=3D 0)
 			goto redraw_up;
-		switch (p->scrollmode) {
+		switch (fb_scrollmode(p)) {
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, t, b - t - count,
 				     count);
@@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigne=
d int t, unsigned int b,
 			count =3D vc->vc_rows;
 		if (logo_shown >=3D 0)
 			goto redraw_down;
-		switch (p->scrollmode) {
+		switch (fb_scrollmode(p)) {
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
 				     -count);
@@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc, st=
ruct fbcon_display *p, int sy,
 		   height, width);
 }

-static void updatescrollmode(struct fbcon_display *p,
+static void updatescrollmode_accel(struct fbcon_display *p,
 					struct fb_info *info,
 					struct vc_data *vc)
 {
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
 	struct fbcon_ops *ops =3D info->fbcon_par;
-	int fh =3D vc->vc_font.height;
 	int cap =3D info->flags;
 	u16 t =3D 0;
 	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
@@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_display *=
p,
 	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
 		!(cap & FBINFO_HWACCEL_DISABLED);

-	p->vrows =3D vyres/fh;
-	if (yres > (fh * (vc->vc_rows + 1)))
-		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
-	if ((yres % fh) && (vyres % fh < yres % fh))
-		p->vrows--;
-
 	if (good_wrap || good_pan) {
 		if (reading_fast || fast_copyarea)
 			p->scrollmode =3D good_wrap ?
@@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_display *=
p,
 		else
 			p->scrollmode =3D SCROLL_REDRAW;
 	}
+#endif
+}
+
+static void updatescrollmode(struct fbcon_display *p,
+					struct fb_info *info,
+					struct vc_data *vc)
+{
+	struct fbcon_ops *ops =3D info->fbcon_par;
+	int fh =3D vc->vc_font.height;
+	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
+	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
+				   info->var.xres_virtual);
+
+	p->vrows =3D vyres/fh;
+	if (yres > (fh * (vc->vc_rows + 1)))
+		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
+	if ((yres % fh) && (vyres % fh < yres % fh))
+		p->vrows--;
+
+	/* update scrollmode in case hardware acceleration is used */
+	updatescrollmode_accel(p, info, vc);
 }

 #define PITCH(w) (((w) + 7) >> 3)
@@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)

 	updatescrollmode(p, info, vc);

-	switch (p->scrollmode) {
+	switch (fb_scrollmode(p)) {
 	case SCROLL_WRAP_MOVE:
 		scrollback_phys_max =3D p->vrows - vc->vc_rows;
 		break;
diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/f=
bcon.h
index 9315b360c898..0f16cbc99e6a 100644
=2D-- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -29,7 +29,9 @@ struct fbcon_display {
     /* Filled in by the low-level console driver */
     const u_char *fontdata;
     int userfont;                   /* !=3D 0 if fontdata kmalloc()ed */
-    u_short scrollmode;             /* Scroll Method */
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
+    u_short scrollmode;             /* Scroll Method, use fb_scrollmode()=
 */
+#endif
     u_short inverse;                /* !=3D 0 text black on white as defa=
ult */
     short yscroll;                  /* Hardware scrolling */
     int vrows;                      /* number of virtual rows */
@@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc_da=
ta *vc,
 #define SCROLL_REDRAW	   0x004
 #define SCROLL_PAN_REDRAW  0x005

+static inline u_short fb_scrollmode(struct fbcon_display *fb)
+{
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
+	return fb->scrollmode;
+#else
+	/* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
+	return SCROLL_REDRAW;
+#endif
+}
+
+
 #ifdef CONFIG_FB_TILEBLITTING
 extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
 #endif
diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/co=
re/fbcon_ccw.c
index 9cd2c4b05c32..2789ace79634 100644
=2D-- a/drivers/video/fbdev/core/fbcon_ccw.c
+++ b/drivers/video/fbdev/core/fbcon_ccw.c
@@ -65,7 +65,7 @@ static void ccw_bmove(struct vc_data *vc, struct fb_info=
 *info, int sy,
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);

 	area.sx =3D sy * vc->vc_font.height;
 	area.sy =3D vyres - ((sx + width) * vc->vc_font.width);
@@ -83,7 +83,7 @@ static void ccw_clear(struct vc_data *vc, struct fb_info=
 *info, int sy,
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dx =3D sy * vc->vc_font.height;
@@ -140,7 +140,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_in=
fo *info,
 	u32 cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -229,7 +229,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_i=
nfo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -387,7 +387,7 @@ static int ccw_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	u32 yoffset;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
 	int err;

 	yoffset =3D (vyres - info->var.yres) - ops->var.xoffset;
diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/cor=
e/fbcon_cw.c
index 88d89fad3f05..86a254c1b2b7 100644
=2D-- a/drivers/video/fbdev/core/fbcon_cw.c
+++ b/drivers/video/fbdev/core/fbcon_cw.c
@@ -50,7 +50,7 @@ static void cw_bmove(struct vc_data *vc, struct fb_info =
*info, int sy,
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	area.sx =3D vxres - ((sy + height) * vc->vc_font.height);
 	area.sy =3D sx * vc->vc_font.width;
@@ -68,7 +68,7 @@ static void cw_clear(struct vc_data *vc, struct fb_info =
*info, int sy,
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dx =3D vxres - ((sy + height) * vc->vc_font.height);
@@ -125,7 +125,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_inf=
o *info,
 	u32 cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -212,7 +212,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -369,7 +369,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 static int cw_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vxres =3D GETVXRES(ops->p, info);
 	u32 xoffset;
 	int err;

diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev=
/core/fbcon_rotate.h
index e233444cda66..01cbe303b8a2 100644
=2D-- a/drivers/video/fbdev/core/fbcon_rotate.h
+++ b/drivers/video/fbdev/core/fbcon_rotate.h
@@ -12,11 +12,11 @@
 #define _FBCON_ROTATE_H

 #define GETVYRES(s,i) ({                           \
-        (s =3D=3D SCROLL_REDRAW || s =3D=3D SCROLL_MOVE) ? \
+        (fb_scrollmode(s) =3D=3D SCROLL_REDRAW || fb_scrollmode(s) =3D=3D=
 SCROLL_MOVE) ? \
         (i)->var.yres : (i)->var.yres_virtual; })

 #define GETVXRES(s,i) ({                           \
-        (s =3D=3D SCROLL_REDRAW || s =3D=3D SCROLL_MOVE || !(i)->fix.xpan=
step) ? \
+        (fb_scrollmode(s) =3D=3D SCROLL_REDRAW || fb_scrollmode(s) =3D=3D=
 SCROLL_MOVE || !(i)->fix.xpanstep) ? \
         (i)->var.xres : (i)->var.xres_virtual; })


diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/cor=
e/fbcon_ud.c
index 8d5e66b1bdfb..23bc045769d0 100644
=2D-- a/drivers/video/fbdev/core/fbcon_ud.c
+++ b/drivers/video/fbdev/core/fbcon_ud.c
@@ -50,8 +50,8 @@ static void ud_bmove(struct vc_data *vc, struct fb_info =
*info, int sy,
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_copyarea area;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	area.sy =3D vyres - ((sy + height) * vc->vc_font.height);
 	area.sx =3D vxres - ((sx + width) * vc->vc_font.width);
@@ -69,8 +69,8 @@ static void ud_clear(struct vc_data *vc, struct fb_info =
*info, int sy,
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	struct fb_fillrect region;
 	int bgshift =3D (vc->vc_hi_font_mask) ? 13 : 12;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	region.color =3D attr_bgcol_ec(bgshift,vc,info);
 	region.dy =3D vyres - ((sy + height) * vc->vc_font.height);
@@ -162,8 +162,8 @@ static void ud_putcs(struct vc_data *vc, struct fb_inf=
o *info,
 	u32 mod =3D vc->vc_font.width % 8, cnt, pitch, size;
 	u32 attribute =3D get_attribute(info, scr_readw(s));
 	u8 *dst, *buf =3D NULL;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -259,8 +259,8 @@ static void ud_cursor(struct vc_data *vc, struct fb_in=
fo *info, int mode,
 	int attribute, use_sw =3D vc->vc_cursor_type & CUR_SW;
 	int err =3D 1, dx, dy;
 	char *src;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
+	u32 vxres =3D GETVXRES(ops->p, info);

 	if (!ops->fontbuffer)
 		return;
@@ -410,8 +410,8 @@ static int ud_update_start(struct fb_info *info)
 {
 	struct fbcon_ops *ops =3D info->fbcon_par;
 	int xoffset, yoffset;
-	u32 vyres =3D GETVYRES(ops->p->scrollmode, info);
-	u32 vxres =3D GETVXRES(ops->p->scrollmode, info);
+	u32 vyres =3D GETVYRES(ops->p, info);
+	u32 vxres =3D GETVXRES(ops->p, info);
 	int err;

 	xoffset =3D vxres - info->var.xres - ops->var.xoffset;
=2D-
2.34.1

