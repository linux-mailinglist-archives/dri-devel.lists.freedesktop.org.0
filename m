Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D98493946
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF15C10E9D4;
	Wed, 19 Jan 2022 11:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A83510E647
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 11:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642590588;
 bh=RGiIIof/++wYXg6xAlJlqJrLedfDeADl0VZRLLIROQA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Oe10AR4JkCg160gI7uvY57z0umFQNt5bKmahozBPxl0wx85r+zQteEaxYrd1v9+uR
 7Q36lpdLd4fZ7pHzpao2Tu7ikk5SyRlQ0V1e0eRWnKhlBGn4QVDgrvoTkJ5kn6VQTr
 5wCELjmJVZ2LyPVddmsrZ1YdfRLy5W2UEa3k5iw0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.183.52]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1mQbLa3R9Z-00jX0h; Wed, 19
 Jan 2022 12:09:47 +0100
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
Subject: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Date: Wed, 19 Jan 2022 12:08:39 +0100
Message-Id: <20220119110839.33187-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220119110839.33187-1-deller@gmx.de>
References: <20220119110839.33187-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Roi+RGUkFP/ZjyHOVDyhOFbAk4MIfBdlPeQy/dls++mRYGy/G33
 TXlCK+Rl1iZFrJ/pPRsyP1hVUEoVJcV10TNFk88b4fke7C199gmzM/Od8cCvhGCGm3xa9jo
 2dQf5U/OEBZhgrhUEvm/OKIdaRMooaLsfLnCXHhixPHJKJN+OX0hJR99bfyDrxrBU3eJ60D
 A2C8n/TpWNEzNaUZ5AFHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i8VsAxP1Cto=:EcQZcKgte4cEUKEORz5Npv
 YSa/An/vjP7tEnxHbOeWBqsSHbsr6Ud/Pgy+jn2uEayw7lL4Zp4t6xFAE6+HSfEy+zq3zZPV+
 k2u5Q9YKY/KhU3rq9dqWcvHwSnIDyfKsEohptq0/3injCNIE39oJ413CjkkcbKNKykJWgbgl6
 pp5gFYfDZkCMUu98FHQD5mKSaZzttx3hiYmGamLIsNoZMxfki958WeT11wNG1bx8HGPqYAitL
 +cQBOeLUJWPHjJI3u4aQTgWtKKY5MLGfUZVgjV+UJlH0vTe6OgMFgEOKqN6QPGcFk4b6IWZqP
 FAGpFfbf1hT096Oxjbvv70MxJwkUk7iMR3LmH8shxlxUGM13LSZbcpJ5gsxpwu43MqM3LblN3
 CDTZFvBcO7m8KhBeU2OGWuSyaHReiktPj8dJEFzg9HyStPWEmY7Be6n5XOn4Qp2dh1MxzZ8rS
 p1q5thIzzpbLpUPAwfhJZk4vxBeLVO/snqFODrvwKo1CRmjOAguoIMC6X2t7xjmci5xgNfU4z
 8h1xQ+HxgII3Cz8O7sDkhgaNqjfR+MO32dWiM/+TtriBF3PZ67Ij9mJ3U5VMr9myt2pr/Hn6p
 OX1GaxZBZC/TH8NTs7WrR78SllP+uG+XHyhxencuoed0hYBHAByfqfHhNgIzUaBcQq1jZJHs+
 RrV4nwmyhcJLB+cwlY3g6h0BB3MkSMMKvgmTUbfjfKefNUf5UQKXoIhVEJlLzFm7ugF/dy2IG
 6K7An8uTGaGEqX/03EaWttCkpi+49jO5iX5YPEUVPbUuGLpm7dyIMG0vmxy0UKrEAiu6UYVPX
 5kdIFc02nj4ZIvYSNZCowJtttBWk2YVtHbKJJNV4ndYGrf/A3IXtxA4vu1YOAMbNTVZjJ0SI9
 tcdwFCLGkeqmgaR/06LVCgy+l6kHTc5E6+WjuoGNRC2rW4KOZxF/j9FImtQSqWGDpzxKRGFeV
 N6T/01a1kk/8essodfJIZLuTKl6RnbhQO1CJbcvh0qwp0vZH8+C4cQHpY/WhJjhKQYe+/ZgGh
 68J2s99AFvxnGf1tPHYrLSq33/2rGQBJRP4sgAy02AwEQEcmXJse4vygsGk2O9xWFlbUL8mls
 pGlv8WjvSTQPjQ=
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

This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.

Revert this patch.  This patch started to introduce the regression that
all hardware acceleration of more than 35 existing fbdev drivers were
bypassed and thus fbcon console output for those was dramatically slowed
down by factor of 10 and more.

Reverting this commit has no impact on DRM, since none of the DRM drivers =
are
tagged with the acceleration flags FBINFO_HWACCEL_COPYAREA,
FBINFO_HWACCEL_FILLRECT or others.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.16
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
2.31.1

