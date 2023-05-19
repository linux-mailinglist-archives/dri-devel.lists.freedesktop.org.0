Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C481709A01
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 16:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAAC10E47A;
	Fri, 19 May 2023 14:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873B810E47A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684507058; i=deller@gmx.de;
 bh=Guk5OAVaQT2V82v4yw60pBxCCIuR2J3jwqL679tWxM0=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=rdwnwLLYYcCnM5j3hLv80sHbvXK+aAIDx6ycWmyOQ9Spkh67upZDQz1XDhe2VxNvm
 GdTpVxiFIbljqW5rxBEG1y8z5BE6LZCRgXML4H0qUD0eGy2QvdnkcNb3VAgTYYjpvs
 LJOTQ2OCCVfKp6Jm8wPOF428e9fYWzgZylbOy2mt9yJ8oZlGwmgfQCNI8sl7KOlTeh
 0hwvr39iyAnjvpcEOuAuH+YJHNUDzFY7i17HCLl5/m6zHAZU9EyF0mg07my9rFTJ46
 MZlqwZXTeI39x5UOt8k+iI4m3IIVO4NagGOCkqA+fCRrkowFRQagQ8v/Ghr8emFIEu
 dwpgl4swAq1ww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.152.232]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GMk-1qDCUM2cE4-014Blk; Fri, 19
 May 2023 16:37:38 +0200
Date: Fri, 19 May 2023 16:37:37 +0200
From: Helge Deller <deller@gmx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
Message-ID: <ZGeJsYmPU/7CHJRV@ls3530>
References: <20230516202257.559952-1-arnd@kernel.org>
 <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
X-Provags-ID: V03:K1:FmMyGNPGtm42rqLtFFlFWmqrjodEJSPVLrnRqz9h9cq6sxxcUqU
 oDZ78WlNoVwQ2COO+NSNM6bZ4GQgIMVZk/eXk0MGz3ZIv4bzu0ajXTD9GXiTWb//bEsM67M
 ySYCoN0LyG9+6ZiDVM9RBOc6KHkf02KRxKhjTJ1tSBp4pQHR8n3IpviE1bmSUPaqtaeu5Uy
 UQM6Cp0kr97AJWaNxS4Qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kjf9fEEF6jA=;YBr2hg4Nr/IbyhZRzwQFnxJmm9c
 NdndvQBM2a6oC05XwYmFwaJoVgREJBxd+9+gUhwWvD6+aUcyXydBtbl5ZPwWqIEEDcmL5B/57
 ic0vHyp5qPGKbyJI+wx6FutVN45wrtLisx6+fmfh7EsXShCc2xQ8xzrtN4dTIq/jPTV+ybR9I
 JBNYdN7WYPp+1XMHwOdklraFaP2GtkzTyeMU+6p9uWkHs+WDNonyXNZr2Wsvkselq3jyClrRv
 FpH5LuE2sJyHAA/be8/CUkholRKu0BTJ+HINiJFFzTsb0Ab/Pf9NNfssX7POKSzkNjL+imrEt
 OX+diiGFwwAY4H9up53Iw0CsBCWc0Y/kCIRjoKWqRWrobcoIqX+5nrpdmEJL+vGOb97rP0N+i
 AJvHTuXApgmXYTjaUTCUoLicQNidr/VcsZp5RCVYZ8+Y9hIEyKpyKGsxHn/J0lmAidlXD4jHQ
 4jTA90Ka22ahVxYNyyyHaMVOmiY+ODuYCpuq1ZD7CCjmrdMXsgwcJpt5ulMf8fhCMASjEpyQ7
 d2krTN/pxovAB9FvC1seewTOBMv6mpmhiWqcA1i2gr1qcT54GY4cecVYIjkgEJkPoQxVg1+26
 YYP45+D9maLyp9isBZZIwk0I/J9bDrcRWzUthaNNPm3eB0P/8FA/Xb6TwpFAtAEk8yb2JdYhh
 DZDjeB4VwIXKd2cXWk6jUpFiAm0Fdm63MJcP/zpxvoN0ZlDbo7jxPVzQKgr5sXZG8AcydCbmJ
 G1BaGUPe9CVwob7Mxb1i6Ojt/Te0v5L3Y/MRuYCQA6ey445FOPEZZxNxfE26DcxYeMu1GX2YG
 RfvS71/w3A1vkvu8ktmX9LnyZ+qYx7AEILNDRxFT/DMnhh4Ia7guN8W/uw4N5kwHnc6SyzKYp
 v487nhqCQVJZMy0KxkU9StS04v69CQekGJloJfXoRqAA7+Rh1r1SetlL82ulnzFwxen+T02Tz
 qN8DNA==
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

* Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Arnd,
>
> On Tue, May 16, 2023 at 10:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There is a global function with this name on sparc, but no
> > global declaration:
> >
> > drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype=
 for 'get_fb_unmapped_area'
> >
> > Make the generic definition static to avoid this warning. On
> > sparc, this is never seen.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1468,7 +1468,7 @@ __releases(&info->lock)
> >  }
> >
> >  #if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFI=
G_MMU)
> > -unsigned long get_fb_unmapped_area(struct file *filp,
> > +static unsigned long get_fb_unmapped_area(struct file *filp,
> >                                    unsigned long addr, unsigned long l=
en,
> >                                    unsigned long pgoff, unsigned long =
flags)
> >  {
>
> LGTM, as this is unrelated to the SPARC function, and SPARC does
> not support nommu (yet? ;-)
>
> drivers/video/fbdev/Kconfig:config FB_PROVIDE_GET_FB_UNMAPPED_AREA
> drivers/video/fbdev/Kconfig-    bool
> drivers/video/fbdev/Kconfig-    depends on FB
> drivers/video/fbdev/Kconfig-    help
> drivers/video/fbdev/Kconfig-      Allow generic frame-buffer to
> provide get_fb_unmapped_area
> drivers/video/fbdev/Kconfig-      function.
>
> Probably you want to update this help text, too. E.g.
> "to provide shareable character device support on nommu"?

I've added Geerts suggestions and made it dependend on !MMU.

Applied to fbdev git tree as below.

Thanks!
Helge


=46rom 9adfa68ca0ddd63007cdce60a8ffcb493bb30d97 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static

There is a global function with this name on sparc, but no
global declaration:

drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype for=
 'get_fb_unmapped_area'

Make the generic definition static to avoid this warning. On
sparc, this is never seen.

Edit by Helge:
Update Kconfig text as suggested by Geert Uytterhoeven and make it depende=
nd on
!MMU.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 96e91570cdd3..1688875a07de 100644
=2D-- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -121,10 +121,10 @@ config FB_SYS_IMAGEBLIT

 config FB_PROVIDE_GET_FB_UNMAPPED_AREA
 	bool
-	depends on FB
+	depends on FB && !MMU
 	help
 	  Allow generic frame-buffer to provide get_fb_unmapped_area
-	  function.
+	  function to provide shareable character device support on nommu.

 menuconfig FB_FOREIGN_ENDIAN
 	bool "Framebuffer foreign endianness support"
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index e808dc86001c..21a108d9f08e 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1467,8 +1467,8 @@ __releases(&info->lock)
 	return 0;
 }

-#if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CONFIG_MM=
U)
-unsigned long get_fb_unmapped_area(struct file *filp,
+#if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA)
+static unsigned long get_fb_unmapped_area(struct file *filp,
 				   unsigned long addr, unsigned long len,
 				   unsigned long pgoff, unsigned long flags)
 {
@@ -1494,8 +1494,7 @@ static const struct file_operations fb_fops =3D {
 	.open =3D		fb_open,
 	.release =3D	fb_release,
 #if defined(HAVE_ARCH_FB_UNMAPPED_AREA) || \
-	(defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && \
-	 !defined(CONFIG_MMU))
+	defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA)
 	.get_unmapped_area =3D get_fb_unmapped_area,
 #endif
 #ifdef CONFIG_FB_DEFERRED_IO
