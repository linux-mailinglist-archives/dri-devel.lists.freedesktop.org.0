Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FB099E0CF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEE610E549;
	Tue, 15 Oct 2024 08:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="poRcqX5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919D810E549
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728980384; x=1729585184; i=deller@gmx.de;
 bh=jT1kRztLJ7q8FdwZmGoBYoDNMrfKh2s9JjZLlqMIIMo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=poRcqX5OlxWIpi6m7JJrMqRagKSRlSV2IeDUr59CLxSO0xKxPPuUqyzWzeQPLp0D
 SaqXRoxfNBabKNXQNkAkiKVRw9XioDElIUxBdJgNb2Z3T+ctqXuQAml+5EHzt16Lo
 6MXHkxiAdrZ+V2wQAB14WDl7xVcTIfXj45Qqb7OyTlkTxUd3vQZSxUdogLVYQFKYg
 qX2RLs91SySg7zq/rBSQZXwq6Vfp+2XVUofDwjSOwmZ18flaMFZ2i6YWezzS8ab8R
 R0/1CakO01IGrnRPO53FFfr339aC6uKGwLhB2IumtXhJrvYf+V0fotGq3lsU8Q06/
 38lSzG5mE9ITfUMipg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1tr4yY27qU-00wiJR; Tue, 15
 Oct 2024 10:19:44 +0200
Message-ID: <ee5363e7-a482-4a81-af05-defabcb2a9eb@gmx.de>
Date: Tue, 15 Oct 2024 10:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbdev: sstfb: Make CONFIG_FB_DEVICE optional and
 update Kconfig dependency
To: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, thomas.zimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org
References: <20241015080439.5931-1-gonzalo.silvalde@gmail.com>
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
In-Reply-To: <20241015080439.5931-1-gonzalo.silvalde@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ieqb5zxAZ+X7y6dFoLlVbH1VbNzwP5V0QyHtjXl1YFu5dLFoLwE
 jmKPtCGDnhiQTFeTCVT+Gc8as8nKgpRU2PVE0yNYNmgUlkJa1itwxqtEWrIxQj3+MPTYLSC
 /9TuaPCoYjx0x//ujo+DVz1jsjU0z7/obnd2qw2bCZs71FPJjhHVx8FxfQ8AgFN7T6zqBJd
 Rse2mJZWnXk78QwxOmT5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X45HQw0Mjd8=;paqRQQH33fiVgnvi8Anc87CpJVj
 sRn/tpHgcIa44TrqhGWFAfIbwDYv+demV3C1dDTd0uH9FJVr5P3ruo/TH6QJetQxGxKTSLAqO
 lkP+CJCGWCBgANf7YZcLEMBCwhs51MChgoP5xkUQkpzQRdHpbI5Quy0AL+SYR+W5csXwtD4FF
 hC+ZBuL7zfVNZFegEckPTIl6kVC4IaLpJIXHGbx5+Dd3+ZxMn3d7lpkk5YJ+YWhRfHLiRvjwc
 4RxNcKKwJ71TjzxRqsdgEof8qP/JFTWHoiyQ4WfzlrV7W9w4AmISrZpBMO9kksdK+gXNJ7R6E
 TzpwyH6ha00EKSjO+snRgcqoDc+EGrFfzblQhC82Xsd/w4/MI3dWUhmk9U21qE2uf5Yj+y3Ik
 o4yvXeuOUfgb6aST+PIS3jSDpVfudCWI+UXCJ/kZ+jSY09q248EauhOwSC2LWWegFi2vnqf35
 /EMFeRWNpSNOXiIj8I/foFcAuEGqXXA7M5PNDYSZXIASwUQ0ibGcp8659f0DTBi44V4CuVz5s
 ucgJucpvydRT+RaqylwroVyTNPPZ2JYjZDDoQVv5BqvB4qx0k8ambC/YoijJYeltbDYqhPJcX
 NHjfSjqQErOj9Z/dScfWMbGg9wkHox+I3JNVfOXiXNnmmktxFu4EB7oTQfaPcbhmIguTIYzCx
 nSh9dzcf5KQ5K4m1i/oH7hqwP4ppoGT1zji7YoEnV6qi2u8Pzrc5rh+xg+oZhHO+aWE2MMzQF
 a2+UvFYLJ8hMmhVC7Q9rFdukfKZZ3ONRj2PuHrvQr/HDOCj2dMrp4426ekYOkWL3MHQVcMc/p
 7hdtC9LEDdAtTwcbd4PyGosA==
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

Hi Ganzalo,

Thanks for your updated patch.
Somehow empty lines sneaked in again, see the last line of your patch.
Anyway, I manually fixed up your initial patch with the fixes from
Thomas, so we should be fine now. No need to send a v4...

Thanks!
Helge

On 10/15/24 10:04, Gonzalo Silvalde Blanco wrote:
> The sstfb driver currently depends on CONFIG_FB_DEVICE to create sysfs
> entries and access info->dev. This patch wraps the relevant code blocks
> with #ifdef CONFIG_FB_DEVICE, allowing the driver to be built and used
> even if CONFIG_FB_DEVICE is not selected.
>
> Additionally, the dependency on CONFIG_FB_DEVICE in the Kconfig file
> has been removed for the FB_VOODOO1 driver, allowing it to be selected
> independently of the FB_DEVICE option. This is because the sysfs setting
> only controls the VGA pass-through state and is not required for the
> display to function properly.
>
> For more information on VGA pass-through, see:
> http://vogonswiki.com/index.php/VGA_passthrough_cable
>
> Tested by building with and without CONFIG_FB_DEVICE enabled, and both
> configurations compiled successfully without issues.
>
> Signed-off-by: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>
> ---
>   drivers/video/fbdev/Kconfig |  1 -
>   drivers/video/fbdev/sstfb.c | 13 ++++++++-----
>   2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index ea36c6956bf3..44a8fdbab6df 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -1236,7 +1236,6 @@ config FB_3DFX_I2C
>   config FB_VOODOO1
>   	tristate "3Dfx Voodoo Graphics (sst1) support"
>   	depends on FB && PCI
> -	depends on FB_DEVICE
>   	select FB_IOMEM_HELPERS
>   	help
>   	  Say Y here if you have a 3Dfx Voodoo Graphics (Voodoo1/sst1) or
> diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
> index f8ae54ca0cc3..1d6ef97f1a84 100644
> --- a/drivers/video/fbdev/sstfb.c
> +++ b/drivers/video/fbdev/sstfb.c
> @@ -716,6 +716,7 @@ static void sstfb_setvgapass( struct fb_info *info, =
int enable )
>   	pci_write_config_dword(sst_dev, PCI_INIT_ENABLE, tmp);
>   }
>
> +#ifdef CONFIG_FB_DEVICE
>   static ssize_t store_vgapass(struct device *device, struct device_attr=
ibute *attr,
>   			const char *buf, size_t count)
>   {
> @@ -736,10 +737,10 @@ static ssize_t show_vgapass(struct device *device,=
 struct device_attribute *attr
>   	struct sstfb_par *par =3D info->par;
>   	return sprintf(buf, "%d\n", par->vgapass);
>   }
> -
>   static struct device_attribute device_attrs[] =3D {
>   	__ATTR(vgapass, S_IRUGO|S_IWUSR, show_vgapass, store_vgapass)
> -	};
> +};
> +#endif
>
>   static int sstfb_ioctl(struct fb_info *info, unsigned int cmd,
>   			unsigned long arg)
> @@ -1435,10 +1436,10 @@ static int sstfb_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
>   	}
>
>   	sstfb_clear_screen(info);
> -
> +#ifdef CONFIG_FB_DEVICE
>   	if (device_create_file(info->dev, &device_attrs[0]))
>   		printk(KERN_WARNING "sstfb: can't create sysfs entry.\n");
> -
> +#endif
>
>   	fb_info(info, "%s frame buffer device at 0x%p\n",
>   		fix->id, info->screen_base);
> @@ -1467,8 +1468,9 @@ static void sstfb_remove(struct pci_dev *pdev)
>
>   	info =3D pci_get_drvdata(pdev);
>   	par =3D info->par;
> -
> +#ifdef CONFIG_FB_DEVICE
>   	device_remove_file(info->dev, &device_attrs[0]);
> +#endif
>   	sst_shutdown(info);
>   	iounmap(info->screen_base);
>   	iounmap(par->mmio_vbase);
> @@ -1536,3 +1538,4 @@ MODULE_PARM_DESC(slowpci, "Uses slow PCI settings =
(0 or 1) (default=3D0)");
>   module_param(mode_option, charp, 0);
>   MODULE_PARM_DESC(mode_option, "Initial video mode (default=3D" DEFAULT=
_VIDEO_MODE ")");
>
> +

