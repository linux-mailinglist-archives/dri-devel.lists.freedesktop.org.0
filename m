Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE63768669
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 18:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174D10E0C2;
	Sun, 30 Jul 2023 16:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C3710E0C2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690734026; x=1691338826; i=deller@gmx.de;
 bh=B+LjuH1Nro6Mm9dxZmbdDJ4NHVKDVfaSlow79dtK/aE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=c9WmUwwDTJRiDAD+zM0YAIFG5RlZM8uRwDLl7Z6FQNKLUA3sHN3ukIyo+Qxi7YIqYJW4UW/
 BC71TX/VpV7al/amWu545KjTx/HrnqhgHRulIuCohZ3WAtVwNL9iBqmt2FcmoNM7OekRLFtJ6
 YkfjF8A5yx0cRAVFsUZdOwSrJpWp0ai+89kGiOpgacqI9ntmOBRqfANGwuRr2My9GyyKrfIkY
 JpSe1uaeoeR/BCwLbYBKAx9V1ICjXauabnUSPFBe9fFqfVbL4sWt8UTTQCM6WYn0OJ2AXP8C2
 BcUNyHsWsdDHRbGefS2qd1JJNpZIr40dXoE0REmV7JKV2hY1JRMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.241]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1qJdpZ46IK-00SgcI; Sun, 30
 Jul 2023 18:20:26 +0200
Message-ID: <e25eaae4-dcc9-7864-c655-f9e739db7970@gmx.de>
Date: Sun, 30 Jul 2023 18:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] fbdev: Use _DMAMEM_ infix for DMA-memory helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 javierm@redhat.com
References: <20230729193157.15446-1-tzimmermann@suse.de>
 <20230729193157.15446-4-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230729193157.15446-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4wNhQhY6WGH5c1kIMydigwdYLBqO8YDF06/xuv2My0xRcYEraod
 MF/bDQNdDIm4MEodkqbxmfpW/a3diU9LJcSlElkvXUVlRgMvQwPMgkyLjk3SV36KGTa5zpW
 6RAq1ACNwf9SXLjwc1nYGotQADN7prtS6CzbxCfgkySsNuLzhvtVTc3vSPdvAeOMHPBumpS
 wNTkWQ5f31W60jH1Ty2Ig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9weqy1iDTpI=;Hg5AgOSVd8JTHH9VClJIufTHE+P
 exgTpSl/Yi5eXbZYxV977nV4bXQ+Cty/sXPirt/ZTo01OMelCBuHuebNgzMJHkErsNw9GClT0
 cwXFAy4ZC7d9zW2xMW7JHWtZJ3omY3Nao4svG+jgPkc+kWW9hYlJMW8ijPBeyWIOU/gjrvQQF
 /SnHB2LNmGZRnTAmHJJBNzFB4518AU0gCRKdidGpobiSU4RdmAxuTTuXP410W+0kU0QwTVzFU
 b16NskxkQZ2iE9okPe+agJRsgcWt3zVkXdrxmVMNNvTIOJ2KBDNmaty3ZUilt9MaxVjybX31l
 y5UF/WHe9RoWUq3kwg4dTdIvnl+/u+l6c/WWvR8hMpQnr4S/9N4S+4B9IKHBpQOpC2MuLtepy
 E3dKZq/V/wBfsCjL7f+iAgcrDWV1Gbv5H68DYHlIGPOxZhrHC4rRXVGRVrTcm2xozRngAXKbM
 wlrhX3tU8KaD3fk2wpX1LHF+OEuZrGIjUz3tbuiKC+wFthZfHg1btfVJPs0LqldnxXyJGR63M
 3cYb7hTHOzJoFAC0cFNvJNprEuSLewhxOtU9B1CcMsyhPrcM+sBWSQBLIloyxdP9qVMEUsqcg
 MY51g/lNoJOQBfrl/qjQLf5Qkesie2Iv4arboVp54x8H6E66ziPIwZnooN8/7FgOwpU4fhJnm
 z2Y4RhzA8UcgoKCwnvS7H4ExAYYdGzxMOsgeZH/BN27f6d5pO+Mq6szWCLwDGBzjS9QryYczO
 TMqTOwUWbaTGKKe09RveZ++C3a11BjFiPxOO0E/n73zcLL5sb+k7tRJ6R9yacehpEXvcL6mZc
 YlulYmxziJ70S2bUf1KunWUqguizkQOw3XzmL+jpjR5aVcSDtyFA6qo9WaXMxpNgoAHjDPBIb
 A+fFjRdhDOQc8S9RQ8nBaE/9VMckzXNGK7q5pQSFn7f65fiMmzkyg3XRnazfUjwz6QNBJyxAi
 lXl0EQ==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/23 21:26, Thomas Zimmermann wrote:
> Change the infix for fbdev's DMA-memory helpers from _DMA_ to
> _DMAMEM_. The helpers perform operations within DMA-able memory,

Since "DMA" stands for "Direct Memory Access", people already
know that it operates on memory. I don't think we need
to add "MEM" here.
So, maybe we should drop this patch and just keep "DMA"?

Other than that you patch series looks good!
Acked-by: Helge Deller <deller@gmx.de>

Helge


> but they don't perform DMA operations. Naming should make this
> clear. Adapt all users. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig                   | 2 +-
>   drivers/gpu/drm/drm_fbdev_dma.c           | 4 ++--
>   drivers/gpu/drm/exynos/Kconfig            | 2 +-
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 4 ++--
>   drivers/gpu/drm/omapdrm/Kconfig           | 2 +-
>   drivers/gpu/drm/omapdrm/omap_fbdev.c      | 4 ++--
>   drivers/gpu/drm/tegra/Kconfig             | 2 +-
>   drivers/gpu/drm/tegra/fbdev.c             | 4 ++--
>   drivers/video/fbdev/core/Kconfig          | 2 +-
>   include/linux/fb.h                        | 4 ++--
>   10 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 34da733e8606..b51c6a141dfa 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -224,7 +224,7 @@ config DRM_TTM_HELPER
>   config DRM_GEM_DMA_HELPER
>   	tristate
>   	depends on DRM
> -	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>   	help
>   	  Choose this if you need the GEM DMA helper functions
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev=
_dma.c
> index 6db168f94290..6c9427bb4053 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -62,9 +62,9 @@ static const struct fb_ops drm_fbdev_dma_fb_ops =3D {
>   	.owner =3D THIS_MODULE,
>   	.fb_open =3D drm_fbdev_dma_fb_open,
>   	.fb_release =3D drm_fbdev_dma_fb_release,
> -	__FB_DEFAULT_DMA_OPS_RDWR,
> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	__FB_DEFAULT_DMA_OPS_DRAW,
> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>   	.fb_mmap =3D drm_fbdev_dma_fb_mmap,
>   	.fb_destroy =3D drm_fbdev_dma_fb_destroy,
>   };
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kco=
nfig
> index 661b42ad4873..733b109a5095 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -7,7 +7,7 @@ config DRM_EXYNOS
>   	select DRM_DISPLAY_HELPER if DRM_EXYNOS_DP
>   	select DRM_KMS_HELPER
>   	select VIDEOMODE_HELPERS
> -	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>   	select SND_SOC_HDMI_CODEC if SND_SOC
>   	help
>   	  Choose this option if you have a Samsung SoC Exynos chipset.
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm=
/exynos/exynos_drm_fbdev.c
> index 4ccb385aff52..a379c8ca435a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -49,9 +49,9 @@ static void exynos_drm_fb_destroy(struct fb_info *info=
)
>
>   static const struct fb_ops exynos_drm_fb_ops =3D {
>   	.owner		=3D THIS_MODULE,
> -	__FB_DEFAULT_DMA_OPS_RDWR,
> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	__FB_DEFAULT_DMA_OPS_DRAW,
> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>   	.fb_mmap        =3D exynos_drm_fb_mmap,
>   	.fb_destroy	=3D exynos_drm_fb_destroy,
>   };
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/K=
config
> index d3c4877e465c..b715301ec79f 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -4,7 +4,7 @@ config DRM_OMAP
>   	depends on DRM && OF
>   	depends on ARCH_OMAP2PLUS
>   	select DRM_KMS_HELPER
> -	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>   	select VIDEOMODE_HELPERS
>   	select HDMI
>   	default n
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omap=
drm/omap_fbdev.c
> index 5b33c789e17a..6b08b137af1a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -106,13 +106,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *=
info)
>
>   static const struct fb_ops omap_fb_ops =3D {
>   	.owner =3D THIS_MODULE,
> -	__FB_DEFAULT_DMA_OPS_RDWR,
> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>   	.fb_check_var	=3D drm_fb_helper_check_var,
>   	.fb_set_par	=3D drm_fb_helper_set_par,
>   	.fb_setcmap	=3D drm_fb_helper_setcmap,
>   	.fb_blank	=3D drm_fb_helper_blank,
>   	.fb_pan_display =3D omap_fbdev_pan_display,
> -	__FB_DEFAULT_DMA_OPS_DRAW,
> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>   	.fb_ioctl	=3D drm_fb_helper_ioctl,
>   	.fb_mmap	=3D omap_fbdev_fb_mmap,
>   	.fb_destroy	=3D omap_fbdev_fb_destroy,
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconf=
ig
> index 39452c8480c1..84e7e6bc3a0c 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -12,7 +12,7 @@ config DRM_TEGRA
>   	select DRM_KMS_HELPER
>   	select DRM_MIPI_DSI
>   	select DRM_PANEL
> -	select FB_DMA_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>   	select TEGRA_HOST1X
>   	select INTERCONNECT
>   	select IOMMU_IOVA
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev=
.c
> index 206a399c42d6..db6eaac3d30e 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -59,9 +59,9 @@ static void tegra_fbdev_fb_destroy(struct fb_info *inf=
o)
>
>   static const struct fb_ops tegra_fb_ops =3D {
>   	.owner =3D THIS_MODULE,
> -	__FB_DEFAULT_DMA_OPS_RDWR,
> +	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>   	DRM_FB_HELPER_DEFAULT_OPS,
> -	__FB_DEFAULT_DMA_OPS_DRAW,
> +	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>   	.fb_mmap =3D tegra_fb_mmap,
>   	.fb_destroy =3D tegra_fbdev_fb_destroy,
>   };
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core=
/Kconfig
> index 28e771a46df6..baf7e852c75b 100644
> --- a/drivers/video/fbdev/core/Kconfig
> +++ b/drivers/video/fbdev/core/Kconfig
> @@ -136,7 +136,7 @@ config FB_DEFERRED_IO
>   	bool
>   	depends on FB_CORE
>
> -config FB_DMA_HELPERS
> +config FB_DMAMEM_HELPERS
>   	bool
>   	depends on FB_CORE
>   	select FB_SYS_COPYAREA
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 76472482dc30..d255263c2d1d 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -579,11 +579,11 @@ extern ssize_t fb_sys_write(struct fb_info *info, =
const char __user *buf,
>    * Helpers for framebuffers in DMA-able memory
>    */
>
> -#define __FB_DEFAULT_DMA_OPS_RDWR \
> +#define __FB_DEFAULT_DMAMEM_OPS_RDWR \
>   	.fb_read	=3D fb_sys_read, \
>   	.fb_write	=3D fb_sys_write
>
> -#define __FB_DEFAULT_DMA_OPS_DRAW \
> +#define __FB_DEFAULT_DMAMEM_OPS_DRAW \
>   	.fb_fillrect	=3D sys_fillrect, \
>   	.fb_copyarea	=3D sys_copyarea, \
>   	.fb_imageblit	=3D sys_imageblit

