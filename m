Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F74A59C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB5D10E595;
	Tue,  1 Feb 2022 10:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51010E595
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643710568;
 bh=rhMjI8y3jysXslMLlHfAxQLeYg7orlmWhVUeBoVQ60g=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fxdLTg4rTUaOYA/wUN46weV7NRYt+FMsIS8hlM+rRjs7sfFTPQ6CF4+sSnX47osqd
 MeTa+cKEXTf2+oqBdlu6xTKcDvfFJ248igtd8piO6BlCQbcv9GXoIW2bTdxdOJhJPD
 eU6I8whctwzlZ6HShytcRNMCELtsZfabYIeEuIZ8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof9F-1mQ9RW4Ayf-00p4Jh; Tue, 01
 Feb 2022 11:16:08 +0100
Message-ID: <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
Date: Tue, 1 Feb 2022 11:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/21] fbcon: Restore fbcon scrolling acceleration
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-4-daniel.vetter@ffwll.ch>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220131210552.482606-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jflhoCckVNnaLnLLGcsVr23sboAIiW9Oegx+vqwH4cE9RiJn0so
 xERIAfckdKuldjuruwmA2wOLubXdgZ3NtxcE+TMECbSWiMLqDLTTbt3bRgJwxZc5Z9rPY4z
 sZNAgJgYGcwPZx+Do1gWwD2BpeKgoQIPwNq514BedbfSk7eNeKR3F0rCRCiM6qYjXB1hP1c
 hJUm8fT1IUjX8yDqBslZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jC93FT332v4=:mbjrryMElmMicajewnajtW
 A3wryM+Me6j2PI1I+7uO1Z5cpsnDemcqgEN2IbYK9DhEI8pDMtzb8enz6LihWxw2p0J4mBXND
 OJ7pVTyPuHI26/dBFyIP27XwWy69yYSaG4TAjTmtcW2HdJGA68+alSPS74IvO7SKem+zl9gnw
 neZbU66sZzz4sioEMB0bTvAf8MbkvX66RGK/S19bva1LMZTyVICJCzM9nV5Ij2qbTeWRi9+VT
 B6DQviWW45GMtlUgwKLj42RexUtC98KFKPNOlCF8bOYZf3qqrsTApvlmxlyeCMdANbAy/IiW6
 0NkxJaBKWkAWGhWrypoNBUjlW/wik1EqNa7k13ifgIgC/wqWElu8L3c+8FOxHonnx7KJBO6sY
 T5kVAoKz2gYqXmnoiTJ63iBgMcgAqozXVLpv2EAROU2ADB7LtkoyMX4o8zxVtaJtqbR2XDly/
 fo4+DEuIYYLkwdkn3VFCFXOaEBamMQnbVXqibG14F0dZ8kk5rumE8S7pgXuDGvjoZgrOlhXkL
 r6nwhXhLTDb2qAgG8u5WL9+YY9Jkc12XQPEeU9XCHvPwyOtRvNtPzz60KBPwluX+Cq+hFmAzz
 iuDiPBbD05tgb64cNps+2szctWnRbBuvEwgVoaIzIwkdUu2nL/ITycCO8YfAb+Zbl3ih1mna9
 PsJBb9K/cumdiqj/8NtwK1KCnsf1xtRoE/ex1v47TSTO89XWeHQXAv7eNjhBnr0Qma6ynDePn
 N3nsEGwKf49LFefQ+9eL/SzZKJkS+gCnzSxQ4hyuw08n6swf3wQKl0wawQhaCjJgnbizji73W
 TKMd8iutPgm1tFD5HJ2WHxu+DQp+zAuVrYV5y6lRNb2bB/ipPW4QC0448R2d1hobm07cjR/uw
 qlDDpda547Nm+E8HalzgExRKyBA1I+3oweC+CUVgaRj7aj90T1pKxjcp2S2bPCn7zXqrAr7Pc
 NT5IvWjaOpPl5yhVIpT0G7Db+m1KOnlauqWRQxvhryECTTZoc0OL8yyG6FF1pdwSfD2cDC/92
 jMinnuZMxhUB9StFM3xfmt4t648XGYu3BdqlQDzOs6oczwlT6Dmoh5PWWAEBE8c8Me9cdzAbr
 KkwYp/3WxzhUYk=
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/22 22:05, Daniel Vetter wrote:
> This functionally undoes 39aead8373b3 ("fbcon: Disable accelerated
> scrolling"), but behind the FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> option.

you have two trivial copy-n-paste errors in this patch which still prevent=
 the
console acceleration.

> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 2ff90061c7f3..39dc18a5de86 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1125,13 +1125,15 @@ static void fbcon_init(struct vc_data *vc, int i=
nit)
>
>  	ops->graphics =3D 0;
>
> -	/*
> -	 * No more hw acceleration for fbcon.
> -	 *
> -	 * FIXME: Garbage collect all the now dead code after sufficient time
> -	 * has passed.
> -	 */
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION

should be:
#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION


> +	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
> +	    !(info->flags & FBINFO_HWACCEL_DISABLED))
> +		p->scrollmode =3D SCROLL_MOVE;
> +	else /* default to something safe */
> +		p->scrollmode =3D SCROLL_REDRAW;
> +#else
>  	p->scrollmode =3D SCROLL_REDRAW;
> +#endif
>
>  	/*
>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
> @@ -1971,15 +1973,49 @@ static void updatescrollmode(struct fbcon_displa=
y *p,
>  {
>  	struct fbcon_ops *ops =3D info->fbcon_par;
>  	int fh =3D vc->vc_font.height;
> +	int cap =3D info->flags;
> +	u16 t =3D 0;
> +	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> +			      info->fix.xpanstep);
> +	int ywrap =3D FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
>  	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>  	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>  				   info->var.xres_virtual);
> +	int good_pan =3D (cap & FBINFO_HWACCEL_YPAN) &&
> +		divides(ypan, vc->vc_font.height) && vyres > yres;
> +	int good_wrap =3D (cap & FBINFO_HWACCEL_YWRAP) &&
> +		divides(ywrap, vc->vc_font.height) &&
> +		divides(vc->vc_font.height, vyres) &&
> +		divides(vc->vc_font.height, yres);
> +	int reading_fast =3D cap & FBINFO_READS_FAST;
> +	int fast_copyarea =3D (cap & FBINFO_HWACCEL_COPYAREA) &&
> +		!(cap & FBINFO_HWACCEL_DISABLED);
> +	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
> +		!(cap & FBINFO_HWACCEL_DISABLED);
>
>  	p->vrows =3D vyres/fh;
>  	if (yres > (fh * (vc->vc_rows + 1)))
>  		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
>  	if ((yres % fh) && (vyres % fh < yres % fh))
>  		p->vrows--;
> +
> +	if (good_wrap || good_pan) {
> +		if (reading_fast || fast_copyarea)
> +			p->scrollmode =3D good_wrap ?
> +				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
> +		else
> +			p->scrollmode =3D good_wrap ? SCROLL_REDRAW :
> +				SCROLL_PAN_REDRAW;
> +	} else {
> +		if (reading_fast || (fast_copyarea && !fast_imageblit))
> +			p->scrollmode =3D SCROLL_MOVE;
> +		else
> +			p->scrollmode =3D SCROLL_REDRAW;
> +	}
> +
> +#ifndef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION

same here... it needs to be:
#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION


> +	p->scrollmode =3D SCROLL_REDRAW;
> +#endif
>  }
>
>  #define PITCH(w) (((w) + 7) >> 3)
>

still reviewing the other patches...

Helge
