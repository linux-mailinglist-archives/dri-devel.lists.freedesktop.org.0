Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A187CACA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 10:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC9411208D;
	Fri, 15 Mar 2024 09:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="l6xpHM69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1311208D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710495341; x=1711100141; i=deller@gmx.de;
 bh=BSFsXVVkqiqnk4vcRljvGoO6ApkWxhy8vwfugbN2UFI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=l6xpHM69sgOJ3NMGz+1AeZ6EDKi8VKkaLzcmWFu3bmeooMI3wPwGmUxUb/sKECfb
 bfzUyDGBmCMa4JwFJHH0Fa82oEEV9UKCXdoWC7xHxeFEP79GRdhiptPTkbcFLq+OT
 0K+eU3uuWCtKCU22NHmENBVqC7H0KVRRB0qvBnyQ5guc1YY/8XONeftz/LM6/pG/E
 TN7AWEAgiUWGEWNH6zTHkVdhGce0dQJp2CVoJFJFKhh1TlpPaK2F/igEo7GGAN2Wk
 JQSqfBdARbouansM/G1RUhh+/ID0tx5rTfI6UFMjARUBhVA7V6Txg/uTSRR8Zc0Vw
 /NnsKBLTJTFCMpZj+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.155.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVeMG-1rJfBZ24pA-00RcVT; Fri, 15
 Mar 2024 10:35:41 +0100
Message-ID: <d7ca4ae3-4bcc-49f0-a819-4ad88907b93c@gmx.de>
Date: Fri, 15 Mar 2024 10:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Increase maximum font width x height to 64 x 64
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Gladkov <legion@kernel.org>, Jiry Slaby <jirislaby@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240313165934.557879-1-samuel.thibault@ens-lyon.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240313165934.557879-1-samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9UMPx34FgMJDlkPgsGQqOWFYUXv9F1RzGoD84LbFXOmKCsKvuyb
 PeZLiSW13Fi5JJsSxr4c7t4DxwRJ6/QpMadAm6yNweRAqxQe4/FDh1QtN/Zqht1RTZmCc77
 ud9Z7tkrxg3pttaYbqf7RzE55SpBJGu9ankVAgFHTKjQSf2bD+JLXV3hVCPoKMfqA03GNQO
 whewmeZOOp6Yep/5TB7BQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dTj5WPzDIcY=;rgvcHdFwjjFrSgt8O3IefyhYJZA
 RqfQbdHr8o/Rc01HBCidMByK+xCJxUYn62E6C1wUxFD6BcELdwc4bCq2dXkKmvDdfqKPQ2gh6
 bwVKiNcuHfAx7RY3Z9l13G9YgD05giyeESNM9msHO3JurypxiYyGPd46my7EMte+zAtt4lHk9
 F4Bz5d7wGbH89lS961gYJ7MTMwHg7F44OmivKsLqMHBevMvruCEz/nToYHj4HhBjAlm4DaygF
 Tb/1CIsBgmo9r6MOlXs4QH/kSHfqckP9dwadfdn3swciK8jrXHDRmpQCylChB7TREXG5kgcs0
 2oiR2g4IVeA4lb9chd4Gu9rq43j/8qtkW3r0VUT0sYq3NDxnYNDBJaZA3/XqEzqBcKwsXuD7S
 lejLorf3eZqkXqBy3c7Ds2wLoOH9UEJ8GY4VWjf2fJ9wB77gusIbrESYEgLYNUutJdLKKIb5M
 KZbxP4f3ax7cCOKw7fx0aCLVMr7yT9CasCr2ckMUoKyJL6s+Ek+Anr4Q01zMN4xIzzsR54aAf
 UDGk/GiN38A+B4bF6d8m8Ibj4dpDoP7uPa16ADotszBVIHk3fk+BmoJOfxJPlB/PMbeGuwyIe
 RU2CZj94f6FKfi41YTR4frpmLExQzk793Vu+HGISxF5UOa91UJ/2E/v6oouuCp8MwIYeUQjIc
 6lPBvpSPxm2Spf4bYsIk+BMRKHC5HAr5gzUnqG35AqApM44cyWTAgZEP58OerxOUwe+HbiIVV
 DuB4Ya6WLcV6Bc7ym/qQvKPoM7zRuRzRuo1u1lZiLFFwz4RwXs0gT7XHIC5XXZvDtSSaynMLr
 4QRdZk++Q7f/FvplOQAraU5LPVQQOzkSVbMmNIRJerFOc=
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

You should have marked this patch with "v2"...

On 3/13/24 17:59, Samuel Thibault wrote:
> This remains relatively simple by just enlarging integers.

I like the patch, but I still see some u32...
drivers/video/fbdev/vt8623fb.c:         info->pixmap.blit_x =3D (bpp =3D=
=3D 4) ? (1 << (8 - 1)) : (~(u32)0);
drivers/video/fbdev/arkfb.c:            info->pixmap.blit_x =3D (bpp =3D=
=3D 4) ? (1 << (8 - 1)) : (~(u32)0);
drivers/video/fbdev/core/fbmem.c:               fb_info->pixmap.blit_x =3D=
 ~(u32)0;
drivers/video/fbdev/s3fb.c:             info->pixmap.blit_x =3D (bpp =3D=
=3D 4) ? (1 << (8 - 1)) : (~(u32)0);

And please check blit_y too.

> It wouldn't be that simple to get to the console's 64x128 maximum, as it=
 would
> require 128b integers.

How realistic are fonts > 64x64 pixels ?
If they are, using the bitmap_xx functions (include/linux/bitmap.h)
now instead would be better.

Helge

> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---
>   drivers/video/fbdev/core/fbcon.c | 17 ++++++++++-------
>   include/linux/fb.h               | 10 +++++-----
>   2 files changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 46823c2e2ba1..849562f92bd5 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -101,6 +101,9 @@ enum {
>   	FBCON_LOGO_DONTSHOW	=3D -3	/* do not show the logo */
>   };
>
> +#define FBCON_MAX_FONT_WIDTH	(sizeof(((struct fb_pixmap *) 0)->blit_x) =
* 8)
> +#define FBCON_MAX_FONT_HEIGHT	(sizeof(((struct fb_pixmap *) 0)->blit_y)=
 * 8)
> +
>   static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>
>   static struct fb_info *fbcon_registered_fb[FB_MAX];
> @@ -2483,12 +2486,12 @@ static int fbcon_set_font(struct vc_data *vc, st=
ruct console_font *font,
>   	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>   		return -EINVAL;
>
> -	if (font->width > 32 || font->height > 32)
> +	if (font->width > FBCON_MAX_FONT_WIDTH || font->height > FBCON_MAX_FON=
T_HEIGHT)
>   		return -EINVAL;
>
>   	/* Make sure drawing engine can handle the font */
> -	if (!(info->pixmap.blit_x & BIT(font->width - 1)) ||
> -	    !(info->pixmap.blit_y & BIT(font->height - 1)))
> +	if (!(info->pixmap.blit_x & BIT_ULL(font->width - 1)) ||
> +	    !(info->pixmap.blit_y & BIT_ULL(font->height - 1)))
>   		return -EINVAL;
>
>   	/* Make sure driver can handle the font length */
> @@ -3082,8 +3085,8 @@ void fbcon_get_requirement(struct fb_info *info,
>   			vc =3D vc_cons[i].d;
>   			if (vc && vc->vc_mode =3D=3D KD_TEXT &&
>   			    info->node =3D=3D con2fb_map[i]) {
> -				caps->x |=3D 1 << (vc->vc_font.width - 1);
> -				caps->y |=3D 1 << (vc->vc_font.height - 1);
> +				caps->x |=3D 1ULL << (vc->vc_font.width - 1);
> +				caps->y |=3D 1ULL << (vc->vc_font.height - 1);
>   				charcnt =3D vc->vc_font.charcount;
>   				if (caps->len < charcnt)
>   					caps->len =3D charcnt;
> @@ -3094,8 +3097,8 @@ void fbcon_get_requirement(struct fb_info *info,
>
>   		if (vc && vc->vc_mode =3D=3D KD_TEXT &&
>   		    info->node =3D=3D con2fb_map[fg_console]) {
> -			caps->x =3D 1 << (vc->vc_font.width - 1);
> -			caps->y =3D 1 << (vc->vc_font.height - 1);
> +			caps->x =3D 1ULL << (vc->vc_font.width - 1);
> +			caps->y =3D 1ULL << (vc->vc_font.height - 1);
>   			caps->len =3D vc->vc_font.charcount;
>   		}
>   	}
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 05dc9624897d..2bac166cd3f2 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -144,8 +144,8 @@ struct fb_event {
>   };
>
>   struct fb_blit_caps {
> -	u32 x;
> -	u32 y;
> +	u64 x;
> +	u64 y;
>   	u32 len;
>   	u32 flags;
>   };
> @@ -192,10 +192,10 @@ struct fb_pixmap {
>   	u32 scan_align;		/* alignment per scanline		*/
>   	u32 access_align;	/* alignment per read/write (bits)	*/
>   	u32 flags;		/* see FB_PIXMAP_*			*/
> -	u32 blit_x;             /* supported bit block dimensions (1-32)*/
> -	u32 blit_y;             /* Format: blit_x =3D 1 << (width - 1)    */
> +	u64 blit_x;             /* supported bit block dimensions (1-64)*/
> +	u64 blit_y;             /* Format: blit_x =3D 1 << (width - 1)    */
>   	                        /*         blit_y =3D 1 << (height - 1)   */
> -	                        /* if 0, will be set to 0xffffffff (all)*/
> +	                        /* if 0, will be set to ~0ull (all)     */
>   	/* access methods */
>   	void (*writeio)(struct fb_info *info, void __iomem *dst, void *src, u=
nsigned int size);
>   	void (*readio) (struct fb_info *info, void *dst, void __iomem *src, u=
nsigned int size);

