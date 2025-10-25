Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C267EC0A10B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 01:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AA910E00B;
	Sat, 25 Oct 2025 23:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="GY0G1YkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Sat, 25 Oct 2025 23:22:22 UTC
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EA710E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=o+Qike691zJBF1RCaslWg3meFxGDo0KmJqy1XTllb5g=; t=1761434542;
 x=1762039342; b=GY0G1YkTYDuH4de6pNz9Fy5QmqsMEaJyrVLFRN+gzVZDFF/uvrOBMm1MO505N
 5FEGNnHGPkGe98mXyQib9qKKqjHoLTM+ZKQ71q5Tvg65ivt3/xX8XC85IzfawLrGGyXyNnirfXUO9
 pqtXKssaaqANPff5H+lpL6if1/SPRJOFPiLJtBO+YrbIJx92Z3QW5U3oqvYQ8UU/Htn1Zb3a/Bq7+
 1y8o6I+ZNO+UV3o8GfkwDl5UIPw4V28qFM4WvF0W3P+1uUh4wgsIAnAe4loqlARDGaQDbfP3wh+Xt
 GNlD+OqsVVxAn+3xiWaAVz1P5jrhdgZQUnvU1WTkhNfRcFI0cw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vCnSq-00000002Ne2-2Pxv; Sun, 26 Oct 2025 01:14:24 +0200
Received: from dynamic-089-012-087-223.89.12.pool.telefonica.de
 ([89.12.87.223] helo=[192.168.178.50])
 by inpost2.zedat.fu-berlin.de (Exim 4.98) with esmtpsa (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vCnSq-00000003w6N-1Uqx; Sun, 26 Oct 2025 01:14:24 +0200
Message-ID: <cee852ea863613abb7b3fe2a2ec3870abecb8b6c.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] fbdev/pvr2fb: Fix leftover reference to
 ONCHIP_NR_DMA_CHANNELS
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Florian Fuchs <fuchsfl@gmail.com>, Helge Deller <deller@gmx.de>, 
 linux-fbdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Date: Sun, 26 Oct 2025 01:14:23 +0200
In-Reply-To: <20251025223850.1056175-1-fuchsfl@gmail.com>
References: <20251025223850.1056175-1-fuchsfl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.87.223
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Florian,

On Sun, 2025-10-26 at 00:38 +0200, Florian Fuchs wrote:
> Commit e24cca19babe ("sh: Kill off MAX_DMA_ADDRESS leftovers.") removed
> the define ONCHIP_NR_DMA_CHANNELS. So that the leftover reference needs
> to be replaced by CONFIG_NR_ONCHIP_DMA_CHANNELS to compile successfully
> with CONFIG_PVR2_DMA enabled.
>=20
> Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
> ---
> Note: The fix has been compiled, and tested on real Dreamcast hardware,
> with CONFIG_PVR2_DMA=3Dy.
>=20
>  drivers/video/fbdev/pvr2fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
> index cbdb1caf61bd..0b8d23c12b77 100644
> --- a/drivers/video/fbdev/pvr2fb.c
> +++ b/drivers/video/fbdev/pvr2fb.c
> @@ -192,7 +192,7 @@ static unsigned long pvr2fb_map;
> =20
>  #ifdef CONFIG_PVR2_DMA
>  static unsigned int shdma =3D PVR2_CASCADE_CHAN;
> -static unsigned int pvr2dma =3D ONCHIP_NR_DMA_CHANNELS;
> +static unsigned int pvr2dma =3D CONFIG_NR_ONCHIP_DMA_CHANNELS;
>  #endif
> =20
>  static struct fb_videomode pvr2_modedb[] =3D {
>=20
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

Good catch, thanks for fixing this!

Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
