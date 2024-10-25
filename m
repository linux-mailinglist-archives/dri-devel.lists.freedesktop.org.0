Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727529B0875
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 17:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2210E3E4;
	Fri, 25 Oct 2024 15:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="WYOZ5etL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C8C10E3E4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729870632; x=1730475432; i=deller@gmx.de;
 bh=tfz21zBTSYK2SGA19H24Fq97Jc0IzqDxiqTEvPxDmTU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=WYOZ5etLFotvxvYqrPvQVdoZ2l/M9YZ2eN0tRxmkZv1Q6GkyVfhR29Nr+RgxYltV
 3J/7RftIHE8g9ti+mycv2twOiFWXrAaNl+OS2hPYJcP6HWUnLfaawZElHGyQ03vl+
 S2WbbXbvdPaU/5m04kmsWCGY0wys8dafSVEUk8b0KcRU3rRVxap7zZ75u/nKrB6Mp
 MfVWOFn0lXwuEbNA88vIyUkEu5uNJvo5BM4xQmaDG0cY/hvIEGVDwnz6+ql2QP/7v
 HCy2OGB2CbG/01wwQgP6yD/9qBWSGBkeBBLW9Vm3hCX0dS6VYyKzGIZRGRXu7OeSE
 6XJcrBBQE7hrt9poSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmKX-1tJXk12wcz-00TG3L; Fri, 25
 Oct 2024 17:37:12 +0200
Message-ID: <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
Date: Fri, 25 Oct 2024 17:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+A5B99gPV27mSVaXlvyLd4grgRGz23q5DwhdJsFxMTXQQk7dmc8
 nzIZuUNB00t+XKkWYgJOaSuBMEGxQdUTgQAfheZt5hGHv+IZNVPzde1CKag424BGmpiICac
 Qqix3HDGDGCVvLrk1xpmArYCCey9Rhupe+JXHwzBAaZQfXUlrpYmqz0sXQo5ct8YPUMagwi
 isn7wqXPyDo4ISIpGPXng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vyyPoIybhtA=;KOzMrmLxLUIc5JECVgqkMN+gnMm
 BjMC15FssmEls0AdI0GT3lRNJbAU3gIVUPjfs3fq1FFRk44fUCx6UyIw45SYQ2hBYRsNVrUaa
 3gYZ2n1r4coP80U8q5PUGNC25jtbE5h8plroB4BlMEjW+hBsQDl2gAfoO827blXrtoncaxY8r
 frP90JErnZ2Kia7gbdKofQLQUjWZf85RcRwy8okEn+1ceO0pI4Q/Gl+4ueuOkDgGNzOqqfSh4
 irVGPcg0BS4sLoQ3tCL5hs4BdMGU8BqQ9I/ja4HpUvQLK+19hJGsxEgEKqYYZY9l/S3XBpfDN
 rTqeIAlEyMutIlqBBorpHSpWqssLbbehjJDbKyoAbKcf1YfrgNh5ioH6iJO2qEri4DLX+7u+c
 WyCYAmEBjhQjU/27J51JsKOw268f+ciqpite5OVJb/gAJCpeu+KCfEe6hfHgCU/btnQtovuVn
 SRtVT6ZXZ5Drvoze+/TH0g9VhhTxKja/Ht0f14MUJDTKxY2Y6o20PWtGM21v5NZ6GcKZN8XWN
 B7hqheOczZrSnymInyhzD8CLE03qSDvgIQRPDbcZKH6fahVqJgCnY0tqb9DsqS42UDqXqQ+Qr
 Jy6DGfpyj6Xa+GWrMEMvbSmfolAJwMjwZg81I+foy8oZK9H1PrVt98omJLE4lfE2FlAW6efBq
 pVrHEoa1b6yF9EN+fI7hE+9SzDC6Gqpaj7P9L1LmdpPhC7TPOtxOcw0kEHX7UewrzGyLZLk1S
 Jf3dIZZPBcMHrDfevsT7ZwH0uGtKHikGY1UaKXJFIPFL/Z7a62umpwyEoI4L4w9ctuust0BlE
 CORx9HVCuIRfFkGaWpwliOfw==
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

On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
> The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sysfs
> entries and access framebuffer device information. This patch wraps the
> relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the driver t=
o
> be built and used even if CONFIG_FB_DEVICE is not selected.
>
> The sysfs setting only controls access to certain framebuffer attributes
> and is not required for the basic display functionality to work correctl=
y.
> (For information on DisplayLink devices and their Linux support, see:
> https://wiki.archlinux.org/title/DisplayLink).
>
> Tested by building with and without CONFIG_FB_DEVICE, both of which
> compiled and ran without issues.

Gonzalo, I don't like this patch very much.

It adds lots of #ifdefs around functions like dev_dbg().
Instead of ifdefs, aren't there other possibilities, e.g.
using fb_dbg() if appropriate?
Or using any other generic dbg() info or simply dropping the line?

But more important:
This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
you want fbdev output at bootup, but otherwise just want to use DRM.
But then, doesn't there exist a native DRM driver for this graphics
card which can be used instead?
If so, I suggest to not change this fbdev driver at all.

Helge

> Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>> ---
>   drivers/video/fbdev/Kconfig |  1 -
>   drivers/video/fbdev/udlfb.c | 41 ++++++++++++++++++++++---------------
>   2 files changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index ea36c6956bf3..9bf6cf74b9cb 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1588,7 +1588,6 @@ config FB_SMSCUFX
>   config FB_UDL
>   	tristate "Displaylink USB Framebuffer support"
>   	depends on FB && USB
> -	depends on FB_DEVICE
>   	select FB_MODE_HELPERS
>   	select FB_SYSMEM_HELPERS_DEFERRED
>   	help
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index 71ac9e36f67c..de4800f09dc7 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -341,10 +341,10 @@ static int dlfb_ops_mmap(struct fb_info *info, str=
uct vm_area_struct *vma)
>   		return -EINVAL;
>
>   	pos =3D (unsigned long)info->fix.smem_start + offset;
> -
> +#ifdef CONFIG_FB_DEVICE
>   	dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
>   		pos, size);
> -
> +#endif
>   	while (size > 0) {
>   		page =3D vmalloc_to_pfn((void *)pos);
>   		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
> @@ -929,10 +929,10 @@ static int dlfb_ops_open(struct fb_info *info, int=
 user)
>   		info->fbdefio =3D fbdefio;
>   		fb_deferred_io_init(info);
>   	}
> -
> +#ifdef CONFIG_FB_DEVICE
>   	dev_dbg(info->dev, "open, user=3D%d fb_info=3D%p count=3D%d\n",
>   		user, info, dlfb->fb_count);
> -
> +#endif
>   	return 0;
>   }
>
> @@ -982,9 +982,9 @@ static int dlfb_ops_release(struct fb_info *info, in=
t user)
>   		kfree(info->fbdefio);
>   		info->fbdefio =3D NULL;
>   	}
> -
> +#ifdef CONFIG_FB_DEVICE
>   	dev_dbg(info->dev, "release, user=3D%d count=3D%d\n", user, dlfb->fb_=
count);
> -
> +#endif
>   	return 0;
>   }
>
> @@ -1095,10 +1095,10 @@ static int dlfb_ops_blank(int blank_mode, struct=
 fb_info *info)
>   	struct dlfb_data *dlfb =3D info->par;
>   	char *bufptr;
>   	struct urb *urb;
> -
> +#ifdef CONFIG_FB_DEVICE
>   	dev_dbg(info->dev, "blank, mode %d --> %d\n",
>   		dlfb->blank_mode, blank_mode);
> -
> +#endif
>   	if ((dlfb->blank_mode =3D=3D FB_BLANK_POWERDOWN) &&
>   	    (blank_mode !=3D FB_BLANK_POWERDOWN)) {
>
> @@ -1190,7 +1190,9 @@ static int dlfb_realloc_framebuffer(struct dlfb_da=
ta *dlfb, struct fb_info *info
>   		 */
>   		new_fb =3D vmalloc(new_len);
>   		if (!new_fb) {
> +#ifdef CONFIG_FB_DEVICE
>   			dev_err(info->dev, "Virtual framebuffer alloc failed\n");
> +#endif
>   			return -ENOMEM;
>   		}
>   		memset(new_fb, 0xff, new_len);
> @@ -1213,9 +1215,11 @@ static int dlfb_realloc_framebuffer(struct dlfb_d=
ata *dlfb, struct fb_info *info
>   		 */
>   		if (shadow)
>   			new_back =3D vzalloc(new_len);
> +#ifdef CONFIG_FB_DEVICE
>   		if (!new_back)
>   			dev_info(info->dev,
>   				 "No shadow/backing buffer allocated\n");
> +#endif
>   		else {
>   			dlfb_deferred_vfree(dlfb, dlfb->backing_buffer);
>   			dlfb->backing_buffer =3D new_back;
> @@ -1247,14 +1251,14 @@ static int dlfb_setup_modes(struct dlfb_data *dl=
fb,
>   	struct device *dev =3D info->device;
>   	struct fb_videomode *mode;
>   	const struct fb_videomode *default_vmode =3D NULL;
> -
> +#ifdef CONFIG_FB_DEVICE
>   	if (info->dev) {
>   		/* only use mutex if info has been registered */
>   		mutex_lock(&info->lock);
>   		/* parent device is used otherwise */
>   		dev =3D info->dev;
>   	}
> -
> +#endif
>   	edid =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
>   	if (!edid) {
>   		result =3D -ENOMEM;
> @@ -1375,10 +1379,10 @@ static int dlfb_setup_modes(struct dlfb_data *dl=
fb,
>   error:
>   	if (edid && (dlfb->edid !=3D edid))
>   		kfree(edid);
> -
> +#ifdef CONFIG_FB_DEVICE
>   	if (info->dev)
>   		mutex_unlock(&info->lock);
> -
> +#endif
>   	return result;
>   }
>
> @@ -1597,8 +1601,10 @@ static int dlfb_parse_vendor_descriptor(struct dl=
fb_data *dlfb,
>   static int dlfb_usb_probe(struct usb_interface *intf,
>   			  const struct usb_device_id *id)
>   {
> +#ifdef CONFIG_FB_DEVICE
>   	int i;
>   	const struct device_attribute *attr;
> +#endif
>   	struct dlfb_data *dlfb;
>   	struct fb_info *info;
>   	int retval;
> @@ -1701,7 +1707,7 @@ static int dlfb_usb_probe(struct usb_interface *in=
tf,
>   			retval);
>   		goto error;
>   	}
> -
> +#ifdef CONFIG_FB_DEVICE
>   	for (i =3D 0; i < ARRAY_SIZE(fb_device_attrs); i++) {
>   		attr =3D &fb_device_attrs[i];
>   		retval =3D device_create_file(info->dev, attr);
> @@ -1710,17 +1716,16 @@ static int dlfb_usb_probe(struct usb_interface *=
intf,
>   				 "failed to create '%s' attribute: %d\n",
>   				 attr->attr.name, retval);
>   	}
> -
>   	retval =3D device_create_bin_file(info->dev, &edid_attr);
>   	if (retval)
>   		dev_warn(info->device, "failed to create '%s' attribute: %d\n",
>   			 edid_attr.attr.name, retval);
> -
>   	dev_info(info->device,
>   		 "%s is DisplayLink USB device (%dx%d, %dK framebuffer memory)\n",
>   		 dev_name(info->dev), info->var.xres, info->var.yres,
>   		 ((dlfb->backing_buffer) ?
>   		 info->fix.smem_len * 2 : info->fix.smem_len) >> 10);
> +#endif
>   	return 0;
>
>   error:
> @@ -1737,8 +1742,9 @@ static void dlfb_usb_disconnect(struct usb_interfa=
ce *intf)
>   {
>   	struct dlfb_data *dlfb;
>   	struct fb_info *info;
> +#ifdef CONFIG_FB_DEVICE
>   	int i;
> -
> +#endif
>   	dlfb =3D usb_get_intfdata(intf);
>   	info =3D dlfb->info;
>
> @@ -1754,10 +1760,11 @@ static void dlfb_usb_disconnect(struct usb_inter=
face *intf)
>   	dlfb_free_urb_list(dlfb);
>
>   	/* remove udlfb's sysfs interfaces */
> +#ifdef CONFIG_FB_DEVICE
>   	for (i =3D 0; i < ARRAY_SIZE(fb_device_attrs); i++)
>   		device_remove_file(info->dev, &fb_device_attrs[i]);
>   	device_remove_bin_file(info->dev, &edid_attr);
> -
> +#endif
>   	unregister_framebuffer(info);
>   }
>

