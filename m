Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957055E9457
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 18:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685FB10E1E6;
	Sun, 25 Sep 2022 16:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254E510E1E6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664122895;
 bh=fI8v2MjLTWColJNckOi/CL8S2YaxkCPvzxue3zGfDQQ=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=d9L5BQzgHmgrTVpJly5w97+p1QcINxXisS07Hu4KdkpasB9ud7fGQHSw1rkzZytW1
 UryFuYVvHSVXAgCKHM1/Oj1ZGkMiou2iSsj5XGe7YZw0YKs1Xnq5/XdsVtvTRIOFbS
 GgRQjalXWvWLx/euY3O5aQ9gLp39RnLF1MnKqxqk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1ohYsv34pW-00VQ5i; Sun, 25
 Sep 2022 18:21:35 +0200
Message-ID: <eabf4405-7492-19c4-0827-a240e9c75dca@gmx.de>
Date: Sun, 25 Sep 2022 18:21:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next] video: fbdev: tridentfb: Fix missing
 pci_disable_device() in probe and remove
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, zheyuma97@gmail.com,
 javierm@redhat.com, wsa+renesas@sang-engineering.com, tzimmermann@suse.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220922013709.3324521-1-ruanjinjie@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220922013709.3324521-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4C350QFUsyfxOBN9unp7HZnhW3cx3yY62B3+HaSeKy7Y83u0ETf
 wcxeMn461m2islOO4yVPWtwWOInz6mdQiukZsXTbijl/YJpgYVmT99qsd0XnNqHsB3gDYOo
 srmLQqX0Bz6d8wZc7h9BYlW9S+54WEcG3NoycQjXWJLJSvugJ+idhSSjyO+hOafZTxGmcjP
 mDuBZub5EeYy+u1Ff/SyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M/VDfI/GNCk=:J0E7YpgIxEz6PydXA9ZOtf
 o7D1/KS6Ufb8QuX8glgXQLFF/MW5SYVZS+KX8LU9Cl51VaEZZX18NxwWAl8mD8ySq1k+jKIIz
 7dY31DMXqd/3QIXbdw5o8xSYKHUEoFNmbaIHlYmUuYa6dCqP6iKgzszqP6optomG1BuXq8gJf
 HidXw2EPYFBlLJ3ZMi8x9WbWH5xFpDgsFrhXMCTZ6LuHkkub8uG6xVKkDRkshBR4eGgthZd44
 gs9bAi7tNzJIfJSYkeIkARv1xgLCFetabgkkuCp3Peh2hvGmwjAzjkCdm38sMlWwI1WmtVr7B
 24U9+jPudng0HpAkTN3zwT0rm2M39qZKija3NvZnChmywCHMxaylfnUiPKts5ZN6UvLtu7Adz
 QhOrU/qr+0A8a5L1oSsOpP5bDyvSbhAfST3tEiikD2H/nJieRhIEHxjrkEn9bqupU06zChc+M
 g3LyJviZpK4o8+aJpzf0cKQaUWWyjuUcYevFBVS5LkS691wtElojW4fpOzHhjJt5wEb7ON/0U
 01qv8LPHctzHEzsyKhD5BcsFrMscgOHa0600Mg/PSf1koiAHHeqOAOsdEJFeJFoG2DPxiV4qh
 kY19RvUDo/AmA0AJqqQlffZ2dF5iq4DwmxGMjjQ9u9jeQBv8CQbTCTcoHZV+rweXZ7buFe2jJ
 FvuXpuZnvagT5Yq3NYe2SI9s2LIvlLmDYGVSdWBozXycEPtFgZu0oFAJ6v0ax7LSHtntB9RR1
 UIPhN521RDe0PLwmRaatav/fCchA33IZf5gHIS0TaUT1hq6U19OIj/ZcA2wJJxYsAai8s0TR3
 A6y3W6xg0fgK52xnyj2EIzDFUXdhMN/IWM8HWb9lvMtSTmGTXTHZKwb9+D9C68QSc4NAs1PmM
 Zg20g7m/A34XTvcmg+S2BbfQGPhTn+16n3kgtY/F9Es7SSAKcHwcCUb2AcwaswEVvE24pnR+W
 NLuBGck6vhIV0IpXhKvCgmQdBQo6PERh1uzPHvERQEBLavTgs1wzXZY7LiozD4LxC9wOCoren
 0gPcF+iFhRtQ8U0WRPuq2cu0Eo3qCEG2ID7WK7LO70NLZ4pdvXYObzGgOmWJX+mmKWQ04NtiB
 SZj0BkDZjtMOl75MPNd5Nj6U7jRC4Py4VfH6zQAXg7vm+i7CB7utqGmQAe2BkFtX7l2H3Kq/7
 Zj0skJ6XqiTFKM8h/0794dqrud
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

On 9/22/22 03:37, ruanjinjie wrote:
> Replace pci_enable_device() with pcim_enable_device(),
> pci_disable_device() and pci_release_regions() will be
> called in release automatically.
>
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>

applied.

Thanks!
Helge

> ---
>   drivers/video/fbdev/tridentfb.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tride=
ntfb.c
> index f9c3b1d38fc2..7933e01aacc5 100644
> --- a/drivers/video/fbdev/tridentfb.c
> +++ b/drivers/video/fbdev/tridentfb.c
> @@ -1475,7 +1475,7 @@ static int trident_pci_probe(struct pci_dev *dev,
>   	if (err)
>   		return err;
>
> -	err =3D pci_enable_device(dev);
> +	err =3D pcim_enable_device(dev);
>   	if (err)
>   		return err;
>
> @@ -1715,12 +1715,10 @@ static int trident_pci_probe(struct pci_dev *dev=
,
>   	kfree(info->pixmap.addr);
>   	if (info->screen_base)
>   		iounmap(info->screen_base);
> -	release_mem_region(tridentfb_fix.smem_start, tridentfb_fix.smem_len);
>   	disable_mmio(info->par);
>   out_unmap1:
>   	if (default_par->io_virt)
>   		iounmap(default_par->io_virt);
> -	release_mem_region(tridentfb_fix.mmio_start, tridentfb_fix.mmio_len);
>   	framebuffer_release(info);
>   	return err;
>   }
> @@ -1735,8 +1733,6 @@ static void trident_pci_remove(struct pci_dev *dev=
)
>   		i2c_del_adapter(&par->ddc_adapter);
>   	iounmap(par->io_virt);
>   	iounmap(info->screen_base);
> -	release_mem_region(tridentfb_fix.smem_start, tridentfb_fix.smem_len);
> -	release_mem_region(tridentfb_fix.mmio_start, tridentfb_fix.mmio_len);
>   	kfree(info->pixmap.addr);
>   	fb_dealloc_cmap(&info->cmap);
>   	framebuffer_release(info);

