Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6494A59D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22E10E5C9;
	Tue,  1 Feb 2022 10:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31EE10E5C9;
 Tue,  1 Feb 2022 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643710667;
 bh=wmREK8PFq/vdn0l0vClE+30BQLaE2yxdPYhw57Lv93s=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=Z0WOLlz8BCqYtm9aPUCUPXil71JwcDLuhZNZHd7FHSTjquWIqTyuK7Nxr9bXKMr5M
 n7y7YVN+Gut/WezgN3lhFBOckPb49UQegA/8OQfYWC8aD15Eo/caFD+yl3rjwiqe4h
 oY1qTfesL9tHu5G/xB+F+phh6OqPL2vFOHQ+mwnU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1mkzgl3Fkj-00WIVJ; Tue, 01
 Feb 2022 11:17:46 +0100
Message-ID: <98bf57d3-de0f-7f0e-21ce-360f661f4e25@gmx.de>
Date: Tue, 1 Feb 2022 11:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/21] fbcon: Restore fbcon scrolling acceleration
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-4-daniel.vetter@ffwll.ch>
 <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
In-Reply-To: <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BLEyQfaZyNddFkNU0iveVjwX+bqyCCzVzYZsG8dus0NPeKpzvO4
 XUbCXA6kU8gOWMxNdCqVD8Dl6yj+eh5kaJ1hB66nR3wiTU1PBmihCXPgud0F+nPZUgKrgD1
 iAgcqrAu2Uqo1Ldj8aR6HnTUupZzfhVPTpdd5dRPQo7LzSY/wh2w2odvcuiXKjD4SnOVL8j
 SiVVTKVwz9mxlCvDBA+eA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nGL3C+F5Hog=:p8wqV+ZdqkrUkg+IP+YS7s
 +DxdKrHEQqv9JTrY9VpF/UKWI+QQPfrPOI/idsnfOAv7u8gg0z78MZk3wVy92ksSPzZuvje7p
 r+WusT7JH7K+b1BMwsmOi2Mfr5JowHH72hYqDg6Mf8lSIdKzIkVfClu8jsC0LB4fpBMN07Bg4
 LKbqU1zssh6LApc8HtmSbnYkGtPvpVwv24uAUCvrG5gOTXQAqniM3aVG+1DoVHy7a4iP6ansv
 ytcJ1EPNAROjVjNM+M5fI8jYGVhM/41/c8hnqdOaxIHUCRb5eg7RSeBNbBJ1IXYmY0p2AjMXf
 RcLfcBhmeznw57AMTfqxXdnbdXS++R2Ctx8rIQtLkTXS3+8FXDrRr3s7VhzwgIKi13wUeNqgH
 YvlfLgKEFhjYSpL4SwhaTY7MWoQAf/HmLkQyYNRUrY5Cn8nMujGYsgIJybx9DLZhHWNqxjsOn
 BCccG235GotdHBHRHBH/F/+mW0obBJd3WN26OjJwtmxJ6DgUEMzJGbXxpP6T2tuxwVBRxWxIt
 Nxznf04GB5E5Pjbtl4pOx2ViFpqDFXZ/AGNtsIJtEla25rXJfPK/8mBL8tj/FhmXP82WJEBvp
 5BfmMfciVmfu/hXPI7P2NF0mCIC74BG3w6rhJtKKy86OLm21ubJuFyeg9O/chPH4yziQGxMAv
 v1fwe2MfrvZ8dxOwaVsqmyG8GGppAo4GjXvT27IdyaoHkIqN7f4+xjHiPSCp3VrWQAvbKlVLj
 A7uxf0/0siWyXkueRPt+0cMhN8O2fXYM2jLaNwa5XMESWT0vSGixO1OoGpz7CQAdR3lptlxiZ
 OtktLj9Xmn8Kbt6vt26WIkFa/fGP4D/2EXhIaO7tzEgl0cEHCe03OJ75dLY6n0blPrVaq33gS
 KEDiHJfPJF34hQIBGXUEm+Sx+92pMpUyrHW//MLImEdh12W86FEeRQmY1HQ+lKBDIr+LJ+nUq
 d4DyemULDb2R4n07yJ572JdzPjfKgKL+MA3jlhe77R7sDRufmbbKU/PPvVLM+AvcWRKBsl3/m
 2nP0gQx0nZZ9jvbXEjwYmg68DpDN/1THUAIKOqEakmu8xis8rx1SEjHjtvJQZjbxpvUb+Eoh2
 36I9IRwtzdcy74=
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

On 2/1/22 11:16, Helge Deller wrote:
> On 1/31/22 22:05, Daniel Vetter wrote:
>> This functionally undoes 39aead8373b3 ("fbcon: Disable accelerated
>> scrolling"), but behind the FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> option.
>
> you have two trivial copy-n-paste errors in this patch which still preve=
nt the
> console acceleration.
>
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/cor=
e/fbcon.c
>> index 2ff90061c7f3..39dc18a5de86 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -1125,13 +1125,15 @@ static void fbcon_init(struct vc_data *vc, int =
init)
>>
>>  	ops->graphics =3D 0;
>>
>> -	/*
>> -	 * No more hw acceleration for fbcon.
>> -	 *
>> -	 * FIXME: Garbage collect all the now dead code after sufficient time
>> -	 * has passed.
>> -	 */
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
>
> should be:
> #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>
>
>> +	if ((info->flags & FBINFO_HWACCEL_COPYAREA) &&
>> +	    !(info->flags & FBINFO_HWACCEL_DISABLED))
>> +		p->scrollmode =3D SCROLL_MOVE;
>> +	else /* default to something safe */
>> +		p->scrollmode =3D SCROLL_REDRAW;
>> +#else
>>  	p->scrollmode =3D SCROLL_REDRAW;
>> +#endif
>>
>>  	/*
>>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
>> @@ -1971,15 +1973,49 @@ static void updatescrollmode(struct fbcon_displ=
ay *p,
>>  {
>>  	struct fbcon_ops *ops =3D info->fbcon_par;
>>  	int fh =3D vc->vc_font.height;
>> +	int cap =3D info->flags;
>> +	u16 t =3D 0;
>> +	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
>> +			      info->fix.xpanstep);
>> +	int ywrap =3D FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
>>  	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>>  	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>>  				   info->var.xres_virtual);
>> +	int good_pan =3D (cap & FBINFO_HWACCEL_YPAN) &&
>> +		divides(ypan, vc->vc_font.height) && vyres > yres;
>> +	int good_wrap =3D (cap & FBINFO_HWACCEL_YWRAP) &&
>> +		divides(ywrap, vc->vc_font.height) &&
>> +		divides(vc->vc_font.height, vyres) &&
>> +		divides(vc->vc_font.height, yres);
>> +	int reading_fast =3D cap & FBINFO_READS_FAST;
>> +	int fast_copyarea =3D (cap & FBINFO_HWACCEL_COPYAREA) &&
>> +		!(cap & FBINFO_HWACCEL_DISABLED);
>> +	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>> +		!(cap & FBINFO_HWACCEL_DISABLED);
>>
>>  	p->vrows =3D vyres/fh;
>>  	if (yres > (fh * (vc->vc_rows + 1)))
>>  		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
>>  	if ((yres % fh) && (vyres % fh < yres % fh))
>>  		p->vrows--;
>> +
>> +	if (good_wrap || good_pan) {
>> +		if (reading_fast || fast_copyarea)
>> +			p->scrollmode =3D good_wrap ?
>> +				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
>> +		else
>> +			p->scrollmode =3D good_wrap ? SCROLL_REDRAW :
>> +				SCROLL_PAN_REDRAW;
>> +	} else {
>> +		if (reading_fast || (fast_copyarea && !fast_imageblit))
>> +			p->scrollmode =3D SCROLL_MOVE;
>> +		else
>> +			p->scrollmode =3D SCROLL_REDRAW;
>> +	}
>> +
>> +#ifndef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
>
> same here... it needs to be:
> #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION

actually:
#ifndef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION

>
>
>> +	p->scrollmode =3D SCROLL_REDRAW;
>> +#endif
>>  }
>>
>>  #define PITCH(w) (((w) + 7) >> 3)
>>
>
> still reviewing the other patches...
>
> Helge
>

