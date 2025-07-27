Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40336B1301A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 17:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F75A10E2EB;
	Sun, 27 Jul 2025 15:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="BHp3Linz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAED10E2EB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753630848; x=1754235648; i=deller@gmx.de;
 bh=7KFIp9QJjt86jqd8grVfKPODLA75ai887TcSuOQb0Jo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BHp3Linz0SblKbiBNlBmI/4FPGitxRSEyi3tZi8IFC7BFSX4JjSor915YJ4oNk5b
 y9lUWXjJbxmy219zb4HJpS6Cumasp93iQY4uG+rR6vnddxa7a2LcnpIL/tMTRyZFy
 tmLJacrzAb01X4CXG61psRfk0Fe87vGxYKtU//mlcrcvwZ+W/URpV4l77SyfW+5kq
 GQIsr4fMbK72bIVuW/Qq9aqnoLu10+YMw00ghP7IO/meRimep0NkEYWgZpZpWgQJk
 gfbmeTtLxztlOnidu97LO0E3khjXjxPQjvxPY251JqmaJvkAWTQv8gxdB8sQXjFfx
 50TA0k28L1m/rvaYMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLiCu-1uxaHz1wtE-00PiE0; Sun, 27
 Jul 2025 17:35:15 +0200
Message-ID: <09e7d9c0-3348-49d0-a390-372031652e97@gmx.de>
Date: Sun, 27 Jul 2025 19:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: nvidiafb: add depends on HAS_IOPORT
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Antonino Daplas <adaplas@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250615183651.902092-1-rdunlap@infradead.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250615183651.902092-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IHUNI1p1fU113kR6OYZbvVxGwAn0J7KM6wwR5NDy/erYDrHSSOi
 QIbDbkISPEAcaJU/T643idMZXkViROBAAL1/tgSnEE9WO/xLZdO7Gzy6sHSeXE0ltm/ptqg
 kycRFEccYJ02IE9VUvwAIYx3D3thfwnuvWRXms0l6xfH2XIvS+2zQCswWSbcJtX6d8q8Rd3
 xdDdA18lJ3lU42DiXB4cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Pv1D60Ux+2I=;Pqh58cwgc2zKalntDHEnxbx2Rlc
 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
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

On 6/15/25 20:36, Randy Dunlap wrote:
> The nvidiafb driver uses inb()/outb() without depending on HAS_IOPORT,
> which leads to build errors since kernel v6.13-rc1:
> commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
> for HAS_IOPORT=3Dn")
>=20
> Add the HAS_IOPORT dependency to prevent the build errors.
>=20
> (Found in ARCH=3Dum allmodconfig builds)
>=20
> drivers/video/fbdev/nvidia/nv_accel.c: In function =E2=80=98NVDmaWait=E2=
=80=99:
> include/asm-generic/io.h:596:15: error: call to =E2=80=98_outb=E2=80=99 =
declared with attribute error: outb() requires CONFIG_HAS_IOPORT
>    596 | #define _outb _outb
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/video/fbdev/Kconfig |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

applied.

Thanks!
Helge


>=20
> --- lnx-616-rc1.orig/drivers/video/fbdev/Kconfig
> +++ lnx-616-rc1/drivers/video/fbdev/Kconfig
> @@ -660,7 +660,7 @@ config FB_ATMEL
>  =20
>   config FB_NVIDIA
>   	tristate "nVidia Framebuffer Support"
> -	depends on FB && PCI
> +	depends on FB && PCI && HAS_IOPORT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 # v6.16-rc1

