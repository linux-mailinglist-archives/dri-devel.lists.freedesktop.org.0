Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B85E928C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 13:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8229D10E15A;
	Sun, 25 Sep 2022 11:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D8410E15A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664104123;
 bh=vMKQxwj89WaADW8Bom1McJHs8+5f6S1JUYKQdgguiUc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YCEjEdkbRNqGb0bSlX9f6DbG9Le47S05rrEq5oH1tIHDU25ZEMZFrg1zLGMnsv3sP
 SONYRQMZ155suQXDl/ffGMOQKg1DAdR/nEvzEqxPRo8AAfKTTaVgNPvbindg94sKoo
 NP0Q6WoVN2WtlxFoZw0IwHePiaOam+byiMa+Ce9Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1pGA6V293Y-014EZy; Sun, 25
 Sep 2022 13:08:43 +0200
Message-ID: <61a4923c-8f38-27dc-e071-a48667642606@gmx.de>
Date: Sun, 25 Sep 2022 13:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] video: fbdev: uvesafb: convert snprintf to scnprintf
Content-Language: en-US
To: Jules Irenge <jbi.octave@gmail.com>, spock@gentoo.org
References: <YyZb1K9b1gapCfep@playground>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YyZb1K9b1gapCfep@playground>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wsQqK7oCvIsml7BjnAVd6MJbdF0/oe2lHWbpBEVArMv0F6PKHHc
 S81+VWeYskbSjFDZuldCwgwURSTCZ73wcCSxOqRNQvvO5mHV1vkXg+v+jp9uvTZSEH76MIa
 RCnQ0R2gE0NFKQn6dRIrMaDfCKhpmiHFA+XRylVqITbGwXwUL6+g2UGwZ0aLU6Qt3rQVI8z
 I1IJuvUGkzWAnwCtTkyXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mtbYHR4m88U=:Ywyh3DHbInMS642sNOwoEs
 1/gjmddxLmH9kTx9yAGyOUyXjVy2CKMoG/E9x30rPp4i13deddBtnBw06Y46Ihds0hUqm9O/4
 EvHO7hLlnUWXL3rgl7jW8USyiNDP4GGnMJA4WCoEP5NRTdIVFZMwlH2OyMr0FU5i4KOmgLbIf
 /p5ZxXdryMrZZ7twM3rc1LgSb0rG1MR2vRwJ3G+fCANbrlg7Kfp2nDzlXSd5tlRkpbn/ennX+
 wvj/gQ+l44uIKHEcgXp9Rhw5RU61hTLQ4qNKhIzzDrWWKxXAwxl+QX68oCThVr1G8H8ztErIW
 NjLa9KenkPMJ8iFcnfDqLMNh0g/C7JAwfWKRSqV66Ttn0o7BA6GdvpkzY3tItorxK9jY+95pL
 Mh7bPHwDFsWW2JaHt7ls50fXxPiRqDukiu4oVF1hdu7MwJgV5M1mgr13O5yXXT9mlg1P2hYsj
 33okmu177vSoFQsQIN78R3MAV4K/bKOEhQeYAdY6OV2EAiXvXIl1BQ2XjW9M0Uy61kajnxsLT
 F7cs40ahbmLVnPP+6wbOKRBoR7S3F3oWm/9LFs/jO9kL4HTDEENzSbLgTkR0yP8NM7vTRu6Jy
 S/4YIHKaG/upaFLaNBeF9MCWPulmDjcPPdYQO3C6GaNiYR0Qe/SeJySjwtrIgQfvatbV7fKl5
 YNv+ht4ScpMwcyS9MVbGEreQ3MNAZ5XVEAG6GY2f5tdleOEpj1BL2ppB7/qzb8l/SAdECrS8C
 zdLL2KcEvA72F1nVpBFyuF+vs+qKVOU7gYwPcIjyUJknGyz8UTqhlTU8kFZ3tlq2YUgRpProD
 mDYBq8qdhJ5N9B4XWo1IizKWu/mEUBiAvw6OnAm9i5znAzVzUwrk2BTwknhYQVdugjoxDce+K
 rekChSoqOQCsA9jlOXRMOoIfcaRoUjOifho1iaY9xudHScGnUkr0kaUSbo5ehgCnzqtkMOBWa
 q9R0cUD3zl4FcoPlWg0/BdQ19cbFXXPnV76gE5spoKyRT4/GlVRMTSqKoYgeyyQQasWBTc6Bb
 1ILVVMKG7wue6bZLngocYJTBz9nBZUG5zrMCYDGWOugMP6gG2LZbmQGg8t4pmiEJi5XGSPDoX
 2dxaTxVKv9kgstB8x+BmDP5y6ned2B8KepHdSrU1EqjO5exW5Kbd7Gv9us2iyYGpIHIe3PS/z
 3r3yMR3i2CzDKMgOOkSvAQhbR+
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
Cc: Elana.Copperman@mobileye.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/18/22 01:44, Jules Irenge wrote:
> Coccinelle reports a warning
>
> WARNING: use scnprintf or sprintf
>
> Adding to that,
> there has also been some slow migration from snprintf to scnprintf
> This article explains the rationale for this change
>
> https: //lwn.net/Articles/69419/
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

applied.

Thanks,
Helge

> ---
>   drivers/video/fbdev/uvesafb.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb=
.c
> index 4df6772802d7..fd5d701106e1 100644
> --- a/drivers/video/fbdev/uvesafb.c
> +++ b/drivers/video/fbdev/uvesafb.c
> @@ -1580,7 +1580,7 @@ static ssize_t uvesafb_show_vendor(struct device *=
dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_vendor_name_ptr)
> -		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_vendor_name_ptr);
>   	else
>   		return 0;
> @@ -1595,7 +1595,7 @@ static ssize_t uvesafb_show_product_name(struct de=
vice *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_product_name_ptr)
> -		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_product_name_ptr);
>   	else
>   		return 0;
> @@ -1610,7 +1610,7 @@ static ssize_t uvesafb_show_product_rev(struct dev=
ice *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_product_rev_ptr)
> -		return snprintf(buf, PAGE_SIZE, "%s\n", (char *)
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", (char *)
>   			(&par->vbe_ib) + par->vbe_ib.oem_product_rev_ptr);
>   	else
>   		return 0;
> @@ -1625,7 +1625,7 @@ static ssize_t uvesafb_show_oem_string(struct devi=
ce *dev,
>   	struct uvesafb_par *par =3D info->par;
>
>   	if (par->vbe_ib.oem_string_ptr)
> -		return snprintf(buf, PAGE_SIZE, "%s\n",
> +		return scnprintf(buf, PAGE_SIZE, "%s\n",
>   			(char *)(&par->vbe_ib) + par->vbe_ib.oem_string_ptr);
>   	else
>   		return 0;
> @@ -1639,7 +1639,7 @@ static ssize_t uvesafb_show_nocrtc(struct device *=
dev,
>   	struct fb_info *info =3D dev_get_drvdata(dev);
>   	struct uvesafb_par *par =3D info->par;
>
> -	return snprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", par->nocrtc);
>   }
>
>   static ssize_t uvesafb_store_nocrtc(struct device *dev,

