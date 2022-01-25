Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C349BBDD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 20:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E522610E3DF;
	Tue, 25 Jan 2022 19:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6654310E3DF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 19:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643137931;
 bh=iKlAQrkzi2Hi0Nb0738k8LVeYWb5SMaZI+WvY2hsrAw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Pi7FviEFbxilpIZrFE45qwmXBp0Xe+ivJ4KyMJQlxoqKhuA49BlcUI2eInSS0p32G
 PvLHGcBqpv2v6hKX/tsljgnJqQXJzhkfpSsq0NVWKqJEUjDcDbFPW26s7dgW6EHDXp
 qsJP1QLMPDIV6e041gcBl0whrWqrcFXdC5NF9Qmw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.165.229]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1ps8-1nEd5n2iYi-002EEE; Tue, 25
 Jan 2022 20:12:11 +0100
Date: Tue, 25 Jan 2022 20:12:09 +0100
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] [RFC] fbcon: Add option to enable legacy hardware acceleration
Message-ID: <YfBLiUMokw6tLq0O@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:x0vnOcIlIf31efl4HnVd6aGOkd98gXd6LXjnteoPBppzlET4fr8
 XkXaw2G/iv1vWBBgNicNPIVutwLmommGUn84xyTYYP6lD5BCPQ2NCmOSp8goEAKrFhHT4X2
 lsqcGPNOe0VcS5vH4CCAiOHmhNYLaaLIpGyGJHo1e2hslJ3jJtxd8m376PtB1E1W3A9gCZ7
 254uBRFau3Uz5dzLiMDpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zjykn0/sYI4=:/rR1QJQO/5V732tV5iLJfN
 Coe/suHHtjasdnCa2N6AgWGH3FAdkfhPRKIVr6KEWHjLcl+9F0EwY6IC242CoaP/mAggpt7Nq
 mcRNe99aop9fJUiGDSB9l5iccYebKkNjg5Q8UCX/NUkSqoP4WA81+SmtrnqmMgUePaQXgMlwz
 Bu8EzPfV2s28a0GPjRE485EGrX8PdSqdlufe4nGDl9CYFPpBIDhODUpOxQwMTnTEDO68dLM25
 7KuQWDd9nnjisPdBavBzSIFag4+aM4ll+p/XQq7k9Fu2rZ62iSWCbob4AzrP/2zKpmd9L9Kt6
 IdW5OofzdLmXZW3r6q0qStovCuGfFT47QxufeNxp1kRzHq3AqsH2XsGUqNqLZp4JTfkxZPH1C
 IkQ45Lx5s9LhX5PWg2W9r+lKcZ+uDZjm61k+Z5I2ODeM8KjPabgvpG70k6Oq5O4j4BchMVNYy
 5sDD6rzwV3V1+QphNJkoCkC3rVdpA53esVONKoOygCdUSVGgFhMvZXy6Km1uIlaLB1t6uo6cf
 RDDFfmJlvvyMpyhcGObKu5Fh/Bj5g5P7EhR4S8N+WFeTs9BQV+7u3YStxQgoWLYkGrRAD3tRL
 kQ+FkGITQG8/7iPNe0OHGkTP/jwf5M2PB394Ajiia8u8XcwbZRa3RezPTA2ln6Fri2IqnpoIB
 F5rT5+e6wxfd30HnZ+N8UBp91m5Bl+1tMKlBrX9MRAZ+A4kMBtsLUki8MBDqEyo3TkQDgN9QQ
 0BebhbElSwcggQoXoTljNXcW08KKWbuBnAGYlgZhvnZL0VphgPOVyv1rgMashrC+8QqwwoODI
 jEh8MUVWnk/soTB0WVuWVSXm5Koj6k83y5SjSYOx4R/m876gtkFH89LrOX3PAyuBR3GLCQiut
 yKMHFIU0ssZynTzA6TDFLVhnAi26GwDuiPM1yS1LgoSbVmL5XwW2qxvGO2rE0ckRR8cO7GoNy
 YiWmSQ1pEsR982zHjy3tVZskbf68Tg4oCCMb91YSa5rVXU4pf85Z31SQpLdYQgArpQkW7LPyy
 NXpxyTZNcdeeSDh3ypY0o/ZIOwS2qt4dCfxC+CsplYSHa6p0Vxj4cRAIXMd9CmHV+ZxT2h+wF
 aidCfYRLTQOr84=
Content-Transfer-Encoding: quoted-printable
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


This patch is the first RFC.


Independed of this patch I did some timing experiments with a qemu
virtual machine running a PA-RISC Debian Linux installation with a
screen resolution of 2048x1024 with 8bpp. In that case qemu emulated the
graphics hardware bitblt and fillrect acceleration by using the native
(x86) CPU.

It was a simple testcase which was to run "time dmesg", where the syslog
had 284 lines. The results showed a huge speedup:
a) time dmesg (without acceleration):
   -> 19.0 seconds
b) time dmesg (with acceleration):
   ->  2.6 seconds

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 840d9813b0bc..da84d1c21c21 100644
=2D-- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
 	help
 	  Low-level framebuffer-based console driver.

+config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
+	bool "Framebuffer Console hardware acceleration support"
+	depends on FRAMEBUFFER_CONSOLE
+	default y if !DRM
+	default y if !(X86 || ARM)
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
index 9315b360c898..c5c043f38162 100644
=2D-- a/drivers/video/fbdev/core/fbcon.h
+++ b/drivers/video/fbdev/core/fbcon.h
@@ -29,7 +29,9 @@ struct fbcon_display {
     /* Filled in by the low-level console driver */
     const u_char *fontdata;
     int userfont;                   /* !=3D 0 if fontdata kmalloc()ed */
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
     u_short scrollmode;             /* Scroll Method */
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
