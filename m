Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A432587D92B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 08:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60E10E199;
	Sat, 16 Mar 2024 07:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="OXE4AGwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D9B10E1A4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710574361; x=1711179161; i=deller@gmx.de;
 bh=IUVRNktEF5qyN2N92BM2yiE5i46ZHJ2SadyCFnH9ar0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=OXE4AGwQU4IA3WONzUB3+EBHr1NWu4oOe5oRerQ6DPf07dSpzyW41TnLF9FsVIOq
 6T23oAVzgPE2/LhGuLhs/dmu0Nr2p5sXKBGtLqxZEMNrsTAg1UJvjrV784PhA/Gwo
 i0Ev5/fIIe0OhgjT82gxiRZKU/AXUPm1e+VKECFAA7FE65g0v1Dc/5Rv+vhB1Z/zC
 PUUp7wJr50kKnU5CuLXZGiXmiw6sc/90OBO9Y1pCsOnPD8IcrcIrRFY4Eraa1MI9X
 RVTCsv3TOnZg3Zh22HPEVdd+Cx5d58h2Zjn8u+VUs6x1j/Ca3LhXCeo7DOiwAk62O
 1awHvs4fRDHQE+Vc9w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.153.236]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeMt-1rGqrK2KkF-00VjgH; Sat, 16
 Mar 2024 08:32:41 +0100
Message-ID: <183ae8fd-c727-4afc-a50f-d73ca1bd7437@gmx.de>
Date: Sat, 16 Mar 2024 08:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] fbcon: Increase maximum font width x height to 64 x 128
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Gladkov <legion@kernel.org>, Jiry Slaby <jirislaby@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240316001022.2963072-1-samuel.thibault@ens-lyon.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240316001022.2963072-1-samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7xtn56jekvVrObFVgCrDwqRuO1M/snv78q83k+LYL16jI4btnnA
 otcHBGVPxStd01jLGqpw1e9N16kDO8S/D1BKr1Hr0KCElr9oFlcc8PbTPUB0SA20ycSwqgr
 n6gFO4W64CcLC0ZWqh9I6XWoCkroj1cN5/Vf44hICxuloBRVqdjN2SRv+PovE7HJOEniFuo
 g9Pim1YPGhLwDzVW4TCAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rSD0zMmCO3s=;Ytz+c/8IJJ9Wa2VWlFit6mquqlw
 YjA9Yeb8ZBxi5fi8pGfYYgTBMZaJ7x5Lr1aiJvOE9oVMCWHP5b5mOWhvHnhzgGKQcN6Z3S0hj
 mo6zUwo6ZbnLq3VyDymNTXaOKir4Ru0rhCjIXXl3tKVsDQOiDRncRmaG6tts2MW1ZdpkzrQbW
 ri5al+H9zGR6ZkI632oHRkqiqv2HEIDKLaVajGrAHZCk4UNjBrbrZjVXC1Ex5D6G20BH2Md12
 N6pgbImy9bblVFXqwhxH7ib522RvR+MZZnjrpQ/1eyMXMV56B5qKr1GZ6KpxS3GAV9sJCqvQD
 jZpz53EMOVi6ZiTH3zfFVgeZggIsHZTTn0PQQQweEBNbry84dLh6F03NqPrePr8zSDvej4L5F
 wIumY+ANbSTTRZeDrQWPuMBd0QUfPNsUHIkMzDy3+CrjDrJX+hrWIaM+QMPA3QlQ5RkTdgbPX
 sBv8Drd3El3UsKallaYlAgabydmPyXj/Ug6usPYvdOdGW9UOsyrbo0PFg9tHgm+fRNawEhLhH
 EC7oeIEFw41OJkqqEfXMsUdXpKEPe0Q3aYiDRmfkmzLXQCXFOdsnb9geUcb0QNctp7d1AuKaY
 TLzsGRCI61MFW/BuFDSW4WYd1z3zyDdJuBblR3W5hSpOvlvnXrLNeTLLs2iCnAVNrvmMVqk9B
 sW2MMm5zXTby4UFGWcnoQNrNiEaPNwvBkuZHTYB56Vems8cdhNQlVZvyfuJ7zHH5HBMfkHvg1
 GvyH7mgyjX/yyh5IyEdkW6vjl+C0saHPzbI5XnTwX0YtuyfyPSBA2A8j2Dvixf/hiXvTaW7PN
 Ok2xxMzdc1gHItkmiBAiU/TrSf1UGxRhTzZ9bR9V0iLXw=
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

On 3/16/24 01:10, Samuel Thibault wrote:
> By using bitmaps we actually support whatever size we would want, but th=
e
> console currently limits fonts to 64x128 (which gives 60x16 text on 4k
> screens), so we don't need more for now, and we can easily increase late=
r.
>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

I cleaned up the tabs & spaces in your patch, fixed the missing
get_default_font() change in sticore.c and applied it to the fbdev git tre=
e.
Let's keep it for a few days in for-next...

Thanks!
Helge

> ---
> Difference from v1:
> - use a bitmap rather than just extending the integer size
> - add missing updates in drivers
> ---
>   drivers/firmware/efi/earlycon.c    |  2 +-
>   drivers/video/fbdev/arkfb.c        | 15 +++++++++++----
>   drivers/video/fbdev/core/fbcon.c   | 16 +++++++++-------
>   drivers/video/fbdev/core/fbmem.c   | 12 ++++++------
>   drivers/video/fbdev/core/svgalib.c | 15 +++++++++++----
>   drivers/video/fbdev/s3fb.c         | 15 +++++++++++----
>   drivers/video/fbdev/vga16fb.c      |  6 +++++-
>   drivers/video/fbdev/vt8623fb.c     | 15 +++++++++++----
>   include/linux/fb.h                 | 18 ++++++++++++------
>   include/linux/font.h               |  3 ++-
>   lib/fonts/fonts.c                  | 15 +++++++++------
>   11 files changed, 88 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earl=
ycon.c
> index f80a9af3d16e..d18a1a5de144 100644
> --- a/drivers/firmware/efi/earlycon.c
> +++ b/drivers/firmware/efi/earlycon.c
> @@ -252,7 +252,7 @@ static int __init efi_earlycon_setup(struct earlycon=
_device *device,
>   	if (si->lfb_depth !=3D 32)
>   		return -ENODEV;
>
> -	font =3D get_default_font(xres, yres, -1, -1);
> +	font =3D get_default_font(xres, yres, NULL, NULL);
>   	if (!font)
>   		return -ENODEV;
>
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index dca9c0325b3f..082501feceb9 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -622,8 +622,13 @@ static int arkfb_set_par(struct fb_info *info)
>   		info->tileops =3D NULL;
>
>   		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
> -		info->pixmap.blit_x =3D (bpp =3D=3D 4) ? (1 << (8 - 1)) : (~(u32)0);
> -		info->pixmap.blit_y =3D ~(u32)0;
> +		if (bpp =3D=3D 4) {
> +			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +			set_bit(8 - 1, info->pixmap.blit_x);
> +		} else {
> +			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		}
> +		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
>
>   		offset_value =3D (info->var.xres_virtual * bpp) / 64;
>   		screen_size =3D info->var.yres_virtual * info->fix.line_length;
> @@ -635,8 +640,10 @@ static int arkfb_set_par(struct fb_info *info)
>   		info->tileops =3D &arkfb_tile_ops;
>
>   		/* supports 8x16 tiles only */
> -		info->pixmap.blit_x =3D 1 << (8 - 1);
> -		info->pixmap.blit_y =3D 1 << (16 - 1);
> +		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		set_bit(8 - 1, info->pixmap.blit_x);
> +		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
> +		set_bit(16 - 1, info->pixmap.blit_y);
>
>   		offset_value =3D info->var.xres_virtual / 16;
>   		screen_size =3D (info->var.xres_virtual * info->var.yres_virtual) / =
64;
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 46823c2e2ba1..72ff3147a3bf 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2483,12 +2483,12 @@ static int fbcon_set_font(struct vc_data *vc, st=
ruct console_font *font,
>   	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>   		return -EINVAL;
>
> -	if (font->width > 32 || font->height > 32)
> +	if (font->width > FB_MAX_BLIT_WIDTH || font->height > FB_MAX_BLIT_HEIG=
HT)
>   		return -EINVAL;
>
>   	/* Make sure drawing engine can handle the font */
> -	if (!(info->pixmap.blit_x & BIT(font->width - 1)) ||
> -	    !(info->pixmap.blit_y & BIT(font->height - 1)))
> +	if (!test_bit(font->width - 1, info->pixmap.blit_x) ||
> +	    !test_bit(font->height - 1, info->pixmap.blit_y))
>   		return -EINVAL;
>
>   	/* Make sure driver can handle the font length */
> @@ -3082,8 +3082,8 @@ void fbcon_get_requirement(struct fb_info *info,
>   			vc =3D vc_cons[i].d;
>   			if (vc && vc->vc_mode =3D=3D KD_TEXT &&
>   			    info->node =3D=3D con2fb_map[i]) {
> -				caps->x |=3D 1 << (vc->vc_font.width - 1);
> -				caps->y |=3D 1 << (vc->vc_font.height - 1);
> +				set_bit(vc->vc_font.width - 1, caps->x);
> +				set_bit(vc->vc_font.height - 1, caps->y);
>   				charcnt =3D vc->vc_font.charcount;
>   				if (caps->len < charcnt)
>   					caps->len =3D charcnt;
> @@ -3094,8 +3094,10 @@ void fbcon_get_requirement(struct fb_info *info,
>
>   		if (vc && vc->vc_mode =3D=3D KD_TEXT &&
>   		    info->node =3D=3D con2fb_map[fg_console]) {
> -			caps->x =3D 1 << (vc->vc_font.width - 1);
> -			caps->y =3D 1 << (vc->vc_font.height - 1);
> +			bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
> +			set_bit(vc->vc_font.width - 1, caps->x);
> +			bitmap_zero(caps->y, FB_MAX_BLIT_HEIGHT);
> +			set_bit(vc->vc_font.height - 1, caps->y);
>   			caps->len =3D vc->vc_font.charcount;
>   		}
>   	}
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core=
/fbmem.c
> index fc206755f5f6..5ca18bfe11f6 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -212,8 +212,8 @@ static int fb_check_caps(struct fb_info *info, struc=
t fb_var_screeninfo *var,
>   	fbcon_get_requirement(info, &caps);
>   	info->fbops->fb_get_caps(info, &fbcaps, var);
>
> -	if (((fbcaps.x ^ caps.x) & caps.x) ||
> -	    ((fbcaps.y ^ caps.y) & caps.y) ||
> +	if (!bitmap_subset(caps.x, fbcaps.x, FB_MAX_BLIT_WIDTH) ||
> +	    !bitmap_subset(caps.y, fbcaps.y, FB_MAX_BLIT_HEIGHT) ||
>   	    (fbcaps.len < caps.len))
>   		err =3D -EINVAL;
>
> @@ -420,11 +420,11 @@ static int do_register_framebuffer(struct fb_info =
*fb_info)
>   	}
>   	fb_info->pixmap.offset =3D 0;
>
> -	if (!fb_info->pixmap.blit_x)
> -		fb_info->pixmap.blit_x =3D ~(u32)0;
> +	if (bitmap_empty(fb_info->pixmap.blit_x, FB_MAX_BLIT_WIDTH))
> +		bitmap_fill(fb_info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
>
> -	if (!fb_info->pixmap.blit_y)
> -		fb_info->pixmap.blit_y =3D ~(u32)0;
> +	if (bitmap_empty(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT))
> +		bitmap_fill(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
>
>   	if (!fb_info->modelist.prev || !fb_info->modelist.next)
>   		INIT_LIST_HEAD(&fb_info->modelist);
> diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/co=
re/svgalib.c
> index 2cba158888ea..821b89a0a645 100644
> --- a/drivers/video/fbdev/core/svgalib.c
> +++ b/drivers/video/fbdev/core/svgalib.c
> @@ -354,12 +354,19 @@ void svga_get_caps(struct fb_info *info, struct fb=
_blit_caps *caps,
>   {
>   	if (var->bits_per_pixel =3D=3D 0) {
>   		/* can only support 256 8x16 bitmap */
> -		caps->x =3D 1 << (8 - 1);
> -		caps->y =3D 1 << (16 - 1);
> +		bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
> +		set_bit(8 - 1, caps->x);
> +		bitmap_zero(caps->y, FB_MAX_BLIT_HEIGHT);
> +		set_bit(16 - 1, caps->y);
>   		caps->len =3D 256;
>   	} else {
> -		caps->x =3D (var->bits_per_pixel =3D=3D 4) ? 1 << (8 - 1) : ~(u32)0;
> -		caps->y =3D ~(u32)0;
> +		if (var->bits_per_pixel =3D=3D 4) {
> +			bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
> +			set_bit(8 - 1, caps->x);
> +		} else {
> +			bitmap_fill(caps->x, FB_MAX_BLIT_WIDTH);
> +		}
> +		bitmap_fill(caps->y, FB_MAX_BLIT_HEIGHT);
>   		caps->len =3D ~(u32)0;
>   	}
>   }
> diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
> index 07722a5ea8ef..ff84106ecf1c 100644
> --- a/drivers/video/fbdev/s3fb.c
> +++ b/drivers/video/fbdev/s3fb.c
> @@ -617,8 +617,13 @@ static int s3fb_set_par(struct fb_info *info)
>   		info->tileops =3D NULL;
>
>   		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
> -		info->pixmap.blit_x =3D (bpp =3D=3D 4) ? (1 << (8 - 1)) : (~(u32)0);
> -		info->pixmap.blit_y =3D ~(u32)0;
> +		if (bpp =3D=3D 4) {
> +			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +			set_bit(8 - 1, info->pixmap.blit_x);
> +		} else {
> +			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		}
> +		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
>
>   		offset_value =3D (info->var.xres_virtual * bpp) / 64;
>   		screen_size =3D info->var.yres_virtual * info->fix.line_length;
> @@ -630,8 +635,10 @@ static int s3fb_set_par(struct fb_info *info)
>   		info->tileops =3D fasttext ? &s3fb_fast_tile_ops : &s3fb_tile_ops;
>
>   		/* supports 8x16 tiles only */
> -		info->pixmap.blit_x =3D 1 << (8 - 1);
> -		info->pixmap.blit_y =3D 1 << (16 - 1);
> +		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		set_bit(8 - 1, info->pixmap.blit_x);
> +		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
> +		set_bit(16 - 1, info->pixmap.blit_y);
>
>   		offset_value =3D info->var.xres_virtual / 16;
>   		screen_size =3D (info->var.xres_virtual * info->var.yres_virtual) / =
64;
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb=
.c
> index b485e9198201..a87bafbb119c 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1353,7 +1353,11 @@ static int vga16fb_probe(struct platform_device *=
dev)
>   	info->var =3D vga16fb_defined;
>   	info->fix =3D vga16fb_fix;
>   	/* supports rectangles with widths of multiples of 8 */
> -	info->pixmap.blit_x =3D 1 << 7 | 1 << 15 | 1 << 23 | 1 << 31;
> +	bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +	set_bit(8 - 1, info->pixmap.blit_x);
> +	set_bit(16 - 1, info->pixmap.blit_x);
> +	set_bit(24 - 1, info->pixmap.blit_x);
> +	set_bit(32 - 1, info->pixmap.blit_x);
>   	info->flags =3D FBINFO_HWACCEL_YPAN;
>
>   	i =3D (info->var.bits_per_pixel =3D=3D 8) ? 256 : 16;
> diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623=
fb.c
> index f8d022cb61e8..df984f3a7ff6 100644
> --- a/drivers/video/fbdev/vt8623fb.c
> +++ b/drivers/video/fbdev/vt8623fb.c
> @@ -390,8 +390,13 @@ static int vt8623fb_set_par(struct fb_info *info)
>   		info->tileops =3D NULL;
>
>   		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
> -		info->pixmap.blit_x =3D (bpp =3D=3D 4) ? (1 << (8 - 1)) : (~(u32)0);
> -		info->pixmap.blit_y =3D ~(u32)0;
> +		if (bpp =3D=3D 4) {
> +			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +			set_bit(8 - 1, info->pixmap.blit_x);
> +		} else {
> +			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		}
> +		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
>
>   		offset_value =3D (info->var.xres_virtual * bpp) / 64;
>   		fetch_value  =3D ((info->var.xres * bpp) / 128) + 4;
> @@ -408,8 +413,10 @@ static int vt8623fb_set_par(struct fb_info *info)
>   		info->tileops =3D &vt8623fb_tile_ops;
>
>   		/* supports 8x16 tiles only */
> -		info->pixmap.blit_x =3D 1 << (8 - 1);
> -		info->pixmap.blit_y =3D 1 << (16 - 1);
> +		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
> +		set_bit(8 - 1, info->pixmap.blit_x);
> +		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
> +		set_bit(16 - 1, info->pixmap.blit_y);
>
>   		offset_value =3D info->var.xres_virtual / 16;
>   		fetch_value  =3D (info->var.xres / 8) + 8;
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 05dc9624897d..3003436d1e3b 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -143,9 +143,13 @@ struct fb_event {
>   	void *data;
>   };
>
> +/*	Enough for the VT console needs, see its max_font_width/height */
> +#define FB_MAX_BLIT_WIDTH	64
> +#define FB_MAX_BLIT_HEIGHT	128
> +
>   struct fb_blit_caps {
> -	u32 x;
> -	u32 y;
> +	DECLARE_BITMAP(x, FB_MAX_BLIT_WIDTH);
> +	DECLARE_BITMAP(y, FB_MAX_BLIT_HEIGHT);
>   	u32 len;
>   	u32 flags;
>   };
> @@ -192,10 +196,12 @@ struct fb_pixmap {
>   	u32 scan_align;		/* alignment per scanline		*/
>   	u32 access_align;	/* alignment per read/write (bits)	*/
>   	u32 flags;		/* see FB_PIXMAP_*			*/
> -	u32 blit_x;             /* supported bit block dimensions (1-32)*/
> -	u32 blit_y;             /* Format: blit_x =3D 1 << (width - 1)    */
> -	                        /*         blit_y =3D 1 << (height - 1)   */
> -	                        /* if 0, will be set to 0xffffffff (all)*/
> +	                        /* supported bit block dimensions       */
> +	                        /* Format: test_bit(width - 1, blit_x)  */
> +	                        /*         test_bit(height - 1, blit_y) */
> +	                        /* if zero, will be set to full (all)   */
> +	DECLARE_BITMAP(blit_x, FB_MAX_BLIT_WIDTH);
> +	DECLARE_BITMAP(blit_y, FB_MAX_BLIT_HEIGHT);
>   	/* access methods */
>   	void (*writeio)(struct fb_info *info, void __iomem *dst, void *src, u=
nsigned int size);
>   	void (*readio) (struct fb_info *info, void *dst, void __iomem *src, u=
nsigned int size);
> diff --git a/include/linux/font.h b/include/linux/font.h
> index abf1442ce719..81caffd51bb4 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -57,7 +57,8 @@ extern const struct font_desc *find_font(const char *n=
ame);
>   /* Get the default font for a specific screen size */
>
>   extern const struct font_desc *get_default_font(int xres, int yres,
> -						u32 font_w, u32 font_h);
> +						unsigned long *font_w,
> +						unsigned long *font_h);
>
>   /* Max. length for the name of a predefined font */
>   #define MAX_FONT_NAME	32
> diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
> index 973866438608..409f3e4103a2 100644
> --- a/lib/fonts/fonts.c
> +++ b/lib/fonts/fonts.c
> @@ -96,18 +96,21 @@ EXPORT_SYMBOL(find_font);
>    *	get_default_font - get default font
>    *	@xres: screen size of X
>    *	@yres: screen size of Y
> - *      @font_w: bit array of supported widths (1 - 32)
> - *      @font_h: bit array of supported heights (1 - 32)
> + *	@font_w: bit array of supported widths (1 - FB_MAX_BLIT_WIDTH)
> + *	@font_h: bit array of supported heights (1 - FB_MAX_BLIT_HEIGHT)
>    *
>    *	Get the default font for a specified screen size.
>    *	Dimensions are in pixels.
>    *
> + *	font_w or font_h being NULL means all values are supported.
> + *
>    *	Returns %NULL if no font is found, or a pointer to the
>    *	chosen font.
>    *
>    */
> -const struct font_desc *get_default_font(int xres, int yres, u32 font_w=
,
> -					 u32 font_h)
> +const struct font_desc *get_default_font(int xres, int yres,
> +                                         unsigned long *font_w,
> +                                         unsigned long *font_h)
>   {
>   	int i, c, cc, res;
>   	const struct font_desc *f, *g;
> @@ -135,8 +138,8 @@ const struct font_desc *get_default_font(int xres, i=
nt yres, u32 font_w,
>   		if (res > 20)
>   			c +=3D 20 - res;
>
> -		if ((font_w & (1U << (f->width - 1))) &&
> -		    (font_h & (1U << (f->height - 1))))
> +		if ((!font_w || test_bit(f->width - 1, font_w)) &&
> +		    (!font_h || test_bit(f->height - 1, font_h)))
>   			c +=3D 1000;
>
>   		if (c > cc) {

