Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B978CD47
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 22:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931D010E085;
	Tue, 29 Aug 2023 20:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B1D10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 20:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1693339376; x=1693944176; i=j.neuschaefer@gmx.net;
 bh=lg5pj3dzVGowh2JUIgjyLPKyTlGmgpDjIfuCipKzTZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jKSmlhGSRTFuxaaf7iWjl4/nwLhA3eWC56MWa1gEIJXcRJZDSJjGV/4/IAxDIOX1tjVgMEE
 VzXdPq6dgXJlxUOp/JU63Wp4Kf7rUiqohJo/jnUPKSRqL4KM41JTKiQdHJgUHRO5pRnzK5PcN
 0696HpNKi11ChDExvX3TNmUNbQC1j51MB09OzFAFo5XRAV46PU1PPD5bOxT1Tztht6qPyKEF8
 5sqlKlhoXSMEAhXgeCPzzjrx5sdxCEpNGfOqb2H7c4htucJGNCCa1qV5hYxSaWYKlP0Cj225U
 wPUtFWBSMvrJkDVVhzQxjLjSgKnsVwOIaRi2DOOPLV9qB/4BQuqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.154.222.166]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTABZ-1q73Zn1wR5-00UcHm; Tue, 29
 Aug 2023 22:02:56 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-fbdev@vger.kernel.org
Subject: [PATCH] fbdev: Update fbdev source file paths
Date: Tue, 29 Aug 2023 22:02:52 +0200
Message-Id: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7m61yDqPekLpjBk3hCmP1bMSwW5yQXxD++BEvCEIejsTl24Svld
 oKkPxWjZMc8ISL01SueDCdACV22gdFh8Ogfg/dKhfCn755CMyxej7aWuJ3zNqPJPv8Pzch7
 YSaGGPhNdFZavhIsKts1JIbExLR9AWW3DgGPCmw4dlEVzB4JpyjMqIHv6i+w74luzqlw7pQ
 xzmnIlL83dLElVzdgCywQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OVMas4vSyPQ=;pcm1/W4MU4//d7kEG7Euf68Nn/k
 VEl5PIZu5dHRLAJgxbnwXvFLX6QfhFxPpB4GwiDejZ9ZFt+wfdlTkWtgsStm0LJKB+9mTRF55
 tty/qRQlr+04+ZdXu0wZK49UWq0XOjPaMv3PcxDfkg4i9kV9CFIClRhleeX+Veq59HnsLkoL7
 WDn4MBNFSe7VDBoll+FnQJuiqk2KvqOSY4KC7At1BtOmYd+sWW/X/pQ3p7RLZlFw2nJDJhcTK
 Ok71ESJ2tD4tJW15LeB+o1COw/LsJhIb8aI9TkMMarC4fSNoa8kraw+gijKS/EMhjMF6EoEyL
 VEuKMq9W/7ftOWF5miej18DNsg+kPp130hTVJskbOKlSEvswPyfy8IOoJB8v3Jw3g1Xr7a6G7
 v3gV5fA2eK9c1WhM5nhPm/R1AZIHk73/G2ust76rt9D7woJv7wMnStVsIQrBkdaBLj3UEa4oR
 CInue8OGWosuLvldfW7w+vBH5wG1GjAgG2SFFpb6nHW/oJ3kh+xvKamT+GuU01rONDvtdkD4Z
 HiMw+3wdCKoJNOZXt8EBCC9KbylMVSU00xTTpxLurgvK4nI4T4INqdrVeZcXGGOuY36HLx+zz
 G8SbSDZAv6TxdMa1WhDdeCbrpXcYcZ3zwEXC1gtp1ZD5TZIjjoOX2EsMpkvl5F7Pirlmj0DEb
 R5a5mHUV0agu396ibLg5byIIZGmZPjiLU06xH6prx4ocrZhFGU9VLaNNTSVoSzcif9uSnnWwE
 AriAhJlFXT95cx1i0dMjKPzsEqRMr+ULZVpnEq1cXBbRC1K3UuOwrpdl08TkqiIMf2VL1VSLs
 RxeuPV5Ld4OeFJRENU7NxOLnkEKZwD9Tkw7hdJ6P1YysXFoCBymIoX/pA2Jx6XxBpK6gyxfso
 Gyf2TzibNxyjJHOtUWbfJ+XxC1kZZZ0BEyZI70LOL5NlVYCbHWPaYFrjtUDuYMTTMJulmdCj9
 bTb1yw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jingoo Han <jg1.han@samsung.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
fbcmap.c were moved to drivers/video/fbdev, and subsequently to
drivers/video/fbdev/core, in the commits listed below.

Reported by kalekale in #kernel (Libera IRC).

Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate directory")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/linux/fb.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index ce7d588edc3e6..3cda5b9f2469b 100644
=2D-- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -592,7 +592,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, cons=
t char __user *buf,
 	__FB_DEFAULT_SYS_OPS_DRAW, \
 	__FB_DEFAULT_SYS_OPS_MMAP

-/* drivers/video/fbmem.c */
+/* drivers/video/fbdev/core/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
@@ -636,7 +636,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u3=
2 d_pitch,
 	}
 }

-/* drivers/video/fb_defio.c */
+/* drivers/video/fbdev/core/fb_defio.c */
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)=
;
 extern int  fb_deferred_io_init(struct fb_info *info);
 extern void fb_deferred_io_open(struct fb_info *info,
@@ -735,14 +735,14 @@ static inline bool fb_be_math(struct fb_info *info)
 #endif /* CONFIG_FB_FOREIGN_ENDIAN */
 }

-/* drivers/video/fbsysfs.c */
+/* drivers/video/fbdev/core/fbsysfs.c */
 extern struct fb_info *framebuffer_alloc(size_t size, struct device *dev)=
;
 extern void framebuffer_release(struct fb_info *info);
 extern int fb_init_device(struct fb_info *fb_info);
 extern void fb_cleanup_device(struct fb_info *head);
 extern void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, =
u8 max);

-/* drivers/video/fbmon.c */
+/* drivers/video/fbdev/core/fbmon.c */
 #define FB_MAXTIMINGS		0
 #define FB_VSYNCTIMINGS		1
 #define FB_HSYNCTIMINGS		2
@@ -776,7 +776,7 @@ extern int of_get_fb_videomode(struct device_node *np,
 extern int fb_videomode_from_videomode(const struct videomode *vm,
 				       struct fb_videomode *fbmode);

-/* drivers/video/modedb.c */
+/* drivers/video/fbdev/core/modedb.c */
 #define VESA_MODEDB_SIZE 43
 #define DMT_SIZE 0x50

@@ -802,7 +802,7 @@ extern void fb_videomode_to_modelist(const struct fb_v=
ideomode *modedb, int num,
 extern const struct fb_videomode *fb_find_best_display(const struct fb_mo=
nspecs *specs,
 						       struct list_head *head);

-/* drivers/video/fbcmap.c */
+/* drivers/video/fbdev/core/fbcmap.c */
 extern int fb_alloc_cmap(struct fb_cmap *cmap, int len, int transp);
 extern int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, g=
fp_t flags);
 extern void fb_dealloc_cmap(struct fb_cmap *cmap);
=2D-
2.40.1

