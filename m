Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F067A91E5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2B110E0D0;
	Thu, 21 Sep 2023 07:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C403910E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:09:37 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1qjDkX-003HZ5-Oh; Thu, 21 Sep 2023 09:05:21 +0200
Received: from p5b13a40a.dip0.t-ipconnect.de ([91.19.164.10]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1qjDkX-0029eD-7S; Thu, 21 Sep 2023 09:05:21 +0200
Message-ID: <cea63c1eb47c9a438d21bc1fce5a48e4b3235342.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] fbdev: sh7760fb: require FB=y to build cleanly
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Thu, 21 Sep 2023 09:05:20 +0200
In-Reply-To: <20230921060228.29041-1-rdunlap@infradead.org>
References: <20230921060228.29041-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.164.10
X-ZEDAT-Hint: PO
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy!

On Wed, 2023-09-20 at 23:02 -0700, Randy Dunlap wrote:
> Fix build errors when CONFIG_FB=3Dm and CONFIG_FB_SH7760=3Dy:
>=20
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_probe=
':
> sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
> sh2-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_videom=
ode_to_var'
> sh2-linux-ld: sh7760fb.c:(.text+0x3a0): undefined reference to `fb_alloc_=
cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `register_=
framebuffer'
> sh2-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_deallo=
c_cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `framebuff=
er_release'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_remov=
e':
> sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebuffer'
> sh2-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_deallo=
c_cmap'
> sh2-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `framebuff=
er_release'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined ref=
erence to `fb_io_read'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefined re=
ference to `fb_io_write'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefined re=
ference to `cfb_fillrect'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefined re=
ference to `cfb_copyarea'
> sh2-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefined re=
ference to `cfb_imageblit'
>=20
> Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer dri=
ver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> ---
>  drivers/video/fbdev/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1762,7 +1762,7 @@ config FB_COBALT
> =20
>  config FB_SH7760
>  	bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
> -	depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
> +	depends on FB=3Dy && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
>  		|| CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
>  	select FB_IOMEM_HELPERS
>  	help

Actually, Thomas Zimmermann already posted the same patch already on Monday=
 ;-).

See [1].

Adrian

> [1] https://marc.info/?l=3Ddri-devel&m=3D169502772500717&w=3D2

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
