Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CB66B402
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 21:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3840010E3B2;
	Sun, 15 Jan 2023 20:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9AB10E3B2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1673816240; bh=iCHzrI3/Aj5kWtzk9CytDtglCVQ11xjtngzlljo+NhM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=mQZiX84YBGlJE6qGlxkZJ6wHhQNjVe7JYb5V3YjMzB9jfFAuHlo3AqLX3tXTCkc6y
 spmplv3CjcqAtJgscvGCe3OoR4W3hq4sKMWwxNnJUr9+JaCre0XepOHCOXED/18GbD
 29W3suX2iteLzbQrTM5NE/dnJzvlbur72AQfdvxeR1AKSDtCJbJwfCp+8ITxpvHC9T
 iMFHNtPiUJJ/cikqV3u6BvBgQswcqzx4IhLXajanGffjt9K55SZyVOy0DvxX7L+4cQ
 ggGHQ1mOSnj0jLjc9txUiob7JWmOc4ys0gTmhVoj5RC2zx7wapcwrFYLRmLa2M8QqV
 HFQYV4RozFApw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.161.25]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1p0K2N1GXD-00IVuK; Sun, 15
 Jan 2023 21:57:20 +0100
Message-ID: <d892efab-39a8-02e4-5afb-3b33abdc58bc@gmx.de>
Date: Sun, 15 Jan 2023 21:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] video: fbdev: omapfb: Use kstrtobool() instead of
 strtobool()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <b475ed9827ccef2081b557330a224f5fd8e6c8f3.1673686433.git.christophe.jaillet@wanadoo.fr>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <b475ed9827ccef2081b557330a224f5fd8e6c8f3.1673686433.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9gbLCh5+D4eAvUf/NKqhI7QbjcQ6WT5LZS7UN7n4wftXAbpNmmp
 /S7NFKRzt+2Eg/A9Do4y/aY2CAwsXHF5+M+4k9UD3RJAJOvYKBictBl2sX13OG/lpg0FIyn
 L5so/Urn9H3ycsFAR4R35tmkH81DoU/XhnDbqOIAa74MFMRWqCj3Y+Q2wH644ThPWoI6c0k
 05qFQdpvkrbC/itkxhjWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N4MIz6zWr3Q=;hJmGQLDQv3s1enQ4CbYyEvhbC6x
 zPJomF2ijGoTPS+8gchbBWCPpIHRKbxZYgMOJ5wTDjiFkdW7yq2PTjNNlOlOgYxC3XavAyDIE
 ygsRoOuzmEI4XXJWlzvCBrw1mVOSc89lZuGw6H9HbPaU9z4bK4F/OcoA+2BoGIt1YR5iuWjfs
 dFyddAqHWUw0nqJCeWXaOsjIaw/AZ4vNTCc6bOscqBCH0ThTxiHAmvKf34kqEJ4uNBGTKXmnI
 WyrkVqXfnzYQH33tzUkuDGSvemm7q/3vqhz6ga2FlaMgAaLScY0JwS3SyA737agnvryR+bMxs
 VOsqBQ7thMqJKn/JAutleC67ojMFJdcKpjMsncGPtZb/MXAGU+7r7l3srrTtv1jB1TkfVYhCA
 m5sWSG+kdbGw+8rTXWHLQqVuY4lHwgjL/MnZJwTKhZVLSbL77nMXignQeu3mW6pOQQqAbC3zT
 LD1ChrwesAhLOLsUE/Ym6M9sWKkT+fdzAb3vt5ykjVQDEnRkTItJMbl7XL3nZTAT9oEOCE0tn
 Ldyty4GCCoSgizmPLhyq4/3YDGVFo49zvylOK8BB4WkLja/O443BgmWKYaTdRQCAAws+TbsN5
 auOkq9FHDHsIULPH+1658Ud3cA2RJXuGlnESG52f97uoJTHAXy+BZEwf+2knhdfCOCc0j0K3C
 dLM9zODHUdKNN4oLerTqz2P21tayhwUAUxM6/pHk8rUoECdS2YZJTlCNZcFG+PdW2icTtdLQt
 7w8HtvLNgFBBgGG7bYrf/0FJTGtklc7nfkPjOTlFjHESq3KjJxEImmYF74EVVciau6LuB82ZC
 9aXkiTCLqeiigDwiJhGWSnYKWF5sck1mNhDwi5sToN0UyOgdC5VvdTOPPNBeB/u+n3RJC/T+J
 D7voijMu/UGV7WJuj3zq4TIt0JvYHCcKN4NKqsHGr2g0Py7Y0cV9sy1nmnkr4YqeR3RjnLyn/
 J1JaI+bkPT8y2jytxSz6N3BJpQ0=
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/14/23 09:54, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
>
> In order to remove strtobool() and slightly simplify kstrtox.h, switch t=
o
> the other function name.
>
> While at it, include the corresponding header file (<linux/kstrtox.h>)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

applied.

Thanks!
Helge


> ---
> This patch was already sent as a part of a serie ([1]) that axed all usa=
ges
> of strtobool().
> Most of the patches have been merged in -next.
>
> I synch'ed with latest -next and re-send the remaining ones as individua=
l
> patches.
>
> Changes in v2:
>    - No change
>
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet=
@wanadoo.fr/
> ---
>   drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 7 ++++---
>   drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c | 7 ++++---
>   drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c | 3 ++-
>   drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c      | 3 ++-
>   4 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/driv=
ers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> index bc5a44c2a144..ae937854403b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> @@ -10,6 +10,7 @@
>   #define DSS_SUBSYS_NAME "DISPLAY"
>
>   #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/sysfs.h>
> @@ -36,7 +37,7 @@ static ssize_t display_enabled_store(struct omap_dss_d=
evice *dssdev,
>   	int r;
>   	bool enable;
>
> -	r =3D strtobool(buf, &enable);
> +	r =3D kstrtobool(buf, &enable);
>   	if (r)
>   		return r;
>
> @@ -73,7 +74,7 @@ static ssize_t display_tear_store(struct omap_dss_devi=
ce *dssdev,
>   	if (!dssdev->driver->enable_te || !dssdev->driver->get_te)
>   		return -ENOENT;
>
> -	r =3D strtobool(buf, &te);
> +	r =3D kstrtobool(buf, &te);
>   	if (r)
>   		return r;
>
> @@ -183,7 +184,7 @@ static ssize_t display_mirror_store(struct omap_dss_=
device *dssdev,
>   	if (!dssdev->driver->set_mirror || !dssdev->driver->get_mirror)
>   		return -ENOENT;
>
> -	r =3D strtobool(buf, &mirror);
> +	r =3D kstrtobool(buf, &mirror);
>   	if (r)
>   		return r;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c b/driv=
ers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
> index ba21c4a2633d..1b644be5fe2e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
> @@ -10,6 +10,7 @@
>   #define DSS_SUBSYS_NAME "MANAGER"
>
>   #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> @@ -246,7 +247,7 @@ static ssize_t manager_trans_key_enabled_store(struc=
t omap_overlay_manager *mgr,
>   	bool enable;
>   	int r;
>
> -	r =3D strtobool(buf, &enable);
> +	r =3D kstrtobool(buf, &enable);
>   	if (r)
>   		return r;
>
> @@ -290,7 +291,7 @@ static ssize_t manager_alpha_blending_enabled_store(
>   	if(!dss_has_feature(FEAT_ALPHA_FIXED_ZORDER))
>   		return -ENODEV;
>
> -	r =3D strtobool(buf, &enable);
> +	r =3D kstrtobool(buf, &enable);
>   	if (r)
>   		return r;
>
> @@ -329,7 +330,7 @@ static ssize_t manager_cpr_enable_store(struct omap_=
overlay_manager *mgr,
>   	if (!dss_has_feature(FEAT_CPR))
>   		return -ENODEV;
>
> -	r =3D strtobool(buf, &enable);
> +	r =3D kstrtobool(buf, &enable);
>   	if (r)
>   		return r;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c b/driv=
ers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
> index 601c0beb6de9..1da4fb1c77b4 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
> @@ -13,6 +13,7 @@
>   #include <linux/err.h>
>   #include <linux/sysfs.h>
>   #include <linux/kobject.h>
> +#include <linux/kstrtox.h>
>   #include <linux/platform_device.h>
>
>   #include <video/omapfb_dss.h>
> @@ -210,7 +211,7 @@ static ssize_t overlay_enabled_store(struct omap_ove=
rlay *ovl, const char *buf,
>   	int r;
>   	bool enable;
>
> -	r =3D strtobool(buf, &enable);
> +	r =3D kstrtobool(buf, &enable);
>   	if (r)
>   		return r;
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/v=
ideo/fbdev/omap2/omapfb/omapfb-sysfs.c
> index 06dc41aa0354..831b2c2fbdf9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
> @@ -15,6 +15,7 @@
>   #include <linux/uaccess.h>
>   #include <linux/platform_device.h>
>   #include <linux/kernel.h>
> +#include <linux/kstrtox.h>
>   #include <linux/mm.h>
>   #include <linux/omapfb.h>
>
> @@ -96,7 +97,7 @@ static ssize_t store_mirror(struct device *dev,
>   	int r;
>   	struct fb_var_screeninfo new_var;
>
> -	r =3D strtobool(buf, &mirror);
> +	r =3D kstrtobool(buf, &mirror);
>   	if (r)
>   		return r;
>

