Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC03648FA8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 17:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B810E0CF;
	Sat, 10 Dec 2022 16:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3E10E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670688924; bh=h00Fm2qWXbZoWo2rUfDdE3zBb0Tv4j2FoeWjcOJSENo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=S21DvIUXJCuinMP5FTnkRRQc8MdJXEe59VyFK2QRxi2ZE2ec6mxS7T9quLPcDAUIN
 xzCEPhimM2lE7e2r9Vt88ekcbSGmKJ1yfJriHQF4l9NFGAb2SEZruZxwO/RoKx60f/
 11cfV1ii8EMfGkyDnSjo6lW9tkJWHepdry1YbAgzFc+tWRboJiy8raRQrcN/EtZeHo
 DnBOJpR2xB+FES+g+nmsXLdq04BO3U1QOMibVGT2Cax1/Lt8okuvwI0J/skEnWtK3W
 uEu6qD38ssEGpvx3HhuRzTo0upaY+vezK3ej9jxuc95iOsEalhpZP6WmbyG/B4vMCG
 Gub5VeTKmpe0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.157.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1osNuc1qLW-017zJc; Sat, 10
 Dec 2022 17:15:24 +0100
Message-ID: <40d7b576-9e4d-8d05-9273-48874d53591f@gmx.de>
Date: Sat, 10 Dec 2022 17:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH linux-next v3] fbdev: use sysfs_emit() to instead of
 scnprintf()
Content-Language: en-US
To: ye.xingchen@zte.com.cn
References: <202212051631391777945@zte.com.cn>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202212051631391777945@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yxpyg0z1Wsf2EkKIlQdv8JUvwbqEH65fo8s9lyyqbgL4549OASJ
 gGH/U5xVKZSq2JxPpLjeEIMTHDdmuVG+csXCEw2vAyMhNee9revYLUXvKr7DrP57CukkSuv
 hkI9ibwdRz4fs+lOosuQb3PnEK+JDW6hKgrc1Zrh3dfYT346DJf6Jj3JTIfeF4tEj4JOEnP
 q2W0VoLC35YlkERuIRszQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/pTpdg5l5/M=;1hS/ZXg7URABp3DKU9wCvKM3Vum
 RL0/YRgS03/rXcKu9G2bJvhRgfByHgeB9dxf3yZyUf//gSUX/S9YbhFWoYSjrHO8Qp3sSxf8u
 fa3oibhkGpWKIua7xNm2dU/qbotPtgCjuMjCPBwKSw/Me8fXmhEwJHJnmj7mUH7TAWUfKDgRa
 u8ZURjA6lzLd5kItqLQx+35S7Cp84jX/971iScwbvhWFkBKR4grAXC+3UAKLlx1L3CThRQ5W1
 zuBp14V0NDE+2skRrVa7Iwg4qa2C4ir6JAJcRWrl3ESRvpkKJWE+ROPOlUG6mUdVRa+mrIp5P
 0jxUmwC54jyIbsqyHEfPwTfnQBskYFetcKM9g1h3tobhUfjcRZy+bxtS0irtX18TBxOAa6Lww
 SomoUIuZ8wE5kfo2oXcheBn765MBa8x0WD62kWH9j4hzrS8uH6Rxkaen6Zb9CAAKySvno0rSn
 0X/fiKYFjDujkKrDyA99MBDqHAN9KfEWMPG6ZirPgO0eMpXSEzWTWsz6i9bOrOzBUoWAf5u2i
 hNDLv+5WTZpgB61Wjmd29TMoGfLknH+Fbd2Gv8bxx6YdGqQk6nvYrgGC4HwezRW9THyl6eRSL
 jrElcAMAC+B5x8B25TPQPqwMLQBSREQXJAHk4jw+vbk8IZE98kstNpkkAJFSys8tbNyyzHxt3
 Zce29UmVdvqwtPR2ZhMIRmtRZLNu2V11vB4BnPydOOdjR+8WYJfmxMgM+C4lq8g3UIAK30OIR
 7KkS2uytZ8FASK+GjCzzYHQy5UDuhcIWNGMUeP4E47gMrI41qf4h0bGLRECBiHKvmb8V5bQgp
 gyzwKo5MWaXsd0U7/0QnokZN7lN3KJ0crCEkPa7fcA7Vf3w9vU7V2UmeM0+/jf6juldoX+TLr
 SZhAHHiaHAb1vu2ynjfO02ow/UDd+Cd5Aql4Z8+vQOj1IuX9BxPZrk2jKlyANmlQvxwGU/zR7
 +6+EEwLuyiYb9DJCe3zucnv/XsY=
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/22 09:31, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

I've applied this patch, but split it up into two (one for each driver).
Please, send seperate patches per driver next time (and add proper changel=
og
if you do a v2/v3 version).

Thanks!
Helge


> ---
> v2 -> v3
> Fix the mistakes in v2.
>   drivers/video/fbdev/sh_mobile_lcdcfb.c |  8 ++++----
>   drivers/video/fbdev/uvesafb.c          | 10 +++++-----
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbde=
v/sh_mobile_lcdcfb.c
> index 6d00893d41f4..ad9323ed8e2e 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1188,7 +1188,7 @@ overlay_alpha_show(struct device *dev, struct devi=
ce_attribute *attr, char *buf)
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct sh_mobile_lcdc_overlay *ovl =3D info->par;
>
> -	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->alpha);
> +	return sysfs_emit(buf, "%u\n", ovl->alpha);
>   }
>
>   static ssize_t
> @@ -1226,7 +1226,7 @@ overlay_mode_show(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct sh_mobile_lcdc_overlay *ovl =3D info->par;
>
> -	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->mode);
> +	return sysfs_emit(buf, "%u\n", ovl->mode);
>   }
>
>   static ssize_t
> @@ -1265,7 +1265,7 @@ overlay_position_show(struct device *dev, struct d=
evice_attribute *attr,
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct sh_mobile_lcdc_overlay *ovl =3D info->par;
>
> -	return scnprintf(buf, PAGE_SIZE, "%d,%d\n", ovl->pos_x, ovl->pos_y);
> +	return sysfs_emit(buf, "%d,%d\n", ovl->pos_x, ovl->pos_y);
>   }
>
>   static ssize_t
> @@ -1306,7 +1306,7 @@ overlay_rop3_show(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct sh_mobile_lcdc_overlay *ovl =3D info->par;
>
> -	return scnprintf(buf, PAGE_SIZE, "%u\n", ovl->rop3);
> +	return sysfs_emit(buf, "%u\n", ovl->rop3);
>   }
>
>   static ssize_t
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb=
.c
> index 00d789b6c0fa..ba8028a0cc7a 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -1580,7 +1580,7 @@ static ssize_t uvesafb_show_vendor(struct device *=
dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_vendor_name_ptr)
> -		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return sysfs_emit(buf, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_vendor_name_ptr);
>   	else
>   		return 0;
> @@ -1595,7 +1595,7 @@ static ssize_t uvesafb_show_product_name(struct de=
vice *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_product_name_ptr)
> -		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return sysfs_emit(buf, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_product_name_ptr);
>   	else
>   		return 0;
> @@ -1610,7 +1610,7 @@ static ssize_t uvesafb_show_product_rev(struct dev=
ice *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_product_rev_ptr)
> -		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return sysfs_emit(buf, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_product_rev_ptr);
>   	else
>   		return 0;
> @@ -1625,7 +1625,7 @@ static ssize_t uvesafb_show_oem_string(struct devi=
ce *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_string_ptr)
> -		return scnprintf(buf, PAGE_SIZE, "%s\n",
> +		return sysfs_emit(buf, "%s\n",
>   			(char *)(&par->vbe_ib) + par->vbe_ib.oem_string_ptr);
>   	else
>   		return 0;
> @@ -1639,7 +1639,7 @@ static ssize_t uvesafb_show_nocrtc(struct device *=
dev,
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct uvesafb_par *par =3D info->par;
>
> -	return scnprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
> +	return sysfs_emit(buf, "%d\n", par->nocrtc);
>   }
>
>   static ssize_t uvesafb_store_nocrtc(struct device *dev,

